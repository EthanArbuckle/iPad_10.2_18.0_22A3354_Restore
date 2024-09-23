@implementation HDAssociatableObjectReference

- (HDAssociatableObjectReference)initWithUUID:(id)a3 objectClass:(Class)a4
{
  id v6;
  HDAssociatableObjectReference *v7;
  uint64_t v8;
  NSUUID *UUID;
  void *v10;
  objc_class *objectClass;
  NSObject *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDAssociatableObjectReference;
  v7 = -[HDAssociatableObjectReference init](&v15, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    UUID = v7->_UUID;
    v7->_UUID = (NSUUID *)v8;

    objc_storeStrong((id *)&v7->_objectClass, a4);
    if ((-[objc_class isEqual:](v7->_objectClass, "isEqual:", objc_opt_class()) & 1) == 0)
    {
      _HKInitializeLogging();
      v10 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        objectClass = v7->_objectClass;
        v13 = v10;
        NSStringFromClass(objectClass);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v14;
        _os_log_fault_impl(&dword_1B7802000, v13, OS_LOG_TYPE_FAULT, "Attempting to create associatable object for invalid class %{public}@", buf, 0xCu);

      }
    }
  }

  return v7;
}

- (id)persistentIDInTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (-[objc_class isEqual:](self->_objectClass, "isEqual:", objc_opt_class())
    && (+[HDWorkoutActivityEntity activityEntityWithUUID:transaction:error:](HDWorkoutActivityEntity, "activityEntityWithUUID:transaction:error:", self->_UUID, v6, a4), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSUUID *v5;
  NSUUID *UUID;
  Class v7;
  Class objectClass;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  v5 = (NSUUID *)v4[1];
  UUID = self->_UUID;
  if (v5 != UUID && (!UUID || !-[NSUUID isEqual:](v5, "isEqual:")))
    goto LABEL_8;
  v7 = (Class)v4[2];
  objectClass = self->_objectClass;
  if (v7 == objectClass)
  {
    v9 = 1;
    goto LABEL_9;
  }
  if (objectClass)
    v9 = -[objc_class isEqual:](v7, "isEqual:");
  else
LABEL_8:
    v9 = 0;
LABEL_9:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDAssociatableObjectReference)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  uint64_t v7;
  HDAssociatableObjectReference *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("class"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  v7 = (uint64_t)NSClassFromString(v6);
  if (!v7)
    v7 = objc_opt_class();
  v8 = -[HDAssociatableObjectReference initWithUUID:objectClass:](self, "initWithUUID:objectClass:", v5, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;
  id v6;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  NSStringFromClass(self->_objectClass);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("class"));

}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectClass, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
