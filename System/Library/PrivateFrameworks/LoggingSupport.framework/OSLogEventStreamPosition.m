@implementation OSLogEventStreamPosition

- (OSLogEventStreamPosition)initWithSource:(const char *)a3 bootUUID:(const char *)a4 time:(unint64_t)a5
{
  OSLogEventStreamPosition *result;

  result = -[OSLogEventStreamPosition init](self, "init");
  if (result)
  {
    *(_OWORD *)result->_source = *(_OWORD *)a3;
    *(_OWORD *)result->_uuid = *(_OWORD *)a4;
    result->_ct = a5;
  }
  return result;
}

- (OSLogEventStreamPosition)initWithCoder:(id)a3
{
  id v4;
  OSLogEventStreamPosition *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[OSLogEventStreamPosition init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Source"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getUUIDBytes:", v5->_source);
    objc_msgSend(v7, "getUUIDBytes:", v5->_uuid);
    v5->_ct = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Time"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithUUIDBytes:", self->_source);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", self->_uuid);
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("Source"));
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("UUID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_ct, CFSTR("Time"));

}

- (const)sourceUUID
{
  return (const char *)self->_source;
}

- (const)UUID
{
  return (const char *)self->_uuid;
}

- (unint64_t)continuousTime
{
  return self->_ct;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
