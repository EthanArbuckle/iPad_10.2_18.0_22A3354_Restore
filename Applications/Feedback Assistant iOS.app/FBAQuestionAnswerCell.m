@implementation FBAQuestionAnswerCell

+ (id)reuseIdentifier
{
  return CFSTR("FBAQuestionAnswerCell");
}

- (FBAQuestionAnswerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  FBAQuestionAnswerCell *v4;
  FBAQuestionAnswerCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBAQuestionAnswerCell;
  v4 = -[FBAQuestionAnswerCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[FBAQuestionAnswerCell commonInit](v4, "commonInit");
  return v5;
}

- (FBAQuestionAnswerCell)initWithCoder:(id)a3
{
  FBAQuestionAnswerCell *v3;
  FBAQuestionAnswerCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBAQuestionAnswerCell;
  v3 = -[FBAQuestionAnswerCell initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[FBAQuestionAnswerCell commonInit](v3, "commonInit");
  return v4;
}

- (FBAQuestionAnswerCell)initWithFrame:(CGRect)a3
{
  FBAQuestionAnswerCell *v3;
  FBAQuestionAnswerCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBAQuestionAnswerCell;
  v3 = -[FBAQuestionAnswerCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[FBAQuestionAnswerCell commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  id v3;
  uint64_t v4;
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
  v3 = objc_alloc((Class)UIImageView);
  v4 = FBKSystemImageNameMissingQuestion;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithWeight:](UIImageSymbolConfiguration, "configurationWithWeight:", 7));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v4, v5));
  v7 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v6);
  errorArrow = self->_errorArrow;
  self->_errorArrow = v7;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_errorArrow, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_errorArrow, "setContentMode:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_answerTextView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "textContainer"));
  objc_msgSend(v10, "setLineBreakMode:", 0);

  self->_hasPlaceholder = 1;
  self->_hasKeyboardFocus = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell questionLabel](self, "questionLabel"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  objc_msgSend(v13, "setEditable:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  objc_msgSend(v14, "setSelectable:", 0);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FBAQuestionAnswerCell;
  -[FBAQuestionAnswerCell awakeFromNib](&v9, "awakeFromNib");
  -[FBAQuestionAnswerCell updateErrorArrow](self, "updateErrorArrow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell questionLabel](self, "questionLabel"));
  objc_msgSend(v4, "setTextColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell questionLabel](self, "questionLabel"));
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  objc_msgSend(v6, "setIsAccessibilityElement:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell errorArrow](self, "errorArrow"));
  objc_msgSend(v8, "setTintColor:", v7);

  -[FBAQuestionAnswerCell setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);
}

- (void)setShowError:(BOOL)a3
{
  self->_showError = a3;
  -[FBAQuestionAnswerCell updateErrorArrow](self, "updateErrorArrow");
}

- (void)updateErrorArrow
{
  if (self->_showError)
    -[FBAQuestionAnswerCell showErrorArrow](self, "showErrorArrow");
  else
    -[FBAQuestionAnswerCell hideErrorArrow](self, "hideErrorArrow");
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
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  const __CFString *v36;
  void *v37;

  v3 = objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell errorArrow](self, "errorArrow"));
  if (v3)
  {
    v31 = (id)v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell errorArrow](self, "errorArrow"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
    if (v5)
    {

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell questionLabel](self, "questionLabel"));

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell contentView](self, "contentView"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell errorArrow](self, "errorArrow"));
        objc_msgSend(v7, "addSubview:", v8);

        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v36 = CFSTR("margin");
        -[FBAQuestionAnswerCell separatorInset](self, "separatorInset");
        v11 = v10;
        -[FBAQuestionAnswerCell safeAreaInsets](self, "safeAreaInsets");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11 - v12));
        v37 = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
        v34[0] = CFSTR("arrow");
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell errorArrow](self, "errorArrow"));
        v34[1] = CFSTR("q");
        v35[0] = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell questionLabel](self, "questionLabel"));
        v35[1] = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 2));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-margin-[arrow(18)]-8-[q]"), 0, v14, v17));

        objc_msgSend(v9, "addObjectsFromArray:", v18);
        v32[0] = CFSTR("arrow");
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell errorArrow](self, "errorArrow"));
        v32[1] = CFSTR("a");
        v33[0] = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
        v33[1] = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[arrow]-8-[a]"), 0, 0, v21));

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
        LODWORD(v24) = *(_DWORD *)"";
        objc_msgSend(v23, "setPriority:", v24);

        objc_msgSend(v9, "addObjectsFromArray:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell errorArrow](self, "errorArrow"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 8, 0, 0, 0, 1.0, 17.0));
        objc_msgSend(v9, "addObject:", v26);

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell errorArrow](self, "errorArrow"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell contentView](self, "contentView"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 10, 0, v28, 10, 1.0, 0.0));
        objc_msgSend(v9, "addObject:", v29);

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell contentView](self, "contentView"));
        objc_msgSend(v30, "addConstraints:", v9);

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

  v3 = objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell errorArrow](self, "errorArrow"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell errorArrow](self, "errorArrow"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    if (v6)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell errorArrow](self, "errorArrow"));
      objc_msgSend(v7, "removeFromSuperview");

    }
  }
}

- (void)hideAccessoryView
{
  -[FBAQuestionAnswerCell setAccessoryType:](self, "setAccessoryType:", 0);
}

- (void)showAccessoryView
{
  -[FBAQuestionAnswerCell setAccessoryType:](self, "setAccessoryType:", 1);
}

- (void)setQuestion:(id)a3
{
  FBKQuestion **p_question;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  p_question = &self->_question;
  objc_storeStrong((id *)&self->_question, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  v7 = objc_opt_class(FBAQuestionCellTextView);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    if (!-[FBKQuestion answerType](*p_question, "answerType"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
      v10 = v9;
      v11 = 255;
      goto LABEL_6;
    }
    if (-[FBKQuestion answerType](*p_question, "answerType") == (id)1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
      v10 = v9;
      v11 = 4096;
LABEL_6:
      objc_msgSend(v9, "setCharacterLimit:", v11);

    }
  }
  -[FBAQuestionAnswerCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setAnswer:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_storeStrong((id *)&self->_answer, a3);
  self->_hasPlaceholder = 1;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
    v8 = objc_opt_class(NSString);
    isKindOfClass = objc_opt_isKindOfClass(v7, v8);

    if ((isKindOfClass & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
      self->_hasPlaceholder = objc_msgSend(v10, "length") == 0;

    }
  }
  if (self->_hasPlaceholder)
    v11 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  else
    v11 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v12 = (void *)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  objc_msgSend(v13, "setTextColor:", v12);

}

- (BOOL)shouldAllowEditing
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell question](self, "question"));
  if (objc_msgSend(v3, "answerType"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell question](self, "question"));
    if (objc_msgSend(v4, "answerType") == (id)1)
      v5 = !-[FBAQuestionAnswerCell hasKeyboardFocus](self, "hasKeyboardFocus");
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    v5 = !-[FBAQuestionAnswerCell hasKeyboardFocus](self, "hasKeyboardFocus");
  }

  return v5;
}

- (void)beginEditingQuestion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[FBAQuestionAnswerCell shouldAllowEditing](self, "shouldAllowEditing"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
    objc_msgSend(v3, "setEditable:", 1);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
    objc_msgSend(v4, "setUserInteractionEnabled:", 1);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
    objc_msgSend(v5, "setIsAccessibilityElement:", 1);

    -[FBAQuestionAnswerCell setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 0);
    if (-[FBAQuestionAnswerCell hasPlaceholder](self, "hasPlaceholder"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
      objc_msgSend(v6, "setText:", &stru_1000EA660);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
      objc_msgSend(v8, "setTextColor:", v7);

      -[FBAQuestionAnswerCell setHasPlaceholder:](self, "setHasPlaceholder:", 0);
    }
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
    objc_msgSend(v9, "becomeFirstResponder");

    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 1);
    -[FBAQuestionAnswerCell setHasKeyboardFocus:](self, "setHasKeyboardFocus:", 1);
    -[FBAQuestionAnswerCell setNeedsLayout](self, "setNeedsLayout");
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objc_truncate:", objc_msgSend(v5, "characterLimit")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answer](self, "answer"));
  objc_msgSend(v6, "setValue:", v10);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answer](self, "answer"));
  -[FBAQuestionAnswerCell sanitizeAnswer:](self, "sanitizeAnswer:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell bugFormEditorDelegate](self, "bugFormEditorDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell question](self, "question"));
  objc_msgSend(v8, "answerDidChangeForQuestion:", v9);

}

- (void)endEditingQuestion
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  -[FBAQuestionAnswerCell saveAnswer](self, "saveAnswer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answer](self, "answer"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  if (!v4)
  {

LABEL_5:
    -[FBAQuestionAnswerCell setHasPlaceholder:](self, "setHasPlaceholder:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell question](self, "question"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeholder"));
    if (v11)
    {
      v12 = (void *)v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell question](self, "question"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "placeholder"));
      v15 = objc_msgSend(v14, "length");

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell question](self, "question"));
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "placeholder"));
LABEL_10:
        v18 = (void *)v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
        objc_msgSend(v19, "setText:", v18);

        v9 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
        goto LABEL_11;
      }
    }
    else
    {

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TEXT_ANSWER_PLACEHOLDER"), &stru_1000EA660, 0));
    goto LABEL_10;
  }
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answer](self, "answer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  v8 = objc_msgSend(v7, "length");

  if (!v8)
    goto LABEL_5;
  v9 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
LABEL_11:
  v20 = (void *)v9;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  objc_msgSend(v21, "setTextColor:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  objc_msgSend(v22, "resignFirstResponder");

  -[FBAQuestionAnswerCell setHasKeyboardFocus:](self, "setHasKeyboardFocus:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  objc_msgSend(v23, "setEditable:", 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  objc_msgSend(v24, "setUserInteractionEnabled:", 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  objc_msgSend(v25, "setIsAccessibilityElement:", 0);

  -[FBAQuestionAnswerCell setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);
  -[FBAQuestionAnswerCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)sanitizeAnswer:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
    v6 = objc_opt_class(NSString);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9));
      objc_msgSend(v11, "setValue:", v10);

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell questionLabel](self, "questionLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell answerTextView](self, "answerTextView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v4, v6));

  return v7;
}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBAQuestionAnswerCell questionLabel](self, "questionLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FBAEditor@%@"), v3));

  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBAQuestionAnswerCell;
  return UIAccessibilityTraitButton | -[FBAQuestionAnswerCell accessibilityTraits](&v3, "accessibilityTraits");
}

- (id)accessibilityHint
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[FBAQuestionAnswerCell shouldAllowEditing](self, "shouldAllowEditing");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("ANSWER_CELL_HINT_EDIT");
  else
    v5 = CFSTR("ANSWER_CELL_HINT_CHOOSE");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1000EA660, 0));

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

- (FBAQuestionCellTextView)answerTextView
{
  return (FBAQuestionCellTextView *)objc_loadWeakRetained((id *)&self->_answerTextView);
}

- (void)setAnswerTextView:(id)a3
{
  objc_storeWeak((id *)&self->_answerTextView, a3);
}

- (FBABugFormEditorDelegate)bugFormEditorDelegate
{
  return (FBABugFormEditorDelegate *)objc_loadWeakRetained((id *)&self->_bugFormEditorDelegate);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorArrow, 0);
  objc_storeStrong((id *)&self->_diffableIdentifier, 0);
  objc_storeStrong((id *)&self->_answer, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_destroyWeak((id *)&self->_bugFormEditorDelegate);
  objc_destroyWeak((id *)&self->_answerTextView);
  objc_destroyWeak((id *)&self->_questionLabel);
  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end
