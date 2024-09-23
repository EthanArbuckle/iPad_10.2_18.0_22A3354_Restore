@implementation NSPDNSResourceRecord

- (id)initFromByteParser:(id)a3
{
  id v4;
  NSPDNSResourceRecord *v5;
  uint64_t v6;
  NSString *name;
  unint64_t v8;
  int64_t type;
  uint64_t v10;
  NSString *resourceString;
  NSObject *v12;
  const char *v13;
  NSPDNSResourceRecord *v14;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSString *v35;
  uint64_t v36;
  NSString *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  const char *v43;
  uint8_t buf[8];
  objc_super v45;
  char v46;

  v4 = a3;
  v46 = 1;
  v45.receiver = self;
  v45.super_class = (Class)NSPDNSResourceRecord;
  v5 = -[NSPDNSResourceRecord init](&v45, sel_init);
  if (!v5)
    goto LABEL_24;
  objc_msgSend(v4, "parseDomainName");
  v6 = objc_claimAutoreleasedReturnValue();
  name = v5->_name;
  v5->_name = (NSString *)v6;

  if (!v5->_name)
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR name";
LABEL_22:
    _os_log_error_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_23;
  }
  v5->_type = objc_msgSend(v4, "parse16Bits:", &v46);
  if (!v46)
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR type";
    goto LABEL_22;
  }
  v5->_recordClass = objc_msgSend(v4, "parse16Bits:", &v46);
  if (!v46)
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR class";
    goto LABEL_22;
  }
  v5->_timeToLive = objc_msgSend(v4, "parse32Bits:", &v46);
  if (!v46)
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR TTL";
    goto LABEL_22;
  }
  v8 = objc_msgSend(v4, "parse16Bits:", &v46);
  v5->_dataLength = v8;
  if (!v46)
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "Failed to parse RR length";
      goto LABEL_22;
    }
LABEL_23:

LABEL_24:
    v14 = 0;
    goto LABEL_25;
  }
  type = v5->_type;
  switch(type)
  {
    case 1:
      if ((_DWORD)v8 != 4)
        goto LABEL_24;
      objc_msgSend(v4, "parseAddressWithFamily:", 2);
      v10 = objc_claimAutoreleasedReturnValue();
      resourceString = v5->_resourceString;
      v5->_resourceString = (NSString *)v10;

      if (v5->_resourceString)
        goto LABEL_73;
      nplog_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v13 = "Failed to parse RR A address";
      goto LABEL_22;
    case 2:
      objc_msgSend(v4, "parseDomainName");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v5->_resourceString;
      v5->_resourceString = (NSString *)v18;

      if (v5->_resourceString)
        goto LABEL_73;
      nplog_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v13 = "Failed to parse RR NS";
      goto LABEL_22;
    case 3:
    case 4:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      goto LABEL_74;
    case 5:
      objc_msgSend(v4, "parseDomainName");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v5->_resourceString;
      v5->_resourceString = (NSString *)v20;

      if (v5->_resourceString)
        goto LABEL_73;
      nplog_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v13 = "Failed to parse RR CNAME";
      goto LABEL_22;
    case 6:
      objc_msgSend(v4, "parseDomainName");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        objc_msgSend(v4, "parseDomainName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          nplog_obj();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19E8FE000, v41, OS_LOG_TYPE_ERROR, "Failed to parse RR SOA responsible name", buf, 2u);
          }

          v46 = 0;
          goto LABEL_71;
        }
        v25 = objc_msgSend(v4, "parse32Bits:", &v46);
        if (v46)
        {
          v26 = v25;
          v27 = objc_msgSend(v4, "parse32Bits:", &v46);
          if (v46)
          {
            v28 = v27;
            v29 = objc_msgSend(v4, "parse32Bits:", &v46);
            if (v46)
            {
              v30 = v29;
              v31 = objc_msgSend(v4, "parse32Bits:", &v46);
              if (v46)
              {
                v32 = v31;
                v33 = objc_msgSend(v4, "parse32Bits:", &v46);
                if (v46)
                {
                  v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@ %u %u %u %u %u"), v23, v24, v26, v28, v30, v32, v33);
                  v35 = v5->_resourceString;
                  v5->_resourceString = (NSString *)v34;

LABEL_71:
                  goto LABEL_72;
                }
                nplog_obj();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v43 = "Failed to parse RR SOA minimum TTL";
                  goto LABEL_69;
                }
LABEL_70:

                goto LABEL_71;
              }
              nplog_obj();
              v42 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                goto LABEL_70;
              *(_WORD *)buf = 0;
              v43 = "Failed to parse RR SOA expire interval";
            }
            else
            {
              nplog_obj();
              v42 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                goto LABEL_70;
              *(_WORD *)buf = 0;
              v43 = "Failed to parse RR SOA retry interval";
            }
          }
          else
          {
            nplog_obj();
            v42 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              goto LABEL_70;
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA refresh interval";
          }
        }
        else
        {
          nplog_obj();
          v42 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            goto LABEL_70;
          *(_WORD *)buf = 0;
          v43 = "Failed to parse RR SOA serial number";
        }
LABEL_69:
        _os_log_error_impl(&dword_19E8FE000, v42, OS_LOG_TYPE_ERROR, v43, buf, 2u);
        goto LABEL_70;
      }
      nplog_obj();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E8FE000, v40, OS_LOG_TYPE_ERROR, "Failed to parse RR SOA main name", buf, 2u);
      }

      v23 = 0;
      v46 = 0;
LABEL_72:

LABEL_73:
      if (!v46)
        goto LABEL_24;
LABEL_74:
      v14 = v5;
      break;
    case 12:
      objc_msgSend(v4, "parseDomainName");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v5->_resourceString;
      v5->_resourceString = (NSString *)v36;

      if (v5->_resourceString)
        goto LABEL_73;
      nplog_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v13 = "Failed to parse RR PTR";
      goto LABEL_22;
    default:
      if (type == 16)
      {
        v38 = objc_msgSend(v4, "parseBytes:");
        if (v38)
        {
          v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v38, v5->_dataLength, 4);
          v23 = v5->_resourceString;
          v5->_resourceString = (NSString *)v39;
          goto LABEL_72;
        }
        nplog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR TXT";
          goto LABEL_22;
        }
      }
      else
      {
        if (type != 28)
          goto LABEL_74;
        if ((_DWORD)v8 != 16)
          goto LABEL_24;
        objc_msgSend(v4, "parseAddressWithFamily:", 30);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v5->_resourceString;
        v5->_resourceString = (NSString *)v16;

        if (v5->_resourceString)
          goto LABEL_73;
        nplog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR AAAA address";
          goto LABEL_22;
        }
      }
      goto LABEL_23;
  }
LABEL_25:

  return v14;
}

- (id)copyStateDictionary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSPDNSResourceRecord resourceString](self, "resourceString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[NSPDNSResourceRecord timeToLive](self, "timeToLive"));
  v5 = objc_alloc(MEMORY[0x1E0C99D80]);
  -[NSPDNSResourceRecord name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSPDNSResourceRecord typeToString:](NSPDNSResourceRecord, "typeToString:", -[NSPDNSResourceRecord type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPDNSResourceRecord resourceString](self, "resourceString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, CFSTR("name"), v7, CFSTR("type"), v8, CFSTR("resource"), v4, CFSTR("ttl"), 0);

  return v9;
}

+ (id)typeToString:(int64_t)a3
{
  id result;
  __CFString *v4;

  result = CFSTR("Unknown");
  switch(a3)
  {
    case 1:
      result = CFSTR("A");
      break;
    case 2:
      result = CFSTR("NS");
      break;
    case 3:
    case 4:
    case 7:
    case 8:
    case 9:
    case 10:
      return result;
    case 5:
      result = CFSTR("CNAME");
      break;
    case 6:
      result = CFSTR("SOA");
      break;
    case 11:
      result = CFSTR("SRV");
      break;
    case 12:
      result = CFSTR("PTR");
      break;
    case 13:
      result = CFSTR("INFO");
      break;
    case 14:
      result = CFSTR("MBOX");
      break;
    case 15:
      result = CFSTR("MEXG");
      break;
    case 16:
      result = CFSTR("TXT");
      break;
    default:
      v4 = CFSTR("*");
      if (a3 != 255)
        v4 = CFSTR("Unknown");
      if (a3 == 28)
        result = CFSTR("AAAA");
      else
        result = v4;
      break;
  }
  return result;
}

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

@end
