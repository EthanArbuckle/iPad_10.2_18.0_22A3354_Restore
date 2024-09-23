@implementation PHProjectChangeRequest

- (PHProjectChangeRequest)initWithProject:(PHProject *)project
{
  PHProject *v4;
  PHProjectChangeRequest *v5;
  void *v6;
  void *v7;
  PHProjectChangeRequest *v8;

  v4 = project;
  v5 = [PHProjectChangeRequest alloc];
  -[PHObject uuid](v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject objectID](v4, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PHProjectChangeRequest initWithUUID:objectID:](v5, "initWithUUID:objectID:", v6, v7);

  -[PHProjectChangeRequest _setOriginalProject:](v8, "_setOriginalProject:", v4);
  return v8;
}

- (PHProjectChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHProjectChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *assetsHelper;
  PHRelationshipChangeRequestHelper *v13;
  PHRelationshipChangeRequestHelper *keyAssetHelper;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHProjectChangeRequest;
  v8 = -[PHChangeRequest init](&v16, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("assets"), v8->super._helper);
    assetsHelper = v8->_assetsHelper;
    v8->_assetsHelper = v11;

    v13 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("customKeyAsset"), v8->super._helper);
    keyAssetHelper = v8->_keyAssetHelper;
    v8->_keyAssetHelper = v13;

  }
  return v8;
}

- (id)initForNewObject
{
  PHProjectChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v5;
  PHRelationshipChangeRequestHelper *assetsHelper;
  PHRelationshipChangeRequestHelper *v7;
  PHRelationshipChangeRequestHelper *keyAssetHelper;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHProjectChangeRequest;
  v2 = -[PHChangeRequest init](&v10, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

    v5 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("assets"), v2->super._helper);
    assetsHelper = v2->_assetsHelper;
    v2->_assetsHelper = v5;

    v7 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("customKeyAsset"), v2->super._helper);
    keyAssetHelper = v2->_keyAssetHelper;
    v2->_keyAssetHelper = v7;

  }
  return v2;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setTitle:(NSString *)title
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;

  v10 = title;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("title"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("title"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("title"));
  }

}

- (NSString)projectDocumentType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("projectDocumentType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setProjectDocumentType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("projectDocumentType"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("projectDocumentType"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("projectDocumentType"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("projectDocumentType"));
  }

}

- (id)projectExtensionIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("projectExtensionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setProjectExtensionIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("projectExtensionIdentifier"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("projectExtensionIdentifier"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("projectExtensionIdentifier"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("projectExtensionIdentifier"));
  }

}

- (NSData)projectExtensionData
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("projectData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)v5;
}

- (void)setProjectExtensionData:(NSData *)projectExtensionData
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSData *v10;

  v10 = projectExtensionData;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("projectData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("projectData"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("projectData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("projectData"));
  }

}

- (id)projectRenderUuid
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("projectRenderUuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setProjectRenderUuid:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("projectRenderUuid"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("projectRenderUuid"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("projectRenderUuid"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("projectRenderUuid"));
  }

}

- (void)setAssets:(id)a3
{
  PHRelationshipChangeRequestHelper *assetsHelper;
  void *v5;
  id v6;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHProjectChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
    assetsHelper = self->_assetsHelper;
    v5 = (void *)objc_msgSend(v6, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](assetsHelper, "setMutableObjectIDsAndUUIDs:", v5);

  }
}

- (void)_setOriginalProject:(id)a3
{
  objc_storeStrong((id *)&self->_originalProject, a3);
}

- (void)setProjectPreviewImage:(UIImage *)previewImage
{
  __CFData *v4;
  __CFString *v5;
  CGImageDestination *v6;
  NSData *previewImageData;
  UIImage *v8;

  v8 = previewImage;
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetPreviewImage = 1;
  v4 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend((id)*MEMORY[0x1E0CEC600], "identifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = CGImageDestinationCreateWithData(v4, v5, 1uLL, 0);

  if (v6)
  {
    CGImageDestinationAddImage(v6, -[UIImage CGImage](objc_retainAutorelease(v8), "CGImage"), 0);
    CGImageDestinationFinalize(v6);
    CFRelease(v6);
  }
  previewImageData = self->_previewImageData;
  self->_previewImageData = (NSData *)v4;

}

- (id)placeholderForCreatedProject
{
  return -[PHChangeRequestHelper placeholderForCreatedObjectWithClass:changeRequest:](self->super._helper, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
}

- (void)_prepareKeyAssetIDIfNeeded
{
  void *v3;
  void *v4;
  PHRelationshipChangeRequestHelper *keyAssetHelper;
  void *v6;
  id v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_keyAssetHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_keyAssetHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_keyAssetHelper, "mutableObjectIDsAndUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    keyAssetHelper = self->_keyAssetHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](keyAssetHelper, "originalObjectIDs");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](keyAssetHelper, "setMutableObjectIDsAndUUIDs:", v6);

  }
}

- (void)setKeyAsset:(PHAsset *)keyAsset
{
  PHAsset *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = keyAsset;
  PLObjectIDOrUUIDFromPHObject(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (self->_originalProject
      || (-[PHChangeRequest helper](self, "helper"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "isNewRequest"),
          v6,
          v7))
    {
      -[PHChangeRequest didMutate](self, "didMutate");
      -[PHProjectChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
      -[PHProjectChangeRequest assetsHelper](self, "assetsHelper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mutableObjectIDsAndUUIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v9, "containsObject:", v4) & 1) == 0)
      {
        v13[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHProjectChangeRequest addAssets:](self, "addAssets:", v10);

      }
      -[PHProjectChangeRequest _prepareKeyAssetIDIfNeeded](self, "_prepareKeyAssetIDIfNeeded");
      -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_keyAssetHelper, "mutableObjectIDsAndUUIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAllObjects");

      -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_keyAssetHelper, "mutableObjectIDsAndUUIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v5);

    }
  }

}

- (void)_prepareAssetIDsIfNeeded
{
  void *v3;
  PHProject *originalProject;
  void *v5;
  PHRelationshipChangeRequestHelper *assetsHelper;
  void *v7;
  void *v8;
  PHRelationshipChangeRequestHelper *v9;
  id v10;
  void *v11;
  PHRelationshipChangeRequestHelper *v12;
  void *v13;
  id v14;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_assetsHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    originalProject = self->_originalProject;
    if (!originalProject)
      goto LABEL_7;
    +[PHQuery queryForAssetsInAssetCollection:options:](PHQuery, "queryForAssetsInAssetCollection:options:", originalProject, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "executeQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    assetsHelper = self->_assetsHelper;
    objc_msgSend(v5, "fetchedObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](assetsHelper, "setOriginalObjectIDs:", v7);

    -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_assetsHelper, "originalObjectIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = self->_assetsHelper;
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](v9, "setOriginalObjectIDs:", v10);

    }
  }

LABEL_7:
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_assetsHelper, "mutableObjectIDsAndUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = self->_assetsHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](v12, "originalObjectIDs");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v14, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](v12, "setMutableObjectIDsAndUUIDs:", v13);

  }
}

- (void)addAssets:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHProjectChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_assetsHelper, "mutableObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
}

- (void)insertAssets:(id)a3 atIndexes:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHProjectChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_assetsHelper, "mutableObjectIDsAndUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertObjects:atIndexes:", v6, v8);

  }
}

- (void)removeAssets:(id)assets
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", assets);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHProjectChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_assetsHelper, "mutableObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v5);

  }
}

- (void)removeAssetsAtIndexes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHProjectChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_assetsHelper, "mutableObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsAtIndexes:", v5);

  }
}

- (void)replaceAssetsAtIndexes:(id)a3 withAssets:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHProjectChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_assetsHelper, "mutableObjectIDsAndUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "replaceObjectsAtIndexes:withObjects:", v8, v6);

  }
}

- (void)moveAssetsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "count"))
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHProjectChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_assetsHelper, "mutableObjectIDsAndUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectsAtIndexes:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectsAtIndexes:", v10);
    v8 = objc_msgSend(v10, "count");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObjects:atIndexes:", v7, v9);

  }
}

- (void)encodeToXPCDict:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  -[PHChangeRequestHelper encodeToXPCDict:](self->super._helper, "encodeToXPCDict:", xdict);
  -[PHRelationshipChangeRequestHelper encodeToXPCDict:](self->_assetsHelper, "encodeToXPCDict:", xdict);
  -[PHRelationshipChangeRequestHelper encodeToXPCDict:](self->_keyAssetHelper, "encodeToXPCDict:", xdict);
  xpc_dictionary_set_BOOL(xdict, "didSetPreviewImage", self->_didSetPreviewImage);
  if (self->_didSetPreviewImage)
    PLXPCDictionarySetData();

}

- (PHProjectChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHProjectChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  PHProjectChangeRequest *v14;
  void (**v15)(_QWORD);
  PHRelationshipChangeRequestHelper *v16;
  uint64_t v17;
  PHRelationshipChangeRequestHelper *assetsHelper;
  PHRelationshipChangeRequestHelper *v19;
  PHRelationshipChangeRequestHelper *keyAssetHelper;
  _BOOL4 v21;
  uint64_t v22;
  NSData *previewImageData;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  PHProjectChangeRequest *v29;
  id v30;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)PHProjectChangeRequest;
  v11 = -[PHChangeRequest init](&v31, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __70__PHProjectChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
      v28 = &unk_1E35DF9E8;
      v14 = v11;
      v29 = v14;
      v30 = v9;
      v15 = (void (**)(_QWORD))_Block_copy(&v25);
      v16 = [PHRelationshipChangeRequestHelper alloc];
      v17 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:](v16, "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("assets"), v8, v11->super._helper, v25, v26, v27, v28);
      assetsHelper = v14->_assetsHelper;
      v14->_assetsHelper = (PHRelationshipChangeRequestHelper *)v17;

      v19 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("customKeyAsset"), v8, v11->super._helper);
      keyAssetHelper = v14->_keyAssetHelper;
      v14->_keyAssetHelper = v19;

      v21 = xpc_dictionary_get_BOOL(v8, "didSetPreviewImage");
      v14->_didSetPreviewImage = v21;
      if (v21)
      {
        v15[2](v15);
        PLDataFromXPCDictionary();
        v22 = objc_claimAutoreleasedReturnValue();
        previewImageData = v14->_previewImageData;
        v14->_previewImageData = (NSData *)v22;

      }
    }
  }

  return v11;
}

- (BOOL)prepareForServicePreflightCheck:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  objc_super v10;
  id v11;

  -[PHChangeRequestHelper mutations](self->super._helper, "mutations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("projectData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "length") > 0x500000)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("projectExtensionData length exceeds maximum"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PHProjectChangeRequest;
    v11 = 0;
    v7 = -[PHChangeRequest prepareForServicePreflightCheck:](&v10, sel_prepareForServicePreflightCheck_, &v11);
    v8 = v11;
    if (!a3)
      goto LABEL_7;
  }
  if (!v7)
    *a3 = objc_retainAutorelease(v8);
LABEL_7:

  return v7;
}

- (NSString)managedEntityName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D71A20], "entityName");
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D71A20];
  v7 = a3;
  -[PHChangeRequest uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHProjectChangeRequest projectDocumentType](self, "projectDocumentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHProjectChangeRequest projectExtensionIdentifier](self, "projectExtensionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertIntoPhotoLibrary:withUUID:documentType:projectExtensionIdentifier:", v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v11)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create project"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  BOOL v7;

  -[PHChangeRequest uuid](self, "uuid", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHProjectChangeRequest projectDocumentType](self, "projectDocumentType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  PHChangeRequestHelper *helper;
  BOOL v7;
  id v8;
  void *v9;
  id v11;

  helper = self->super._helper;
  v11 = 0;
  v7 = -[PHChangeRequestHelper allowMutationToManagedObject:propertyKey:error:](helper, "allowMutationToManagedObject:propertyKey:error:", a3, a4, &v11);
  v8 = v11;
  v9 = v8;
  if (a5 && !v7)
    *a5 = objc_retainAutorelease(v8);

  return v7;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  PHChangeRequestHelper *helper;
  _BOOL4 v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSData *previewImageData;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  helper = self->super._helper;
  v33 = 0;
  v9 = -[PHChangeRequestHelper applyMutationsToManagedObject:error:](helper, "applyMutationsToManagedObject:error:", v7, &v33);
  v10 = v33;
  -[PHProjectChangeRequest assetsHelper](self, "assetsHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  if (!v9)
    goto LABEL_9;
  objc_msgSend(v11, "mutableObjectIDsAndUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v11, "setAllowsInsert:", 1);
    objc_msgSend(v11, "setAllowsRemove:", 1);
    objc_msgSend(v11, "setAllowsMove:", 1);
    objc_msgSend(MEMORY[0x1E0D71880], "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDestinationEntityName:", v14);

    objc_msgSend(v11, "relationshipName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mutableOrderedSetValueForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v10;
    v17 = objc_msgSend(v11, "applyMutationsToManagedObject:orderedMutableChildren:error:", v12, v16, &v32);
    v18 = v32;

    if (!v17)
    {
      v19 = 0;
      v10 = v18;
      goto LABEL_10;
    }
  }
  else
  {
    v18 = v10;
  }
  -[PHProjectChangeRequest keyAssetHelper](self, "keyAssetHelper");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mutableObjectIDsAndUUIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {

    goto LABEL_16;
  }
  objc_msgSend(v20, "setAllowsInsert:", 1);
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDestinationEntityName:", v22);

  v31 = v18;
  v23 = objc_msgSend(v20, "applyMutationsToManagedObjectToOneRelationship:error:", v12, &v31);
  v10 = v31;

  if (!v23)
  {
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  v18 = v10;
LABEL_16:
  if (!self->_didSetPreviewImage)
  {
    v19 = 1;
    goto LABEL_14;
  }
  previewImageData = self->_previewImageData;
  v30 = v18;
  v19 = objc_msgSend(v12, "setProjectPreviewImageData:error:", previewImageData, &v30);
  v26 = v30;

  if (v26)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(v26, "localizedDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3302, v29);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
LABEL_10:
  if (!a5 || (v19 & 1) != 0)
  {
    v18 = v10;
  }
  else
  {
    v18 = objc_retainAutorelease(v10);
    v19 = 0;
    *a5 = v18;
  }
LABEL_14:

  return v19;
}

- (PHRelationshipChangeRequestHelper)assetsHelper
{
  return self->_assetsHelper;
}

- (PHRelationshipChangeRequestHelper)keyAssetHelper
{
  return self->_keyAssetHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetHelper, 0);
  objc_storeStrong((id *)&self->_assetsHelper, 0);
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_originalProject, 0);
}

uint64_t __70__PHProjectChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMutated:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "recordUpdateRequest:", *(_QWORD *)(a1 + 32));
}

+ (id)creationRequestForProjectWithDocumentType:(id)a3 projectExtensionIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PHProjectChangeRequest initForNewObject]([PHProjectChangeRequest alloc], "initForNewObject");
  objc_msgSend(v7, "setProjectDocumentType:", v6);

  objc_msgSend(v7, "setProjectExtensionIdentifier:", v5);
  return v7;
}

+ (id)creationRequestForProjectWithDocumentType:(id)a3 projectExtensionIdentifier:(id)a4 assets:(id)a5 title:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[PHProjectChangeRequest initForNewObject]([PHProjectChangeRequest alloc], "initForNewObject");
  objc_msgSend(v13, "setProjectDocumentType:", v12);

  objc_msgSend(v13, "setProjectExtensionIdentifier:", v11);
  objc_msgSend(v13, "setAssets:", v10);

  objc_msgSend(v13, "setTitle:", v9);
  return v13;
}

+ (id)creationRequestForProjectCopyFromProject:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 *p_buf;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "assetCollectionType") == 10)
  {
    objc_msgSend(v3, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = objc_claimAutoreleasedReturnValue();

    +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__17005;
    v39 = __Block_byref_object_dispose__17006;
    v40 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__17005;
    v34 = __Block_byref_object_dispose__17006;
    v35 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__17005;
    v28 = __Block_byref_object_dispose__17006;
    v29 = 0;
    objc_msgSend(v3, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__PHProjectChangeRequest_creationRequestForProjectCopyFromProject___block_invoke;
    v19[3] = &unk_1E35DE5A8;
    v9 = v3;
    v20 = v9;
    p_buf = &buf;
    v22 = &v30;
    v23 = &v24;
    objc_msgSend(v8, "performBlockAndWait:", v19);

    v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v11 = v31[5];
    objc_msgSend(v9, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHProjectChangeRequest creationRequestForProjectWithDocumentType:projectExtensionIdentifier:assets:title:](PHProjectChangeRequest, "creationRequestForProjectWithDocumentType:projectExtensionIdentifier:assets:title:", v10, v11, v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setProjectData:", v25[5]);
    objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(0, "duplicateProjectPreviewImageData:error:", v14, &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;

    if (v15)
      objc_msgSend(v13, "setProjectRenderUuid:", v14);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_ERROR, "Asset collection type is not a project: %@", (uint8_t *)&buf, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

+ (void)_deleteProjects:(id)a3 withOperation:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[PHObject assertAllObjects:forSelector:areOfType:](PHObject, "assertAllObjects:forSelector:areOfType:", v6, a2, objc_opt_class());
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = +[PHTrashableObjectDeleteRequest deleteRequestForObject:operation:](PHCollectionDeleteRequest, "deleteRequestForObject:operation:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), a4, (_QWORD)v13);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

+ (void)deleteProjects:(id)a3
{
  objc_msgSend(a1, "_deleteProjects:withOperation:", a3, 0);
}

+ (void)undeleteProjects:(id)a3
{
  objc_msgSend(a1, "_deleteProjects:withOperation:", a3, 2);
}

+ (void)expungeProjects:(id)a3
{
  objc_msgSend(a1, "_deleteProjects:withOperation:", a3, 1);
}

void __67__PHProjectChangeRequest_creationRequestForProjectCopyFromProject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = (void *)MEMORY[0x1E0D71778];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "albumWithObjectID:inLibrary:", v3, v5);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "projectDocumentType");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(v15, "projectExtensionIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_msgSend(v15, "projectData");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

@end
