@implementation ENSSKeychainQuery

+ (BOOL)isSynchronizationAvailable
{
  return floor(*MEMORY[0x24BDD0D50]) > 993.0;
}

+ (id)errorWithCode:(int)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (a3 <= -1002)
  {
    switch(a3)
    {
      case -25300:
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("errSecItemNotFound");
        goto LABEL_23;
      case -25299:
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("errSecDuplicateItem");
        goto LABEL_23;
      case -25298:
      case -25297:
      case -25296:
      case -25295:
      case -25294:
      case -25292:
        goto LABEL_15;
      case -25293:
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("errSecAuthFailed");
        goto LABEL_23;
      case -25291:
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("errSecNotAvailable");
        goto LABEL_23;
      default:
        if (a3 == -26275)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("errSecDecode");
        }
        else
        {
          if (a3 != -25308)
            goto LABEL_15;
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("errSecInteractionNotAllowed");
        }
        break;
    }
    goto LABEL_23;
  }
  if (a3 > -51)
  {
    switch(a3)
    {
      case -50:
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("errSecParam");
        goto LABEL_23;
      case -4:
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("errSecUnimplemented");
        goto LABEL_23;
      case 0:
        return 0;
    }
    goto LABEL_15;
  }
  if (a3 == -1001)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("ENSSKeychainErrorBadArguments");
    goto LABEL_23;
  }
  if (a3 != -108)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("errSecDefault");
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = CFSTR("errSecAllocate");
LABEL_23:
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24F8BBA48, CFSTR("ENSSKeychain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = *MEMORY[0x24BDD0FC8];
    v12[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.samsoffes.ENSSKeychain"), a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)save:(id *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  BOOL v17;

  -[ENSSKeychainQuery service](self, "service");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_13;
  v6 = (void *)v5;
  -[ENSSKeychainQuery account](self, "account");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

LABEL_13:
    if (!a3)
      return 0;
    objc_msgSend((id)objc_opt_class(), "errorWithCode:", 4294966295);
    v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v17;
  }
  v8 = (void *)v7;
  -[ENSSKeychainQuery passwordData](self, "passwordData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_13;
  -[ENSSKeychainQuery deleteItem:](self, "deleteItem:", 0);
  -[ENSSKeychainQuery query](self, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSSKeychainQuery passwordData](self, "passwordData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, *MEMORY[0x24BDE9550]);

  -[ENSSKeychainQuery label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ENSSKeychainQuery label](self, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v13, *MEMORY[0x24BDE90A0]);

  }
  v14 = +[ENSSKeychain accessibilityType](ENSSKeychain, "accessibilityType");
  if (v14)
    objc_msgSend(v10, "setObject:forKey:", v14, *MEMORY[0x24BDE8F60]);
  v15 = SecItemAdd((CFDictionaryRef)v10, 0);
  v16 = v15;
  if (a3 && (_DWORD)v15)
  {
    objc_msgSend((id)objc_opt_class(), "errorWithCode:", v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16 == 0;

  return v17;
}

- (BOOL)deleteItem:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFDictionary *v8;
  uint64_t v9;
  int v10;
  BOOL v11;

  -[ENSSKeychainQuery service](self, "service");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ENSSKeychainQuery account](self, "account"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[ENSSKeychainQuery query](self, "query");
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = SecItemDelete(v8);
    v10 = v9;
    if (a3 && (_DWORD)v9)
    {
      objc_msgSend((id)objc_opt_class(), "errorWithCode:", v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10 == 0;

  }
  else if (a3)
  {
    objc_msgSend((id)objc_opt_class(), "errorWithCode:", 4294966295);
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v11;
}

- (id)fetchAll:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  CFTypeRef result;

  -[ENSSKeychainQuery query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE94C0]);
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x24BDE93B8], *MEMORY[0x24BDE93B0]);
  result = 0;
  v5 = SecItemCopyMatching((CFDictionaryRef)v4, &result);
  if (a3 && (_DWORD)v5)
  {
    objc_msgSend((id)objc_opt_class(), "errorWithCode:", v5);
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)result;
  }

  return v6;
}

- (BOOL)fetch:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  CFTypeRef result;

  -[ENSSKeychainQuery service](self, "service");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ENSSKeychainQuery account](self, "account"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    result = 0;
    -[ENSSKeychainQuery query](self, "query");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE94C8]);
    objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x24BDE93C0], *MEMORY[0x24BDE93B0]);
    v9 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
    v10 = (_DWORD)v9 == 0;
    if ((_DWORD)v9)
    {
      if (a3)
      {
        objc_msgSend((id)objc_opt_class(), "errorWithCode:", v9);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v11 = (void *)result;
      -[ENSSKeychainQuery setPasswordData:](self, "setPasswordData:", result);

    }
  }
  else if (a3)
  {
    objc_msgSend((id)objc_opt_class(), "errorWithCode:", 4294966295);
    v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v10;
}

- (void)setPasswordObject:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ENSSKeychainQuery setPasswordData:](self, "setPasswordData:", v4);

}

- (NSCoding)passwordObject
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[ENSSKeychainQuery passwordData](self, "passwordData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1620];
    -[ENSSKeychainQuery passwordData](self, "passwordData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unarchiveObjectWithData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSCoding *)v7;
}

- (void)setPassword:(id)a3
{
  id v4;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ENSSKeychainQuery setPasswordData:](self, "setPasswordData:", v4);

}

- (NSString)password
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  -[ENSSKeychainQuery passwordData](self, "passwordData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[ENSSKeychainQuery passwordData](self, "passwordData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithData:encoding:", v6, 4);

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (id)query
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x24BDE9230], *MEMORY[0x24BDE9220]);
  -[ENSSKeychainQuery service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ENSSKeychainQuery service](self, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x24BDE9128]);

  }
  -[ENSSKeychainQuery account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ENSSKeychainQuery account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x24BDE8FA8]);

  }
  -[ENSSKeychainQuery accessGroup](self, "accessGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ENSSKeychainQuery accessGroup](self, "accessGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x24BDE8F50]);

  }
  if (objc_msgSend((id)objc_opt_class(), "isSynchronizationAvailable"))
  {
    v10 = -[ENSSKeychainQuery synchronizationMode](self, "synchronizationMode");
    if (v10)
    {
      v11 = (void *)MEMORY[0x24BDBD1C0];
      if (v10 != 1)
        v11 = 0;
      if (v10 == 2)
        v12 = (id)MEMORY[0x24BDBD1C8];
      else
        v12 = v11;
    }
    else
    {
      v12 = (id)*MEMORY[0x24BDE9148];
    }
    objc_msgSend(v3, "setObject:forKey:", v12, *MEMORY[0x24BDE9140]);

  }
  return v3;
}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)passwordData
{
  return self->_passwordData;
}

- (void)setPasswordData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (void)setAccessGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)synchronizationMode
{
  return self->_synchronizationMode;
}

- (void)setSynchronizationMode:(unint64_t)a3
{
  self->_synchronizationMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_passwordData, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
