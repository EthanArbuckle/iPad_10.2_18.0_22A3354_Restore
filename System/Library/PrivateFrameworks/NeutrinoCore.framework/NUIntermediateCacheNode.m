@implementation NUIntermediateCacheNode

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  -[NUCacheNode inputNode](self, "inputNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v9, "disableIntermediateCaching"))
      goto LABEL_7;
    if (objc_msgSend(v9, "auxiliaryImageType") != 1)
      goto LABEL_7;
    v12 = objc_msgSend(v9, "scale");
    if (!NUScaleEqual(v12, v13, NUScaleOne, *((uint64_t *)&NUScaleOne + 1)))
      goto LABEL_6;
    -[NURenderNode settings](self, "settings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("keepCacheWhenAtOneToOne"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if ((v16 & 1) == 0)
    {
LABEL_7:
      v18 = v11;
    }
    else
    {
LABEL_6:
      v17 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInput:settings:subsampleFactor:", v11, MEMORY[0x1E0C9AA70], 0);
      +[NURenderNode nodeFromCache:cache:](NURenderNode, "nodeFromCache:cache:", v17, v8);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setEvaluatedForMode:", objc_msgSend(v9, "evaluationMode"));
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)evaluateRenderDependenciesWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[NUCacheNode inputNode](self, "inputNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "evaluateRenderDependenciesWithRequest:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_evaluateImage:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NUCacheNode inputNode](self, "inputNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputImage:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "imageByInsertingIntermediate:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_evaluateVideo:(id *)a3
{
  void *v4;
  void *v5;

  -[NUCacheNode inputNode](self, "inputNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputVideo:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  void *v4;
  void *v5;

  -[NUCacheNode inputNode](self, "inputNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputVideoComposition:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
