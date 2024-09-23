@implementation BLSHFlipbookContext

- (BLSHFlipbookContext)initWithCAContext:(id)a3 wantsTransform:(BOOL)a4 inverted:(BOOL)a5
{
  id v9;
  BLSHFlipbookContext *v10;
  BLSHFlipbookContext *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLSHFlipbookContext;
  v10 = -[BLSHFlipbookContext init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_caContext, a3);
    v11->_wantsTransform = a4;
    v11->_inverted = a5;
  }

  return v11;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_caContext, CFSTR("context"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_wantsTransform, CFSTR("wantsTransform"), 1);
  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_inverted, CFSTR("inverted"), 1);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendPointer:", self->_caContext);
  v5 = (id)objc_msgSend(v3, "appendBool:", self->_wantsTransform);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_inverted);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  CAContext *caContext;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 wantsTransform;
  id v11;
  id v12;
  uint64_t inverted;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  caContext = self->_caContext;
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __31__BLSHFlipbookContext_isEqual___block_invoke;
  v21[3] = &unk_24D1BC110;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendPointer:counterpart:", caContext, v21);
  wantsTransform = self->_wantsTransform;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __31__BLSHFlipbookContext_isEqual___block_invoke_2;
  v19[3] = &unk_24D1BDB28;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", wantsTransform, v19);
  inverted = self->_inverted;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __31__BLSHFlipbookContext_isEqual___block_invoke_3;
  v17[3] = &unk_24D1BDB28;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", inverted, v17);
  LOBYTE(inverted) = objc_msgSend(v5, "isEqual");

  return inverted;
}

uint64_t __31__BLSHFlipbookContext_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "caContext");
}

uint64_t __31__BLSHFlipbookContext_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "wantsTransform");
}

uint64_t __31__BLSHFlipbookContext_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isInverted");
}

- (CAContext)caContext
{
  return self->_caContext;
}

- (BOOL)wantsTransform
{
  return self->_wantsTransform;
}

- (BOOL)isInverted
{
  return self->_inverted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caContext, 0);
}

@end
