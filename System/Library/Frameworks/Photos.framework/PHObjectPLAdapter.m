@implementation PHObjectPLAdapter

- (PHObjectPLAdapter)initWithPLManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v8;
  id v9;
  PHObjectPLAdapter *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  char v21;
  SEL v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PHObjectPLAdapter;
  v10 = -[PHObjectPLAdapter init](&v23, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "photoLibrary");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v8, "photoLibrary");
      v22 = a2;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pathManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "libraryURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "photoLibraryURL");
      v16 = a4;
      v17 = v9;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v15, "isEqual:", v18);

      v9 = v17;
      a4 = v16;

      if ((v21 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v22, v10, CFSTR("PHObjectPLAdapter.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("managedObject.photoLibrary == nil || [managedObject.photoLibrary.pathManager.libraryURL isEqual:photoLibrary.photoLibraryURL]"));

      }
    }
    objc_storeStrong((id *)&v10->_backingManagedObject, a3);
    objc_storeStrong((id *)&v10->_photoLibrary, a4);
  }

  return v10;
}

- (id)newObjectWithPropertySets:(id)a3
{
  return 0;
}

- (id)mutableAccessingCopy
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPLManagedObject:photoLibrary:", self->_backingManagedObject, self->_photoLibrary);
  v4 = -[NSMutableOrderedSet mutableCopy](self->_ignoredKeys, "mutableCopy");
  v5 = (void *)v3[3];
  v3[3] = v4;

  v6 = -[NSMutableDictionary mutableCopy](self->_modifiedKeyValues, "mutableCopy");
  v7 = (void *)v3[4];
  v3[4] = v6;

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_ignoredKeys, "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_modifiedKeyValues, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[PLManagedObject valueForKeyPath:](self->_backingManagedObject, "valueForKeyPath:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  NSMutableOrderedSet *ignoredKeys;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  id v8;

  v4 = a3;
  ignoredKeys = self->_ignoredKeys;
  v8 = v4;
  if (!ignoredKeys)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v7 = self->_ignoredKeys;
    self->_ignoredKeys = v6;

    v4 = v8;
    ignoredKeys = self->_ignoredKeys;
  }
  -[NSMutableOrderedSet addObject:](ignoredKeys, "addObject:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_modifiedKeyValues, "removeObjectForKey:", v8);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *modifiedKeyValues;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  modifiedKeyValues = self->_modifiedKeyValues;
  if (!modifiedKeyValues)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_modifiedKeyValues;
    self->_modifiedKeyValues = v8;

    modifiedKeyValues = self->_modifiedKeyValues;
  }
  -[NSMutableDictionary setObject:forKey:](modifiedKeyValues, "setObject:forKey:", v10, v6);
  -[NSMutableOrderedSet removeObject:](self->_ignoredKeys, "removeObject:", v6);

}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  if (a3)
    -[PHObjectPLAdapter setObject:forKey:](self, "setObject:forKey:", a3, a4);
  else
    -[PHObjectPLAdapter removeObjectForKey:](self, "removeObjectForKey:", a4);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PLManagedObject)backingManagedObject
{
  return self->_backingManagedObject;
}

- (NSMutableOrderedSet)ignoredKeys
{
  return self->_ignoredKeys;
}

- (void)setIgnoredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredKeys, a3);
}

- (NSMutableDictionary)modifiedKeyValues
{
  return self->_modifiedKeyValues;
}

- (void)setModifiedKeyValues:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedKeyValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedKeyValues, 0);
  objc_storeStrong((id *)&self->_ignoredKeys, 0);
  objc_storeStrong((id *)&self->_backingManagedObject, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
