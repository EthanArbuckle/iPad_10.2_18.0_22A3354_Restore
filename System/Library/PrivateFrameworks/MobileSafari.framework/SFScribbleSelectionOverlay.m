@implementation SFScribbleSelectionOverlay

- (id)hideButtonHandler
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v2 = *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR___SFScribbleSelectionOverlay_hideButtonHandler);
  v5[4] = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFScribbleSelectionOverlay_hideButtonHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_18BA5AA30;
  v5[3] = &block_descriptor_34;
  v3 = _Block_copy(v5);
  sub_18BABFBB4();
  swift_release();
  return v3;
}

- (void)setHideButtonHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFScribbleSelectionOverlay_hideButtonHandler);
  *v6 = sub_18B92A178;
  v6[1] = v5;
  swift_release();
}

- (BOOL)showsHideButton
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___SFScribbleSelectionOverlay_showsHideButton);
}

- (void)setShowsHideButton:(BOOL)a3
{
  int v3;
  uint64_t v4;
  SFScribbleSelectionOverlay *v5;
  uint64_t v6;
  uint64_t v7;
  SFScribbleSelectionOverlay *v8;

  v3 = *((unsigned __int8 *)&self->super.super.super.isa + OBJC_IVAR___SFScribbleSelectionOverlay_showsHideButton);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___SFScribbleSelectionOverlay_showsHideButton) = a3;
  if (v3 != a3)
  {
    v4 = qword_1EDFE8B88;
    v5 = self;
    if (v4 != -1)
      swift_once();
    v6 = qword_1EE007A28;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v8 = v5;
    sub_18BA820D4(v6, 0, (uint64_t)sub_18BA958FC, v7, (void (*)())CGRectMake, 0);

    swift_release();
  }
}

- (_TtC12MobileSafari15BlurrableButton)hideButton
{
  return (_TtC12MobileSafari15BlurrableButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR___SFScribbleSelectionOverlay_hideButton));
}

- (SFScribbleSelectionOverlay)initWithFrame:(CGRect)a3
{
  return (SFScribbleSelectionOverlay *)sub_18BA94324(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SFScribbleSelectionOverlay)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo26SFScribbleSelectionOverlayC12MobileSafariE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  SFScribbleSelectionOverlay *v2;

  v2 = self;
  SFScribbleSelectionOverlay.layoutSubviews()();

}

- (void)fadeIn
{
  uint64_t v2;
  SFScribbleSelectionOverlay *v3;
  uint64_t v4;
  uint64_t v5;
  SFScribbleSelectionOverlay *v6;

  v2 = qword_1EDFE8B88;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = qword_1EE007A28;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v3;
  v6 = v3;
  sub_18BA820D4(v4, 0, (uint64_t)sub_18BA95810, v5, (void (*)())CGRectMake, 0);

  swift_release();
}

- (void)fadeOutWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  SFScribbleSelectionOverlay *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  SFScribbleSelectionOverlay *v11;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_18B92A118;
  }
  else
  {
    v5 = 0;
  }
  v6 = qword_1EDFE8B88;
  v7 = self;
  if (v6 != -1)
    swift_once();
  v8 = qword_1EE007A28;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v4;
  v10[3] = v5;
  v11 = v7;
  sub_18B8F48A8((uint64_t)v4);
  sub_18BA820D4(v8, 0, (uint64_t)sub_18BA95784, v9, (void (*)())sub_18BA957E8, v10);
  swift_release();
  swift_release();
  sub_18B8D1DAC((uint64_t)v4);

}

- (void)hideButtonReceivedTap
{
  void (**v2)(void);
  SFScribbleSelectionOverlay *v3;

  v3 = self;
  v2 = (void (**)(void))-[SFScribbleSelectionOverlay hideButtonHandler](v3, sel_hideButtonHandler);
  v2[2]();
  _Block_release(v2);

}

- (void).cxx_destruct
{
  swift_release();

}

@end
