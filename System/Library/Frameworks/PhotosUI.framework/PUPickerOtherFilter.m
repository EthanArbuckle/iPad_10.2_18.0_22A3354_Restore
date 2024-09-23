@implementation PUPickerOtherFilter

- (PUPickerOtherFilter)initWithFilterType:(int64_t)a3
{
  PUPickerOtherFilter *v4;
  PUPickerOtherFilter *v5;
  PUPickerOtherFilter *v6;
  PUPickerOtherFilter *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPickerOtherFilter;
  v4 = -[PUPickerOtherFilter init](&v9, sel_init);
  v5 = v4;
  if (v4)
    v4->_filterType = a3;
  if (-[PUPickerOtherFilter isValidFilter](v4, "isValidFilter"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PUPickerOtherFilter *v4;
  PUPickerOtherFilter *v5;
  objc_class *v6;
  int64_t v7;
  BOOL v8;
  objc_class *v10;
  objc_class *v11;
  PUPickerOtherFilter *v12;
  SEL v13;

  v4 = (PUPickerOtherFilter *)a3;
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
      v7 = -[PUPickerOtherFilter filterType](self, "filterType");
      v8 = v7 == -[PUPickerOtherFilter filterType](v5, "filterType");

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
  v12 = (PUPickerOtherFilter *)_PFAssertFailHandler();
  return -[PUPickerOtherFilter hash](v12, v13);
}

- (unint64_t)hash
{
  return -[PUPickerOtherFilter filterType](self, "filterType") + 199;
}

- (BOOL)isValidFilter
{
  int64_t v2;
  NSObject *v3;
  int v5;
  int64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = -[PUPickerOtherFilter filterType](self, "filterType");
  if (v2)
  {
    PLPickerGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 134217984;
      v6 = v2;
      _os_log_impl(&dword_20D1E2000, v3, OS_LOG_TYPE_ERROR, "PUPickerOtherFilter: invalid filter type: %ld", (uint8_t *)&v5, 0xCu);
    }

  }
  return v2 == 0;
}

- (BOOL)allowsSearchSuggestions
{
  return 0;
}

- (BOOL)allowsAlbums
{
  return 1;
}

- (id)generatedAssetPredicate
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  if (-[PUPickerOtherFilter filterType](self, "filterType"))
    return 0;
  v3 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K < %f"), CFSTR("stickerConfidenceScore"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v5 = (void *)MEMORY[0x24BDD1758];
  PLStickerSuggestionConfidenceThreshold();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K > %f"), CFSTR("stickerConfidenceScore"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)generatedPossibleAssetTypes
{
  return 131070;
}

- (unint64_t)generatedRequiredAssetTypes
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PUPickerOtherFilter initWithFilterType:]([PUPickerOtherFilter alloc], "initWithFilterType:", -[PUPickerOtherFilter filterType](self, "filterType"));
}

- (PUPickerOtherFilter)initWithCoder:(id)a3
{
  id v4;
  PUPickerOtherFilter *v5;
  void *v6;
  PUPickerOtherFilter *v7;
  PUPickerOtherFilter *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPickerOtherFilter;
  v5 = -[PUPickerOtherFilter init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PUPickerOtherFilterDictionaryFilterTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_filterType = objc_msgSend(v6, "integerValue");

  }
  if (-[PUPickerOtherFilter isValidFilter](v5, "isValidFilter"))
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
  objc_msgSend(v4, "numberWithInteger:", -[PUPickerOtherFilter filterType](self, "filterType"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("PUPickerOtherFilterDictionaryFilterTypeKey"));

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
