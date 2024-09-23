@implementation LNAlternativeValueType

- (LNAlternativeValueType)initWithMemberValueTypes:(id)a3
{
  id v4;
  LNAlternativeValueType *v5;
  uint64_t v6;
  NSArray *memberValueTypes;
  LNAlternativeValueType *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNAlternativeValueType;
  v5 = -[LNValueType _init](&v10, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    memberValueTypes = v5->_memberValueTypes;
    v5->_memberValueTypes = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)objectIsMemberOfType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[LNAlternativeValueType memberValueTypes](self, "memberValueTypes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "objectIsMemberOfType:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

- (BOOL)valueIsKindOfType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[LNAlternativeValueType memberValueTypes](self, "memberValueTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (void)enumerateValuesOfValueType:(id)a3 value:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[LNAlternativeValueType memberValueTypes](self, "memberValueTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v13);

  if (v11)
  {
    objc_msgSend(v8, "valueType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enumerateValuesOfValueType:value:block:", v13, v8, v9);

  }
}

- (LNAlternativeValueType)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  LNAlternativeValueType *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("memberValueTypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[LNAlternativeValueType initWithMemberValueTypes:](self, "initWithMemberValueTypes:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNAlternativeValueType memberValueTypes](self, "memberValueTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("memberValueTypes"));

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[LNAlternativeValueType memberValueTypes](self, "memberValueTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" | "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNAlternativeValueType memberValueTypes](self, "memberValueTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNAlternativeValueType *v4;
  LNAlternativeValueType *v5;
  LNAlternativeValueType *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (LNAlternativeValueType *)a3;
  v5 = v4;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[LNAlternativeValueType memberValueTypes](v6, "memberValueTypes", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            -[LNAlternativeValueType memberValueTypes](self, "memberValueTypes");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v12) = objc_msgSend(v13, "containsObject:", v12);

            if (!(_DWORD)v12)
            {
              v14 = 0;
              goto LABEL_16;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v9)
            continue;
          break;
        }
      }
      v14 = 1;
LABEL_16:

    }
    else
    {

      v14 = 0;
    }
  }

  return v14;
}

- (NSArray)memberValueTypes
{
  return self->_memberValueTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberValueTypes, 0);
}

+ (id)objectClassesForCoding
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "arrayWithObjects:", v3, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
