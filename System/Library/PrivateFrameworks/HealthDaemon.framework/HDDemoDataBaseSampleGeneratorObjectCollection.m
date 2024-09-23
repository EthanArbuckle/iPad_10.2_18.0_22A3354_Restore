@implementation HDDemoDataBaseSampleGeneratorObjectCollection

- (HDDemoDataBaseSampleGeneratorObjectCollection)init
{
  HDDemoDataBaseSampleGeneratorObjectCollection *v2;
  NSMutableSet *v3;
  NSMutableSet *objectsFromPhone;
  NSMutableSet *v5;
  NSMutableSet *objectsFromWatch;
  NSMutableDictionary *v7;
  NSMutableDictionary *objectsFromPhoneApps;
  NSMutableDictionary *v9;
  NSMutableDictionary *objectUUIDToAssocatedObjectUUIDs;
  NSMutableDictionary *v11;
  NSMutableDictionary *objectUUIDToLooseAssocatedObjectUUIDs;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HDDemoDataBaseSampleGeneratorObjectCollection;
  v2 = -[HDDemoDataBaseSampleGeneratorObjectCollection init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    objectsFromPhone = v2->_objectsFromPhone;
    v2->_objectsFromPhone = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    objectsFromWatch = v2->_objectsFromWatch;
    v2->_objectsFromWatch = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objectsFromPhoneApps = v2->_objectsFromPhoneApps;
    v2->_objectsFromPhoneApps = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objectUUIDToAssocatedObjectUUIDs = v2->_objectUUIDToAssocatedObjectUUIDs;
    v2->_objectUUIDToAssocatedObjectUUIDs = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objectUUIDToLooseAssocatedObjectUUIDs = v2->_objectUUIDToLooseAssocatedObjectUUIDs;
    v2->_objectUUIDToLooseAssocatedObjectUUIDs = v11;

  }
  return v2;
}

- (void)addObjectFromPhone:(id)a3
{
  -[NSMutableSet addObject:](self->_objectsFromPhone, "addObject:", a3);
}

- (void)addObjectsFromPhone:(id)a3
{
  -[NSMutableSet addObjectsFromArray:](self->_objectsFromPhone, "addObjectsFromArray:", a3);
}

- (void)addObjects:(id)a3 fromPhoneAppWithBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_objectsFromPhoneApps, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_objectsFromPhoneApps, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);
  }
  else
  {
    v8 = (void *)objc_msgSend(v9, "mutableCopy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_objectsFromPhoneApps, "setObject:forKeyedSubscript:", v8, v6);
  }

}

- (void)addObjectFromWatch:(id)a3
{
  -[NSMutableSet addObject:](self->_objectsFromWatch, "addObject:", a3);
}

- (void)addObjectsFromWatch:(id)a3
{
  -[NSMutableSet addObjectsFromArray:](self->_objectsFromWatch, "addObjectsFromArray:", a3);
}

- (id)objectsFromPhone
{
  return (id)-[NSMutableSet allObjects](self->_objectsFromPhone, "allObjects");
}

- (id)objectsFromWatch
{
  return (id)-[NSMutableSet allObjects](self->_objectsFromWatch, "allObjects");
}

- (id)objectsFromPhoneApps
{
  void *v3;
  NSMutableDictionary *objectsFromPhoneApps;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_objectsFromPhoneApps, "count"));
  objectsFromPhoneApps = self->_objectsFromPhoneApps;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__HDDemoDataBaseSampleGeneratorObjectCollection_objectsFromPhoneApps__block_invoke;
  v7[3] = &unk_1E6D10E40;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](objectsFromPhoneApps, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __69__HDDemoDataBaseSampleGeneratorObjectCollection_objectsFromPhoneApps__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (void)setAssociatedObjectUUIDs:(id)a3 forObjectUUID:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_objectUUIDToAssocatedObjectUUIDs, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)enumerateObjectAssociations:(id)a3
{
  id v4;
  NSMutableDictionary *objectUUIDToAssocatedObjectUUIDs;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objectUUIDToAssocatedObjectUUIDs = self->_objectUUIDToAssocatedObjectUUIDs;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__HDDemoDataBaseSampleGeneratorObjectCollection_enumerateObjectAssociations___block_invoke;
  v7[3] = &unk_1E6D10E68;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](objectUUIDToAssocatedObjectUUIDs, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __77__HDDemoDataBaseSampleGeneratorObjectCollection_enumerateObjectAssociations___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setLooseAssociatedObjectUUIDs:(id)a3 forObjectUUID:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_objectUUIDToLooseAssocatedObjectUUIDs, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)enumerateLooseObjectAssociations:(id)a3
{
  id v4;
  NSMutableDictionary *objectUUIDToLooseAssocatedObjectUUIDs;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objectUUIDToLooseAssocatedObjectUUIDs = self->_objectUUIDToLooseAssocatedObjectUUIDs;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__HDDemoDataBaseSampleGeneratorObjectCollection_enumerateLooseObjectAssociations___block_invoke;
  v7[3] = &unk_1E6D10E68;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](objectUUIDToLooseAssocatedObjectUUIDs, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __82__HDDemoDataBaseSampleGeneratorObjectCollection_enumerateLooseObjectAssociations___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectUUIDToLooseAssocatedObjectUUIDs, 0);
  objc_storeStrong((id *)&self->_objectUUIDToAssocatedObjectUUIDs, 0);
  objc_storeStrong((id *)&self->_objectsFromPhoneApps, 0);
  objc_storeStrong((id *)&self->_objectsFromWatch, 0);
  objc_storeStrong((id *)&self->_objectsFromPhone, 0);
}

@end
