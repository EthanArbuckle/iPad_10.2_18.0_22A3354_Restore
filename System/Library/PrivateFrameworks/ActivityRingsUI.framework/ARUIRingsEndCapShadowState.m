@implementation ARUIRingsEndCapShadowState

- (id)name
{
  return CFSTR("ARUIRingsEndCapShadowState");
}

- (void)didInitialize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARUIRingsEndCapShadowState;
  -[ARUIRingsRenderState didInitialize](&v3, sel_didInitialize);
  -[ARUIRingsRenderState setRenderArea:](self, "setRenderArea:", 1);
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

  v7 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("fragment_capshadow"));
  objc_msgSend(v5, "setFragmentFunction:", v7);

  objc_msgSend(v5, "colorAttachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPixelFormat:", 80);

  objc_msgSend(v5, "configureForSourceOverBlending");
  -[ARUIRingsEndCapShadowState name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLabel:", v10);

  return v5;
}

- (BOOL)shouldRunStateForRing:(id)a3
{
  id v3;
  float v4;
  float v5;
  float v6;
  float v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "percentage");
  if (v4 == *(float *)&ARUIRingPercentageValueNoRing
    || (objc_msgSend(v3, "percentage"),
        v5 = *(double *)&ARUIRingsRenderPipelineConfigurationOverlappingThreshold,
        !ARUIFloatGreater(v6, v5)))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v3, "opacity");
    v8 = ARUIFloatGreater(v7, 0.0);
  }

  return v8;
}

@end
