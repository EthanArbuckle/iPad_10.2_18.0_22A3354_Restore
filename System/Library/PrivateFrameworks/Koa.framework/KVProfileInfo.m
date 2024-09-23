@implementation KVProfileInfo

- (KVProfileInfo)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (KVProfileInfo)initWithDatasetCount:(unsigned int)a3 capturedTime:(id)a4 deviceType:(id)a5 buildVersion:(id)a6 error:(id *)a7
{
  unsigned __int16 v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  size_t v24;
  unsigned int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  size_t v34;
  unsigned int v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  size_t v41;
  unsigned int v42;
  int v43;
  int v44;
  int v45;
  unsigned int v46;
  id v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  KVProfileInfo *v52;
  uint64_t v55;
  void *v57;
  uint64_t v58;
  char v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v58 = 0;
  v59 = 0;
  v60 = xmmword_1B7111340;
  v61 = 0u;
  v62 = 0u;
  v63 = 0;
  v64 = 1;
  v65 = 256;
  v66 = 0;
  if (objc_msgSend_length(v11, v13, v14, v15))
  {
    v19 = objc_retainAutorelease(v11);
    v23 = (const char *)objc_msgSend_UTF8String(v19, v20, v21, v22);
    v24 = strlen(v23);
    v25 = sub_1B70EB0A0((uint64_t)&v58, v23, v24);
  }
  else
  {
    v25 = 0;
  }
  if (!objc_msgSend_length(v12, v16, v17, v18, a7, self))
  {
    v35 = 0;
    if (v10)
      goto LABEL_6;
LABEL_8:
    v42 = 0;
    goto LABEL_9;
  }
  v29 = objc_retainAutorelease(v12);
  v33 = (const char *)objc_msgSend_UTF8String(v29, v30, v31, v32);
  v34 = strlen(v33);
  v35 = sub_1B70EB0A0((uint64_t)&v58, v33, v34);
  if (!v10)
    goto LABEL_8;
LABEL_6:
  objc_msgSend_ISO8601String(v10, v26, v27, v28);
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v40 = (const char *)objc_msgSend_UTF8String(v36, v37, v38, v39);
  v41 = strlen(v40);
  LODWORD(v40) = sub_1B70EB0A0((uint64_t)&v58, v40, v41);

  v42 = v40;
LABEL_9:
  sub_1B70EB144((uint64_t)&v58);
  BYTE6(v63) = 1;
  v43 = v62;
  v44 = v61;
  v45 = DWORD2(v61);
  sub_1B70EBC60(&v58, 4, v42);
  sub_1B70EBC60(&v58, 6, v25);
  sub_1B70EBC60(&v58, 8, v35);
  sub_1B70EBF34((unint64_t)&v58, 10, v9);
  v46 = sub_1B70EBC9C((uint64_t)&v58, v44 - v43 + v45);
  sub_1B70EC0D4((uint64_t)&v58, v46, 0, 0);
  v47 = objc_alloc(MEMORY[0x1E0C99D50]);
  v48 = sub_1B70EC038((uint64_t)&v58);
  v50 = (void *)objc_msgSend_initWithBytes_length_(v47, v49, v48, (v61 - v62 + DWORD2(v61)));
  v52 = (KVProfileInfo *)(id)objc_msgSend_initWithBuffer_error_(v57, v51, (uint64_t)v50, v55);

  sub_1B70ED4B4(&v58);
  return v52;
}

- (KVProfileInfo)initWithBuffer:(id)a3 error:(id *)a4
{
  id v7;
  KVProfileInfo *v8;
  KVProfileInfo *v9;
  void **p_buffer;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  unint64_t v25;
  int *v26;
  unsigned __int16 *v27;
  uint64_t v28;
  unsigned int *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  void *v36;
  unsigned __int16 *v37;
  uint64_t v38;
  unsigned int *v39;
  unsigned __int16 *v40;
  uint64_t v41;
  unsigned int *v42;
  unsigned __int16 *v43;
  uint64_t v44;
  KVProfileInfo *v45;
  void *v46;
  void *v47;
  const char *v48;
  void *v49;
  void *v50;
  char *v52;
  unint64_t v53;
  __int128 v54;
  uint64_t v55;
  char v56;
  objc_super v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v57.receiver = self;
  v57.super_class = (Class)KVProfileInfo;
  v8 = -[KVProfileInfo init](&v57, sel_init);
  v9 = v8;
  if (v8)
  {
    p_buffer = (void **)&v8->_buffer;
    objc_storeStrong((id *)&v8->_buffer, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(*p_buffer, v11, v12, v13))
    {
      v15 = (unsigned int *)objc_msgSend_bytes(*p_buffer, v11, v14, v13);
      v9->_profileInfo = (const ProfileInfo *)v15 + *v15;
      v19 = (char *)objc_msgSend_bytes(v9->_buffer, v16, v17, v18);
      v23 = objc_msgSend_length(*p_buffer, v20, v21, v22);
      v52 = v19;
      v53 = v23;
      v54 = xmmword_1B7111350;
      v55 = 0;
      v56 = 1;
      if (v23 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      if (v23 >= 5)
      {
        v25 = *(unsigned int *)v19;
        if ((int)v25 >= 1 && v23 - 1 >= v25)
        {
          v26 = (int *)&v19[v25];
          if (sub_1B70EEC48((uint64_t *)&v52, (int *)&v19[v25]) && sub_1B70EED00(v26, &v52, 4u))
          {
            v27 = (unsigned __int16 *)((char *)v26 - *v26);
            if (*v27 >= 5u && (v28 = v27[2]) != 0)
              v29 = (unsigned int *)((char *)v26 + v28 + *(unsigned int *)((char *)v26 + v28));
            else
              v29 = 0;
            if (sub_1B70EED54(&v52, v29) && sub_1B70EED00(v26, &v52, 6u))
            {
              v37 = (unsigned __int16 *)((char *)v26 - *v26);
              if (*v37 >= 7u && (v38 = v37[3]) != 0)
                v39 = (unsigned int *)((char *)v26 + v38 + *(unsigned int *)((char *)v26 + v38));
              else
                v39 = 0;
              if (sub_1B70EED54(&v52, v39) && sub_1B70EED00(v26, &v52, 8u))
              {
                v40 = (unsigned __int16 *)((char *)v26 - *v26);
                if (*v40 >= 9u && (v41 = v40[4]) != 0)
                  v42 = (unsigned int *)((char *)v26 + v41 + *(unsigned int *)((char *)v26 + v41));
                else
                  v42 = 0;
                if (sub_1B70EED54(&v52, v42))
                {
                  v43 = (unsigned __int16 *)((char *)v26 - *v26);
                  if (*v43 < 0xBu)
                    goto LABEL_35;
                  v44 = v43[5];
                  if (!v44 || v53 >= 3 && v53 - 2 >= (char *)v26 + v44 - v52)
                    goto LABEL_35;
                }
              }
            }
          }
        }
      }
      v46 = (void *)MEMORY[0x1E0CB35C8];
      v58 = *MEMORY[0x1E0CB2D50];
      v59 = CFSTR("ProfileInfo failed verification");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)&v59, (uint64_t)&v58, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v46, v48, (uint64_t)CFSTR("com.apple.koa.profile"), 5, v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (a4 && v49)
        *a4 = objc_retainAutorelease(v49);

    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v60 = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("Unexpected ProfileInfo buffer: %@"), v13, *p_buffer);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v31;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v32, (uint64_t)v61, (uint64_t)&v60, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v30, v34, (uint64_t)CFSTR("com.apple.koa.profile"), 5, v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (a4 && v35)
        *a4 = objc_retainAutorelease(v35);

    }
    v45 = 0;
    goto LABEL_41;
  }
LABEL_35:
  v45 = v9;
LABEL_41:

  return v45;
}

- (unsigned)datasetCount
{
  const ProfileInfo *profileInfo;
  const ProfileInfo *v3;
  uint64_t v4;

  profileInfo = self->_profileInfo;
  v3 = &profileInfo[-*(int *)profileInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return *(unsigned __int16 *)profileInfo[v4].var0;
  else
    return 0;
}

- (id)capturedTime
{
  const ProfileInfo *profileInfo;
  const ProfileInfo *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  profileInfo = self->_profileInfo;
  v3 = &profileInfo[-*(int *)profileInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
  {
    sub_1B70EEBBC((unsigned int *)profileInfo[v4 + *(unsigned int *)profileInfo[v4].var0].var0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B70EEB2C(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)deviceType
{
  const ProfileInfo *v2;
  id v4;
  const char *v5;
  const ProfileInfo *profileInfo;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const ProfileInfo *v10;
  void *v11;

  v2 = &self->_profileInfo[-*(int *)self->_profileInfo];
  if (*(unsigned __int16 *)v2->var0 >= 7u && *(_WORD *)v2[6].var0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    profileInfo = self->_profileInfo;
    v7 = *(int *)profileInfo->var0;
    v8 = *(unsigned __int16 *)profileInfo[-v7 + 6].var0;
    if (*(_WORD *)profileInfo[-v7 + 6].var0)
    {
      v9 = *(unsigned int *)profileInfo[v8].var0;
      v10 = &profileInfo[v8 + v9];
    }
    else
    {
      v8 = 0;
      v10 = 0;
      v9 = *(unsigned int *)profileInfo->var0;
    }
    v11 = (void *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)profileInfo[v8 + v9].var0, 4, 0);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)buildVersion
{
  const ProfileInfo *v2;
  id v4;
  const char *v5;
  const ProfileInfo *profileInfo;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const ProfileInfo *v10;
  void *v11;

  v2 = &self->_profileInfo[-*(int *)self->_profileInfo];
  if (*(unsigned __int16 *)v2->var0 >= 9u && *(_WORD *)v2[8].var0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    profileInfo = self->_profileInfo;
    v7 = *(int *)profileInfo->var0;
    v8 = *(unsigned __int16 *)profileInfo[-v7 + 8].var0;
    if (*(_WORD *)profileInfo[-v7 + 8].var0)
    {
      v9 = *(unsigned int *)profileInfo[v8].var0;
      v10 = &profileInfo[v8 + v9];
    }
    else
    {
      v8 = 0;
      v10 = 0;
      v9 = *(unsigned int *)profileInfo->var0;
    }
    v11 = (void *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)profileInfo[v8 + v9].var0, 4, 0);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (NSString)description
{
  uint64_t v2;

  return (NSString *)objc_msgSend_JSONWithIndent_(self, a2, 0, v2);
}

- (id)JSONWithIndent:(unsigned __int8)a3
{
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;

  sub_1B7103470(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B7103470(a3 + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_appendFormat_(v7, v8, (uint64_t)CFSTR("%@{\n"), v9, v5);
  objc_msgSend_capturedTime(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13;
  if (v13)
  {
    objc_msgSend_ISO8601String(v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v19, (uint64_t)CFSTR("%@\"%@\": \"%@\",\n"), v20, v6, CFSTR("capturedTime"), v18);

  }
  objc_msgSend_deviceType(self, v14, v15, v16);
  v21 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v21;
  if (v21)
  {
    sub_1B71034E4(v21, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v27, (uint64_t)CFSTR("%@\"%@\": %@,\n"), v28, v6, CFSTR("deviceType"), v26);

  }
  objc_msgSend_buildVersion(self, v22, v23, v24);
  v29 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v29;
  if (v29)
  {
    sub_1B71034E4(v29, v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v35, (uint64_t)CFSTR("%@\"%@\": %@,\n"), v36, v6, CFSTR("buildVersion"), v34);

  }
  v37 = objc_msgSend_datasetCount(self, v30, v31, v32);
  objc_msgSend_appendFormat_(v7, v38, (uint64_t)CFSTR("%@\"%@\": %u,\n"), v39, v6, CFSTR("datasetCount"), v37);
  objc_msgSend_appendFormat_(v7, v40, (uint64_t)CFSTR("%@}"), v41, v5);

  return v7;
}

- (id)initFromDictionary:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;

  v6 = a3;
  objc_msgSend_objectForKey_(v6, v7, (uint64_t)CFSTR("datasetCount"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_unsignedIntValue(v9, v10, v11, v12);
  objc_msgSend_objectForKey_(v6, v14, (uint64_t)CFSTR("capturedTime"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B70EEB2C(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v18, (uint64_t)CFSTR("deviceType"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v21, (uint64_t)CFSTR("buildVersion"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend_initWithDatasetCount_capturedTime_deviceType_buildVersion_error_(self, v24, v13, (uint64_t)v17, v20, v23, a4);

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  KVProfileInfo *v4;
  KVProfileInfo *v5;
  const char *v6;
  uint64_t v7;
  char isEqualToProfileInfo;

  v4 = (KVProfileInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToProfileInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToProfileInfo = objc_msgSend_isEqualToProfileInfo_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    isEqualToProfileInfo = 0;
  }

  return isEqualToProfileInfo;
}

- (BOOL)isEqualToProfileInfo:(id)a3
{
  uint64_t v3;
  NSData *buffer;
  void *v5;
  const char *v6;
  uint64_t v7;

  buffer = self->_buffer;
  objc_msgSend_buffer(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(buffer) = objc_msgSend_isEqual_(buffer, v6, (uint64_t)v5, v7);

  return (char)buffer;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_hash(self->_buffer, a2, v2, v3);
}

- (NSData)buffer
{
  return self->_buffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

+ (id)syntheticWithDatasetCount:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  const char *v7;

  v5 = *(_QWORD *)&a3;
  v6 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithDatasetCount_capturedTime_deviceType_buildVersion_error_(v6, v7, v5, 0, 0, 0, a4);
}

+ (id)capturedWithDatasetCount:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;

  v5 = *(_QWORD *)&a3;
  v6 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_now(MEMORY[0x1E0C99D68], v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MGCopyAnswer();
  v12 = (void *)MGCopyAnswer();
  v14 = (void *)objc_msgSend_initWithDatasetCount_capturedTime_deviceType_buildVersion_error_(v6, v13, v5, (uint64_t)v10, v11, v12, a4);

  return v14;
}

@end
