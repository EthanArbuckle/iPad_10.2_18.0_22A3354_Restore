@implementation KVEmbeddedProfileReader

- (KVEmbeddedProfileReader)initWithData:(id)a3 profile:(const Profile *)a4 profileInfo:(id)a5
{
  id v9;
  id v10;
  KVEmbeddedProfileReader *v11;
  KVEmbeddedProfileReader *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)KVEmbeddedProfileReader;
  v11 = -[KVEmbeddedProfileReader init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_data, a3);
    v12->_profile = a4;
    objc_storeStrong((id *)&v12->_profileInfo, a5);
  }

  return v12;
}

- (id)data
{
  return self->_data;
}

- (BOOL)enumerateDatasetsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t (**v6)(id, void *);
  const Profile *profile;
  const Profile *v8;
  uint64_t v9;
  const Profile *v10;
  uint64_t v11;
  uint64_t v12;
  const Profile *v13;
  uint64_t v14;
  uint64_t v15;
  KVEmbeddedDatasetReader *v16;
  const char *v17;
  void *v18;
  BOOL v19;

  v6 = (uint64_t (**)(id, void *))a4;
  profile = self->_profile;
  v8 = &profile[-*(int *)profile->var0];
  if (*(unsigned __int16 *)v8->var0 >= 7u
    && (v9 = *(unsigned __int16 *)v8[6].var0) != 0
    && (v10 = &profile[v9],
        v11 = *(unsigned int *)v10->var0,
        v13 = &v10[v11 + 4],
        v12 = *(unsigned int *)v10[v11].var0,
        (_DWORD)v12))
  {
    v14 = 4 * v12;
    while (1)
    {
      v15 = *(unsigned int *)v13->var0;
      v16 = [KVEmbeddedDatasetReader alloc];
      v18 = (void *)objc_msgSend_initWithData_dataset_error_(v16, v17, (uint64_t)self->_data, (uint64_t)&v13[v15], a3);
      if (!v18 || (v6[2](v6, v18) & 1) == 0)
        break;

      v13 += 4;
      v14 -= 4;
      if (!v14)
        goto LABEL_8;
    }

    v19 = 0;
  }
  else
  {
LABEL_8:
    v19 = 1;
  }

  return v19;
}

- (id)profileInfo
{
  return self->_profileInfo;
}

- (NSString)description
{
  uint64_t v2;
  void *v3;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("profile format: %@ info: %@"), v2, CFSTR("Binary Embedded"), self->_profileInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
