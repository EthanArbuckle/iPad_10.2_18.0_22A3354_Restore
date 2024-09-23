@implementation NSBasicObjectID

+ (char)generatedNameSuffix
{
  return "id";
}

- (NSBasicObjectID)initWithObject:(id)a3
{
  NSBasicObjectID *v4;
  Class Class;
  unsigned int *IndexedIvars;
  unsigned int v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSBasicObjectID;
  v4 = -[NSBasicObjectID init](&v9, sel_init);
  if (v4)
  {
    v4->_referenceData = a3;
    Class = object_getClass(v4);
    IndexedIvars = (unsigned int *)object_getIndexedIvars(Class);
    do
      v7 = __ldxr(IndexedIvars);
    while (__stxr(v7 + 1, IndexedIvars));
  }
  return v4;
}

- (void)dealloc
{

  self->_referenceData = 0;
  _PFDeallocateObject(self);
}

- (id)_retainedURIString
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = -[_NSCoreManagedObjectID _storeIdentifier](self, "_storeIdentifier");
  if (v3)
    v4 = v3;
  else
    v4 = &stru_1E1EE23F0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@://%@/%@/p%@"), CFSTR("x-coredata"), v4, objc_msgSend(-[_NSCoreManagedObjectID entity](self, "entity"), "name"), self->_referenceData);
}

- (id)_referenceData
{
  return self->_referenceData;
}

@end
