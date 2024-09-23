@implementation HDNotificationInstructionUUIDCriteria

- (HDNotificationInstructionUUIDCriteria)initWithUUID:(id)a3
{
  id v4;
  HDNotificationInstructionUUIDCriteria *v5;
  uint64_t v6;
  NSUUID *UUID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDNotificationInstructionUUIDCriteria;
  v5 = -[HDNotificationInstructionUUIDCriteria init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

  }
  return v5;
}

- (id)_initWithUUID:(id)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    a1 = (id)objc_msgSend(a1, "initWithUUID:", v3);
    v5 = a1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_initWithUUIDString:(id)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
    a1 = -[HDNotificationInstructionUUIDCriteria _initWithUUID:](a1, v5);

    v6 = a1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSUUID *UUID;
  NSUUID *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDNotificationInstructionUUIDCriteria;
  if (!-[HDNotificationInstructionCriteria isEqual:](&v9, sel_isEqual_, v4))
    goto LABEL_5;
  UUID = self->_UUID;
  v6 = (NSUUID *)v4[1];
  if (UUID == v6)
  {
    v7 = 1;
    goto LABEL_7;
  }
  if (v6)
    v7 = -[NSUUID isEqual:](UUID, "isEqual:");
  else
LABEL_5:
    v7 = 0;
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_UUID, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %@>"), objc_opt_class(), self->_UUID);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDNotificationInstructionUUIDCriteria)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HDNotificationInstructionUUIDCriteria *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (HDNotificationInstructionUUIDCriteria *)-[HDNotificationInstructionUUIDCriteria _initWithUUID:](self, v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_UUID, CFSTR("UUID"));
}

- (HDNotificationInstructionUUIDCriteria)initWithMessageDictionary:(id)a3
{
  void *v4;
  HDNotificationInstructionUUIDCriteria *v5;

  objc_msgSend(a3, "hk_safeStringForKeyPath:error:", CFSTR("UUID"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (HDNotificationInstructionUUIDCriteria *)-[HDNotificationInstructionUUIDCriteria _initWithUUIDString:](self, v4);

  return v5;
}

- (id)messageDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("UUID");
  -[NSUUID UUIDString](self->_UUID, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HDNotificationInstructionUUIDCriteria)initWithCodableNotificationInstructionCriteria:(id)a3
{
  id v4;
  void *v5;
  HDNotificationInstructionUUIDCriteria *v6;

  v4 = a3;
  if (objc_msgSend(v4, "hasUUIDString"))
  {
    objc_msgSend(v4, "uUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (HDNotificationInstructionUUIDCriteria *)-[HDNotificationInstructionUUIDCriteria _initWithUUIDString:](self, v5);

  return v6;
}

- (id)codableCriteria
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDNotificationInstructionUUIDCriteria;
  -[HDNotificationInstructionCriteria codableCriteria](&v6, sel_codableCriteria);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_UUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUUIDString:", v4);

  return v3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
