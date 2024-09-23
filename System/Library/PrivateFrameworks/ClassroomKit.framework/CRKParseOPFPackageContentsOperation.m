@implementation CRKParseOPFPackageContentsOperation

- (CRKParseOPFPackageContentsOperation)initWithOPFFilePath:(id)a3 identifierType:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKParseOPFPackageContentsOperation *v12;
  CRKParseOPFPackageContentsOperation *v13;
  CRKOPFPackageContents *v14;
  CRKOPFPackageContents *mPackageContents;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKParseOPFPackageContentsOperation;
  v12 = -[CRKParseOPFPackageContentsOperation init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mOPFFilePath, a3);
    v14 = -[CRKOPFPackageContents initWithIdentifierType:identifier:]([CRKOPFPackageContents alloc], "initWithIdentifierType:identifier:", v10, v11);
    mPackageContents = v13->mPackageContents;
    v13->mPackageContents = v14;

  }
  return v13;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  NSXMLParser *v7;
  NSXMLParser *mOPFParser;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", self->mOPFFilePath, 0);

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD1978]);
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", self->mOPFFilePath);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSXMLParser *)objc_msgSend(v5, "initWithContentsOfURL:", v6);
    mOPFParser = self->mOPFParser;
    self->mOPFParser = v7;

    -[NSXMLParser setDelegate:](self->mOPFParser, "setDelegate:", self);
    -[NSXMLParser parse](self->mOPFParser, "parse");
  }
  else
  {
    -[CRKParseOPFPackageContentsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  uint64_t v30;
  void *v31;
  int v32;
  id v33;

  v33 = a4;
  v9 = a7;
  if (objc_msgSend(v33, "isEqualToString:", CFSTR("item")))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("id"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_19;
    v11 = (void *)v10;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("href"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_19;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("href"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKOPFPackageContents itemPathsByIdentifier](self->mPackageContents, "itemPathsByIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("id"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

    -[CRKOPFPackageContents tableOfContentsFilePath](self->mPackageContents, "tableOfContentsFilePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("id"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("ncx")))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("media-type"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("application/x-dtbncx+xml"));

        if (!v18)
          goto LABEL_9;
        -[NSString stringByDeletingLastPathComponent](self->mOPFFilePath, "stringByDeletingLastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("href"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByAppendingPathComponent:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRKOPFPackageContents setTableOfContentsFilePath:](self->mPackageContents, "setTableOfContentsFilePath:", v20);

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("media-type"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRKOPFPackageContents setTableOfContentsMediaType:](self->mPackageContents, "setTableOfContentsMediaType:", v21);

      }
    }

LABEL_9:
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("id"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", self->mCoverItemID);

    if (v23)
    {
      -[NSString stringByDeletingLastPathComponent](self->mOPFFilePath, "stringByDeletingLastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("href"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByAppendingPathComponent:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKOPFPackageContents setCoverImagePath:](self->mPackageContents, "setCoverImagePath:", v26);

LABEL_18:
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (!objc_msgSend(v33, "isEqualToString:", CFSTR("itemref")))
  {
    if ((objc_msgSend(v33, "isEqualToString:", CFSTR("dc:title")) & 1) != 0
      || objc_msgSend(v33, "isEqualToString:", CFSTR("dc:creator")))
    {
      v29 = (objc_class *)objc_opt_new();
      v30 = 400;
    }
    else
    {
      if (!objc_msgSend(v33, "isEqualToString:", CFSTR("meta")))
        goto LABEL_19;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("cover"));

      if (!v32)
        goto LABEL_19;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("content"));
      v29 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v30 = 408;
    }
    v24 = *(Class *)((char *)&self->super.super.super.isa + v30);
    *(Class *)((char *)&self->super.super.super.isa + v30) = v29;
    goto LABEL_18;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("idref"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[CRKOPFPackageContents spineItemIdentifiers](self->mPackageContents, "spineItemIdentifiers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("idref"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v28);

    goto LABEL_18;
  }
LABEL_19:

}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  NSMutableString **p_mCurrentText;
  NSMutableString *v8;
  id v9;

  v9 = a4;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("dc:title")))
  {
    p_mCurrentText = &self->mCurrentText;
    -[CRKOPFPackageContents setTitle:](self->mPackageContents, "setTitle:", self->mCurrentText);
LABEL_5:
    v8 = *p_mCurrentText;
    *p_mCurrentText = 0;

    goto LABEL_6;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("dc:creator")))
  {
    p_mCurrentText = &self->mCurrentText;
    -[CRKOPFPackageContents setAuthor:](self->mPackageContents, "setAuthor:", self->mCurrentText);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  -[NSMutableString appendString:](self->mCurrentText, "appendString:", a4);
}

- (void)parserDidEndDocument:(id)a3
{
  -[CRKParseOPFPackageContentsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", self->mPackageContents);
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  -[CRKParseOPFPackageContentsOperation endOperationWithError:](self, "endOperationWithError:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCoverItemID, 0);
  objc_storeStrong((id *)&self->mCurrentText, 0);
  objc_storeStrong((id *)&self->mPackageContents, 0);
  objc_storeStrong((id *)&self->mOPFFilePath, 0);
  objc_storeStrong((id *)&self->mOPFParser, 0);
}

@end
