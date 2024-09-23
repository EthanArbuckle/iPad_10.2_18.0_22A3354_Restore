@implementation FBKQuestionAnswerCell

+ (id)reuseIdentifier
{
  return CFSTR("FBKQuestionAnswerCell");
}

- (FBKQuestionAnswerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  FBKQuestionAnswerCell *v4;
  FBKQuestionAnswerCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBKQuestionAnswerCell;
  v4 = -[FBKQuestionAnswerCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[FBKQuestionAnswerCell commonInit](v4, "commonInit");
  return v5;
}

- (FBKQuestionAnswerCell)initWithCoder:(id)a3
{
  FBKQuestionAnswerCell *v3;
  FBKQuestionAnswerCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBKQuestionAnswerCell;
  v3 = -[FBKQuestionAnswerCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[FBKQuestionAnswerCell commonInit](v3, "commonInit");
  return v4;
}

- (FBKQuestionAnswerCell)initWithFrame:(CGRect)a3
{
  FBKQuestionAnswerCell *v3;
  FBKQuestionAnswerCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBKQuestionAnswerCell;
  v3 = -[FBKQuestionAnswerCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[FBKQuestionAnswerCell commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *errorArrow;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  self->_showError = 0;
  v3 = objc_alloc(MEMORY[0x24BEBD668]);
  v4 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithWeight:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemImageNamed:withConfiguration:", CFSTR("arrow.forward.circle.fill"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v6);
  errorArrow = self->_errorArrow;
  self->_errorArrow = v7;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_errorArrow, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_errorArrow, "setContentMode:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_answerTextView);
  objc_msgSend(WeakRetained, "textContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLineBreakMode:", 0);

  self->_hasPlaceholder = 1;
  self->_hasKeyboardFocus = 0;
  -[FBKQuestionAnswerCell questionLabel](self, "questionLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEditable:", 0);

  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSelectable:", 0);

  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUserInteractionEnabled:", 0);

}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)FBKQuestionAnswerCell;
  -[FBKQuestionAnswerCell awakeFromNib](&v19, sel_awakeFromNib);
  -[FBKQuestionAnswerCell updateErrorArrow](self, "updateErrorArrow");
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionAnswerCell questionLabel](self, "questionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  -[FBKQuestionAnswerCell questionLabel](self, "questionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);

  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionAnswerCell errorArrow](self, "errorArrow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

  -[FBKQuestionAnswerCell questionLabel](self, "questionLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);

  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

  -[FBKQuestionAnswerCell setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);
  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintGreaterThanOrEqualToConstant:", 75.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionAnswerCell setAnswerHeightConstraint:](self, "setAnswerHeightConstraint:", v14);

  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionAnswerCell topAnchor](self, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionAnswerCell setAnswerTopAnchorConstraint:](self, "setAnswerTopAnchorConstraint:", v18);

}

- (void)setShowError:(BOOL)a3
{
  self->_showError = a3;
  -[FBKQuestionAnswerCell updateErrorArrow](self, "updateErrorArrow");
}

- (void)updateErrorArrow
{
  if (self->_showError)
    -[FBKQuestionAnswerCell showErrorArrow](self, "showErrorArrow");
  else
    -[FBKQuestionAnswerCell hideErrorArrow](self, "hideErrorArrow");
}

- (void)showErrorArrow
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  const __CFString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  -[FBKQuestionAnswerCell errorArrow](self, "errorArrow");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v36 = (id)v3;
    -[FBKQuestionAnswerCell errorArrow](self, "errorArrow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      -[FBKQuestionAnswerCell questionLabel](self, "questionLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[FBKQuestionAnswerCell contentView](self, "contentView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKQuestionAnswerCell errorArrow](self, "errorArrow");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addSubview:", v8);

        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x24BDD1628];
        v41 = CFSTR("margin");
        v11 = (void *)MEMORY[0x24BDD16E0];
        -[FBKQuestionAnswerCell separatorInset](self, "separatorInset");
        v13 = v12;
        -[FBKQuestionAnswerCell safeAreaInsets](self, "safeAreaInsets");
        objc_msgSend(v11, "numberWithDouble:", v13 - v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = CFSTR("arrow");
        -[FBKQuestionAnswerCell errorArrow](self, "errorArrow");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v39[1] = CFSTR("q");
        v40[0] = v17;
        -[FBKQuestionAnswerCell questionLabel](self, "questionLabel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-margin-[arrow(18)]-8-[q]"), 0, v16, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "addObjectsFromArray:", v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = (void *)MEMORY[0x24BDD1628];
          v37[0] = CFSTR("arrow");
          -[FBKQuestionAnswerCell errorArrow](self, "errorArrow");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v37[1] = CFSTR("a");
          v38[0] = v22;
          -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v38[1] = v23;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[arrow]-8-[a]"), 0, 0, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "firstObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v27) = 1148829696;
          objc_msgSend(v26, "setPriority:", v27);

          objc_msgSend(v9, "addObjectsFromArray:", v25);
        }
        v28 = (void *)MEMORY[0x24BDD1628];
        -[FBKQuestionAnswerCell errorArrow](self, "errorArrow");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 8, 0, 0, 0, 1.0, 17.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v30);

        -[FBKQuestionAnswerCell contentView](self, "contentView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x24BDD1628];
        -[FBKQuestionAnswerCell errorArrow](self, "errorArrow");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 10, 0, v31, 10, 1.0, 0.0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v34);

        -[FBKQuestionAnswerCell contentView](self, "contentView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addConstraints:", v9);

      }
    }
  }
}

- (void)hideErrorArrow
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[FBKQuestionAnswerCell errorArrow](self, "errorArrow");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[FBKQuestionAnswerCell errorArrow](self, "errorArrow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[FBKQuestionAnswerCell errorArrow](self, "errorArrow");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

    }
  }
}

- (void)hideAccessoryView
{
  -[FBKQuestionAnswerCell setAccessoryType:](self, "setAccessoryType:", 0);
}

- (void)showAccessoryView
{
  -[FBKQuestionAnswerCell setAccessoryType:](self, "setAccessoryType:", 1);
}

- (void)setQuestion:(id)a3
{
  FBKQuestion **p_question;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  p_question = &self->_question;
  objc_storeStrong((id *)&self->_question, a3);
  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (-[FBKQuestion answerType](*p_question, "answerType"))
    {
      if (-[FBKQuestion answerType](*p_question, "answerType") == 1)
      {
        -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setCharacterLimit:", 4096);

        -[FBKQuestionAnswerCell answerHeightConstraint](self, "answerHeightConstraint");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setActive:", 1);

        objc_msgSend(v17, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", &stru_24E15EAF8);

        -[FBKQuestionAnswerCell answerTopAnchorConstraint](self, "answerTopAnchorConstraint");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11)
        {
          v14 = 1;
LABEL_9:
          objc_msgSend(v12, "setActive:", v14);

          goto LABEL_10;
        }
LABEL_8:
        v14 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCharacterLimit:", 255);

    }
    -[FBKQuestionAnswerCell answerHeightConstraint](self, "answerHeightConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 0);

    -[FBKQuestionAnswerCell answerTopAnchorConstraint](self, "answerTopAnchorConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    goto LABEL_8;
  }
LABEL_10:
  -[FBKQuestionAnswerCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setAnswer:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_storeStrong((id *)&self->_answer, a3);
  self->_hasPlaceholder = 1;
  objc_msgSend(v12, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v12, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v12, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_hasPlaceholder = objc_msgSend(v9, "length") == 0;

    }
  }
  if (self->_hasPlaceholder)
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

}

- (BOOL)shouldAllowEditing
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[FBKQuestionAnswerCell question](self, "question");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "answerType"))
  {
    -[FBKQuestionAnswerCell question](self, "question");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "answerType") == 1)
      v5 = !-[FBKQuestionAnswerCell hasKeyboardFocus](self, "hasKeyboardFocus");
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    v5 = !-[FBKQuestionAnswerCell hasKeyboardFocus](self, "hasKeyboardFocus");
  }

  return v5;
}

- (void)beginEditingQuestion
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[FBKQuestionAnswerCell shouldAllowEditing](self, "shouldAllowEditing"))
  {
    -[FBKQuestionAnswerCell question](self, "question");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "canDisplayChoicesInline");

    if ((v4 & 1) == 0)
    {
      -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEditable:", 1);

      -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUserInteractionEnabled:", 1);

      -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIsAccessibilityElement:", 1);

      -[FBKQuestionAnswerCell setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 0);
      if (-[FBKQuestionAnswerCell hasPlaceholder](self, "hasPlaceholder"))
      {
        -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setText:", &stru_24E15EAF8);

        objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTextColor:", v9);

        -[FBKQuestionAnswerCell setHasPlaceholder:](self, "setHasPlaceholder:", 0);
      }
      objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", 0);
      -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "becomeFirstResponder");

      objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", 1);
      -[FBKQuestionAnswerCell setHasKeyboardFocus:](self, "setHasKeyboardFocus:", 1);
      -[FBKQuestionAnswerCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)saveAnswer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "truncate:", objc_msgSend(v5, "characterLimit"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[FBKQuestionAnswerCell answer](self, "answer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", v10);

  -[FBKQuestionAnswerCell answer](self, "answer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionAnswerCell sanitizeAnswer:](self, "sanitizeAnswer:", v7);

  -[FBKQuestionAnswerCell bugFormEditorDelegate](self, "bugFormEditorDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionAnswerCell question](self, "question");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "answerDidChangeForQuestion:", v9);

}

- (void)endEditingQuestion
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  -[FBKQuestionAnswerCell saveAnswer](self, "saveAnswer");
  -[FBKQuestionAnswerCell answer](self, "answer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

LABEL_5:
    -[FBKQuestionAnswerCell setHasPlaceholder:](self, "setHasPlaceholder:", 1);
    -[FBKQuestionAnswerCell question](self, "question");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "placeholder");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      -[FBKQuestionAnswerCell question](self, "question");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "placeholder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (v16)
      {
        -[FBKQuestionAnswerCell question](self, "question");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "placeholder");
        v18 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v19 = (void *)v18;
        -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setText:", v19);

        objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setTextColor:", v21);

        objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setFont:", v9);
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TEXT_ANSWER_PLACEHOLDER"), &stru_24E15EAF8, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v5 = (void *)v4;
  -[FBKQuestionAnswerCell answer](self, "answer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);
LABEL_11:

  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "resignFirstResponder");

  -[FBKQuestionAnswerCell setHasKeyboardFocus:](self, "setHasKeyboardFocus:", 0);
  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setEditable:", 0);

  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setUserInteractionEnabled:", 0);

  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setIsAccessibilityElement:", 0);

  -[FBKQuestionAnswerCell setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);
  -[FBKQuestionAnswerCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)sanitizeAnswer:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "value");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v10, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v10, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:", v9);

    }
  }

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FBKQuestionAnswerCell questionLabel](self, "questionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionAnswerCell answerTextView](self, "answerTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[FBKQuestionAnswerCell questionLabel](self, "questionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("FBKEditor@%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBKQuestionAnswerCell;
  return *MEMORY[0x24BEBDF00] | -[FBKQuestionAnswerCell accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityHint
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[FBKQuestionAnswerCell shouldAllowEditing](self, "shouldAllowEditing");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("ANSWER_CELL_HINT_EDIT");
  else
    v5 = CFSTR("ANSWER_CELL_HINT_CHOOSE");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24E15EAF8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->itemIdentifier, a3);
}

- (UILabel)questionLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_questionLabel);
}

- (void)setQuestionLabel:(id)a3
{
  objc_storeWeak((id *)&self->_questionLabel, a3);
}

- (FBKQuestionCellTextView)answerTextView
{
  return (FBKQuestionCellTextView *)objc_loadWeakRetained((id *)&self->_answerTextView);
}

- (void)setAnswerTextView:(id)a3
{
  objc_storeWeak((id *)&self->_answerTextView, a3);
}

- (UIImageView)answerTextViewAccessoryImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_answerTextViewAccessoryImageView);
}

- (void)setAnswerTextViewAccessoryImageView:(id)a3
{
  objc_storeWeak((id *)&self->_answerTextViewAccessoryImageView, a3);
}

- (NSLayoutConstraint)answerTextViewTopConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_answerTextViewTopConstraint);
}

- (void)setAnswerTextViewTopConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_answerTextViewTopConstraint, a3);
}

- (NSLayoutConstraint)answerTextViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_answerTextViewLeadingConstraint);
}

- (void)setAnswerTextViewLeadingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_answerTextViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)answerTextViewTrailingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_answerTextViewTrailingConstraint);
}

- (void)setAnswerTextViewTrailingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_answerTextViewTrailingConstraint, a3);
}

- (FBKBugFormEditorDelegate)bugFormEditorDelegate
{
  return (FBKBugFormEditorDelegate *)objc_loadWeakRetained((id *)&self->_bugFormEditorDelegate);
}

- (void)setBugFormEditorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_bugFormEditorDelegate, a3);
}

- (FBKQuestion)question
{
  return self->_question;
}

- (FBKAnswer)answer
{
  return self->_answer;
}

- (BOOL)showError
{
  return self->_showError;
}

- (BOOL)hasKeyboardFocus
{
  return self->_hasKeyboardFocus;
}

- (void)setHasKeyboardFocus:(BOOL)a3
{
  self->_hasKeyboardFocus = a3;
}

- (NSString)diffableIdentifier
{
  return self->_diffableIdentifier;
}

- (void)setDiffableIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_diffableIdentifier, a3);
}

- (UIImageView)errorArrow
{
  return self->_errorArrow;
}

- (void)setErrorArrow:(id)a3
{
  objc_storeStrong((id *)&self->_errorArrow, a3);
}

- (BOOL)hasPlaceholder
{
  return self->_hasPlaceholder;
}

- (void)setHasPlaceholder:(BOOL)a3
{
  self->_hasPlaceholder = a3;
}

- (NSLayoutConstraint)answerHeightConstraint
{
  return self->_answerHeightConstraint;
}

- (void)setAnswerHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_answerHeightConstraint, a3);
}

- (NSLayoutConstraint)answerTopAnchorConstraint
{
  return self->_answerTopAnchorConstraint;
}

- (void)setAnswerTopAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_answerTopAnchorConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_answerTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_answerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_errorArrow, 0);
  objc_storeStrong((id *)&self->_diffableIdentifier, 0);
  objc_storeStrong((id *)&self->_answer, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_destroyWeak((id *)&self->_bugFormEditorDelegate);
  objc_destroyWeak((id *)&self->_answerTextViewTrailingConstraint);
  objc_destroyWeak((id *)&self->_answerTextViewLeadingConstraint);
  objc_destroyWeak((id *)&self->_answerTextViewTopConstraint);
  objc_destroyWeak((id *)&self->_answerTextViewAccessoryImageView);
  objc_destroyWeak((id *)&self->_answerTextView);
  objc_destroyWeak((id *)&self->_questionLabel);
  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end
