@implementation ScrollingCapsuleCollectionView.CapsuleView

- (_TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *)sub_18B99D4AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *)sub_18B99D644(a3);
}

- (void)didReceiveTap
{
  void (*v2)(_TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *);
  _TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *v3;

  v2 = *(void (**)(_TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *))((char *)&self->super.super.super.super.isa
                                                                                                 + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_tapHandler);
  if (v2)
  {
    v3 = self;
    sub_18B8F48A8((uint64_t)v2);
    v2(v3);
    sub_18B8D1DAC((uint64_t)v2);

  }
}

- (void)didReceiveHover:(id)a3
{
  id v4;
  _TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *v5;

  v4 = a3;
  v5 = self;
  sub_18B99DF94(v4);

}

- (void)layoutSubviews
{
  _TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *v2;

  v2 = self;
  sub_18B99E25C();

}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s14descr1E21F3661O11CapsuleViewCMa();
  return -[ScrollingCapsuleCollectionView.CapsuleView isSelected](&v3, sel_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  _TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *v10;
  objc_super v11;
  objc_super v12;

  v3 = a3;
  v5 = (objc_class *)_s14descr1E21F3661O11CapsuleViewCMa();
  v12.receiver = self;
  v12.super_class = v5;
  v6 = self;
  v7 = -[ScrollingCapsuleCollectionView.CapsuleView isSelected](&v12, sel_isSelected);
  v11.receiver = v6;
  v11.super_class = v5;
  -[ScrollingCapsuleCollectionView.CapsuleView setSelected:](&v11, sel_setSelected_, v3);
  if (v7 == -[ScrollingCapsuleCollectionView.CapsuleView isSelected](v6, sel_isSelected))
  {

  }
  else
  {
    if (qword_1EDFE8B78 != -1)
      swift_once();
    v8 = qword_1EE007A18;
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v6;
    v10 = v6;
    sub_18BA820D4(v8, 0, (uint64_t)sub_18B99F368, v9, (void (*)())CGRectMake, 0);

    swift_release();
  }
}

- (void)updateShadowOpacity
{
  _TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *v2;

  v2 = self;
  sub_18B99E9C8();

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_18B99F088();

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_18B99F1D0(a5);

  swift_unknownObjectRelease();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_18B99E584(0, a5);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_contentView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_systemSnapshotBackgroundView));
  sub_18B8D1DAC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_tapHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_shadowView));
}

@end
