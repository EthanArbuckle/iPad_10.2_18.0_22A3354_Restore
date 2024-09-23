@implementation SingleCycleView

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SingleCycleView();
  return -[SingleCycleView backgroundColor](&v3, sel_backgroundColor);
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SingleCycleView();
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[SingleCycleView setBackgroundColor:](&v8, sel_setBackgroundColor_, v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15SingleCycleView_collectionView];
  v7 = objc_msgSend(v5, sel_backgroundColor, v8.receiver, v8.super_class);
  objc_msgSend(v6, sel_setBackgroundColor_, v7);

}

- (_TtC24MenstrualCyclesAppPlugin15SingleCycleView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin15SingleCycleView *)sub_231BC9728(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin15SingleCycleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231BCC320();
}

- (void)layoutMarginsDidChange
{
  void *v2;
  uint64_t v3;
  _TtC24MenstrualCyclesAppPlugin15SingleCycleView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _TtC24MenstrualCyclesAppPlugin15SingleCycleView *v9;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15SingleCycleView_collectionView);
  v3 = qword_255F3CF80;
  v4 = self;
  v9 = v4;
  if (v3 != -1)
  {
    swift_once();
    v4 = v9;
  }
  v5 = *(double *)&qword_255F4E780;
  -[SingleCycleView layoutMargins](v4, sel_layoutMargins);
  v7 = v6;
  if (qword_255F3CF78 != -1)
    swift_once();
  v8 = *(double *)&qword_255F4E778;
  -[SingleCycleView layoutMargins](v9, sel_layoutMargins);
  objc_msgSend(v2, sel_setContentInset_, v5, v7, v8);

}

- (void)adaptToColorSchemeChanges
{
  _TtC24MenstrualCyclesAppPlugin15SingleCycleView *v2;

  v2 = self;
  sub_231BC9F00();

}

- (void)layoutSubviews
{
  _TtC24MenstrualCyclesAppPlugin15SingleCycleView *v2;

  v2 = self;
  sub_231BCA088();

}

- (void)viewModelProviderDidUpdate:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin15SingleCycleView *v5;

  v4 = a3;
  v5 = self;
  sub_231BCB588();

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC24MenstrualCyclesAppPlugin15SingleCycleView *v16;
  uint64_t v17;

  v8 = sub_231C9D438();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  type metadata accessor for CycleHistoryCycleDayCell();
  v12 = swift_dynamicCastClass();
  if (v12)
  {
    v13 = v12;
    v14 = a3;
    v15 = a4;
    v16 = self;
    sub_231BCB9AC(v13);

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  id v14;
  _TtC24MenstrualCyclesAppPlugin15SingleCycleView *v15;
  id v16;
  uint64_t v17;

  v8 = sub_231C9D438();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v12 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15SingleCycleView_cycleDataSource);
  if (v12
    && (*((_BYTE *)v12 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource_dataFetchingState) & 1) == 0)
  {
    v13 = a3;
    v14 = a4;
    v15 = self;
    v16 = v12;
    sub_231BCA898();

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15SingleCycleView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15SingleCycleView_overlayGradient));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15SingleCycleView_cycleDataSource));
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin15SingleCycleView *v5;

  v4 = a3;
  v5 = self;
  sub_231BCBE30(v4);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin15SingleCycleView *v5;

  v4 = a3;
  v5 = self;
  sub_231BCC5EC("[%{public}s] scrollViewDidEndScrollingAnimation: resuming data fetching");

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin15SingleCycleView *v7;

  v6 = a3;
  v7 = self;
  sub_231BCC404(a4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin15SingleCycleView *v5;

  v4 = a3;
  v5 = self;
  sub_231BCC5EC("[%{public}s] scrollViewDidEndDecelerating: resuming data fetching");

}

@end
