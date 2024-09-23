@implementation PHEmergencyHandsetDialerView

- (PHEmergencyHandsetDialerView)initWithFrame:(CGRect)a3
{
  PHEmergencyHandsetDialerView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHEmergencyHandsetDialerView;
  v3 = -[PHHandsetDialerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[PHEmergencyHandsetDialerView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (PHTextCycleLabel)emergencyTitleLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self, "lcdView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "emergencyTitleLabel"));

  return (PHTextCycleLabel *)v3;
}

- (id)newLCDView
{
  PHEmergencyHandsetDialerLCDView *v3;
  PHEmergencyHandsetDialerLCDView *v4;
  void *v5;

  v3 = [PHEmergencyHandsetDialerLCDView alloc];
  -[PHEmergencyHandsetDialerView bounds](self, "bounds");
  v4 = -[PHEmergencyHandsetDialerLCDView initWithFrame:forDialerType:](v3, "initWithFrame:forDialerType:", 0, 0.0, 0.0);
  -[PHEmergencyHandsetDialerLCDView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButton](v4, "addContactButton"));
  -[PHAbstractDialerView setAddContactButton:](self, "setAddContactButton:", v5);

  return v4;
}

- (id)deleteButtonXImageView
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHEmergencyHandsetDialerView;
  v2 = -[PHHandsetDialerView deleteButtonXImageView](&v6, "deleteButtonXImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v3, "setTintColor:", v4);

  return v3;
}

- (id)newDeleteButton
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHEmergencyHandsetDialerView;
  v2 = -[PHHandsetDialerView newDeleteButton](&v5, "newDeleteButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v2, "setTintColor:", v3);

  return v2;
}

- (id)newCallButton
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  PHBottomBarButtonConfiguration *v7;
  PHBottomBarButtonConfiguration *v8;
  PHBottomBarButton *v9;
  uint8_t v11[16];

  v3 = sub_1000F8B14();
  if (v3 && objc_msgSend(v3, "shouldUseRTT"))
  {
    v4 = sub_1000792D0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Using RTT for emergency call button", v11, 2u);
    }

    v6 = 2;
  }
  else
  {
    v6 = 1;
  }
  v7 = [PHBottomBarButtonConfiguration alloc];
  -[PHHandsetDialerView callButtonDiameter](self, "callButtonDiameter");
  v8 = -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:](v7, "initWithAction:diameter:callState:", v6, 2);
  v9 = -[PHBottomBarButton initWithConfiguration:]([PHBottomBarButton alloc], "initWithConfiguration:", v8);
  -[PHBottomBarButton setTitle:forState:](v9, "setTitle:forState:", 0, 0);
  -[PHBottomBarButton setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  return v9;
}

- (id)numberPadButtonsForCharacters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031F94;
  v9[3] = &unk_100285388;
  v9[4] = self;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

- (int64_t)numberOfLinesInEmergencyTitleLabel
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self, "lcdView"));
  v5 = objc_opt_class(PHEmergencyHandsetDialerLCDView, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) == 0)
    return -1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self, "lcdView"));
  v8 = objc_msgSend(v7, "numberOfLinesInEmergencyTitleLabel");

  return (int64_t)v8;
}

@end
