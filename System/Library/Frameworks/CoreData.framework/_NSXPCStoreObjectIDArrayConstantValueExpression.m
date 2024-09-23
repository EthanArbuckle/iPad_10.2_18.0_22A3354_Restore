@implementation _NSXPCStoreObjectIDArrayConstantValueExpression

- (_NSXPCStoreObjectIDArrayConstantValueExpression)initWithCoder:(id)a3
{
  _NSXPCStoreObjectIDArrayConstantValueExpression *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _NSXPCStoreObjectIDArrayConstantValueExpression *v12;
  objc_super v14;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"));
  v14.receiver = self;
  v14.super_class = (Class)_NSXPCStoreObjectIDArrayConstantValueExpression;
  v5 = -[_NSXPCStoreObjectIDArrayConstantValueExpression init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(a3, "allowedClasses");
    v7 = (void *)-[objc_class _constantValueClassesForSecureCoding](NSClassFromString((NSString *)CFSTR("_NSPredicateUtilities")), "_constantValueClassesForSecureCoding");
    v8 = (id)objc_msgSend(v7, "setByAddingObject:", objc_opt_class());
    if (v6 && objc_msgSend(v6, "count"))
    {
      v8 = (id)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v8, "unionSet:", v6);
    }
    v9 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v8, CFSTR("NSConstantValue_XPCStoreObjectIDs"));
    if (v9)
    {
      v10 = +[NSManagedObjectID unarchivedScalarObjectIDsFromData:withCoordinator:]((uint64_t)NSManagedObjectID, v9, (_QWORD *)objc_msgSend((id)objc_msgSend(a3, "delegate"), "persistentStoreCoordinator"));
      if (v10)
        v11 = v10;
      else
        v11 = NSArray_EmptyArray;
    }
    else
    {
      v11 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v8, CFSTR("NSConstantValue"));
    }
  }
  else
  {
    v11 = 0;
  }
  v12 = (_NSXPCStoreObjectIDArrayConstantValueExpression *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3540]), "initWithObject:", v11);
  NSDeallocateObject(v5);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v5;
  objc_ivar *InstanceVariable;
  id Ivar;
  id v8;
  id v9;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"));
  v5 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v5, "constantValue");
  Ivar = object_getIvar(self, InstanceVariable);
  if (((objc_msgSend(Ivar, "isNSArray") & 1) != 0 || objc_msgSend(Ivar, "isNSSet"))
    && (v8 = +[NSManagedObjectID _newArchiveForScalarObjectIDs:]((uint64_t)NSManagedObjectID, Ivar)) != 0)
  {
    v9 = v8;
    objc_msgSend(a3, "encodeObject:forKey:", v8, CFSTR("NSConstantValue_XPCStoreObjectIDs"));

  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", Ivar, CFSTR("NSConstantValue"));
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_class *v3;
  objc_ivar *InstanceVariable;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v3, "constantValue");

  v5.receiver = self;
  v5.super_class = (Class)_NSXPCStoreObjectIDArrayConstantValueExpression;
  -[_NSXPCStoreObjectIDArrayConstantValueExpression dealloc](&v5, sel_dealloc);
}

@end
