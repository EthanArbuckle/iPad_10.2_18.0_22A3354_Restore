@implementation SUUIOffscreenRenderOperation

- (SUUIOffscreenRenderOperation)init
{
  SUUIOffscreenRenderOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIOffscreenRenderOperation;
  v2 = -[SUUIOffscreenRenderOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIOffscreenRenderOperation.accessQueu", MEMORY[0x24BDAC9C0]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)main
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _SUUIglDeleteTextures(GLsizei, const GLuint *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SUUIOffscreenRenderOperation.m"), 39, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __36__SUUIOffscreenRenderOperation_main__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
}

- (id)createLayerBlock
{
  NSObject *accessQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__SUUIOffscreenRenderOperation_createLayerBlock__block_invoke;
  v5[3] = &unk_2511F4720;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__SUUIOffscreenRenderOperation_createLayerBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (UIImage)outputImage
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__13;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__SUUIOffscreenRenderOperation_outputImage__block_invoke;
  v5[3] = &unk_2511F4720;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (UIImage *)v3;
}

void __43__SUUIOffscreenRenderOperation_outputImage__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 264));
}

- (void)setCreateLayerBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__SUUIOffscreenRenderOperation_setCreateLayerBlock___block_invoke;
  v7[3] = &unk_2511F4C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

void __52__SUUIOffscreenRenderOperation_setCreateLayerBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 256);
  *(_QWORD *)(v3 + 256) = v2;

}

+ (void)preheatOffscreenRenderOperations
{
  NSObject *v2;

  dispatch_get_global_queue(-32768, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_34);

}

void __64__SUUIOffscreenRenderOperation_preheatOffscreenRenderOperations__block_invoke()
{
  void *v0;
  char v1;
  double v2;
  char v3;
  id v4;
  id v5;
  BOOL v6;
  unint64_t v7;
  void *v8;
  void *v9;
  CFTimeInterval v10;
  NSObject *v11;
  id v12;
  id v13;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  NSLog(CFSTR("[SUUIOffscreenRenderOperation] Starting preheat of %i rendering contexts..."), 2);
  v1 = 1;
  v2 = CACurrentMediaTime();
  do
  {
    v3 = v1;
    v12 = 0;
    v13 = 0;
    _SUUIOffscreenRenderOperationPopRenderingContext(&v13, &v12);
    v4 = v13;
    v5 = v12;
    if (v5)
      v6 = v4 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      objc_msgSend(v0, "addObject:", v4);
      objc_msgSend(v0, "addObject:", v5);
    }

    v1 = 0;
  }
  while ((v3 & 1) != 0);
  if ((unint64_t)objc_msgSend(v0, "count") >= 2)
  {
    v7 = 1;
    do
    {
      objc_msgSend(v0, "objectAtIndex:", v7 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _SUUIOffscreenRenderOperationPushRenderingContext(v8, v9);

      v7 += 2;
    }
    while (v7 < objc_msgSend(v0, "count"));
  }
  v10 = CACurrentMediaTime();
  NSLog(CFSTR("[SUUIOffscreenRenderOperation] Finished preheat of %i rendering contexts, took %f seconds."), 2, v10 - v2);
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v11, &__block_literal_global_19);

}

void __64__SUUIOffscreenRenderOperation_preheatOffscreenRenderOperations__block_invoke_2()
{
  double v0;
  CFTimeInterval v1;

  NSLog(CFSTR("[SUUIOffscreenRenderOperation] Starting preheat of dependent weak-linked libraries."));
  v0 = CACurrentMediaTime();
  IOSurfaceLibrary();
  OpenGLESLibrary();
  v1 = CACurrentMediaTime();
  NSLog(CFSTR("[SUUIOffscreenRenderOperation] Finished preheat of dependent weak-linked libraries, took %f seconds."), v1 - v0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong(&self->_createLayerBlock, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
