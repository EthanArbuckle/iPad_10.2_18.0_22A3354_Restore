@implementation IMDeviceSupport

+ (id)sharedInstance
{
  if (qword_1ECD91008 != -1)
    dispatch_once(&qword_1ECD91008, &unk_1E2C42CA8);
  return (id)qword_1ECD90FB8;
}

- (IMDeviceSupport)init
{
  IMDeviceSupport *v2;
  NSRecursiveLock *v3;
  NSRecursiveLock *lock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDeviceSupport;
  v2 = -[IMDeviceSupport init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v2->_lock;
    v2->_lock = v3;

  }
  return v2;
}

- (NSString)model
{
  uint64_t v2;
  uint64_t v3;
  NSString *model;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFData *v15;
  id v16;
  void *v17;
  const UInt8 *BytePtr;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;

  objc_msgSend_lock(self->_lock, a2, v2, v3);
  model = self->_model;
  if (!model)
  {
    if (qword_1ECD90BF0 != -1)
      dispatch_once(&qword_1ECD90BF0, &unk_1E2C44518);
    if (qword_1ECD90C00 != -1)
      dispatch_once(&qword_1ECD90C00, &unk_1E2C44538);
    if (qword_1ECD90C10 != -1)
      dispatch_once(&qword_1ECD90C10, &unk_1E2C43888);
    if (qword_1ECD90C20 != -1)
      dispatch_once(&qword_1ECD90C20, &unk_1E2C44558);
    v10 = (uint64_t (*)(uint64_t, uint64_t))off_1ECD90BF8;
    if (qword_1ECD90C28 != -1)
      dispatch_once(&qword_1ECD90C28, &unk_1E2C445A0);
    v11 = dword_1ECD90AC0;
    v12 = off_1ECD90BE8("IOPlatformExpertDevice");
    v13 = v10(v11, v12);
    if ((_DWORD)v13)
    {
      v14 = v13;
      v15 = (const __CFData *)off_1ECD90C08(v13, CFSTR("model"), *MEMORY[0x1E0C9AE00], 0);
      off_1ECD90C18(v14);
      if (v15)
      {
        v16 = objc_alloc(MEMORY[0x1E0CB3940]);
        v17 = (void *)MEMORY[0x1E0CB3940];
        BytePtr = CFDataGetBytePtr(v15);
        objc_msgSend_stringWithCString_encoding_(v17, v19, (uint64_t)BytePtr, 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (NSString *)objc_msgSend_initWithFormat_(v16, v21, (uint64_t)CFSTR("%@"), v22, v20);

        objc_storeStrong((id *)&self->_model, v9);
        CFRelease(v15);
        goto LABEL_18;
      }
    }
    else
    {
      ((void (*)(void))off_1ECD90C18)();
    }
    v9 = 0;
    goto LABEL_18;
  }
  v9 = model;
LABEL_18:
  objc_msgSend_unlock(self->_lock, v6, v7, v8);
  return v9;
}

- (void)_generateProductInformation
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19068C638;
  block[3] = &unk_1E2C44580;
  block[4] = self;
  if (qword_1ECD90C80 != -1)
    dispatch_once(&qword_1ECD90C80, block);
}

- (NSString)userAgentString
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_productName(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_productVersion(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_productBuildVersion(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_model(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v19, (uint64_t)CFSTR("[%@,%@,%@,%@]"), v20, v6, v10, v14, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

- (NSString)productName
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_lock(self->_lock, a2, v2, v3);
  objc_msgSend__generateProductInformation(self, v5, v6, v7);
  v8 = self->_productName;
  objc_msgSend_unlock(self->_lock, v9, v10, v11);
  return v8;
}

- (NSString)productVersion
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_lock(self->_lock, a2, v2, v3);
  objc_msgSend__generateProductInformation(self, v5, v6, v7);
  v8 = self->_productVersion;
  objc_msgSend_unlock(self->_lock, v9, v10, v11);
  return v8;
}

- (NSString)productBuildVersion
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_lock(self->_lock, a2, v2, v3);
  objc_msgSend__generateProductInformation(self, v5, v6, v7);
  v8 = self->_buildVersion;
  objc_msgSend_unlock(self->_lock, v9, v10, v11);
  return v8;
}

- (NSString)deviceInformationString
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_productName(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_productVersion(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_productBuildVersion(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_model(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  IMGetEnvironmentName((uint64_t)v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v23, (uint64_t)CFSTR("[%@,%@,%@,%@,%@]"), v24, v6, v10, v14, v18, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v25;
}

+ (id)marketingNameForModel:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  __CFString **v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  __CFString *v21;

  v3 = a3;
  if (objc_msgSend_rangeOfString_(v3, v4, (uint64_t)CFSTR("iPod"), v5) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend_rangeOfString_(v3, v6, (uint64_t)CFSTR("iPad"), v7) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend_rangeOfString_(v3, v8, (uint64_t)CFSTR("iPhone"), v9) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = kIMDeviceTypeNameMac;
        if (objc_msgSend_rangeOfString_(v3, v10, (uint64_t)CFSTR("Mac"), v11) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend_rangeOfString_(v3, v12, (uint64_t)CFSTR("AppleTV"), v13) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend_rangeOfString_(v3, v15, (uint64_t)CFSTR("Watch"), v16) == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (objc_msgSend_rangeOfString_(v3, v17, (uint64_t)CFSTR("AudioAccessory"), v18) == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (objc_msgSend_rangeOfString_(v3, v19, (uint64_t)CFSTR("Reality"), v20) != 0x7FFFFFFFFFFFFFFFLL)
                  v14 = kIMDeviceTypeNameReality;
              }
              else
              {
                v14 = kIMDeviceTypeNameAudioAccessory;
              }
            }
            else
            {
              v14 = kIMDeviceTypeNameWatch;
            }
          }
          else
          {
            v14 = kIMDeviceTypeNameAppleTV;
          }
        }
      }
      else
      {
        v14 = kIMDeviceTypeNameiPhone;
      }
    }
    else
    {
      v14 = kIMDeviceTypeNameiPad;
    }
  }
  else
  {
    v14 = kIMDeviceTypeNameiPod;
  }
  v21 = *v14;

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
