@implementation WFCoercionRequest

- (WFCoercionOptions)options
{
  WFCoercionOptions *options;
  WFCoercionOptions *v4;
  WFCoercionOptions *v5;

  options = self->_options;
  if (!options)
  {
    v4 = +[WFCoercionOptions new](WFCoercionOptions, "new");
    v5 = self->_options;
    self->_options = v4;

    options = self->_options;
  }
  return options;
}

- (id)fileRepresentationResultHandler
{
  id fileRepresentationResultHandler;

  if (self->_fileRepresentationResultHandler)
    fileRepresentationResultHandler = self->_fileRepresentationResultHandler;
  else
    fileRepresentationResultHandler = &__block_literal_global_3182;
  return _Block_copy(fileRepresentationResultHandler);
}

- (id)objectRepresentationResultHandler
{
  id objectRepresentationResultHandler;

  if (self->_objectRepresentationResultHandler)
    objectRepresentationResultHandler = self->_objectRepresentationResultHandler;
  else
    objectRepresentationResultHandler = &__block_literal_global_112;
  return _Block_copy(objectRepresentationResultHandler);
}

- (id)contentCollectionResultHandler
{
  id contentCollectionResultHandler;
  void *v5;
  id v6;
  void *v7;
  _QWORD aBlock[4];
  id v9;

  contentCollectionResultHandler = self->_contentCollectionResultHandler;
  if (contentCollectionResultHandler)
    return _Block_copy(contentCollectionResultHandler);
  v5 = _Block_copy(self->_contentItemsCompletionHandler);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__WFCoercionRequest_contentCollectionResultHandler__block_invoke;
  aBlock[3] = &unk_24C4DC748;
  v9 = v5;
  v6 = v5;
  v7 = _Block_copy(aBlock);

  return v7;
}

- (void)completeContentItemCoercionRequestWithResultItems:(id)a3 originalItem:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  void (**contentItemsCompletionHandler)(id, id, id);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoercionRequest.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalItem"));

  }
  contentItemsCompletionHandler = (void (**)(id, id, id))self->_contentItemsCompletionHandler;
  if (contentItemsCompletionHandler)
  {
    contentItemsCompletionHandler[2](contentItemsCompletionHandler, v9, v11);
  }
  else if (self->_contentCollectionResultHandler)
  {
    if (v9)
    {
      +[WFContentCollection collectionWithItems:](WFContentCollection, "collectionWithItems:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    if (objc_msgSend(v9, "count"))
    {
      v14 = (void *)objc_opt_new();
    }
    else
    {
      v17[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFContentCollection collectionWithItems:](WFContentCollection, "collectionWithItems:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    (*((void (**)(void))self->_contentCollectionResultHandler + 2))();

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v4 = (_QWORD *)objc_opt_new();
  v4[6] = -[WFCoercionRequest requestType](self, "requestType");
  v5 = -[objc_class copy](-[WFCoercionRequest objectClass](self, "objectClass"), "copy");
  v6 = (void *)v4[7];
  v4[7] = v5;

  -[WFCoercionRequest objectRepresentationResultHandler](self, "objectRepresentationResultHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)v4[1];
  v4[1] = v8;

  -[WFCoercionRequest fileType](self, "fileType");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v4[8];
  v4[8] = v10;

  -[WFCoercionRequest fileRepresentationResultHandler](self, "fileRepresentationResultHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy");
  v14 = (void *)v4[2];
  v4[2] = v13;

  -[WFCoercionRequest contentItemClasses](self, "contentItemClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copy");
  v17 = (void *)v4[9];
  v4[9] = v16;

  -[WFCoercionRequest contentCollectionResultHandler](self, "contentCollectionResultHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copy");
  v20 = (void *)v4[4];
  v4[4] = v19;

  -[WFCoercionRequest contentItemsCompletionHandler](self, "contentItemsCompletionHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copy");
  v23 = (void *)v4[3];
  v4[3] = v22;

  -[WFCoercionRequest options](self, "options");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "copy");
  v26 = (void *)v4[5];
  v4[5] = v25;

  return v4;
}

- (id)contentItemsCompletionHandler
{
  return self->_contentItemsCompletionHandler;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (WFFileType)fileType
{
  return self->_fileType;
}

- (NSArray)contentItemClasses
{
  return self->_contentItemClasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemClasses, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_objectClass, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_contentCollectionResultHandler, 0);
  objc_storeStrong(&self->_contentItemsCompletionHandler, 0);
  objc_storeStrong(&self->_fileRepresentationResultHandler, 0);
  objc_storeStrong(&self->_objectRepresentationResultHandler, 0);
}

void __51__WFCoercionRequest_contentCollectionResultHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v6 = a4;
    objc_msgSend(a2, "items");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

  }
}

+ (id)requestForCoercingToObjectClass:(Class)a3 completionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = objc_opt_new();
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)(v6 + 48) = 0;
    v8 = objc_msgSend(v5, "copy");
    v9 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v8;

    objc_storeStrong((id *)(v7 + 56), a3);
    v10 = (id)v7;
  }

  return (id)v7;
}

+ (id)requestForCoercingToFileType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new();
  v9 = v8;
  if (v8)
  {
    *(_QWORD *)(v8 + 48) = 1;
    v10 = objc_msgSend(v7, "copy");
    v11 = *(void **)(v9 + 16);
    *(_QWORD *)(v9 + 16) = v10;

    objc_storeStrong((id *)(v9 + 64), a3);
    v12 = (id)v9;
  }

  return (id)v9;
}

+ (id)requestForCoercingToContentClasses:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  void *v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFCoercionRequest.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItemClasses"));

  }
  v9 = objc_opt_new();
  v10 = (_QWORD *)v9;
  if (v9)
  {
    *(_QWORD *)(v9 + 48) = 2;
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)v10[4];
    v10[4] = v11;

    v13 = objc_msgSend(v7, "copy");
    v14 = (void *)v10[9];
    v10[9] = v13;

    v15 = v10;
  }

  return v10;
}

+ (id)_requestForCoercingToContentClasses:(id)a3 itemCompletionHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  void *v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFCoercionRequest.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItemClasses"));

  }
  v9 = objc_opt_new();
  v10 = (_QWORD *)v9;
  if (v9)
  {
    *(_QWORD *)(v9 + 48) = 2;
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)v10[3];
    v10[3] = v11;

    v13 = objc_msgSend(v7, "copy");
    v14 = (void *)v10[9];
    v10[9] = v13;

    v15 = v10;
  }

  return v10;
}

@end
