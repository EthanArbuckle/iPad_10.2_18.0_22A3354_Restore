@implementation REMipGenPolyphase

+ (_REMipGenPolyphaseOptions)defaultOptions
{
  return (_REMipGenPolyphaseOptions)0;
}

- (REMipGenPolyphase)initWithLibrary:(id)a3
{
  id v4;
  void *v5;
  REMipGenPolyphase *v6;
  char v7;
  BOOL *p_useTextureViews;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  BOOL *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t i;
  REMipGenPolyphase *v24;
  id v25;
  id v26;
  objc_super v27;
  _OWORD v28[2];
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)REMipGenPolyphase;
  v6 = -[REMipGenPolyphase init](&v27, sel_init);
  if (v6)
  {
    v28[0] = xmmword_24ED72E10;
    v28[1] = *(_OWORD *)off_24ED72E20;
    v29 = CFSTR("mipGenPolyphaseRef");
    if (objc_msgSend(v5, "supportsFamily:", 5001))
      v7 = objc_msgSend(v5, "supportsFamily:", 1006) ^ 1;
    else
      v7 = 1;
    v24 = v6;
    v6->_useTextureViews = v7;
    p_useTextureViews = &v6->_useTextureViews;
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setConstantValue:type:withName:", p_useTextureViews, 53, CFSTR("UseTextureViews"));
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = p_useTextureViews - 152;
    do
    {
      v14 = v12;
      v15 = v11;
      v16 = *(_QWORD *)((char *)v28 + v10);
      v26 = v11;
      v17 = objc_msgSend(v4, "newFunctionWithName:constantValues:error:", v16, v9, &v26);
      v11 = v26;

      v18 = *(void **)v13;
      *(_QWORD *)v13 = v17;

      v19 = *(void **)v13;
      v25 = v14;
      v20 = objc_msgSend(v5, "newComputePipelineStateWithFunction:error:", v19, &v25);
      v12 = v25;

      v21 = (void *)*((_QWORD *)v13 + 1);
      *((_QWORD *)v13 + 1) = v20;

      v10 += 8;
      v13 += 16;
    }
    while (v10 != 32);

    for (i = 32; i != -8; i -= 8)
    v6 = v24;
    v24->_tileValid = 0;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)REMipGenPolyphase;
  -[REMipGenPolyphase dealloc](&v2, sel_dealloc);
}

- (void)generateMipmapsForTexture:(id)a3 withComputeEncoder:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[REMipGenPolyphase generateMipmapsForTexture:withComputeEncoder:withOptions:](self, "generateMipmapsForTexture:withComputeEncoder:withOptions:", v7, v6, (unsigned __int16)+[REMipGenPolyphase defaultOptions](REMipGenPolyphase, "defaultOptions"));

}

- (void)generateMipmapsForTexture:(id)a3 withComputeEncoder:(id)a4 withOptions:(_REMipGenPolyphaseOptions)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  uint16x4_t v14;
  id v15;
  unsigned int v16;

  v15 = a3;
  v8 = a4;
  if ((*(_WORD *)&a5 & 0x100) != 0)
  {
    bzero(self->_tileValid, self->_tileMaxCount);
    v13 = objc_msgSend(v15, "mipmapLevelCount");
    generateMipmapsForTexture_HierarchicalTiling_traverse(v15, v8, *(unsigned __int16 *)&a5, self, v13 - 1, 0, 0, self->_useTextureViews, v14);
  }
  else if ((unint64_t)objc_msgSend(v15, "mipmapLevelCount") >= 2)
  {
    v9 = 1;
    do
    {
      v10 = objc_msgSend(v15, "width", v15);
      if (v10 >> v9 <= 1)
        LOWORD(v11) = 1;
      else
        v11 = v10 >> v9;
      v12 = (unint64_t)objc_msgSend(v15, "height") >> v9;
      if (v12 <= 1)
        LOWORD(v12) = 1;
      LOWORD(v16) = v11;
      HIWORD(v16) = v12;
      dispatchMipGenRect(v15, v15, v8, self, v9++, 0, v16, self->_useTextureViews);
    }
    while (objc_msgSend(v15, "mipmapLevelCount") > v9);
  }

}

- (void)copyAndGenerateMipmapsFromTexture:(id)a3 toTexture:(id)a4 withComputeEncoder:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[REMipGenPolyphase copyAndGenerateMipmapsFromTexture:toTexture:withComputeEncoder:withOptions:](self, "copyAndGenerateMipmapsFromTexture:toTexture:withComputeEncoder:withOptions:", v10, v9, v8, (unsigned __int16)+[REMipGenPolyphase defaultOptions](REMipGenPolyphase, "defaultOptions"));

}

- (void)copyAndGenerateMipmapsFromTexture:(id)a3 toTexture:(id)a4 withComputeEncoder:(id)a5 withOptions:(_REMipGenPolyphaseOptions)a6
{
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  unsigned int v17;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v9, "mipmapLevelCount") >= 2)
  {
    v11 = 1;
    do
    {
      v12 = objc_msgSend(v16, "width", v16);
      if (v12 >> v11 <= 1)
        LOWORD(v13) = 1;
      else
        v13 = v12 >> v11;
      v14 = (unint64_t)objc_msgSend(v16, "height") >> v11;
      if (v14 <= 1)
        LOWORD(v14) = 1;
      v15 = v16;
      if (v11 != 1)
        v15 = v9;
      LOWORD(v17) = v13;
      HIWORD(v17) = v14;
      dispatchMipGenRect(v15, v9, v10, self, v11++, 0, v17, self->_useTextureViews);
    }
    while (objc_msgSend(v9, "mipmapLevelCount") > v11);
  }

}

- (void).cxx_destruct
{
  uint64_t i;

  for (i = 0; i != -5; --i)
  {

  }
}

@end
