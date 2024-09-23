@implementation __CFN_SocksHandshakev5

- (BOOL)parse:(const char *)a3 len:(int64_t)a4 completion:(id)a5
{
  const char *v8;
  unint64_t v9;
  int v10;
  objc_class *v11;
  uint64_t v12;
  NSMutableSet *authMethods;
  void *v14;
  int v15;
  id v16;
  const char *v17;
  void *v18;
  int v19;
  id v20;
  unint64_t v21;
  int v22;
  int64_t usernameLen;
  int64_t v24;
  int v25;
  void *v26;
  int64_t passwordLen;
  int64_t v28;
  NSMutableString *v29;
  NSMutableString *domainName;
  int addressType;
  int v32;
  unsigned __int8 v33;
  int v34;
  NSMutableString *v35;
  const __CFString *v36;
  int v37;
  int64_t destinationLen;
  unsigned __int8 v39;
  int v40;
  __int16 v41;
  int v42;
  NSMutableString *username;
  void *v44;
  NSMutableString *password;
  void *v46;
  id v47;
  const char *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  NSMutableString *v53;
  void *v54;
  dispatch_data_t v55;
  dispatch_data_t v56;
  const char *v57;
  dispatch_data_t v58;
  dispatch_data_t v59;
  BOOL done;
  void (**v62)(id, dispatch_data_t, _QWORD);

  v62 = (void (**)(id, dispatch_data_t, _QWORD))a5;
  while (2)
  {
    switch(self->_state)
    {
      case 0uLL:
        v9 = 1;
        goto LABEL_23;
      case 1uLL:
        v10 = *a3++;
        self->_numberOfAuthVersionSupported = v10;
        self->_state = 2;
        v11 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v12 = 56;
        goto LABEL_17;
      case 2uLL:
        authMethods = self->_authMethods;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](authMethods, "addObject:", v14);

        v15 = self->_numberOfAuthVersionSupported - 1;
        self->_numberOfAuthVersionSupported = v15;
        if (v15)
          goto LABEL_24;
        v16 = objc_getProperty(self, v8, 24, 1);
        if (v16)
        {
          v18 = v16;
          v19 = -[NSMutableSet containsObject:](self->_authMethods, "containsObject:", &unk_1E152A658);

          if (v19)
            goto LABEL_68;
        }
        v20 = objc_getProperty(self, v17, 24, 1);
        if (v20)
        {

        }
        else if (-[NSMutableSet containsObject:](self->_authMethods, "containsObject:", &unk_1E152A670))
        {
          self->_state = 3;
          v57 = (const char *)&unk_18411E110;
LABEL_69:
          v58 = dispatch_data_create(v57, 2uLL, 0, 0);
          v62[2](v62, v58, 0);

          goto LABEL_24;
        }
        if (-[NSMutableSet containsObject:](self->_authMethods, "containsObject:", &unk_1E152A658))
        {
LABEL_68:
          self->_state = 4;
          v57 = "\x05\x02";
          goto LABEL_69;
        }
        v59 = dispatch_data_create("\x05\xFF", 2uLL, 0, 0);
        v62[2](v62, v59, 1);

LABEL_71:
        self->_done = 1;
        goto LABEL_24;
      case 3uLL:
        v21 = 10;
        goto LABEL_42;
      case 4uLL:
        v21 = 5;
        goto LABEL_42;
      case 5uLL:
        v9 = 6;
        goto LABEL_23;
      case 6uLL:
        v22 = *a3++;
        self->_usernameLen = v22;
        self->_state = 7;
        v11 = (objc_class *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
        v12 = 112;
        goto LABEL_17;
      case 7uLL:
        usernameLen = self->_usernameLen;
        if (a4 >= usernameLen)
        {
          self->_state = 8;
          v24 = self->_usernameLen;
        }
        else
        {
          self->_usernameLen = usernameLen - a4;
          v24 = a4;
        }
        username = self->_username;
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3, v24, 1);
        -[NSMutableString appendString:](username, "appendString:", v44);

        goto LABEL_53;
      case 8uLL:
        v25 = *a3++;
        self->_passwordLen = v25;
        self->_state = 9;
        v11 = (objc_class *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
        v12 = 128;
LABEL_17:
        v26 = *(Class *)((char *)&self->super.super.isa + v12);
        *(Class *)((char *)&self->super.super.isa + v12) = v11;

        goto LABEL_25;
      case 9uLL:
        passwordLen = self->_passwordLen;
        if (a4 >= passwordLen)
        {
          self->_state = 10;
          v28 = self->_passwordLen;
        }
        else
        {
          self->_passwordLen = passwordLen - a4;
          v28 = a4;
        }
        password = self->_password;
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3, v28, 1);
        -[NSMutableString appendString:](password, "appendString:", v46);

        a3 += v28;
        a4 -= v28;
        if (self->_state != 10)
          goto LABEL_54;
        v47 = objc_getProperty(self, v8, 24, 1);
        if (!v47)
        {
          v51 = 0;
LABEL_61:
          v55 = dispatch_data_create(&unk_18411E113, 2uLL, 0, 0);
          v62[2](v62, v55, 0);

          goto LABEL_64;
        }
        v49 = v47;
        objc_msgSend(objc_getProperty(self, v48, 24, 1), "objectForKeyedSubscript:", self->_username);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v50;
        if (v50)
        {
          v52 = objc_msgSend(v50, "isEqualToString:", self->_password);

          if (v52)
            goto LABEL_61;
        }
        else
        {

        }
        v56 = dispatch_data_create("\x01\x01", 2uLL, 0, 0);
        v62[2](v62, v56, 1);

        self->_done = 1;
LABEL_64:

        goto LABEL_54;
      case 0xAuLL:
        v9 = 11;
        goto LABEL_23;
      case 0xBuLL:
        v9 = 12;
        goto LABEL_23;
      case 0xCuLL:
        v9 = 13;
        goto LABEL_23;
      case 0xDuLL:
        self->_addressType = *a3;
        v29 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
        domainName = self->_domainName;
        self->_domainName = v29;

        addressType = self->_addressType;
        if (addressType == 4)
        {
          self->_state = 17;
          v32 = 16;
LABEL_58:
          self->_destinationLen = v32;
          goto LABEL_24;
        }
        if (addressType != 3)
        {
          if (addressType != 1)
            goto LABEL_71;
          self->_state = 14;
          v32 = 4;
          goto LABEL_58;
        }
        v9 = 15;
LABEL_23:
        self->_state = v9;
LABEL_24:
        ++a3;
LABEL_25:
        --a4;
LABEL_54:
        if (!a4)
        {
          done = self->_done;
          goto LABEL_73;
        }
        if (!self->_done)
          continue;
        done = 1;
LABEL_73:

        return done;
      case 0xEuLL:
        -[NSMutableString appendFormat:](self->_domainName, "appendFormat:", CFSTR("%u"), *(unsigned __int8 *)a3);
        v33 = *a3++;
        self->ipaddr[-self->_destinationLen + 4] = v33;
        --a4;
        v34 = self->_destinationLen - 1;
        self->_destinationLen = v34;
        if (!v34)
          goto LABEL_41;
        v35 = self->_domainName;
        v36 = CFSTR(".");
        goto LABEL_38;
      case 0xFuLL:
        v37 = *a3++;
        self->_destinationLen = v37;
        self->_state = 16;
        goto LABEL_25;
      case 0x10uLL:
        destinationLen = self->_destinationLen;
        if (a4 >= destinationLen)
        {
          self->_state = 18;
          v24 = self->_destinationLen;
        }
        else
        {
          self->_destinationLen = destinationLen - a4;
          v24 = a4;
        }
        v53 = self->_domainName;
        v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3, v24, 1);
        -[NSMutableString appendString:](v53, "appendString:", v54);

LABEL_53:
        a3 += v24;
        a4 -= v24;
        goto LABEL_54;
      case 0x11uLL:
        -[NSMutableString appendFormat:](self->_domainName, "appendFormat:", CFSTR("%.2x"), *(unsigned __int8 *)a3);
        v39 = *a3++;
        self->ipaddr[-self->_destinationLen + 16] = v39;
        --a4;
        v40 = self->_destinationLen - 1;
        self->_destinationLen = v40;
        if (v40)
        {
          if ((v40 & 1) == 0)
          {
            v35 = self->_domainName;
            v36 = CFSTR(":");
LABEL_38:
            -[NSMutableString appendString:](v35, "appendString:", v36);
          }
        }
        else
        {
LABEL_41:
          v21 = 18;
LABEL_42:
          self->_state = v21;
        }
        goto LABEL_54;
      case 0x12uLL:
        v41 = *(unsigned __int8 *)a3++;
        self->_destPort = v41 | (self->_destPort << 8);
        --a4;
        v42 = self->_portLen + 1;
        self->_portLen = v42;
        if (v42 == 2)
        {
          objc_setProperty_atomic(self, v8, self->_domainName, 16);
          self->super._port = self->_destPort;
          self->_state = 19;
          self->_done = 1;
        }
        goto LABEL_54;
      default:
        goto LABEL_54;
    }
  }
}

- (id)finish:(int)a3
{
  void *v5;
  const char *v6;
  int v7;
  unsigned __int8 *ipaddr;
  void *v9;
  uint64_t v10;
  size_t v12;
  id v13;
  dispatch_data_t v14;
  __int16 v15;
  unsigned __int8 addressType;

  if (self)
  {
    if (self->super._finished)
      return 0;
    self->super._finished = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendBytes:length:", "\x05", 1);
  if (a3)
    v6 = "\x01";
  else
    v6 = (const char *)byte_18411E1F8;
  objc_msgSend(v5, "appendBytes:length:", v6, 1);
  objc_msgSend(v5, "appendBytes:length:", byte_18411E1F8, 1);
  addressType = self->_addressType;
  objc_msgSend(v5, "appendBytes:length:", &addressType, 1);
  v7 = self->_addressType;
  switch(v7)
  {
    case 4:
      ipaddr = self->ipaddr;
      v9 = v5;
      v10 = 16;
      goto LABEL_14;
    case 3:
      v12 = strlen((const char *)-[NSMutableString UTF8String](self->_domainName, "UTF8String"));
      addressType = v12;
      objc_msgSend(v5, "appendBytes:length:", &addressType, 1);
      ipaddr = (unsigned __int8 *)-[NSMutableString UTF8String](self->_domainName, "UTF8String");
      v9 = v5;
      v10 = v12;
      goto LABEL_14;
    case 1:
      ipaddr = self->ipaddr;
      v9 = v5;
      v10 = 4;
LABEL_14:
      objc_msgSend(v9, "appendBytes:length:", ipaddr, v10);
      break;
  }
  v15 = 0;
  objc_msgSend(v5, "appendBytes:length:", &v15, 2);
  v13 = objc_retainAutorelease(v5);
  v14 = dispatch_data_create((const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 0, 0);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_authMethods, 0);
}

@end
