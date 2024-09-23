@implementation NSPropertyDescription

- (BOOL)_hasMinValueInExtraIvars
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 10) & 1;
}

- (BOOL)_hasMaxValueInExtraIvars
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 9) & 1;
}

- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6
{
  BOOL result;
  void *v12;

  if (-[NSPropertyDescription isOptional](self, "isOptional")
    || *a3
    || -[NSPropertyDescription isTransient](self, "isTransient") && !(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
  {
    return 1;
  }
  if (!a6)
    return 0;
  v12 = (void *)-[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]((uint64_t)a5, 1570, 0, (uint64_t)a4, (uint64_t)*a3, 0);
  result = 0;
  *a6 = v12;
  return result;
}

- (BOOL)isOptional
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 2) & 1;
}

- (_NSExtraPropertyIVars)_extraIVars
{
  _NSExtraPropertyIVars *result;

  result = self->_extraIvars;
  if (!result)
  {
    -[NSPropertyDescription _initializeExtraIVars](self, "_initializeExtraIVars");
    return self->_extraIvars;
  }
  return result;
}

- (id)superCompositeAttribute
{
  _NSExtraPropertyIVars *extraIvars;

  extraIvars = self->_extraIvars;
  if (extraIvars)
    return extraIvars->var4;
  else
    return 0;
}

- (id)_qualifiedName
{
  id v3;

  v3 = -[NSPropertyDescription _namespace](self, "_namespace");
  if (v3)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v3, -[NSPropertyDescription name](self, "name"));
  else
    return -[NSPropertyDescription name](self, "name");
}

- (id)_namespace
{
  _NSExtraPropertyIVars *extraIvars;

  extraIvars = self->_extraIvars;
  if (extraIvars)
    return extraIvars->var3;
  else
    return 0;
}

- (int64_t)_entitysReferenceID
{
  return self->_entitysReferenceIDForProperty;
}

- (BOOL)_isRelationship
{
  return 0;
}

- (BOOL)isTransient
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 1) & 1;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)_storeBinaryDataExternally
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 11) & 1;
}

- (BOOL)_isFileBackedFuture
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 14) & 1;
}

- (void)_setEntitysReferenceID:(int64_t)a3
{
  uint64_t entitysReferenceIDForProperty;

  entitysReferenceIDForProperty = self->_entitysReferenceIDForProperty;
  if (entitysReferenceIDForProperty == -1 || entitysReferenceIDForProperty == a3)
    self->_entitysReferenceIDForProperty = a3;
  else
    __break(1u);
}

- (BOOL)isStoredInExternalRecord
{
  if ((*(_WORD *)&self->_propertyDescriptionFlags & 0x40) != 0)
    return !-[NSPropertyDescription isTransient](self, "isTransient");
  else
    return 0;
}

- (BOOL)isIndexedBySpotlight
{
  if ((*(_WORD *)&self->_propertyDescriptionFlags & 0x20) != 0)
    return !-[NSPropertyDescription isTransient](self, "isTransient");
  else
    return 0;
}

- (void)_createCachesAndOptimizeState
{
  NSArray *validationPredicates;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  validationPredicates = self->_validationPredicates;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](validationPredicates, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(validationPredicates);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "allowEvaluation");
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](validationPredicates, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (BOOL)_allowsCloudEncryption
{
  return *(_WORD *)&self->_propertyDescriptionFlags >> 15;
}

- (BOOL)_isSpotlightIndexedAndTransient
{
  return (~*(_WORD *)&self->_propertyDescriptionFlags & 0x22) != 0;
}

- (void)_replaceValidationPredicates:(id)a3 andWarnings:(id)a4
{
  NSArray *validationPredicates;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];

  self->_validationPredicates = (NSArray *)a3;
  self->_validationWarnings = (NSArray *)a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  validationPredicates = self->_validationPredicates;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](validationPredicates, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(validationPredicates);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "allowEvaluation");
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](validationPredicates, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
}

- (NSDictionary)userInfo
{
  if (self->_userInfo)
    return &self->_userInfo->super;
  else
    return (NSDictionary *)NSDictionary_EmptyDictionary;
}

- (BOOL)_preserveValueOnDelete
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 12) & 1;
}

- (BOOL)_isOrdered
{
  return HIBYTE(*(_WORD *)&self->_propertyDescriptionFlags) & 1;
}

- (void)_setEntityAndMaintainIndices:(id)a3
{
  NSEntityDescription *entity;
  __int16 propertyDescriptionFlags;
  __int16 v7;

  entity = self->_entity;
  if (entity != a3)
  {
    if (entity)
    {
      if (-[NSEntityDescription _hasIndexForProperty:]((uint64_t)entity, self))
      {
        -[NSEntityDescription _removeIndexForProperty:]((uint64_t)self->_entity, self);
        self->_entity = (NSEntityDescription *)a3;
LABEL_6:
        if (a3)
        {
          -[NSEntityDescription _addIndexForProperty:]((uint64_t)a3, self);
          return;
        }
        v7 = *(_WORD *)&self->_propertyDescriptionFlags | 8;
LABEL_12:
        *(_WORD *)&self->_propertyDescriptionFlags = v7;
        return;
      }
      self->_entity = (NSEntityDescription *)a3;
    }
    else
    {
      propertyDescriptionFlags = (__int16)self->_propertyDescriptionFlags;
      self->_entity = (NSEntityDescription *)a3;
      if ((propertyDescriptionFlags & 8) != 0)
        goto LABEL_6;
    }
    if (a3)
      return;
    v7 = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFF7;
    goto LABEL_12;
  }
}

- (NSEntityDescription)entity
{
  return self->_entity;
}

- (BOOL)_isAttribute
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    *(_QWORD *)(v4 + 32) = -[NSString copy](self->_name, "copy");
    *(_QWORD *)(v4 + 40) = -[NSArray copy](-[NSPropertyDescription validationPredicates](self, "validationPredicates"), "copy");
    *(_QWORD *)(v4 + 48) = -[NSArray copy](-[NSPropertyDescription validationWarnings](self, "validationWarnings"), "copy");
    v5 = *(_WORD *)(v4 + 72) & 0xFFFE | *(_WORD *)&self->_propertyDescriptionFlags & 1;
    *(_WORD *)(v4 + 72) = *(_WORD *)(v4 + 72) & 0xFFFE | *(_WORD *)&self->_propertyDescriptionFlags & 1;
    v6 = v5 & 0xFFFFFFFD | (2 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 1) & 1));
    *(_WORD *)(v4 + 72) = v6;
    v7 = v6 & 0xFFFFFFFB | (4 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 2) & 1));
    *(_WORD *)(v4 + 72) = v7;
    v8 = v7 & 0xFFFFFFF7 | (8 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 3) & 1));
    *(_WORD *)(v4 + 72) = v8;
    v9 = v8 & 0xFFFFFFEF | (16 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 4) & 1));
    *(_WORD *)(v4 + 72) = v9;
    v10 = v9 & 0xFFFFFFDF | (32 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 5) & 1));
    *(_WORD *)(v4 + 72) = v10;
    v11 = v10 & 0xFFFFFFBF | (((*(_WORD *)&self->_propertyDescriptionFlags >> 6) & 1) << 6);
    *(_WORD *)(v4 + 72) = v11;
    v12 = v11 & 0xFFFFFEFF | ((HIBYTE(*(_WORD *)&self->_propertyDescriptionFlags) & 1) << 8);
    *(_WORD *)(v4 + 72) = v12;
    *(_WORD *)(v4 + 72) = *(_WORD *)&self->_propertyDescriptionFlags & 0x8000 | v12 & 0x7FFF;
    *(_QWORD *)(v4 + 64) = -[NSMutableDictionary copy](self->_userInfo, "copy");
    *(_QWORD *)(v4 + 8) = -[NSString copy](self->_versionHashModifier, "copy");
    *(_QWORD *)(v4 + 16) = 0;
    *(_WORD *)(v4 + 76) = -1;
    objc_msgSend((id)v4, "setRenamingIdentifier:", -[NSPropertyDescription renamingIdentifier](self, "renamingIdentifier"));
    objc_msgSend((id)v4, "setSuperCompositeAttribute:", -[NSPropertyDescription superCompositeAttribute](self, "superCompositeAttribute"));
  }
  return (id)v4;
}

- (id)_initWithName:(id)a3
{
  NSPropertyDescription *v4;
  NSPropertyDescription *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSPropertyDescription;
  v4 = -[NSPropertyDescription init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFE80 | 4;
    v4->_name = (NSString *)objc_msgSend(a3, "copy");
    v5->_entitysReferenceIDForProperty = -1;
    v5->_versionHashModifier = 0;
    v5->_versionHash = 0;
  }
  return v5;
}

- (NSPropertyDescription)initWithCoder:(id)a3
{
  NSPropertyDescription *v4;
  _QWORD *v5;
  unsigned int v6;
  char v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSString *v28;
  NSString *v29;
  uint64_t v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  void *v34;
  uint64_t v35;
  _QWORD *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[2];
  void (*v43)(uint64_t);
  void *v44;
  _QWORD *v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)NSPropertyDescription;
  v4 = -[NSPropertyDescription init](&v46, sel_init);
  if (v4)
  {
    v5 = +[PFModelDecoderContext retainedContext](PFModelDecoderContext, "retainedContext");
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v43 = __39__NSPropertyDescription_initWithCoder___block_invoke;
    v44 = &unk_1E1EDD520;
    v37 = v5;
    v45 = v5;
    v6 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("_P"));
    v7 = v6;
    if (v6)
    {
      *(_WORD *)&v4->_propertyDescriptionFlags = (2 * v6) & 4 | (v6 >> 2) & 3 | (v6 >> 3) & 0x60 | (v6 >> 2) & 0x100 | (((v6 >> 11) & 1) << 15) | *(_WORD *)&v4->_propertyDescriptionFlags & 0x7E98;
      if ((v6 & 0x10) != 0)
        goto LABEL_35;
    }
    else
    {
      if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSIsOptional")))
        v8 = 4;
      else
        v8 = 0;
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFFB | v8;
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFFE | objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSIsReadOnly"));
      if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSIsTransient")))
        v9 = 2;
      else
        v9 = 0;
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFFD | v9;
      if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSIndexedBySpotlight")))
        v10 = 32;
      else
        v10 = 0;
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFDF | v10;
      if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSIsStoredInTruth")))
        v11 = 64;
      else
        v11 = 0;
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFBF | v11;
      if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSIsOrdered")))
        v12 = 256;
      else
        v12 = 0;
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFEFF | v12;
      if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSAllowsCloudEncryption")))
        v13 = 0x8000;
      else
        v13 = 0;
      *(_WORD *)&v4->_propertyDescriptionFlags = v13 & 0x8000 | *(_WORD *)&v4->_propertyDescriptionFlags & 0x7FFF;
    }
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0), CFSTR("NSValidationPredicates"));
    v4->_validationPredicates = v17;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (!byte_1ECD8DE26)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v21, "allowEvaluation");
          }
          if (objc_msgSend(v21, "isNSArray"))
          {
            objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4ACA0));

            goto LABEL_61;
          }
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v18)
          continue;
        break;
      }
    }
LABEL_35:
    if ((v7 & 0x20) == 0)
    {
      v22 = (void *)MEMORY[0x1E0C99E60];
      v23 = objc_opt_class();
      v24 = objc_opt_class();
      v25 = objc_opt_class();
      v4->_validationWarnings = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v22, "setWithObjects:", v23, v24, v25, objc_opt_class(), 0), CFSTR("NSValidationWarnings"));
    }
    if ((v7 & 0x40) == 0)
      v4->_userInfo = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[_PFRoutines plistClassesForSecureCoding](), CFSTR("NSUserInfo"));
    if ((v7 & 0x80) == 0)
    {
      v26 = (void *)MEMORY[0x1E0C99E60];
      v27 = objc_opt_class();
      v28 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0), CFSTR("NSVersionHashModifier"));
      v4->_versionHashModifier = v28;
      if (v28)
      {
        if (!-[NSString isNSString](v28, "isNSString"))
        {
          v33 = &unk_1E1F4ACC8;
          goto LABEL_60;
        }
      }
    }
    *(_WORD *)&v4->_propertyDescriptionFlags &= ~0x10u;
    v29 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPropertyName"));
    v4->_name = v29;
    if (v29 && !-[NSString isNSString](v29, "isNSString"))
    {
      v33 = &unk_1E1F4ACF0;
      goto LABEL_60;
    }
    v30 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSEntity"));
    v4->_entity = (NSEntityDescription *)v30;
    if (v30)
    {
      if (v37)
        v31 = (void *)v37[3];
      else
        v31 = 0;
      objc_msgSend(v31, "addObject:", v30);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v33 = &unk_1E1F4AD40;
      else
        v33 = &unk_1E1F4AD18;
      if (v37 == 0 || (isKindOfClass & 1) == 0)
        goto LABEL_60;
      if (!v37[1] && !v37[2])
      {
        v33 = &unk_1E1F4AD40;
        goto LABEL_60;
      }
    }
    v34 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    -[NSPropertyDescription setRenamingIdentifier:](v4, "setRenamingIdentifier:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0), CFSTR("NSRenamingIdentifier")));
    if (!-[NSPropertyDescription renamingIdentifier](v4, "renamingIdentifier")
      || (-[NSString isNSString](-[NSPropertyDescription renamingIdentifier](v4, "renamingIdentifier"), "isNSString") & 1) != 0)
    {
      -[NSPropertyDescription _setNamespace:](v4, 0);
      -[NSPropertyDescription setSuperCompositeAttribute:](v4, "setSuperCompositeAttribute:", 0);
      v4->_entitysReferenceIDForProperty = -1;
LABEL_62:
      v43((uint64_t)v42);
      return v4;
    }
    v33 = &unk_1E1F4AD68;
LABEL_60:
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, v33));

LABEL_61:
    v4 = 0;
    goto LABEL_62;
  }
  return v4;
}

- (NSString)renamingIdentifier
{
  _NSExtraPropertyIVars *extraIvars;
  NSString *var0;

  extraIvars = self->_extraIvars;
  if (extraIvars && (var0 = (NSString *)extraIvars->var0) != 0)
    return var0;
  else
    return -[NSPropertyDescription name](self, "name");
}

- (_QWORD)_setNamespace:(_QWORD *)result
{
  _QWORD *v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    v4 = result[7];
    if (v4)
    {

      *(_QWORD *)(v3[7] + 24) = 0;
    }
    else
    {
      objc_msgSend(result, "_initializeExtraIVars");
    }
    result = (_QWORD *)objc_msgSend(a2, "copy");
    *(_QWORD *)(v3[7] + 24) = result;
  }
  return result;
}

- (void)_initializeExtraIVars
{
  malloc_zone_t *v3;
  void *v4;
  void *v5;
  unint64_t *p_extraIvars;
  malloc_zone_t *v8;

  v3 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone)
    v3 = malloc_default_zone();
  v4 = malloc_type_zone_calloc(v3, 1uLL, 0x28uLL, 0x108004046168151uLL);
  v5 = v4;
  p_extraIvars = (unint64_t *)&self->_extraIvars;
  while (!__ldaxr(p_extraIvars))
  {
    if (!__stlxr((unint64_t)v4, p_extraIvars))
      return;
  }
  __clrex();
  v8 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone)
    v8 = malloc_default_zone();
  malloc_zone_free(v8, v5);
}

- (void)setSuperCompositeAttribute:(id)a3
{
  _NSExtraPropertyIVars *extraIvars;
  uint64_t v6;
  void *v7;

  extraIvars = self->_extraIvars;
  if (!extraIvars)
  {
    -[NSPropertyDescription _initializeExtraIVars](self, "_initializeExtraIVars");
    extraIvars = self->_extraIvars;
  }
  extraIvars->var4 = a3;
  if (a3)
  {
    if (objc_msgSend(a3, "_namespace"))
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), objc_msgSend(a3, "_namespace"), objc_msgSend(a3, "name"));
    else
      v6 = objc_msgSend(a3, "name");
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  -[NSPropertyDescription _setNamespace:](self, v7);
}

- (void)setRenamingIdentifier:(NSString *)renamingIdentifier
{
  id *p_var0;
  _NSExtraPropertyIVars **p_extraIvars;
  _NSExtraPropertyIVars *extraIvars;
  uint64_t v8;
  _NSExtraPropertyIVars **v9;

  if (!renamingIdentifier
    || -[NSString isNSString](renamingIdentifier, "isNSString")
    && -[NSString isEqualToString:](-[NSPropertyDescription name](self, "name"), "isEqualToString:", renamingIdentifier))
  {
    extraIvars = self->_extraIvars;
    p_extraIvars = &self->_extraIvars;
    p_var0 = &extraIvars->var0;
    if (!extraIvars)
      return;

    v8 = 0;
    v9 = p_extraIvars;
  }
  else
  {
    v9 = &self->_extraIvars;
    if (!self->_extraIvars)
      -[NSPropertyDescription _initializeExtraIVars](self, "_initializeExtraIVars");
    v8 = -[NSString copy](renamingIdentifier, "copy");
  }
  (*v9)->var0 = (id)v8;
}

void __39__NSPropertyDescription_initWithCoder___block_invoke(uint64_t a1)
{

}

- (NSPropertyDescription)init
{
  return (NSPropertyDescription *)-[NSPropertyDescription _initWithName:](self, "_initWithName:", 0);
}

- (NSArray)validationWarnings
{
  if (self->_validationWarnings)
    return self->_validationWarnings;
  else
    return (NSArray *)NSArray_EmptyArray;
}

- (NSArray)validationPredicates
{
  if (self->_validationPredicates)
    return self->_validationPredicates;
  else
    return (NSArray *)NSArray_EmptyArray;
}

- (void)setIndexed:(BOOL)indexed
{
  NSEntityDescription *entity;
  __int16 v5;

  entity = self->_entity;
  if (entity)
  {
    -[NSEntityDescription _addIndexForProperty:]((uint64_t)entity, self);
  }
  else
  {
    if (indexed)
      v5 = 8;
    else
      v5 = 0;
    *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFF7 | v5;
  }
}

- (unint64_t)hash
{
  return -[NSString hash](-[NSPropertyDescription name](self, "name"), "hash");
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __CFString *name;
  const char *CStringPtr;
  CC_LONG v12;
  NSString *versionHashModifier;
  const char *v14;
  CC_LONG v15;
  __int16 data;
  CC_SHA256_CTX c;

  memset(&c, 0, sizeof(c));
  v6 = -[NSPropertyDescription isOptional](self, "isOptional", a3, a4);
  if (-[NSPropertyDescription isTransient](self, "isTransient"))
    v7 = 2;
  else
    v7 = 0;
  v8 = v7 | v6;
  if (-[NSPropertyDescription isReadOnly](self, "isReadOnly"))
    v9 = 4;
  else
    v9 = 0;
  data = v8 | v9;
  CC_SHA256_Init(&c);
  name = (__CFString *)self->_name;
  if (!name)
  {
LABEL_10:
    CStringPtr = (const char *)-[__CFString UTF8String](name, "UTF8String");
    if (!CStringPtr)
      goto LABEL_12;
    goto LABEL_11;
  }
  CStringPtr = CFStringGetCStringPtr(name, 0x8000100u);
  if (!CStringPtr)
  {
    name = (__CFString *)self->_name;
    goto LABEL_10;
  }
LABEL_11:
  v12 = strlen(CStringPtr);
  CC_SHA256_Update(&c, CStringPtr, v12);
LABEL_12:
  CC_SHA256_Update(&c, &data, 2u);
  versionHashModifier = self->_versionHashModifier;
  if (versionHashModifier)
  {
    v14 = CFStringGetCStringPtr((CFStringRef)versionHashModifier, 0x8000100u);
    if (!v14)
      v14 = -[NSString UTF8String](self->_versionHashModifier, "UTF8String");
    v15 = strlen(v14);
    CC_SHA256_Update(&c, v14, v15);
  }
  CC_SHA256_Final((unsigned __int8 *)a3, &c);
}

- (BOOL)isReadOnly
{
  return *(_WORD *)&self->_propertyDescriptionFlags & 1;
}

- (BOOL)_isEditable
{
  NSEntityDescription *entity;

  entity = self->_entity;
  return !entity || -[NSEntityDescription _isEditable](entity, "_isEditable");
}

- (void)dealloc
{
  _NSExtraPropertyIVars *extraIvars;
  _NSExtraPropertyIVars *v4;
  _NSExtraPropertyIVars *v5;
  malloc_zone_t *v6;
  objc_super v7;

  extraIvars = self->_extraIvars;
  if (extraIvars)
  {

    v4 = self->_extraIvars;
    v4->var0 = 0;

    v5 = self->_extraIvars;
    v5->var3 = 0;
    v5->var4 = 0;
    if ((*(_WORD *)&self->_propertyDescriptionFlags & 0x80) == 0)
    {
      v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone)
      {
        v6 = malloc_default_zone();
        v5 = self->_extraIvars;
      }
      malloc_zone_free(v6, v5);
    }
    self->_extraIvars = 0;
  }

  self->_entity = 0;
  self->_name = 0;

  self->_validationPredicates = 0;
  self->_validationWarnings = 0;

  self->_userInfo = 0;
  self->_versionHash = 0;

  self->_versionHashModifier = 0;
  v7.receiver = self;
  v7.super_class = (Class)NSPropertyDescription;
  -[NSPropertyDescription dealloc](&v7, sel_dealloc);
}

+ (void)initialize
{
  objc_opt_self();
  objc_opt_class();
}

- (void)setReadOnly:(BOOL)a3
{
  __int16 v3;

  v3 = a3;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFFE | v3;
}

- (void)setName:(NSString *)name
{
  NSEntityDescription *v5;
  NSEntityDescription *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self->_name != name)
  {
    v5 = -[NSPropertyDescription entity](self, "entity");
    v6 = v5;
    if (v5
      && -[NSDictionary objectForKey:](-[NSEntityDescription propertiesByName](v5, "propertiesByName"), "objectForKey:", name)&& !-[NSPropertyDescription superCompositeAttribute](self, "superCompositeAttribute"))
    {
LABEL_17:
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't change name of property from %@ to %@"), self->_name, name), 0));
    }
    if (-[NSPropertyDescription superCompositeAttribute](self, "superCompositeAttribute"))
    {
      v7 = (void *)objc_msgSend(-[NSPropertyDescription superCompositeAttribute](self, "superCompositeAttribute"), "elements");
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11), "name"), "isEqualToString:", name) & 1) != 0)goto LABEL_17;
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

      self->_name = (NSString *)-[NSString copy](name, "copy");
    }
    else
    {
      -[NSEntityDescription _removeProperty:]((uint64_t)v6, self);

      self->_name = (NSString *)-[NSString copy](name, "copy");
      -[NSEntityDescription _addProperty:](v6, "_addProperty:", self);
    }
  }
}

- (void)_throwIfNotEditable
{
  -[NSEntityDescription _throwIfNotEditable](self->_entity, "_throwIfNotEditable");
}

- (BOOL)_isTriggerBacked
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 13) & 1;
}

- (BOOL)_epsilonEquals:(id)a3 rhs:(id)a4 withFlags:(int)a5
{
  if (a3 == a4)
    return 1;
  else
    return objc_msgSend(a3, "isEqual:", a4);
}

- (BOOL)_isEqual:(id)a3 skipIndexCheck:(BOOL)a4
{
  unint64_t v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  NSDictionary *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;

  if (a3 == self)
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  if (!a3)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  v7 = -[NSPropertyDescription _propertyType](self, "_propertyType");
  if (v7 != objc_msgSend(a3, "_propertyType"))
    goto LABEL_16;
  v8 = -[NSPropertyDescription name](self, "name");
  v9 = objc_msgSend(a3, "name");
  if (v8 == (NSString *)v9
    || (v10 = v9, LOBYTE(v9) = 0, v8) && v10 && (LODWORD(v9) = -[NSString isEqual:](v8, "isEqual:"), (_DWORD)v9))
  {
    v11 = -[NSPropertyDescription isOptional](self, "isOptional");
    if (v11 != objc_msgSend(a3, "isOptional")
      || (v12 = -[NSPropertyDescription isTransient](self, "isTransient"),
          v12 != objc_msgSend(a3, "isTransient"))
      || (v13 = -[NSPropertyDescription _allowsCloudEncryption](self, "_allowsCloudEncryption"),
          v13 != objc_msgSend(a3, "_allowsCloudEncryption"))
      || !a4
      && (v14 = -[NSPropertyDescription isIndexed](self, "isIndexed"), v14 != objc_msgSend(a3, "isIndexed"))|| (v15 = -[NSPropertyDescription isIndexedBySpotlight](self, "isIndexedBySpotlight"), v15 != objc_msgSend(a3, "isIndexedBySpotlight"))|| (v16 = -[NSPropertyDescription isStoredInExternalRecord](self, "isStoredInExternalRecord"), v16 != objc_msgSend(a3, "isStoredInExternalRecord")))
    {
LABEL_16:
      LOBYTE(v9) = 0;
      return v9;
    }
    v17 = -[NSPropertyDescription userInfo](self, "userInfo");
    v9 = objc_msgSend(a3, "userInfo");
    if (v17 == (NSDictionary *)v9
      || (v18 = v9, LOBYTE(v9) = 0, v17) && v18 && (LODWORD(v9) = -[NSDictionary isEqual:](v17, "isEqual:"), (_DWORD)v9))
    {
      v19 = -[NSPropertyDescription versionHashModifier](self, "versionHashModifier");
      v9 = objc_msgSend(a3, "versionHashModifier");
      if (v19 == (NSString *)v9
        || (v20 = v9, LOBYTE(v9) = 0, v19) && v20 && (LODWORD(v9) = -[NSString isEqual:](v19, "isEqual:"), (_DWORD)v9))
      {
        LOBYTE(v9) = -[NSPropertyDescription _comparePredicatesAndWarnings:](self, "_comparePredicatesAndWarnings:", a3);
      }
    }
  }
  return v9;
}

- (int)_encodedPropertyFlagsForFlags:(int)a3
{
  return a3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  NSString *v6;
  NSArray *v7;
  NSArray *v8;
  NSDictionary *v9;
  NSString *v10;

  if (-[NSPropertyDescription isOptional](self, "isOptional"))
  {
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSIsOptional"));
    v5 = 3;
  }
  else
  {
    v5 = 1;
  }
  if (-[NSPropertyDescription isReadOnly](self, "isReadOnly"))
  {
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSIsReadOnly"));
    v5 = v5 | 4;
  }
  if (-[NSPropertyDescription isTransient](self, "isTransient"))
  {
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSIsTransient"));
    v5 = v5 | 8;
  }
  if (-[NSPropertyDescription isIndexedBySpotlight](self, "isIndexedBySpotlight"))
  {
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSIndexedBySpotlight"));
    v5 = v5 | 0x100;
  }
  if (-[NSPropertyDescription isStoredInExternalRecord](self, "isStoredInExternalRecord"))
  {
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSIsStoredInTruth"));
    v5 = v5 | 0x200;
  }
  if (-[NSPropertyDescription _isOrdered](self, "_isOrdered"))
  {
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSIsOrdered"));
    v5 = v5 | 0x400;
  }
  if (-[NSPropertyDescription _allowsCloudEncryption](self, "_allowsCloudEncryption"))
  {
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSAllowsCloudEncryption"));
    v5 = v5 | 0x800;
  }
  v6 = -[NSPropertyDescription renamingIdentifier](self, "renamingIdentifier");
  if (v6)
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NSRenamingIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSPropertyDescription name](self, "name"), CFSTR("NSPropertyName"));
  objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSPropertyDescription entity](self, "entity"), CFSTR("NSEntity"));
  v7 = -[NSPropertyDescription validationPredicates](self, "validationPredicates");
  if (-[NSArray count](v7, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("NSValidationPredicates"));
  else
    v5 = v5 | 0x10;
  v8 = -[NSPropertyDescription validationWarnings](self, "validationWarnings");
  if (-[NSArray count](v8, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", v8, CFSTR("NSValidationWarnings"));
  else
    v5 = v5 | 0x20;
  v9 = -[NSPropertyDescription userInfo](self, "userInfo");
  if (-[NSDictionary count](v9, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", v9, CFSTR("NSUserInfo"));
  else
    v5 = v5 | 0x40;
  v10 = -[NSPropertyDescription versionHashModifier](self, "versionHashModifier");
  if (-[NSString length](v10, "length"))
    objc_msgSend(a3, "encodeObject:forKey:", v10, CFSTR("NSVersionHashModifier"));
  else
    v5 = v5 | 0x80;
  objc_msgSend(a3, "encodeInt32:forKey:", -[NSPropertyDescription _encodedPropertyFlagsForFlags:](self, "_encodedPropertyFlagsForFlags:", v5), CFSTR("_P"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  return -[NSPropertyDescription _isEqual:skipIndexCheck:](self, "_isEqual:skipIndexCheck:", a3, 0);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSPropertyDescription;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@), name %@, isOptional %d, isTransient %d, entity %@, renamingIdentifier %@, validation predicates %@, warnings %@, versionHashModifier %@\n userInfo %@"), -[NSPropertyDescription description](&v3, sel_description), -[NSPropertyDescription name](self, "name"), -[NSPropertyDescription isOptional](self, "isOptional"), -[NSPropertyDescription isTransient](self, "isTransient"), -[NSEntityDescription name](-[NSPropertyDescription entity](self, "entity"), "name"), -[NSPropertyDescription renamingIdentifier](self, "renamingIdentifier"), -[NSPropertyDescription validationPredicates](self, "validationPredicates"), -[NSPropertyDescription validationWarnings](self, "validationWarnings"), -[NSPropertyDescription versionHashModifier](self, "versionHashModifier"), -[NSPropertyDescription userInfo](self, "userInfo"));
}

- (BOOL)isIndexed
{
  NSEntityDescription *entity;
  int v4;
  __int16 v5;

  entity = self->_entity;
  if (entity)
  {
    v4 = -[NSEntityDescription _hasIndexForProperty:]((uint64_t)entity, self);
    if (!-[NSPropertyDescription _isEditable](self, "_isEditable"))
    {
      if (v4)
        v5 = 8;
      else
        v5 = 0;
      *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFF7 | v5;
    }
  }
  else
  {
    return (*(_WORD *)&self->_propertyDescriptionFlags >> 3) & 1;
  }
  return v4;
}

- (void)setOptional:(BOOL)optional
{
  _BOOL4 v3;
  __int16 v5;

  v3 = optional;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3)
    v5 = 4;
  else
    v5 = 0;
  *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFFB | v5;
}

- (void)setTransient:(BOOL)transient
{
  _BOOL4 v3;
  __int16 v5;

  v3 = transient;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3)
    v5 = 2;
  else
    v5 = 0;
  *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFFD | v5;
}

- (void)setValidationPredicates:(NSArray *)validationPredicates withValidationWarnings:(NSArray *)validationWarnings
{
  NSUInteger v7;
  NSArray *v8;
  NSArray *v9;

  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  v7 = -[NSArray count](validationPredicates, "count");
  if (v7 != -[NSArray count](validationWarnings, "count"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Mismatch between length of validation predicates and warnings"), 0));
  v8 = self->_validationPredicates;
  if (v8 != validationPredicates)
  {

    self->_validationPredicates = (NSArray *)-[NSArray copy](validationPredicates, "copy");
  }
  v9 = self->_validationWarnings;
  if (v9 != validationWarnings)
  {

    self->_validationWarnings = (NSArray *)-[NSArray copy](validationWarnings, "copy");
  }
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  NSMutableDictionary *v5;

  objc_sync_enter(self);
  v5 = self->_userInfo;
  if (v5 != (NSMutableDictionary *)userInfo)
  {

    self->_userInfo = (NSMutableDictionary *)-[NSDictionary copy](userInfo, "copy");
  }
  objc_sync_exit(self);
}

- (NSData)versionHash
{
  NSData *versionHash;
  unint64_t *p_versionHash;
  NSData *v5;
  NSData *v6;
  _BYTE v9[32];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  p_versionHash = (unint64_t *)&self->_versionHash;
  versionHash = self->_versionHash;
  if (versionHash)
  {
LABEL_9:
    v6 = versionHash;
    return v6;
  }
  -[NSPropertyDescription _versionHash:inStyle:](self, "_versionHash:inStyle:", v9, 0);
  v5 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v9, 32);
  if (!-[NSPropertyDescription _isEditable](self, "_isEditable"))
  {
    while (!__ldaxr(p_versionHash))
    {
      if (!__stlxr((unint64_t)v5, p_versionHash))
        goto LABEL_8;
    }
    __clrex();

LABEL_8:
    versionHash = (NSData *)*p_versionHash;
    goto LABEL_9;
  }
  v6 = v5;
  return v6;
}

- (NSString)versionHashModifier
{
  return self->_versionHashModifier;
}

- (void)setVersionHashModifier:(NSString *)versionHashModifier
{
  NSString *v5;

  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_versionHashModifier;
  if (v5 != versionHashModifier)
  {

    self->_versionHashModifier = (NSString *)-[NSString copy](versionHashModifier, "copy");
  }
}

- (void)setIndexedBySpotlight:(BOOL)indexedBySpotlight
{
  _BOOL4 v3;
  __int16 v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  _QWORD v9[2];

  v3 = indexedBySpotlight;
  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[NSPropertyDescription _propertyType](self, "_propertyType") == 7)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99768];
    v8 = CFSTR("attribute");
    v9[0] = -[NSPropertyDescription name](self, "name");
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, CFSTR("A composite attribute type cannot be indexed by spotlight."), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)));
  }
  if (v3)
    v5 = 32;
  else
    v5 = 0;
  *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFDF | v5;
}

- (void)setStoredInExternalRecord:(BOOL)storedInExternalRecord
{
  __int16 v3;

  if (storedInExternalRecord)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFBF | v3;
}

- (__CFString)_rootName
{
  void *v1;

  if (result)
  {
    v1 = (void *)-[__CFString _namespace](result, "_namespace");
    if (v1)
      return (__CFString *)objc_msgSend((id)objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(".")), "firstObject");
    else
      return &stru_1E1EE23F0;
  }
  return result;
}

- (__CFString)_elementPath
{
  __CFString *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    v2 = (void *)-[__CFString _namespace](result, "_namespace");
    if (v2)
    {
      v3 = v2;
      v4 = objc_msgSend(v2, "rangeOfString:", CFSTR("."));
      if ((unint64_t)(v4 - 1) > 0x7FFFFFFFFFFFFFFDLL)
      {
        return (__CFString *)-[__CFString name](v1, "name");
      }
      else
      {
        v5 = objc_msgSend(v3, "substringFromIndex:", v4 + 1);
        return (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v5, -[__CFString name](v1, "name"));
      }
    }
    else
    {
      return &stru_1E1EE23F0;
    }
  }
  return result;
}

- (BOOL)_isSchemaEqual:(id)a3
{
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL result;

  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[NSPropertyDescription name](self, "name");
  v6 = objc_msgSend(a3, "name");
  if (v5 == (NSString *)v6)
    return 1;
  v7 = v6;
  result = 0;
  if (v5)
  {
    if (v7)
      return -[NSString isEqual:](v5, "isEqual:");
  }
  return result;
}

- (unint64_t)_propertyType
{
  return 0;
}

- (BOOL)_isEqualWithoutIndex:(id)a3
{
  return -[NSPropertyDescription _isEqual:skipIndexCheck:](self, "_isEqual:skipIndexCheck:", a3, 1);
}

- (BOOL)_isToManyRelationship
{
  return 0;
}

- (void)_setEntity:(id)a3
{
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_entity = (NSEntityDescription *)a3;
}

- (void)_setOrdered:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFEFF | v3;
}

- (BOOL)_comparePredicatesAndWarnings:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v5 = -[NSPropertyDescription _rawValidationPredicates](self, "_rawValidationPredicates");
  v6 = objc_msgSend(a3, "_rawValidationPredicates");
  if (v5 == (id)v6 || (v7 = v6, LOBYTE(v6) = 0, v5) && v7 && (LODWORD(v6) = objc_msgSend(v5, "isEqual:"), (_DWORD)v6))
  {
    v8 = -[NSPropertyDescription _rawValidationWarnings](self, "_rawValidationWarnings");
    v6 = objc_msgSend(a3, "_rawValidationWarnings");
    if (v8 == (id)v6)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      v9 = v6;
      LOBYTE(v6) = 0;
      if (v8 && v9)
        LOBYTE(v6) = objc_msgSend(v8, "isEqual:");
    }
  }
  return v6;
}

- (void)_stripForMigration
{
  *(_WORD *)&self->_propertyDescriptionFlags |= 0x10u;
}

- (void)_restoreValidation
{
  *(_WORD *)&self->_propertyDescriptionFlags &= ~0x10u;
}

- (BOOL)_skipValidation
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 4) & 1;
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)_appendPropertyFieldsToData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8
{
  unsigned int v14;

  _writeInt32IntoData(a3, -[NSPropertyDescription _propertyType](self, "_propertyType", a3, a4));
  _writeInt32IntoData(a3, *(_DWORD *)&self->_propertyDescriptionFlags);
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a6, "valueForKey:", self->_versionHashModifier), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a7, "objectForKey:", self->_versionHash), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, objc_msgSend(a8, "indexForKey:", -[NSEntityDescription name](self->_entity, "name")));
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", self->_name), "unsignedIntegerValue"));
  if (-[NSArray count](self->_validationWarnings, "count"))
  {
    _writeInt32IntoData(a3, 1u);
    _writePFEncodedArrayShapeIntoData(a3, self->_validationPredicates, a7, 0);
    _writePFEncodedArrayShapeIntoData(a3, self->_validationWarnings, a6, a7);
  }
  else
  {
    _writeInt32IntoData(a3, 0);
  }
  if (self->_extraIvars)
  {
    _writeInt32IntoData(a3, 1u);
    if (self->_extraIvars->var0)
    {
      _writeInt32IntoData(a3, 1u);
      _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a6, "objectForKey:", self->_extraIvars->var0), "unsignedIntegerValue"));
    }
    else
    {
      _writeInt64IntoData(a3, 0);
    }
    _writeInt64IntoData(a3, self->_extraIvars->var1);
    _writeInt64IntoData(a3, self->_extraIvars->var2);
  }
  else
  {
    _writeInt32IntoData(a3, 0);
  }
  if (self->_userInfo)
    v14 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  else
    v14 = 0;
  _writeInt32IntoData(a3, v14);
  _writeInt32IntoData(a3, -[NSPropertyDescription _entitysReferenceID](self, "_entitysReferenceID"));
}

@end
