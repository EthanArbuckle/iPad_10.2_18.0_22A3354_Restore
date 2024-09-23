@implementation GKSignInInputView

- (void)setupConstraintConstantsForOrientation:(int64_t)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  NSLayoutConstraint *topToSignInBaselineConstraint;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  NSLayoutConstraint **p_signInBaselineToPromptTextTopConstraint;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSLayoutConstraint *signInBaselineToPromptTextTopConstraint;
  id v28;

  v4 = a3 - 3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1)
  {
    if (*MEMORY[0x1E0D253F8])
    {
      topToSignInBaselineConstraint = self->_topToSignInBaselineConstraint;
      v8 = 143.0;
    }
    else
    {
      v8 = dbl_1AB7F8160[v4 < 2];
      topToSignInBaselineConstraint = self->_topToSignInBaselineConstraint;
    }
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == 1
    || ((objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v11, "bounds"),
         v13 = v12,
         v15 = v14,
         v11,
         v15 <= v13)
      ? (v16 = v13)
      : (v16 = v15),
        v16 <= 480.0))
  {
    topToSignInBaselineConstraint = self->_topToSignInBaselineConstraint;
    v8 = dbl_1AB7F8150[*MEMORY[0x1E0D253F8] == 0];
LABEL_12:
    -[NSLayoutConstraint setConstant:](topToSignInBaselineConstraint, "setConstant:", v8);
    p_signInBaselineToPromptTextTopConstraint = &self->_signInBaselineToPromptTextTopConstraint;
    v25 = 34.0;
    goto LABEL_13;
  }
  v17 = v4 < 2;
  p_signInBaselineToPromptTextTopConstraint = &self->_topToSignInBaselineConstraint;
  -[NSLayoutConstraint setConstant:](self->_topToSignInBaselineConstraint, "setConstant:", dbl_1AB7F8140[v17]);
  -[NSLayoutConstraint setConstant:](self->_signInBaselineToPromptTextTopConstraint, "setConstant:", 34.0);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;

  -[NSLayoutConstraint constant](self->_topToSignInBaselineConstraint, "constant");
  v25 = v24 * (fmin(v21, v23) / 320.0);
LABEL_13:
  -[NSLayoutConstraint setConstant:](*p_signInBaselineToPromptTextTopConstraint, "setConstant:", v25);
  -[NSLayoutConstraint constant](self->_signInBaselineToPromptTextTopConstraint, "constant");
  -[NSLayoutConstraint setConstant:](self->_promptTextToProgressIndicatorTopConstraint, "setConstant:");
  -[NSLayoutConstraint constant](self->_signInBaselineToPromptTextTopConstraint, "constant");
  -[NSLayoutConstraint setConstant:](self->_signInFormToSignInLabelTopConstraint, "setConstant:", v26 + -15.0);
  +[GKConstraintUpdateController sharedController](GKConstraintUpdateController, "sharedController");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  signInBaselineToPromptTextTopConstraint = self->_signInBaselineToPromptTextTopConstraint;
  -[NSLayoutConstraint constant](signInBaselineToPromptTextTopConstraint, "constant");
  objc_msgSend(v28, "registerConstraint:leading:forFontTextStyle:", signInBaselineToPromptTextTopConstraint, *MEMORY[0x1E0DC4A88]);

}

- (id)allVariableConstraints
{
  NSLayoutConstraint *signInBaselineToPromptTextTopConstraint;
  NSLayoutConstraint *signInFormToSignInLabelTopConstraint;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  signInBaselineToPromptTextTopConstraint = self->_signInBaselineToPromptTextTopConstraint;
  v5[0] = self->_topToSignInBaselineConstraint;
  v5[1] = signInBaselineToPromptTextTopConstraint;
  signInFormToSignInLabelTopConstraint = self->_signInFormToSignInLabelTopConstraint;
  v5[2] = self->_promptTextToProgressIndicatorTopConstraint;
  v5[3] = signInFormToSignInLabelTopConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSLayoutConstraint)topToSignInBaselineConstraint
{
  return self->_topToSignInBaselineConstraint;
}

- (void)setTopToSignInBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topToSignInBaselineConstraint, a3);
}

- (NSLayoutConstraint)bottomToSignInBaselineConstraint
{
  return self->_bottomToSignInBaselineConstraint;
}

- (void)setBottomToSignInBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomToSignInBaselineConstraint, a3);
}

- (NSLayoutConstraint)signInBaselineToPromptTextTopConstraint
{
  return self->_signInBaselineToPromptTextTopConstraint;
}

- (void)setSignInBaselineToPromptTextTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_signInBaselineToPromptTextTopConstraint, a3);
}

- (NSLayoutConstraint)inputViewHeightConstraint
{
  return self->_inputViewHeightConstraint;
}

- (void)setInputViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_inputViewHeightConstraint, a3);
}

- (NSLayoutConstraint)promptTextToProgressIndicatorTopConstraint
{
  return self->_promptTextToProgressIndicatorTopConstraint;
}

- (void)setPromptTextToProgressIndicatorTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_promptTextToProgressIndicatorTopConstraint, a3);
}

- (NSLayoutConstraint)signInFormToSignInLabelTopConstraint
{
  return self->_signInFormToSignInLabelTopConstraint;
}

- (void)setSignInFormToSignInLabelTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_signInFormToSignInLabelTopConstraint, a3);
}

- (NSLayoutConstraint)signInInputViewHeightConstraint
{
  return self->_signInInputViewHeightConstraint;
}

- (void)setSignInInputViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_signInInputViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInInputViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_signInFormToSignInLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_promptTextToProgressIndicatorTopConstraint, 0);
  objc_storeStrong((id *)&self->_inputViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_signInBaselineToPromptTextTopConstraint, 0);
  objc_storeStrong((id *)&self->_bottomToSignInBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topToSignInBaselineConstraint, 0);
}

@end
