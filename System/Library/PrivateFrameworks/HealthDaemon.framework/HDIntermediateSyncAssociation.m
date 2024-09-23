@implementation HDIntermediateSyncAssociation

- (HDIntermediateSyncAssociation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 0;
}

- (HDIntermediateSyncAssociation)initWithAssociationUUID:(id)a3 type:(unint64_t)a4 creationDate:(id)a5 deleted:(BOOL)a6 destinationSubObjectUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  HDIntermediateSyncAssociation *v15;
  uint64_t v16;
  NSUUID *associationUUID;
  uint64_t v18;
  NSDate *creationDate;
  uint64_t v20;
  NSUUID *destinationSubObjectUUID;
  objc_super v23;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HDIntermediateSyncAssociation;
  v15 = -[HDIntermediateSyncAssociation init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    associationUUID = v15->_associationUUID;
    v15->_associationUUID = (NSUUID *)v16;

    v15->_type = a4;
    v15->_deleted = a6;
    v18 = objc_msgSend(v13, "copy");
    creationDate = v15->_creationDate;
    v15->_creationDate = (NSDate *)v18;

    v20 = objc_msgSend(v14, "copy");
    destinationSubObjectUUID = v15->_destinationSubObjectUUID;
    v15->_destinationSubObjectUUID = (NSUUID *)v20;

  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *associationUUID;
  id v5;

  associationUUID = self->_associationUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", associationUUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("CreationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("Type"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deleted, CFSTR("Deleted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationSubObjectUUID, CFSTR("SubObjectUUID"));

}

- (HDIntermediateSyncAssociation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  HDIntermediateSyncAssociation *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Deleted"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SubObjectUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HDIntermediateSyncAssociation initWithAssociationUUID:type:creationDate:deleted:destinationSubObjectUUID:](self, "initWithAssociationUUID:type:creationDate:deleted:destinationSubObjectUUID:", v5, v7, v6, v8, v9);
  return v10;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSUUID)destinationSubObjectUUID
{
  return self->_destinationSubObjectUUID;
}

- (NSUUID)associationUUID
{
  return self->_associationUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationUUID, 0);
  objc_storeStrong((id *)&self->_destinationSubObjectUUID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
