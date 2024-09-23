@implementation _MKContactPlaceItem

+ (id)placeItemWithMapItem:(id)a3 contact:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  id *v11;
  id *v12;

  v9 = a3;
  v10 = a4;
  v11 = (id *)objc_alloc_init((Class)a1);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 1, a3);
    objc_storeStrong(v12 + 2, a4);
    v12[3] = (id)a5;
  }

  return v12;
}

- (NSString)name
{
  CNContact *contact;
  void *v4;
  id v5;
  void *v6;

  contact = self->_contact;
  if (!contact)
    goto LABEL_8;
  -[CNContact nickname](contact, "nickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", self->_contact, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (!objc_msgSend(v5, "length"))
  {

LABEL_8:
    -[MKMapItem name](self->_mapItem, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v6;
  }

  return (NSString *)v6;
}

- (BOOL)representsPerson
{
  return (-[_MKContactPlaceItem options](self, "options") >> 5) & 1;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (EKCalendarItem)calendarItem
{
  return 0;
}

- (CNContact)contact
{
  return self->_contact;
}

- (BOOL)isContactPersisted
{
  return 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)isIntermediateMapItem
{
  return 0;
}

- (BOOL)hasContactOnly
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
