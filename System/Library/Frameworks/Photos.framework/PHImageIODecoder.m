@implementation PHImageIODecoder

- (PHImageIODecoder)init
{
  PHImageIODecoder *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *pendingRequestQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *activeRequestQueue;
  dispatch_semaphore_t v9;
  OS_dispatch_semaphore *concurrentRequestSemaphore;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PHImageIODecoder;
  v2 = -[PHImageIODecoder init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.photos.imgmgr.iodecode.pendingrequests", v3);
    pendingRequestQueue = v2->_pendingRequestQueue;
    v2->_pendingRequestQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.photos.imgmgr.iodecode.activerequests", v6);
    activeRequestQueue = v2->_activeRequestQueue;
    v2->_activeRequestQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_semaphore_create(+[PHImageIODecoder maxConcurrentDecodeCount](PHImageIODecoder, "maxConcurrentDecodeCount"));
    concurrentRequestSemaphore = v2->_concurrentRequestSemaphore;
    v2->_concurrentRequestSemaphore = (OS_dispatch_semaphore *)v9;

  }
  return v2;
}

- (id)decodeImageFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 completion:(id)a6
{
  return -[PHImageIODecoder decodeImageFromData:orFileURL:options:existingRequestHandle:completion:](self, "decodeImageFromData:orFileURL:options:existingRequestHandle:completion:", a3, a4, a5, 0, a6);
}

- (id)decodeImageFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 existingRequestHandle:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, CGImage *, CFTypeRef, _QWORD, id);
  CGImage *v17;
  id v18;
  PHImageDecoderAsyncDecodeRequestHandle *v19;
  PHImageDecoderAsyncDecodeRequestHandle *v20;
  NSObject *pendingRequestQueue;
  _QWORD block[5];
  PHImageDecoderAsyncDecodeRequestHandle *v24;
  id v25;
  id v26;
  id v27;
  void (**v28)(id, CGImage *, CFTypeRef, _QWORD, id);
  id v29;
  unsigned int v30;
  CFTypeRef v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, CGImage *, CFTypeRef, _QWORD, id))a7;
  if (objc_msgSend(v14, "waitUntilComplete"))
  {
    v31 = 0;
    v30 = 1;
    v29 = 0;
    v17 = _createDecodedImageUsingImageIOWithFileUrlOrData(v14, v13, v12, objc_msgSend(v14, "maximumLongSideLength"), objc_msgSend(v14, "optimizeForDrawing"), objc_msgSend(v14, "shouldLoadGainMap"), (uint64_t *)&v31, (uint64_t)&v30, &v29);
    v18 = v29;
    v16[2](v16, v17, v31, v30, v18);
    CGImageRelease(v17);
    if (v31)
      CFRelease(v31);

    v19 = 0;
  }
  else
  {
    if (v15)
      v20 = (PHImageDecoderAsyncDecodeRequestHandle *)v15;
    else
      v20 = -[PHImageDecoderAsyncDecodeRequestHandle initWithImageIODecoder:]([PHImageDecoderAsyncDecodeRequestHandle alloc], "initWithImageIODecoder:", self);
    pendingRequestQueue = self->_pendingRequestQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__PHImageIODecoder_decodeImageFromData_orFileURL_options_existingRequestHandle_completion___block_invoke;
    block[3] = &unk_1E35D7870;
    block[4] = self;
    v19 = v20;
    v24 = v19;
    v28 = v16;
    v25 = v14;
    v26 = v13;
    v27 = v12;
    dispatch_async(pendingRequestQueue, block);

  }
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentRequestSemaphore, 0);
  objc_storeStrong((id *)&self->_activeRequestQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequestQueue, 0);
}

void __91__PHImageIODecoder_decodeImageFromData_orFileURL_options_existingRequestHandle_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__PHImageIODecoder_decodeImageFromData_orFileURL_options_existingRequestHandle_completion___block_invoke_2;
  v6[3] = &unk_1E35D7870;
  v7 = v2;
  v12 = *(id *)(a1 + 72);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v11 = v5;
  dispatch_async(v3, v6);

}

intptr_t __91__PHImageIODecoder_decodeImageFromData_orFileURL_options_existingRequestHandle_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  CGImage *v8;
  id v9;
  id v11;
  int v12;
  CFTypeRef cf;

  if (objc_msgSend(*(id *)(a1 + 32), "cancelRequested"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "shouldLoadGainMap");
    cf = 0;
    v12 = 1;
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(a1 + 48);
    v5 = *(void **)(a1 + 56);
    v6 = objc_msgSend(v3, "maximumLongSideLength");
    v7 = objc_msgSend(*(id *)(a1 + 40), "optimizeForDrawing");
    v11 = 0;
    v8 = _createDecodedImageUsingImageIOWithFileUrlOrData(v3, v4, v5, v6, v7, v2, (uint64_t *)&cf, (uint64_t)&v12, &v11);
    v9 = v11;
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    CGImageRelease(v8);
    if (cf)
      CFRelease(cf);

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 64) + 24));
}

+ (id)sharedDecoder
{
  if (sharedDecoder_s_onceToken != -1)
    dispatch_once(&sharedDecoder_s_onceToken, &__block_literal_global_7016);
  return (id)sharedDecoder_s_shared;
}

+ (int64_t)maxConcurrentDecodeCount
{
  return sMaxConcurrentDecodeCount;
}

+ (void)setMaxConcurrentDecodeCount:(int64_t)a3
{
  int64_t v3;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  sMaxConcurrentDecodeCount = v3;
}

void __33__PHImageIODecoder_sharedDecoder__block_invoke()
{
  PHImageIODecoder *v0;
  void *v1;

  v0 = objc_alloc_init(PHImageIODecoder);
  v1 = (void *)sharedDecoder_s_shared;
  sharedDecoder_s_shared = (uint64_t)v0;

}

@end
