@implementation VCPCNNModel

- (VCPCNNModel)init
{
  VCPCNNModel *v2;
  VCPCNNModel *v3;
  VCPCNNModel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCPCNNModel;
  v2 = -[VCPCNNModel init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    bzero(v2->_blocks, 0x640uLL);
    v3->_quantFactor = 1;
    v4 = v3;
  }

  return v3;
}

- (VCPCNNModel)initWithParameters:(signed __int16)a3 useGPU:(BOOL)a4
{
  _BOOL4 v4;
  VCPCNNModel *v6;
  VCPCNNModel *v7;
  VCPCNNMetalContext *v8;
  VCPCNNMetalContext *v9;
  VCPCNNModel *v10;
  VCPCNNMetalContext *context;
  objc_super v13;

  v4 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VCPCNNModel;
  v6 = -[VCPCNNModel init](&v13, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  bzero(v6->_blocks, 0x640uLL);
  v7->_quantFactor = a3;
  v7->_useGPU = v4;
  if (!v4)
  {
    context = v7->_context;
    v7->_context = 0;

    goto LABEL_6;
  }
  v8 = -[VCPCNNMetalContext initNewContext:]([VCPCNNMetalContext alloc], "initNewContext:", 1);
  v9 = v7->_context;
  v7->_context = v8;

  if (v7->_context)
  {
LABEL_6:
    v10 = v7;
    goto LABEL_7;
  }
LABEL_4:
  v10 = 0;
LABEL_7:

  return v10;
}

- (int)size
{
  uint64_t v3;
  VCPCNNBlock **blocks;

  v3 = 0;
  blocks = self->_blocks;
  do
  {
    if (!blocks[v3])
      break;
    ++v3;
  }
  while (v3 != 200);
  return v3;
}

- (id)getGPUContext
{
  return self->_context;
}

- (int)add:(id)a3
{
  id v5;
  int v6;
  int v7;

  v5 = a3;
  v6 = -[VCPCNNModel size](self, "size");
  if (v6 <= 199)
  {
    objc_storeStrong((id *)&self->_blocks[v6], a3);
    v7 = 0;
  }
  else
  {
    v7 = -50;
  }

  return v7;
}

- (int)prepareNetworkFromURL:(id)a3 withInputSize:(id)a4
{
  id v6;
  id v7;
  FILE *v8;
  int v9;
  int v10;
  VCPCNNBlock *v11;
  VCPCNNMetalContext *context;
  int v13;
  id *v14;
  uint64_t v15;
  id v16;
  void *v17;
  VCPCNNMetalContext *v18;

  v6 = a4;
  objc_msgSend(a3, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = fopen((const char *)objc_msgSend(v7, "UTF8String"), "rb");

  v9 = -[VCPCNNModel size](self, "size");
  if (v8)
  {
    v10 = v9;
    objc_msgSend(*((id *)&self->super.isa + v9), "setGenerateOutput:", 1);
    v11 = self->_blocks[0];
    if (-[VCPCNNBlock supportGPU](v11, "supportGPU"))
      context = self->_context;
    else
      context = 0;
    v13 = -[VCPCNNBlock constructBlock:context:](v11, "constructBlock:context:", v6, context);
    if (!v13)
    {
      v13 = -[VCPCNNBlock readFromDisk:quantFactor:](self->_blocks[0], "readFromDisk:quantFactor:", v8, self->_quantFactor);
      if (!v13)
      {
        if (v10 < 2)
        {
          v13 = 0;
        }
        else
        {
          v14 = (id *)&self->_blocks[1];
          v15 = v10 - 1;
          do
          {
            v16 = *v14;
            objc_msgSend(*(v14 - 1), "outputSize");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(*v14, "supportGPU"))
              v18 = self->_context;
            else
              v18 = 0;
            v13 = objc_msgSend(v16, "constructBlock:context:", v17, v18);

            if (v13)
              break;
            v13 = objc_msgSend(*v14, "readFromDisk:quantFactor:", v8, self->_quantFactor);
            if (v13)
              break;
            ++v14;
            --v15;
          }
          while (v15);
        }
      }
    }
    fclose(v8);
  }
  else
  {
    v13 = -23;
  }

  return v13;
}

- (int)forward:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  VCPCNNBlock *v8;
  VCPCNNBlock *v9;
  uint64_t v10;
  VCPCNNBlock *v11;
  VCPCNNBlock *v12;
  void *v13;
  void *v14;
  VCPCNNData *v15;
  VCPCNNData *output;

  v4 = a3;
  objc_msgSend(v4, "size");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 3)
  {
    if (self->_useGPU && (v7 = objc_msgSend(v4, "convertCPUData2GPU")) != 0)
    {
      v8 = 0;
      v9 = 0;
    }
    else
    {
      -[VCPCNNBlock setInput:](self->_blocks[0], "setInput:", v4);
      v10 = 0;
      v8 = 0;
      v11 = 0;
LABEL_7:
      v9 = v11;
      while (v10 < -[VCPCNNModel size](self, "size"))
      {
        v11 = self->_blocks[v10];

        v7 = -[VCPCNNBlock forward](v11, "forward");
        if (v7)
        {
          v9 = v11;
          goto LABEL_17;
        }
        ++v10;
        v9 = v11;
        if (-[VCPCNNModel size](self, "size") > (int)v10)
        {
          v12 = self->_blocks[v10];

          -[VCPCNNBlock output](v11, "output");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPCNNBlock setInput:](v12, "setInput:", v13);

          v8 = v12;
          goto LABEL_7;
        }
      }
      if (!self->_useGPU
        || (v7 = -[VCPCNNMetalContext execute](self->_context, "execute")) == 0
        && (objc_msgSend(*((id *)&self->super.isa + -[VCPCNNModel size](self, "size")), "output"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v7 = objc_msgSend(v14, "convertGPUData2CPU"),
            v14,
            !v7))
      {
        objc_msgSend(*((id *)&self->super.isa + -[VCPCNNModel size](self, "size")), "output");
        v15 = (VCPCNNData *)objc_claimAutoreleasedReturnValue();
        output = self->_output;
        self->_output = v15;

        v7 = 0;
      }
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v7 = -50;
  }
LABEL_17:

  return v7;
}

- (int)dynamicForward:(id)a3 paramFileUrl:(id)a4 cancel:(id)a5
{
  id v8;
  uint64_t (**v9)(_QWORD);
  id v10;
  FILE *v11;
  int v12;
  int v13;
  id *blocks;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  id v19;
  void *v20;
  int v22;
  void *v23;
  VCPCNNData *v24;
  VCPCNNData *output;
  void *v26;
  uint64_t v27;
  void *v28;
  Class *v29;
  Class v30;
  void *v31;
  int v32;
  char v33;
  int v34;
  void *v35;
  Class v36;
  id v37;
  uint64_t v38;
  int v39;
  void *context;

  v8 = a3;
  v9 = (uint64_t (**)(_QWORD))a5;
  objc_msgSend(a4, "path");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = fopen((const char *)objc_msgSend(v10, "UTF8String"), "rb");

  v12 = -[VCPCNNModel size](self, "size");
  if (v11)
  {
    v13 = v12;
    blocks = (id *)self->_blocks;
    v15 = v12 - 1;
    -[VCPCNNBlock setGenerateOutput:](self->_blocks[v15], "setGenerateOutput:", 1);
    objc_msgSend(v8, "size");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17 != 3)
    {
      v18 = -50;
      goto LABEL_14;
    }
    if (self->_useGPU)
    {
      v18 = objc_msgSend(v8, "convertCPUData2GPU");
      if (v18)
        goto LABEL_14;
    }
    v19 = *blocks;
    if (*blocks)
    {
      objc_msgSend(v8, "size");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v19, "constructBlock:context:", v20, self->_context);

      if (v18)
        goto LABEL_14;
      v18 = -[VCPCNNBlock readFromDisk:quantFactor:](self->_blocks[0], "readFromDisk:quantFactor:", v11, self->_quantFactor);
      if (v18)
        goto LABEL_14;
      objc_msgSend(*blocks, "setInput:", v8);
      v18 = objc_msgSend(*blocks, "forward");
      if (v18)
        goto LABEL_14;
      if (v13 < 2)
      {
        v22 = 0;
      }
      else
      {
        if ((v9[2](v9) & 1) != 0)
        {
          v18 = -128;
LABEL_14:
          fclose(v11);
          goto LABEL_15;
        }
        objc_msgSend(*blocks, "output");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPCNNBlock setInput:](self->_blocks[1], "setInput:", v26);

        v27 = 0;
        v39 = 0;
        v38 = v13 - 1;
        do
        {
          v28 = (void *)MEMORY[0x1BCCA1B2C]();
          v29 = &self->super.isa + v27;
          v30 = v29[2];
          if (v30)
          {
            context = v28;
            -[objc_class outputSize](v29[1], "outputSize");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = -[objc_class constructBlock:context:](v30, "constructBlock:context:", v31, self->_context);

            if (v32)
            {
              v33 = 0;
              v39 = v32;
            }
            else
            {
              v34 = -[objc_class readFromDisk:quantFactor:](v29[2], "readFromDisk:quantFactor:", v11, self->_quantFactor);
              if (v34 || (v34 = -[objc_class forward](v29[2], "forward")) != 0)
              {
                v33 = 0;
                v39 = v34;
              }
              else
              {
                if (v27 + 1 < v15)
                {
                  -[objc_class output](v29[2], "output");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  -[VCPCNNBlock setInput:](self->_blocks[v27 + 2], "setInput:", v35);

                }
                v36 = v29[1];
                v29[1] = 0;

                v33 = 1;
              }
            }
            v28 = context;
          }
          else
          {
            v33 = 0;
            v39 = -18;
          }
          objc_autoreleasePoolPop(v28);
          if ((v33 & 1) == 0)
          {
            v18 = v39;
            goto LABEL_14;
          }
          ++v27;
        }
        while (v38 != v27);
        if (!*blocks)
        {
          objc_storeStrong((id *)self->_blocks, blocks[v15]);
          v37 = blocks[v15];
          blocks[v15] = 0;

        }
        v22 = v39;
        if (-[VCPCNNModel size](self, "size") != 1)
          goto LABEL_40;
      }
      if (!self->_useGPU
        || (v18 = -[VCPCNNMetalContext execute](self->_context, "execute")) == 0
        && (objc_msgSend(*blocks, "output"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v23, "convertGPUData2CPU"),
            v23,
            !v18))
      {
        objc_msgSend(*blocks, "output");
        v24 = (VCPCNNData *)objc_claimAutoreleasedReturnValue();
        output = self->_output;
        self->_output = v24;

        v18 = v22;
      }
      goto LABEL_14;
    }
LABEL_40:
    v18 = -18;
    goto LABEL_14;
  }
  v18 = -23;
LABEL_15:

  return v18;
}

- (VCPCNNData)output
{
  return (VCPCNNData *)objc_getProperty(self, a2, 1624, 1);
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_context, 0);
  v3 = 1600;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
