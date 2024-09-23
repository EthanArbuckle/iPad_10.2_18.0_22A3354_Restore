@implementation PHEmergencyHandsetDialerLCDView

- (PHEmergencyHandsetDialerLCDView)initWithFrame:(CGRect)a3 forDialerType:(int)a4
{
  PHEmergencyHandsetDialerLCDView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PHTextCycleLabel *v14;
  PHTextCycleLabel *emergencyTitleLabel;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PHEmergencyHandsetDialerLCDView;
  v4 = -[PHHandsetDialerLCDView initWithFrame:forDialerType:](&v20, "initWithFrame:forDialerType:", *(_QWORD *)&a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberTextField](v4, "numberTextField"));
    objc_msgSend(v6, "setTextColor:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CALL_STRINGS"), &stru_10028DC20, CFSTR("EmergencyCallStrings")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(",")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CALL"), &stru_10028DC20, CFSTR("EmergencyCallStrings")));

    if (v11 && (objc_msgSend(v9, "containsObject:", v11) & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v9));
      objc_msgSend(v12, "insertObject:atIndex:", v11, 0);
      v13 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v12));

      v9 = (void *)v13;
    }
    v14 = objc_alloc_init(PHTextCycleLabel);
    emergencyTitleLabel = v4->_emergencyTitleLabel;
    v4->_emergencyTitleLabel = v14;

    -[PHEmergencyHandsetDialerLCDView _emergencyDialerFontSize](v4, "_emergencyDialerFontSize");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    -[PHTextCycleLabel setFont:](v4->_emergencyTitleLabel, "setFont:", v16);

    -[PHTextCycleLabel setTextAlignment:](v4->_emergencyTitleLabel, "setTextAlignment:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    -[PHTextCycleLabel setTextColor:](v4->_emergencyTitleLabel, "setTextColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHTextCycleLabel setBackgroundColor:](v4->_emergencyTitleLabel, "setBackgroundColor:", v18);

    -[PHTextCycleLabel setOpaque:](v4->_emergencyTitleLabel, "setOpaque:", 0);
    -[PHTextCycleLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_emergencyTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PHTextCycleLabel setCycleStrings:](v4->_emergencyTitleLabel, "setCycleStrings:", v9);
    -[PHTextCycleLabel startCyclingStrings](v4->_emergencyTitleLabel, "startCyclingStrings");
    -[PHEmergencyHandsetDialerLCDView addSubview:](v4, "addSubview:", v4->_emergencyTitleLabel);
    -[PHEmergencyHandsetDialerLCDView _applyLayoutConstraints](v4, "_applyLayoutConstraints");
    -[PHEmergencyHandsetDialerLCDView setClipsToBounds:](v4, "setClipsToBounds:", 0);

  }
  return v4;
}

- (id)newAddContactButton
{
  return 0;
}

- (void)_applyLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];

  v22[0] = CFSTR("emergencyLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyHandsetDialerLCDView emergencyTitleLabel](self, "emergencyTitleLabel"));
  v22[1] = CFSTR("numberLabel");
  v23[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberTextField](self, "numberTextField"));
  v23[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[emergencyLabel]|"), 0, 0, v5));
  -[PHEmergencyHandsetDialerLCDView addConstraints:](self, "addConstraints:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-[numberLabel]-|"), 0x10000, 0, v5));
  -[PHEmergencyHandsetDialerLCDView addConstraints:](self, "addConstraints:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyHandsetDialerLCDView emergencyTitleLabel](self, "emergencyTitleLabel"));
  +[PHUIConfiguration yOffsetForDialerLCDView](PHUIConfiguration, "yOffsetForDialerLCDView");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 11, 0, self, 3, 1.0, v9));
  -[PHEmergencyHandsetDialerLCDView addConstraint:](self, "addConstraint:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyHandsetDialerLCDView emergencyTitleLabel](self, "emergencyTitleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 4, 0, v11, 11, 1.0, 0.0));
  -[PHEmergencyHandsetDialerLCDView addConstraint:](self, "addConstraint:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyHandsetDialerLCDView emergencyTitleLabel](self, "emergencyTitleLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 9, 0, self, 9, 1.0, 0.0));
  -[PHEmergencyHandsetDialerLCDView addConstraint:](self, "addConstraint:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyHandsetDialerLCDView emergencyTitleLabel](self, "emergencyTitleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberTextField](self, "numberTextField"));
  -[PHHandsetDialerLCDView spacingBetweenNumberBaselineAndNameBaseline](self, "spacingBetweenNumberBaselineAndNameBaseline");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 11, 0, v16, 11, 1.0, v17));
  -[PHEmergencyHandsetDialerLCDView addConstraint:](self, "addConstraint:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyHandsetDialerLCDView emergencyTitleLabel](self, "emergencyTitleLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberTextField](self, "numberTextField"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 9, 0, v20, 9, 1.0, 0.0));
  -[PHEmergencyHandsetDialerLCDView addConstraint:](self, "addConstraint:", v21);

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 0;
}

- (void)_updateEmergencyLabel
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  PHTextCycleLabel *emergencyTitleLabel;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  if (-[PHEmergencyHandsetDialerLCDView shrinkLabelWhenNumbersEntered](self, "shrinkLabelWhenNumbersEntered"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberTextField](self, "numberTextField"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
    if (objc_msgSend(v4, "length"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHTextCycleLabel font](self->_emergencyTitleLabel, "font"));
      objc_msgSend(v5, "pointSize");
      v7 = v6;
      -[PHEmergencyHandsetDialerLCDView _emergencyDialerFontSize](self, "_emergencyDialerFontSize");
      v9 = v8;

      if (v7 == v9)
      {
        v10 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 11.0));
        v16 = (id)v10;
        emergencyTitleLabel = self->_emergencyTitleLabel;
        goto LABEL_10;
      }
    }
    else
    {

    }
    v16 = (id)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberTextField](self, "numberTextField"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "text"));
    if (objc_msgSend(v12, "length"))
    {

LABEL_11:
      return;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHTextCycleLabel font](self->_emergencyTitleLabel, "font"));
    objc_msgSend(v13, "pointSize");
    v15 = v14;

    if (v15 != 11.0)
      return;
    -[PHEmergencyHandsetDialerLCDView _emergencyDialerFontSize](self, "_emergencyDialerFontSize");
    v10 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    v16 = (id)v10;
    emergencyTitleLabel = self->_emergencyTitleLabel;
LABEL_10:
    -[PHTextCycleLabel setFont:](emergencyTitleLabel, "setFont:", v10);
    goto LABEL_11;
  }
}

- (void)setText:(id)a3 needsFormat:(BOOL)a4 name:(id)a5 label:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHEmergencyHandsetDialerLCDView;
  -[PHHandsetDialerLCDView setText:needsFormat:name:label:](&v7, "setText:needsFormat:name:label:", a3, a4, a5, a6);
  -[PHEmergencyHandsetDialerLCDView _updateEmergencyLabel](self, "_updateEmergencyLabel");
}

- (void)setText:(id)a3 needsFormat:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHEmergencyHandsetDialerLCDView;
  -[PHHandsetDialerLCDView setText:needsFormat:](&v5, "setText:needsFormat:", a3, a4);
  -[PHEmergencyHandsetDialerLCDView _updateEmergencyLabel](self, "_updateEmergencyLabel");
}

- (void)deleteCharacter
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHEmergencyHandsetDialerLCDView;
  -[PHHandsetDialerLCDView deleteCharacter](&v3, "deleteCharacter");
  -[PHEmergencyHandsetDialerLCDView _updateEmergencyLabel](self, "_updateEmergencyLabel");
}

- (double)_emergencyDialerFontSize
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration handsetDialerSize](PHUIConfiguration, "handsetDialerSize");
  result = 17.0;
  if (v2 - 1 <= 3)
    return dbl_10023FE68[v2 - 1];
  return result;
}

- (BOOL)shrinkLabelWhenNumbersEntered
{
  return (id)+[PHUIConfiguration handsetDialerSize](PHUIConfiguration, "handsetDialerSize") == (id)1;
}

- (int64_t)numberOfLinesInEmergencyTitleLabel
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSAttributedStringKey v14;
  void *v15;

  -[PHTextCycleLabel frame](self->_emergencyTitleLabel, "frame");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHTextCycleLabel font](self->_emergencyTitleLabel, "font"));
  objc_msgSend(v5, "lineHeight");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHTextCycleLabel text](self->_emergencyTitleLabel, "text"));
  v14 = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHTextCycleLabel font](self->_emergencyTitleLabel, "font"));
  v15 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  objc_msgSend(v8, "boundingRectWithSize:options:attributes:context:", 1, v10, 0, v4, 1.79769313e308);
  v12 = v11;

  return (uint64_t)(v12 / v7);
}

- (PHTextCycleLabel)emergencyTitleLabel
{
  return (PHTextCycleLabel *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emergencyTitleLabel, 0);
}

@end
