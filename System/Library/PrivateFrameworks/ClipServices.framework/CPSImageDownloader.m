@implementation CPSImageDownloader

- (CPSImageDownloader)init
{
  CPSImageDownloader *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  NSMutableDictionary *requests;
  CPSImageDownloader *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CPSImageDownloader;
  v2 = -[CPSImageDownloader init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.ClipServices.%@.%p"), objc_opt_class(), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v8;

    v10 = v2;
  }

  return v2;
}

- (void)downloadImageWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CPSImageDownloader_downloadImageWithURL_completionHandler___block_invoke;
  block[3] = &unk_24C3B9350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __61__CPSImageDownloader_downloadImageWithURL_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_downloadImageWithURL:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_downloadImageWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x24BDAC760];
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke;
      v25[3] = &unk_24C3B9860;
      v26 = v8;
      v11 = v9;
      v27 = v11;
      v12 = (void *)MEMORY[0x20BD30A54](v25);
      v13 = (void *)MEMORY[0x20BD30A54]();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requests, "setObject:forKeyedSubscript:", v13, v6);

      if (!v11)
      {
        v23[0] = v10;
        v23[1] = 3221225472;
        v23[2] = __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke_2;
        v23[3] = &unk_24C3B98B0;
        v23[4] = self;
        v14 = v6;
        v24 = v14;
        v15 = (void *)MEMORY[0x20BD30A54](v23);
        v16 = (void *)MEMORY[0x24BDD1850];
        objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sessionWithConfiguration:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v21[0] = v10;
        v21[1] = 3221225472;
        v21[2] = __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke_4;
        v21[3] = &unk_24C3B98D8;
        v22 = v15;
        v19 = v15;
        objc_msgSend(v18, "dataTaskWithURL:completionHandler:", v14, v21);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "resume");

      }
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
  }

}

void __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

void __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke_3;
  v12[3] = &unk_24C3B9888;
  v12[4] = v7;
  v13 = v8;
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

void __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke_3(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
    (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, a1[6], a1[7]);
  objc_msgSend(*(id *)(a1[4] + 16), "removeObjectForKey:", a1[5]);

}

uint64_t __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
