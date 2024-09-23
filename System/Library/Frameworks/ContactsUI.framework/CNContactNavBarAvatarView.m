@implementation CNContactNavBarAvatarView

- (CNContactNavBarAvatarView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CNContactNavBarAvatarView *v7;
  CNAvatarView *v8;
  CNAvatarView *avatarView;
  CNContactNavBarAvatarView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CNContactNavBarAvatarView;
  v7 = -[CNContactNavBarAvatarView initWithFrame:](&v12, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_alloc_init(CNAvatarView);
    avatarView = v7->_avatarView;
    v7->_avatarView = v8;

    -[CNAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v7->_avatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNAvatarView setAlpha:](v7->_avatarView, "setAlpha:", 0.0);
    -[CNAvatarView setFrame:](v7->_avatarView, "setFrame:", x, y, width, height);
    v7->_showing = 0;
    -[CNContactNavBarAvatarView addSubview:](v7, "addSubview:", v7->_avatarView);
    v10 = v7;
  }

  return v7;
}

- (void)setContact:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_contact, a3);
  if (v5)
  {
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[CNContactNavBarAvatarView avatarView](self, "avatarView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_cn_isIdenticalToArray:", v6);

  -[CNContactNavBarAvatarView avatarView](self, "avatarView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    objc_msgSend(v10, "contactDidChange");
  else
    objc_msgSend(v10, "setContacts:", v6);

}

- (void)setShowing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);
  _QWORD aBlock[5];
  BOOL v12;

  if (self->_showing != a3)
  {
    v4 = a4;
    self->_showing = a3;
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__CNContactNavBarAvatarView_setShowing_animated___block_invoke;
    aBlock[3] = &unk_1E204C4D0;
    aBlock[4] = self;
    v12 = a3;
    v6 = (void (**)(_QWORD))_Block_copy(aBlock);
    v7 = v6;
    if (v4)
    {
      v8 = (void *)MEMORY[0x1E0DC3F10];
      v9[0] = v5;
      v9[1] = 3221225472;
      v9[2] = __49__CNContactNavBarAvatarView_setShowing_animated___block_invoke_2;
      v9[3] = &unk_1E204FB40;
      v10 = v6;
      objc_msgSend(v8, "animateWithDuration:animations:", v9, 0.15);

    }
    else
    {
      v6[2](v6);
    }

  }
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (BOOL)showing
{
  return self->_showing;
}

- (void)setShowing:(BOOL)a3
{
  self->_showing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

void __49__CNContactNavBarAvatarView_setShowing_animated___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "avatarView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

uint64_t __49__CNContactNavBarAvatarView_setShowing_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
