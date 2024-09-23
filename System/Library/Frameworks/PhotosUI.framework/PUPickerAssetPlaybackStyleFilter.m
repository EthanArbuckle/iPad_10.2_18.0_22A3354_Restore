@implementation PUPickerAssetPlaybackStyleFilter

- (PUPickerAssetPlaybackStyleFilter)initWithPlaybackStyle:(int64_t)a3
{
  PUPickerAssetPlaybackStyleFilter *v4;
  PUPickerAssetPlaybackStyleFilter *v5;
  PUPickerAssetPlaybackStyleFilter *v6;
  PUPickerAssetPlaybackStyleFilter *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPickerAssetPlaybackStyleFilter;
  v4 = -[PUPickerAssetPlaybackStyleFilter init](&v9, sel_init);
  v5 = v4;
  if (v4)
    v4->_playbackStyle = a3;
  if (-[PUPickerAssetPlaybackStyleFilter isValidFilter](v4, "isValidFilter"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PUPickerAssetPlaybackStyleFilter *v4;
  PUPickerAssetPlaybackStyleFilter *v5;
  objc_class *v6;
  int64_t v7;
  BOOL v8;
  objc_class *v10;
  objc_class *v11;
  PUPickerAssetPlaybackStyleFilter *v12;
  SEL v13;

  v4 = (PUPickerAssetPlaybackStyleFilter *)a3;
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
      v7 = -[PUPickerAssetPlaybackStyleFilter playbackStyle](self, "playbackStyle");
      v8 = v7 == -[PUPickerAssetPlaybackStyleFilter playbackStyle](v5, "playbackStyle");

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
  v12 = (PUPickerAssetPlaybackStyleFilter *)_PFAssertFailHandler();
  return -[PUPickerAssetPlaybackStyleFilter hash](v12, v13);
}

- (unint64_t)hash
{
  return -[PUPickerAssetPlaybackStyleFilter playbackStyle](self, "playbackStyle") + 53;
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
  v2 = -[PUPickerAssetPlaybackStyleFilter playbackStyle](self, "playbackStyle");
  v3 = v2 - 1;
  if ((unint64_t)(v2 - 1) >= 5)
  {
    v4 = v2;
    PLPickerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_20D1E2000, v5, OS_LOG_TYPE_ERROR, "PUPickerAssetPlaybackStyleFilter: invalid playback style: %ld", (uint8_t *)&v7, 0xCu);
    }

  }
  return v3 < 5;
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
  int64_t v2;
  void *v3;

  v2 = -[PUPickerAssetPlaybackStyleFilter playbackStyle](self, "playbackStyle");
  if ((unint64_t)(v2 - 1) > 4)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("noindex:(%K) == %d"), CFSTR("playbackStyle"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unint64_t)generatedPossibleAssetTypes
{
  int64_t v2;

  v2 = -[PUPickerAssetPlaybackStyleFilter playbackStyle](self, "playbackStyle");
  if ((unint64_t)(v2 - 1) > 4)
    return 0;
  else
    return qword_20D20B2E0[v2 - 1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PUPickerAssetPlaybackStyleFilter initWithPlaybackStyle:]([PUPickerAssetPlaybackStyleFilter alloc], "initWithPlaybackStyle:", -[PUPickerAssetPlaybackStyleFilter playbackStyle](self, "playbackStyle"));
}

- (PUPickerAssetPlaybackStyleFilter)initWithCoder:(id)a3
{
  id v4;
  PUPickerAssetPlaybackStyleFilter *v5;
  void *v6;
  PUPickerAssetPlaybackStyleFilter *v7;
  PUPickerAssetPlaybackStyleFilter *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPickerAssetPlaybackStyleFilter;
  v5 = -[PUPickerAssetPlaybackStyleFilter init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PUPickerAssetPlaybackStyleFilterDictionaryPlaybackStyleKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_playbackStyle = objc_msgSend(v6, "integerValue");

  }
  if (-[PUPickerAssetPlaybackStyleFilter isValidFilter](v5, "isValidFilter"))
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
  objc_msgSend(v4, "numberWithInteger:", -[PUPickerAssetPlaybackStyleFilter playbackStyle](self, "playbackStyle"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("PUPickerAssetPlaybackStyleFilterDictionaryPlaybackStyleKey"));

}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
