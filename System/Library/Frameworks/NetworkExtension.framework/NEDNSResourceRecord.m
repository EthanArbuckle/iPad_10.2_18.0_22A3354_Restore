@implementation NEDNSResourceRecord

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)recordClass
{
  return self->_recordClass;
}

- (unint64_t)timeToLive
{
  return self->_timeToLive;
}

- (unint64_t)dataLength
{
  return self->_dataLength;
}

- (NSString)resourceString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceString, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (_QWORD)initFromByteParser:(void *)a1
{
  _QWORD *v3;
  const char *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  _QWORD *v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint8_t buf[8];
  objc_super v45;
  unsigned __int8 v46;

  v3 = a2;
  if (!a1)
  {
    v14 = 0;
    goto LABEL_27;
  }
  v46 = 1;
  v45.receiver = a1;
  v45.super_class = (Class)NEDNSResourceRecord;
  v5 = objc_msgSendSuper2(&v45, sel_init);
  if (!v5)
    goto LABEL_25;
  -[NEByteParser parseDomainName](v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v5[2];
  v5[2] = v6;

  if (!v5[2])
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR name";
LABEL_23:
    _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_24;
  }
  v5[1] = -[NEByteParser parse16Bits:]((uint64_t)v3, &v46);
  if (!v46)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR type";
    goto LABEL_23;
  }
  v5[3] = -[NEByteParser parse16Bits:]((uint64_t)v3, &v46);
  if (!v46)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR class";
    goto LABEL_23;
  }
  v5[4] = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
  if (v46)
  {
    v8 = (const char *)-[NEByteParser parse16Bits:]((uint64_t)v3, &v46);
    v5[5] = v8;
    if (v46)
    {
      v9 = v5[1];
      switch(v9)
      {
        case 1:
          if ((_DWORD)v8 != 4)
            goto LABEL_25;
          -[NEByteParser parseAddressWithFamily:]((uint64_t)v3, 2);
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v5[6];
          v5[6] = v10;

          if (v5[6])
            goto LABEL_72;
          ne_log_obj();
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR A address";
          goto LABEL_23;
        case 2:
          -[NEByteParser parseDomainName](v3, v8);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v5[6];
          v5[6] = v18;

          if (v5[6])
            goto LABEL_72;
          ne_log_obj();
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR NS";
          goto LABEL_23;
        case 3:
        case 4:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
          goto LABEL_72;
        case 5:
          -[NEByteParser parseDomainName](v3, v8);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v5[6];
          v5[6] = v20;

          if (v5[6])
            goto LABEL_72;
          ne_log_obj();
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR CNAME";
          goto LABEL_23;
        case 6:
          -[NEByteParser parseDomainName](v3, v8);
          v22 = objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            ne_log_obj();
            v12 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              goto LABEL_24;
            *(_WORD *)buf = 0;
            v13 = "Failed to parse RR SOA main name";
            goto LABEL_23;
          }
          v24 = (void *)v22;
          -[NEByteParser parseDomainName](v3, v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            ne_log_obj();
            v37 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              goto LABEL_70;
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA responsible name";
            goto LABEL_69;
          }
          v26 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          if (!v46)
          {
            ne_log_obj();
            v37 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              goto LABEL_70;
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA serial number";
            goto LABEL_69;
          }
          v27 = v26;
          v28 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          if (!v46)
          {
            ne_log_obj();
            v37 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              goto LABEL_70;
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA refresh interval";
            goto LABEL_69;
          }
          v29 = v28;
          v30 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          if (!v46)
          {
            ne_log_obj();
            v37 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              goto LABEL_70;
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA retry interval";
            goto LABEL_69;
          }
          v31 = v30;
          v32 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          if (!v46)
          {
            ne_log_obj();
            v37 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              goto LABEL_70;
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA expire interval";
            goto LABEL_69;
          }
          v33 = v32;
          v34 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          v35 = v46;
          if (v46)
          {
            v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@ %u %u %u %u %u"), v24, v25, v27, v29, v31, v33, v34);
            v37 = v5[6];
            v5[6] = v36;
            goto LABEL_71;
          }
          ne_log_obj();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA minimum TTL";
LABEL_69:
            _os_log_error_impl(&dword_19BD16000, v37, OS_LOG_TYPE_ERROR, v43, buf, 2u);
          }
LABEL_70:
          v35 = 0;
LABEL_71:

          if (!v35)
            goto LABEL_25;
LABEL_72:
          v14 = v5;
          break;
        case 12:
          -[NEByteParser parseDomainName](v3, v8);
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)v5[6];
          v5[6] = v38;

          if (v5[6])
            goto LABEL_72;
          ne_log_obj();
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR PTR";
          goto LABEL_23;
        default:
          if (v9 == 16)
          {
            v40 = -[NEByteParser parseBytes:]((uint64_t)v3, v8);
            if (v40)
            {
              v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v40, v5[5], 4);
              v42 = (void *)v5[6];
              v5[6] = v41;

              goto LABEL_72;
            }
            ne_log_obj();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v13 = "Failed to parse RR TXT";
              goto LABEL_23;
            }
          }
          else
          {
            if (v9 != 28)
              goto LABEL_72;
            if ((_DWORD)v8 != 16)
              goto LABEL_25;
            -[NEByteParser parseAddressWithFamily:]((uint64_t)v3, 30);
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v5[6];
            v5[6] = v16;

            if (v5[6])
              goto LABEL_72;
            ne_log_obj();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v13 = "Failed to parse RR AAAA address";
              goto LABEL_23;
            }
          }
          goto LABEL_24;
      }
      goto LABEL_26;
    }
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR length";
    goto LABEL_23;
  }
  ne_log_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR TTL";
    goto LABEL_23;
  }
LABEL_24:

LABEL_25:
  v14 = 0;
LABEL_26:

LABEL_27:
  return v14;
}

@end
