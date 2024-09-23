@implementation AKTextView

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0, sel_handleTabCommand_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0x20000, sel_handleBackTabCommand_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)handleTabCommand:(id)a3
{
  id v3;

  -[AKTextView keyCommandDelegate](self, "keyCommandDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "handleTabCommand");

}

- (void)handleBackTabCommand:(id)a3
{
  id v3;

  -[AKTextView keyCommandDelegate](self, "keyCommandDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "handleBackTabCommand");

}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;
  objc_super v8;

  v6 = a4;
  if (a3 != 1)
  {
    v8.receiver = self;
    v8.super_class = (Class)AKTextView;
    if (-[AKTextView respondsToSelector:](&v8, sel_respondsToSelector_, sel_motionEnded_withEvent_))
    {
      v7.receiver = self;
      v7.super_class = (Class)AKTextView;
      -[AKTextView motionEnded:withEvent:](&v7, sel_motionEnded_withEvent_, a3, v6);
    }
  }

}

- (BOOL)canBecomeFirstResponder
{
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKTextView;
  v3 = -[AKTextView canBecomeFirstResponder](&v5, sel_canBecomeFirstResponder);
  -[AKTextView setAutocorrectionType:](self, "setAutocorrectionType:", sub_2290321B8());
  -[AKTextView setSpellCheckingType:](self, "setSpellCheckingType:", sub_2290321B8());
  return v3;
}

- (id)textInputTraits
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDF6EC8], "defaultTextInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (sub_2290321B8())
  {
    objc_msgSend(v2, "setShortcutConversionType:", 1);
    objc_msgSend(v2, "setDisablePrediction:", 1);
    objc_msgSend(v2, "setHidePrediction:", 1);
  }
  return v2;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if (-[AKTextView isBlockedAction:](self, "isBlockedAction:", a3))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AKTextView;
    v7 = -[AKTextView canPerformAction:withSender:](&v9, sel_canPerformAction_withSender_, a3, v6);
  }

  return v7;
}

- (BOOL)isBlockedAction:(SEL)a3
{
  int v4;

  v4 = -[AKTextView isFirstResponder](self, "isFirstResponder");
  if (v4)
  {
    v4 = sub_2290321B8();
    if (v4)
      LOBYTE(v4) = sel_cut_ == a3 || sel_copy_ == a3 || sel_paste_ == a3;
  }
  return v4;
}

- (int64_t)maximumNumberOfCharacters
{
  return self->_maximumNumberOfCharacters;
}

- (void)setMaximumNumberOfCharacters:(int64_t)a3
{
  self->_maximumNumberOfCharacters = a3;
}

- (AKTextViewKeyCommandDelegate)keyCommandDelegate
{
  return (AKTextViewKeyCommandDelegate *)objc_loadWeakRetained((id *)&self->_keyCommandDelegate);
}

- (void)setKeyCommandDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_keyCommandDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyCommandDelegate);
}

@end
