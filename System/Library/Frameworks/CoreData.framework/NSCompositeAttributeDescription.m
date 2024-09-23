@implementation NSCompositeAttributeDescription

- (NSCompositeAttributeDescription)init
{
  NSCompositeAttributeDescription *v2;
  NSCompositeAttributeDescription *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSCompositeAttributeDescription;
  v2 = -[NSPropertyDescription init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NSCompositeAttributeDescription setAttributeType:](v2, "setAttributeType:", 2100);
  return v3;
}

- (id)_initWithName:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSCompositeAttributeDescription;
  v3 = -[NSPropertyDescription _initWithName:](&v6, sel__initWithName_, a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "setAttributeType:", 2100);
  return v4;
}

- (id)_initWithType:(unint64_t)a3
{
  objc_super v4;

  if (a3 != 2100)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCompositeAttributeDescription only supports NSCompositeAttributeType as a type."), 0));
  }
  v4.receiver = self;
  v4.super_class = (Class)NSCompositeAttributeDescription;
  return -[NSAttributeDescription _initWithType:](&v4, sel__initWithType_);
}

- (id)_initWithName:(id)a3 type:(unint64_t)a4
{
  objc_super v5;

  if (a4 != 2100)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCompositeAttributeDescription only supports NSCompositeAttributeType as a type."), 0));
  }
  v5.receiver = self;
  v5.super_class = (Class)NSCompositeAttributeDescription;
  return -[NSAttributeDescription _initWithName:type:](&v5, sel__initWithName_type_, a3);
}

- (id)_initWithName:(id)a3 type:(unint64_t)a4 withClassName:(id)a5
{
  objc_super v6;

  if (a4 != 2100)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCompositeAttributeDescription only supports NSCompositeAttributeType as a type."), 0));
  }
  v6.receiver = self;
  v6.super_class = (Class)NSCompositeAttributeDescription;
  return -[NSAttributeDescription _initWithName:type:withClassName:](&v6, sel__initWithName_type_withClassName_, a3, 2100, a5);
}

- (void)dealloc
{
  objc_super v3;

  self->_elements = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCompositeAttributeDescription;
  -[NSAttributeDescription dealloc](&v3, sel_dealloc);
}

- (unint64_t)_propertyType
{
  return 7;
}

- (unint64_t)attributeType
{
  return 2100;
}

- (void)setAttributeType:(unint64_t)a3
{
  uint64_t v3;
  objc_super v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a3 != 2100)
  {
    v3 = *MEMORY[0x1E0C99778];
    v5 = CFSTR("offending attribute");
    v6[0] = self;
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v3, CFSTR("The attribute type of a composite cannot be changed from NSCompositeAttributeType."), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  }
  v4.receiver = self;
  v4.super_class = (Class)NSCompositeAttributeDescription;
  -[NSAttributeDescription setAttributeType:](&v4, sel_setAttributeType_);
}

- (id)description
{
  void *v3;
  id v4;
  unint64_t v5;
  NSArray *v6;
  _BOOL4 v7;
  const __CFString *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)NSCompositeAttributeDescription;
  v4 = -[NSAttributeDescription description](&v10, sel_description);
  v5 = -[NSCompositeAttributeDescription attributeType](self, "attributeType");
  v6 = -[NSCompositeAttributeDescription elements](self, "elements");
  v7 = -[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, attributeType %lu , elements %@, preservesValueInHistoryOnDeletion %@"), v4, v5, v6, v8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isTransient
{
  return 0;
}

- (NSCompositeAttributeDescription)initWithCoder:(id)a3
{
  NSCompositeAttributeDescription *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSCompositeAttributeDescription;
  v4 = -[NSAttributeDescription initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v4->_elements = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("NSCompositeElements"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSCompositeAttributeDescription;
  -[NSAttributeDescription encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_elements, CFSTR("NSCompositeElements"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSCompositeAttributeDescription;
  v4 = -[NSAttributeDescription copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setElements:", self->_elements);
  return v5;
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(NSArray *)elements
{
  void *v5;
  BOOL v6;
  void *v7;
  unint64_t v8;
  void *v9;
  int v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  -[NSCompositeAttributeDescription _checkElements:]((uint64_t)self, elements);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](elements, "count"));
  v6 = -[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion");
  objc_msgSend(v5, "addObjectsFromArray:", elements);
  v7 = 0;
  v8 = 0;
  while (objc_msgSend(v5, "count"))
  {
    v9 = (void *)objc_msgSend(v5, "firstObject");
    if (objc_msgSend(v9, "preservesValueInHistoryOnDeletion"))
      v7 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v9, "preservesValueInHistoryOnDeletion")
        && !-[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion"))
      {
        v16 = (void *)MEMORY[0x1E0C99DA0];
        v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Nested composite %@ is not eligible for preserving values on deletion (only allowed for root composite and leaves)."), objc_msgSend(v9, "_qualifiedName"));
        v34[0] = CFSTR("Composite");
        v34[1] = CFSTR("Element");
        v35[0] = self;
        v35[1] = v9;
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
LABEL_29:
        objc_exception_throw((id)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, v18));
      }
      v10 = objc_msgSend(v9, "preservesValueInHistoryOnDeletion");
      if (v10 != -[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion"))
      {
        v16 = (void *)MEMORY[0x1E0C99DA0];
        v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Nested composite %@ is not eligible for preserving values on deletion (only allowed for root composite and leaves)."), objc_msgSend(v9, "_qualifiedName"));
        v32[0] = CFSTR("Composite");
        v32[1] = CFSTR("Element");
        v33[0] = self;
        v33[1] = v9;
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
        goto LABEL_29;
      }
    }
    if (v6)
    {
      if (!v7)
      {
        v16 = (void *)MEMORY[0x1E0C99DA0];
        v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Composite %@ that is preserved on deletion but element %@ is not."), -[NSPropertyDescription _qualifiedName](self, "_qualifiedName"), objc_msgSend(v9, "_qualifiedName"));
        v28[0] = CFSTR("Composite");
        v28[1] = CFSTR("Element");
        v29[0] = self;
        v29[1] = v9;
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
        goto LABEL_29;
      }
    }
    else if (objc_msgSend(v9, "preservesValueInHistoryOnDeletion"))
    {
      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Element %@ is preserved on deletion but its composite %@ is not."), objc_msgSend(v9, "_qualifiedName"), -[NSPropertyDescription _qualifiedName](self, "_qualifiedName"));
      v30[0] = CFSTR("Element");
      v30[1] = CFSTR("Composite");
      v31[0] = v9;
      v31[1] = self;
      v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v9, "elements"));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        __break(1u);
    }
    ++v8;
    objc_msgSend(v5, "removeObject:", v9);
  }
  if (v8 >= 0x3EA)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ does not yet support more than 1000 total attributes as part of the modeled composite attribute graph. This attribute, %@, has %lu."), +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", -[NSCompositeAttributeDescription attributeType](self, "attributeType")), -[NSPropertyDescription _qualifiedName](self, "_qualifiedName"), v8);
    objc_exception_throw((id)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0));
  }

  v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](elements, "count"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(elements);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copy");
        -[NSArray addObject:](v11, "addObject:", v15);

      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  self->_elements = v11;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3052000000;
  v22[3] = __Block_byref_object_copy__61;
  v22[4] = __Block_byref_object_dispose__61;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __47__NSCompositeAttributeDescription_setElements___block_invoke;
  v21[3] = &unk_1E1EE1C48;
  v21[4] = v22;
  v22[5] = v21;
  __47__NSCompositeAttributeDescription_setElements___block_invoke((uint64_t)v21, v11, (uint64_t)self);
  _Block_object_dispose(v22, 8);
}

- (uint64_t)_checkElements:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v28;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v28 != v5)
            objc_enumerationMutation(a2);
          v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (objc_msgSend(v7, "isNSArray"))
              -[NSCompositeAttributeDescription _checkElements:](v3, v7);
            v25 = (void *)MEMORY[0x1E0C99DA0];
            v26 = *MEMORY[0x1E0C99778];
            v31 = CFSTR("Attribute");
            v32 = v7;
            v21 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
            v24 = CFSTR("Unsupported attribute type for composite.");
            v22 = v25;
            v23 = v26;
LABEL_48:
            objc_exception_throw((id)objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, v24, v21));
          }
          v8 = objc_msgSend(v7, "attributeType");
          v9 = v8;
          if (v8 > 799)
          {
            if (v8 > 1199)
            {
              if (v8 > 1999)
              {
                if (v8 != 2100)
                {
                  if (v8 != 2000)
                    goto LABEL_45;
                  goto LABEL_47;
                }
              }
              else if (v8 != 1200 && v8 != 1800)
              {
                goto LABEL_45;
              }
            }
            else if (v8 > 999)
            {
              if (v8 == 1000)
              {
                if ((objc_msgSend(v7, "allowsExternalBinaryDataStorage") & 1) != 0
                  || (objc_msgSend(v7, "isFileBackedFuture") & 1) != 0)
                {
                  goto LABEL_47;
                }
              }
              else if (v8 != 1100)
              {
                goto LABEL_45;
              }
            }
            else if (v8 != 800 && v8 != 900)
            {
              goto LABEL_45;
            }
          }
          else if (v8 <= 399)
          {
            if (v8 <= 199)
            {
              if (v8 != 100)
              {
                if (v8)
                {
LABEL_45:
                  v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "New attribute type? %@");
                  _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v7);
                  v17 = __pflogFaultLog;
                  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v36 = v7;
                    _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: New attribute type? %@", buf, 0xCu);
                  }
                }
LABEL_47:
                v18 = (void *)MEMORY[0x1E0C99DA0];
                v19 = *MEMORY[0x1E0C99778];
                v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ does not yet support elements of type %@. Please file a radar for this support and assign it to CoreData | (New Bugs)."), +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", 2100), +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", v9));
                v33 = CFSTR("offendingAttribute");
                v34 = v7;
                v21 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
                v22 = v18;
                v23 = v19;
                v24 = (const __CFString *)v20;
                goto LABEL_48;
              }
            }
            else if (v8 != 200 && v8 != 300)
            {
              goto LABEL_45;
            }
          }
          else if (v8 > 599)
          {
            if (v8 != 600 && v8 != 700)
              goto LABEL_45;
          }
          else if (v8 != 400 && v8 != 500)
          {
            goto LABEL_45;
          }
          ++v6;
        }
        while (v4 != v6);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

uint64_t __47__NSCompositeAttributeDescription_setElements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(a2);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (objc_msgSend(v10, "isNSArray"))
        {
          v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v10, a3);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "setSuperCompositeAttribute:", a3);
            v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
            (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, objc_msgSend(v10, "elements"), v10);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v10, "setSuperCompositeAttribute:", a3);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

- (void)_setEntityAndMaintainIndices:(id)a3
{
  _QWORD v5[6];
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSCompositeAttributeDescription;
  -[NSPropertyDescription _setEntityAndMaintainIndices:](&v7, sel__setEntityAndMaintainIndices_);
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = __Block_byref_object_copy__61;
  v6[4] = __Block_byref_object_dispose__61;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__NSCompositeAttributeDescription__setEntityAndMaintainIndices___block_invoke;
  v5[3] = &unk_1E1EE1C70;
  v5[4] = a3;
  v5[5] = v6;
  v6[5] = v5;
  __64__NSCompositeAttributeDescription__setEntityAndMaintainIndices___block_invoke((uint64_t)v5, self->_elements, (uint64_t)a3);
  _Block_object_dispose(v6, 8);
}

uint64_t __64__NSCompositeAttributeDescription__setEntityAndMaintainIndices___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(a2);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (objc_msgSend(v10, "isNSArray"))
        {
          v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v10, a3);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "_setEntityAndMaintainIndices:", a3);
            v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, objc_msgSend(v10, "elements"), a3);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v10, "_setEntityAndMaintainIndices:", *(_QWORD *)(a1 + 32));
          }
        }
        ++v9;
      }
      while (v7 != v9);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

- (void)_addElement:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_elements);
  objc_msgSend(v5, "addObject:", a3);
  -[NSCompositeAttributeDescription setElements:](self, "setElements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5));
}

- (BOOL)_isSchemaEqual:(id)a3
{
  unsigned int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSCompositeAttributeDescription;
  v5 = -[NSAttributeDescription _isSchemaEqual:](&v7, sel__isSchemaEqual_);
  if (v5)
    LOBYTE(v5) = -[NSArray isEqual:](self->_elements, "isEqual:", objc_msgSend(a3, "elements"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v7;
  NSArray *elements;
  uint64_t v9;
  BOOL v10;
  objc_super v12;
  uint64_t v13;
  uint64_t v14;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v13 = v3;
    v14 = v4;
    v12.receiver = self;
    v12.super_class = (Class)NSCompositeAttributeDescription;
    v7 = -[NSAttributeDescription isEqual:](&v12, sel_isEqual_);
    if (v7)
    {
      elements = self->_elements;
      v9 = objc_msgSend(a3, "elements");
      if (elements == (NSArray *)v9)
      {
        LOBYTE(v7) = 1;
      }
      else
      {
        if (elements)
          v10 = v9 == 0;
        else
          v10 = 1;
        if (v10)
          LOBYTE(v7) = 0;
        else
          LOBYTE(v7) = -[NSArray isEqual:](elements, "isEqual:", v9);
      }
    }
  }
  return v7;
}

- (void)setDefaultValue:(id)a3
{
  void *v5;
  uint64_t v6;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isNSDictionary") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("Attribute");
    v9[0] = -[NSPropertyDescription name](self, "name");
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, CFSTR("Unsupported default value for composite. Must be an NSDictionary."), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)));
  }
  v7.receiver = self;
  v7.super_class = (Class)NSCompositeAttributeDescription;
  -[NSAttributeDescription setDefaultValue:](&v7, sel_setDefaultValue_, a3);
}

- (id)_buildDefaultValue
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = objc_msgSend(-[NSAttributeDescription defaultValue](self, "defaultValue"), "mutableCopy");
  v4 = (id)v3;
  if (!v3)
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSCompositeAttributeDescription _buildDefaultValue:usingElements:]((uint64_t)self, v4, -[NSCompositeAttributeDescription elements](self, "elements"));
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);

  if (!v3 && !objc_msgSend(v5, "count"))
    return 0;
  return v5;
}

- (uint64_t)_buildDefaultValue:(void *)a3 usingElements:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  const __CFString *v36;
  __CFString *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v23 = result;
  if (result)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v33;
      v22 = a2;
      v20 = *(_QWORD *)v33;
      do
      {
        v6 = 0;
        v21 = v4;
        do
        {
          if (*(_QWORD *)v33 != v5)
            objc_enumerationMutation(a3);
          v7 = *(__CFString **)(*((_QWORD *)&v32 + 1) + 8 * v6);
          v8 = (void *)MEMORY[0x18D76B4E4]();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSCompositeAttributeDescription _buildDefaultValue:usingElements:](v23, a2, -[__CFString elements](v7, "elements"));
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v19 = *MEMORY[0x1E0C99778];
              v36 = CFSTR("Attribute");
              v37 = v7;
              objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v19, CFSTR("Unsupported attribute type for composite."), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1)));
            }
            v25 = -[__CFString defaultValue](v7, "defaultValue");
            if (v25)
            {
              v27 = v8;
              v26 = -[NSPropertyDescription _elementPath](v7);
              v9 = (void *)-[__CFString componentsSeparatedByString:](v26, "componentsSeparatedByString:", CFSTR("."));
              if ((unint64_t)objc_msgSend(v9, "count") >= 2)
              {
                v30 = 0u;
                v31 = 0u;
                v28 = 0u;
                v29 = 0u;
                v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
                if (v10)
                {
                  v11 = v10;
                  v12 = *(_QWORD *)v29;
                  v13 = (uint64_t)v22;
                  do
                  {
                    v14 = 0;
                    v15 = (void *)v13;
                    do
                    {
                      if (*(_QWORD *)v29 != v12)
                        objc_enumerationMutation(v9);
                      v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14);
                      v13 = objc_msgSend(v15, "objectForKey:", v16, v20);
                      if (!v13)
                      {
                        v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                        objc_msgSend(v15, "setObject:forKey:", v17, v16);

                      }
                      ++v14;
                      v15 = (void *)v13;
                    }
                    while (v11 != v14);
                    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
                  }
                  while (v11);
                }
              }
              a2 = v22;
              v18 = objc_msgSend(v22, "valueForKeyPath:", v26, v20);
              v5 = v20;
              v4 = v21;
              v8 = v27;
              if (!v18)
                objc_msgSend(v22, "setValue:forKeyPath:", v25, v26);
            }
          }
          objc_autoreleasePoolPop(v8);
          ++v6;
        }
        while (v6 != v4);
        result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (id)_flattenedElements
{
  return -[NSCompositeAttributeDescription _flattenElements:](self, "_flattenElements:", -[NSCompositeAttributeDescription elements](self, "elements"));
}

- (id)_flattenElements:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "addObjectsFromArray:", -[NSCompositeAttributeDescription _flattenElements:](self, "_flattenElements:", objc_msgSend(v10, "elements")));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v13 = *MEMORY[0x1E0C99778];
            v18 = CFSTR("Attribute");
            v19 = v10;
            objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v13, CFSTR("Unsupported attribute type for composite."), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1)));
          }
          objc_msgSend(v5, "addObject:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);

  return v11;
}

- (void)_createCachesAndOptimizeState
{
  id v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[6];
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7.receiver = self;
  v7.super_class = (Class)NSCompositeAttributeDescription;
  -[NSAttributeDescription _createCachesAndOptimizeState](&v7, sel__createCachesAndOptimizeState);
  -[NSCompositeAttributeDescription _checkElements:]((uint64_t)self, self->_elements);
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = __Block_byref_object_copy__61;
  v6[4] = __Block_byref_object_dispose__61;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__NSCompositeAttributeDescription__createCachesAndOptimizeState__block_invoke;
  v5[3] = &unk_1E1EE1C48;
  v5[4] = v6;
  v6[5] = v5;
  __64__NSCompositeAttributeDescription__createCachesAndOptimizeState__block_invoke((uint64_t)v5, self->_elements, (uint64_t)self);
  _Block_object_dispose(v6, 8);
  objc_msgSend(v3, "drain");
  v4 = 0;
}

uint64_t __64__NSCompositeAttributeDescription__createCachesAndOptimizeState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(a2);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (objc_msgSend(v10, "isNSArray"))
        {
          v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v10, a3);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "setSuperCompositeAttribute:", a3);
            v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
            (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, objc_msgSend(v10, "elements"), v10);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v10, "setSuperCompositeAttribute:", a3);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  CC_SHA256_CTX c;
  _BYTE v28[128];
  _BYTE v29[128];
  _BYTE data[32];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  v26.receiver = self;
  v26.super_class = (Class)NSCompositeAttributeDescription;
  -[NSAttributeDescription _versionHash:inStyle:](&v26, sel__versionHash_inStyle_, data, a4);
  if (self->_elements)
  {
    v6 = (void *)objc_msgSend(-[NSCompositeAttributeDescription _flattenElements:](self, "_flattenElements:", -[NSCompositeAttributeDescription elements](self, "elements")), "sortedArrayUsingFunction:context:", _comparePropertiesByName, 0);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v11, "isNSArray"))
          {
            v12 = (void *)objc_msgSend(v11, "sortedArrayUsingFunction:context:", _comparePropertiesByName, 0);
            v18 = 0u;
            v19 = 0u;
            v20 = 0u;
            v21 = 0u;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v19;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v19 != v15)
                    objc_enumerationMutation(v12);
                  objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "_versionHash:inStyle:", data, a4);
                  CC_SHA256_Update(&c, data, 0x20u);
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
              }
              while (v14);
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v11, "isTransient") & 1) == 0)
            {
              objc_msgSend(v11, "_versionHash:inStyle:", data, a4);
              CC_SHA256_Update(&c, data, 0x20u);
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
      }
      while (v8);
    }
  }
  CC_SHA256_Final((unsigned __int8 *)a3, &c);
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  objc_super v20;

  v16 = objc_msgSend(a3, "length");
  v17 = objc_msgSend(a3, "length");
  v20.receiver = self;
  v20.super_class = (Class)NSCompositeAttributeDescription;
  -[NSAttributeDescription _writeIntoData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:entitiesSlots:fetchRequests:](&v20, sel__writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_entitiesSlots_fetchRequests_, a3, a4, a5, a6, a7, a8, a9);
  if (self->_elements)
    v18 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  else
    v18 = 0;
  _writeInt32IntoData(a3, v18);
  v19 = bswap32(objc_msgSend(a3, "length") - v16);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v17, 4, &v19);
}

@end
