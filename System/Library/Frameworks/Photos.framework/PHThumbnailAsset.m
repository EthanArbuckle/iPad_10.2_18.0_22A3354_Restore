@implementation PHThumbnailAsset

+ (int64_t)batchSize
{
  return 2000;
}

- (PHThumbnailAsset)initWithObjectID:(id)a3 knownKeysDictionary:(id)a4 photoLibrary:(id)a5
{
  id v9;
  id v10;
  id v11;
  PHThumbnailAsset *v12;
  PHThumbnailAsset *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHThumbnailAsset;
  v12 = -[PHThumbnailAsset init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_objectID, a3);
    objc_storeStrong((id *)&v13->_dictionary, a4);
    objc_storeStrong((id *)&v13->_photoLibrary, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  PHThumbnailAsset *v4;
  PHThumbnailAsset *v5;
  void *v6;
  void *v7;
  char IsEqual;

  v4 = (PHThumbnailAsset *)a3;
  if (self == v4)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PHThumbnailAsset objectID](self, "objectID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHThumbnailAsset objectID](v5, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      IsEqual = PLObjectIsEqual();
    }
    else
    {
      IsEqual = 0;
    }
  }

  return IsEqual;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PHThumbnailAsset objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (unint64_t)thumbnailIndex
{
  void *v2;
  uint64_t v3;
  unint64_t v6;

  -[NSKnownKeysDictionary valueAtIndex:](self->_dictionary, "valueAtIndex:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");
  if (v3 > (int)*MEMORY[0x1E0D71F48] || v3 < (int)*MEMORY[0x1E0D71F40] || v2 == 0)
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v6 = v3;

  return v6;
}

- (BOOL)complete
{
  void *v2;
  char v3;

  -[NSKnownKeysDictionary valueAtIndex:](self->_dictionary, "valueAtIndex:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (int64_t)cloudPlaceholderKind
{
  void *v2;
  int64_t v3;

  -[NSKnownKeysDictionary valueAtIndex:](self->_dictionary, "valueAtIndex:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "shortValue");

  return v3;
}

- (id)pl_photoLibrary
{
  void *v2;
  void *v3;

  -[PHThumbnailAsset photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

+ (NSString)entityName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D71880], "entityName");
}

+ (int64_t)cacheSize
{
  return 1000000;
}

+ (BOOL)useNoIndexSelf
{
  return 1;
}

+ (NSArray)propertiesToSortBy
{
  return 0;
}

+ (BOOL)useObjectFetchingContext
{
  return 1;
}

+ (NSString)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHAsset");
  return (NSString *)CFSTR("PHAsset");
}

+ (NSArray)propertiesToFetch
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("thumbnailIndex");
  v3[1] = CFSTR("complete");
  v3[2] = CFSTR("cloudPlaceholderKind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

@end
