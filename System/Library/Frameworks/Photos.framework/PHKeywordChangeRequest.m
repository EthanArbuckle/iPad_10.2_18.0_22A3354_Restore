@implementation PHKeywordChangeRequest

- (id)initForNewObject
{
  PHKeywordChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHKeywordChangeRequest;
  v2 = -[PHChangeRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

  }
  return v2;
}

- (PHObjectPlaceholder)placeholderForCreatedKeyword
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHObjectPlaceholder *)v4;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "keywordManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHKeywordChangeRequest title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createOrLookupKeywordForTitle:photoLibrary:error:", v8, v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PHChangeRequest uuid](self, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUuid:", v10);

  }
  return v9;
}

- (NSString)title
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  NSString *v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("title"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = &stru_1E35DFFF8;
  v7 = v6;

  return v7;
}

- (void)setTitle:(id)a3
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

- (NSString)shortcut
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("shortcut"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setShortcut:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("shortcut"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("shortcut"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("shortcut"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("shortcut"));
  }

}

- (PHKeywordChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHKeywordChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHKeywordChangeRequest;
  v8 = -[PHChangeRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

  }
  return v8;
}

- (PHKeywordChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHKeywordChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHKeywordChangeRequest;
  v11 = -[PHChangeRequest init](&v15, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

  }
  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeToXPCDict:", v4);

}

- (NSString)managedEntityName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D718A0], "entityName");
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = objc_opt_class();
  v11 = v8;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;
    if (v13)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable _PLAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nullable __strong)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PLHelperExtension.h"), 76, CFSTR("Expected class of %@ but was %@"), v10, objc_opt_class());

  }
  v13 = 0;
LABEL_8:

  if (objc_msgSend(v9, "isEqualToString:", CFSTR("title"))
    && !-[PHKeywordChangeRequest _validateMutationOfTitleToKeyword:error:](self, "_validateMutationOfTitleToKeyword:error:", v13, a5))
  {
    v16 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PHKeywordChangeRequest;
    v16 = -[PHChangeRequest allowMutationToManagedObject:propertyKey:error:](&v18, sel_allowMutationToManagedObject_propertyKey_error_, v11, v9, a5);
  }

  return v16;
}

- (BOOL)_validateMutationOfTitleToKeyword:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[PHKeywordChangeRequest title](self, "title", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = v5, v7 = objc_msgSend(v5, "isEqualToString:", &stru_1E35DFFF8), v6, v6, !v7))
  {
    v11 = 0;
    v12 = 1;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keyword title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v11 = objc_retainAutorelease(v11);
      v12 = 0;
      *a4 = v11;
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (id)creationRequestForKeyword
{
  return -[PHKeywordChangeRequest initForNewObject]([PHKeywordChangeRequest alloc], "initForNewObject");
}

+ (id)changeRequestForKeyword:(id)a3
{
  id v3;
  PHKeywordChangeRequest *v4;
  void *v5;
  void *v6;
  PHKeywordChangeRequest *v7;

  v3 = a3;
  v4 = [PHKeywordChangeRequest alloc];
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PHKeywordChangeRequest initWithUUID:objectID:](v4, "initWithUUID:objectID:", v5, v6);
  return v7;
}

+ (void)deleteKeywords:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:ofType:forSelector:](PHKeywordDeleteRequest, "deleteRequestsForObjects:ofType:forSelector:", v5, objc_opt_class(), a2);

}

@end
