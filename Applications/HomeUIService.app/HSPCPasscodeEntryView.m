@implementation HSPCPasscodeEntryView

- (HSPCPasscodeEntryView)initWithNumberOfDigits:(int64_t)a3 useMonospacedFont:(BOOL)a4 delegate:(id)a5
{
  id v8;
  uint64_t v9;
  HSPCPasscodeEntryView *v10;
  HSPCPasscodeEntryView *v11;
  uint64_t v12;
  NSMutableString *text;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  id v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int64_t v33;
  id v34;
  unint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  HSPCPasscodeWell *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  NSArray *v62;
  NSArray *wells;
  HSPCPasscodeEntryView *v64;
  id v66;
  void *v67;
  int64_t v68;
  unint64_t v69;
  unint64_t v70;
  id v71;
  unint64_t v72;
  unint64_t v73;
  _QWORD v74[4];
  id v75;
  objc_super v76;

  v8 = a5;
  objc_msgSend((id)objc_opt_class(self, v9), "preferredSizeForNumberOfDigits:", a3);
  v76.receiver = self;
  v76.super_class = (Class)HSPCPasscodeEntryView;
  v10 = -[HSPCPasscodeEntryView initWithFrame:](&v76, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v11 = v10;
  if (v10)
  {
    v66 = v8;
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11->_keyboardType = 11;
    v11->_numberOfDigits = a3;
    v11->_useMonospacedFont = a4;
    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    text = v11->_text;
    v11->_text = (NSMutableString *)v12;

    v14 = vcvtpd_u64_f64((double)a3 * 0.125);
    v71 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v70 = v14;
    if (v14)
    {
      v17 = 0;
      v18 = vcvtpd_u64_f64((double)a3 / (double)v14);
      v72 = v14 - 1;
      v68 = a3 - (v14 - 1) * v18;
      v69 = v18;
      v19 = (double)(v18 - v68);
      do
      {
        v20 = objc_msgSend((id)objc_opt_class(v11, v15), "fontForNumberOfDigits:useMonospacedFont:", v69, v11->_useMonospacedFont);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        objc_msgSend((id)objc_opt_class(v11, v22), "interWellSpacingForNumberOfDigits:", v69);
        v24 = v23;
        objc_msgSend((id)objc_opt_class(v11, v25), "wellCornerRadiusForNumberOfDigits:", v69);
        v27 = v26;
        objc_msgSend((id)objc_opt_class(v11, v28), "wellSizeForNumberOfDigits:", v69);
        v30 = v29;
        v32 = v31;
        v73 = v17;
        if (v72 == v17)
          v33 = v68;
        else
          v33 = v69;
        v34 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v33);
        objc_msgSend(v71, "addObject:", v34);
        if (v33)
        {
          v35 = (unint64_t)((v24 + v30) * v19 * 0.5);
          if (v72 != v17)
            v35 = 0;
          v36 = (double)v35;
          v37 = v24 + v32;
          v38 = (v24 + v32) * (double)v17;
          v39 = -(v37 * (double)(v72 - v17));
          do
          {
            v40 = objc_alloc_init(HSPCPasscodeWell);
            -[HSPCPasscodeWell setTranslatesAutoresizingMaskIntoConstraints:](v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeWell label](v40, "label"));
            objc_msgSend(v41, "setFont:", v21);

            -[HSPCPasscodeWell _setContinuousCornerRadius:](v40, "_setContinuousCornerRadius:", v27);
            -[HSPCPasscodeEntryView addSubview:](v11, "addSubview:", v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lastObject"));
            objc_msgSend(v34, "addObject:", v40);
            if (v42)
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeWell widthAnchor](v40, "widthAnchor"));
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "widthAnchor"));
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v44));
              objc_msgSend(v16, "addObject:", v45);

              v46 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeWell leadingAnchor](v40, "leadingAnchor"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
              v48 = v46;
              v49 = v47;
              v50 = v24;
            }
            else
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeWell leadingAnchor](v40, "leadingAnchor"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryView leadingAnchor](v11, "leadingAnchor"));
              v48 = v46;
              v49 = v47;
              v50 = v36;
            }
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, v50, v66));
            objc_msgSend(v16, "addObject:", v51);

            if (v33 == 1)
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryView trailingAnchor](v11, "trailingAnchor"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeWell trailingAnchor](v40, "trailingAnchor"));
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, v36));
              objc_msgSend(v16, "addObject:", v54);

            }
            v55 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeWell topAnchor](v40, "topAnchor"));
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryView topAnchor](v11, "topAnchor"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, v38));
            objc_msgSend(v16, "addObject:", v57);

            v58 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeWell bottomAnchor](v40, "bottomAnchor"));
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryView bottomAnchor](v11, "bottomAnchor"));
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, v39));
            objc_msgSend(v16, "addObject:", v60);

            --v33;
          }
          while (v33);
        }

        v17 = v73 + 1;
      }
      while (v73 + 1 != v70);
    }
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16, v66);
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_10003EFAC;
    v74[3] = &unk_1000A2CD8;
    v75 = objc_alloc_init((Class)NSMutableArray);
    v61 = v75;
    objc_msgSend(v71, "enumerateObjectsUsingBlock:", v74);
    v62 = (NSArray *)objc_msgSend(v61, "copy");
    wells = v11->_wells;
    v11->_wells = v62;

    -[HSPCPasscodeEntryView _updateWells](v11, "_updateWells");
    v64 = v11;

    v8 = v67;
  }

  return v11;
}

- (HSPCPasscodeEntryView)initWithFrame:(CGRect)a3
{
  return -[HSPCPasscodeEntryView initWithNumberOfDigits:useMonospacedFont:delegate:](self, "initWithNumberOfDigits:useMonospacedFont:delegate:", 4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HSPCPasscodeEntryView;
  -[HSPCPasscodeEntryView tintColorDidChange](&v3, "tintColorDidChange");
  -[HSPCPasscodeEntryView _updateWells](self, "_updateWells");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HSPCPasscodeEntryView;
  -[HSPCPasscodeEntryView _dynamicUserInterfaceTraitDidChange](&v3, "_dynamicUserInterfaceTraitDidChange");
  -[HSPCPasscodeEntryView _updateWells](self, "_updateWells");
}

- (NSString)text
{
  return (NSString *)-[NSMutableString copy](self->_text, "copy");
}

- (void)setText:(id)a3
{
  id v4;
  unint64_t numberOfDigits;
  void *v6;
  NSMutableString *v7;
  NSMutableString *text;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  if ((-[NSMutableString isEqualToString:](self->_text, "isEqualToString:") & 1) == 0)
  {
    v4 = objc_msgSend(v11, "length");
    numberOfDigits = self->_numberOfDigits;
    if ((unint64_t)v4 > numberOfDigits)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@' is too long for %@; _numberOfDigits=%ld"),
                       v11,
                       self,
                       numberOfDigits));
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v9, 0));

      objc_exception_throw(v10);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uppercaseString"));
    v7 = (NSMutableString *)objc_msgSend(v6, "mutableCopy");
    text = self->_text;
    self->_text = v7;

    -[HSPCPasscodeEntryView _updateWells](self, "_updateWells");
  }

}

- (void)_updateWells
{
  id v3;
  void *v4;
  double v5;
  double v6;
  NSArray *wells;
  _QWORD v8[7];

  v3 = -[NSMutableString length](self->_text, "length");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryView traitCollection](self, "traitCollection"));
  objc_msgSend(v4, "displayScale");
  v6 = 1.0 / v5;

  wells = self->_wells;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003F25C;
  v8[3] = &unk_1000A2D00;
  v8[4] = self;
  v8[5] = v3;
  *(double *)&v8[6] = v6;
  -[NSArray enumerateObjectsUsingBlock:](wells, "enumerateObjectsUsingBlock:", v8);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(self, a2), "preferredSizeForNumberOfDigits:", self->_numberOfDigits);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)wellSizeForNumberOfDigits:(int64_t)a3
{
  int64_t v3;
  double v4;
  float v5;
  double v6;
  double v7;
  CGSize result;

  v3 = 8;
  if (a3 < 8)
    v3 = a3;
  v4 = (double)(v3 - 4);
  v5 = v4 * -4.5 + 50.0;
  v6 = roundf(v5);
  *(float *)&v4 = v4 * -7.0 + 76.0;
  v7 = roundf(*(float *)&v4);
  result.height = v7;
  result.width = v6;
  return result;
}

+ (double)interWellSpacingForNumberOfDigits:(int64_t)a3
{
  int64_t v3;
  float v4;

  v3 = 8;
  if (a3 < 8)
    v3 = a3;
  v4 = (double)(v3 - 4) * -0.5 + 8.0;
  return roundf(v4);
}

+ (double)wellCornerRadiusForNumberOfDigits:(int64_t)a3
{
  return 8.0;
}

+ (CGSize)preferredSizeForNumberOfDigits:(int64_t)a3
{
  double v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v4 = (double)a3 * 0.125;
  v5 = vcvtpd_u64_f64(v4);
  v6 = (double)(unint64_t)ceil(v4);
  v7 = (double)a3 / v6;
  v8 = ceil(v7);
  v9 = vcvtpd_u64_f64(v7);
  objc_msgSend(a1, "wellSizeForNumberOfDigits:", v9);
  v11 = v10;
  v13 = v12;
  objc_msgSend(a1, "interWellSpacingForNumberOfDigits:", v9);
  v15 = v14 * (double)(v5 - 1) + v13 * v6;
  v16 = v14 * (double)(v9 - 1) + v11 * (double)(unint64_t)v8;
  result.height = v15;
  result.width = v16;
  return result;
}

+ (id)fontForNumberOfDigits:(int64_t)a3 useMonospacedFont:(BOOL)a4
{
  int64_t v4;
  float v5;
  double v6;
  void *v7;

  v4 = 8;
  if (a3 < 8)
    v4 = a3;
  v5 = 28.0 - (double)(v4 - 4);
  v6 = roundf(v5);
  if (a4)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont monospacedSystemFontOfSize:weight:](UIFont, "monospacedSystemFontOfSize:weight:", v6, UIFontWeightSemibold));
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v6, UIFontWeightMedium));
  return v7;
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HSPCPasscodeEntryView;
  v3 = -[HSPCPasscodeEntryView becomeFirstResponder](&v7, "becomeFirstResponder");
  if (v3)
  {
    -[HSPCPasscodeEntryView _updateWells](self, "_updateWells");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryView delegate](self, "delegate"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeEntryView delegate](self, "delegate"));
      objc_msgSend(v5, "passcodeEntryViewDidBecomeFirstResponder:", self);

    }
  }
  return v3;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HSPCPasscodeEntryView;
  v3 = -[HSPCPasscodeEntryView resignFirstResponder](&v5, "resignFirstResponder");
  if (v3)
    -[HSPCPasscodeEntryView _updateWells](self, "_updateWells");
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return -[HSPCPasscodeEntryView isEnabled](self, "isEnabled");
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HSPCPasscodeEntryView;
  v5 = -[HSPCPasscodeEntryView beginTrackingWithTouch:withEvent:](&v7, "beginTrackingWithTouch:withEvent:", a3, a4);
  if (v5)
    -[HSPCPasscodeEntryView becomeFirstResponder](self, "becomeFirstResponder");
  return v5;
}

- (BOOL)hasText
{
  return -[NSMutableString length](self->_text, "length") != 0;
}

- (void)insertText:(id)a3
{
  NSMutableString *text;
  void *v5;
  id v6;

  v6 = a3;
  if ((unint64_t)-[NSMutableString length](self->_text, "length") < self->_numberOfDigits)
  {
    text = self->_text;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uppercaseString"));
    -[NSMutableString appendString:](text, "appendString:", v5);

    -[HSPCPasscodeEntryView _updateWells](self, "_updateWells");
    -[HSPCPasscodeEntryView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }

}

- (void)deleteBackward
{
  if (-[NSMutableString length](self->_text, "length"))
  {
    -[NSMutableString replaceCharactersInRange:withString:](self->_text, "replaceCharactersInRange:withString:", (char *)-[NSMutableString length](self->_text, "length") - 1, 1, &stru_1000A3BA0);
    -[HSPCPasscodeEntryView _updateWells](self, "_updateWells");
    -[HSPCPasscodeEntryView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (int64_t)autocapitalizationType
{
  return 3;
}

- (unint64_t)numberOfDigits
{
  return self->_numberOfDigits;
}

- (BOOL)useMonospacedFont
{
  return self->_useMonospacedFont;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (HSPCPasscodeEntryViewDelegate)delegate
{
  return (HSPCPasscodeEntryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wells, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
