@implementation MUPlaceItemHeaderViewModel

- (MUPlaceItemHeaderViewModel)initWithPlaceItem:(id)a3 imageManager:(id)a4 isDeveloperPlaceCard:(BOOL)a5 developerPlaceCardAuditToken:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  MUPlaceItemHeaderViewModel *v15;
  objc_super v17;

  v7 = a5;
  v11 = a3;
  v12 = a6;
  v13 = a4;
  objc_msgSend(v11, "mapItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)MUPlaceItemHeaderViewModel;
  v15 = -[MUPlaceHeaderViewModel initWithMapItem:imageManager:isDeveloperPlaceCard:developerPlaceCardAuditToken:](&v17, sel_initWithMapItem_imageManager_isDeveloperPlaceCard_developerPlaceCardAuditToken_, v14, v13, v7, v12);

  if (v15)
    objc_storeStrong((id *)&v15->_placeItem, a3);

  return v15;
}

- (MUPlaceItemHeaderViewModel)initWithPlaceItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  MUPlaceItemHeaderViewModel *v7;

  v4 = (void *)MEMORY[0x1E0CC1750];
  v5 = a3;
  objc_msgSend(v4, "sharedImageManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MUPlaceItemHeaderViewModel initWithPlaceItem:imageManager:isDeveloperPlaceCard:developerPlaceCardAuditToken:](self, "initWithPlaceItem:imageManager:isDeveloperPlaceCard:developerPlaceCardAuditToken:", v5, v6, 0, 0);

  return v7;
}

- (MUPlaceItemHeaderViewModel)initWithPlaceItem:(id)a3 imageManager:(id)a4
{
  return -[MUPlaceItemHeaderViewModel initWithPlaceItem:imageManager:isDeveloperPlaceCard:developerPlaceCardAuditToken:](self, "initWithPlaceItem:imageManager:isDeveloperPlaceCard:developerPlaceCardAuditToken:", a3, a4, 0, 0);
}

- (MUPlaceItemHeaderViewModel)initWithPlaceItem:(id)a3 isDeveloperPlaceCard:(BOOL)a4 developerPlaceCardAuditToken:(id)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  MUPlaceItemHeaderViewModel *v12;

  v5 = a4;
  v8 = (void *)MEMORY[0x1E0CC1750];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "sharedImageManagerWithAuditToken:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MUPlaceItemHeaderViewModel initWithPlaceItem:imageManager:isDeveloperPlaceCard:developerPlaceCardAuditToken:](self, "initWithPlaceItem:imageManager:isDeveloperPlaceCard:developerPlaceCardAuditToken:", v10, v11, v5, v9);

  return v12;
}

- (BOOL)hasInitialData
{
  objc_super v4;

  if (-[MUPlaceItemHeaderViewModel isUserSpecificPlaceItem](self, "isUserSpecificPlaceItem"))
    return 1;
  if (-[MUPlaceItemHeaderViewModel showNearbyStringForContactPlaceItem](self, "showNearbyStringForContactPlaceItem"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)MUPlaceItemHeaderViewModel;
  return -[MUPlaceHeaderViewModel hasInitialData](&v4, sel_hasInitialData);
}

- (id)placeSecondaryName
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  objc_super v15;

  if (-[MUPlaceItemHeaderViewModel isUserSpecificPlaceItem](self, "isUserSpecificPlaceItem"))
  {
    -[MUPlaceItemHeaderViewModel _userSpecificPlaceSecondaryName](self, "_userSpecificPlaceSecondaryName");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v9 = (void *)v3;
    return v9;
  }
  if (!-[MUPlaceItemHeaderViewModel showNearbyStringForContactPlaceItem](self, "showNearbyStringForContactPlaceItem"))
  {
    v15.receiver = self;
    v15.super_class = (Class)MUPlaceItemHeaderViewModel;
    -[MUPlaceHeaderViewModel placeSecondaryName](&v15, sel_placeSecondaryName);
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (!MapsFeature_IsEnabled_MapsWally()
    || !-[_MKPlaceItem representsPerson](self->_placeItem, "representsPerson"))
  {
LABEL_15:
    -[MUPlaceItemHeaderViewModel _formattedDistanceString](self, "_formattedDistanceString");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  -[_MKPlaceItem contact](self->_placeItem, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postalAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "_mapkit_isSharedLocationContact");
  -[MUPlaceItemHeaderViewModel _formattedDistanceString](self, "_formattedDistanceString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "street");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    _MULocalizedStringFromThisBundle(CFSTR("Contact Shared Address [Placecard]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "length"))
    {
      v12 = v8;
LABEL_12:
      v9 = v12;
      v13 = 0;
      goto LABEL_14;
    }
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v10, v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  _MULocalizedStringFromThisBundle(CFSTR("Contact Address [Placecard]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    goto LABEL_11;
  v13 = 1;
LABEL_14:

  if (v13)
    goto LABEL_15;
  return v9;
}

- (id)addressDescriptionForContact
{
  _MKPlaceItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  __CFString *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (!MapsFeature_IsEnabled_MapsWally()
    || !-[_MKPlaceItem representsPerson](self->_placeItem, "representsPerson"))
  {
    goto LABEL_16;
  }
  v3 = self->_placeItem;
  -[_MKPlaceItem contact](v3, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postalAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "_mapkit_isSharedLocationContact") & 1) == 0)
  {
    objc_msgSend(v6, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0C96FF8]);

    if ((v9 & 1) != 0)
    {
      v10 = CFSTR("Contact Home Address [Placecard]");
    }
    else
    {
      objc_msgSend(v6, "label");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0C97070]);

      if ((v12 & 1) != 0)
      {
        v10 = CFSTR("Contact Work Address [Placecard]");
      }
      else
      {
        objc_msgSend(v6, "label");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", *MEMORY[0x1E0C97060]);

        if (v14)
          v10 = CFSTR("Contact School Address [Placecard]");
        else
          v10 = CFSTR("Contact Other Address [Placecard]");
      }
    }
    _MULocalizedStringFromThisBundle(v10);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v15);
      v22[0] = *MEMORY[0x1E0DC1138];
      objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4AD0], *MEMORY[0x1E0DC1448]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v18;
      v22[1] = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAttributes:range:", v20, 0, objc_msgSend(v17, "length"));

      v7 = (void *)objc_msgSend(v17, "copy");
      goto LABEL_14;
    }

LABEL_16:
    v7 = 0;
    return v7;
  }
  v7 = 0;
LABEL_14:

  return v7;
}

- (id)_userSpecificPlaceSecondaryName
{
  __CFString *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  if ((-[_MKPlaceItem options](self->_placeItem, "options") & 1) != 0)
  {
    _MULocalizedStringFromThisBundle(CFSTR("NEAR_BY_PLACE_HEADER_STRING"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC1810], "sharedLocationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAuthorizedForPreciseLocation");

    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_geoAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "structuredAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      objc_msgSend(v9, "fullThoroughfare");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v11);
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        return v3;
      }
    }
    else
    {
      objc_msgSend(v9, "locality");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v11);
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_geoAddress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "structuredAddress");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "administrativeAreaCode");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "length"))
        {
          -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR(", %@"), v15);
          v16 = objc_claimAutoreleasedReturnValue();

          v3 = (__CFString *)v16;
        }

        goto LABEL_11;
      }
    }
    v3 = &stru_1E2E05448;
    goto LABEL_11;
  }
  -[MUPlaceItemHeaderViewModel _formattedDistanceString](self, "_formattedDistanceString");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (BOOL)hasEnclosingPlace
{
  objc_super v4;

  if (-[MUPlaceItemHeaderViewModel isUserSpecificPlaceItem](self, "isUserSpecificPlaceItem"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)MUPlaceItemHeaderViewModel;
  return -[MUPlaceHeaderViewModel hasEnclosingPlace](&v4, sel_hasEnclosingPlace);
}

- (BOOL)isUserSpecificPlaceItem
{
  return -[_MKPlaceItem options](self->_placeItem, "options") != 0;
}

- (id)enclosingPlaceAttributedStringWithFont:(id)a3 labelColor:(id)a4 tokenColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[MUPlaceItemHeaderViewModel isUserSpecificPlaceItem](self, "isUserSpecificPlaceItem"))
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MUPlaceItemHeaderViewModel;
    -[MUPlaceHeaderViewModel enclosingPlaceAttributedStringWithFont:labelColor:tokenColor:](&v13, sel_enclosingPlaceAttributedStringWithFont_labelColor_tokenColor_, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_formattedDistanceString
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  MKDistanceFormatter *v13;
  MKDistanceFormatter *distanceFormatter;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CC1810], "sharedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_10;
  objc_msgSend(v4, "coordinate");
  v7 = 0;
  if (v6 < -180.0 || v6 > 180.0 || v5 < -90.0 || v5 > 90.0)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0CC1810], "sharedLocationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAuthorizedForPreciseLocation");

  if (!v9)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "coordinate");
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_coordinate");
  GEOCalculateDistance();
  v12 = v11;

  if (!self->_distanceFormatter)
  {
    v13 = (MKDistanceFormatter *)objc_alloc_init(MEMORY[0x1E0CC17A0]);
    distanceFormatter = self->_distanceFormatter;
    self->_distanceFormatter = v13;

    -[MKDistanceFormatter setUnitStyle:](self->_distanceFormatter, "setUnitStyle:", 1);
  }
  _MULocalizedStringFromThisBundle(CFSTR("[distance] away"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKDistanceFormatter stringFromDistance:](self->_distanceFormatter, "stringFromDistance:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v7;
}

- (id)transitLabelItems
{
  objc_super v4;

  if (-[MUPlaceItemHeaderViewModel isUserSpecificPlaceItem](self, "isUserSpecificPlaceItem"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)MUPlaceItemHeaderViewModel;
  -[MUPlaceHeaderViewModel transitLabelItems](&v4, sel_transitLabelItems);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)showNearbyStringForContactPlaceItem
{
  return -[_MKPlaceItem representsPerson](self->_placeItem, "representsPerson");
}

- (BOOL)supportsContactAddressDescription
{
  int IsEnabled_MapsWally;

  IsEnabled_MapsWally = MapsFeature_IsEnabled_MapsWally();
  if (IsEnabled_MapsWally)
    LOBYTE(IsEnabled_MapsWally) = -[_MKPlaceItem representsPerson](self->_placeItem, "representsPerson");
  return IsEnabled_MapsWally;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceFormatter, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
}

@end
