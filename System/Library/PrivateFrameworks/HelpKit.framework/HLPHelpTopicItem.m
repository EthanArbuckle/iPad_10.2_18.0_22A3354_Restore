@implementation HLPHelpTopicItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HLPHelpTopicItem;
  v4 = -[HLPHelpItem copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[HLPHelpTopicItem hrefID](self, "hrefID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHrefID:", v5);

  -[HLPHelpTopicItem categories](self, "categories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCategories:", v6);

  -[HLPHelpTopicItem anchor](self, "anchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnchor:", v7);

  -[HLPHelpTopicItem glossaryIdentifierString](self, "glossaryIdentifierString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlossaryIdentifierString:", v8);

  return v4;
}

- (HLPHelpTopicItem)initWithDictionary:(id)a3 helpBookURL:(id)a4 serverType:(int64_t)a5
{
  id v8;
  HLPHelpTopicItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HLPHelpTopicItem;
  v9 = -[HLPHelpItem initWithDictionary:helpBookURL:serverType:](&v16, sel_initWithDictionary_helpBookURL_serverType_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("href"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("#"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicItem setHrefID:](v9, "setHrefID:", v12);

    if (objc_msgSend(v11, "count") == 2)
    {
      objc_msgSend(v11, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpTopicItem setAnchor:](v9, "setAnchor:", v13);

    }
    else
    {
      -[HLPHelpTopicItem setAnchor:](v9, "setAnchor:", 0);
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("categories"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicItem setCategories:](v9, "setCategories:", v14);

    -[HLPHelpTopicItem setGlossaryIdentifierString:](v9, "setGlossaryIdentifierString:", CFSTR("aside"));
  }

  return v9;
}

- (BOOL)categoryContainKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[HLPHelpTopicItem categories](self, "categories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[HLPHelpTopicItem categories](self, "categories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v4) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isGlossary
{
  return -[HLPHelpTopicItem categoryContainKey:](self, "categoryContainKey:", self->_glossaryIdentifierString);
}

- (BOOL)isCopyright
{
  return -[HLPHelpTopicItem categoryContainKey:](self, "categoryContainKey:", CFSTR("copyright"));
}

- (BOOL)isPassionPoints
{
  return -[HLPHelpTopicItem categoryContainKey:](self, "categoryContainKey:", CFSTR("passionpoints"));
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v10.receiver = self;
  v10.super_class = (Class)HLPHelpTopicItem;
  -[HLPHelpItem debugDescription](&v10, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HLPHelpTopicItem hrefID](self, "hrefID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("hrefID: %@\n"), v6);

  -[HLPHelpTopicItem anchor](self, "anchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("anchor: %@\n"), v7);

  -[HLPHelpTopicItem categories](self, "categories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("categories: %@\n"), v8);

  return v5;
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)hrefID
{
  return self->_hrefID;
}

- (void)setHrefID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)glossaryIdentifierString
{
  return self->_glossaryIdentifierString;
}

- (void)setGlossaryIdentifierString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_glossaryIdentifierString, 0);
  objc_storeStrong((id *)&self->_hrefID, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end
