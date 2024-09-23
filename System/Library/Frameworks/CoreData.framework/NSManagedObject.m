@implementation NSManagedObject

- (void)release
{
  int *p_cd_rc;
  unsigned int v4;
  _BYTE *v5;
  id cd_queueReference;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  id v10;

  p_cd_rc = &self->_cd_rc;
  do
    v4 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v4 - 2, (unsigned int *)p_cd_rc));
  v5 = (_BYTE *)MEMORY[0x1E0C9A980];
  if (*MEMORY[0x1E0C9A980])
  {
    NSRecordAllocationEvent();
    if (v4)
      return;
  }
  else if (v4)
  {
    return;
  }
  if ((self->_cd_stateFlags & 0x100000) != 0)
  {
    do
      v9 = __ldaxr((unsigned int *)p_cd_rc);
    while (__stlxr(v9 + 0x20000000, (unsigned int *)p_cd_rc));
  }
  else
  {
    cd_queueReference = self->_cd_queueReference;
    if (cd_queueReference)
    {
      do
        v7 = __ldaxr((unsigned int *)p_cd_rc);
      while (__stlxr(v7 + 2, (unsigned int *)p_cd_rc));
      if (*v5)
      {
        v10 = cd_queueReference;
        NSRecordAllocationEvent();
        cd_queueReference = v10;
      }
      -[_PFManagedObjectReferenceQueue _queueForDealloc:]((uint64_t)cd_queueReference, (unsigned int *)self);
    }
    else
    {
      while (1)
      {
        v8 = __ldaxr((unsigned int *)p_cd_rc);
        if (v8 != -2)
          break;
        if (!__stlxr(1u, (unsigned int *)p_cd_rc))
        {
          -[NSManagedObject dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
  }
}

- (unint64_t)hash
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;

  v2 = (2 * ((unint64_t)self >> 4)) & 0xAAAAAAAA | (((unint64_t)self >> 4) >> 1) & 0x55555555;
  v3 = (4 * v2) & 0xCCCCCCCC | (v2 >> 2) & 0x33333333;
  v4 = (16 * v3) & 0xF0F0F0F0 | (v3 >> 4) & 0xF0F0F0F;
  return (v4 << 8) & 0xFF0000 | (v4 << 24) | (v4 >> 8) & 0xFF00 | HIBYTE(v4);
}

- (id)_initWithEntity:(id)a3 withID:(id)a4 withHandler:(id)a5 withContext:(id)a6
{
  void *v7;
  id result;
  _QWORD *v10;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NSManagedObject;
  result = -[NSManagedObject init](&v11, sel_init, a3, a4, a5);
  if (result)
  {
    v10 = result;
    *((_QWORD *)result + 4) = a6;
    if (!v7)
      v7 = _PFFastTemporaryIDCreation(a3);
    v10[5] = v7;
    *((_DWORD *)v10 + 4) |= 0x8400u;
    return (id)objc_msgSend(v10, "initWithEntity:insertIntoManagedObjectContext:", a3, a6);
  }
  return result;
}

- (NSManagedObject)initWithEntity:(NSEntityDescription *)entity insertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
  NSManagedObject *v4;
  NSManagedObjectModel *v7;
  unint64_t *v8;
  objc_class *Class;
  objc_class *v10;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  objc_super v21;

  v4 = self;
  if ((self->_cd_stateFlags & 0x400) != 0)
    return v4;
  if (!entity)
  {
    v12 = objc_opt_class();
    if ((v4->_cd_stateFlags & 0x100000) == 0)

    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An NSManagedObject of class '%@' must have a valid NSEntityDescription."), v12);
    v16 = v13;
    v17 = v14;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&entity->_entityDescriptionFlags & 4) == 0)
  {
    if (-[NSEntityDescription managedObjectModel](entity, "managedObjectModel"))
      v7 = -[NSEntityDescription managedObjectModel](entity, "managedObjectModel");
    else
      v7 = (NSManagedObjectModel *)entity;
    -[NSManagedObjectModel _setIsEditable:](v7, "_setIsEditable:", 0);
  }
  v8 = _PFFastEntityClass((unint64_t *)entity);
  if (_MergedGlobals_73 == 1)
  {
    Class = object_getClass(v4);
    if ((v4->_cd_stateFlags & 0x100000) != 0)
    {
LABEL_14:
      v4 = (NSManagedObject *)objc_msgSend(v8, "allocWithEntity:", entity);
      goto LABEL_15;
    }
    v10 = Class;
    if (Class == (objc_class *)v8)
      goto LABEL_15;
    if (Class == class_getSuperclass((Class)v8) || v10 == object_getClass((id)qword_1ECD8D9B0))
    {
      _PFDeallocateObject(v4);
      goto LABEL_14;
    }
    v18 = objc_opt_class();
    v4->_cd_stateFlags = v4->_cd_stateFlags & 0xFFFC7FFF | 0x8000;

    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSEntityDescription '%@' can only support a single custom class (tried to instantiate class '%@'). Use a subentity with 0 properties to further specialize the NSManagedObject subclass."), -[NSEntityDescription name](entity, "name"), v18);
    v16 = v19;
    v17 = v20;
LABEL_24:
    objc_exception_throw((id)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v15, 0));
  }
  object_setClass(v4, (Class)v8);
LABEL_15:
  v21.receiver = v4;
  v21.super_class = (Class)NSManagedObject;
  v4 = -[NSManagedObject init](&v21, sel_init);
  if (v4)
  {
    v4->_cd_objectID = (NSManagedObjectID *)_PFFastTemporaryIDCreation(entity);
    v4->_cd_stateFlags |= 0x8400u;
    if (context)
      -[NSManagedObjectContext insertObject:](context, "insertObject:", v4);
    else
      _PFFaultHandlerFulfillFault(0, (uint64_t)v4, 0, 0, 1);
  }
  return v4;
}

+ (id)allocWithEntity:(id)a3
{
  unint64_t *v5;
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  int InstanceSize;
  objc_class *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v5 = _PFFastEntityClass((unint64_t *)a3);
  if (!v5)
  {
    v12 = (objc_class *)a1;
    return _PFAllocateObject(v12, 0);
  }
  v6 = v5;
  if ((*((_BYTE *)a3 + 120) & 4) == 0)
  {
    v13 = objc_msgSend(a3, "managedObjectModel");
    v14 = a3;
    if (v13)
      v14 = (id)objc_msgSend(a3, "managedObjectModel");
    objc_msgSend(v14, "_setIsEditable:", 0);
  }
  v7 = objc_msgSend(v6, "_PFMOClassFactoryData");
  if (!v7)
  {
    v12 = (objc_class *)v6;
    return _PFAllocateObject(v12, 0);
  }
  v8 = v7;
  if (!*(_QWORD *)(v7 + 24))
  {
    v15 = *((_QWORD *)a3 + 14);
    if (v15)
      v16 = *(_QWORD *)(v15 + 8);
    else
      v16 = objc_msgSend((id)objc_msgSend(a3, "propertiesByName"), "count");
    if (v16 <= 1)
      v17 = 1;
    else
      v17 = v16;
    *(_QWORD *)(v8 + 24) = 8 * v17;
  }
  v9 = _PFAllocateObject((Class)v6, 0);
  InstanceSize = class_getInstanceSize((Class)v6);
  v9[4] = *(_DWORD *)(v8 + 40) | (*(unsigned __int8 *)(v8 + 32) << 24);
  v9[5] = (InstanceSize + 7) & 0xFFFFFFF8;
  return v9;
}

+ (BOOL)_classShouldAlwaysRegisterSelectorNamed:(const char *)a3
{
  size_t v5;
  uint64_t v6;
  BOOL result;
  uint64_t v8;
  __darwin_ct_rune_t v9;

  v5 = strlen(a3);
  if (v5 >= 0x21 && !strncmp("automaticallyNotifiesObserversOf", a3, 0x20uLL))
    return 1;
  v6 = objc_msgSend(a1, "_PFMOClassFactoryData");
  if (v6)
  {
    if ((*(_BYTE *)(v6 + 96) & 0x40) != 0)
      return 1;
  }
  result = 0;
  if (v5 >= 0xA && !BYTE1(dword_1ECD8DE20))
  {
    v8 = 9;
    result = (!strncmp("primitive", a3, 9uLL) || v5 >= 0xD && (v8 = 12, !strncmp("setPrimitive", a3, 0xCuLL)))
          && (v9 = a3[v8]) != 0
          && v9 == (char)__toupper(v9);
  }
  return result;
}

+ ($700C04AD426E99CC503AA327DD0ADAFC)_PFMOClassFactoryData
{
  return 0;
}

+ (BOOL)_isGeneratedClass
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return self->_cd_rc & 1;
}

- (NSKnownKeysDictionary)_newPropertiesForRetainedTypes:(unsigned int *)a3 andCopiedTypes:(char)a4 preserveFaults:
{
  unint64_t *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSKnownKeysDictionary *v35;
  void *v36;
  NSKnownKeysDictionary *v37;
  unint64_t v38;
  void *v39;
  unint64_t v41;
  void *v42;
  unint64_t *v43;
  unsigned int *v44;
  unsigned int *v45;
  uint64_t v46;

  v44 = a2;
  v45 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__newPropertiesForRetainedTypes_andCopiedTypes_preserveFaults_);
  if ((*((_BYTE *)a1 + 17) & 0x80) != 0)
    -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, a1, a1[4]);
  v6 = (unint64_t *)_PFEntityForManagedObject(a1);
  v7 = _kvcPropertysPrimitiveGetters(v6);
  if (v6)
    v8 = (void *)v6[13];
  else
    v8 = 0;
  v9 = objc_msgSend(v8, "length");
  v43 = &v41;
  v10 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v41 - v12;
  v41 = v10;
  if (v10 > 0x200)
    v13 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v41 - v12, 8 * v11);
  v42 = v8;
  if (v6)
    v18 = v6[14];
  else
    v18 = 0;
  v19 = NSKeyValueCoding_NullValue;
  v20 = *v44;
  if ((_DWORD)v20)
  {
    v21 = 1;
    do
    {
      v22 = (unint64_t *)(v18 + 16 * v44[v21]);
      v24 = *v22;
      v23 = v22[1];
      if (*v22 < v23 + *v22)
      {
        do
        {
          _PF_Handler_Primitive_GetProperty((id **)a1, v24, 0, *(_QWORD *)(v7 + 8 * v24), v14, v15, v16, v17);
          v26 = (id)v19;
          if (v25)
            v26 = v25;
          *(_QWORD *)&v13[8 * v24++] = v26;
          --v23;
        }
        while (v23);
      }
      v27 = v21++ == v20;
    }
    while (!v27);
  }
  v44 = (unsigned int *)*v45;
  if ((_DWORD)v44)
  {
    v28 = 1;
    do
    {
      v29 = (unint64_t *)(v18 + 16 * v45[v28]);
      v31 = *v29;
      v30 = v29[1];
      if (*v29 < v30 + *v29)
      {
        do
        {
          _PF_Handler_Primitive_GetProperty((id **)a1, v31, 0, *(_QWORD *)(v7 + 8 * v31), v14, v15, v16, v17);
          v33 = v32;
          v34 = v19;
          if (v33)
          {
            if ((a4 & 1) == 0 && objc_msgSend(v33, "isFault"))
              objc_msgSend(v33, "count");
            v34 = objc_msgSend(v33, "copy", v41);
          }
          *(_QWORD *)&v13[8 * v31++] = v34;
          --v30;
        }
        while (v30);
      }
      v27 = v28++ == (_QWORD)v44;
    }
    while (!v27);
  }
  v35 = [NSKnownKeysDictionary alloc];
  v36 = v42;
  v37 = -[NSKnownKeysDictionary initWithSearchStrategy:](v35, "initWithSearchStrategy:", v42);
  -[NSKnownKeysDictionary setValues:](v37, "setValues:", v13);
  if (objc_msgSend(v36, "length"))
  {
    v38 = 0;
    do
    {
      v39 = *(void **)&v13[8 * v38];
      if (v39 != (void *)v19)

      ++v38;
    }
    while (v38 < objc_msgSend(v36, "length", v41));
  }
  if (v41 >= 0x201)
    NSZoneFree(0, v13);
  return v37;
}

- (id)valueForKey:(NSString *)key
{
  id v5;
  unint64_t *v6;
  uint64_t v7;
  unint64_t v9;
  uint64_t v10;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v5 = _PFEntityForManagedObject(self);
  if (v5
    && (v6 = (unint64_t *)v5, v7 = objc_msgSend(*((id *)v5 + 13), "indexForKey:", key),
                                     v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = v7;
    v10 = *(_QWORD *)(_kvcPropertysPublicGetters(v6) + 8 * v7);
    return _PF_Handler_Public_GetProperty((id **)self, v9, (uint64_t)key, v10);
  }
  else
  {
    object_getClass(self);
    _NSKeyValueGetterForClassAndKey();
    return (id)_NSGetUsingKeyValueGetter();
  }
}

- (void)observationInfo
{
  $1A22B458595D9B8B5E31AEBB12624A52 *cd_extras;

  cd_extras = self->_cd_extras;
  if (cd_extras)
    return cd_extras->var0;
  else
    return 0;
}

- (void)dealloc
{
  unsigned int v3;
  _QWORD *v5;
  uint64_t v6;
  $1A22B458595D9B8B5E31AEBB12624A52 *cd_extras;
  malloc_zone_t *v8;
  unsigned int *cd_queueReference;
  unsigned int *v10;
  int v11;

  self->_cd_rc = 536870913;
  self->_cd_managedObjectContext = 0;
  v3 = (self->_cd_stateFlags >> 15) & 7;
  if (v3 == 5 || v3 == 0)
    -[NSFaultHandler turnObject:intoFaultWithContext:](_insertion_fault_handler, (uint64_t)self, 0);
  if (self->_cd_extras || self->_cd_rawData)
  {
    v5 = _PFEntityForManagedObject(self);
    if (v5)
    {
      v6 = v5[14];
      if (v6)
        -[NSManagedObject _clearRawPropertiesWithHint:]((uint64_t)self, *(_QWORD *)v6, *(_QWORD *)(v6 + 8));
    }
  }
  cd_extras = self->_cd_extras;
  if (cd_extras)
  {

    v8 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v8 = malloc_default_zone();
    malloc_zone_free(v8, self->_cd_extras);
    self->_cd_extras = 0;
  }
  cd_queueReference = (unsigned int *)self->_cd_queueReference;
  if (cd_queueReference)
  {
    v10 = cd_queueReference + 2;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (v11 <= 0)
    {
      cd_queueReference[2] += 0x20000000;
      objc_msgSend(cd_queueReference, "dealloc");
    }
  }

  _PFDeallocateObject(self);
}

- (void)_clearRawPropertiesWithHint:(uint64_t)a3
{
  uint64_t v6;
  malloc_zone_t *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  int v18;

  if (a1)
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {

      *(_QWORD *)(v6 + 8) = 0;
      *(_QWORD *)(v6 + 16) = 0;

      *(_QWORD *)(v6 + 24) = 0;
      if (!*(_QWORD *)v6 && !*(_QWORD *)(v6 + 32))
      {
        v7 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
        if (!_PF_Private_Malloc_Zone)
          v7 = malloc_default_zone();
        malloc_zone_free(v7, *(void **)(a1 + 48));
        *(_QWORD *)(a1 + 48) = 0;
      }
    }
    v8 = *(void **)(a1 + 24);
    if (v8)
    {
      v9 = a2 + a3;
      if (a2 < a2 + a3)
      {
        v10 = *(unsigned int *)(a1 + 20);
        if ((_DWORD)v10)
          v11 = a1 + v10;
        else
          v11 = 0;
        v12 = ((unint64_t)*(unsigned int *)(a1 + 16) >> 22) & 0x3FC;
        v13 = v11 - v12;
        v14 = v9 - 1;
        v15 = (int)a2 >> 3;
        v16 = v14 >> 3;
        v17 = 0xFFu >> (8 - (a2 & 7));
        if (v14 >> 3 == (int)a2 >> 3)
        {
          v18 = (510 << (v14 & 7)) | v17;
        }
        else
        {
          *(_BYTE *)(v13 + v15) &= v17;
          if (v15 + 1 < v16)
            bzero((void *)(v15 - v12 + v11 + 1), (v16 - v15 - 2) + 1);
          v18 = 510 << (v14 & 7);
          v15 = v14 >> 3;
        }
        *(_BYTE *)(v13 + v15) &= v18;
        v8 = *(void **)(a1 + 24);
      }

      *(_QWORD *)(a1 + 24) = 0;
    }
    *(_DWORD *)(a1 + 12) = 0;
  }
}

- (NSManagedObjectContext)managedObjectContext
{
  if (self)
  {
    if ((self->_cd_rc & 0x80) != 0)
      return 0;
    else
      return (NSManagedObjectContext *)self->_parentObjectStore;
  }
  return self;
}

- (id)_genericValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;

  if (a5 && (self->_cd_stateFlags & 0x40) == 0)
    return (id)_sharedIMPL_vfk_core((id **)self, (uint64_t)a2, a4);
  _sharedIMPL_pvfk_core((uint64_t)self, (uint64_t)a2, a4, a4, a5, v5, v6, v7);
  return result;
}

- (void)awakeFromFetch
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
}

- (NSManagedObjectID)objectID
{
  return self->_cd_objectID;
}

double __80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke_3(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9;
  char *v10;
  Class Class;

  v9 = *(_QWORD *)(a1 + 32);
  if (!_pvfk_header(a2, v9, a3, a4, a5, a6, a7, a8))
    return 0.0;
  v10 = (char *)*((_QWORD *)a2 + 3);
  Class = object_getClass(v10);
  return *(double *)&v10[*((unsigned int *)object_getIndexedIvars(Class) + v9 + 19)];
}

- (uint64_t)_commitPhotoshoperyForRelationshipAtIndex:(void *)a3 newValue:
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 48);
    if (v4)
    {
      v7 = *(_QWORD *)(v4 + 8);
      if (v7)
      {
        v8 = v7 + 24;
        v9 = *(void **)(v7 + 24 + 8 * a2);
        if (v9 != a3)
        {
          result = objc_msgSend(*(id *)(v8 + 8 * a2), "isFault");
          if ((_DWORD)result)
          {

            result = objc_msgSend(a3, "copy");
            *(_QWORD *)(v8 + 8 * a2) = result;
          }
        }
      }
      v10 = *(_QWORD *)(v3 + 48);
      if (v10)
      {
        v11 = *(_QWORD *)(v10 + 16);
        if (v11)
        {
          v12 = v11 + 24;
          v13 = *(void **)(v11 + 24 + 8 * a2);
          if (v13 != a3)
          {
            result = objc_msgSend(*(id *)(v12 + 8 * a2), "isFault");
            if ((_DWORD)result)
            {

              result = objc_msgSend(a3, "copy");
              *(_QWORD *)(v12 + 8 * a2) = result;
            }
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)_isValidRelationshipDestination__
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;

  if (result)
  {
    v1 = result;
    if ((*(_BYTE *)(result + 16) & 0x80) != 0)
      v2 = 0;
    else
      v2 = *(_QWORD *)(result + 32);
    if (objc_msgSend(*(id *)(result + 40), "isTemporaryID") && (*(_BYTE *)(v1 + 16) & 0x12) == 0)
    {
      if (v2)
        v3 = (*(unsigned __int8 *)(v2 + 42) >> 3) & 1;
      else
        v3 = 0;
    }
    else
    {
      v3 = 1;
    }
    if (v2)
      return v3;
    else
      return 0;
  }
  return result;
}

- (BOOL)isInserted
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  return (self->_cd_stateFlags & 0x12) != 0;
}

+ (id)_retain_1
{
  unsigned int *v3;
  unsigned int v4;

  v3 = (unsigned int *)objc_msgSend(a1, "_PFMOClassFactoryData");
  do
    v4 = __ldxr(v3);
  while (__stxr(v4 + 1, v3));
  return a1;
}

- (id)_implicitObservationInfo
{
  NSManagedObjectContext *cd_managedObjectContext;
  _QWORD *v3;
  uint64_t v5;

  v5 = 0;
  if (!self || (self->_cd_stateFlags & 0x80) != 0)
    cd_managedObjectContext = 0;
  else
    cd_managedObjectContext = self->_cd_managedObjectContext;
  v3 = _PFEntityForManagedObject(self);
  return (id)-[NSManagedObjectContext _implicitObservationInfoForEntity:forResultingClass:]((uint64_t)cd_managedObjectContext, v3, &v5);
}

- (uint64_t)_validateForSave:(_QWORD *)a1
{
  unint64_t *v4;
  unint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  if (!a1)
  {
LABEL_25:
    v18 = 0;
    return v18 & 1;
  }
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__validateForSave_);
  v26 = 0;
  if ((*((_BYTE *)a1 + 17) & 0x80) != 0)
    -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, a1, a1[4]);
  v25 = a2;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__validatePropertiesWithError_);
  v4 = (unint64_t *)_PFEntityForManagedObject(a1);
  v5 = (unint64_t *)v4[14];
  v6 = *(_QWORD *)(v4[13] + 40);
  v7 = _kvcPropertysPrimitiveGetters(v4);
  v23 = _kvcPropertysPublicSetters(v4);
  v8 = v4[12];
  v10 = *v5;
  v9 = v5[1];
  v11 = -[objc_class _useFastValidationMethod](object_getClass(a1), "_useFastValidationMethod");
  if (v10 >= v9 + v10)
  {
    v18 = 1;
    return v18 & 1;
  }
  v16 = v11;
  v24 = v8 + 24;
  if (v25)
    v17 = &v28;
  else
    v17 = 0;
  v18 = 1;
  do
  {
    v28 = 0;
    v19 = *(_QWORD *)(v6 + 8 * v10);
    _PF_Handler_Primitive_GetProperty((id **)a1, v10, v19, *(_QWORD *)(v7 + 8 * v10), v12, v13, v14, v15);
    v21 = v20;
    v27 = v20;
    if (v16)
    {
      if ((-[NSManagedObject _validateValue:forProperty:andKey:withIndex:error:](a1, (uint64_t *)&v27, *(void **)(v24 + 8 * v10), v19, v10, v17) & 1) != 0)goto LABEL_18;
    }
    else if (objc_msgSend(a1, "validateValue:forKey:error:", &v27, v19, v17))
    {
LABEL_18:
      if (v21 != v27 && (objc_msgSend(v21, "isEqual:") & 1) == 0)
        _PF_Handler_Public_SetProperty((unsigned int *)a1, v10, v27, v19, *(_QWORD **)(v23 + 8 * v10));
      goto LABEL_21;
    }
    if (!v25)
      goto LABEL_25;
    -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](a1, v28, &v26);
    v18 = 0;
LABEL_21:
    ++v10;
    --v9;
  }
  while (v9);
  if (!((v25 == 0) | v18 & 1))
  {
    v18 = 0;
    *v25 = v26;
  }
  return v18 & 1;
}

- (uint64_t)_validateValue:(void *)a3 forProperty:(uint64_t)a4 andKey:(uint64_t)a5 withIndex:(_QWORD *)a6 error:
{
  uint64_t *v12;
  objc_class *Class;
  Class Superclass;
  unsigned __int8 v15;
  unint64_t *v16;
  uint64_t v17;
  int v18;
  id v19;
  int v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  objc_super v57;
  uint64_t v58;
  uint64_t v59[2];

  if (!a1)
    goto LABEL_62;
  v58 = 0;
  v59[0] = 0;
  if (a6)
    v12 = &v58;
  else
    v12 = 0;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    Class = object_getClass(a1);
    Superclass = class_getSuperclass(Class);
    if (Superclass == (Class)objc_opt_class())
    {
      LOBYTE(v18) = 1;
      return v18 & 1;
    }
    v57.receiver = a1;
    v57.super_class = (Class)NSManagedObject;
    v15 = objc_msgSendSuper2(&v57, sel_validateValue_forKey_error_, a2, a4, v12);
  }
  else
  {
    v16 = (unint64_t *)_PFEntityForManagedObject(a1);
    v17 = *(_QWORD *)(v16[19] + 32);
    if (!v17)
      v17 = _resolveValidationMethods(v16);
    if (!*(_QWORD *)(v17 + 8 * a5))
    {
      v19 = _PFEntityForManagedObject(a1);
      goto LABEL_22;
    }
    method_invoke();
  }
  LOBYTE(v18) = v15;
  if (a6 && (v15 & 1) == 0)
    -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](a1, v58, v59);
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_59;
  v19 = _PFEntityForManagedObject(a1);
  if ((v18 & 1) == 0)
  {
    if (!a6 || (objc_msgSend(a3, "_nonPredicateValidateValue:forKey:inObject:error:", a2, a4, a1, &v58) & 1) != 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_22:
  v20 = objc_msgSend(a3, "_nonPredicateValidateValue:forKey:inObject:error:", a2, a4, a1, v12);
  v18 = v20;
  if (a6 && (v20 & 1) == 0)
  {
LABEL_24:
    -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](a1, v58, v59);
LABEL_25:
    v18 = 0;
  }
  if (*a2)
  {
    if (a6)
      v21 = 1;
    else
      v21 = v18;
    if (v21 == 1)
    {
      v22 = (void *)objc_msgSend(a3, "_rawValidationPredicates");
      v50 = (uint64_t)a3;
      v56 = (void *)objc_msgSend(a3, "_rawValidationWarnings");
      v23 = objc_msgSend(v22, "count");
      if (v23)
      {
        v24 = v23;
        v55 = v19;
        v25 = 0;
        v52 = *MEMORY[0x1E0CB2D50];
        v51 = *MEMORY[0x1E0CB28A8];
        v54 = a4;
        while ((objc_msgSend((id)objc_msgSend(v22, "objectAtIndex:", v25), "evaluateWithObject:", *a2) & 1) != 0)
        {
LABEL_47:
          if (v24 == ++v25)
            goto LABEL_59;
        }
        if (!a6)
          goto LABEL_62;
        v26 = (void *)objc_msgSend(v56, "objectAtIndex:", v25);
        v27 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(v22, "objectAtIndex:", v25), CFSTR("NSValidationErrorPredicate"), 0);
        if (v26)
        {
          if (objc_msgSend(v26, "isNSString"))
          {
            v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v55, "managedObjectModel"), "_localizationPolicy"), "localizedModelStringForKey:", v26);
            if (v28)
              v29 = (void *)v28;
            else
              v29 = v26;
            v30 = *a2;
            v31 = (uint64_t)a1;
            v32 = 1550;
            goto LABEL_45;
          }
          if (!objc_msgSend(v26, "isNSNumber"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v47 = (void *)MEMORY[0x1E0C99DA0];
              v48 = *MEMORY[0x1E0C99768];
              v49 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Illegal validation warning: property = \"%@\"; predicate/warning index = %lu; warning = %@."),
                      v54,
                      v25,
                      v26);
              objc_exception_throw((id)objc_msgSend(v47, "exceptionWithName:reason:userInfo:", v48, v49, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v54, CFSTR("NSValidationErrorKey"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v25), CFSTR("index"), v26, CFSTR("warning"), *a2, CFSTR("NSValidationErrorValue"), 0)));
            }
            v53 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(v26, "userInfo"));
            v34 = *a2;
            v35 = (void *)MEMORY[0x1E0C99E08];
            if (!*a2)
              v34 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
            objc_msgSend(v53, "addEntriesFromDictionary:", objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", a1, CFSTR("NSValidationErrorObject"), v54, CFSTR("NSValidationErrorKey"), v34, CFSTR("NSValidationErrorValue"), 0));
            objc_msgSend(v53, "addEntriesFromDictionary:", v27);
            if (objc_msgSend(v53, "valueForKey:", v52)
              || objc_msgSend(v26, "domain") == v51
              && objc_msgSend(v26, "code") >= 1024
              && objc_msgSend(v26, "code") < 2048)
            {
              v36 = (void *)MEMORY[0x1E0CB35C8];
              v37 = objc_msgSend(v26, "domain");
              v38 = objc_msgSend(v26, "code");
              v39 = v36;
              v40 = v37;
              v41 = (uint64_t)v53;
            }
            else
            {
              v42 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v51, 1550, v53);
              objc_msgSend(v53, "setObject:forKey:", -[NSManagedObject _substituteEntityAndProperty:inString:](a1, v50, (void *)objc_msgSend(v42, "localizedDescription")), v52);
              v43 = (void *)MEMORY[0x1E0CB35C8];
              v44 = objc_msgSend(v26, "domain");
              v45 = objc_msgSend(v26, "code");
              v41 = objc_msgSend(v42, "userInfo");
              v39 = v43;
              v40 = v44;
              v38 = v45;
            }
            v33 = objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, v38, v41);
            v58 = v33;
            a4 = v54;
            goto LABEL_46;
          }
          v32 = objc_msgSend(v26, "intValue");
          v30 = *a2;
          v31 = (uint64_t)a1;
        }
        else
        {
          v30 = *a2;
          v31 = (uint64_t)a1;
          v32 = 1550;
        }
        v29 = 0;
LABEL_45:
        v33 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:](v31, v32, v29, a4, v30, v27);
        v58 = v33;
LABEL_46:
        -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](a1, v33, v59);
        LOBYTE(v18) = 0;
        goto LABEL_47;
      }
      goto LABEL_59;
    }
LABEL_62:
    LOBYTE(v18) = 0;
    return v18 & 1;
  }
LABEL_59:
  if (a6 && (v18 & 1) == 0)
  {
    LOBYTE(v18) = 0;
    *a6 = v59[0];
  }
  return v18 & 1;
}

+ (BOOL)_useFastValidationMethod
{
  return 1;
}

- (NSManagedObject)retain
{
  int *p_cd_rc;
  unsigned int v4;

  p_cd_rc = &self->_cd_rc;
  do
    v4 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v4 + 2, (unsigned int *)p_cd_rc));
  if (*MEMORY[0x1E0C9A980])
    NSRecordAllocationEvent();
  return self;
}

- (BOOL)isFault
{
  return BYTE1(self->_cd_stateFlags) >> 7;
}

- (void)_maintainInverseRelationship:(void *)a3 forProperty:(uint64_t)a4 forChange:(void *)a5 onSet:
{
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t i;
  uint64_t *v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = objc_msgSend(a5, "count");
    if (v10)
    {
      v11 = v10;
      if (v10 >= 0x201)
        v12 = 1;
      else
        v12 = v10;
      v13 = (8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0;
      v14 = (char *)v21 - v13;
      if (v10 > 0x200)
        v14 = (char *)NSAllocateScannedUncollectable();
      else
        bzero((char *)v21 - v13, 8 * v10);
      objc_msgSend(a5, "getObjects:", v14);
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
        v18 = (void *)MEMORY[0x1E0C99DA0];
        v19 = *MEMORY[0x1E0C99768];
        v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Insufficient information to maintain inverse relationship \"%@\" for relationship: %@."), objc_msgSend(a2, "name"), objc_msgSend(a3, "name"));
        objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(a3, "name"), CFSTR("key"), objc_msgSend(a2, "name"), CFSTR("inverse"), 0)));
      }
      for (i = 0; i != v11; ++i)
      {
        v16 = *(uint64_t **)&v14[8 * i];
        if (a4 == 2)
        {
          v17 = 0;
        }
        else
        {
          v17 = *(uint64_t **)&v14[8 * i];
          v16 = 0;
        }
        -[NSManagedObject _maintainInverseRelationship:forProperty:oldDestination:newDestination:](a1, a2, v17, v16);
      }
      if (v11 >= 0x201)
        NSZoneFree(0, v14);
    }
  }
}

+ (Class)classForEntity:(id)a3
{
  objc_class *v4;
  objc_class *v5;
  const char *v6;
  const char *v7;
  char *Name;
  char *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  const char *v14;
  __int128 v15;
  Class Class;
  Class v17;
  objc_class *v18;
  Class ClassPair;
  objc_class *v20;
  objc_method *ClassMethod;
  void (*Implementation)(void);
  const char *TypeEncoding;
  objc_method *v24;
  void (*v25)(void);
  const char *v26;
  objc_method *v27;
  void (*v28)(void);
  const char *v29;
  objc_method *v30;
  const char *v31;
  objc_method *v32;
  const char *v33;
  objc_method *v34;
  const char *v35;
  int v36;
  malloc_zone_t *v37;
  size_t v38;
  _QWORD *v39;
  void (*v40)(void);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  malloc_zone_t *v57;
  size_t InstanceSize;
  objc_class *v59;
  const char *v60;
  IMP v61;
  IMP v62;
  objc_class *v63;
  const char *v64;
  IMP v65;
  IMP v66;
  _BOOL4 v68;
  objc_class *v69;
  objc_method *v70;
  void (*v71)(void);
  objc_method *v72;
  objc_class *v73;
  objc_method *v74;
  objc_class *v75;
  void (*v76)(void);
  const char *v77;
  objc_class *v78;
  void (*v79)(void);
  objc_class *v80;
  objc_method *v81;
  void (*v82)(void);
  const char *v83;
  objc_class *v84;
  void (*v85)(void);
  objc_class *v86;
  IMP v87;
  IMP v88;
  objc_class *v89;
  void (*v90)(void);
  int v92;
  objc_class *v93;
  IMP v94;
  IMP v95;
  objc_class *v96;
  void (*v97)(void);
  int v99;
  objc_class *v100;
  objc_class *v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unsigned int v106;
  uint64_t v107;
  const char *v108;
  char *v109;
  uint64_t v110;
  void (*v111)(void);
  _BOOL4 v112;
  _BOOL4 v113;
  int v114;
  uint64_t v115;
  BOOL v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  unsigned int v122;
  void (*v123)(void);
  _DWORD *v124;
  objc_ivar *InstanceVariable;
  int Offset;
  uint64_t v127;
  uint64_t v128;
  const __CFAllocator *v129;
  CFDataRef v130;
  int v131;
  int v132;
  id v133;
  void *v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  NSObject *v143;
  unint64_t v144;
  __CFArray *Mutable;
  uint64_t v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  NSObject *v156;
  void *v157;
  uint64_t v158;
  _OWORD v159[3];
  __int128 v160;
  _OWORD v161[2];
  __int128 v162;
  _OWORD v163[2];
  __int128 v164;
  _OWORD v165[2];
  __int128 v166;
  _OWORD v167[2];
  __int128 v168;
  _OWORD v169[2];
  __int128 v170;
  _OWORD v171[2];
  __int128 v172;
  _OWORD v173[2];
  __int128 v174;
  _OWORD v175[2];
  __int128 v176;
  _OWORD v177[2];
  __int128 v178;
  __int128 v179;
  uint64_t v180;
  __int128 v181;
  __int128 v182;
  SEL v183;
  SEL v184;
  SEL v185;
  SEL v186;
  SEL v187;
  const char *v188;
  _QWORD *v189;
  SEL v190;
  SEL v191;
  SEL v192;
  SEL v193;
  SEL v194;
  SEL v195;
  IMP v196;
  IMP v197;
  IMP v198;
  IMP v199;
  SEL v200;
  SEL v201;
  SEL v202;
  SEL v203;
  SEL v204;
  SEL v205;
  SEL v206;
  SEL v207;
  SEL v208;
  SEL v209;
  SEL v210;
  SEL v211;
  char *v212;
  Class v213;
  SEL v214;
  void *v215;
  uint64_t v216;
  char *v217;
  Class v218;
  char v219[32];
  unint64_t v220[4];
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  uint64_t v251;

  v218 = (Class)MethodImplementation;
  v251 = *MEMORY[0x1E0C80C00];
  if (!qword_1ECD8D9E8)
  {
    v4 = (objc_class *)objc_opt_class();
    qword_1ECD8D9E8 = (uint64_t)class_getMethodImplementation(v4, sel_willChangeValueForKey_);
    v5 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v5, sel_didChangeValueForKey_);
    qword_1ECD8D9F0 = (uint64_t)MethodImplementation;
  }
  MEMORY[0x1E0C80A78](MethodImplementation);
  v217 = (char *)&v180;
  v6 = (const char *)objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String");
  if (!v6 || (v7 = v6, !*v6))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Entity name must not be nil."), 0));
  if ((*((_BYTE *)a3 + 120) & 4) == 0)
  {
    v147 = objc_msgSend(a3, "managedObjectModel");
    v148 = a3;
    if (v147)
      v148 = (id)objc_msgSend(a3, "managedObjectModel");
    objc_msgSend(v148, "_setIsEditable:", 0);
  }
  v188 = v7;
  Name = (char *)class_getName(v218);
  v9 = strchr(Name, 46);
  if (MEMORY[0x1E0C80A78](v9))
  {
    v178 = 0u;
    v179 = 0u;
    memset(v177, 0, sizeof(v177));
    v176 = 0u;
    v174 = 0u;
    memset(v175, 0, sizeof(v175));
    memset(v173, 0, sizeof(v173));
    v172 = 0u;
    v170 = 0u;
    memset(v171, 0, sizeof(v171));
    memset(v169, 0, sizeof(v169));
    v168 = 0u;
    v166 = 0u;
    memset(v167, 0, sizeof(v167));
    memset(v165, 0, sizeof(v165));
    v164 = 0u;
    v162 = 0u;
    memset(v163, 0, sizeof(v163));
    memset(v161, 0, sizeof(v161));
    v160 = 0u;
    memset(v159, 0, sizeof(v159));
    v10 = strlen(Name);
    if (v10 >= 0x1FF)
      v11 = 511;
    else
      v11 = v10;
    if ((_DWORD)v11)
    {
      for (i = 0; i != v11; ++i)
      {
        v13 = Name[i];
        if (!Name[i])
          break;
        if (v13 == 46)
          LOBYTE(v13) = 95;
        *((_BYTE *)v159 + i) = v13;
      }
    }
    Name = (char *)v159;
  }
  v14 = v188;
  v212 = Name;
  snprintf(v217, 0x200uLL, "%s_%s_", Name, v188);
  os_unfair_lock_lock(&stru_1ECD8D9DC);
  v215 = 0;
  v194 = sel_retain;
  v195 = sel__retain_1;
  v193 = sel__release_1;
  v192 = sel_release;
  v209 = sel__isGeneratedClass;
  v210 = sel__isGeneratedClass_1;
  v214 = sel_class;
  v211 = sel_superclass;
  v191 = sel__PFMOClassFactoryData;
  v187 = sel_willAccessValueForKey_;
  v186 = sel_didAccessValueForKey_;
  v208 = sel_resolveInstanceMethod_;
  v185 = sel__classShouldAlwaysRegisterSelectorNamed_;
  v184 = sel__useFastValidationMethod;
  v206 = sel_awakeFromFetch;
  v207 = sel_validateValue_forKey_error_;
  *(_QWORD *)&v15 = 136315138;
  v182 = v15;
  *(_QWORD *)&v15 = 134218498;
  v181 = v15;
  v204 = sel_didChangeValueForKey_;
  v205 = sel_willChangeValueForKey_;
  v203 = sel_willChangeValueForKey_withSetMutation_usingObjects_;
  v202 = sel_didChangeValueForKey_withSetMutation_usingObjects_;
  v200 = sel_didFireFault;
  v201 = sel_willFireFault;
  v183 = sel__transientPropertiesChangesMask__;
  v189 = a3;
  v190 = sel__PFPlaceHolderSingleton;
  v216 = 2;
  do
  {
    while (1)
    {
      while (1)
      {
        Class = objc_getClass(v217);
        v17 = Class;
        if (Class)
        {
          v18 = Class;
        }
        else
        {
          ClassPair = objc_allocateClassPair(v218, v217, 0);
          v18 = ClassPair;
          if (!ClassPair)
            goto LABEL_107;
          v20 = object_getClass(ClassPair);
          ClassMethod = class_getClassMethod(v18, v195);
          Implementation = method_getImplementation(ClassMethod);
          TypeEncoding = method_getTypeEncoding(ClassMethod);
          class_addMethod(v20, v194, Implementation, TypeEncoding);
          v24 = class_getClassMethod(v18, v193);
          v25 = method_getImplementation(v24);
          v26 = method_getTypeEncoding(v24);
          class_addMethod(v20, v192, v25, v26);
          v27 = class_getClassMethod(v18, v210);
          v28 = method_getImplementation(v27);
          v29 = method_getTypeEncoding(v27);
          class_addMethod(v20, v209, v28, v29);
          v30 = class_getClassMethod(v218, v214);
          v31 = method_getTypeEncoding(v30);
          class_addMethod(v18, v214, (IMP)override_instace_class, v31);
          v32 = class_getClassMethod(v218, v214);
          v33 = method_getTypeEncoding(v32);
          class_addMethod(v20, v214, (IMP)override_class_class, v33);
          v34 = class_getClassMethod(v218, v211);
          v35 = method_getTypeEncoding(v34);
          class_addMethod(v20, v211, (IMP)override_class_superclass, v35);
          v213 = v20;
          v36 = objc_msgSend((id)objc_msgSend(a3, "propertiesByName"), "count");
          v37 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
          if (!_PF_Private_Malloc_Zone)
            v37 = malloc_default_zone();
          if (v36)
            v38 = (((v36 - 1) >> 3) & 0x1FFFFFFC) + 108;
          else
            v38 = 108;
          v39 = malloc_type_zone_calloc(v37, 1uLL, v38, 0x8E0FE644uLL);
          v220[0] = MEMORY[0x1E0C809B0];
          v220[1] = 3221225472;
          v220[2] = (unint64_t)__generateReturnPointerMethod_block_invoke;
          v220[3] = (unint64_t)&__block_descriptor_40_e9__v16__0_8l;
          *(_QWORD *)&v221 = v39;
          v40 = imp_implementationWithBlock(v220);
          if (!v40)
          {
            v41 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to generate function for '%s'");
            _NSCoreDataLog(17, v41, v42, v43, v44, v45, v46, v47, (uint64_t)v14);
            v48 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              LODWORD(v220[0]) = v182;
              *(unint64_t *)((char *)v220 + 4) = (unint64_t)v14;
              _os_log_fault_impl(&dword_18A253000, v48, OS_LOG_TYPE_FAULT, "CoreData: Failed to generate function for '%s'", (uint8_t *)v220, 0xCu);
            }
          }
          if (!class_addMethod(v213, v191, v40, "@@:"))
          {
            v49 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to add function to class for '%s'");
            _NSCoreDataLog(17, v49, v50, v51, v52, v53, v54, v55, (uint64_t)v14);
            v56 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              LODWORD(v220[0]) = v182;
              *(unint64_t *)((char *)v220 + 4) = (unint64_t)v14;
              _os_log_fault_impl(&dword_18A253000, v56, OS_LOG_TYPE_FAULT, "CoreData: Failed to add function to class for '%s'", (uint8_t *)v220, 0xCu);
            }
          }
          v57 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
          if (!_PF_Private_Malloc_Zone)
            v57 = malloc_default_zone();
          InstanceSize = class_getInstanceSize(v218);
          v215 = malloc_type_zone_calloc(v57, 1uLL, (InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8, 0xC83DDBB4uLL);
          v39[6] = v215;
          if ((Class)objc_opt_class() == v218)
          {
            v119 = 2392384;
          }
          else
          {
            v59 = (objc_class *)objc_opt_class();
            v60 = v187;
            v61 = class_getMethodImplementation(v59, v187);
            v62 = class_getMethodImplementation(v218, v60);
            v63 = (objc_class *)objc_opt_class();
            v64 = v186;
            v65 = class_getMethodImplementation(v63, v186);
            v66 = class_getMethodImplementation(v218, v64);
            v68 = v61 != v62 || v65 != v66;
            *((_DWORD *)v39 + 24) = v39[12] & 0xFFFFFFFE | v68;
            v69 = (objc_class *)objc_opt_class();
            v70 = class_getClassMethod(v69, v208);
            v71 = method_getImplementation(v70);
            v72 = class_getClassMethod(v218, v208);
            if (v71 != method_getImplementation(v72))
            {
              *((_DWORD *)v39 + 24) |= 0x40u;
              v73 = (objc_class *)objc_opt_class();
              v74 = class_getClassMethod(v73, v210);
              v75 = object_getClass(v218);
              v76 = method_getImplementation(v74);
              v77 = method_getTypeEncoding(v70);
              class_addMethod(v75, v185, v76, v77);
            }
            v78 = (objc_class *)objc_opt_class();
            v79 = class_getMethodImplementation(v78, v207);
            if (v79 != class_getMethodImplementation(v218, v207))
            {
              *((_DWORD *)v39 + 24) |= 0x10u;
              v80 = (objc_class *)objc_opt_class();
              v81 = class_getClassMethod(v80, v209);
              v82 = method_getImplementation(v81);
              v83 = method_getTypeEncoding(v81);
              class_addMethod(v213, v184, v82, v83);
            }
            v84 = (objc_class *)objc_opt_class();
            v85 = class_getMethodImplementation(v84, v206);
            if (v85 != class_getMethodImplementation(v218, v206))
              *((_DWORD *)v39 + 24) |= 0x20u;
            v86 = (objc_class *)objc_opt_class();
            v87 = class_getMethodImplementation(v86, v205);
            v88 = class_getMethodImplementation(v218, v205);
            v89 = (objc_class *)objc_opt_class();
            v90 = class_getMethodImplementation(v89, v204);
            if (v90 == class_getMethodImplementation(v218, v204) && v87 == v88)
              v92 = 0;
            else
              v92 = 2;
            *((_DWORD *)v39 + 24) = v39[12] & 0xFFFFFFFD | v92;
            v93 = (objc_class *)objc_opt_class();
            v94 = class_getMethodImplementation(v93, v203);
            v95 = class_getMethodImplementation(v218, v203);
            v96 = (objc_class *)objc_opt_class();
            v97 = class_getMethodImplementation(v96, v202);
            if (v97 == class_getMethodImplementation(v218, v202) && v94 == v95)
              v99 = 0;
            else
              v99 = 4;
            *((_DWORD *)v39 + 24) = v39[12] & 0xFFFFFFFB | v99;
            v100 = (objc_class *)objc_opt_class();
            v199 = class_getMethodImplementation(v100, v201);
            v198 = class_getMethodImplementation(v218, v201);
            v101 = (objc_class *)objc_opt_class();
            v197 = class_getMethodImplementation(v101, v200);
            v196 = class_getMethodImplementation(v218, v200);
            v102 = *((_QWORD *)a3 + 14);
            v103 = *(_QWORD *)(v102 + 80);
            v104 = *(_QWORD *)(v102 + 88);
            if (v103 < v104 + v103)
            {
              v105 = *(_QWORD *)(v189[13] + 40);
              do
              {
                objc_msgSend(*(id *)(v105 + 8 * v103), "UTF8String", v159[0], *(_QWORD *)&v159[1], *(_OWORD *)((char *)&v159[1] + 8), *((_QWORD *)&v159[2] + 1), v160, *(_QWORD *)&v161[0], *(_OWORD *)((char *)v161 + 8), *((_QWORD *)&v161[1] + 1), v162, *(_QWORD *)&v163[0], *(_OWORD *)((char *)v163 + 8), *((_QWORD *)&v163[1] + 1), v164, *(_QWORD *)&v165[0], *(_OWORD *)((char *)v165 + 8), *((_QWORD *)&v165[1] + 1), v166,
                  *(_QWORD *)&v167[0],
                  *(_OWORD *)((char *)v167 + 8),
                  *((_QWORD *)&v167[1] + 1),
                  v168,
                  *(_QWORD *)&v169[0],
                  *(_OWORD *)((char *)v169 + 8),
                  *((_QWORD *)&v169[1] + 1),
                  v170,
                  *(_QWORD *)&v171[0],
                  *(_OWORD *)((char *)v171 + 8),
                  *((_QWORD *)&v171[1] + 1),
                  v172,
                  *(_QWORD *)&v173[0],
                  *(_OWORD *)((char *)v173 + 8),
                  *((_QWORD *)&v173[1] + 1),
                  v174,
                  *(_QWORD *)&v175[0],
                  *(_OWORD *)((char *)v175 + 8),
                  *((_QWORD *)&v175[1] + 1),
                  v176,
                  *(_QWORD *)&v177[0],
                  *(_OWORD *)((char *)v177 + 8),
                  *((_QWORD *)&v177[1] + 1),
                  (_QWORD)v178);
                v106 = __strlcpy_chk();
                __strlcat_chk();
                *((_BYTE *)v220 + v106) = __toupper(*((char *)v220 + v106));
                if (BYTE2(dword_1ECD8DE20))
                  v107 = sel_lookUpByName();
                else
                  v107 = (uint64_t)sel_registerName((const char *)v220);
                v108 = (const char *)v107;
                if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v218, v108))
                {
                  v109 = (char *)v39[11];
                  if (!v109)
                  {
                    v39[11] = v39 + 13;
                    v109 = (char *)(v39 + 13);
                  }
                  v109[v103 >> 3] |= 1 << (v103 & 7);
                }
                ++v103;
                --v104;
              }
              while (v104);
            }
            v110 = v39[11];
            if (v110)
            {
              v220[0] = MEMORY[0x1E0C809B0];
              v220[1] = 3221225472;
              v220[2] = (unint64_t)__generateReturnPointerMethod_block_invoke;
              v220[3] = (unint64_t)&__block_descriptor_40_e9__v16__0_8l;
              *(_QWORD *)&v221 = v110;
              v111 = imp_implementationWithBlock(v220);
              class_addMethod(v213, v183, v111, "@@:");
            }
            v112 = v199 == v198;
            v113 = v197 == v196;
            v114 = *((_DWORD *)v39 + 24);
            v115 = 0x8000;
            if ((v114 & 1) == 0)
              v115 = 32832;
            if ((v114 & 2) == 0)
              v115 |= 0x40000uLL;
            v116 = !v112 || !v113;
            if (v112 && v113)
              v117 = 0;
            else
              v117 = 8;
            *((_DWORD *)v39 + 24) = v114 & 0xFFFFFFF7 | v117;
            v118 = v115 | 0x100;
            if (v116)
              v118 = v115;
            if ((v114 & 4) != 0)
              v119 = v118;
            else
              v119 = v118 | 0x200000;
            v14 = v188;
            a3 = v189;
          }
          if (-[objc_class contextShouldIgnoreUnmodeledPropertyChanges](v218, "contextShouldIgnoreUnmodeledPropertyChanges", *(_QWORD *)&v159[0], *((_QWORD *)&v159[0] + 1), *(_QWORD *)&v159[1], *((_QWORD *)&v159[1] + 1), *(_QWORD *)&v159[2], *((_QWORD *)&v159[2] + 1), (_QWORD)v160, *((_QWORD *)&v160 + 1), *(_QWORD *)&v161[0], *((_QWORD *)&v161[0] + 1), *(_QWORD *)&v161[1], *((_QWORD *)&v161[1] + 1), (_QWORD)v162, *((_QWORD *)&v162 + 1), *(_QWORD *)&v163[0], *((_QWORD *)&v163[0] + 1), *(_QWORD *)&v163[1],
                               *((_QWORD *)&v163[1] + 1),
                               (_QWORD)v164,
                               *((_QWORD *)&v164 + 1),
                               *(_QWORD *)&v165[0],
                               *((_QWORD *)&v165[0] + 1),
                               *(_QWORD *)&v165[1],
                               *((_QWORD *)&v165[1] + 1),
                               (_QWORD)v166,
                               *((_QWORD *)&v166 + 1),
                               *(_QWORD *)&v167[0],
                               *((_QWORD *)&v167[0] + 1),
                               *(_QWORD *)&v167[1],
                               *((_QWORD *)&v167[1] + 1),
                               (_QWORD)v168,
                               *((_QWORD *)&v168 + 1),
                               *(_QWORD *)&v169[0],
                               *((_QWORD *)&v169[0] + 1),
                               *(_QWORD *)&v169[1],
                               *((_QWORD *)&v169[1] + 1),
                               (_QWORD)v170,
                               *((_QWORD *)&v170 + 1),
                               *(_QWORD *)&v171[0],
                               *((_QWORD *)&v171[0] + 1),
                               *(_QWORD *)&v171[1],
                               *((_QWORD *)&v171[1] + 1),
                               (_QWORD)v172,
                               *((_QWORD *)&v172 + 1),
                               *(_QWORD *)&v173[0],
                               *((_QWORD *)&v173[0] + 1),
                               *(_QWORD *)&v173[1],
                               *((_QWORD *)&v173[1] + 1),
                               (_QWORD)v174,
                               *((_QWORD *)&v174 + 1),
                               *(_QWORD *)&v175[0],
                               *((_QWORD *)&v175[0] + 1),
                               *(_QWORD *)&v175[1],
                               *((_QWORD *)&v175[1] + 1),
                               (_QWORD)v176,
                               *((_QWORD *)&v176 + 1),
                               *(_QWORD *)&v177[0],
                               *((_QWORD *)&v177[0] + 1),
                               *(_QWORD *)&v177[1],
                               *((_QWORD *)&v177[1] + 1),
                               (_QWORD)v178))
            v120 = 0x400000;
          else
            v120 = 0;
          v121 = objc_msgSend((id)objc_msgSend(a3, "propertiesByName"), "count");
          __snprintf_chk(v217, 0x200uLL, 0, 0x200uLL, "_cd_bits_%p", v18);
          if (v121)
            v122 = ((v121 - 1) >> 5) + 1;
          else
            v122 = 1;
          if (v122 > 0x4000)
            objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Incorrect ivar generation"), 0));
          __snprintf_chk(v219, 0xAuLL, 0, 0xAuLL, "[%dI]", v122);
          if (!class_addIvar(v18, v217, 4 * v122, 1u, v219))
            objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("class_addIvar failed"), 0));
          v220[0] = MEMORY[0x1E0C809B0];
          v220[1] = 3221225472;
          v220[2] = (unint64_t)__generateReturnPointerMethod_block_invoke;
          v220[3] = (unint64_t)&__block_descriptor_40_e9__v16__0_8l;
          *(_QWORD *)&v221 = v215;
          v123 = imp_implementationWithBlock(v220);
          class_addMethod(v213, v190, v123, "@@:");
          objc_registerClassPair(v18);
          object_setClass(v215, v18);
          v124 = v215;
          *((_DWORD *)v215 + 4) |= 0x100000u;
          v124[2] = 10000;
          InstanceVariable = class_getInstanceVariable(v18, v217);
          Offset = ivar_getOffset(InstanceVariable);
          *((_BYTE *)v39 + 32) = ((((unsigned __int16)class_getInstanceSize(v18) + 7) & 0x3F8u) - Offset) >> 2;
          v39[5] = v120 | v119;
          v127 = -[objc_class _PFMOClassFactoryData](v18, "_PFMOClassFactoryData");
          if (v39 != (_QWORD *)v127)
          {
            v149 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Testing generated function for +classForEntity: failed for entity %s (%p)");
            _NSCoreDataLog(17, v149, v150, v151, v152, v153, v154, v155, (uint64_t)v188);
            v156 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              LODWORD(v220[0]) = 136315394;
              *(unint64_t *)((char *)v220 + 4) = (unint64_t)v188;
              WORD2(v220[1]) = 2048;
              *(unint64_t *)((char *)&v220[1] + 6) = (unint64_t)v18;
              _os_log_fault_impl(&dword_18A253000, v156, OS_LOG_TYPE_FAULT, "CoreData: Testing generated function for +classForEntity: failed for entity %s (%p)", (uint8_t *)v220, 0x16u);
            }
            v157 = (void *)MEMORY[0x1E0C99DA0];
            v158 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Testing generated function, factory %p != result %p"), v39, v127);
            objc_exception_throw((id)objc_msgSend(v157, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v158, 0));
          }
          objc_msgSend((id)objc_msgSend(a3, "versionHash"), "getBytes:length:", v39 + 7, 32);
        }
        v128 = -[objc_class _PFMOClassFactoryData](v18, "_PFMOClassFactoryData", *(_QWORD *)&v159[0], *((_QWORD *)&v159[0] + 1), *(_QWORD *)&v159[1], *((_QWORD *)&v159[1] + 1), *(_QWORD *)&v159[2], *((_QWORD *)&v159[2] + 1), (_QWORD)v160, *((_QWORD *)&v160 + 1), *(_QWORD *)&v161[0], *((_QWORD *)&v161[0] + 1), *(_QWORD *)&v161[1], *((_QWORD *)&v161[1] + 1), (_QWORD)v162, *((_QWORD *)&v162 + 1), *(_QWORD *)&v163[0], *((_QWORD *)&v163[0] + 1), *(_QWORD *)&v163[1],
                 *((_QWORD *)&v163[1] + 1),
                 (_QWORD)v164,
                 *((_QWORD *)&v164 + 1),
                 *(_QWORD *)&v165[0],
                 *((_QWORD *)&v165[0] + 1),
                 *(_QWORD *)&v165[1],
                 *((_QWORD *)&v165[1] + 1),
                 (_QWORD)v166,
                 *((_QWORD *)&v166 + 1),
                 *(_QWORD *)&v167[0],
                 *((_QWORD *)&v167[0] + 1),
                 *(_QWORD *)&v167[1],
                 *((_QWORD *)&v167[1] + 1),
                 (_QWORD)v168,
                 *((_QWORD *)&v168 + 1),
                 *(_QWORD *)&v169[0],
                 *((_QWORD *)&v169[0] + 1),
                 *(_QWORD *)&v169[1],
                 *((_QWORD *)&v169[1] + 1),
                 (_QWORD)v170,
                 *((_QWORD *)&v170 + 1),
                 *(_QWORD *)&v171[0],
                 *((_QWORD *)&v171[0] + 1),
                 *(_QWORD *)&v171[1],
                 *((_QWORD *)&v171[1] + 1),
                 (_QWORD)v172,
                 *((_QWORD *)&v172 + 1),
                 *(_QWORD *)&v173[0],
                 *((_QWORD *)&v173[0] + 1),
                 *(_QWORD *)&v173[1],
                 *((_QWORD *)&v173[1] + 1),
                 (_QWORD)v174,
                 *((_QWORD *)&v174 + 1),
                 *(_QWORD *)&v175[0],
                 *((_QWORD *)&v175[0] + 1),
                 *(_QWORD *)&v175[1],
                 *((_QWORD *)&v175[1] + 1),
                 (_QWORD)v176,
                 *((_QWORD *)&v176 + 1),
                 *(_QWORD *)&v177[0],
                 *((_QWORD *)&v177[0] + 1),
                 *(_QWORD *)&v177[1],
                 *((_QWORD *)&v177[1] + 1),
                 (_QWORD)v178);
        if (!v17)
          goto LABEL_108;
        v249 = 0u;
        v250 = 0u;
        v247 = 0u;
        v248 = 0u;
        v245 = 0u;
        v246 = 0u;
        v243 = 0u;
        v244 = 0u;
        v241 = 0u;
        v242 = 0u;
        v239 = 0u;
        v240 = 0u;
        v237 = 0u;
        v238 = 0u;
        v235 = 0u;
        v236 = 0u;
        v233 = 0u;
        v234 = 0u;
        v231 = 0u;
        v232 = 0u;
        v229 = 0u;
        v230 = 0u;
        v227 = 0u;
        v228 = 0u;
        v225 = 0u;
        v226 = 0u;
        v223 = 0u;
        v224 = 0u;
        v221 = 0u;
        v222 = 0u;
        memset(v220, 0, sizeof(v220));
        v129 = _PFStackAllocatorCreate(v220, 1024);
        v130 = CFDataCreate(v129, (const UInt8 *)(v128 + 56), 32);
        v131 = objc_msgSend((id)objc_msgSend(a3, "versionHash"), "isEqual:", v130);
        v132 = v131;
        if (!v220[3])
          break;
        if (v130)
          CFRelease(v130);
        if (v132)
          goto LABEL_105;
LABEL_107:
        __snprintf_chk(v217, 0x200uLL, 0, 0x200uLL, "%s_%s_%x", v212, v14, v216);
        v216 = (v216 + 1);
      }
      v220[1] = v220[0];
      if (!v131)
        goto LABEL_107;
LABEL_105:
      v133 = *(id *)(v128 + 8);
      if (v133 && v133 != a3)
        goto LABEL_107;
LABEL_108:
      if (!*(_QWORD *)(v128 + 8))
        break;
LABEL_114:
      if (v18)
        goto LABEL_117;
    }
    *(_DWORD *)v128 = 0;
    *(_QWORD *)(v128 + 8) = a3;
    if (!*(_QWORD *)(v128 + 16))
      *(_QWORD *)(v128 + 16) = objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
    *(_QWORD *)(v128 + 24) = 0;
    v134 = (void *)-[objc_class _PFPlaceHolderSingleton](v18, "_PFPlaceHolderSingleton");
    v135 = (unint64_t)v134;
    if (v134 != *(void **)(v128 + 48))
    {
      v136 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Factory and entity class skew over placeholder singleton.  Expected %p but got %p for entity '%s'");
      _NSCoreDataLog(17, v136, v137, v138, v139, v140, v141, v142, *(_QWORD *)(v128 + 48));
      v143 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        v144 = *(_QWORD *)(v128 + 48);
        LODWORD(v220[0]) = v181;
        *(unint64_t *)((char *)v220 + 4) = v144;
        WORD2(v220[1]) = 2048;
        *(unint64_t *)((char *)&v220[1] + 6) = v135;
        HIWORD(v220[2]) = 2080;
        v220[3] = (unint64_t)v14;
        _os_log_fault_impl(&dword_18A253000, v143, OS_LOG_TYPE_FAULT, "CoreData: Factory and entity class skew over placeholder singleton.  Expected %p but got %p for entity '%s'", (uint8_t *)v220, 0x20u);
      }
      goto LABEL_114;
    }
    object_setClass(v134, v18);
    *(_QWORD *)(v128 + 48) = v135;
  }
  while (!v18);
LABEL_117:
  os_unfair_lock_unlock(&stru_1ECD8D9DC);
  if (v215)
  {
    os_unfair_lock_lock_with_options();
    Mutable = (__CFArray *)qword_1ECD8D9F8;
    if (!qword_1ECD8D9F8)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
      qword_1ECD8D9F8 = (uint64_t)Mutable;
    }
    CFArrayAppendValue(Mutable, v215);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD8D9E0);
  }
  objc_opt_self();
  __dmb(0xBu);
  return v18;
}

- (NSKnownKeysDictionary)_newChangedValuesForRefresh__
{
  NSKnownKeysDictionary *v1;
  Class isa;
  unint64_t *v3;
  unint64_t *v4;
  unint64_t v5;
  NSKnownKeysDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id **v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  NSKnownKeysDictionary *v36;
  id v37;
  NSKnownKeysDictionary *v38;
  const void **v39;
  NSKnownKeysDictionary *v40;
  id v41;
  unint64_t v42;
  uint64_t v43;
  char v44;
  id v45;
  uint64_t v46;
  id **v47;
  _OWORD v48[2];
  uint64_t v49;

  v1 = (NSKnownKeysDictionary *)a1;
  v49 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl(*(_QWORD *)(a1 + 32), sel__newChangedValuesForRefresh__);
    if ((BYTE1(v1[2].super.super.super.isa) & 0x80) != 0)
      return (NSKnownKeysDictionary *)(id)NSDictionary_EmptyDictionary;
    isa = v1[6].super.super.super.isa;
    if (!isa || !*((_QWORD *)isa + 1))
      return (NSKnownKeysDictionary *)(id)NSDictionary_EmptyDictionary;
    v41 = (id)NSDictionary_EmptyDictionary;
    v3 = (unint64_t *)_PFEntityForManagedObject(v1);
    v4 = v3;
    if (v3)
      v5 = v3[13];
    else
      v5 = 0;
    v7 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", v5);
    v8 = _kvcPropertysPrimitiveGetters(v4);
    if (v4)
      v42 = v4[14];
    else
      v42 = 0;
    v9 = NSKeyValueCoding_NullValue;
    v10 = v1[6].super.super.super.isa;
    v47 = (id **)v1;
    if (v10)
      v11 = (void *)*((_QWORD *)v10 + 1);
    else
      v11 = 0;
    v12 = objc_msgSend(v11, "values");
    v40 = v7;
    v46 = -[NSKnownKeysDictionary values](v7, "values");
    v17 = 0;
    v18 = 1;
    do
    {
      v44 = v18;
      v19 = (unint64_t *)(v42 + 16 * dword_18A509D80[v17]);
      v21 = *v19;
      v20 = v19[1];
      if (*v19 < v20 + *v19)
      {
        do
        {
          if (*(_QWORD *)(v12 + 8 * v21) == v9)
            v22 = 0;
          else
            v22 = *(void **)(v12 + 8 * v21);
          _PF_Handler_Primitive_GetProperty(v47, v21, 0, *(_QWORD *)(v8 + 8 * v21), v13, v14, v15, v16);
          if (v22 != v23)
          {
            v24 = v23;
            v25 = *(void **)(v4[12] + 24 + 8 * v21);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              && (objc_msgSend(v25, "_epsilonEquals:rhs:withFlags:", v24, v22, 1) & 1) == 0)
            {
              v26 = (id)v9;
              if (v24)
                v26 = v24;
              *(_QWORD *)(v46 + 8 * v21) = v26;
            }
          }
          ++v21;
          --v20;
        }
        while (v20);
      }
      v18 = 0;
      v17 = 1;
    }
    while ((v44 & 1) != 0);
    v27 = 2;
    v28 = v47;
    do
    {
      v43 = v27;
      v29 = (unint64_t *)(v42 + 16 * dword_18A509D80[v27]);
      v31 = *v29;
      v30 = v29[1];
      if (*v29 < v30 + *v29)
      {
        do
        {
          if (*(_QWORD *)(v12 + 8 * v31) == v9)
            v32 = 0;
          else
            v32 = *(void **)(v12 + 8 * v31);
          _PF_Handler_Primitive_GetProperty(v28, v31, 0, *(_QWORD *)(v8 + 8 * v31), v13, v14, v15, v16);
          v34 = v33;
          v35 = objc_msgSend(v32, "isFault");
          if ((v35 & objc_msgSend(v34, "isFault") & 1) == 0
            && v32 != v34
            && (objc_msgSend(v34, "isEqual:", v32) & 1) == 0)
          {
            v36 = (NSKnownKeysDictionary *)v9;
            if (v34)
            {
              if (objc_msgSend(v34, "count"))
                v45 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v34, v32);
              else
                v45 = 0;
              if (objc_msgSend(v32, "count"))
                v37 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v32, v34);
              else
                v37 = 0;
              v38 = [NSKnownKeysDictionary alloc];
              if (!_PFFastMappingForChanges__pffastmappingforchanges)
              {
                v48[0] = xmmword_1E1EDDE60;
                v48[1] = *(_OWORD *)off_1E1EDDE70;
                _PFFastMappingForChanges__pffastmappingforchanges = -[NSKnownKeysMappingStrategy initForKeys:count:]([NSKnownKeysMappingStrategy alloc], "initForKeys:count:", v48, 4);
              }
              v36 = -[NSKnownKeysDictionary initWithSearchStrategy:](v38, "initWithSearchStrategy:");
              v39 = -[NSKnownKeysDictionary values](v36, "values");
              *v39 = v45;
              v39[1] = v37;
              v39[2] = v34;
              if (v43 == 3)
                v39[3] = v32;
              v28 = v47;
            }
            *(_QWORD *)(v46 + 8 * v31) = v36;
          }
          ++v31;
          --v30;
        }
        while (v30);
      }
      v27 = v43 + 1;
    }
    while (v43 != 3);
    v1 = v40;
    if (-[NSKnownKeysDictionary count](v40, "count"))
    {

    }
    else
    {

      return (NSKnownKeysDictionary *)v41;
    }
  }
  return v1;
}

- (void)_didChangeValue:(id)a3 forRelationship:(id)a4 named:(id)a5 withInverse:(id)a6
{
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  char *v20;
  uint64_t *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a6, "isReadOnly", a3, a4, a5))
  {
    v34 = (void *)MEMORY[0x1E0C99DA0];
    v35 = *MEMORY[0x1E0C99768];
    v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot maintain read-only inverse relationship \"%@\" for relationship: %@."), objc_msgSend(a6, "name"), objc_msgSend(a4, "name"));
    objc_exception_throw((id)objc_msgSend(v34, "exceptionWithName:reason:userInfo:", v35, v36, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(a4, "name"), CFSTR("key"), objc_msgSend(a6, "name"), CFSTR("inverse"), 0)));
  }
  v10 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
  v11 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
  if (objc_msgSend(v10, "isEqual:", NSKeyValueCoding_NullValue))
    v12 = 0;
  else
    v12 = (uint64_t)v10;
  if (objc_msgSend(v11, "isEqual:", NSKeyValueCoding_NullValue))
    v13 = 0;
  else
    v13 = (uint64_t)v11;
  if (v12 | v13)
    v14 = v12 == v13;
  else
    v14 = 1;
  if (!v14 && ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend((id)v12, "_isIdenticalFault:", v13) & 1) == 0))
  {
    self->_cd_stateFlags |= 0x800u;
    if (objc_msgSend(a4, "isToMany"))
    {
      switch(objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CB2CB0]), "intValue"))
      {
        case 1u:
          v15 = objc_msgSend((id)v12, "count");
          v16 = objc_msgSend((id)v13, "count");
          v17 = objc_msgSend(a4, "isOrdered");
          v18 = v17;
          if ((_DWORD)v17)
          {
            if (v15)
            {
              MEMORY[0x1E0C80A78](v17);
              v20 = (char *)v37 - v19;
              if (v15 > 0x200)
                v20 = (char *)NSAllocateScannedUncollectable();
              else
                bzero((char *)v37 - v19, 8 * v15);
              objc_msgSend((id)v12, "getObjects:", v20);
              v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v20, v15);
              v12 = v17;
              if (v15 >= 0x201)
                NSZoneFree(0, v20);
            }
            else
            {
              v12 = NSSet_EmptySet;
            }
            if (v16)
            {
              MEMORY[0x1E0C80A78](v17);
              v27 = (char *)v37 - v26;
              if (v16 > 0x200)
                v27 = (char *)NSAllocateScannedUncollectable();
              else
                bzero((char *)v37 - v26, 8 * v16);
              objc_msgSend((id)v13, "getObjects:", v27);
              v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v27, v16);
              if (v16 >= 0x201)
                NSZoneFree(0, v27);
            }
            else
            {
              v13 = NSSet_EmptySet;
            }
          }
          else
          {
            if (!v13)
              v13 = NSSet_EmptySet;
            if (!v12)
              v12 = NSSet_EmptySet;
          }
          if ((objc_msgSend((id)v12, "isEqualToSet:", v13) & 1) == 0)
          {
            if (objc_msgSend((id)v13, "count"))
            {
              v28 = (void *)objc_msgSend((id)v13, "mutableCopy");
              v29 = v28;
              if (v28)
                objc_msgSend(v28, "minusSet:", v12);
            }
            else
            {
              v29 = 0;
            }
            if (objc_msgSend((id)v12, "count"))
            {
              v30 = (void *)objc_msgSend((id)v12, "mutableCopy");
              v31 = v30;
              if (v30)
                objc_msgSend(v30, "minusSet:", v13);
            }
            else
            {
              v31 = 0;
            }
            if (objc_msgSend(v31, "count"))
              -[NSManagedObject _maintainInverseRelationship:forProperty:forChange:onSet:]((uint64_t *)self, a6, a4, 3, v31);
            if (objc_msgSend(v29, "count"))
              -[NSManagedObject _maintainInverseRelationship:forProperty:forChange:onSet:]((uint64_t *)self, a6, a4, 2, v29);

          }
          if (v15)
            v32 = v18;
          else
            v32 = 0;
          if (v32 == 1)

          if (v16)
            v33 = v18;
          else
            v33 = 0;
          if (v33 == 1)

          break;
        case 2u:
          goto LABEL_23;
        case 3u:
          v21 = (uint64_t *)self;
          v22 = a6;
          v23 = a4;
          v24 = 3;
          v25 = (void *)v12;
          goto LABEL_24;
        case 4u:
          -[NSManagedObject _maintainInverseRelationship:forProperty:forChange:onSet:]((uint64_t *)self, a6, a4, 3, (void *)v12);
LABEL_23:
          v21 = (uint64_t *)self;
          v22 = a6;
          v23 = a4;
          v24 = 2;
          v25 = (void *)v13;
LABEL_24:
          -[NSManagedObject _maintainInverseRelationship:forProperty:forChange:onSet:](v21, v22, v23, v24, v25);
          break;
        default:
          break;
      }
    }
    else
    {
      -[NSManagedObject _maintainInverseRelationship:forProperty:oldDestination:newDestination:]((uint64_t *)self, a6, (uint64_t *)v12, (uint64_t *)v13);
    }
    self->_cd_stateFlags &= ~0x800u;
  }
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (void)_maintainInverseRelationship:(uint64_t *)a1 forProperty:(void *)a2 oldDestination:(uint64_t *)a3 newDestination:(uint64_t *)a4
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t *v35;
  unint64_t *v36;
  unint64_t *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t *v56;

  if (a1 && a4 != a3)
  {
    v8 = (void *)MEMORY[0x18D76B4E4]();
    if (!a3 || a3 != a1 && (a3[2] & 0x800) != 0)
      goto LABEL_32;
    if (!a2)
    {
      if ((objc_msgSend(a3, "hasChanges") & 1) == 0)
        _PFFastMOCObjectWillChange(a1[4], a3);
      goto LABEL_32;
    }
    v9 = objc_msgSend(a2, "isToMany");
    v10 = objc_msgSend(a2, "name");
    v11 = objc_msgSend(a2, "_entitysReferenceID");
    v12 = objc_msgSend(a2, "entity");
    v13 = (unint64_t *)objc_msgSend(a3, "entity");
    v14 = v13;
    if (v13 != (unint64_t *)v12)
      v11 = objc_msgSend(v13, "_offsetRelationshipIndex:fromSuperEntity:andIsToMany:", v11, v12, v9);
    if (!(_DWORD)v9)
    {
      v26 = a1[4];
      if (!v26
        || (*(_BYTE *)(v26 + 42) & 0x20) == 0
        || (!*(_QWORD *)(_kvcPropertysPrimitiveGetters(v14) + 8 * v11)
          ? (v27 = objc_msgSend(a3, "_genericValueForKey:withIndex:flags:", v10, v11, 0))
          : (v27 = _NSGetUsingKeyValueGetter()),
            (uint64_t *)v27 == a1))
      {
        v30 = _kvcPropertysPublicSetters(v14);
        _PF_Handler_Public_SetProperty((unsigned int *)a3, v11, 0, v10, *(_QWORD **)(v30 + 8 * v11));
      }
      goto LABEL_32;
    }
    v56 = a1;
    v15 = _PFEntityForManagedObject(a3);
    v16 = (void *)objc_msgSend((id)objc_msgSend(v15, "propertiesByName"), "valueAtIndex:", v11);
    v17 = *(_QWORD *)(_kvcPropertysPrimitiveGetters((unint64_t *)v15) + 8 * v11);
    LODWORD(v16) = objc_msgSend(v16, "isOrdered");
    objc_msgSend(a3, "willAccessValueForKey:", v10);
    _PF_Handler_Primitive_GetProperty((id **)a3, v11, v10, v17, v18, v19, v20, v21);
    v23 = v22;
    if ((_DWORD)v16)
    {
      if (v22)
      {
        v24 = objc_msgSend(v22, "indexOfObject:", a1);
        objc_msgSend(a3, "didAccessValueForKey:", v10);
        if (v24 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v25 = *(_QWORD *)(_kvcPropertysPublicRelationshipMutators((unint64_t *)v15) + 8 * v11);
          if (v25)
          {
            if (*(_QWORD *)(v25 + 16))
              goto LABEL_27;
            v54 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v24);
            goto LABEL_60;
          }
          v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v24);
          objc_msgSend(a3, "willChange:valuesAtIndexes:forKey:", 3, v52, v10);
          objc_msgSend(v23, "removeObjectAtIndex:", v24);
          objc_msgSend(a3, "didChange:valuesAtIndexes:forKey:", 3, v52, v10);
          goto LABEL_54;
        }
        goto LABEL_32;
      }
    }
    else if (v22)
    {
      v28 = objc_msgSend(v22, "containsObject:", a1);
      objc_msgSend(a3, "didAccessValueForKey:", v10);
      if (v28)
      {
        v29 = *(_QWORD *)(_kvcPropertysPublicRelationshipMutators((unint64_t *)v15) + 8 * v11);
        if (v29)
        {
          if (*(_QWORD *)(v29 + 16))
          {
LABEL_27:
            method_invoke();
            goto LABEL_32;
          }
          v54 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v56, 1);
LABEL_60:
          v55 = (void *)v54;
          method_invoke();

          goto LABEL_32;
        }
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v56, 1);
        objc_msgSend(a3, "willChangeValueForKey:withSetMutation:usingObjects:", v10, 2, v52);
        objc_msgSend(v23, "removeObject:", v56);
        objc_msgSend(a3, "didChangeValueForKey:withSetMutation:usingObjects:", v10, 2, v52);
LABEL_54:

      }
LABEL_32:
      if (!a4 || a4 != a1 && (a4[2] & 0x800) != 0)
        goto LABEL_46;
      if (!a2)
      {
        _PFFastMOCObjectWillChange(a1[4], a4);
        goto LABEL_46;
      }
      v31 = objc_msgSend(a2, "isToMany");
      v32 = objc_msgSend(a2, "name");
      v33 = objc_msgSend(a2, "_entitysReferenceID");
      v34 = objc_msgSend(a2, "entity");
      v35 = (unint64_t *)objc_msgSend(a4, "entity");
      v36 = v35;
      if (v35 != (unint64_t *)v34)
        v33 = objc_msgSend(v35, "_offsetRelationshipIndex:fromSuperEntity:andIsToMany:", v33, v34, v31);
      if (!(_DWORD)v31)
      {
        v48 = _kvcPropertysPublicSetters(v36);
        _PF_Handler_Public_SetProperty((unsigned int *)a4, v33, a1, v32, *(_QWORD **)(v48 + 8 * v33));
        goto LABEL_46;
      }
      v56 = a1;
      v37 = (unint64_t *)_PFEntityForManagedObject(a4);
      v38 = *(_QWORD *)(_kvcPropertysPrimitiveGetters(v37) + 8 * v33);
      v39 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "propertiesByName"), "valueAtIndex:", v33), "isOrdered");
      objc_msgSend(a4, "willAccessValueForKey:", v32);
      _PF_Handler_Primitive_GetProperty((id **)a4, v33, v32, v38, v40, v41, v42, v43);
      v45 = v44;
      objc_msgSend(a4, "didAccessValueForKey:", v32);
      if ((objc_msgSend(v45, "containsObject:", a1) & 1) != 0)
      {
LABEL_46:
        objc_autoreleasePoolPop(v8);
        return;
      }
      if (v39)
      {
        v46 = objc_msgSend(v45, "count");
        v47 = *(_QWORD *)(_kvcPropertysPublicRelationshipMutators(v37) + 8 * v33);
        if (!v47)
        {
          v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v46);
          objc_msgSend(a4, "willChange:valuesAtIndexes:forKey:", 2, v50, v32);
          objc_msgSend(v45, "addObject:", a1);
          objc_msgSend(a4, "didChange:valuesAtIndexes:forKey:", 2, v50, v32);

          goto LABEL_46;
        }
        if (*(_QWORD *)(v47 + 8))
          goto LABEL_43;
        v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v46);
        v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", &v56, 1);
        method_invoke();

      }
      else
      {
        v49 = *(_QWORD *)(_kvcPropertysPublicRelationshipMutators(v37) + 8 * v33);
        if (v49)
        {
          if (*(_QWORD *)(v49 + 8))
          {
LABEL_43:
            method_invoke();
            goto LABEL_46;
          }
          v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v56, 1);
          method_invoke();
        }
        else
        {
          v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v56, 1);
          objc_msgSend(a4, "willChangeValueForKey:withSetMutation:usingObjects:", v32, 1, v51);
          objc_msgSend(v45, "addObject:", v56);
          objc_msgSend(a4, "didChangeValueForKey:withSetMutation:usingObjects:", v32, 1, v51);
        }
      }

      goto LABEL_46;
    }
    objc_msgSend(a3, "didAccessValueForKey:", v10);
    goto LABEL_32;
  }
}

- (NSArray)objectIDsForRelationshipNamed:(NSString *)key
{
  NSString *v3;
  CFStringRef v5;
  id v6;
  unint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  id *v16;
  NSArray *v17;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *Property;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  NSString *v34;
  const __CFString *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CFRange result;
  _BYTE v45[128];
  uint64_t v46;
  CFRange v47;
  CFRange v48;

  v3 = key;
  v46 = *MEMORY[0x1E0C80C00];
  if (!_PF_Threading_Debugging_level)
  {
    if (key)
      goto LABEL_3;
LABEL_42:
    v5 = 0;
    goto LABEL_43;
  }
  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  if (!v3)
    goto LABEL_42;
LABEL_3:
  result.location = 0;
  result.length = 0;
  v47.length = CFStringGetLength((CFStringRef)v3);
  v47.location = 0;
  if (CFStringFindWithOptions((CFStringRef)v3, CFSTR("."), v47, 0, &result))
  {
    v48.length = result.location;
    v48.location = 0;
    v5 = CFStringCreateWithSubstring(0, (CFStringRef)v3, v48);
    v3 = (NSString *)v5;
  }
  else
  {
    v5 = 0;
  }
  v6 = _PFEntityForManagedObject(self);
  if (!v6
    || (v7 = (unint64_t *)v6, v8 = objc_msgSend(*((id *)v6 + 13), "indexForKey:", v3), v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
LABEL_43:
    v32 = (void *)MEMORY[0x1E0CB3940];
    v33 = objc_opt_class();
    v34 = -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name");
    v35 = CFSTR("<null>");
    if (v3)
      v35 = (const __CFString *)v3;
    v36 = objc_msgSend(v32, "stringWithFormat:", CFSTR("[<%@ %p> valueForUndefinedKey:]: the entity %@ is not key value coding-compliant for the key \"%@\"."), v33, self, v34, v35);
    v37 = objc_alloc(MEMORY[0x1E0C99D80]);
    if (!v3)
      v3 = (NSString *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = (void *)objc_msgSend(v37, "initWithObjectsAndKeys:", self, CFSTR("NSTargetObjectUserInfoKey"), v3, CFSTR("NSUnknownUserInfoKey"), 0);
    v39 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0CB3380], v36, v38);

    if (v5)
      CFRelease(v5);
    objc_exception_throw(v39);
  }
  v9 = v8;
  v10 = (_QWORD *)v7[14];
  -[NSManagedObject willAccessValueForKey:](self, "willAccessValueForKey:", v3);
  v11 = v10[12];
  v13 = v9 >= v11;
  v12 = v9 - v11;
  v13 = !v13 || v12 >= v10[13];
  if (!v13 || (v14 = v10[18], v13 = v9 >= v14, v15 = v9 - v14, v13) && v15 < v10[19])
  {
    v16 = _PF_ObjectIDsForDeferredFault((id **)self, v9);
LABEL_17:
    v17 = (NSArray *)v16;
    goto LABEL_18;
  }
  v19 = v10[20];
  v13 = v9 >= v19;
  v20 = v9 - v19;
  if (!v13 || v20 >= v10[21])
  {
    v21 = v10[26];
    v13 = v9 >= v21;
    v22 = v9 - v21;
    if (!v13 || v22 >= v10[27])
    {
      -[NSManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", v3);
      goto LABEL_43;
    }
  }
  v23 = _kvcPropertysPrimitiveGetters(v7);
  Property = _PF_Handler_Public_GetProperty((id **)self, v9, (uint64_t)v3, *(_QWORD *)(v23 + 8 * v9));
  if (!Property)
  {
    v16 = (id *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
    goto LABEL_17;
  }
  v25 = Property;
  v26 = v10[20];
  v13 = v9 >= v26;
  v27 = v9 - v26;
  if (v13 && v27 < v10[21])
  {
    v16 = (id *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(Property, "objectID"));
    goto LABEL_17;
  }
  v17 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v41 != v30)
          objc_enumerationMutation(v25);
        -[NSArray addObject:](v17, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "objectID"));
      }
      v29 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v29);
  }
LABEL_18:
  -[NSManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", v3);
  if (v5)
    CFRelease(v5);
  return v17;
}

- (void)didAccessValueForKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
}

- (void)willAccessValueForKey:(NSString *)key
{
  id *v5;
  unint64_t v6;
  uint64_t cd_extraFlags;
  char *v8;
  NSManagedObject *v9;

  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  else if (!self)
  {
    goto LABEL_4;
  }
  if ((self->_cd_stateFlags & 0x4000) != 0)
  {
    v9 = self;
    self->_cd_stateFlags &= ~0x4000u;
    if (key)
      goto LABEL_5;
LABEL_15:
    -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, self, (uint64_t)self->_cd_managedObjectContext);
    return;
  }
LABEL_4:
  if (!key)
    goto LABEL_15;
LABEL_5:
  v5 = (id *)_PFEntityForManagedObject(self);
  if (v5)
  {
    v6 = objc_msgSend(v5[13], "indexForKey:", key);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      cd_extraFlags = self->_cd_extraFlags;
      if ((_DWORD)cd_extraFlags)
        v8 = (char *)self + cd_extraFlags;
      else
        v8 = 0;
      if (((v8[(v6 >> 3) - (((unint64_t)self->_cd_stateFlags >> 22) & 0x3FC)] >> (v6 & 7)) & 1) == 0)
        _PF_FulfillDeferredFault((id **)self, v6);
    }
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_class *Class;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: null selector"), _NSMethodExceptionProem());
  Class = object_getClass(self);
  return class_respondsToSelector(Class, a3);
}

- (void)willChangeValueForKey:(NSString *)inKey withSetMutation:(NSKeyValueSetMutationKind)inMutationKind usingObjects:(NSSet *)inObjects
{
  id *v10;
  unint64_t v11;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v10 = (id *)_PFEntityForManagedObject(self);
  if (v10)
    v11 = objc_msgSend(v10[13], "indexForKey:", inKey);
  else
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  _PF_ManagedObject_WillChangeValueForKeywithSetMutation(self, (uint64_t)a2, (uint64_t)inKey, inMutationKind, (uint64_t)inObjects, v11);
}

+ (BOOL)contextShouldIgnoreUnmodeledPropertyChanges
{
  return 1;
}

- (void)didChangeValueForKey:(NSString *)inKey withSetMutation:(NSKeyValueSetMutationKind)inMutationKind usingObjects:(NSSet *)inObjects
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  _PF_ManagedObject_DidChangeValueForKeywithSetMutation((uint64_t)self, (uint64_t)a2, (uint64_t)inKey);
}

- (void)_nilOutReservedCurrentEventSnapshot__
{
  uint64_t v2;
  void *v3;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
    {
      v3 = *(void **)(v2 + 24);
      if (v3)
      {

        *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24) = 0;
      }
    }
  }
}

- (id)bindableObjectPublisher
{
  $1A22B458595D9B8B5E31AEBB12624A52 *cd_extras;

  cd_extras = self->_cd_extras;
  if (cd_extras)
    return cd_extras->var4;
  else
    return 0;
}

- (void)_propagateDelete:(uint64_t *)a1
{
  uint64_t *v3;
  unint64_t *v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  char v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int i;
  uint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE *v65;
  unint64_t v66;
  BOOL v67;
  unint64_t v68;
  void *v69;
  uint64_t v70;
  id **v71;
  void *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  int v82;
  _BYTE v83[12];
  int v84;
  int v85;
  int v86;
  unint64_t v87;
  unint64_t v88;
  _BYTE *v89;
  id v90;
  uint64_t *v91;
  uint64_t v92;
  int v93;
  unint64_t v94;
  uint64_t v95;
  _QWORD v96[2];

  v96[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = a1;
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__propagateDelete_);
    v4 = (unint64_t *)_PFEntityForManagedObject(v3);
    v5 = v4;
    if ((v3[2] & 0x80) != 0)
      v90 = 0;
    else
      v90 = (id)v3[4];
    v85 = a2;
    if (v4)
    {
      v6 = v4[14];
      v7 = v4[12];
      v8 = v4[13] + 40;
    }
    else
    {
      v6 = 0;
      v7 = 0;
      v8 = 40;
    }
    v9 = *(_QWORD *)v8;
    v94 = v7 + 24;
    v95 = v9;
    v92 = _kvcPropertysPrimitiveGetters(v4);
    v10 = _kvcPropertysPublicSetters(v5);
    v11 = *((_DWORD *)v3 + 4);
    *((_DWORD *)v3 + 4) = v11 | 0x800;
    if ((v11 & 0x8000) != 0)
      -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, v3, v3[4]);
    v12 = 0;
    v84 = v11 & 0x800;
    v96[0] = 0xA00000006;
    v13 = 1;
    v91 = v3;
    v14 = v85;
    v87 = v6;
    do
    {
      v15 = *((unsigned int *)v96 + v12);
      v93 = v13;
      v16 = (unint64_t *)(v6 + 16 * v15);
      v18 = *v16;
      v17 = v16[1];
      if (*v16 < v17 + *v16)
      {
        do
        {
          v19 = *(void **)(v94 + 8 * v18);
          v20 = *(_QWORD *)(v95 + 8 * v18);
          v21 = objc_msgSend(v19, "deleteRule");
          if (!v21)
            goto LABEL_31;
          v26 = v21;
          if (v21 == 3 && (v14 & 2) == 0)
            goto LABEL_31;
          _PF_Handler_Primitive_GetProperty((id **)v3, v18, v20, *(_QWORD *)(v92 + 8 * v18), v22, v23, v24, v25);
          if (!v27)
            goto LABEL_31;
          v28 = v27;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            __break(1u);
          if ((v14 & 2) == 0 && (unint64_t)(v26 - 1) > 1)
            goto LABEL_31;
          v29 = (void *)objc_msgSend(v19, "inverseRelationship");
          v30 = v28;
          _PF_Handler_Public_SetProperty((unsigned int *)v3, v18, 0, v20, *(_QWORD **)(v10 + 8 * v18));
          if (v29)
          {
            if ((objc_msgSend(v29, "isToMany") & 1) == 0)
            {
              v31 = v10;
              v32 = (void *)objc_msgSend(v28, "entity");
              v33 = objc_msgSend(v29, "entity");
              v34 = objc_msgSend(v29, "_entitysReferenceID");
              if (v32 != (void *)v33)
                v34 = objc_msgSend(v32, "_offsetRelationshipIndex:fromSuperEntity:andIsToMany:", v34, v33, 0);
              v35 = *(_QWORD *)(_kvcPropertysPrimitiveGetters((unint64_t *)v32) + 8 * v34);
              v36 = objc_msgSend(v29, "name");
              _PF_Handler_Primitive_GetProperty((id **)v28, v34, v36, v35, v37, v38, v39, v40);
              v3 = v91;
              v14 = v85;
              v10 = v31;
              if (v41 != v91)
                goto LABEL_30;
            }
            -[NSManagedObject _maintainInverseRelationship:forProperty:oldDestination:newDestination:](v3, v29, (uint64_t *)v28, 0);
          }
          if (v26 == 2 && (objc_msgSend(v28, "isDeleted") & 1) == 0)
            objc_msgSend(v90, "deleteObject:", v28);
LABEL_30:

LABEL_31:
          ++v18;
          --v17;
        }
        while (v17);
      }
      v13 = 0;
      v12 = 1;
      v6 = v87;
    }
    while ((v93 & 1) != 0);
    v42 = 0;
    v96[0] = 0xD00000009;
    for (i = 1; ; i = 0)
    {
      v44 = *((unsigned int *)v96 + v42);
      v86 = i;
      v45 = (unint64_t *)(v6 + 16 * v44);
      v47 = *v45;
      v46 = v45[1];
      v48 = v46 + v47;
      if (v47 < v46 + v47)
        break;
LABEL_69:
      v42 = 1;
      if ((v86 & 1) == 0)
      {
        *((_DWORD *)v3 + 4) = v3[2] & 0xFFFFF7FF | v84;
        return;
      }
    }
    v88 = v46 + v47;
    while (1)
    {
      v49 = *(void **)(v94 + 8 * v47);
      v50 = *(_QWORD *)(v95 + 8 * v47);
      v51 = objc_msgSend(v49, "deleteRule");
      if (v51)
      {
        v56 = v51;
        if (v51 != 3 || (v14 & 2) != 0)
        {
          _PF_Handler_Primitive_GetProperty((id **)v3, v47, v50, *(_QWORD *)(v92 + 8 * v47), v52, v53, v54, v55);
          if (v57)
          {
            v58 = v57;
            if (objc_msgSend(v57, "count"))
            {
              if ((v14 & 2) != 0 || (unint64_t)(v56 - 1) <= 1)
              {
                v59 = (void *)objc_msgSend(v49, "inverseRelationship");
                v93 = objc_msgSend(v59, "isToMany");
                v60 = (void *)objc_msgSend(v58, "allObjects");
                v61 = objc_msgSend(v60, "count");
                v89 = v83;
                v62 = MEMORY[0x1E0C80A78](v61);
                v65 = &v83[-v64];
                if (v62 > 0x200)
                  v65 = (_BYTE *)NSAllocateScannedUncollectable();
                else
                  bzero(&v83[-v64], 8 * v63);
                objc_msgSend(v60, "getObjects:range:", v65, 0, v61);
                v66 = *(_QWORD *)(v6 + 128);
                v67 = v47 >= v66;
                v68 = v47 - v66;
                if (v67 && v68 < *(_QWORD *)(v6 + 136))
                  v69 = (void *)objc_msgSend(v3, "mutableOrderedSetValueForKey:", v50);
                else
                  v69 = (void *)objc_msgSend(v3, "mutableSetValueForKey:", v50);
                objc_msgSend(v69, "removeAllObjects");
                if (v61)
                {
                  v70 = 0;
                  while (1)
                  {
                    v71 = *(id ***)&v65[8 * v70];
                    if (v59)
                    {
                      if ((v93 & 1) == 0)
                      {
                        v72 = (void *)objc_msgSend(*(id *)&v65[8 * v70], "entity");
                        v73 = objc_msgSend(v59, "entity");
                        v74 = objc_msgSend(v59, "_entitysReferenceID");
                        if (v72 != (void *)v73)
                          v74 = objc_msgSend(v72, "_offsetRelationshipIndex:fromSuperEntity:andIsToMany:", v74, v73, 0);
                        v75 = *(_QWORD *)(_kvcPropertysPrimitiveGetters((unint64_t *)v72) + 8 * v74);
                        v76 = objc_msgSend(v59, "name");
                        _PF_Handler_Primitive_GetProperty(v71, v74, v76, v75, v77, v78, v79, v80);
                        v3 = v91;
                        if (v81 != v91)
                        {
                          v82 = 1;
                          goto LABEL_61;
                        }
                      }
                      -[NSManagedObject _maintainInverseRelationship:forProperty:oldDestination:newDestination:](v3, v59, (uint64_t *)v71, 0);
                    }
                    v82 = 0;
LABEL_61:
                    if (v56 == 2 && ((v82 | objc_msgSend(v71, "isDeleted")) & 1) == 0)
                      objc_msgSend(v90, "deleteObject:", v71);
                    if (v61 == ++v70)
                    {
                      v14 = v85;
                      v6 = v87;
                      if (v61 >= 0x201)
                        NSZoneFree(0, v65);
                      break;
                    }
                  }
                }
                v48 = v88;
              }
            }
          }
        }
      }
      if (++v47 == v48)
        goto LABEL_69;
    }
  }
}

_QWORD *__80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke(uint64_t a1, _QWORD *a2, double a3)
{
  unint64_t v4;
  _QWORD v6[7];

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___sharedIMPL_setvfk_core_d_block_invoke;
  v6[3] = &unk_1E1EDE0C8;
  v6[4] = a2;
  v6[5] = v4;
  *(double *)&v6[6] = a3;
  return _sharedIMPL_setvfk_core_scalar(a2, v4, (uint64_t)v6);
}

- (BOOL)_tryRetain
{
  unsigned int *p_cd_rc;
  unsigned int v3;
  unsigned int v4;

  p_cd_rc = (unsigned int *)&self->_cd_rc;
LABEL_2:
  v3 = *p_cd_rc;
  if ((*p_cd_rc & 1) == 0)
  {
    do
    {
      v4 = __ldaxr(p_cd_rc);
      if (v4 != v3)
      {
        __clrex();
        goto LABEL_2;
      }
    }
    while (__stlxr(v3 + 2, p_cd_rc));
    if (*MEMORY[0x1E0C9A980])
      NSRecordAllocationEvent();
  }
  return (v3 & 1) == 0;
}

- (void)didSave
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
}

- (void)_setVersionReference__:(unsigned int)a3
{
  self->_cd_lockingInfo = a3;
}

- (unsigned)_versionReference__
{
  return self->_cd_lockingInfo;
}

- (_QWORD)_setOriginalSnapshot__:(_QWORD *)result
{
  _QWORD *v3;
  malloc_zone_t *v4;
  void *v5;

  if (result)
  {
    v3 = result;
    result = (_QWORD *)result[6];
    if (!result)
    {
      if (!a2)
        return result;
      v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone)
        v4 = malloc_default_zone();
      result = malloc_type_zone_calloc(v4, 1uLL, 0x28uLL, 0x800402FCC0CB6uLL);
      v3[6] = result;
    }
    v5 = (void *)result[1];
    if (v5 != a2)
    {

      result = a2;
      *(_QWORD *)(v3[6] + 8) = result;
    }
  }
  return result;
}

- (_QWORD)_setLastSnapshot__:(_QWORD *)result
{
  _QWORD *v3;
  _QWORD *v4;
  malloc_zone_t *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  _QWORD *v9;

  if (result)
  {
    v3 = result;
    v4 = (_QWORD *)result[6];
    if (!v4)
    {
      if (!a2)
        return result;
      v5 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone)
        v5 = malloc_default_zone();
      v4 = malloc_type_zone_calloc(v5, 1uLL, 0x28uLL, 0x800402FCC0CB6uLL);
      v3[6] = v4;
    }
    v8 = (void *)v4[2];
    v6 = v4 + 2;
    v7 = v8;
    v9 = v6 + 1;

    if (v8 != a2)
    {
      *v9 = v7;
      v9 = v6;
    }
    result = a2;
    *v9 = result;
  }
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSManagedObject;
  return objc_msgSendSuper2(&v4, sel_automaticallyNotifiesObserversForKey_, a3);
}

+ (void)_release_1
{
  unsigned int *v2;
  unsigned int v3;

  v2 = (unsigned int *)objc_msgSend(a1, "_PFMOClassFactoryData");
  do
    v3 = __ldxr(v2);
  while (__stxr(v3 - 1, v2));
}

+ (void)_entityDeallocated
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;

  v3 = objc_msgSend(a1, "_PFMOClassFactoryData");
  if (v3)
  {
    v4 = v3;
    os_unfair_lock_lock(&stru_1ECD8D9DC);
    *(_QWORD *)(v4 + 24) = 0;
    v5 = (void *)objc_msgSend(a1, "_PFPlaceHolderSingleton");
    v6 = (objc_class *)objc_opt_class();
    object_setClass(v5, v6);
    *(_QWORD *)(v4 + 8) = 0;
    os_unfair_lock_unlock(&stru_1ECD8D9DC);
  }
}

- (id)primitiveValueForKey:(NSString *)key
{
  unint64_t *v5;
  unint64_t *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v5 = (unint64_t *)_PFEntityForManagedObject(self);
  if (v5
    && ((v6 = v5, v7 = (void *)v5[13], !(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
      ? (v8 = objc_msgSend(v7, "indexForKey:", key))
      : (v8 = objc_msgSend(v7, "fastIndexForKnownKey:", key)),
        v9 = v8,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    if (!*(_QWORD *)(_kvcPropertysPrimitiveGetters(v6) + 8 * v8))
      return -[NSManagedObject _genericValueForKey:withIndex:flags:](self, "_genericValueForKey:withIndex:flags:", key, v9, 0);
  }
  else
  {
    object_getClass(self);
    _NSKeyValuePrimitiveGetterForClassAndKey();
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((self->_cd_stateFlags & 0x8000) != 0)
    objc_msgSend((id)_insertion_fault_handler, "fulfillFault:withContext:forIndex:", self, self->_cd_managedObjectContext, v9);
  return (id)_NSGetUsingKeyValueGetter();
}

- (BOOL)validateForInsert:(NSError *)error
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  if ((objc_msgSend(_PFEntityForManagedObject(self), "_skipValidation") & 1) != 0)
    return 1;
  else
    return -[NSManagedObject _validateForSave:](self, error);
}

- (BOOL)validateForDelete:(NSError *)error
{
  unint64_t *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  BOOL result;
  uint64_t v36;
  NSError **v37;
  uint64_t v38;
  uint64_t v39;
  NSError *v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  if ((objc_msgSend(_PFEntityForManagedObject(self), "_skipValidation") & 1) != 0)
    goto LABEL_32;
  if ((self->_cd_stateFlags & 0x8000) != 0)
    -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, self, (uint64_t)self->_cd_managedObjectContext);
  v5 = (unint64_t *)_PFEntityForManagedObject(self);
  if (v5)
  {
    v6 = v5;
    v7 = v5[14];
    v8 = *(_QWORD *)(v5[13] + 40);
    v9 = _kvcPropertysPrimitiveGetters(v5);
    v10 = v6[12];
    v40 = 0;
    v12 = *(_QWORD *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 40);
    v13 = v11 + v12;
    if (v12 < v11 + v12)
    {
      v14 = v9;
      v15 = v10 + 24;
      v39 = 1;
      v36 = v9;
      v37 = error;
      do
      {
        v16 = *(_QWORD *)(v8 + 8 * v12);
        v17 = *(void **)(v15 + 8 * v12);
        if (objc_msgSend(v17, "deleteRule", v36))
        {
          _PF_Handler_Primitive_GetProperty((id **)self, v12, v16, *(_QWORD *)(v14 + 8 * v12), v18, v19, v20, v21);
          if (v22)
          {
            v23 = v22;
            if (objc_msgSend(v17, "isToMany"))
            {
              v24 = objc_msgSend(v23, "count");
              if (v24)
              {
                v25 = v24;
                v26 = MEMORY[0x1E0C80A78](v24);
                v28 = (char *)&v36 - v27;
                v38 = v29;
                if (v26 > 0x200)
                  v28 = (char *)NSAllocateScannedUncollectable();
                else
                  bzero((char *)&v36 - v27, 8 * v26);
                objc_msgSend(v23, "getObjects:", v28);
                v31 = 0;
                while ((objc_msgSend(*(id *)&v28[8 * v31], "isDeleted") & 1) != 0)
                {
                  if (v25 == ++v31)
                  {
                    error = v37;
                    v32 = v39;
                    goto LABEL_26;
                  }
                }
                error = v37;
                if (v37)
                {
                  v43 = CFSTR("NSValidationErrorShouldAttemptRecoveryKey");
                  v44[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
                  v33 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]((uint64_t)self, 1600, 0, v16, (uint64_t)v23, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1));
                  -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](self, v33, (uint64_t *)&v40);
                }
                v32 = 0;
LABEL_26:
                if (v25 >= 0x201)
                  NSZoneFree(0, v28);
                v39 = v32;
                v14 = v36;
                if (!((error != 0) | v32 & 1))
                {
LABEL_34:
                  v34 = 0;
                  return v34 & 1;
                }
              }
            }
            else if ((objc_msgSend(v23, "isDeleted") & 1) == 0)
            {
              if (!error)
                goto LABEL_34;
              v41 = CFSTR("NSValidationErrorShouldAttemptRecoveryKey");
              v42 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
              v30 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]((uint64_t)self, 1600, 0, v16, (uint64_t)v23, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
              -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](self, v30, (uint64_t *)&v40);
              v39 = 0;
            }
          }
        }
        ++v12;
      }
      while (v12 != v13);
      v34 = v39;
      if (!((error == 0) | v39 & 1))
      {
        v34 = 0;
        *error = v40;
      }
      return v34 & 1;
    }
LABEL_32:
    v34 = 1;
    return v34 & 1;
  }
  result = _kvcPropertysPrimitiveGetters(0);
  __break(1u);
  return result;
}

- (void)willSave
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
}

- (BOOL)validateForUpdate:(NSError *)error
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  if ((objc_msgSend(_PFEntityForManagedObject(self), "_skipValidation") & 1) != 0)
    return 1;
  else
    return -[NSManagedObject _validateForSave:](self, error);
}

+ (unsigned)allocBatch:(id *)a3 withEntity:(id)a4 count:(unsigned int)a5
{
  unint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int InstanceSize;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v8 = _PFFastEntityClass((unint64_t *)a4);
  v9 = objc_msgSend(v8, "_PFMOClassFactoryData");
  if (!v9)
    return 0;
  v10 = v9;
  if (!*(_QWORD *)(v9 + 24))
  {
    if (a4 && (v17 = *((_QWORD *)a4 + 14)) != 0)
      v18 = *(_QWORD *)(v17 + 8);
    else
      v18 = objc_msgSend((id)objc_msgSend(a4, "propertiesByName"), "count");
    if (v18 <= 1)
      v19 = 1;
    else
      v19 = v18;
    *(_QWORD *)(v10 + 24) = 8 * v19;
  }
  v11 = _PFAllocateObjects((objc_class *)v8, a3, a5, 0);
  InstanceSize = class_getInstanceSize((Class)v8);
  if (v11)
  {
    v13 = *(_DWORD *)(v10 + 40) | (*(unsigned __int8 *)(v10 + 32) << 24);
    v14 = v11;
    do
    {
      v15 = (uint64_t)*a3++;
      *(_DWORD *)(v15 + 16) = v13;
      *(_DWORD *)(v15 + 20) = (InstanceSize + 7) & 0xFFFFFFF8;
      --v14;
    }
    while (v14);
  }
  return v11;
}

- (_QWORD)_setObjectID__:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[5];
    if (v4 != a2)
    {

      result = a2;
      v3[5] = result;
    }
  }
  return result;
}

+ (void)initialize
{
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  malloc_zone_t *v10;
  size_t InstanceSize;
  uint64_t v12;

  objc_opt_self();
  if (objc_getClass("NSManagedObject") == a1 && qword_1ECD8D9B0 == 0)
  {
    v4 = (objc_class *)objc_opt_class();
    off_1ECD8D9B8 = class_getMethodImplementation(v4, sel_willChangeValueForKey_);
    v5 = (objc_class *)objc_opt_class();
    _NSObjectDidChangeVFKImp = class_getMethodImplementation(v5, sel_didChangeValueForKey_);
    v6 = (objc_class *)objc_opt_class();
    off_1ECD8D9C0 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))class_getMethodImplementation(v6, sel_willChangeValueForKey_withSetMutation_usingObjects_);
    v7 = (objc_class *)objc_opt_class();
    _NSObjectDidChangeForKeywithSetMutationImp = (uint64_t (*)(_QWORD, _QWORD, _QWORD))class_getMethodImplementation(v7, sel_didChangeValueForKey_withSetMutation_usingObjects_);
    v8 = (objc_class *)objc_opt_class();
    off_1ECD8D9C8 = class_getMethodImplementation(v8, sel_willChange_valuesAtIndexes_forKey_);
    v9 = (objc_class *)objc_opt_class();
    off_1ECD8D9D0 = class_getMethodImplementation(v9, sel_didChange_valuesAtIndexes_forKey_);
    v10 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v10 = malloc_default_zone();
    InstanceSize = class_getInstanceSize((Class)a1);
    qword_1ECD8D9B0 = (uint64_t)malloc_type_zone_calloc(v10, 1uLL, (InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8, 0x66599487uLL);
    object_setClass((id)qword_1ECD8D9B0, (Class)a1);
    v12 = qword_1ECD8D9B0;
    *(_DWORD *)(qword_1ECD8D9B0 + 16) |= 0x100000u;
    *(_DWORD *)(v12 + 8) = 0x20000000;
    _MergedGlobals_73 = 1;
    objc_opt_class();
  }
}

- (id)dictionaryWithValuesForKeys:(id)a3
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id Property;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v5 = _PFEntityForManagedObject(self);
  if (!v5)
  {
    v28.receiver = self;
    v28.super_class = (Class)NSManagedObject;
    return -[NSManagedObject dictionaryWithValuesForKeys:](&v28, sel_dictionaryWithValuesForKeys_, a3);
  }
  v6 = v5;
  v7 = objc_msgSend(a3, "count");
  if (a3)
  {
    v8 = v7;
    if (!v7)
      return (id)NSDictionary_EmptyDictionary;
    MEMORY[0x1E0C80A78](v7);
    v10 = (char *)&v25 - v9;
    v25 = v11;
    if (v8 > 0x200)
    {
      v10 = (char *)NSAllocateScannedUncollectable();
      v13 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v25 - v9, 8 * v8);
      MEMORY[0x1E0C80A78](v12);
      v13 = (char *)&v25 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v13, 8 * v8);
    }
    objc_msgSend(a3, "getObjects:range:", v10, 0, v8, v25);
    v16 = (void *)v6[13];
    v17 = (void *)objc_msgSend(v6, "propertiesByName");
    v27 = _kvcPropertysPublicGetters(v6);
    v26 = objc_msgSend(v17, "values");
    v18 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = 0;
    do
    {
      v20 = *(_QWORD *)&v10[8 * v19];
      v21 = objc_msgSend(v16, "indexForKey:", v20);
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        Property = -[NSManagedObject valueForKey:](self, "valueForKey:", v20);
      }
      else
      {
        v23 = v21;
        Property = _PF_Handler_Public_GetProperty((id **)self, v21, v20, *(_QWORD *)(v27 + 8 * v21));
        if (objc_msgSend(Property, "isFault")
          && objc_msgSend(*(id *)(v26 + 8 * v23), "_isToManyRelationship"))
        {
          objc_msgSend(Property, "count");
        }
      }
      if (Property)
        v24 = (uint64_t)Property;
      else
        v24 = v18;
      *(_QWORD *)&v13[8 * v19++] = v24;
    }
    while (v8 != v19);
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", v13, v10, v8);
    if (v8 >= 0x201)
    {
      NSZoneFree(0, v13);
      NSZoneFree(0, v10);
    }
    return v14;
  }
  if (self)
    return -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](self, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 0);
  else
    return 0;
}

- (void)_setGenericValue:(id)a3 forKey:(id)a4 withIndex:(int64_t)a5 flags:(int64_t)a6
{
  if (a6)
    _sharedIMPL_setvfk_core((char **)self, (uint64_t)a2, a3, a5);
  else
    _sharedIMPL_setPvfk_core((char **)self, (uint64_t)a2, a3, a5);
}

- (void)setValue:(id)value forKey:(NSString *)key
{
  id v7;
  unint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v7 = _PFEntityForManagedObject(self);
  if (v7
    && (v8 = (unint64_t *)v7, v9 = objc_msgSend(*((id *)v7 + 13), "indexForKey:", key),
                                     v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v10 = v9;
    v11 = *(_QWORD **)(_kvcPropertysPublicSetters(v8) + 8 * v9);
    _PF_Handler_Public_SetProperty((unsigned int *)self, v10, value, (uint64_t)key, v11);
  }
  else
  {
    object_getClass(self);
    _NSKeyValueSetterForClassAndKey();
    _NSSetUsingKeyValueSetter();
  }
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  const char *Name;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const __CFAllocator *v13;
  size_t v14;
  size_t v15;
  uint64_t v16;
  const __CFAllocator *v17;
  CFStringRef v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  objc_property *v25;
  const char *v26;
  size_t v27;
  uint64_t v28;
  char *v29;
  size_t v30;
  char *v31;
  char *v32;
  char *v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  int v40;
  unsigned int v41;
  int v42;
  int v43;
  int v44;
  unsigned int v45;
  objc_class *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  size_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  const __CFString **v66;
  char *v67;
  const __CFString **v68;
  const char *v69;
  void *v70;
  BOOL v71;
  int v72;
  uint64_t v73;
  const char *v74;
  CFStringRef v75;
  id v76;
  uint64_t v77;
  objc_class *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  CFStringRef v86;
  id v87;
  uint64_t v88;
  const char *v89;
  CFStringRef v90;
  id v91;
  uint64_t v92;
  const char *v93;
  CFStringRef v94;
  id v95;
  uint64_t v96;
  char *v97;
  objc_class *v98;
  void *v99;
  _QWORD *v100;
  objc_property *Property;
  const char *Attributes;
  size_t v103;
  uint64_t v104;
  char *v105;
  size_t v106;
  char *v107;
  char *v108;
  char v109;
  int v110;
  unint64_t v111;
  unint64_t v112;
  BOOL v113;
  unint64_t v114;
  unint64_t v115;
  BOOL v116;
  char *v117;
  int v118;
  unint64_t v119;
  unint64_t v120;
  uint64_t v121;
  int v122;
  int v123;
  int v124;
  unsigned int v125;
  int v126;
  int v127;
  int v128;
  unsigned int v129;
  objc_class *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  int v138;
  unint64_t v139;
  unint64_t v140;
  size_t v141;
  char *v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  int v154;
  int v155;
  const __CFString **v156;
  int v157;
  char *v158;
  int v159;
  const __CFString **v160;
  char *v161;
  int v162;
  uint64_t (*v163)(_DWORD *, uint64_t, uint64_t, unint64_t);
  void (*v164)(void *, uint64_t, void *, unint64_t);
  objc_class *v165;
  const char *v166;
  CFStringRef v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  objc_class *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const __CFString *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  const char *v188;
  CFStringRef v189;
  id v190;
  uint64_t v191;
  char *v192;
  const char *v193;
  void (*v194)(void);
  objc_class *v195;
  const char *v196;
  const char *TypeEncoding;
  void *v198;
  char *v199;
  char *v200;
  char **v201;
  IMP AccessorType;
  char *v203;
  uint64_t v204;
  objc_class *v205;
  void *v206;
  void (*v207)(void);
  void *v208;
  void *v209;
  char *v210;
  int v211;
  void (*v212)(_DWORD *, uint64_t, void *, unint64_t);
  void (*v213)(void *, uint64_t, uint64_t, unint64_t);
  const char *v214;
  uint64_t v215;
  objc_class *v216;
  const char *v217;
  objc_class *v218;
  const char *v219;
  const char *v220;
  CFStringRef v221;
  id v222;
  const char *v223;
  CFStringRef v224;
  id v225;
  uint64_t v226;
  char *v227;
  const char *v228;
  uint64_t v229;
  char *v230;
  objc_class *v231;
  objc_method *InstanceMethod;
  IMP Implementation;
  char *v234;
  char *v235;
  const char *v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  char *v242;
  char *v243;
  char *v244;
  const char *v245;
  uint64_t v246;
  char *v247;
  uint64_t v249;
  const char *v250;
  const char *v251;
  const __CFString *v252;
  int v253;
  SEL v254;
  const __CFString **v255;
  const __CFString **v256;
  id v257;
  CFStringRef v258;
  id v259;
  _QWORD v260[5];
  uint64_t v261;
  uint64_t v262;
  _BYTE v263[5];
  char *v264;
  uint64_t v265;
  void *v266;
  void *v267;
  void *v268;
  unint64_t v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  uint64_t v302;

  v302 = *MEMORY[0x1E0C80C00];
  Name = sel_getName(a3);
  v6 = objc_msgSend(a1, "_PFMOClassFactoryData");
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD **)(v6 + 8);
    if (v8)
    {
      v259 = a1;
      v254 = a3;
      v9 = strncmp(Name, "managedObjectOriginal_", 0x16uLL);
      v10 = (void *)v8[13];
      if (v9)
        v11 = 0;
      else
        v11 = 22;
      v12 = &Name[v11];
      v300 = 0u;
      v301 = 0u;
      v298 = 0u;
      v299 = 0u;
      v296 = 0u;
      v297 = 0u;
      v294 = 0u;
      v295 = 0u;
      v292 = 0u;
      v293 = 0u;
      v290 = 0u;
      v291 = 0u;
      v288 = 0u;
      v289 = 0u;
      v286 = 0u;
      v287 = 0u;
      v284 = 0u;
      v285 = 0u;
      v282 = 0u;
      v283 = 0u;
      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v276 = 0u;
      v277 = 0u;
      v274 = 0u;
      v275 = 0u;
      v272 = 0u;
      v273 = 0u;
      v270 = 0u;
      v271 = 0u;
      v13 = _PFStackAllocatorCreate((unint64_t *)&v270, 1024);
      v14 = strlen(v12);
      v15 = v14 + 100;
      MEMORY[0x1E0C80A78](v14);
      v255 = (const __CFString **)((char *)&v252 - v16);
      v17 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
      v18 = CFStringCreateWithCStringNoCopy(v13, v12, 0x600u, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
      v257 = v10;
      v258 = v18;
      v19 = objc_msgSend(v10, "indexForKey:", v18);
      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v14 < 5)
          goto LABEL_272;
        if (v14 < 0xE)
        {
          if (v14 < 0xA)
          {
            v256 = &v252;
            v65 = 0;
            goto LABEL_66;
          }
        }
        else if (!strncmp("setPrimitive", v12, 0xCuLL))
        {
          if (*((_QWORD *)&v271 + 1))
          {
            if (v258)
              CFRelease(v258);
          }
          else
          {
            *((_QWORD *)&v270 + 1) = v270;
          }
          v89 = (const char *)v255;
          strlcpy((char *)v255, v12 + 12, v15);
          v89[v14 - 13] = 0;
          v90 = CFStringCreateWithCStringNoCopy(v13, v89, 0x600u, v17);
          v91 = v257;
          v258 = v90;
          v92 = objc_msgSend(v257, "indexForKey:");
          if (v92 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_208;
          if (*((_QWORD *)&v271 + 1))
          {
            if (v258)
              CFRelease(v258);
          }
          else
          {
            *((_QWORD *)&v270 + 1) = v270;
          }
          v158 = (char *)v255;
          *v158 = __tolower(*(char *)v255);
          v258 = CFStringCreateWithCStringNoCopy(v13, v158, 0x600u, v17);
          v92 = objc_msgSend(v91, "indexForKey:");
          if (v92 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_208:
            v20 = v92;
            v21 = v259;
            if ((_MergedGlobals_74 & 1) == 0)
              objc_msgSend(v259, "_initializePrimitiveAccessorStubs");
            v69 = 0;
            v253 = 0;
            LODWORD(v257) = 0;
            v70 = 0;
            v73 = qword_1ECD8DA08;
            v72 = 1;
            goto LABEL_319;
          }
          goto LABEL_272;
        }
        if (!strncmp("primitive", v12, 9uLL))
        {
          if (*((_QWORD *)&v271 + 1))
          {
            if (v258)
              CFRelease(v258);
          }
          else
          {
            *((_QWORD *)&v270 + 1) = v270;
          }
          v85 = (const char *)v255;
          strlcpy((char *)v255, v12 + 9, v15);
          v86 = CFStringCreateWithCStringNoCopy(v13, v85, 0x600u, v17);
          v87 = v257;
          v258 = v86;
          v88 = objc_msgSend(v257, "indexForKey:");
          if (v88 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_194;
          if (*((_QWORD *)&v271 + 1))
          {
            if (v258)
              CFRelease(v258);
          }
          else
          {
            *((_QWORD *)&v270 + 1) = v270;
          }
          v153 = (char *)v255;
          *v153 = __tolower(*(char *)v255);
          v258 = CFStringCreateWithCStringNoCopy(v13, v153, 0x600u, v17);
          v88 = objc_msgSend(v87, "indexForKey:");
          if (v88 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_194:
            v20 = v88;
            v21 = v259;
            if ((byte_1ECD8D9D9 & 1) == 0)
              objc_msgSend(v259, "_initializeAccessorStubs");
            v69 = 0;
            v253 = 0;
            LODWORD(v257) = 0;
            v70 = 0;
            LODWORD(v67) = 0;
            v73 = qword_1ECD8DA10;
            v72 = 1;
            goto LABEL_275;
          }
          goto LABEL_272;
        }
        v256 = &v252;
        v65 = 1;
LABEL_66:
        if (strncmp("set", v12, 3uLL))
        {
          if (strncmp("add", v12, 3uLL))
          {
            if (v14 < 8)
              goto LABEL_200;
            if (strncmp("remove", v12, 6uLL))
            {
              if (v14 < 0x12)
              {
                if (v14 < 0x10)
                  goto LABEL_200;
              }
              else
              {
                if (!strncmp("insert", v12, 6uLL))
                {
                  if (v14 < 0x18 || strncmp("insertObject:in", v12, 0xFuLL) || strncmp("AtIndex:", &v12[v14 - 8], 8uLL))
                  {
                    if (!strncmp(":atIndexes:", &v12[v14 - 11], 0xBuLL))
                    {
                      if (*((_QWORD *)&v271 + 1))
                      {
                        if (v258)
                          CFRelease(v258);
                      }
                      else
                      {
                        *((_QWORD *)&v270 + 1) = v270;
                      }
                      v223 = (const char *)v255;
                      strlcpy((char *)v255, v12 + 6, v15);
                      v223[v14 - 17] = 0;
                      v224 = CFStringCreateWithCStringNoCopy(v13, v223, 0x600u, v17);
                      v225 = v257;
                      v258 = v224;
                      v226 = objc_msgSend(v257, "indexForKey:");
                      if (v226 != 0x7FFFFFFFFFFFFFFFLL)
                        goto LABEL_406;
                      if (*((_QWORD *)&v271 + 1))
                      {
                        if (v258)
                          CFRelease(v258);
                      }
                      else
                      {
                        *((_QWORD *)&v270 + 1) = v270;
                      }
                      v234 = (char *)v255;
                      *v234 = __tolower(*(char *)v255);
                      v258 = CFStringCreateWithCStringNoCopy(v13, v234, 0x600u, v17);
                      v226 = objc_msgSend(v225, "indexForKey:");
                      if (v226 != 0x7FFFFFFFFFFFFFFFLL)
                      {
LABEL_406:
                        v20 = v226;
                        v253 = 0;
                        LODWORD(v257) = 0;
                        v73 = 0;
                        v72 = 0;
                        LODWORD(v67) = 1;
                        v70 = _sharedIMPL_insertOrderedSetAtIndexes_core;
                        v69 = "v@:@@";
                        goto LABEL_274;
                      }
                    }
                    goto LABEL_272;
                  }
                  if (*((_QWORD *)&v271 + 1))
                  {
                    if (v258)
                      CFRelease(v258);
                  }
                  else
                  {
                    *((_QWORD *)&v270 + 1) = v270;
                  }
                  v240 = (const char *)v255;
                  strlcpy((char *)v255, v12 + 15, v15);
                  v240[v14 - 23] = 0;
                  v258 = CFStringCreateWithCStringNoCopy(v13, v240, 0x600u, v17);
                  v241 = objc_msgSend(v257, "indexForKey:");
                  if (v241 != 0x7FFFFFFFFFFFFFFFLL)
                    goto LABEL_442;
                  if (*((_QWORD *)&v271 + 1))
                  {
                    if (v258)
                      CFRelease(v258);
                  }
                  else
                  {
                    *((_QWORD *)&v270 + 1) = v270;
                  }
                  v244 = (char *)v255;
                  *v244 = __tolower(*(char *)v255);
                  v258 = CFStringCreateWithCStringNoCopy(v13, v244, 0x600u, v17);
                  v241 = objc_msgSend(v257, "indexForKey:");
                  if (v241 != 0x7FFFFFFFFFFFFFFFLL)
                  {
LABEL_442:
                    v20 = v241;
                    v253 = 0;
                    LODWORD(v257) = 0;
                    v73 = 0;
                    v72 = 0;
                    LODWORD(v67) = 1;
                    v70 = _sharedIMPL_insertObjectToOrderedSetAtIndex_core;
                    v69 = "v@:@Q";
                    goto LABEL_274;
                  }
                  goto LABEL_450;
                }
                if (v14 >= 0x17 && !strncmp("replace", v12, 7uLL))
                {
                  if (v14 < 0x23
                    || strncmp("replaceObjectIn", v12, 0xFuLL)
                    || strncmp("AtIndex:withObject:", &v12[v14 - 19], 0x13uLL))
                  {
                    v66 = v256;
                    if (v12[v14 - 1] == 58)
                    {
                      v67 = strnstr(v12, "AtIndexes:with", v14);
                      if (v67)
                      {
                        v256 = v66;
                        if (*((_QWORD *)&v271 + 1))
                        {
                          if (v258)
                            CFRelease(v258);
                        }
                        else
                        {
                          *((_QWORD *)&v270 + 1) = v270;
                        }
                        v236 = (const char *)v255;
                        strlcpy((char *)v255, v12 + 7, v15);
                        v236[&v12[v14] - v67 - 15] = 0;
                        v258 = CFStringCreateWithCStringNoCopy(v13, v236, 0x600u, v17);
                        v237 = objc_msgSend(v257, "indexForKey:");
                        if (v237 == 0x7FFFFFFFFFFFFFFFLL)
                        {
                          if (*((_QWORD *)&v271 + 1))
                          {
                            if (v258)
                              CFRelease(v258);
                          }
                          else
                          {
                            *((_QWORD *)&v270 + 1) = v270;
                          }
                          v242 = (char *)v255;
                          *v242 = __tolower(*(char *)v255);
                          v258 = CFStringCreateWithCStringNoCopy(v13, v242, 0x600u, v17);
                          v237 = objc_msgSend(v257, "indexForKey:");
                        }
                        v20 = v237;
                        v253 = 0;
                        LODWORD(v257) = 0;
                        v73 = 0;
                        v72 = 0;
                        LODWORD(v67) = v237 != 0x7FFFFFFFFFFFFFFFLL;
                        if (v237 == 0x7FFFFFFFFFFFFFFFLL)
                          v69 = 0;
                        else
                          v69 = "v@:@@";
                        if (v237 == 0x7FFFFFFFFFFFFFFFLL)
                          v70 = 0;
                        else
                          v70 = _sharedIMPL_replaceOrderedSetAtIndexes_core;
                        goto LABEL_274;
                      }
                      v69 = 0;
                      v253 = 0;
                      LODWORD(v257) = 0;
                      v70 = 0;
                      v73 = 0;
                      v72 = 0;
                      goto LABEL_273;
                    }
LABEL_272:
                    v69 = 0;
                    v253 = 0;
                    LODWORD(v257) = 0;
                    v70 = 0;
                    v73 = 0;
                    v72 = 0;
                    LODWORD(v67) = 0;
LABEL_273:
                    v20 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_274:
                    v21 = v259;
                    goto LABEL_275;
                  }
                  if (*((_QWORD *)&v271 + 1))
                  {
                    if (v258)
                      CFRelease(v258);
                  }
                  else
                  {
                    *((_QWORD *)&v270 + 1) = v270;
                  }
                  v245 = (const char *)v255;
                  strlcpy((char *)v255, v12 + 15, v15);
                  v245[v14 - 34] = 0;
                  v258 = CFStringCreateWithCStringNoCopy(v13, v245, 0x600u, v17);
                  v246 = objc_msgSend(v257, "indexForKey:");
                  if (v246 != 0x7FFFFFFFFFFFFFFFLL)
                    goto LABEL_451;
                  if (*((_QWORD *)&v271 + 1))
                  {
                    if (v258)
                      CFRelease(v258);
                  }
                  else
                  {
                    *((_QWORD *)&v270 + 1) = v270;
                  }
                  v247 = (char *)v255;
                  *v247 = __tolower(*(char *)v255);
                  v258 = CFStringCreateWithCStringNoCopy(v13, v247, 0x600u, v17);
                  v246 = objc_msgSend(v257, "indexForKey:");
                  if (v246 != 0x7FFFFFFFFFFFFFFFLL)
                  {
LABEL_451:
                    v20 = v246;
                    v253 = 0;
                    LODWORD(v257) = 0;
                    v73 = 0;
                    v72 = 0;
                    LODWORD(v67) = 1;
                    v70 = _sharedIMPL_replaceObjectInOrderedSetAtIndex_core;
                    v69 = "v@:Q@";
                    goto LABEL_274;
                  }
LABEL_450:
                  v69 = 0;
                  v253 = 0;
                  LODWORD(v257) = 0;
                  v70 = 0;
                  v73 = 0;
                  v72 = 0;
                  LODWORD(v67) = 0;
                  v20 = 0x7FFFFFFFFFFFFFFFLL;
                  goto LABEL_274;
                }
              }
              if (strncmp("validate", v12, 8uLL) || strncmp(":error:", &v12[v14 - 7], 7uLL))
              {
LABEL_200:
                if (!v65)
                  goto LABEL_450;
                v154 = strncmp("will", v12, 4uLL);
                if (v154)
                {
                  v155 = strncmp("did", v12, 3uLL);
                  v156 = v256;
                  if (v155)
                    goto LABEL_272;
                  if (!strncmp("Change", v12 + 3, 6uLL))
                  {
                    v256 = v156;
                    v157 = 1;
                  }
                  else
                  {
                    if (strncmp("Access", v12 + 3, 6uLL))
                      goto LABEL_272;
                    v256 = v156;
                    v157 = 0;
                  }
                  v170 = 9;
                }
                else
                {
                  v159 = strncmp("Change", v12 + 4, 6uLL);
                  v160 = v256;
                  if (v159)
                  {
                    if (strncmp("Access", v12 + 4, 6uLL))
                      goto LABEL_272;
                    v256 = v160;
                    v157 = 0;
                  }
                  else
                  {
                    v157 = 1;
                  }
                  v170 = 10;
                }
                if (*((_QWORD *)&v271 + 1))
                {
                  if (v258)
                    CFRelease(v258);
                }
                else
                {
                  *((_QWORD *)&v270 + 1) = v270;
                }
                v187 = &v12[v170];
                v188 = (const char *)v255;
                strlcpy((char *)v255, v187, v15);
                v189 = CFStringCreateWithCStringNoCopy(v13, v188, 0x600u, v17);
                v190 = v257;
                v258 = v189;
                v191 = objc_msgSend(v257, "indexForKey:");
                if (v191 != 0x7FFFFFFFFFFFFFFFLL)
                  goto LABEL_337;
                if (*((_QWORD *)&v271 + 1))
                {
                  if (v258)
                    CFRelease(v258);
                }
                else
                {
                  *((_QWORD *)&v270 + 1) = v270;
                }
                v203 = (char *)v255;
                *v203 = __tolower(*(char *)v255);
                v258 = CFStringCreateWithCStringNoCopy(v13, v203, 0x600u, v17);
                v191 = objc_msgSend(v190, "indexForKey:");
                v20 = 0x7FFFFFFFFFFFFFFFLL;
                if (v191 != 0x7FFFFFFFFFFFFFFFLL)
                {
LABEL_337:
                  v204 = v191;
                  v205 = (objc_class *)v259;
                  if (*((_QWORD *)&v271 + 1))
                  {
                    if (v258)
                      CFRelease(v258);
                  }
                  else
                  {
                    *((_QWORD *)&v270 + 1) = v270;
                  }
                  if (v154)
                  {
                    if (!v157)
                    {
                      v207 = (void (*)(void))pf_empty_method_imp;
LABEL_362:
                      class_addMethod(v205, v254, v207, "v@:");
                      LOBYTE(v6) = 1;
                      return v6;
                    }
                    v264 = (char *)MEMORY[0x1E0C809B0];
                    v265 = 3221225472;
                    v266 = __generateAccessor_block_invoke;
                    v267 = &__block_descriptor_48_e8__16__0_8l;
                    v206 = _sharedIMPL_dcvfk_core;
                  }
                  else
                  {
                    v264 = (char *)MEMORY[0x1E0C809B0];
                    v265 = 3221225472;
                    v266 = __generateAccessor_block_invoke;
                    v267 = &__block_descriptor_48_e8__16__0_8l;
                    if (v157)
                      v206 = _sharedIMPL_wcvfk_core;
                    else
                      v206 = _PF_Handler_WillAccess_Property;
                  }
                  v268 = v206;
                  v269 = v204;
                  v207 = imp_implementationWithBlock(&v264);
                  goto LABEL_362;
                }
LABEL_395:
                v69 = 0;
                v253 = 0;
                LODWORD(v257) = 0;
                v70 = 0;
                v73 = 0;
                v72 = 0;
                LODWORD(v67) = 0;
                goto LABEL_274;
              }
              if (*((_QWORD *)&v271 + 1))
              {
                if (v258)
                  CFRelease(v258);
              }
              else
              {
                *((_QWORD *)&v270 + 1) = v270;
              }
              v220 = (const char *)v255;
              strlcpy((char *)v255, v12 + 8, v15);
              v220[v14 - 15] = 0;
              v221 = CFStringCreateWithCStringNoCopy(v13, v220, 0x600u, v17);
              v222 = v257;
              v258 = v221;
              if (objc_msgSend(v257, "indexForKey:") == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (*((_QWORD *)&v271 + 1))
                {
                  if (v258)
                    CFRelease(v258);
                }
                else
                {
                  *((_QWORD *)&v270 + 1) = v270;
                }
                v230 = (char *)v255;
                *v230 = __tolower(*(char *)v255);
                v258 = CFStringCreateWithCStringNoCopy(v13, v230, 0x600u, v17);
                v20 = 0x7FFFFFFFFFFFFFFFLL;
                if (objc_msgSend(v222, "indexForKey:") == 0x7FFFFFFFFFFFFFFFLL)
                  goto LABEL_395;
              }
              v231 = (objc_class *)v259;
              if (*((_QWORD *)&v271 + 1))
              {
                if (v258)
                  CFRelease(v258);
              }
              else
              {
                *((_QWORD *)&v270 + 1) = v270;
              }
              InstanceMethod = class_getInstanceMethod(v231, sel__defaultValidation_error_);
              Implementation = method_getImplementation(InstanceMethod);
              TypeEncoding = method_getTypeEncoding(InstanceMethod);
              v195 = v231;
              v196 = v254;
              v194 = Implementation;
LABEL_291:
              class_addMethod(v195, v196, v194, TypeEncoding);
              LOBYTE(v6) = 1;
              return v6;
            }
            if (v14 < 0xE)
              goto LABEL_218;
            if (strncmp("Object:", &v12[v14 - 7], 7uLL))
            {
              if (v14 >= 0x19)
              {
                if (!strncmp("AtIndex:", &v12[v14 - 8], 8uLL))
                {
                  if (!strncmp("removeObjectFrom", v12, 0x10uLL))
                  {
                    if (*((_QWORD *)&v271 + 1))
                    {
                      if (v258)
                        CFRelease(v258);
                    }
                    else
                    {
                      *((_QWORD *)&v270 + 1) = v270;
                    }
                    v238 = (const char *)v255;
                    strlcpy((char *)v255, v12 + 16, v15);
                    v238[v14 - 24] = 0;
                    v258 = CFStringCreateWithCStringNoCopy(v13, v238, 0x600u, v17);
                    v239 = objc_msgSend(v257, "indexForKey:");
                    if (v239 != 0x7FFFFFFFFFFFFFFFLL)
                      goto LABEL_439;
                    if (*((_QWORD *)&v271 + 1))
                    {
                      if (v258)
                        CFRelease(v258);
                    }
                    else
                    {
                      *((_QWORD *)&v270 + 1) = v270;
                    }
                    v243 = (char *)v255;
                    *v243 = __tolower(*(char *)v255);
                    v258 = CFStringCreateWithCStringNoCopy(v13, v243, 0x600u, v17);
                    v239 = objc_msgSend(v257, "indexForKey:");
                    if (v239 != 0x7FFFFFFFFFFFFFFFLL)
                    {
LABEL_439:
                      v20 = v239;
                      v253 = 0;
                      LODWORD(v257) = 0;
                      v73 = 0;
                      v72 = 0;
                      LODWORD(v67) = 1;
                      v70 = _sharedIMPL_removeObjectFromOrderedSetAtIndex_core;
                      v69 = "v@:Q";
                      goto LABEL_274;
                    }
                  }
                  goto LABEL_218;
                }
LABEL_266:
                if (!strncmp("AtIndexes:", &v12[v14 - 10], 0xAuLL))
                {
                  if (*((_QWORD *)&v271 + 1))
                  {
                    if (v258)
                      CFRelease(v258);
                  }
                  else
                  {
                    *((_QWORD *)&v270 + 1) = v270;
                  }
                  v228 = (const char *)v255;
                  strlcpy((char *)v255, v12 + 6, v15);
                  v228[v14 - 16] = 0;
                  v258 = CFStringCreateWithCStringNoCopy(v13, v228, 0x600u, v17);
                  v229 = objc_msgSend(v257, "indexForKey:");
                  if (v229 != 0x7FFFFFFFFFFFFFFFLL)
                    goto LABEL_410;
                  if (*((_QWORD *)&v271 + 1))
                  {
                    if (v258)
                      CFRelease(v258);
                  }
                  else
                  {
                    *((_QWORD *)&v270 + 1) = v270;
                  }
                  v235 = (char *)v255;
                  *v235 = __tolower(*(char *)v255);
                  v258 = CFStringCreateWithCStringNoCopy(v13, v235, 0x600u, v17);
                  v229 = objc_msgSend(v257, "indexForKey:");
                  if (v229 != 0x7FFFFFFFFFFFFFFFLL)
                  {
LABEL_410:
                    v20 = v229;
                    v69 = 0;
                    v253 = 0;
                    LODWORD(v257) = 0;
                    v73 = 0;
                    v72 = 0;
                    LODWORD(v67) = 1;
                    v70 = _sharedIMPL_removeOrderedSetAtIndexes_core;
                    goto LABEL_274;
                  }
                }
                goto LABEL_218;
              }
              if (v14 >= 0x11)
                goto LABEL_266;
LABEL_218:
              if (*((_QWORD *)&v271 + 1))
              {
                if (v258)
                  CFRelease(v258);
              }
              else
              {
                *((_QWORD *)&v270 + 1) = v270;
              }
              v166 = (const char *)v255;
              strlcpy((char *)v255, v12 + 6, v15);
              v166[v14 - 7] = 0;
              v167 = CFStringCreateWithCStringNoCopy(v13, v166, 0x600u, v17);
              v168 = v257;
              v258 = v167;
              v169 = objc_msgSend(v257, "indexForKey:");
              if (v169 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (*((_QWORD *)&v271 + 1))
                {
                  if (v258)
                    CFRelease(v258);
                }
                else
                {
                  *((_QWORD *)&v270 + 1) = v270;
                }
                v192 = (char *)v255;
                *v192 = __tolower(*(char *)v255);
                v258 = CFStringCreateWithCStringNoCopy(v13, v192, 0x600u, v17);
                v169 = objc_msgSend(v168, "indexForKey:");
                if (v169 == 0x7FFFFFFFFFFFFFFFLL)
                  goto LABEL_272;
              }
              v20 = v169;
              v21 = v259;
              v162 = objc_msgSend(*(id *)(v8[12] + 24 + 8 * v169), "_isOrdered");
              v69 = 0;
              v253 = 0;
              LODWORD(v257) = 0;
              v73 = 0;
              v72 = 0;
              v163 = _sharedIMPL_removeSet_core;
              v164 = _sharedIMPL_removeOrderedSet_core;
LABEL_316:
              if (v162)
                v70 = v164;
              else
                v70 = v163;
LABEL_319:
              LODWORD(v67) = 1;
              goto LABEL_275;
            }
            if (*((_QWORD *)&v271 + 1))
            {
              if (v258)
                CFRelease(v258);
            }
            else
            {
              *((_QWORD *)&v270 + 1) = v270;
            }
            v214 = (const char *)v255;
            strlcpy((char *)v255, v12 + 6, v15);
            v214[v14 - 13] = 0;
            v258 = CFStringCreateWithCStringNoCopy(v13, v214, 0x600u, v17);
            v215 = objc_msgSend(v257, "indexForKey:");
            if (v215 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (*((_QWORD *)&v271 + 1))
              {
                if (v258)
                  CFRelease(v258);
              }
              else
              {
                *((_QWORD *)&v270 + 1) = v270;
              }
              v227 = (char *)v255;
              *v227 = __tolower(*(char *)v255);
              v258 = CFStringCreateWithCStringNoCopy(v13, v227, 0x600u, v17);
              v20 = objc_msgSend(v257, "indexForKey:");
              if (v20 == 0x7FFFFFFFFFFFFFFFLL)
                goto LABEL_218;
            }
            else
            {
              v20 = v215;
            }
            v211 = objc_msgSend(*(id *)(v8[12] + 24 + 8 * v20), "_isOrdered");
            v69 = 0;
            v253 = 0;
            LODWORD(v257) = 0;
            v73 = 0;
            v72 = 0;
            v212 = _sharedIMPL_removeObjectFromSet_core;
            v213 = _sharedIMPL_removeObjectFromOrderedSet_core;
LABEL_384:
            if (v211)
              v70 = v213;
            else
              v70 = v212;
            LODWORD(v67) = 1;
            goto LABEL_274;
          }
          if (v14 >= 0xB && !strncmp("Object:", &v12[v14 - 7], 7uLL))
          {
            if (*((_QWORD *)&v271 + 1))
            {
              if (v258)
                CFRelease(v258);
            }
            else
            {
              *((_QWORD *)&v270 + 1) = v270;
            }
            v179 = (const char *)v255;
            strlcpy((char *)v255, v12 + 3, v15);
            v179[v14 - 10] = 0;
            v258 = CFStringCreateWithCStringNoCopy(v13, v179, 0x600u, v17);
            v180 = objc_msgSend(v257, "indexForKey:");
            if (v180 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v20 = v180;
LABEL_359:
              v211 = objc_msgSend(*(id *)(v8[12] + 24 + 8 * v20), "_isOrdered");
              v69 = 0;
              v253 = 0;
              LODWORD(v257) = 0;
              v73 = 0;
              v72 = 0;
              v212 = _sharedIMPL_addObjectToSet_core;
              v213 = _sharedIMPL_addObjectToOrderedSet_core;
              goto LABEL_384;
            }
            if (*((_QWORD *)&v271 + 1))
            {
              if (v258)
                CFRelease(v258);
            }
            else
            {
              *((_QWORD *)&v270 + 1) = v270;
            }
            v210 = (char *)v255;
            *v210 = __tolower(*(char *)v255);
            v258 = CFStringCreateWithCStringNoCopy(v13, v210, 0x600u, v17);
            v20 = objc_msgSend(v257, "indexForKey:");
            if (v20 != 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_359;
          }
          if (*((_QWORD *)&v271 + 1))
          {
            if (v258)
              CFRelease(v258);
          }
          else
          {
            *((_QWORD *)&v270 + 1) = v270;
          }
          v93 = (const char *)v255;
          strlcpy((char *)v255, v12 + 3, v15);
          v93[v14 - 4] = 0;
          v94 = CFStringCreateWithCStringNoCopy(v13, v93, 0x600u, v17);
          v95 = v257;
          v258 = v94;
          v96 = objc_msgSend(v257, "indexForKey:");
          if (v96 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (*((_QWORD *)&v271 + 1))
            {
              if (v258)
                CFRelease(v258);
            }
            else
            {
              *((_QWORD *)&v270 + 1) = v270;
            }
            v161 = (char *)v255;
            *v161 = __tolower(*(char *)v255);
            v258 = CFStringCreateWithCStringNoCopy(v13, v161, 0x600u, v17);
            v96 = objc_msgSend(v95, "indexForKey:");
            if (v96 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_272;
          }
          v20 = v96;
          v21 = v259;
          v162 = objc_msgSend(*(id *)(v8[12] + 24 + 8 * v96), "_isOrdered");
          v69 = 0;
          v253 = 0;
          LODWORD(v257) = 0;
          v73 = 0;
          v72 = 0;
          v163 = _sharedIMPL_addSet_core;
          v164 = _sharedIMPL_addOrderedSet_core;
          goto LABEL_316;
        }
        if (*((_QWORD *)&v271 + 1))
        {
          v68 = v256;
          if (v258)
            CFRelease(v258);
        }
        else
        {
          *((_QWORD *)&v270 + 1) = v270;
          v68 = v256;
        }
        v74 = (const char *)v255;
        strlcpy((char *)v255, v12 + 3, v15);
        v74[v14 - 4] = 0;
        v75 = CFStringCreateWithCStringNoCopy(v13, v74, 0x600u, v17);
        v76 = v257;
        v258 = v75;
        v77 = objc_msgSend(v257, "indexForKey:");
        if (v77 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (*((_QWORD *)&v271 + 1))
          {
            if (v258)
              CFRelease(v258);
          }
          else
          {
            *((_QWORD *)&v270 + 1) = v270;
          }
          v97 = (char *)v255;
          *v97 = __tolower(*(char *)v255);
          v258 = CFStringCreateWithCStringNoCopy(v13, v97, 0x600u, v17);
          v77 = objc_msgSend(v76, "indexForKey:");
          if (v77 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_272;
        }
        v20 = v77;
        v98 = (objc_class *)objc_opt_class();
        v99 = *(void **)(v8[12] + 24 + 8 * v20);
        v100 = (_QWORD *)v8[14];
        Property = class_getProperty(v98, (const char *)v255);
        v256 = v68;
        if (Property)
        {
          Attributes = property_getAttributes(Property);
          v103 = strlen(Attributes);
          v252 = (const __CFString *)&v252;
          MEMORY[0x1E0C80A78](v103);
          v105 = (char *)&v252 - v104;
          strlcpy((char *)&v252 - v104, Attributes, v106);
          v264 = v105;
          v107 = strsep(&v264, ",");
          if (v107)
          {
            v108 = v107;
            LODWORD(v257) = 0;
            v253 = 0;
            v109 = 1;
            while (1)
            {
              v110 = *v108;
              if (v110 == 67)
              {
                v111 = v100[12];
                v113 = v20 >= v111;
                v112 = v20 - v111;
                v113 = !v113 || v112 >= v100[13];
                if (!v113
                  || ((v114 = v100[20], v113 = v20 >= v114, v115 = v20 - v114, v113)
                    ? (v116 = v115 >= v100[21])
                    : (v116 = 1),
                      !v116))
                {
                  v21 = v259;
                  v165 = (objc_class *)objc_opt_class();
                  v251 = class_getName(v165);
                  v250 = (const char *)v255;
                  v178 = CFSTR("Property '%s' is marked copy on class '%s'.  Cannot generate a copying setter method for NSManagedObject's to-one relationship.");
                  goto LABEL_236;
                }
                v109 = 0;
                goto LABEL_180;
              }
              if (v110 != 84)
              {
                if (v110 == 87)
                {
                  v21 = v259;
                  v171 = (objc_class *)objc_opt_class();
                  v251 = class_getName(v171);
                  v250 = (const char *)v255;
                  v178 = CFSTR("Property '%s' is marked __weak on class '%s'.  Cannot generate a setter method for it.");
                  goto LABEL_236;
                }
                goto LABEL_180;
              }
              v118 = v108[1];
              v117 = v108 + 1;
              if (v118 == 64 || (isTypeEncodingObject(v117) & 1) != 0)
                goto LABEL_180;
              v119 = v100[2];
              v113 = v20 >= v119;
              v120 = v20 - v119;
              if (!v113 || v120 >= v100[3])
              {
                v21 = v259;
                v216 = (objc_class *)objc_opt_class();
                v217 = class_getName(v216);
                v250 = v12;
                v251 = v217;
                v178 = CFSTR("Property '%s' is a scalar type on class '%s'.  Cannot generate a setter method for it.");
                goto LABEL_236;
              }
              v121 = objc_msgSend(v99, "attributeType");
              if (v121 <= 499)
              {
                if (v121 == 100)
                {
                  v127 = *v117;
                  LODWORD(v257) = 115;
                  if ((v127 | 0x20) != 0x73)
                    goto LABEL_370;
                }
                else if (v121 == 200)
                {
                  v128 = *v117;
                  LODWORD(v257) = 105;
                  v129 = v128 - 73;
                  if (v129 > 0x28)
                    goto LABEL_370;
                  if (((1 << v129) & 0x900000009) == 0)
                  {
                    if (((1 << v129) & 0x10000000100) == 0)
                      goto LABEL_370;
                    v130 = (objc_class *)objc_opt_class();
                    v251 = class_getName(v130);
                    _NSCoreDataLog(2, (uint64_t)CFSTR("Property '%s' is a 64 bit scalar type on class '%s' that does not match its entity's property's 32 bit scalar type.  Implicit coercion to 32 bits in the database is not recommended."), v131, v132, v133, v134, v135, v136, (uint64_t)v12);
                    LODWORD(v257) = 113;
                    v253 = 105;
                  }
                }
                else if (v121 != 300 || (v123 = *v117, LODWORD(v257) = 113, (v123 | 0x20) != 0x71))
                {
LABEL_370:
                  v21 = v259;
                  v218 = (objc_class *)objc_opt_class();
                  v219 = class_getName(v218);
                  v250 = v12;
                  v251 = v219;
                  v178 = CFSTR("Property '%s' is a scalar type on class '%s' that does not match its Entity's property's scalar type.  Dynamically generated accessors do not support implicit type coercion.  Cannot generate a setter method for it.");
LABEL_236:
                  _NSCoreDataLog(1, (uint64_t)v178, v172, v173, v174, v175, v176, v177, (uint64_t)v250);
                  v69 = 0;
                  v70 = 0;
                  v73 = 0;
                  v72 = 0;
                  LODWORD(v67) = 1;
LABEL_246:
                  v20 = 0x7FFFFFFFFFFFFFFFLL;
                  goto LABEL_275;
                }
              }
              else if (v121 > 799)
              {
                if (v121 == 900)
                {
LABEL_172:
                  v126 = *v117;
                  LODWORD(v257) = 100;
                  if (v126 != 100)
                    goto LABEL_370;
                  goto LABEL_180;
                }
                if (v121 != 800)
                  goto LABEL_370;
                v124 = *v117;
                LODWORD(v257) = 66;
                v125 = v124 - 66;
                if (v125 > 0x21 || ((1 << v125) & 0x200000003) == 0)
                  goto LABEL_370;
              }
              else
              {
                if (v121 == 500)
                  goto LABEL_172;
                if (v121 != 600)
                  goto LABEL_370;
                v122 = *v117;
                LODWORD(v257) = 102;
                if (v122 != 102)
                  goto LABEL_370;
              }
LABEL_180:
              v108 = strsep(&v264, ",");
              if (!v108)
                goto LABEL_191;
            }
          }
          v253 = 0;
          LODWORD(v257) = 0;
          v109 = 1;
LABEL_191:
          v138 = v109 & 1;
        }
        else if (v98 == (objc_class *)objc_opt_class())
        {
          LODWORD(v257) = 0;
          v253 = 0;
          v138 = 1;
        }
        else
        {
          v137 = v100[2];
          v138 = 1;
          v113 = v20 >= v137;
          v139 = v20 - v137;
          LODWORD(v257) = 0;
          if (v113)
          {
            v140 = v100[3];
            v253 = 0;
            v21 = v259;
            if (v139 < v140)
            {
              v141 = v14 + 2;
              v142 = (char *)malloc_type_calloc(1uLL, v14 + 2, 0x68B6DD4AuLL);
              *v142 = 95;
              v143 = (const char *)v255;
              strlcat(v142, (const char *)v255, v141);
              if (!class_getInstanceVariable(v98, v143) && !class_getInstanceVariable(v98, v142))
              {
                v144 = objc_msgSend(v8, "name");
                v145 = sel_getName(v254);
                v146 = class_getName(v98);
                v250 = v145;
                v251 = v146;
                v249 = v144;
                _NSCoreDataLog(2, (uint64_t)CFSTR("dynamic accessors failed to find @property implementation for '%s' for entity '%@' while resolving selector '%s' on class '%s'.  Did you remember to declare it @dynamic or @synthesized in the @implementation ?"), v147, v148, v149, v150, v151, v152, (uint64_t)v255);
              }
              free(v142);
              LODWORD(v257) = 0;
              v253 = 0;
              v138 = 1;
            }
            goto LABEL_244;
          }
          v253 = 0;
        }
        v21 = v259;
LABEL_244:
        if (objc_msgSend(v99, "isReadOnly", v252))
        {
          v251 = (const char *)objc_msgSend(v8, "name");
          LODWORD(v67) = 1;
          _NSCoreDataLog(1, (uint64_t)CFSTR("Property '%s' is marked readonly on entity '%@'.  Cannot generate a setter method for it."), v181, v182, v183, v184, v185, v186, (uint64_t)v255);
          v69 = 0;
          v70 = 0;
          v73 = 0;
          v72 = 0;
          goto LABEL_246;
        }
        if (v138)
        {
          if ((byte_1ECD8D9D9 & 1) == 0)
            objc_msgSend(v21, "_initializeAccessorStubs");
          v69 = 0;
          v70 = 0;
          v72 = 0;
          v73 = qword_1ECD8DA18;
          LODWORD(v67) = 1;
        }
        else
        {
          v69 = 0;
          v73 = 0;
          v72 = 0;
          LODWORD(v67) = 1;
          v70 = _sharedIMPL_copying_setvfk_core;
        }
LABEL_275:
        if (*((_QWORD *)&v271 + 1))
        {
          if (v258)
            CFRelease(v258);
        }
        else
        {
          *((_QWORD *)&v270 + 1) = v270;
        }
        if (v20 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_280;
        v193 = "@@:";
        if ((_DWORD)v67)
          v193 = "v@:@";
        if (!v69)
          v69 = v193;
        if (!strcmp(v69, "v@:Q") || !strcmp(v69, "v@:I") || strlen(v69) >= 5)
        {
          generateAccessorWithFunctionPtrSignature(v69, (uint64_t)v70, v20);
          if (!v6)
            return v6;
          v194 = (void (*)(void))v6;
          goto LABEL_290;
        }
        if (!(_DWORD)v257)
        {
          if (v20 <= 0x31 && v73)
          {
            v194 = *(void (**)(void))(v73 + 8 * v20);
          }
          else
          {
            if (v70)
            {
              v264 = (char *)MEMORY[0x1E0C809B0];
              v265 = 3221225472;
              v266 = __generateAccessor_block_invoke_2;
              v267 = &__block_descriptor_48_e11__24__0_8_16l;
              v268 = v70;
              v269 = v20;
              AccessorType = imp_implementationWithBlock(&v264);
            }
            else
            {
              AccessorType = generateAccessorType((int)v67, v20, v72);
            }
            v194 = AccessorType;
            if (!AccessorType)
              goto LABEL_280;
          }
LABEL_290:
          v195 = (objc_class *)v21;
          v196 = v254;
          TypeEncoding = v69;
          goto LABEL_291;
        }
        if ((_DWORD)v67)
        {
          qmemcpy(v263, "v@:", 3);
          *(_WORD *)&v263[3] = v257;
          if (v257 <= 0x70u)
          {
            v198 = _sharedIMPL_setvfk_core_c;
            switch((char)v257)
            {
              case 'c':
                goto LABEL_351;
              case 'd':
                v262 = MEMORY[0x1E0C809B0];
                v199 = (char *)&__block_descriptor_40_e11_v24__0_8d16l;
                v200 = (char *)__80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke;
                v201 = (char **)&v262;
                break;
              case 'e':
              case 'g':
              case 'h':
                goto LABEL_280;
              case 'f':
                v261 = MEMORY[0x1E0C809B0];
                v199 = (char *)&__block_descriptor_40_e11_v20__0_8f16l;
                v200 = (char *)__80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke_2;
                v201 = (char **)&v261;
                break;
              case 'i':
                v198 = _sharedIMPL_setvfk_core_i;
                goto LABEL_351;
              default:
                if (v257 != 66)
                  goto LABEL_280;
                goto LABEL_351;
            }
            v201[1] = (char *)3221225472;
            v201[2] = v200;
            v201[3] = v199;
            v201[4] = (char *)v20;
LABEL_355:
            v194 = imp_implementationWithBlock(v201);
            if (v194)
            {
              TypeEncoding = v263;
              v195 = (objc_class *)v21;
              v196 = v254;
              goto LABEL_291;
            }
            goto LABEL_280;
          }
          if (v257 == 113)
          {
            if (!v253)
            {
              v198 = _sharedIMPL_setvfk_core_q;
              goto LABEL_351;
            }
            if (v253 == 105)
            {
              v198 = _sharedIMPL_setvfk_core_i2q;
              goto LABEL_351;
            }
          }
          else if (v257 == 115)
          {
            v198 = _sharedIMPL_setvfk_core_s;
LABEL_351:
            v264 = (char *)MEMORY[0x1E0C809B0];
            v265 = 3221225472;
            v208 = __generateAccessor_block_invoke_2;
            v209 = &__block_descriptor_48_e11__24__0_8_16l;
LABEL_354:
            v266 = v208;
            v267 = v209;
            v268 = v198;
            v269 = v20;
            v201 = &v264;
            goto LABEL_355;
          }
LABEL_280:
          LOBYTE(v6) = 0;
          return v6;
        }
        v263[0] = (_BYTE)v257;
        strcpy(&v263[1], "@:");
        if (v257 <= 0x70u)
        {
          v198 = _sharedIMPL_pvfk_core_c;
          switch((char)v257)
          {
            case 'c':
              goto LABEL_353;
            case 'd':
              v260[0] = MEMORY[0x1E0C809B0];
              v260[1] = 3221225472;
              v260[2] = __80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke_3;
              v260[3] = &__block_descriptor_40_e8_d16__0_8l;
              v260[4] = v20;
              v201 = (char **)v260;
              goto LABEL_355;
            case 'e':
            case 'g':
            case 'h':
              goto LABEL_280;
            case 'f':
              v198 = _sharedIMPL_pvfk_core_f;
              goto LABEL_353;
            case 'i':
              v198 = _sharedIMPL_pvfk_core_i;
              goto LABEL_353;
            default:
              if (v257 != 66)
                goto LABEL_280;
              goto LABEL_353;
          }
        }
        if (v257 == 113)
        {
          if (v253)
          {
            if (v253 != 105)
              goto LABEL_280;
            v198 = _sharedIMPL_pvfk_core_i2q;
          }
          else
          {
            v198 = _sharedIMPL_pvfk_core_q;
          }
        }
        else
        {
          if (v257 != 115)
            goto LABEL_280;
          v198 = _sharedIMPL_pvfk_core_s;
        }
LABEL_353:
        v264 = (char *)MEMORY[0x1E0C809B0];
        v265 = 3221225472;
        v208 = __generateAccessor_block_invoke;
        v209 = &__block_descriptor_48_e8__16__0_8l;
        goto LABEL_354;
      }
      v20 = v19;
      v256 = &v252;
      v21 = v259;
      if ((byte_1ECD8D9D9 & 1) == 0)
        objc_msgSend(v259, "_initializeAccessorStubs");
      v22 = (objc_class *)objc_opt_class();
      v23 = *(void **)(v8[12] + 24 + 8 * v20);
      v24 = v8[14];
      v25 = class_getProperty(v22, v12);
      if (v25)
      {
        v26 = property_getAttributes(v25);
        v27 = strlen(v26);
        v255 = &v252;
        MEMORY[0x1E0C80A78](v27);
        v29 = (char *)&v252 - v28;
        strlcpy((char *)&v252 - v28, v26, v30);
        v264 = v29;
        v31 = strsep(&v264, ",");
        if (v31)
        {
          v32 = v31;
          LODWORD(v257) = 0;
          v253 = 0;
          v252 = CFSTR("Property '%s' is a scalar type on class '%s' that does not match its Entity's property's scalar type.  Dynamically generated accessors do not support implicit type coercion.  Cannot generate a getter method for it.");
          while (1)
          {
            if (*v32 == 84)
            {
              v34 = v32[1];
              v33 = v32 + 1;
              if (v34 != 64 && (isTypeEncodingObject(v33) & 1) == 0)
              {
                v35 = *(_QWORD *)(v24 + 16);
                v113 = v20 >= v35;
                v36 = v20 - v35;
                if (!v113 || v36 >= *(_QWORD *)(v24 + 24))
                {
                  v252 = CFSTR("Property '%s' is a scalar type on class '%s'.  Cannot generate a getter method for it.");
LABEL_103:
                  v21 = v259;
                  v78 = (objc_class *)objc_opt_class();
                  v251 = class_getName(v78);
                  _NSCoreDataLog(1, (uint64_t)v252, v79, v80, v81, v82, v83, v84, (uint64_t)v12);
                  v20 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_104:
                  v69 = 0;
                  v70 = 0;
                  v73 = 0;
                  v72 = 0;
                  LODWORD(v67) = 0;
                  goto LABEL_275;
                }
                v37 = objc_msgSend(v23, "attributeType", v252);
                if (v37 <= 499)
                {
                  switch(v37)
                  {
                    case 100:
                      v43 = *v33;
                      LODWORD(v257) = 115;
                      if ((v43 | 0x20) != 0x73)
                        goto LABEL_103;
                      break;
                    case 200:
                      v44 = *v33;
                      LODWORD(v257) = 105;
                      v45 = v44 - 73;
                      if (v45 > 0x28)
                        goto LABEL_103;
                      if (((1 << v45) & 0x900000009) == 0)
                      {
                        if (((1 << v45) & 0x10000000100) == 0)
                          goto LABEL_103;
                        v46 = (objc_class *)objc_opt_class();
                        v251 = class_getName(v46);
                        _NSCoreDataLog(2, (uint64_t)CFSTR("Property '%s' is a 64 bit scalar type on class '%s' that does not match its entity's property's 32 bit scalar type.  Implicit coercion to 32 bits in the database is not recommended."), v47, v48, v49, v50, v51, v52, (uint64_t)v12);
                        LODWORD(v257) = 113;
                        v253 = 105;
                      }
                      break;
                    case 300:
                      v39 = *v33;
                      LODWORD(v257) = 113;
                      if ((v39 | 0x20) != 0x71)
                        goto LABEL_103;
                      break;
                    default:
                      goto LABEL_103;
                  }
                }
                else if (v37 > 799)
                {
                  if (v37 == 900)
                  {
LABEL_41:
                    v42 = *v33;
                    LODWORD(v257) = 100;
                    if (v42 != 100)
                      goto LABEL_103;
                    goto LABEL_49;
                  }
                  if (v37 != 800)
                    goto LABEL_103;
                  v40 = *v33;
                  LODWORD(v257) = 66;
                  v41 = v40 - 66;
                  if (v41 > 0x21 || ((1 << v41) & 0x200000003) == 0)
                    goto LABEL_103;
                }
                else
                {
                  if (v37 == 500)
                    goto LABEL_41;
                  if (v37 != 600)
                    goto LABEL_103;
                  v38 = *v33;
                  LODWORD(v257) = 102;
                  if (v38 != 102)
                    goto LABEL_103;
                }
              }
            }
LABEL_49:
            v32 = strsep(&v264, ",");
            if (!v32)
              goto LABEL_63;
          }
        }
        v253 = 0;
        LODWORD(v257) = 0;
LABEL_63:
        v21 = v259;
      }
      else if (v22 == (objc_class *)objc_opt_class())
      {
        LODWORD(v257) = 0;
        v253 = 0;
      }
      else
      {
        v53 = *(_QWORD *)(v24 + 16);
        v113 = v20 >= v53;
        v54 = v20 - v53;
        LODWORD(v257) = 0;
        if (v113)
        {
          v55 = *(_QWORD *)(v24 + 24);
          v253 = 0;
          if (v54 < v55)
          {
            v56 = v14 + 2;
            v57 = (char *)malloc_type_calloc(1uLL, v56, 0xB7888E5AuLL);
            *v57 = 95;
            strlcat(v57, v12, v56);
            if (!class_getInstanceVariable(v22, v12) && !class_getInstanceVariable(v22, v57))
            {
              v58 = objc_msgSend(v8, "name");
              v250 = sel_getName(v254);
              v251 = class_getName(v22);
              v21 = v259;
              v249 = v58;
              _NSCoreDataLog(2, (uint64_t)CFSTR("dynamic accessors failed to find @property implementation for '%s' for entity '%@' while resolving selector '%s' on class '%s'.  Did you remember to declare it @dynamic or @synthesized in the @implementation ?"), v59, v60, v61, v62, v63, v64, (uint64_t)v12);
            }
            free(v57);
            LODWORD(v257) = 0;
            v253 = 0;
          }
        }
        else
        {
          v253 = 0;
        }
      }
      if ((*(_BYTE *)(v7 + 96) & 1) == 0)
      {
        v69 = 0;
        v70 = 0;
        LODWORD(v67) = 0;
        v71 = *(_QWORD *)(_kvcPropertysPrimitiveGetters(v8) + 8 * v20) == 0;
        v72 = v71;
        if (v71)
          v73 = qword_1ECD8DA10;
        else
          v73 = 0;
        goto LABEL_275;
      }
      goto LABEL_104;
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (void)_initializeAccessorStubs
{
  malloc_zone_t *v2;
  _QWORD *v3;
  malloc_zone_t *v4;
  _QWORD *v5;
  malloc_zone_t *v6;
  malloc_zone_t *v7;

  v2 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone)
    v2 = malloc_default_zone();
  v3 = malloc_type_zone_malloc(v2, 0x190uLL, 0x80040B8603338uLL);
  v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone)
    v4 = malloc_default_zone();
  v5 = malloc_type_zone_malloc(v4, 0x190uLL, 0x80040B8603338uLL);
  os_unfair_lock_lock_with_options();
  if (qword_1ECD8DA10)
  {
    v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v6 = malloc_default_zone();
    malloc_zone_free(v6, v3);
    v7 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v7 = malloc_default_zone();
    malloc_zone_free(v7, v5);
    v3 = (_QWORD *)qword_1ECD8DA10;
    v5 = (_QWORD *)qword_1ECD8DA18;
  }
  else
  {
    qword_1ECD8DA10 = (uint64_t)v3;
    qword_1ECD8DA18 = (uint64_t)v5;
  }
  *v3 = _pvfk_0;
  v3[1] = _pvfk_1;
  v3[2] = _pvfk_2;
  v3[3] = _pvfk_3;
  v3[4] = _pvfk_4;
  v3[5] = _pvfk_5;
  v3[6] = _pvfk_6;
  v3[7] = _pvfk_7;
  v3[8] = _pvfk_8;
  v3[9] = _pvfk_9;
  v3[10] = _pvfk_10;
  v3[11] = _pvfk_11;
  v3[12] = _pvfk_12;
  v3[13] = _pvfk_13;
  v3[14] = _pvfk_14;
  v3[15] = _pvfk_15;
  v3[16] = _pvfk_16;
  v3[17] = _pvfk_17;
  v3[18] = _pvfk_18;
  v3[19] = _pvfk_19;
  v3[20] = _pvfk_20;
  v3[21] = _pvfk_21;
  v3[22] = _pvfk_22;
  v3[23] = _pvfk_23;
  v3[24] = _pvfk_24;
  v3[25] = _pvfk_25;
  v3[26] = _pvfk_26;
  v3[27] = _pvfk_27;
  v3[28] = _pvfk_28;
  v3[29] = _pvfk_29;
  v3[30] = _pvfk_30;
  v3[31] = _pvfk_31;
  v3[32] = _pvfk_32;
  v3[33] = _pvfk_33;
  v3[34] = _pvfk_34;
  v3[35] = _pvfk_35;
  v3[36] = _pvfk_36;
  v3[37] = _pvfk_37;
  v3[38] = _pvfk_38;
  v3[39] = _pvfk_39;
  v3[40] = _pvfk_40;
  v3[41] = _pvfk_41;
  v3[42] = _pvfk_42;
  v3[43] = _pvfk_43;
  v3[44] = _pvfk_44;
  v3[45] = _pvfk_45;
  v3[46] = _pvfk_46;
  v3[47] = _pvfk_47;
  v3[48] = _pvfk_48;
  v3[49] = _pvfk_49;
  *v5 = _svfk_0;
  v5[1] = _svfk_1;
  v5[2] = _svfk_2;
  v5[3] = _svfk_3;
  v5[4] = _svfk_4;
  v5[5] = _svfk_5;
  v5[6] = _svfk_6;
  v5[7] = _svfk_7;
  v5[8] = _svfk_8;
  v5[9] = _svfk_9;
  v5[10] = _svfk_10;
  v5[11] = _svfk_11;
  v5[12] = _svfk_12;
  v5[13] = _svfk_13;
  v5[14] = _svfk_14;
  v5[15] = _svfk_15;
  v5[16] = _svfk_16;
  v5[17] = _svfk_17;
  v5[18] = _svfk_18;
  v5[19] = _svfk_19;
  v5[20] = _svfk_20;
  v5[21] = _svfk_21;
  v5[22] = _svfk_22;
  v5[23] = _svfk_23;
  v5[24] = _svfk_24;
  v5[25] = _svfk_25;
  v5[26] = _svfk_26;
  v5[27] = _svfk_27;
  v5[28] = _svfk_28;
  v5[29] = _svfk_29;
  v5[30] = _svfk_30;
  v5[31] = _svfk_31;
  v5[32] = _svfk_32;
  v5[33] = _svfk_33;
  v5[34] = _svfk_34;
  v5[35] = _svfk_35;
  v5[36] = _svfk_36;
  v5[37] = _svfk_37;
  v5[38] = _svfk_38;
  v5[39] = _svfk_39;
  v5[40] = _svfk_40;
  v5[41] = _svfk_41;
  v5[42] = _svfk_42;
  v5[43] = _svfk_43;
  v5[44] = _svfk_44;
  v5[45] = _svfk_45;
  v5[46] = _svfk_46;
  v5[47] = _svfk_47;
  v5[48] = _svfk_48;
  v5[49] = _svfk_49;
  byte_1ECD8D9D9 = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD8D9E0);
}

- (NSDictionary)changedValuesForCurrentEvent
{
  $1A22B458595D9B8B5E31AEBB12624A52 *cd_extras;
  uint64_t v4;
  unint64_t *v5;
  unint64_t *v6;
  unint64_t v7;
  NSKnownKeysDictionary *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  $1A22B458595D9B8B5E31AEBB12624A52 *v13;
  id var3;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  NSDictionary *v37;
  NSKnownKeysDictionary *v38;
  unint64_t v39;
  char v40;
  uint64_t v41;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  if ((self->_cd_stateFlags & 0x8000) != 0)
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  cd_extras = self->_cd_extras;
  if (!cd_extras || !cd_extras->var3 && !cd_extras->var2)
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  v4 = NSDictionary_EmptyDictionary;
  v5 = (unint64_t *)_PFEntityForManagedObject(self);
  v6 = v5;
  if (v5)
    v7 = v5[13];
  else
    v7 = 0;
  v9 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", v7);
  v10 = _kvcPropertysPrimitiveGetters(v6);
  v37 = (NSDictionary *)v4;
  if (v6)
    v11 = v6[14];
  else
    v11 = 0;
  v12 = NSKeyValueCoding_NullValue;
  v13 = self->_cd_extras;
  if (v13)
  {
    var3 = v13->var3;
    if (!var3)
      var3 = v13->var2;
  }
  else
  {
    var3 = 0;
  }
  v15 = objc_msgSend(var3, "values");
  v38 = v9;
  v41 = -[NSKnownKeysDictionary values](v9, "values");
  v20 = 0;
  v39 = v11;
  do
  {
    v21 = (unint64_t *)(v11 + 16 * dword_18A509CD4[v20]);
    v23 = *v21;
    v22 = v21[1];
    if (*v21 < v22 + *v21)
    {
      do
      {
        if (*(_QWORD *)(v15 + 8 * v23) == v12)
          v24 = 0;
        else
          v24 = *(void **)(v15 + 8 * v23);
        _PF_Handler_Primitive_GetProperty((id **)self, v23, 0, *(_QWORD *)(v10 + 8 * v23), v16, v17, v18, v19);
        if (v24 != v25
          && (objc_msgSend(*(id *)(v6[12] + 24 + 8 * v23), "_epsilonEquals:rhs:withFlags:", v25, v24, 1) & 1) == 0)
        {
          v26 = (id)v12;
          if (v24)
            v26 = v24;
          *(_QWORD *)(v41 + 8 * v23) = v26;
        }
        ++v23;
        --v22;
      }
      while (v22);
    }
    ++v20;
    v11 = v39;
  }
  while (v20 != 3);
  v27 = 0;
  v28 = 3;
  do
  {
    v40 = v27;
    v29 = (unint64_t *)(v39 + 16 * dword_18A509CD4[v28]);
    v31 = *v29;
    v30 = v29[1];
    if (*v29 < v30 + *v29)
    {
      do
      {
        if (*(_QWORD *)(v15 + 8 * v31) == v12)
          v32 = 0;
        else
          v32 = *(void **)(v15 + 8 * v31);
        _PF_Handler_Primitive_GetProperty((id **)self, v31, 0, *(_QWORD *)(v10 + 8 * v31), v16, v17, v18, v19);
        v34 = v33;
        v35 = objc_msgSend(v32, "isFault");
        if ((v35 & objc_msgSend(v34, "isFault") & 1) == 0
          && v32 != v34
          && (objc_msgSend(v34, "isEqual:", v32) & 1) == 0)
        {
          v36 = v12;
          if (v32)
            v36 = objc_msgSend(v32, "copy");
          *(_QWORD *)(v41 + 8 * v31) = v36;
        }
        ++v31;
        --v30;
      }
      while (v30);
    }
    v27 = 1;
    v28 = 4;
  }
  while ((v40 & 1) == 0);
  if (-[NSKnownKeysDictionary count](v38, "count"))
    return (NSDictionary *)v38;

  return v37;
}

- (NSDictionary)changedValues
{
  NSManagedObject *v2;
  $1A22B458595D9B8B5E31AEBB12624A52 *cd_extras;
  uint64_t v4;
  unint64_t *v5;
  unint64_t *v6;
  unint64_t v7;
  NSKnownKeysDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  $1A22B458595D9B8B5E31AEBB12624A52 *v12;
  id var1;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  NSKnownKeysDictionary *v35;
  NSKnownKeysDictionary *v36;
  uint64_t v37;
  NSKnownKeysDictionary *v38;
  NSKnownKeysDictionary *v39;
  void *context;
  unint64_t v41;
  char v42;
  uint64_t v43;

  v2 = self;
  if (_PF_Threading_Debugging_level)
    self = (NSManagedObject *)_PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  if ((v2->_cd_stateFlags & 0x8000) != 0)
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  cd_extras = v2->_cd_extras;
  if (!cd_extras || !cd_extras->var1)
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  v4 = NSDictionary_EmptyDictionary;
  context = (void *)MEMORY[0x18D76B4E4](self, a2);
  v5 = (unint64_t *)_PFEntityForManagedObject(v2);
  v6 = v5;
  if (v5)
    v7 = v5[13];
  else
    v7 = 0;
  v9 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", v7);
  v10 = _kvcPropertysPrimitiveGetters(v6);
  v37 = v4;
  if (v6)
    v41 = v6[14];
  else
    v41 = 0;
  v11 = NSKeyValueCoding_NullValue;
  v12 = v2->_cd_extras;
  if (v12)
    var1 = v12->var1;
  else
    var1 = 0;
  v14 = objc_msgSend(var1, "values", v37);
  v39 = v9;
  v43 = -[NSKnownKeysDictionary values](v9, "values");
  v19 = 0;
  v20 = 1;
  do
  {
    v42 = v20;
    v21 = (unint64_t *)(v41 + 16 * dword_18A509CE8[v19]);
    v23 = *v21;
    v22 = v21[1];
    if (*v21 < v22 + *v21)
    {
      do
      {
        if (*(_QWORD *)(v14 + 8 * v23) == v11)
          v24 = 0;
        else
          v24 = *(void **)(v14 + 8 * v23);
        _PF_Handler_Primitive_GetProperty((id **)v2, v23, 0, *(_QWORD *)(v10 + 8 * v23), v15, v16, v17, v18);
        if (v24 != v25)
        {
          v26 = v25;
          if ((objc_msgSend(*(id *)(v6[12] + 24 + 8 * v23), "_epsilonEquals:rhs:withFlags:", v25, v24, 1) & 1) == 0)
          {
            v27 = (id)v11;
            if (v26)
              v27 = v26;
            *(_QWORD *)(v43 + 8 * v23) = v27;
          }
        }
        ++v23;
        --v22;
      }
      while (v22);
    }
    v20 = 0;
    v19 = 1;
  }
  while ((v42 & 1) != 0);
  v29 = *(_QWORD *)(v41 + 144);
  v28 = *(_QWORD *)(v41 + 152);
  if (v29 < v28 + v29)
  {
    do
    {
      if (*(_QWORD *)(v14 + 8 * v29) == v11)
        v30 = 0;
      else
        v30 = *(void **)(v14 + 8 * v29);
      _PF_Handler_Primitive_GetProperty((id **)v2, v29, 0, *(_QWORD *)(v10 + 8 * v29), v15, v16, v17, v18);
      v32 = v31;
      v33 = objc_msgSend(v30, "isFault");
      if ((v33 & objc_msgSend(v32, "isFault") & 1) == 0
        && v30 != v32
        && (objc_msgSend(v32, "isEqual:", v30) & 1) == 0)
      {
        v34 = v11;
        if (v32)
          v34 = objc_msgSend(v32, "copy");
        *(_QWORD *)(v43 + 8 * v29) = v34;
      }
      ++v29;
      --v28;
    }
    while (v28);
  }
  if (-[NSKnownKeysDictionary count](v39, "count"))
  {
    v35 = v39;
  }
  else
  {

    v35 = v38;
  }
  v36 = v35;
  objc_autoreleasePoolPop(context);
  return (NSDictionary *)v35;
}

- (NSKnownKeysDictionary)_newNestedSaveChangedValuesForParent:(_BYTE *)a1
{
  _BYTE *v3;
  unint64_t *v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSKnownKeysDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  uint64_t v25;
  char v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  NSKnownKeysDictionary *v42;
  NSKnownKeysDictionary *v43;
  id v44;
  id v45;
  id *v46;
  NSKnownKeysDictionary *v47;
  NSKnownKeysDictionary *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  uint64_t v56;
  _OWORD v57[2];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = a1;
  v4 = (unint64_t *)_PFEntityForManagedObject(a1);
  v5 = v4;
  v6 = v4 ? v4[13] : 0;
  if ((v3[17] & 0x80) != 0)
    return 0;
  v7 = *((_QWORD *)v3 + 6);
  if (!v7 || !*(_QWORD *)(v7 + 8))
    return 0;
  v8 = objc_msgSend(a2, "managedObjectContext");
  v9 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", v6);
  v10 = _kvcPropertysPrimitiveGetters(v5);
  if (v5)
    v50 = v5[14];
  else
    v50 = 0;
  v11 = NSKeyValueCoding_NullValue;
  v12 = *((_QWORD *)v3 + 6);
  if (v12)
    v13 = *(void **)(v12 + 8);
  else
    v13 = 0;
  v56 = objc_msgSend(v13, "values");
  v49 = v9;
  v55 = -[NSKnownKeysDictionary values](v9, "values");
  v19 = *(_QWORD *)(v50 + 16);
  v18 = *(_QWORD *)(v50 + 24);
  if (v19 < v18 + v19)
  {
    do
    {
      if (*(_QWORD *)(v56 + 8 * v19) == v11)
        v20 = 0;
      else
        v20 = *(void **)(v56 + 8 * v19);
      _PF_Handler_Primitive_GetProperty((id **)v3, v19, 0, *(_QWORD *)(v10 + 8 * v19), v14, v15, v16, v17);
      if (v20 != v21)
      {
        v22 = v21;
        if ((objc_msgSend(*(id *)(v5[12] + 24 + 8 * v19), "_epsilonEquals:rhs:withFlags:", v21, v20, 1) & 1) == 0)
        {
          v23 = (id)v11;
          if (v22)
            v23 = v22;
          *(_QWORD *)(v55 + 8 * v19) = v23;
        }
      }
      ++v19;
      --v18;
    }
    while (v18);
  }
  v24 = 0;
  v25 = 1;
  do
  {
    v26 = v24;
    v27 = (unint64_t *)(v50 + 16 * dword_18A509CF4[v25]);
    v29 = *v27;
    v28 = v27[1];
    if (*v27 < v28 + *v27)
    {
      do
      {
        if (*(_QWORD *)(v56 + 8 * v29) == v11)
          v30 = 0;
        else
          v30 = *(void **)(v56 + 8 * v29);
        _PF_Handler_Primitive_GetProperty((id **)v3, v29, 0, *(_QWORD *)(v10 + 8 * v29), v14, v15, v16, v17);
        if (v30 != v31)
        {
          v32 = v31;
          if ((objc_msgSend(v31, "isEqual:", v30) & 1) == 0)
          {
            v33 = v11;
            if (v32)
              v33 = (uint64_t)_PFRetainedObjectForMappedChildObjectIDInParentContext((void *)objc_msgSend(v32, "objectID"), v8);
            *(_QWORD *)(v55 + 8 * v29) = v33;
          }
        }
        ++v29;
        --v28;
      }
      while (v28);
    }
    v24 = 1;
    v25 = 2;
  }
  while ((v26 & 1) == 0);
  v51 = v10;
  v52 = v8;
  v34 = 3;
  v54 = v3;
  do
  {
    v35 = (unint64_t *)(v50 + 16 * dword_18A509CF4[v34]);
    v37 = *v35;
    v36 = v35[1];
    if (*v35 < v36 + *v35)
    {
      v53 = v34;
      do
      {
        if (*(_QWORD *)(v56 + 8 * v37) == v11)
          v38 = 0;
        else
          v38 = *(void **)(v56 + 8 * v37);
        _PF_Handler_Primitive_GetProperty((id **)v3, v37, 0, *(_QWORD *)(v10 + 8 * v37), v14, v15, v16, v17);
        v40 = v39;
        v41 = objc_msgSend(v38, "isFault");
        if ((v41 & objc_msgSend(v40, "isFault") & 1) == 0
          && v38 != v40
          && (objc_msgSend(v40, "isEqual:", v38) & 1) == 0)
        {
          v42 = (NSKnownKeysDictionary *)v11;
          if (v40)
          {
            v43 = [NSKnownKeysDictionary alloc];
            if (!_PFFastMappingForChanges__pffastmappingforchanges)
            {
              v57[0] = xmmword_1E1EDDE60;
              v57[1] = *(_OWORD *)off_1E1EDDE70;
              _PFFastMappingForChanges__pffastmappingforchanges = -[NSKnownKeysMappingStrategy initForKeys:count:]([NSKnownKeysMappingStrategy alloc], "initForKeys:count:", v57, 4);
            }
            v42 = -[NSKnownKeysDictionary initWithSearchStrategy:](v43, "initWithSearchStrategy:");
            if (objc_msgSend(v40, "count"))
              v44 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v40, v38);
            else
              v44 = 0;
            if (objc_msgSend(v38, "count"))
              v45 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v38, v40);
            else
              v45 = 0;
            v46 = -[NSKnownKeysDictionary values](v42, "values");
            *v46 = +[_PFRoutines newMutableArrayFromCollection:forParentContext:]((uint64_t)_PFRoutines, v44, v52);

            v46[1] = +[_PFRoutines newMutableArrayFromCollection:forParentContext:]((uint64_t)_PFRoutines, v45, v52);
            v34 = v53;
            if (v53 > 4)
            {
              v46[2] = +[_PFRoutines newMutableOrderedSetFromCollection:forParentContext:]((uint64_t)_PFRoutines, v40, v52);
              v46[3] = +[_PFRoutines newMutableOrderedSetFromCollection:forParentContext:]((uint64_t)_PFRoutines, v38, v52);
            }
            else
            {
              v46[2] = +[_PFRoutines newMutableSetFromCollection:forParentContext:]((uint64_t)_PFRoutines, v40, v52);
            }
            v10 = v51;
          }
          *(_QWORD *)(v55 + 8 * v37) = v42;
          v3 = v54;
        }
        ++v37;
        --v36;
      }
      while (v36);
    }
    ++v34;
  }
  while (v34 != 7);
  v47 = v49;
  if (!-[NSKnownKeysDictionary count](v49, "count"))
  {

    return 0;
  }
  return v47;
}

- (void)_updateFromRefreshSnapshot:(int)a3 includingTransients:
{
  unint64_t *v5;
  unint64_t *v6;
  unint64_t v7;
  int v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  id **v18;
  uint64_t i;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t j;
  unint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  _OWORD *v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t *v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  uint64_t v67;
  unint64_t *v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  _OWORD *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  _DWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  _DWORD *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  BOOL v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t *v105;
  id v106;
  unint64_t *v107;
  id v108;
  _DWORD *v109;
  _OWORD *v110;
  _OWORD *v111;
  _OWORD *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  __int128 v125;
  _OWORD v126[4];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v109 = a1;
  if (a1)
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl(*((_QWORD *)v109 + 4), sel__updateFromRefreshSnapshot_includingTransients_);
    v5 = (unint64_t *)_PFEntityForManagedObject(v109);
    v6 = v5;
    if (v5)
      v7 = v5[13];
    else
      v7 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(a2, "mapping") != v7)
    {
      -[NSManagedObject _genericUpdateFromSnapshot:](v109, a2);
      return;
    }
    v8 = v109[4];
    if ((v8 & 0x8000) != 0)
    {
      -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, v109, *((_QWORD *)v109 + 4));
      v8 = v109[4];
    }
    v109[4] = v8 | 0x800;
    if (v6)
      v9 = (_OWORD *)v6[14];
    else
      v9 = 0;
    v117 = *(_QWORD *)(v7 + 40);
    v116 = _kvcPropertysPrimitiveGetters(v6);
    v115 = _kvcPropertysPrimitiveSetters((uint64_t)v6);
    v118 = objc_msgSend(a2, "values");
    v119 = v6;
    v14 = v9 + 6;
    LODWORD(v113) = a3;
    v111 = v126;
    v112 = v9;
    if ((a3 & 1) != 0)
    {
      v15 = v9[1];
      v126[0] = *v14;
      v16 = v9[10];
      v125 = v15;
      v126[1] = v16;
      v17 = 3;
    }
    else
    {
      v125 = v9[3];
      v126[0] = *v14;
      v17 = 2;
    }
    v114 = v17;
    v18 = (id **)v109;
    for (i = 0; i != v114; ++i)
    {
      v20 = (unint64_t *)&v126[i - 1];
      v22 = *v20;
      v21 = v20[1];
      if (*v20 < v21 + *v20)
      {
        do
        {
          v27 = (void *)MEMORY[0x18D76B4E4]();
          v28 = *(id *)(v118 + 8 * v22);
          if (v28)
          {
            v29 = *(_QWORD *)(v117 + 8 * v22);
            _PF_Handler_Primitive_GetProperty((id **)v109, v22, v29, *(_QWORD *)(v116 + 8 * v22), v23, v24, v25, v26);
            if (v28 == (id)NSKeyValueCoding_NullValue)
              v28 = 0;
            if (v28 != v30)
            {
              v31 = v30;
              v32 = *(void **)(v119[12] + 24 + 8 * v22);
              if ((objc_msgSend(v32, "_epsilonEquals:rhs:withFlags:", v30, v28, 1) & 1) == 0)
              {
                if (objc_msgSend(v32, "_propertyType") == 2 && objc_msgSend(v32, "usesMergeableStorage"))
                {
                  objc_msgSend(v31, "merge:", v28);
                  v28 = (id)objc_msgSend(v31, "copy");
                }
                objc_msgSend(v109, "willChangeValueForKey:", v29);
                _PF_Handler_Primitive_SetProperty((char **)v109, v22, v28, v29, *(_QWORD *)(v115 + 8 * v22));
                objc_msgSend(v109, "didChangeValueForKey:", v29);
              }
            }
          }
          objc_autoreleasePoolPop(v27);
          ++v22;
          --v21;
        }
        while (v21);
      }
    }
    v125 = v112[7];
    if ((_DWORD)v113)
    {
      *v111 = v112[11];
      v33 = 2;
    }
    else
    {
      v33 = 1;
    }
    for (j = 0; j != v33; ++j)
    {
      v35 = (unint64_t *)&v126[j - 1];
      v36 = *v35;
      v37 = v35[1];
      if (*v35 < v37 + *v35)
      {
        do
        {
          v38 = *(_QWORD *)(v118 + 8 * v36);
          if (v38)
          {
            v39 = *(_QWORD *)(v117 + 8 * v36);
            _PF_Handler_Primitive_GetProperty(v18, v36, v39, *(_QWORD *)(v116 + 8 * v36), v10, v11, v12, v13);
            v41 = v38 == NSKeyValueCoding_NullValue ? 0 : (void *)v38;
            if (v41 != v40)
            {
              v42 = v40;
              if ((!objc_msgSend(v41, "isFault") || (objc_msgSend(v42, "isFault") & 1) == 0)
                && (objc_msgSend(v42, "isEqual:", v41) & 1) == 0)
              {
                v43 = objc_msgSend(v41, "values");
                if (v43)
                {
                  v44 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v42, *(void **)(v43 + 8));
                  objc_msgSend(v44, "addObjectsFromArray:", *(_QWORD *)v43);
                }
                else
                {
                  v44 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v42, 0);
                }
                -[NSManagedObject _updateToManyRelationship:from:to:with:](v18, v39, v42, v44, v42);

              }
            }
          }
          ++v36;
          --v37;
        }
        while (v37);
      }
    }
    v125 = v112[8];
    if ((_DWORD)v113)
    {
      *v111 = v112[12];
      v45 = 2;
    }
    else
    {
      v45 = 1;
    }
    v110 = (_OWORD *)v45;
    v46 = 0;
    while (1)
    {
      v112 = v46;
      v47 = (unint64_t *)&v126[(_QWORD)v46 - 1];
      v49 = *v47;
      v48 = v47[1];
      v50 = v48 + v49;
      if (v49 < v48 + v49)
        break;
LABEL_122:
      v46 = (_OWORD *)((char *)v112 + 1);
      if ((_OWORD *)((char *)v112 + 1) == v110)
      {
        *((_DWORD *)v18 + 4) &= ~0x800u;
        return;
      }
    }
    v114 = v48 + v49;
    while (1)
    {
      v51 = *(void **)(v118 + 8 * v49);
      if (!v51)
        goto LABEL_75;
      v52 = *(_QWORD *)(v117 + 8 * v49);
      _PF_Handler_Primitive_GetProperty(v18, v49, v52, *(_QWORD *)(v116 + 8 * v49), v10, v11, v12, v13);
      v54 = NSKeyValueCoding_NullValue;
      v55 = v51 == (void *)NSKeyValueCoding_NullValue ? 0 : v51;
      if (v55 == v53)
        goto LABEL_75;
      v56 = v53;
      if (objc_msgSend(v55, "isFault"))
      {
        if ((objc_msgSend(v56, "isFault") & 1) != 0)
          goto LABEL_75;
      }
      if ((objc_msgSend(v56, "isEqual:", v55, v104, v105) & 1) != 0)
        goto LABEL_75;
      v119 = (unint64_t *)v56;
      v115 = v52;
      if (v51 == (void *)v54)
      {
        v59 = 0;
        v58 = 0;
        v61 = 0;
        v60 = 0;
      }
      else
      {
        v57 = objc_msgSend(v51, "values");
        v59 = *(void **)v57;
        v58 = *(void **)(v57 + 8);
        v61 = *(void **)(v57 + 16);
        v60 = *(void **)(v57 + 24);
      }
      v62 = v119;
      if ((objc_msgSend(v119, "isEqual:", v60) & 1) == 0)
        break;
      -[NSManagedObject _updateToManyRelationship:from:to:with:](v18, v115, v62, v61, v62);
LABEL_75:
      if (++v49 == v50)
        goto LABEL_122;
    }
    v63 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v62, v58);
    v64 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v60, v58);
    if (objc_msgSend(v64, "count"))
    {
      v113 = v63;
      v65 = v61;
      if (!+[_PFRoutines _objectsInOrderedCollection:formSubstringInOrderedCollection:]((uint64_t)_PFRoutines, v64, v61))
      {
        v69 = +[_PFRoutines _objectsInOrderedCollection:formSubstringInOrderedCollection:]((uint64_t)_PFRoutines, v60, v119);
        v50 = v114;
        if (v69)
        {
          v66 = v113;
          v70 = objc_msgSend(v113, "count");
          v67 = v115;
          if (v70)
            v65 = +[_PFRoutines _replaceBaseline:inOrderedSet:withOrderedSet:]((uint64_t)_PFRoutines, v64, v66, v61);
          v68 = v119;
        }
        else
        {
          v108 = v64;
          v71 = objc_msgSend(v61, "count");
          v107 = &v104;
          v72 = (_OWORD *)MEMORY[0x1E0C80A78](v71);
          v75 = (char *)&v104 - v74;
          v111 = v72;
          if ((unint64_t)v72 > 0x200)
            v75 = (char *)NSAllocateScannedUncollectable();
          else
            bzero((char *)&v104 - v74, 8 * v73);
          v122 = 0u;
          v123 = 0u;
          v120 = 0u;
          v121 = 0u;
          v76 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
          if (v76)
          {
            v77 = v76;
            v78 = 0;
            v79 = *(_QWORD *)v121;
            do
            {
              for (k = 0; k != v77; ++k)
              {
                if (*(_QWORD *)v121 != v79)
                  objc_enumerationMutation(v61);
                v81 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * k);
                if ((objc_msgSend(v59, "containsObject:", v81) & 1) != 0
                  || objc_msgSend(v119, "containsObject:", v81))
                {
                  *(_QWORD *)&v75[8 * v78++] = v81;
                }
              }
              v77 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
            }
            while (v77);
          }
          else
          {
            v78 = 0;
          }
          v65 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithObjects:count:", v75, v78);
          if ((unint64_t)v111 >= 0x201)
            NSZoneFree(0, v75);
          v66 = v113;
          v82 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v113, v65);
          v83 = objc_msgSend(v82, "count");
          v18 = (id **)v109;
          v50 = v114;
          v67 = v115;
          v68 = v119;
          if (v83)
          {
            v84 = objc_msgSend(v66, "count");
            v105 = &v104;
            v104 = MEMORY[0x1E0C80A78](v84);
            v106 = v82;
            if (v104 > 0x200)
            {
              v88 = NSAllocateScannedUncollectable();
            }
            else
            {
              v87 = (char *)&v104 - v86;
              bzero((char *)&v104 - v86, 8 * v85);
              v88 = (uint64_t)v87;
            }
            v89 = (_DWORD *)v88;
            v111 = v65;
            +[_PFRoutines getIndexes:fromCollection:forObjectsInCollection:]((uint64_t)_PFRoutines, v88, v65, v66);
            v90 = objc_msgSend(v66, "count");
            if (v90)
            {
              v91 = v90;
              v92 = 0;
              v93 = 0;
              v94 = 0;
              v95 = 0;
              v96 = v89;
              do
              {
                if (v96[v92] == -1)
                {
                  v100 = (v95 & 1) == 0;
                  if ((v95 & 1) == 0)
                    v94 = v92;
                  v95 = 1;
                  if (v100)
                    v93 = 1;
                  else
                    ++v93;
                }
                else
                {
                  if (v94 | v93)
                  {
                    v97 = objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v94, v93);
                    v98 = objc_msgSend(v113, "objectsAtIndexes:", v97);
                    v50 = v114;
                    v99 = objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v89[v92], v93);
                    objc_msgSend(v111, "insertObjects:atIndexes:", v98, v99);
                    v96 = v89;
                    v95 = 0;
                  }
                  v94 = 0;
                  v93 = 0;
                }
                ++v92;
              }
              while (v91 != v92);
            }
            else
            {
              v94 = 0;
              v93 = 0;
              v96 = v89;
            }
            if (v104 >= 0x201)
              NSZoneFree(0, v96);
            v67 = v115;
            v65 = v111;
            if (v94 | v93)
            {
              v101 = objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v94, v93);
              v102 = objc_msgSend(v113, "objectsAtIndexes:", v101);
              v103 = objc_msgSend(v111, "count");
              v65 = v111;
              objc_msgSend(v111, "insertObjects:atIndexes:", v102, objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v103, v93));
            }
            v82 = v106;
            v68 = v119;
            v66 = v113;
          }

          v64 = v108;
        }
        goto LABEL_74;
      }
      v66 = v113;
      v65 = +[_PFRoutines _replaceBaseline:inOrderedSet:withOrderedSet:]((uint64_t)_PFRoutines, v64, v61, v113);
      v67 = v115;
    }
    else
    {
      v65 = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v63, v61);
      v67 = v115;
      v66 = v63;
    }
    v68 = v119;
    v50 = v114;
LABEL_74:
    -[NSManagedObject _updateToManyRelationship:from:to:with:](v18, v67, v68, v65, v68);

    goto LABEL_75;
  }
}

- (void)willChangeValueForKey:(NSString *)key
{
  id *v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v8;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v5 = (id *)_PFEntityForManagedObject(self);
  if (v5)
  {
    v7 = objc_msgSend(v5[13], "indexForKey:", key);
LABEL_7:
    _PF_ManagedObject_WillChangeValueForKeyIndex((uint64_t)self, v6, (uint64_t)key, v7, 1);
    return;
  }
  if (BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88))
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)NSManagedObject;
  -[NSManagedObject willChangeValueForKey:](&v8, sel_willChangeValueForKey_, key);
}

- (void)didChangeValueForKey:(NSString *)key
{
  unsigned int cd_stateFlags;
  objc_super v7;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  if (!_PFEntityForManagedObject(self) && !BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88))
  {
    v7.receiver = self;
    v7.super_class = (Class)NSManagedObject;
    -[NSManagedObject willChangeValueForKey:](&v7, sel_willChangeValueForKey_, key);
    return;
  }
  cd_stateFlags = self->_cd_stateFlags;
  if ((cd_stateFlags & 0x2000) != 0)
  {
    if ((cd_stateFlags & 0x1000) != 0)
      goto LABEL_7;
  }
  else
  {
    _NSObjectDidChangeVFKImp(self, a2, key);
    if ((cd_stateFlags & 0x1000) != 0)
    {
LABEL_7:
      if ((cd_stateFlags & 0x40) == 0)
        goto LABEL_12;
      return;
    }
  }
  self->_cd_stateFlags &= ~0x800u;
  if ((cd_stateFlags & 0x40) == 0)
LABEL_12:
    -[NSManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", key);
}

- (void)prepareForDeletion
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
}

- (void)awakeFromInsert
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
}

- (void)awakeFromSnapshotEvents:(NSSnapshotEventType)flags
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
}

- (BOOL)isDeleted
{
  char v3;
  BOOL result;
  unsigned int cd_stateFlags;
  _BOOL4 v6;
  _BOOL4 v7;

  v3 = _PF_Threading_Debugging_level;
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
    v3 = self == 0;
  }
  else
  {
    result = 0;
    if (!self)
      return result;
  }
  cd_stateFlags = self->_cd_stateFlags;
  v6 = (cd_stateFlags >> 5) & 1;
  v7 = (cd_stateFlags >> 2) & 1;
  if ((self->_cd_stateFlags & 0x20) != 0)
    LOBYTE(v7) = v6;
  if ((v3 & 1) != 0)
    return v6;
  else
    return v7;
}

- (BOOL)hasChanges
{
  return (self->_cd_stateFlags & 0x3F) != 0;
}

- (NSKnownKeysDictionary)_changedTransientProperties__
{
  _QWORD *v2;
  uint64_t v3;
  NSKnownKeysDictionary *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  const void **v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void **v17;
  void *v18;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  id *v23;
  id v24;
  BOOL v25;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__changedTransientProperties__);
  if ((*((_BYTE *)a1 + 17) & 0x80) != 0)
    return (NSKnownKeysDictionary *)NSDictionary_EmptyDictionary;
  v2 = _PFEntityForManagedObject(a1);
  if (v2)
    v3 = v2[13];
  else
    v3 = 0;
  v4 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", v3);
  v5 = _PFEntityForManagedObject(a1);
  if (v5)
    v6 = v5[14];
  else
    v6 = 0;
  v7 = NSKeyValueCoding_NullValue;
  v27[0] = 0xD00000001;
  v8 = -[NSKnownKeysDictionary values](-[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](a1, dword_18A509D90, (unsigned int *)v27, 0), "values");
  v9 = -[NSKnownKeysDictionary values](v4, "values");
  v10 = 0;
  v11 = 1;
  do
  {
    v12 = v11;
    v13 = (uint64_t *)(v6 + 16 * dword_18A509D5C[v10]);
    v14 = *v13;
    v15 = v13[1];
    if (*v13 < (unint64_t)(v15 + *v13))
    {
      v16 = (_QWORD *)(v9 + 8 * v14);
      v17 = (void **)&v8[v14];
      do
      {
        v18 = *v17;
        if (*v17)
          v19 = v18 == (void *)v7;
        else
          v19 = 1;
        if (!v19)
          *v16 = v18;
        ++v16;
        ++v17;
        --v15;
      }
      while (v15);
    }
    v11 = 0;
    v10 = 1;
  }
  while ((v12 & 1) != 0);
  v20 = *(_QWORD *)(v6 + 208);
  v21 = *(_QWORD *)(v6 + 216);
  if (v20 < v21 + v20)
  {
    v22 = (_QWORD *)(v9 + 8 * v20);
    v23 = (id *)&v8[v20];
    do
    {
      v24 = *v23;
      if ((objc_msgSend(*v23, "isFault") & 1) == 0)
      {
        if (v24)
          v25 = v24 == (id)v7;
        else
          v25 = 1;
        if (!v25)
          *v22 = v24;
      }
      ++v22;
      ++v23;
      --v21;
    }
    while (v21);
  }
  return v4;
}

- (NSManagedObject)initWithContext:(NSManagedObjectContext *)moc
{
  uint64_t v5;
  void *v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  NSPersistentStoreCoordinator *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_opt_class(), "entity");
  v6 = (void *)v5;
  if (moc && !v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    v9 = objc_msgSend(v7, "stringWithUTF8String:", class_getName(v8));
    v10 = -[NSManagedObjectContext persistentStoreCoordinator](moc, "persistentStoreCoordinator");
    if (v10)
      v10 = (NSPersistentStoreCoordinator *)v10->_modelMap;
    v6 = -[_PFModelMap entityForClassName:inContext:]((uint64_t)v10, v9, moc);
    if (v6)
    {
      v11 = (void *)objc_opt_class();
      v13[0] = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)v6);
      objc_setAssociatedObject(v11, PFEntityDescriptionAssociationKey, (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1), (void *)0x303);
    }
  }
  return -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:](self, "initWithEntity:insertIntoManagedObjectContext:", v6, moc);
}

+ (id)_PFPlaceHolderSingleton
{
  _DWORD *v2;
  objc_class *v3;
  malloc_zone_t *v4;
  size_t InstanceSize;
  uint64_t v6;
  void (*v7)(void);
  objc_class *Class;
  _QWORD block[5];

  v2 = (_DWORD *)objc_msgSend(a1, "_PFPlaceHolderSingleton_core");
  v3 = (objc_class *)objc_opt_class();
  if (v3 != object_getClass(v2))
  {
    v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v4 = malloc_default_zone();
    InstanceSize = class_getInstanceSize(v3);
    v2 = malloc_type_zone_calloc(v4, 1uLL, (InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8, 0x9F3A45E0uLL);
    object_setClass(v2, v3);
    v2[4] |= 0x100000u;
    v6 = MEMORY[0x1E0C809B0];
    v2[2] = 10000;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __generateReturnPointerMethod_block_invoke;
    block[3] = &__block_descriptor_40_e9__v16__0_8l;
    block[4] = v2;
    v7 = imp_implementationWithBlock(block);
    Class = object_getClass(v3);
    class_addMethod(Class, sel__PFPlaceHolderSingleton_core, v7, "@@:");
  }
  return v2;
}

+ (id)_PFPlaceHolderSingleton_core
{
  return (id)qword_1ECD8D9B0;
}

- (NSUInteger)faultingState
{
  return ((unint64_t)self->_cd_stateFlags >> 15) & 7;
}

- (NSString)description
{
  NSManagedObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t cd_extraFlags;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  __CFString *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  id v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSString *v42;
  void *v43;
  void *v44;
  char *v45;
  void *v46;
  __CFString *v47;
  NSManagedObject *v48;
  uint64_t v49;
  objc_super v50;
  objc_super v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v2 = self;
  v57 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x18D76B4E4](self, a2);
  v4 = -[NSManagedObjectID entity](-[NSManagedObject objectID](v2, "objectID"), "entity");
  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
  {
    v51.receiver = v2;
    v51.super_class = (Class)NSManagedObject;
    v6 = -[NSManagedObject description](&v51, sel_description);
    v7 = -[NSEntityDescription name](-[NSManagedObject entity](v2, "entity"), "name");
    v8 = -[NSManagedObject objectID](v2, "objectID");
    if (-[NSManagedObject isFault](v2, "isFault"))
    {
      v9 = CFSTR("<fault>");
      goto LABEL_80;
    }
    if (v2)
    {
      if (_PF_Threading_Debugging_level)
        _PFAssertSafeMultiThreadedAccess_impl((uint64_t)v2->_cd_managedObjectContext, sel__descriptionValues);
      v11 = (void *)objc_msgSend(_PFEntityForManagedObject(v2), "properties");
      v12 = objc_msgSend(v11, "count");
      v13 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v12);
      v9 = (const __CFString *)v13;
      cd_extraFlags = v2->_cd_extraFlags;
      if ((_DWORD)cd_extraFlags)
        v15 = (char *)v2 + cd_extraFlags;
      else
        v15 = 0;
      v49 = v12;
      if (v12)
      {
        v40 = v8;
        v41 = v7;
        v42 = v6;
        v43 = v5;
        v16 = 0;
        v44 = v3;
        v45 = &v15[-(((unint64_t)v2->_cd_stateFlags >> 22) & 0x3FC)];
        v17 = v12;
        v47 = (__CFString *)v13;
        v48 = v2;
        v46 = v11;
        while (1)
        {
          v18 = (void *)MEMORY[0x18D76B4E4]();
          v19 = (void *)objc_msgSend(v11, "objectAtIndex:", v16);
          v20 = objc_msgSend(v19, "name");
          v21 = -[NSManagedObject valueForKey:](v2, "valueForKey:", v20);
          if (v21)
          {
            v22 = (__CFString *)v21;
            switch(objc_msgSend(v19, "_propertyType"))
            {
              case 2:
              case 6:
              case 7:
                v23 = objc_msgSend(v19, "attributeType");
                if (v23 <= 799)
                {
                  if (v23 <= 399)
                  {
                    if (v23 != 100 && v23 != 200 && v23 != 300)
                      goto LABEL_67;
                  }
                  else
                  {
                    if (v23 > 599)
                    {
                      if (v23 == 600)
                        goto LABEL_76;
                      if (v23 != 700)
                      {
LABEL_67:
                        v22 = CFSTR("(...not nil..)");
                        goto LABEL_76;
                      }
                      if (-[__CFString isNSString](v22, "isNSString"))
                      {
                        if ((unint64_t)-[__CFString length](v22, "length") < 0xC9)
                          goto LABEL_76;
                        v33 = -[__CFString substringToIndex:](v22, "substringToIndex:", 200);
                        goto LABEL_75;
                      }
LABEL_73:
                      v34 = v22;
LABEL_74:
                      v33 = -[__CFString description](v34, "description");
LABEL_75:
                      v22 = (__CFString *)v33;
                      goto LABEL_76;
                    }
                    if (v23 != 400 && v23 != 500)
                      goto LABEL_67;
                  }
                }
                else
                {
                  if (v23 > 1199)
                  {
                    if (v23 > 1999)
                    {
                      if (v23 != 2000 && v23 != 2100)
                        goto LABEL_67;
                    }
                    else if (v23 != 1200 && v23 != 1800)
                    {
                      goto LABEL_67;
                    }
                    goto LABEL_73;
                  }
                  if (v23 > 999)
                  {
                    if (v23 != 1000)
                    {
                      if (v23 != 1100)
                        goto LABEL_67;
                      goto LABEL_73;
                    }
                    if (objc_msgSend(v19, "isFileBackedFuture"))
                      goto LABEL_73;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0
                      || !-[__CFString isNSData](v22, "isNSData")
                      || (unint64_t)-[__CFString length](v22, "length") < 0x33)
                    {
                      goto LABEL_73;
                    }
                    v34 = (__CFString *)-[__CFString subdataWithRange:](v22, "subdataWithRange:", 0, 50);
                    goto LABEL_74;
                  }
                  if (v23 != 800 && v23 != 900)
                    goto LABEL_67;
                }
LABEL_76:
                v24 = (__CFString *)v9;
                v25 = v22;
                break;
              case 3:
                goto LABEL_29;
              case 4:
                if ((objc_msgSend(v19, "isToMany") & 1) != 0)
                {
LABEL_29:
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    if (-[__CFString isFault](v22, "isFault"))
                    {
                      v25 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<relationship fault: %p '%@'>"), v22, objc_msgSend((id)-[__CFString relationship](v22, "relationship"), "name"));
                      v24 = (__CFString *)v9;
                      break;
                    }
                  }
                  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[__CFString count](v22, "count"));
                  v52 = 0u;
                  v53 = 0u;
                  v54 = 0u;
                  v55 = 0u;
                  v27 = -[__CFString countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
                  if (!v27)
                    goto LABEL_54;
                  v28 = v27;
                  v29 = 0;
                  v30 = *(_QWORD *)v53;
                  while (1)
                  {
                    v31 = 0;
                    if (v29 <= 0xA)
                      v32 = 10 - v29;
                    else
                      v32 = 0;
                    do
                    {
                      if (*(_QWORD *)v53 != v30)
                        objc_enumerationMutation(v22);
                      if (v32 == v31)
                      {
                        objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(...and %ld more...)"), -[__CFString count](v22, "count") - 10));
LABEL_54:
                        v9 = v47;
                        -[__CFString setObject:forKey:](v47, "setObject:forKey:", v26, v20);

                        v2 = v48;
                        v17 = v49;
                        v11 = v46;
                        goto LABEL_78;
                      }
                      objc_msgSend(v26, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v31++), "objectID"));
                    }
                    while (v28 != v31);
                    v28 = -[__CFString countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
                    v29 += v31;
                    if (!v28)
                      goto LABEL_54;
                  }
                }
                if (((v45[v16 >> 3] >> (v16 & 7)) & 1) == 0)
                  goto LABEL_76;
                v33 = -[__CFString objectID](v22, "objectID");
                goto LABEL_75;
              default:
                v24 = (__CFString *)v9;
                v25 = CFSTR("(...not nil..)");
                break;
            }
          }
          else
          {
            v24 = (__CFString *)v9;
            v25 = CFSTR("nil");
          }
          -[__CFString setObject:forKey:](v24, "setObject:forKey:", v25, v20);
LABEL_78:
          objc_autoreleasePoolPop(v18);
          if (++v16 == v17)
          {
            v5 = v43;
            v3 = v44;
            v7 = v41;
            v6 = v42;
            v8 = v40;
            break;
          }
        }
      }
    }
    else
    {
      v9 = 0;
    }
LABEL_80:
    v10 = (void *)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (entity: %@; id: %@; data: %@)"), v6, v7, v8, v9);
  }
  else
  {
    v50.receiver = v2;
    v50.super_class = (Class)NSManagedObject;
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (entity: <null>; id: %@; data: <fault>)"),
                    -[NSManagedObject description](&v50, sel_description),
                    -[NSManagedObject objectID](v2, "objectID"),
                    v38,
                    v39);
  }
  v35 = v10;
  v36 = v10;
  objc_autoreleasePoolPop(v3);
  return (NSString *)v35;
}

- (void)setObservationInfo:(void *)inObservationInfo
{
  $1A22B458595D9B8B5E31AEBB12624A52 *cd_extras;
  malloc_zone_t *v6;

  cd_extras = self->_cd_extras;
  if (!cd_extras)
  {
    v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v6 = malloc_default_zone();
    cd_extras = ($1A22B458595D9B8B5E31AEBB12624A52 *)malloc_type_zone_calloc(v6, 1uLL, 0x28uLL, 0x800402FCC0CB6uLL);
    self->_cd_extras = cd_extras;
  }
  cd_extras->var0 = inObservationInfo;
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  const char *Name;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  size_t v9;
  void *v11;
  const __CFAllocator *v12;
  _BYTE *v13;
  const __CFAllocator *v14;
  CFStringRef v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  objc_method *ClassMethod;
  objc_class *Class;
  void (*Implementation)(void);
  const char *TypeEncoding;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  Name = sel_getName(a3);
  v6 = objc_msgSend(a1, "_PFMOClassFactoryData");
  if (!v6)
    goto LABEL_5;
  v7 = *(_QWORD *)(v6 + 8);
  if (v7)
  {
    v8 = strlen(Name);
    if (v8 < 0x21 || (v9 = v8, strncmp("automaticallyNotifiesObserversOf", Name, 0x20uLL)))
    {
LABEL_5:
      LOBYTE(v7) = 0;
      return v7;
    }
    v11 = *(void **)(v7 + 104);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = _PFStackAllocatorCreate((unint64_t *)&v23, 1024);
    MEMORY[0x1E0C80A78](v12);
    v13 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    memcpy(v13, Name + 32, v9 - 31);
    v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
    v15 = CFStringCreateWithCStringNoCopy(v12, v13, 0x600u, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    v16 = objc_msgSend(v11, "indexForKey:", v15);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (*((_QWORD *)&v24 + 1))
      {
        if (v15)
          CFRelease(v15);
      }
      else
      {
        *((_QWORD *)&v23 + 1) = v23;
      }
      *v13 = __tolower((char)*v13);
      v15 = CFStringCreateWithCStringNoCopy(v12, v13, 0x600u, v14);
      v16 = objc_msgSend(v11, "indexForKey:", v15);
    }
    v17 = v16;
    if (*((_QWORD *)&v24 + 1))
    {
      if (v15)
        CFRelease(v15);
    }
    else
    {
      *((_QWORD *)&v23 + 1) = v23;
    }
    LOBYTE(v7) = v17 != 0x7FFFFFFFFFFFFFFFLL;
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = (objc_class *)objc_opt_class();
      ClassMethod = class_getClassMethod(v18, sel__isGeneratedClass);
      Class = object_getClass(a1);
      Implementation = method_getImplementation(ClassMethod);
      TypeEncoding = method_getTypeEncoding(ClassMethod);
      class_addMethod(Class, a3, Implementation, TypeEncoding);
    }
  }
  return v7;
}

- (BOOL)hasFaultForRelationshipNamed:(NSString *)key
{
  NSString *v3;
  CFStringRef v5;
  id v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t cd_extraFlags;
  char *v11;
  id v12;
  void *v13;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  CFRange result;
  CFRange v20;
  CFRange v21;

  v3 = key;
  if (!_PF_Threading_Debugging_level)
  {
    if (key)
      goto LABEL_3;
LABEL_26:
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[<%@ %p> valueForUndefinedKey:]: the entity %@ is not key value coding-compliant for the key \"%@\"."), objc_opt_class(), self, -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), 0);
    v16 = objc_alloc(MEMORY[0x1E0C99D80]);
    v17 = (void *)objc_msgSend(v16, "initWithObjectsAndKeys:", self, CFSTR("NSTargetObjectUserInfoKey"), objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("NSUnknownUserInfoKey"), 0);
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0CB3380], v15, v17);

    objc_exception_throw(v18);
  }
  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  if (!v3)
    goto LABEL_26;
LABEL_3:
  result.location = 0;
  result.length = 0;
  v20.length = CFStringGetLength((CFStringRef)v3);
  v20.location = 0;
  if (CFStringFindWithOptions((CFStringRef)v3, CFSTR("."), v20, 0, &result))
  {
    v21.length = result.location;
    v21.location = 0;
    v5 = CFStringCreateWithSubstring(0, (CFStringRef)v3, v21);
    v3 = (NSString *)v5;
  }
  else
  {
    v5 = 0;
  }
  v6 = _PFEntityForManagedObject(self);
  if (v6
    && (v7 = (unint64_t *)v6, v8 = objc_msgSend(*((id *)v6 + 13), "indexForKey:", v3), v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = v8;
    cd_extraFlags = self->_cd_extraFlags;
    if ((_DWORD)cd_extraFlags)
      v11 = (char *)self + cd_extraFlags;
    else
      v11 = 0;
    if (((v11[(v8 >> 3) - (((unint64_t)self->_cd_stateFlags >> 22) & 0x3FC)] >> (v8 & 7)) & 1) != 0)
    {
      if (!*(_QWORD *)(_kvcPropertysPrimitiveGetters(v7) + 8 * v8))
      {
        v12 = -[NSManagedObject _genericValueForKey:withIndex:flags:](self, "_genericValueForKey:withIndex:flags:", v3, v9, 0);
        goto LABEL_16;
      }
LABEL_15:
      v12 = (id)_NSGetUsingKeyValueGetter();
LABEL_16:
      v13 = v12;
      if (v5)
        CFRelease(v5);
      if (v13)
        return objc_msgSend(v13, "isFault");
      else
        return 0;
    }
  }
  else if ((self->_cd_stateFlags & 0x8000) == 0)
  {
    object_getClass(self);
    _NSKeyValuePrimitiveGetterForClassAndKey();
    goto LABEL_15;
  }
  if (v5)
    CFRelease(v5);
  return 1;
}

- (void)willChange:(unint64_t)a3 valuesAtIndexes:(id)a4 forKey:(id)a5
{
  id *v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int cd_stateFlags;
  unsigned int *p_cd_stateFlags;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v10 = (id *)_PFEntityForManagedObject(self);
  if (!v10)
  {
    p_cd_stateFlags = &self->_cd_stateFlags;
    cd_stateFlags = self->_cd_stateFlags;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    if ((cd_stateFlags & 0x40) != 0)
      goto LABEL_10;
    goto LABEL_8;
  }
  v11 = objc_msgSend(v10[13], "indexForKey:", a5);
  v12 = v11;
  p_cd_stateFlags = &self->_cd_stateFlags;
  cd_stateFlags = self->_cd_stateFlags;
  if ((cd_stateFlags & 0x40) == 0)
  {
LABEL_8:
    -[NSManagedObject willAccessValueForKey:](self, "willAccessValueForKey:", a5);
    goto LABEL_10;
  }
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  else
    _PF_Handler_WillAccess_Property((id *)&self->super.isa, (uint64_t)sel_willAccessValueForKey_, v11);
LABEL_10:
  if ((*((_BYTE *)p_cd_stateFlags + 1) & 0x80) != 0)
  {
    objc_msgSend((id)_insertion_fault_handler, "fulfillFault:withContext:forIndex:", self, self->_cd_managedObjectContext, v12);
    if ((cd_stateFlags & 0x1000) != 0)
    {
LABEL_12:
      if ((cd_stateFlags & 0x2000) != 0)
        return;
      goto LABEL_13;
    }
  }
  else if ((cd_stateFlags & 0x1000) != 0)
  {
    goto LABEL_12;
  }
  if ((cd_stateFlags & 0x400000) == 0 || v12 != 0x7FFFFFFFFFFFFFFFLL)
    _PFFastMOCObjectWillChange((uint64_t)self->_cd_managedObjectContext, self);
  *p_cd_stateFlags |= 0x800u;
  if ((cd_stateFlags & 0x2000) == 0)
LABEL_13:
    off_1ECD8D9C8(self, a2, a3, a4, a5);
}

- (void)didChange:(unint64_t)a3 valuesAtIndexes:(id)a4 forKey:(id)a5
{
  unsigned int cd_stateFlags;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  cd_stateFlags = self->_cd_stateFlags;
  if ((cd_stateFlags & 0x2000) != 0)
  {
    if ((cd_stateFlags & 0x1000) != 0)
      goto LABEL_5;
  }
  else
  {
    off_1ECD8D9D0(self, a2, a3, a4, a5);
    if ((cd_stateFlags & 0x1000) != 0)
    {
LABEL_5:
      if ((cd_stateFlags & 0x40) != 0)
        return;
LABEL_9:
      -[NSManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", a5);
      return;
    }
  }
  self->_cd_stateFlags &= ~0x800u;
  if ((cd_stateFlags & 0x40) == 0)
    goto LABEL_9;
}

- (id)mutableOrderedSetValueForKey:(id)a3
{
  id v5;
  unint64_t *v6;
  unint64_t v7;
  id v8;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int cd_stateFlags;
  objc_super v20;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v5 = _PFEntityForManagedObject(self);
  if (v5
    && (v6 = (unint64_t *)v5, v7 = objc_msgSend(*((id *)v5 + 13), "indexForKey:", a3), v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = v7;
    v10 = (_QWORD *)v6[14];
    v11 = v10[16];
    v13 = v7 >= v11;
    v12 = v7 - v11;
    v13 = !v13 || v12 >= v10[17];
    if (v13)
    {
      v15 = v10[24];
      v14 = v10[25];
      v13 = v7 >= v15;
      v16 = v7 - v15;
      if (!v13 || v16 >= v14)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSManagedObjects of entity '%@' do not support -mutableOrderedSetValueForKey: for the property '%@'"), -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3), 0));
    }
    cd_stateFlags = self->_cd_stateFlags;
    if ((cd_stateFlags & 0x40) == 0)
      -[NSManagedObject willAccessValueForKey:](self, "willAccessValueForKey:", a3);
    _kvcPropertysPublicGetters(v6);
    v8 = -[NSManagedObject _genericMutableOrderedSetValueForKey:withIndex:flags:](self, "_genericMutableOrderedSetValueForKey:withIndex:flags:", a3, v9, 0);
    if ((cd_stateFlags & 0x40) == 0)
      -[NSManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", a3);
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)NSManagedObject;
    return -[NSManagedObject mutableOrderedSetValueForKey:](&v20, sel_mutableOrderedSetValueForKey_, a3);
  }
  return v8;
}

- (id)_genericMutableOrderedSetValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5
{
  unint64_t *v8;
  unint64_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Class Class;
  void *v18;
  _NSNotifyingWrapperMutableOrderedSet *v19;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v8 = (unint64_t *)_PFEntityForManagedObject(self);
  v9 = v8;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = -[NSManagedObject primitiveValueForKey:](self, "primitiveValueForKey:", a3);
  }
  else
  {
    v11 = _kvcPropertysPrimitiveGetters(v8);
    _PF_Handler_Primitive_GetProperty((id **)self, a4, (uint64_t)a3, *(_QWORD *)(v11 + 8 * a4), v12, v13, v14, v15);
  }
  v16 = (uint64_t)v10;
  if (v10)
  {
    Class = object_getClass(self);
    if (Class == (Class)objc_opt_class()
      || (v18 = *(void **)(_kvcPropertysPublicRelationshipMutators(v9) + 8 * a4)) == 0)
    {
      v19 = -[_NSNotifyingWrapperMutableOrderedSet initWithContainer:key:mutableOrderedSet:]([_NSNotifyingWrapperMutableOrderedSet alloc], "initWithContainer:key:mutableOrderedSet:", self, a3, v16);
    }
    else
    {
      v19 = (_NSNotifyingWrapperMutableOrderedSet *)-[_NSProxyWrapperMutableOrderedSet initWithContainer:key:mutableOrderedSet:mutationMethods:]([_NSProxyWrapperMutableOrderedSet alloc], (uint64_t)self, (uint64_t)a3, v16, v18);
    }
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (void)methodForSelector:(SEL)a3
{
  objc_class *Class;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: null selector"), _NSMethodExceptionProem());
  Class = object_getClass(self);
  return class_getMethodImplementation(Class, a3);
}

- (id)mutableSetValueForKey:(id)a3
{
  id v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int cd_stateFlags;
  id v19;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v5 = _PFEntityForManagedObject(self);
  if (v5
    && (v6 = (unint64_t *)v5, v7 = objc_msgSend(*((id *)v5 + 13), "indexForKey:", a3), v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = v7;
    v10 = (_QWORD *)v6[14];
    v11 = v10[14];
    v13 = v7 >= v11;
    v12 = v7 - v11;
    v13 = !v13 || v12 >= v10[15];
    if (v13)
    {
      v15 = v10[22];
      v14 = v10[23];
      v13 = v7 >= v15;
      v16 = v7 - v15;
      if (!v13 || v16 >= v14)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSManagedObjects of entity '%@' do not support -mutableSetValueForKey: for the property '%@'"), -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3), 0));
    }
    cd_stateFlags = self->_cd_stateFlags;
    if ((cd_stateFlags & 0x40) == 0)
      -[NSManagedObject willAccessValueForKey:](self, "willAccessValueForKey:", a3);
    _kvcPropertysPublicGetters(v6);
    v19 = -[NSManagedObject _genericMutableSetValueForKey:withIndex:flags:](self, "_genericMutableSetValueForKey:withIndex:flags:", a3, v9, 0);
    if ((cd_stateFlags & 0x40) == 0)
      -[NSManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", a3);
    return v19;
  }
  else
  {
    object_getClass(self);
    _NSKeyValueMutableSetGetterForClassAndKey();
    return (id)_NSGetUsingKeyValueGetter();
  }
}

- (id)_genericMutableSetValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5
{
  unint64_t *v8;
  unint64_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Class Class;
  void *v18;
  _NSNotifyingWrapperMutableSet *v19;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v8 = (unint64_t *)_PFEntityForManagedObject(self);
  v9 = v8;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = -[NSManagedObject primitiveValueForKey:](self, "primitiveValueForKey:", a3);
  }
  else
  {
    v11 = _kvcPropertysPrimitiveGetters(v8);
    _PF_Handler_Primitive_GetProperty((id **)self, a4, (uint64_t)a3, *(_QWORD *)(v11 + 8 * a4), v12, v13, v14, v15);
  }
  v16 = (uint64_t)v10;
  if (v10)
  {
    Class = object_getClass(self);
    if (Class == (Class)objc_opt_class()
      || (v18 = *(void **)(_kvcPropertysPublicRelationshipMutators(v9) + 8 * a4)) == 0)
    {
      v19 = -[_NSNotifyingWrapperMutableSet initWithContainer:key:mutableSet:]([_NSNotifyingWrapperMutableSet alloc], "initWithContainer:key:mutableSet:", self, a3, v16);
    }
    else
    {
      v19 = (_NSNotifyingWrapperMutableSet *)-[_NSProxyWrapperMutableSet initWithContainer:key:mutableSet:mutationMethods:]([_NSProxyWrapperMutableSet alloc], (uint64_t)self, (uint64_t)a3, v16, v18);
    }
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (void)_willChange_Swift_Trampoline
{
  NSManagedObject *v2;
  __int128 v3;
  __int128 v4;

  v2 = self;
  if (-[NSManagedObject bindableObjectPublisher](v2, sel_bindableObjectPublisher))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    outlined init with take of Any(&v3, &v4);
    type metadata accessor for ObservableObjectPublisher();
    swift_dynamicCast();
    ObservableObjectPublisher.send()();

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

+ (char)_transientPropertiesChangesMask__
{
  return 0;
}

+ (id)alloc_10_4
{
  return _PFAllocateObject((Class)a1, 0);
}

+ (id)allocWithZone_10_4:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (unint64_t)retainCount
{
  return (uint64_t)(self->_cd_rc + 2) >> 1;
}

- (NSManagedObject)init
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *Class;

  if ((init__warn_once & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    v5 = objc_msgSend(v3, "stringWithFormat:", CFSTR("CoreData: error: Failed to call designated initializer on NSManagedObject class '%@' \n"), NSStringFromClass(v4));
    init__warn_once = 1;
    if (v5)
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      _NSCoreDataLog(1, (uint64_t)CFSTR("CoreData: error: Failed to call designated initializer on NSManagedObject class '%@' \n"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    }
  }
  Class = object_getClass(self);
  return (NSManagedObject *)_PFAllocateObject(Class, 0);
}

- (BOOL)isUpdated
{
  char v3;
  BOOL result;
  unsigned int cd_stateFlags;
  _BOOL4 v6;
  BOOL v7;

  v3 = _PF_Threading_Debugging_level;
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
    v3 = self == 0;
  }
  else
  {
    result = 0;
    if (!self)
      return result;
  }
  cd_stateFlags = self->_cd_stateFlags;
  v6 = (cd_stateFlags >> 3) & 1;
  v7 = cd_stateFlags & 1;
  if ((self->_cd_stateFlags & 8) != 0)
    v7 = v6;
  if ((v3 & 1) != 0)
    return v6;
  else
    return v7;
}

- (BOOL)validateValue:(id *)value forKey:(NSString *)key error:(NSError *)error
{
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v9 = _PFEntityForManagedObject(self);
  v10 = v9;
  if (v9)
    v9 = (_QWORD *)v9[13];
  v11 = objc_msgSend(v9, "indexForKey:", key);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    v12 = 0;
  else
    v12 = *(void **)(v10[12] + 24 + 8 * v11);
  return -[NSManagedObject _validateValue:forProperty:andKey:withIndex:error:](self, (uint64_t *)value, v12, (uint64_t)key, v11, error);
}

- (uint64_t)_generateErrorWithCode:(void *)a3 andMessage:(uint64_t)a4 forKey:(uint64_t)a5 andValue:(uint64_t)a6 additionalDetail:
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  if (result)
  {
    v11 = (void *)result;
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
    v13 = v12;
    if (a6)
      objc_msgSend(v12, "addEntriesFromDictionary:", a6);
    v14 = (void *)MEMORY[0x1E0C99E08];
    if (!a5)
      a5 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    objc_msgSend(v13, "addEntriesFromDictionary:", objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v11, CFSTR("NSValidationErrorObject"), a4, CFSTR("NSValidationErrorKey"), a5, CFSTR("NSValidationErrorValue"), 0));
    v15 = (_QWORD *)MEMORY[0x1E0CB28A8];
    if (!a3)
      a3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], a2, 0), "localizedDescription");
    v16 = (void *)objc_msgSend(v11, "entity");
    if (v16)
      v17 = objc_msgSend((id)objc_msgSend(v16, "propertiesByName"), "objectForKey:", a4);
    else
      v17 = 0;
    v18 = -[NSManagedObject _substituteEntityAndProperty:inString:](v11, v17, a3);
    if (v18)
      objc_msgSend(v13, "setObject:forKey:", v18, *MEMORY[0x1E0CB2D50]);
    return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *v15, a2, v13);
  }
  return result;
}

- (void)_chainNewError:(uint64_t *)a3 toOriginalErrorDoublePointer:
{
  void *v5;

  if (result && a2 && a3)
  {
    result = (void *)*a3;
    if (*a3)
    {
      v5 = (void *)objc_msgSend((id)objc_msgSend(result, "userInfo"), "valueForKey:", CFSTR("NSDetailedErrors"));
      if (!v5)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *a3);
        *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 1560, objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v5, CFSTR("NSDetailedErrors")));
      }
      return (void *)objc_msgSend(v5, "addObject:", a2);
    }
    else
    {
      *a3 = a2;
    }
  }
  return result;
}

- (id)mutableArrayValueForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v5 = _PFEntityForManagedObject(self);
  if (v5)
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "propertiesByName"), "objectForKey:", a3);
    if (v6)
    {
      v7 = v6;
      if (!objc_msgSend(v6, "isTransient") || objc_msgSend(v7, "_propertyType") == 3)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSManagedObjects of entity '%@' do not support -mutableArrayValueForKey: for the property '%@'"), -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3), 0));
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)NSManagedObject;
  return -[NSManagedObject mutableArrayValueForKey:](&v9, sel_mutableArrayValueForKey_, a3);
}

- (void)setPrimitiveValue:(id)value forKey:(NSString *)key
{
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v7 = _PFEntityForManagedObject(self);
  if (v7
    && ((v8 = (uint64_t)v7, v9 = (void *)v7[13], !(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
      ? (v10 = objc_msgSend(v9, "indexForKey:", key))
      : (v10 = objc_msgSend(v9, "fastIndexForKnownKey:", key)),
        v11 = v10,
        v10 != 0x7FFFFFFFFFFFFFFFLL))
  {
    if (!*(_QWORD *)(_kvcPropertysPrimitiveSetters(v8) + 8 * v10))
    {
      -[NSManagedObject _setGenericValue:forKey:withIndex:flags:](self, "_setGenericValue:forKey:withIndex:flags:", value, key, v11, 0);
      return;
    }
  }
  else
  {
    object_getClass(self);
    _NSKeyValuePrimitiveSetterForClassAndKey();
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((self->_cd_stateFlags & 0x8000) != 0)
    objc_msgSend((id)_insertion_fault_handler, "fulfillFault:withContext:forIndex:", self, self->_cd_managedObjectContext, v11);
  _NSSetUsingKeyValueSetter();
}

- (void)setValuesForKeysWithDictionary:(id)a3
{
  unint64_t *v5;
  unint64_t *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  size_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  id Property;
  void *v22;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  objc_super v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v5 = (unint64_t *)_PFEntityForManagedObject(self);
  if (!v5)
  {
    v29.receiver = self;
    v29.super_class = (Class)NSManagedObject;
    -[NSManagedObject setValuesForKeysWithDictionary:](&v29, sel_setValuesForKeysWithDictionary_, a3);
    return;
  }
  v6 = v5;
  v7 = (void *)v5[12];
  v28 = (id)v5[13];
  v26 = _kvcPropertysPublicGetters(v5);
  v24 = _kvcPropertysPublicSetters(v6);
  v25 = objc_msgSend(v7, "values");
  v27 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = objc_msgSend(a3, "count");
  v9 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v23 - v11;
  v13 = 8 * v10;
  if (v9 >= 0x201)
  {
    v12 = (char *)NSAllocateScannedUncollectable();
    v15 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(a3, "getObjects:andKeys:", v15, v12);
  }
  else
  {
    bzero((char *)v23 - v11, 8 * v10);
    MEMORY[0x1E0C80A78](v14);
    v15 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v15, v13);
    objc_msgSend(a3, "getObjects:andKeys:", v15, v12);
    if (!v8)
      return;
  }
  v23[1] = v23;
  v16 = 0;
  do
  {
    v17 = *(_QWORD *)&v12[8 * v16];
    if (*(_QWORD *)&v15[8 * v16] == v27)
      v18 = 0;
    else
      v18 = *(id *)&v15[8 * v16];
    v19 = objc_msgSend(v28, "indexForKey:", *(_QWORD *)&v12[8 * v16]);
    v20 = v19;
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      Property = -[NSManagedObject valueForKey:](self, "valueForKey:", v17);
    else
      Property = _PF_Handler_Public_GetProperty((id **)self, v19, v17, *(_QWORD *)(v26 + 8 * v19));
    v22 = Property;
    if (v18 != Property && (objc_msgSend(Property, "isEqual:", v18) & 1) == 0)
    {
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSManagedObject setValue:forKey:](self, "setValue:forKey:", v18, v17);
      }
      else if (objc_msgSend(*(id *)(v25 + 8 * v20), "_isToManyRelationship"))
      {
        -[NSManagedObject _updateToManyRelationship:from:to:with:](self, v17, v22, v18, v22);
      }
      else
      {
        _PF_Handler_Public_SetProperty((unsigned int *)self, v20, v18, v17, *(_QWORD **)(v24 + 8 * v20));
      }
    }
    ++v16;
  }
  while (v8 != v16);
  if (v8 >= 0x201)
  {
    NSZoneFree(0, v12);
    NSZoneFree(0, v15);
  }
}

- (void)_updateToManyRelationship:(void *)a3 from:(void *)a4 to:(void *)a5 with:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  if (a1)
  {
    if ((objc_msgSend(a3, "isNSOrderedSet") & 1) != 0)
    {
      v23 = 0;
      v24 = 0;
      v21 = 0;
      v22 = 0;
      v20 = 0;
      -[NSManagedObject diffOrderedSets:::::::](a1, a3, a4, (uint64_t *)&v24, &v23, &v22, &v21, &v20);
      v10 = v24;
      if (objc_msgSend(v24, "count"))
      {
        objc_msgSend(a1, "willChange:valuesAtIndexes:forKey:", 3, v10, a2);
        objc_msgSend(a5, "removeObjectsAtIndexes:", v10);
        objc_msgSend(a1, "didChange:valuesAtIndexes:forKey:", 3, v10, a2);
      }
      v11 = v23;
      if (objc_msgSend(v23, "count"))
      {
        objc_msgSend(a1, "willChange:valuesAtIndexes:forKey:", 2, v11, a2);
        objc_msgSend(a5, "insertObjects:atIndexes:", v22, v11);
        objc_msgSend(a1, "didChange:valuesAtIndexes:forKey:", 2, v11, a2);
      }
      v12 = v21;
      if (objc_msgSend(v21, "count"))
      {
        objc_msgSend(a1, "willChange:valuesAtIndexes:forKey:", 4, v12, a2);
        v13 = v20;
        objc_msgSend(a5, "removeObjectsInArray:", v20);
        if (objc_msgSend(a5, "count"))
          objc_msgSend(a5, "insertObjects:atIndexes:", v13, v12);
        else
          objc_msgSend(a5, "addObjectsFromArray:", v13);
        objc_msgSend(a1, "didChange:valuesAtIndexes:forKey:", 4, v12, a2);
      }
    }
    else
    {
      if (objc_msgSend(a4, "count") && (v14 = (void *)objc_msgSend(a4, "mutableCopy")) != 0)
      {
        v18 = v14;
        objc_msgSend(v14, "minusSet:", a3);
      }
      else
      {
        v18 = 0;
      }
      if (objc_msgSend(a3, "count", v18))
      {
        v15 = (void *)objc_msgSend(a3, "mutableCopy");
        v16 = v15;
        if (v15)
        {
          if (a4)
            v17 = (uint64_t)a4;
          else
            v17 = NSSet_EmptySet;
          objc_msgSend(v15, "minusSet:", v17);
        }
      }
      else
      {
        v16 = 0;
      }
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(a1, "willChangeValueForKey:withSetMutation:usingObjects:", a2, 2, v16);
        objc_msgSend(a5, "minusSet:", v16);
        objc_msgSend(a1, "didChangeValueForKey:withSetMutation:usingObjects:", a2, 2, v16);
      }
      if (objc_msgSend(v19, "count"))
      {
        objc_msgSend(a1, "willChangeValueForKey:withSetMutation:usingObjects:", a2, 1, v19);
        objc_msgSend(a5, "unionSet:", v19);
        objc_msgSend(a1, "didChangeValueForKey:withSetMutation:usingObjects:", a2, 1, v19);
      }

    }
  }
}

- (id)dictionaryWithPropertyValues
{
  NSKnownKeysDictionary *v3;

  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  else if (!self)
  {
    v3 = 0;
    return v3;
  }
  v3 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](self, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 0);
  return v3;
}

- (NSDictionary)committedValuesForKeys:(NSArray *)keys
{
  NSDictionary *p_super;
  $1A22B458595D9B8B5E31AEBB12624A52 *cd_extras;
  NSKnownKeysDictionary *var1;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  size_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSKnownKeysDictionary *v21;
  NSKnownKeysMappingStrategy *v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  void **v37;
  id *v38;
  id v39;
  void *v40;
  id v41;
  NSKnownKeysDictionary *v42;
  NSKnownKeysDictionary *v43;
  NSKnownKeysDictionary *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  if (-[NSManagedObject isInserted](self, "isInserted"))
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  if (self && (cd_extras = self->_cd_extras) != 0)
    var1 = (NSKnownKeysDictionary *)cd_extras->var1;
  else
    var1 = 0;
  v8 = _PFEntityForManagedObject(self);
  v9 = v8;
  if (v8)
    v10 = v8[12];
  else
    v10 = 0;
  v11 = NSKeyValueCoding_NullValue;
  v12 = -[NSArray count](keys, "count");
  if (v12)
  {
    v13 = v12;
    v44 = (NSKnownKeysDictionary *)&v43;
    v14 = MEMORY[0x1E0C80A78](v12);
    v16 = (char *)&v43 - v15;
    v17 = 8 * v14;
    if (v14 > 0x200)
    {
      v16 = (char *)NSAllocateScannedUncollectable();
      v19 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v43 - v15, v17);
      MEMORY[0x1E0C80A78](v18);
      v19 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v19, v17);
    }
    v46 = v10 + 24;
    -[NSArray getObjects:range:](keys, "getObjects:range:", v16, 0, v13);
    v21 = var1;
    if (self)
    {
      v21 = var1;
      if (!var1)
      {
        v47[0] = 0x900000001;
        v21 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](self, dword_18A509D50, (unsigned int *)v47, 1);
      }
    }
    v45 = (uint64_t)var1;
    v22 = -[NSKnownKeysDictionary mapping](v21, "mapping");
    v43 = v21;
    v23 = -[NSKnownKeysDictionary values](v21, "values");
    for (i = 0; i != v13; ++i)
    {
      v25 = -[NSKnownKeysMappingStrategy indexForKey:](v22, "indexForKey:", *(_QWORD *)&v16[8 * i]);
      v26 = v11;
      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = *(void **)(v23 + 8 * v25);
        v28 = *(void **)(v46 + 8 * v25);
        v29 = objc_msgSend(v28, "isTransient");
        v26 = v11;
        if ((v29 & 1) == 0)
        {
          if (objc_msgSend(v28, "_isToManyRelationship") && objc_msgSend(v27, "isFault"))
            objc_msgSend(v27, "count");
          if (v27)
            v26 = (uint64_t)v27;
          else
            v26 = v11;
        }
      }
      *(_QWORD *)&v19[8 * i] = v26;
    }
    p_super = (NSDictionary *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", v19, v16, v13);
    if (v13 >= 0x201)
    {
      NSZoneFree(0, v19);
      NSZoneFree(0, v16);
    }
    if (!v45)

  }
  else if (var1)
  {
    v46 = -[NSKnownKeysDictionary values](var1, "values");
    v44 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", -[NSKnownKeysDictionary mapping](var1, "mapping"));
    v45 = -[NSKnownKeysDictionary values](v44, "values");
    if (v9)
      v20 = v9[14];
    else
      v20 = 0;
    v31 = 0;
    v32 = v10 + 24;
    do
    {
      v33 = (uint64_t *)(v20 + 16 * dword_18A509CE8[v31]);
      v34 = *v33;
      v35 = v33[1];
      if (*v33 < (unint64_t)(v35 + *v33))
      {
        v36 = (_QWORD *)(v45 + 8 * v34);
        v37 = (void **)(v46 + 8 * v34);
        v38 = (id *)(v32 + 8 * v34);
        do
        {
          v39 = *v38;
          if ((objc_msgSend(*v38, "isTransient") & 1) == 0)
          {
            v40 = *v37;
            if (objc_msgSend(v39, "_isToManyRelationship"))
            {
              objc_msgSend(v40, "count");
              v41 = (id)v11;
              if (v40)
                v41 = (id)objc_msgSend(v40, "copy");
            }
            else
            {
              v41 = (id)v11;
              if (v40)
                v41 = v40;
            }
            *v36 = v41;
          }
          ++v36;
          ++v37;
          ++v38;
          --v35;
        }
        while (v35);
      }
      ++v31;
    }
    while (v31 != 3);
    p_super = &v44->super.super;
    v42 = v44;
  }
  else
  {
    if (self)
    {
      v47[0] = 0x900000001;
      return (NSDictionary *)-[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](self, dword_18A509D50, (unsigned int *)v47, 0);
    }
    return 0;
  }
  return p_super;
}

- (id)mergeableStringValueForKey:(id)a3
{
  id v5;
  unint64_t *v6;
  uint64_t v7;
  uint64_t v9;
  unsigned int cd_stateFlags;
  id v11;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v5 = _PFEntityForManagedObject(self);
  if (v5
    && (v6 = (unint64_t *)v5, v7 = objc_msgSend(*((id *)v5 + 13), "indexForKey:", a3), v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = v7;
    cd_stateFlags = self->_cd_stateFlags;
    if ((cd_stateFlags & 0x40) == 0)
      -[NSManagedObject willAccessValueForKey:](self, "willAccessValueForKey:", a3);
    _kvcPropertysPublicGetters(v6);
    v11 = -[NSManagedObject _genericMergeableStringValueForKey:withIndex:](self, "_genericMergeableStringValueForKey:withIndex:", a3, v9);
    if ((cd_stateFlags & 0x40) == 0)
      -[NSManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", a3);
    return v11;
  }
  else
  {
    object_getClass(self);
    _NSKeyValueMutableSetGetterForClassAndKey();
    return (id)_NSGetUsingKeyValueGetter();
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[<%@ %p> valueForUndefinedKey:]: the entity %@ is not key value coding-compliant for the key \"%@\"."), objc_opt_class(), self, -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3);
  v6 = objc_alloc(MEMORY[0x1E0C99D80]);
  if (!a3)
    a3 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", self, CFSTR("NSTargetObjectUserInfoKey"), a3, CFSTR("NSUnknownUserInfoKey"), 0);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0CB3380], v5, v7);

  objc_msgSend(v8, "raise");
  return 0;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[<%@ %p> setValue:forUndefinedKey:]: the entity %@ is not key value coding-compliant for the key \"%@\"."), objc_opt_class(), self, -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a4);
  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  if (!a4)
    a4 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", self, CFSTR("NSTargetObjectUserInfoKey"), a4, CFSTR("NSUnknownUserInfoKey"), 0);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0CB3380], v6, v8);

  objc_msgSend(v9, "raise");
}

- (void)setNilValueForKey:(id)a3
{
  id *v5;
  uint64_t v6;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v5 = (id *)_PFEntityForManagedObject(self);
  if (v5 && (v6 = objc_msgSend(v5[13], "indexForKey:", a3), v6 != 0x7FFFFFFFFFFFFFFFLL))
    _PF_Handler_SetNilValueForKeyIndex((char **)self, (uint64_t)a3, v6);
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("[<%@ %p> setNilValueForKey]: instance of entity %@ could not set nil as the value for the key %@."), objc_opt_class(), self, -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3);
}

- (BOOL)hasPersistentChangedValues
{
  $1A22B458595D9B8B5E31AEBB12624A52 *cd_extras;
  unint64_t *v5;
  uint64_t v6;
  $1A22B458595D9B8B5E31AEBB12624A52 *v7;
  id var1;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  BOOL v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  unint64_t v30;
  uint64_t v31;
  char v32;

  if ((self->_cd_stateFlags & 0x3F) == 0 || (self->_cd_stateFlags & 0x8000) != 0)
    return 0;
  cd_extras = self->_cd_extras;
  if (!cd_extras || !cd_extras->var1)
    return 0;
  v5 = (unint64_t *)_PFEntityForManagedObject(self);
  v6 = _kvcPropertysPrimitiveGetters(v5);
  if (v5)
    v30 = v5[14];
  else
    v30 = 0;
  v7 = self->_cd_extras;
  if (v7)
    var1 = v7->var1;
  else
    var1 = 0;
  v9 = NSKeyValueCoding_NullValue;
  v14 = objc_msgSend(var1, "values", v30);
  v15 = 0;
  v16 = 1;
  v17 = 1;
  do
  {
    v32 = v16;
    v18 = (unint64_t *)(v31 + 16 * dword_18A509CE8[v15]);
    v19 = *v18;
    v20 = v18[1];
    if (*v18 < v20 + *v18)
    {
      do
      {
        v21 = *(_QWORD *)(v14 + 8 * v19) == v9 ? 0 : *(_QWORD *)(v14 + 8 * v19);
        _PF_Handler_Primitive_GetProperty((id **)self, v19, 0, *(_QWORD *)(v6 + 8 * v19), v10, v11, v12, v13);
        if (v21 != v22
          && !objc_msgSend(*(id *)(v5[12] + 24 + 8 * v19), "_epsilonEquals:rhs:withFlags:", v22, v21, 1))
        {
          return v17;
        }
        ++v19;
      }
      while (--v20);
    }
    v16 = 0;
    v15 = 1;
  }
  while ((v32 & 1) != 0);
  v23 = *(_QWORD *)(v31 + 144);
  v24 = *(_QWORD *)(v31 + 152);
  if (v23 >= v24 + v23)
    return 0;
  while (1)
  {
    v25 = *(_QWORD *)(v14 + 8 * v23) == v9 ? 0 : *(void **)(v14 + 8 * v23);
    _PF_Handler_Primitive_GetProperty((id **)self, v23, 0, *(_QWORD *)(v6 + 8 * v23), v10, v11, v12, v13);
    v27 = v26;
    v28 = objc_msgSend(v25, "isFault");
    if ((v28 & objc_msgSend(v27, "isFault") & 1) == 0
      && v25 != v27
      && !objc_msgSend(v27, "isEqual:", v25))
    {
      break;
    }
    v17 = 0;
    ++v23;
    if (!--v24)
      return v17;
  }
  return 1;
}

+ (NSFetchRequest)fetchRequest
{
  uint64_t v3;
  uint64_t v4;
  NSFetchRequest *v5;
  uint64_t v7;

  v3 = objc_msgSend(a1, "entity");
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init(NSFetchRequest);
    -[NSFetchRequest setEntity:](v5, "setEntity:", v4);
    return v5;
  }
  v7 = objc_msgSend(a1, "entityName");
  if (!v7)
    return 0;
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", v7);
}

- (void)setBindableObjectPublisher:(id)a3
{
  $1A22B458595D9B8B5E31AEBB12624A52 *cd_extras;
  malloc_zone_t *v6;

  cd_extras = self->_cd_extras;
  if (!cd_extras)
  {
    v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v6 = malloc_default_zone();
    cd_extras = ($1A22B458595D9B8B5E31AEBB12624A52 *)malloc_type_zone_calloc(v6, 1uLL, 0x28uLL, 0x800402FCC0CB6uLL);
    self->_cd_extras = cd_extras;
  }
  if (cd_extras->var4)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Cannot set BindableObject publisher after it has already been set"), 0));
  self->_cd_extras->var4 = a3;
}

- (NSKnownKeysDictionary)_newSnapshotForUndo__
{
  _QWORD *v1;
  unint64_t *v2;
  unint64_t *v3;
  unint64_t v4;
  NSKnownKeysDictionary *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void **v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  char v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  NSKnownKeysDictionary *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSKnownKeysDictionary *v36;
  const void **v37;
  char v38;
  uint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  id v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _NSOrderedSetDiffMove *v55;
  id v56;
  void *v57;
  _NSOrderedSetDiffDelete *v58;
  _NSOrderedSetDiffInsert *v59;
  id v60;
  void *v61;
  _NSOrderedSetDiffMove *v62;
  id v63;
  void *v64;
  NSKnownKeysDictionary *v65;
  uint64_t v66;
  NSKnownKeysDictionary *v67;
  NSKnownKeysDictionary *v69;
  NSKnownKeysDictionary *v70;
  unint64_t v71;
  char v72;
  unint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  objc_super v80;
  __int128 v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = a1;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__newSnapshotForUndo__);
  v70 = (NSKnownKeysDictionary *)(id)NSDictionary_EmptyDictionary;
  v2 = (unint64_t *)_PFEntityForManagedObject(v1);
  v3 = v2;
  if (v2)
    v4 = v2[13];
  else
    v4 = 0;
  v5 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", v4);
  v78 = _kvcPropertysPrimitiveGetters(v3);
  if (v3)
    v73 = v3[14];
  else
    v73 = 0;
  v77 = NSKeyValueCoding_NullValue;
  v6 = v1[6];
  if (v6)
    v7 = *(void **)(v6 + 16);
  else
    v7 = 0;
  v79 = objc_msgSend(v7, "values");
  v75 = -[NSKnownKeysDictionary values](v5, "values");
  for (i = 0; i != 4; ++i)
  {
    v13 = (uint64_t *)(v73 + 16 * dword_18A509D10[i]);
    v14 = *v13;
    v15 = v13[1];
    if (*v13 < (unint64_t)(v15 + *v13))
    {
      v16 = (_QWORD *)(v75 + 8 * v14);
      v17 = (void **)(v79 + 8 * v14);
      do
      {
        v18 = *v17++;
        *v16++ = v18;
        --v15;
      }
      while (v15);
    }
  }
  v69 = v5;
  v19 = 0;
  v20 = 4;
  v74 = v1;
  v21 = (void *)v77;
  do
  {
    v22 = v19;
    v23 = (unint64_t *)(v73 + 16 * dword_18A509D10[v20]);
    v24 = *v23;
    v25 = v23[1];
    if (*v23 < v25 + *v23)
    {
      do
      {
        if (*(void **)(v79 + 8 * v24) == v21)
          v26 = 0;
        else
          v26 = *(void **)(v79 + 8 * v24);
        _PF_Handler_Primitive_GetProperty((id **)v1, v24, 0, *(_QWORD *)(v78 + 8 * v24), v8, v9, v10, v11);
        v28 = v27;
        v29 = objc_msgSend(v26, "isFault");
        v30 = v29 & objc_msgSend(v28, "isFault");
        v21 = (void *)v77;
        if ((v30 & 1) == 0 && v26 != v28 && (objc_msgSend(v28, "isEqual:", v26) & 1) == 0)
        {
          v31 = (NSKnownKeysDictionary *)v77;
          if (v28)
          {
            if (objc_msgSend(v28, "count"))
            {
              v32 = (void *)objc_msgSend(v28, "mutableCopy");
              v33 = v32;
              if (v32)
                objc_msgSend(v32, "minusSet:", v26);
            }
            else
            {
              v33 = 0;
            }
            if (objc_msgSend(v26, "count", v69))
            {
              v34 = (void *)objc_msgSend(v26, "mutableCopy");
              v35 = v34;
              if (v34)
                objc_msgSend(v34, "minusSet:", v28);
            }
            else
            {
              v35 = 0;
            }
            v36 = [NSKnownKeysDictionary alloc];
            if (!_PFFastMappingForChanges__pffastmappingforchanges)
            {
              v80 = (objc_super)xmmword_1E1EDDE60;
              v81 = *(_OWORD *)off_1E1EDDE70;
              _PFFastMappingForChanges__pffastmappingforchanges = -[NSKnownKeysMappingStrategy initForKeys:count:]([NSKnownKeysMappingStrategy alloc], "initForKeys:count:", &v80, 4);
            }
            v31 = -[NSKnownKeysDictionary initWithSearchStrategy:](v36, "initWithSearchStrategy:");
            v37 = -[NSKnownKeysDictionary values](v31, "values");
            *v37 = v33;
            v37[1] = v35;
            v21 = (void *)v77;
          }
          *(_QWORD *)(v75 + 8 * v24) = v31;
          v1 = v74;
        }
        ++v24;
        --v25;
      }
      while (v25);
    }
    v19 = 1;
    v20 = 5;
  }
  while ((v22 & 1) == 0);
  v38 = 0;
  v39 = 6;
  do
  {
    v72 = v38;
    v40 = (unint64_t *)(v73 + 16 * dword_18A509D10[v39]);
    v42 = *v40;
    v41 = v40[1];
    v43 = v41 + v42;
    if (v42 >= v41 + v42)
      goto LABEL_92;
    v71 = v41 + v42;
    do
    {
      if (*(void **)(v79 + 8 * v42) == v21)
        v44 = 0;
      else
        v44 = *(void **)(v79 + 8 * v42);
      _PF_Handler_Primitive_GetProperty((id **)v1, v42, 0, *(_QWORD *)(v78 + 8 * v42), v8, v9, v10, v11);
      v46 = v45;
      v47 = objc_msgSend(v44, "isFault");
      if ((v47 & objc_msgSend(v46, "isFault") & 1) != 0
        || v44 == v46
        || (objc_msgSend(v46, "isEqual:", v44) & 1) != 0)
      {
        goto LABEL_91;
      }
      v48 = v21;
      if (!v46)
        goto LABEL_90;
      if (objc_msgSend(v46, "isEqual:", v44))
      {
        v48 = (id)NSArray_EmptyArray;
        goto LABEL_90;
      }
      v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v49 = objc_msgSend(v46, "count");
      v50 = objc_msgSend(v44, "count");
      v76 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v51 = 0;
      v52 = 0;
      while (1)
      {
        v53 = v52 >= v49 ? 0 : objc_msgSend(v46, "objectAtIndex:", v52);
        v54 = v51 >= v50 ? 0 : objc_msgSend(v44, "objectAtIndex:", v51);
        if (!(v53 | v54))
          break;
        if (!v53)
        {
          if ((objc_msgSend(v46, "containsObject:", v54) & 1) != 0)
            goto LABEL_85;
LABEL_75:
          v59 = [_NSOrderedSetDiffInsert alloc];
          if (v59)
          {
            v80.receiver = v59;
            v80.super_class = (Class)_NSOrderedSetDiffChange;
            v60 = objc_msgSendSuper2(&v80, sel_initWithObject_, v54);
            v61 = v60;
            if (v60)
              *((_QWORD *)v60 + 2) = v51;
          }
          else
          {
            v61 = 0;
          }
          objc_msgSend(v48, "addObject:", v61, v69);

          goto LABEL_85;
        }
        if (!v54)
        {
          if ((objc_msgSend(v44, "containsObject:", v53) & 1) != 0)
            goto LABEL_73;
LABEL_72:
          v58 = -[_NSOrderedSetDiff initWithObject:]([_NSOrderedSetDiffDelete alloc], "initWithObject:", v53);
          objc_msgSend(v48, "addObject:", v58);

          goto LABEL_73;
        }
        if (objc_msgSend((id)v53, "isEqual:", v54))
        {
          if (v51 != v52)
          {
            v62 = [_NSOrderedSetDiffMove alloc];
            if (v62)
            {
              v80.receiver = v62;
              v80.super_class = (Class)_NSOrderedSetDiffChange;
              v63 = objc_msgSendSuper2(&v80, sel_initWithObject_, v53);
              v64 = v63;
              if (v63)
                *((_QWORD *)v63 + 2) = v51;
            }
            else
            {
              v64 = 0;
            }
            objc_msgSend(v48, "addObject:", v64, v69);

          }
          ++v52;
LABEL_85:
          ++v51;
        }
        else
        {
          if (!objc_msgSend(v44, "containsObject:", v53))
            goto LABEL_72;
          if ((objc_msgSend(v46, "containsObject:", v54) & 1) == 0)
            goto LABEL_75;
          if ((objc_msgSend(v76, "containsObject:", v53) & 1) == 0)
          {
            v55 = [_NSOrderedSetDiffMove alloc];
            if (v55)
            {
              v80.receiver = v55;
              v80.super_class = (Class)_NSOrderedSetDiffChange;
              v56 = objc_msgSendSuper2(&v80, sel_initWithObject_, v54);
              v57 = v56;
              if (v56)
                *((_QWORD *)v56 + 2) = v51;
            }
            else
            {
              v57 = 0;
            }
            objc_msgSend(v48, "addObject:", v57, v69);

            objc_msgSend(v76, "addObject:", v54);
            goto LABEL_85;
          }
LABEL_73:
          ++v52;
        }
      }

      v1 = v74;
      v21 = (void *)v77;
      v43 = v71;
LABEL_90:
      *(_QWORD *)(v75 + 8 * v42) = v48;
LABEL_91:
      ++v42;
    }
    while (v42 != v43);
LABEL_92:
    v38 = 1;
    v39 = 7;
  }
  while ((v72 & 1) == 0);
  v65 = v69;
  v66 = -[NSKnownKeysDictionary count](v69, "count");
  if (v66)
    v67 = v70;
  else
    v67 = v69;
  if (!v66)
    v65 = v70;

  return v65;
}

- (NSKnownKeysDictionary)_newCommittedSnapshotValues
{
  NSKnownKeysDictionary *v2;
  _QWORD *v3;
  uint64_t v4;
  NSKnownKeysDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSKnownKeysDictionary *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void **v22;
  void *v23;
  BOOL v24;
  id v25;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__newCommittedSnapshotValues);
  v2 = [NSKnownKeysDictionary alloc];
  v3 = _PFEntityForManagedObject(a1);
  if (v3)
    v4 = v3[13];
  else
    v4 = 0;
  v5 = -[NSKnownKeysDictionary initWithSearchStrategy:](v2, "initWithSearchStrategy:", v4);
  if ((objc_msgSend(a1, "isInserted") & 1) == 0)
  {
    v6 = -[NSKnownKeysDictionary values](v5, "values");
    v7 = a1[6];
    if (v7)
    {
      v8 = *(void **)(v7 + 8);
      v9 = NSKeyValueCoding_NullValue;
      if (v8)
      {
        v10 = objc_msgSend(v8, "values");
        v11 = 0;
LABEL_13:
        v12 = *((_QWORD *)_PFEntityForManagedObject(a1) + 14);
        v13 = *(_QWORD *)(v12 + 48);
        v14 = *(_QWORD *)(v12 + 56);
        if (v13 < v14 + v13)
        {
          v15 = (_QWORD *)(v6 + 8 * v13);
          v16 = (id *)(v10 + 8 * v13);
          do
          {
            v17 = (id)v9;
            if (*v16)
              v17 = *v16;
            *v15++ = v17;
            ++v16;
            --v14;
          }
          while (v14);
        }
        v18 = *((_QWORD *)_PFEntityForManagedObject(a1) + 14);
        v19 = *(_QWORD *)(v18 + 96);
        v20 = *(_QWORD *)(v18 + 104);
        if (v19 < v20 + v19)
        {
          v21 = (_QWORD *)(v6 + 8 * v19);
          v22 = (void **)(v10 + 8 * v19);
          do
          {
            v23 = *v22;
            if (*v22)
              v24 = v23 == (void *)v9;
            else
              v24 = 1;
            v25 = (id)v9;
            if (!v24)
              v25 = (id)objc_msgSend(v23, "objectID");
            *v21++ = v25;
            ++v22;
            --v20;
          }
          while (v20);
        }

        return v5;
      }
    }
    else
    {
      v9 = NSKeyValueCoding_NullValue;
    }
    v27[0] = 0;
    v11 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](a1, dword_18A509D50, (unsigned int *)v27, 1);
    v10 = -[NSKnownKeysDictionary values](v11, "values");
    goto LABEL_13;
  }
  return v5;
}

- (id)_genericMergeableStringValueForKey:(id)a3 withIndex:(int64_t)a4
{
  unint64_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PFMergeableStringProxy *v14;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  v7 = (unint64_t *)_PFEntityForManagedObject(self);
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = -[NSManagedObject primitiveValueForKey:](self, "primitiveValueForKey:", a3);
  }
  else
  {
    v9 = _kvcPropertysPrimitiveGetters(v7);
    _PF_Handler_Primitive_GetProperty((id **)self, a4, (uint64_t)a3, *(_QWORD *)(v9 + 8 * a4), v10, v11, v12, v13);
  }
  if (v8)
    v14 = -[PFMergeableStringProxy initWithContainer:key:mergeableString:]([PFMergeableStringProxy alloc], "initWithContainer:key:mergeableString:", self, a3, v8);
  else
    v14 = 0;
  return v14;
}

- (void)_substituteEntityAndProperty:(void *)a3 inString:
{
  void *v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  if (a2)
  {
    if (a3)
    {
      v5 = _PFEntityForManagedObject(a1);
      v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "managedObjectModel"), "_localizationPolicy");
      v7 = objc_msgSend(v6, "localizedEntityNameForEntity:", v5);
      v8 = objc_msgSend(v6, "localizedPropertyNameForProperty:", a2);
      if (v7 | v8)
      {
        v9 = v8;
        v10 = (void *)objc_msgSend(v3, "mutableCopyWithZone:", 0);
        v3 = v10;
        if (v7)
          objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%{ENTITY}@"), v7, 2, 0, objc_msgSend(v10, "length"));
        if (v9)
          objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%{PROPERTY}@"), v9, 2, 0, objc_msgSend(v3, "length"));
        v11 = v3;
      }
    }
  }
  return v3;
}

- (id)diffOrderedSets:(void *)a3 :(uint64_t *)a4 :(id *)a5 :(id *)a6 :(id *)a7 :(id *)a8 :
{
  id *v9;
  size_t v14;
  size_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  size_t v28;
  unint64_t v29;
  uint64_t v30;
  size_t v31;
  size_t v32;
  size_t v33;
  size_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  size_t v38;
  char *v39;
  uint64_t v40;
  size_t v41;
  size_t v42;
  char *v43;
  uint64_t v44;
  size_t v45;
  void *v46;
  uint64_t v47;
  char *v48;
  uint64_t *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  size_t v55;
  id *v56;
  uint64_t v57;
  char *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  void *v71;
  void *v72;
  uint64_t i;
  uint64_t v74;
  id *v75;
  id v76;
  id *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  id v83;
  _QWORD *v84;
  unint64_t v85;
  uint64_t *v86;
  id *v87;
  char *v88;
  uint64_t *v89;
  id *v90;
  id *v91;
  id v92;
  char *v93;
  unint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = a6;
    *a4 = 0;
    *a5 = 0;
    *a6 = 0;
    *a7 = 0;
    v91 = a8;
    *a8 = 0;
    v14 = objc_msgSend(a3, "count");
    v15 = objc_msgSend(a2, "count");
    v86 = &v82;
    v16 = MEMORY[0x1E0C80A78](v15);
    v19 = (char *)&v82 - v18;
    if (v16 > 0x200)
    {
      v20 = NSAllocateScannedUncollectable();
      v19 = (char *)v20;
    }
    else
    {
      bzero((char *)&v82 - v18, 8 * v17);
    }
    MEMORY[0x1E0C80A78](v20);
    v23 = (char *)&v82 - v22;
    v87 = a7;
    if (v14 > 0x200)
      v23 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v82 - v22, 8 * v21);
    v84 = a3;
    v24 = objc_msgSend(a3, "getObjects:range:", v23, 0, v14);
    MEMORY[0x1E0C80A78](v24);
    v27 = (char *)&v82 - v26;
    v28 = 8 * v25;
    v85 = v29;
    if (v29 > 0x200)
    {
      v27 = (char *)NSAllocateScannedUncollectable();
      v93 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v82 - v26, 8 * v25);
      MEMORY[0x1E0C80A78](v30);
      v93 = (char *)&v82 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v93, v28);
    }
    objc_msgSend(a2, "getObjects:range:", v19, 0, v15);
    qsort_b(v19, v15, 8uLL, &__block_literal_global_8);
    qsort_b(v23, v14, 8uLL, &__block_literal_global_8);
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    if (v15)
    {
      v35 = v93;
      if (v14)
      {
        v34 = 0;
        v33 = 0;
        v32 = 0;
        v31 = 0;
        do
        {
          v36 = *(_QWORD *)&v19[8 * v33];
          v37 = *(_QWORD *)&v23[8 * v34];
          if (v36 >= v37)
          {
            if (v36 == v37)
              ++v33;
            else
              *(_QWORD *)&v35[8 * v32++] = v37;
            ++v34;
          }
          else
          {
            *(_QWORD *)&v27[8 * v31++] = v36;
            ++v33;
          }
        }
        while (v33 < v15 && v34 < v14);
      }
    }
    else
    {
      v35 = v93;
    }
    v92 = a2;
    v38 = v15 - v33;
    if (v15 <= v33)
    {
      v41 = v31;
    }
    else
    {
      v39 = &v19[8 * v33];
      do
      {
        v40 = *(_QWORD *)v39;
        v39 += 8;
        v41 = v31 + 1;
        *(_QWORD *)&v27[8 * v31++] = v40;
        --v38;
      }
      while (v38);
    }
    v88 = v19;
    v89 = a4;
    v42 = v14 - v34;
    v90 = a5;
    if (v14 <= v34)
    {
      v45 = v32;
    }
    else
    {
      v43 = &v23[8 * v34];
      do
      {
        v44 = *(_QWORD *)v43;
        v43 += 8;
        v45 = v32 + 1;
        *(_QWORD *)&v35[8 * v32++] = v44;
        --v42;
      }
      while (v42);
    }
    v94 = v14;
    if (v41)
    {
      objc_msgSend(v92, "getObjects:range:", v88, 0, v15);
      v46 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      if (v15)
      {
        v47 = 0;
        v48 = v88;
        do
        {
          if (bsearch_b(v48, v27, v41, 8uLL, &__block_literal_global_8))
            objc_msgSend(v46, "addIndex:", v47);
          ++v47;
          v48 += 8;
        }
        while (v15 != v47);
      }
      v49 = v89;
      *v89 = (uint64_t)v46;
      v50 = v46;
      v51 = v92;
      v52 = (id)objc_msgSend(v92, "mutableCopy");
      v53 = *v49;
      v83 = v52;
      objc_msgSend(v52, "removeObjectsAtIndexes:", v53);
      v14 = v94;
    }
    else
    {
      v83 = 0;
      v51 = v92;
    }
    v54 = objc_msgSend(v84, "getObjects:range:", v23, 0, v14);
    v55 = v14;
    v56 = v90;
    if (v45)
    {
      v84 = v9;
      v82 = (uint64_t)&v82;
      MEMORY[0x1E0C80A78](v54);
      v58 = (char *)&v82 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
      v59 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      if (v55)
      {
        v60 = 0;
        v61 = 0;
        v62 = 0;
        do
        {
          if (bsearch_b(&v23[v60], v93, v45, 8uLL, &__block_literal_global_8))
          {
            objc_msgSend(v59, "addIndex:", v61);
            *(_QWORD *)&v58[8 * v62++] = *(_QWORD *)&v23[8 * v61];
          }
          ++v61;
          v60 += 8;
        }
        while (v94 != v61);
      }
      else
      {
        v62 = 0;
      }
      v56 = v90;
      *v90 = v59;
      v64 = v59;
      v51 = v92;
      v63 = v83;
      if (!v83)
        v63 = (id)objc_msgSend(v92, "mutableCopy");
      v65 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v58, v62);
      v9 = (id *)v84;
      *v84 = v65;
      objc_msgSend(v63, "insertObjects:atIndexes:", v65, *v56);
    }
    else
    {
      v63 = v83;
    }
    if (!v63)
      v63 = v51;
    v66 = objc_msgSend(v63, "count");
    v67 = MEMORY[0x1E0C80A78](v66);
    v70 = (char *)&v82 - v69;
    if (v67 > 0x200)
      v70 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v82 - v69, 8 * v68);
    objc_msgSend(v63, "getObjects:range:", v70, 0, v66);
    v71 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v72 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (v66)
    {
      for (i = 0; i != v66; ++i)
      {
        if (*(_QWORD *)&v23[8 * i] != *(_QWORD *)&v70[8 * i])
        {
          objc_msgSend(v71, "addIndex:", i);
          objc_msgSend(v72, "addObject:", *(_QWORD *)&v23[8 * i]);
        }
      }
    }
    v74 = objc_msgSend(v71, "count");
    v75 = v87;
    if (v74)
    {
      *v75 = v71;
      v76 = v72;
      *v91 = v76;
    }
    if (v15 >= 0x201)
      NSZoneFree(0, v88);
    v77 = (id *)v89;
    if (v94 >= 0x201)
      NSZoneFree(0, v23);
    if (v85 >= 0x201)
    {
      NSZoneFree(0, v27);
      NSZoneFree(0, v93);
    }
    if (v66 >= 0x201)
      NSZoneFree(0, v70);
    v78 = *v77;
    v79 = *v56;
    v80 = *v9;
    v81 = *v75;
    return *v91;
  }
  return result;
}

uint64_t __61__NSManagedObject__NSInternalMethods__diffOrderedSets_____::__block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unsigned int v3;

  if (*a2 > *a3)
    v3 = 1;
  else
    v3 = -1;
  if (*a2 == *a3)
    return 0;
  else
    return v3;
}

- (void)_genericUpdateFromSnapshot:(_DWORD *)a1
{
  _QWORD *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = _PFEntityForManagedObject(a1);
  v5 = (void *)objc_msgSend(v4, "propertiesByName");
  v27 = _kvcPropertysPrimitiveGetters(v4);
  v25 = _kvcPropertysPrimitiveSetters((uint64_t)v4);
  if (v4)
    v29 = (id)v4[13];
  else
    v29 = 0;
  v26 = objc_msgSend(v5, "values", v25);
  v28 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(a1, "willAccessValueForKey:", 0);
  a1[4] |= 0x800u;
  v6 = objc_msgSend(a2, "count");
  v7 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v25 - v9;
  v11 = 8 * v8;
  if (v7 >= 0x201)
  {
    v10 = (char *)NSAllocateScannedUncollectable();
    v13 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(a2, "getObjects:andKeys:", v13, v10);
  }
  else
  {
    bzero((char *)&v25 - v9, 8 * v8);
    MEMORY[0x1E0C80A78](v12);
    v13 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v13, v11);
    objc_msgSend(a2, "getObjects:andKeys:", v13, v10);
    if (!v6)
      goto LABEL_26;
  }
  v14 = 0;
  do
  {
    v15 = *(_QWORD *)&v10[8 * v14];
    if (*(_QWORD *)&v13[8 * v14] == v28)
      v16 = 0;
    else
      v16 = *(void **)&v13[8 * v14];
    v17 = objc_msgSend(v29, "indexForKey:", *(_QWORD *)&v10[8 * v14]);
    v22 = v17;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      v23 = (void *)objc_msgSend(a1, "primitiveValueForKey:", v15);
    else
      _PF_Handler_Primitive_GetProperty((id **)a1, v17, v15, *(_QWORD *)(v27 + 8 * v17), v18, v19, v20, v21);
    v24 = v23;
    if (v16 != v23 && (objc_msgSend(v23, "isEqual:", v16) & 1) == 0)
    {
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(a1, "willChangeValueForKey:", v15);
        objc_msgSend(a1, "setPrimitiveValue:forKey:", v16, v15);
      }
      else
      {
        if (objc_msgSend(*(id *)(v26 + 8 * v22), "_isToManyRelationship"))
        {
          -[NSManagedObject _updateToManyRelationship:from:to:with:](a1, v15, v24, v16, v24);
          goto LABEL_23;
        }
        objc_msgSend(a1, "willChangeValueForKey:", v15);
        _PF_Handler_Primitive_SetProperty((char **)a1, v22, v16, v15, *(_QWORD *)(v25 + 8 * v22));
      }
      objc_msgSend(a1, "didChangeValueForKey:", v15);
    }
LABEL_23:
    ++v14;
  }
  while (v6 != v14);
  if (v6 >= 0x201)
  {
    NSZoneFree(0, v10);
    NSZoneFree(0, v13);
  }
LABEL_26:
  a1[4] &= ~0x800u;
}

- (void)_updateFromSnapshot:(uint64_t)a1
{
  unint64_t *v4;
  unint64_t *v5;
  unint64_t v6;
  int v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _OWORD *v35;
  uint64_t v36;
  unint64_t *v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (unint64_t *)_PFEntityForManagedObject((id)a1);
    v5 = v4;
    if (v4)
      v6 = v4[13];
    else
      v6 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a2, "mapping") == v6)
    {
      v7 = *(_DWORD *)(a1 + 16);
      if ((v7 & 0x8000) != 0)
      {
        -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, (_DWORD *)a1, *(_QWORD *)(a1 + 32));
        v7 = *(_DWORD *)(a1 + 16);
      }
      *(_DWORD *)(a1 + 16) = v7 | 0x800;
      if (v5)
        v8 = (_OWORD *)v5[14];
      else
        v8 = 0;
      v9 = *(_QWORD *)(v6 + 40);
      v10 = _kvcPropertysPrimitiveGetters(v5);
      v37 = v5;
      v36 = _kvcPropertysPrimitiveSetters((uint64_t)v5);
      v15 = objc_msgSend(a2, "values");
      v16 = 0;
      v35 = v8;
      v17 = v8[5];
      v18 = v8[6];
      v39 = v8[3];
      v40 = v17;
      v19 = v8[10];
      v41 = v18;
      v42 = v19;
      v43 = v8[14];
      do
      {
        v20 = (unint64_t *)(&v39 + v16);
        v22 = *v20;
        v21 = v20[1];
        if (*v20 < v21 + *v20)
        {
          do
          {
            v23 = *(void **)(v15 + 8 * v22);
            if (v23)
            {
              v24 = *(_QWORD *)(v9 + 8 * v22);
              _PF_Handler_Primitive_GetProperty((id **)a1, v22, v24, *(_QWORD *)(v10 + 8 * v22), v11, v12, v13, v14);
              if (v23 == (void *)NSKeyValueCoding_NullValue)
                v23 = 0;
              if (v23 != v25
                && (objc_msgSend(*(id *)(v37[12] + 24 + 8 * v22), "_epsilonEquals:rhs:withFlags:", v25, v23, 1) & 1) == 0)
              {
                objc_msgSend((id)a1, "willChangeValueForKey:", v24);
                _PF_Handler_Primitive_SetProperty((char **)a1, v22, v23, v24, *(_QWORD *)(v36 + 8 * v22));
                objc_msgSend((id)a1, "didChangeValueForKey:", v24);
              }
            }
            ++v22;
            --v21;
          }
          while (v21);
        }
        ++v16;
      }
      while (v16 != 5);
      v26 = 0;
      v39 = v35[9];
      v40 = v35[13];
      v27 = 1;
      do
      {
        v38 = v27;
        v28 = (unint64_t *)(&v39 + v26);
        v29 = *v28;
        v30 = v28[1];
        if (*v28 < v30 + *v28)
        {
          do
          {
            v31 = *(void **)(v15 + 8 * v29);
            if (v31)
            {
              v32 = *(_QWORD *)(v9 + 8 * v29);
              _PF_Handler_Primitive_GetProperty((id **)a1, v29, v32, *(_QWORD *)(v10 + 8 * v29), v11, v12, v13, v14);
              if (v31 == (void *)NSKeyValueCoding_NullValue)
                v31 = 0;
              if (v31 != v33)
              {
                v34 = v33;
                if ((objc_msgSend(v33, "isEqual:", v31) & 1) == 0)
                  -[NSManagedObject _updateToManyRelationship:from:to:with:]((void *)a1, v32, v34, v31, v34);
              }
            }
            ++v29;
            --v30;
          }
          while (v30);
        }
        v27 = 0;
        v26 = 1;
      }
      while ((v38 & 1) != 0);
      *(_DWORD *)(a1 + 16) &= ~0x800u;
    }
    else
    {
      -[NSManagedObject _genericUpdateFromSnapshot:]((_DWORD *)a1, a2);
    }
  }
}

- (void)_updateFromUndoSnapshot:(_DWORD *)a1
{
  unint64_t *v4;
  unint64_t *v5;
  unint64_t v6;
  int v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  id **v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  uint64_t v40;
  char v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  _OWORD *v56;
  char v57;
  id **v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl(*((_QWORD *)a1 + 4), sel__updateFromUndoSnapshot_);
    v58 = (id **)a1;
    v4 = (unint64_t *)_PFEntityForManagedObject(a1);
    v5 = v4;
    if (v4)
      v6 = v4[13];
    else
      v6 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a2, "mapping") == v6)
    {
      v7 = a1[4];
      if ((v7 & 0x8000) != 0)
      {
        -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, a1, *((_QWORD *)a1 + 4));
        v7 = a1[4];
      }
      a1[4] = v7 | 0x800;
      if (v5)
        v8 = (_OWORD *)v5[14];
      else
        v8 = 0;
      v59 = *(_QWORD *)(v6 + 40);
      v60 = _kvcPropertysPrimitiveGetters(v5);
      v9 = _kvcPropertysPrimitiveSetters((uint64_t)v5);
      v14 = objc_msgSend(a2, "values");
      v15 = 0;
      v56 = v8;
      v16 = v8[6];
      v65 = v8[1];
      v66 = v16;
      v17 = v8[14];
      v67 = v8[10];
      v68 = v17;
      v18 = v58;
      do
      {
        v19 = (unint64_t *)(&v65 + v15);
        v20 = *v19;
        v21 = v19[1];
        if (*v19 < v21 + *v19)
        {
          do
          {
            v22 = *(_QWORD *)(v14 + 8 * v20);
            if (v22)
            {
              v23 = *(_QWORD *)(v59 + 8 * v20);
              _PF_Handler_Primitive_GetProperty(v58, v20, v23, *(_QWORD *)(v60 + 8 * v20), v10, v11, v12, v13);
              v25 = v22 == NSKeyValueCoding_NullValue ? 0 : (void *)v22;
              if (v25 != v24 && (objc_msgSend(v24, "isEqual:", v25) & 1) == 0)
              {
                objc_msgSend(v58, "willChangeValueForKey:", v23);
                _PF_Handler_Primitive_SetProperty((char **)v58, v20, v25, v23, *(_QWORD *)(v9 + 8 * v20));
                objc_msgSend(v58, "didChangeValueForKey:", v23);
              }
            }
            ++v20;
            --v21;
          }
          while (v21);
        }
        ++v15;
      }
      while (v15 != 4);
      v26 = 0;
      v65 = v56[7];
      v66 = v56[11];
      v27 = 1;
      v28 = v59;
      do
      {
        v29 = v27;
        v30 = (unint64_t *)(&v65 + v26);
        v31 = *v30;
        v32 = v30[1];
        if (*v30 < v32 + *v30)
        {
          do
          {
            v33 = *(_QWORD *)(v14 + 8 * v31);
            if (v33)
            {
              v34 = *(_QWORD *)(v28 + 8 * v31);
              _PF_Handler_Primitive_GetProperty(v58, v31, v34, *(_QWORD *)(v60 + 8 * v31), v10, v11, v12, v13);
              v36 = v33 == NSKeyValueCoding_NullValue ? 0 : (void *)v33;
              if (v36 != v35)
              {
                v37 = v35;
                if ((!objc_msgSend(v36, "isFault") || (objc_msgSend(v37, "isFault") & 1) == 0)
                  && (objc_msgSend(v37, "isEqual:", v36) & 1) == 0)
                {
                  v38 = (_QWORD *)objc_msgSend(v36, "values");
                  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v37);
                  objc_msgSend(v39, "minusSet:", *v38);
                  objc_msgSend(v39, "unionSet:", v38[1]);
                  -[NSManagedObject _updateToManyRelationship:from:to:with:](v58, v34, v37, v39, v37);

                  v28 = v59;
                }
              }
            }
            ++v31;
            --v32;
          }
          while (v32);
        }
        v27 = 0;
        v26 = 1;
      }
      while ((v29 & 1) != 0);
      v40 = 0;
      v65 = v56[8];
      v66 = v56[12];
      v41 = 1;
      do
      {
        v57 = v41;
        v42 = (unint64_t *)(&v65 + v40);
        v44 = *v42;
        v43 = v42[1];
        v45 = v43 + v44;
        if (v44 < v43 + v44)
        {
          do
          {
            v46 = *(_QWORD *)(v14 + 8 * v44);
            if (v46)
            {
              v47 = *(_QWORD *)(v28 + 8 * v44);
              _PF_Handler_Primitive_GetProperty(v18, v44, v47, *(_QWORD *)(v60 + 8 * v44), v10, v11, v12, v13);
              v49 = v46 == NSKeyValueCoding_NullValue ? 0 : (void *)v46;
              if (v49 != v48)
              {
                v50 = v48;
                if ((!objc_msgSend(v49, "isFault") || (objc_msgSend(v50, "isFault") & 1) == 0)
                  && (objc_msgSend(v50, "isEqual:", v49) & 1) == 0)
                {
                  v51 = (void *)objc_msgSend(v50, "mutableCopy");
                  v61 = 0u;
                  v62 = 0u;
                  v63 = 0u;
                  v64 = 0u;
                  v52 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
                  if (v52)
                  {
                    v53 = v52;
                    v54 = *(_QWORD *)v62;
                    do
                    {
                      for (i = 0; i != v53; ++i)
                      {
                        if (*(_QWORD *)v62 != v54)
                          objc_enumerationMutation(v49);
                        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "applyToSet:", v51);
                      }
                      v53 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
                    }
                    while (v53);
                  }
                  v18 = v58;
                  -[NSManagedObject _updateToManyRelationship:from:to:with:](v58, v47, v50, v51, v50);

                  v28 = v59;
                }
              }
            }
            ++v44;
          }
          while (v44 != v45);
        }
        v41 = 0;
        v40 = 1;
      }
      while ((v57 & 1) != 0);
      *((_DWORD *)v18 + 4) &= ~0x800u;
    }
    else
    {
      -[NSManagedObject _genericUpdateFromSnapshot:](a1, a2);
    }
  }
}

- (id)_orderKeysForRelationshipWithName__:(id)a3
{
  if (-[NSManagedObject isUpdated](self, "isUpdated")
    || -[NSManagedObject isInserted](self, "isInserted")
    || -[NSManagedObject isDeleted](self, "isDeleted"))
  {
    return 0;
  }
  else
  {
    return (id)objc_msgSend(-[NSManagedObject mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", a3), "_orderedObjectsAndKeys");
  }
}

- (BOOL)_updateLocationsOfObjectsToLocationByOrderKey:(id)a3 inRelationshipWithName:(id)a4 error:(id *)a5
{
  if (!-[NSManagedObject isUpdated](self, "isUpdated")
    && !-[NSManagedObject isInserted](self, "isInserted")
    && !-[NSManagedObject isDeleted](self, "isDeleted"))
  {
    return objc_msgSend(-[NSManagedObject mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", a4), "_reorderObjectsToLocationsByOrderKey:error:", a3, a5);
  }
  if (a5)
    *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F4A8B8);
  return 0;
}

- (BOOL)_defaultValidation:(id *)a3 error:(id *)a4
{
  return 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  Class Class;
  objc_class *v6;
  objc_class *Superclass;
  Protocol **v8;
  Protocol **v9;
  uint64_t v10;
  Protocol *v11;
  BOOL isMetaClass;
  char *types;
  objc_method_description MethodDescription;
  Protocol *v15;
  BOOL v16;
  objc_method_description v17;
  id result;
  objc_method_description *Description;
  char *v20;
  unsigned int outCount;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: null selector"), _NSMethodExceptionProem());
  Class = object_getClass(self);
  v6 = Class;
  if (Class)
  {
    Superclass = Class;
    while (1)
    {
      outCount = 0;
      v8 = class_copyProtocolList(Superclass, &outCount);
      v9 = v8;
      if (outCount)
        break;
      if (v8)
LABEL_12:
        free(v9);
      Superclass = class_getSuperclass(Superclass);
      if (!Superclass)
        goto LABEL_14;
    }
    v10 = 0;
    while (1)
    {
      v11 = v9[v10];
      isMetaClass = class_isMetaClass(Superclass);
      MethodDescription = protocol_getMethodDescription(v11, a3, 1, !isMetaClass);
      types = MethodDescription.types;
      if (MethodDescription.name)
        break;
      v15 = v9[v10];
      v16 = class_isMetaClass(Superclass);
      v17 = protocol_getMethodDescription(v15, a3, 0, !v16);
      types = v17.types;
      if (v17.name)
        break;
      if (++v10 >= (unint64_t)outCount)
        goto LABEL_12;
    }
    v20 = types;
    free(v9);
  }
  else
  {
LABEL_14:
    result = class_getInstanceMethod(v6, a3);
    if (!result)
      return result;
    Description = method_getDescription((Method)result);
    if (!Description->name)
      return 0;
    v20 = Description->types;
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", v20);
}

+ (id)_entityName
{
  uint64_t v3;
  void *v4;
  const char *Name;
  id AssociatedObject;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a1, "_PFMOClassFactoryData");
  if (!v3 || (v4 = *(void **)(v3 + 16)) == 0)
  {
    Name = class_getName((Class)a1);
    if (strncmp(Name, "NSManagedObject", 0xFuLL))
    {
      AssociatedObject = objc_getAssociatedObject(a1, &PFEntityNameAssociationKey);
      v7 = objc_msgSend(AssociatedObject, "count");
      if (v7)
      {
        if (v7 == 1)
          return (id)objc_msgSend(AssociatedObject, "lastObject");
      }
      else
      {
        v9 = *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = objc_msgSend((id)objc_msgSend(v9, "persistentStoreCoordinator"), "managedObjectModel");
            if (v10)
            {
              v11 = (void *)v10;
              v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
              v19 = 0u;
              v20 = 0u;
              v21 = 0u;
              v22 = 0u;
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
              if (v13)
              {
                v14 = v13;
                v4 = 0;
                v15 = *(_QWORD *)v20;
                do
                {
                  for (i = 0; i != v14; ++i)
                  {
                    if (*(_QWORD *)v20 != v15)
                      objc_enumerationMutation(v11);
                    v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
                    v18 = objc_msgSend(v17, "managedObjectClassName");
                    if (v18 && objc_msgSend(v12, "isEqualToString:", v18))
                    {
                      if (v4)
                        return 0;
                      v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", objc_msgSend(v17, "name"));
                    }
                  }
                  v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
                }
                while (v14);
                if (v4)
                  objc_setAssociatedObject(a1, &PFEntityNameAssociationKey, (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4), (void *)0x303);
                return v4;
              }
            }
          }
        }
      }
    }
    return 0;
  }
  return v4;
}

+ (BOOL)_isGeneratedClass_1
{
  return 1;
}

+ (id)batchAllocateWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4 count:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  id *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v5 = *(_QWORD *)&a5;
  v25 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = (id *)PF_ALLOCATE_OBJECT_ARRAY(a5);
  v11 = objc_msgSend(a1, "allocBatch:withEntity:count:", v10, a3, v5);
  if ((_DWORD)v11 == (_DWORD)v5)
  {
    if ((*((_BYTE *)a3 + 120) & 4) == 0)
    {
      v22 = objc_msgSend(a3, "managedObjectModel");
      v23 = a3;
      if (v22)
        v23 = (id)objc_msgSend(a3, "managedObjectModel");
      v11 = objc_msgSend(v23, "_setIsEditable:", 0);
    }
    v24 = (uint64_t)&v24;
    MEMORY[0x1E0C80A78](v11);
    v14 = (char *)&v24 - v13;
    if (v5 > 0x200)
      v14 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v24 - v13, 8 * v12);
    v16 = _insertion_fault_handler;
    v17 = +[NSTemporaryObjectID allocateBatch:forEntity:count:](NSTemporaryObjectID, "allocateBatch:forEntity:count:", v14, a3, v5, v24, v25);
    v18 = v17;
    if ((_DWORD)v5 && v17 == (_DWORD)v5)
    {
      v19 = v10;
      v20 = v14;
      do
      {
        v21 = objc_msgSend(*v19, "_initWithEntity:withID:withHandler:withContext:", a3, *(_QWORD *)v20, v16, 0);
        *v19 = (id)v21;
        if (a4)
          objc_msgSend(a4, "insertObject:", v21);
        else
          _PFFaultHandlerFulfillFault(v16, v21, 0, 0, 1);
        v20 += 8;
        ++v19;
        --v9;
      }
      while (v9);
    }
    if (v5 >= 0x201)
      NSZoneFree(0, v14);
    if (v18 == (_DWORD)v5)
      return -[_PFArray initWithObjects:count:andFlags:andContext:]([_PFArray alloc], "initWithObjects:count:andFlags:andContext:", v10, v5, 40, a4);
    else
      return 0;
  }
  else
  {
    PF_FREE_OBJECT_ARRAY(v10);
    return 0;
  }
}

+ (BOOL)_hasOverriddenAwake
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "_PFMOClassFactoryData");
  if (v2)
    LODWORD(v2) = (*(unsigned __int8 *)(v2 + 96) >> 5) & 1;
  return v2;
}

+ (void)_initializePrimitiveAccessorStubs
{
  malloc_zone_t *v2;
  _QWORD *v3;
  malloc_zone_t *v4;

  v2 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone)
    v2 = malloc_default_zone();
  v3 = malloc_type_zone_malloc(v2, 0x190uLL, 0x80040B8603338uLL);
  os_unfair_lock_lock_with_options();
  if (qword_1ECD8DA08)
  {
    v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v4 = malloc_default_zone();
    malloc_zone_free(v4, v3);
    v3 = (_QWORD *)qword_1ECD8DA08;
  }
  else
  {
    qword_1ECD8DA08 = (uint64_t)v3;
  }
  *v3 = _spvfk_0;
  v3[1] = _spvfk_1;
  v3[2] = _spvfk_2;
  v3[3] = _spvfk_3;
  v3[4] = _spvfk_4;
  v3[5] = _spvfk_5;
  v3[6] = _spvfk_6;
  v3[7] = _spvfk_7;
  v3[8] = _spvfk_8;
  v3[9] = _spvfk_9;
  v3[10] = _spvfk_10;
  v3[11] = _spvfk_11;
  v3[12] = _spvfk_12;
  v3[13] = _spvfk_13;
  v3[14] = _spvfk_14;
  v3[15] = _spvfk_15;
  v3[16] = _spvfk_16;
  v3[17] = _spvfk_17;
  v3[18] = _spvfk_18;
  v3[19] = _spvfk_19;
  v3[20] = _spvfk_20;
  v3[21] = _spvfk_21;
  v3[22] = _spvfk_22;
  v3[23] = _spvfk_23;
  v3[24] = _spvfk_24;
  v3[25] = _spvfk_25;
  v3[26] = _spvfk_26;
  v3[27] = _spvfk_27;
  v3[28] = _spvfk_28;
  v3[29] = _spvfk_29;
  v3[30] = _spvfk_30;
  v3[31] = _spvfk_31;
  v3[32] = _spvfk_32;
  v3[33] = _spvfk_33;
  v3[34] = _spvfk_34;
  v3[35] = _spvfk_35;
  v3[36] = _spvfk_36;
  v3[37] = _spvfk_37;
  v3[38] = _spvfk_38;
  v3[39] = _spvfk_39;
  v3[40] = _spvfk_40;
  v3[41] = _spvfk_41;
  v3[42] = _spvfk_42;
  v3[43] = _spvfk_43;
  v3[44] = _spvfk_44;
  v3[45] = _spvfk_45;
  v3[46] = _spvfk_46;
  v3[47] = _spvfk_47;
  v3[48] = _spvfk_48;
  v3[49] = _spvfk_49;
  _MergedGlobals_74 = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD8D9E0);
}

_QWORD *__80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke_2(uint64_t a1, _QWORD *a2, float a3)
{
  unint64_t v4;
  _QWORD v6[6];
  float v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___sharedIMPL_setvfk_core_f_block_invoke;
  v6[3] = &unk_1E1EDE0A0;
  v6[4] = a2;
  v6[5] = v4;
  v7 = a3;
  return _sharedIMPL_setvfk_core_scalar(a2, v4, (uint64_t)v6);
}

@end
