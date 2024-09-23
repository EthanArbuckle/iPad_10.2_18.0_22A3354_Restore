@implementation ATXSlotSet

- (ATXSlotSet)initWithParameters:(id)a3
{
  return -[ATXSlotSet initWithParameters:uuid:](self, "initWithParameters:uuid:", a3, 0);
}

- (ATXSlotSet)initWithParameters:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  ATXSlotSet *v8;
  uint64_t v9;
  NSSet *parameters;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXSlotSet;
  v8 = -[ATXSlotSet init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    parameters = v8->_parameters;
    v8->_parameters = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_uuid, a4);
  }

  return v8;
}

- (ATXSlotSet)initWithOpaqueParameters
{
  return -[ATXSlotSet initWithOpaqueParametersUuid:](self, "initWithOpaqueParametersUuid:", 0);
}

- (ATXSlotSet)initWithOpaqueParametersUuid:(id)a3
{
  id v5;
  ATXSlotSet *v6;
  ATXSlotSet *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSlotSet;
  v6 = -[ATXSlotSet init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uuid, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_parameters, CFSTR("parameters"));
}

- (ATXSlotSet)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  ATXSlotSet *v9;
  ATXSlotSet *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("parameters"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = -[ATXSlotSet initWithParameters:](self, "initWithParameters:", v8);
  else
    v9 = -[ATXSlotSet initWithOpaqueParameters](self, "initWithOpaqueParameters");
  v10 = v9;

  return v10;
}

- (unint64_t)hash
{
  unint64_t v2;
  NSUInteger v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  LODWORD(v2) = self->_hash;
  if (!(_DWORD)v2)
  {
    v4 = -[NSSet count](self->_parameters, "count");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_parameters;
    v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v4 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hash", (_QWORD)v11);
        }
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    v2 = v4 ^ HIDWORD(v4);
    if (v2 <= 1)
      LODWORD(v2) = 1;
    self->_hash = v2;
  }
  return v2;
}

- (BOOL)isEqualToSlotSet:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  NSSet *parameters;
  NSSet *v7;
  char v8;
  void *v9;

  v4 = a3;
  v5 = -[ATXSlotSet hash](self, "hash");
  if (v5 == objc_msgSend(v4, "hash"))
  {
    parameters = self->_parameters;
    v7 = (NSSet *)v4[2];
    if (parameters == v7)
    {
      v8 = 1;
    }
    else if (v7)
    {
      v8 = -[NSSet isEqualToSet:](parameters, "isEqualToSet:");
    }
    else
    {
      v9 = (void *)objc_opt_new();
      v8 = -[NSSet isEqualToSet:](parameters, "isEqualToSet:", v9);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  ATXSlotSet *v4;
  ATXSlotSet *v5;
  BOOL v6;

  v4 = (ATXSlotSet *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXSlotSet isEqualToSlotSet:](self, "isEqualToSlotSet:", v5);

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<ATXSlotSet: %@>"), self->_parameters);
}

- (NSSet)parameters
{
  return self->_parameters;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
