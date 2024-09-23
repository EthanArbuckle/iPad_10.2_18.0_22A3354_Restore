@implementation NEIKEv2EncryptedFragmentPayload

- (unint64_t)type
{
  return 53;
}

- (BOOL)hasRequiredFields
{
  NEIKEv2EncryptedFragmentPayload *v2;

  v2 = self;
  if (self)
  {
    self = (NEIKEv2EncryptedFragmentPayload *)objc_getProperty(self, a2, 16, 1);
    LOBYTE(v2) = self && v2->_fragmentNumber && v2->_totalFragments != 0;
  }

  return (char)v2;
}

- (BOOL)parsePayloadData
{
  const char *v3;
  const char *v4;
  NSObject *v5;
  BOOL v6;
  id v7;
  void *v8;
  SEL v9;
  void *v10;
  SEL v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
    if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") > 3)
    {
      v13 = 0;
      v7 = objc_getProperty(self, v4, 16, 1);
      objc_msgSend(v7, "subdataWithRange:", 0, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "getBytes:length:", &v13, 4);
      objc_setProperty_atomic(self, v9, v8, 24);
      objc_msgSend(v7, "subdataWithRange:", 4, objc_msgSend(v7, "length") - 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_setProperty_atomic(self, v11, v10, 16);
      self->_fragmentNumber = bswap32((unsigned __int16)v13) >> 16;
      self->_totalFragments = bswap32(HIWORD(v13)) >> 16;
      v6 = -[NEIKEv2EncryptedFragmentPayload hasRequiredFields](self, "hasRequiredFields");

      return v6;
    }
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[NEIKEv2EncryptedFragmentPayload parsePayloadData]";
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "BACKTRACE %s called with null (self.payloadData.length >= sizeof(ikev2_fragment_hdr_t))", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v13 = 136315138;
      v14 = "-[NEIKEv2EncryptedFragmentPayload parsePayloadData]";
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, "%s called with null self.payloadData", (uint8_t *)&v13, 0xCu);
    }
  }

  return 0;
}

+ (id)copyTypeDescription
{
  return CFSTR("Encrypted Fragment");
}

@end
