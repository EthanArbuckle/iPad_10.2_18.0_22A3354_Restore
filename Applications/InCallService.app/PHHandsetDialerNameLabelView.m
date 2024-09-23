@implementation PHHandsetDialerNameLabelView

- (PHHandsetDialerNameLabelView)initWithFrame:(CGRect)a3
{
  PHHandsetDialerNameLabelView *v3;
  PHHandsetDialerNameLabelView *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  const __CFString *v17;
  void *v18;

  v16.receiver = self;
  v16.super_class = (Class)PHHandsetDialerNameLabelView;
  v3 = -[PHHandsetDialerNameLabelView initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PHHandsetDialerNameLabelView setFontSize:](v3, "setFontSize:", 11.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHHandsetDialerNameLabelView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_alloc_init((Class)UILabel);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setText:", &stru_10028DC20);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v6, "setBackgroundColor:", v7);

    objc_msgSend(v6, "setOpaque:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerNameLabelView textColor](v4, "textColor"));
    objc_msgSend(v6, "setTextColor:", v8);

    objc_msgSend(v6, "setTextAlignment:", 1);
    -[PHHandsetDialerNameLabelView fontSize](v4, "fontSize");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    objc_msgSend(v6, "setFont:", v9);

    objc_msgSend(v6, "setAlpha:", 0.0);
    LODWORD(v10) = 1148846080;
    objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    -[PHHandsetDialerNameLabelView addSubview:](v4, "addSubview:", v6);
    -[PHHandsetDialerNameLabelView setNameAndLabelLabel:](v4, "setNameAndLabelLabel:", v6);
    v17 = CFSTR("nameAndLabelLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerNameLabelView nameAndLabelLabel](v4, "nameAndLabelLabel"));
    v18 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[nameAndLabelLabel]|"), 0, 0, v12));
    -[PHHandsetDialerNameLabelView addConstraints:](v4, "addConstraints:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[nameAndLabelLabel]|"), 0, 0, v12));
    -[PHHandsetDialerNameLabelView addConstraints:](v4, "addConstraints:", v14);

    -[PHHandsetDialerNameLabelView invalidateIntrinsicContentSize](v4, "invalidateIntrinsicContentSize");
  }
  return v4;
}

- (void)setFontSize:(double)a3
{
  void *v4;
  id v5;

  self->_fontSize = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerNameLabelView displayedName](self, "displayedName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerNameLabelView displayedLabel](self, "displayedLabel"));
  -[PHHandsetDialerNameLabelView showName:label:animated:](self, "showName:label:animated:", v5, v4, 0);

}

- (id)textColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_nameAndLabelLabel, "intrinsicContentSize");
  v3 = 25.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHHandsetDialerNameLabelView;
  -[PHHandsetDialerNameLabelView setHighlighted:](&v6, "setHighlighted:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerNameLabelView textColor](self, "textColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerNameLabelView nameAndLabelLabel](self, "nameAndLabelLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)showName:(id)a3 label:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = v9;
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@"), v9));

  }
  else
  {
    v11 = &stru_10028DC20;
  }
  -[PHHandsetDialerNameLabelView setDisplayedName:](self, "setDisplayedName:", v8);
  -[PHHandsetDialerNameLabelView setDisplayedLabel:](self, "setDisplayedLabel:", v11);
  v12 = objc_alloc((Class)NSMutableAttributedString);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v8, v11));
  v14 = objc_msgSend(v12, "initWithString:", v13);

  -[PHHandsetDialerNameLabelView fontSize](self, "fontSize");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
  -[PHHandsetDialerNameLabelView fontSize](self, "fontSize");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
  objc_msgSend(v14, "addAttribute:value:range:", NSFontAttributeName, v15, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v14, "addAttribute:value:range:", NSFontAttributeName, v16, (_BYTE *)objc_msgSend(v14, "length") - (_BYTE *)-[__CFString length](v11, "length"), -[__CFString length](v11, "length"));
  if (!objc_msgSend(v8, "length"))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000424C4;
    v22[3] = &unk_100284898;
    v22[4] = self;
    v18 = objc_retainBlock(v22);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000424F8;
    v20[3] = &unk_100284DF0;
    v20[4] = self;
    v21 = v14;
    v19 = objc_retainBlock(v20);

    if (v5)
      goto LABEL_6;
LABEL_8:
    ((void (*)(_QWORD *))v18[2])(v18);
    goto LABEL_9;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerNameLabelView nameAndLabelLabel](self, "nameAndLabelLabel"));
  objc_msgSend(v17, "setAttributedText:", v14);

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100042490;
  v23[3] = &unk_100284898;
  v23[4] = self;
  v18 = objc_retainBlock(v23);
  v19 = 0;
  if (!v5)
    goto LABEL_8;
LABEL_6:
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v18, v19, 0.200000003);
LABEL_9:
  -[PHHandsetDialerNameLabelView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (UILabel)nameAndLabelLabel
{
  return (UILabel *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNameAndLabelLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (NSString)displayedName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisplayedName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)displayedLabel
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDisplayedLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedLabel, 0);
  objc_storeStrong((id *)&self->_displayedName, 0);
  objc_storeStrong((id *)&self->_nameAndLabelLabel, 0);
}

@end
