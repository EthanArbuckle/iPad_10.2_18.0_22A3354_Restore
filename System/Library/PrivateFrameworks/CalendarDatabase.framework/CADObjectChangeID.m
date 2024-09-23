@implementation CADObjectChangeID

- (CADObjectChangeID)initWithEntityType:(int)a3 changeID:(int64_t)a4
{
  CADObjectChangeID *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CADObjectChangeID;
  result = -[CADObjectChangeID init](&v7, sel_init);
  if (result)
  {
    result->_entityType = a3;
    result->_changeID = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t entityType;
  id v5;

  entityType = self->_entityType;
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", entityType, CFSTR("entityType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changeID, CFSTR("changeID"));

}

- (CADObjectChangeID)initWithCoder:(id)a3
{
  id v4;
  CADObjectChangeID *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CADObjectChangeID;
  v5 = -[CADObjectChangeID init](&v7, sel_init);
  if (v5)
  {
    v5->_entityType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("entityType"));
    v5->_changeID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("changeID"));
  }

  return v5;
}

- (int)entityType
{
  return self->_entityType;
}

- (int64_t)changeID
{
  return self->_changeID;
}

@end
