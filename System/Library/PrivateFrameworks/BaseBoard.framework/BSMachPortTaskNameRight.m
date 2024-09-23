@implementation BSMachPortTaskNameRight

- (void)encodeWithXPCDictionary:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BSMachPortTaskNameRight;
  -[BSMachPortRight encodeWithXPCDictionary:](&v5, sel_encodeWithXPCDictionary_);
  xpc_dictionary_set_int64(a3, "pid", self->_pid);
  os_unfair_lock_lock(&self->_lock);
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey(self->_lock_auditToken, a3, "auditToken");
  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_auditToken, 0);
}

- (BSAuditToken)auditToken
{
  os_unfair_lock_s *p_lock;
  BSAuditToken *lock_auditToken;
  BSAuditToken *v5;
  _QWORD v7[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_auditToken = self->_lock_auditToken;
  if (!lock_auditToken)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__BSMachPortTaskNameRight_auditToken__block_invoke;
    v7[3] = &unk_1E1EBF3F8;
    v7[4] = self;
    -[BSMachPortRight accessPort:](self, "accessPort:", v7);
    lock_auditToken = self->_lock_auditToken;
  }
  v5 = lock_auditToken;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

void __37__BSMachPortTaskNameRight_auditToken__block_invoke(uint64_t a1, task_name_t a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  if (a2 - 1 <= 0xFFFFFFFD)
  {
    v12 = v2;
    v13 = v3;
    *(_QWORD *)&v5 = -1;
    *((_QWORD *)&v5 + 1) = -1;
    v10 = v5;
    v11 = v5;
    if (BSAuditTokenForTask(a2, &v10))
    {
      v9[0] = v10;
      v9[1] = v11;
      +[BSAuditToken tokenFromAuditToken:](BSAuditToken, "tokenFromAuditToken:", v9);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }
}

- (BSMachPortTaskNameRight)initWithXPCDictionary:(id)a3
{
  BSMachPortTaskNameRight *v4;
  objc_class *v5;
  BSAuditToken *lock_auditToken;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BSMachPortTaskNameRight;
  v4 = -[BSMachPortRight initWithXPCDictionary:](&v8, sel_initWithXPCDictionary_);
  if (v4)
  {
    v4->_pid = xpc_dictionary_get_int64(a3, "pid");
    v5 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey(a3, "auditToken");
    lock_auditToken = v4->_lock_auditToken;
    v4->_lock_auditToken = (BSAuditToken *)v5;

  }
  return v4;
}

- (BSMachPortTaskNameRight)initWithPID:(int)a3
{
  uint64_t v4;
  mach_error_t v5;
  NSObject *v6;
  BSMachPortTaskNameRight *v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD *v11;
  char *v13;
  mach_port_name_t tn;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  mach_error_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3 >= 1 && (v4 = *(_QWORD *)&a3, BSSandboxCanGetMachTaskName(a3)))
  {
    tn = 0;
    v5 = task_name_for_pid(*MEMORY[0x1E0C83DA0], v4, &tn);
    if (v5)
    {
      BSLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v13 = mach_error_string(v5);
        *(_DWORD *)buf = 67109634;
        v16 = v4;
        v17 = 2082;
        v18 = v13;
        v19 = 1024;
        v20 = v5;
        _os_log_error_impl(&dword_18A184000, v6, OS_LOG_TYPE_ERROR, "Unable to obtain a task name port right for pid %i: %{public}s (0x%x)", buf, 0x18u);
      }
      v7 = 0;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      BSProcessDescriptionForPID(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("task_name_for_pid:%@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _BSMachPortRightDescription(3u, 0, (uint64_t)v10, tn, 0);
      v6 = objc_claimAutoreleasedReturnValue();

      v11 = -[BSMachPortRight _initWithPort:type:owner:trace:](self, tn, 3, 0, v6);
      if (v11)
      {
        v11[12] = 0;
        v11[13] = v4;
      }
      self = v11;
      v7 = self;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)taskNameForPID:(int)a3
{
  uint64_t v3;
  void *v5;

  if (a3 < 1)
  {
    v5 = 0;
  }
  else
  {
    v3 = *(_QWORD *)&a3;
    if (BSSandboxCanGetMachTaskName(a3))
      v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPID:", v3);
    else
      v5 = 0;
  }
  return v5;
}

- (BSMachPortTaskNameRight)init
{
  return -[BSMachPortTaskNameRight initWithPID:](self, "initWithPID:", getpid());
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BSMachPortTaskNameRight;
  v4 = -[BSMachPortSendRight copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = (id *)v4;
  if (v4)
  {
    v4[13] = self->_pid;
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong(v5 + 5, self->_lock_auditToken);
    os_unfair_lock_unlock(&self->_lock);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSMachPortTaskNameRight)initWithCoder:(id)a3
{
  BSMachPortTaskNameRight *v4;
  uint64_t v5;
  BSAuditToken *lock_auditToken;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BSMachPortTaskNameRight;
  v4 = -[BSMachPortRight initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    v4->_pid = objc_msgSend(a3, "decodeIntForKey:", CFSTR("pid"));
    objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditToken"));
    v5 = objc_claimAutoreleasedReturnValue();
    lock_auditToken = v4->_lock_auditToken;
    v4->_lock_auditToken = (BSAuditToken *)v5;

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BSMachPortTaskNameRight;
  -[BSMachPortRight encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInt:forKey:", self->_pid, CFSTR("pid"));
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(a3, "encodeObject:forKey:", self->_lock_auditToken, CFSTR("auditToken"));
  os_unfair_lock_unlock(&self->_lock);
}

- (int)pid
{
  return self->_pid;
}

@end
