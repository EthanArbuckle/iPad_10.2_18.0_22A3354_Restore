@implementation NSRelationshipDescription

- (NSUInteger)maxCount
{
  return self->_maxCount;
}

- (unint64_t)_propertyType
{
  return 4;
}

- (void)_createCachesAndOptimizeState
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[2];
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)NSRelationshipDescription;
  -[NSPropertyDescription _createCachesAndOptimizeState](&v14, sel__createCachesAndOptimizeState);
  if (!self->_destinationEntity)
    -[NSRelationshipDescription setDestinationEntity:](self, "setDestinationEntity:", -[NSRelationshipDescription destinationEntity](self, "destinationEntity"));
  if (!self->_inverseRelationship)
    -[NSRelationshipDescription setInverseRelationship:](self, "setInverseRelationship:", -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"));
  if (objc_msgSend(-[NSDictionary objectForKey:](-[NSPropertyDescription userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSRelationshipDescriptionOrderKeyIndexOption")), "BOOLValue"))
  {
    if (-[NSRelationshipDescription isToMany](self, "isToMany"))
    {
      if (-[NSRelationshipDescription isOrdered](self, "isOrdered"))
        return;
      v11 = *MEMORY[0x1E0CB28A8];
      v17 = *MEMORY[0x1E0CB2D68];
      v18 = CFSTR("Relationship is not ordered");
      v12 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v11, 1591, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99778];
      v13 = *MEMORY[0x1E0CB3388];
      v15[0] = CFSTR("unsupported relationship");
      v15[1] = v13;
      v16[0] = self;
      v16[1] = v12;
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = v16;
      v10 = v15;
    }
    else
    {
      v3 = *MEMORY[0x1E0CB28A8];
      v21 = *MEMORY[0x1E0CB2D68];
      v22[0] = CFSTR("Relationship is not a toMany");
      v4 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v3, 1591, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99778];
      v7 = *MEMORY[0x1E0CB3388];
      v19[0] = CFSTR("unsupported relationship");
      v19[1] = v7;
      v20[0] = self;
      v20[1] = v4;
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = v20;
      v10 = v19;
    }
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, CFSTR("Unsupported relationship type for ordered index"), objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 2)));
  }
}

- (void)setInverseRelationship:(NSRelationshipDescription *)inverseRelationship
{
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_inverseRelationship = inverseRelationship;

  self->_lazyInverseRelationshipName = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4 proxyContext:(id)a5
{
  NSEntityDescription *v9;
  const __CFString *v10;
  __CFString *v11;
  const char *CStringPtr;
  CC_LONG v13;
  NSRelationshipDescription *v14;
  NSRelationshipDescription *v15;
  NSEntityDescription *v16;
  NSString *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  __CFString *v23;
  const char *v24;
  CC_LONG v25;
  _BOOL4 v26;
  __int16 v27;
  int maxCount;
  objc_super v29;
  CC_SHA256_CTX c;
  _BYTE data[32];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  v9 = -[NSRelationshipDescription destinationEntity](self, "destinationEntity");
  v29.receiver = self;
  v29.super_class = (Class)NSRelationshipDescription;
  -[NSPropertyDescription _versionHash:inStyle:](&v29, sel__versionHash_inStyle_, data, a4);
  CC_SHA256_Update(&c, data, 0x20u);
  if (v9)
  {
    v10 = -[NSEntityDescription name](v9, "name");
    if (v10)
    {
      v11 = (__CFString *)v10;
      CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
      if (!CStringPtr)
        CStringPtr = (const char *)-[__CFString UTF8String](v11, "UTF8String");
      v13 = strlen(CStringPtr);
      CC_SHA256_Update(&c, CStringPtr, v13);
    }
  }
  v14 = -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship");
  if (v14)
  {
    v15 = v14;
    if (v14 != self || a4 == 1 && a5)
    {
      v16 = -[NSEntityDescription superentity](-[NSPropertyDescription entity](self, "entity"), "superentity");
      v17 = -[NSPropertyDescription name](self, "name");
      if (!v16)
        goto LABEL_19;
      v18 = (uint64_t)v17;
      v19 = 0;
      do
      {
        v20 = -[NSEntityDescription _relationshipNamed:](v16, v18);
        if (v20)
          v19 = v20;
        v16 = -[NSEntityDescription superentity](v16, "superentity");
      }
      while (v16);
      if (a5 || !v19 || (v21 = objc_msgSend(v19, "inverseRelationship"), a4) || v19 != (void *)v21)
      {
LABEL_19:
        v22 = -[NSPropertyDescription name](v15, "name");
        v23 = (__CFString *)v22;
        if (v22 && (v24 = CFStringGetCStringPtr(v22, 0x8000100u)) != 0
          || (v24 = (const char *)-[__CFString UTF8String](v23, "UTF8String")) != 0)
        {
          v25 = strlen(v24);
          CC_SHA256_Update(&c, v24, v25);
        }
      }
    }
  }
  maxCount = self->_maxCount;
  CC_SHA256_Update(&c, &maxCount, 4u);
  maxCount = self->_minCount;
  CC_SHA256_Update(&c, &maxCount, 4u);
  v26 = -[NSRelationshipDescription isOrdered](self, "isOrdered");
  v27 = v26;
  if (v26)
    CC_SHA256_Update(&c, &v27, 2u);
  CC_SHA256_Final((unsigned __int8 *)a3, &c);
}

- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6
{
  _BOOL4 v11;
  int v12;
  int v13;
  void *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSEntityDescription *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  id v36;
  NSEntityDescription *v37;
  _QWORD *v38;
  id v39;
  id v40;
  int v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  char v47;
  _QWORD *v48;
  _BYTE *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char isValidRelationshipDestination;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSUInteger v65;
  NSUInteger v66;
  unint64_t v67;
  BOOL v68;
  NSUInteger v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v78;
  uint64_t v79;
  const __CFString *v80;
  _BOOL4 v81;
  id v82;
  _BOOL4 v83;
  NSDeleteRule v84;
  int v85;
  unint64_t v86;
  id *v87;
  char *v88;
  objc_super v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[96];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v89.receiver = self;
  v89.super_class = (Class)NSRelationshipDescription;
  v11 = -[NSPropertyDescription _nonPredicateValidateValue:forKey:inObject:error:](&v89, sel__nonPredicateValidateValue_forKey_inObject_error_);
  if (v11)
  {
    if (!*a3)
      goto LABEL_78;
    v87 = a6;
    v12 = objc_msgSend(a5, "isInserted");
    v13 = objc_msgSend(*a3, "isFault");
    v14 = (void *)objc_msgSend(a5, "managedObjectContext");
    v85 = objc_msgSend(v14, "_isSwiftBound");
    if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
    {
      if (!-[NSRelationshipDescription isToMany](self, "isToMany"))
      {
        v15 = *a3;
        if (*a3)
        {
          if ((v15[16] & 0x24) != 0)
          {
            objc_msgSend(a5, "objectID");
            objc_msgSend(v15, "objectID");
            _NSCoreDataLog(4, (uint64_t)CFSTR("repairing missing delete propagation for to-one relationship %@ on object %p (%@) with bad fault %p (%@)"), v16, v17, v18, v19, v20, v21, (uint64_t)a4);
            if (-[NSRelationshipDescription deleteRule](-[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"), "deleteRule") == NSCascadeDeleteRule)
            {
              if (!objc_msgSend(a5, "managedObjectContext"))
                -[NSManagedObjectContext _forceRegisterLostFault:](objc_msgSend(a5, "managedObjectContext"), a5);
              objc_msgSend((id)objc_msgSend(a5, "managedObjectContext"), "deleteObject:", a5);
            }
            objc_msgSend(a5, "setValue:forKey:", 0, a4);
          }
          else
          {
            if (v85 && !objc_msgSend(*a3, "managedObjectContext"))
              objc_msgSend(v14, "insertObject:", v15);
            if ((-[NSManagedObject _isValidRelationshipDestination__]((uint64_t)v15) & 1) == 0)
            {
              v38 = v87;
              if (v87)
              {
                v70 = *a3;
                v71 = (void *)MEMORY[0x1E0C99D80];
                v72 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v15);
                v73 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v43 = objc_msgSend(v71, "dictionaryWithObjectsAndKeys:", v72, CFSTR("NSAffectedObjectsErrorKey"), v73, CFSTR("Dangling reference to an invalid object."), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSValidationErrorShouldAttemptRecoveryKey"), 0);
                v40 = a5;
                v41 = 1550;
                v42 = a4;
                v39 = v70;
                goto LABEL_49;
              }
              goto LABEL_89;
            }
          }
        }
      }
    }
    if (!-[NSRelationshipDescription isToMany](self, "isToMany"))
    {
      v36 = *a3;
      v37 = -[NSRelationshipDescription destinationEntity](self, "destinationEntity");
      if (!v36
        || !v37
        || !-[NSEntityDescription _subentitiesIncludes:](v37, "_subentitiesIncludes:", _PFEntityForManagedObject(v36)))
      {
        goto LABEL_46;
      }
LABEL_78:
      LOBYTE(v11) = 1;
      return v11;
    }
    if (!-[NSRelationshipDescription isOrdered](self, "isOrdered") && (objc_msgSend(*a3, "isNSSet") & 1) == 0
      || (v82 = v14, -[NSRelationshipDescription isOrdered](self, "isOrdered"))
      && (objc_msgSend(*a3, "isNSOrderedSet") & 1) == 0)
    {
      v74 = (void *)MEMORY[0x1E0C99DA0];
      v75 = *MEMORY[0x1E0C99768];
      v76 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Illegal container for relationship: value = %@; relationship = \"%@\"."),
              *a3,
              a4);
      objc_exception_throw((id)objc_msgSend(v74, "exceptionWithName:reason:userInfo:", v75, v76, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *a3, a4)));
    }
    v83 = -[NSPropertyDescription isOptional](self, "isOptional");
    if (!self)
      goto LABEL_46;
    v22 = *a3;
    v23 = -[NSRelationshipDescription destinationEntity](self, "destinationEntity");
    if ((objc_msgSend(v22, "isFault") & 1) == 0)
    {
      if (objc_msgSend(v22, "count"))
      {
        v92 = 0u;
        v93 = 0u;
        v91 = 0u;
        v90 = 0u;
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(char **)v91;
          v88 = *(char **)v91;
LABEL_26:
          v27 = 0;
          while (1)
          {
            if (*(char **)v91 != v26)
              objc_enumerationMutation(v22);
            if (!v23)
              break;
            v28 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v27);
            if (!v28
              || !-[NSEntityDescription _subentitiesIncludes:](v23, "_subentitiesIncludes:", _PFEntityForManagedObject(v28)))
            {
              break;
            }
            ++v27;
            v26 = v88;
            if (v25 == v27)
            {
              v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
              v26 = v88;
              if (v25)
                goto LABEL_26;
              goto LABEL_34;
            }
          }
LABEL_46:
          v38 = v87;
          if (v87)
          {
            v39 = *a3;
            v40 = a5;
            v41 = 1550;
LABEL_48:
            v42 = a4;
            v43 = 0;
LABEL_49:
            v44 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]((uint64_t)v40, v41, 0, (uint64_t)v42, (uint64_t)v39, v43);
            LOBYTE(v11) = 0;
            *v38 = v44;
            return v11;
          }
          goto LABEL_89;
        }
      }
    }
LABEL_34:
    v29 = v83;
    LOBYTE(v11) = 1;
    if ((v83 & v13) != 1 && v12 | v13 ^ 1)
    {
      if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
      {
        v30 = *a3;
        v31 = objc_msgSend(*a3, "count");
        if (v31)
        {
          v32 = v31;
          v84 = -[NSRelationshipDescription deleteRule](-[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"), "deleteRule");
          v81 = -[NSRelationshipDescription isOrdered](self, "isOrdered");
          v79 = (uint64_t)&v79;
          v33 = v32 >= 0x201 ? 1 : v32;
          v34 = (8 * v33 + 15) & 0xFFFFFFFFFFFFFFF0;
          v35 = (char *)&v79 - v34;
          if (v32 > 0x200)
            v35 = (char *)NSAllocateScannedUncollectable();
          else
            bzero((char *)&v79 - v34, 8 * v32);
          v88 = v35;
          objc_msgSend(v30, "getObjects:", v35, v79);
          v45 = 0;
          v46 = 0;
          v47 = 1;
          v80 = CFSTR("NSAffectedObjectsErrorKey");
          v48 = v87;
          v86 = v32;
          do
          {
            v49 = *(_BYTE **)&v88[8 * v45];
            if (v49 && (v49[16] & 0x24) != 0)
            {
              objc_msgSend(a5, "objectID");
              objc_msgSend(v49, "objectID");
              _NSCoreDataLog(4, (uint64_t)CFSTR("repairing missing delete propagation for to-many relationship %@ on object %p (%@) with bad fault %p (%@)"), v50, v51, v52, v53, v54, v55, (uint64_t)a4);
              if (v84 == NSCascadeDeleteRule)
              {
                if (!objc_msgSend(a5, "managedObjectContext"))
                  -[NSManagedObjectContext _forceRegisterLostFault:](objc_msgSend(a5, "managedObjectContext"), a5);
                objc_msgSend((id)objc_msgSend(a5, "managedObjectContext"), "deleteObject:", a5);
              }
              v32 = v86;
              if (!v46)
              {
                if (v81)
                  v56 = objc_msgSend(a5, "mutableOrderedSetValueForKey:", a4);
                else
                  v56 = objc_msgSend(a5, "mutableSetValueForKey:", a4);
                v46 = (void *)v56;
              }
              objc_msgSend(v46, "removeObject:", v49);
            }
            else
            {
              if (v85 && !objc_msgSend(v49, "managedObjectContext"))
                objc_msgSend(v82, "insertObject:", v49);
              isValidRelationshipDestination = -[NSManagedObject _isValidRelationshipDestination__]((uint64_t)v49);
              v47 &= isValidRelationshipDestination;
              if (v48 && (isValidRelationshipDestination & 1) == 0)
              {
                v58 = *a3;
                v59 = (void *)MEMORY[0x1E0C99D80];
                v60 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v49);
                v61 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v62 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
                v78 = v61;
                v48 = v87;
                v63 = objc_msgSend(v59, "dictionaryWithObjectsAndKeys:", v60, v80, v78, CFSTR("Dangling reference to an invalid object."), v62, CFSTR("NSValidationErrorShouldAttemptRecoveryKey"), 0);
                v64 = (uint64_t)v58;
                v32 = v86;
                v47 = 0;
                *v48 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]((uint64_t)a5, 1550, 0, (uint64_t)a4, v64, v63);
              }
            }
            ++v45;
          }
          while (v32 != v45);
          if (v32 >= 0x201)
            NSZoneFree(0, v88);
          v29 = v83;
          if ((v47 & 1) == 0)
            goto LABEL_89;
        }
      }
      v65 = -[NSRelationshipDescription minCount](self, "minCount");
      v66 = -[NSRelationshipDescription maxCount](self, "maxCount");
      v67 = objc_msgSend(*a3, "count");
      if (v67)
        v68 = 0;
      else
        v68 = v29;
      if (v68)
        goto LABEL_78;
      v69 = v67;
      if (v65 && v67 < v65)
      {
        v38 = v87;
        if (v87)
        {
          v39 = *a3;
          v40 = a5;
          v41 = 1580;
          goto LABEL_48;
        }
LABEL_89:
        LOBYTE(v11) = 0;
        return v11;
      }
      LOBYTE(v11) = 1;
      if (v66 && v69 > v66)
      {
        v38 = v87;
        if (v87)
        {
          v39 = *a3;
          v40 = a5;
          v41 = 1590;
          goto LABEL_48;
        }
        goto LABEL_89;
      }
    }
  }
  return v11;
}

- (BOOL)isToMany
{
  return self->_maxCount != 1;
}

- (NSEntityDescription)destinationEntity
{
  NSEntityDescription *result;

  result = self->_destinationEntity;
  if (!result)
  {
    if (self->_lazyDestinationEntityName)
    {
      result = -[NSEntityDescription managedObjectModel](-[NSPropertyDescription entity](self, "entity"), "managedObjectModel");
      if (result)
        return (NSEntityDescription *)-[NSData objectForKey:](result->_versionHash, "objectForKey:", self->_lazyDestinationEntityName);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (NSUInteger)minCount
{
  return self->_minCount;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSEntityDescription *destinationEntity;
  uint64_t v7;
  NSRelationshipDescription *inverseRelationship;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSRelationshipDescription;
  v4 = -[NSPropertyDescription copyWithZone:](&v11, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    v4[16] = self->_maxCount;
    v4[17] = self->_minCount;
    v4[18] = self->_deleteRule;
    destinationEntity = self->_destinationEntity;
    if (destinationEntity)
      v7 = -[NSString copy](-[NSEntityDescription name](destinationEntity, "name"), "copy");
    else
      v7 = -[NSString copy](self->_lazyDestinationEntityName, "copy");
    v5[13] = v7;
    inverseRelationship = self->_inverseRelationship;
    if (inverseRelationship)
      v9 = -[NSString copy](-[NSPropertyDescription name](inverseRelationship, "name"), "copy");
    else
      v9 = -[NSString copy](self->_lazyInverseRelationshipName, "copy");
    v5[15] = v9;
  }
  return v5;
}

- (NSRelationshipDescription)inverseRelationship
{
  NSRelationshipDescription *result;

  result = self->_inverseRelationship;
  if (!result)
  {
    if (self->_lazyInverseRelationshipName)
      return (NSRelationshipDescription *)-[NSEntityDescription _relationshipNamed:]((_QWORD *)-[NSRelationshipDescription destinationEntity](self, "destinationEntity"), (uint64_t)self->_lazyInverseRelationshipName);
    else
      return 0;
  }
  return result;
}

- (NSRelationshipDescription)initWithCoder:(id)a3
{
  NSRelationshipDescription *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  NSEntityDescription *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  void (*v16)(uint64_t);
  void *v17;
  _QWORD *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NSRelationshipDescription;
  v4 = -[NSPropertyDescription initWithCoder:](&v19, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[PFModelDecoderContext retainedContext](PFModelDecoderContext, "retainedContext");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v16 = __43__NSRelationshipDescription_initWithCoder___block_invoke;
    v17 = &unk_1E1EDD520;
    v18 = v5;
    v4->_maxCount = (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("NSMaxCount"));
    v4->_minCount = (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("NSMinCount"));
    v4->_deleteRule = (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("NSDeleteRule"));
    v4->_destinationEntity = (NSEntityDescription *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSDestinationEntity"));
    v6 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_NSDestinationEntityName"));
    if (!v4->_destinationEntity)
    {
      v10 = v6;
      if (v6 && (objc_msgSend(v6, "isNSString") & 1) == 0)
      {
        v9 = &unk_1E1F4ADE0;
        goto LABEL_30;
      }
      v4->_lazyDestinationEntityName = (NSString *)objc_msgSend(v10, "copy");
      goto LABEL_14;
    }
    if (v5)
      v7 = (void *)v5[3];
    else
      v7 = 0;
    objc_msgSend(v7, "addObject:");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = &unk_1E1F4AE08;
      goto LABEL_30;
    }
    if (v5)
    {
      if (v5[1])
        goto LABEL_14;
      v8 = (NSEntityDescription *)v5[2];
    }
    else
    {
      v8 = 0;
    }
    if (v4->_destinationEntity != v8)
    {
      v9 = &unk_1E1F4AE30;
      goto LABEL_30;
    }
LABEL_14:
    v4->_inverseRelationship = (NSRelationshipDescription *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSInverseRelationship"));
    v11 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_NSInverseRelationshipName"));
    if (v4->_inverseRelationship)
    {
      if (v5)
        v12 = (void *)v5[3];
      else
        v12 = 0;
      objc_msgSend(v12, "addObject:");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v5 && (v5[1] || v5[2]) || v4->_inverseRelationship == v4)
          goto LABEL_31;
        v9 = &unk_1E1F4AEA8;
      }
      else
      {
        v9 = &unk_1E1F4AE80;
      }
    }
    else
    {
      v13 = v11;
      if (!v11 || (objc_msgSend(v11, "isNSString") & 1) != 0)
      {
        v4->_lazyInverseRelationshipName = (NSString *)objc_msgSend(v13, "copy");
LABEL_31:
        v16((uint64_t)v15);
        return v4;
      }
      v9 = &unk_1E1F4AE58;
    }
LABEL_30:
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, v9));

    v4 = 0;
    goto LABEL_31;
  }
  return v4;
}

void __43__NSRelationshipDescription_initWithCoder___block_invoke(uint64_t a1)
{

}

- (NSRelationshipDescription)init
{
  return (NSRelationshipDescription *)-[NSRelationshipDescription _initWithName:](self, "_initWithName:", 0);
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  -[NSRelationshipDescription _versionHash:inStyle:proxyContext:](self, "_versionHash:inStyle:proxyContext:", a3, a4, 0);
}

- (void)setDestinationEntity:(NSEntityDescription *)destinationEntity
{
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_destinationEntity = destinationEntity;

  self->_lazyDestinationEntityName = 0;
}

- (id)_initWithName:(id)a3
{
  id result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSRelationshipDescription;
  result = -[NSPropertyDescription _initWithName:](&v4, sel__initWithName_, a3);
  if (result)
  {
    *((_QWORD *)result + 17) = 0;
    *((_QWORD *)result + 16) = 0;
    *((_QWORD *)result + 18) = 1;
  }
  return result;
}

- (void)setMaxCount:(NSUInteger)maxCount
{
  unsigned int v3;

  v3 = maxCount;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_maxCount = v3;
}

- (void)setMinCount:(NSUInteger)minCount
{
  unsigned int v3;

  v3 = minCount;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_minCount = v3;
}

- (void)setDeleteRule:(NSDeleteRule)deleteRule
{
  self->_deleteRule = deleteRule;
}

- (void)dealloc
{
  objc_super v3;

  self->_destinationEntity = 0;

  self->_lazyDestinationEntityName = 0;
  self->_inverseRelationship = 0;

  self->_lazyInverseRelationshipName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSRelationshipDescription;
  -[NSPropertyDescription dealloc](&v3, sel_dealloc);
}

- (NSDeleteRule)deleteRule
{
  return self->_deleteRule;
}

- (BOOL)_isRelationship
{
  return 1;
}

+ (void)initialize
{
  objc_opt_self();
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  NSString *lazyDestinationEntityName;
  NSString *lazyInverseRelationshipName;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSRelationshipDescription;
  v5 = -[NSPropertyDescription encodeWithCoder:](&v9, sel_encodeWithCoder_);
  v6 = (void *)MEMORY[0x18D76B4E4](v5);
  objc_msgSend(a3, "encodeInt:forKey:", -[NSRelationshipDescription maxCount](self, "maxCount"), CFSTR("NSMaxCount"));
  objc_msgSend(a3, "encodeInt:forKey:", -[NSRelationshipDescription minCount](self, "minCount"), CFSTR("NSMinCount"));
  objc_msgSend(a3, "encodeInt:forKey:", -[NSRelationshipDescription deleteRule](self, "deleteRule"), CFSTR("NSDeleteRule"));
  objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSRelationshipDescription destinationEntity](self, "destinationEntity"), CFSTR("NSDestinationEntity"));
  if (-[NSRelationshipDescription destinationEntity](self, "destinationEntity"))
    lazyDestinationEntityName = -[NSEntityDescription name](-[NSRelationshipDescription destinationEntity](self, "destinationEntity"), "name");
  else
    lazyDestinationEntityName = self->_lazyDestinationEntityName;
  objc_msgSend(a3, "encodeObject:forKey:", lazyDestinationEntityName, CFSTR("_NSDestinationEntityName"));
  objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"), CFSTR("NSInverseRelationship"));
  if (-[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"))
    lazyInverseRelationshipName = -[NSPropertyDescription name](-[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"), "name");
  else
    lazyInverseRelationshipName = self->_lazyInverseRelationshipName;
  objc_msgSend(a3, "encodeObject:forKey:", lazyInverseRelationshipName, CFSTR("_NSInverseRelationshipName"));
  objc_autoreleasePoolPop(v6);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSString *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSDeleteRule v10;
  int v11;
  NSString *v12;
  NSString *v13;
  NSRelationshipDescription *v14;
  void *v15;
  NSString *v16;
  NSString *v17;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v20 = v3;
    v21 = v4;
    v19.receiver = self;
    v19.super_class = (Class)NSRelationshipDescription;
    LODWORD(v7) = -[NSPropertyDescription isEqual:](&v19, sel_isEqual_);
    if ((_DWORD)v7)
    {
      v8 = -[NSRelationshipDescription maxCount](self, "maxCount");
      if (v8 == objc_msgSend(a3, "maxCount")
        && (v9 = -[NSRelationshipDescription minCount](self, "minCount"), v9 == objc_msgSend(a3, "minCount"))
        && (v10 = -[NSRelationshipDescription deleteRule](self, "deleteRule"), v10 == objc_msgSend(a3, "deleteRule"))
        && (v11 = -[NSRelationshipDescription isOrdered](self, "isOrdered"),
            v11 == objc_msgSend(a3, "isOrdered")))
      {
        v12 = (NSString *)objc_msgSend((id)objc_msgSend(a3, "destinationEntity"), "name");
        v7 = -[NSEntityDescription name](-[NSRelationshipDescription destinationEntity](self, "destinationEntity"), "name");
        if (v12 == v7
          || (v13 = v7, LOBYTE(v7) = 0, v12) && v13 && (LODWORD(v7) = -[NSString isEqual:](v12, "isEqual:"), (_DWORD)v7))
        {
          v14 = -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship");
          v15 = (void *)objc_msgSend(a3, "inverseRelationship");
          v16 = -[NSPropertyDescription name](v14, "name");
          v7 = (NSString *)objc_msgSend(v15, "name");
          if (v16 == v7)
          {
            LOBYTE(v7) = 1;
          }
          else
          {
            v17 = v7;
            LOBYTE(v7) = 0;
            if (v16 && v17)
              LOBYTE(v7) = -[NSString isEqual:](v16, "isEqual:");
          }
        }
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
  }
  return (char)v7;
}

- (BOOL)_isSchemaEqual:(id)a3
{
  NSString *v5;
  NSUInteger v6;
  NSUInteger v7;
  NSDeleteRule v8;
  int v9;
  NSString *v10;
  NSString *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NSRelationshipDescription;
  LODWORD(v5) = -[NSPropertyDescription isEqual:](&v13, sel_isEqual_);
  if ((_DWORD)v5)
  {
    v6 = -[NSRelationshipDescription maxCount](self, "maxCount");
    if (v6 == objc_msgSend(a3, "maxCount")
      && (v7 = -[NSRelationshipDescription minCount](self, "minCount"), v7 == objc_msgSend(a3, "minCount"))
      && (v8 = -[NSRelationshipDescription deleteRule](self, "deleteRule"), v8 == objc_msgSend(a3, "deleteRule"))
      && (v9 = -[NSRelationshipDescription isOrdered](self, "isOrdered"),
          v9 == objc_msgSend(a3, "isOrdered")))
    {
      v10 = (NSString *)objc_msgSend((id)objc_msgSend(a3, "destinationEntity"), "name");
      v5 = -[NSEntityDescription name](-[NSRelationshipDescription destinationEntity](self, "destinationEntity"), "name");
      if (v10 == v5)
      {
        LOBYTE(v5) = 1;
      }
      else
      {
        v11 = v5;
        LOBYTE(v5) = 0;
        if (v10 && v11)
          LOBYTE(v5) = -[NSString isEqual:](v10, "isEqual:");
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return (char)v5;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSRelationshipDescription;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, destination entity %@, inverseRelationship %@, minCount %lu, maxCount %lu, isOrdered %d, deleteRule %lu"), -[NSPropertyDescription description](&v3, sel_description), -[NSEntityDescription name](-[NSRelationshipDescription destinationEntity](self, "destinationEntity"), "name"), -[NSPropertyDescription name](-[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"), "name"), -[NSRelationshipDescription minCount](self, "minCount"), -[NSRelationshipDescription maxCount](self, "maxCount"), -[NSRelationshipDescription isOrdered](self, "isOrdered"), -[NSRelationshipDescription deleteRule](self, "deleteRule"));
}

- (BOOL)isIndexed
{
  return 1;
}

- (NSData)versionHash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSRelationshipDescription;
  return -[NSPropertyDescription versionHash](&v3, sel_versionHash);
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  uint64_t v16;
  NSRelationshipDescription *v17;
  NSRelationshipDescription *v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  objc_super v22;

  _writeInt32IntoData(a3, 0);
  v16 = objc_msgSend(a3, "length");
  v22.receiver = self;
  v22.super_class = (Class)NSRelationshipDescription;
  -[NSPropertyDescription _appendPropertyFieldsToData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:entitiesSlots:](&v22, sel__appendPropertyFieldsToData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_entitiesSlots_, a3, a4, a5, a6, a7, a8);
  _writeInt32IntoData(a3, objc_msgSend(a8, "indexForKey:", -[NSEntityDescription name](-[NSRelationshipDescription destinationEntity](self, "destinationEntity"), "name")));
  v17 = -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship");
  if (v17)
  {
    v18 = v17;
    _writeInt32IntoData(a3, 1u);
    v19 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", v18), "unsignedIntegerValue");
  }
  else
  {
    v19 = 0;
  }
  _writeInt32IntoData(a3, v19);
  v20 = v16 - 4;
  _writeInt32IntoData(a3, self->_maxCount);
  _writeInt32IntoData(a3, self->_minCount);
  _writeInt32IntoData(a3, self->_deleteRule);
  v21 = bswap32(objc_msgSend(a3, "length") - v20);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v20, 4, &v21);
}

@end
