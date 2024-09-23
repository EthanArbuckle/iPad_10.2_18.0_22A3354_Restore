@implementation CTSIMToolkitItemList

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSIMToolkitItemList itemList](self, "itemList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", ItemCount=%lu"), objc_msgSend(v4, "count"));

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTSIMToolkitItemList itemList](self, "itemList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setItemList:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CTSIMToolkitItemList itemList](self, "itemList");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kItemListKey"));

}

- (CTSIMToolkitItemList)initWithCoder:(id)a3
{
  id v4;
  CTSIMToolkitItemList *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *itemList;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTSIMToolkitItemList;
  v5 = -[CTSIMToolkitItemList init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("kItemListKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    itemList = v5->_itemList;
    v5->_itemList = (NSArray *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)itemList
{
  return self->_itemList;
}

- (void)setItemList:(id)a3
{
  objc_storeStrong((id *)&self->_itemList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemList, 0);
}

@end
