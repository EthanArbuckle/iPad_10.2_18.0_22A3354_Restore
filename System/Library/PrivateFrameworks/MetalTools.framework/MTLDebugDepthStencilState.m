@implementation MTLDebugDepthStencilState

- (MTLDebugDepthStencilState)initWithDepthStencilState:(id)a3 descriptor:(id)a4 device:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  BOOL v25;
  uint64_t v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)MTLDebugDepthStencilState;
  v6 = -[MTLToolsDepthStencilState initWithDepthStencilState:descriptor:device:](&v28, sel_initWithDepthStencilState_descriptor_device_, a3, a4, a5);
  if (v6)
  {
    v7 = (void *)objc_msgSend(a4, "copy");
    *((_QWORD *)v6 + 5) = v7;
    v8 = objc_msgSend(v7, "depthCompareFunction");
    v9 = objc_msgSend(*((id *)v6 + 5), "depthCompareFunction");
    v10 = objc_msgSend(*((id *)v6 + 5), "isDepthWriteEnabled");
    if (v8)
      v11 = v10;
    else
      v11 = 0;
    *((_BYTE *)v6 + 36) |= v11;
    v12 = (void *)objc_msgSend(*((id *)v6 + 5), "backFaceStencil");
    v13 = objc_msgSend(v12, "stencilCompareFunction");
    v14 = objc_msgSend(v12, "stencilCompareFunction");
    if (!objc_msgSend(v12, "writeMask"))
      goto LABEL_24;
    if (v13 == 7)
    {
      if (!v14)
      {
LABEL_24:
        LOBYTE(v16) = 0;
        goto LABEL_25;
      }
    }
    else
    {
      v15 = objc_msgSend(v12, "stencilFailureOperation");
      v16 = v15 != 0;
      if (v15)
        v17 = 1;
      else
        v17 = v14 == 0;
      if (v17)
        goto LABEL_19;
    }
    if (!v8
      || ((v18 = objc_msgSend(v12, "depthStencilPassOperation"), v16 = v18 != 0, !v18) ? (v19 = v14 == 0) : (v19 = 1),
          !v19))
    {
      if (v9 == 7 || !objc_msgSend(v12, "depthFailureOperation"))
        goto LABEL_24;
LABEL_23:
      LOBYTE(v16) = 2;
      goto LABEL_25;
    }
LABEL_19:
    if (!v16)
    {
LABEL_25:
      *((_BYTE *)v6 + 36) |= v16;
      v20 = (void *)objc_msgSend(*((id *)v6 + 5), "frontFaceStencil");
      v21 = objc_msgSend(v20, "stencilCompareFunction");
      v22 = objc_msgSend(v20, "stencilCompareFunction");
      if (!objc_msgSend(v20, "writeMask"))
      {
LABEL_38:
        LOBYTE(v24) = 0;
LABEL_41:
        *((_BYTE *)v6 + 36) |= v24;
        return (MTLDebugDepthStencilState *)v6;
      }
      if (v21 == 7)
      {
        if (!v22)
          goto LABEL_38;
      }
      else
      {
        v23 = objc_msgSend(v20, "stencilFailureOperation");
        v24 = v23 != 0;
        if (v23)
          v25 = 1;
        else
          v25 = v22 == 0;
        if (v25)
          goto LABEL_39;
      }
      if (!v8 || (v26 = objc_msgSend(v20, "depthStencilPassOperation"), v24 = v26 != 0, !v26) && v22)
      {
        if (v9 == 7 || !objc_msgSend(v20, "depthFailureOperation"))
          goto LABEL_38;
LABEL_40:
        LOBYTE(v24) = 4;
        goto LABEL_41;
      }
LABEL_39:
      if (!v24)
        goto LABEL_41;
      goto LABEL_40;
    }
    goto LABEL_23;
  }
  return (MTLDebugDepthStencilState *)v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugDepthStencilState;
  -[MTLToolsDepthStencilState dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLDebugDepthStencilState;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), -[MTLToolsObject description](&v4, sel_description), objc_msgSend(*(id *)&self->_attachmentWriteMask, "formattedDescription:", a3 + 4));
}

- (id)description
{
  return -[MTLDebugDepthStencilState formattedDescription:](self, "formattedDescription:", 0);
}

- (MTLDepthStencilDescriptor)descriptor
{
  return *(MTLDepthStencilDescriptor **)&self->_attachmentWriteMask;
}

- (unsigned)attachmentWriteMask
{
  return *((_BYTE *)&self->super.super._externalReferences + 4);
}

@end
