@implementation HFFakeMediaAccessoryItem

- (HFFakeMediaAccessoryItem)initWithMediaAccessoryItemType:(int64_t)a3
{
  HFFakeMediaAccessoryItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFFakeMediaAccessoryItem;
  result = -[HFFakeMediaAccessoryItem init](&v5, sel_init);
  if (result)
    result->_mediaAccessoryItemType = a3;
  return result;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  HFMediaAccessoryItemTypeDescription(-[HFFakeMediaAccessoryItem mediaAccessoryItemType](self, "mediaAccessoryItemType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Fake %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createControlItemsWithOptions:(id)a3
{
  return (id)objc_opt_new();
}

- (id)_subclass_updateWithOptions:(id)a3
{
  HFMutableItemUpdateOutcome *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(HFMutableItemUpdateOutcome);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("HFResultMediaRouteIdentifierKey"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)mediaAccessoryItemType
{
  return self->_mediaAccessoryItemType;
}

- (void)setMediaAccessoryItemType:(int64_t)a3
{
  self->_mediaAccessoryItemType = a3;
}

@end
