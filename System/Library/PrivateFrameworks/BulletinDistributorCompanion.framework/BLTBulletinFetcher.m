@implementation BLTBulletinFetcher

- (void)_setFetcher:(id)a3
{
  void *v4;
  id fetcher;

  v4 = (void *)objc_msgSend(a3, "copy");
  fetcher = self->_fetcher;
  self->_fetcher = v4;

}

- (void)_setClientCompletion:(id)a3
{
  void *v4;
  id clientCompletion;

  v4 = (void *)objc_msgSend(a3, "copy");
  clientCompletion = self->_clientCompletion;
  self->_clientCompletion = v4;

}

- (void)_setBulletinIDs:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *sectionIDs;

  objc_storeStrong((id *)&self->_bulletinIDs, a3);
  v5 = a3;
  -[NSDictionary allKeys](self->_bulletinIDs, "allKeys");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sectionIDs = self->_sectionIDs;
  self->_sectionIDs = v6;

  self->_sectionIDsIndex = -1;
  -[BLTBulletinFetcher _incrementSection](self, "_incrementSection");
}

- (BOOL)_incrementSection
{
  NSArray *sectionIDs;
  NSArray **p_sectionIDs;
  unint64_t v5;
  unint64_t v6;
  NSDictionary *bulletinIDs;
  void *v8;
  NSArray *v9;
  NSArray *publisherMatchIDsForSection;

  p_sectionIDs = &self->_sectionIDs;
  sectionIDs = self->_sectionIDs;
  v5 = (unint64_t)&p_sectionIDs[1]->super.isa + 1;
  self->_sectionIDsIndex = v5;
  v6 = -[NSArray count](sectionIDs, "count");
  if (v5 < v6)
  {
    bulletinIDs = self->_bulletinIDs;
    -[NSArray objectAtIndexedSubscript:](self->_sectionIDs, "objectAtIndexedSubscript:", self->_sectionIDsIndex);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](bulletinIDs, "objectForKeyedSubscript:", v8);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    publisherMatchIDsForSection = self->_publisherMatchIDsForSection;
    self->_publisherMatchIDsForSection = v9;

    self->_publisherMatchIDsForSectionIndex = 0;
  }
  return v5 < v6;
}

- (void)_fetchBulletins
{
  unint64_t publisherMatchIDsForSectionIndex;
  void (**v4)(_QWORD);
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void (**fetcher)(id, void *, void *, _QWORD *);
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD v14[5];
  _QWORD v15[5];

  publisherMatchIDsForSectionIndex = self->_publisherMatchIDsForSectionIndex;
  if (publisherMatchIDsForSectionIndex >= -[NSArray count](self->_publisherMatchIDsForSection, "count"))
  {
    v7 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __37__BLTBulletinFetcher__fetchBulletins__block_invoke_2;
    v14[3] = &unk_24D761AD0;
    v14[4] = self;
    v4 = (void (**)(_QWORD))MEMORY[0x219A0C15C](v14);
    v8 = self->_publisherMatchIDsForSectionIndex;
    if (v8 >= -[NSArray count](self->_publisherMatchIDsForSection, "count"))
    {
      v4[2](v4);
    }
    else
    {
      -[NSArray subarrayWithRange:](self->_publisherMatchIDsForSection, "subarrayWithRange:", self->_publisherMatchIDsForSectionIndex, -[NSArray count](self->_publisherMatchIDsForSection, "count") - self->_publisherMatchIDsForSectionIndex);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      fetcher = (void (**)(id, void *, void *, _QWORD *))self->_fetcher;
      -[NSArray objectAtIndexedSubscript:](self->_sectionIDs, "objectAtIndexedSubscript:", self->_sectionIDsIndex);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __37__BLTBulletinFetcher__fetchBulletins__block_invoke_3;
      v12[3] = &unk_24D761B98;
      v13 = v4;
      fetcher[2](fetcher, v9, v11, v12);

    }
  }
  else
  {
    -[NSArray subarrayWithRange:](self->_publisherMatchIDsForSection, "subarrayWithRange:", self->_publisherMatchIDsForSectionIndex, 1);
    v4 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    ++self->_publisherMatchIDsForSectionIndex;
    v5 = self->_fetcher;
    -[NSArray objectAtIndexedSubscript:](self->_sectionIDs, "objectAtIndexedSubscript:", self->_sectionIDsIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __37__BLTBulletinFetcher__fetchBulletins__block_invoke;
    v15[3] = &unk_24D761AD0;
    v15[4] = self;
    (*((void (**)(id, void (**)(_QWORD), void *, _QWORD *))v5 + 2))(v5, v4, v6, v15);

  }
}

uint64_t __37__BLTBulletinFetcher__fetchBulletins__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchBulletins");
}

uint64_t __37__BLTBulletinFetcher__fetchBulletins__block_invoke_2(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_incrementSection");
  v3 = *(_QWORD **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_fetchBulletins");
  result = v3[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __37__BLTBulletinFetcher__fetchBulletins__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)batchBulletinFetchForBulletinIDs:(id)a3 fetcher:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  BLTBulletinFetcher *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(BLTBulletinFetcher);
  -[BLTBulletinFetcher _setFetcher:](v10, "_setFetcher:", v8);

  -[BLTBulletinFetcher _setClientCompletion:](v10, "_setClientCompletion:", v7);
  -[BLTBulletinFetcher _setBulletinIDs:](v10, "_setBulletinIDs:", v9);

  -[BLTBulletinFetcher _fetchBulletins](v10, "_fetchBulletins");
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetcher, 0);
  objc_storeStrong(&self->_clientCompletion, 0);
  objc_storeStrong((id *)&self->_publisherMatchIDsForSection, 0);
  objc_storeStrong((id *)&self->_sectionIDs, 0);
  objc_storeStrong((id *)&self->_bulletinIDs, 0);
}

@end
