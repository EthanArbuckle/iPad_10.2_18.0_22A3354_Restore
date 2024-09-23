@implementation AISAAUISignInViewController

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AISAAUISignInViewController();
  v4 = v9.receiver;
  v5 = a3;
  -[AISAAUISignInViewController didMoveToParentViewController:](&v9, sel_didMoveToParentViewController_, v5);
  if (v5)
  {
    v6 = objc_msgSend(v5, sel_navigationItem, v9.receiver, v9.super_class);
    v7 = objc_msgSend(v4, sel_navigationItem);
    v8 = objc_msgSend(v7, sel_rightBarButtonItems);

    objc_msgSend(v6, sel_setRightBarButtonItems_, v8);
    v4 = v8;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController *v4;

  v4 = self;
  sub_2366C1584(a3);

}

- (_TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_2367372DC();
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController_triggerNextButtonTappedOnAppear) = 1;
    v6 = a4;
    v7 = (void *)sub_2367372B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController_triggerNextButtonTappedOnAppear) = 1;
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AISAAUISignInViewController();
  v9 = -[AAUISignInViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController_triggerNextButtonTappedOnAppear) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AISAAUISignInViewController();
  return -[AAUISignInViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
