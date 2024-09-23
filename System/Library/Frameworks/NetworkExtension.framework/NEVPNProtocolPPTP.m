@implementation NEVPNProtocolPPTP

- (NEVPNProtocolPPTP)init
{
  NEVPNProtocolPPTP *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEVPNProtocolPPTP;
  result = -[NEVPNProtocolPPP initWithType:](&v3, sel_initWithType_, 3);
  if (result)
    result->_encryptionLevel = 2;
  return result;
}

- (NEVPNProtocolPPTP)initWithCoder:(id)a3
{
  id v4;
  NEVPNProtocolPPTP *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NEVPNProtocolPPTP;
  v5 = -[NEVPNProtocolPPP initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_encryptionLevel = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("EncryptionLevel"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NEVPNProtocolPPTP;
  v4 = a3;
  -[NEVPNProtocolPPP encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolPPTP encryptionLevel](self, "encryptionLevel", v5.receiver, v5.super_class), CFSTR("EncryptionLevel"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEVPNProtocolPPTP;
  v4 = -[NEVPNProtocolPPP copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setEncryptionLevel:", -[NEVPNProtocolPPTP encryptionLevel](self, "encryptionLevel"));
  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v11.receiver = self;
  v11.super_class = (Class)NEVPNProtocolPPTP;
  -[NEVPNProtocolPPP descriptionWithIndent:options:](&v11, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocolPPTP encryptionLevel](self, "encryptionLevel"), CFSTR("encryptionLevel"), v5, a4);
  return v9;
}

- (id)copyLegacyDictionary
{
  NSObject *v2;
  uint8_t v4[16];

  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_19BD16000, v2, OS_LOG_TYPE_ERROR, "PPTP is not supported", v4, 2u);
  }

  return 0;
}

- (id)initFromLegacyDictionary:(id)a3
{

  return 0;
}

- (__SCNetworkInterface)createInterface
{
  NSObject *v2;
  uint8_t v4[16];

  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_19BD16000, v2, OS_LOG_TYPE_ERROR, "Creating PPTP interface failed, protocol is no longer supported", v4, 2u);
  }

  return 0;
}

- (int64_t)encryptionLevel
{
  return self->_encryptionLevel;
}

- (void)setEncryptionLevel:(int64_t)a3
{
  self->_encryptionLevel = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
