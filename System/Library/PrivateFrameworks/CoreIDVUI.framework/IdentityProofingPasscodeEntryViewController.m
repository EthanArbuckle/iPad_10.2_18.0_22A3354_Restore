@implementation IdentityProofingPasscodeEntryViewController

- (_TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213F9A510();
}

- (void)dealloc
{
  void *v3;
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for IdentityProofingPasscodeEntryViewController();
  -[IdentityProofingPasscodeEntryViewController dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_config));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_secondaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_imageViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_textField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_addButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController____lazy_storage___textFieldView));
}

- (void)viewDidLoad
{
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v2;

  v2 = self;
  sub_213F97B34();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v4;

  v4 = self;
  sub_213F97D64(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IdentityProofingPasscodeEntryViewController();
  v4 = (char *)v5.receiver;
  -[IdentityProofingPasscodeEntryViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_textField], sel_becomeFirstResponder, v5.receiver, v5.super_class);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for IdentityProofingPasscodeEntryViewController();
  v4 = v7.receiver;
  -[IdentityProofingPasscodeEntryViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  v5 = objc_msgSend(v4, sel_view, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_endEditing_, 1);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v2;

  v2 = self;
  sub_213F98178();

}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v6;

  v5 = a3;
  v6 = self;
  sub_213F9842C((uint64_t)a3);

}

- (void)textFieldDidChange:(id)a3
{
  void *v4;
  id v5;
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_addButton);
  v5 = a3;
  v6 = self;
  objc_msgSend(v4, sel_setEnabled_, (unint64_t)sub_213F96E3C() & 1);

}

- (void)keyboardDidShowWithNotification:(id)a3
{
  id v4;
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_213F99524(v4);

}

- (void)keyboardDidHideWithNotification:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v8;
  id v9;
  _QWORD v10[6];

  v5 = (void *)objc_opt_self();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = self;
  v10[4] = sub_213F9AB38;
  v10[5] = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_213F402DC;
  v10[3] = &block_descriptor_15;
  v7 = _Block_copy(v10);
  v8 = self;
  v9 = a3;
  swift_release();
  objc_msgSend(v5, sel_animateWithDuration_animations_, v7, 0.5);
  _Block_release(v7);

}

- (void)cancelButtonClicked
{
  uint64_t v2;
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v3;
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v4;

  v2 = (*(_QWORD **)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_proofingFlowManager))[17] & 3;
  v3 = self;
  v4 = v3;
  if (v2 == 2)
    sub_213FE2EBC(v3);
  else
    sub_213FEB0D4(0);

}

- (void)addButtonClicked
{
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v2;

  v2 = self;
  sub_213F99870();

}

- (void)updateUI:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_213F9A944(a4);

}

- (void)dismissKeyboard
{
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[IdentityProofingPasscodeEntryViewController view](v2, sel_view);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_endEditing_, 1);

  }
  else
  {
    __break(1u);
  }
}

- (void)configureFonts
{
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v2;

  v2 = self;
  sub_213F99BDC();

}

- (void)configureTextFieldViewColors
{
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v2;

  v2 = self;
  sub_213F99D5C();

}

- (_TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *result;

  v4 = a4;
  result = (_TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  _TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = self;
  if ((sub_213F96E3C() & 1) != 0)
    sub_213F99870();
  v6 = -[IdentityProofingPasscodeEntryViewController view](v5, sel_view);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_endEditing_, 1);

    LOBYTE(v6) = 1;
  }
  else
  {
    __break(1u);
  }
  return (char)v6;
}

@end
