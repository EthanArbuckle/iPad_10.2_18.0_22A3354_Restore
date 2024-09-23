@implementation HDConcreteSyncIdentity

- (id)initWithIdentity:(void *)a3 entity:(char)a4 isChild:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)HDConcreteSyncIdentity;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      v9 = objc_msgSend(v7, "copy");
      v10 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v9;

      v11 = objc_msgSend(v8, "copy");
      v12 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v11;

      *((_BYTE *)a1 + 8) = a4;
    }
  }

  return a1;
}

- (HDConcreteSyncIdentity)init
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

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[HDSyncIdentity isEqual:](self->_identity, "isEqual:", v4[2])
    && -[HDSQLiteEntity isEqual:](self->_entity, "isEqual:", v4[3]);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HDSyncIdentity hash](self->_identity, "hash");
  return -[HDSQLiteEntity hash](self->_entity, "hash") ^ v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ [%lld] %@>"), v5, -[HDSQLiteEntity persistentID](self->_entity, "persistentID"), self->_identity);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HDSyncIdentity)identity
{
  return self->_identity;
}

- (HDSyncIdentityEntity)entity
{
  return self->_entity;
}

- (BOOL)isChild
{
  return self->_isChild;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
