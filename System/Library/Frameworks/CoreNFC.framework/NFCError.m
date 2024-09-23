@implementation NFCError

+ (id)errorWithCode:(int64_t)a3
{
  return -[NFCError initWithCode:userInfo:]([NFCError alloc], "initWithCode:userInfo:", a3, 0);
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v5;
  NFCError *v6;

  v5 = a4;
  v6 = -[NFCError initWithCode:userInfo:]([NFCError alloc], "initWithCode:userInfo:", a3, v5);

  return v6;
}

- (NFCError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6;
  const __CFString *v7;
  id v8;
  void *v9;
  NFCError *v10;
  objc_super v12;

  v6 = a4;
  if (a3 > 199)
  {
    switch(a3)
    {
      case 200:
        v7 = CFSTR("Session invalidated by user");
        break;
      case 201:
        v7 = CFSTR("Session timeout");
        break;
      case 202:
        v7 = CFSTR("Session invalidated unexpectedly");
        break;
      case 203:
        v7 = CFSTR("System resource unavailable");
        break;
      case 204:
        v7 = CFSTR("First NDEF tag read");
        break;
      default:
        switch(a3)
        {
          case 400:
            v7 = CFSTR("NDEF tag is read only");
            break;
          case 401:
            v7 = CFSTR("NDEF tag write failed");
            break;
          case 402:
            v7 = CFSTR("Insufficient space on NDEF tag");
            break;
          case 403:
            v7 = CFSTR("NDEF tag does not contain any NDEF message");
            break;
          default:
            if (a3 == 300)
              v7 = CFSTR("Invalid configuration parameters");
            else
              v7 = 0;
            break;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
        v7 = CFSTR("Feature not supported");
        break;
      case 2:
        v7 = CFSTR("Missing required entitlement");
        break;
      case 3:
        v7 = CFSTR("Invalid parameter");
        break;
      case 4:
        v7 = CFSTR("Invalid parameter length");
        break;
      case 5:
        v7 = CFSTR("Parameter value is out of bound");
        break;
      case 6:
        v7 = CFSTR("NFC radio is disabled");
        break;
      default:
        switch(a3)
        {
          case 'd':
            v7 = CFSTR("Tag connection lost");
            break;
          case 'e':
            v7 = CFSTR("Maximum retries exceeded");
            break;
          case 'f':
            v7 = CFSTR("Tag response error");
            break;
          case 'g':
            v7 = CFSTR("Session invalidated");
            break;
          case 'h':
            v7 = CFSTR("Tag is not connected");
            break;
          case 'i':
            v7 = CFSTR("Packet length has exceeded the limit");
            break;
          default:
            v7 = 0;
            break;
        }
        break;
    }
  }
  v8 = objc_alloc(MEMORY[0x24BDBCED8]);
  v9 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v7, *MEMORY[0x24BDD0FC8], 0);
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v9, "addEntriesFromDictionary:", v6);
  v12.receiver = self;
  v12.super_class = (Class)NFCError;
  v10 = -[NFCError initWithDomain:code:userInfo:](&v12, sel_initWithDomain_code_userInfo_, CFSTR("NFCError"), a3, v9);

  return v10;
}

+ (id)errorWithNFCDError:(id)a3 defaultNFCErrorCode:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  int64_t v20;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("NFCError"));

    if (v8)
    {
      v9 = v6;
LABEL_10:
      v10 = v9;
      goto LABEL_14;
    }
    objc_msgSend(v6, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if ((v13 & 1) != 0)
    {
      if (objc_msgSend(v6, "code") == 28 || objc_msgSend(v6, "code") == 51)
      {
        v14 = 100;
LABEL_9:
        +[NFCError errorWithCode:](NFCError, "errorWithCode:", v14);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      if (objc_msgSend(v6, "code") == 32 || objc_msgSend(v6, "code") == 8)
      {
        v14 = 2;
        goto LABEL_9;
      }
      if (objc_msgSend(v6, "code") == 29)
      {
        v22 = *MEMORY[0x24BDD1398];
        v31[0] = *MEMORY[0x24BDD0FC8];
        v31[1] = v22;
        v32[0] = CFSTR("Tag response error / no response");
        v32[1] = v6;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

        goto LABEL_14;
      }
      if (objc_msgSend(v6, "code") == 37)
      {
        v29 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Tag Not NDEF formatted");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v23;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
      if (objc_msgSend(v6, "code") == 49)
      {
        v14 = 403;
        goto LABEL_9;
      }
      if (objc_msgSend(v6, "code") == 46)
      {
        v14 = 400;
        goto LABEL_9;
      }
      if (objc_msgSend(v6, "code") == 43)
      {
        v14 = 402;
        goto LABEL_9;
      }
      if (objc_msgSend(v6, "code") == 64)
      {
        v27 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Reader mode prohibit timer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 203;
        goto LABEL_13;
      }
      v25[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Stack Error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = *MEMORY[0x24BDD1398];
      v26[0] = v15;
      v26[1] = v6;
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = v26;
      v18 = v25;
    }
    else
    {
      v33[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = *MEMORY[0x24BDD1398];
      v34[0] = v15;
      v34[1] = v6;
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = v34;
      v18 = v33;
    }
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = a4;
LABEL_13:
    +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", v20, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

@end
