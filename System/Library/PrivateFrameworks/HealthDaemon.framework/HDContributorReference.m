@implementation HDContributorReference

- (_QWORD)_initWithContributorType:(void *)a3 persistentID:(void *)a4 uuid:
{
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a1)
  {
    if (v7 && v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithContributorType_persistentID_uuid_, a1, CFSTR("HDContributorReference.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persistentID == nil || uuid == nil"));

    }
    v17.receiver = a1;
    v17.super_class = (Class)HDContributorReference;
    v10 = objc_msgSendSuper2(&v17, sel_init);
    a1 = v10;
    if (v10)
    {
      v10[1] = a2;
      v11 = objc_msgSend(v7, "copy");
      v12 = (void *)a1[2];
      a1[2] = v11;

      v13 = objc_msgSend(v9, "copy");
      v14 = (void *)a1[3];
      a1[3] = v13;

    }
  }

  return a1;
}

+ (id)contributorReferenceForPersistentID:(id)a3
{
  id v3;
  _QWORD *v4;

  v3 = a3;
  v4 = -[HDContributorReference _initWithContributorType:persistentID:uuid:]([HDContributorReference alloc], 1, v3, 0);

  return v4;
}

+ (id)contributorReferenceForNoContributor
{
  return -[HDContributorReference _initWithContributorType:persistentID:uuid:]([HDContributorReference alloc], 2, 0, 0);
}

+ (id)contributorReferenceForPrimaryUser
{
  return -[HDContributorReference _initWithContributorType:persistentID:uuid:]([HDContributorReference alloc], 3, 0, 0);
}

+ (id)contributorReferenceForOtherUserWithUUID:(id)a3
{
  id v3;
  _QWORD *v4;

  v3 = a3;
  v4 = -[HDContributorReference _initWithContributorType:persistentID:uuid:]([HDContributorReference alloc], 4, 0, v3);

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = self->_contributorType - 2;
  if (v5 > 2)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E6CFBBF0[v5];
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@, %@, %@>"), v4, self, v6, self->_persistentID, self->_UUID);
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = self->_contributorType ^ -[NSNumber hash](self->_persistentID, "hash");
  return v3 ^ -[NSUUID hash](self->_UUID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSNumber *persistentID;
  NSNumber *v6;
  NSUUID *UUID;
  NSUUID *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  if (self->_contributorType != v4[1])
    goto LABEL_9;
  persistentID = self->_persistentID;
  v6 = (NSNumber *)v4[2];
  if (persistentID != v6 && (!v6 || !-[NSNumber isEqual:](persistentID, "isEqual:")))
    goto LABEL_9;
  UUID = self->_UUID;
  v8 = (NSUUID *)v4[3];
  if (UUID == v8)
  {
    v9 = 1;
    goto LABEL_10;
  }
  if (v8)
    v9 = -[NSUUID isEqual:](UUID, "isEqual:");
  else
LABEL_9:
    v9 = 0;
LABEL_10:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDContributorReference)initWithCoder:(id)a3
{
  id v4;
  HDContributorReference *v5;
  uint64_t v6;
  NSNumber *persistentID;
  uint64_t v8;
  NSUUID *UUID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDContributorReference;
  v5 = -[HDContributorReference init](&v11, sel_init);
  if (v5)
  {
    v5->_contributorType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentID"));
    v6 = objc_claimAutoreleasedReturnValue();
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v8 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t contributorType;
  id v5;

  contributorType = self->_contributorType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", contributorType, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_persistentID, CFSTR("persistentID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_UUID, CFSTR("uuid"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HDContributorReference _initWithContributorType:persistentID:uuid:]((_QWORD *)+[HDContributorReference allocWithZone:](HDContributorReference, "allocWithZone:", a3), self->_contributorType, self->_persistentID, self->_UUID);
}

- (int64_t)contributorType
{
  return self->_contributorType;
}

- (NSNumber)persistentID
{
  return self->_persistentID;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end
