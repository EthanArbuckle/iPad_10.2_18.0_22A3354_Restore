@implementation MUPlacePhotoHeaderAttributionItem

- (MUPlacePhotoHeaderAttributionItem)initWithDisplayName:(id)a3 visibility:(unint64_t)a4
{
  id v7;
  MUPlacePhotoHeaderAttributionItem *v8;
  MUPlacePhotoHeaderAttributionItem *v9;
  MUPlacePhotoHeaderAttributionItem *v10;
  objc_super v12;

  v7 = a3;
  if (objc_msgSend(v7, "length") | a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)MUPlacePhotoHeaderAttributionItem;
    v8 = -[MUPlacePhotoHeaderAttributionItem init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_displayName, a3);
      v9->_visibility = a4;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
