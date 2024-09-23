@implementation AXPhotosVisionEngine

+ (id)sharedEngine
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__AXPhotosVisionEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedEngine_onceToken != -1)
    dispatch_once(&sharedEngine_onceToken, block);
  return (id)sharedEngine_sharedVisionEngine;
}

void __36__AXPhotosVisionEngine_sharedEngine__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedEngine_sharedVisionEngine;
  sharedEngine_sharedVisionEngine = (uint64_t)v1;

}

- (AXPhotosVisionEngine)init
{
  AXPhotosVisionEngine *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXPhotosVisionEngine;
  v2 = -[AXPhotosVisionEngine init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE7F8]), "initWithIdentifier:", CFSTR("ImageTest"));
    objc_msgSend(v3, "setMaximumQueueSize:", 1000);
    objc_msgSend(v3, "setDiagnosticsEnabled:", 0);
    -[AXPhotosVisionEngine setEngine:](v2, "setEngine:", v3);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE7C8]), "initWithIdentifier:", CFSTR("imageNode"));
    objc_msgSend(v3, "addSourceNode:", v4);
    -[AXPhotosVisionEngine setImageNode:](v2, "setImageNode:", v4);
    -[AXPhotosVisionEngine engine](v2, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canAddEvaluationNodeClass:", objc_opt_class());

    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE7A8]), "initWithIdentifier:", CFSTR("face"));
      objc_msgSend(v3, "addEvaluationNode:", v7);
      -[AXPhotosVisionEngine setFaceNode:](v2, "setFaceNode:", v7);

    }
  }
  return v2;
}

- (void)analyzeImage:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  if (a3)
  {
    v7 = (objc_class *)MEMORY[0x24BDBF660];
    v8 = a3;
    v9 = (void *)objc_msgSend([v7 alloc], "initWithImage:", v8);

    objc_msgSend(MEMORY[0x24BDFE7F0], "voiceOverOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDetectText:", 0);
    objc_msgSend(v10, "setDetectFaceLandmarks:", 0);
    -[AXPhotosVisionEngine imageNode](self, "imageNode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __48__AXPhotosVisionEngine_analyzeImage_completion___block_invoke;
    v12[3] = &unk_24FF15130;
    v13 = v6;
    objc_msgSend(v11, "triggerWithImage:options:cacheKey:resultHandler:", v9, v10, 0, v12);

  }
}

uint64_t __48__AXPhotosVisionEngine_analyzeImage_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (AXMVisionEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (AXMImageNode)imageNode
{
  return self->_imageNode;
}

- (void)setImageNode:(id)a3
{
  objc_storeStrong((id *)&self->_imageNode, a3);
}

- (AXMFaceDetectorNode)faceNode
{
  return self->_faceNode;
}

- (void)setFaceNode:(id)a3
{
  objc_storeStrong((id *)&self->_faceNode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceNode, 0);
  objc_storeStrong((id *)&self->_imageNode, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

@end
