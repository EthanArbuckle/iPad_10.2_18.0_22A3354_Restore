@implementation _MKMapItemPlaceItem

+ (id)placeItemWithMapItem:(id)a3 options:(unint64_t)a4
{
  id v7;
  id v8;
  _QWORD *v9;

  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)v8 + 1, a3);
    v9[2] = a4;
  }

  return v9;
}

+ (id)placeItemWithMapItem:(id)a3 options:(unint64_t)a4 isIntermediateMapItem:(BOOL)a5
{
  id v9;
  id *v10;
  id *v11;

  v9 = a3;
  v10 = (id *)objc_alloc_init((Class)a1);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(v10 + 1, a3);
    v11[2] = (id)a4;
    *((_BYTE *)v11 + 24) = a5;
  }

  return v11;
}

- (NSString)name
{
  return -[MKMapItem name](self->_mapItem, "name");
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
  return 0;
}

- (BOOL)isContactPersisted
{
  return 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setIsSuggestedFavorite:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_options = self->_options & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)isIntermediateMapItem
{
  return self->_isIntermediateMapItem;
}

- (BOOL)hasContactOnly
{
  return 0;
}

- (BOOL)representsPerson
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
