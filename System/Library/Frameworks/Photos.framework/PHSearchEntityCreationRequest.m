@implementation PHSearchEntityCreationRequest

- (id)placeholderForCreatedSearchEntity
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("GraphNode");
}

- (id)addSearchRankingWithLabel:(id)a3 identifier:(id)a4 type:(unint64_t)a5 rankingScore:(double)a6 synonyms:(id)a7
{
  unint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;

  v13 = (unint64_t)a3;
  v14 = (unint64_t)a4;
  v15 = a7;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchEntityChangeRequest.m"), 137, CFSTR("Must specify a type"));

  }
  if (a6 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchEntityChangeRequest.m"), 138, CFSTR("Must specify a search ranking"));

  }
  if (!(v13 | v14))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchEntityChangeRequest.m"), 139, CFSTR("Must specify a label or identifier"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("uuid"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("rankingScore"));

  if (v13)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("label"));
  if (v14)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("identifier"));
  if (v15)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("synonyms"));
  -[NSMutableArray addObject:](self->_assetSearchEntities, "addObject:", v16);
  -[PHChangeRequest didMutate](self, "didMutate");
  +[PHSearchEntityCreationRequest _placeholderForCreatedObjectWithClass:uuid:](PHSearchEntityCreationRequest, "_placeholderForCreatedObjectWithClass:uuid:", objc_opt_class(), v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)initForNewObject
{
  PHSearchEntityCreationRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  uint64_t v5;
  NSMutableArray *assetSearchEntities;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHSearchEntityCreationRequest;
  v2 = -[PHChangeRequest init](&v8, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super.super._helper;
    v2->super.super._helper = v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    assetSearchEntities = v2->_assetSearchEntities;
    v2->_assetSearchEntities = (NSMutableArray *)v5;

  }
  return v2;
}

- (PHSearchEntityCreationRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  PHSearchEntityCreationRequest *v10;
  PHSearchEntityCreationRequest *v11;
  PHSearchEntityCreationRequest *v12;
  void (**v13)(_QWORD);
  void *v14;
  uint64_t v15;
  NSMutableArray *assetSearchEntities;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  PHSearchEntityCreationRequest *v22;
  id v23;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PHSearchEntityCreationRequest;
  v10 = -[PHSearchEntityChangeRequest initWithXPCDict:request:clientAuthorization:](&v24, sel_initWithXPCDict_request_clientAuthorization_, v8, v9, a5);
  v11 = v10;
  if (v10)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __77__PHSearchEntityCreationRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
    v21 = &unk_1E35DF9E8;
    v12 = v10;
    v22 = v12;
    v23 = v9;
    v13 = (void (**)(_QWORD))_Block_copy(&v18);
    PLArrayFromXPCDictionary();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "mutableCopy", v18, v19, v20, v21);
    assetSearchEntities = v12->_assetSearchEntities;
    v12->_assetSearchEntities = (NSMutableArray *)v15;

    if (v12->_assetSearchEntities)
      v13[2](v13);

  }
  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeToXPCDict:", v5);

  if (self->_assetSearchEntities)
    PLXPCDictionarySetArray();

}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(MEMORY[0x1E0D71AC0], "newNodeContainerWithManagedObjectContext:", v5);
  -[PHChangeRequest uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUuid:", v7);

  objc_msgSend(v6, "sourceNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  if (-[NSMutableArray count](self->_assetSearchEntities, "count"))
  {
    objc_msgSend(v8, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deleteObject:", v7);

    objc_msgSend(MEMORY[0x1E0D71AC0], "setSearchRankingsFromDictionaries:inLibrary:", self->_assetSearchEntities, v8);
  }

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSearchEntities, 0);
}

uint64_t __77__PHSearchEntityCreationRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMutated:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "recordUpdateRequest:", *(_QWORD *)(a1 + 32));
}

+ (id)creationRequestForNewSearchRankings
{
  return -[PHSearchEntityCreationRequest initForNewObject]([PHSearchEntityCreationRequest alloc], "initForNewObject");
}

+ (id)_placeholderForCreatedObjectWithClass:(Class)a3 uuid:(id)a4
{
  id v5;
  PHObjectPlaceholder *v6;
  void *v7;
  PHObjectPlaceholder *v8;

  v5 = a4;
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  v6 = [PHObjectPlaceholder alloc];
  -[objc_class localIdentifierWithUUID:](a3, "localIdentifierWithUUID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PHObjectPlaceholder initWithLocalIdentifier:](v6, "initWithLocalIdentifier:", v7);
  return v8;
}

@end
