@implementation NSArray(NSKeyValueObserverRegistration)

- (uint64_t)removeObserver:()NSKeyValueObserverRegistration fromObjectsAtIndexes:forKeyPath:context:
{
  uint64_t v11;
  malloc_zone_t *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  objc_class *Class;
  objc_class *v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v11 = _CFGetTSD();
  if (!v11)
  {
    v12 = malloc_default_zone();
    v11 = (uint64_t)malloc_type_zone_calloc(v12, 1uLL, 0x58uLL, 0xC2E5A2B2uLL);
    _CFSetTSD();
  }
  v21 = *(_QWORD *)(v11 + 32);
  v22 = *(_QWORD *)(v11 + 40);
  v23 = *(_QWORD *)(v11 + 48);
  v24 = *(_QWORD *)(v11 + 56);
  v25 = *(_QWORD *)(v11 + 64);
  v26 = *(_BYTE *)(v11 + 72);
  os_unfair_recursive_lock_lock_with_options();
  *(_QWORD *)(v11 + 40) = a3;
  *(_QWORD *)(v11 + 48) = a5;
  v13 = a5;
  *(_QWORD *)(v11 + 56) = 0;
  *(_QWORD *)(v11 + 64) = a6;
  *(_BYTE *)(v11 + 72) = 1;
  v14 = objc_msgSend(a4, "firstIndex");
  v15 = 0;
  v16 = 0;
  while (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)objc_msgSend(a1, "objectAtIndex:", v14);
    Class = object_getClass(v17);
    v19 = Class;
    if (Class != v15)
    {
      v16 = NSKeyValuePropertyForIsaAndKeyPath(Class, v13);
      v15 = v19;
    }
    *(_QWORD *)(v11 + 32) = v17;
    objc_msgSend(v17, "_removeObserver:forProperty:", a3, v16, v21, v22, v23, v24, v25);
    v14 = objc_msgSend(a4, "indexGreaterThanIndex:", v14);
  }
  result = os_unfair_recursive_lock_unlock();
  *(_QWORD *)(v11 + 32) = v21;
  *(_QWORD *)(v11 + 40) = v22;
  *(_QWORD *)(v11 + 48) = v23;
  *(_QWORD *)(v11 + 56) = v24;
  *(_QWORD *)(v11 + 64) = v25;
  *(_BYTE *)(v11 + 72) = v26;
  return result;
}

- (uint64_t)addObserver:()NSKeyValueObserverRegistration toObjectsAtIndexes:forKeyPath:options:context:
{
  uint64_t v13;
  objc_class *v14;
  void *v15;
  objc_class *Class;
  objc_class *v17;

  os_unfair_recursive_lock_lock_with_options();
  v13 = objc_msgSend(a4, "firstIndex");
  v14 = 0;
  v15 = 0;
  while (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    Class = object_getClass((id)objc_msgSend(a1, "objectAtIndex:", v13));
    v17 = Class;
    if (Class != v14)
    {
      v15 = NSKeyValuePropertyForIsaAndKeyPath(Class, a5);
      v14 = v17;
    }
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", v13), "_addObserver:forProperty:options:context:", a3, v15, a6, a7);
    v13 = objc_msgSend(a4, "indexGreaterThanIndex:", v13);
  }
  return os_unfair_recursive_lock_unlock();
}

- (uint64_t)removeObserver:()NSKeyValueObserverRegistration fromObjectsAtIndexes:forKeyPath:
{
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_class *Class;
  objc_class *v14;

  os_unfair_recursive_lock_lock_with_options();
  v9 = objc_msgSend(a4, "firstIndex");
  v10 = 0;
  v11 = 0;
  while (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)objc_msgSend(a1, "objectAtIndex:", v9);
    Class = object_getClass(v12);
    v14 = Class;
    if (Class != v10)
    {
      v11 = NSKeyValuePropertyForIsaAndKeyPath(Class, a5);
      v10 = v14;
    }
    objc_msgSend(v12, "_removeObserver:forProperty:", a3, v11);
    v9 = objc_msgSend(a4, "indexGreaterThanIndex:", v9);
  }
  return os_unfair_recursive_lock_unlock();
}

- (void)addObserver:()NSKeyValueObserverRegistration forKeyPath:options:context:
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[<%@ %p> addObserver:forKeyPath:options:context:] is not supported. Key path: %@"), objc_opt_class(), a1, a4), 0);
  objc_exception_throw(v4);
}

- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:context:
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[<%@ %p> removeObserver:forKeyPath:context:] is not supported. Key path: %@"), objc_opt_class(), a1, a4), 0);
  objc_exception_throw(v4);
}

- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[<%@ %p> removeObserver:forKeyPath:] is not supported. Key path: %@"), objc_opt_class(), a1, a4), 0);
  objc_exception_throw(v4);
}

@end
