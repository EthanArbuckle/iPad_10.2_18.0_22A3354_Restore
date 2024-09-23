@implementation NFTrustSignRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustSignRequest)initWithCoder:(id)a3
{
  id v4;
  NFTrustSignRequest *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFTrustSignRequest;
  v5 = -[NFTrustObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("challenge"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustSignRequest setValue:forKey:](v5, "setValue:forKey:", v6, CFSTR("challenge"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustSignRequest setValue:forKey:](v5, "setValue:forKey:", v7, CFSTR("data"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NFTrustSignRequest challenge](self, "challenge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("challenge"));

  -[NFTrustSignRequest data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("data"));

}

+ (id)signRequestWithChallenge:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  const void **v11;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  const char *v27;
  uint64_t v28;
  objc_class *v29;
  int v30;
  const char *Name;
  const char *v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v11 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v13(3, "%c[%{public}s %{public}s]:%i Could not create SignRequest with nil challenge", v17, ClassName, Name, 344);
    }
    dispatch_get_specific(*v11);
    NFSharedLogGetLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v19 = object_getClass(a1);
    if (class_isMetaClass(v19))
      v20 = 43;
    else
      v20 = 45;
    *(_DWORD *)buf = 67109890;
    v35 = v20;
    v36 = 2082;
    v37 = object_getClassName(a1);
    v38 = 2082;
    v39 = sel_getName(a2);
    v40 = 1024;
    v41 = 344;
    v21 = "%c[%{public}s %{public}s]:%i Could not create SignRequest with nil challenge";
    goto LABEL_25;
  }
  if (objc_msgSend(v7, "length") != 8)
  {
    v22 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v23 = NFLogGetLogger();
    if (v23)
    {
      v24 = (void (*)(uint64_t, const char *, ...))v23;
      v25 = object_getClass(a1);
      v26 = class_isMetaClass(v25);
      v27 = object_getClassName(a1);
      v33 = sel_getName(a2);
      v28 = 45;
      if (v26)
        v28 = 43;
      v24(3, "%c[%{public}s %{public}s]:%i Could not create SignRequest with challenge length != 0x08", v28, v27, v33, 349);
    }
    dispatch_get_specific(*v22);
    NFSharedLogGetLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v29 = object_getClass(a1);
    if (class_isMetaClass(v29))
      v30 = 43;
    else
      v30 = 45;
    *(_DWORD *)buf = 67109890;
    v35 = v30;
    v36 = 2082;
    v37 = object_getClassName(a1);
    v38 = 2082;
    v39 = sel_getName(a2);
    v40 = 1024;
    v41 = 349;
    v21 = "%c[%{public}s %{public}s]:%i Could not create SignRequest with challenge length != 0x08";
LABEL_25:
    _os_log_impl(&dword_19B5EB000, v18, OS_LOG_TYPE_ERROR, v21, buf, 0x22u);
LABEL_26:

    v10 = 0;
    goto LABEL_27;
  }
  if (!objc_msgSend(v8, "length"))
  {

    v8 = 0;
  }
  v9 = objc_alloc((Class)a1);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setChallenge:", v7);
    objc_msgSend(v10, "setData:", v8);
  }
LABEL_27:

  return v10;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end
