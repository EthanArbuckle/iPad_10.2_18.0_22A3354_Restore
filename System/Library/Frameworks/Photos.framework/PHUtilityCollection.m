@implementation PHUtilityCollection

- (PHUtilityCollection)initWithType:(unsigned __int16)a3 fetchOptions:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  objc_super v12;

  v4 = a3;
  v6 = a4;
  +[PHQuery queryForAssetsInUtilityCollectionWithType:options:](PHQuery, "queryForAssetsInUtilityCollectionWithType:options:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("utility-%d"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12.receiver = self;
    v12.super_class = (Class)PHUtilityCollection;
    v11 = 0;
    self = -[PHAssetCollection initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:albumKind:subtype:photoLibrary:](&v12, sel_initTransientWithAssets_orFetchResult_orQuery_title_subtitle_titleFontName_identifier_albumKind_subtype_photoLibrary_, 0, 0, v7, 0, 0, 0, v8, v11, 0, v9);

    if (self)
      self->_type = v4;

  }
  return self;
}

- (id)localizedTitle
{
  unsigned int v2;

  v2 = -[PHUtilityCollection type](self, "type") - 1;
  if (v2 > 5)
    return CFSTR("None");
  else
    return off_1E35DB360[(unsigned __int16)v2];
}

- (id)description
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHUtilityCollection;
  -[PHAssetCollection description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PHUtilityCollection type](self, "type") - 1;
  if (v4 > 5)
    v5 = CFSTR("None");
  else
    v5 = off_1E35DB360[(unsigned __int16)v4];
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" Utility collection type: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)type
{
  return self->_type;
}

+ (id)searchLookupIdentifierForUtilityCollectionType:(unsigned __int16)a3
{
  return (id)PLSearchLookupIdentifierForUtilityCollectionType();
}

@end
