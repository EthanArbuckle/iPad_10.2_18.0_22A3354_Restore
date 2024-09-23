@implementation ENUIVerificationCodeEntryView

- (ENUIVerificationCodeEntryView)initWithFrame:(CGRect)a3
{
  ENUIVerificationCodeEntryView *v3;
  ENUIVerificationCodeEntryView *v4;
  NSMutableString *v5;
  NSMutableString *stringValue;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *generatorFields;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)ENUIVerificationCodeEntryView;
  v3 = -[ENUIVerificationCodeEntryView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ENUIVerificationCodeEntryView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    stringValue = v4->_stringValue;
    v4->_stringValue = v5;

    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend((id)objc_opt_class(), "generatorFieldFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v13 = 8;
    do
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v9, v10, v11, v12);
      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v14, "setFont:", v8);
      objc_msgSend(v14, "setText:", CFSTR("—"));
      objc_msgSend(v14, "setLineBreakMode:", 2);
      objc_msgSend(v14, "setTextAlignment:", 1);
      -[ENUIVerificationCodeEntryView addSubview:](v4, "addSubview:", v14);
      objc_msgSend(v7, "addObject:", v14);

      --v13;
    }
    while (v13);
    v15 = objc_msgSend(v7, "copy");
    generatorFields = v4->_generatorFields;
    v4->_generatorFields = (NSArray *)v15;

    LODWORD(v17) = 1144750080;
    -[ENUIVerificationCodeEntryView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v17);
    LODWORD(v18) = 1144750080;
    -[ENUIVerificationCodeEntryView setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v18);
    LODWORD(v19) = 1144750080;
    -[ENUIVerificationCodeEntryView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v19);
    LODWORD(v20) = 1132068864;
    -[ENUIVerificationCodeEntryView setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v20);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v4, sel_passcodeFieldTapped_);
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = (UITapGestureRecognizer *)v21;

    -[ENUIVerificationCodeEntryView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_tapGestureRecognizer);
    v4->_passcodeFieldDisabled = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v4, sel__updateFonts_, *MEMORY[0x24BEBE088], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE088], 0);

  v4.receiver = self;
  v4.super_class = (Class)ENUIVerificationCodeEntryView;
  -[ENUIVerificationCodeEntryView dealloc](&v4, sel_dealloc);
}

- (void)_updateFonts:(id)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "generatorFieldFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_generatorFields;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setFont:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[ENUIVerificationCodeEntryView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_syncStringValueToLabels
{
  unint64_t i;
  void *v4;
  void *v5;

  for (i = 0; i != 8; ++i)
  {
    if (i >= -[NSMutableString length](self->_stringValue, "length"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_generatorFields, "objectAtIndexedSubscript:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setText:", CFSTR("—"));
    }
    else
    {
      -[NSMutableString substringWithRange:](self->_stringValue, "substringWithRange:", i, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_generatorFields, "objectAtIndexedSubscript:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setText:", v4);

    }
  }
  -[ENUIVerificationCodeEntryView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  id v3;
  void *v4;
  NSString *v5;
  NSString *v6;
  NSComparisonResult v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSArray *v30;
  NSArray *activeConstraints;
  void *v32;
  objc_super v33;
  const __CFString *v34;
  void *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  if (self->_activeConstraints)
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:");
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ENUIVerificationCodeEntryView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "maximumContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIContentSizeCategoryCompareToCategory(v5, v6);

  if (v7 == NSOrderedDescending)
  {
    v8 = (void *)MEMORY[0x24BEBDAB0];
    v36[0] = v4;
    objc_msgSend((id)objc_opt_class(), "maximumContentSizeCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "traitCollectionWithPreferredContentSizeCategory:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "traitCollectionWithTraitsFromCollections:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v12;
  }
  v13 = (void *)MEMORY[0x24BEBD5F0];
  objc_msgSend((id)objc_opt_class(), "textStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "metricsForTextStyle:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v4;
  objc_msgSend(v15, "scaledValueForValue:compatibleWithTraitCollection:", v4, 25.0);
  v17 = v16;

  v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  for (i = 0; i != 8; ++i)
  {
    v20 = (void *)MEMORY[0x24BDD1628];
    if (i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_generatorFields, "objectAtIndexedSubscript:", i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray firstObject](self->_generatorFields, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 11, 0, v22, 11, 1.0, 0.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v23);
    }
    else
    {
      v34 = CFSTR("generatorLabel");
      -[NSArray objectAtIndexedSubscript:](self->_generatorFields, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[generatorLabel]|"), 0, 0, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v23);
    }

    v24 = (void *)MEMORY[0x24BDD1628];
    -[NSArray objectAtIndexedSubscript:](self->_generatorFields, "objectAtIndexedSubscript:", i);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 7, 0, 0, 0, 1.0, v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v26);

    -[NSArray objectAtIndexedSubscript:](self->_generatorFields, "objectAtIndexedSubscript:", i);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("codeGeneratorLabel%d"), i);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v27, v28);

  }
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[codeGeneratorLabel0]-(DIGIT_SPACING)-[codeGeneratorLabel1]-(DIGIT_SPACING)-[codeGeneratorLabel2]-(DIGIT_SPACING)-[codeGeneratorLabel3]-(GROUP_SEPARATOR_SPACING)-[codeGeneratorLabel4]-(DIGIT_SPACING)-[codeGeneratorLabel5]-(DIGIT_SPACING)-[codeGeneratorLabel6]-(DIGIT_SPACING)-[codeGeneratorLabel7]|"), 0x10000, &unk_24E0D7EC0, v18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v29);
  v30 = (NSArray *)objc_msgSend(v3, "copy");
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v30;

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_activeConstraints);
  v33.receiver = self;
  v33.super_class = (Class)ENUIVerificationCodeEntryView;
  -[ENUIVerificationCodeEntryView updateConstraints](&v33, sel_updateConstraints);

}

- (UILabel)firstGeneratorField
{
  return (UILabel *)-[NSArray firstObject](self->_generatorFields, "firstObject");
}

- (void)emitCodeEnteredNotification
{
  void (**didEnterCode)(void);

  didEnterCode = (void (**)(void))self->_didEnterCode;
  if (didEnterCode)
    didEnterCode[2]();
}

- (NSString)stringValue
{
  return (NSString *)(id)-[NSMutableString copy](self->_stringValue, "copy");
}

- (void)setStringValue:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableString *stringValue;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((unint64_t)objc_msgSend(v12, "length") >= 9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENUIVerificationCodeEntryView.m"), 177, CFSTR("Illegal length for stringValue"));

  }
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v12, "rangeOfCharacterFromSet:", v6);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENUIVerificationCodeEntryView.m"), 178, CFSTR("Illegal chars in stringValue"));

  }
  stringValue = self->_stringValue;
  v9 = (void *)objc_msgSend(v12, "copy");
  -[NSMutableString setString:](stringValue, "setString:", v9);

  -[ENUIVerificationCodeEntryView _syncStringValueToLabels](self, "_syncStringValueToLabels");
  if (-[NSMutableString length](self->_stringValue, "length") == 8)
  {
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_emitCodeEnteredNotification, 0);
    -[ENUIVerificationCodeEntryView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_emitCodeEnteredNotification, 0, 1.0);
  }

}

- (BOOL)canBecomeFirstResponder
{
  return !self->_passcodeFieldDisabled;
}

- (int64_t)keyboardType
{
  return 4;
}

- (NSString)textContentType
{
  return (NSString *)(id)*MEMORY[0x24BEBE800];
}

- (void)insertText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  id v8;

  v8 = a3;
  if (-[NSMutableString length](self->_stringValue, "length") != 8
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("\n")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invertedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "rangeOfCharacterFromSet:", v5) == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v8, "length"))
    {
      -[NSMutableString appendString:](self->_stringValue, "appendString:", v8);
      -[ENUIVerificationCodeEntryView _syncStringValueToLabels](self, "_syncStringValueToLabels");
      if (-[NSMutableString length](self->_stringValue, "length") == 8)
      {
        objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_emitCodeEnteredNotification, 0);
        -[ENUIVerificationCodeEntryView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_emitCodeEnteredNotification, 0, 1.0);
      }
      -[ENUIVerificationCodeEntryView didEnterDigit](self, "didEnterDigit");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[ENUIVerificationCodeEntryView didEnterDigit](self, "didEnterDigit");
        v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v7[2]();

      }
    }

  }
}

- (BOOL)hasText
{
  return -[NSMutableString length](self->_stringValue, "length") != 0;
}

- (void)deleteBackward
{
  if (-[NSMutableString length](self->_stringValue, "length"))
  {
    -[NSMutableString deleteCharactersInRange:](self->_stringValue, "deleteCharactersInRange:", -[NSMutableString length](self->_stringValue, "length") - 1, 1);
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_emitCodeEnteredNotification, 0);
    -[ENUIVerificationCodeEntryView _syncStringValueToLabels](self, "_syncStringValueToLabels");
  }
}

- (void)passcodeFieldTapped:(id)a3
{
  if (-[ENUIVerificationCodeEntryView canBecomeFirstResponder](self, "canBecomeFirstResponder", a3))
    -[ENUIVerificationCodeEntryView becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)setPasscodeFieldDisabled:(BOOL)a3
{
  self->_passcodeFieldDisabled = a3;
}

+ (id)textStyle
{
  return (id)*MEMORY[0x24BEBE210];
}

+ (id)maximumContentSizeCategory
{
  return (id)*MEMORY[0x24BEBE0B8];
}

+ (id)generatorFieldFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(a1, "textStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "maximumContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_preferredFontForTextStyle:maximumContentSizeCategory:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)textInRange:(id)a3
{
  id v4;
  NSMutableString *stringValue;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    stringValue = self->_stringValue;
    v6 = objc_msgSend(v4, "range");
    -[NSMutableString substringWithRange:](stringValue, "substringWithRange:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  id v6;
  NSMutableString *stringValue;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (**v11)(void);
  id v12;

  v12 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    stringValue = self->_stringValue;
    v8 = objc_msgSend(v12, "range");
    -[NSMutableString replaceCharactersInRange:withString:](stringValue, "replaceCharactersInRange:withString:", v8, v9, v6);
    -[ENUIVerificationCodeEntryView didEnterDigit](self, "didEnterDigit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[ENUIVerificationCodeEntryView didEnterDigit](self, "didEnterDigit");
      v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v11[2]();

    }
  }

}

- (UITextRange)selectedTextRange
{
  return (UITextRange *)+[ENUITextRange rangeWithRange:](ENUITextRange, "rangeWithRange:", -[NSMutableString length](self->_stringValue, "length"), 0);
}

- (UITextRange)markedTextRange
{
  return 0;
}

- (UITextPosition)beginningOfDocument
{
  return (UITextPosition *)+[ENUITextPosition positionWithLocation:](ENUITextPosition, "positionWithLocation:", 0);
}

- (UITextPosition)endOfDocument
{
  return (UITextPosition *)+[ENUITextPosition positionWithLocation:](ENUITextPosition, "positionWithLocation:", -[NSMutableString length](self->_stringValue, "length"));
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      v9 = objc_msgSend(v7, "location");
      v10 = objc_msgSend(v8, "location");

      +[ENUITextRange rangeWithRange:](ENUITextRange, "rangeWithRange:", v9, v10 - objc_msgSend(v7, "location"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v7 = objc_msgSend(v6, "location") + a4, v7 <= -[NSMutableString length](self->_stringValue, "length")))
  {
    +[ENUITextPosition positionWithLocation:](ENUITextPosition, "positionWithLocation:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return 0;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      v9 = objc_msgSend(v7, "location");
      if (v9 >= objc_msgSend(v8, "location"))
      {
        v11 = objc_msgSend(v7, "location");
        v10 = v11 > objc_msgSend(v8, "location");
      }
      else
      {
        v10 = -1;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  int64_t v9;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v6, "location");
      v9 = v8 - objc_msgSend(v7, "location");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (UITextInputTokenizer)tokenizer
{
  return (UITextInputTokenizer *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA78]), "initWithTextInput:", self);
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return (id)objc_msgSend(a3, "end");
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[ENUITextRange rangeWithRange:](ENUITextRange, "rangeWithRange:", objc_msgSend(v4, "location"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return -1;
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return (id)objc_msgSend(a4, "end", a3.x, a3.y);
}

- (NSDictionary)markedTextStyle
{
  return self->_markedTextStyle;
}

- (void)setMarkedTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (UITextInputDelegate)inputDelegate
{
  return (UITextInputDelegate *)objc_loadWeakRetained((id *)&self->_inputDelegate);
}

- (void)setInputDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_inputDelegate, a3);
}

- (id)didEnterDigit
{
  return self->_didEnterDigit;
}

- (void)setDidEnterDigit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (id)didEnterCode
{
  return self->_didEnterCode;
}

- (void)setDidEnterCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSArray)generatorFields
{
  return self->_generatorFields;
}

- (void)setGeneratorFields:(id)a3
{
  objc_storeStrong((id *)&self->_generatorFields, a3);
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_generatorFields, 0);
  objc_storeStrong(&self->_didEnterCode, 0);
  objc_storeStrong(&self->_didEnterDigit, 0);
  objc_destroyWeak((id *)&self->_inputDelegate);
  objc_storeStrong((id *)&self->_markedTextStyle, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
