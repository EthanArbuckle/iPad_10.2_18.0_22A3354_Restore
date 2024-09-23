@implementation QLThumbnailCreationOperation

- (void)setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    -[QLThumbnailCreationOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = a3;
    -[QLThumbnailCreationOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
}

- (void)setExecuting:(BOOL)a3
{
  if (self->_executing != a3)
  {
    -[QLThumbnailCreationOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = a3;
    -[QLThumbnailCreationOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  }
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)start
{
  -[QLThumbnailCreationOperation setExecuting:](self, "setExecuting:", 1);
  -[QLThumbnailCreationOperation main](self, "main");
}

- (void)_finish
{
  -[QLThumbnailCreationOperation _finishWithError:](self, "_finishWithError:", 0);
}

- (void)_finishWithError:(id)a3
{
  -[QLThumbnailCreationOperation setError:](self, "setError:", a3);
  -[QLThumbnailCreationOperation setExecuting:](self, "setExecuting:", 0);
  -[QLThumbnailCreationOperation setFinished:](self, "setFinished:", 1);
}

- (BOOL)_finishIfCancelled
{
  int v3;
  void *v4;

  v3 = -[QLThumbnailCreationOperation isCancelled](self, "isCancelled");
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailCreationOperation _finishWithError:](self, "_finishWithError:", v4);

  }
  return v3;
}

- (void)main
{
  QLThumbnailCreationOperation *v2;
  void *v3;
  void *v4;
  NSObject **v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSOperationQueue *v11;
  NSOperationQueue *operationQueue;
  void *v13;
  NSOperationQueue *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (!-[QLThumbnailCreationOperation _finishIfCancelled](v2, "_finishIfCancelled"))
  {
    -[QLThumbnailCreationOperation documentURL](v2, "documentURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)_CFURLPromiseCopyPhysicalURL();

    v5 = (NSObject **)MEMORY[0x24BE7BF48];
    v6 = *MEMORY[0x24BE7BF48];
    if (v4)
    {
      if (!v6)
      {
        QLSInitLogging();
        v6 = *v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_DEFAULT, "_CFURLPromiseCopyPhysicalURL returned %@ #Thumbnail", buf, 0xCu);
      }
      -[QLThumbnailCreationOperation documentURL](v2, "documentURL");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[QLThumbnailCreationOperation retrieveThumbnailForTaggedLogicalURL:](v2, "retrieveThumbnailForTaggedLogicalURL:", v7);
    }
    else
    {
      if (!v6)
      {
        QLSInitLogging();
        v6 = *v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_DEFAULT, "Untagged logical URL, coordinating to get the physical URL #Thumbnail", buf, 2u);
      }
      v7 = objc_alloc_init(MEMORY[0x24BDD1570]);
      v8 = (void *)MEMORY[0x24BDD1568];
      -[QLThumbnailCreationOperation documentURL](v2, "documentURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "readingIntentWithURL:options:", v9, 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
      operationQueue = v2->_operationQueue;
      v2->_operationQueue = v11;

      -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
      v18 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v2->_operationQueue;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __36__QLThumbnailCreationOperation_main__block_invoke;
      v16[3] = &unk_24C725848;
      v16[4] = v2;
      v15 = v10;
      v17 = v15;
      objc_msgSend(v7, "coordinateAccessWithIntents:queue:byAccessor:", v13, v14, v16);

    }
  }
  objc_sync_exit(v2);

}

void __36__QLThumbnailCreationOperation_main__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "URL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "retrieveThumbnailForTaggedLogicalURL:", v2);

}

- (void)updateLastHitDateOfAddition:(id)a3 onPhysicalURL:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (updateLastHitDateOfAddition_onPhysicalURL__once != -1)
    dispatch_once(&updateLastHitDateOfAddition_onPhysicalURL__once, &__block_literal_global_6);
  v7 = updateLastHitDateOfAddition_onPhysicalURL__hitAdditionsQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__QLThumbnailCreationOperation_updateLastHitDateOfAddition_onPhysicalURL___block_invoke_2;
  v10[3] = &unk_24C724778;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __74__QLThumbnailCreationOperation_updateLastHitDateOfAddition_onPhysicalURL___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.quicklook.thumbnails-maintenance", v2);
  v1 = (void *)updateLastHitDateOfAddition_onPhysicalURL__hitAdditionsQueue;
  updateLastHitDateOfAddition_onPhysicalURL__hitAdditionsQueue = (uint64_t)v0;

}

void __74__QLThumbnailCreationOperation_updateLastHitDateOfAddition_onPhysicalURL___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDE5F00], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateLastHitDateOfAddition:onPhysicalURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)retrieveThumbnailForTaggedLogicalURL:(id)a3
{
  id v4;
  QLThumbnailCreationOperation *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject **v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _BYTE buf[32];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[QLThumbnailCreationOperation _finishIfCancelled](v5, "_finishIfCancelled"))
  {
    v6 = 1;
    goto LABEL_35;
  }
  v7 = _CFURLPromiseCopyPhysicalURL();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v4;
  v10 = v9;

  v11 = (NSObject **)MEMORY[0x24BE7BF48];
  v12 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_20D4F5000, v12, OS_LOG_TYPE_DEFAULT, "Got logical URL %@, physicalURL %@ #Thumbnail", buf, 0x16u);
  }
  v31 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE5EE8]), "initWithAdditionsPresentOnURL:error:", v10, &v31);
  v14 = v31;
  v15 = v14;
  if (v13)
  {
    -[QLThumbnailCreationOperation updateLastHitDateOfAddition:onPhysicalURL:](v5, "updateLastHitDateOfAddition:onPhysicalURL:", v13, v10);
  }
  else
  {
    if (v14)
    {
      v23 = *v11;
      if (!*v11)
      {
        QLSInitLogging();
        v23 = *v11;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v15;
        _os_log_impl(&dword_20D4F5000, v23, OS_LOG_TYPE_ERROR, "Caught error while retrieving thumbnail: %@ #Thumbnail", buf, 0xCu);
      }
    }
    v24 = *v11;
    if (!*v11)
    {
      QLSInitLogging();
      v24 = *v11;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_20D4F5000, v24, OS_LOG_TYPE_DEFAULT, "No thumbnail found for %@, trying to download/generate one #Thumbnail", buf, 0xCu);
    }
    if (v5->_generateIfNeeded)
    {
      v25 = _CFURLIsItemPromiseAtURL();
      v26 = (void *)MEMORY[0x24BDE5EE8];
      if (!v25)
      {
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __69__QLThumbnailCreationOperation_retrieveThumbnailForTaggedLogicalURL___block_invoke;
        v29[3] = &unk_24C725848;
        v29[4] = v5;
        v30 = v4;
        objc_msgSend(v26, "generateThumbnailIfPossibleAtLogicalURL:completionHandler:", v30, v29);

LABEL_33:
        v6 = 1;
        goto LABEL_34;
      }
      objc_msgSend(MEMORY[0x24BDE5EE8], "downloadOrGenerateThumbnailAtURL:", v4);
    }
  }
  if (-[QLThumbnailCreationOperation _finishIfCancelled](v5, "_finishIfCancelled"))
    goto LABEL_33;
  v16 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  *(_OWORD *)buf = *MEMORY[0x24BDBF090];
  *(_OWORD *)&buf[16] = v16;
  -[QLThumbnailCreationOperation maximumDimension](v5, "maximumDimension");
  v18 = v17;
  -[QLThumbnailCreationOperation scaleFactor](v5, "scaleFactor");
  v20 = objc_msgSend(v13, "thumbnailWithMaximumDimension:contentRect:properties:", buf, 0, v18 * v19);
  if (-[QLThumbnailCreationOperation _finishIfCancelled](v5, "_finishIfCancelled"))
    goto LABEL_33;
  if (!v20)
  {
    if (v15)
    {
      -[QLThumbnailCreationOperation setError:](v5, "setError:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDE5F40], 102, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLThumbnailCreationOperation setError:](v5, "setError:", v27);

    }
    -[QLThumbnailCreationOperation error](v5, "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailCreationOperation _finishWithError:](v5, "_finishWithError:", v28);

    goto LABEL_33;
  }
  v21 = (void *)MEMORY[0x24BEBD640];
  -[QLThumbnailCreationOperation scaleFactor](v5, "scaleFactor");
  objc_msgSend(v21, "imageWithCGImage:scale:orientation:", v20, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailCreationOperation setImage:](v5, "setImage:", v22);

  -[QLThumbnailCreationOperation setContentRect:](v5, "setContentRect:", *(double *)buf, *(double *)&buf[8], *(_OWORD *)&buf[16]);
  v6 = 0;
LABEL_34:

LABEL_35:
  objc_sync_exit(v5);

  if (!v6)
    -[QLThumbnailCreationOperation _finish](v5, "_finish");

}

void __69__QLThumbnailCreationOperation_retrieveThumbnailForTaggedLogicalURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "retrieveThumbnailForTaggedLogicalURL:", *(_QWORD *)(a1 + 40));
    goto LABEL_8;
  }
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDE5F40];
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE5F40]))
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(v9, "code");

  if (v6 != 106)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v9);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDE5EE8], "downloadOrGenerateThumbnailAtURL:", *(_QWORD *)(a1 + 40));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v5, 102, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_finishWithError:", v8);

LABEL_8:
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (CGRect)contentRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_contentRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setContentRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_contentRect, &v3, 32, 1, 0);
}

- (UIImage)image
{
  return (UIImage *)objc_getProperty(self, a2, 272, 1);
}

- (void)setImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 280, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSURL)documentURL
{
  return (NSURL *)objc_getProperty(self, a2, 288, 1);
}

- (void)setDocumentURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (double)maximumDimension
{
  return self->_maximumDimension;
}

- (void)setMaximumDimension:(double)a3
{
  self->_maximumDimension = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (unint64_t)useMode
{
  return self->_useMode;
}

- (void)setUseMode:(unint64_t)a3
{
  self->_useMode = a3;
}

- (BOOL)generateIfNeeded
{
  return self->_generateIfNeeded;
}

- (void)setGenerateIfNeeded:(BOOL)a3
{
  self->_generateIfNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentURL, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
