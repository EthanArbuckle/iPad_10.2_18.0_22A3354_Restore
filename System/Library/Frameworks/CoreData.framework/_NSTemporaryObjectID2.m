@implementation _NSTemporaryObjectID2

+ (id)initWithEntity:(id)a3 andUUIDString:(id)a4
{
  void *v7;
  void *v8;
  const char *v9;
  int v10;
  int v11;
  _QWORD *v12;
  uuid_t uu;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)objc_msgSend(a4, "length") < 0x25)
  {
    v9 = (const char *)objc_msgSend(a4, "UTF8String");
    v10 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend(a4, "substringToIndex:", 36);
    v8 = (void *)objc_msgSend(a4, "substringFromIndex:", 36);
    v9 = (const char *)objc_msgSend(v7, "UTF8String");
    v10 = objc_msgSend(v8, "intValue");
  }
  memset(uu, 0, sizeof(uu));
  v11 = uuid_parse(v9, uu);
  v12 = 0;
  if (!v11)
  {
    if (*(_QWORD *)uu == *(_QWORD *)(qword_1ECD8D810 + 8) && *(_QWORD *)&uu[8] == *(_QWORD *)(qword_1ECD8D810 + 16))
    {
      v12 = _PFAllocateObject((Class)_NSTemporaryObjectID_Default_Class, 0);
    }
    else
    {
      v12 = _PFAllocateObject((Class)a1, 0);
      v12[4] = -[_NS128bitWrapper initWithBytes:]((char *)[_NS128bitWrapper alloc], uu);
    }
    v12[2] = a3;
    *((_DWORD *)v12 + 3) = v10;
  }
  return v12;
}

- (void)dealloc
{
  _NS128bitWrapper *uuid128;

  self->_store = 0;
  uuid128 = self->_uuid128;
  if (uuid128 != (_NS128bitWrapper *)qword_1ECD8D810)

  self->_uuid128 = 0;
  _PFDeallocateObject(self);
}

- (unint64_t)hash
{
  unsigned int counter;

  counter = self->super._counter;
  if (counter)
    return __rbit32(counter);
  else
    return -[_NS128bitWrapper hash](self->_uuid128, "hash");
}

- (id)_storeIdentifier
{
  return (id)objc_msgSend(self->_store, "identifier");
}

- (id)persistentStore
{
  return self->_store;
}

- (BOOL)_isPersistentStoreAlive
{
  return objc_msgSend(self->_store, "_isPersistentStoreAlive");
}

- (void)_setPersistentStore:(id)a3
{
  id store;

  store = self->_store;
  if (store != a3)
  {

    self->_store = a3;
  }
}

- (BOOL)isEqual:(id)a3
{
  Class Class;
  _NS128bitWrapper *uuid128;

  if (self != a3)
  {
    if (!a3)
      return 0;
    Class = object_getClass(self);
    if (Class != (Class)objc_opt_class() || self->super._counter != *((_DWORD *)a3 + 3))
      return 0;
    uuid128 = self->_uuid128;
    if (uuid128 != *((_NS128bitWrapper **)a3 + 4))
      return -[_NS128bitWrapper isEqual:](uuid128, "isEqual:");
  }
  return 1;
}

- (id)_referenceData
{
  return self->_uuid128;
}

@end
