@implementation _NSScalarObjectID

- (id)_retainedURIString
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = -[_NSCoreManagedObjectID _storeIdentifier](self, "_storeIdentifier");
  if (v3)
    v4 = v3;
  else
    v4 = &stru_1E1EE23F0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@://%@/%@/p%qu"), CFSTR("x-coredata"), v4, objc_msgSend(-[_NSCoreManagedObjectID entity](self, "entity"), "name"), -[_NSScalarObjectID _referenceData64](self, "_referenceData64"));
}

- (BOOL)_preferReferenceData64
{
  return 1;
}

- (id)_referenceData
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_NSScalarObjectID _referenceData64](self, "_referenceData64"));
}

- (int64_t)_referenceData64
{
  Class Class;

  Class = object_getClass(self);
  if ((*((_BYTE *)object_getIndexedIvars(Class) + 4) & 1) != 0)
    return (unint64_t)self[1].super.super.super.isa >> 16;
  else
    return (int64_t)self[2].super.super.super.isa;
}

- (_NSScalarObjectID)initWithPK64:(int64_t)a3
{
  _NSScalarObjectID *v4;
  _NSScalarObjectID *v5;
  Class Class;
  unsigned int *IndexedIvars;
  unsigned int v8;
  unint64_t v9;
  _NSScalarObjectID *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_NSScalarObjectID;
  v4 = -[_NSScalarObjectID init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    Class = object_getClass(v4);
    IndexedIvars = (unsigned int *)object_getIndexedIvars(Class);
    do
      v8 = __ldxr(IndexedIvars);
    while (__stxr(v8 + 1, IndexedIvars));
    v9 = _PFSetPrimaryKey((unint64_t)v5, a3);
    if (v5 != (_NSScalarObjectID *)v9)
    {
      v10 = (_NSScalarObjectID *)v9;
      _PFfastOidRelease(v9, (unint64_t)v5);
      return v10;
    }
  }
  return v5;
}

- (int64_t)compare:(id)a3
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  int64_t result;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_19;
  v5 = -[_NSCoreManagedObjectID _storeIdentifier](self, "_storeIdentifier");
  v6 = objc_msgSend(a3, "_storeIdentifier");
  v7 = -[_NSCoreManagedObjectID entity](self, "entity");
  if (v7)
  {
    if ((v7[15] & 4) != 0)
    {
      v8 = (void *)v7[9];
    }
    else
    {
      do
      {
        v8 = v7;
        v7 = (_QWORD *)objc_msgSend(v7, "superentity");
      }
      while (v7);
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(a3, "entity");
  if (v9)
  {
    if ((*(_BYTE *)(v9 + 120) & 4) != 0)
    {
      v10 = *(void **)(v9 + 72);
    }
    else
    {
      do
      {
        v10 = (void *)v9;
        v9 = objc_msgSend((id)v9, "superentity");
      }
      while (v9);
    }
  }
  else
  {
    v10 = 0;
  }
  if (v5 == (id)v6 && v8 == v10)
  {
    v11 = -[_NSScalarObjectID _referenceData64](self, "_referenceData64");
    v12 = objc_msgSend(a3, "_referenceData64");
    return (v11 > v12) - (unint64_t)(v11 < v12);
  }
  if (v5 == (id)v6)
  {
    v16 = objc_msgSend(v8, "name");
    v15 = objc_msgSend(v10, "name");
    v14 = (void *)v16;
  }
  else
  {
    v14 = v5;
    v15 = v6;
  }
  result = objc_msgSend(v14, "compare:", v15);
  if (!result)
  {
LABEL_19:
    v17.receiver = self;
    v17.super_class = (Class)_NSScalarObjectID;
    return -[NSManagedObjectID compare:](&v17, sel_compare_, a3);
  }
  return result;
}

@end
