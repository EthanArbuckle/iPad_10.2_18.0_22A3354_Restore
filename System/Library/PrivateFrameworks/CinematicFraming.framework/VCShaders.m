@implementation VCShaders

- (VCShaders)init
{

  return 0;
}

- (VCShaders)initWithContext:(id)a3
{
  id v5;
  uint64_t v6;
  MTLComputePipelineState **kernels;
  char v8;
  char v9;
  FigMetalContext *context;
  void *v11;
  uint64_t v12;
  MTLComputePipelineState *v13;
  VCShaders *v14;

  v5 = a3;
  objc_storeStrong((id *)&self->_context, a3);
  v6 = 0;
  kernels = self->_kernels;
  v8 = 1;
  while (1)
  {
    v9 = v8;
    context = self->_context;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", VCPKernelNames[v6]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FigMetalContext computePipelineStateFor:constants:](context, "computePipelineStateFor:constants:", v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = kernels[v6];
    kernels[v6] = (MTLComputePipelineState *)v12;

    if (!kernels[v6])
      break;
    v8 = 0;
    v6 = 1;
    if ((v9 & 1) == 0)
    {
      v14 = self;
      goto LABEL_6;
    }
  }
  v14 = 0;
LABEL_6:

  return v14;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  MTLComputePipelineState *v3;

  if (a3 <= 2)
    v3 = self->_kernels[a3];
  else
    v3 = 0;
  return v3;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)&self->_context, 0);
  v3 = 16;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
