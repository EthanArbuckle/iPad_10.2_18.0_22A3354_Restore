@implementation DYMTLCaptureScopeInfo

- (DYMTLCaptureScopeInfo)initWithCaptureScope:(id)a3
{
  id v4;
  DYMTLCaptureScopeInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *label;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DYMTLCaptureScopeInfo;
  v5 = -[DYMTLCaptureScopeInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceAddress = (unint64_t)v6;

    v5->_scopeAddress = (unint64_t)v4;
    objc_msgSend(v4, "label");
    v7 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v7;

    v5->_isDefaultCapturable = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYMTLCaptureScopeInfo)initWithCoder:(id)a3
{
  id v4;
  DYMTLCaptureScopeInfo *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DYMTLCaptureScopeInfo;
  v5 = -[DYMTLCaptureScopeInfo init](&v9, sel_init);
  if (v5)
  {
    v5->_deviceAddress = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceAddress"));
    v5->_scopeAddress = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("scopeAddress"));
    v5->_scopeStreamRef = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("scopeStreamRef"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_isDefaultCapturable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDefaultCapturable"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t deviceAddress;
  id v5;

  deviceAddress = self->_deviceAddress;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", deviceAddress, CFSTR("deviceAddress"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_scopeAddress, CFSTR("scopeAddress"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_scopeStreamRef, CFSTR("scopeStreamRef"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDefaultCapturable, CFSTR("isDefaultCapturable"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = objc_opt_new();
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 24) = self->_deviceAddress;
    *(_QWORD *)(v4 + 32) = self->_scopeAddress;
    v6 = -[NSString copy](self->_label, "copy");
    v7 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v6;

    *(_BYTE *)(v5 + 8) = self->_isDefaultCapturable;
    v8 = (id)v5;
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v5 == objc_opt_class() && self->_scopeAddress == v4[4];

  return v6;
}

- (NSString)displayName
{
  NSString *label;
  NSString *v4;
  NSString *displayName;

  if (!self->_displayName)
  {
    label = self->_label;
    if (label)
    {
      v4 = label;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Capture Scope 0x%llx"), self->_scopeAddress);
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    displayName = self->_displayName;
    self->_displayName = v4;

  }
  return self->_displayName;
}

+ (id)capturableObjectType
{
  return (id)*MEMORY[0x24BE39288];
}

- (NSString)capturableObjectType
{
  return (NSString *)(id)*MEMORY[0x24BE39288];
}

- (unint64_t)streamRef
{
  return self->_scopeStreamRef;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p %@>"), objc_opt_class(), self, self->_label);
}

- (BOOL)isDefaultCapturable
{
  return self->_isDefaultCapturable;
}

- (unint64_t)deviceAddress
{
  return self->_deviceAddress;
}

- (unint64_t)scopeAddress
{
  return self->_scopeAddress;
}

- (unint64_t)scopeStreamRef
{
  return self->_scopeStreamRef;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
