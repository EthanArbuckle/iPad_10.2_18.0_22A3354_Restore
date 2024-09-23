@implementation GKPersonalizationViewController

- (void)viewDidLoad
{
  GKPersonalizationViewController *v2;

  v2 = self;
  PersonalizationViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  GKPersonalizationViewController *v4;

  v4 = self;
  PersonalizationViewController.viewWillAppear(_:)(a3);

}

- (void)viewIsAppearing:(BOOL)a3
{
  GKPersonalizationViewController *v4;

  v4 = self;
  PersonalizationViewController.viewIsAppearing(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  GKPersonalizationViewController *v4;

  v4 = self;
  PersonalizationViewController.viewDidAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  GKPersonalizationViewController *v4;

  v4 = self;
  PersonalizationViewController.viewWillDisappear(_:)(a3);

}

- (void)photoPickerDidCancel:(id)a3
{
  id v4;
  GKPersonalizationViewController *v5;

  v4 = a3;
  v5 = self;
  PersonalizationViewController.photoPickerDidCancel(_:)(v4);

}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v8;
  id v9;
  id v10;
  GKPersonalizationViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  PersonalizationViewController.photoPicker(_:didUpdatePhotoFor:with:)(v8, v9, v10);

}

- (void)avatarView:(id)a3 didSelectImageWithEditingEnabled:(BOOL)a4
{
  id v6;
  GKPersonalizationViewController *v7;

  v6 = a3;
  v7 = self;
  PersonalizationViewController.avatarView(_:didSelectImageWithEditingEnabled:)((GKAvatarContainerView *)v7, a4);

}

- (void)keyboardWillShow:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  GKPersonalizationViewController *v8;
  uint64_t v9;

  v4 = sub_1AB7D7924();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7900();
  v8 = self;
  PersonalizationViewController.keyboardWillShow(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)keyboardWillHide:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  GKPersonalizationViewController *v8;
  uint64_t v9;

  v4 = sub_1AB7D7924();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7900();
  v8 = self;
  PersonalizationViewController.keyboardWillHide(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)nicknameShouldBeginEditing
{
  GKPersonalizationViewController *v2;
  Swift::Bool ShouldBegin;

  v2 = self;
  ShouldBegin = PersonalizationViewController.nicknameShouldBeginEditing()();

  return ShouldBegin;
}

- (void)nicknameDidBecomeFirstResponder
{
  GKPersonalizationViewController *v2;

  v2 = self;
  PersonalizationViewController.nicknameDidBecomeFirstResponder()();

}

- (void)nicknameDidResignFirstResponder
{
  GKPersonalizationViewController *v2;

  v2 = self;
  PersonalizationViewController.nicknameDidResignFirstResponder()();

}

- (void)nicknameUpdateRequestCompletedWithStatus:(id)a3 error:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  GKPersonalizationViewController *v10;

  if (a3)
  {
    v6 = sub_1AB7DAF90();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a4;
  v10 = self;
  PersonalizationViewController.nicknameUpdateRequestCompleted(withStatus:error:)(v6, v8, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)nicknameTextDidChangeWithMessage:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  GKPersonalizationViewController *v7;
  Swift::String_optional v8;

  if (a3)
  {
    v4 = sub_1AB7DAF90();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  PersonalizationViewController.nicknameTextDidChange(withMessage:)(v8);

  swift_bridgeObjectRelease();
}

- (void)nicknameUpdateAvatarImage:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  GKPersonalizationViewController *v7;
  Swift::String v8;

  v4 = sub_1AB7DAF90();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  PersonalizationViewController.nicknameUpdateAvatarImage(_:)(v8);

  swift_bridgeObjectRelease();
}

- (GKPersonalizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1AB7DAF90();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (GKPersonalizationViewController *)PersonalizationViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (GKPersonalizationViewController)initWithCoder:(id)a3
{
  return (GKPersonalizationViewController *)PersonalizationViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1AB62B7C8(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR___GKPersonalizationViewController____lazy_storage___editAvatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GKPersonalizationViewController____lazy_storage___nicknameController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GKPersonalizationViewController____lazy_storage___personalizationView));
}

@end
