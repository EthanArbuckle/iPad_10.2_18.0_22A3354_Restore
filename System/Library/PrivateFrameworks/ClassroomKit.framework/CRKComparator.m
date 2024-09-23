@implementation CRKComparator

+ (id)compareWithCriteria:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "compareWithCriteria:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)compare
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __24__CRKComparator_compare__block_invoke;
  v3[3] = &__block_descriptor_40_e29___CRKComparator_16__0___q___8l;
  v3[4] = a1;
  return (id)MEMORY[0x219A226E8](v3, a2);
}

uint64_t __24__CRKComparator_compare__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "compareWithCriteria:", a2);
}

{
  return objc_msgSend(*(id *)(a1 + 32), "compareWithCriteria:", a2);
}

- (int64_t)runComparison
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CRKComparator allCriteria](self, "allCriteria", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = (*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6) + 16))();
        if (v7)
        {
          v8 = v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)run
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __20__CRKComparator_run__block_invoke;
  v3[3] = &unk_24D9C8EF8;
  v3[4] = self;
  return (id)MEMORY[0x219A226E8](v3, a2);
}

uint64_t __20__CRKComparator_run__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runComparison");
}

- (id)compareWithCriteria:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKComparator allCriteria](self, "allCriteria");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x219A226E8](v4);

  objc_msgSend(v5, "addObject:", v6);
  return self;
}

- (id)compare
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __24__CRKComparator_compare__block_invoke;
  v3[3] = &unk_24D9C8F20;
  v3[4] = self;
  return (id)MEMORY[0x219A226E8](v3, a2);
}

- (NSMutableArray)allCriteria
{
  return self->_allCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allCriteria, 0);
}

- (CRKComparator)init
{
  CRKComparator *v2;
  uint64_t v3;
  NSMutableArray *allCriteria;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKComparator;
  v2 = -[CRKComparator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    allCriteria = v2->_allCriteria;
    v2->_allCriteria = (NSMutableArray *)v3;

  }
  return v2;
}

@end
