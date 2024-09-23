@implementation AXMIconVisionEngine

- (AXMIconVisionEngine)initWithIdentifier:(id)a3
{
  AXMIconVisionEngine *v3;
  AXMImageNode *v4;
  AXMIconClassDetectorNode *v5;
  AXMBrailleEdgesDetectorNode *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXMIconVisionEngine;
  v3 = -[AXMVisionEngine initWithIdentifier:](&v8, sel_initWithIdentifier_, a3);
  if (v3)
  {
    if (-[AXMVisionEngine canAddSourceNodeClass:](v3, "canAddSourceNodeClass:", objc_opt_class()))
    {
      v4 = -[AXMVisionEngineNode initWithIdentifier:]([AXMImageNode alloc], "initWithIdentifier:", CFSTR("image"));
      -[AXMVisionEngine addSourceNode:](v3, "addSourceNode:", v4);
      -[AXMIconVisionEngine setImageNode:](v3, "setImageNode:", v4);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v5 = -[AXMMobileAssetEvaluationNode initWithIdentifier:]([AXMIconClassDetectorNode alloc], "initWithIdentifier:", CFSTR("iconClass"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v5);
      -[AXMIconVisionEngine setIconClassDetector:](v3, "setIconClassDetector:", v5);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v6 = -[AXMVisionEngineNode initWithIdentifier:]([AXMBrailleEdgesDetectorNode alloc], "initWithIdentifier:", CFSTR("brailleEdges"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v6);
      -[AXMIconVisionEngine setBrailleEdgeDetector:](v3, "setBrailleEdgeDetector:", v6);

    }
  }
  return v3;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__AXMIconVisionEngine_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance__instance;
}

void __37__AXMIconVisionEngine_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithIdentifier:", CFSTR("SharedIconVision"));
  v2 = (void *)sharedInstance__instance;
  sharedInstance__instance = v1;

}

- (id)classifyImages:(id)a3 withTimeout:(double)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  AXMVisionAnalysisOptions *v12;
  void *v13;
  void *v14;
  dispatch_time_t v15;
  id v16;
  id v18;
  id obj;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  uint64_t *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[4];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__2;
  v32 = __Block_byref_object_dispose__2;
  v33 = 0;
  v18 = a3;
  if (objc_msgSend(v18, "count"))
  {
    v6 = dispatch_group_create();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v18;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithData:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_alloc_init(AXMVisionAnalysisOptions);
          -[AXMVisionAnalysisOptions setDetectIconClass:](v12, "setDetectIconClass:", 1);
          -[AXMIconVisionEngine imageNode](self, "imageNode");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setShouldProcessRemotely:", 1);

          dispatch_group_enter(v6);
          -[AXMIconVisionEngine imageNode](self, "imageNode");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __50__AXMIconVisionEngine_classifyImages_withTimeout___block_invoke;
          v20[3] = &unk_1E625D2B0;
          v22 = v34;
          v23 = &v28;
          v21 = v6;
          objc_msgSend(v14, "triggerWithImage:options:cacheKey:resultHandler:", v11, v12, v10, v20);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
      }
      while (v7);
    }

    v15 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    dispatch_group_wait(v6, v15);

  }
  v16 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(v34, 8);
  return v16;
}

void __50__AXMIconVisionEngine_classifyImages_withTimeout___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a2, "features", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(v8, "confidence");
          v11 = v10;
          v12 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

          if (v11 > v12)
          {
            objc_msgSend(v8, "value");
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v15 = *(void **)(v14 + 40);
            *(_QWORD *)(v14 + 40) = v13;

            objc_msgSend(v8, "confidence");
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v16;
          }
        }
        else
        {

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (AXMImageNode)imageNode
{
  return (AXMImageNode *)objc_loadWeakRetained((id *)&self->_imageNode);
}

- (void)setImageNode:(id)a3
{
  objc_storeWeak((id *)&self->_imageNode, a3);
}

- (AXMIconClassDetectorNode)iconClassDetector
{
  return (AXMIconClassDetectorNode *)objc_loadWeakRetained((id *)&self->_iconClassDetector);
}

- (void)setIconClassDetector:(id)a3
{
  objc_storeWeak((id *)&self->_iconClassDetector, a3);
}

- (AXMBrailleEdgesDetectorNode)brailleEdgeDetector
{
  return (AXMBrailleEdgesDetectorNode *)objc_loadWeakRetained((id *)&self->_brailleEdgeDetector);
}

- (void)setBrailleEdgeDetector:(id)a3
{
  objc_storeWeak((id *)&self->_brailleEdgeDetector, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_brailleEdgeDetector);
  objc_destroyWeak((id *)&self->_iconClassDetector);
  objc_destroyWeak((id *)&self->_imageNode);
}

@end
