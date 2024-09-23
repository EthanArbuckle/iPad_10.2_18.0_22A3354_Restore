@implementation NSFetchedPropertyDescription

- (void)dealloc
{
  objc_super v3;

  self->_fetchRequest = 0;
  self->_lazyFetchRequestEntityName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSFetchedPropertyDescription;
  -[NSPropertyDescription dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  NSEntityDescription *v7;
  NSString *lazyFetchRequestEntityName;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSFetchedPropertyDescription;
  v5 = -[NSPropertyDescription encodeWithCoder:](&v9, sel_encodeWithCoder_);
  v6 = (void *)MEMORY[0x18D76B4E4](v5);
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchedPropertyDescription fetchRequest](self, "fetchRequest"), CFSTR("NSFetchRequest"));
  v7 = -[NSFetchRequest entity](-[NSFetchedPropertyDescription fetchRequest](self, "fetchRequest"), "entity");
  if (v7)
    lazyFetchRequestEntityName = -[NSEntityDescription name](v7, "name");
  else
    lazyFetchRequestEntityName = self->_lazyFetchRequestEntityName;
  objc_msgSend(a3, "encodeObject:forKey:", lazyFetchRequestEntityName, CFSTR("_NSFetchRequestEntityName"));
  objc_autoreleasePoolPop(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFetchedPropertyDescription)initWithCoder:(id)a3
{
  NSFetchedPropertyDescription *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSFetchedPropertyDescription;
  v4 = -[NSPropertyDescription initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v4->_fetchRequest = (NSFetchRequest *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSFetchRequest"));
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_NSFetchRequestEntityName"));
    if (!-[NSFetchRequest entity](v4->_fetchRequest, "entity"))
    {
      if (v5 && (objc_msgSend(v5, "isNSString") & 1) == 0)
      {
        objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4A778));

        return 0;
      }
      else
      {
        v4->_lazyFetchRequestEntityName = (NSString *)v5;
      }
    }
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  NSEntityDescription *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSFetchedPropertyDescription;
  v4 = -[NSPropertyDescription copyWithZone:](&v9, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = (void *)-[NSFetchRequest copy](self->_fetchRequest, "copy");
    v4[12] = v5;
    objc_msgSend(v5, "setEntity:", 0);
    v6 = -[NSFetchRequest entity](self->_fetchRequest, "entity");
    if (v6)
      v7 = -[NSString copy](-[NSEntityDescription name](v6, "name"), "copy");
    else
      v7 = -[NSString copy](self->_lazyFetchRequestEntityName, "copy");
    v4[13] = v7;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  NSFetchRequest *v8;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v12 = v3;
    v13 = v4;
    v11.receiver = self;
    v11.super_class = (Class)NSFetchedPropertyDescription;
    LODWORD(v7) = -[NSPropertyDescription isEqual:](&v11, sel_isEqual_);
    if ((_DWORD)v7)
    {
      v8 = -[NSFetchedPropertyDescription fetchRequest](self, "fetchRequest");
      v7 = objc_msgSend(a3, "fetchRequest");
      if (v8 == (NSFetchRequest *)v7)
      {
        LOBYTE(v7) = 1;
      }
      else
      {
        v9 = v7;
        LOBYTE(v7) = 0;
        if (v8 && v9)
          LOBYTE(v7) = -[NSFetchRequest isEqual:](v8, "isEqual:");
      }
    }
  }
  return v7;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSFetchedPropertyDescription;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, fetchRequest %@"), -[NSPropertyDescription description](&v3, sel_description), -[NSFetchedPropertyDescription fetchRequest](self, "fetchRequest"));
}

- (NSFetchRequest)fetchRequest
{
  NSFetchRequest *fetchRequest;
  NSFetchRequest *v4;
  NSManagedObjectModel *v6;
  uint64_t v7;

  if (!self->_lazyFetchRequestEntityName)
    return self->_fetchRequest;
  fetchRequest = self->_fetchRequest;
  if (!fetchRequest || -[NSFetchRequest entity](fetchRequest, "entity"))
    return self->_fetchRequest;
  v4 = (NSFetchRequest *)(id)-[NSFetchRequest copy](self->_fetchRequest, "copy");
  v6 = -[NSEntityDescription managedObjectModel](-[NSPropertyDescription entity](self, "entity"), "managedObjectModel");
  if (v6)
    v7 = -[NSMutableDictionary objectForKey:](v6->_entities, "objectForKey:", self->_lazyFetchRequestEntityName);
  else
    v7 = 0;
  -[NSFetchRequest setEntity:](v4, "setEntity:", v7);
  return v4;
}

- (void)setFetchRequest:(NSFetchRequest *)fetchRequest
{
  NSManagedObjectModel *v5;
  BOOL v6;
  NSFetchRequest *v7;
  NSManagedObjectModel *v8;
  uint64_t v9;

  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self->_fetchRequest != fetchRequest)
  {
    if (fetchRequest)
    {
      v5 = -[NSEntityDescription managedObjectModel](-[NSPropertyDescription entity](self, "entity"), "managedObjectModel");
      if (v5 != -[NSEntityDescription managedObjectModel](-[NSFetchRequest entity](fetchRequest, "entity"), "managedObjectModel"))objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Can't use fetch request with fetched property description (entity model mismatch)."));
    }

    fetchRequest = fetchRequest;
    self->_fetchRequest = fetchRequest;
  }
  if (self->_lazyFetchRequestEntityName)
    v6 = fetchRequest == 0;
  else
    v6 = 1;
  if (!v6 && !-[NSFetchRequest entity](fetchRequest, "entity"))
  {
    v7 = self->_fetchRequest;
    v8 = -[NSEntityDescription managedObjectModel](-[NSPropertyDescription entity](self, "entity"), "managedObjectModel");
    if (v8)
      v9 = -[NSMutableDictionary objectForKey:](v8->_entities, "objectForKey:", self->_lazyFetchRequestEntityName);
    else
      v9 = 0;
    -[NSFetchRequest setEntity:](v7, "setEntity:", v9);
  }

  self->_lazyFetchRequestEntityName = 0;
}

- (BOOL)isTransient
{
  return 1;
}

- (BOOL)isReadOnly
{
  return 1;
}

- (unint64_t)_propertyType
{
  return 3;
}

- (void)_createCachesAndOptimizeState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSFetchedPropertyDescription;
  -[NSPropertyDescription _createCachesAndOptimizeState](&v3, sel__createCachesAndOptimizeState);
  -[NSFetchedPropertyDescription setFetchRequest:](self, "setFetchRequest:", -[NSFetchedPropertyDescription fetchRequest](self, "fetchRequest"));
  -[NSFetchRequest allowEvaluation](self->_fetchRequest, "allowEvaluation");
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  uint64_t v16;
  unsigned int v17;
  objc_super v18;

  _writeInt32IntoData(a3, 0);
  v16 = objc_msgSend(a3, "length") - 4;
  v18.receiver = self;
  v18.super_class = (Class)NSFetchedPropertyDescription;
  -[NSPropertyDescription _appendPropertyFieldsToData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:entitiesSlots:](&v18, sel__appendPropertyFieldsToData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_entitiesSlots_, a3, a4, a5, a6, a7, a8);
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a9, "objectForKey:", self->_fetchRequest), "unsignedIntValue"));
  v17 = bswap32(objc_msgSend(a3, "length") - v16);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v16, 4, &v17);
}

@end
