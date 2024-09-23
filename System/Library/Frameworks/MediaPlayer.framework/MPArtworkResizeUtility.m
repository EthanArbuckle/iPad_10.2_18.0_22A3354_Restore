@implementation MPArtworkResizeUtility

- (MPArtworkResizeUtility)initWithQualityOfService:(int64_t)a3
{
  MPArtworkResizeUtility *v4;
  MPArtworkResizeUtility *v5;
  dispatch_qos_class_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MPArtworkResizeUtility;
  v4 = -[MPArtworkResizeUtility init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    -[MPArtworkResizeUtility setQualityOfService:](v4, "setQualityOfService:", a3);
    if (a3 <= 16)
    {
      if (a3 == -1)
      {
        v6 = QOS_CLASS_DEFAULT;
        goto LABEL_14;
      }
      if (a3 == 9)
      {
        v6 = QOS_CLASS_BACKGROUND;
        goto LABEL_14;
      }
    }
    else
    {
      switch(a3)
      {
        case 17:
          v6 = QOS_CLASS_UTILITY;
          goto LABEL_14;
        case 33:
          v6 = QOS_CLASS_USER_INTERACTIVE;
          goto LABEL_14;
        case 25:
          v6 = QOS_CLASS_USER_INITIATED;
LABEL_14:
          dispatch_queue_attr_make_with_qos_class(0, v6, 0);
          v7 = objc_claimAutoreleasedReturnValue();
          v8 = dispatch_queue_create("com.apple.mediaplayer.artworkservice.resizing.queue", v7);
          -[MPArtworkResizeUtility setArtworkResizingAccessQueue:](v5, "setArtworkResizingAccessQueue:", v8);

          v9 = objc_alloc_init(MEMORY[0x1E0CB3828]);
          -[MPArtworkResizeUtility setArtworkResizingOperationQueue:](v5, "setArtworkResizingOperationQueue:", v9);

          -[MPArtworkResizeUtility artworkResizingOperationQueue](v5, "artworkResizingOperationQueue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setQualityOfService:", a3);

          -[MPArtworkResizeUtility artworkResizingOperationQueue](v5, "artworkResizingOperationQueue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setName:", CFSTR("com.apple.mediaplayer.artworkservice.resizing.OperationQueue"));

          -[MPArtworkResizeUtility artworkResizingOperationQueue](v5, "artworkResizingOperationQueue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setMaxConcurrentOperationCount:", 15);

          objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPArtworkResizeUtility setArtworkResizingOperations:](v5, "setArtworkResizingOperations:", v13);

          return v5;
      }
    }
    v6 = QOS_CLASS_UNSPECIFIED;
    goto LABEL_14;
  }
  return v5;
}

- (NSOperationQueue)artworkResizingOperationQueue
{
  return self->_artworkResizingOperationQueue;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setArtworkResizingOperations:(id)a3
{
  objc_storeStrong((id *)&self->_artworkResizingOperations, a3);
}

- (void)setArtworkResizingOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_artworkResizingOperationQueue, a3);
}

- (void)setArtworkResizingAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_artworkResizingAccessQueue, a3);
}

- (MPArtworkResizeUtility)init
{
  return -[MPArtworkResizeUtility initWithQualityOfService:](self, "initWithQualityOfService:", -1);
}

- (id)resizeImage:(id)a3 scaledFittingSize:(CGSize)a4 useExactFittingSizeAsDestinationSize:(BOOL)a5 saveToDestinationURL:(id)a6 completionHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  CGFloat v32;
  CGFloat v33;
  BOOL v34;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = v14;
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MPArtworkResizeUtility artworkResizingAccessQueue](self, "artworkResizingAccessQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke;
  v27[3] = &unk_1E3154110;
  v27[4] = self;
  v20 = v17;
  v28 = v20;
  v29 = v13;
  v32 = width;
  v33 = height;
  v34 = a5;
  v30 = v16;
  v31 = v15;
  v21 = v15;
  v22 = v16;
  v23 = v13;
  dispatch_async(v19, v27);

  v24 = v31;
  v25 = v20;

  return v25;
}

- (void)cancelResizeImage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MPArtworkResizeUtility artworkResizingAccessQueue](self, "artworkResizingAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__MPArtworkResizeUtility_cancelResizeImage___block_invoke;
  v7[3] = &unk_1E31635F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)artworkResizingAccessQueue
{
  return self->_artworkResizingAccessQueue;
}

- (NSMapTable)artworkResizingOperations
{
  return self->_artworkResizingOperations;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkResizingOperations, 0);
  objc_storeStrong((id *)&self->_artworkResizingOperationQueue, 0);
  objc_storeStrong((id *)&self->_artworkResizingAccessQueue, 0);
}

void __44__MPArtworkResizeUtility_cancelResizeImage___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "artworkResizingOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "cancel");
}

void __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  MPArtworkResizeOperation *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  MPArtworkResizeOperation *v13;
  _QWORD block[4];
  MPArtworkResizeOperation *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "artworkResizingOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (MPArtworkResizeOperation *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  if (!v3)
  {
    v3 = -[MPArtworkResizeOperation initWithImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:destinationURL:]([MPArtworkResizeOperation alloc], "initWithImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:destinationURL:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80));
    -[MPArtworkResizeOperation setQualityOfService:](v3, "setQualityOfService:", objc_msgSend(*(id *)(a1 + 32), "qualityOfService"));
    objc_msgSend(*(id *)(a1 + 32), "artworkResizingOperations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

    -[MPArtworkResizeOperation operationGroup](v3, "operationGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke_2;
    v17[3] = &unk_1E3163698;
    v7 = *(void **)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v7;
    v19 = v6;
    v8 = v6;
    -[MPArtworkResizeOperation setCompletionBlock:](v3, "setCompletionBlock:", v17);
    dispatch_group_enter(v8);
    objc_msgSend(*(id *)(a1 + 32), "artworkResizingOperationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOperation:", v3);

  }
  -[MPArtworkResizeOperation operationGroup](v3, "operationGroup");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "artworkResizingAccessQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke_4;
  block[3] = &unk_1E3162560;
  v12 = *(id *)(a1 + 64);
  v15 = v3;
  v16 = v12;
  v13 = v3;
  dispatch_group_notify(v10, v11, block);

}

void __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "artworkResizingAccessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke_3;
  block[3] = &unk_1E3163698;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "resizedImage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v4, v3);

  }
}

void __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "artworkResizingOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

@end
