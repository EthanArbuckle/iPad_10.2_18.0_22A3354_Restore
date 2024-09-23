@implementation SUUIArtworkItemProvider

- (SUUIArtworkItemProvider)initWithURL:(id)a3 usingResourceLoader:(id)a4
{
  id v7;
  id v8;
  SUUIArtworkItemProvider *v9;
  SUUIArtworkItemProvider *v10;
  uint64_t v11;
  NSProgress *progress;
  uint64_t v13;
  NSMutableArray *completionHandlers;
  SUUIArtworkRequest *v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SUUIArtworkItemProvider;
  v9 = -[SUUIArtworkItemProvider init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_resourceLoader, a4);
    objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 1);
    v11 = objc_claimAutoreleasedReturnValue();
    progress = v10->_progress;
    v10->_progress = (NSProgress *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    completionHandlers = v10->_completionHandlers;
    v10->_completionHandlers = (NSMutableArray *)v13;

    -[SUUIArtworkItemProvider registerDataRepresentationForTypeIdentifier:visibility:loadHandler:](v10, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", *MEMORY[0x24BDC17C0], 3, &__block_literal_global_30);
    v15 = objc_alloc_init(SUUIArtworkRequest);
    -[SUUIArtworkRequest setURL:](v15, "setURL:", v10->_url);
    +[SSVURLDataConsumer consumer](SUUIImageDataConsumer, "consumer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIArtworkRequest setDataConsumer:](v15, "setDataConsumer:", v16);

    -[SUUIArtworkRequest setDelegate:](v15, "setDelegate:", v10);
    -[SUUIResourceLoader loadResourceWithRequest:reason:](v10->_resourceLoader, "loadResourceWithRequest:reason:", v15, 1);

  }
  return v10;
}

uint64_t __59__SUUIArtworkItemProvider_initWithURL_usingResourceLoader___block_invoke()
{
  return 0;
}

- (id)loadDataRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, NSData *, _QWORD);
  NSProgress *v8;
  NSMutableArray *completionHandlers;
  void *v10;
  NSProgress *v11;
  objc_super v13;

  v6 = a3;
  v7 = (void (**)(id, NSData *, _QWORD))a4;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDC17C0]) & 1) != 0)
  {
    if (-[NSProgress isFinished](self->_progress, "isFinished"))
    {
      v7[2](v7, self->_imageData, 0);
    }
    else
    {
      completionHandlers = self->_completionHandlers;
      v10 = _Block_copy(v7);
      -[NSMutableArray addObject:](completionHandlers, "addObject:", v10);

    }
    v8 = self->_progress;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIArtworkItemProvider;
    -[SUUIArtworkItemProvider loadDataRepresentationForTypeIdentifier:completionHandler:](&v13, sel_loadDataRepresentationForTypeIdentifier_completionHandler_, v6, v7);
    v8 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;

  return v11;
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  UIImage *v7;
  NSData *v8;
  NSData *imageData;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (UIImage *)a4;
  -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", 1);
  UIImageJPEGRepresentation(v7, 1.0);
  v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  imageData = self->_imageData;
  self->_imageData = v8;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_completionHandlers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14));
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  -[NSMutableArray removeAllObjects](self->_completionHandlers, "removeAllObjects", (_QWORD)v15);
  objc_msgSend(v6, "setDelegate:", 0);

}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (SUUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoader, a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
