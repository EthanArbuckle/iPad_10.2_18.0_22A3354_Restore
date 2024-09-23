@implementation NRSecureDevicePropertyID

- (NRSecureDevicePropertyID)init
{
  NRSecureDevicePropertyID *v2;
  uint64_t v3;
  NSUUID *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NRSecureDevicePropertyID;
  v2 = -[NRSecureDevicePropertyID init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

  }
  return v2;
}

- (NRSecureDevicePropertyID)initWithPropertyString:(id)a3
{
  id v4;
  NRSecureDevicePropertyID *v5;
  uint64_t v6;
  NSUUID *uuid;
  NRSecureDevicePropertyID *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRSecureDevicePropertyID;
  v5 = -[NRSecureDevicePropertyID init](&v10, sel_init);
  if (v5
    && (v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4),
        uuid = v5->_uuid,
        v5->_uuid = (NSUUID *)v6,
        uuid,
        !v5->_uuid))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (NRSecureDevicePropertyID)initWithData:(id)a3
{
  id v4;
  NRSecureDevicePropertyID *v5;
  uint64_t v6;
  NSUUID *uuid;
  NRSecureDevicePropertyID *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRSecureDevicePropertyID;
  v5 = -[NRSecureDevicePropertyID init](&v10, sel_init);
  if (v5
    && (objc_msgSend(v4, "toUUID"),
        v6 = objc_claimAutoreleasedReturnValue(),
        uuid = v5->_uuid,
        v5->_uuid = (NSUUID *)v6,
        uuid,
        !v5->_uuid))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)data
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "fromUUID:", self->_uuid);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRSecureDevicePropertyID)initWithCoder:(id)a3
{
  id v4;
  NRSecureDevicePropertyID *v5;
  uint64_t v6;
  NSUUID *uuid;

  v4 = a3;
  v5 = -[NRSecureDevicePropertyID init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:name:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectIsNotNil:name:owner:", v5->_uuid, CFSTR("secure property UUID"), v5);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_uuid, CFSTR("UUID"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSUUID copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uuid, "hash");
}

- (id)description
{
  void *v2;
  void *v3;

  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Secure property ID: "), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  NRSecureDevicePropertyID *v4;
  NSUUID *uuid;
  char v6;

  v4 = (NRSecureDevicePropertyID *)a3;
  if (v4 == self)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  uuid = self->_uuid;
  if (uuid == v4->_uuid)
LABEL_5:
    v6 = 1;
  else
    v6 = -[NSUUID isEqual:](uuid, "isEqual:");
LABEL_7:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
