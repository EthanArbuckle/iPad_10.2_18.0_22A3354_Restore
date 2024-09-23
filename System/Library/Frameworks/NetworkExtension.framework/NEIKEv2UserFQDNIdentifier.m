@implementation NEIKEv2UserFQDNIdentifier

- (NEIKEv2UserFQDNIdentifier)initWithUserFQDN:(id)a3
{
  id v4;
  NEIKEv2UserFQDNIdentifier *v5;
  NEIKEv2UserFQDNIdentifier *v6;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[NEIKEv2UserFQDNIdentifier initWithUserFQDN:]";
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "%s called with null userFQDN", buf, 0xCu);
    }

    goto LABEL_10;
  }
  v9.receiver = self;
  v9.super_class = (Class)NEIKEv2UserFQDNIdentifier;
  v5 = -[NEIKEv2UserFQDNIdentifier init](&v9, sel_init);
  if (!v5)
  {
    ne_log_obj();
    self = (NEIKEv2UserFQDNIdentifier *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super.super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, &self->super.super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
LABEL_10:
    v6 = 0;
    goto LABEL_4;
  }
  v6 = v5;
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  self = (NEIKEv2UserFQDNIdentifier *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2Identifier setIdentifierData:](v6, "setIdentifierData:", self);
LABEL_4:

  return v6;
}

- (unint64_t)identifierType
{
  return 3;
}

+ (id)copyTypeDescription
{
  return CFSTR("UserFQDN");
}

@end
