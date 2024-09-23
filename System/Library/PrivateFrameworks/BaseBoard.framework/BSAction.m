@implementation BSAction

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return 0;
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_BSActionResponder action_fullIdentifier]((os_unfair_lock_s *)self->_responder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[BSAction succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "build");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSAction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  -[BSAction _descriptionBuilderWithMultilinePrefix:debug:](self, a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 debug:
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActiveMultilinePrefix:", v5);
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    v7 = (id)objc_msgSend(v6, "appendObject:withName:", a1[3], CFSTR("info"));
    v8 = (id)objc_msgSend(v6, "appendObject:withName:", a1[1], CFSTR("responder"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BSActionResponder action_shortIdentifier]((os_unfair_lock_s *)self->_responder);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("id"), 1);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_responder, 0);
}

- (void)invalidate
{
  _BOOL4 isImplicitOriginator;
  os_unfair_lock_s *responder;

  isImplicitOriginator = self->_isImplicitOriginator;
  responder = (os_unfair_lock_s *)self->_responder;
  if (isImplicitOriginator)
    -[_BSActionResponder originator_annulWithErrorCode:](responder, 5uLL);
  else
    -[_BSActionResponder action_invalidate]((uint64_t)responder);
}

- (BSAction)initWithXPCDictionary:(id)a3
{
  void *v4;
  BSAction *v5;

  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BSAction initWithBSXPCCoder:](self, "initWithBSXPCCoder:", v4);

  return v5;
}

- (BSAction)initWithInfo:(id)a3 responder:(id)a4
{
  id v6;
  os_unfair_lock_s *v7;
  os_unfair_lock *v8;
  void *v9;
  id v10;
  BSAction *v11;
  uint64_t v12;
  objc_class *v13;

  v6 = a3;
  v7 = (os_unfair_lock_s *)a4;
  v8 = v7;
  if (v7)
  {
    os_unfair_lock_lock(v7 + 10);
    -[BSActionResponder _lock_underlying](v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v8 + 10);
  }
  else
  {
    +[_BSActionResponder originator_nullResponder]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[BSAction _initWithInfo:responder:](self, v6, v9);
  v11 = (BSAction *)v10;
  if (v10)
  {
    v12 = *((_QWORD *)v10 + 1);
    v13 = (objc_class *)objc_opt_class();
    -[_BSActionResponder originator_didInit:](v12, v13);
  }

  return v11;
}

- (id)_initWithInfo:(void *)a3 responder:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("responder"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithInfo_responder_);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v18 = v13;
        v19 = 2114;
        v20 = v15;
        v21 = 2048;
        v22 = a1;
        v23 = 2114;
        v24 = CFSTR("BSAction.m");
        v25 = 1024;
        v26 = 188;
        v27 = 2114;
        v28 = v12;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1B38E0);
    }
    v16.receiver = a1;
    v16.super_class = (Class)BSAction;
    v8 = objc_msgSendSuper2(&v16, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v5, "copy");
      v10 = (void *)*((_QWORD *)v8 + 3);
      *((_QWORD *)v8 + 3) = v9;

      objc_msgSend(*((id *)v8 + 3), "setDescriptionProvider:", v8);
      *((_BYTE *)v8 + 16) = 0;
      objc_storeStrong((id *)v8 + 1, a3);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)sendResponse:(id)a3
{
  id v4;
  _BSActionResponder *responder;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  responder = self->_responder;
  v6 = v4;
  v8 = v4;
  if (!v4)
  {
    +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, 4uLL);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[_BSActionResponder action:sendResponse:]((uint64_t)responder, self, v6);
  v7 = v8;
  if (!v8)
  {

    v7 = 0;
  }

}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;

  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAction encodeWithBSXPCCoder:](self, "encodeWithBSXPCCoder:");

}

- (void)dealloc
{
  objc_super v3;

  -[BSSettings setDescriptionProvider:](self->_info, "setDescriptionProvider:", 0);
  -[_BSActionResponder action_didDealloc]((uint64_t)self->_responder);
  v3.receiver = self;
  v3.super_class = (Class)BSAction;
  -[BSAction dealloc](&v3, sel_dealloc);
}

- (BSSettings)info
{
  return self->_info;
}

- (NSString)description
{
  return (NSString *)-[BSAction descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)canSendResponse
{
  return -[_BSActionResponder action_canSendResponse]((os_unfair_lock_s *)self->_responder);
}

- (unint64_t)hash
{
  _BSActionResponder *responder;
  void *v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  responder = self->_responder;
  if (responder && responder->_isOriginatorNull)
  {
    +[BSHashBuilder builder](BSHashBuilder, "builder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendObject:", self->_info);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BSAction;
    return -[BSAction hash](&v8, sel_hash);
  }
  return v6;
}

- (BSAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  intptr_t v14;
  uint64_t v15;
  dispatch_time_t v16;
  id v17;
  BSAction *v18;
  uint64_t v19;
  objc_class *v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    v13 = v11;
    if (!v11)
    {
      LODWORD(v14) = qos_class_self();
      if (v14 <= 0x15)
        v14 = 21;
      else
        v14 = v14;
      dispatch_get_global_queue(v14, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[_BSActionResponder originator_responderOnQueue:forHandler:]((uint64_t)_BSActionResponder, v13, v12);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v11)

    if (v15)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v15 + 96));
      *(_BYTE *)(v15 + 102) = 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(v15 + 96));
    }
    if (a4 > 0.0 && fabs(a4) >= 2.22044605e-16)
    {
      v16 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      -[_BSActionResponder originator_setTimeout:](v15, v16);
    }
  }
  else
  {
    +[_BSActionResponder originator_nullResponder]();
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v17 = -[BSAction _initWithInfo:responder:](self, v10, (void *)v15);
  v18 = (BSAction *)v17;
  if (v17)
  {
    *((_BYTE *)v17 + 16) = 1;
    v19 = *((_QWORD *)v17 + 1);
    v20 = (objc_class *)objc_opt_class();
    -[_BSActionResponder originator_didInit:](v19, v20);
  }

  return v18;
}

- (BSAction)init
{
  return -[BSAction initWithInfo:timeout:forResponseOnQueue:withHandler:](self, "initWithInfo:timeout:forResponseOnQueue:withHandler:", 0, 0, 0, 0.0);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 0;
}

- (BSAction)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BSAction *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("r"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_BSActionResponder action_decodeFromXPCObject:]((uint64_t)_BSActionResponder, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (BSAction *)-[BSAction _initWithInfo:responder:](self, v5, v7);
  return v8;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_info, CFSTR("i"));
  -[_BSActionResponder action_encode:]((uint64_t)self->_responder, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("r"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BSAction *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("An %@ can only be decoded with an instance of NSXPCCoder; attempting to decode with %@"),
      v7,
      v9);

  }
  v10 = v4;
  objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("r"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_BSActionResponder action_decodeFromXPCObject:]((uint64_t)_BSActionResponder, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (BSAction *)-[BSAction _initWithInfo:responder:](self, v11, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  BSSettings *info;
  void *v7;
  void *v8;
  objc_class *v9;
  objc_class *v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v11;
    v5 = v4;
    info = self->_info;
    if (info)
      objc_msgSend(v4, "encodeObject:forKey:", info, CFSTR("i"));
    -[_BSActionResponder action_encode:]((uint64_t)self->_responder, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "encodeXPCObject:forKey:", v7, CFSTR("r"));
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("An %@ can only be encoded with an instance of NSXPCCoder; attempting to encode with %@"),
      v5,
      v7);
  }

}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  return 0;
}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, uint64_t);
  _BSActionResponder *responder;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  responder = self->_responder;
  v8 = v10;
  if (!v10)
  {
    +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, 4uLL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = -[_BSActionResponder action:sendResponse:]((uint64_t)responder, self, v8);
  if (v10)
  {
    if (!v6)
      goto LABEL_8;
    goto LABEL_7;
  }

  if (v6)
LABEL_7:
    v6[2](v6, v9);
LABEL_8:

}

- (BOOL)isValid
{
  return -[_BSActionResponder action_isValid]((os_unfair_lock_s *)self->_responder);
}

- (void)setInvalidationHandler:(id)a3
{
  -[_BSActionResponder action:setNullificationQueue:isLegacy:handler:]((uint64_t)self->_responder, self, 0, 1, a3);
}

- (void)setNullificationHandler:(id)a3
{
  -[_BSActionResponder action:setNullificationQueue:isLegacy:handler:]((uint64_t)self->_responder, self, 0, 0, a3);
}

- (BOOL)_expectsResponse
{
  _BSActionResponder *responder;

  responder = self->_responder;
  return !responder || !responder->_isOriginatorNull;
}

- (BOOL)isEqual:(id)a3
{
  BSAction *v4;
  BSAction *v5;
  _BSActionResponder *responder;
  char v7;
  uint64_t v8;
  BSSettings *info;
  BSSettings *v10;

  v4 = (BSAction *)a3;
  v5 = v4;
  if (self == v4)
    goto LABEL_11;
  responder = self->_responder;
  if (!responder)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_12;
  }
  v7 = 0;
  if (v4 && responder->_isOriginatorNull)
  {
    v8 = objc_opt_class();
    if (v8 != objc_opt_class())
      goto LABEL_6;
    info = self->_info;
    v10 = v5->_info;
    if (info != v10)
    {
      v7 = 0;
      if (info && v10)
        v7 = -[BSSettings isEqual:](info, "isEqual:");
      goto LABEL_12;
    }
LABEL_11:
    v7 = 1;
  }
LABEL_12:

  return v7;
}

- (NSString)debugDescription
{
  return (NSString *)-[BSAction debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSAction _descriptionBuilderWithMultilinePrefix:debug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
