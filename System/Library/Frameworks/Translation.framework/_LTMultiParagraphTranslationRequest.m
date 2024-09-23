@implementation _LTMultiParagraphTranslationRequest

- (_LTMultiParagraphTranslationRequest)initWithText:(id)a3 localePair:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LTMultiParagraphTranslationRequest *v11;
  uint64_t v12;
  NSString *text;
  uint64_t v14;
  NSMutableDictionary *completedResultMap;
  void *v16;
  id completionHandler;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  _LTMultiParagraphTranslationRequest *v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_LTMultiParagraphTranslationRequest;
  v11 = -[_LTMultiParagraphTranslationRequest init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    text = v11->_text;
    v11->_text = (NSString *)v12;

    objc_storeStrong((id *)&v11->_localePair, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    completedResultMap = v11->_completedResultMap;
    v11->_completedResultMap = (NSMutableDictionary *)v14;

    v16 = _Block_copy(v10);
    completionHandler = v11->_completionHandler;
    v11->_completionHandler = v16;

    v18 = dispatch_queue_create("com.apple.translation.MultiParagraphRequest", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v18;

    -[_LTMultiParagraphTranslationRequest _generateParagraphRequests](v11, "_generateParagraphRequests");
    v20 = v11;
  }

  return v11;
}

- (void)_generateParagraphRequests
{
  void *v3;
  void *v4;
  uint64_t v5;
  dispatch_group_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *queue;
  NSArray *v12;
  NSArray *paragraphRequests;
  _QWORD block[4];
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  id v19;
  id location;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", self->_text);
  objc_msgSend(v3, "paragraphs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    v21[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  v6 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke;
  v16[3] = &unk_250693CB8;
  objc_copyWeak(&v19, &location);
  v9 = v6;
  v17 = v9;
  v10 = v7;
  v18 = v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v16);
  queue = self->_queue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke_9;
  block[3] = &unk_250693730;
  objc_copyWeak(&v15, &location);
  dispatch_group_notify(v9, queue, block);
  v12 = (NSArray *)objc_msgSend(v10, "copy");
  paragraphRequests = self->_paragraphRequests;
  self->_paragraphRequests = v12;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)_cleanUp
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary removeAllObjects](self->_completedResultMap, "removeAllObjects");
}

- (NSString)text
{
  return self->_text;
}

- (NSArray)paragraphRequests
{
  return self->_paragraphRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_completedResultMap, 0);
  objc_storeStrong((id *)&self->_paragraphRequests, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
}

@end
