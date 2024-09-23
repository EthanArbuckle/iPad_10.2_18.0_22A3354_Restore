@implementation NEIKEv2NULLIdentifier

- (NEIKEv2NULLIdentifier)init
{
  NEIKEv2NULLIdentifier *v2;
  id v3;
  NEIKEv2NULLIdentifier *v4;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2NULLIdentifier;
  v2 = -[NEIKEv2NULLIdentifier init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D50]);
    -[NEIKEv2Identifier setIdentifierData:](v2, "setIdentifierData:", v3);

    v4 = v2;
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }

  }
  return v2;
}

- (unint64_t)identifierType
{
  return 13;
}

+ (id)copyTypeDescription
{
  return CFSTR("NULL");
}

@end
