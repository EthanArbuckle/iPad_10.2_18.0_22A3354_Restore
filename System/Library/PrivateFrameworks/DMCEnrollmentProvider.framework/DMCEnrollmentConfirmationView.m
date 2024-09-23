@implementation DMCEnrollmentConfirmationView

- (DMCEnrollmentConfirmationView)initWithConfirmationText:(id)a3 cancelText:(id)a4 confirmationAction:(id)a5 cancelAction:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  DMCEnrollmentConfirmationView *v15;
  uint64_t v16;
  OBBoldTrayButton *confirmationButton;
  OBBoldTrayButton *v18;
  void *v19;
  uint64_t v20;
  UIButton *cancelButton;
  uint64_t v22;
  id confirmationAction;
  uint64_t v24;
  id cancelAction;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[DMCEnrollmentConfirmationView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v16 = objc_claimAutoreleasedReturnValue();
    confirmationButton = v15->_confirmationButton;
    v15->_confirmationButton = (OBBoldTrayButton *)v16;

    -[OBBoldTrayButton setTitle:forState:](v15->_confirmationButton, "setTitle:forState:", v11, 0);
    v18 = v15->_confirmationButton;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v11);
    -[OBBoldTrayButton setAttributedTitle:forState:](v18, "setAttributedTitle:forState:", v19, 2);

    -[OBBoldTrayButton setTranslatesAutoresizingMaskIntoConstraints:](v15->_confirmationButton, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[OBBoldTrayButton addTarget:action:forControlEvents:](v15->_confirmationButton, "addTarget:action:forControlEvents:", v15, sel_confirmationButtonTapped_, 64);
    -[DMCEnrollmentConfirmationView addSubview:](v15, "addSubview:", v15->_confirmationButton);
    if (v12 && v14)
    {
      objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
      v20 = objc_claimAutoreleasedReturnValue();
      cancelButton = v15->_cancelButton;
      v15->_cancelButton = (UIButton *)v20;

      -[UIButton setTitle:forState:](v15->_cancelButton, "setTitle:forState:", v12, 0);
      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v15->_cancelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
      -[UIButton addTarget:action:forControlEvents:](v15->_cancelButton, "addTarget:action:forControlEvents:", v15, sel_cancelButtonTapped_, 64);
      -[DMCEnrollmentConfirmationView addSubview:](v15, "addSubview:", v15->_cancelButton);
    }
    objc_storeStrong((id *)&v15->_confirmationText, a3);
    v22 = MEMORY[0x2199F7854](v13);
    confirmationAction = v15->_confirmationAction;
    v15->_confirmationAction = (id)v22;

    v24 = MEMORY[0x2199F7854](v14);
    cancelAction = v15->_cancelAction;
    v15->_cancelAction = (id)v24;

    v15->_confirmationButtonEnabled = 1;
  }

  return v15;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double Width;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v18.receiver = self;
  v18.super_class = (Class)DMCEnrollmentConfirmationView;
  -[DMCEnrollmentConfirmationView layoutSubviews](&v18, sel_layoutSubviews);
  -[DMCEnrollmentConfirmationView confirmationButton](self, "confirmationButton");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "intrinsicContentSize");
  v5 = v4;

  LOBYTE(v3) = objc_msgSend(MEMORY[0x24BE2A818], "isPad");
  -[DMCEnrollmentConfirmationView bounds](self, "bounds");
  Width = CGRectGetWidth(v19);
  if ((v3 & 1) != 0)
  {
    v7 = (Width + -360.0) * 0.5;
    -[DMCEnrollmentConfirmationView confirmationButton](self, "confirmationButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 360.0;
  }
  else
  {
    v9 = Width + -10.0;
    -[DMCEnrollmentConfirmationView confirmationButton](self, "confirmationButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 5.0;
  }
  objc_msgSend(v8, "setFrame:", v7, 0.0, v9, v5);

  -[DMCEnrollmentConfirmationView cancelButton](self, "cancelButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DMCEnrollmentConfirmationView cancelButton](self, "cancelButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "intrinsicContentSize");
    v13 = v12;

    -[DMCEnrollmentConfirmationView confirmationButton](self, "confirmationButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v15 = CGRectGetMaxY(v20) + 3.0;
    -[DMCEnrollmentConfirmationView bounds](self, "bounds");
    v16 = CGRectGetWidth(v21) + -10.0;
    -[DMCEnrollmentConfirmationView cancelButton](self, "cancelButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", 5.0, v15, v16, v13);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  width = a3.width;
  -[DMCEnrollmentConfirmationView confirmationButton](self, "confirmationButton", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6;

  -[DMCEnrollmentConfirmationView cancelButton](self, "cancelButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DMCEnrollmentConfirmationView cancelButton](self, "cancelButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intrinsicContentSize");
    v11 = v10;

    v12 = v11 + 3.0;
  }
  else
  {
    v12 = 0.0;
  }
  v13 = v7 + v12;
  v14 = width;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)confirmationButtonTapped:(id)a3
{
  os_log_t *v4;
  void (**v5)(void);

  v4 = (os_log_t *)DMCLogObjects();
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    -[DMCEnrollmentConfirmationView confirmationButtonTapped:].cold.1();
  -[DMCEnrollmentConfirmationView confirmationAction](self, "confirmationAction");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();

}

- (void)cancelButtonTapped:(id)a3
{
  os_log_t *v4;
  void (**v5)(void);

  v4 = (os_log_t *)DMCLogObjects();
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    -[DMCEnrollmentConfirmationView cancelButtonTapped:].cold.1();
  -[DMCEnrollmentConfirmationView cancelAction](self, "cancelAction");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();

}

- (void)setInProgress:(BOOL)a3
{
  OBBoldTrayButton *confirmationButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OBBoldTrayButton *v9;
  id v10;

  if (self->_inProgress != a3)
  {
    self->_inProgress = a3;
    if (a3)
    {
      confirmationButton = self->_confirmationButton;
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR(" "));
      -[OBBoldTrayButton setAttributedTitle:forState:](confirmationButton, "setAttributedTitle:forState:", v5, 2);

      -[DMCEnrollmentConfirmationView confirmationButton](self, "confirmationButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "showsBusyIndicator");

      -[DMCEnrollmentConfirmationView cancelButton](self, "cancelButton");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEnabled:", 0);
    }
    else
    {
      -[DMCEnrollmentConfirmationView confirmationButton](self, "confirmationButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hidesBusyIndicator");

      -[DMCEnrollmentConfirmationView cancelButton](self, "cancelButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setEnabled:", 1);

      v9 = self->_confirmationButton;
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", self->_confirmationText);
      -[OBBoldTrayButton setAttributedTitle:forState:](v9, "setAttributedTitle:forState:");
    }

  }
}

- (void)setConfirmationButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_confirmationButtonEnabled != a3)
  {
    v3 = a3;
    self->_confirmationButtonEnabled = a3;
    -[DMCEnrollmentConfirmationView confirmationButton](self, "confirmationButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v3);

  }
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (BOOL)isConfirmationButtonEnabled
{
  return self->_confirmationButtonEnabled;
}

- (NSString)confirmationText
{
  return self->_confirmationText;
}

- (void)setConfirmationText:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationText, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (id)confirmationAction
{
  return self->_confirmationAction;
}

- (void)setConfirmationAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (id)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (OBBoldTrayButton)confirmationButton
{
  return self->_confirmationButton;
}

- (void)setConfirmationButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationButton, 0);
  objc_storeStrong(&self->_cancelAction, 0);
  objc_storeStrong(&self->_confirmationAction, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmationText, 0);
}

- (void)confirmationButtonTapped:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_216358000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)cancelButtonTapped:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_216358000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

@end
