@implementation CRKParseHTMLTableOfContentsOperation

- (CRKParseHTMLTableOfContentsOperation)initWithFilePath:(id)a3 packageContents:(id)a4
{
  id v7;
  id v8;
  CRKParseHTMLTableOfContentsOperation *v9;
  CRKParseHTMLTableOfContentsOperation *v10;
  uint64_t v11;
  NSMutableArray *mChapters;
  uint64_t v13;
  NSMutableArray *mParentChapters;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRKParseHTMLTableOfContentsOperation;
  v9 = -[CRKParseHTMLTableOfContentsOperation init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mHTMLFilePath, a3);
    objc_storeStrong((id *)&v10->mPackageContents, a4);
    v11 = objc_opt_new();
    mChapters = v10->mChapters;
    v10->mChapters = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    mParentChapters = v10->mParentChapters;
    v10->mParentChapters = (NSMutableArray *)v13;

  }
  return v10;
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
  NSXMLParser *mHTMLParser;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", self->mHTMLFilePath, 0);

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD1978]);
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", self->mHTMLFilePath);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSXMLParser *)objc_msgSend(v5, "initWithContentsOfURL:", v6);
    mHTMLParser = self->mHTMLParser;
    self->mHTMLParser = v7;

    -[NSXMLParser setDelegate:](self->mHTMLParser, "setDelegate:", self);
    -[NSXMLParser parse](self->mHTMLParser, "parse");
  }
  else
  {
    -[CRKParseHTMLTableOfContentsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v9;
  id v10;
  CRKChapter *v11;
  CRKChapter *mCurrentChapter;
  NSMutableString *v13;
  NSMutableString *mCurrentText;
  CRKOPFPackageContents *mPackageContents;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v9 = a4;
  v10 = a7;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("nav")))
  {
    self->mIsInNav = 1;
  }
  else if (!self->mIsInNav)
  {
    goto LABEL_10;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("li")))
  {
    if (self->mCurrentChapter)
      -[NSMutableArray addObject:](self->mParentChapters, "addObject:");
    v11 = (CRKChapter *)objc_opt_new();
    mCurrentChapter = self->mCurrentChapter;
    self->mCurrentChapter = v11;

  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("a")))
  {
    v13 = (NSMutableString *)objc_opt_new();
    mCurrentText = self->mCurrentText;
    self->mCurrentText = v13;

    mPackageContents = self->mPackageContents;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("href"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    -[CRKOPFPackageContents itemIdentifierForHref:fragment:](mPackageContents, "itemIdentifierForHref:fragment:", v16, &v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;

    -[CRKOPFPackageContents urlWithItemIdentifier:fragment:](self->mPackageContents, "urlWithItemIdentifier:fragment:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKChapter setWebURL:](self->mCurrentChapter, "setWebURL:", v19);

  }
LABEL_10:

}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  CRKChapter *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CRKChapter *mCurrentChapter;
  uint64_t v13;
  NSMutableString *mCurrentText;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a4;
  if (!objc_msgSend(v19, "isEqualToString:", CFSTR("nav")))
  {
    if (!self->mIsInNav)
      goto LABEL_15;
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("li")))
    {
      if (-[NSMutableArray count](self->mParentChapters, "count"))
      {
        -[NSMutableArray lastObject](self->mParentChapters, "lastObject");
        v7 = (CRKChapter *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray removeLastObject](self->mParentChapters, "removeLastObject");
        -[CRKChapter title](self->mCurrentChapter, "title");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "length");

        if (v9)
        {
          -[CRKChapter subchapters](v7, "subchapters");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "arrayByAddingObject:", self->mCurrentChapter);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRKChapter setSubchapters:](v7, "setSubchapters:", v11);

        }
        mCurrentChapter = self->mCurrentChapter;
        self->mCurrentChapter = v7;
        goto LABEL_14;
      }
      v13 = 408;
      -[CRKChapter title](self->mCurrentChapter, "title");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      if (v18)
        -[NSMutableArray addObject:](self->mChapters, "addObject:", self->mCurrentChapter);
    }
    else
    {
      if (!objc_msgSend(v19, "isEqualToString:", CFSTR("a")))
        goto LABEL_15;
      v13 = 424;
      mCurrentText = self->mCurrentText;
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString stringByTrimmingCharactersInSet:](mCurrentText, "stringByTrimmingCharactersInSet:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKChapter setTitle:](self->mCurrentChapter, "setTitle:", v16);

    }
    mCurrentChapter = *(CRKChapter **)((char *)&self->super.super.super.isa + v13);
    *(Class *)((char *)&self->super.super.super.isa + v13) = 0;
LABEL_14:

    goto LABEL_15;
  }
  self->mIsInNav = 0;
LABEL_15:

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  -[NSMutableString appendString:](self->mCurrentText, "appendString:", a4);
}

- (void)parserDidEndDocument:(id)a3
{
  if (-[CRKParseHTMLTableOfContentsOperation isExecuting](self, "isExecuting", a3))
    -[CRKParseHTMLTableOfContentsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", self->mChapters);
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v5;

  v5 = a4;
  if (-[CRKParseHTMLTableOfContentsOperation isExecuting](self, "isExecuting"))
    -[CRKParseHTMLTableOfContentsOperation endOperationWithError:](self, "endOperationWithError:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCurrentText, 0);
  objc_storeStrong((id *)&self->mParentChapters, 0);
  objc_storeStrong((id *)&self->mCurrentChapter, 0);
  objc_storeStrong((id *)&self->mChapters, 0);
  objc_storeStrong((id *)&self->mPackageContents, 0);
  objc_storeStrong((id *)&self->mHTMLFilePath, 0);
  objc_storeStrong((id *)&self->mHTMLParser, 0);
}

@end
