@implementation MKPlaceItemActionDataProvider

- (void)updateWithPlaceItem:(id)a3 options:(unint64_t)a4
{
  id v7;
  id v8;

  v7 = a3;
  if (*(_OWORD *)&self->_placeItem != __PAIR128__(a4, (unint64_t)v7))
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_placeItem, a3);
    self->_options = a4;
    -[MKPlaceItemActionDataProvider _placeItemDidUpdate](self, "_placeItemDidUpdate");
    v7 = v8;
  }

}

- (BOOL)supportsMessagesForBusiness
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MKPlaceItemActionDataProvider mapItem](self, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_messageURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)messagesForBusinessURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[MKPlaceItemActionDataProvider supportsMessagesForBusiness](self, "supportsMessagesForBusiness"))
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    -[MKPlaceItemActionDataProvider mapItem](self, "mapItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_messageURLString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MKMapItem)mapItem
{
  return (MKMapItem *)-[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
}

- (BOOL)canShowCallAction
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[MKPlaceItemActionDataProvider contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[MKPlaceItemActionDataProvider placeItem](self, "placeItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_msgSend(v5, "options") & 8) == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CNContact)contact
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_MKPlaceItem contact](self->_placeItem, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_placeCardContact");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (CNContact *)v5;
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeItem, 0);
}

@end
