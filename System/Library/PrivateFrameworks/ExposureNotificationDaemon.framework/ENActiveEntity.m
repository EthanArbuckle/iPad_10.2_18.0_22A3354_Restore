@implementation ENActiveEntity

- (ENActiveEntity)initWithEntity:(id)a3 activeStatus:(int)a4
{
  id v6;
  ENActiveEntity *v7;
  uint64_t v8;
  ENEntity *entity;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ENActiveEntity;
  v7 = -[ENActiveEntity init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    entity = v7->_entity;
    v7->_entity = (ENEntity *)v8;

    v7->_activeStatus = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENActiveEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  ENActiveEntity *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("status"));

  v7 = -[ENActiveEntity initWithEntity:activeStatus:](self, "initWithEntity:activeStatus:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  ENEntity *entity;
  id v5;

  entity = self->_entity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", entity, CFSTR("entity"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_activeStatus, CFSTR("status"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[ENEntity isEqual:](self->_entity, "isEqual:", *((_QWORD *)v5 + 2)))
      v6 = self->_activeStatus == v5[2];
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[ENEntity hash](self->_entity, "hash");
}

- (id)description
{
  uint64_t activeStatus;
  const char *v3;

  activeStatus = self->_activeStatus;
  if (activeStatus > 3)
    v3 = "?";
  else
    v3 = off_1E87DB080[activeStatus];
  return (id)objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("[ %@ ], Status: %s"), self->_entity, v3);
}

- (ENEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)activeStatus
{
  return self->_activeStatus;
}

- (void)setActiveStatus:(int)a3
{
  self->_activeStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
