@implementation DYMTLResourceUsageItem

- (DYMTLResourceUsageItem)initWithCoder:(id)a3
{
  id v4;
  DYMTLResourceUsageItem *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DYMTLResourceUsageItem;
  v5 = -[DYMTLResourceUsageItem init](&v7, "init");
  if (v5)
  {
    v5->_kind = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("kind"));
    v5->_stage = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("stage"));
    v5->_resourceID = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("resourceID"));
    v5->_usage = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("usage"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_stage, CFSTR("stage"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_resourceID, CFSTR("resourceID"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_usage, CFSTR("usage"));

}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (unsigned)usage
{
  return self->_usage;
}

- (void)setUsage:(unsigned __int8)a3
{
  self->_usage = a3;
}

- (unsigned)stage
{
  return self->_stage;
}

- (void)setStage:(unsigned __int8)a3
{
  self->_stage = a3;
}

- (unint64_t)resourceID
{
  return self->_resourceID;
}

- (void)setResourceID:(unint64_t)a3
{
  self->_resourceID = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
