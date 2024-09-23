@implementation ARUIRingsAlphaReductionState

- (id)name
{
  return CFSTR("ARUIRingsAlphaReductionState");
}

- (id)renderPipelineDescriptorFromLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("vertex_shader"));
  objc_msgSend(v5, "setVertexFunction:", v6);

  v7 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("fragment_alpha_reduction"));
  objc_msgSend(v5, "setFragmentFunction:", v7);

  objc_msgSend(v5, "colorAttachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPixelFormat:", 80);

  objc_msgSend(v5, "configureForAlphaReductionBlending");
  -[ARUIRingsAlphaReductionState name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLabel:", v10);

  return v5;
}

- (BOOL)shouldRunStateForRing:(id)a3
{
  float v3;

  objc_msgSend(a3, "opacity");
  return v3 < 1.0;
}

@end
