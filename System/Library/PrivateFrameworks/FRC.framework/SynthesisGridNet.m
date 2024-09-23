@implementation SynthesisGridNet

- (SynthesisGridNet)initWithMode:(int64_t)a3
{
  const __CFString *v5;
  void *v6;
  SynthesisGridNet *v7;
  SynthesisGridNet *v8;
  SynthesisGridNet *v9;
  objc_super v11;
  uint64_t v12;
  unint64_t v13;

  v12 = 0;
  v13 = 0;
  FRCGetInputFrameSizeForUsage(a3, (uint64_t *)&v13, &v12);
  if (v13 <= 0x3E8)
    v5 = CFSTR("synthesis_net_GridNet_pyrlite");
  else
    v5 = CFSTR("synthesis_net_GridNet_pyrlite_HD");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)SynthesisGridNet;
  v7 = -[EspressoModel initWithModelName:usage:](&v11, sel_initWithModelName_usage_, v6, a3);
  v8 = v7;
  if (v7)
    v9 = v7;

  return v8;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SynthesisGridNet;
  -[EspressoModel dealloc](&v2, sel_dealloc);
}

- (BOOL)synthesizeFrameFromFeatureForward:(id *)a3 backward:(id *)a4 destination:(__CVBuffer *)a5 pyramidStartLevel:(unint64_t)a6 callback:(id)a7
{
  id v8;
  uint64_t v9;
  char **v10;
  BOOL v11;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;

  v8 = a7;
  v9 = 0;
  v10 = off_1E9786C28;
  do
  {
    if (espresso_network_bind_cvpixelbuffer() || espresso_network_bind_cvpixelbuffer())
    {
      NSLog(CFSTR("GridNet: Error ! Failed to bind the input\n"));
      goto LABEL_8;
    }
    v9 += 8;
    v10 += 2;
  }
  while (v9 != 24);
  if (espresso_network_bind_cvpixelbuffer())
  {
    NSLog(CFSTR("GridNet: Error ! Failed to bind the output buffer\n"));
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  kdebug_trace();
  if (v8)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __102__SynthesisGridNet_synthesizeFrameFromFeatureForward_backward_destination_pyramidStartLevel_callback___block_invoke;
    v18 = &unk_1E9786948;
    v19 = v8;
    v13 = espresso_plan_submit();

    if (v13)
    {
LABEL_12:
      NSLog(CFSTR("GridNet: Error !! Network execution Failed. (Usage:%ld)\n"), -[EspressoModel usage](self, "usage"), v15, v16, v17, v18);
      goto LABEL_8;
    }
  }
  else
  {
    v14 = espresso_plan_execute_sync();
    kdebug_trace();
    if (v14)
      goto LABEL_12;
  }
  v11 = 1;
LABEL_9:

  return v11;
}

uint64_t __102__SynthesisGridNet_synthesizeFrameFromFeatureForward_backward_destination_pyramidStartLevel_callback___block_invoke(uint64_t a1)
{
  kdebug_trace();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
