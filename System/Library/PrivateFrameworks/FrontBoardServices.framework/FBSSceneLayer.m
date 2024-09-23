@implementation FBSSceneLayer

- (unsigned)contextID
{
  return self->_contextID;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (BOOL)isKeyboardLayer
{
  return self->_type == 2 && self->_keyboardOwner == 0;
}

- (BOOL)isKeyboardProxyLayer
{
  return self->_type == 2 && self->_keyboardOwner != 0;
}

- (BOOL)isEqual:(id)a3
{
  FBSSceneLayer *v4;
  char v5;

  v4 = (FBSSceneLayer *)a3;
  if (!v4)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  if (self == v4)
  {
    v5 = 1;
    goto LABEL_9;
  }
  if (self->_type == v4->_type && self->_contextID == v4->_contextID && BSFloatEqualToFloat())
    v5 = BSEqualObjects();
  else
LABEL_8:
    v5 = 0;
LABEL_9:

  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v6;

  if ((Class)objc_opt_class() == a3 && -[FBSSceneLayer isCAContextLayer](self, "isCAContextLayer")
    || (Class)objc_opt_class() == a3 && -[FBSSceneLayer isKeyboardLayer](self, "isKeyboardLayer")
    || (Class)objc_opt_class() == a3 && -[FBSSceneLayer isKeyboardProxyLayer](self, "isKeyboardProxyLayer"))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)FBSSceneLayer;
  return -[FBSSceneLayer isKindOfClass:](&v6, sel_isKindOfClass_, a3);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FBSSceneLayer stringRepresentation](self, "stringRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)stringRepresentation
{
  return self->_stringRepresentation;
}

- (id)capture
{
  return -[_FBSCapturedSceneLayer _initWithLayer:]([_FBSCapturedSceneLayer alloc], "_initWithLayer:", self);
}

- (FBSSceneLayer)initWithWindowContext:(id)a3
{
  id v5;
  void *v6;
  char *v7;
  FBSSceneLayer *v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  NSString *stringRepresentation;
  FBSSceneLayer *result;
  void *v14;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = -[FBSSceneLayer _init](self, "_init");
    v8 = (FBSSceneLayer *)v7;
    if (v7)
    {
      *(_OWORD *)(v7 + 40) = xmmword_19A767FB0;
      objc_storeStrong((id *)v7 + 1, a3);
      objc_msgSend(v6, "level");
      v8->_level = v9;
      v10 = objc_msgSend(v6, "contextId");
      v8->_contextID = v10;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), v10);
      v11 = objc_claimAutoreleasedReturnValue();
      stringRepresentation = v8->_stringRepresentation;
      v8->_stringRepresentation = (NSString *)v11;

    }
    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("context"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneLayer initWithWindowContext:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = (FBSSceneLayer *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (double)level
{
  return self->_level;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBSSceneLayer;
  return -[FBSSceneLayer init](&v3, sel_init);
}

void __24__FBSSceneLayer_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
  objc_storeStrong((id *)&self->_keyboardOwner, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)dealloc
{
  CAContext *context;
  CAContext *v4;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  _QWORD *v10;
  _QWORD v11[5];
  CAContext *v12;

  context = self->_context;
  if (context)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__10;
    v11[4] = __Block_byref_object_dispose__10;
    v12 = context;
    v4 = self->_context;
    self->_context = 0;

    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __24__FBSSceneLayer_dealloc__block_invoke;
    v9 = &unk_1E38ECE40;
    v10 = v11;
    BSDispatchMain();
    _Block_object_dispose(v11, 8);

  }
  v5.receiver = self;
  v5.super_class = (Class)FBSSceneLayer;
  -[FBSSceneLayer dealloc](&v5, sel_dealloc);
}

- (FBSSceneIdentityToken)keyboardOwner
{
  return self->_keyboardOwner;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t contextID;
  void *v8;
  id v9;
  FBSSceneIdentityToken *keyboardOwner;
  id v11;
  int64_t alignment;
  void *v13;
  void *v14;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromFBSSceneLayerType(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("type"));

  v6 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("level"), 0, self->_level);
  contextID = self->_contextID;
  if ((_DWORD)contextID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x (%u)"), self->_contextID, contextID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("contextID"));

  }
  keyboardOwner = self->_keyboardOwner;
  if (keyboardOwner)
    v11 = (id)objc_msgSend(v3, "appendObject:withName:", keyboardOwner, CFSTR("owner"));
  alignment = self->_alignment;
  if (alignment)
  {
    NSStringFromFBSSceneLayerAlignment(alignment);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v13, CFSTR("alignment"));

  }
  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (FBSSceneLayer)initWithKeyboardContext:(id)a3
{
  id v5;
  void *v6;
  char *v7;
  FBSSceneLayer *v8;
  float v9;
  NSString *stringRepresentation;
  FBSSceneLayer *result;
  void *v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = -[FBSSceneLayer _init](self, "_init");
    v8 = (FBSSceneLayer *)v7;
    if (v7)
    {
      *(_OWORD *)(v7 + 40) = xmmword_19A767FC0;
      objc_storeStrong((id *)v7 + 1, a3);
      objc_msgSend(v6, "level");
      v8->_level = v9;
      stringRepresentation = v8->_stringRepresentation;
      v8->_stringRepresentation = (NSString *)CFSTR("FBSKeyboardLayer");

    }
    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("context"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneLayer initWithKeyboardContext:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    result = (FBSSceneLayer *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBSSceneLayer)initWithContextID:(unsigned int)a3 level:(double)a4
{
  uint64_t v5;
  char *v6;
  FBSSceneLayer *v7;
  uint64_t v8;
  NSString *stringRepresentation;
  FBSSceneLayer *result;
  void *v11;

  if (a3)
  {
    v5 = *(_QWORD *)&a3;
    v6 = -[FBSSceneLayer _init](self, "_init");
    v7 = (FBSSceneLayer *)v6;
    if (v6)
    {
      *(_OWORD *)(v6 + 40) = xmmword_19A767FB0;
      *((_DWORD *)v6 + 4) = v5;
      *((double *)v6 + 3) = a4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), v5);
      v8 = objc_claimAutoreleasedReturnValue();
      stringRepresentation = v7->_stringRepresentation;
      v7->_stringRepresentation = (NSString *)v8;

    }
    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), a4, CFSTR("contextID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneLayer initWithContextID:level:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (FBSSceneLayer *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBSSceneLayer)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSSceneLayer *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSSceneLayer *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wrong initializer"));
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
    v16 = CFSTR("FBSSceneLayer.m");
    v17 = 1024;
    v18 = 41;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSSceneLayer *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBSSceneLayer)initWithKeyboardOwner:(id)a3 level:(double)a4
{
  id v7;
  void *v8;
  char *v9;
  FBSSceneLayer *v10;
  uint64_t v11;
  NSString *stringRepresentation;
  FBSSceneLayer *result;
  void *v14;

  v7 = a3;
  if (v7)
  {
    v8 = v7;
    v9 = -[FBSSceneLayer _init](self, "_init");
    v10 = (FBSSceneLayer *)v9;
    if (v9)
    {
      *(_OWORD *)(v9 + 40) = xmmword_19A767FC0;
      objc_storeStrong((id *)v9 + 4, a3);
      v10->_level = a4;
      -[FBSSceneIdentityToken stringRepresentation](v10->_keyboardOwner, "stringRepresentation");
      v11 = objc_claimAutoreleasedReturnValue();
      stringRepresentation = v10->_stringRepresentation;
      v10->_stringRepresentation = (NSString *)v11;

    }
    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("owner"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneLayer initWithKeyboardOwner:level:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = (FBSSceneLayer *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (CAContext)CAContext
{
  return self->_context;
}

- (BOOL)isCAContextLayer
{
  return self->_type == 1;
}

- (void)initWithWindowContext:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithKeyboardContext:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithContextID:level:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithKeyboardOwner:level:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
