@implementation NSPersistentCacheRow

- (void)release
{
  int *p_cd_rc;
  int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 - 1, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    self->_cd_rc += 0x20000000;
    -[NSPersistentCacheRow dealloc](self, "dealloc");
  }
}

- (_QWORD)_initializeRelationshipCaches
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v1 = result + 3;
    if (!result[3])
    {
      result = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "objectID"), "entity"), "_propertyRangesByType");
      v2 = result[19];
      if (v2)
      {
        v3 = 3 * v2;
        result = PF_CALLOC_OBJECT_ARRAY(3 * v2 + 1);
        *v1 = result;
        result[v3] = result;
      }
      else
      {
        *v1 = v1;
      }
    }
  }
  return result;
}

- (double)timestampForProperty:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  double result;

  if (!a1)
    return 0.0;
  if (!*(_QWORD *)(a1 + 24))
    return *(double *)&NSSQLDistantPastTimeInterval;
  v4 = *(_QWORD *)(objc_msgSend((id)objc_msgSend(a2, "entity"), "_propertyRangesByType") + 144);
  v5 = objc_msgSend(a2, "_entitysReferenceID");
  result = *(double *)&NSSQLDistantPastTimeInterval;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 24) + 24 * (v5 - v4)))
    return *(double *)(*(_QWORD *)(a1 + 24) + 24 * (v5 - v4));
  return result;
}

- (NSPersistentCacheRow)retain
{
  int *p_cd_rc;
  unsigned int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 + 1, (unsigned int *)p_cd_rc));
  return self;
}

- (void)toManyOffsetForProperty:(void *)result
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(a2, "entity");
    v5 = (void *)objc_msgSend((id)objc_msgSend(v3, "objectID"), "entity");
    v6 = objc_msgSend(a2, "_entitysReferenceID");
    if (v4 == v5)
    {
      return (void *)(v6 - *(_QWORD *)(objc_msgSend(v4, "_propertyRangesByType") + 144));
    }
    else
    {
      v7 = *(_QWORD *)(objc_msgSend(v5, "_propertyRangesByType") + 144);
      return (void *)(objc_msgSend(v5, "_offsetRelationshipIndex:fromSuperEntity:andIsToMany:", v6, v4, objc_msgSend(a2, "isToMany"))- v7);
    }
  }
  return result;
}

- (void)setRelatedObjectIDs:(_QWORD *)a1 forProperty:(void *)a2 options:(void *)a3 andTimestamp:(double)a4
{
  void *v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (a1)
  {
    v6 = a2;
    if (a1[3])
    {
      if (a2)
        goto LABEL_4;
    }
    else
    {
      -[NSPersistentCacheRow _initializeRelationshipCaches](a1);
      if (v6)
      {
LABEL_4:
        if (!objc_msgSend(v6, "count"))
          v6 = (void *)NSArray_EmptyArray;
      }
    }
    v8 = -[NSPersistentCacheRow toManyOffsetForProperty:](a1, a3);
    v9 = 3 * (_QWORD)v8;
    *(double *)(a1[3] + 24 * (_QWORD)v8) = a4;
    v10 = 3 * (_QWORD)v8 + 1;
    v11 = *(void **)(a1[3] + 8 * v10);
    if (v11 != v6)
    {
      *(_QWORD *)(a1[3] + 8 * v10) = v6;

      v12 = a1[3] + 8 * v9;
      v13 = *(void **)(v12 + 16);
      *(_QWORD *)(v12 + 16) = 0;

    }
  }
}

- (_QWORD)copyRelationshipCachesFrom:(_QWORD *)result
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;

  if (result)
  {
    v3 = *(_QWORD **)(a2 + 24);
    if (v3)
    {
      v4 = result;
      v5 = (_QWORD *)result[3];
      if (v3 != v5)
      {
        if (!v5)
        {
          result = -[NSPersistentCacheRow _initializeRelationshipCaches](result);
          v5 = (_QWORD *)v4[3];
          v3 = *(_QWORD **)(a2 + 24);
        }
        if ((_QWORD *)*v5 != v5)
        {
          v6 = 2;
          do
          {
            v5[v6 - 2] = v3[v6 - 2];
            v7 = (void *)v5[v6 - 1];
            if (v7 != (void *)v3[v6 - 1])
            {

              result = (id)v3[v6 - 1];
              v5[v6 - 1] = result;
            }
            v8 = (void *)v5[v6];
            if (v8 != (void *)v3[v6])
            {

              result = (id)v3[v6];
              v5[v6] = result;
            }
            v9 = (_QWORD *)v5[v6 + 1];
            v6 += 3;
          }
          while (v9 != v5);
        }
      }
    }
  }
  return result;
}

- (NSPersistentCacheRow)initWithOptions:(unsigned int)a3 andTimestamp:(double)a4
{
  NSPersistentCacheRow *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSPersistentCacheRow;
  result = -[NSPersistentCacheRow init](&v6, sel_init, *(_QWORD *)&a3);
  if (result)
  {
    result->_birth = a4;
    result->_toManyMap = 0;
  }
  return result;
}

- (void)setAncillaryOrderKeys:(void *)a3 forProperty:options:andTimestamp:
{
  void *v4;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a1)
  {
    v4 = a2;
    if (a1[3])
    {
      if (a2)
        goto LABEL_4;
    }
    else
    {
      -[NSPersistentCacheRow _initializeRelationshipCaches](a1);
      if (v4)
      {
LABEL_4:
        if (!objc_msgSend(v4, "count"))
          v4 = (void *)NSArray_EmptyArray;
      }
    }
    v6 = *(_QWORD *)(objc_msgSend((id)objc_msgSend(a3, "entity"), "_propertyRangesByType") + 144);
    v7 = 3 * (objc_msgSend(a3, "_entitysReferenceID") - v6) + 2;
    if (*(void **)(a1[3] + 8 * v7) != v4)
    {
      v8 = *(id *)(a1[3] + 8 * v7);
      *(_QWORD *)(a1[3] + 8 * v7) = v4;

    }
  }
}

- (uint64_t)ancillaryOrderKeysForProperty:(uint64_t)result
{
  uint64_t v2;
  uint64_t v4;

  if (result)
  {
    v2 = result;
    if (*(_QWORD *)(result + 24))
    {
      v4 = *(_QWORD *)(objc_msgSend((id)objc_msgSend(a2, "entity"), "_propertyRangesByType") + 144);
      return *(_QWORD *)(*(_QWORD *)(v2 + 24) + 24 * (objc_msgSend(a2, "_entitysReferenceID") - v4) + 16);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (unint64_t)retainCount
{
  return self->_cd_rc + 1;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

- (void)dealloc
{
  id *toManyMap;
  uint64_t v4;
  id *v5;

  toManyMap = self->_toManyMap;
  if (toManyMap)
  {
    self->_toManyMap = 0;
    if (*toManyMap != toManyMap)
    {
      v4 = 0;
      do
      {
        v5 = &toManyMap[v4];

        v4 += 3;
      }
      while (v5[3] != toManyMap);
      if (v4)
        PF_FREE_OBJECT_ARRAY(toManyMap);
    }
  }
  _PFDeallocateObject(self);
}

- (id)objectID
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (unint64_t)version
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (_QWORD)updateMissingRelationshipCachesFromOriginal:(_QWORD *)result
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    v3 = *(_QWORD **)(a2 + 24);
    if (v3)
    {
      v4 = result;
      v5 = (_QWORD *)result[3];
      if (v3 != v5)
      {
        if (!v5)
        {
          result = -[NSPersistentCacheRow _initializeRelationshipCaches](result);
          v3 = *(_QWORD **)(a2 + 24);
        }
        v6 = (_QWORD *)*v3;
        if ((_QWORD *)*v3 != v3)
        {
          v7 = 0;
          do
          {
            v8 = v4[3];
            if (!*(_QWORD *)(v8 + v7 * 8 + 8))
            {
              *(_QWORD *)(v8 + v7 * 8) = v6;
              *(_QWORD *)(v4[3] + v7 * 8 + 8) = (id)v3[v7 + 1];
              result = (id)v3[v7 + 2];
              *(_QWORD *)(v4[3] + v7 * 8 + 16) = result;
            }
            v6 = (_QWORD *)v3[v7 + 3];
            v7 += 3;
          }
          while (v6 != v3);
        }
      }
    }
  }
  return result;
}

- (const)knownKeyValuesPointer
{
  return 0;
}

@end
