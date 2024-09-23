@implementation PUPickerAssetMediaSubtypeFilter

- (PUPickerAssetMediaSubtypeFilter)initWithFilterType:(int64_t)a3
{
  PUPickerAssetMediaSubtypeFilter *v4;
  PUPickerAssetMediaSubtypeFilter *v5;
  PUPickerAssetMediaSubtypeFilter *v6;
  PUPickerAssetMediaSubtypeFilter *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPickerAssetMediaSubtypeFilter;
  v4 = -[PUPickerAssetMediaSubtypeFilter init](&v9, sel_init);
  v5 = v4;
  if (v4)
    v4->_filterType = a3;
  if (-[PUPickerAssetMediaSubtypeFilter isValidFilter](v4, "isValidFilter"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PUPickerAssetMediaSubtypeFilter *v4;
  PUPickerAssetMediaSubtypeFilter *v5;
  objc_class *v6;
  int64_t v7;
  BOOL v8;
  objc_class *v10;
  objc_class *v11;
  PUPickerAssetMediaSubtypeFilter *v12;
  SEL v13;

  v4 = (PUPickerAssetMediaSubtypeFilter *)a3;
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
      v7 = -[PUPickerAssetMediaSubtypeFilter filterType](self, "filterType");
      v8 = v7 == -[PUPickerAssetMediaSubtypeFilter filterType](v5, "filterType");

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
  v12 = (PUPickerAssetMediaSubtypeFilter *)_PFAssertFailHandler();
  return -[PUPickerAssetMediaSubtypeFilter hash](v12, v13);
}

- (unint64_t)hash
{
  return -[PUPickerAssetMediaSubtypeFilter filterType](self, "filterType") + 179;
}

- (BOOL)isValidFilter
{
  unint64_t v2;
  NSObject *v3;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = -[PUPickerAssetMediaSubtypeFilter filterType](self, "filterType");
  if (v2 >= 0xB)
  {
    PLPickerGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 134217984;
      v6 = v2;
      _os_log_impl(&dword_20D1E2000, v3, OS_LOG_TYPE_ERROR, "PUPickerAssetMediaSubtypeFilter: invalid filter type: %ld", (uint8_t *)&v5, 0xCu);
    }

  }
  return v2 < 0xB;
}

- (BOOL)allowsSearchSuggestions
{
  return 0;
}

- (BOOL)allowsAlbums
{
  return 0;
}

- (id)generatedAssetPredicate
{
  void *v2;
  uint64_t v3;
  id result;
  void *v5;

  switch(-[PUPickerAssetMediaSubtypeFilter filterType](self, "filterType"))
  {
    case 0:
      v2 = (void *)MEMORY[0x24BE71FE0];
      v3 = 1;
      goto LABEL_12;
    case 1:
      v2 = (void *)MEMORY[0x24BE71FE0];
      v3 = 10;
      goto LABEL_12;
    case 2:
      objc_msgSend(MEMORY[0x24BE71FE0], "predicateForDepthEffectPhotos");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 3:
      objc_msgSend(MEMORY[0x24BE71FE0], "predicateForBurstStackAssets");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 4:
      objc_msgSend(MEMORY[0x24BE71FE0], "predicateForStyleableAssets");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 5:
      v2 = (void *)MEMORY[0x24BE71FE0];
      v3 = 100;
      goto LABEL_12;
    case 6:
      v2 = (void *)MEMORY[0x24BE71FE0];
      v3 = 101;
      goto LABEL_12;
    case 7:
      v2 = (void *)MEMORY[0x24BE71FE0];
      v3 = 102;
      goto LABEL_12;
    case 8:
      v2 = (void *)MEMORY[0x24BE71FE0];
      v3 = 103;
LABEL_12:
      objc_msgSend(v2, "predicateForAssetSubtype:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 9:
      objc_msgSend(MEMORY[0x24BE71FE0], "predicateForCinematicVideos");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 10:
      objc_msgSend(MEMORY[0x24BE71FE0], "predicateForSpatialMedia");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      result = v5;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (unint64_t)generatedPossibleAssetTypes
{
  unint64_t v2;

  v2 = -[PUPickerAssetMediaSubtypeFilter filterType](self, "filterType");
  if (v2 > 0xA)
    return 0;
  else
    return qword_20D20B308[v2];
}

- (unint64_t)generatedRequiredAssetTypes
{
  unint64_t v2;

  v2 = -[PUPickerAssetMediaSubtypeFilter filterType](self, "filterType");
  if (v2 > 0xA)
    return 0;
  else
    return qword_20D20B360[v2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PUPickerAssetMediaSubtypeFilter initWithFilterType:]([PUPickerAssetMediaSubtypeFilter alloc], "initWithFilterType:", -[PUPickerAssetMediaSubtypeFilter filterType](self, "filterType"));
}

- (PUPickerAssetMediaSubtypeFilter)initWithCoder:(id)a3
{
  id v4;
  PUPickerAssetMediaSubtypeFilter *v5;
  void *v6;
  PUPickerAssetMediaSubtypeFilter *v7;
  PUPickerAssetMediaSubtypeFilter *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPickerAssetMediaSubtypeFilter;
  v5 = -[PUPickerAssetMediaSubtypeFilter init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PUPickerAssetMediaSubtypeFilterDictionaryFilterTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_filterType = objc_msgSend(v6, "integerValue");

  }
  if (-[PUPickerAssetMediaSubtypeFilter isValidFilter](v5, "isValidFilter"))
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
  objc_msgSend(v4, "numberWithInteger:", -[PUPickerAssetMediaSubtypeFilter filterType](self, "filterType"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("PUPickerAssetMediaSubtypeFilterDictionaryFilterTypeKey"));

}

- (int64_t)filterType
{
  return self->_filterType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
