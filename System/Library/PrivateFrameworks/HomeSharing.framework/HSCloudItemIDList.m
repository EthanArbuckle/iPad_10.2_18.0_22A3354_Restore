@implementation HSCloudItemIDList

- (HSCloudItemIDList)init
{
  HSCloudItemIDList *v2;
  NSMutableArray *v3;
  NSMutableArray *itemIDs;
  NSMutableArray *v5;
  NSMutableArray *idTypes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSCloudItemIDList;
  v2 = -[HSCloudItemIDList init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    itemIDs = v2->_itemIDs;
    v2->_itemIDs = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    idTypes = v2->_idTypes;
    v2->_idTypes = v5;

  }
  return v2;
}

- (HSCloudItemIDList)initWithCoder:(id)a3
{
  id v4;
  HSCloudItemIDList *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *itemIDs;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableArray *idTypes;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HSCloudItemIDList;
  v5 = -[HSCloudItemIDList init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HSCloudItemIDListItemIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    itemIDs = v5->_itemIDs;
    v5->_itemIDs = (NSMutableArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("HSCloudItemIDListIDTypes"));
    v14 = objc_claimAutoreleasedReturnValue();
    idTypes = v5->_idTypes;
    v5->_idTypes = (NSMutableArray *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *itemIDs;
  id v5;

  itemIDs = self->_itemIDs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemIDs, CFSTR("HSCloudItemIDListItemIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_idTypes, CFSTR("HSCloudItemIDListIDTypes"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p Item ID Count = %lu>"), objc_opt_class(), self, -[NSMutableArray count](self->_itemIDs, "count"));
}

- (void)addCloudItemID:(unint64_t)a3 idType:(int64_t)a4
{
  NSMutableArray *itemIDs;
  void *v7;
  NSMutableArray *idTypes;
  id v9;

  itemIDs = self->_itemIDs;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](itemIDs, "addObject:", v7);

  idTypes = self->_idTypes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](idTypes, "addObject:", v9);

}

- (void)insertCloudItemID:(unint64_t)a3 idType:(int64_t)a4 atIndex:(unint64_t)a5
{
  NSMutableArray *itemIDs;
  void *v9;
  NSMutableArray *idTypes;
  id v11;

  itemIDs = self->_itemIDs;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](itemIDs, "insertObject:atIndex:", v9, a5);

  idTypes = self->_idTypes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](idTypes, "insertObject:atIndex:", v11, a5);

}

- (void)enumerateCloudItemIDsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, uint64_t, char *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v13;

  v4 = (void (**)(id, uint64_t, uint64_t, uint64_t, char *))a3;
  if (v4)
  {
    v13 = 0;
    v5 = -[NSMutableArray count](self->_itemIDs, "count");
    if (v5)
    {
      v6 = 0;
      v7 = v5 - 1;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_itemIDs, "objectAtIndex:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "unsignedLongLongValue");

        -[NSMutableArray objectAtIndex:](self->_idTypes, "objectAtIndex:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "integerValue");

        v4[2](v4, v9, v11, v6, &v13);
        if (v13)
          break;
      }
      while (v7 != v6++);
    }
  }

}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_itemIDs, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idTypes, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
