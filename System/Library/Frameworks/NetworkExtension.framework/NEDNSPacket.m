@implementation NEDNSPacket

- (id)initFromData:(id)a3
{
  id v5;
  NEDNSPacket *v6;
  NSDate *v7;
  NSDate *timestamp;
  _QWORD *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  const char *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  NEDNSQuery *v26;
  NEDNSQuery *v27;
  unint64_t v28;
  void *v29;
  int v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  int v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  NEDNSPacket *v38;
  NSObject *v39;
  const char *v40;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  const char *v45;
  int v46;
  _QWORD *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  uint64_t v51;
  NSArray *queries;
  uint64_t v53;
  NSArray *answers;
  uint64_t v55;
  NSArray *authorities;
  uint64_t v57;
  NSArray *additionalRecords;
  NSObject *v59;
  uint64_t v60;
  unsigned int v61;
  unsigned int v62;
  objc_super v63;
  char v64;
  uint8_t buf[4];
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v64 = 1;
  v63.receiver = self;
  v63.super_class = (Class)NEDNSPacket;
  v6 = -[NEDNSPacket init](&v63, sel_init);
  if (!v6)
  {
    v19 = 0;
    v29 = 0;
    v33 = 0;
    v37 = 0;
    v9 = 0;
LABEL_33:
    v38 = 0;
    v64 = 0;
    goto LABEL_50;
  }
  v7 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  timestamp = v6->_timestamp;
  v6->_timestamp = v7;

  objc_storeStrong((id *)&v6->_data, a3);
  v9 = -[NEByteParser initWithData:]([NEByteParser alloc], v5);
  v6->_identifier = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    ne_log_obj();
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v40 = "Failed to parse DNS packet identifier";
LABEL_46:
    _os_log_error_impl(&dword_19BD16000, v39, OS_LOG_TYPE_ERROR, v40, buf, 2u);
    goto LABEL_47;
  }
  v10 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  v6->_flags = v10;
  if (!v64)
  {
    ne_log_obj();
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v40 = "Failed to parse DNS packet flags";
    goto LABEL_46;
  }
  v6->_messageType = v10 >> 15;
  v6->_opCode = (v10 >> 11) & 0xF;
  v6->_isAuthoritativeAnswer = (v10 & 0x400) != 0;
  v6->_isTruncated = (v10 & 0x200) != 0;
  v6->_isRecursionDesired = BYTE1(v10) & 1;
  v6->_isRecursionAvailable = (v10 & 0x80) != 0;
  v6->_responseCode = v10 & 0xF;
  v11 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    ne_log_obj();
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v40 = "Failed to parse DNS packet query count";
    goto LABEL_46;
  }
  v12 = v11;
  v13 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    ne_log_obj();
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v40 = "Failed to parse DNS packet answer count";
    goto LABEL_46;
  }
  v14 = v13;
  v15 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    ne_log_obj();
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v40 = "Failed to parse DNS packet authority count";
    goto LABEL_46;
  }
  v16 = v15;
  v17 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    ne_log_obj();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v40 = "Failed to parse DNS packet additional record count";
      goto LABEL_46;
    }
LABEL_47:

    v19 = 0;
    goto LABEL_48;
  }
  v61 = v17;
  v62 = v16;
  v19 = 0;
  if (v12)
  {
    v20 = 0;
    v60 = v12;
    while (1)
    {
      -[NEByteParser parseDomainName](v9, v18);
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        ne_log_obj();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v66 = v20;
          _os_log_error_impl(&dword_19BD16000, v43, OS_LOG_TYPE_ERROR, "Failed to parse DNS packet query %u name", buf, 8u);
        }

        v22 = 0;
        goto LABEL_72;
      }
      v22 = (void *)v21;
      v23 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
      if (!v64)
        break;
      v24 = v23;
      v25 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
      if (!v64)
      {
        ne_log_obj();
        v44 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          goto LABEL_68;
        *(_DWORD *)buf = 67109120;
        v66 = v20;
        v45 = "Failed to parse DNS packet query %u class";
        goto LABEL_85;
      }
      v26 = -[NEDNSQuery initWithName:recordType:recordClass:]([NEDNSQuery alloc], "initWithName:recordType:recordClass:", v22, v24, v25);
      if (!v26)
      {
        ne_log_obj();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v66 = v20;
          _os_log_error_impl(&dword_19BD16000, v49, OS_LOG_TYPE_ERROR, "Failed to allocate a query object for query %u", buf, 8u);
        }

LABEL_72:
        v64 = 0;
LABEL_73:

LABEL_48:
        v29 = 0;
        v33 = 0;
        v37 = 0;
LABEL_49:
        v38 = 0;
        goto LABEL_50;
      }
      v27 = v26;
      if (!v19)
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v60);
      objc_msgSend(v19, "addObject:", v27, v60);

      if (++v20 >= v12)
        goto LABEL_17;
    }
    ne_log_obj();
    v44 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
LABEL_68:

      goto LABEL_73;
    }
    *(_DWORD *)buf = 67109120;
    v66 = v20;
    v45 = "Failed to parse DNS packet query %u type";
LABEL_85:
    _os_log_error_impl(&dword_19BD16000, v44, OS_LOG_TYPE_ERROR, v45, buf, 8u);
    goto LABEL_68;
  }
LABEL_17:
  if (v9)
    v28 = v9[1];
  else
    v28 = 0;
  v6->_endOfQueriesOffset = v28;
  v29 = 0;
  if (v14)
  {
    v30 = 0;
    while (1)
    {
      v31 = -[NEDNSResourceRecord initFromByteParser:]([NEDNSResourceRecord alloc], v9);
      if (!v31)
        break;
      v32 = v31;
      if (!v29)
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
      objc_msgSend(v29, "addObject:", v32);

      if (++v30 >= v14)
        goto LABEL_25;
    }
    ne_log_obj();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v66 = v30;
      _os_log_error_impl(&dword_19BD16000, v42, OS_LOG_TYPE_ERROR, "Failed to parse answer %u", buf, 8u);
    }

    v33 = 0;
    goto LABEL_77;
  }
LABEL_25:
  if (v62)
  {
    v33 = 0;
    v34 = 0;
    while (1)
    {
      v35 = -[NEDNSResourceRecord initFromByteParser:]([NEDNSResourceRecord alloc], v9);
      if (!v35)
        break;
      v36 = v35;
      if (!v33)
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v62);
      objc_msgSend(v33, "addObject:", v36);

      if (++v34 >= v62)
        goto LABEL_60;
    }
    ne_log_obj();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v66 = v34;
      _os_log_error_impl(&dword_19BD16000, v50, OS_LOG_TYPE_ERROR, "Failed to parse authority %u", buf, 8u);
    }

LABEL_77:
    v37 = 0;
    goto LABEL_33;
  }
  v33 = 0;
LABEL_60:
  if (v61)
  {
    v37 = 0;
    v46 = 0;
    while (1)
    {
      v47 = -[NEDNSResourceRecord initFromByteParser:]([NEDNSResourceRecord alloc], v9);
      if (!v47)
        break;
      v48 = v47;
      if (!v37)
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v61);
      objc_msgSend(v37, "addObject:", v48);

      if (++v46 >= v61)
        goto LABEL_79;
    }
    ne_log_obj();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v66 = v46;
      _os_log_error_impl(&dword_19BD16000, v59, OS_LOG_TYPE_ERROR, "Failed to parse additional record %u", buf, 8u);
    }

    goto LABEL_33;
  }
  v37 = 0;
LABEL_79:
  v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v19);
  queries = v6->_queries;
  v6->_queries = (NSArray *)v51;

  v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v29);
  answers = v6->_answers;
  v6->_answers = (NSArray *)v53;

  v55 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v33);
  authorities = v6->_authorities;
  v6->_authorities = (NSArray *)v55;

  v57 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v37);
  additionalRecords = v6->_additionalRecords;
  v6->_additionalRecords = (NSArray *)v57;

  if (!v64)
    goto LABEL_49;
  v38 = v6;
LABEL_50:

  return v38;
}

- (NSString)responseCodeString
{
  unint64_t v2;

  v2 = -[NEDNSPacket responseCode](self, "responseCode");
  if (v2 > 6)
    return (NSString *)CFSTR("unknown");
  else
    return &off_1E3CBFE30[v2]->isa;
}

- (id)createResponse
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint32_t v17;
  uint64_t v18;
  BOOL v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  unsigned int flags;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  NEDNSPacket *v43;
  id v44;
  NSArray *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int16 v54;
  __int16 v55;
  __int16 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _DWORD v63[32];
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (self->_messageType == 1)
    return self->_data;
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v43 = self;
  v4 = self->_queries;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (!v5)
    goto LABEL_44;
  v6 = v5;
  v7 = *(_QWORD *)v51;
  v45 = v4;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v51 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v8);
      objc_msgSend((id)v9, "answerData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if (v9)
        {
          v11 = *(void **)(v9 + 40);
          if (!v11 || (unint64_t)objc_msgSend(v11, "length") >= 0x10000)
          {
            ne_log_obj();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v13 = *(_QWORD *)(v9 + 16);
              v14 = objc_msgSend(*(id *)(v9 + 40), "length");
              *(_DWORD *)buf = 138412546;
              v65 = v13;
              v66 = 2048;
              v67 = v14;
              v15 = v12;
              v16 = "Failed to create an answer for %@, invalid answer data length (%lu)";
              v17 = 22;
              goto LABEL_33;
            }
            goto LABEL_34;
          }
          v18 = *(_QWORD *)(v9 + 24);
          v19 = v18 == 28 || v18 == 1;
          if (v19 && *(_QWORD *)(v9 + 32) == 1)
          {
            v20 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
            objc_msgSend(*(id *)(v9 + 16), "componentsSeparatedByString:", CFSTR("."));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v22 = v21;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v58;
              while (2)
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v58 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                  if ((unint64_t)objc_msgSend(v27, "length") > 0x3F)
                  {

                    v29 = 0;
                    goto LABEL_40;
                  }
                  buf[0] = 0;
                  buf[0] = objc_msgSend(v27, "length");
                  objc_msgSend(v20, "appendBytes:length:", buf, 1);
                  if (buf[0])
                  {
                    v28 = (const char *)objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
                    objc_msgSend(v20, "appendBytes:length:", v28, strlen(v28));
                  }
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
                if (v24)
                  continue;
                break;
              }
            }

            v56 = bswap32(*(unsigned __int16 *)(v9 + 24)) >> 16;
            objc_msgSend(v20, "appendBytes:length:", &v56, 2);
            v55 = bswap32(*(unsigned __int16 *)(v9 + 32)) >> 16;
            objc_msgSend(v20, "appendBytes:length:", &v55, 2);
            *(_DWORD *)buf = bswap32(*(_DWORD *)(v9 + 8));
            objc_msgSend(v20, "appendBytes:length:", buf, 4);
            v54 = bswap32(objc_msgSend(*(id *)(v9 + 40), "length")) >> 16;
            objc_msgSend(v20, "appendBytes:length:", &v54, 2);
            objc_msgSend(v20, "appendData:", *(_QWORD *)(v9 + 40));
            v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", v20);
LABEL_40:

            if (v29)
              objc_msgSend(v44, "addObject:", v29);
            v4 = v45;
            goto LABEL_36;
          }
          ne_log_obj();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v30 = *(_QWORD *)(v9 + 16);
            v31 = *(_QWORD *)(v9 + 24);
            v32 = *(_QWORD *)(v9 + 32);
            *(_DWORD *)buf = 138412802;
            v65 = v30;
            v66 = 2048;
            v67 = v31;
            v68 = 2048;
            v69 = v32;
            v15 = v12;
            v16 = "Failed to create an answer for %@, unsupported record type (%ld) and/or record class (%ld)";
            v17 = 32;
LABEL_33:
            _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, v16, buf, v17);
          }
LABEL_34:

        }
        v29 = 0;
LABEL_36:

      }
      ++v8;
    }
    while (v8 != v6);
    v33 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    v6 = v33;
  }
  while (v33);
LABEL_44:

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", -[NSData bytes](v43->_data, "bytes"), 6);
  v43->_flags = v43->_flags & 0x7BF0 | 0x8400;
  v35 = objc_msgSend(v44, "count");
  flags = v43->_flags;
  if (!v35)
  {
    flags |= 3u;
    v43->_flags = flags;
  }
  LOWORD(v57) = __rev16(flags);
  objc_msgSend(v34, "replaceBytesInRange:withBytes:length:", 2, 2, &v57, 2);
  *(_WORD *)buf = bswap32(objc_msgSend(v44, "count")) >> 16;
  objc_msgSend(v34, "appendBytes:length:", buf, 2);
  v63[0] = 0;
  objc_msgSend(v34, "appendBytes:length:", v63, 4);
  if (v43->_endOfQueriesOffset >= 0xD)
    objc_msgSend(v34, "appendBytes:length:", -[NSData bytes](v43->_data, "bytes") + 12, v43->_endOfQueriesOffset - 12);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v37 = v44;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(v34, "appendData:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
    }
    while (v39);
  }

  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", v34);
  return v42;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (int64_t)opCode
{
  return self->_opCode;
}

- (BOOL)isAuthoritativeAnswer
{
  return self->_isAuthoritativeAnswer;
}

- (BOOL)isTruncated
{
  return self->_isTruncated;
}

- (BOOL)isRecursionDesired
{
  return self->_isRecursionDesired;
}

- (BOOL)isRecursionAvailable
{
  return self->_isRecursionAvailable;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (NSArray)queries
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)answers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)authorities
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)additionalRecords
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_additionalRecords, 0);
  objc_storeStrong((id *)&self->_authorities, 0);
  objc_storeStrong((id *)&self->_answers, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

+ (id)createDataWithQuery:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const char *v13;
  void *v14;
  __int16 v16;
  __int16 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int16 v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v27 = 2560;
  objc_msgSend(v4, "appendBytes:length:", &v27, 2);
  v26 = 1;
  objc_msgSend(v4, "appendBytes:length:", &v26, 2);
  v25 = 256;
  objc_msgSend(v4, "appendBytes:length:", &v25, 2);
  v24 = 0;
  objc_msgSend(v4, "appendBytes:length:", &v24, 2);
  v23 = 0;
  objc_msgSend(v4, "appendBytes:length:", &v23, 2);
  v22 = 0;
  objc_msgSend(v4, "appendBytes:length:", &v22, 2);
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v12, "length") > 0x3F)
        {

          v14 = 0;
          goto LABEL_13;
        }
        LOBYTE(v17) = 0;
        LOBYTE(v17) = objc_msgSend(v12, "length");
        objc_msgSend(v4, "appendBytes:length:", &v17, 1);
        if ((_BYTE)v17)
        {
          v13 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          objc_msgSend(v4, "appendBytes:length:", v13, strlen(v13));
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      if (v9)
        continue;
      break;
    }
  }

  v17 = bswap32(objc_msgSend(v3, "recordType")) >> 16;
  objc_msgSend(v4, "appendBytes:length:", &v17, 2);
  v16 = bswap32(objc_msgSend(v3, "recordClass")) >> 16;
  objc_msgSend(v4, "appendBytes:length:", &v16, 2);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", v4);
LABEL_13:

  return v14;
}

@end
