@implementation HSPCHomeKitRoomProvider

- (HSPCHomeKitRoomProvider)initWithCoordinator:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  HSPCHomeKitRoomProvider *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *existingRooms;
  NSArray *v16;
  uint64_t v17;
  HMRoom *suggestedRoom;
  _QWORD v20[4];
  id v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HSPCHomeKitRoomProvider;
  v8 = -[HSPCDataProvider initWithCoordinator:configuration:](&v22, "initWithCoordinator:configuration:", v6, v7);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hf_dashboardSectionReorderableHomeKitObjectComparator"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rooms"));
    v13 = v10;
    if (!v10)
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[HFItemSection defaultItemComparator](HFItemSection, "defaultItemComparator"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sortedArrayUsingComparator:", v13));
    existingRooms = v8->_existingRooms;
    v8->_existingRooms = (NSArray *)v14;

    if (!v10)
    v16 = v8->_existingRooms;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100054040;
    v20[3] = &unk_1000A1FA8;
    v21 = v6;
    v17 = objc_claimAutoreleasedReturnValue(-[NSArray na_firstObjectPassingTest:](v16, "na_firstObjectPassingTest:", v20));
    suggestedRoom = v8->_suggestedRoom;
    v8->_suggestedRoom = (HMRoom *)v17;

  }
  return v8;
}

- (id)loadData
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  char *v7;
  void *v8;
  char *i;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCHomeKitRoomProvider existingRooms](self, "existingRooms"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCHomeKitRoomProvider _generateRoomSuggestionsWithLimit:existingRooms:](self, "_generateRoomSuggestionsWithLimit:existingRooms:", 10, v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCHomeKitRoomProvider existingRooms](self, "existingRooms"));
  v6 = (char *)objc_msgSend(v5, "count");
  v7 = &v6[(_QWORD)objc_msgSend(v4, "count")];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCHomeKitRoomProvider existingRooms](self, "existingRooms"));
      v11 = (char *)objc_msgSend(v10, "count");

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCHomeKitRoomProvider existingRooms](self, "existingRooms"));
      v13 = v12;
      if (i >= v11)
      {
        v14 = (char *)(i - (_BYTE *)objc_msgSend(v12, "count"));
        v12 = v4;
      }
      else
      {
        v14 = i;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v14));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
      objc_msgSend(v8, "addObject:", v16);

    }
  }
  v17 = objc_msgSend(v8, "copy");
  -[HSPCDataProvider setItems:](self, "setItems:", v17);

  -[HSPCDataProvider setLoaded:](self, "setLoaded:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));

  return v18;
}

- (id)userFacingStringForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCHomeKitRoomProvider existingRooms](self, "existingRooms"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9), "name"));
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v13 = v4;

          goto LABEL_11;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  v12 = HFLocalizedStringWithFormat(CFSTR("HFRoomSuggestionNameFormat"), CFSTR("%@"));
  v13 = (id)objc_claimAutoreleasedReturnValue(v12);
LABEL_11:

  return v13;
}

- (unint64_t)initialRowIndex
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCHomeKitRoomProvider existingRooms](self, "existingRooms"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDataProvider items](self, "items"));
    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCHomeKitRoomProvider suggestedRoom](self, "suggestedRoom"));

  if (!v5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCHomeKitRoomProvider existingRooms](self, "existingRooms")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCHomeKitRoomProvider suggestedRoom](self, "suggestedRoom")),
        v8 = objc_msgSend(v6, "indexOfObject:", v7),
        v7,
        v6,
        v8 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCHomeKitRoomProvider existingRooms](self, "existingRooms"));
LABEL_6:
    v10 = v9;
    v8 = (id)((unint64_t)objc_msgSend(v9, "count") >> 1);

  }
  return (unint64_t)v8;
}

- (id)_generateRoomSuggestionsWithLimit:(int64_t)a3 existingRooms:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "na_map:", &stru_1000A34A0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFDefaultRoomSuggestionVendor homeAppSuggestionVendor](HFDefaultRoomSuggestionVendor, "homeAppSuggestionVendor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "roomSuggestions"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10005459C;
  v18[3] = &unk_1000A34C8;
  v19 = v6;
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "na_filter:", v18));

  v11 = objc_msgSend(v9, "count");
  v12 = (a3 - (_QWORD)v11) & ~((a3 - (uint64_t)v11) >> 63);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[HFRoomSuggestion priorityComparator](HFRoomSuggestion, "priorityComparator"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sortedArrayUsingComparator:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subarrayWithRange:", 0, v12));

  return v16;
}

- (NSArray)existingRooms
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (HMRoom)suggestedRoom
{
  return (HMRoom *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedRoom, 0);
  objc_storeStrong((id *)&self->_existingRooms, 0);
}

@end
