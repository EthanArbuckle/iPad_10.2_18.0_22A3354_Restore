@implementation KVEncodedSpanInfo

- (KVEncodedSpanInfo)initWithValue:(id)a3 location:(unsigned int)a4 length:(unsigned int)a5 matchScore:(float)a6 maxTokenCount:(unsigned int)a7 matchedTokenCount:(unsigned int)a8 maxStopWordCount:(unsigned int)a9 matchedStopWordCount:(unsigned int)a10 maxAliasCount:(unsigned int)a11 matchedAliasCount:(unsigned int)a12 editDistance:(unsigned int)a13 aliasMatchOptions:(unsigned __int16)a14
{
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v19;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int128 v27;
  __int16 v28;
  unsigned int v29;
  id v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  KVEncodedSpanInfo *v35;
  uint64_t v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  uint64_t v40;
  int v42;
  int v43;
  _BYTE buf[12];
  __int16 v45;
  _BYTE v46[18];
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v14 = a9;
  v15 = a8;
  v16 = a7;
  v19 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  if (!objc_msgSend_length(v21, v22, v23, v24))
  {
    v36 = qword_1ED114588;
    if (!os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      v35 = 0;
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[KVEncodedSpanInfo initWithValue:location:length:matchScore:maxTokenCount:matchedTokenCount:ma"
                         "xStopWordCount:matchedStopWordCount:maxAliasCount:matchedAliasCount:editDistance:aliasMatchOptions:]";
    v37 = "%s Cannot initialize span info with empty value";
    v38 = v36;
    v39 = 12;
LABEL_15:
    _os_log_error_impl(&dword_1B70E7000, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
    goto LABEL_12;
  }
  if (!a5)
  {
    v40 = qword_1ED114588;
    if (!os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[KVEncodedSpanInfo initWithValue:location:length:matchScore:maxTokenCount:matchedTokenCount:ma"
                         "xStopWordCount:matchedStopWordCount:maxAliasCount:matchedAliasCount:editDistance:aliasMatchOptions:]";
    v45 = 2112;
    *(_QWORD *)v46 = v21;
    v37 = "%s Cannot initialize span info with zero length. value: %@";
    v38 = v40;
    v39 = 22;
    goto LABEL_15;
  }
  *(_QWORD *)buf = 0;
  buf[8] = 0;
  *(_OWORD *)&v46[2] = xmmword_1B7111340;
  v47 = 0u;
  v48 = 0u;
  v49 = 0;
  v50 = 1;
  v51 = 256;
  v52 = 0;
  sub_1B70EB144((uint64_t)buf);
  BYTE6(v49) = 1;
  v25 = v47;
  v42 = DWORD2(v47);
  v43 = v48;
  sub_1B70EBF34((unint64_t)buf, 4, v19);
  sub_1B70EBF34((unint64_t)buf, 6, (unsigned __int16)a5);
  if (a6 != 0.0 || (_BYTE)v51)
  {
    sub_1B70EB41C((uint64_t)buf, 4uLL);
    sub_1B70EB2AC((uint64_t *)buf, 4uLL);
    v26 = v48;
    *(float *)(v48 - 4) = a6;
    v26 -= 4;
    *(_QWORD *)&v48 = v26;
    v27 = v47;
    sub_1B70EB2AC((uint64_t *)buf, 8uLL);
    **((_QWORD **)&v48 + 1) = (v27 - v26 + DWORD2(v27)) | 0x800000000;
    *((_QWORD *)&v48 + 1) += 8;
    LODWORD(v49) = v49 + 1;
    v28 = WORD2(v49);
    if (WORD2(v49) <= 8u)
      v28 = 8;
    WORD2(v49) = v28;
  }
  sub_1B70EBF34((unint64_t)buf, 10, v16);
  sub_1B70EBF34((unint64_t)buf, 12, v15);
  sub_1B70EBF34((unint64_t)buf, 14, v14);
  sub_1B70EBF34((unint64_t)buf, 16, (unsigned __int16)a10);
  sub_1B70EBF34((unint64_t)buf, 18, (unsigned __int16)a11);
  sub_1B70EBF34((unint64_t)buf, 20, (unsigned __int16)a12);
  sub_1B70EBF34((unint64_t)buf, 22, (unsigned __int16)a13);
  sub_1B70EBF34((unint64_t)buf, 24, a14);
  v29 = sub_1B70EBC9C((uint64_t)buf, v25 - v43 + v42);
  sub_1B70EC0D4((uint64_t)buf, v29, 0, 0);
  v30 = objc_alloc(MEMORY[0x1E0C99D50]);
  v31 = sub_1B70EC038((uint64_t)buf);
  v33 = (void *)objc_msgSend_initWithBytes_length_(v30, v32, v31, (v47 - v48 + DWORD2(v47)));
  self = (KVEncodedSpanInfo *)(id)objc_msgSend_initWithBuffer_verify_value_error_(self, v34, (uint64_t)v33, 0, v21, 0);

  sub_1B70ED4B4(buf);
  v35 = self;
LABEL_13:

  return v35;
}

- (KVEncodedSpanInfo)initWithBuffer:(id)a3 verify:(BOOL)a4 value:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  KVEncodedSpanInfo *v13;
  KVEncodedSpanInfo *v14;
  void **p_buffer;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  int *v35;
  unsigned __int16 *v36;
  unsigned int v37;
  uint64_t v38;
  KVEncodedSpanInfo *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  void *v62;
  void *v63;
  char *v65;
  unint64_t v66;
  __int128 v67;
  uint64_t v68;
  char v69;
  objc_super v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  _QWORD v74[2];

  v8 = a4;
  v74[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v70.receiver = self;
  v70.super_class = (Class)KVEncodedSpanInfo;
  v13 = -[KVSpanInfo initWithSpanInfo:](&v70, sel_initWithSpanInfo_, 0);
  v14 = v13;
  if (v13)
  {
    p_buffer = (void **)&v13->_buffer;
    objc_storeStrong((id *)&v13->_buffer, a3);
    objc_storeStrong((id *)&v14->_value, a5);
    if (objc_msgSend_length(*p_buffer, v16, v17, v18))
    {
      v22 = (unsigned int *)objc_msgSend_bytes(*p_buffer, v19, v20, v21);
      v14->_encodedSpanInfo = (const SpanInfo *)v22 + *v22;
      if (!v8)
        goto LABEL_53;
      v26 = (char *)objc_msgSend_bytes(*p_buffer, v23, v24, v25);
      v30 = objc_msgSend_length(*p_buffer, v27, v28, v29);
      v65 = v26;
      v66 = v30;
      v67 = xmmword_1B7111350;
      v68 = 0;
      v69 = 1;
      if (v30 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      if (v30 >= 5)
      {
        v34 = *(unsigned int *)v26;
        if ((int)v34 >= 1 && v30 - 1 >= v34)
        {
          v35 = (int *)&v26[v34];
          if (sub_1B70EEC48((uint64_t *)&v65, v35))
          {
            v36 = (unsigned __int16 *)((char *)v35 - *v35);
            v37 = *v36;
            if (v37 < 5)
              goto LABEL_53;
            if (!v36[2] || v66 >= 3 && v66 - 2 >= (char *)v35 + v36[2] - v65)
            {
              if (v37 < 7)
                goto LABEL_53;
              if (!v36[3] || v66 >= 3 && v66 - 2 >= (char *)v35 + v36[3] - v65)
              {
                if (v37 < 9)
                  goto LABEL_53;
                if (!v36[4] || v66 >= 5 && v66 - 4 >= (char *)v35 + v36[4] - v65)
                {
                  if (v37 < 0xB)
                    goto LABEL_53;
                  if (!v36[5] || v66 >= 3 && v66 - 2 >= (char *)v35 + v36[5] - v65)
                  {
                    if (v37 < 0xD)
                      goto LABEL_53;
                    if (!v36[6] || v66 >= 3 && v66 - 2 >= (char *)v35 + v36[6] - v65)
                    {
                      if (v37 < 0xF)
                        goto LABEL_53;
                      if (!v36[7] || v66 >= 3 && v66 - 2 >= (char *)v35 + v36[7] - v65)
                      {
                        if (v37 < 0x11)
                          goto LABEL_53;
                        if (!v36[8] || v66 >= 3 && v66 - 2 >= (char *)v35 + v36[8] - v65)
                        {
                          if (v37 < 0x13)
                            goto LABEL_53;
                          if (!v36[9] || v66 >= 3 && v66 - 2 >= (char *)v35 + v36[9] - v65)
                          {
                            if (v37 < 0x15)
                              goto LABEL_53;
                            if (!v36[10] || v66 >= 3 && v66 - 2 >= (char *)v35 + v36[10] - v65)
                            {
                              if (v37 < 0x17)
                                goto LABEL_53;
                              if (!v36[11] || v66 >= 3 && v66 - 2 >= (char *)v35 + v36[11] - v65)
                              {
                                if (v37 < 0x19)
                                  goto LABEL_53;
                                v38 = v36[12];
                                if (!v38 || v66 >= 3 && v66 - 2 >= (char *)v35 + v38 - v65)
                                  goto LABEL_53;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      v52 = (void *)MEMORY[0x1E0CB35C8];
      v71 = *MEMORY[0x1E0CB2D50];
      v53 = (void *)MEMORY[0x1E0CB3940];
      v54 = *p_buffer;
      objc_msgSend_encodedString(v14, v31, v32, v33);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v53, v56, (uint64_t)CFSTR("Failed to verify spanInfo buffer: %@ (encoded string: %@)"), v57, v54, v55);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v58;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v59, (uint64_t)&v72, (uint64_t)&v71, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v52, v61, (uint64_t)CFSTR("com.apple.koa.KVSpanInfo"), -1, v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v62;
      if (a6 && v62)
        *a6 = objc_retainAutorelease(v62);

    }
    else
    {
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v73 = *MEMORY[0x1E0CB2D50];
      v41 = (void *)MEMORY[0x1E0CB3940];
      v42 = *p_buffer;
      objc_msgSend_encodedString(v14, v19, v20, v21);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v41, v44, (uint64_t)CFSTR("Invalid spanInfo buffer: %@ (encoded string: %@)"), v45, v42, v43);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v46;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v47, (uint64_t)v74, (uint64_t)&v73, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v40, v49, (uint64_t)CFSTR("com.apple.koa.KVSpanInfo"), -1, v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v50;
      if (a6 && v50)
        *a6 = objc_retainAutorelease(v50);

    }
    v39 = 0;
    goto LABEL_63;
  }
LABEL_53:
  v39 = v14;
LABEL_63:

  return v39;
}

- (id)encodedString
{
  return (id)((uint64_t (*)(NSData *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self->_buffer, sel_base64EncodedStringWithOptions_, 0);
}

- (_NSRange)spanRange
{
  const SpanInfo *encodedSpanInfo;
  const SpanInfo *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  encodedSpanInfo = self->_encodedSpanInfo;
  v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  v4 = *(unsigned __int16 *)v3->var0;
  if (v4 < 5)
  {
    LODWORD(v5) = 0;
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v5 = *(unsigned __int16 *)v3[4].var0;
  if (*(_WORD *)v3[4].var0)
    LODWORD(v5) = *(unsigned __int16 *)encodedSpanInfo[v5].var0;
  if (v4 < 7)
    goto LABEL_8;
  v6 = *(unsigned __int16 *)v3[6].var0;
  if (!v6)
    goto LABEL_8;
  v7 = *(unsigned __int16 *)encodedSpanInfo[v6].var0;
LABEL_9:
  v8 = v5;
  result.length = v7;
  result.location = v8;
  return result;
}

- (id)value
{
  return self->_value;
}

- (float)matchScore
{
  const SpanInfo *encodedSpanInfo;
  const SpanInfo *v3;
  float result;
  uint64_t v5;

  encodedSpanInfo = self->_encodedSpanInfo;
  v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 9u)
  {
    v5 = *(unsigned __int16 *)v3[8].var0;
    if (v5)
      return *(float *)encodedSpanInfo[v5].var0;
  }
  return result;
}

- (unsigned)maxTokenCount
{
  const SpanInfo *encodedSpanInfo;
  const SpanInfo *v3;
  uint64_t v4;

  encodedSpanInfo = self->_encodedSpanInfo;
  v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  else
    return 0;
}

- (unsigned)matchedTokenCount
{
  const SpanInfo *encodedSpanInfo;
  const SpanInfo *v3;
  uint64_t v4;

  encodedSpanInfo = self->_encodedSpanInfo;
  v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0)
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  else
    return 0;
}

- (unsigned)maxStopWordCount
{
  const SpanInfo *encodedSpanInfo;
  const SpanInfo *v3;
  uint64_t v4;

  encodedSpanInfo = self->_encodedSpanInfo;
  v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0)
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  else
    return 0;
}

- (unsigned)matchedStopWordCount
{
  const SpanInfo *encodedSpanInfo;
  const SpanInfo *v3;
  uint64_t v4;

  encodedSpanInfo = self->_encodedSpanInfo;
  v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0)
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  else
    return 0;
}

- (unsigned)maxAliasCount
{
  const SpanInfo *encodedSpanInfo;
  const SpanInfo *v3;
  uint64_t v4;

  encodedSpanInfo = self->_encodedSpanInfo;
  v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (v4 = *(unsigned __int16 *)v3[18].var0) != 0)
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  else
    return 0;
}

- (unsigned)matchedAliasCount
{
  const SpanInfo *encodedSpanInfo;
  const SpanInfo *v3;
  uint64_t v4;

  encodedSpanInfo = self->_encodedSpanInfo;
  v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (v4 = *(unsigned __int16 *)v3[20].var0) != 0)
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  else
    return 0;
}

- (unsigned)editDistance
{
  const SpanInfo *encodedSpanInfo;
  const SpanInfo *v3;
  uint64_t v4;

  encodedSpanInfo = self->_encodedSpanInfo;
  v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x17u && (v4 = *(unsigned __int16 *)v3[22].var0) != 0)
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  else
    return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int *v20;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v11 = objc_msgSend_copyWithZone_(self->_value, v9, (uint64_t)a3, v10);
  v12 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = v11;

  v15 = objc_msgSend_copyWithZone_(self->_buffer, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v8 + 24);
  *(_QWORD *)(v8 + 24) = v15;

  v20 = (unsigned int *)objc_msgSend_bytes(*(void **)(v8 + 24), v17, v18, v19);
  *(_QWORD *)(v8 + 32) = (char *)v20 + *v20;
  return (id)v8;
}

- (BOOL)isEqual:(id)a3
{
  KVEncodedSpanInfo *v4;
  KVEncodedSpanInfo *v5;
  const char *v6;
  uint64_t v7;
  char isEqualToSpanInfo;

  v4 = (KVEncodedSpanInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToSpanInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToSpanInfo = objc_msgSend_isEqualToSpanInfo_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    isEqualToSpanInfo = 0;
  }

  return isEqualToSpanInfo;
}

- (BOOL)isEqualToSpanInfo:(id)a3
{
  void *v3;
  uint64_t *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  NSString *value;
  NSString *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  char isEqual;

  v5 = (uint64_t *)a3;
  v9 = v5;
  v10 = 16;
  value = self->_value;
  v12 = value;
  if (!value)
  {
    objc_msgSend_value(v5, v6, v7, v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v15 = 0;
LABEL_8:
      isEqual = objc_msgSend_isEqual_(self->_buffer, v6, v9[3], v8);
      if (!v15)
        goto LABEL_10;
      goto LABEL_9;
    }
    v12 = self->_value;
  }
  objc_msgSend_value(v9, v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(v12, v13, v10, v14))
  {
    v15 = 1;
    goto LABEL_8;
  }
  isEqual = 0;
LABEL_9:

LABEL_10:
  if (!value)

  return isEqual;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  NSString *value;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  void *v47;

  value = self->_value;
  if (value)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("value: \"%@\" "), v3, value);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E6B7B918;
  }
  v47 = (void *)MEMORY[0x1E0CB3940];
  v7 = (void *)MEMORY[0x1E0CB3B18];
  v8 = objc_msgSend_spanRange(self, a2, v2, v3);
  objc_msgSend_valueWithRange_(v7, v9, v8, (uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_matchedTokenCount(self, v11, v12, v13);
  v18 = objc_msgSend_maxTokenCount(self, v15, v16, v17);
  v22 = objc_msgSend_matchedStopWordCount(self, v19, v20, v21);
  v26 = objc_msgSend_maxStopWordCount(self, v23, v24, v25);
  v30 = objc_msgSend_matchedAliasCount(self, v27, v28, v29);
  v34 = objc_msgSend_maxAliasCount(self, v31, v32, v33);
  v38 = objc_msgSend_editDistance(self, v35, v36, v37);
  objc_msgSend_matchScore(self, v39, v40, v41);
  objc_msgSend_stringWithFormat_(v47, v43, (uint64_t)CFSTR("%@%@ tokens matched: (%u/%u) stop words: (%u/%u) alias: (%u/%u) edit distance: %u match score: %f"), v44, v6, v10, v14, v18, v22, v26, v30, v34, v38, v42);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend_hash(self->_value, a2, v2, v3);
  return objc_msgSend_hash(self->_buffer, v6, v7, v8) ^ v5;
}

- (BOOL)isPartialMatch
{
  uint64_t v2;
  uint64_t v3;
  int v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend_matchedTokenCount(self, a2, v2, v3);
  return v5 != objc_msgSend_maxTokenCount(self, v6, v7, v8);
}

- (BOOL)isApproximateMatch
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_editDistance(self, a2, v2, v3) != 0;
}

- (BOOL)isAliasMatch
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_matchedAliasCount(self, a2, v2, v3) != 0;
}

- (unsigned)aliasMatchOptions
{
  const SpanInfo *encodedSpanInfo;
  const SpanInfo *v3;
  uint64_t v4;

  encodedSpanInfo = self->_encodedSpanInfo;
  v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x19u && (v4 = *(unsigned __int16 *)v3[24].var0) != 0)
    return *(_WORD *)encodedSpanInfo[v4].var0;
  else
    return 0;
}

- (id)getAliasTypesArray
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  const SpanInfo *encodedSpanInfo;
  uint64_t v9;
  const SpanInfo *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  encodedSpanInfo = self->_encodedSpanInfo;
  v9 = *(int *)encodedSpanInfo->var0;
  v10 = &encodedSpanInfo[-v9];
  if (*(unsigned __int16 *)encodedSpanInfo[-v9].var0 >= 0x19u)
  {
    v11 = -v9;
    v12 = *(unsigned __int16 *)v10[24].var0;
    if (v12 && (*(_WORD *)encodedSpanInfo[v12].var0 & 1) != 0)
    {
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, 1, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v7, v14, (uint64_t)v13, v15);

      encodedSpanInfo = self->_encodedSpanInfo;
      v16 = *(int *)encodedSpanInfo->var0;
      if (*(unsigned __int16 *)encodedSpanInfo[-v16].var0 < 0x19u)
        return v7;
      v11 = -v16;
    }
    if (*(_WORD *)encodedSpanInfo[v11 + 24].var0
      && (*(_WORD *)encodedSpanInfo[*(unsigned __int16 *)encodedSpanInfo[v11 + 24].var0].var0 & 2) != 0)
    {
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, 2, v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v7, v18, (uint64_t)v17, v19);

      encodedSpanInfo = self->_encodedSpanInfo;
      v20 = *(int *)encodedSpanInfo->var0;
      if (*(unsigned __int16 *)encodedSpanInfo[-v20].var0 < 0x19u)
        return v7;
      v11 = -v20;
    }
    if (*(_WORD *)encodedSpanInfo[v11 + 24].var0
      && (*(_WORD *)encodedSpanInfo[*(unsigned __int16 *)encodedSpanInfo[v11 + 24].var0].var0 & 4) != 0)
    {
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, 4, v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v7, v22, (uint64_t)v21, v23);

      encodedSpanInfo = self->_encodedSpanInfo;
      v24 = *(int *)encodedSpanInfo->var0;
      if (*(unsigned __int16 *)encodedSpanInfo[-v24].var0 < 0x19u)
        return v7;
      v11 = -v24;
    }
    v25 = *(unsigned __int16 *)encodedSpanInfo[v11 + 24].var0;
    if (v25 && (*(_WORD *)encodedSpanInfo[v25].var0 & 8) != 0)
    {
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, 8, v6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v7, v27, (uint64_t)v26, v28);

    }
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (id)spanInfoFromEncodedString:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  KVEncodedSpanInfo *v9;
  const char *v10;
  void *v11;

  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D50]);
    v8 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v6, v7, (uint64_t)v5, 0);
  }
  else
  {
    v8 = 0;
  }
  v9 = [KVEncodedSpanInfo alloc];
  v11 = (void *)objc_msgSend_initWithBuffer_verify_value_error_(v9, v10, (uint64_t)v8, 1, 0, a4);

  return v11;
}

@end
