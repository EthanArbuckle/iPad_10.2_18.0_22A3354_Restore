@implementation QLThumbnail

- (QLThumbnail)initWithURL:(id)a3
{
  id v4;
  QLThumbnail *v5;
  QLThumbnail *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)QLThumbnail;
  v5 = -[QLThumbnail init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[QLThumbnail setUrl:](v5, "setUrl:", v4);

  return v6;
}

- (id)thumbnailCreationOperationForUseMode:(unint64_t)a3 descriptor:(id)a4 generateIfNeeded:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  QLThumbnailCreationOperation *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  v5 = a5;
  v8 = a4;
  v9 = objc_alloc_init(QLThumbnailCreationOperation);
  -[QLThumbnailCreationOperation setUseMode:](v9, "setUseMode:", a3);
  objc_msgSend(v8, "size");
  v11 = v10;
  objc_msgSend(v8, "size");
  if (v11 >= v12)
    v13 = v11;
  else
    v13 = v12;
  -[QLThumbnailCreationOperation setMaximumDimension:](v9, "setMaximumDimension:", v13);
  objc_msgSend(v8, "scaleFactor");
  v15 = v14;

  -[QLThumbnailCreationOperation setScaleFactor:](v9, "setScaleFactor:", v15);
  -[QLThumbnail url](self, "url");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailCreationOperation setDocumentURL:](v9, "setDocumentURL:", v16);

  -[QLThumbnailCreationOperation setGenerateIfNeeded:](v9, "setGenerateIfNeeded:", v5);
  return v9;
}

- (id)thumbnailCreationOperationForUseMode:(unint64_t)a3 descriptor:(id)a4
{
  return -[QLThumbnail thumbnailCreationOperationForUseMode:descriptor:generateIfNeeded:](self, "thumbnailCreationOperationForUseMode:descriptor:generateIfNeeded:", a3, a4, 0);
}

+ (id)sharedQueue
{
  if (sharedQueue_once != -1)
    dispatch_once(&sharedQueue_once, &__block_literal_global_100);
  return (id)sharedQueue_queue;
}

uint64_t __26__QLThumbnail_sharedQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v1 = (void *)sharedQueue_queue;
  sharedQueue_queue = (uint64_t)v0;

  objc_msgSend((id)sharedQueue_queue, "setName:", CFSTR("QLThumbnail"));
  return objc_msgSend((id)sharedQueue_queue, "setMaxConcurrentOperationCount:", 4);
}

+ (id)defaultDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  +[QLThumbnailDescriptor descriptorWithSize:scaleFactor:](QLThumbnailDescriptor, "descriptorWithSize:scaleFactor:", 225.0, 225.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)imageForUseMode:(unint64_t)a3 descriptor:(id)a4 generateIfNeeded:(BOOL)a5 contentRect:(CGRect *)a6 error:(id *)a7
{
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;

  -[QLThumbnail thumbnailCreationOperationForUseMode:descriptor:generateIfNeeded:](self, "thumbnailCreationOperationForUseMode:descriptor:generateIfNeeded:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sharedQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v9);
  objc_msgSend(v9, "waitUntilFinished");
  if (a6)
  {
    objc_msgSend(v9, "contentRect");
    a6->origin.x = v11;
    a6->origin.y = v12;
    a6->size.width = v13;
    a6->size.height = v14;
  }
  if (a7)
  {
    objc_msgSend(v9, "error");
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)provideImages:(id)a3 error:(id *)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  char v25;
  NSObject **v26;
  NSObject *v27;
  NSURL *url;
  const char *v29;
  NSObject *v30;
  os_log_type_t v31;
  NSURL *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  NSURL *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a3;
  objc_msgSend((id)objc_opt_class(), "defaultDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v35;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v16, "size", (_QWORD)v34);
        v18 = v17;
        objc_msgSend(v16, "size");
        if (v18 < v19)
          v18 = v19;
        if (v18 > v14)
        {
          v20 = v16;

          v14 = v18;
          v12 = v20;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  v21 = (void *)MEMORY[0x24BDE5EE8];
  v22 = objc_retainAutorelease(v12);
  v23 = objc_msgSend(v22, "CGImage");
  -[QLThumbnail url](self, "url");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v21, "associateImage:metadata:automaticallyGenerated:withURL:error:", v23, 0, 0, v24, a4);

  v26 = (NSObject **)MEMORY[0x24BE7BF48];
  v27 = *MEMORY[0x24BE7BF48];
  if ((v25 & 1) != 0)
  {
    if (!v27)
    {
      QLSInitLogging();
      v27 = *v26;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      url = self->_url;
      *(_DWORD *)buf = 138412290;
      v39 = url;
      v29 = "Saved thumbnail in additions for %@ #Thumbnail";
      v30 = v27;
      v31 = OS_LOG_TYPE_DEFAULT;
LABEL_26:
      _os_log_impl(&dword_20D4F5000, v30, v31, v29, buf, 0xCu);
    }
  }
  else
  {
    if (!v27)
    {
      QLSInitLogging();
      v27 = *v26;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v32 = (NSURL *)*a4;
      else
        v32 = 0;
      *(_DWORD *)buf = 138412290;
      v39 = v32;
      v29 = "Could not save thumbnail in additions: %@ #Thumbnail";
      v30 = v27;
      v31 = OS_LOG_TYPE_ERROR;
      goto LABEL_26;
    }
  }

  return v25;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
