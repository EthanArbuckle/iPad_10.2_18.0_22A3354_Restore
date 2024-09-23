@implementation NSEntityMapping

+ (void)initialize
{
  objc_opt_self();
}

- (NSEntityMapping)init
{
  return (NSEntityMapping *)-[NSEntityMapping _initWithSourceEntityDescription:destinationEntityDescription:](self, "_initWithSourceEntityDescription:destinationEntityDescription:", 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  self->_name = 0;
  self->_sourceEntityName = 0;

  self->_sourceEntityVersionHash = 0;
  self->_destinationEntityName = 0;

  self->_destinationEntityVersionHash = 0;
  self->_sourceExpression = 0;

  self->_userInfo = 0;
  self->_entityMigrationPolicyClassName = 0;

  self->_attributeMappings = 0;
  self->_relationshipMappings = 0;

  self->_mappingsByName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSEntityMapping;
  -[NSEntityMapping dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSArray *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSArray *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v5[4] = -[NSString copy](self->_name, "copy");
    v5[5] = self->_mappingType;
    v5[6] = -[NSString copy](self->_sourceEntityName, "copy");
    v5[7] = -[NSData copy](self->_sourceEntityVersionHash, "copy");
    v5[8] = -[NSString copy](self->_destinationEntityName, "copy");
    v5[9] = -[NSData copy](self->_destinationEntityVersionHash, "copy");
    v5[10] = -[NSExpression copy](self->_sourceExpression, "copy");
    v5[11] = -[NSDictionary copy](self->_userInfo, "copy");
    v5[12] = -[NSString copy](self->_entityMigrationPolicyClassName, "copy");
    v6 = -[NSEntityMapping attributeMappings](self, "attributeMappings");
    v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", a3), "init");
    v8 = -[NSArray count](v6, "count");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        v11 = (void *)objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", i), "copy");
        objc_msgSend(v7, "addObject:", v11);

      }
    }
    objc_msgSend(v5, "setAttributeMappings:", v7);

    v12 = -[NSEntityMapping relationshipMappings](self, "relationshipMappings");
    v13 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", a3), "init");
    v14 = -[NSArray count](v12, "count");
    if (v14)
    {
      v15 = v14;
      for (j = 0; j != v15; ++j)
      {
        v17 = (void *)objc_msgSend(-[NSArray objectAtIndex:](v12, "objectAtIndex:", j), "copy");
        objc_msgSend(v13, "addObject:", v17);

      }
    }
    objc_msgSend(v5, "setRelationshipMappings:", v13);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  NSEntityMappingType v8;
  NSString *v9;
  uint64_t v10;
  NSData *v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  NSData *v15;
  uint64_t v16;
  NSExpression *v17;
  uint64_t v18;
  NSDictionary *v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  NSArray *v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;

  if (a3 == self)
    goto LABEL_46;
  if (!a3)
    goto LABEL_45;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_45;
  v5 = -[NSEntityMapping name](self, "name");
  v6 = objc_msgSend(a3, "name");
  if (v5 != (NSString *)v6)
  {
    v7 = v6;
    LOBYTE(v6) = 0;
    if (!v5)
      return v6;
    if (!v7)
      return v6;
    LODWORD(v6) = -[NSString isEqual:](v5, "isEqual:");
    if (!(_DWORD)v6)
      return v6;
  }
  v8 = -[NSEntityMapping mappingType](self, "mappingType");
  if (v8 != objc_msgSend(a3, "mappingType"))
  {
LABEL_45:
    LOBYTE(v6) = 0;
    return v6;
  }
  v9 = -[NSEntityMapping sourceEntityName](self, "sourceEntityName");
  v6 = objc_msgSend(a3, "sourceEntityName");
  if (v9 == (NSString *)v6
    || (v10 = v6, LOBYTE(v6) = 0, v9) && v10 && (LODWORD(v6) = -[NSString isEqual:](v9, "isEqual:"), (_DWORD)v6))
  {
    v11 = -[NSEntityMapping sourceEntityVersionHash](self, "sourceEntityVersionHash");
    v6 = objc_msgSend(a3, "sourceEntityVersionHash");
    if (v11 == (NSData *)v6
      || (v12 = v6, LOBYTE(v6) = 0, v11) && v12 && (LODWORD(v6) = -[NSData isEqual:](v11, "isEqual:"), (_DWORD)v6))
    {
      v13 = -[NSEntityMapping destinationEntityName](self, "destinationEntityName");
      v6 = objc_msgSend(a3, "destinationEntityName");
      if (v13 == (NSString *)v6
        || (v14 = v6, LOBYTE(v6) = 0, v13) && v14 && (LODWORD(v6) = -[NSString isEqual:](v13, "isEqual:"), (_DWORD)v6))
      {
        v15 = -[NSEntityMapping destinationEntityVersionHash](self, "destinationEntityVersionHash");
        v6 = objc_msgSend(a3, "destinationEntityVersionHash");
        if (v15 == (NSData *)v6
          || (v16 = v6, LOBYTE(v6) = 0, v15) && v16 && (LODWORD(v6) = -[NSData isEqual:](v15, "isEqual:"), (_DWORD)v6))
        {
          v17 = -[NSEntityMapping sourceExpression](self, "sourceExpression");
          v6 = objc_msgSend(a3, "sourceExpression");
          if (v17 == (NSExpression *)v6
            || (v18 = v6, LOBYTE(v6) = 0, v17)
            && v18
            && (LODWORD(v6) = -[NSExpression isEqual:](v17, "isEqual:"), (_DWORD)v6))
          {
            v19 = -[NSEntityMapping userInfo](self, "userInfo");
            v6 = objc_msgSend(a3, "userInfo");
            if (v19 == (NSDictionary *)v6
              || (v20 = v6, LOBYTE(v6) = 0, v19)
              && v20
              && (LODWORD(v6) = -[NSDictionary isEqual:](v19, "isEqual:"), (_DWORD)v6))
            {
              v21 = -[NSEntityMapping entityMigrationPolicyClassName](self, "entityMigrationPolicyClassName");
              v6 = objc_msgSend(a3, "entityMigrationPolicyClassName");
              if (v21 == (NSString *)v6
                || (v22 = v6, LOBYTE(v6) = 0, v21)
                && v22
                && (LODWORD(v6) = -[NSString isEqual:](v21, "isEqual:"), (_DWORD)v6))
              {
                v23 = -[NSEntityMapping attributeMappings](self, "attributeMappings");
                v6 = objc_msgSend(a3, "attributeMappings");
                if (v23 == (NSArray *)v6
                  || (v24 = v6, LOBYTE(v6) = 0, v23)
                  && v24
                  && (LODWORD(v6) = -[NSArray isEqual:](v23, "isEqual:"), (_DWORD)v6))
                {
                  v25 = -[NSEntityMapping relationshipMappings](self, "relationshipMappings");
                  v6 = objc_msgSend(a3, "relationshipMappings");
                  if (v25 != (NSArray *)v6)
                  {
                    v26 = v6;
                    LOBYTE(v6) = 0;
                    if (v25 && v26)
                      LOBYTE(v6) = -[NSArray isEqual:](v25, "isEqual:");
                    return v6;
                  }
LABEL_46:
                  LOBYTE(v6) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@), name %@, mappingType %u, sourceEntityName %@, sourceEntityVersionHash %@, destinationEntityName %@, destinationEntityVersionHash %@, attributeMappings %@, relationshipMappings %@, sourceExpression %@, entityMigrationPolicyClassName %@, userInfo %@"), objc_opt_class(), -[NSEntityMapping name](self, "name"), -[NSEntityMapping mappingType](self, "mappingType"), -[NSEntityMapping sourceEntityName](self, "sourceEntityName"), -[NSEntityMapping sourceEntityVersionHash](self, "sourceEntityVersionHash"), -[NSEntityMapping destinationEntityName](self, "destinationEntityName"), -[NSEntityMapping destinationEntityVersionHash](self, "destinationEntityVersionHash"), -[NSEntityMapping attributeMappings](self, "attributeMappings"), -[NSEntityMapping relationshipMappings](self, "relationshipMappings"), -[NSEntityMapping sourceExpression](self, "sourceExpression"), -[NSEntityMapping entityMigrationPolicyClassName](self, "entityMigrationPolicyClassName"), -[NSEntityMapping userInfo](self, "userInfo"));
}

- (NSString)name
{
  NSString *result;

  result = self->_name;
  if (!result)
    return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@->%@"), -[NSEntityMapping sourceEntityName](self, "sourceEntityName"), -[NSEntityMapping destinationEntityName](self, "destinationEntityName"));
  return result;
}

- (void)setName:(NSString *)name
{
  NSString *v5;

  -[NSEntityMapping _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_name;
  if (v5 != name)
  {

    self->_name = (NSString *)-[NSString copy](name, "copy");
  }
}

- (NSEntityMappingType)mappingType
{
  return self->_mappingType;
}

- (void)setMappingType:(NSEntityMappingType)mappingType
{
  self->_mappingType = mappingType;
}

- (NSString)sourceEntityName
{
  return self->_sourceEntityName;
}

- (void)setSourceEntityName:(NSString *)sourceEntityName
{
  NSString *v5;

  -[NSEntityMapping _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_sourceEntityName;
  if (v5 != sourceEntityName)
  {

    self->_sourceEntityName = (NSString *)-[NSString copy](sourceEntityName, "copy");
  }
}

- (NSData)sourceEntityVersionHash
{
  return self->_sourceEntityVersionHash;
}

- (void)setSourceEntityVersionHash:(NSData *)sourceEntityVersionHash
{
  NSData *v5;

  -[NSEntityMapping _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_sourceEntityVersionHash;
  if (v5 != sourceEntityVersionHash)
  {

    self->_sourceEntityVersionHash = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", sourceEntityVersionHash);
  }
}

- (NSString)destinationEntityName
{
  return self->_destinationEntityName;
}

- (void)setDestinationEntityName:(NSString *)destinationEntityName
{
  NSString *v5;

  -[NSEntityMapping _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_destinationEntityName;
  if (v5 != destinationEntityName)
  {

    self->_destinationEntityName = (NSString *)-[NSString copy](destinationEntityName, "copy");
  }
}

- (NSData)destinationEntityVersionHash
{
  return self->_destinationEntityVersionHash;
}

- (void)setDestinationEntityVersionHash:(NSData *)destinationEntityVersionHash
{
  NSData *v5;

  -[NSEntityMapping _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_destinationEntityVersionHash;
  if (v5 != destinationEntityVersionHash)
  {

    self->_destinationEntityVersionHash = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", destinationEntityVersionHash);
  }
}

- (NSArray)attributeMappings
{
  return &self->_attributeMappings->super;
}

- (void)setAttributeMappings:(NSArray *)attributeMappings
{
  NSMutableArray *v5;

  -[NSEntityMapping _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_attributeMappings;
  if (v5 != (NSMutableArray *)attributeMappings)
  {

    self->_attributeMappings = (NSMutableArray *)-[NSArray copy](attributeMappings, "copy");
  }
}

- (NSArray)relationshipMappings
{
  return &self->_relationshipMappings->super;
}

- (void)setRelationshipMappings:(NSArray *)relationshipMappings
{
  NSMutableArray *v5;

  -[NSEntityMapping _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_relationshipMappings;
  if (v5 != (NSMutableArray *)relationshipMappings)
  {

    self->_relationshipMappings = (NSMutableArray *)-[NSArray copy](relationshipMappings, "copy");
  }
}

- (NSExpression)sourceExpression
{
  return self->_sourceExpression;
}

- (void)setSourceExpression:(NSExpression *)sourceExpression
{
  NSExpression *v5;

  -[NSEntityMapping _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_sourceExpression;
  if (v5 != sourceExpression)
  {

    self->_sourceExpression = (NSExpression *)-[NSExpression copy](sourceExpression, "copy");
  }
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  NSDictionary *v5;

  -[NSEntityMapping _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_userInfo;
  if (v5 != userInfo)
  {

    self->_userInfo = (NSDictionary *)-[NSDictionary copy](userInfo, "copy");
  }
}

- (NSString)entityMigrationPolicyClassName
{
  return self->_entityMigrationPolicyClassName;
}

- (void)setEntityMigrationPolicyClassName:(NSString *)entityMigrationPolicyClassName
{
  NSString *v5;

  -[NSEntityMapping _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_entityMigrationPolicyClassName;
  if (v5 != entityMigrationPolicyClassName)
  {

    self->_entityMigrationPolicyClassName = (NSString *)-[NSString copy](entityMigrationPolicyClassName, "copy");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self->_name)
    objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityMapping name](self, "name"), CFSTR("NSMappingName"));
  objc_msgSend(a3, "encodeInt:forKey:", -[NSEntityMapping mappingType](self, "mappingType"), CFSTR("NSMappingType"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityMapping sourceEntityName](self, "sourceEntityName"), CFSTR("NSSourceEntityName"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityMapping sourceEntityVersionHash](self, "sourceEntityVersionHash"), CFSTR("NSSourceEntityVersionHash"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityMapping destinationEntityName](self, "destinationEntityName"), CFSTR("NSDestinationEntityName"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityMapping destinationEntityVersionHash](self, "destinationEntityVersionHash"), CFSTR("NSDestinationEntityVersionHash"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityMapping sourceExpression](self, "sourceExpression"), CFSTR("NSSourceExpression"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityMapping userInfo](self, "userInfo"), CFSTR("NSUserInfo"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityMapping entityMigrationPolicyClassName](self, "entityMigrationPolicyClassName"), CFSTR("NSEntityMigrationPolicyClassName"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityMapping attributeMappings](self, "attributeMappings"), CFSTR("NSAttributeMappings"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityMapping relationshipMappings](self, "relationshipMappings"), CFSTR("NSRelationshipMappings"));
}

- (NSEntityMapping)initWithCoder:(id)a3
{
  NSEntityMapping *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NSEntityMapping;
  v4 = -[NSEntityMapping init](&v19, sel_init);
  if (v4)
  {
    v5 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSMappingName"));
    v4->_name = v5;
    if (v5 && (-[NSString isNSString](v5, "isNSString") & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB28A8];
      v17 = &unk_1E1F4A6D8;
    }
    else
    {
      v4->_mappingType = (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("NSMappingType"));
      v6 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSSourceEntityName"));
      v4->_sourceEntityName = v6;
      if (v6 && (-[NSString isNSString](v6, "isNSString") & 1) == 0)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = *MEMORY[0x1E0CB28A8];
        v17 = &unk_1E1F4A700;
      }
      else
      {
        v4->_sourceEntityVersionHash = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSSourceEntityVersionHash"));
        v7 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSDestinationEntityName"));
        v4->_destinationEntityName = v7;
        if (v7 && (-[NSString isNSString](v7, "isNSString") & 1) == 0)
        {
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v16 = *MEMORY[0x1E0CB28A8];
          v17 = &unk_1E1F4A728;
        }
        else
        {
          v4->_destinationEntityVersionHash = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSDestinationEntityVersionHash"));
          v8 = (void *)MEMORY[0x1E0C99E60];
          v9 = objc_opt_class();
          v4->_sourceExpression = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0), CFSTR("NSSourceExpression"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[NSExpression allowEvaluation](v4->_sourceExpression, "allowEvaluation");
          v4->_userInfo = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[_PFRoutines plistClassesForSecureCoding](), CFSTR("NSUserInfo"));
          v10 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSEntityMigrationPolicyClassName"));
          v4->_entityMigrationPolicyClassName = v10;
          if (!v10 || (-[NSString isNSString](v10, "isNSString") & 1) != 0)
          {
            v11 = (void *)MEMORY[0x1E0C99E60];
            v12 = objc_opt_class();
            v4->_attributeMappings = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0), CFSTR("NSAttributeMappings"));
            v13 = (void *)MEMORY[0x1E0C99E60];
            v14 = objc_opt_class();
            v4->_relationshipMappings = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0), CFSTR("NSRelationshipMappings"));
            *(_DWORD *)&v4->_entityMappingFlags &= ~1u;
            return v4;
          }
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v16 = *MEMORY[0x1E0CB28A8];
          v17 = &unk_1E1F4A750;
        }
      }
    }
    objc_msgSend(a3, "failWithError:", objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 4866, v17));

    return 0;
  }
  return v4;
}

- (NSEntityMigrationPolicy)_migrationPolicy
{
  Class isa;
  id v2;

  if (result)
  {
    isa = result[12].super.isa;
    if (isa)
    {
      result = (NSEntityMigrationPolicy *)objc_alloc_init(NSClassFromString((NSString *)result[12].super.isa));
      if (!result)
      {
        v2 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134110, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't create mapping policy for class named (%@)"), isa), 0);
        objc_exception_throw(v2);
      }
    }
    else
    {
      return objc_alloc_init(NSEntityMigrationPolicy);
    }
  }
  return result;
}

- (id)_initWithSourceEntityDescription:(id)a3 destinationEntityDescription:(id)a4
{
  NSEntityMapping *v6;
  NSEntityMapping *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSEntityMapping;
  v6 = -[NSEntityMapping init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_name = 0;
    v6->_mappingType = 0;
    v6->_attributeMappings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7->_relationshipMappings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a3)
    {
      v7->_sourceEntityName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
      v8 = objc_msgSend((id)objc_msgSend(a3, "versionHash"), "copy");
    }
    else
    {
      v8 = 0;
      v7->_sourceEntityName = 0;
    }
    v7->_sourceEntityVersionHash = (NSData *)v8;
    if (a4)
    {
      v7->_destinationEntityName = (NSString *)objc_msgSend((id)objc_msgSend(a4, "name"), "copy");
      v9 = objc_msgSend((id)objc_msgSend(a4, "versionHash"), "copy");
    }
    else
    {
      v9 = 0;
      v7->_destinationEntityName = 0;
    }
    v7->_destinationEntityVersionHash = (NSData *)v9;
    v7->_sourceExpression = 0;
    v7->_userInfo = 0;
    v7->_entityMigrationPolicyClassName = 0;
    *(_DWORD *)&v7->_entityMappingFlags &= ~1u;
  }
  return v7;
}

- (BOOL)isEditable
{
  return (*(_BYTE *)&self->_entityMappingFlags & 1) == 0;
}

- (void)_setIsEditable:(BOOL)a3
{
  __entityMappingFlags entityMappingFlags;

  entityMappingFlags = self->_entityMappingFlags;
  if (!(*(_BYTE *)&entityMappingFlags & 1) != a3)
  {
    if ((*(_BYTE *)&entityMappingFlags & 1) != 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Entity Mappings cannot become mutable after being marked immutable."), 0));
    self->_entityMappingFlags = (__entityMappingFlags)(*(_DWORD *)&entityMappingFlags & 0xFFFFFFFE | !a3);
    -[NSEntityMapping _createCachesAndOptimizeState](self, "_createCachesAndOptimizeState");
  }
}

- (void)_throwIfNotEditable
{
  if (!-[NSEntityMapping isEditable](self, "isEditable"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't modify an immutable entity mapping."), 0));
}

- (_QWORD)_mappingsByName
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = (_QWORD *)result[3];
    if (!result)
    {
      if (objc_msgSend(v1, "isEditable"))
        objc_msgSend(v1, "_setIsEditable:", 0);
      v2 = (void *)objc_msgSend(v1, "attributeMappings");
      v3 = (void *)objc_msgSend(v1, "relationshipMappings");
      v4 = objc_msgSend(v2, "count");
      v5 = objc_msgSend(v3, "count") + v4;
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v8 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(v2);
            v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v7, "addObject:", v12);
            objc_msgSend(v6, "addObject:", objc_msgSend(v12, "name"));
          }
          v9 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v9);
      }
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v19;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v19 != v15)
              objc_enumerationMutation(v3);
            v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
            objc_msgSend(v7, "addObject:", v17);
            objc_msgSend(v6, "addObject:", objc_msgSend(v17, "name"));
          }
          v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v14);
      }
      v1[3] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjects:forKeys:", v7, v6);

      return (_QWORD *)v1[3];
    }
  }
  return result;
}

@end
