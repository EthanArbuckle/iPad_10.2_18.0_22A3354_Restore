@implementation SGRecordId

- (SGRecordId)initWithInternalEntityId:(int64_t)a3
{
  SGRecordId *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGRecordId;
  result = -[SGRecordId init](&v5, sel_init);
  if (result)
    result->_internalEntityId = a3;
  return result;
}

- (SGRecordId)initWithCoder:(id)a3
{
  id v4;
  SGRecordId *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SGRecordId;
  v5 = -[SGRecordId init](&v7, sel_init);
  if (v5)
    v5->_internalEntityId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("internalEntityId"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_internalEntityId, CFSTR("internalEntityId"));
}

- (int64_t)internalEntityId
{
  return self->_internalEntityId;
}

- (int64_t)numericValue
{
  return self->_internalEntityId;
}

- (unint64_t)hash
{
  return self->_internalEntityId ^ (self->_internalEntityId >> 32);
}

- (BOOL)isEqual:(id)a3
{
  SGRecordId *v4;
  SGRecordId *v5;
  BOOL v6;

  v4 = (SGRecordId *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGRecordId isEqualToRecordId:](self, "isEqualToRecordId:", v5);

  return v6;
}

- (BOOL)isEqualToRecordId:(id)a3
{
  return a3 && *((_QWORD *)a3 + 1) == self->_internalEntityId;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGRecordId %llu>"), self->_internalEntityId);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SGRecordId)recordIdWithInternalEntityId:(int64_t)a3
{
  return -[SGRecordId initWithInternalEntityId:]([SGRecordId alloc], "initWithInternalEntityId:", a3);
}

+ (SGRecordId)recordIdWithNumericValue:(int64_t)a3
{
  return -[SGRecordId initWithInternalEntityId:]([SGRecordId alloc], "initWithInternalEntityId:", a3);
}

@end
