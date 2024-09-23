@implementation MKPlaceCardMenuBuildingOptions

- (MKPlaceCardMenuBuildingOptions)initWithRequestedActionTypes:(id)a3
{
  id v4;
  MKPlaceCardMenuBuildingOptions *v5;
  uint64_t v6;
  NSArray *requestedActionTypes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKPlaceCardMenuBuildingOptions;
  v5 = -[MKPlaceCardMenuBuildingOptions init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestedActionTypes = v5->_requestedActionTypes;
    v5->_requestedActionTypes = (NSArray *)v6;

    v5->_addMismatchedItems = 1;
  }

  return v5;
}

- (UIMenuElement)headerMenuElement
{
  return self->_headerMenuElement;
}

- (void)setHeaderMenuElement:(id)a3
{
  objc_storeStrong((id *)&self->_headerMenuElement, a3);
}

- (NSArray)requestedActionTypes
{
  return self->_requestedActionTypes;
}

- (BOOL)addMismatchedItems
{
  return self->_addMismatchedItems;
}

- (void)setAddMismatchedItems:(BOOL)a3
{
  self->_addMismatchedItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedActionTypes, 0);
  objc_storeStrong((id *)&self->_headerMenuElement, 0);
}

@end
