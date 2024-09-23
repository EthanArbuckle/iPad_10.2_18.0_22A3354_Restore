@implementation EMObjectID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringHash, 0);
  objc_storeStrong((id *)&self->_representedObjectID, 0);
}

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken_2 != -1)
    dispatch_once(&cachedSelf_onceToken_2, &__block_literal_global_38);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_2);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs_2, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_2);
  return v3;
}

- (id)initAsEphemeralID:(BOOL)a3
{
  _BOOL8 v3;
  EMObjectID *v4;
  void *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMObjectID;
  v4 = -[EMObjectID init](&v7, sel_init);
  if (v4)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    -[EMObjectID _commonInitAsEphemeralID:representedObjectID:](v4, "_commonInitAsEphemeralID:representedObjectID:", v3, v5);

  }
  return v4;
}

- (void)_commonInitAsEphemeralID:(BOOL)a3 representedObjectID:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *representedObjectID;
  id v9;

  v6 = a4;
  self->_ephemeral = a3;
  if (v6)
  {
    v9 = v6;
    v7 = objc_msgSend(v6, "copyWithZone:", 0);
    representedObjectID = self->_representedObjectID;
    self->_representedObjectID = v7;

    self->_hash = -[NSObject hash](self->_representedObjectID, "hash");
    v6 = v9;
  }

}

- (EMObjectID)initWithCoder:(id)a3
{
  id v4;
  EMObjectID *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *representedObjectID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMObjectID;
  v5 = -[EMObjectID init](&v11, sel_init);
  if (v5)
  {
    v5->_ephemeral = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_ephemeral"));
    +[EMObjectID _decodableClasses](EMObjectID, "_decodableClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("kRepresentedObjectIDKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "copyWithZone:", 0);
    representedObjectID = v5->_representedObjectID;
    v5->_representedObjectID = v8;

    v5->_hash = -[NSObject hash](v5->_representedObjectID, "hash");
  }

  return v5;
}

+ (id)_decodableClasses
{
  if (_decodableClasses_onceToken != -1)
    dispatch_once(&_decodableClasses_onceToken, &__block_literal_global_5_0);
  return (id)_decodableClasses_decodableClasses;
}

- (BOOL)isEphemeral
{
  return self->_ephemeral;
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", -[EMObjectID isEphemeral](self, "isEphemeral"), CFSTR("EFPropertyKey_ephemeral"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_representedObjectID, CFSTR("kRepresentedObjectIDKey"));
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("kClassKey"));

}

- (EMObjectID)initWithRepresentedObjectID:(id)a3
{
  id v4;
  EMObjectID *v5;
  EMObjectID *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EMObjectID;
  v5 = -[EMObjectID init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[EMObjectID _commonInitAsEphemeralID:representedObjectID:](v5, "_commonInitAsEphemeralID:representedObjectID:", 0, v4);

  return v6;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (EFStringHash)stringHash
{
  os_unfair_lock_s *p_lock;
  EFStringHash *stringHash;
  void *v5;
  EFStringHash *v6;
  EFStringHash *v7;
  EFStringHash *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  stringHash = self->_stringHash;
  if (!stringHash)
  {
    -[EMObjectID representedObjectID](self, "representedObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (EFStringHash *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F088]), "initWithString:", v5);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = (EFStringHash *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F088]), "initWithData:", v5);
      else
        v6 = (EFStringHash *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F088]), "initWithHash:", -[EMObjectID hash](self, "hash"));
    }
    v7 = self->_stringHash;
    self->_stringHash = v6;

    stringHash = self->_stringHash;
  }
  v8 = stringHash;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)initAsEphemeralID:(BOOL)a3 representedObjectID:(id)a4
{
  _BOOL8 v4;
  id v6;
  EMObjectID *v7;
  EMObjectID *v8;
  objc_super v10;

  v4 = a3;
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EMObjectID;
  v7 = -[EMObjectID init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[EMObjectID _commonInitAsEphemeralID:representedObjectID:](v7, "_commonInitAsEphemeralID:representedObjectID:", v4, v6);

  return v8;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[EMObjectID representedObjectID](self, "representedObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  EMObjectID *v4;
  EMObjectID *v5;
  _BOOL4 v6;
  char v7;
  NSObject *representedObjectID;
  void *v9;

  v4 = (EMObjectID *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[EMObjectID isEphemeral](self, "isEphemeral");
      if (v6 == -[EMObjectID isEphemeral](v5, "isEphemeral"))
      {
        representedObjectID = self->_representedObjectID;
        -[EMObjectID representedObjectID](v5, "representedObjectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[NSObject isEqual:](representedObjectID, "isEqual:", v9);

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSObject)representedObjectID
{
  return self->_representedObjectID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __24__EMObjectID_cachedSelf__block_invoke()
{
  uint64_t v0;
  void *v1;

  cachedSelf_sTableLock_2 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
  v1 = (void *)cachedSelf_sUniqueObjectIDs_2;
  cachedSelf_sUniqueObjectIDs_2 = v0;

}

void __31__EMObjectID__decodableClasses__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc(MEMORY[0x1E0C99E20]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  v5 = (void *)_decodableClasses_decodableClasses;
  _decodableClasses_decodableClasses = v4;

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __17__EMObjectID_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_28 != -1)
    dispatch_once(&log_onceToken_28, block);
  return (OS_os_log *)(id)log_log_28;
}

void __17__EMObjectID_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_28;
  log_log_28 = (uint64_t)v1;

}

+ (void)addDecodableClass:(Class)a3
{
  id v4;

  objc_msgSend(a1, "_decodableClasses");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", a3);

}

+ (id)objectIDFromSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, 0);
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kClassKey"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](v6, "length"))
    a1 = NSClassFromString(v6);
  if ((objc_msgSend(a1, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCoder:", v5);
  }
  else
  {
    +[EMObjectID log](EMObjectID, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[EMObjectID objectIDFromSerializedRepresentation:].cold.1((uint64_t)v6, v8);

    v7 = 0;
  }

  return v7;
}

- (NSData)serializedRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[EMObjectID encodeWithCoder:](self, "encodeWithCoder:", v3);
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

+ (void)objectIDFromSerializedRepresentation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B99BB000, a2, OS_LOG_TYPE_ERROR, "objectIDFromSerializedRepresentation called with non ObjectID type %@", (uint8_t *)&v2, 0xCu);
}

+ (void)objectIDFromSerializedRepresentation:(uint8_t *)buf .cold.2(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1B99BB000, log, OS_LOG_TYPE_FAULT, "Exception occured: %{public}@\nSymbols:\n%{public}@", buf, 0x16u);

}

@end
