@implementation PHPersistentChange

- (PHPersistentChange)initWithChange:(id)a3
{
  id v5;
  PHPersistentChange *v6;
  void *v7;

  v5 = a3;
  v6 = -[PHPersistentChange init](self, "init");
  if (v6)
  {
    objc_msgSend(v5, "changeToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_storeStrong((id *)&v6->_change, a3);
      objc_storeStrong((id *)&v6->_changeToken, v7);
    }
    else
    {

      v6 = 0;
    }

  }
  return v6;
}

- (PHPersistentObjectChangeDetails)changeDetailsForObjectType:(PHObjectType)objectType error:(NSError *)error
{
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PHPersistentObjectChangeDetails *v13;
  void *v14;
  void *v15;
  NSObject *v17;
  PHChange *change;
  void *v19;
  void *v20;
  int v21;
  PHChange *v22;
  __int16 v23;
  objc_class *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[PHChange hasIncrementalChanges](self->_change, "hasIncrementalChanges"))
  {
    v7 = +[PHPhotoLibrary PHObjectClassForObjectType:](PHPhotoLibrary, "PHObjectClassForObjectType:", objectType);
    if (v7)
    {
      -[PHChange changedLocalIdentifiersForEntityClass:](self->_change, "changedLocalIdentifiersForEntityClass:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PHInsertedLocalIdentifiersKey"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHUpdatedLocalIdentifiersKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHDeletedLocalIdentifiersKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PHPersistentObjectChangeDetails initWithObjectType:insertedIdentifiers:updatedIdentifiers:deletedIdentifiers:]([PHPersistentObjectChangeDetails alloc], "initWithObjectType:insertedIdentifiers:updatedIdentifiers:deletedIdentifiers:", objectType, v10, v11, v12);

        if (v13)
        {
LABEL_15:

          return v13;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    PLPhotoKitGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      change = self->_change;
      v21 = 138412546;
      v22 = change;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Missing changeDetails for change %@ and entityClass %@", (uint8_t *)&v21, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (error)
      *error = (NSError *)objc_retainAutorelease(v19);

    v13 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3210, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (error)
    *error = (NSError *)objc_retainAutorelease(v14);

  return (PHPersistentObjectChangeDetails *)0;
}

- (PHPersistentChangeToken)changeToken
{
  return self->_changeToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_change, 0);
}

@end
