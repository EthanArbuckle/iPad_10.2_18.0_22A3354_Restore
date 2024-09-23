@implementation NURAWDemosaicNode

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v12, "scale");
  if (NUScaleCompare(v13, v14, 1, 2) <= 0)
  {
    v15 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("inputDraftMode"));

    v11 = v15;
  }
  v18.receiver = self;
  v18.super_class = (Class)NURAWDemosaicNode;
  -[NURawFilterNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v18, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, v10, v11, v12, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
