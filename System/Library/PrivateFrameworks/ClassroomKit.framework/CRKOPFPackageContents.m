@implementation CRKOPFPackageContents

- (CRKOPFPackageContents)initWithIdentifierType:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  CRKOPFPackageContents *v9;
  CRKOPFPackageContents *v10;
  uint64_t v11;
  NSMutableDictionary *itemPathsByIdentifier;
  uint64_t v13;
  NSMutableArray *spineItemIdentifiers;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRKOPFPackageContents;
  v9 = -[CRKOPFPackageContents init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bookIdentifier, a4);
    objc_storeStrong((id *)&v10->_bookIdentifierType, a3);
    v11 = objc_opt_new();
    itemPathsByIdentifier = v10->_itemPathsByIdentifier;
    v10->_itemPathsByIdentifier = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    spineItemIdentifiers = v10->_spineItemIdentifiers;
    v10->_spineItemIdentifiers = (NSMutableArray *)v13;

  }
  return v10;
}

- (id)itemIdentifierForHref:(id)a3 fragment:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    objc_msgSend(v6, "fragment");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CRKOPFPackageContents itemPathsByIdentifier](self, "itemPathsByIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v21 = v6;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[CRKOPFPackageContents itemPathsByIdentifier](self, "itemPathsByIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v9);

        if ((v18 & 1) != 0)
        {
          v19 = v15;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v12)
        continue;
      break;
    }
    v19 = 0;
LABEL_13:
    v6 = v21;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)cfiWithItemIdentifier:(id)a3 fragment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  -[CRKOPFPackageContents spineItemIdentifiers](self, "spineItemIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v6);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2 * v9 + 2);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v7)
      objc_msgSend(v11, "stringWithFormat:", CFSTR("epubcfi(/6/%@[%@]!/4[%@])"), v12, v6, v7);
    else
      objc_msgSend(v11, "stringWithFormat:", CFSTR("epubcfi(/6/%@[%@]!/4)"), v12, v6, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)urlWithItemIdentifier:(id)a3 fragment:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  -[CRKOPFPackageContents cfiWithItemIdentifier:fragment:](self, "cfiWithItemIdentifier:fragment:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF48];
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[CRKOPFPackageContents bookIdentifierType](self, "bookIdentifierType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKOPFPackageContents bookIdentifier](self, "bookIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5)
    objc_msgSend(v7, "stringWithFormat:", CFSTR("ibooks://%@/%@#%@"), v8, v9, v5);
  else
    objc_msgSend(v7, "stringWithFormat:", CFSTR("ibooks://%@/%@"), v8, v9, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)bookIdentifier
{
  return self->_bookIdentifier;
}

- (void)setBookIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bookIdentifierType
{
  return self->_bookIdentifierType;
}

- (void)setBookIdentifierType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)coverImagePath
{
  return self->_coverImagePath;
}

- (void)setCoverImagePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)tableOfContentsFilePath
{
  return self->_tableOfContentsFilePath;
}

- (void)setTableOfContentsFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)tableOfContentsMediaType
{
  return self->_tableOfContentsMediaType;
}

- (void)setTableOfContentsMediaType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableArray)spineItemIdentifiers
{
  return self->_spineItemIdentifiers;
}

- (NSMutableDictionary)itemPathsByIdentifier
{
  return self->_itemPathsByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemPathsByIdentifier, 0);
  objc_storeStrong((id *)&self->_spineItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_tableOfContentsMediaType, 0);
  objc_storeStrong((id *)&self->_tableOfContentsFilePath, 0);
  objc_storeStrong((id *)&self->_coverImagePath, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bookIdentifierType, 0);
  objc_storeStrong((id *)&self->_bookIdentifier, 0);
}

@end
