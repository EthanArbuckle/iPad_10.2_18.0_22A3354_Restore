@implementation BKSHIDEventDeferringResolution

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t pid;
  unint64_t v6;
  BKSHIDEventDispatchingTarget *dispatchingTarget;

  v3 = -[BKSHIDEventDisplay hash](self->_display, "hash");
  v4 = -[BKSHIDEventDeferringEnvironment hash](self->_environment, "hash");
  pid = self->_pid;
  v6 = v3 ^ v4 ^ pid ^ -[BKSHIDEventDeferringToken hash](self->_token, "hash") ^ 0x19397;
  dispatchingTarget = self->_dispatchingTarget;
  if (dispatchingTarget)
    v6 ^= -[BKSHIDEventDispatchingTarget hash](dispatchingTarget, "hash");
  return v6;
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchingTarget, 0);
  objc_storeStrong((id *)&self->_processDescription, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventDeferringResolution *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = (BKSHIDEventDeferringResolution *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if ((v5 == objc_opt_class() || (v6 = objc_opt_class(), v6 == objc_opt_class()))
      && BSEqualObjects()
      && BSEqualObjects()
      && self->_pid == v4->_pid
      && BSEqualObjects()
      && self->_versionedPID == v4->_versionedPID)
    {
      v7 = BSEqualObjects();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)_initWithDisplay:(void *)a1 environment:(void *)a2 versionedPID:(void *)a3 pid:(uint64_t)a4 token:(int)a5 dispatchingTarget:(void *)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  objc_super v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("display != ((void *)0)"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v54 = v25;
      v55 = 2114;
      v56 = v27;
      v57 = 2048;
      v58 = a1;
      v59 = 2114;
      v60 = CFSTR("BKSHIDEventDeferringResolution.m");
      v61 = 1024;
      v62 = 74;
      v63 = 2114;
      v64 = v24;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F49E4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[display isKindOfClass:[BKSHIDEventDisplay class]]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v54 = v29;
      v55 = 2114;
      v56 = v31;
      v57 = 2048;
      v58 = a1;
      v59 = 2114;
      v60 = CFSTR("BKSHIDEventDeferringResolution.m");
      v61 = 1024;
      v62 = 75;
      v63 = 2114;
      v64 = v28;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F4ADCLL);
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("environment != ((void *)0)"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v54 = v33;
      v55 = 2114;
      v56 = v35;
      v57 = 2048;
      v58 = a1;
      v59 = 2114;
      v60 = CFSTR("BKSHIDEventDeferringResolution.m");
      v61 = 1024;
      v62 = 76;
      v63 = 2114;
      v64 = v32;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F4BD4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[environment isKindOfClass:[BKSHIDEventDeferringEnvironment class]]"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v54 = v37;
      v55 = 2114;
      v56 = v39;
      v57 = 2048;
      v58 = a1;
      v59 = 2114;
      v60 = CFSTR("BKSHIDEventDeferringResolution.m");
      v61 = 1024;
      v62 = 77;
      v63 = 2114;
      v64 = v36;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F4CCCLL);
  }
  if (a4 == -1)
  {
    if (a5 <= 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid pid"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (objc_class *)objc_opt_class();
        NSStringFromClass(v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v54 = v49;
        v55 = 2114;
        v56 = v51;
        v57 = 2048;
        v58 = a1;
        v59 = 2114;
        v60 = CFSTR("BKSHIDEventDeferringResolution.m");
        v61 = 1024;
        v62 = 82;
        v63 = 2114;
        v64 = v48;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0F4F9CLL);
    }
  }
  else
  {
    a5 = a4;
  }
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[token isKindOfClass:[BKSHIDEventDeferringToken class]]"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v54 = v41;
        v55 = 2114;
        v56 = v43;
        v57 = 2048;
        v58 = a1;
        v59 = 2114;
        v60 = CFSTR("BKSHIDEventDeferringResolution.m");
        v61 = 1024;
        v62 = 86;
        v63 = 2114;
        v64 = v40;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0F4DC4);
    }
  }
  v14 = objc_opt_class();
  if (v14 != objc_opt_class())
  {
    v15 = objc_opt_class();
    if (v15 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventDeferringResolution cannot be subclassed"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (objc_class *)objc_opt_class();
        NSStringFromClass(v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v54 = v45;
        v55 = 2114;
        v56 = v47;
        v57 = 2048;
        v58 = a1;
        v59 = 2114;
        v60 = CFSTR("BKSHIDEventDeferringResolution.m");
        v61 = 1024;
        v62 = 93;
        v63 = 2114;
        v64 = v44;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0F4EB0);
    }
  }
  v52.receiver = a1;
  v52.super_class = (Class)BKSHIDEventDeferringResolution;
  v16 = objc_msgSendSuper2(&v52, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v11, "copy");
    v18 = (void *)*((_QWORD *)v16 + 1);
    *((_QWORD *)v16 + 1) = v17;

    v19 = objc_msgSend(v12, "copy");
    v20 = (void *)*((_QWORD *)v16 + 2);
    *((_QWORD *)v16 + 2) = v19;

    *((_QWORD *)v16 + 3) = a4;
    *((_DWORD *)v16 + 8) = a5;
    v21 = objc_msgSend(v13, "copy");
    v22 = (void *)*((_QWORD *)v16 + 5);
    *((_QWORD *)v16 + 5) = v21;

    objc_storeStrong((id *)v16 + 7, 0);
  }

  return v16;
}

- (BKSHIDEventDeferringToken)token
{
  return self->_token;
}

- (BKSHIDEventDeferringEnvironment)environment
{
  return self->_environment;
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (NSString)processDescription
{
  return self->_processDescription;
}

- (int64_t)versionedPID
{
  return self->_versionedPID;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)_initWithCopyOf:(id *)a1
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)BKSHIDEventDeferringResolution;
    a1 = (id *)objc_msgSendSuper2(&v19, sel_init);
    if (a1)
    {
      v4 = objc_opt_class();
      if (v4 != objc_opt_class())
      {
        v5 = objc_opt_class();
        if (v5 != objc_opt_class())
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventDeferringResolution cannot be subclassed"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__initWithCopyOf_);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v21 = v16;
            v22 = 2114;
            v23 = v18;
            v24 = 2048;
            v25 = a1;
            v26 = 2114;
            v27 = CFSTR("BKSHIDEventDeferringResolution.m");
            v28 = 1024;
            v29 = 57;
            v30 = 2114;
            v31 = v15;
            _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18A126F78);
        }
      }
      v6 = objc_msgSend(v3[1], "copy");
      v7 = a1[1];
      a1[1] = (id)v6;

      v8 = objc_msgSend(v3[2], "copy");
      v9 = a1[2];
      a1[2] = (id)v8;

      a1[3] = v3[3];
      *((_DWORD *)a1 + 8) = *((_DWORD *)v3 + 8);
      v10 = objc_msgSend(v3[5], "copy");
      v11 = a1[5];
      a1[5] = (id)v10;

      objc_storeStrong(a1 + 7, v3[7]);
      v12 = objc_msgSend(v3[6], "copy");
      v13 = a1[6];
      a1[6] = (id)v12;

    }
  }

  return a1;
}

- (id)modifiedResolution:(id)a3
{
  void (**v4)(id, void *);
  void *v5;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[BKSHIDEventDeferringResolution mutableCopy](self, "mutableCopy");
  v4[2](v4, v5);

  return v5;
}

- (BKSHIDEventDeferringResolution)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDeferringResolution *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventDeferringResolution *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventDeferringResolution"));
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
    v16 = CFSTR("BKSHIDEventDeferringResolution.m");
    v17 = 1024;
    v18 = 51;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDeferringResolution *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventDeferringResolution _initWithCopyOf:]((id *)+[BKSMutableHIDEventDeferringResolution allocWithZone:](BKSMutableHIDEventDeferringResolution, "allocWithZone:", a3), self);
}

- (void)encodeWithCoder:(id)a3
{
  BKSHIDEventDisplay *display;
  id v5;

  display = self->_display;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", display, CFSTR("display"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_environment, CFSTR("environment"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_pid, CFSTR("pid"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_versionedPID, CFSTR("versionedPID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_token, CFSTR("token"));

}

- (BKSHIDEventDeferringResolution)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BKSHIDEventDeferringResolution *v21;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    v6 = objc_opt_class();
    if (v6 != objc_opt_class())
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0CB28A8];
      v25 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDeferringResolution: subclasses are not allowed : %@"), objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 4866, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v11);
LABEL_9:

      v21 = 0;
      goto LABEL_10;
    }
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("versionedPID"));
  v13 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pid"));
  v14 = v13;
  if (!v9 || !v10 || (int)v13 <= 0 && v12 == -1)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB28A8];
    v27 = *MEMORY[0x1E0CB2D68];
    v17 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromBSVersionedPID();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDeferringResolution: invalid display, environment or process : display=%@ environment=%@ vpid=%@ pid=%i"), v9, v10, v11, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 4866, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v20);

    goto LABEL_9;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v24 = -[BKSHIDEventDeferringResolution _initWithDisplay:environment:versionedPID:pid:token:dispatchingTarget:](self, v9, v10, v12, v14, v23);
  else
    v24 = 0;
  self = (BKSHIDEventDeferringResolution *)v24;

  v21 = self;
LABEL_10:

  return v21;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "debugStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKSHIDEventDeferringResolution *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__BKSHIDEventDeferringResolution_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (BKSHIDEventDispatchingTarget)dispatchingTarget
{
  return self->_dispatchingTarget;
}

- (BOOL)isBuffer
{
  return self->_isBuffer;
}

id __60__BKSHIDEventDeferringResolution_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id result;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 0);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 8);
  if (v4)
  {
    v5 = objc_msgSend(v4, "_isNullDisplay");
    v3 = *(_QWORD *)(a1 + 40);
    if ((v5 & 1) == 0)
    {
      v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(v3 + 8), CFSTR("display"));
      v3 = *(_QWORD *)(a1 + 40);
    }
  }
  if (objc_msgSend(*(id *)(v3 + 48), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), 0);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if ((unint64_t)(*(_QWORD *)(v7 + 24) + 1) >= 2)
      v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendVersionedPID:withName:");
    else
      v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(int *)(v7 + 32), CFSTR("pid"));
  }
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("token"), 1);
  result = (id)objc_msgSend(*(id *)(a1 + 32), "hasDebugStyle");
  if ((_DWORD)result)
    return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("dispatchingTarget"), 1);
  return result;
}

+ (id)build:(id)a3
{
  void (**v3)(id, BKSMutableHIDEventDeferringResolution *);
  BKSMutableHIDEventDeferringResolution *v4;

  v3 = (void (**)(id, BKSMutableHIDEventDeferringResolution *))a3;
  v4 = +[BKSMutableHIDEventDeferringResolution new](BKSMutableHIDEventDeferringResolution, "new");
  v3[2](v3, v4);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
