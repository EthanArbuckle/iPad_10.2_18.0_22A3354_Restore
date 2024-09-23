@implementation GEOMapsSearchHomeResult

- (GEOMapsSearchHomeResult)initWithMapsSearchHomeResult:(id)a3 mapsResults:(id)a4
{
  id *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  GEOMapsSearchHomeSection *v16;
  GEOMapsSearchHomeResult *v17;
  uint64_t v18;
  NSArray *sections;
  GEOMapsSearchHomeResult *v20;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  if (v6)
    v9 = objc_msgSend(v6[2], "count");
  else
    v9 = 0;
  objc_msgSend(v8, "arrayWithCapacity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[GEOPDMapsSearchHomeResult mapsSearchHomeSections](v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = -[GEOMapsSearchHomeSection initWithMapsSearchHomeSection:mapsResults:]([GEOMapsSearchHomeSection alloc], "initWithMapsSearchHomeSection:mapsResults:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15), v7);
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v10, "count"))
  {
    v22.receiver = self;
    v22.super_class = (Class)GEOMapsSearchHomeResult;
    v17 = -[GEOMapsSearchHomeResult init](&v22, sel_init);
    if (v17)
    {
      v18 = objc_msgSend(v10, "copy");
      sections = v17->_sections;
      v17->_sections = (NSArray *)v18;

    }
    self = v17;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
