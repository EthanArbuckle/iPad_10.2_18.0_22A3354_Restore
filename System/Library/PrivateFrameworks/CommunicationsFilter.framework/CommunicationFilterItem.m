@implementation CommunicationFilterItem

- (CommunicationFilterItem)initWithEmailAddress:(id)a3
{
  CommunicationFilterItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CommunicationFilterItem;
  v4 = -[CommunicationFilterItem init](&v6, sel_init);
  if (v4)
    v4->_emailAddress = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (CommunicationFilterItem)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  CommunicationFilterItem *v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("__kCMFItemTypeKey"));
  v6 = objc_msgSend(a3, "objectForKey:", CFSTR("__kCMFItemVersionKey"));
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("__kCMFItemPhoneNumberUnformattedKey"));
  objc_msgSend(a3, "objectForKey:", CFSTR("__kCMFItemPhoneNumberCountryCodeKey"));
  v8 = objc_msgSend(a3, "objectForKey:", CFSTR("__kCMFItemEmailUnformattedKey"));
  if (!-[CommunicationFilterItem _acceptItemType:](self, "_acceptItemType:", v5)
    || !-[CommunicationFilterItem _acceptVersion:](self, "_acceptVersion:", v6))
  {
    v11 = CMFDefaultLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      return 0;
LABEL_7:
    v13 = 138412290;
    v14 = objc_msgSend(a3, "allKeys");
    _os_log_impl(&dword_20849D000, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Couldn't create CMFItem from dictionary %@", (uint8_t *)&v13, 0xCu);
    return 0;
  }
  if (v7)
  {
    v9 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();
    v10 = -[CommunicationFilterItem initWithPhoneNumber:](self, "initWithPhoneNumber:", v9);
    if (v9)
      CFRelease(v9);
    return v10;
  }
  if (!v8)
  {
    v11 = CMFDefaultLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      return 0;
    goto LABEL_7;
  }
  return -[CommunicationFilterItem initWithEmailAddress:](self, "initWithEmailAddress:", v8);
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *emailAddress;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (!self->_emailAddress && !self->_phoneNumber)
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (-[CommunicationFilterItem isPhoneNumber](self, "isPhoneNumber"))
  {
    v4 = IMUnformattedPhoneNumberForCFPhoneNumberRef();
    if (v4)
    {
      v5 = v4;
      v6 = IMCountryCodeCFPhoneNumberRef();
      v7 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
      objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("__kCMFItemPhoneNumberUnformattedKey"));
      if (v6)
        objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("__kCMFItemPhoneNumberCountryCodeKey"));
      goto LABEL_9;
    }
    v9 = CMFDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CommunicationFilterItem dictionaryRepresentation].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    return 0;
  }
  emailAddress = self->_emailAddress;
  if (!emailAddress)
  {
    v17 = CMFDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CommunicationFilterItem dictionaryRepresentation].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
    return 0;
  }
  objc_msgSend(v3, "setObject:forKey:", emailAddress, CFSTR("__kCMFItemEmailUnformattedKey"));
  v7 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1);
LABEL_9:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1), CFSTR("__kCMFItemVersionKey"));
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("__kCMFItemTypeKey"));
  return v3;
}

- (BOOL)isPhoneNumber
{
  return self->_phoneNumber != 0;
}

- (BOOL)_acceptVersion:(id)a3
{
  return (int)objc_msgSend(a3, "intValue") < 2;
}

- (BOOL)_acceptItemType:(id)a3
{
  return a3 && (objc_msgSend(a3, "unsignedIntegerValue") & 0xFFFFFFFELL) == 0;
}

- (void)dealloc
{
  __CFPhoneNumber *phoneNumber;
  objc_super v4;

  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
  {
    CFRelease(phoneNumber);
    self->_phoneNumber = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)CommunicationFilterItem;
  -[CommunicationFilterItem dealloc](&v4, sel_dealloc);
}

- (CommunicationFilterItem)initWithPhoneNumber:(__CFPhoneNumber *)a3
{
  CommunicationFilterItem *v4;
  CommunicationFilterItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CommunicationFilterItem;
  v4 = -[CommunicationFilterItem init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_phoneNumber = a3;
    if (a3)
      CFRetain(a3);
  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(-[CommunicationFilterItem _dictionaryRepresentationWithRedaction](self, "_dictionaryRepresentationWithRedaction"), "description");
}

- (NSString)unformattedID
{
  NSString *emailAddress;

  emailAddress = self->_emailAddress;
  if (emailAddress)
    return emailAddress;
  else
    return (NSString *)IMUnformattedPhoneNumberForCFPhoneNumberRef();
}

- (BOOL)matchesFilterItem:(id)a3
{
  void *v5;
  NSString *emailAddress;
  BOOL v7;
  const void *v8;

  v5 = (void *)MEMORY[0x20BD09AC4](self, a2);
  emailAddress = self->_emailAddress;
  if (emailAddress)
    v7 = -[NSString caseInsensitiveCompare:](emailAddress, "caseInsensitiveCompare:", objc_msgSend(a3, "emailAddress")) == NSOrderedSame;
  else
    v7 = self->_phoneNumber
      && (v8 = (const void *)objc_msgSend(a3, "phoneNumber")) != 0
      && CFEqual(v8, self->_phoneNumber) != 0;
  objc_autoreleasePoolPop(v5);
  return v7;
}

- (id)_dictionaryRepresentationWithRedaction
{
  id v3;
  void *v4;
  const __CFString *v5;

  v3 = -[CommunicationFilterItem dictionaryRepresentation](self, "dictionaryRepresentation");
  if (!v3)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v3);
  if (-[CommunicationFilterItem isPhoneNumber](self, "isPhoneNumber"))
    v5 = CFSTR("__kCMFItemPhoneNumberUnformattedKey");
  else
    v5 = CFSTR("__kCMFItemEmailUnformattedKey");
  objc_msgSend(v4, "setObject:forKey:", CFSTR("redacted"), v5);
  return v4;
}

- (__CFPhoneNumber)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)dictionaryRepresentation
{
  OUTLINED_FUNCTION_0(&dword_20849D000, a1, a3, "Dictionary representation for item failed: Couldn't find email address", a5, a6, a7, a8, 0);
}

@end
