@implementation PHAssetReference

- (PHAssetReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 mediaType:(int64_t)a5 subtypes:(unint64_t)a6 sourceType:(unint64_t)a7 isTrashed:(BOOL)a8 isRecovered:(BOOL)a9
{
  PHAssetReference *result;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PHAssetReference;
  result = -[PHObjectReference initWithLocalIdentifier:libraryURL:](&v14, sel_initWithLocalIdentifier_libraryURL_, a3, a4);
  if (result)
  {
    result->_mediaType = a5;
    result->_mediaSubtypes = a6;
    result->_sourceType = a7;
    result->_trashed = a8;
    result->_recovered = a9;
  }
  return result;
}

- (id)dictionaryForReferenceType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHAssetReference;
  -[PHObjectReference dictionaryForReferenceType:](&v11, sel_dictionaryForReferenceType_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHAssetReference mediaType](self, "mediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("mediaType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHAssetReference mediaSubtypes](self, "mediaSubtypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("mediaSubtypes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHAssetReference sourceType](self, "sourceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("sourceType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHAssetReference isTrashed](self, "isTrashed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("isTrashed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHAssetReference isRecovered](self, "isRecovered"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("isRecovered"));

  return v4;
}

- (PHAssetReference)initWithDictionary:(id)a3 referenceType:(id)a4
{
  id v6;
  PHAssetReference *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHAssetReference;
  v7 = -[PHObjectReference initWithDictionary:referenceType:](&v14, sel_initWithDictionary_referenceType_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaSubtypes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isTrashed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRecovered"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_mediaType = objc_msgSend(v8, "integerValue");
    v7->_mediaSubtypes = objc_msgSend(v9, "unsignedIntegerValue");
    v7->_sourceType = objc_msgSend(v10, "unsignedIntegerValue");
    v7->_trashed = objc_msgSend(v11, "BOOLValue");
    v7->_recovered = objc_msgSend(v12, "BOOLValue");

  }
  return v7;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (BOOL)isRecovered
{
  return self->_recovered;
}

+ (id)referenceForAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  uint64_t v16;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "mediaType");
  v10 = objc_msgSend(v4, "mediaSubtypes");
  v11 = objc_msgSend(v4, "sourceType");
  v12 = objc_msgSend(v4, "isTrashed");
  v13 = objc_msgSend(v4, "isRecoveredAsset");

  LOBYTE(v16) = v13;
  v14 = (void *)objc_msgSend(v5, "initWithLocalIdentifier:libraryURL:mediaType:subtypes:sourceType:isTrashed:isRecovered:", v6, v8, v9, v10, v11, v12, v16);

  return v14;
}

+ (id)representedType
{
  return CFSTR("com.apple.photos.object-reference.asset");
}

@end
