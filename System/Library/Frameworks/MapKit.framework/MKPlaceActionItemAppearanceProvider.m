@implementation MKPlaceActionItemAppearanceProvider

- (MKPlaceActionItemAppearanceProvider)initWithActionType:(unint64_t)a3 dataProvider:(id)a4
{
  id v6;
  MKPlaceActionItemAppearanceProvider *v7;
  MKPlaceActionItemAppearanceProvider *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MKPlaceActionItemAppearanceProvider;
  v7 = -[MKPlaceActionItemAppearanceProvider init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_actionType = a3;
    objc_storeWeak((id *)&v7->_dataProvider, v6);
    v8->_myPlacesEnabled = MapsFeature_IsEnabled_MyPlacesFeatures();
  }

  return v8;
}

- (id)bestTitleForDisplayStyle:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;

  if (a3)
  {
    if (a3 == 1)
    {
      -[MKPlaceActionItemAppearanceProvider _compactTitle](self, "_compactTitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "length"))
      {
        v5 = v4;
      }
      else
      {
        -[MKPlaceActionItemAppearanceProvider _longTitle](self, "_longTitle");
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = v5;

    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    -[MKPlaceActionItemAppearanceProvider _longTitle](self, "_longTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_longTitle
{
  __CFString *v2;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v2 = 0;
  switch(self->_actionType)
  {
    case 1uLL:
      v4 = CFSTR("Report an Issue [Button Title]");
      goto LABEL_41;
    case 2uLL:
      if (GEOConfigGetBOOL())
        v4 = CFSTR("[Report an Issue] Report Something Missing");
      else
        v4 = CFSTR("[Report an Issue] Add to Maps");
      goto LABEL_41;
    case 4uLL:
      v4 = CFSTR("Create New Contact");
      goto LABEL_41;
    case 5uLL:
      v4 = CFSTR("Save to [Footer action]");
      goto LABEL_41;
    case 6uLL:
      v4 = CFSTR("Remove from Guide [Footer action]");
      goto LABEL_41;
    case 9uLL:
      v4 = CFSTR("Add Photos");
      goto LABEL_41;
    case 0xAuLL:
      v4 = CFSTR("Call");
      goto LABEL_41;
    case 0xBuLL:
      v4 = CFSTR("Message");
      goto LABEL_41;
    case 0xDuLL:
      v4 = CFSTR("Website");
      goto LABEL_41;
    case 0x10uLL:
      v4 = CFSTR("Share_Action_Row");
      goto LABEL_41;
    case 0x11uLL:
      v4 = CFSTR("Flyover [Placecard]");
      goto LABEL_41;
    case 0x12uLL:
      v4 = CFSTR("Add to Existing Contact");
      goto LABEL_41;
    case 0x13uLL:
      v4 = CFSTR("Remove");
      goto LABEL_41;
    case 0x14uLL:
      v4 = CFSTR("Stores_Action_Row");
      goto LABEL_41;
    case 0x15uLL:
      v4 = CFSTR("Add to Guides [Footer action]");
      goto LABEL_41;
    case 0x16uLL:
      if (self->_myPlacesEnabled)
        v4 = CFSTR("Pin_Actions_Row");
      else
        v4 = CFSTR("Add_Shortcut_Actions_Row");
      goto LABEL_41;
    case 0x17uLL:
      if (self->_myPlacesEnabled)
        v4 = CFSTR("UnPin_Actions_Row");
      else
        v4 = CFSTR("Remove_Shortcut_Actions_Row");
      goto LABEL_41;
    case 0x18uLL:
      v4 = CFSTR("Refine Location");
      goto LABEL_41;
    case 0x19uLL:
      v4 = CFSTR("Change Address");
      goto LABEL_41;
    case 0x1BuLL:
      v4 = CFSTR("Copy Coordinates");
      goto LABEL_41;
    case 0x1CuLL:
      v4 = CFSTR("Mark_Location_Action_Row");
      goto LABEL_41;
    case 0x1DuLL:
      v4 = CFSTR("Copy Link");
      goto LABEL_41;
    case 0x1FuLL:
      v4 = CFSTR("Claim This Place [Placecard]");
      goto LABEL_41;
    case 0x22uLL:
      _MKLocalizedStringFromThisBundleFromTable(CFSTR("Download_Map_Action_Row_Long"), CFSTR("Offline"));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    case 0x25uLL:
      v4 = CFSTR("Add to Library [Placecard]");
      goto LABEL_41;
    case 0x26uLL:
      v4 = CFSTR("Delete from Library [Placecard]");
      goto LABEL_41;
    case 0x27uLL:
      v4 = CFSTR("Add a Note [Placecard]");
      goto LABEL_41;
    case 0x28uLL:
      v4 = CFSTR("Edit Note [Placecard]");
      goto LABEL_41;
    case 0x29uLL:
      v4 = CFSTR("Create a Custom Route [Placecard]");
LABEL_41:
      _MKLocalizedStringFromThisBundle(v4);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_42:
      v2 = (__CFString *)v5;
      break;
    case 0x2AuLL:
      v2 = CFSTR("Simulate Location");
      break;
    case 0x2BuLL:
      v6 = (void *)MEMORY[0x1E0CB3940];
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Identifier: %llu"), objc_msgSend(WeakRetained, "placeMUIDForAppearance:", self));
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 0x2CuLL:
      v2 = CFSTR("Save MapItem");
      break;
    case 0x2DuLL:
      v2 = CFSTR("Clear MapItem");
      break;
    default:
      return v2;
  }
  return v2;
}

- (id)bestSymbolNameForDisplayStyle:(unint64_t)a3
{
  void *v3;

  if (a3)
  {
    if (a3 == 1)
    {
      -[MKPlaceActionItemAppearanceProvider _menuSymbol](self, "_menuSymbol");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    -[MKPlaceActionItemAppearanceProvider _tableCellSymbol](self, "_tableCellSymbol");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_tableCellSymbol
{
  _BOOL4 IsMacCatalyst;
  __CFString *v4;
  __CFString *v6;
  const __CFString *v7;
  id WeakRetained;
  int v9;

  IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v4 = 0;
  switch(self->_actionType)
  {
    case 1uLL:
      v6 = CFSTR("exclamationmark.bubble.fill");
      v7 = CFSTR("exclamationmark.bubble");
      goto LABEL_29;
    case 2uLL:
      return CFSTR("pin.point.of.interest.badge.plus.fill");
    case 4uLL:
      return CFSTR("person.crop.circle");
    case 5uLL:
      goto LABEL_23;
    case 6uLL:
      v6 = CFSTR("star.slash.fill");
      v7 = CFSTR("star.slash");
      goto LABEL_29;
    case 9uLL:
      return CFSTR("camera.fill");
    case 0xAuLL:
      v6 = CFSTR("phone.fill");
      v7 = CFSTR("phone");
      goto LABEL_29;
    case 0xBuLL:
      v6 = CFSTR("message.fill");
      v7 = CFSTR("message");
      goto LABEL_29;
    case 0xDuLL:
      v6 = CFSTR("safari.fill");
      v7 = CFSTR("safari");
      goto LABEL_29;
    case 0x10uLL:
      return CFSTR("square.and.arrow.up");
    case 0x11uLL:
      return CFSTR("buildings.3d");
    case 0x12uLL:
      return CFSTR("person.crop.circle.badge.plus");
    case 0x13uLL:
      v6 = CFSTR("trash.fill");
      v7 = CFSTR("trash");
      goto LABEL_29;
    case 0x14uLL:
    case 0x1CuLL:
      return CFSTR("mappin");
    case 0x15uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
      v9 = objc_msgSend(WeakRetained, "placeInCollectionsForAppearance:", self);

      if (v9)
      {
        v6 = CFSTR("checkmark.square.fill");
        v7 = CFSTR("checkmark.square");
      }
      else
      {
        v6 = CFSTR("plus.square.fill");
        v7 = CFSTR("plus.square");
      }
      goto LABEL_29;
    case 0x16uLL:
      if (self->_myPlacesEnabled)
        return CFSTR("pin");
LABEL_23:
      v6 = CFSTR("star.fill");
      v7 = CFSTR("star");
LABEL_29:
      if (IsMacCatalyst)
        v6 = (__CFString *)v7;
LABEL_31:
      v4 = v6;
      return v4;
    case 0x17uLL:
      if (self->_myPlacesEnabled)
        v6 = CFSTR("pin.slash");
      else
        v6 = CFSTR("star.slash");
      goto LABEL_31;
    case 0x18uLL:
      return CFSTR("mappin.and.ellipse");
    case 0x19uLL:
      return CFSTR("pencil");
    case 0x1FuLL:
      v6 = CFSTR("checkmark.seal.fill");
      v7 = CFSTR("checkmark.seal");
      goto LABEL_29;
    case 0x22uLL:
      return CFSTR("arrow.down.circle");
    case 0x2AuLL:
      v6 = CFSTR("location.fill");
      v7 = CFSTR("location");
      goto LABEL_29;
    default:
      return v4;
  }
}

- (id)_menuSymbol
{
  _BOOL4 IsMacCatalyst;
  __CFString *v4;
  id WeakRetained;
  int v6;
  __CFString *v7;
  _BOOL4 myPlacesEnabled;
  const __CFString *v9;
  const __CFString *v10;

  IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v4 = 0;
  switch(self->_actionType)
  {
    case 1uLL:
      v4 = CFSTR("exclamationmark.bubble");
      break;
    case 2uLL:
      v4 = CFSTR("pin.point.of.interest.badge.plus");
      break;
    case 4uLL:
      v4 = CFSTR("person.crop.circle");
      break;
    case 5uLL:
      v4 = CFSTR("star");
      break;
    case 6uLL:
      v4 = CFSTR("star.slash");
      break;
    case 9uLL:
      v4 = CFSTR("camera");
      break;
    case 0xAuLL:
      v4 = CFSTR("phone");
      break;
    case 0xBuLL:
      v4 = CFSTR("message");
      break;
    case 0xDuLL:
      v4 = CFSTR("safari");
      break;
    case 0x10uLL:
      v4 = CFSTR("square.and.arrow.up");
      break;
    case 0x11uLL:
      v4 = CFSTR("buildings.3d");
      break;
    case 0x12uLL:
      v4 = CFSTR("person.crop.circle.badge.plus");
      break;
    case 0x13uLL:
    case 0x26uLL:
      v4 = CFSTR("trash");
      break;
    case 0x14uLL:
    case 0x1CuLL:
      v4 = CFSTR("mappin");
      break;
    case 0x15uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
      v6 = objc_msgSend(WeakRetained, "placeInCollectionsForAppearance:", self);

      v4 = CFSTR("plus.square");
      if (v6)
      {
        v7 = CFSTR("checkmark.square");
        if (!IsMacCatalyst)
          v7 = CFSTR("plus.square");
        goto LABEL_26;
      }
      break;
    case 0x16uLL:
      myPlacesEnabled = self->_myPlacesEnabled;
      v9 = CFSTR("pin");
      v10 = CFSTR("star");
      goto LABEL_23;
    case 0x17uLL:
      myPlacesEnabled = self->_myPlacesEnabled;
      v9 = CFSTR("pin.slash");
      v10 = CFSTR("star.slash");
LABEL_23:
      if (myPlacesEnabled)
        v7 = (__CFString *)v9;
      else
        v7 = (__CFString *)v10;
LABEL_26:
      v4 = v7;
      break;
    case 0x18uLL:
      v4 = CFSTR("mappin.and.ellipse");
      break;
    case 0x19uLL:
    case 0x28uLL:
      v4 = CFSTR("pencil");
      break;
    case 0x1FuLL:
      v4 = CFSTR("checkmark.seal");
      break;
    case 0x22uLL:
      v4 = CFSTR("arrow.down.circle");
      break;
    case 0x25uLL:
      v4 = CFSTR("plus");
      break;
    case 0x27uLL:
      v4 = CFSTR("note.text.badge.plus");
      break;
    case 0x29uLL:
      v4 = CFSTR("location.bottomleft.forward.to.point.topright.scurvepath.dashed");
      break;
    case 0x2AuLL:
      v4 = CFSTR("location");
      break;
    default:
      return v4;
  }
  return v4;
}

- (id)_compactTitle
{
  void *v3;
  __CFString *v4;

  v3 = 0;
  switch(self->_actionType)
  {
    case 0xAuLL:
      v4 = CFSTR("Call");
      goto LABEL_11;
    case 0xBuLL:
      v4 = CFSTR("Message");
      goto LABEL_11;
    case 0xDuLL:
      v4 = CFSTR("Website");
      goto LABEL_11;
    case 0x10uLL:
      v4 = CFSTR("Share_Action_Row");
      goto LABEL_11;
    case 0x11uLL:
      v4 = CFSTR("Flyover [Placecard]");
      goto LABEL_11;
    case 0x14uLL:
      v4 = CFSTR("Stores_Action_Row");
      goto LABEL_11;
    case 0x15uLL:
      v4 = CFSTR("Save_Collection_Actions_Row");
      goto LABEL_11;
    case 0x1CuLL:
      v4 = CFSTR("Mark_Location_Action_Row");
      goto LABEL_11;
    case 0x1FuLL:
      v4 = CFSTR("Claim [Placecard Action Row]");
LABEL_11:
      _MKLocalizedStringFromThisBundle(v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0x22uLL:
      _MKLocalizedStringFromThisBundleFromTable(CFSTR("Download_Map_Action_Row_Short"), CFSTR("Offline"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v3;
  }
  return v3;
}

- (BOOL)isDestructiveForDisplayStyle:(unint64_t)a3
{
  if (a3 == 1)
    return -[MKPlaceActionItemAppearanceProvider _isDestructiveForMenu](self, "_isDestructiveForMenu");
  if (a3)
    return 0;
  return -[MKPlaceActionItemAppearanceProvider _isDestructiveForTableCell](self, "_isDestructiveForTableCell");
}

- (BOOL)_isDestructiveForTableCell
{
  return (self->_actionType < 0x27) & (0x4000880000uLL >> self->_actionType);
}

- (BOOL)_isDestructiveForMenu
{
  unint64_t actionType;

  actionType = self->_actionType;
  return actionType == 19 || actionType == 38;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataProvider);
}

@end
