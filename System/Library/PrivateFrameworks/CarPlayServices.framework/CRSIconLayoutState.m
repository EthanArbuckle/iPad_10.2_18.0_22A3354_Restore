@implementation CRSIconLayoutState

- (CRSIconLayoutState)initWithPages:(id)a3 hiddenIcons:(id)a4
{
  id v6;
  id v7;
  CRSIconLayoutState *v8;
  uint64_t v9;
  NSArray *pages;
  uint64_t v11;
  NSArray *hiddenIcons;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRSIconLayoutState;
  v8 = -[CRSIconLayoutState init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    pages = v8->_pages;
    v8->_pages = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    hiddenIcons = v8->_hiddenIcons;
    v8->_hiddenIcons = (NSArray *)v11;

  }
  return v8;
}

- (id)iconOrder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[CRSIconLayoutState pages](self, "pages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRSIconLayoutState pages](self, "pages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __31__CRSIconLayoutState_iconOrder__block_invoke;
  v10[3] = &unk_24CD387D8;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __31__CRSIconLayoutState_iconOrder__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a2;
  objc_msgSend(v4, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __31__CRSIconLayoutState_iconOrder__block_invoke_2;
  v11[3] = &unk_24CD387B0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

void __31__CRSIconLayoutState_iconOrder__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  v16.receiver = self;
  v16.super_class = (Class)CRSIconLayoutState;
  -[CRSIconLayoutState description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CRSIconLayoutState pages](self, "pages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "appendFormat:", CFSTR("  page: %@"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRSIconLayoutState)initWithCoder:(id)a3
{
  id v4;
  CRSIconLayoutState *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *pages;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *hiddenIcons;
  uint64_t v16;
  NSString *oemIconLabel;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRSIconLayoutState;
  v5 = -[CRSIconLayoutState init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("CRSIconLayoutStatePages"));
    v9 = objc_claimAutoreleasedReturnValue();
    pages = v5->_pages;
    v5->_pages = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("CRSIconLayoutHiddenIcons"));
    v14 = objc_claimAutoreleasedReturnValue();
    hiddenIcons = v5->_hiddenIcons;
    v5->_hiddenIcons = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CRSIconLayoutOEMIconLabel"));
    v16 = objc_claimAutoreleasedReturnValue();
    oemIconLabel = v5->_oemIconLabel;
    v5->_oemIconLabel = (NSString *)v16;

    v5->_displaysOEMIcon = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CRSIconLayoutDisplaysOEMIcon"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CRSIconLayoutRows"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_rows = objc_msgSend(v18, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CRSIconLayoutColumns"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_columns = objc_msgSend(v19, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CRSIconLayoutState pages](self, "pages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CRSIconLayoutStatePages"));

  -[CRSIconLayoutState hiddenIcons](self, "hiddenIcons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CRSIconLayoutHiddenIcons"));

  -[CRSIconLayoutState oemIconLabel](self, "oemIconLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CRSIconLayoutOEMIconLabel"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CRSIconLayoutState displaysOEMIcon](self, "displaysOEMIcon"), CFSTR("CRSIconLayoutDisplaysOEMIcon"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRSIconLayoutState rows](self, "rows"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("CRSIconLayoutRows"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRSIconLayoutState columns](self, "columns"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("CRSIconLayoutColumns"));

}

- (NSArray)pages
{
  return self->_pages;
}

- (NSArray)hiddenIcons
{
  return self->_hiddenIcons;
}

- (NSString)oemIconLabel
{
  return self->_oemIconLabel;
}

- (void)setOemIconLabel:(id)a3
{
  objc_storeStrong((id *)&self->_oemIconLabel, a3);
}

- (BOOL)displaysOEMIcon
{
  return self->_displaysOEMIcon;
}

- (void)setDisplaysOEMIcon:(BOOL)a3
{
  self->_displaysOEMIcon = a3;
}

- (unint64_t)rows
{
  return self->_rows;
}

- (void)setRows:(unint64_t)a3
{
  self->_rows = a3;
}

- (unint64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(unint64_t)a3
{
  self->_columns = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oemIconLabel, 0);
  objc_storeStrong((id *)&self->_hiddenIcons, 0);
  objc_storeStrong((id *)&self->_pages, 0);
}

@end
