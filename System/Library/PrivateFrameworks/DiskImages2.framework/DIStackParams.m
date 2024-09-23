@implementation DIStackParams

- (DIStackParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  DIStackParams *v7;
  DIStackParams *v8;
  DIStackParams *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIStackParams;
  v7 = -[DIBaseParams initWithURL:error:](&v11, sel_initWithURL_error_, v6, a4);
  v8 = v7;
  if (v7 && !-[DIBaseParams openExistingImageWithFlags:error:](v7, "openExistingImageWithFlags:error:", 0, a4))
    v9 = 0;
  else
    v9 = v8;

  return v9;
}

- (BOOL)supportsPstack
{
  return 0;
}

- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 error:(id *)a5
{
  return -[DIStackParams appendWithURL:isCache:numBlocks:error:](self, "appendWithURL:isCache:numBlocks:error:", a3, a4, 0, a5);
}

- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 numBlocks:(unint64_t)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  DIShadowNode *v11;
  void *v12;
  void *v13;
  char v14;
  DIClient2Controller_XPCHandler *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v20;
  _QWORD v21[2];

  v8 = a4;
  v21[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = -[DIShadowNode initWithURL:isCache:]([DIShadowNode alloc], "initWithURL:isCache:", v10, v8);
  -[DIShadowNode setNumBlocks:](v11, "setNumBlocks:", a5);
  -[DIBaseParams shadowChain](self, "shadowChain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "addShadowNodes:error:", v13, a6);

  if ((v14 & 1) != 0)
  {
    v15 = objc_alloc_init(DIClient2Controller_XPCHandler);
    if (-[DIClient2Controller_XPCHandler connectWithError:](v15, "connectWithError:", a6)
      && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", v15, 3, a6))
    {
      -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "createDiskImageWithCache:shadowValidation:", 0, 0);

        if (v20)
          (*(void (**)())(*(_QWORD *)v20 + 16))();
      }
      else
      {

      }
      v18 = 1;
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
