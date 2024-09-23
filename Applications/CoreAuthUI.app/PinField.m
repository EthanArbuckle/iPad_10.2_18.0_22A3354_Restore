@implementation PinField

- (PinField)initWithPinLength:(id)a3 minLength:(id)a4 maxLength:(id)a5 charset:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PinField *v15;
  PinField *v16;
  NSNumber **p_pinFixedLength;
  unsigned int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  LACSecureData *pinValue;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PinField;
  v15 = -[PinField init](&v24, "init");
  v16 = v15;
  if (v15)
  {
    p_pinFixedLength = &v15->_pinFixedLength;
    objc_storeStrong((id *)&v15->_pinFixedLength, a3);
    objc_storeStrong((id *)&v16->_pinMinLength, a4);
    objc_storeStrong((id *)&v16->_pinMaxLength, a5);
    objc_storeStrong((id *)&v16->_pinCharset, a6);
    if (*p_pinFixedLength
      && (v18 = objc_msgSend(v11, "unsignedIntValue"), v16->_pinLength = v18, v18 - 4 <= 8))
    {
      -[PinField _setupForFixedLength](v16, "_setupForFixedLength");
      if (!v14)
        goto LABEL_9;
    }
    else
    {
      -[PinField _setupForVariableLength](v16, "_setupForVariableLength");
      if (!v14)
      {
LABEL_9:
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_10007CCD0, "stringByPaddingToLength:withString:startingAtIndex:", v16->_pinLength, CFSTR(" "), 0));
        v21 = objc_claimAutoreleasedReturnValue(+[LACSecureData secureDataWithString:](LACSecureData, "secureDataWithString:", v20));
        pinValue = v16->_pinValue;
        v16->_pinValue = (LACSecureData *)v21;

        -[LACSecureData resize:](v16->_pinValue, "resize:", 0);
        goto LABEL_10;
      }
    }
    if (objc_msgSend(v14, "unsignedIntValue"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v19, "addObserver:selector:name:object:", v16, "_handleReturnKeyTapped:", UIKeyboardReturnKeyPressed, 0);

    }
    goto LABEL_9;
  }
LABEL_10:

  return v16;
}

- (void)_setupForFixedLength
{
  NSMutableArray *v3;
  NSMutableArray *pinDashViews;
  NSMutableArray *v5;
  NSMutableArray *pinDotViews;
  uint64_t v7;
  NSBundle *v8;
  void *v9;
  uint64_t v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  CGSize *p_pinDashSize;
  CGFloat v15;
  CGFloat v16;
  CGSize *p_pinDotSize;
  double v18;
  CGFloat v19;
  CGFloat height;
  double width;
  unint64_t v22;
  id v23;
  id v24;
  id v25;

  v3 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", self->_pinLength);
  pinDashViews = self->_pinDashViews;
  self->_pinDashViews = v3;

  v5 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", self->_pinLength);
  pinDotViews = self->_pinDotViews;
  self->_pinDotViews = v5;

  v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v25 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("pinDash"), v9));

  v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("pinDot"), v12));

  p_pinDashSize = &self->_pinDashSize;
  objc_msgSend(v25, "size");
  self->_pinDashSize.width = v15;
  self->_pinDashSize.height = v16;
  p_pinDotSize = &self->_pinDotSize;
  objc_msgSend(v13, "size");
  self->_pinDotSize.width = v19;
  self->_pinDotSize.height = v18;
  height = self->_pinDashSize.height;
  if (height < v18)
    height = v18;
  self->_slotHeight = height;
  width = p_pinDashSize->width;
  if (p_pinDashSize->width < p_pinDotSize->width)
    width = p_pinDotSize->width;
  self->_slotWidth = width;
  if (self->_pinLength)
  {
    v22 = 0;
    do
    {
      v23 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v25);
      -[NSMutableArray addObject:](self->_pinDashViews, "addObject:", v23);
      v24 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v13);

      -[NSMutableArray addObject:](self->_pinDotViews, "addObject:", v24);
      ++v22;
    }
    while (v22 < self->_pinLength);
  }

}

- (void)_setupForVariableLength
{
  void *v3;
  void *v4;
  unsigned int v5;
  UIButton *v6;
  uint64_t v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIButton *okButton;
  void *v14;
  id obj;

  obj = objc_alloc_init((Class)UITextField);
  objc_msgSend(obj, "setSecureTextEntry:", 1);
  objc_msgSend(obj, "setBorderStyle:", 3);
  objc_msgSend(obj, "setUserInteractionEnabled:", 0);
  objc_storeStrong((id *)&self->_pinTextField, obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinTextField](self, "pinTextField"));
  -[PinField addSubview:](self, "addSubview:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinCharset](self, "pinCharset"));
  v5 = objc_msgSend(v4, "unsignedIntValue");

  if (!v5)
  {
    v6 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PASSWORD_ALERT_DONE"), &stru_10007CCD0, CFSTR("MobileUI")));
    -[UIButton setTitle:forState:](v6, "setTitle:forState:", v10, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UIButton setTitleColor:forState:](v6, "setTitleColor:forState:", v11, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    -[UIButton setTitleColor:forState:](v6, "setTitleColor:forState:", v12, 2);

    -[UIButton addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, "_okButtonClicked:", 1);
    -[UIButton sizeToFit](v6, "sizeToFit");
    okButton = self->_okButton;
    self->_okButton = v6;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PinField okButton](self, "okButton"));
    -[PinField addSubview:](self, "addSubview:", v14);

  }
  self->_variableLength = 1;

}

- (void)updateLayoutForWidth:(double)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double slotWidth;
  double v16;
  unint64_t pinLength;
  double v18;
  double v19;
  float slotHeight;
  unint64_t v21;
  CGSize *p_pinDashSize;
  double x;
  double y;
  double width;
  double height;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  if (-[PinField variableLength](self, "variableLength"))
  {
    -[PinField setFrame:](self, "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, a3, 30.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinMaxLength](self, "pinMaxLength"));
    objc_msgSend(v5, "intValue");

    v7 = UIRectCenteredXInRect(v6);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinTextField](self, "pinTextField"));
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    v33 = (id)objc_claimAutoreleasedReturnValue(-[PinField okButton](self, "okButton"));
    objc_msgSend(v33, "setFrame:", v7 + v11, 0.0, 50.0, 30.0);

  }
  else
  {
    slotWidth = self->_slotWidth;
    v16 = 25.0;
    pinLength = self->_pinLength;
    v18 = (double)pinLength;
    v19 = (slotWidth + 25.0) * (double)pinLength + -25.0;
    if (v19 > a3 + -25.0)
    {
      v16 = (a3 + -25.0 - slotWidth * v18) / (double)(pinLength - 1);
      v19 = -(v16 - (slotWidth + v16) * v18);
    }
    slotHeight = self->_slotHeight;
    -[PinField setFrame:](self, "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, v19, ceilf(slotHeight));
    if (self->_pinLength)
    {
      v21 = 0;
      p_pinDashSize = &self->_pinDashSize;
      do
      {
        v34.size.width = p_pinDashSize->width;
        v34.size.height = self->_pinDashSize.height;
        v34.origin.x = (self->_slotWidth - p_pinDashSize->width) * 0.5 + (v16 + self->_slotWidth) * (double)v21;
        v34.origin.y = (self->_slotHeight - v34.size.height) * 0.5;
        v35 = CGRectIntegral(v34);
        x = v35.origin.x;
        y = v35.origin.y;
        width = v35.size.width;
        height = v35.size.height;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_pinDashViews, "objectAtIndex:", v21));
        objc_msgSend(v27, "setFrame:", x, y, width, height);
        v36.size.width = self->_pinDotSize.width;
        v36.size.height = self->_pinDotSize.height;
        v36.origin.x = (self->_slotWidth - v36.size.width) * 0.5 + (v16 + self->_slotWidth) * (double)v21;
        v36.origin.y = (self->_slotHeight - v36.size.height) * 0.5;
        v37 = CGRectIntegral(v36);
        v28 = v37.origin.x;
        v29 = v37.origin.y;
        v30 = v37.size.width;
        v31 = v37.size.height;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_pinDotViews, "objectAtIndex:", v21));

        objc_msgSend(v32, "setFrame:", v28, v29, v30, v31);
        ++v21;
      }
      while (v21 < self->_pinLength);
    }
  }
}

- (void)layoutSubviews
{
  id v3;
  void *v4;
  _BOOL8 v5;
  unint64_t v6;
  id v7;
  int *v8;
  int *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (-[PinField variableLength](self, "variableLength"))
  {
    v3 = -[LACSecureData length](self->_pinValue, "length");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinMinLength](self, "pinMinLength"));
    v5 = (unint64_t)v3 < objc_msgSend(v4, "unsignedIntValue");

    v13 = (id)objc_claimAutoreleasedReturnValue(-[PinField okButton](self, "okButton"));
    objc_msgSend(v13, "setHidden:", v5);

  }
  else if (self->_pinLength)
  {
    v6 = 0;
    do
    {
      v7 = -[LACSecureData length](self->_pinValue, "length");
      if (v6 >= (unint64_t)v7)
        v8 = &OBJC_IVAR___PinField__pinDotViews;
      else
        v8 = &OBJC_IVAR___PinField__pinDashViews;
      if (v6 >= (unint64_t)v7)
        v9 = &OBJC_IVAR___PinField__pinDashViews;
      else
        v9 = &OBJC_IVAR___PinField__pinDotViews;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v8), "objectAtIndexedSubscript:", v6));
      objc_msgSend(v10, "removeFromSuperview");

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v9), "objectAtIndexedSubscript:", v6));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superview"));

      if (!v12)
        -[PinField addSubview:](self, "addSubview:", v11);

      ++v6;
    }
    while (v6 < self->_pinLength);
  }
}

- (void)appendPinCharacter:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (-[PinField variableLength](self, "variableLength"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinMaxLength](self, "pinMaxLength"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinMaxLength](self, "pinMaxLength"));
      v6 = objc_msgSend(v5, "unsignedIntValue");

    }
    else
    {
      v6 = -1;
    }

  }
  else
  {
    v6 = -[PinField pinLength](self, "pinLength");
  }
  if ((unint64_t)-[LACSecureData length](self->_pinValue, "length") < v6
    && (objc_msgSend(v15, "isEqualToString:", CFSTR("\n")) & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinCharset](self, "pinCharset"));
    v8 = objc_msgSend(v7, "unsignedIntValue");

    v9 = v15;
    if (v8 == 2)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uppercaseString"));

      v9 = (id)v10;
    }
    v15 = v9;
    -[LACSecureData appendString:](self->_pinValue, "appendString:", v9);
    if (-[PinField variableLength](self, "variableLength"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinTextField](self, "pinTextField"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", v15));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinTextField](self, "pinTextField"));
      objc_msgSend(v14, "setText:", v13);

    }
    -[PinField setNeedsLayout](self, "setNeedsLayout");
    if (-[LACSecureData length](self->_pinValue, "length") == (id)v6)
      -[PinField _enterPin](self, "_enterPin");
  }

}

- (void)deleteLastPinCharacter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[LACSecureData length](self->_pinValue, "length"))
  {
    -[LACSecureData removeLastCharacter](self->_pinValue, "removeLastCharacter");
    if (-[PinField variableLength](self, "variableLength"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinTextField](self, "pinTextField"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinTextField](self, "pinTextField"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", (char *)objc_msgSend(v6, "length") - 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinTextField](self, "pinTextField"));
      objc_msgSend(v8, "setText:", v7);

    }
    -[PinField setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_handleReturnKeyTapped:(id)a3
{
  id v4;

  if (!-[PinField variableLength](self, "variableLength", a3)
    || (v4 = -[LACSecureData length](self->_pinValue, "length"),
        (unint64_t)v4 >= -[NSNumber unsignedIntValue](self->_pinMinLength, "unsignedIntValue")))
  {
    -[PinField _enterPin](self, "_enterPin");
  }
}

- (void)_enterPin
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 76000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B89C;
  block[3] = &unk_100079A08;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (PinFieldDelegate)delegate
{
  return (PinFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (LACSecureData)pinValue
{
  return self->_pinValue;
}

- (BOOL)variableLength
{
  return self->_variableLength;
}

- (NSNumber)pinFixedLength
{
  return self->_pinFixedLength;
}

- (NSNumber)pinMinLength
{
  return self->_pinMinLength;
}

- (NSNumber)pinMaxLength
{
  return self->_pinMaxLength;
}

- (NSNumber)pinCharset
{
  return self->_pinCharset;
}

- (unint64_t)pinLength
{
  return self->_pinLength;
}

- (UITextField)pinTextField
{
  return self->_pinTextField;
}

- (UIButton)okButton
{
  return self->_okButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_pinTextField, 0);
  objc_storeStrong((id *)&self->_pinCharset, 0);
  objc_storeStrong((id *)&self->_pinMaxLength, 0);
  objc_storeStrong((id *)&self->_pinMinLength, 0);
  objc_storeStrong((id *)&self->_pinFixedLength, 0);
  objc_storeStrong((id *)&self->_pinValue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pinDotViews, 0);
  objc_storeStrong((id *)&self->_pinDashViews, 0);
}

@end
