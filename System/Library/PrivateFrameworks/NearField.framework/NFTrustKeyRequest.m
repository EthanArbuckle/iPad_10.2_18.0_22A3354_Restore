@implementation NFTrustKeyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustKeyRequest)initWithCoder:(id)a3
{
  id v4;
  NFTrustKeyRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFTrustKeyRequest;
  v5 = -[NFTrustObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeArrayOfArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("localValidations"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustKeyRequest setValue:forKey:](v5, "setValue:forKey:", v6, CFSTR("localValidations"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("counterLimit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustKeyRequest setValue:forKey:](v5, "setValue:forKey:", v7, CFSTR("counterLimit"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subjectIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustKeyRequest setValue:forKey:](v5, "setValue:forKey:", v8, CFSTR("subjectIdentifier"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("discretionaryData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustKeyRequest setValue:forKey:](v5, "setValue:forKey:", v9, CFSTR("discretionaryData"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[NFTrustKeyRequest localValidations](self, "localValidations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localValidations"));

  -[NFTrustKeyRequest counterLimit](self, "counterLimit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("counterLimit"));

  -[NFTrustKeyRequest subjectIdentifier](self, "subjectIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("subjectIdentifier"));

  -[NFTrustKeyRequest discretionaryData](self, "discretionaryData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("discretionaryData"));

}

+ (id)keyRequestWithSubjectIdentifier:(id)a3 discretionaryData:(id)a4 localValidations:(id)a5 counterLimit:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  NFTrustKeyRequest *v20;
  NFTrustKeyRequest *v21;
  const void **v22;
  uint64_t Logger;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const void **v32;
  uint64_t v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  _BOOL4 v36;
  const char *v37;
  BOOL v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v41;
  int v42;
  const char *v43;
  const char *v44;
  const void **v45;
  uint64_t v46;
  void (*v47)(uint64_t, const char *, ...);
  objc_class *v48;
  _BOOL4 v49;
  const char *v50;
  uint64_t v51;
  objc_class *v52;
  int v53;
  const void **v54;
  uint64_t v55;
  void (*v56)(uint64_t, const char *, ...);
  objc_class *v57;
  _BOOL4 v58;
  const char *v59;
  uint64_t v60;
  objc_class *v61;
  int v62;
  const char *v63;
  const char *v64;
  const char *Name;
  const char *v67;
  const char *v68;
  const char *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[128];
  uint8_t buf[4];
  int v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    v22 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v24 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v28 = 45;
      if (isMetaClass)
        v28 = 43;
      v24(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with nil subjectIdentifier", v28, ClassName, Name, 272);
    }
    dispatch_get_specific(*v22);
    NFSharedLogGetLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    v29 = object_getClass(a1);
    if (class_isMetaClass(v29))
      v30 = 43;
    else
      v30 = 45;
    *(_DWORD *)buf = 67109890;
    v76 = v30;
    v77 = 2082;
    v78 = object_getClassName(a1);
    v79 = 2082;
    v80 = sel_getName(a2);
    v81 = 1024;
    v82 = 272;
    v31 = "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with nil subjectIdentifier";
    goto LABEL_54;
  }
  if (v13)
  {
    if (!objc_msgSend(v13, "count"))
    {
      v45 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v46 = NFLogGetLogger();
      if (v46)
      {
        v47 = (void (*)(uint64_t, const char *, ...))v46;
        v48 = object_getClass(a1);
        v49 = class_isMetaClass(v48);
        v50 = object_getClassName(a1);
        v68 = sel_getName(a2);
        v51 = 45;
        if (v49)
          v51 = 43;
        v47(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest non nil but empty NFTrustOrLocalValidation", v51, v50, v68, 279);
      }
      dispatch_get_specific(*v45);
      NFSharedLogGetLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_55;
      v52 = object_getClass(a1);
      if (class_isMetaClass(v52))
        v53 = 43;
      else
        v53 = 45;
      *(_DWORD *)buf = 67109890;
      v76 = v53;
      v77 = 2082;
      v78 = object_getClassName(a1);
      v79 = 2082;
      v80 = sel_getName(a2);
      v81 = 1024;
      v82 = 279;
      v31 = "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest non nil but empty NFTrustOrLocalValidation";
      goto LABEL_54;
    }
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v15 = v13;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v71;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v71 != v18)
            objc_enumerationMutation(v15);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "count"))
          {
            v32 = (const void **)MEMORY[0x1E0DE7900];
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            v33 = NFLogGetLogger();
            if (v33)
            {
              v34 = (void (*)(uint64_t, const char *, ...))v33;
              v35 = object_getClass(a1);
              v36 = class_isMetaClass(v35);
              v37 = object_getClassName(a1);
              v67 = sel_getName(a2);
              v38 = !v36;
              v32 = (const void **)MEMORY[0x1E0DE7900];
              v39 = 45;
              if (!v38)
                v39 = 43;
              v34(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with empty NFTrustAndLocalValidation", v39, v37, v67, 285, (_QWORD)v70);
            }
            dispatch_get_specific(*v32);
            NFSharedLogGetLogger();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              v41 = object_getClass(a1);
              if (class_isMetaClass(v41))
                v42 = 43;
              else
                v42 = 45;
              v43 = object_getClassName(a1);
              v44 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v76 = v42;
              v77 = 2082;
              v78 = v43;
              v79 = 2082;
              v80 = v44;
              v81 = 1024;
              v82 = 285;
              _os_log_impl(&dword_19B5EB000, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with empty NFTrustAndLocalValidation", buf, 0x22u);
            }

            goto LABEL_55;
          }
        }
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
        if (v17)
          continue;
        break;
      }
    }

  }
  if (v14 && !objc_msgSend(v14, "unsignedIntegerValue"))
  {
    v54 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v55 = NFLogGetLogger();
    if (v55)
    {
      v56 = (void (*)(uint64_t, const char *, ...))v55;
      v57 = object_getClass(a1);
      v58 = class_isMetaClass(v57);
      v59 = object_getClassName(a1);
      v69 = sel_getName(a2);
      v60 = 45;
      if (v58)
        v60 = 43;
      v56(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with counterLimit of 0", v60, v59, v69, 294, (_QWORD)v70);
    }
    dispatch_get_specific(*v54);
    NFSharedLogGetLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    v61 = object_getClass(a1);
    if (class_isMetaClass(v61))
      v62 = 43;
    else
      v62 = 45;
    v63 = object_getClassName(a1);
    v64 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v76 = v62;
    v77 = 2082;
    v78 = v63;
    v79 = 2082;
    v80 = v64;
    v81 = 1024;
    v82 = 294;
    v31 = "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with counterLimit of 0";
LABEL_54:
    _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_ERROR, v31, buf, 0x22u);
LABEL_55:

    v21 = 0;
    goto LABEL_56;
  }
  v20 = [NFTrustKeyRequest alloc];
  v21 = v20;
  if (v20)
  {
    -[NFTrustKeyRequest setDiscretionaryData:](v20, "setDiscretionaryData:", v12);
    -[NFTrustKeyRequest setSubjectIdentifier:](v21, "setSubjectIdentifier:", v11);
    -[NFTrustKeyRequest setLocalValidations:](v21, "setLocalValidations:", v13);
    -[NFTrustKeyRequest setCounterLimit:](v21, "setCounterLimit:", v14);
  }
LABEL_56:

  return v21;
}

- (NSData)subjectIdentifier
{
  return self->_subjectIdentifier;
}

- (void)setSubjectIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_subjectIdentifier, a3);
}

- (NSData)discretionaryData
{
  return self->_discretionaryData;
}

- (void)setDiscretionaryData:(id)a3
{
  objc_storeStrong((id *)&self->_discretionaryData, a3);
}

- (NSArray)localValidations
{
  return self->_localValidations;
}

- (void)setLocalValidations:(id)a3
{
  objc_storeStrong((id *)&self->_localValidations, a3);
}

- (NSNumber)counterLimit
{
  return self->_counterLimit;
}

- (void)setCounterLimit:(id)a3
{
  objc_storeStrong((id *)&self->_counterLimit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterLimit, 0);
  objc_storeStrong((id *)&self->_localValidations, 0);
  objc_storeStrong((id *)&self->_discretionaryData, 0);
  objc_storeStrong((id *)&self->_subjectIdentifier, 0);
}

@end
