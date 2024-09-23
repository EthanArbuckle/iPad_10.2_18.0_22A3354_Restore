@implementation NSPDNSPacket

- (id)initFromData:(id)a3
{
  id v5;
  NSPDNSPacket *v6;
  NSDate *v7;
  NSDate *timestamp;
  NSPByteParser *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  int v19;
  NSObject *p_super;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  NSPDNSQuery *v24;
  NSPDNSQuery *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  void *v34;
  NSPDNSPacket *v35;
  const char *v36;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  NSObject *v41;
  const char *v42;
  int v43;
  id v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  NSArray *queries;
  uint64_t v49;
  NSArray *answers;
  uint64_t v51;
  NSArray *authorities;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  unsigned int v56;
  unsigned int v57;
  objc_super v58;
  char v59;
  uint8_t buf[4];
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v59 = 1;
  v58.receiver = self;
  v58.super_class = (Class)NSPDNSPacket;
  v6 = -[NSPDNSPacket init](&v58, sel_init);
  if (!v6)
  {
    v18 = 0;
    v26 = 0;
    v30 = 0;
    v34 = 0;
    v9 = 0;
    goto LABEL_31;
  }
  v7 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  timestamp = v6->_timestamp;
  v6->_timestamp = v7;

  objc_storeStrong((id *)&v6->_data, a3);
  v9 = -[NSPByteParser initWithData:]([NSPByteParser alloc], "initWithData:", v5);
  v6->_identifier = -[NSPByteParser parse16Bits:](v9, "parse16Bits:", &v59);
  if (!v59)
  {
    nplog_obj();
    p_super = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v36 = "Failed to parse DNS packet identifier";
LABEL_44:
    _os_log_error_impl(&dword_19E8FE000, p_super, OS_LOG_TYPE_ERROR, v36, buf, 2u);
    goto LABEL_45;
  }
  v10 = -[NSPByteParser parse16Bits:](v9, "parse16Bits:", &v59);
  if (!v59)
  {
    nplog_obj();
    p_super = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v36 = "Failed to parse DNS packet flags";
    goto LABEL_44;
  }
  v6->_messageType = v10 >> 15;
  v6->_opCode = (v10 >> 11) & 0xF;
  v6->_isAuthoritativeAnswer = (v10 & 0x400) != 0;
  v6->_isTruncated = (v10 & 0x200) != 0;
  v6->_isRecursionDesired = BYTE1(v10) & 1;
  v6->_isRecursionAvailable = (v10 & 0x80) != 0;
  v6->_responseCode = v10 & 0xF;
  v11 = -[NSPByteParser parse16Bits:](v9, "parse16Bits:", &v59);
  if (!v59)
  {
    nplog_obj();
    p_super = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v36 = "Failed to parse DNS packet query count";
    goto LABEL_44;
  }
  v12 = v11;
  v13 = -[NSPByteParser parse16Bits:](v9, "parse16Bits:", &v59);
  if (!v59)
  {
    nplog_obj();
    p_super = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v36 = "Failed to parse DNS packet answer count";
    goto LABEL_44;
  }
  v14 = v13;
  v15 = -[NSPByteParser parse16Bits:](v9, "parse16Bits:", &v59);
  if (!v59)
  {
    nplog_obj();
    p_super = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v36 = "Failed to parse DNS packet authority count";
    goto LABEL_44;
  }
  v16 = v15;
  v17 = -[NSPByteParser parse16Bits:](v9, "parse16Bits:", &v59);
  if (!v59)
  {
    nplog_obj();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v36 = "Failed to parse DNS packet additional record count";
      goto LABEL_44;
    }
LABEL_45:
    v34 = 0;
    v30 = 0;
    v26 = 0;
    v18 = 0;
    goto LABEL_46;
  }
  v56 = v17;
  v57 = v16;
  v18 = 0;
  if (!v12)
  {
LABEL_17:
    v26 = 0;
    if (v14)
    {
      v27 = 0;
      while (1)
      {
        v28 = -[NSPDNSResourceRecord initFromByteParser:]([NSPDNSResourceRecord alloc], "initFromByteParser:", v9);
        if (!v28)
          break;
        v29 = v28;
        if (!v26)
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
        objc_msgSend(v26, "addObject:", v29);

        if (++v27 >= v14)
          goto LABEL_23;
      }
      nplog_obj();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v61 = v27;
        _os_log_error_impl(&dword_19E8FE000, v38, OS_LOG_TYPE_ERROR, "Failed to parse answer %u", buf, 8u);
      }

      v30 = 0;
    }
    else
    {
LABEL_23:
      if (!v57)
      {
        v30 = 0;
LABEL_58:
        if (!v56)
        {
          v34 = 0;
LABEL_74:
          v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v18);
          queries = v6->_queries;
          v6->_queries = (NSArray *)v47;

          v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v26);
          answers = v6->_answers;
          v6->_answers = (NSArray *)v49;

          v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v30);
          authorities = v6->_authorities;
          v6->_authorities = (NSArray *)v51;

          v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v34);
          p_super = &v6->_additionalRecords->super;
          v6->_additionalRecords = (NSArray *)v53;
          goto LABEL_46;
        }
        v34 = 0;
        v43 = 0;
        while (1)
        {
          v44 = -[NSPDNSResourceRecord initFromByteParser:]([NSPDNSResourceRecord alloc], "initFromByteParser:", v9);
          if (!v44)
            break;
          v45 = v44;
          if (!v34)
            v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v56);
          objc_msgSend(v34, "addObject:", v45);

          if (++v43 >= v56)
            goto LABEL_74;
        }
        nplog_obj();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v61 = v43;
          _os_log_error_impl(&dword_19E8FE000, v54, OS_LOG_TYPE_ERROR, "Failed to parse additional record %u", buf, 8u);
        }

        goto LABEL_31;
      }
      v30 = 0;
      v31 = 0;
      while (1)
      {
        v32 = -[NSPDNSResourceRecord initFromByteParser:]([NSPDNSResourceRecord alloc], "initFromByteParser:", v9);
        if (!v32)
          break;
        v33 = v32;
        if (!v30)
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v57);
        objc_msgSend(v30, "addObject:", v33);

        if (++v31 >= v57)
          goto LABEL_58;
      }
      nplog_obj();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v61 = v31;
        _os_log_error_impl(&dword_19E8FE000, v46, OS_LOG_TYPE_ERROR, "Failed to parse authority %u", buf, 8u);
      }

    }
    v34 = 0;
LABEL_31:
    v35 = 0;
    v59 = 0;
    goto LABEL_49;
  }
  v19 = 0;
  v55 = v12;
  while (1)
  {
    -[NSPByteParser parseDomainName](v9, "parseDomainName", v55);
    p_super = objc_claimAutoreleasedReturnValue();
    if (!p_super)
    {
      nplog_obj();
      v39 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        goto LABEL_68;
      *(_DWORD *)buf = 67109120;
      v61 = v19;
      v40 = "Failed to parse DNS packet query %u name";
      goto LABEL_81;
    }
    v21 = -[NSPByteParser parse16Bits:](v9, "parse16Bits:", &v59);
    if (!v59)
    {
      nplog_obj();
      v41 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
LABEL_66:

        v34 = 0;
        v30 = 0;
        v26 = 0;
        goto LABEL_46;
      }
      *(_DWORD *)buf = 67109120;
      v61 = v19;
      v42 = "Failed to parse DNS packet query %u type";
LABEL_79:
      _os_log_error_impl(&dword_19E8FE000, v41, OS_LOG_TYPE_ERROR, v42, buf, 8u);
      goto LABEL_66;
    }
    v22 = v21;
    v23 = -[NSPByteParser parse16Bits:](v9, "parse16Bits:", &v59);
    if (!v59)
    {
      nplog_obj();
      v41 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        goto LABEL_66;
      *(_DWORD *)buf = 67109120;
      v61 = v19;
      v42 = "Failed to parse DNS packet query %u class";
      goto LABEL_79;
    }
    v24 = -[NSPDNSQuery initWithName:recordType:recordClass:]([NSPDNSQuery alloc], "initWithName:recordType:recordClass:", p_super, v22, v23);
    if (!v24)
      break;
    v25 = v24;
    if (!v18)
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v55);
    objc_msgSend(v18, "addObject:", v25);

    if (++v19 >= v12)
      goto LABEL_17;
  }
  nplog_obj();
  v39 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    goto LABEL_68;
  *(_DWORD *)buf = 67109120;
  v61 = v19;
  v40 = "Failed to allocate a query object for query %u";
LABEL_81:
  _os_log_error_impl(&dword_19E8FE000, v39, OS_LOG_TYPE_ERROR, v40, buf, 8u);
LABEL_68:

  v34 = 0;
  v30 = 0;
  v26 = 0;
  v59 = 0;
LABEL_46:

  if (v59)
    v35 = v6;
  else
    v35 = 0;
LABEL_49:

  return v35;
}

- (NSString)responseCodeString
{
  unint64_t v2;

  v2 = -[NSPDNSPacket responseCode](self, "responseCode");
  if (v2 > 6)
    return (NSString *)CFSTR("unknown");
  else
    return &off_1E4137870[v2]->isa;
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

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
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

@end
