@implementation BSServiceConnectionEndpoint

- (void)encodeWithBSXPCCoder:(id)a3
{
  uint64_t targetPID;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeXPCObject:forKey:", self->_endpoint, CFSTR("e"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_oneshot, CFSTR("o"));
  if (self->_nonLaunching)
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("nl"));
  targetPID = self->_targetPID;
  if ((_DWORD)targetPID)
    objc_msgSend(v5, "encodeInt64:forKey:", targetPID, CFSTR("p"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetDescription, CFSTR("t"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_service, CFSTR("s"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_instance, CFSTR("i"));

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  uint64_t targetPID;
  id v10;

  v10 = a3;
  if (self->_endpoint)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "encodeXPCObject:forKey:", self->_endpoint, CFSTR("e"));
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("An %@ can not be coded by an instance of %@"), v6, v8);

    }
  }
  objc_msgSend(v10, "encodeObject:forKey:", self->_oneshot, CFSTR("o"));
  if (self->_nonLaunching)
    objc_msgSend(v10, "encodeBool:forKey:", 1, CFSTR("nl"));
  targetPID = self->_targetPID;
  if ((_DWORD)targetPID)
    objc_msgSend(v10, "encodeInt:forKey:", targetPID, CFSTR("p"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_targetDescription, CFSTR("t"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_service, CFSTR("s"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_instance, CFSTR("i"));

}

+ (NSString)defaultShellMachName
{
  return (NSString *)CFSTR("com.apple.frontboard.systemappservices");
}

- (unint64_t)hash
{
  OS_xpc_object *endpoint;
  size_t v4;
  NSUInteger v5;

  endpoint = self->_endpoint;
  if (endpoint)
    v4 = xpc_hash(endpoint);
  else
    v4 = 0;
  v5 = -[NSString hash](self->_service, "hash") ^ v4;
  return v5 ^ -[NSString hash](self->_instance, "hash");
}

- (BOOL)isEqual:(id)a3
{
  BSServiceConnectionEndpoint *v4;
  uint64_t v5;
  char v6;
  OS_xpc_object *endpoint;
  OS_xpc_object *v9;

  v4 = (BSServiceConnectionEndpoint *)a3;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_5;
  }
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    endpoint = self->_endpoint;
    v9 = v4->_endpoint;
    if (endpoint)
    {
      if (!v9 || !xpc_equal(endpoint, v9))
        goto LABEL_3;
    }
    else if (v9)
    {
      goto LABEL_3;
    }
    if (BSEqualStrings())
    {
      v6 = BSEqualStrings();
      goto LABEL_5;
    }
  }
LABEL_3:
  v6 = 0;
LABEL_5:

  return v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSString)service
{
  return self->_service;
}

- (NSString)targetDescription
{
  if (self->_targetDescription)
    return self->_targetDescription;
  else
    return (NSString *)CFSTR("<null>");
}

- (BOOL)isNonLaunching
{
  return self->_nonLaunching;
}

- (NSString)instance
{
  return self->_instance;
}

- (BOOL)isNullEndpoint
{
  return !self->_endpoint && self->_targetDescription == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneshot, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_targetDescription, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)endpointForMachName:(id)a3 service:(id)a4 instance:(id)a5
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id v11;
  void *bs_named;
  BSServiceConnectionEndpoint *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = 0;
  if (v7 && v8)
  {
    v11 = objc_retainAutorelease(v7);
    objc_msgSend(v11, "UTF8String");
    bs_named = (void *)xpc_endpoint_create_bs_named();
    if (bs_named)
    {
      v13 = [BSServiceConnectionEndpoint alloc];
      __escaped(v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:](v13, bs_named, 0, 0, 0, v14, v8, v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)_initWithEndpoint:(void *)a3 oneshot:(char)a4 isNonLaunching:(int)a5 targetPID:(void *)a6 targetDescription:(void *)a7 service:(void *)a8 instance:
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id *v21;
  id *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v32;
  id v33;
  objc_class *v34;
  void *v35;
  void *v36;
  id v37;
  objc_class *v38;
  void *v39;
  void *v40;
  id v41;
  objc_class *v42;
  void *v43;
  void *v44;
  id v45;
  objc_class *v46;
  void *v47;
  void *v48;
  id v49;
  objc_class *v50;
  void *v51;
  void *v52;
  id v53;
  objc_class *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  objc_super v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  const __CFString *v68;
  __int16 v69;
  int v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v56 = a2;
  v16 = a3;
  v59 = a6;
  v58 = a7;
  v57 = a8;
  if (a1)
  {
    v17 = v16;
    if (v17)
    {
      NSClassFromString(CFSTR("NSUUID"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithEndpoint_oneshot_isNonLaunching_targetPID_targetDescription_service_instance_);
          v45 = (id)objc_claimAutoreleasedReturnValue();
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v62 = v45;
          v63 = 2114;
          v64 = v47;
          v65 = 2048;
          v66 = a1;
          v67 = 2114;
          v68 = CFSTR("BSServiceConnectionEndpoint.m");
          v69 = 1024;
          v70 = 114;
          v71 = 2114;
          v72 = v44;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7AB5D0);
      }
    }

    v18 = v59;
    if (v18)
    {
      NSClassFromString(CFSTR("NSString"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithEndpoint_oneshot_isNonLaunching_targetPID_targetDescription_service_instance_);
          v49 = (id)objc_claimAutoreleasedReturnValue();
          v50 = (objc_class *)objc_opt_class();
          NSStringFromClass(v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v62 = v49;
          v63 = 2114;
          v64 = v51;
          v65 = 2048;
          v66 = a1;
          v67 = 2114;
          v68 = CFSTR("BSServiceConnectionEndpoint.m");
          v69 = 1024;
          v70 = 115;
          v71 = 2114;
          v72 = v48;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7AB6D0);
      }
    }

    v19 = v58;
    NSClassFromString(CFSTR("NSString"));
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithEndpoint_oneshot_isNonLaunching_targetPID_targetDescription_service_instance_);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v62 = v33;
        v63 = 2114;
        v64 = v35;
        v65 = 2048;
        v66 = a1;
        v67 = 2114;
        v68 = CFSTR("BSServiceConnectionEndpoint.m");
        v69 = 1024;
        v70 = 116;
        v71 = 2114;
        v72 = v32;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7AB2D8);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithEndpoint_oneshot_isNonLaunching_targetPID_targetDescription_service_instance_);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v62 = v37;
        v63 = 2114;
        v64 = v39;
        v65 = 2048;
        v66 = a1;
        v67 = 2114;
        v68 = CFSTR("BSServiceConnectionEndpoint.m");
        v69 = 1024;
        v70 = 116;
        v71 = 2114;
        v72 = v36;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7AB3D8);
    }

    v20 = v57;
    if (v20)
    {
      NSClassFromString(CFSTR("NSString"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithEndpoint_oneshot_isNonLaunching_targetPID_targetDescription_service_instance_);
          v53 = (id)objc_claimAutoreleasedReturnValue();
          v54 = (objc_class *)objc_opt_class();
          NSStringFromClass(v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v62 = v53;
          v63 = 2114;
          v64 = v55;
          v65 = 2048;
          v66 = a1;
          v67 = 2114;
          v68 = CFSTR("BSServiceConnectionEndpoint.m");
          v69 = 1024;
          v70 = 117;
          v71 = 2114;
          v72 = v52;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7AB7D0);
      }
    }

    if (!v56 && v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("if we don't have an endpoint then we can only be the null endpoint which shouldn't have a description %@"), v18);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithEndpoint_oneshot_isNonLaunching_targetPID_targetDescription_service_instance_);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v62 = v41;
        v63 = 2114;
        v64 = v43;
        v65 = 2048;
        v66 = a1;
        v67 = 2114;
        v68 = CFSTR("BSServiceConnectionEndpoint.m");
        v69 = 1024;
        v70 = 118;
        v71 = 2114;
        v72 = v40;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7AB4D0);
    }
    v60.receiver = a1;
    v60.super_class = (Class)BSServiceConnectionEndpoint;
    v21 = (id *)objc_msgSendSuper2(&v60, sel_init);
    v22 = v21;
    if (v21)
    {
      objc_storeStrong(v21 + 5, a2);
      v23 = objc_msgSend(v17, "copy");
      v24 = v22[6];
      v22[6] = (id)v23;

      *((_BYTE *)v22 + 20) = a4;
      *((_DWORD *)v22 + 4) = a5;
      v25 = objc_msgSend(v18, "copy");
      v26 = v22[1];
      v22[1] = (id)v25;

      v27 = objc_msgSend(v19, "copy");
      v28 = v22[3];
      v22[3] = (id)v27;

      v29 = objc_msgSend(v20, "copy");
      v30 = v22[4];
      v22[4] = (id)v29;

    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BSServiceConnectionEndpoint)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  BSServiceConnectionEndpoint *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("p"));
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81308], CFSTR("e"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("o"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("nl"));
  if ((unint64_t)(v5 - 0x80000000) >= 0xFFFFFFFF80000001)
    v9 = v5;
  else
    v9 = 0;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("t"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("s"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("i"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __decodedEndpoint(self, v6, v7, v8, v9, v10, v11, v12, CFSTR("BSXPCSecureCoding"));
  v13 = (BSServiceConnectionEndpoint *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BSServiceConnectionEndpoint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  BSServiceConnectionEndpoint *v13;
  objc_class *v15;
  id v16;
  objc_class *v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("e")))
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BSServiceInjectionLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v16;
      v21 = 2112;
      v22 = v18;
      _os_log_error_impl(&dword_19A799000, v6, OS_LOG_TYPE_ERROR, "An %@ can not be coded by an instance of %@", buf, 0x16u);

    }
    goto LABEL_7;
  }
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81308], CFSTR("e"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v7 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("p"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("o"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("nl"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("t"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("s"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __decodedEndpoint(self, v5, v8, v9, v7 & ~(v7 >> 31), v10, v11, v12, CFSTR("NSSecureCoding"));
  v13 = (BSServiceConnectionEndpoint *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)endpointForServiceName:(id)a3 oneshot:(id)a4 service:(id)a5 instance:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  uint64_t bs_service;
  void *v15;
  BSServiceConnectionEndpoint *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = 0;
  if (v9 && v11)
  {
    if (v10)
    {
      v19[0] = 0;
      v19[1] = 0;
      objc_msgSend(v10, "getUUIDBytes:", v19);
      objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      bs_service = xpc_endpoint_create_bs_service();
    }
    else
    {
      objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      bs_service = xpc_endpoint_create_bs_service();
    }
    v15 = (void *)bs_service;
    if (bs_service)
    {
      v16 = [BSServiceConnectionEndpoint alloc];
      BSServiceConnectionEndpointTargetDescriptionForServiceLookup(v9, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:](v16, v15, v10, 0, 0, v17, v11, v12);

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

+ (id)endpointOfLaunchIdentifier:(id)a3 fromLaunchResponse:(id)a4 withService:(id)a5 instance:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v46 = a6;
  v48 = v11;
  NSClassFromString(CFSTR("NSString"));
  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v62 = v33;
      v63 = 2114;
      v64 = CFSTR("BSServiceConnectionEndpoint.m");
      v65 = 1024;
      v66 = 274;
      v67 = 2114;
      v68 = v32;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BAE78);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v62 = v35;
      v63 = 2114;
      v64 = CFSTR("BSServiceConnectionEndpoint.m");
      v65 = 1024;
      v66 = 274;
      v67 = 2114;
      v68 = v34;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BAF4CLL);
  }

  v14 = v12;
  NSClassFromString(CFSTR("RBSLaunchResponse"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v62 = v37;
      v63 = 2114;
      v64 = CFSTR("BSServiceConnectionEndpoint.m");
      v65 = 1024;
      v66 = 275;
      v67 = 2114;
      v68 = v36;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BB020);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:RBSLaunchResponseClass]"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v62 = v39;
      v63 = 2114;
      v64 = CFSTR("BSServiceConnectionEndpoint.m");
      v65 = 1024;
      v66 = 275;
      v67 = 2114;
      v68 = v38;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BB0F4);
  }

  v15 = v13;
  NSClassFromString(CFSTR("NSString"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v62 = v41;
      v63 = 2114;
      v64 = CFSTR("BSServiceConnectionEndpoint.m");
      v65 = 1024;
      v66 = 276;
      v67 = 2114;
      v68 = v40;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BB1C8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v62 = v43;
      v63 = 2114;
      v64 = CFSTR("BSServiceConnectionEndpoint.m");
      v65 = 1024;
      v66 = 276;
      v67 = 2114;
      v68 = v42;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BB29CLL);
  }

  v16 = v46;
  if (v16)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v62 = v45;
        v63 = 2114;
        v64 = CFSTR("BSServiceConnectionEndpoint.m");
        v65 = 1024;
        v66 = 277;
        v67 = 2114;
        v68 = v44;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7BB370);
    }
  }

  objc_msgSend(v14, "process");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedEndpointByLaunchIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKey:", v48);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17 && v18)
  {
    objc_msgSend(v18, "endpoint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v17, "identity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isXPCService"))
      {
        objc_msgSend(v21, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        BSServiceConnectionEndpointTargetDescriptionForServiceLookup(v23, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v19, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        __escaped(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
      }

      v27 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:]([BSServiceConnectionEndpoint alloc], v20, v22, objc_msgSend(v19, "isNonLaunching"), 0, v24, v15, v16);
    }
    else
    {
      if (!a7)
      {
        v20 = 0;
        v27 = 0;
        goto LABEL_25;
      }
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D98];
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __104__BSServiceConnectionEndpoint_endpointOfLaunchIdentifier_fromLaunchResponse_withService_instance_error___block_invoke;
      v56[3] = &unk_1E390DFD0;
      v57 = v19;
      v58 = v48;
      v59 = v17;
      v60 = v14;
      objc_msgSend(v28, "bs_errorWithDomain:code:configuration:", v29, 1, v56);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      v27 = 0;
      v21 = v57;
    }

LABEL_25:
    goto LABEL_26;
  }
  if (a7)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    if (v17)
    {
      v26 = *MEMORY[0x1E0CB2D98];
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __104__BSServiceConnectionEndpoint_endpointOfLaunchIdentifier_fromLaunchResponse_withService_instance_error___block_invoke_2;
      v51[3] = &unk_1E390DFD0;
      v52 = v48;
      v53 = v17;
      v54 = v47;
      v55 = v14;
      objc_msgSend(v25, "bs_errorWithDomain:code:configuration:", v26, 56, v51);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      v27 = 0;
      v20 = v52;
    }
    else
    {
      v30 = *MEMORY[0x1E0CB2FE0];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __104__BSServiceConnectionEndpoint_endpointOfLaunchIdentifier_fromLaunchResponse_withService_instance_error___block_invoke_3;
      v49[3] = &unk_1E390DFF8;
      v50 = v14;
      objc_msgSend(v25, "bs_errorWithDomain:code:configuration:", v30, 3, v49);
      v27 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v50;
    }
    goto LABEL_25;
  }
  v27 = 0;
LABEL_26:

  return v27;
}

- (BSServiceConnectionEndpoint)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSServiceConnectionEndpoint *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServiceConnectionEndpoint *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BSServiceConnectionEndpoint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
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
    v16 = CFSTR("BSServiceConnectionEndpoint.m");
    v17 = 1024;
    v18 = 109;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSServiceConnectionEndpoint *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initForNullEndpointWithService:(void *)a3 instance:
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (a1)
    a1 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:](a1, 0, 0, 0, 0, 0, v5, v6);

  return a1;
}

+ (id)endpointForSystemMachName:(id)a3 service:(id)a4 instance:(id)a5
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id v11;
  void *bs_named;
  BSServiceConnectionEndpoint *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = 0;
  if (v7 && v8)
  {
    v11 = objc_retainAutorelease(v7);
    objc_msgSend(v11, "UTF8String");
    bs_named = (void *)xpc_endpoint_create_bs_named();
    if (bs_named)
    {
      v13 = [BSServiceConnectionEndpoint alloc];
      __escaped(v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:](v13, bs_named, 0, 0, 0, v14, v8, v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v5;
  NSComparisonResult v6;
  OS_xpc_object *endpoint;
  void *v9;
  OS_xpc_object *v10;
  id v11;
  uint64_t v12;
  NSString *instance;
  NSUUID *oneshot;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  objc_class *v19;
  __CFString *v20;
  void *v21;
  id v22;
  objc_class *v23;
  __CFString *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  _BYTE v30[18];
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("BSServiceConnectionEndpoint"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v26 = v18;
      v27 = 2114;
      v28 = v20;
      v29 = 2048;
      *(_QWORD *)v30 = self;
      *(_WORD *)&v30[8] = 2114;
      *(_QWORD *)&v30[10] = CFSTR("BSServiceConnectionEndpoint.m");
      v31 = 1024;
      v32 = 195;
      v33 = 2114;
      v34 = v17;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7DD2DCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v26 = v22;
      v27 = 2114;
      v28 = v24;
      v29 = 2048;
      *(_QWORD *)v30 = self;
      *(_WORD *)&v30[8] = 2114;
      *(_QWORD *)&v30[10] = CFSTR("BSServiceConnectionEndpoint.m");
      v31 = 1024;
      v32 = 195;
      v33 = 2114;
      v34 = v21;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7DD3DCLL);
  }

  v6 = -[NSString compare:](self->_service, "compare:", v5[3]);
  if (v6 == NSOrderedSame)
  {
    if ((BSEqualStrings() & 1) == 0)
    {
      instance = self->_instance;
      if (!instance)
        goto LABEL_17;
      if (!v5[4])
        goto LABEL_26;
      v6 = -[NSString compare:](instance, "compare:");
      if (v6)
        goto LABEL_4;
    }
    endpoint = self->_endpoint;
    v9 = (void *)v5[5];
    if (endpoint)
    {
      if (!v9)
        goto LABEL_26;
      v10 = endpoint;
      v11 = v9;
      v12 = xpc_endpoint_compare();
      if ((_DWORD)v12 == -1)
      {
        v6 = NSOrderedAscending;
LABEL_19:

        goto LABEL_4;
      }
      if ((_DWORD)v12)
      {
        if ((_DWORD)v12 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid xpc_endpoint_compare result : %i l=%@ r=%@"), v12, v10, v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSComparisonResult __endpointCompare(__strong xpc_endpoint_t, __strong xpc_endpoint_t)");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v26 = v16;
            v27 = 2114;
            v28 = CFSTR("BSServiceConnectionEndpoint.m");
            v29 = 1024;
            *(_DWORD *)v30 = 52;
            *(_WORD *)&v30[4] = 2114;
            *(_QWORD *)&v30[6] = v15;
            _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

          }
          objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A7DD1DCLL);
        }
        v6 = NSOrderedDescending;
        goto LABEL_19;
      }

    }
    else if (v9)
    {
      goto LABEL_17;
    }
    if ((BSEqualObjects() & 1) != 0)
    {
      v6 = NSOrderedSame;
      goto LABEL_4;
    }
    oneshot = self->_oneshot;
    if (oneshot)
    {
      if (v5[6])
      {
        v6 = -[NSUUID compare:](oneshot, "compare:");
        goto LABEL_4;
      }
LABEL_26:
      v6 = NSOrderedDescending;
      goto LABEL_4;
    }
LABEL_17:
    v6 = NSOrderedAscending;
  }
LABEL_4:

  return v6;
}

+ (id)nullEndpointForService:(id)a3 instance:(id)a4
{
  id v5;
  id v6;
  id *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[BSServiceConnectionEndpoint _initForNullEndpointWithService:instance:]((id *)[BSServiceConnectionEndpoint alloc], v5, v6);

  return v7;
}

- (void)saveAsInjectorEndowmentForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  char v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE buf[24];
  void *v18;
  uint64_t *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v5 = (void *)_MergedGlobals_10;
  v16 = _MergedGlobals_10;
  if (!_MergedGlobals_10)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getRBSServiceClass_block_invoke;
    v18 = &unk_1E390CE38;
    v19 = &v13;
    __getRBSServiceClass_block_invoke((uint64_t)buf);
    v5 = (void *)v14[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  -[BSServiceConnectionEndpoint _endowmentRepresentation](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v6, "saveEndowment:forKey:withError:", v7, v4, &v12);
  v9 = v12;

  if (v9)
    v10 = 0;
  else
    v10 = v8;
  if ((v10 & 1) == 0)
  {
    BSServiceInjectionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      v18 = v9;
      _os_log_error_impl(&dword_19A799000, v11, OS_LOG_TYPE_ERROR, "BSServiceConnectionEndpoint: error saving as injector endowment for '%@' : endpoint=%@, error=%@", buf, 0x20u);
    }

  }
}

- (_QWORD)_endowmentRepresentation
{
  _QWORD *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)v1[5];
    if (v3)
    {
      v4 = v3;
      v5 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
      objc_msgSend(v5, "_setEndpoint:", v4);

      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("e"));
    }
    v6 = v1[6];
    if (v6)
      objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("o"));
    if (*((_BYTE *)v1 + 20))
      objc_msgSend(v2, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("nl"));
    if (*((_DWORD *)v1 + 4))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("p"));

    }
    v8 = v1[1];
    if (v8)
      objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("t"));
    objc_msgSend(v2, "setObject:forKey:", v1[3], CFSTR("s"));
    v9 = v1[4];
    if (v9)
      objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("i"));
    v1 = (_QWORD *)objc_msgSend(v2, "copy");

  }
  return v1;
}

void __104__BSServiceConnectionEndpoint_endpointOfLaunchIdentifier_fromLaunchResponse_withService_instance_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setFailureReason:", CFSTR("invalid xpcEndpoint for %@ with launch identifier '%@' from %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnderlyingError:", v3);

}

void __104__BSServiceConnectionEndpoint_endpointOfLaunchIdentifier_fromLaunchResponse_withService_instance_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setFailureReason:", CFSTR("could not find launch identifier '%@' in returned endpoints of %@ : %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnderlyingError:", v3);

}

void __104__BSServiceConnectionEndpoint_endpointOfLaunchIdentifier_fromLaunchResponse_withService_instance_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setFailureReason:", CFSTR("launch response did not return a process"));
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnderlyingError:", v3);

}

+ (id)_endpointForManager:(void *)a3 domain:(void *)a4 service:(void *)a5 instance:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  os_unfair_lock_s **v15;
  os_unfair_lock_s **v16;
  void *v17;
  char v18;
  os_unfair_lock_s *v19;
  void *v20;
  pid_t v21;
  os_unfair_lock_s *v22;
  id *v23;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  void *v29;
  id v30;
  objc_class *v31;
  void *v32;
  void *v33;
  id v34;
  objc_class *v35;
  void *v36;
  void *v37;
  id v38;
  objc_class *v39;
  void *v40;
  void *v41;
  id v42;
  objc_class *v43;
  void *v44;
  void *v45;
  id v46;
  objc_class *v47;
  void *v48;
  void *v49;
  id v50;
  objc_class *v51;
  void *v52;
  void *v53;
  id v54;
  objc_class *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  objc_class *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  int v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v65 = a3;
  v64 = a4;
  v9 = a5;
  v10 = objc_opt_self();
  v11 = v8;
  NSClassFromString(CFSTR("BSServiceManager"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v67 = v26;
      v68 = 2114;
      v69 = v28;
      v70 = 2048;
      v71 = v10;
      v72 = 2114;
      v73 = CFSTR("BSServiceConnectionEndpoint.m");
      v74 = 1024;
      v75 = 352;
      v76 = 2114;
      v77 = v25;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7DDD10);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceManagerClass]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v67 = v30;
      v68 = 2114;
      v69 = v32;
      v70 = 2048;
      v71 = v10;
      v72 = 2114;
      v73 = CFSTR("BSServiceConnectionEndpoint.m");
      v74 = 1024;
      v75 = 352;
      v76 = 2114;
      v77 = v29;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7DDE10);
  }

  v12 = v65;
  NSClassFromString(CFSTR("NSString"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v67 = v34;
      v68 = 2114;
      v69 = v36;
      v70 = 2048;
      v71 = v10;
      v72 = 2114;
      v73 = CFSTR("BSServiceConnectionEndpoint.m");
      v74 = 1024;
      v75 = 353;
      v76 = 2114;
      v77 = v33;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7DDF10);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v67 = v38;
      v68 = 2114;
      v69 = v40;
      v70 = 2048;
      v71 = v10;
      v72 = 2114;
      v73 = CFSTR("BSServiceConnectionEndpoint.m");
      v74 = 1024;
      v75 = 353;
      v76 = 2114;
      v77 = v37;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7DE010);
  }

  v13 = v64;
  NSClassFromString(CFSTR("NSString"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v67 = v42;
      v68 = 2114;
      v69 = v44;
      v70 = 2048;
      v71 = v10;
      v72 = 2114;
      v73 = CFSTR("BSServiceConnectionEndpoint.m");
      v74 = 1024;
      v75 = 354;
      v76 = 2114;
      v77 = v41;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7DE110);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      v47 = (objc_class *)objc_opt_class();
      NSStringFromClass(v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v67 = v46;
      v68 = 2114;
      v69 = v48;
      v70 = 2048;
      v71 = v10;
      v72 = 2114;
      v73 = CFSTR("BSServiceConnectionEndpoint.m");
      v74 = 1024;
      v75 = 354;
      v76 = 2114;
      v77 = v45;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7DE210);
  }

  v14 = v9;
  if (v14)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
        v58 = (id)objc_claimAutoreleasedReturnValue();
        v59 = v10;
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v67 = v58;
        v68 = 2114;
        v69 = v61;
        v70 = 2048;
        v71 = v59;
        v72 = 2114;
        v73 = CFSTR("BSServiceConnectionEndpoint.m");
        v74 = 1024;
        v75 = 355;
        v76 = 2114;
        v77 = v57;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v57), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7DE50CLL);
    }
  }

  -[BSServiceManager domainWithIdentifier:]((uint64_t)v11, v12);
  v15 = (os_unfair_lock_s **)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to find domain %@"), v12);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      v50 = (id)objc_claimAutoreleasedReturnValue();
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v67 = v50;
      v68 = 2114;
      v69 = v52;
      v70 = 2048;
      v71 = v10;
      v72 = 2114;
      v73 = CFSTR("BSServiceConnectionEndpoint.m");
      v74 = 1024;
      v75 = 359;
      v76 = 2114;
      v77 = v49;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7DE308);
  }
  -[BSServiceDomain listenerEndpoint](v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceDomain listenerEndpointOneshot](v16);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v10;
  v18 = -[BSXPCServiceConnectionListener isNonLaunching](v16[3]);
  v19 = v16[1];
  -[os_unfair_lock_s machName](v19, "machName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    v21 = 0;
  else
    v21 = getpid();

  v22 = v16[4];
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to get an endpoint for the service listener %@"), v22);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      v54 = (id)objc_claimAutoreleasedReturnValue();
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v67 = v54;
      v68 = 2114;
      v69 = v56;
      v70 = 2048;
      v71 = v62;
      v72 = 2114;
      v73 = CFSTR("BSServiceConnectionEndpoint.m");
      v74 = 1024;
      v75 = 367;
      v76 = 2114;
      v77 = v53;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v53), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7DE408);
  }
  v23 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:]([BSServiceConnectionEndpoint alloc], v17, v63, v18, v21, v22, v13, v14);

  return v23;
}

+ (id)_endpointFromEndowmentRepresentation:(uint64_t)a1
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  int v24;
  void *v25;
  id v26;
  char v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  void *v44;
  void *v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("p"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
    v5 = v3;
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v9 = v6;

    v10 = objc_msgSend(v9, "intValue");
    objc_msgSend(v2, "objectForKey:", CFSTR("e"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    v13 = v11;
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;

    v45 = v15;
    objc_msgSend(v15, "_endpoint");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("o"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    v18 = v16;
    if (v17)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
    }
    else
    {
      v19 = 0;
    }
    v20 = v19;

    objc_msgSend(v2, "objectForKey:", CFSTR("nl"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    v23 = v21;
    if (v22)
    {
      v24 = v10;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v23;
      else
        v25 = 0;
    }
    else
    {
      v24 = v10;
      v25 = 0;
    }
    v26 = v25;

    v27 = objc_msgSend(v26, "BOOLValue");
    objc_msgSend(v2, "objectForKey:", CFSTR("t"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_opt_class();
    v30 = v28;
    if (v29)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
    }
    else
    {
      v31 = 0;
    }
    v32 = v31;

    objc_msgSend(v2, "objectForKey:", CFSTR("s"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_opt_class();
    v35 = v33;
    if (v34)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v36 = v35;
      else
        v36 = 0;
    }
    else
    {
      v36 = 0;
    }
    v37 = v36;

    objc_msgSend(v2, "objectForKey:", CFSTR("i"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_opt_class();
    v40 = v38;
    if (v39)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v41 = v40;
      else
        v41 = 0;
    }
    else
    {
      v41 = 0;
    }
    v42 = v41;

    __decodedEndpoint(0, v44, v20, v27, v24 & ~(v24 >> 31), v32, v37, v42, CFSTR("endowment"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    BSServiceInjectionLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v2;
      _os_log_error_impl(&dword_19A799000, v7, OS_LOG_TYPE_ERROR, "BSServiceConnectionEndpoint: Unable to decode endowment : %@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  NSUUID *oneshot;
  unsigned __int8 uuid[8];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_endpoint)
    xpc_dictionary_set_value(v4, (const char *)objc_msgSend(CFSTR("e"), "UTF8String"), self->_endpoint);
  oneshot = self->_oneshot;
  if (oneshot)
  {
    *(_QWORD *)uuid = 0;
    v7 = 0;
    -[NSUUID getUUIDBytes:](oneshot, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, (const char *)objc_msgSend(CFSTR("o"), "UTF8String"), uuid);
  }
  if (self->_nonLaunching)
    xpc_dictionary_set_BOOL(v4, (const char *)objc_msgSend(CFSTR("nl"), "UTF8String"), 1);
  if (self->_targetPID)
    xpc_dictionary_set_int64(v4, (const char *)objc_msgSend(CFSTR("p"), "UTF8String"), self->_targetPID);
  objc_msgSend(CFSTR("t"), "UTF8String");
  BSSerializeStringToXPCDictionaryWithKey();
  objc_msgSend(CFSTR("s"), "UTF8String");
  BSSerializeStringToXPCDictionaryWithKey();
  objc_msgSend(CFSTR("i"), "UTF8String");
  BSSerializeStringToXPCDictionaryWithKey();

}

- (BSServiceConnectionEndpoint)initWithXPCDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t int64;
  void *v7;
  void *v8;
  char v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  BSServiceConnectionEndpoint *v14;
  int v16;

  v3 = a3;
  xpc_dictionary_get_value(v3, (const char *)objc_msgSend(CFSTR("e"), "UTF8String"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v3, (const char *)objc_msgSend(CFSTR("o"), "UTF8String"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int64 = xpc_dictionary_get_int64(v3, (const char *)objc_msgSend(CFSTR("p"), "UTF8String"));
  if (v4)
  {
    if (MEMORY[0x19AECADB4](v4) == MEMORY[0x1E0C81308])
      v7 = v4;
    else
      v7 = 0;
    if (!v5)
      goto LABEL_9;
  }
  else
  {
    v7 = 0;
    if (!v5)
    {
LABEL_9:
      v16 = 0;
      v8 = 0;
      goto LABEL_11;
    }
  }
  if (MEMORY[0x19AECADB4](v5) != MEMORY[0x1E0C813A0])
    goto LABEL_9;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", xpc_uuid_get_bytes(v5));
  v16 = 1;
LABEL_11:
  v9 = xpc_dictionary_get_BOOL(v3, (const char *)objc_msgSend(CFSTR("nl"), "UTF8String"));
  if ((unint64_t)(int64 - 0x80000000) >= 0xFFFFFFFF80000001)
    v10 = int64;
  else
    v10 = 0;
  objc_msgSend(CFSTR("t"), "UTF8String");
  v11 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
  objc_msgSend(CFSTR("s"), "UTF8String");
  v12 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
  objc_msgSend(CFSTR("i"), "UTF8String");
  v13 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
  __decodedEndpoint(self, v7, v8, v9, v10, v11, v12, v13, CFSTR("BSXPCCoding"));
  v14 = (BSServiceConnectionEndpoint *)objc_claimAutoreleasedReturnValue();

  if (v16)
  return v14;
}

- (NSString)description
{
  void *v3;
  NSString *v4;
  NSString *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_nonLaunching)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NL:%@"), self->_targetDescription);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_targetDescription;
  }
  v5 = v4;
  if (self->_endpoint)
  {
    objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v4, CFSTR("target"), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v6, CFSTR("target"), 0);

  }
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_service, CFSTR("service"), 0);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_instance, CFSTR("instance"), 1);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

@end
