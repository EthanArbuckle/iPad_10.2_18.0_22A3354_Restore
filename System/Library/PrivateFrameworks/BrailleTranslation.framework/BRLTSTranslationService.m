@implementation BRLTSTranslationService

- (BRLTSTranslationService)init
{
  BRLTSTranslationService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRLTSTranslationService;
  v2 = -[BRLTSTranslationService init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.accessibility.BrailleTranslation.BrailleTranslationService.serviceQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)brailleForText:(id)a3 parameters:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BRLTSTranslationService queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__BRLTSTranslationService_brailleForText_parameters_withReply___block_invoke;
  v15[3] = &unk_24CBF0FE8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __63__BRLTSTranslationService_brailleForText_parameters_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "queueTranslator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v7 = 0;
    objc_msgSend(v2, "brailleForText:parameters:locations:", v3, v4, &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)textForBraille:(id)a3 parameters:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BRLTSTranslationService *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BRLTSTranslationService queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__BRLTSTranslationService_textForBraille_parameters_withReply___block_invoke;
  v15[3] = &unk_24CBF0FE8;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __63__BRLTSTranslationService_textForBraille_parameters_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  if (*(_QWORD *)(a1 + 56))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "textPositionsRange");
    objc_msgSend(*(id *)(a1 + 40), "queueTranslator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 32);
    if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v3, "textForBraille:parameters:locations:", v5, v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = 0;
    }
    else
    {
      v9 = 0;
      objc_msgSend(v3, "textForBraille:parameters:locations:", v5, v6, &v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v9;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (void)loadBrailleBundleForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BRLTSTranslationService *v9;

  v4 = a3;
  -[BRLTSTranslationService queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__BRLTSTranslationService_loadBrailleBundleForIdentifier___block_invoke;
  v7[3] = &unk_24CBF1010;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__BRLTSTranslationService_loadBrailleBundleForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  BRLTSTranslator *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1488], "brl_brailleTableBundleWithIdentifier:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queueTranslator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", v6);

  if ((v4 & 1) == 0)
  {
    v5 = -[BRLTSTranslator initWithBundle:]([BRLTSTranslator alloc], "initWithBundle:", v6);
    objc_msgSend(*(id *)(a1 + 40), "setQueueTranslator:", v5);

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BRLTSTranslator)queueTranslator
{
  return self->_queueTranslator;
}

- (void)setQueueTranslator:(id)a3
{
  objc_storeStrong((id *)&self->_queueTranslator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueTranslator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
