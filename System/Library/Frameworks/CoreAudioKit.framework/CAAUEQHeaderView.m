@implementation CAAUEQHeaderView

- (_TtC12CoreAudioKit16CAAUEQHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit16CAAUEQHeaderView *)sub_2131888F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit16CAAUEQHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213191548();
}

- (void)didMoveToSuperview
{
  _BYTE *v2;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CAAUEQHeaderView();
  v2 = v4.receiver;
  -[CAAUEQHeaderView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  v3 = OBJC_IVAR____TtC12CoreAudioKit16CAAUEQHeaderView_viewSetup;
  if ((v2[OBJC_IVAR____TtC12CoreAudioKit16CAAUEQHeaderView_viewSetup] & 1) == 0)
  {
    sub_21318C720();
    v2[v3] = 1;
  }

}

- (void)removeFromSuperview
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CAAUEQHeaderView();
  v2 = v4.receiver;
  -[CAAUEQHeaderView removeFromSuperview](&v4, sel_removeFromSuperview);
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_removeObserver_, v2);

}

- (void)tintColorDidChange
{
  _TtC12CoreAudioKit16CAAUEQHeaderView *v2;

  v2 = self;
  sub_213188C8C();

}

- (void)textFieldEditingDidChange:(id)a3
{
  id v4;
  _TtC12CoreAudioKit16CAAUEQHeaderView *v5;

  v4 = a3;
  v5 = self;
  sub_213189274(v4);

}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  _TtC12CoreAudioKit16CAAUEQHeaderView *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_selectAll_, v5);
  v6 = objc_msgSend(v4, sel_textColor);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, sel_colorWithAlphaComponent_, 0.2);

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, sel_setBackgroundColor_, v8);

}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  void *v6;
  id v7;
  _TtC12CoreAudioKit16CAAUEQHeaderView *v8;
  id v9;

  v6 = (void *)objc_opt_self();
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, sel_clearColor);
  objc_msgSend(v7, sel_setBackgroundColor_, v9);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, sel_resignFirstResponder);
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  _TtC12CoreAudioKit16CAAUEQHeaderView *v17;
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t v21;

  v7 = sub_2131E18A8();
  v8 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x24BDAC7A8](v7, v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v13);
  v15 = (char *)&v21 - v14;
  sub_2131E1A94();
  v16 = a3;
  v17 = self;
  sub_2131E189C();
  sub_2131E189C();
  v18 = sub_2131E1890();
  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v12, v7);
  v19(v15, v7);

  swift_bridgeObjectRelease();
  return v18 & 1;
}

- (void)beginTouchWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_21318A4BC);
}

- (void)endTouchWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_21318A9EC);
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
