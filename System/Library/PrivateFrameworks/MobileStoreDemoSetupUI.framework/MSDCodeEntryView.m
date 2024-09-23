@implementation MSDCodeEntryView

+ (id)generatorFieldFont
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  v2 = *MEMORY[0x24BDF7848];
  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF7848]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:", 24.0);
  v5 = v4;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v2, 0, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MSDCodeEntryView)initWithDelegate:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  MSDCodeEntryView *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MSDCodeEntryView;
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v9 = -[MSDCodeEntryView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x24BDBF090], v6, v7, v8);
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    -[MSDCodeEntryView setStringValue:](v9, "setStringValue:", v10);

    -[MSDCodeEntryView setActiveConstraints:](v9, "setActiveConstraints:", 0);
    -[MSDCodeEntryView setDelegate:](v9, "setDelegate:", v4);
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend((id)objc_opt_class(), "generatorFieldFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDCodeEntryView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = 6;
    do
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v5, v6, v7, v8);
      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v14, "setFont:", v12);
      objc_msgSend(v14, "setText:", CFSTR("–"));
      objc_msgSend(v14, "setTextAlignment:", 1);
      -[MSDCodeEntryView addSubview:](v9, "addSubview:", v14);
      objc_msgSend(v11, "addObject:", v14);

      --v13;
    }
    while (v13);
    v15 = (void *)objc_msgSend(v11, "copy");
    -[MSDCodeEntryView setGeneratorFields:](v9, "setGeneratorFields:", v15);

    LODWORD(v16) = 1144750080;
    -[MSDCodeEntryView setContentCompressionResistancePriority:forAxis:](v9, "setContentCompressionResistancePriority:forAxis:", 0, v16);
    LODWORD(v17) = 1144750080;
    -[MSDCodeEntryView setContentHuggingPriority:forAxis:](v9, "setContentHuggingPriority:forAxis:", 0, v17);
    LODWORD(v18) = 1144750080;
    -[MSDCodeEntryView setContentCompressionResistancePriority:forAxis:](v9, "setContentCompressionResistancePriority:forAxis:", 1, v18);
    LODWORD(v19) = 1132068864;
    -[MSDCodeEntryView setContentHuggingPriority:forAxis:](v9, "setContentHuggingPriority:forAxis:", 1, v19);

  }
  return v9;
}

- (void)clearEntry
{
  void *v3;

  -[MSDCodeEntryView stringValue](self, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setString:", &stru_24F47DB30);

  -[MSDCodeEntryView _syncStringValueToLabels](self, "_syncStringValueToLabels");
}

- (void)jiggleAView
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  -[MSDCodeEntryView layer](self, "layer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5760], "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMass:", 1.20000005);
  objc_msgSend(v3, "setStiffness:", 1200.0);
  objc_msgSend(v3, "setDamping:", 12.0);
  objc_msgSend(v3, "setDuration:", 1.39999998);
  objc_msgSend(v3, "setVelocity:", 0.0);
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x24BDE5968]);
  objc_msgSend(v3, "setDelegate:", self);
  LODWORD(v4) = 30.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFromValue:", v5);

  LODWORD(v6) = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setToValue:", v7);

  objc_msgSend(MEMORY[0x24BDE57F0], "functionWithName:", *MEMORY[0x24BDE5EA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValueFunction:", v8);

  LODWORD(v9) = 1028389654;
  LODWORD(v10) = 990057071;
  LODWORD(v11) = 1059712716;
  LODWORD(v12) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunction:", v13);

  objc_msgSend(v3, "setKeyPath:", CFSTR("transform"));
  objc_msgSend(v14, "addAnimation:forKey:", v3, CFSTR("shake"));

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDCodeEntryView;
  v2 = -[MSDCodeEntryView becomeFirstResponder](&v5, sel_becomeFirstResponder);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
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

- (BOOL)hasText
{
  void *v2;
  BOOL v3;

  -[MSDCodeEntryView stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];

  v4 = a3;
  -[MSDCodeEntryView stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 != 6 && (objc_msgSend(v4, "isEqualToString:", CFSTR("\n")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invertedSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "rangeOfCharacterFromSet:", v8) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v4, "length"))
      {
        -[MSDCodeEntryView stringValue](self, "stringValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v4);

        -[MSDCodeEntryView _syncStringValueToLabels](self, "_syncStringValueToLabels");
        -[MSDCodeEntryView stringValue](self, "stringValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11 == 6)
        {
          dispatch_get_global_queue(21, 0);
          v12 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __31__MSDCodeEntryView_insertText___block_invoke;
          block[3] = &unk_24F47D240;
          block[4] = self;
          dispatch_async(v12, block);

        }
      }
    }

  }
}

void __31__MSDCodeEntryView_insertText___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  sleep(1u);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didEnterCode:forEntry:", v2, *(_QWORD *)(a1 + 32));

}

- (void)deleteBackward
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[MSDCodeEntryView stringValue](self, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[MSDCodeEntryView stringValue](self, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDCodeEntryView stringValue](self, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);

    -[MSDCodeEntryView _syncStringValueToLabels](self, "_syncStringValueToLabels");
  }
}

- (void)updateConstraints
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  objc_super v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v31.receiver = self;
  v31.super_class = (Class)MSDCodeEntryView;
  -[MSDCodeEntryView updateConstraints](&v31, sel_updateConstraints);
  -[MSDCodeEntryView activeConstraints](self, "activeConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0x24BDD1000uLL;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDD1628];
    -[MSDCodeEntryView activeConstraints](self, "activeConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v30 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = 0;
  v9 = *MEMORY[0x24BDF7848];
  do
  {
    v10 = v4;
    v11 = *(void **)(v4 + 1576);
    if (v8)
    {
      -[MSDCodeEntryView generatorFields](self, "generatorFields");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDCodeEntryView generatorFields](self, "generatorFields");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 11, 0, v15, 11, 1.0, 0.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v16);

    }
    else
    {
      v32 = CFSTR("generatorLabel");
      -[MSDCodeEntryView generatorFields](self, "generatorFields");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[generatorLabel]|"), 0, 0, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v15);
    }

    v4 = v10;
    v17 = *(void **)(v10 + 1576);
    -[MSDCodeEntryView generatorFields](self, "generatorFields");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scaledValueForValue:", 14.5);
    objc_msgSend(v17, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 7, 0, 0, 0, 1.0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v22);

    -[MSDCodeEntryView generatorFields](self, "generatorFields");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("codeGeneratorLabel%d"), v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", v24, v25);

    ++v8;
  }
  while (v8 != 6);
  objc_msgSend(*(id *)(v10 + 1576), "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[codeGeneratorLabel0]-(DIGIT_SPACING)-[codeGeneratorLabel1]-(DIGIT_SPACING)-[codeGeneratorLabel2]-(GROUP_SEPARATOR_SPACING)-[codeGeneratorLabel3]-(DIGIT_SPACING)-[codeGeneratorLabel4]-(DIGIT_SPACING)-[codeGeneratorLabel5]|"), 0x10000, &unk_24F488810, v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v26);
  v27 = (void *)objc_msgSend(v7, "copy");
  -[MSDCodeEntryView setActiveConstraints:](self, "setActiveConstraints:", v27);

  v28 = *(void **)(v10 + 1576);
  -[MSDCodeEntryView activeConstraints](self, "activeConstraints");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v29);

}

- (void)_syncStringValueToLabels
{
  unint64_t i;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  for (i = 0; i != 6; ++i)
  {
    -[MSDCodeEntryView stringValue](self, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (i >= v5)
    {
      -[MSDCodeEntryView generatorFields](self, "generatorFields");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", CFSTR("–"));
    }
    else
    {
      -[MSDCodeEntryView stringValue](self, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "substringWithRange:", i, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDCodeEntryView generatorFields](self, "generatorFields");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v7);

    }
  }
  -[MSDCodeEntryView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (NSMutableString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (NSArray)generatorFields
{
  return self->_generatorFields;
}

- (void)setGeneratorFields:(id)a3
{
  objc_storeStrong((id *)&self->_generatorFields, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (MSDCodeEntryViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_generatorFields, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
