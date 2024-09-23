@implementation _NSFaultingMutableSetMutationMethods

+ (id)_createMutationMethodsForClass:(Class)a3 forKey:(id)a4
{
  _NSFaultingMutableSetMutationMethods *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  CFIndex v10;
  Method v11;
  Method v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(_NSFaultingMutableSetMutationMethods);
  v7 = objc_msgSend(a4, "length");
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v14 - v8;
  CFStringGetCString((CFStringRef)a4, (char *)v14 - v8, v10, 0x8000100u);
  if (v7)
    *v9 = __toupper(*v9);
  v6->_addObjectMethod = _PFKeyValueMethodForPattern(a3, "add%sObject:", v9);
  v11 = _PFKeyValueMethodForPattern(a3, "add%s:", v9);
  v6->_addMethod = v11;
  if ((unint64_t)v6->_addObjectMethod | (unint64_t)v11
    && (v6->_removeObjectMethod = _PFKeyValueMethodForPattern(a3, "remove%sObject:", v9),
        v12 = _PFKeyValueMethodForPattern(a3, "remove%s:", v9),
        v6->_removeMethod = v12,
        (unint64_t)v6->_removeObjectMethod | (unint64_t)v12))
  {
    v6->_intersectMethod = _PFKeyValueMethodForPattern(a3, "intersect%s:", v9);
    v6->_setMethod = _PFKeyValueMethodForPattern(a3, "set%s:", v9);
  }
  else
  {

    return 0;
  }
  return v6;
}

@end
