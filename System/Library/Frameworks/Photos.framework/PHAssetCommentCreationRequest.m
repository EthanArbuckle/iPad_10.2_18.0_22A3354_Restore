@implementation PHAssetCommentCreationRequest

- (id)initForNewObject
{
  PHAssetCommentCreationRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHAssetCommentCreationRequest;
  v2 = -[PHChangeRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

  }
  return v2;
}

- (PHAssetCommentCreationRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHAssetCommentCreationRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHAssetCommentCreationRequest;
  v8 = -[PHChangeRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

  }
  return v8;
}

- (id)placeholderForCreatedAssetComment
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PHAssetCommentCreationRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHAssetCommentCreationRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHAssetCommentCreationRequest;
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

- (id)commentText
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("commentText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setCommentText:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("commentText"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("commentText"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("commentText"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("commentText"));
  }

}

- (id)isLike
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("isLike"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setIsLike:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("isLike"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("isLike"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("isLike"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("isLike"));
  }

}

- (id)managedEntityName
{
  return CFSTR("CloudSharedComment");
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
  v6 = (void *)MEMORY[0x1E0D71638];
  v7 = a3;
  -[PHAssetCommentCreationRequest commentText](self, "commentText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCommentCreationRequest isLike](self, "isLike");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertNewCommentWithCommentText:commentDate:isLike:isMyComment:inLibrary:", v8, 0, objc_msgSend(v9, "BOOLValue"), 1, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHChangeRequest uuid](self, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCloudGUID:", v11);

  if (a4 && !v10)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create cloud shared comment"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (PHAssetComment)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
  objc_storeStrong((id *)&self->_comment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comment, 0);
}

+ (id)creationRequestForAssetCommentWithText:(id)a3
{
  id v3;
  id v4;
  void *v5;

  if (a3)
  {
    v3 = a3;
    v4 = -[PHAssetCommentCreationRequest initForNewObject]([PHAssetCommentCreationRequest alloc], "initForNewObject");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsLike:", v5);

    objc_msgSend(v4, "setCommentText:", v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)creationRequestForAssetCommentLike
{
  id v2;
  void *v3;

  v2 = -[PHAssetCommentCreationRequest initForNewObject]([PHAssetCommentCreationRequest alloc], "initForNewObject");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsLike:", v3);

  return v2;
}

+ (id)changeRequestForAssetComment:(id)a3
{
  id v3;
  PHAssetCommentCreationRequest *v4;
  void *v5;
  void *v6;
  PHAssetCommentCreationRequest *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = [PHAssetCommentCreationRequest alloc];
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHAssetCommentCreationRequest initWithUUID:objectID:](v4, "initWithUUID:objectID:", v5, v6);

    -[PHAssetCommentCreationRequest setComment:](v7, "setComment:", v3);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
