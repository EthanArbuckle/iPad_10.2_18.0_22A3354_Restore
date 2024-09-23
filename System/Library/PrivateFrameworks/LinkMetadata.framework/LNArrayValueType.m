@implementation LNArrayValueType

- (LNArrayValueType)initWithMemberValueType:(id)a3 capabilities:(int64_t)a4
{
  id v7;
  LNArrayValueType *v8;
  uint64_t v9;
  LNValueType *memberValueType;
  LNArrayValueType *v11;
  void *v13;
  objc_super v14;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNArrayValueType.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![memberValueType isKindOfClass:[LN_TYPE(ArrayValueType) class]]"));

  }
  v14.receiver = self;
  v14.super_class = (Class)LNArrayValueType;
  v8 = -[LNValueType _init](&v14, sel__init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    memberValueType = v8->_memberValueType;
    v8->_memberValueType = (LNValueType *)v9;

    v8->_capabilities = a4;
    v11 = v8;
  }

  return v8;
}

- (BOOL)objectIsMemberOfType:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            LOBYTE(v12) = 0;
            goto LABEL_16;
          }
          -[LNArrayValueType memberValueType](self, "memberValueType", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "valueIsKindOfType:", v10);

          if (!v12)
            goto LABEL_16;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        LOBYTE(v12) = 1;
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      LOBYTE(v12) = 1;
    }
LABEL_16:

  }
  else
  {

    LOBYTE(v12) = 0;
  }

  return v12;
}

- (LNValueType)memberValueType
{
  return self->_memberValueType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberValueType, 0);
}

- (LNArrayValueType)initWithMemberValueType:(id)a3
{
  return -[LNArrayValueType initWithMemberValueType:capabilities:](self, "initWithMemberValueType:capabilities:", a3, 3);
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

- (void)enumerateValuesOfValueType:(id)a3 value:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[LNArrayValueType memberValueType](self, "memberValueType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqual:", v11);

  if (v12)
  {
    objc_msgSend(v9, "value");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v13 = v13;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v21 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
              objc_msgSend(v18, "valueType", (_QWORD)v20);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "enumerateValuesOfValueType:value:block:", v8, v18, v10);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v15);
        }

      }
    }

  }
}

- (LNArrayValueType)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNArrayValueType *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("memberValueType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[LNArrayValueType initWithMemberValueType:capabilities:](self, "initWithMemberValueType:capabilities:", v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("capabilities")));
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[LNArrayValueType memberValueType](self, "memberValueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("memberValueType"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[LNArrayValueType capabilities](self, "capabilities"), CFSTR("capabilities"));
}

- (id)description
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[LNArrayValueType capabilities](self, "capabilities") == 3)
  {
    v3 = CFSTR("Array");
  }
  else if (-[LNArrayValueType capabilities](self, "capabilities") == 2)
  {
    v3 = CFSTR("OrderedSet");
  }
  else
  {
    v3 = CFSTR("Set");
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[LNArrayValueType memberValueType](self, "memberValueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@<%@>"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[LNArrayValueType memberValueType](self, "memberValueType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[LNArrayValueType capabilities](self, "capabilities") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  LNArrayValueType *v4;
  LNArrayValueType *v5;
  LNArrayValueType *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  BOOL v13;
  int64_t v14;

  v4 = (LNArrayValueType *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v13 = 0;
LABEL_16:

      goto LABEL_17;
    }
    -[LNArrayValueType memberValueType](self, "memberValueType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNArrayValueType memberValueType](v6, "memberValueType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      if (!v9 || !v10)
      {

LABEL_14:
        v13 = 0;
        goto LABEL_15;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_14;
    }
    v14 = -[LNArrayValueType capabilities](self, "capabilities");
    v13 = v14 == -[LNArrayValueType capabilities](v6, "capabilities");
LABEL_15:

    goto LABEL_16;
  }
  v13 = 1;
LABEL_17:

  return v13;
}

- (int64_t)capabilities
{
  return self->_capabilities;
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
