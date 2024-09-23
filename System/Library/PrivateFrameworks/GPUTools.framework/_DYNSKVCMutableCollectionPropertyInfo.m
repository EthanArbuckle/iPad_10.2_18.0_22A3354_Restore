@implementation _DYNSKVCMutableCollectionPropertyInfo

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _DYNSKVCMutableCollectionPropertyClassMap = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
}

+ (id)mutableCollectionPropertyInfoForClass:(Class)a3
{
  volatile int *v4;
  _DYNSKVCMutableCollectionPropertyInfo *v5;

  GPUTools::DYLockUtils::Lock((GPUTools::DYLockUtils *)&_DYNSKVCMutableCollectionPropertyClassMapLock, (volatile int *)a2);
  v5 = (_DYNSKVCMutableCollectionPropertyInfo *)NSMapGet((NSMapTable *)_DYNSKVCMutableCollectionPropertyClassMap, a3);
  if (!v5)
  {
    v5 = -[_DYNSKVCMutableCollectionPropertyInfo initWithClass:]([_DYNSKVCMutableCollectionPropertyInfo alloc], "initWithClass:", a3);
    NSMapInsertKnownAbsent((NSMapTable *)_DYNSKVCMutableCollectionPropertyClassMap, a3, v5);

  }
  GPUTools::DYLockUtils::Unlock((GPUTools::DYLockUtils *)&_DYNSKVCMutableCollectionPropertyClassMapLock, v4);
  return v5;
}

- (_DYNSKVCMutableCollectionPropertyInfo)initWithClass:(Class)a3
{
  _DYNSKVCMutableCollectionPropertyInfo *v4;
  _DYNSKVCMutableCollectionPropertyInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_DYNSKVCMutableCollectionPropertyInfo;
  v4 = -[_DYNSKVCMutableCollectionPropertyInfo init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_class = a3;
    v4->_selectorBindingsMap = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 16);
    v5->_propertyBindingsMap = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 0, 16);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DYNSKVCMutableCollectionPropertyInfo;
  -[_DYNSKVCMutableCollectionPropertyInfo dealloc](&v3, sel_dealloc);
}

- (id)_stringWithCapitalizedFirstLetter:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "substringToIndex:", 1), "uppercaseString"), "stringByAppendingString:", objc_msgSend(a3, "substringFromIndex:", 1));
}

- (void)dy_synthesizeMutableArrayProperty:(id)a3 withInstanceVariable:(id)a4
{
  _DYNSKVCMutableCollectionPropertyBinding *v6;
  id v7;
  SEL v8;
  SEL v9;
  SEL v10;
  SEL v11;
  SEL v12;
  SEL v13;
  SEL v14;
  SEL v15;
  SEL name;
  SEL v17;
  SEL v18;
  SEL v19;
  SEL v20;
  void *key;

  key = (void *)objc_msgSend(a3, "copy");
  v6 = -[_DYNSKVCMutableCollectionPropertyBinding initWithKey:underlyingIvarName:]([_DYNSKVCMutableCollectionPropertyBinding alloc], "initWithKey:underlyingIvarName:", key, a4);
  NSMapInsertKnownAbsent(self->_propertyBindingsMap, key, v6);
  v7 = -[_DYNSKVCMutableCollectionPropertyInfo _stringWithCapitalizedFirstLetter:](self, "_stringWithCapitalizedFirstLetter:", key);
  v8 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mutable%@"), v7));
  v9 = NSSelectorFromString((NSString *)key);
  v10 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("set%@:"), v7));
  v11 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("insertObject:in%@AtIndex:"), v7));
  v12 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("removeObjectFrom%@AtIndex:"), v7));
  v15 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("replaceObjectIn%@AtIndex:withObject:"), v7));
  name = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("insert%@:atIndexes:"), v7));
  v20 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("remove%@AtIndexes:"), v7));
  v19 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("replace%@AtIndexes:withObjects:"), v7));
  v18 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("countOf%@"), v7));
  v17 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("objectIn%@AtIndex:"), v7));
  v14 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@AtIndexes:"), key));
  v13 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("get%@:range:"), v7));
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v8, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v9, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v10, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v11, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v12, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v15, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, name, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v20, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v19, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v18, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v17, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v14, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v13, v6);
  class_addMethod(self->_class, v8, (IMP)DYKVCMutableCollections_Array_MutableGetter, "@@:");
  class_addMethod(self->_class, v9, (IMP)DYKVCMutableCollections_Array_Getter, "@@:");
  class_addMethod(self->_class, v10, (IMP)DYKVCMutableCollections_Array_Setter, "v@:@");
  class_addMethod(self->_class, v11, (IMP)DYKVCMutableCollections_Array_InsertObjectAtIndex, "v@:@Q");
  class_addMethod(self->_class, v12, (IMP)DYKVCMutableCollections_Array_RemoveObjectAtIndex, "v@:Q");
  class_addMethod(self->_class, v15, (IMP)DYKVCMutableCollections_Array_ReplaceObjectAtIndexWithObject, "v@:Q@");
  class_addMethod(self->_class, name, (IMP)DYKVCMutableCollections_Array_InsertObjectsAtIndexes, "v@:@@");
  class_addMethod(self->_class, v20, (IMP)DYKVCMutableCollections_Array_RemoveObjectsAtIndexes, "v@:@");
  class_addMethod(self->_class, v19, (IMP)DYKVCMutableCollections_Array_ReplaceObjectsAtIndexesWithObjects, "v@:@@");
  class_addMethod(self->_class, v18, (IMP)DYKVCMutableCollections_Array_Count, "Q@:");
  class_addMethod(self->_class, v17, (IMP)DYKVCMutableCollections_Array_ObjectAtIndex, "@@:Q");
  class_addMethod(self->_class, v14, (IMP)DYKVCMutableCollections_Array_ObjectsAtIndexes, "Q@:@");
  class_addMethod(self->_class, v13, (IMP)DYKVCMutableCollections_Array_GetObjectsRange, "v@:^@{_NSRange=QQ}");

}

- (void)dy_synthesizeMutableSetProperty:(id)a3 withInstanceVariable:(id)a4
{
  _DYNSKVCMutableCollectionPropertyBinding *v6;
  id v7;
  SEL v8;
  SEL v9;
  SEL v10;
  SEL v11;
  SEL v12;
  SEL v13;
  SEL v14;
  SEL key;
  SEL name;
  SEL v17;
  SEL v18;
  NSString *aSelectorName;

  aSelectorName = (NSString *)objc_msgSend(a3, "copy");
  v6 = -[_DYNSKVCMutableCollectionPropertyBinding initWithKey:underlyingIvarName:]([_DYNSKVCMutableCollectionPropertyBinding alloc], "initWithKey:underlyingIvarName:", aSelectorName, a4);
  v7 = -[_DYNSKVCMutableCollectionPropertyInfo _stringWithCapitalizedFirstLetter:](self, "_stringWithCapitalizedFirstLetter:", aSelectorName);
  v8 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mutable%@"), v7));
  v9 = NSSelectorFromString(aSelectorName);
  v10 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("set%@:"), v7));
  v11 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("add%@Object:"), v7));
  key = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("remove%@Object:"), v7));
  v14 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("add%@:"), v7));
  name = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("remove%@:"), v7));
  v17 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("intersect%@:"), v7));
  v18 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("countOf%@"), v7));
  v12 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("enumeratorOf%@"), v7));
  v13 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("memberOf%@:"), v7));
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v8, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v9, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v10, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v11, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, key, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v14, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, name, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v17, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v18, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v12, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v13, v6);
  class_addMethod(self->_class, v8, (IMP)DYKVCMutableCollections_Set_MutableGetter, "@@:");
  class_addMethod(self->_class, v9, (IMP)DYKVCMutableCollections_Set_Getter, "@@:");
  class_addMethod(self->_class, v10, (IMP)DYKVCMutableCollections_Set_Setter, "v@:@");
  class_addMethod(self->_class, v11, (IMP)DYKVCMutableCollections_Set_AddObject, "v@:@");
  class_addMethod(self->_class, key, (IMP)DYKVCMutableCollections_Set_RemoveObject, "v@:@");
  class_addMethod(self->_class, v14, (IMP)DYKVCMutableCollections_Set_AddObjects, "v@:@");
  class_addMethod(self->_class, name, (IMP)DYKVCMutableCollections_Set_RemoveObjects, "v@:@");
  class_addMethod(self->_class, v17, (IMP)DYKVCMutableCollections_Set_IntersectObjects, "v@:@");
  class_addMethod(self->_class, v18, (IMP)DYKVCMutableCollections_Set_Count, "Q@:");
  class_addMethod(self->_class, v12, (IMP)DYKVCMutableCollections_Set_ObjectEnumerator, "@@:");
  class_addMethod(self->_class, v13, (IMP)DYKVCMutableCollections_Set_Member, "@@:@");

}

- (id)bindingForSelector:(SEL)a3
{
  void *v5;
  Class Superclass;

  v5 = NSMapGet(self->_selectorBindingsMap, a3);
  if (!v5)
  {
    Superclass = class_getSuperclass(self->_class);
    if (Superclass)
      v5 = (void *)objc_msgSend(+[_DYNSKVCMutableCollectionPropertyInfo mutableCollectionPropertyInfoForClass:](_DYNSKVCMutableCollectionPropertyInfo, "mutableCollectionPropertyInfoForClass:", Superclass), "bindingForSelector:", a3);
    else
      v5 = 0;
    NSMapInsertKnownAbsent(self->_selectorBindingsMap, a3, v5);
  }
  return v5;
}

- (id)bindingForProperty:(id)a3
{
  void *v5;
  Class Superclass;

  v5 = NSMapGet(self->_propertyBindingsMap, a3);
  if (!v5)
  {
    Superclass = class_getSuperclass(self->_class);
    if (Superclass)
      v5 = (void *)objc_msgSend(+[_DYNSKVCMutableCollectionPropertyInfo mutableCollectionPropertyInfoForClass:](_DYNSKVCMutableCollectionPropertyInfo, "mutableCollectionPropertyInfoForClass:", Superclass), "bindingForProperty:", a3);
    else
      v5 = 0;
    NSMapInsertKnownAbsent(self->_propertyBindingsMap, a3, v5);
  }
  return v5;
}

@end
