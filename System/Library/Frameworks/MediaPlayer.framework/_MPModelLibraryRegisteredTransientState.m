@implementation _MPModelLibraryRegisteredTransientState

- (int64_t)addState
{
  return self->_addState;
}

- (void)setAddState:(int64_t)a3
{
  self->_addState = a3;
}

- (int64_t)keepLocalState
{
  return self->_keepLocalState;
}

- (void)setKeepLocalState:(int64_t)a3
{
  self->_keepLocalState = a3;
}

- (int64_t)favoriteState
{
  return self->_favoriteState;
}

- (void)setFavoriteState:(int64_t)a3
{
  self->_favoriteState = a3;
}

- (MPSectionedCollection)modelObjects
{
  return self->_modelObjects;
}

- (void)setModelObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (MPSectionedCollection)relatedModelObjects
{
  return self->_relatedModelObjects;
}

- (void)setRelatedModelObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSUUID)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_relatedModelObjects, 0);
  objc_storeStrong((id *)&self->_modelObjects, 0);
}

@end
