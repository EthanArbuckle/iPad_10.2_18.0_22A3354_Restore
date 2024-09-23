@implementation BKSHIDEventDeferringPredicate

- (BKSHIDEventDeferringEnvironment)environment
{
  return self->_environment;
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (BKSHIDEventDeferringToken)token
{
  return self->_token;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[BKSHIDEventDeferringEnvironment hash](self->_environment, "hash");
  v4 = -[BKSHIDEventDisplay hash](self->_display, "hash");
  return v3 ^ v4 ^ -[BKSHIDEventDeferringToken hash](self->_token, "hash") ^ 0x1A737;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

id __62__BKSHIDEventDeferringPredicate_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), 0);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 0, 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), 0, 1);
}

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventDeferringPredicate *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = (BKSHIDEventDeferringPredicate *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if ((v5 == objc_opt_class() || (v6 = objc_opt_class(), v6 == objc_opt_class()))
      && BSEqualObjects()
      && BSEqualObjects())
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

- (void)encodeWithCoder:(id)a3
{
  BKSHIDEventDeferringEnvironment *environment;
  id v5;

  environment = self->_environment;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", environment, CFSTR("environment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_display, CFSTR("display"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_token, CFSTR("token"));

}

- (BKSHIDEventDeferringPredicate)initWithCoder:(id)a3
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
  void *v13;
  void *v14;
  BKSHIDEventDeferringPredicate *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    v6 = objc_opt_class();
    if (v6 != objc_opt_class())
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0CB28A8];
      v22 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDeferringPredicate: subclasses are not allowed : %@"), objc_opt_class(), v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 4866, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v11);

LABEL_7:
      v15 = 0;
      goto LABEL_8;
    }
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB28A8];
    v24 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDeferringPredicate: unknown environment : %@"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 4866, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v20);

    v9 = 0;
    goto LABEL_7;
  }
  v9 = (void *)v12;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self = (BKSHIDEventDeferringPredicate *)-[BKSHIDEventDeferringPredicate _initWithEnvironment:display:token:](self, "_initWithEnvironment:display:token:", v9, v13, v14);

  v15 = self;
LABEL_8:

  return v15;
}

- (id)_initWithEnvironment:(id)a3 display:(id)a4 token:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  BKSHIDEventDeferringPredicate *v18;
  uint64_t v19;
  BKSHIDEventDeferringEnvironment *environment;
  uint64_t v21;
  BKSHIDEventDisplay *display;
  uint64_t v23;
  BKSHIDEventDeferringToken *token;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  objc_class *v52;
  void *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  void *v61;
  objc_class *v62;
  void *v63;
  objc_super v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  BKSHIDEventDeferringPredicate *v70;
  __int16 v71;
  const __CFString *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  if (!v12)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("environment"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v66 = v30;
      v67 = 2114;
      v68 = v32;
      v69 = 2048;
      v70 = self;
      v71 = 2114;
      v72 = CFSTR("BKSHIDEventDeferringPredicate.m");
      v73 = 1024;
      v74 = 33;
      v75 = 2114;
      v76 = v29;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F887CLL);
  }
  v13 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v33 = (void *)MEMORY[0x1E0CB3940];
    v34 = (objc_class *)objc_msgSend(v13, "classForCoder");
    if (!v34)
      v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("environment"), v35, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v66 = v39;
      v67 = 2114;
      v68 = v41;
      v69 = 2048;
      v70 = self;
      v71 = 2114;
      v72 = CFSTR("BKSHIDEventDeferringPredicate.m");
      v73 = 1024;
      v74 = 33;
      v75 = 2114;
      v76 = v38;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F89B8);
  }

  v14 = v10;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v42 = (void *)MEMORY[0x1E0CB3940];
      v43 = (objc_class *)objc_msgSend(v14, "classForCoder");
      if (!v43)
        v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("display"), v44, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v66 = v48;
        v67 = 2114;
        v68 = v50;
        v69 = 2048;
        v70 = self;
        v71 = 2114;
        v72 = CFSTR("BKSHIDEventDeferringPredicate.m");
        v73 = 1024;
        v74 = 34;
        v75 = 2114;
        v76 = v47;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v47), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0F8AF4);
    }
  }

  v15 = v11;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v51 = (void *)MEMORY[0x1E0CB3940];
      v52 = (objc_class *)objc_msgSend(v15, "classForCoder");
      if (!v52)
        v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (objc_class *)objc_opt_class();
      NSStringFromClass(v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("token"), v53, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (objc_class *)objc_opt_class();
        NSStringFromClass(v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v66 = v57;
        v67 = 2114;
        v68 = v59;
        v69 = 2048;
        v70 = self;
        v71 = 2114;
        v72 = CFSTR("BKSHIDEventDeferringPredicate.m");
        v73 = 1024;
        v74 = 35;
        v75 = 2114;
        v76 = v56;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v56), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0F8C30);
    }
  }

  v16 = objc_opt_class();
  if (v16 != objc_opt_class())
  {
    v17 = objc_opt_class();
    if (v17 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventDeferringPredicate cannot be subclassed"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (objc_class *)objc_opt_class();
        NSStringFromClass(v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v66 = v61;
        v67 = 2114;
        v68 = v63;
        v69 = 2048;
        v70 = self;
        v71 = 2114;
        v72 = CFSTR("BKSHIDEventDeferringPredicate.m");
        v73 = 1024;
        v74 = 36;
        v75 = 2114;
        v76 = v60;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v60), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0F8D1CLL);
    }
  }
  v64.receiver = self;
  v64.super_class = (Class)BKSHIDEventDeferringPredicate;
  v18 = -[BKSHIDEventDeferringPredicate init](&v64, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v13, "copy");
    environment = v18->_environment;
    v18->_environment = (BKSHIDEventDeferringEnvironment *)v19;

    v21 = objc_msgSend(v14, "copy");
    display = v18->_display;
    v18->_display = (BKSHIDEventDisplay *)v21;

    v23 = objc_msgSend(v15, "copy");
    token = v18->_token;
    v18->_token = (BKSHIDEventDeferringToken *)v23;

  }
  return v18;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKSHIDEventDeferringPredicate *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__BKSHIDEventDeferringPredicate_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (BKSHIDEventDeferringPredicate)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDeferringPredicate *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventDeferringPredicate *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventDeferringPredicate"));
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
    v16 = CFSTR("BKSHIDEventDeferringPredicate.m");
    v17 = 1024;
    v18 = 28;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDeferringPredicate *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventDeferringPredicate _initWithEnvironment:display:token:](+[BKSMutableHIDEventDeferringPredicate allocWithZone:](BKSMutableHIDEventDeferringPredicate, "allocWithZone:", a3), "_initWithEnvironment:display:token:", self->_environment, self->_display, self->_token);
}

@end
