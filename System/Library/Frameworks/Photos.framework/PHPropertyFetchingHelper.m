@implementation PHPropertyFetchingHelper

- (PHPropertyFetchingHelper)initWithObjectIDs:(id)a3 propertyNamesByEntityName:(id)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHPropertyFetchingHelper *v11;
  PHPropertyFetchingHelper *v12;
  uint64_t v13;
  NSDictionary *fetchedPropertyNamesByEntityName;
  uint64_t v15;
  NSDictionary *propertyValuesByOID;
  _PHDictionaryKeyValueWrapper *v17;
  _PHDictionaryKeyValueWrapper *lock_dictionaryWrapper;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PHPropertyFetchingHelper;
  v11 = -[PHPropertyFetchingHelper init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a5);
    v13 = objc_msgSend(v9, "copy");
    fetchedPropertyNamesByEntityName = v12->_fetchedPropertyNamesByEntityName;
    v12->_fetchedPropertyNamesByEntityName = (NSDictionary *)v13;

    objc_msgSend(v10, "fetchPropertiesByOID:propertyNamesByEntityName:", v8, v9);
    v15 = objc_claimAutoreleasedReturnValue();
    propertyValuesByOID = v12->_propertyValuesByOID;
    v12->_propertyValuesByOID = (NSDictionary *)v15;

    v12->_lock._os_unfair_lock_opaque = 0;
    v17 = -[_PHDictionaryKeyValueWrapper initWithFetchedPropertyNamesByEntityName:]([_PHDictionaryKeyValueWrapper alloc], "initWithFetchedPropertyNamesByEntityName:", v9);
    lock_dictionaryWrapper = v12->_lock_dictionaryWrapper;
    v12->_lock_dictionaryWrapper = v17;

  }
  return v12;
}

- (PHPropertyFetchingHelper)init
{
  PHPropertyFetchingHelper *v2;
  id v3;

  v2 = self;
  PLMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)fetchedPropertiesForObjectID:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_propertyValuesByOID, "objectForKeyedSubscript:", a3);
}

- (BOOL)evaluateQuery:(id)a3 withObjectID:(id)a4 outMissingPropertyNames:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  os_unfair_lock_s *p_lock;
  char v12;
  void *v13;
  NSDictionary *fetchedPropertyNamesByEntityName;
  void *v15;
  void *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  -[PHPropertyFetchingHelper fetchedPropertiesForObjectID:](self, "fetchedPropertiesForObjectID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[_PHDictionaryKeyValueWrapper setObjectID:dictionary:](self->_lock_dictionaryWrapper, "setObjectID:dictionary:", v9, v10);
    v12 = objc_msgSend(v8, "evaluateWithObject:", self->_lock_dictionaryWrapper);
    -[_PHDictionaryKeyValueWrapper missingPropertyNames](self->_lock_dictionaryWrapper, "missingPropertyNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    fetchedPropertyNamesByEntityName = self->_fetchedPropertyNamesByEntityName;
    objc_msgSend(v9, "entity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](fetchedPropertyNamesByEntityName, "objectForKeyedSubscript:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
  }
  v17 = objc_retainAutorelease(v13);
  *a5 = v17;

  return v12;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_lock_dictionaryWrapper, 0);
  objc_storeStrong((id *)&self->_propertyValuesByOID, 0);
  objc_storeStrong((id *)&self->_fetchedPropertyNamesByEntityName, 0);
}

+ (id)fetchPropertiesForObjectIDs:(id)a3 propertyNamesByEntityName:(id)a4 photoLibrary:(id)a5
{
  id v7;
  id v8;
  id v9;
  PHPropertyFetchingHelper *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PHPropertyFetchingHelper initWithObjectIDs:propertyNamesByEntityName:photoLibrary:]([PHPropertyFetchingHelper alloc], "initWithObjectIDs:propertyNamesByEntityName:photoLibrary:", v9, v8, v7);

  return v10;
}

@end
