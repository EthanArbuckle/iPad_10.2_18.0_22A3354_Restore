@implementation DDLookupAction

- (DDLookupAction)initWithRVQuery:(id)a3 context:(id)a4
{
  id v7;
  DDLookupAction *v8;
  DDLookupAction *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DDLookupAction;
  v8 = -[DDParsecPreviewAction initWithURL:result:context:](&v11, sel_initWithURL_result_context_, 0, 0, a4);
  v9 = v8;
  if (v8)
  {
    -[DDParsecPreviewAction setPreviewMode:](v8, "setPreviewMode:", 0);
    objc_storeStrong((id *)&v9->_query, a3);
  }

  return v9;
}

- (DDLookupAction)initWithQueryString:(id)a3 range:(_NSRange)a4 context:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  DDLookupAction *v10;
  DDLookupAction *v11;
  uint64_t v12;
  NSString *queryString;
  objc_super v15;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DDLookupAction;
  v10 = -[DDParsecPreviewAction initWithURL:result:context:](&v15, sel_initWithURL_result_context_, 0, 0, a5);
  v11 = v10;
  if (v10)
  {
    -[DDParsecPreviewAction setPreviewMode:](v10, "setPreviewMode:", 0);
    v12 = objc_msgSend(v9, "copy");
    queryString = v11->_queryString;
    v11->_queryString = (NSString *)v12;

    v11->_queryStringRange.location = location;
    v11->_queryStringRange.length = length;
  }

  return v11;
}

- (DDLookupAction)initWithRVQuery:(id)a3 reportAnIssueBlock:(id)a4 context:(id)a5
{
  return -[DDLookupAction initWithRVQuery:reportAnIssueBlock:metadataFetchingBlock:context:](self, "initWithRVQuery:reportAnIssueBlock:metadataFetchingBlock:context:", a3, a4, 0, a5);
}

- (DDLookupAction)initWithRVQuery:(id)a3 reportAnIssueBlock:(id)a4 metadataFetchingBlock:(id)a5 context:(id)a6
{
  id v11;
  id v12;
  id v13;
  DDLookupAction *v14;
  DDLookupAction *v15;
  uint64_t v16;
  id reportAnIssueBlock;
  uint64_t v18;
  id reportAnIssueMetadataFetchingBlock;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DDLookupAction;
  v14 = -[DDParsecPreviewAction initWithURL:result:context:](&v21, sel_initWithURL_result_context_, 0, 0, a6);
  v15 = v14;
  if (v14)
  {
    -[DDParsecPreviewAction setPreviewMode:](v14, "setPreviewMode:", 0);
    objc_storeStrong((id *)&v15->_query, a3);
    v16 = MEMORY[0x1A1AF3244](v12);
    reportAnIssueBlock = v15->_reportAnIssueBlock;
    v15->_reportAnIssueBlock = (id)v16;

    v18 = MEMORY[0x1A1AF3244](v13);
    reportAnIssueMetadataFetchingBlock = v15->_reportAnIssueMetadataFetchingBlock;
    v15->_reportAnIssueMetadataFetchingBlock = (id)v18;

  }
  return v15;
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
  -[DDParsecCollectionViewController adaptForPresentationInPopover:](self->super.super._parsecViewController, "adaptForPresentationInPopover:", a3);
}

- (id)createViewController
{
  RVQuery *query;
  DDParsecCollectionViewController *v4;
  DDParsecCollectionViewController *v5;
  DDParsecCollectionViewController *v6;
  DDParsecCollectionViewController *parsecViewController;
  DDParsecCollectionViewController *v8;

  query = self->_query;
  if (!self->_queryString)
  {
    if (!query)
    {
      v8 = 0;
      return v8;
    }
    goto LABEL_5;
  }
  if (query)
  {
LABEL_5:
    v6 = -[DDParsecCollectionViewController initWithQuery:]([DDParsecCollectionViewController alloc], "initWithQuery:", self->_query);
    parsecViewController = self->super.super._parsecViewController;
    self->super.super._parsecViewController = v6;

    -[DDParsecCollectionViewController setReportAnIssueBlock:](self->super.super._parsecViewController, "setReportAnIssueBlock:", self->_reportAnIssueBlock);
    -[DDParsecCollectionViewController setReportAnIssueMetadataFetchingBlock:](self->super.super._parsecViewController, "setReportAnIssueMetadataFetchingBlock:", self->_reportAnIssueMetadataFetchingBlock);
    goto LABEL_6;
  }
  v4 = -[DDParsecCollectionViewController initWithString:range:]([DDParsecCollectionViewController alloc], "initWithString:range:", self->_queryString, self->_queryStringRange.location, self->_queryStringRange.length);
  v5 = self->super.super._parsecViewController;
  self->super.super._parsecViewController = v4;

LABEL_6:
  -[DDParsecCollectionViewController setPreviewMode:](self->super.super._parsecViewController, "setPreviewMode:", self->super.super._previewMode);
  -[DDParsecCollectionViewController setParsecDelegate:](self->super.super._parsecViewController, "setParsecDelegate:", self);
  v8 = self->super.super._parsecViewController;
  return v8;
}

- (id)menuActions
{
  RVQuery *query;
  NSString *v4;
  NSUInteger length;
  NSUInteger location;
  DDCopyAction *v7;
  DDSearchWebAction *v8;
  void *v9;
  void *v10;
  void *v11;
  DDCopyAction *v13;
  DDSearchWebAction *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  query = self->_query;
  if (query)
  {
    -[RVQuery title](query, "title");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    length = -[NSString length](v4, "length");
    location = 0;
  }
  else
  {
    v4 = self->_queryString;
    location = self->_queryStringRange.location;
    length = self->_queryStringRange.length;
  }
  v7 = -[DDCopyAction initWithQueryString:range:context:]([DDCopyAction alloc], "initWithQueryString:range:context:", v4, location, length, self->super.super.super.super._context);
  v8 = -[DDSearchWebAction initWithQueryString:range:context:]([DDSearchWebAction alloc], "initWithQueryString:range:context:", v4, location, length, self->super.super.super.super._context);
  v14 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)iconName
{
  return CFSTR("doc.text.magnifyingglass");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reportAnIssueMetadataFetchingBlock, 0);
  objc_storeStrong(&self->_reportAnIssueBlock, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

@end
