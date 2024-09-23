@implementation FBSceneLayer

- (int64_t)type
{
  return self->_type;
}

uint64_t __24__FBSceneLayer_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "type");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D22FD0], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_type);
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_contextID);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_proxiedKeyboardOwner);
  v7 = (id)objc_msgSend(v3, "appendCGFloat:", self->_level);
  v8 = (id)objc_msgSend(v3, "appendInteger:", self->_alignment);
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (int64_t)alignment
{
  return self->_alignment;
}

uint64_t __24__FBSceneLayer_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "level");
}

uint64_t __24__FBSceneLayer_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "proxiedKeyboardOwner");
}

- (FBSSceneIdentityToken)proxiedKeyboardOwner
{
  return self->_proxiedKeyboardOwner;
}

- (double)level
{
  return self->_level;
}

uint64_t __24__FBSceneLayer_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "alignment");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t type;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t contextID;
  id v11;
  id v12;
  FBSSceneIdentityToken *proxiedKeyboardOwner;
  id v14;
  id v15;
  double level;
  id v17;
  id v18;
  int64_t alignment;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D22FB8], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  v7 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __24__FBSceneLayer_isEqual___block_invoke;
  v31[3] = &unk_1E4A13DA0;
  v8 = v4;
  v32 = v8;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", type, v31);
  contextID = self->_contextID;
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __24__FBSceneLayer_isEqual___block_invoke_2;
  v29[3] = &unk_1E4A13DC8;
  v11 = v8;
  v30 = v11;
  v12 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", contextID, v29);
  proxiedKeyboardOwner = self->_proxiedKeyboardOwner;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __24__FBSceneLayer_isEqual___block_invoke_3;
  v27[3] = &unk_1E4A13DF0;
  v14 = v11;
  v28 = v14;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", proxiedKeyboardOwner, v27);
  level = self->_level;
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __24__FBSceneLayer_isEqual___block_invoke_4;
  v25[3] = &unk_1E4A13E18;
  v17 = v14;
  v26 = v17;
  v18 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v25, level);
  alignment = self->_alignment;
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __24__FBSceneLayer_isEqual___block_invoke_5;
  v23[3] = &unk_1E4A13DA0;
  v24 = v17;
  v20 = v17;
  v21 = (id)objc_msgSend(v5, "appendInteger:counterpart:", alignment, v23);
  LOBYTE(alignment) = objc_msgSend(v5, "isEqual");

  return alignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxiedKeyboardOwner, 0);
}

+ (id)layerWithFBSSceneLayer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == 2)
  {
    objc_msgSend(v4, "keyboardOwner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc((Class)a1);
    v9 = v8;
    if (!v7)
    {
      v6 = objc_msgSend(v8, "initAsKeyboard");
      goto LABEL_8;
    }
    objc_msgSend(v4, "keyboardOwner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initAsKeyboardProxyWithOwner:", v10);

  }
  else
  {
    if (v5 == 1)
    {
      v6 = objc_msgSend(objc_alloc((Class)a1), "initWithContextID:", objc_msgSend(v4, "contextID"));
LABEL_8:
      v11 = (void *)v6;
      goto LABEL_9;
    }
    v11 = 0;
  }
LABEL_9:
  objc_msgSend(v4, "level");
  objc_msgSend(v11, "setLevel:");
  objc_msgSend(v11, "setAlignment:", objc_msgSend(v4, "alignment"));

  return v11;
}

uint64_t __24__FBSceneLayer_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contextID");
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setLevel:(double)a3
{
  self->_level = a3;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (FBSceneLayer)initWithContextID:(unsigned int)a3
{
  FBSceneLayer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBSceneLayer;
  result = -[FBSceneLayer init](&v5, sel_init);
  if (result)
  {
    result->_contextID = a3;
    result->_type = 1;
  }
  return result;
}

- (NSString)externalSceneID
{
  return 0;
}

- (id)initAsKeyboard
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBSceneLayer;
  result = -[FBSceneLayer init](&v3, sel_init);
  if (result)
    *((_QWORD *)result + 1) = 3;
  return result;
}

- (FBSceneLayer)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSceneLayer *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSceneLayer *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("you should not be instantiating this class"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBSceneLayer.m");
    v17 = 1024;
    v18 = 58;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSceneLayer *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)initAsKeyboardProxyWithOwner:(id)a3
{
  id v5;
  FBSceneLayer *v6;
  FBSceneLayer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBSceneLayer;
  v6 = -[FBSceneLayer init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 4;
    objc_storeStrong((id *)&v6->_proxiedKeyboardOwner, a3);
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)-[FBSceneLayer descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isKeyboardLayer
{
  return self->_type == 3;
}

- (BOOL)isKeyboardProxyLayer
{
  return self->_type == 4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSceneLayer succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  uint64_t contextID;
  void *v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FBSceneLayerTypeDescription(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("type"));

  contextID = self->_contextID;
  if ((_DWORD)contextID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x (%u)"), self->_contextID, contextID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("contextID"));

  }
  -[FBSceneLayer alignment](self, "alignment");
  NSStringFromFBSSceneLayerAlignment();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("alignment"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSceneLayer descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
