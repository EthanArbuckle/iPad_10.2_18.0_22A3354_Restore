@implementation NSAttributeDescription

- (id)validationWarnings
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  NSAttributeType v7;
  void *v8;
  uint64_t v9;
  objc_super v11;
  objc_super v12;

  v3 = -[NSPropertyDescription _hasMinValueInExtraIvars](self, "_hasMinValueInExtraIvars");
  v4 = -[NSPropertyDescription _hasMaxValueInExtraIvars](self, "_hasMaxValueInExtraIvars");
  v5 = v4;
  if (!v3 && !v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)NSAttributeDescription;
    return -[NSPropertyDescription validationWarnings](&v11, sel_validationWarnings);
  }
  v12.receiver = self;
  v12.super_class = (Class)NSAttributeDescription;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[NSPropertyDescription validationWarnings](&v12, sel_validationWarnings));
  v7 = -[NSAttributeDescription attributeType](self, "attributeType");
  if ((uint64_t)v7 <= 399)
  {
    if (v7 != NSInteger16AttributeType && v7 != NSInteger32AttributeType && v7 != NSInteger64AttributeType)
    {
LABEL_12:
      if (v3)
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1640));
      if (v5)
      {
        v8 = (void *)MEMORY[0x1E0CB37E8];
        v9 = 1630;
LABEL_22:
        objc_msgSend(v6, "addObject:", objc_msgSend(v8, "numberWithInteger:", v9));
        return v6;
      }
      return v6;
    }
  }
  else if ((uint64_t)v7 > 599)
  {
    if (v7 == NSStringAttributeType)
    {
      if (v3)
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1670));
      if (v5)
      {
        v8 = (void *)MEMORY[0x1E0CB37E8];
        v9 = 1660;
        goto LABEL_22;
      }
      return v6;
    }
    if (v7 != NSFloatAttributeType)
      goto LABEL_12;
  }
  else if (v7 != NSDecimalAttributeType && v7 != NSDoubleAttributeType)
  {
    goto LABEL_12;
  }
  if (v3)
    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1620));
  if (v5)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = 1610;
    goto LABEL_22;
  }
  return v6;
}

- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6
{
  uint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _NSExtraPropertyIVars *v14;
  uint64_t v15;
  unsigned int type;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  unint64_t v26;
  uint64_t v27;
  UniChar *v28;
  uint64_t v30;
  objc_super v31;
  uint64_t v32;
  CFRange v33;

  v32 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)NSAttributeDescription;
  LODWORD(v10) = -[NSPropertyDescription _nonPredicateValidateValue:forKey:inObject:error:](&v31, sel__nonPredicateValidateValue_forKey_inObject_error_, a3, a4);
  if (!(_DWORD)v10)
    return v10;
  if (!*a3)
  {
    LOBYTE(v10) = 1;
    return v10;
  }
  v11 = -[NSPropertyDescription _hasMaxValueInExtraIvars](self, "_hasMaxValueInExtraIvars");
  v12 = -[NSPropertyDescription _hasMinValueInExtraIvars](self, "_hasMinValueInExtraIvars");
  v13 = v12;
  if (v11 || v12 || self->_type == 700)
  {
    v14 = -[NSPropertyDescription _extraIVars](self, "_extraIVars");
    v15 = 0;
    type = self->_type;
    if (type > 0x1F3)
    {
      if (self->_type <= 0x2BBu)
      {
        if (type != 500 && type != 600)
          goto LABEL_42;
        goto LABEL_19;
      }
      if (type == 700)
      {
        if (v11)
        {
          if (objc_msgSend(*a3, "length") <= v14->var2)
            v15 = 0;
          else
            v15 = 1660;
        }
        else
        {
          v15 = 0;
        }
        if (v13 && objc_msgSend(*a3, "length") < v14->var1)
          v15 = 1670;
        v26 = objc_msgSend(*a3, "length");
        if (CFStringGetCharactersPtr((CFStringRef)*a3))
        {
          if (CFStringEncodingUnicodeToBytes())
            v15 = 1671;
        }
        else
        {
          MEMORY[0x1E0C80A78]();
          v28 = (UniChar *)((char *)&v30 - v27);
          if (v26 >= 0x80)
            v28 = (UniChar *)malloc_type_malloc(4 * v26, 0x49586F69uLL);
          v33.location = 0;
          v33.length = v26;
          CFStringGetCharacters((CFStringRef)*a3, v33, v28);
          if (CFStringEncodingUnicodeToBytes())
            v15 = 1671;
          if (v26 >= 0x80)
            free(v28);
        }
        goto LABEL_42;
      }
      if (type == 900)
      {
        if (v11)
        {
          objc_msgSend(*a3, "timeIntervalSinceReferenceDate");
          v15 = v18 <= *(double *)&v14->var2 ? 0 : 1630;
        }
        else
        {
          v15 = 0;
        }
        if (v13)
        {
          objc_msgSend(*a3, "timeIntervalSinceReferenceDate");
          v20 = v25 < *(double *)&v14->var1;
          v21 = 1640;
LABEL_40:
          if (v20)
            v15 = v21;
        }
      }
    }
    else
    {
      if (self->_type <= 0x12Bu)
      {
        if (type != 100 && type != 200)
          goto LABEL_42;
        goto LABEL_23;
      }
      if (type == 300)
      {
LABEL_23:
        if (v11)
        {
          if (objc_msgSend(*a3, "longLongValue") <= v14->var2)
            v15 = 0;
          else
            v15 = 1610;
        }
        else
        {
          v15 = 0;
        }
        if (!v13)
          goto LABEL_42;
        v20 = objc_msgSend(*a3, "longLongValue") < v14->var1;
        goto LABEL_39;
      }
      if (type == 400)
      {
LABEL_19:
        if (v11)
        {
          objc_msgSend(*a3, "doubleValue");
          if (v17 <= *(double *)&v14->var2)
            v15 = 0;
          else
            v15 = 1610;
        }
        else
        {
          v15 = 0;
        }
        if (!v13)
          goto LABEL_42;
        objc_msgSend(*a3, "doubleValue");
        v20 = v19 < *(double *)&v14->var1;
LABEL_39:
        v21 = 1620;
        goto LABEL_40;
      }
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_42:
  if (-[NSAttributeDescription attributeType](self, "attributeType") == NSURIAttributeType)
  {
    v22 = objc_msgSend(*a3, "absoluteString");
    v23 = 1560;
    if (!v15)
      v23 = 1690;
    if (!v22)
      v15 = v23;
  }
  LOBYTE(v10) = v15 == 0;
  if (a6 && v15)
  {
    if (a5)
      v10 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]((uint64_t)a5, v15, 0, (uint64_t)-[NSPropertyDescription name](self, "name"), (uint64_t)*a3, 0);
    else
      v10 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], v15, 0);
    v24 = (void *)v10;
    LOBYTE(v10) = 0;
    *a6 = v24;
  }
  return v10;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSAttributeType)attributeType
{
  return (unint64_t)self->_type;
}

- (BOOL)_isAttribute
{
  return 1;
}

- (BOOL)usesMergeableStorage
{
  Class v3;
  Class v4;

  if (-[NSAttributeDescription attributeType](self, "attributeType") == NSTransformableAttributeType
    && -[NSAttributeDescription valueTransformerName](self, "valueTransformerName")
    && -[NSAttributeDescription attributeValueClassName](self, "attributeValueClassName")
    && (v3 = NSClassFromString(-[NSAttributeDescription attributeValueClassName](self, "attributeValueClassName"))) != 0
    && (v4 = v3, (objc_opt_respondsToSelector() & 1) != 0)
    && -[objc_class supportsSecureCoding](v4, "supportsSecureCoding")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    return -[objc_class supportsMergeableTransformable](v4, "supportsMergeableTransformable");
  }
  else
  {
    return 0;
  }
}

- (unint64_t)_propertyType
{
  return 2;
}

- (void)_createCachesAndOptimizeState
{
  id v3;
  int v4;
  NSString *valueTransformerName;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  _NSExtraPropertyIVars *v27;
  unsigned int type;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSString *v33;
  void *v34;
  NSString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)NSAttributeDescription;
  -[NSPropertyDescription _createCachesAndOptimizeState](&v42, sel__createCachesAndOptimizeState);
  v3 = -[NSDictionary objectForKey:](-[NSEntityDescription propertiesByName](-[NSEntityDescription superentity](-[NSPropertyDescription entity](self, "entity"), "superentity"), "propertiesByName"), "objectForKey:", -[NSPropertyDescription name](self, "name"));
  if (v3)
  {
    v4 = objc_msgSend(v3, "allowsCloudEncryption");
    if (v4 != -[NSAttributeDescription allowsCloudEncryption](self, "allowsCloudEncryption"))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@ - Encryption must also be applied to all inherited attributes from the parent entity (%@)"), -[NSEntityDescription name](-[NSPropertyDescription entity](self, "entity"), "name"), -[NSPropertyDescription name](self, "name"), -[NSEntityDescription name](-[NSEntityDescription superentity](-[NSPropertyDescription entity](self, "entity"), "superentity"), "name")), 0));
  }
  if (self->_type == 1800)
  {
    valueTransformerName = self->_valueTransformerName;
    if (-[NSString length](valueTransformerName, "length")
      && !objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", valueTransformerName))
    {
      if (-[NSString isEqualToString:](valueTransformerName, "isEqualToString:", CFSTR("NSSecureUnarchiveFromDataTransformerName")))
      {
        self->_valueTransformerName = (NSString *)*MEMORY[0x1E0CB3188];
      }
      else if (!PFUseToolchainBehaviors())
      {
        v6 = self->_valueTransformerName;
        -[NSPropertyDescription name](self, "name");
        -[NSEntityDescription name](-[NSPropertyDescription entity](self, "entity"), "name");
        _NSCoreDataLog(5, (uint64_t)CFSTR("no NSValueTransformer with class name '%@' was found for attribute '%@' on entity '%@'"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
      }
    }
    if (!PFUseToolchainBehaviors())
    {
      v33 = self->_valueTransformerName;
      if (!v33
        || -[NSString isEqualToString:](self->_valueTransformerName, "isEqualToString:", *MEMORY[0x1E0CB3378])
        || -[NSString isEqualToString:](v33, "isEqualToString:", *MEMORY[0x1E0CB2CD8]))
      {
        v34 = (void *)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        if ((objc_msgSend(CFSTR("xctest"), "isEqual:", objc_msgSend(v34, "processName")) & 1) != 0
          || (objc_msgSend(CFSTR("cplctl"), "isEqual:", objc_msgSend(v34, "processName")) & 1) != 0)
        {
          return;
        }
        if (_createCachesAndOptimizeState_token != -1)
          dispatch_once(&_createCachesAndOptimizeState_token, &__block_literal_global_236);
        v35 = -[NSPropertyDescription name](self, "name");
        -[NSEntityDescription name](-[NSPropertyDescription entity](self, "entity"), "name");
        _NSCoreDataLog(5, (uint64_t)CFSTR("Property '%@' on Entity '%@' is using nil or an insecure NSValueTransformer.  Please switch to using \"%@\" or a subclass of NSSecureUnarchiveFromDataTransformer instead."), v36, v37, v38, v39, v40, v41, (uint64_t)v35);
      }
    }
  }
  v13 = -[NSDictionary objectForKey:](-[NSPropertyDescription userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSTriggerKey"));
  if (objc_msgSend(v13, "isNSString") && objc_msgSend(v13, "length"))
    *(_WORD *)&self->super._propertyDescriptionFlags |= 0x2000u;
  v14 = -[NSAttributeDescription validationWarnings](self, "validationWarnings");
  v15 = objc_msgSend(v14, "count");
  if (v15)
  {
    v16 = v15;
    v17 = -[NSAttributeDescription validationPredicates](self, "validationPredicates");
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0;
    while (1)
    {
      v21 = (void *)objc_msgSend(v17, "objectAtIndex:", v20);
      v22 = (void *)objc_msgSend(v14, "objectAtIndex:", v20);
      v23 = -[NSAttributeDescription _canConvertPredicate:andWarning:]((uint64_t)self, v21, v22);
      if (v23)
      {
        v24 = v23;
        if (v23 <= 0)
          v25 = 1024;
        else
          v25 = 512;
        *(_WORD *)&self->super._propertyDescriptionFlags |= v25;
        v26 = (void *)objc_msgSend((id)objc_msgSend(v21, "rightExpression"), "constantValue");
        v27 = -[NSPropertyDescription _extraIVars](self, "_extraIVars");
        type = self->_type;
        if (type > 0x12B)
        {
          if (type == 700 || type == 300)
          {
LABEL_27:
            if (v24 <= 0)
              v29 = 8;
            else
              v29 = 16;
            *(id *)((char *)&v27->var0 + v29) = (id)objc_msgSend(v26, "longLongValue");
            goto LABEL_35;
          }
        }
        else if (type == 100 || type == 200)
        {
          goto LABEL_27;
        }
        if (v24 <= 0)
          v30 = 8;
        else
          v30 = 16;
        objc_msgSend(v26, "doubleValue");
        *(id *)((char *)&v27->var0 + v30) = v31;
      }
      else
      {
        objc_msgSend(v18, "addObject:", v21);
        objc_msgSend(v19, "addObject:", v22);
      }
LABEL_35:
      if (v16 == ++v20)
      {
        v32 = objc_msgSend(v14, "count");
        if (v32 == objc_msgSend(v19, "count"))
        {

        }
        else
        {
          -[NSPropertyDescription _replaceValidationPredicates:andWarnings:](self, "_replaceValidationPredicates:andWarnings:", v18, v19);
        }
        return;
      }
    }
  }
}

- (NSString)attributeValueClassName
{
  return self->_attributeValueClassName;
}

- (NSString)valueTransformerName
{
  return self->_valueTransformerName;
}

- (uint64_t)_canConvertPredicate:(void *)a3 andWarning:
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (result)
  {
    v4 = result;
    if (!objc_msgSend(a3, "isNSNumber"))
      return 0;
    result = 0;
    v5 = *(unsigned __int16 *)(v4 + 80);
    if (v5 > 0x1F3)
    {
      if (*(unsigned __int16 *)(v4 + 80) > 0x2BBu)
      {
        if (v5 == 700)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            return 0;
          v11 = (void *)objc_msgSend(a2, "leftExpression");
          if (objc_msgSend(v11, "expressionType") != 3)
            return 0;
          v8 = objc_msgSend(v11, "keyPath");
          v7 = CFSTR("length");
        }
        else
        {
          if (v5 != 900)
            return result;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            return 0;
          v10 = (void *)objc_msgSend(a2, "leftExpression");
          if (objc_msgSend(v10, "expressionType") != 3)
            return 0;
          v8 = objc_msgSend(v10, "keyPath");
          v7 = CFSTR("timeIntervalSinceReferenceDate");
        }
LABEL_16:
        if (-[__CFString isEqual:](v7, "isEqual:", v8)
          && !objc_msgSend((id)objc_msgSend(a2, "rightExpression"), "expressionType"))
        {
          v9 = objc_msgSend(a2, "predicateOperatorType");
          if (v9 == 3)
            return -1;
          else
            return v9 == 1;
        }
        return 0;
      }
      if (v5 == 500 || v5 == 600)
        goto LABEL_14;
    }
    else
    {
      if (*(unsigned __int16 *)(v4 + 80) <= 0x12Bu)
      {
        if (v5 != 100 && v5 != 200)
          return result;
        goto LABEL_14;
      }
      if (v5 == 300 || v5 == 400)
      {
LABEL_14:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          return 0;
        v6 = objc_msgSend(a2, "leftExpression");
        v7 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
        v8 = v6;
        goto LABEL_16;
      }
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  return -[NSAttributeDescription _isEqual:skipIndexCheck:](self, "_isEqual:skipIndexCheck:", a3, 0);
}

- (Class)_attributeValueClass
{
  objc_class *attributeValueClass;
  void *v4;
  NSString *attributeValueClassName;
  uint64_t v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSString *v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  attributeValueClass = self->_attributeValueClass;
  if (byte_1ECD8DE26)
  {
    if (!attributeValueClass)
    {
      if (!self->_attributeValueClassName
        || (v4 = (void *)MEMORY[0x18D76B4E4](),
            self->_attributeValueClass = (Class)objc_msgSend((id)-[NSAttributeDescription _attributeValueClasses]((id *)&self->super.super.isa), "firstObject"), objc_autoreleasePoolPop(v4), (attributeValueClass = self->_attributeValueClass) == 0))
      {
        attributeValueClass = (objc_class *)objc_opt_class();
        self->_attributeValueClass = attributeValueClass;
      }
    }
  }
  else if (!attributeValueClass)
  {
    attributeValueClassName = self->_attributeValueClassName;
    if (attributeValueClassName)
    {
      attributeValueClass = NSClassFromString(attributeValueClassName);
      self->_attributeValueClass = attributeValueClass;
      if (!attributeValueClass)
      {
        if (byte_1ECD8DE26)
        {
          v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Could not materialize Objective-C class \"%@\" for attribute named \"%@\", property setter will not validate type");
          v8 = self->_attributeValueClassName;
          -[NSPropertyDescription name](self, "name");
          _NSCoreDataLog(17, v7, v9, v10, v11, v12, v13, v14, (uint64_t)v8);
          v15 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v16 = self->_attributeValueClassName;
            *(_DWORD *)buf = 138412546;
            v18 = v16;
            v19 = 2112;
            v20 = -[NSPropertyDescription name](self, "name");
            _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: Could not materialize Objective-C class \"%@\" for attribute named \"%@\", property setter will not validate type", buf, 0x16u);
          }
        }
        attributeValueClass = (objc_class *)objc_opt_class();
        self->_attributeValueClass = attributeValueClass;
      }
    }
    else
    {
      attributeValueClass = 0;
    }
  }
  if (attributeValueClass == (objc_class *)objc_opt_class())
    return 0;
  else
    return self->_attributeValueClass;
}

- (void)setIsFileBackedFuture:(BOOL)a3
{
  _BOOL4 v3;
  __int16 v5;

  v3 = a3;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3)
    v5 = 18432;
  else
    v5 = 0;
  *(_WORD *)&self->super._propertyDescriptionFlags = v5 | *(_WORD *)&self->super._propertyDescriptionFlags & 0xB7FF;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _WORD *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSAttributeDescription;
  v4 = -[NSPropertyDescription copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = (uint64_t)v4;
  if (v4)
  {
    v4[40] = self->_type;
    *((_QWORD *)v4 + 13) = -[NSString copy](self->_attributeValueClassName, "copy");
    *(_QWORD *)(v5 + 112) = self->_defaultValue;
    -[NSAttributeDescription _sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests](v5);
    *(_QWORD *)(v5 + 96) = self->_valueTransformerName;
    if (-[NSPropertyDescription _storeBinaryDataExternally](self, "_storeBinaryDataExternally"))
      *(_WORD *)(v5 + 72) |= 0x800u;
    if (-[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion"))
      *(_WORD *)(v5 + 72) |= 0x1000u;
    if (-[NSAttributeDescription isFileBackedFuture](self, "isFileBackedFuture"))
      *(_WORD *)(v5 + 72) |= 0x4000u;
    if (-[NSAttributeDescription allowsCloudEncryption](self, "allowsCloudEncryption"))
      *(_WORD *)(v5 + 72) |= 0x8000u;
  }
  return (id)v5;
}

- (NSAttributeDescription)initWithCoder:(id)a3
{
  NSAttributeDescription *v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  void *v10;
  Class v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unsigned int type;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)NSAttributeDescription;
  v4 = -[NSPropertyDescription initWithCoder:](&v37, sel_initWithCoder_);
  if (!v4)
    return v4;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("NSValueTransformerName"));
  v4->_valueTransformerName = v7;
  if (v7)
  {
    if (!-[NSString isNSString](v7, "isNSString"))
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB28A8];
      v28 = &unk_1E1F4A430;
LABEL_32:
      objc_msgSend(a3, "failWithError:", objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 4866, v28));

      return 0;
    }
    if (-[NSString isEqualToString:](v4->_valueTransformerName, "isEqualToString:", CFSTR("NSSecureUnarchiveFromDataTransformerName")))
    {

      v4->_valueTransformerName = (NSString *)objc_msgSend((id)*MEMORY[0x1E0CB3188], "copy");
    }
  }
  v4->_type = objc_msgSend(a3, "decodeIntForKey:", CFSTR("NSAttributeType"));
  v8 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSAttributeValueClassName"));
  v4->_attributeValueClassName = v8;
  if (v8 && (-[NSString isNSString](v8, "isNSString") & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB28A8];
    v28 = &unk_1E1F4A458;
    goto LABEL_32;
  }
  v9 = (void *)+[_PFRoutines attributeClassesForSecureCoding]();
  if (v4->_type == 1800)
  {
    v10 = (void *)-[NSAttributeDescription _attributeValueClasses]((id *)&v4->super.super.isa);
    if (!v10)
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = NSClassFromString(v4->_valueTransformerName);
    if (v11)
    {
      v12 = v11;
      if (!-[objc_class instancesRespondToSelector:](v11, "instancesRespondToSelector:", sel_transformedValue_)|| (objc_msgSend(v12, "instancesRespondToSelector:", sel_reverseTransformedValue_) & 1) == 0)
      {
        v13 = -[NSPropertyDescription name](v4, "name");
        -[NSEntityDescription name](-[NSPropertyDescription entity](v4, "entity"), "name");

        v4->_valueTransformerName = (NSString *)objc_msgSend((id)*MEMORY[0x1E0CB3188], "copy");
        v12 = (void *)objc_opt_class();
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v20 = objc_msgSend(v12, "allowedTopLevelClasses");
        if (v20)
          v21 = v20;
        else
          v21 = MEMORY[0x1E0C9AA60];
        objc_msgSend(v10, "addObjectsFromArray:", v21);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v22 = objc_msgSend(v12, "transformedValueClass");
        if (v22)
          objc_msgSend(v10, "addObject:", v22);
      }
    }
    v9 = (void *)objc_msgSend(v9, "setByAddingObjectsFromArray:", v10);
  }
  v4->_defaultValue = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v9, CFSTR("NSDefaultValue"));
  -[NSAttributeDescription _sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests]((uint64_t)v4);
  v23 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSFlagsKey"));
  if (!v23)
    goto LABEL_47;
  v24 = v23 & 2;
  *(_WORD *)&v4->super._propertyDescriptionFlags = *(_WORD *)&v4->super._propertyDescriptionFlags & 0xA1FF | ((v23 & 3) << 9) & 0xA7FF | (((v23 >> 2) & 1) << 11) & 0xAFFF | (((v23 >> 4) & 1) << 12) & 0xBFFF | (((v23 >> 5) & 1) << 14);
  if ((v23 & 1) == 0)
  {
LABEL_36:
    if (!v24)
      goto LABEL_47;
LABEL_37:
    type = v4->_type;
    if (type > 0x12B)
    {
      if (type != 700 && type != 300)
        goto LABEL_46;
    }
    else if (type != 100 && type != 200)
    {
LABEL_46:
      v34 = -[NSPropertyDescription _extraIVars](v4, "_extraIVars");
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSMinValueName"));
      *(_QWORD *)(v34 + 8) = v35;
      goto LABEL_47;
    }
    v31 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NSMinValueName"));
    *(_QWORD *)(-[NSPropertyDescription _extraIVars](v4, "_extraIVars") + 8) = v31;
    goto LABEL_47;
  }
  v25 = v4->_type;
  if (v25 <= 0x12B)
  {
    if (v25 != 100 && v25 != 200)
      goto LABEL_44;
    goto LABEL_35;
  }
  if (v25 == 700 || v25 == 300)
  {
LABEL_35:
    v29 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NSMaxValueName"));
    *(_QWORD *)(-[NSPropertyDescription _extraIVars](v4, "_extraIVars") + 16) = v29;
    goto LABEL_36;
  }
LABEL_44:
  v32 = -[NSPropertyDescription _extraIVars](v4, "_extraIVars");
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSMaxValueName"));
  *(_QWORD *)(v32 + 16) = v33;
  if (v24)
    goto LABEL_37;
LABEL_47:
  if (!-[NSPropertyDescription _isFileBackedFuture](v4, "_isFileBackedFuture")
    && objc_msgSend(-[NSDictionary valueForKey:](-[NSPropertyDescription userInfo](v4, "userInfo"), "valueForKey:", CFSTR("NSIsFileBackedFuture")), "BOOLValue"))
  {
    *(_WORD *)&v4->super._propertyDescriptionFlags |= 0x4800u;
  }
  if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSIsIndexed")))
    -[NSPropertyDescription setIndexed:](v4, "setIndexed:", 1);
  return v4;
}

- (uint64_t)_sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests
{
  uint64_t v1;
  int v2;
  float v3;
  float v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 112);
    if (result)
    {
      result = objc_msgSend((id)result, "isNSNumber");
      if ((_DWORD)result)
      {
        result = objc_msgSend(*(id *)(v1 + 112), "objCType");
        v2 = *(unsigned __int16 *)(v1 + 80);
        if (v2 == 600)
        {
          result = strcmp("d", (const char *)result);
          if ((_DWORD)result)
            return result;
          objc_msgSend(*(id *)(v1 + 112), "doubleValue");
          v7 = v6;

          *(float *)&v8 = v7;
          v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
          goto LABEL_10;
        }
        if (v2 == 500)
        {
          result = strcmp("f", (const char *)result);
          if (!(_DWORD)result)
          {
            objc_msgSend(*(id *)(v1 + 112), "floatValue");
            v4 = v3;

            v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
LABEL_10:
            result = v5;
            *(_QWORD *)(v1 + 112) = result;
          }
        }
      }
    }
  }
  return result;
}

- (id)_rawValidationWarnings
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSAttributeDescription;
  return -[NSPropertyDescription validationWarnings](&v3, sel_validationWarnings);
}

- (id)_rawValidationPredicates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSAttributeDescription;
  return -[NSPropertyDescription validationPredicates](&v3, sel_validationPredicates);
}

- (id)validationPredicates
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  _NSExtraPropertyIVars *v7;
  NSAttributeType v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;
  objc_super v21;

  v3 = -[NSPropertyDescription _hasMinValueInExtraIvars](self, "_hasMinValueInExtraIvars");
  v4 = -[NSPropertyDescription _hasMaxValueInExtraIvars](self, "_hasMaxValueInExtraIvars");
  v5 = v4;
  if (!v3 && !v4)
  {
    v20.receiver = self;
    v20.super_class = (Class)NSAttributeDescription;
    return -[NSPropertyDescription validationPredicates](&v20, sel_validationPredicates);
  }
  v21.receiver = self;
  v21.super_class = (Class)NSAttributeDescription;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[NSPropertyDescription validationPredicates](&v21, sel_validationPredicates));
  v7 = -[NSPropertyDescription _extraIVars](self, "_extraIVars");
  v8 = -[NSAttributeDescription attributeType](self, "attributeType");
  if ((uint64_t)v8 <= 399)
  {
    if (v8 == NSInteger16AttributeType || v8 == NSInteger32AttributeType || v8 == NSInteger64AttributeType)
    {
      if (v3)
      {
        v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7->var1);
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF >= %@"), v9));
      }
      if (!v5)
        goto LABEL_33;
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7->var2);
      goto LABEL_23;
    }
LABEL_28:
    if (v3)
    {
      v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v7->var1);
      objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self >= %@"), v17));
    }
    if (!v5)
      goto LABEL_33;
    v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v7->var2);
    v13 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self =< %@"), v18);
    goto LABEL_32;
  }
  if (v8 != NSDecimalAttributeType)
  {
    if (v8 == NSStringAttributeType)
    {
      if (v3)
      {
        v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7->var1);
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("length >= %@"), v15));
      }
      if (!v5)
        goto LABEL_33;
      v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7->var2);
      v13 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("length =< %@"), v16);
      goto LABEL_32;
    }
    if (v8 == NSDateAttributeType)
    {
      if (v3)
      {
        v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v7->var1);
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("timeIntervalSinceReferenceDate >= %@"), v11));
      }
      if (!v5)
        goto LABEL_33;
      v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v7->var2);
      v13 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("timeIntervalSinceReferenceDate =< %@"), v12);
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  if (v3)
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB3598], "numberWithDouble:", *(double *)&v7->var1);
    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF >= %@"), v14));
  }
  if (!v5)
    goto LABEL_33;
  v10 = objc_msgSend(MEMORY[0x1E0CB3598], "numberWithDouble:", *(double *)&v7->var2);
LABEL_23:
  v13 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF =< %@"), v10);
LABEL_32:
  objc_msgSend(v6, "addObject:", v13);
LABEL_33:
  if (-[NSAttributeDescription attributeType](self, "attributeType") == NSURIAttributeType)
    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_5));
  return v6;
}

- (uint64_t)_attributeValueClasses
{
  NSString *v2;
  Class v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSString *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString *v34;
  Class v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  NSString *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (NSString *)a1[13];
  if (!v2)
    return 0;
  v3 = NSClassFromString(v2);
  if (v3)
    return objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v3);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR("$_"));
  objc_msgSend(v5, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet"));
  objc_msgSend(v5, "invert");
  if (objc_msgSend(v5, "characterIsMember:", objc_msgSend(a1[13], "characterAtIndex:", 0)))
  {
    if (!byte_1ECD8DE26)
      return 0;
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Declared Objective-C type \"%@\" for attribute named %@ is not valid");
    v7 = (uint64_t)a1[13];
    objc_msgSend(a1, "name");
    _NSCoreDataLog(17, v6, v8, v9, v10, v11, v12, v13, v7);
    v14 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      return 0;
    v15 = (NSString *)a1[13];
    *(_DWORD *)buf = 138412546;
    v51 = v15;
    v52 = 2112;
    v53 = objc_msgSend(a1, "name");
    v16 = "CoreData: Declared Objective-C type \"%@\" for attribute named %@ is not valid";
LABEL_9:
    v17 = v14;
    v18 = 22;
LABEL_31:
    _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, v16, buf, v18);
    return 0;
  }
  v19 = (void *)objc_msgSend(a1[13], "componentsSeparatedByCharactersInSet:", v5);
  if (objc_msgSend(v19, "count") == 1
    && objc_msgSend(a1[13], "isEqualToString:", objc_msgSend(v19, "firstObject")))
  {
    if (!byte_1ECD8DE26)
      return 0;
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Could not materialize Objective-C class for declared attribute value class name \"%@\" of attribute named %@");
    v21 = (uint64_t)a1[13];
    objc_msgSend(a1, "name");
    _NSCoreDataLog(17, v20, v22, v23, v24, v25, v26, v27, v21);
    v14 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      return 0;
    v28 = (NSString *)a1[13];
    *(_DWORD *)buf = 138412546;
    v51 = v28;
    v52 = 2112;
    v53 = objc_msgSend(a1, "name");
    v16 = "CoreData: Could not materialize Objective-C class for declared attribute value class name \"%@\" of attribute named %@";
    goto LABEL_9;
  }
  v29 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v30 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (!v30)
    return (uint64_t)v29;
  v31 = v30;
  v32 = *(_QWORD *)v47;
LABEL_17:
  v33 = 0;
  while (1)
  {
    if (*(_QWORD *)v47 != v32)
      objc_enumerationMutation(v19);
    v34 = *(NSString **)(*((_QWORD *)&v46 + 1) + 8 * v33);
    if (!-[NSString length](v34, "length"))
      goto LABEL_23;
    v35 = NSClassFromString(v34);
    if (!v35)
      break;
    objc_msgSend(v29, "addObject:", v35);
LABEL_23:
    if (v31 == ++v33)
    {
      v31 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v31)
        goto LABEL_17;
      return (uint64_t)v29;
    }
  }
  if (byte_1ECD8DE26)
  {
    v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Could not materialize Objective-C class named \"%@\" from declared attribute value type \"%@\" of attribute named %@");
    objc_msgSend(a1, "name");
    _NSCoreDataLog(17, v36, v37, v38, v39, v40, v41, v42, (uint64_t)v34);
    v43 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v44 = a1[13];
      v45 = objc_msgSend(a1, "name");
      *(_DWORD *)buf = 138412802;
      v51 = v34;
      v52 = 2112;
      v53 = (uint64_t)v44;
      v54 = 2112;
      v55 = v45;
      v16 = "CoreData: Could not materialize Objective-C class named \"%@\" from declared attribute value type \"%@\" of "
            "attribute named %@";
      v17 = v43;
      v18 = 32;
      goto LABEL_31;
    }
  }
  return 0;
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  char v7;
  int v8;
  objc_super v9;
  CC_SHA256_CTX c;
  _BYTE data[32];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  v9.receiver = self;
  v9.super_class = (Class)NSAttributeDescription;
  -[NSPropertyDescription _versionHash:inStyle:](&v9, sel__versionHash_inStyle_, data, a4);
  CC_SHA256_Update(&c, data, 0x20u);
  v8 = -[NSAttributeDescription attributeType](self, "attributeType");
  CC_SHA256_Update(&c, &v8, 4u);
  if (-[NSAttributeDescription allowsExternalBinaryDataStorage](self, "allowsExternalBinaryDataStorage"))
  {
    v7 = 1;
    CC_SHA256_Update(&c, &v7, 1u);
  }
  if (-[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion"))
  {
    v7 = 1;
    CC_SHA256_Update(&c, &v7, 1u);
  }
  CC_SHA256_Final((unsigned __int8 *)a3, &c);
}

- (id)_initWithName:(id)a3 type:(unint64_t)a4 withClassName:(id)a5
{
  __int16 v6;
  _QWORD *v7;
  _QWORD *v8;

  v6 = a4;
  v7 = -[NSPropertyDescription _initWithName:](self, "_initWithName:", a3);
  v8 = v7;
  if (v7)
  {
    *((_WORD *)v7 + 40) = v6;
    v7[13] = objc_msgSend(a5, "copy");
    v8[14] = 0;
    v8[12] = 0;
  }
  return v8;
}

- (id)_initWithName:(id)a3 type:(unint64_t)a4
{
  NSString *v7;

  v7 = +[NSAttributeDescription _classNameForType:]((uint64_t)NSAttributeDescription, a4);
  if (v7 == (NSString *)NSKeyValueCoding_NullValue)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find class for type %lu"), a4), 0));
  }
  return -[NSAttributeDescription _initWithName:type:withClassName:](self, "_initWithName:type:withClassName:", a3, a4, v7);
}

+ (NSString)_classNameForType:(uint64_t)a1
{
  NSString *result;
  objc_class *v4;

  objc_opt_self();
  result = 0;
  if (a2 <= 699)
  {
    if (a2 <= 299)
    {
      if (!a2)
        return result;
      if (a2 != 100 && a2 != 200)
        return (NSString *)NSKeyValueCoding_NullValue;
    }
    else if (a2 > 499)
    {
      if (a2 != 500 && a2 != 600)
        return (NSString *)NSKeyValueCoding_NullValue;
    }
    else if (a2 != 300 && a2 != 400)
    {
      return (NSString *)NSKeyValueCoding_NullValue;
    }
    goto LABEL_25;
  }
  if (a2 <= 1099)
  {
    if (a2 > 899)
    {
      if (a2 != 900 && a2 != 1000)
        return (NSString *)NSKeyValueCoding_NullValue;
    }
    else if (a2 != 700 && a2 != 800)
    {
      return (NSString *)NSKeyValueCoding_NullValue;
    }
LABEL_25:
    v4 = (objc_class *)objc_opt_class();
    return NSStringFromClass(v4);
  }
  if (a2 <= 1799)
  {
    if (a2 != 1100 && a2 != 1200)
      return (NSString *)NSKeyValueCoding_NullValue;
    goto LABEL_25;
  }
  if (a2 == 1800)
    return result;
  if (a2 == 2100)
    goto LABEL_25;
  return (NSString *)NSKeyValueCoding_NullValue;
}

- (void)dealloc
{
  objc_super v3;

  self->_attributeValueClassName = 0;
  self->_valueTransformerName = 0;

  self->_defaultValue = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSAttributeDescription;
  -[NSPropertyDescription dealloc](&v3, sel_dealloc);
}

+ (void)initialize
{
  uint64_t v3;
  objc_super v4;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
    objc_opt_self();
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSAttributeDescription;
  objc_msgSendSuper2(&v4, sel_initialize);
}

- (BOOL)_epsilonEquals:(id)a3 rhs:(id)a4 withFlags:(int)a5
{
  NSAttributeType v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v15;
  float v16;
  float v17;

  if (a3 == a4 || a5 == 1 && -[NSPropertyDescription _isTriggerBacked](self, "_isTriggerBacked"))
    return 1;
  v9 = -[NSAttributeDescription attributeType](self, "attributeType");
  if (v9 == NSDateAttributeType)
  {
    if (objc_msgSend(a3, "isNSDate") && objc_msgSend(a4, "isNSDate"))
    {
      objc_msgSend(a3, "timeIntervalSinceReferenceDate");
      v11 = v13;
      objc_msgSend(a4, "timeIntervalSinceReferenceDate");
LABEL_14:
      if (v11 != v12)
        return vabdd_f64(v11, v12) <= 2.22044605e-16;
      return 1;
    }
    return objc_msgSend(a3, "isEqual:", a4);
  }
  if (v9 != NSFloatAttributeType)
  {
    if (v9 == NSDoubleAttributeType
      && objc_msgSend(a3, "isNSNumber")
      && objc_msgSend(a4, "isNSNumber"))
    {
      objc_msgSend(a3, "doubleValue");
      v11 = v10;
      objc_msgSend(a4, "doubleValue");
      goto LABEL_14;
    }
    return objc_msgSend(a3, "isEqual:", a4);
  }
  if (!objc_msgSend(a3, "isNSNumber") || !objc_msgSend(a4, "isNSNumber"))
    return objc_msgSend(a3, "isEqual:", a4);
  objc_msgSend(a3, "floatValue");
  v16 = v15;
  objc_msgSend(a4, "floatValue");
  if (v16 == v17)
    return 1;
  return vabds_f32(v16, v17) <= 0.00000011921;
}

- (BOOL)_isEqual:(id)a3 skipIndexCheck:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  NSAttributeType v9;
  NSString *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  BOOL v19;
  objc_super v21;
  uint64_t v22;
  uint64_t v23;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v22 = v4;
    v23 = v5;
    v21.receiver = self;
    v21.super_class = (Class)NSAttributeDescription;
    LODWORD(v8) = -[NSPropertyDescription _isEqual:skipIndexCheck:](&v21, sel__isEqual_skipIndexCheck_, a3, a4);
    if ((_DWORD)v8)
    {
      v9 = -[NSAttributeDescription attributeType](self, "attributeType");
      if (v9 != objc_msgSend(a3, "attributeType"))
      {
LABEL_19:
        LOBYTE(v8) = 0;
        return v8;
      }
      v10 = -[NSAttributeDescription attributeValueClassName](self, "attributeValueClassName");
      v8 = objc_msgSend(a3, "attributeValueClassName");
      if (v10 == (NSString *)v8
        || (v11 = v8, LOBYTE(v8) = 0, v10) && v11 && (LODWORD(v8) = -[NSString isEqual:](v10, "isEqual:"), (_DWORD)v8))
      {
        v12 = -[NSAttributeDescription defaultValue](self, "defaultValue");
        v8 = objc_msgSend(a3, "defaultValue");
        if (v12 == (id)v8
          || (v13 = v8, LOBYTE(v8) = 0, v12) && v13 && (LODWORD(v8) = objc_msgSend(v12, "isEqual:"), (_DWORD)v8))
        {
          v14 = -[NSAttributeDescription valueTransformerName](self, "valueTransformerName");
          v8 = objc_msgSend(a3, "valueTransformerName");
          if (v14 == (NSString *)v8
            || (v15 = v8, LOBYTE(v8) = 0, v14)
            && v15
            && (LODWORD(v8) = -[NSString isEqual:](v14, "isEqual:"), (_DWORD)v8))
          {
            v16 = -[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion");
            if (v16 != objc_msgSend(a3, "preservesValueInHistoryOnDeletion"))
              goto LABEL_19;
            v17 = -[NSAttributeDescription isFileBackedFuture](self, "isFileBackedFuture");
            if (v17 != objc_msgSend(a3, "isFileBackedFuture"))
              goto LABEL_19;
            v18 = -[NSAttributeDescription allowsCloudEncryption](self, "allowsCloudEncryption");
            if (v18 != objc_msgSend(a3, "allowsCloudEncryption"))
              goto LABEL_19;
            v19 = -[NSAttributeDescription usesMergeableStorage](self, "usesMergeableStorage");
            LOBYTE(v8) = v19 ^ objc_msgSend(a3, "usesMergeableStorage") ^ 1;
          }
        }
      }
    }
  }
  return v8;
}

- (int)_encodedAttributeFlagsForFlags:(int)a3
{
  return a3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  unsigned int v6;
  uint64_t v7;
  objc_super v8;

  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  v8.receiver = self;
  v8.super_class = (Class)NSAttributeDescription;
  -[NSPropertyDescription encodeWithCoder:](&v8, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeInt:forKey:", -[NSAttributeDescription attributeType](self, "attributeType"), CFSTR("NSAttributeType"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSAttributeDescription attributeValueClassName](self, "attributeValueClassName"), CFSTR("NSAttributeValueClassName"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSAttributeDescription defaultValue](self, "defaultValue"), CFSTR("NSDefaultValue"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSAttributeDescription valueTransformerName](self, "valueTransformerName"), CFSTR("NSValueTransformerName"));
  if (-[NSAttributeDescription isIndexed](self, "isIndexed"))
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSIsIndexed"));
  if (-[NSPropertyDescription _storeBinaryDataExternally](self, "_storeBinaryDataExternally"))
    v6 = 4;
  else
    v6 = 0;
  if (-[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion"))
    v6 |= 0x10u;
  if (-[NSAttributeDescription isFileBackedFuture](self, "isFileBackedFuture"))
    v7 = v6 | 0x20;
  else
    v7 = v6;
  objc_msgSend(a3, "encodeInt32:forKey:", -[NSAttributeDescription _encodedAttributeFlagsForFlags:](self, "_encodedAttributeFlagsForFlags:", v7), CFSTR("NSFlagsKey"));
  objc_autoreleasePoolPop(v5);
}

- (BOOL)_isSchemaEqual:(id)a3
{
  unsigned int v5;
  int v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSAttributeDescription;
  v5 = -[NSPropertyDescription _isSchemaEqual:](&v9, sel__isSchemaEqual_);
  if (v5)
  {
    v5 = -[NSAttributeDescription _attributeTypeIsSchemaEqual:](self, "_attributeTypeIsSchemaEqual:", objc_msgSend(a3, "attributeType"));
    if (v5)
    {
      v6 = -[NSAttributeDescription isFileBackedFuture](self, "isFileBackedFuture");
      if (v6 == objc_msgSend(a3, "isFileBackedFuture"))
      {
        v7 = -[NSAttributeDescription storesBinaryDataExternally](self, "storesBinaryDataExternally");
        LOBYTE(v5) = v7 ^ objc_msgSend(a3, "storesBinaryDataExternally") ^ 1;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  NSAttributeType v5;
  NSString *v6;
  id v7;
  const __CFString *v8;
  const __CFString *v9;
  _BOOL4 v10;
  const __CFString *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)NSAttributeDescription;
  v4 = -[NSPropertyDescription description](&v13, sel_description);
  v5 = -[NSAttributeDescription attributeType](self, "attributeType");
  v6 = -[NSAttributeDescription attributeValueClassName](self, "attributeValueClassName");
  v7 = -[NSAttributeDescription defaultValue](self, "defaultValue");
  v8 = CFSTR("NO");
  if (-[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[NSAttributeDescription allowsCloudEncryption](self, "allowsCloudEncryption"))
    v8 = CFSTR("YES");
  v10 = -[NSAttributeDescription usesMergeableStorage](self, "usesMergeableStorage");
  v11 = &stru_1E1EE23F0;
  if (v10)
    v11 = CFSTR(", usesMergeableStorage YES");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, attributeType %lu , attributeValueClassName %@, defaultValue %@, preservesValueInHistoryOnDeletion %@, allowsCloudEncryption %@%@"), v4, v5, v6, v7, v9, v8, v11);
}

- (void)setAttributeValueClassName:(NSString *)attributeValueClassName
{
  int type;

  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (!attributeValueClassName && !-[NSPropertyDescription isTransient](self, "isTransient"))
  {
    type = self->_type;
    if (type != 1800 && type != 2100)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't set attributeValueClassName to nil for a non-transient attribute."), 0));
  }
  if (self->_attributeValueClassName != attributeValueClassName)
  {
    self->_attributeValueClass = 0;

    self->_attributeValueClassName = (NSString *)-[NSString copy](attributeValueClassName, "copy");
  }
}

- (void)setAttributeType:(NSAttributeType)attributeType
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  objc_class *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  uint64_t v15;

  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self->_type != attributeType)
  {
    if (attributeType)
    {
      if (attributeType == NSObjectIDAttributeType)
      {
        v5 = (void *)MEMORY[0x1E0C99DA0];
        v6 = *MEMORY[0x1E0C99778];
        v7 = (void *)MEMORY[0x1E0CB3940];
        v8 = +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", 2000);
        v9 = (objc_class *)objc_opt_class();
        v10 = (const __CFString *)objc_msgSend(v7, "stringWithFormat:", CFSTR("'%@' is only supported for use with '%@'."), v8, NSStringFromClass(v9));
        v11 = v5;
        v12 = v6;
        goto LABEL_10;
      }
    }
    else if (!-[NSPropertyDescription isTransient](self, "isTransient"))
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      v10 = CFSTR("Can't set attribute type to undefined for non-transient attribute.");
      goto LABEL_10;
    }
    v13 = +[NSAttributeDescription _classNameForType:]((uint64_t)NSAttributeDescription, attributeType);
    if (v13 != (NSString *)NSKeyValueCoding_NullValue)
    {
      self->_type = attributeType;
      -[NSAttributeDescription setAttributeValueClassName:](self, "setAttributeValueClassName:", v13);
      return;
    }
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99768];
    v10 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find class for type %lu"), attributeType);
    v11 = v14;
    v12 = v15;
LABEL_10:
    objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v10, 0));
  }
}

- (void)setDefaultValue:(id)defaultValue
{
  id v5;

  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_defaultValue;
  if (v5 != defaultValue)
  {

    self->_defaultValue = defaultValue;
    -[NSAttributeDescription _sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests]((uint64_t)self);
  }
}

- (BOOL)isIndexed
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSAttributeDescription;
  return -[NSPropertyDescription isIndexed](&v4, sel_isIndexed)
      || -[NSDictionary objectForKey:](-[NSPropertyDescription userInfo](self, "userInfo"), "objectForKey:", CFSTR("_NSCreateIndex")) != 0;
}

- (void)setValueTransformerName:(NSString *)valueTransformerName
{
  NSString *v3;
  _BOOL4 v6;
  NSString *v7;

  v3 = self->_valueTransformerName;
  if (v3 != valueTransformerName)
  {

    if (valueTransformerName)
    {
      v6 = -[NSString isEqualToString:](valueTransformerName, "isEqualToString:", CFSTR("NSSecureUnarchiveFromDataTransformerName"));
      v7 = (NSString *)*MEMORY[0x1E0CB3188];
      if (!v6)
        v7 = valueTransformerName;
    }
    else
    {
      v7 = 0;
    }
    self->_valueTransformerName = v7;
  }
}

- (NSData)versionHash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSAttributeDescription;
  return -[NSPropertyDescription versionHash](&v3, sel_versionHash);
}

BOOL __46__NSAttributeDescription_validationPredicates__block_invoke(uint64_t a1, void *a2)
{
  return !a2 || objc_msgSend(a2, "absoluteString") != 0;
}

- (void)setAllowsExternalBinaryDataStorage:(BOOL)allowsExternalBinaryDataStorage
{
  _BOOL4 v3;
  __int16 v5;
  __int16 v6;
  __int16 v7;

  v3 = allowsExternalBinaryDataStorage;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3)
    v5 = 2048;
  else
    v5 = 0;
  v6 = *(_WORD *)&self->super._propertyDescriptionFlags & 0xF7FF | v5;
  v7 = *(_WORD *)&self->super._propertyDescriptionFlags & 0xB7FF | v5 & 0xBFFF;
  if (!v3)
    v6 = v7;
  *(_WORD *)&self->super._propertyDescriptionFlags = v6;
}

- (void)setAllowsCloudEncryption:(BOOL)allowsCloudEncryption
{
  _BOOL4 v3;
  __int16 v5;

  v3 = allowsCloudEncryption;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3)
    v5 = 0x8000;
  else
    v5 = 0;
  *(_WORD *)&self->super._propertyDescriptionFlags = v5 & 0x8000 | *(_WORD *)&self->super._propertyDescriptionFlags & 0x7FFF;
}

- (void)setPreservesValueInHistoryOnDeletion:(BOOL)preservesValueInHistoryOnDeletion
{
  _BOOL4 v3;
  __int16 v5;

  v3 = preservesValueInHistoryOnDeletion;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self)
  {
    if (v3)
      v5 = 4096;
    else
      v5 = 0;
    *(_WORD *)&self->super._propertyDescriptionFlags = *(_WORD *)&self->super._propertyDescriptionFlags & 0xEFFF | v5;
  }
}

- (void)setPreserveValueOnDeletionInPersistentHistory:(BOOL)a3
{
  _BOOL4 v3;
  __int16 v5;

  v3 = a3;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self)
  {
    if (v3)
      v5 = 4096;
    else
      v5 = 0;
    *(_WORD *)&self->super._propertyDescriptionFlags = *(_WORD *)&self->super._propertyDescriptionFlags & 0xEFFF | v5;
  }
}

- (BOOL)_attributeTypeIsSchemaEqual:(unint64_t)a3
{
  uint64_t type;
  BOOL result;

  type = self->_type;
  if (type == a3)
    return 1;
  if ((_DWORD)type == 100)
    return a3 == 300 || a3 == 200;
  if (a3 == 300 && (_DWORD)type == 200 || a3 == 500 && (_DWORD)type == 600)
    return 1;
  if ((_DWORD)type != 800)
    return 0;
  result = 1;
  if (a3 != 100 && a3 != 200 && a3 != 300)
    return 0;
  return result;
}

- (BOOL)_isEqualWithoutIndex:(id)a3
{
  return -[NSAttributeDescription _isEqual:skipIndexCheck:](self, "_isEqual:skipIndexCheck:", a3, 1);
}

+ (id)stringForAttributeType:(unint64_t)a3
{
  if ((uint64_t)a3 <= 799)
  {
    if ((uint64_t)a3 <= 399)
    {
      switch(a3)
      {
        case 0x64uLL:
          return CFSTR("NSInteger16AttributeType");
        case 0xC8uLL:
          return CFSTR("NSInteger32AttributeType");
        case 0x12CuLL:
          return CFSTR("NSInteger64AttributeType");
      }
    }
    else if ((uint64_t)a3 > 599)
    {
      if (a3 == 600)
        return CFSTR("NSFloatAttributeType");
      if (a3 == 700)
        return CFSTR("NSStringAttributeType");
    }
    else
    {
      if (a3 == 400)
        return CFSTR("NSDecimalAttributeType");
      if (a3 == 500)
        return CFSTR("NSDoubleAttributeType");
    }
  }
  else if ((uint64_t)a3 > 1199)
  {
    if ((uint64_t)a3 > 1999)
    {
      if (a3 == 2000)
        return CFSTR("NSObjectIDAttributeType");
      if (a3 == 2100)
        return CFSTR("NSCompositeAttributeType");
    }
    else
    {
      if (a3 == 1200)
        return CFSTR("NSURIAttributeType");
      if (a3 == 1800)
        return CFSTR("NSTransformableAttributeType");
    }
  }
  else if ((uint64_t)a3 > 999)
  {
    if (a3 == 1000)
      return CFSTR("NSBinaryDataAttributeType");
    if (a3 == 1100)
      return CFSTR("NSUUIDAttributeType");
  }
  else
  {
    if (a3 == 800)
      return CFSTR("NSBooleanAttributeType");
    if (a3 == 900)
      return CFSTR("NSDateAttributeType");
  }
  return CFSTR("NSUndefinedAttributeType");
}

- (uint64_t)_comparePredicatesAndWarningsWithUnoptimizedAttributeDescription:(uint64_t)result
{
  unsigned __int16 *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  double *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  double *v21;
  double v22;
  double v23;
  void *v24;

  if (result)
  {
    v3 = (unsigned __int16 *)result;
    v4 = (void *)objc_msgSend(a2, "_rawValidationPredicates");
    v5 = (void *)objc_msgSend(a2, "_rawValidationWarnings");
    v6 = (void *)objc_msgSend(v3, "_rawValidationPredicates");
    v24 = (void *)objc_msgSend(v3, "_rawValidationWarnings");
    v7 = objc_msgSend(v3, "_extraIVars");
    v8 = objc_msgSend(v4, "count");
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = (double *)(v7 + 16);
      v12 = (double *)(v7 + 8);
      do
      {
        v13 = (void *)objc_msgSend(v4, "objectAtIndex:", v10);
        v14 = -[NSAttributeDescription _canConvertPredicate:andWarning:]((uint64_t)v3, v13, (void *)objc_msgSend(v5, "objectAtIndex:", v10));
        if (!v14)
        {
          if (!v6)
            return 0;
          v18 = objc_msgSend(v6, "indexOfObject:", v13);
          if (v18 == 0x7FFFFFFFFFFFFFFFLL
            || (objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", v18), "isEqual:", objc_msgSend(v5, "objectAtIndex:", v10)) & 1) == 0)
          {
            return 0;
          }
          goto LABEL_19;
        }
        v15 = v14;
        v16 = (void *)objc_msgSend((id)objc_msgSend(v13, "rightExpression"), "constantValue");
        v17 = v3[40];
        if (v17 > 0x12B)
        {
          if (v17 != 700 && v17 != 300)
          {
LABEL_21:
            if (v15 <= 0)
              v21 = v12;
            else
              v21 = v11;
            v22 = *v21;
            objc_msgSend(v16, "doubleValue");
            if (v22 != v23)
              return 0;
            goto LABEL_19;
          }
        }
        else if (v17 != 100 && v17 != 200)
        {
          goto LABEL_21;
        }
        if (v15 <= 0)
          v19 = v12;
        else
          v19 = v11;
        v20 = *(_QWORD *)v19;
        if (v20 != objc_msgSend(v16, "longLongValue"))
          return 0;
LABEL_19:
        ++v10;
      }
      while (v9 != v10);
    }
    return 1;
  }
  return result;
}

- (BOOL)_comparePredicatesAndWarnings:(id)a3
{
  _BOOL4 v5;
  objc_class *Class;
  _NSExtraPropertyIVars *v7;
  uint64_t v8;
  objc_super v10;

  v5 = -[NSPropertyDescription _hasMaxValueInExtraIvars](self, "_hasMaxValueInExtraIvars")
    || -[NSPropertyDescription _hasMinValueInExtraIvars](self, "_hasMinValueInExtraIvars");
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    a3 = (id)objc_msgSend(a3, "_underlyingProperty");
  if ((objc_msgSend(a3, "_hasMaxValueInExtraIvars") & 1) != 0
    || (objc_msgSend(a3, "_hasMinValueInExtraIvars") & 1) != 0)
  {
    if (!v5)
      return -[NSAttributeDescription _comparePredicatesAndWarningsWithUnoptimizedAttributeDescription:]((uint64_t)a3, self);
    v7 = -[NSPropertyDescription _extraIVars](self, "_extraIVars");
    v8 = objc_msgSend(a3, "_extraIVars");
    if (v7->var1 != *(_QWORD *)(v8 + 8) || v7->var2 != *(_QWORD *)(v8 + 16))
      return 0;
    goto LABEL_17;
  }
  if (!v5)
  {
LABEL_17:
    v10.receiver = self;
    v10.super_class = (Class)NSAttributeDescription;
    return -[NSPropertyDescription _comparePredicatesAndWarnings:](&v10, sel__comparePredicatesAndWarnings_, a3);
  }
  return -[NSAttributeDescription _comparePredicatesAndWarningsWithUnoptimizedAttributeDescription:]((uint64_t)self, a3);
}

void __75__NSAttributeDescription__NSInternalMethods___createCachesAndOptimizeState__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "One or more models in this application are using transformable properties with transformer names that are either unset, or set to NSKeyedUnarchiveFromDataTransformerName. Please switch to using \"%@\" or a subclass of NSSecureUnarchiveFromDataTransformer instead. At some point, Core Data will default to using \"%@\" when nil is specified, and transformable properties containing classes that do not support NSSecureCoding will become unreadable.");
  v1 = *MEMORY[0x1E0CB3188];
  _NSCoreDataLog(17, v0, v2, v3, v4, v5, v6, v7, *MEMORY[0x1E0CB3188]);
  v8 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412546;
    v10 = v1;
    v11 = 2112;
    v12 = v1;
    _os_log_fault_impl(&dword_18A253000, v8, OS_LOG_TYPE_FAULT, "CoreData: One or more models in this application are using transformable properties with transformer names that are either unset, or set to NSKeyedUnarchiveFromDataTransformerName. Please switch to using \"%@\" or a subclass of NSSecureUnarchiveFromDataTransformer instead. At some point, Core Data will default to using \"%@\" when nil is specified, and transformable properties containing classes that do not support NSSecureCoding will become unreadable.", buf, 0x16u);
  }
}

- (id)_initWithType:(unint64_t)a3
{
  return -[NSAttributeDescription _initWithName:type:](self, "_initWithName:type:", 0, a3);
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int type;
  id defaultValue;
  id v22;
  id v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  unsigned int v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unsigned int v36;
  unsigned int v37;
  unint64_t v38;
  objc_super v39;

  v16 = objc_msgSend(a3, "length");
  _writeInt32IntoData(a3, 0);
  v17 = objc_msgSend(a3, "length");
  v39.receiver = self;
  v39.super_class = (Class)NSAttributeDescription;
  -[NSPropertyDescription _appendPropertyFieldsToData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:entitiesSlots:](&v39, sel__appendPropertyFieldsToData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_entitiesSlots_, a3, a4, a5, a6, a7, a8);
  if (self->_valueTransformerName)
    v18 = objc_msgSend((id)objc_msgSend(a6, "valueForKey:"), "unsignedIntegerValue");
  else
    v18 = 0;
  _writeInt32IntoData(a3, v18);
  _writeInt32IntoData(a3, self->_type);
  if (self->_attributeValueClassName)
    v19 = objc_msgSend((id)objc_msgSend(a5, "valueForKey:"), "unsignedIntegerValue");
  else
    v19 = 0;
  _writeInt32IntoData(a3, v19);
  if (self->_defaultValue)
  {
    _writeInt32IntoData(a3, 1u);
    type = self->_type;
    if (type <= 0x1F3)
    {
      if (self->_type > 0x12Bu)
      {
        if (type == 300)
        {
          _writeInt64IntoData(a3, objc_msgSend(self->_defaultValue, "longLongValue"));
          goto LABEL_40;
        }
        if (type == 400)
        {
          defaultValue = (id)objc_msgSend(self->_defaultValue, "stringValue");
          v22 = a5;
          goto LABEL_37;
        }
LABEL_36:
        defaultValue = self->_defaultValue;
        v22 = a7;
        goto LABEL_37;
      }
      if (type != 100 && type != 200)
        goto LABEL_36;
LABEL_18:
      v25 = objc_msgSend(self->_defaultValue, "integerValue");
LABEL_38:
      v24 = v25;
      v23 = a3;
      goto LABEL_39;
    }
    if (self->_type <= 0x2BBu)
    {
      if (type != 500)
      {
        if (type != 600)
          goto LABEL_36;
        v26 = objc_msgSend(a3, "length");
        v27 = (v26 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        if (v27 != v26)
        {
          v38 = 0;
          objc_msgSend(a3, "appendBytes:length:", &v38, v27 - v26);
        }
        objc_msgSend(self->_defaultValue, "floatValue");
        LODWORD(v38) = bswap32(v28);
        v29 = a3;
        v30 = 4;
LABEL_35:
        objc_msgSend(v29, "appendBytes:length:", &v38, v30);
        goto LABEL_40;
      }
      v34 = objc_msgSend(a3, "length");
      v35 = (v34 + 7) & 0xFFFFFFFFFFFFFFF8;
      if (v35 != v34)
      {
        v38 = 0;
        objc_msgSend(a3, "appendBytes:length:", &v38, v35 - v34);
      }
      objc_msgSend(self->_defaultValue, "doubleValue");
    }
    else
    {
      if (type != 900)
      {
        if (type != 800)
        {
          if (type == 700)
          {
            defaultValue = self->_defaultValue;
            v22 = a6;
LABEL_37:
            v25 = objc_msgSend((id)objc_msgSend(v22, "objectForKey:", defaultValue), "unsignedIntegerValue");
            goto LABEL_38;
          }
          goto LABEL_36;
        }
        goto LABEL_18;
      }
      v31 = objc_msgSend(a3, "length");
      v32 = (v31 + 7) & 0xFFFFFFFFFFFFFFF8;
      if (v32 != v31)
      {
        v38 = 0;
        objc_msgSend(a3, "appendBytes:length:", &v38, v32 - v31);
      }
      objc_msgSend(self->_defaultValue, "timeIntervalSinceReferenceDate");
    }
    v38 = bswap64(v33);
    v29 = a3;
    v30 = 8;
    goto LABEL_35;
  }
  v23 = a3;
  v24 = 0;
LABEL_39:
  _writeInt32IntoData(v23, v24);
LABEL_40:
  v36 = -[NSPropertyDescription _hasMaxValueInExtraIvars](self, "_hasMaxValueInExtraIvars");
  if (-[NSPropertyDescription _hasMinValueInExtraIvars](self, "_hasMinValueInExtraIvars"))
    v36 |= 2u;
  if (-[NSPropertyDescription _storeBinaryDataExternally](self, "_storeBinaryDataExternally"))
    v36 |= 4u;
  if (-[NSPropertyDescription _isTriggerBacked](self, "_isTriggerBacked"))
    v36 |= 8u;
  if (-[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion"))
    v36 |= 0x10u;
  if (-[NSPropertyDescription _isFileBackedFuture](self, "_isFileBackedFuture"))
  {
    v36 |= 0x20u;
  }
  else if (objc_msgSend(-[NSDictionary valueForKey:](-[NSPropertyDescription userInfo](self, "userInfo"), "valueForKey:", CFSTR("NSIsFileBackedFuture")), "BOOLValue"))
  {
    v36 |= 0x24u;
  }
  if (-[NSPropertyDescription _allowsCloudEncryption](self, "_allowsCloudEncryption"))
    v37 = v36 | 0x40;
  else
    v37 = v36;
  _writeInt32IntoData(a3, v37);
  v38 = bswap32(objc_msgSend(a3, "length") - v16);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v17 - 4, 4, &v38);
}

@end
