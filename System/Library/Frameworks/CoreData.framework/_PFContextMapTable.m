@implementation _PFContextMapTable

- (_DWORD)initWithWeaksReferences:(_DWORD *)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)_PFContextMapTable;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
      result[12] = result[12] & 0xFFFFFFFE | a2;
  }
  return result;
}

- (_QWORD)setForUseWithCoordinator:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[7];
    if (v4)

    if (a2)
      v5 = *(void **)(a2 + 96);
    else
      v5 = 0;
    result = v5;
    v3[7] = result;
    if (result)
      v6 = result[6];
    else
      v6 = 0;
    v3[1] = v6;
  }
  return result;
}

- (unint64_t)getAllObjects:(unint64_t)result
{
  unint64_t v3;
  const __CFDictionary *v4;
  const void **v5;
  CFIndex Count;
  CFIndex v7;
  unint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  CFIndex v11;
  CFIndex v12;
  unint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  CFIndex v16;
  CFIndex v17;

  if (result)
  {
    v3 = result;
    v4 = *(const __CFDictionary **)(result + 16);
    v5 = a2;
    if (v4)
    {
      Count = CFDictionaryGetCount(v4);
      v5 = a2;
      if (Count)
      {
        v7 = Count;
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(v3 + 16), 0, a2);
        v5 = &a2[v7];
      }
    }
    if (*(_QWORD *)(v3 + 24) && *(_QWORD *)(v3 + 8))
    {
      v8 = 0;
      do
      {
        v9 = *(_QWORD *)(v3 + 24);
        v10 = *(const __CFDictionary **)(v9 + 8 * v8);
        if (v10)
        {
          v11 = CFDictionaryGetCount(*(CFDictionaryRef *)(v9 + 8 * v8));
          if (v11)
          {
            v12 = v11;
            CFDictionaryGetKeysAndValues(v10, 0, v5);
            v5 += v12;
          }
        }
        ++v8;
      }
      while (v8 < *(_QWORD *)(v3 + 8));
    }
    if (*(_QWORD *)(v3 + 32) && *(_QWORD *)(v3 + 8))
    {
      v13 = 0;
      do
      {
        v14 = *(_QWORD *)(v3 + 32);
        v15 = *(const __CFDictionary **)(v14 + 8 * v13);
        if (v15)
        {
          v16 = CFDictionaryGetCount(*(CFDictionaryRef *)(v14 + 8 * v13));
          if (v16)
          {
            v17 = v16;
            CFDictionaryGetKeysAndValues(v15, 0, v5);
            v5 += v17;
          }
        }
        ++v13;
      }
      while (v13 < *(_QWORD *)(v3 + 8));
    }
    return (unint64_t)((char *)v5 - (char *)a2) >> 3;
  }
  return result;
}

- (void)dealloc
{
  __CFDictionary *objectsByTemporaryID;
  unint64_t slotLimit;
  unint64_t i;
  __CFDictionary *v6;
  malloc_zone_t *v7;
  unint64_t v8;
  unint64_t j;
  __CFDictionary *v10;
  malloc_zone_t *v11;
  unint64_t *capacitiesFor64bitPKMappings;
  malloc_zone_t *v13;
  objc_super v14;

  if (self)
  {
    objectsByTemporaryID = self->_objectsByTemporaryID;
    if (objectsByTemporaryID)
    {
      CFRelease(objectsByTemporaryID);
      self->_objectsByTemporaryID = 0;
    }
    if (self->_objectsByPermanentObjectID)
    {
      slotLimit = self->_slotLimit;
      if (slotLimit)
      {
        for (i = 0; i < slotLimit; ++i)
        {
          v6 = self->_objectsByPermanentObjectID[i];
          if (v6)
          {
            CFRelease(v6);
            slotLimit = self->_slotLimit;
          }
        }
      }
      v7 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone)
        v7 = malloc_default_zone();
      malloc_zone_free(v7, self->_objectsByPermanentObjectID);
      self->_objectsByPermanentObjectID = 0;
    }
    if (self->_objectsBy64bitPKID)
    {
      v8 = self->_slotLimit;
      if (v8)
      {
        for (j = 0; j < v8; ++j)
        {
          v10 = self->_objectsBy64bitPKID[j];
          if (v10)
          {
            CFRelease(v10);
            v8 = self->_slotLimit;
          }
        }
      }
      v11 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone)
        v11 = malloc_default_zone();
      malloc_zone_free(v11, self->_objectsBy64bitPKID);
      self->_objectsByPermanentObjectID = 0;
    }
    capacitiesFor64bitPKMappings = self->_capacitiesFor64bitPKMappings;
    if (capacitiesFor64bitPKMappings)
    {
      v13 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone)
      {
        v13 = malloc_default_zone();
        capacitiesFor64bitPKMappings = self->_capacitiesFor64bitPKMappings;
      }
      malloc_zone_free(v13, capacitiesFor64bitPKMappings);
      self->_capacitiesFor64bitPKMappings = 0;
    }
    self->_slotLimit = 0;

    self->_modelMap = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)_PFContextMapTable;
  -[_PFContextMapTable dealloc](&v14, sel_dealloc);
}

@end
