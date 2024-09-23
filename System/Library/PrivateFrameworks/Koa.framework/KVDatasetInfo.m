@implementation KVDatasetInfo

- (KVDatasetInfo)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (KVDatasetInfo)initWithItemType:(int64_t)a3 originAppId:(id)a4 itemCount:(unsigned int)a5 error:(id *)a6
{
  return (KVDatasetInfo *)objc_msgSend_initWithItemType_originAppId_deviceId_userId_lastModifiedTime_capturedTime_itemCount_error_(self, a2, a3, (uint64_t)a4, 0, 0, 0, 0, a5, a6);
}

- (KVDatasetInfo)initWithItemType:(int64_t)a3 originAppId:(id)a4 userId:(id)a5 itemCount:(unsigned int)a6 error:(id *)a7
{
  return (KVDatasetInfo *)objc_msgSend_initWithItemType_originAppId_deviceId_userId_lastModifiedTime_capturedTime_itemCount_error_(self, a2, a3, (uint64_t)a4, 0, a5, 0, 0, a6, a7);
}

- (KVDatasetInfo)initWithItemType:(int64_t)a3 originAppId:(id)a4 deviceId:(id)a5 userId:(id)a6 lastModifiedTime:(id)a7 capturedTime:(id)a8 itemCount:(unsigned int)a9 error:(id *)a10
{
  unsigned __int16 v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  size_t v28;
  unsigned int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  size_t v38;
  unsigned int v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  size_t v48;
  unsigned int v49;
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  size_t v55;
  unsigned int v56;
  unsigned __int16 v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  size_t v63;
  unsigned int v64;
  int v65;
  int v66;
  int v67;
  unsigned int v68;
  id v69;
  uint64_t v70;
  const char *v71;
  void *v72;
  const char *v73;
  KVDatasetInfo *v74;
  void *v76;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  char v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;

  v14 = a3;
  v15 = a4;
  v80 = a5;
  v79 = a6;
  v78 = a7;
  v16 = a8;
  v81 = 0;
  v82 = 0;
  v83 = xmmword_1B7111340;
  v84 = 0u;
  v85 = 0u;
  v86 = 0;
  v87 = 1;
  v88 = 256;
  v89 = 0;
  v76 = v15;
  if (objc_msgSend_length(v15, v17, v18, v19))
  {
    v23 = objc_retainAutorelease(v15);
    v27 = (const char *)objc_msgSend_UTF8String(v23, v24, v25, v26);
    v28 = strlen(v27);
    v29 = sub_1B70EB0A0((uint64_t)&v81, v27, v28);
  }
  else
  {
    v29 = 0;
  }
  if (objc_msgSend_length(v80, v20, v21, v22))
  {
    v33 = objc_retainAutorelease(v80);
    v37 = (const char *)objc_msgSend_UTF8String(v33, v34, v35, v36);
    v38 = strlen(v37);
    v39 = sub_1B70EB0A0((uint64_t)&v81, v37, v38);
  }
  else
  {
    v39 = 0;
  }
  if (objc_msgSend_length(v79, v30, v31, v32))
  {
    v43 = objc_retainAutorelease(v79);
    v47 = (const char *)objc_msgSend_UTF8String(v43, v44, v45, v46);
    v48 = strlen(v47);
    v49 = sub_1B70EB0A0((uint64_t)&v81, v47, v48);
  }
  else
  {
    v49 = 0;
  }
  if (!v78)
  {
    v56 = 0;
    if (v16)
      goto LABEL_12;
LABEL_14:
    v57 = v14;
    v64 = 0;
    goto LABEL_15;
  }
  objc_msgSend_ISO8601String(v78, v40, v41, v42);
  v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v54 = (const char *)objc_msgSend_UTF8String(v50, v51, v52, v53);
  v55 = strlen(v54);
  LODWORD(v54) = sub_1B70EB0A0((uint64_t)&v81, v54, v55);

  v56 = v54;
  if (!v16)
    goto LABEL_14;
LABEL_12:
  v57 = v14;
  objc_msgSend_ISO8601String(v16, v40, v41, v42);
  v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v62 = (const char *)objc_msgSend_UTF8String(v58, v59, v60, v61);
  v63 = strlen(v62);
  LODWORD(v62) = sub_1B70EB0A0((uint64_t)&v81, v62, v63);

  v64 = v62;
LABEL_15:
  sub_1B70EB144((uint64_t)&v81);
  BYTE6(v86) = 1;
  v65 = v85;
  v66 = v84;
  v67 = DWORD2(v84);
  sub_1B70EBF34((unint64_t)&v81, 4, v57);
  sub_1B70EBC60(&v81, 6, v29);
  sub_1B70EBC60(&v81, 8, v39);
  sub_1B70EBC60(&v81, 10, v49);
  sub_1B70EBC60(&v81, 12, v56);
  sub_1B70EBC60(&v81, 14, v64);
  sub_1B70EB018((unint64_t)&v81, 16, a9);
  v68 = sub_1B70EBC9C((uint64_t)&v81, v66 - v65 + v67);
  sub_1B70EC0D4((uint64_t)&v81, v68, 0, 0);
  v69 = objc_alloc(MEMORY[0x1E0C99D50]);
  v70 = sub_1B70EC038((uint64_t)&v81);
  v72 = (void *)objc_msgSend_initWithBytes_length_(v69, v71, v70, (v84 - v85 + DWORD2(v84)));
  v74 = (KVDatasetInfo *)(id)objc_msgSend_initWithBuffer_error_(self, v73, (uint64_t)v72, (uint64_t)a10);

  sub_1B70ED4B4(&v81);
  return v74;
}

- (KVDatasetInfo)initWithSizePrefixedBuffer:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int *v22;
  const char *v23;
  void *v24;
  const char *v25;
  KVDatasetInfo *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend_length(v6, v7, v8, v9))
  {
    v12 = (void *)MEMORY[0x1E0C99D50];
    v13 = objc_retainAutorelease(v6);
    v17 = objc_msgSend_bytes(v13, v14, v15, v16);
    v18 = objc_retainAutorelease(v13);
    v22 = (unsigned int *)objc_msgSend_bytes(v18, v19, v20, v21);
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v12, v23, v17 + 4, *v22, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    self = (KVDatasetInfo *)(id)objc_msgSend_initWithBuffer_error_(self, v25, (uint64_t)v24, (uint64_t)a4);

    v26 = self;
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("Invalid size prefixed buffer: %@"), v11, v6, *MEMORY[0x1E0CB2D50]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v28;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v29, (uint64_t)v36, (uint64_t)&v35, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v27, v31, (uint64_t)CFSTR("com.apple.koa.profile"), 6, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a4 && v32)
      *a4 = objc_retainAutorelease(v32);

    v26 = 0;
  }

  return v26;
}

- (KVDatasetInfo)initWithBuffer:(id)a3 error:(id *)a4
{
  id v7;
  KVDatasetInfo *v8;
  KVDatasetInfo *v9;
  void **p_buffer;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int *datasetInfo;
  const char *v25;
  unsigned __int16 *v26;
  unsigned int v27;
  unsigned int *v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  void *v35;
  unsigned __int16 *v36;
  uint64_t v37;
  unsigned int *v38;
  unsigned __int16 *v39;
  uint64_t v40;
  unsigned int *v41;
  unsigned __int16 *v42;
  uint64_t v43;
  unsigned int *v44;
  unsigned __int16 *v45;
  uint64_t v46;
  unsigned int *v47;
  unsigned __int16 *v48;
  uint64_t v49;
  KVDatasetInfo *v50;
  void *v51;
  void *v52;
  const char *v53;
  void *v54;
  void *v55;
  uint64_t v57;
  unint64_t v58;
  __int128 v59;
  uint64_t v60;
  char v61;
  objc_super v62;
  uint64_t v63;
  const __CFString *v64;
  uint64_t v65;
  _QWORD v66[2];

  v66[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v62.receiver = self;
  v62.super_class = (Class)KVDatasetInfo;
  v8 = -[KVDatasetInfo init](&v62, sel_init);
  v9 = v8;
  if (v8)
  {
    p_buffer = (void **)&v8->_buffer;
    objc_storeStrong((id *)&v8->_buffer, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(*p_buffer, v11, v12, v13))
    {
      v15 = (unsigned int *)objc_msgSend_bytes(*p_buffer, v11, v14, v13);
      v9->_datasetInfo = (const DatasetInfo *)v15 + *v15;
      v19 = objc_msgSend_bytes(v9->_buffer, v16, v17, v18);
      v23 = objc_msgSend_length(*p_buffer, v20, v21, v22);
      v57 = v19;
      v58 = v23;
      v59 = xmmword_1B7111350;
      v60 = 0;
      v61 = 1;
      if (v23 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      datasetInfo = (int *)v9->_datasetInfo;
      if (!datasetInfo)
        goto LABEL_50;
      if (sub_1B70EEC48(&v57, (int *)v9->_datasetInfo))
      {
        v26 = (unsigned __int16 *)((char *)datasetInfo - *datasetInfo);
        v27 = *v26;
        if ((v27 < 5 || !v26[2] || v58 >= 3 && v58 - 2 >= (unint64_t)datasetInfo + v26[2] - v57)
          && sub_1B70EED00(datasetInfo, &v57, 6u))
        {
          v28 = v27 >= 7 && v26[3]
              ? (unsigned int *)((char *)datasetInfo + v26[3] + *(unsigned int *)((char *)datasetInfo + v26[3]))
              : 0;
          if (sub_1B70EED54(&v57, v28) && sub_1B70EED00(datasetInfo, &v57, 8u))
          {
            v36 = (unsigned __int16 *)((char *)datasetInfo - *datasetInfo);
            if (*v36 >= 9u && (v37 = v36[4]) != 0)
              v38 = (unsigned int *)((char *)datasetInfo + v37 + *(unsigned int *)((char *)datasetInfo + v37));
            else
              v38 = 0;
            if (sub_1B70EED54(&v57, v38) && sub_1B70EED00(datasetInfo, &v57, 0xAu))
            {
              v39 = (unsigned __int16 *)((char *)datasetInfo - *datasetInfo);
              if (*v39 >= 0xBu && (v40 = v39[5]) != 0)
                v41 = (unsigned int *)((char *)datasetInfo + v40 + *(unsigned int *)((char *)datasetInfo + v40));
              else
                v41 = 0;
              if (sub_1B70EED54(&v57, v41) && sub_1B70EED00(datasetInfo, &v57, 0xCu))
              {
                v42 = (unsigned __int16 *)((char *)datasetInfo - *datasetInfo);
                if (*v42 >= 0xDu && (v43 = v42[6]) != 0)
                  v44 = (unsigned int *)((char *)datasetInfo + v43 + *(unsigned int *)((char *)datasetInfo + v43));
                else
                  v44 = 0;
                if (sub_1B70EED54(&v57, v44) && sub_1B70EED00(datasetInfo, &v57, 0xEu))
                {
                  v45 = (unsigned __int16 *)((char *)datasetInfo - *datasetInfo);
                  if (*v45 >= 0xFu && (v46 = v45[7]) != 0)
                    v47 = (unsigned int *)((char *)datasetInfo + v46 + *(unsigned int *)((char *)datasetInfo + v46));
                  else
                    v47 = 0;
                  if (sub_1B70EED54(&v57, v47))
                  {
                    v48 = (unsigned __int16 *)((char *)datasetInfo - *datasetInfo);
                    if (*v48 < 0x11u)
                      goto LABEL_50;
                    v49 = v48[8];
                    if (!v49 || v58 >= 5 && v58 - 4 >= (unint64_t)datasetInfo + v49 - v57)
                      goto LABEL_50;
                  }
                }
              }
            }
          }
        }
      }
      v51 = (void *)MEMORY[0x1E0CB35C8];
      v63 = *MEMORY[0x1E0CB2D50];
      v64 = CFSTR("DatasetInfo failed verification");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)&v64, (uint64_t)&v63, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v51, v53, (uint64_t)CFSTR("com.apple.koa.profile"), 6, v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      if (a4 && v54)
        *a4 = objc_retainAutorelease(v54);

    }
    else
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v65 = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("Unexpected DatasetInfo buffer: %@"), v13, *p_buffer);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v30;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v31, (uint64_t)v66, (uint64_t)&v65, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v29, v33, (uint64_t)CFSTR("com.apple.koa.profile"), 6, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (a4 && v34)
        *a4 = objc_retainAutorelease(v34);

    }
    v50 = 0;
    goto LABEL_56;
  }
LABEL_50:
  v50 = v9;
LABEL_56:

  return v50;
}

- (int64_t)itemType
{
  const DatasetInfo *datasetInfo;
  const DatasetInfo *v3;
  uint64_t v4;

  datasetInfo = self->_datasetInfo;
  v3 = &datasetInfo[-*(int *)datasetInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return *(unsigned __int16 *)datasetInfo[v4].var0;
  else
    return 0;
}

- (id)originAppId
{
  const DatasetInfo *v2;
  id v4;
  const char *v5;
  const DatasetInfo *datasetInfo;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const DatasetInfo *v10;
  void *v11;

  v2 = &self->_datasetInfo[-*(int *)self->_datasetInfo];
  if (*(unsigned __int16 *)v2->var0 >= 7u && *(_WORD *)v2[6].var0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    datasetInfo = self->_datasetInfo;
    v7 = *(int *)datasetInfo->var0;
    v8 = *(unsigned __int16 *)datasetInfo[-v7 + 6].var0;
    if (*(_WORD *)datasetInfo[-v7 + 6].var0)
    {
      v9 = *(unsigned int *)datasetInfo[v8].var0;
      v10 = &datasetInfo[v8 + v9];
    }
    else
    {
      v8 = 0;
      v10 = 0;
      v9 = *(unsigned int *)datasetInfo->var0;
    }
    v11 = (void *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)datasetInfo[v8 + v9].var0, 4, 0);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)deviceId
{
  const DatasetInfo *v2;
  id v4;
  const char *v5;
  const DatasetInfo *datasetInfo;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const DatasetInfo *v10;
  void *v11;

  v2 = &self->_datasetInfo[-*(int *)self->_datasetInfo];
  if (*(unsigned __int16 *)v2->var0 >= 9u && *(_WORD *)v2[8].var0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    datasetInfo = self->_datasetInfo;
    v7 = *(int *)datasetInfo->var0;
    v8 = *(unsigned __int16 *)datasetInfo[-v7 + 8].var0;
    if (*(_WORD *)datasetInfo[-v7 + 8].var0)
    {
      v9 = *(unsigned int *)datasetInfo[v8].var0;
      v10 = &datasetInfo[v8 + v9];
    }
    else
    {
      v8 = 0;
      v10 = 0;
      v9 = *(unsigned int *)datasetInfo->var0;
    }
    v11 = (void *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)datasetInfo[v8 + v9].var0, 4, 0);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)userId
{
  const DatasetInfo *v2;
  id v4;
  const char *v5;
  const DatasetInfo *datasetInfo;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const DatasetInfo *v10;
  void *v11;

  v2 = &self->_datasetInfo[-*(int *)self->_datasetInfo];
  if (*(unsigned __int16 *)v2->var0 >= 0xBu && *(_WORD *)v2[10].var0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    datasetInfo = self->_datasetInfo;
    v7 = *(int *)datasetInfo->var0;
    v8 = *(unsigned __int16 *)datasetInfo[-v7 + 10].var0;
    if (*(_WORD *)datasetInfo[-v7 + 10].var0)
    {
      v9 = *(unsigned int *)datasetInfo[v8].var0;
      v10 = &datasetInfo[v8 + v9];
    }
    else
    {
      v8 = 0;
      v10 = 0;
      v9 = *(unsigned int *)datasetInfo->var0;
    }
    v11 = (void *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)datasetInfo[v8 + v9].var0, 4, 0);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)lastModifiedTime
{
  const DatasetInfo *datasetInfo;
  const DatasetInfo *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  datasetInfo = self->_datasetInfo;
  v3 = &datasetInfo[-*(int *)datasetInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0)
  {
    sub_1B70EEBBC((unsigned int *)datasetInfo[v4 + *(unsigned int *)datasetInfo[v4].var0].var0);
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

- (id)capturedTime
{
  const DatasetInfo *datasetInfo;
  const DatasetInfo *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  datasetInfo = self->_datasetInfo;
  v3 = &datasetInfo[-*(int *)datasetInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0)
  {
    sub_1B70EEBBC((unsigned int *)datasetInfo[v4 + *(unsigned int *)datasetInfo[v4].var0].var0);
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

- (unsigned)itemCount
{
  const DatasetInfo *datasetInfo;
  const DatasetInfo *v3;
  uint64_t v4;

  datasetInfo = self->_datasetInfo;
  v3 = &datasetInfo[-*(int *)datasetInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0)
    return *(_DWORD *)datasetInfo[v4].var0;
  else
    return 0;
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
  unsigned __int16 v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;

  sub_1B7103470(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B7103470(a3 + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_appendFormat_(v7, v8, (uint64_t)CFSTR("%@{\n"), v9, v5);
  v13 = objc_msgSend_itemType(self, v10, v11, v12);
  if (v13 - 1 >= 0x19)
    v15 = 0;
  else
    v15 = v13;
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v14, (uint64_t)off_1E6B7ADF0[v15], 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v17, (uint64_t)CFSTR("%@\"%@\": \"%@\",\n"), v18, v6, CFSTR("itemType"), v16);

  objc_msgSend_originAppId(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v23, (uint64_t)CFSTR("%@\"%@\": \"%@\",\n"), v24, v6, CFSTR("originAppId"), v22);

  objc_msgSend_deviceId(self, v25, v26, v27);
  v28 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v28;
  if (v28)
  {
    sub_1B71034E4(v28, v29);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v34, (uint64_t)CFSTR("%@\"%@\": %@,\n"), v35, v6, CFSTR("deviceId"), v33);

  }
  objc_msgSend_userId(self, v29, v30, v31);
  v36 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v36;
  if (v36)
  {
    sub_1B71034E4(v36, v37);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v42, (uint64_t)CFSTR("%@\"%@\": %@,\n"), v43, v6, CFSTR("userId"), v41);

  }
  objc_msgSend_lastModifiedTime(self, v37, v38, v39);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v44;
  if (v44)
  {
    objc_msgSend_ISO8601String(v44, v45, v46, v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v50, (uint64_t)CFSTR("%@\"%@\": \"%@\",\n"), v51, v6, CFSTR("lastModifiedTime"), v49);

  }
  objc_msgSend_capturedTime(self, v45, v46, v47);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v52;
  if (v52)
  {
    objc_msgSend_ISO8601String(v52, v53, v54, v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v58, (uint64_t)CFSTR("%@\"%@\": \"%@\",\n"), v59, v6, CFSTR("capturedTime"), v57);

  }
  v60 = objc_msgSend_itemCount(self, v53, v54, v55);
  objc_msgSend_appendFormat_(v7, v61, (uint64_t)CFSTR("%@\"%@\": %u,\n"), v62, v6, CFSTR("itemCount"), v60);
  objc_msgSend_appendFormat_(v7, v63, (uint64_t)CFSTR("%@}"), v64, v5);

  return v7;
}

- (id)initFromDictionary:(id)a3 error:(id *)a4
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *ModifiedTime_capturedTime_itemCount_error;
  int v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = a3;
  objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("itemType"), v6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = KVItemTypeFromName(v36);
  objc_msgSend_objectForKey_(v4, v8, (uint64_t)CFSTR("originAppId"), v9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v10, (uint64_t)CFSTR("deviceId"), v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v12, (uint64_t)CFSTR("userId"), v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v14, (uint64_t)CFSTR("lastModifiedTime"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B70EEB2C(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v18, (uint64_t)CFSTR("capturedTime"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B70EEB2C(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v22, (uint64_t)CFSTR("itemCount"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_unsignedIntValue(v24, v25, v26, v27);
  ModifiedTime_capturedTime_itemCount_error = (void *)objc_msgSend_initWithItemType_originAppId_deviceId_userId_lastModifiedTime_capturedTime_itemCount_error_(self, v28, v7, (uint64_t)v35, v34, v33, v17, v21, v31, a4);

  return ModifiedTime_capturedTime_itemCount_error;
}

- (BOOL)isEqual:(id)a3
{
  KVDatasetInfo *v4;
  KVDatasetInfo *v5;
  const char *v6;
  uint64_t v7;
  char isEqualToDatasetInfo;

  v4 = (KVDatasetInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToDatasetInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToDatasetInfo = objc_msgSend_isEqualToDatasetInfo_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    isEqualToDatasetInfo = 0;
  }

  return isEqualToDatasetInfo;
}

- (BOOL)isEqualToDatasetInfo:(id)a3
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

@end
