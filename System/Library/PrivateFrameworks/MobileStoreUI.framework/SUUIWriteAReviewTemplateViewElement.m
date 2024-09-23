@implementation SUUIWriteAReviewTemplateViewElement

- (SUUIWriteAReviewTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIWriteAReviewTemplateViewElement *v9;
  void *v10;
  uint64_t v11;
  NSString *reviewMetadataURLString;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIWriteAReviewTemplateViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_itemIdentifier = objc_msgSend(v10, "longLongValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v11 = objc_claimAutoreleasedReturnValue();
    reviewMetadataURLString = v9->_reviewMetadataURLString;
    v9->_reviewMetadataURLString = (NSString *)v11;

  }
  return v9;
}

- (NSString)reviewMetadataURLString
{
  NSString *v3;
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v3 = self->_reviewMetadataURLString;
  if (self->_itemIdentifier)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEB1FD0]);
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__72;
    v25 = __Block_byref_object_dispose__72;
    v26 = 0;
    v5 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemIdentifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __62__SUUIWriteAReviewTemplateViewElement_reviewMetadataURLString__block_invoke;
    v18[3] = &unk_2511F6D88;
    v20 = &v21;
    v8 = v5;
    v19 = v8;
    objc_msgSend(v4, "getLibraryItemsForITunesStoreItemIdentifiers:completionBlock:", v7, v18);

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    if (v22[5])
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:", self->_reviewMetadataURLString);
      objc_msgSend(v9, "queryItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v10, "mutableCopy");

      if (!v11)
        v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v12 = (void *)MEMORY[0x24BDD1838];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend((id)v22[5], "longLongValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "queryItemWithName:value:", CFSTR("version-to-review"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v14);

      objc_msgSend(v9, "setQueryItems:", v11);
      objc_msgSend(v9, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "absoluteString");
      v16 = objc_claimAutoreleasedReturnValue();

      v3 = (NSString *)v16;
    }

    _Block_object_dispose(&v21, 8);
  }
  return v3;
}

void __62__SUUIWriteAReviewTemplateViewElement_reviewMetadataURLString__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BEB2A88]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIWriteAReviewTemplateViewElement *v4;
  SUUIWriteAReviewTemplateViewElement *v5;
  SUUIWriteAReviewTemplateViewElement *v6;
  NSString *v7;
  NSString *reviewMetadataURLString;
  objc_super v10;

  v4 = (SUUIWriteAReviewTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIWriteAReviewTemplateViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUIWriteAReviewTemplateViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_itemIdentifier = -[SUUIWriteAReviewTemplateViewElement itemIdentifier](v4, "itemIdentifier");
    -[SUUIWriteAReviewTemplateViewElement reviewMetadataURLString](v4, "reviewMetadataURLString");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    reviewMetadataURLString = self->_reviewMetadataURLString;
    self->_reviewMetadataURLString = v7;

  }
  return v6;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewMetadataURLString, 0);
}

@end
