@implementation CKGroupIdentityHeaderViewController

- (void)viewDidLayoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKGroupIdentityHeaderViewController();
  v2 = (char *)v3.receiver;
  -[CNGroupIdentityHeaderViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (MEMORY[0x193FF501C](&v2[OBJC_IVAR____TtC7ChatKit35CKGroupIdentityHeaderViewController_identityHeaderDelegate]))
  {
    sub_18E650700(v2);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (_TtC7ChatKit35CKGroupIdentityHeaderViewController)initWithGroupIdentity:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC7ChatKit35CKGroupIdentityHeaderViewController_identityHeaderDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CKGroupIdentityHeaderViewController();
  return -[CNGroupIdentityHeaderViewController initWithGroupIdentity:](&v6, sel_initWithGroupIdentity_, a3);
}

- (_TtC7ChatKit35CKGroupIdentityHeaderViewController)initWithGroupIdentity:(id)a3 actionsViewConfiguration:(id)a4
{
  objc_super v8;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC7ChatKit35CKGroupIdentityHeaderViewController_identityHeaderDelegate) = 0;
  swift_unknownObjectWeakInit();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CKGroupIdentityHeaderViewController();
  return -[CNGroupIdentityHeaderViewController initWithGroupIdentity:actionsViewConfiguration:](&v8, sel_initWithGroupIdentity_actionsViewConfiguration_, a3, a4);
}

- (_TtC7ChatKit35CKGroupIdentityHeaderViewController)initWithGroupIdentity:(id)a3 actionsViewConfiguration:(id)a4 avatarViewControllerSettings:(id)a5
{
  objc_super v10;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC7ChatKit35CKGroupIdentityHeaderViewController_identityHeaderDelegate) = 0;
  swift_unknownObjectWeakInit();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CKGroupIdentityHeaderViewController();
  return -[CNGroupIdentityHeaderViewController initWithGroupIdentity:actionsViewConfiguration:avatarViewControllerSettings:](&v10, sel_initWithGroupIdentity_actionsViewConfiguration_avatarViewControllerSettings_, a3, a4, a5);
}

- (_TtC7ChatKit35CKGroupIdentityHeaderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC7ChatKit35CKGroupIdentityHeaderViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_18E768984();
    *(_QWORD *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC7ChatKit35CKGroupIdentityHeaderViewController_identityHeaderDelegate) = 0;
    swift_unknownObjectWeakInit();
    v6 = a4;
    v7 = (void *)sub_18E768954();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC7ChatKit35CKGroupIdentityHeaderViewController_identityHeaderDelegate) = 0;
    swift_unknownObjectWeakInit();
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CKGroupIdentityHeaderViewController();
  v9 = -[CKGroupIdentityHeaderViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC7ChatKit35CKGroupIdentityHeaderViewController)initWithCoder:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC7ChatKit35CKGroupIdentityHeaderViewController_identityHeaderDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CKGroupIdentityHeaderViewController();
  return -[CKGroupIdentityHeaderViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit35CKGroupIdentityHeaderViewController_identityHeaderDelegate);
}

@end
