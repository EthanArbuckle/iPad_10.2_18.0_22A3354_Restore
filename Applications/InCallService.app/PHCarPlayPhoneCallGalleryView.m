@implementation PHCarPlayPhoneCallGalleryView

- (PHCarPlayPhoneCallGalleryView)initWithFrame:(CGRect)a3
{
  PHCarPlayPhoneCallGalleryView *v3;
  void *v4;
  PHCarPlayPhoneCallContainer *v5;
  PHCarPlayPhoneCallContainer *v6;
  PHCarPlayPhoneCallContainer *container;
  CNKCallParticipantLabelDescriptorFactory *v8;
  CNKCallParticipantLabelDescriptorFactory *labelFactory;
  NSDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PHCarPlayPhoneCallGalleryView;
  v3 = -[PHCarPlayPhoneCallGalleryView initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHCarPlayPhoneCallGalleryView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[PHCarPlayPhoneCallGalleryView setOpaque:](v3, "setOpaque:", 0);
    v5 = [PHCarPlayPhoneCallContainer alloc];
    -[PHCarPlayPhoneCallGalleryView bounds](v3, "bounds");
    v6 = -[PHCarPlayPhoneCallContainer initWithFrame:](v5, "initWithFrame:");
    container = v3->_container;
    v3->_container = v6;

    v8 = objc_opt_new(CNKCallParticipantLabelDescriptorFactory);
    labelFactory = v3->_labelFactory;
    v3->_labelFactory = v8;

    -[PHCarPlayPhoneCallGalleryView addSubview:](v3, "addSubview:", v3->_container);
    v10 = _NSDictionaryOfVariableBindings(CFSTR("_container"), v3->_container, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[_container]|"), 0, 0, v11));
    -[PHCarPlayPhoneCallGalleryView addConstraints:](v3, "addConstraints:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_container]|"), 0, 0, v11));
    -[PHCarPlayPhoneCallGalleryView addConstraints:](v3, "addConstraints:", v13);

    -[PHCarPlayPhoneCallContainer setDataSource:](v3->_container, "setDataSource:", v3);
    -[PHCarPlayPhoneCallContainer setDelegate:](v3->_container, "setDelegate:", v3);
    -[PHCarPlayPhoneCallGalleryView startListeningForCallNotifications](v3, "startListeningForCallNotifications");

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PHCarPlayPhoneCallGalleryView stopListeningForCallNotifications](self, "stopListeningForCallNotifications");
  -[PHCarPlayPhoneCallContainer setDataSource:](self->_container, "setDataSource:", 0);
  -[PHCarPlayPhoneCallContainer setDelegate:](self->_container, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PHCarPlayPhoneCallGalleryView;
  -[PHCarPlayPhoneCallGalleryView dealloc](&v3, "dealloc");
}

- (void)startListeningForCallNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "phoneCallDataDidChange:", CFSTR("MPCarPlayInCallViewControllerUpdateClockTickNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "phoneCallDataDidChange:", TUCallCenterCallStatusChangedNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "phoneCallDataDidChange:", TUCallDisplayContextChangedNotification, 0);

}

- (void)stopListeningForCallNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (id)mergedCalls
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allConferenceParticipantCalls"));

  return v3;
}

- (id)primaryCalls
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryPhoneCallsForGalleryView:", self));

  return v4;
}

- (void)reloadPhoneCallData
{
  id v3;

  -[PHCarPlayPhoneCallGalleryView stopListeningForCallNotifications](self, "stopListeningForCallNotifications");
  -[PHCarPlayPhoneCallGalleryView startListeningForCallNotifications](self, "startListeningForCallNotifications");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView container](self, "container"));
  objc_msgSend(v3, "reloadData");

}

- (unint64_t)numberOfViewCellsForPhoneCallContainer:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView primaryCalls](self, "primaryCalls", a3));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (id)phoneCallContainer:(id)a3 titleForViewCellAtIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v11;

  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView phoneCallForIndex:isMerged:](self, "phoneCallForIndex:isMerged:", a4, &v11));
  if (objc_msgSend(v5, "isConversation"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeConversationForCall:", v5));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
  }
  else if (v5)
  {
    if (v11)
      v9 = objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView mergedStringForMergedCalls](self, "mergedStringForMergedCalls"));
    else
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
    v8 = (void *)v9;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)phoneCallContainer:(id)a3 subtitleForViewCellAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  CNKCallParticipantLabelDescriptorFactory *labelFactory;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNKCallParticipantLabelDescriptorFactory makeLabel](self->_labelFactory, "makeLabel", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView phoneCallForIndex:isMerged:](self, "phoneCallForIndex:isMerged:", a4, 0));
  if (v7)
  {
    v8 = objc_msgSend(v7, "canDisplayAlertUI:", -[PHCarPlayPhoneCallGalleryView isShowingAlertSubtitle](self, "isShowingAlertSubtitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView traitCollection](self, "traitCollection"));
    v10 = objc_msgSend(v9, "_backlightLuminance") != (id)1;

    labelFactory = self->_labelFactory;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView primaryCalls](self, "primaryCalls"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CNKCallParticipantLabelDescriptorFactory labelDescriptorWithStringsForCall:callCount:alertAvailable:allowsDuration:](labelFactory, "labelDescriptorWithStringsForCall:callCount:alertAvailable:allowsDuration:", v7, objc_msgSend(v12, "count"), v8, v10));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "strings"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

    if (objc_msgSend(v13, "layoutState") == (id)1)
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageURL"));
      if (!v16
        || (v17 = (void *)v16,
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedLabel")),
            v18,
            v17,
            !v18))
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "secondaryString"));

        v15 = (__CFString *)v19;
      }
    }
  }
  else
  {
    v15 = 0;
    v13 = v6;
  }
  if (v15)
    v20 = v15;
  else
    v20 = &stru_10028DC20;
  v21 = v20;

  return v21;
}

- (id)phoneCallContainer:(id)a3 subtitleColorForViewCellAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView phoneCallForIndex:isMerged:](self, "phoneCallForIndex:isMerged:", a4, 0));
  if (v7
    && objc_msgSend(v7, "canDisplayAlertUI:", -[PHCarPlayPhoneCallGalleryView isShowingAlertSubtitle](self, "isShowingAlertSubtitle")))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));

    v6 = (void *)v8;
  }

  return v6;
}

- (id)phoneCallContainer:(id)a3 avatarViewControllerForViewCellAtIndex:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v18;
  unsigned __int8 v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  void *v26;
  NSString *v27;

  v19 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView phoneCallForIndex:isMerged:](self, "phoneCallForIndex:isMerged:", a4, &v19));
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));
  if (!objc_msgSend(v6, "length"))
  {
    v8 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v7 = v19;

  if (!v7)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForCall:", v5));
    v9 = objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactIdentifier"));
    v27 = CNContactImageDataAvailableKey;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    v18 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unifiedContactWithIdentifier:keysToFetch:error:", v10, v11, &v18));
    v13 = v18;

    if (v12 && objc_msgSend(v12, "imageDataAvailable"))
    {
      v14 = objc_claimAutoreleasedReturnValue(+[CNAvatarViewControllerSettings settingsWithContactStore:threeDTouchEnabled:](CNAvatarViewControllerSettings, "settingsWithContactStore:threeDTouchEnabled:", v9, 0));
      v8 = objc_msgSend(objc_alloc((Class)CNAvatarViewController), "initWithSettings:", v14);
      v26 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
      objc_msgSend(v8, "setContacts:", v15);

    }
    else
    {
      if (!v13)
      {
        v8 = 0;
        goto LABEL_15;
      }
      v16 = sub_1000C5588();
      v14 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v21 = v9;
        v22 = 2112;
        v23 = v5;
        v24 = 2112;
        v25 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not retrieve a contact using contact store (%@) call (%@) error (%@)", buf, 0x20u);
      }
      v8 = 0;
    }

LABEL_15:
    goto LABEL_16;
  }
LABEL_4:
  v8 = 0;
LABEL_17:

  return v8;
}

- (id)phoneCallContainer:(id)a3 localizedSenderIdentityForViewCellAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  if (+[PHDevice isGeminiCapable](PHDevice, "isGeminiCapable", a3))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView phoneCallForIndex:isMerged:](self, "phoneCallForIndex:isMerged:", a4, 0));
    v7 = v6;
    if (v6
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "provider")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "prioritizedSenderIdentities")),
          v10 = objc_msgSend(v9, "count"),
          v9,
          v8,
          (unint64_t)v10 >= 2))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localSenderIdentity"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedShortName"));

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (BOOL)phoneCallContainer:(id)a3 cellIsDimmedAtIndex:(unint64_t)a4
{
  void *v4;
  unsigned int v5;
  unsigned int v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView phoneCallForIndex:isMerged:](self, "phoneCallForIndex:isMerged:", a4, 0));
  v5 = objc_msgSend(v4, "status");
  v6 = (v5 > 4) | (5u >> v5);

  return v6 & 1;
}

- (void)phoneCallContainer:(id)a3 phoneCallViewTappedAtIndex:(unint64_t)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentCallGroups"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 < 2)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentCallGroups"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v14 = objc_msgSend(v13, "isOnHold");
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
          v16 = v15;
          if (v14)
            objc_msgSend(v15, "unholdCall:", v13);
          else
            objc_msgSend(v15, "holdCall:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

  }
  else
  {
    v17 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    objc_msgSend(v17, "swapCalls");

  }
}

- (id)mergedStringForMergedCalls
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView mergedCalls](self, "mergedCalls"));
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if ((unint64_t)v4 >= 3)
    v7 = CFSTR("CARPLAY_CALLS_%@_%@_AND_OTHERS");
  else
    v7 = CFSTR("CARPLAY_CALLS_%@_AND_%@");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_10028DC20, CFSTR("PHCarPlay")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView mergedCalls](self, "mergedCalls"));
  v10 = objc_msgSend(v9, "count");

  if ((unint64_t)v10 < 2)
  {
    v17 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView mergedCalls](self, "mergedCalls"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayFirstName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView mergedCalls](self, "mergedCalls"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "displayFirstName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v13, v16));

  }
  return v17;
}

- (id)phoneCallForIndex:(unint64_t)a3 isMerged:(BOOL *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView primaryCalls](self, "primaryCalls"));
  if ((unint64_t)objc_msgSend(v7, "count") <= a3)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));
    if (a4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView mergedCalls](self, "mergedCalls"));
      if ((unint64_t)objc_msgSend(v9, "count") >= 2
        && (objc_msgSend(v8, "isConferenced") & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView delegate](self, "delegate"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "representativePhoneCallForConferenceForGalleryView:", self));
        *a4 = v8 == v11;

      }
      else
      {
        *a4 = 0;
      }

    }
  }

  return v8;
}

- (void)addPrimaryPhoneCall:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView container](self, "container", a3));
  objc_msgSend(v5, "reloadDataAnimated:", v4);

}

- (void)mergePrimaryPhoneCallsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView mergedCalls](self, "mergedCalls"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 >= 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView container](self, "container"));
    objc_msgSend(v7, "setNeedsMerge");

    v8 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView container](self, "container"));
    objc_msgSend(v8, "reloadDataAnimated:", v3);

  }
}

- (void)endPhoneCall:(id)a3 animated:(BOOL)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView container](self, "container", a3, a4));
  objc_msgSend(v4, "reloadDataAnimated:", 1);

}

- (void)setIsShowingCallFailure:(BOOL)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView container](self, "container", a3));
  objc_msgSend(v3, "reloadData");

}

- (void)setIsShowingAlertSubtitle:(BOOL)a3
{
  id v3;

  if (self->_isShowingAlertSubtitle != a3)
  {
    self->_isShowingAlertSubtitle = a3;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView container](self, "container"));
    objc_msgSend(v3, "reloadData");

  }
}

- (void)phoneCallDataDidChange:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallGalleryView container](self, "container", a3));
  objc_msgSend(v3, "reloadData");

}

- (MPCarPlayPhoneCallGalleryViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MPCarPlayPhoneCallGalleryViewDelegate *)a3;
}

- (PHCarPlayPhoneCallContainer)container
{
  return (PHCarPlayPhoneCallContainer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isShowingAlertSubtitle
{
  return self->_isShowingAlertSubtitle;
}

- (CNKCallParticipantLabelDescriptorFactory)labelFactory
{
  return self->_labelFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelFactory, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
