@implementation KeychainWrapper

+ (id)keychainWrapperWithMACAddress:(id)a3
{
  KeychainWrapper *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;

  if (!a3)
    return 0;
  v4 = [KeychainWrapper alloc];
  v6 = sub_21A69114C(a3, 0, v5);
  v7 = sub_21A690C10((uint64_t)CFSTR("keychainBaseStationType"), (uint64_t)CFSTR("AirPortSettings"));
  return (id)objc_msgSend_initWithAccountName_serviceName_(v4, v8, (uint64_t)v6, v7);
}

- (KeychainWrapper)initWithAccountName:(id)a3 serviceName:(id)a4
{
  KeychainWrapper *v6;
  const char *v7;
  KeychainWrapper *v8;
  const char *v9;
  id v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)KeychainWrapper;
  v6 = -[KeychainWrapper init](&v13, sel_init);
  v8 = v6;
  if (v6)
  {
    objc_msgSend_setAccountName_(v6, v7, (uint64_t)a3);
    objc_msgSend_setServiceName_(v8, v9, (uint64_t)a4);
    v10 = objc_alloc_init(MEMORY[0x24BDD1648]);
    objc_msgSend_setLock_(v8, v11, (uint64_t)v10);
  }
  return v8;
}

- (void)dealloc
{
  const char *v3;
  const char *v4;
  objc_super v5;

  objc_msgSend_setAccountName_(self, a2, 0);
  objc_msgSend_setServiceName_(self, v3, 0);
  objc_msgSend_setLock_(self, v4, 0);
  v5.receiver = self;
  v5.super_class = (Class)KeychainWrapper;
  -[KeychainWrapper dealloc](&v5, sel_dealloc);
}

+ (id)keychainPasswordForMACAddress:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3)
    && (v5 = objc_msgSend_keychainWrapperWithMACAddress_(KeychainWrapper, v4, (uint64_t)a3)) != 0)
  {
    return (id)MEMORY[0x24BEDD108](v5, sel_genericPassword, v6);
  }
  else
  {
    return 0;
  }
}

+ (void)removeKeychainPasswordForMACAddress:(id)a3
{
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3))
  {
    v5 = (void *)objc_msgSend_keychainWrapperWithMACAddress_(KeychainWrapper, v4, (uint64_t)a3);
    if (v5)
      objc_msgSend_removeGenericPassword(v5, v6, v7);
  }
}

- (id)genericPasswordQuery
{
  uint64_t v2;
  id result;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;

  result = (id)objc_msgSend_accountName(self, a2, v2);
  if (result)
  {
    v7 = (void *)MEMORY[0x24BDBCE70];
    v8 = *MEMORY[0x24BDE9230];
    v9 = *MEMORY[0x24BDE9220];
    v10 = objc_msgSend_accountName(self, v5, v6);
    return (id)objc_msgSend_dictionaryWithObjectsAndKeys_(v7, v11, v8, v9, v10, *MEMORY[0x24BDE8FA8], 0, CFSTR("sync"), 0);
  }
  return result;
}

- (id)getPasswordFromQuery:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  const __CFDictionary *v14;
  BOOL v15;
  _BOOL4 v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  CFTypeRef result;
  const __CFDictionary *v34;

  result = 0;
  if (!a3)
    return 0;
  v34 = 0;
  v12 = sub_21A692FEC((const __CFAllocator *)*MEMORY[0x24BDBD240], (CFTypeRef *)&v34, (uint64_t)"{%##O%kO=%O}", v3, v4, v5, v6, v7, (uint64_t)a3);
  v13 = 0;
  v14 = v34;
  if (v12)
    v15 = 1;
  else
    v15 = v34 == 0;
  if (!v15)
  {
    if (dword_2550F4B90 <= 800)
    {
      if (dword_2550F4B90 != -1 || (v16 = sub_21A69876C((uint64_t)&dword_2550F4B90, 0x320u), v14 = v34, v16))
      {
        sub_21A698FDC((uint64_t)&dword_2550F4B90, (uint64_t)"-[KeychainWrapper getPasswordFromQuery:]", 800, (uint64_t)"SecItemCopyMatching tempDict: %@\n", v8, v9, v10, v11, (uint64_t)v14);
        v14 = v34;
      }
    }
    v23 = SecItemCopyMatching(v14, &result);
    if (v34)
    {
      CFRelease(v34);
      v34 = 0;
    }
    if (dword_2550F4B90 <= 800 && (dword_2550F4B90 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B90, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4B90, (uint64_t)"-[KeychainWrapper getPasswordFromQuery:]", 800, (uint64_t)"SecItemCopyMatching err: %#m\n", v19, v20, v21, v22, v23);
    if ((_DWORD)v23 == -25300)
    {
      v13 = 0;
    }
    else
    {
      v13 = 0;
      if (objc_msgSend_length((void *)result, v17, v18) && !(_DWORD)v23)
      {
        v24 = objc_alloc(MEMORY[0x24BDD17C8]);
        v27 = objc_msgSend_bytes((void *)result, v25, v26);
        v30 = objc_msgSend_length((void *)result, v28, v29);
        v13 = (id)objc_msgSend_initWithBytes_length_encoding_(v24, v31, v27, v30, 4);
      }
    }
  }
  if (result)
    CFRelease(result);
  return v13;
}

- (id)getGenericPassword
{
  uint64_t v2;
  id result;

  result = (id)objc_msgSend_genericPasswordQuery(self, a2, v2);
  if (result)
    return (id)MEMORY[0x24BEDD108](self, sel_getPasswordFromQuery_, result);
  return result;
}

- (id)genericPassword
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *GenericPassword;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  v4 = (void *)objc_msgSend_lock(self, a2, v2);
  objc_msgSend_lock(v4, v5, v6);
  GenericPassword = (void *)objc_msgSend_getGenericPassword(self, v7, v8);
  v12 = (void *)objc_msgSend_lock(self, v10, v11);
  objc_msgSend_unlock(v12, v13, v14);
  return GenericPassword;
}

- (int)addGenericPassword:(id)a3 withLabel:(id)a4 andDescription:(id)a5
{
  const char *v8;
  uint64_t v9;
  const __CFDictionary *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const __CFAllocator *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const __CFDictionary *v51;
  _BOOL4 v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  CFDictionaryRef query;
  CFTypeRef result;

  result = 0;
  v10 = (const __CFDictionary *)objc_msgSend_genericPasswordQuery(self, a2, (uint64_t)a3);
  if (dword_2550F4B90 <= 800 && (dword_2550F4B90 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B90, 0x320u)))
  {
    objc_msgSend_serviceName(self, v8, v9);
    objc_msgSend_accountName(self, v11, v12);
    sub_21A698FDC((uint64_t)&dword_2550F4B90, (uint64_t)"-[KeychainWrapper addGenericPassword:withLabel:andDescription:]", 800, (uint64_t)"query: %@ self.serviceName: %@ self.accountName: %@\n", v13, v14, v15, v16, (uint64_t)v10);
  }
  v17 = (void *)objc_msgSend_serviceName(self, v8, v9);
  if (!objc_msgSend_length(v17, v18, v19))
  {
    LODWORD(v26) = 0;
    goto LABEL_48;
  }
  v22 = (void *)objc_msgSend_accountName(self, v20, v21);
  LODWORD(v26) = 0;
  if (objc_msgSend_length(v22, v23, v24) && v10)
  {
    query = 0;
    v27 = objc_msgSend_dataUsingEncoding_(a3, v25, 4);
    if (!v27)
    {
      LODWORD(v26) = -6705;
      goto LABEL_48;
    }
    v30 = (void *)v27;
    if (dword_2550F4B90 <= 800 && (dword_2550F4B90 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B90, 0x320u)))
    {
      v31 = objc_msgSend_length(v30, v28, v29);
      sub_21A698FDC((uint64_t)&dword_2550F4B90, (uint64_t)"-[KeychainWrapper addGenericPassword:withLabel:andDescription:]", 800, (uint64_t)"data (length): %ld\n", v32, v33, v34, v35, v31);
    }
    v36 = (void *)objc_msgSend_lock(self, v28, v29);
    objc_msgSend_lock(v36, v37, v38);
    v39 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    LODWORD(v26) = sub_21A692FEC((const __CFAllocator *)*MEMORY[0x24BDBD240], (CFTypeRef *)&query, (uint64_t)"{%##O%kO=%O%kO=%O}", v40, v41, v42, v43, v44, (uint64_t)v10);
    if ((_DWORD)v26)
      goto LABEL_47;
    v51 = query;
    if (query)
    {
      if (dword_2550F4B90 <= 800)
      {
        if (dword_2550F4B90 != -1 || (v52 = sub_21A69876C((uint64_t)&dword_2550F4B90, 0x320u), v51 = query, v52))
        {
          sub_21A698FDC((uint64_t)&dword_2550F4B90, (uint64_t)"-[KeychainWrapper addGenericPassword:withLabel:andDescription:]", 800, (uint64_t)"SecItemCopyMatching tempDict: %@\n", v47, v48, v49, v50, (uint64_t)v51);
          v51 = query;
        }
      }
      v26 = SecItemCopyMatching(v51, &result);
      if (query)
      {
        CFRelease(query);
        query = 0;
      }
      if (dword_2550F4B90 <= 800 && (dword_2550F4B90 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B90, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4B90, (uint64_t)"-[KeychainWrapper addGenericPassword:withLabel:andDescription:]", 800, (uint64_t)"SecItemCopyMatching err: %#m\n", v55, v56, v57, v58, v26);
      if ((_DWORD)v26 == -25300)
        LODWORD(v26) = 0;
      if (result)
      {
        v59 = *MEMORY[0x24BDE9550];
        v60 = (void *)objc_msgSend_objectForKey_((void *)result, v53, *MEMORY[0x24BDE9550]);
        if (objc_msgSend_isEqual_(v60, v61, (uint64_t)v30))
        {
          v68 = (void *)objc_msgSend_objectForKey_((void *)result, v62, *MEMORY[0x24BDE90A0]);
          if ((objc_msgSend_isEqual_(v68, v69, (uint64_t)a4) & 1) != 0)
            goto LABEL_47;
        }
        LODWORD(v26) = sub_21A692FEC(v39, (CFTypeRef *)&query, (uint64_t)"{%kO=%O%kO=%O}", v63, v64, v65, v66, v67, v59);
        if ((_DWORD)v26)
          goto LABEL_47;
        v45 = (const char *)query;
        if (query)
        {
          v26 = SecItemUpdate(v10, query);
          if (dword_2550F4B90 <= 800 && (dword_2550F4B90 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B90, 0x320u)))
            sub_21A698FDC((uint64_t)&dword_2550F4B90, (uint64_t)"-[KeychainWrapper addGenericPassword:withLabel:andDescription:]", 800, (uint64_t)"SecItemUpdate err: %#m\n", v70, v71, v72, v73, v26);
LABEL_44:
          if (query)
          {
            CFRelease(query);
            query = 0;
          }
          goto LABEL_47;
        }
      }
      else
      {
        objc_msgSend_serviceName(self, v53, v54);
        LODWORD(v26) = sub_21A692FEC(v39, (CFTypeRef *)&query, (uint64_t)"{%##O%kO=%O%kO=%O%kO=%O%kO=%O}", v74, v75, v76, v77, v78, (uint64_t)v10);
        if ((_DWORD)v26)
        {
LABEL_47:
          v83 = (void *)objc_msgSend_lock(self, v45, v46);
          objc_msgSend_unlock(v83, v84, v85);
          goto LABEL_48;
        }
        if (query)
        {
          v26 = SecItemAdd(query, 0);
          if (dword_2550F4B90 <= 800 && (dword_2550F4B90 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B90, 0x320u)))
            sub_21A698FDC((uint64_t)&dword_2550F4B90, (uint64_t)"-[KeychainWrapper addGenericPassword:withLabel:andDescription:]", 800, (uint64_t)"SecItemAdd err: %#m\n", v79, v80, v81, v82, v26);
          goto LABEL_44;
        }
      }
    }
    LODWORD(v26) = -6728;
    goto LABEL_47;
  }
LABEL_48:
  if (result)
    CFRelease(result);
  return v26;
}

- (void)removeGenericPassword
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const __CFDictionary *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  OSStatus v11;
  const char *v12;
  uint64_t v13;
  OSStatus v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;

  v4 = objc_msgSend_genericPasswordQuery(self, a2, v2);
  if (v4)
  {
    if ((v7 = (const __CFDictionary *)v4,
          v8 = (void *)objc_msgSend_lock(self, v5, v6),
          objc_msgSend_lock(v8, v9, v10),
          v11 = SecItemDelete(v7),
          (v14 = v11) != 0)
      && v11 != -25300
      || (v15 = (void *)objc_msgSend_lock(self, v12, v13), objc_msgSend_unlock(v15, v16, v17), v14 != -25300) && v14)
    {
      v18 = (void *)objc_msgSend_lock(self, v12, v13);
      objc_msgSend_unlock(v18, v19, v20);
    }
  }
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
