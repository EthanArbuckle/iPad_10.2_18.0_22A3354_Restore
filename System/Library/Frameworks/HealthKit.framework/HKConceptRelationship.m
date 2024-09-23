@implementation HKConceptRelationship

- (HKConceptRelationship)initWithType:(int64_t)a3 destination:(id)a4
{
  return -[HKConceptRelationship initWithType:destination:version:deleted:](self, "initWithType:destination:version:deleted:", a3, a4, 0, 0);
}

- (HKConceptRelationship)initWithType:(int64_t)a3 destination:(id)a4 version:(int64_t)a5 deleted:(BOOL)a6
{
  return -[HKConceptRelationship initWithType:destination:weakDestination:version:deleted:](self, "initWithType:destination:weakDestination:version:deleted:", a3, a4, 0, a5, a6);
}

- (HKConceptRelationship)initWithType:(int64_t)a3 weakDestination:(id)a4 version:(int64_t)a5 deleted:(BOOL)a6
{
  return -[HKConceptRelationship initWithType:destination:weakDestination:version:deleted:](self, "initWithType:destination:weakDestination:version:deleted:", a3, 0, a4, a5, a6);
}

- (HKConceptRelationship)initWithType:(int64_t)a3 destination:(id)a4 weakDestination:(id)a5 version:(int64_t)a6 deleted:(BOOL)a7
{
  unint64_t v13;
  unint64_t v14;
  void *v15;
  HKConceptRelationship *v16;
  HKConceptRelationship *v17;
  uint64_t v18;
  HKConcept *destination;
  void *v21;
  objc_super v22;

  v13 = (unint64_t)a4;
  v14 = (unint64_t)a5;
  v15 = (void *)v14;
  if (!(v13 | v14))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKConceptRelationship.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destination != nil || weakDestination != nil"));
LABEL_13:

    goto LABEL_4;
  }
  if (v13 && v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKConceptRelationship.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destination == nil || weakDestination == nil"));
    goto LABEL_13;
  }
LABEL_4:
  v22.receiver = self;
  v22.super_class = (Class)HKConceptRelationship;
  v16 = -[HKConceptRelationship init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    if (v13)
    {
      v18 = objc_msgSend((id)v13, "copy");
      destination = v17->_destination;
      v17->_destination = (HKConcept *)v18;

    }
    else if (v15)
    {
      objc_storeWeak((id *)&v16->_weakDestination, v15);
    }
    v17->_version = a6;
    v17->_deleted = a7;
  }

  return v17;
}

- (HKConcept)destination
{
  HKConcept *destination;

  destination = self->_destination;
  if (destination)
    return destination;
  else
    return (HKConcept *)objc_loadWeakRetained((id *)&self->_weakDestination);
}

- (HKConceptRelationship)init
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

- (BOOL)isEqual:(id)a3
{
  HKConceptRelationship *v4;
  HKConceptRelationship *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = (HKConceptRelationship *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_type == v5->_type)
      {
        -[HKConceptRelationship destination](self, "destination");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKConceptRelationship destination](v5, "destination");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 == v7)
        {
          v11 = self->_version == v5->_version && self->_deleted == v5->_deleted;
        }
        else
        {
          -[HKConceptRelationship destination](v5, "destination");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            -[HKConceptRelationship destination](self, "destination");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKConceptRelationship destination](v5, "destination");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v9, "isEqual:", v10)
               && self->_version == v5->_version
               && self->_deleted == v5->_deleted;

          }
          else
          {
            v11 = 0;
          }

        }
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  int64_t type;
  void *v4;
  unint64_t v5;

  type = self->_type;
  -[HKConceptRelationship destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ type ^ self->_version ^ self->_deleted;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKConcept *destination;
  id WeakRetained;
  id v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", self->_type, CFSTR("Type"));
  destination = self->_destination;
  if (destination)
  {
    objc_msgSend(v7, "encodeObject:forKey:", destination, CFSTR("Destination"));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_weakDestination);

    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)&self->_weakDestination);
      objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("WeakDestination"));

    }
  }
  objc_msgSend(v7, "encodeInt64:forKey:", self->_version, CFSTR("Version"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_deleted, CFSTR("Deleted"));

}

- (HKConceptRelationship)initWithCoder:(id)a3
{
  id v4;
  HKConceptRelationship *v5;
  uint64_t v6;
  HKConcept *destination;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKConceptRelationship;
  v5 = -[HKConceptRelationship init](&v10, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Destination"));
    v6 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (HKConcept *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WeakDestination"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_weakDestination, v8);

    v5->_version = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Version"));
    v5->_deleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Deleted"));
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  int64_t type;
  id WeakRetained;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t version;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  type = self->_type;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakDestination);
  if (WeakRetained)
    v6 = CFSTR("Weak ");
  else
    v6 = &stru_1E37FD4C0;
  -[HKConceptRelationship destination](self, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rawIdentifier");
  version = self->_version;
  HKStringFromBool(self->_deleted);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Concept Relationship: Type: %lld, %@Destination ID: %lld, Version: %lld, Deleted: %@"), type, v6, v9, version, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_destroyWeak((id *)&self->_weakDestination);
}

@end
