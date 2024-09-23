@implementation MRApplicationActivity

- (MRApplicationActivity)initWithPrimaryAppDisplayID:(id)a3 secondaryAppDisplayID:(id)a4
{
  id v6;
  id v7;
  MRApplicationActivity *v8;
  NSUUID *v9;
  NSUUID *uniqueIdentifier;
  uint64_t v11;
  NSString *primaryApplicationDisplayID;
  uint64_t v13;
  NSString *secondaryApplicationDisplayID;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MRApplicationActivity;
  v8 = -[MRApplicationActivity init](&v16, sel_init);
  if (v8)
  {
    v9 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = v9;

    v11 = objc_msgSend(v6, "copy");
    primaryApplicationDisplayID = v8->_primaryApplicationDisplayID;
    v8->_primaryApplicationDisplayID = (NSString *)v11;

    v13 = objc_msgSend(v7, "copy");
    secondaryApplicationDisplayID = v8->_secondaryApplicationDisplayID;
    v8->_secondaryApplicationDisplayID = (NSString *)v13;

    v8->_status = 0;
    v8->_creatorProcessID = getpid();
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", self->_uniqueIdentifier);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  unsigned int v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = self->_status - 1;
  if (v3 > 3)
    v4 = CFSTR("Unknown");
  else
    v4 = off_1E30D0500[v3];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[NSUUID UUIDString](self->_uniqueIdentifier, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p id=%@, primary=%@, secondary=%@, status=%@, creatorPID=%d>"), v6, self, v7, self->_primaryApplicationDisplayID, self->_secondaryApplicationDisplayID, v4, self->_creatorProcessID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    objc_msgSend(v4, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_primaryApplicationDisplayID, CFSTR("primaryApplicationDisplayID"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_secondaryApplicationDisplayID, CFSTR("secondaryApplicationDisplayID"));
    objc_msgSend(v4, "encodeInt32:forKey:", self->_status, CFSTR("status"));
    objc_msgSend(v4, "encodeInt:forKey:", self->_creatorProcessID, CFSTR("creatorProcessID"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("coder must support key-value coding"));
  }

}

- (MRApplicationActivity)initWithCoder:(id)a3
{
  id v4;
  MRApplicationActivity *v5;
  void *v6;
  uint64_t v7;
  NSUUID *uniqueIdentifier;
  void *v9;
  uint64_t v10;
  NSString *primaryApplicationDisplayID;
  void *v12;
  uint64_t v13;
  NSString *secondaryApplicationDisplayID;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRApplicationActivity;
  v5 = -[MRApplicationActivity init](&v16, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "allowsKeyedCoding"))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      uniqueIdentifier = v5->_uniqueIdentifier;
      v5->_uniqueIdentifier = (NSUUID *)v7;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryApplicationDisplayID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      primaryApplicationDisplayID = v5->_primaryApplicationDisplayID;
      v5->_primaryApplicationDisplayID = (NSString *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryApplicationDisplayID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      secondaryApplicationDisplayID = v5->_secondaryApplicationDisplayID;
      v5->_secondaryApplicationDisplayID = (NSString *)v13;

      v5->_status = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("status"));
      v5->_creatorProcessID = objc_msgSend(v4, "decodeIntForKey:", CFSTR("creatorProcessID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("coder must support key-value coding"));
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_class *v4;
  int v5;

  v4 = (objc_class *)objc_opt_class();
  return (id)-[MRApplicationActivity _copyWithZone:usingConcreteClass:]((uint64_t)self, v5, v4);
}

- (uint64_t)_copyWithZone:(Class)a3 usingConcreteClass:
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!a1)
    return 0;
  v4 = objc_msgSend([a3 alloc], "initWithPrimaryAppDisplayID:secondaryAppDisplayID:", *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  v5 = objc_msgSend(*(id *)(a1 + 8), "copy");
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;

  *(_DWORD *)(v4 + 36) = *(_DWORD *)(a1 + 36);
  *(_DWORD *)(v4 + 32) = *(_DWORD *)(a1 + 32);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_class *v4;
  int v5;

  v4 = (objc_class *)objc_opt_class();
  return (id)-[MRApplicationActivity _copyWithZone:usingConcreteClass:]((uint64_t)self, v5, v4);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)primaryApplicationDisplayID
{
  return self->_primaryApplicationDisplayID;
}

- (NSString)secondaryApplicationDisplayID
{
  return self->_secondaryApplicationDisplayID;
}

- (int)status
{
  return self->_status;
}

- (int)creatorProcessID
{
  return self->_creatorProcessID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryApplicationDisplayID, 0);
  objc_storeStrong((id *)&self->_primaryApplicationDisplayID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
