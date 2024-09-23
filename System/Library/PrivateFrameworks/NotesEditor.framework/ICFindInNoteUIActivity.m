@implementation ICFindInNoteUIActivity

- (ICFindInNoteUIActivity)initWithDelegate:(id)a3
{
  id v4;
  ICFindInNoteUIActivity *v5;
  ICFindInNoteUIActivity *v6;
  ICFindInNoteUIActivity *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICFindInNoteUIActivity;
  v5 = -[UIActivity init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.findInNote");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Find in Note"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)activityCategory
{
  return 0;
}

- (id)_systemImageName
{
  return CFSTR("magnifyingglass");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[ICFindInNoteUIActivity delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[ICFindInNoteUIActivity delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[ICFindInNoteUIActivity delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "performFindInNoteUIActivity:", self);

    }
  }
}

- (ICFindInNoteUIActivityDelegate)delegate
{
  return (ICFindInNoteUIActivityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
