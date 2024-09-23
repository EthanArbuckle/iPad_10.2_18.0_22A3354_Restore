@implementation _FBSCapturedSceneLayer

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_FBSCapturedSceneLayer;
  v6 = -[FBSSceneLayer isEqual:](&v8, sel_isEqual_, v4)
    && (v5 = objc_opt_class(), v5 == objc_opt_class())
    && self->_captureTime == v4[8];

  return v6;
}

- (id)_initWithLayer:(id)a3
{
  id v4;
  id v5;
  id *v6;
  id *v7;
  id v8;
  float v9;
  double v10;
  id result;
  void *v12;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = -[FBSSceneLayer _init](self, "_init");
    v7 = v6;
    if (v6)
    {
      v6[5] = (id)*((_QWORD *)v5 + 5);
      objc_storeStrong(v6 + 1, *((id *)v5 + 1));
      *((_DWORD *)v7 + 4) = *((_DWORD *)v5 + 4);
      objc_storeStrong(v7 + 4, *((id *)v5 + 4));
      v7[6] = (id)*((_QWORD *)v5 + 6);
      objc_storeStrong(v7 + 7, *((id *)v5 + 7));
      v7[8] = (id)mach_absolute_time();
      v8 = v7[1];
      if (v8)
      {
        objc_msgSend(v8, "level");
        v10 = v9;
      }
      else
      {
        v10 = *((double *)v5 + 3);
      }
      *((double *)v7 + 3) = v10;
    }

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("layer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_FBSCapturedSceneLayer _initWithLayer:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  double level;
  double v6;
  int64_t v7;
  unint64_t captureTime;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;

  v4 = a3;
  level = self->super._level;
  objc_msgSend(v4, "level");
  if (level >= v6)
  {
    if (level <= v6)
    {
      captureTime = self->_captureTime;
      v9 = v4[8];
      v10 = captureTime >= v9;
      v11 = captureTime == v9;
      v12 = -1;
      if (v10)
        v12 = 1;
      if (v11)
        v7 = 0;
      else
        v7 = v12;
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  uint64_t contextID;
  int64_t alignment;
  xpc_object_t xdict;

  xdict = a3;
  xpc_dictionary_set_uint64(xdict, "t", self->super._type);
  xpc_dictionary_set_double(xdict, "l", self->super._level);
  xpc_dictionary_set_uint64(xdict, "ts", self->_captureTime);
  contextID = self->super._contextID;
  if ((_DWORD)contextID)
    xpc_dictionary_set_uint64(xdict, "cid", contextID);
  alignment = self->super._alignment;
  if (alignment >= 1)
    xpc_dictionary_set_uint64(xdict, "a", alignment);
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();

}

- (_FBSCapturedSceneLayer)initWithXPCDictionary:(id)a3
{
  id v4;
  _FBSCapturedSceneLayer *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  FBSSceneIdentityToken *v10;
  FBSSceneIdentityToken *keyboardOwner;
  uint64_t v12;
  NSString *stringRepresentation;

  v4 = a3;
  v5 = -[FBSSceneLayer _init](self, "_init");
  if (v5)
  {
    v5->super._type = xpc_dictionary_get_uint64(v4, "t");
    v5->super._level = xpc_dictionary_get_double(v4, "l");
    v5->_captureTime = xpc_dictionary_get_uint64(v4, "ts");
    v5->super._contextID = xpc_dictionary_get_uint64(v4, "cid");
    v5->super._alignment = xpc_dictionary_get_uint64(v4, "a");
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    keyboardOwner = v5->super._keyboardOwner;
    v5->super._keyboardOwner = v10;

    BSDeserializeStringFromXPCDictionaryWithKey();
    v12 = objc_claimAutoreleasedReturnValue();
    stringRepresentation = v5->super._stringRepresentation;
    v5->super._stringRepresentation = (NSString *)v12;

  }
  return v5;
}

- (void)_initWithLayer:.cold.1()
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
