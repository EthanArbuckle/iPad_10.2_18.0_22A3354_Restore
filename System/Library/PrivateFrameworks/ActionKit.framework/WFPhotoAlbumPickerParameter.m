@implementation WFPhotoAlbumPickerParameter

- (WFPhotoAlbumPickerParameter)initWithDefinition:(id)a3
{
  id v4;
  WFPhotoAlbumPickerParameter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  WFPhotoAlbumPickerParameter *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFPhotoAlbumPickerParameter;
  v5 = -[WFPhotoAlbumPickerParameter initWithDefinition:](&v12, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("IncludeSmartAlbum"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = objc_msgSend(v8, "BOOLValue");
    else
      v9 = 1;
    v5->_includesSmartAlbum = v9;
    v10 = v5;

  }
  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void)setActionResources:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "anyObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  WFEnforceClass(v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPhotoAlbumPickerParameter setPhotoAccessResource:](self, "setPhotoAccessResource:", v5);

}

- (void)setPhotoAccessResource:(id)a3
{
  WFPhotoAccessResource **p_photoAccessResource;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_photoAccessResource = &self->_photoAccessResource;
  v6 = (_QWORD *)MEMORY[0x24BEC4628];
  if (self->_photoAccessResource)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, *v6, *p_photoAccessResource);

  }
  objc_storeStrong((id *)&self->_photoAccessResource, a3);
  if (*p_photoAccessResource)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_resourceAvailabilityChanged, *v6, *p_photoAccessResource);

  }
}

- (id)sharedLibrary
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "systemPhotoLibraryWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;

  if (v3)
  {
    v5 = v3;
  }
  else
  {
    getWFGeneralLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFPhotoAlbumPickerParameter sharedLibrary]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_ERROR, "%s Unable to get library: %@", buf, 0x16u);
    }

  }
  return v3;
}

- (void)wasAddedToWorkflow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFPhotoAlbumPickerParameter;
  -[WFPhotoAlbumPickerParameter wasAddedToWorkflow](&v4, sel_wasAddedToWorkflow);
  if (objc_msgSend((id)objc_opt_class(), "hasPhotosAccess"))
  {
    -[WFPhotoAlbumPickerParameter sharedLibrary](self, "sharedLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerChangeObserver:", self);

  }
}

- (void)wasRemovedFromWorkflow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFPhotoAlbumPickerParameter;
  -[WFPhotoAlbumPickerParameter wasRemovedFromWorkflow](&v4, sel_wasRemovedFromWorkflow);
  -[WFPhotoAlbumPickerParameter sharedLibrary](self, "sharedLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:", self);

}

- (void)resourceAvailabilityChanged
{
  void *v3;
  int v4;
  void *v5;

  -[WFPhotoAlbumPickerParameter photoAccessResource](self, "photoAccessResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAvailable");

  if (v4)
  {
    -[WFPhotoAlbumPickerParameter sharedLibrary](self, "sharedLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerChangeObserver:", self);

    -[WFPhotoAlbumPickerParameter possibleStatesDidChange](self, "possibleStatesDidChange");
  }
}

- (void)possibleStatesDidChange
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFPhotoAlbumPickerParameter;
  -[WFPhotoAlbumPickerParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
}

- (id)possibleStates
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  WFPHAssetCollectionState *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  WFPHAssetCollectionState *v16;
  NSArray *v17;
  NSArray *possibleStates;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!self->_possibleStates && objc_msgSend((id)objc_opt_class(), "hasPhotosAccess"))
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v4, "fetchOptionsWithError:", &v25);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v25;

    objc_msgSend(v5, "setWantsIncrementalChangeDetails:", 0);
    if (!v5)
    {

      return 0;
    }
    v20 = v6;
    if (-[WFPhotoAlbumPickerParameter includesSmartAlbum](self, "includesSmartAlbum"))
    {
      objc_msgSend(getPHAssetCollectionClass(), "fetchAssetCollectionsWithType:subtype:options:", 2, 209, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = -[WFPHAssetCollectionState initWithCollection:]([WFPHAssetCollectionState alloc], "initWithCollection:", v8);
        objc_msgSend(v3, "addObject:", v9);

      }
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(getPHAssetCollectionClass(), "fetchAssetCollectionsWithType:subtype:options:", 1, 0x7FFFFFFFFFFFFFFFLL, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v15, "canPerformEditOperation:", 3))
          {
            v16 = -[WFPHAssetCollectionState initWithCollection:]([WFPHAssetCollectionState alloc], "initWithCollection:", v15);
            objc_msgSend(v3, "addObject:", v16);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    v17 = (NSArray *)objc_msgSend(v3, "copy");
    possibleStates = self->_possibleStates;
    self->_possibleStates = v17;

  }
  return self->_possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)defaultSerializedRepresentation
{
  void *v3;
  void *v4;
  id v5;
  _BOOL4 v6;
  id PHAssetCollectionClass;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  void *v12;
  WFPropertyListObject *v13;
  WFPropertyListObject *v14;
  WFPropertyListObject *defaultSerializedRepresentation;
  id v16;

  if (!self->_defaultSerializedRepresentation && objc_msgSend((id)objc_opt_class(), "hasPhotosAccess"))
  {
    objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v3, "fetchOptionsWithError:", &v16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v16;

    if (!v4)
    {

      return 0;
    }
    v6 = -[WFPhotoAlbumPickerParameter includesSmartAlbum](self, "includesSmartAlbum");
    PHAssetCollectionClass = getPHAssetCollectionClass();
    if (v6)
    {
      v8 = 2;
      v9 = 209;
    }
    else
    {
      v8 = 1;
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_msgSend(PHAssetCollectionClass, "fetchAssetCollectionsWithType:subtype:options:", v8, v9, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "localizedTitle");
    v13 = (WFPropertyListObject *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BEC40C8], "serializedRepresentationFromValue:", v13);
      v13 = (WFPropertyListObject *)objc_claimAutoreleasedReturnValue();
    }
    defaultSerializedRepresentation = self->_defaultSerializedRepresentation;
    self->_defaultSerializedRepresentation = v13;

  }
  return self->_defaultSerializedRepresentation;
}

- (void)photoLibraryDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__WFPhotoAlbumPickerParameter_photoLibraryDidChange___block_invoke;
  block[3] = &unk_24F8BB638;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (WFPhotoAccessResource)photoAccessResource
{
  return self->_photoAccessResource;
}

- (BOOL)includesSmartAlbum
{
  return self->_includesSmartAlbum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoAccessResource, 0);
  objc_storeStrong((id *)&self->_defaultSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

uint64_t __53__WFPhotoAlbumPickerParameter_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "possibleStatesDidChange");
}

+ (BOOL)hasPhotosAccess
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getPHPhotoLibraryClass_softClass;
  v9 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getPHPhotoLibraryClass_block_invoke;
    v5[3] = &unk_24F8BB430;
    v5[4] = &v6;
    __getPHPhotoLibraryClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_msgSend(v3, "authorizationStatus") == 3;
}

+ (id)referencedActionResourceClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

@end
