@implementation PUPickerAssetMediaTypeFilter

- (PUPickerAssetMediaTypeFilter)initWithMediaType:(int64_t)a3
{
  PUPickerAssetMediaTypeFilter *v4;
  PUPickerAssetMediaTypeFilter *v5;
  PUPickerAssetMediaTypeFilter *v6;
  PUPickerAssetMediaTypeFilter *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPickerAssetMediaTypeFilter;
  v4 = -[PUPickerAssetMediaTypeFilter init](&v9, sel_init);
  v5 = v4;
  if (v4)
    v4->_mediaType = a3;
  if (-[PUPickerAssetMediaTypeFilter isValidFilter](v4, "isValidFilter"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PUPickerAssetMediaTypeFilter *v4;
  PUPickerAssetMediaTypeFilter *v5;
  objc_class *v6;
  int64_t v7;
  BOOL v8;
  objc_class *v10;
  objc_class *v11;
  PUPickerAssetMediaTypeFilter *v12;
  SEL v13;

  v4 = (PUPickerAssetMediaTypeFilter *)a3;
  if (self == v4)
  {
    v8 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    goto LABEL_8;
  }
  v5 = v4;
  v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PUPickerAssetMediaTypeFilter mediaType](self, "mediaType");
      v8 = v7 == -[PUPickerAssetMediaTypeFilter mediaType](v5, "mediaType");

LABEL_8:
      return v8;
    }
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  v12 = (PUPickerAssetMediaTypeFilter *)_PFAssertFailHandler();
  return -[PUPickerAssetMediaTypeFilter hash](v12, v13);
}

- (unint64_t)hash
{
  return -[PUPickerAssetMediaTypeFilter mediaType](self, "mediaType") + 97;
}

- (BOOL)isValidFilter
{
  int64_t v2;
  unint64_t v3;
  int64_t v4;
  NSObject *v5;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = -[PUPickerAssetMediaTypeFilter mediaType](self, "mediaType");
  v3 = v2 - 1;
  if ((unint64_t)(v2 - 1) >= 3)
  {
    v4 = v2;
    PLPickerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_20D1E2000, v5, OS_LOG_TYPE_ERROR, "PUPickerAssetMediaTypeFilter: invalid media type: %ld", (uint8_t *)&v7, 0xCu);
    }

  }
  return v3 < 3;
}

- (BOOL)allowsSearchSuggestions
{
  return 1;
}

- (BOOL)allowsAlbums
{
  return 1;
}

- (id)generatedAssetPredicate
{
  unint64_t v2;
  void *v3;

  v2 = -[PUPickerAssetMediaTypeFilter mediaType](self, "mediaType") - 1;
  if (v2 > 2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("noindex:(%K) == %d"), CFSTR("kind"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unint64_t)generatedPossibleAssetTypes
{
  int64_t v2;
  unint64_t v3;

  v2 = -[PUPickerAssetMediaTypeFilter mediaType](self, "mediaType");
  v3 = 5118;
  if (v2 != 1)
    v3 = 0;
  if (v2 == 2)
    return 130048;
  else
    return v3;
}

- (unint64_t)generatedRequiredAssetTypes
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PUPickerAssetMediaTypeFilter initWithMediaType:]([PUPickerAssetMediaTypeFilter alloc], "initWithMediaType:", -[PUPickerAssetMediaTypeFilter mediaType](self, "mediaType"));
}

- (PUPickerAssetMediaTypeFilter)initWithCoder:(id)a3
{
  id v4;
  PUPickerAssetMediaTypeFilter *v5;
  void *v6;
  PUPickerAssetMediaTypeFilter *v7;
  PUPickerAssetMediaTypeFilter *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPickerAssetMediaTypeFilter;
  v5 = -[PUPickerAssetMediaTypeFilter init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PUPickerAssetMediaTypeFilterDictionaryMediaTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mediaType = objc_msgSend(v6, "integerValue");

  }
  if (-[PUPickerAssetMediaTypeFilter isValidFilter](v5, "isValidFilter"))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[PUPickerAssetMediaTypeFilter mediaType](self, "mediaType"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("PUPickerAssetMediaTypeFilterDictionaryMediaTypeKey"));

}

- (int64_t)mediaType
{
  return self->_mediaType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
