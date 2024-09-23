@implementation MPModelLibraryFavoriteEntityRequestAction

- (MPModelLibraryFavoriteEntityRequestAction)initWithChangeAction:(int64_t)a3
{
  MPModelLibraryFavoriteEntityRequestAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelLibraryFavoriteEntityRequestAction;
  result = -[MPModelLibraryFavoriteEntityRequestAction init](&v5, sel_init);
  if (result)
    result->_changeRequestAction = a3;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  MPNSStringForFavoriteEntityChangeRequestAction(self->_changeRequestAction);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MPModelLibraryFavoriteEntityRequestAction=%p, action=%@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)changeRequestAction
{
  return self->_changeRequestAction;
}

@end
