@implementation JFXEffectsPreviewGenerator

- (JFXEffectsPreviewGenerator)init
{
  void *v3;
  void *v4;
  JFXEffectsPreviewGenerator *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BE79640];
  objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[JFXEffectsPreviewGenerator initWithRendererOptions:](self, "initWithRendererOptions:", v4);
  return v5;
}

- (JFXEffectsPreviewGenerator)initWithRendererOptions:(id)a3
{
  id v4;
  JFXEffectsPreviewGenerator *v5;
  uint64_t v6;
  PVRenderer *renderer;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *renderCompleteQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)JFXEffectsPreviewGenerator;
  v5 = -[JFXEffectsPreviewGenerator init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE790C0]), "initWithOptions:", v4);
    renderer = v5->_renderer;
    v5->_renderer = (PVRenderer *)v6;

    -[PVRenderer trackStats:](v5->_renderer, "trackStats:", 1);
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.clips.previewRenderCompleteQueue", v8);
    renderCompleteQueue = v5->_renderCompleteQueue;
    v5->_renderCompleteQueue = (OS_dispatch_queue *)v9;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PVRenderer printAndClearStats:](self->_renderer, "printAndClearStats:", 1);
  v3.receiver = self;
  v3.super_class = (Class)JFXEffectsPreviewGenerator;
  -[JFXEffectsPreviewGenerator dealloc](&v3, sel_dealloc);
}

- (void)generatePreviewRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  JFXEffectsPreviewRequestHandler *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[JFXEffectsPreviewRequestHandler initWithRequest:]([JFXEffectsPreviewRequestHandler alloc], "initWithRequest:", v7);

  -[JFXEffectsPreviewGenerator _renderJob:completionHandler:](self, "_renderJob:completionHandler:", v8, v6);
}

- (void)_renderJob:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PVRenderer *renderer;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[PVRenderer compositingContext](self->_renderer, "compositingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outputColorSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "buildPVRenderRequestWithOutputColorSpace:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  renderer = self->_renderer;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__JFXEffectsPreviewGenerator__renderJob_completionHandler___block_invoke;
  v14[3] = &unk_24EE5BB48;
  v15 = v6;
  v16 = v7;
  v14[4] = self;
  v12 = v6;
  v13 = v7;
  -[PVRenderer startRenderRequest:completionHandler:](renderer, "startRenderRequest:completionHandler:", v10, v14);

}

void __59__JFXEffectsPreviewGenerator__renderJob_completionHandler___block_invoke(id *a1, void *a2, uint64_t a3, char a4)
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  char v13;

  v6 = a2;
  objc_msgSend(a1[4], "renderCompleteQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__JFXEffectsPreviewGenerator__renderJob_completionHandler___block_invoke_2;
  v9[3] = &unk_24EE5BB20;
  v10 = v6;
  v13 = a4;
  v12 = a1[6];
  v11 = a1[5];
  v8 = v6;
  dispatch_async(v7, v9);

}

void __59__JFXEffectsPreviewGenerator__renderJob_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void (*v4)(void);
  void *v5;
  uint64_t v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  if (v2 && objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "buildCallbackMap:", *(_QWORD *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    v7 = (id)v3;
  }
  else
  {
    if (*(_BYTE *)(a1 + 56))
      v5 = &unk_24EE9C670;
    else
      v5 = &unk_24EE9C698;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.clips.JFXEffectsPreviewGenerator"), 199, v5);
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    v7 = (id)v6;
  }
  v4();

}

- (void)setName:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_name, a3);
  v5 = a3;
  -[PVRenderer setName:](self->_renderer, "setName:", self->_name);

}

- (void)trackStats:(BOOL)a3
{
  -[PVRenderer trackStats:](self->_renderer, "trackStats:", a3);
}

- (void)perfLog
{
  -[PVRenderer printAndClearStats:](self->_renderer, "printAndClearStats:", 1);
}

- (void)clearCaches
{
  -[PVRenderer cleanupMemoryCaches](self->_renderer, "cleanupMemoryCaches");
}

- (id)colorSpace
{
  void *v2;
  void *v3;

  -[PVRenderer compositingContext](self->_renderer, "compositingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputColorSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (OS_dispatch_queue)renderCompleteQueue
{
  return self->_renderCompleteQueue;
}

- (void)setRenderCompleteQueue:(id)a3
{
  objc_storeStrong((id *)&self->_renderCompleteQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderCompleteQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end
