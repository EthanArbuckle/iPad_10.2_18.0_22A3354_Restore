@implementation BSMachPortRight

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trace, 0);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  os_unfair_lock_s *p_invalidationLock;
  void *v6;
  char v7;

  if (a3)
  {
    p_invalidationLock = &self->_invalidationLock;
    os_unfair_lock_lock(&self->_invalidationLock);
    os_unfair_lock_lock(&self->_lock);
    if (-[BSMachPortRight _lock_isUsable]((uint64_t)self))
    {
      v7 = 0;
      v6 = (void *)_BSMachPortTypeEncode(self->_type, self->_lock_port, &v7);
      if (v7)
        -[BSMachPortRight _lock_invalidateForOwner:]((uint64_t)self, 1);
      if (v6)
        xpc_dictionary_set_value(a3, "bsmpr_p", v6);

    }
    os_unfair_lock_unlock(&self->_lock);
    os_unfair_lock_unlock(p_invalidationLock);
    BSSerializeStringToXPCDictionaryWithKey(self->_trace, a3, "bsmpr_t");
  }
}

- (BOOL)isUsable
{
  BSMachPortRight *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[BSMachPortRight _lock_isUsable]((uint64_t)v2);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_lock_isUsable
{
  uint64_t v2;

  if (a1
    && (os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 20)),
        v2 = *(char *)(a1 + 32) - 1,
        v2 <= 2))
  {
    return BSMachPortIsType(*(_DWORD *)(a1 + 24), dword_18A21D3B8[v2]);
  }
  else
  {
    return 0;
  }
}

- (unsigned)rawPort
{
  return self->_rawPort;
}

- (const)_port
{
  const os_unfair_lock *v1;
  os_unfair_lock_s *v2;
  uint32_t os_unfair_lock_opaque;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 5;
    os_unfair_lock_lock(a1 + 5);
    os_unfair_lock_assert_owner(v1 + 5);
    os_unfair_lock_opaque = v1[6]._os_unfair_lock_opaque;
    if (os_unfair_lock_opaque + 1 >= 2)
      v1 = (const os_unfair_lock *)os_unfair_lock_opaque;
    else
      v1 = 0;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

uint64_t __38__BSMachPortRight_matchesPortOfRight___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  int v6;
  uint64_t v7;
  uint64_t v8;

  if ((a2 - 1) <= 0xFFFFFFFD)
  {
    v7 = v2;
    v8 = v3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__BSMachPortRight_matchesPortOfRight___block_invoke_2;
    v5[3] = &unk_1E1EBF380;
    v4 = *(void **)(result + 32);
    v5[4] = *(_QWORD *)(result + 40);
    v6 = a2;
    return objc_msgSend(v4, "accessPort:", v5);
  }
  return result;
}

- (BOOL)matchesPortOfRight:(id)a3
{
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__BSMachPortRight_matchesPortOfRight___block_invoke;
    v5[3] = &unk_1E1EBF3A8;
    v5[4] = self;
    v5[5] = &v6;
    objc_msgSend(a3, "accessPort:", v5);
    v3 = *((_BYTE *)v7 + 24) != 0;
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)accessPort:(id)a3
{
  os_unfair_lock_s *p_lock;
  int lock_accessCount;
  unsigned int lock_port;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_accessCount = self->_lock_accessCount;
  if (lock_accessCount == 255)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSMachPortRight.m"), 191, CFSTR("_lock_accessCount overflow"));

    lock_accessCount = self->_lock_accessCount;
  }
  self->_lock_accessCount = lock_accessCount + 1;
  if (!lock_accessCount)
  {
    os_unfair_lock_unlock(p_lock);
    os_unfair_lock_lock(&self->_invalidationLock);
    os_unfair_lock_lock(p_lock);
  }
  os_unfair_lock_assert_owner(p_lock);
  lock_port = self->_lock_port;
  if (lock_port + 1 >= 2)
    v9 = lock_port;
  else
    v9 = 0;
  os_unfair_lock_unlock(p_lock);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v9);
  os_unfair_lock_lock(p_lock);
  v10 = self->_lock_accessCount;
  if (!self->_lock_accessCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSMachPortRight.m"), 201, CFSTR("_lock_accessCount underflow"));

    v10 = self->_lock_accessCount;
  }
  self->_lock_accessCount = v10 - 1;
  os_unfair_lock_unlock(p_lock);
  if (v10 == 1)
    os_unfair_lock_unlock(&self->_invalidationLock);
}

uint64_t __38__BSMachPortRight_matchesPortOfRight___block_invoke_2(uint64_t result, int a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(result + 40) == a2;
  return result;
}

- (NSString)trace
{
  return self->_trace;
}

- (BSMachPortRight)initWithXPCDictionary:(id)a3
{
  unsigned int v5;
  void *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  BSMachPortRight *v10;

  v5 = objc_msgSend((id)objc_opt_class(), "_type");
  xpc_dictionary_get_value(a3, "bsmpr_p");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _BSMachPortTypeDecode(v5, v6);

  v8 = (char *)BSCreateDeserializedStringFromXPCDictionaryWithKey(a3, "bsmpr_t");
  _BSMachPortRightDescription(v5, 0, (uint64_t)CFSTR("xpcCode"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (BSMachPortRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v7, v5, 0, v9);

  return v10;
}

- (unsigned)extractPortAndIKnowWhatImDoingISwear
{
  os_unfair_lock_s *p_invalidationLock;
  unsigned int lock_port;

  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_lock(&self->_invalidationLock);
  os_unfair_lock_lock(&self->_lock);
  if (self->_owner || (lock_port = self->_lock_port, lock_port + 1 < 2))
    lock_port = 0;
  else
    -[BSMachPortRight _lock_invalidateForOwner:]((uint64_t)self, 1);
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_lock_unlock(p_invalidationLock);
  return lock_port;
}

- (void)dealloc
{
  objc_super v3;

  -[BSMachPortRight invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BSMachPortRight;
  -[BSMachPortRight dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_invalidationLock;

  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_lock(&self->_invalidationLock);
  os_unfair_lock_lock(&self->_lock);
  -[BSMachPortRight _lock_invalidateForOwner:]((uint64_t)self, self->_owner);
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_lock_unlock(p_invalidationLock);
}

- (void)_lock_invalidateForOwner:(uint64_t)a1
{
  NSObject *v4;
  int v5;
  mach_port_name_t v6;
  id v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 20));
    if (*(_DWORD *)(a1 + 24))
    {
      BSLogMachPort();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v7 = (id)objc_opt_class();
        if (-[BSMachPortRight _lock_isUsable](a1))
          v8 = CFSTR("YES");
        else
          v8 = CFSTR("NO");
        v9 = *(_QWORD *)(a1 + 8);
        objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138544642;
        v13 = v7;
        v14 = 2048;
        v15 = a1;
        v16 = 2112;
        v17 = v8;
        v18 = 2114;
        v19 = v9;
        v20 = 2114;
        v21 = v10;
        v22 = 2114;
        v23 = v11;
        _os_log_debug_impl(&dword_18A184000, v4, OS_LOG_TYPE_DEBUG, " *|machport|* invalidate <%{public}@:%p usable=%@ %{public}@> -> (%{public}@) %{public}@", (uint8_t *)&v12, 0x3Eu);

      }
      if (!a2)
      {
        v5 = *(char *)(a1 + 32);
        v6 = *(_DWORD *)(a1 + 24);
        if ((v5 - 2) >= 2)
        {
          if (v5 == 1)
            BSMachReceiveRightRelease(v6);
        }
        else
        {
          BSMachSendRightRelease(v6);
        }
      }
      *(_DWORD *)(a1 + 24) = 0;
    }
  }
}

- (_QWORD)_initWithPort:(char)a3 type:(int)a4 owner:(void *)a5 trace:
{
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  objc_super v18;
  uint8_t buf[4];
  _QWORD *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v18.receiver = a1;
  v18.super_class = (Class)BSMachPortRight;
  v9 = objc_msgSendSuper2(&v18, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(a5, "copy");
    v11 = (void *)v9[1];
    v9[1] = v10;

    v9[2] = 0;
    *((_DWORD *)v9 + 6) = a2;
    *((_DWORD *)v9 + 7) = a2;
    *((_BYTE *)v9 + 32) = a3;
    *((_BYTE *)v9 + 33) = a4;
    BSLogMachPort();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v9;
      v21 = 2114;
      v22 = v13;
      v23 = 2114;
      v24 = v14;
      _os_log_debug_impl(&dword_18A184000, v12, OS_LOG_TYPE_DEBUG, " *|machport|* %{public}@ -> (%{public}@) %{public}@", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = objc_claimAutoreleasedReturnValue();
    v12 = v15;
    v16 = CFSTR("external ");
    if (!a4)
      v16 = &stru_1E1EC08D0;
    -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithPort_type_owner_trace_, 0, CFSTR("BSMachPortRight.m"), 159, CFSTR("failed to create wrapping object for %@port=%x with trace=%@"), v16, a2, a5);
  }

  return v9;
}

- (BSMachPortRight)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSMachPortRight.m"), 165, CFSTR("you cannot alloc a BSMachPortRight directly - use one of the exposed initializers instead"));

  return (BSMachPortRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, 0, 0, 0, 0);
}

- (BOOL)isValid
{
  BSMachPortRight *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_port - 1 < 0xFFFFFFFE;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (char)_type
{
  return 0;
}

- (NSString)description
{
  void *v3;
  id v4;
  NSString *trace;
  id v6;
  void *v7;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BSMachPortRight isUsable](self, "isUsable"), CFSTR("usable"));
  trace = self->_trace;
  if (trace)
    v6 = (id)objc_msgSend(v3, "appendObject:withName:", trace, 0);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSMachPortRight)initWithCoder:(id)a3
{
  signed int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BSMachPortRight *v13;
  objc_class *v15;
  id v16;
  objc_class *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_opt_class(), "_type");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5 - 1;
    if (v6 > 2)
      v7 = MEMORY[0x1E0C81350];
    else
      v7 = qword_1E1EBF438[v6];
    objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", v7, CFSTR("bsmpr_p"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _BSMachPortTypeDecode(v5, v10);

  }
  else
  {
    BSLogMachPort();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v16;
      v21 = 2112;
      v22 = v18;
      _os_log_error_impl(&dword_18A184000, v8, OS_LOG_TYPE_ERROR, "An %@ can not be coded by an instance of %@", (uint8_t *)&v19, 0x16u);

    }
    v9 = 0;
  }
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bsmpr_t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _BSMachPortRightDescription(v5, 0, (uint64_t)CFSTR("secCode"), v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (BSMachPortRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v9, v5, 0, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  objc_class *v8;
  void *v9;
  id v10;
  char v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    os_unfair_lock_lock(&self->_invalidationLock);
    os_unfair_lock_lock(&self->_lock);
    if (-[BSMachPortRight _lock_isUsable]((uint64_t)self))
    {
      v11 = 0;
      v5 = (void *)_BSMachPortTypeEncode(self->_type, self->_lock_port, &v11);
      if (v11)
        -[BSMachPortRight _lock_invalidateForOwner:]((uint64_t)self, 1);
      if (v5)
        objc_msgSend(a3, "encodeXPCObject:forKey:", v5, CFSTR("bsmpr_p"));

    }
    os_unfair_lock_unlock(&self->_lock);
    os_unfair_lock_unlock(&self->_invalidationLock);
    objc_msgSend(a3, "encodeObject:forKey:", self->_trace, CFSTR("bsmpr_t"));
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("An %@ can only be encoded with an instance of XPCEncoder; attempting to encode with a %@"),
      v10,
      v9);

  }
}

@end
