@implementation _HMAutomationBuilder

- (_HMAutomationBuilder)initWithContext:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _HMAutomationBuilder *v10;
  uint64_t v11;
  NSUUID *uniqueIdentifier;
  _HMAutomationBuilder *v14;
  SEL v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v14 = (_HMAutomationBuilder *)_HMFPreconditionFailure();
    return (_HMAutomationBuilder *)-[_HMAutomationBuilder home](v14, v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)_HMAutomationBuilder;
  v10 = -[_HMAutomationBuilder init](&v16, sel_init);
  if (v10)
  {
    HMTransientIdentifier();
    v11 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v10->_uniqueIdentifier;
    v10->_uniqueIdentifier = (NSUUID *)v11;

    objc_storeStrong((id *)&v10->_context, a3);
    objc_storeStrong((id *)&v10->_home, a4);
  }

  return v10;
}

- (HMHome)home
{
  return self->_home;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

+ (void)adoptExternalCategoriesFromClasses:(Class)a3
{
  __int128 v5;
  uint64_t v6;
  Method *v7;
  Method *v8;
  unint64_t v9;
  char *v10;
  size_t v11;
  unsigned int v12;
  _QWORD *v13;
  unint64_t i;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  const char *Name;
  void (*v19)(void);
  const char *TypeEncoding;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  Class *v27;
  _QWORD v28[2];
  __int128 v29;
  _QWORD *v30;
  Class v31;
  uint64_t v32;
  unsigned int outCount;
  Class *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  Class v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v45 = *MEMORY[0x1E0C80C00];
  v34 = (Class *)&v46;
  v28[0] = objc_msgSend(a1, "methodForSelector:", a2);
  if (a3)
  {
    v6 = 0;
    v32 = 0;
    *(_QWORD *)&v5 = 138544386;
    v29 = v5;
    do
    {
      outCount = 0;
      v7 = class_copyMethodList(a3, &outCount);
      if (outCount)
      {
        v8 = v7;
        v28[1] = v28;
        v9 = 8 * (outCount + 1);
        v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFF0);
        if (v9 >= 0x200)
          v11 = 512;
        else
          v11 = 8 * (outCount + 1);
        bzero((char *)v28 - ((v9 + 15) & 0xFFFFFFFF0), v11);
        v12 = outCount;
        v13 = &v28[-4 * outCount - 4];
        if (outCount)
        {
          for (i = 0; i < outCount; ++i)
          {
            *(_QWORD *)&v10[8 * i] = method_getImplementation(v8[i]);
            v12 = outCount;
          }
        }
        *(_QWORD *)&v10[8 * v12] = v28[0];
        _dyld_images_for_addresses();
        v15 = outCount;
        if (outCount)
        {
          v30 = v13;
          v31 = a3;
          v16 = 0;
          v17 = v13 + 3;
          do
          {
            if (*v17 != v13[4 * v15 + 3])
            {
              Name = method_getName(v8[v16]);
              v19 = *(void (**)(void))&v10[8 * v16];
              TypeEncoding = method_getTypeEncoding(v8[v16]);
              if (!class_addMethod((Class)a1, Name, v19, TypeEncoding))
              {
                v21 = *v17;
                if (*v17 != v6)
                {
                  v32 = dyld_image_path_containing_address();
                  v6 = v21;
                }
                v22 = (void *)MEMORY[0x1A1AC1AAC]();
                HMFGetOSLogHandle();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v24 = v6;
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(Name);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v29;
                  v36 = v25;
                  v37 = 2112;
                  v38 = a1;
                  v39 = 2112;
                  v40 = v31;
                  v41 = 2112;
                  v42 = v26;
                  v43 = 2080;
                  v44 = v32;
                  _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@%@: Did not adopt -[%@ %@] defined in %s", buf, 0x34u);

                  v6 = v24;
                  v13 = v30;
                }

                objc_autoreleasePoolPop(v22);
              }
            }
            ++v16;
            v15 = outCount;
            v17 += 4;
          }
          while (v16 < outCount);
        }
        free(v8);
      }
      v27 = v34++;
      a3 = *v27;
    }
    while (*v27);
  }
}

- (id)uuid
{
  return 0;
}

- (id)assistantIdentifier
{
  return &stru_1E3AB7688;
}

@end
