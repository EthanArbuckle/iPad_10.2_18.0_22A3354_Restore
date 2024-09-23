@implementation SUUISettingsDescriptionUpdate

- (SUUISettingsDescriptionUpdate)initWithUpdateType:(int64_t)a3
{
  SUUISettingsDescriptionUpdate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUISettingsDescriptionUpdate;
  result = -[SUUISettingsDescriptionUpdate init](&v5, sel_init);
  if (result)
    result->_updateType = a3;
  return result;
}

- (NSArray)indexPaths
{
  return self->_indexPaths;
}

- (void)setIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_indexPaths, a3);
}

- (NSIndexSet)indexSet
{
  return self->_indexSet;
}

- (void)setIndexSet:(id)a3
{
  objc_storeStrong((id *)&self->_indexSet, a3);
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSet, 0);
  objc_storeStrong((id *)&self->_indexPaths, 0);
}

@end
