@implementation CPUIButton

+ (id)buttonWithType:(int64_t)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CPUIButton;
  objc_msgSendSuper2(&v5, sel_buttonWithType_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_addGestureRecognizers");
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPUIButton;
  -[CPUIButton traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  -[CPUIButton traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 3)
  {
    -[CPUIButton removeAllGestureRecognizers](self, "removeAllGestureRecognizers");
    -[CPUIButton _addGestureRecognizers](self, "_addGestureRecognizers");
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPUIButton;
  -[CPUIButton didMoveToWindow](&v3, sel_didMoveToWindow);
  -[CPUIButton removeAllGestureRecognizers](self, "removeAllGestureRecognizers");
  -[CPUIButton _addGestureRecognizers](self, "_addGestureRecognizers");
}

- (void)_addGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__buttonPressed_);
  -[CPUIButton setPressTapRecognizer:](self, "setPressTapRecognizer:", v3);

  -[CPUIButton pressTapRecognizer](self, "pressTapRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowedPressTypes:", &unk_24DF30360);

  -[CPUIButton pressTapRecognizer](self, "pressTapRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", -[CPUIButton isEnabled](self, "isEnabled"));

  -[CPUIButton pressTapRecognizer](self, "pressTapRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIButton addGestureRecognizer:](self, "addGestureRecognizer:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__buttonTapped_);
  -[CPUIButton setTouchTapRecognizer:](self, "setTouchTapRecognizer:", v7);

  -[CPUIButton touchTapRecognizer](self, "touchTapRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowedTouchTypes:", &unk_24DF30378);

  -[CPUIButton touchTapRecognizer](self, "touchTapRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", -[CPUIButton isEnabled](self, "isEnabled"));

  -[CPUIButton touchTapRecognizer](self, "touchTapRecognizer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CPUIButton addGestureRecognizer:](self, "addGestureRecognizer:", v10);

}

- (void)_buttonPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CPUIButton cpui_delegate](self, "cpui_delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CPUIButton cpui_delegate](self, "cpui_delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didSelectButton:withInteractionModel:", self, 2);

  }
}

- (void)_buttonTapped:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CPUIButton cpui_delegate](self, "cpui_delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CPUIButton cpui_delegate](self, "cpui_delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didSelectButton:withInteractionModel:", self, 1);

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CPUIButton;
  -[CPUIButton setEnabled:](&v7, sel_setEnabled_);
  -[CPUIButton pressTapRecognizer](self, "pressTapRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[CPUIButton touchTapRecognizer](self, "touchTapRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

}

- (CPUIButtonDelegate)cpui_delegate
{
  return (CPUIButtonDelegate *)objc_loadWeakRetained((id *)&self->_cpui_delegate);
}

- (void)setCpui_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_cpui_delegate, a3);
}

- (UITapGestureRecognizer)pressTapRecognizer
{
  return self->_pressTapRecognizer;
}

- (void)setPressTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pressTapRecognizer, a3);
}

- (UITapGestureRecognizer)touchTapRecognizer
{
  return self->_touchTapRecognizer;
}

- (void)setTouchTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_touchTapRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchTapRecognizer, 0);
  objc_storeStrong((id *)&self->_pressTapRecognizer, 0);
  objc_destroyWeak((id *)&self->_cpui_delegate);
}

@end
