@implementation PHAssetPhotoCommentProperties

- (PHAssetPhotoCommentProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHAssetPhotoCommentProperties *v9;
  PHAssetPhotoCommentProperties *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  PHAssetPhotoCommentProperties *v23;
  id v24;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PHAssetPhotoCommentProperties;
  v9 = -[PHAssetPhotoCommentProperties init](&v31, sel_init);
  v10 = v9;
  if (v9)
  {
    v23 = v9;
    v24 = v8;
    objc_storeWeak((id *)&v9->super._asset, v8);
    v25 = v7;
    objc_msgSend(v7, "objectForKey:", CFSTR("comments"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("isLike"), v23);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "BOOLValue");

          if (v20)
          {
            ++v14;
            if ((v13 & 1) != 0)
            {
              v13 = 1;
            }
            else
            {
              objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("isMyComment"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v21, "BOOLValue");

            }
          }
          else
          {
            ++v15;
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
    }
    v23->_commentCount = v15;
    v10 = v23;
    v23->_likeCount = v14;
    v23->_hasUserLiked = v13 & 1;

    v8 = v24;
    v7 = v25;
  }

  return v10;
}

- (unint64_t)commentCount
{
  return self->_commentCount;
}

- (unint64_t)likeCount
{
  return self->_likeCount;
}

- (BOOL)hasUserLiked
{
  return self->_hasUserLiked;
}

- (BOOL)cloudIsMyAsset
{
  return self->_cloudIsMyAsset;
}

- (BOOL)cloudHasCommentsByMe
{
  return self->_cloudHasCommentsByMe;
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetComments");
}

+ (id)entityName
{
  return CFSTR("CloudSharedComment");
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (BOOL)isToMany
{
  return 1;
}

+ (BOOL)createsPropertySetObjectWithCustomImplementation
{
  return 1;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_50;
}

void __50__PHAssetPhotoCommentProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("commentDate");
  v3[1] = CFSTR("isLike");
  v3[2] = CFSTR("isMyComment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_50;
  propertiesToFetch_pl_once_object_50 = v1;

}

@end
