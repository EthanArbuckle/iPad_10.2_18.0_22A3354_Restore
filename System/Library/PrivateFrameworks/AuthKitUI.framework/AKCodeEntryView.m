@implementation AKCodeEntryView

- (AKCodeEntryView)initWithFrame:(CGRect)a3
{
  AKCodeEntryView *v3;
  AKCodeEntryView *v4;
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
  void *v15;
  uint64_t v16;
  NSArray *generatorFields;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)AKCodeEntryView;
  v3 = -[AKCodeEntryView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AKCodeEntryView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    stringValue = v4->_stringValue;
    v4->_stringValue = v5;

    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend((id)objc_opt_class(), "generatorFieldFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = 6;
    do
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v9, v10, v11, v12);
      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v14, "setFont:", v8);
      objc_msgSend(v14, "setText:", CFSTR("–"));
      objc_msgSend(v14, "setTextAlignment:", 1);
      objc_msgSend(v14, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDisableUpdateMask:", objc_msgSend(v15, "disableUpdateMask") | 0x12);

      -[AKCodeEntryView addSubview:](v4, "addSubview:", v14);
      objc_msgSend(v7, "addObject:", v14);

      --v13;
    }
    while (v13);
    v16 = objc_msgSend(v7, "copy");
    generatorFields = v4->_generatorFields;
    v4->_generatorFields = (NSArray *)v16;

    LODWORD(v18) = 1144750080;
    -[AKCodeEntryView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v18);
    LODWORD(v19) = 1144750080;
    -[AKCodeEntryView setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v19);
    LODWORD(v20) = 1144750080;
    -[AKCodeEntryView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v20);
    LODWORD(v21) = 1132068864;
    -[AKCodeEntryView setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v21);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v4, sel_passcodeFieldTapped_);
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = (UITapGestureRecognizer *)v22;

    -[AKCodeEntryView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_tapGestureRecognizer);
    v4->_passcodeFieldDisabled = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v4, sel__updateFonts_, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB3F0], 0);

  v4.receiver = self;
  v4.super_class = (Class)AKCodeEntryView;
  -[AKCodeEntryView dealloc](&v4, sel_dealloc);
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

  v15 = *MEMORY[0x1E0C80C00];
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

  -[AKCodeEntryView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_syncStringValueToLabels
{
  unint64_t i;
  void *v4;
  void *v5;

  for (i = 0; i != 6; ++i)
  {
    if (i >= -[NSMutableString length](self->_stringValue, "length"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_generatorFields, "objectAtIndexedSubscript:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setText:", CFSTR("–"));
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
  -[AKCodeEntryView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *activeConstraints;
  objc_super v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (self->_activeConstraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = 0;
  v6 = *MEMORY[0x1E0CEB5B0];
  do
  {
    v7 = (void *)MEMORY[0x1E0CB3718];
    if (v5)
    {
      -[NSArray objectAtIndexedSubscript:](self->_generatorFields, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray firstObject](self->_generatorFields, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 11, 0, v9, 11, 1.0, 0.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);
    }
    else
    {
      v22 = CFSTR("generatorLabel");
      -[NSArray objectAtIndexedSubscript:](self->_generatorFields, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[generatorLabel]|"), 0, 0, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v10);
    }

    v11 = (void *)MEMORY[0x1E0CB3718];
    -[NSArray objectAtIndexedSubscript:](self->_generatorFields, "objectAtIndexedSubscript:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scaledValueForValue:", 14.5);
    objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 7, 0, 0, 0, 1.0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

    -[NSArray objectAtIndexedSubscript:](self->_generatorFields, "objectAtIndexedSubscript:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("codeGeneratorLabel%d"), v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

    ++v5;
  }
  while (v5 != 6);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[codeGeneratorLabel0]-(DIGIT_SPACING)-[codeGeneratorLabel1]-(DIGIT_SPACING)-[codeGeneratorLabel2]-(GROUP_SEPARATOR_SPACING)-[codeGeneratorLabel3]-(DIGIT_SPACING)-[codeGeneratorLabel4]-(DIGIT_SPACING)-[codeGeneratorLabel5]|"), 0x10000, &unk_1E769ABC8, v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v18);
  v19 = (NSArray *)objc_msgSend(v3, "copy");
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v19;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_activeConstraints);
  v21.receiver = self;
  v21.super_class = (Class)AKCodeEntryView;
  -[AKCodeEntryView updateConstraints](&v21, sel_updateConstraints);

}

- (UILabel)firstGeneratorField
{
  return (UILabel *)-[NSArray firstObject](self->_generatorFields, "firstObject");
}

- (void)emitCodeEnteredNotification
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("generatedCode");
  -[AKCodeEntryView stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("AKSecondFactorCodeEntryContentViewControllerDidEnterCodeNotification"), 0, v5);

}

- (NSString)stringValue
{
  return (NSString *)(id)-[NSMutableString copy](self->_stringValue, "copy");
}

- (void)setStringValue:(id)a3
{
  NSMutableString *stringValue;
  void *v5;

  stringValue = self->_stringValue;
  v5 = (void *)objc_msgSend(a3, "copy");
  -[NSMutableString setString:](stringValue, "setString:", v5);

  -[AKCodeEntryView _syncStringValueToLabels](self, "_syncStringValueToLabels");
  if (-[NSMutableString length](self->_stringValue, "length") == 6)
  {
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_emitCodeEnteredNotification, 0);
    -[AKCodeEntryView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_emitCodeEnteredNotification, 0, 1.0);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return !self->_passcodeFieldDisabled;
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKCodeEntryView;
  v2 = -[AKCodeEntryView becomeFirstResponder](&v5, sel_becomeFirstResponder);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setReturnKeyEnabled:", 0);

  }
  return v2;
}

- (int64_t)keyboardType
{
  return 4;
}

- (int64_t)keyboardAppearance
{
  return 1;
}

- (void)insertText:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[NSMutableString length](self->_stringValue, "length") != 6
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("\n")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invertedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "rangeOfCharacterFromSet:", v5) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v6, "length"))
      {
        -[NSMutableString appendString:](self->_stringValue, "appendString:", v6);
        -[AKCodeEntryView _syncStringValueToLabels](self, "_syncStringValueToLabels");
        if (-[NSMutableString length](self->_stringValue, "length") == 6)
        {
          objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_emitCodeEnteredNotification, 0);
          -[AKCodeEntryView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_emitCodeEnteredNotification, 0, 1.0);
        }
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
    -[AKCodeEntryView _syncStringValueToLabels](self, "_syncStringValueToLabels");
  }
}

- (void)passcodeFieldTapped:(id)a3
{
  if (-[AKCodeEntryView canBecomeFirstResponder](self, "canBecomeFirstResponder", a3))
    -[AKCodeEntryView becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)setPasscodeFieldDisabled:(BOOL)a3
{
  self->_passcodeFieldDisabled = a3;
}

- (BOOL)isSecureTextEntry
{
  return 1;
}

+ (id)generatorFieldFont
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  v2 = *MEMORY[0x1E0CEB5B0];
  objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB5B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:", 24.0);
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v2, 0, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
