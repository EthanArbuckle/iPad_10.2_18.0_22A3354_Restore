@implementation MUPlaceActionManager

- (id)createFooterActions
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  unint64_t v7;
  _BOOL4 v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;

  -[MKPlaceActionManager mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_placeDisplayStyle");

  if (v4 != 2)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = -[MKPlaceActionManager options](self, "options");
    v8 = -[MKPlaceActionManager isCurrentLocation](self, "isCurrentLocation");
    -[MKPlaceActionManager placeItem](self, "placeItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "options");

    -[MKPlaceActionManager placeItem](self, "placeItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "_isMapItemTypeAddress");

    if ((v7 & 0x8000000000) != 0)
    {
      -[MUPlaceActionManager _addDeveloperPlaceCardFooterActions:](self, "_addDeveloperPlaceCardFooterActions:", v6);
    }
    else
    {
      if (v8)
      {
        -[MUPlaceActionManager _addMyLocationFooterActions:](self, "_addMyLocationFooterActions:", v6);
LABEL_12:
        -[MKPlaceActionManager _addInternalOnlyActions:](self, "_addInternalOnlyActions:", v6);
        goto LABEL_13;
      }
      if ((v10 & 2) != 0)
      {
        -[MUPlaceActionManager _addDroppedPinFooterActions:](self, "_addDroppedPinFooterActions:", v6);
        goto LABEL_12;
      }
      if (!v13)
      {
        -[MUPlaceActionManager _addBasicFooterActions:](self, "_addBasicFooterActions:", v6);
        goto LABEL_12;
      }
      -[MUPlaceActionManager _addAddressFooterActions:](self, "_addAddressFooterActions:", v6);
    }
LABEL_13:
    v5 = (void *)objc_msgSend(v6, "copy");

    return v5;
  }
  -[MKPlaceActionManager shortPlacecardFooterActions](self, "shortPlacecardFooterActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (void)_addItemIfInMapsApp:(id)a3 actions:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((-[MKPlaceActionManager options](self, "options") & 0x20000000) != 0)
    objc_msgSend(v6, "addObject:", v7);

}

- (id)createMenuActions
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  objc_super v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceActionManager flyoverActionItem](self, "flyoverActionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[MKPlaceActionManager dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsAddingPhotos");

  if (v6)
  {
    +[MKPlaceCardActionItem actionItemWithType:actionDataProvider:enabled:](MKPlaceCardActionItem, "actionItemWithType:actionDataProvider:enabled:", 9, self, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (GEOSupportsOfflineMaps())
  {
    +[MKPlaceCardActionItem actionItemWithType:](MKPlaceCardActionItem, "actionItemWithType:", 34);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  v14.receiver = self;
  v14.super_class = (Class)MUPlaceActionManager;
  -[MKPlaceActionManager createRowActionsWithStyle:](&v14, sel_createRowActionsWithStyle_, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  v13.receiver = self;
  v13.super_class = (Class)MUPlaceActionManager;
  -[MKPlaceActionManager createFooterActions](&v13, sel_createFooterActions);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (void)_addBasicFooterActions:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MKPlaceActionManager reportAProblemFooterAction](self, "reportAProblemFooterAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  -[MUPlaceActionManager _addHomeActionIfNeeded:](self, "_addHomeActionIfNeeded:", v6);
  if (-[MKPlaceActionManager _canClaimThisBusiness](self, "_canClaimThisBusiness"))
  {
    -[MKPlaceActionManager claimBusinessActionItem](self, "claimBusinessActionItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

  }
}

- (void)_addDeveloperPlaceCardFooterActions:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MKPlaceActionManager developerPlaceCardGetDirectionsFooterAction](self, "developerPlaceCardGetDirectionsFooterAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[MKPlaceActionManager developerPlaceCardOpenInMapsFooterAction](self, "developerPlaceCardOpenInMapsFooterAction");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

}

- (void)_addDroppedPinFooterActions:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MKPlaceActionManager reportAProblemAddPlaceFooterAction](self, "reportAProblemAddPlaceFooterAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceActionManager _addItemIfInMapsApp:actions:](self, "_addItemIfInMapsApp:actions:", v5, v4);

  -[MUPlaceActionManager _addHomeActionIfNeeded:](self, "_addHomeActionIfNeeded:", v4);
  -[MKPlaceActionManager removeMarkerItem](self, "removeMarkerItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

}

- (void)_addMyLocationFooterActions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((-[MKPlaceActionManager options](self, "options") & 0x20000000) != 0)
    -[MKPlaceActionManager reportAProblemAddPlaceFooterAction](self, "reportAProblemAddPlaceFooterAction");
  else
    -[MKPlaceActionManager reportAProblemFooterAction](self, "reportAProblemFooterAction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (void)_addAddressFooterActions:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MKPlaceActionManager reportAProblemAddPlaceFooterAction](self, "reportAProblemAddPlaceFooterAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceActionManager _addItemIfInMapsApp:actions:](self, "_addItemIfInMapsApp:actions:", v4, v5);

  -[MUPlaceActionManager _addReportAProblemActionIfNeed:](self, "_addReportAProblemActionIfNeed:", v5);
  -[MUPlaceActionManager _addHomeActionIfNeeded:](self, "_addHomeActionIfNeeded:", v5);

}

- (void)_addReportAProblemActionIfNeed:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("KR"));

  if (!v6
    || (-[MKPlaceActionManager options](self, "options") & 0x80000) == 0
    && (-[MKPlaceActionManager options](self, "options") & 0x40000) == 0)
  {
    -[MKPlaceActionManager reportAProblemFooterAction](self, "reportAProblemFooterAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);

  }
}

- (void)_addHomeActionIfNeeded:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[MKPlaceActionManager _showHomeShortcutItem](self, "_showHomeShortcutItem"))
  {
    -[MKPlaceActionManager homeActionItem](self, "homeActionItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (BOOL)_showWebsite
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[MKPlaceActionManager contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "urlAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[MKPlaceActionManager placeItem](self, "placeItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_msgSend(v5, "options") & 8) == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
