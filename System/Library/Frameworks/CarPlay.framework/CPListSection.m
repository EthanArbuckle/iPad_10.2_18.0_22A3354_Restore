@implementation CPListSection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPListSection)initWithItems:(NSArray *)items header:(NSString *)header sectionIndexTitle:(NSString *)sectionIndexTitle
{
  NSArray *v8;
  NSString *v9;
  NSString *v10;
  CPListSection *v11;
  objc_super v13;

  v8 = items;
  v9 = header;
  v10 = sectionIndexTitle;
  v13.receiver = self;
  v13.super_class = (Class)CPListSection;
  v11 = -[CPListSection init](&v13, sel_init);
  if (v11)
  {
    v11->_sectionHeaderStyle = -[NSString length](v9, "length") != 0;
    -[CPListSection _commonInitWithItems:header:headerSubtitle:headerImage:headerButton:sectionIndexTitle:](v11, "_commonInitWithItems:header:headerSubtitle:headerImage:headerButton:sectionIndexTitle:", v8, v9, 0, 0, 0, v10);
  }

  return v11;
}

- (CPListSection)initWithItems:(NSArray *)items header:(NSString *)header headerSubtitle:(NSString *)headerSubtitle headerImage:(UIImage *)headerImage headerButton:(CPButton *)headerButton sectionIndexTitle:(NSString *)sectionIndexTitle
{
  NSArray *v14;
  NSString *v15;
  NSString *v16;
  UIImage *v17;
  CPButton *v18;
  NSString *v19;
  CPListSection *v20;
  CPListSection *v21;
  objc_super v23;

  v14 = items;
  v15 = header;
  v16 = headerSubtitle;
  v17 = headerImage;
  v18 = headerButton;
  v19 = sectionIndexTitle;
  v23.receiver = self;
  v23.super_class = (Class)CPListSection;
  v20 = -[CPListSection init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_sectionHeaderStyle = 2;
    -[CPListSection _commonInitWithItems:header:headerSubtitle:headerImage:headerButton:sectionIndexTitle:](v20, "_commonInitWithItems:header:headerSubtitle:headerImage:headerButton:sectionIndexTitle:", v14, v15, v16, v17, v18, v19);
  }

  return v21;
}

- (void)_commonInitWithItems:(id)a3 header:(id)a4 headerSubtitle:(id)a5 headerImage:(id)a6 headerButton:(id)a7 sectionIndexTitle:(id)a8
{
  NSArray *v15;
  NSString *v16;
  UIImage *v17;
  CPButton *v18;
  NSString *v19;
  NSUUID *v20;
  NSUUID *identifier;
  NSArray *items;
  NSArray *v23;
  NSString *sectionIndexTitle;
  NSString *v25;
  UIImage *headerImage;
  UIImage *v27;
  NSString *headerSubtitle;
  NSString *v29;
  CPButton *headerButton;
  CPButton *v31;
  NSUInteger v32;
  id v33;
  _QWORD v34[5];

  v15 = (NSArray *)a3;
  v33 = a4;
  v16 = (NSString *)a5;
  v17 = (UIImage *)a6;
  v18 = (CPButton *)a7;
  v19 = (NSString *)a8;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __103__CPListSection__commonInitWithItems_header_headerSubtitle_headerImage_headerButton_sectionIndexTitle___block_invoke;
  v34[3] = &__block_descriptor_40_e37_v32__0___CPListTemplateItem__8Q16_B24l;
  v34[4] = a2;
  -[NSArray enumerateObjectsUsingBlock:](v15, "enumerateObjectsUsingBlock:", v34);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v20 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v20;

  items = self->_items;
  self->_items = v15;
  v23 = v15;

  objc_storeStrong((id *)&self->_header, a4);
  sectionIndexTitle = self->_sectionIndexTitle;
  self->_sectionIndexTitle = v19;
  v25 = v19;

  headerImage = self->_headerImage;
  self->_headerImage = v17;
  v27 = v17;

  headerSubtitle = self->_headerSubtitle;
  self->_headerSubtitle = v16;
  v29 = v16;

  headerButton = self->_headerButton;
  self->_headerButton = v18;
  v31 = v18;

  v32 = -[NSString length](self->_headerSubtitle, "length");
  if (!v32 && !self->_headerImage && !self->_headerButton)
    self->_sectionHeaderStyle = objc_msgSend(v33, "length") != 0;

}

void __103__CPListSection__commonInitWithItems_header_headerSubtitle_headerImage_headerButton_sectionIndexTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(const char **)(a1 + 32);
  v12 = v3;
  if ((objc_msgSend(v7, "containsObject:", object_getClass(v12)) & 1) == 0)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    v10 = *MEMORY[0x24BDBCAB8];
    NSStringFromSelector(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", v10, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v12, v11, v7, 0);

  }
}

- (CPListSection)initWithItems:(NSArray *)items
{
  return -[CPListSection initWithItems:header:sectionIndexTitle:](self, "initWithItems:header:sectionIndexTitle:", items, 0, 0);
}

- (int64_t)numberOfItems
{
  void *v2;
  int64_t v3;

  -[CPListSection items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)itemAtIndex:(NSUInteger)index
{
  void *v4;
  void *v5;

  -[CPListSection items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", index);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSUInteger)indexOfItem:(id)item
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSUInteger v8;
  _QWORD v10[4];
  id v11;

  v4 = item;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_2549DAC20))
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[CPListSection items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __29__CPListSection_indexOfItem___block_invoke;
  v10[3] = &unk_24C77D2C8;
  v11 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v10);

  return v8;
}

uint64_t __29__CPListSection_indexOfItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_2549DAC20))
  {
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v4);

  return v5;
}

- (void)replaceItemAtIndex:(unint64_t)a3 withItem:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *items;
  id v20;

  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v7;
  if ((objc_msgSend(v11, "containsObject:", object_getClass(v20)) & 1) == 0)
  {
    v12 = (void *)MEMORY[0x24BDBCE88];
    v13 = *MEMORY[0x24BDBCAB8];
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v20, v14, v11, 0);

  }
  v15 = (void *)MEMORY[0x24BDBCEB8];
  -[CPListSection items](self, "items");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "replaceObjectAtIndex:withObject:", a3, v20);
  v18 = (NSArray *)objc_msgSend(v17, "copy");
  items = self->_items;
  self->_items = v18;

}

- (void)replaceItems:(id)a3
{
  NSArray *v4;
  NSArray *items;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  items = self->_items;
  self->_items = v4;

}

- (CPListSection)initWithCoder:(id)a3
{
  id v4;
  CPListSection *v5;
  uint64_t v6;
  NSUUID *identifier;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *items;
  uint64_t v16;
  NSString *header;
  uint64_t v18;
  NSString *sectionIndexTitle;
  uint64_t v20;
  NSString *headerSubtitle;
  uint64_t v22;
  UIImage *headerImage;
  uint64_t v24;
  CPButton *headerButton;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CPListSection;
  v5 = -[CPListSection init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPSectionIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kCPSectionItemsKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPSectionHeaderKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    header = v5->_header;
    v5->_header = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPSectionIndexTitleKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    sectionIndexTitle = v5->_sectionIndexTitle;
    v5->_sectionIndexTitle = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPSectionHeaderSubtitleKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    headerSubtitle = v5->_headerSubtitle;
    v5->_headerSubtitle = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPSectionHeaderImageKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    headerImage = v5->_headerImage;
    v5->_headerImage = (UIImage *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPSectionHeaderButtonKey"));
    v24 = objc_claimAutoreleasedReturnValue();
    headerButton = v5->_headerButton;
    v5->_headerButton = (CPButton *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPSectionHeaderStyleKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sectionHeaderStyle = objc_msgSend(v26, "integerValue");

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
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[CPListSection identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPSectionIdentifierKey"));

  -[CPListSection items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPSectionItemsKey"));

  -[CPListSection header](self, "header");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCPSectionHeaderKey"));

  -[CPListSection sectionIndexTitle](self, "sectionIndexTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kCPSectionIndexTitleKey"));

  -[CPListSection headerSubtitle](self, "headerSubtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kCPSectionHeaderSubtitleKey"));

  -[CPListSection headerImage](self, "headerImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("kCPSectionHeaderImageKey"));

  -[CPListSection headerButton](self, "headerButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("kCPSectionHeaderButtonKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CPListSection sectionHeaderStyle](self, "sectionHeaderStyle"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("kCPSectionHeaderStyleKey"));

}

- (void)setHeaderImage:(UIImage *)headerImage
{
  UIImage *v5;
  UIImage *v6;
  unint64_t v7;
  id WeakRetained;
  UIImage *v9;
  void *v10;
  UIImage *v11;

  v5 = headerImage;
  v11 = v5;
  if (self->_sectionHeaderStyle)
  {
    v6 = self->_headerImage;
    if (!v5 || v6)
    {
      if (v5 || !v6)
      {
        objc_storeStrong((id *)&self->_headerImage, headerImage);
        goto LABEL_14;
      }
      self->_headerImage = 0;

      if (-[NSString length](self->_headerSubtitle, "length") || self->_headerImage || self->_headerButton)
        goto LABEL_14;
      v7 = -[NSString length](self->_header, "length") != 0;
    }
    else
    {
      objc_storeStrong((id *)&self->_headerImage, headerImage);
      v7 = 2;
    }
    self->_sectionHeaderStyle = v7;
LABEL_14:
    WeakRetained = objc_loadWeakRetained((id *)&self->_listTemplate);
    v9 = self->_headerImage;
    -[CPListSection identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "updateHeaderImage:forSectionIdentifier:", v9, v10);

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Setting a header image requires section header text to be set."));
LABEL_15:

}

- (NSString)header
{
  return self->_header;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (UIImage)headerImage
{
  return self->_headerImage;
}

- (CPButton)headerButton
{
  return self->_headerButton;
}

- (NSString)sectionIndexTitle
{
  return self->_sectionIndexTitle;
}

- (NSArray)items
{
  return self->_items;
}

- (CPListTemplate)listTemplate
{
  return (CPListTemplate *)objc_loadWeakRetained((id *)&self->_listTemplate);
}

- (void)setListTemplate:(id)a3
{
  objc_storeWeak((id *)&self->_listTemplate, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (unint64_t)sectionHeaderStyle
{
  return self->_sectionHeaderStyle;
}

- (void)setSectionHeaderStyle:(unint64_t)a3
{
  self->_sectionHeaderStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_listTemplate);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_sectionIndexTitle, 0);
  objc_storeStrong((id *)&self->_headerButton, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end
