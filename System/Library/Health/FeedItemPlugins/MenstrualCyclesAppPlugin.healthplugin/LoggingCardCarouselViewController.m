@implementation LoggingCardCarouselViewController

- (UILabel)axCardProgressLabel
{
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_231C1168C();

  return (UILabel *)v3;
}

- (_TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231C1F3AC();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  objc_class *ObjectType;
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v9;
  uint64_t v10;
  void *v11;
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v12;
  _QWORD v13[6];
  objc_super v14;

  height = a3.height;
  width = a3.width;
  ObjectType = (objc_class *)swift_getObjectType();
  v14.receiver = self;
  v14.super_class = ObjectType;
  swift_unknownObjectRetain();
  v9 = self;
  -[LoggingCardCarouselViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = ObjectType;
  v13[4] = sub_231C21934;
  v13[5] = v10;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_231B24CB4;
  v13[3] = &unk_2500A7908;
  v11 = _Block_copy(v13);
  v12 = v9;
  swift_release();
  objc_msgSend(a4, sel_animateAlongsideTransition_completion_, v11, 0);
  _Block_release(v11);
  swift_unknownObjectRelease();

}

- (void)viewDidLayoutSubviews
{
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v2;

  v2 = self;
  sub_231C126C4();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v4;

  v4 = self;
  sub_231C12A60(a3);

}

- (void)doneTapped:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v5;

  v4 = a3;
  v5 = self;
  sub_231C1F778();

}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_231C206B8(v7);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_231C9D438();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (_TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_collectionView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_userPreferredUnit));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_mutableDaySummary));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_originalDaySummary));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_healthStore));
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_pinnedContentManager);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_calendarCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_selectedDataType));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_collectionViewFlowLayout));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_gregorianCalendar;
  v4 = sub_231C9D36C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_mostRecentBasalBodyTemperature));
  objc_release(*(id *)((char *)&self->super._navigationItem
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_configuration));
  sub_23190C114((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_loggingCardCarouselViewControllerDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_temperatureFormatter));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_cardProgressLabelToCollectionViewConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_collectionViewHeightAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_collectionViewToDateLabelConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_containerViewCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_doneButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_backgroundBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController____lazy_storage___dateLabelBackgroundVibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController____lazy_storage___dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController____lazy_storage___cardProgressLabelBackgroundVibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController____lazy_storage___cardProgressLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_doneButtonBackgroundVibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController____lazy_storage___doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController____lazy_storage___doneLabel));
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_231C20804();

  return v7;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_231C17B50(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v3;
  id v5;
  char *v6;
  uint64_t v7;
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v8;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_collectionView);
  if (v3)
  {
    v5 = a3;
    v8 = self;
    objc_msgSend(v3, sel_contentOffset);
    v6 = (char *)v8
       + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_contentOffsetXBeforeDragging;
    *(_QWORD *)v6 = v7;
    v6[8] = 0;

  }
  else
  {
    __break(1u);
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v8;
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v9;

  x = a4.x;
  v8 = a3;
  v9 = self;
  sub_231C20900(&a5->x, x);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v7;

  v6 = a3;
  v7 = self;
  sub_231C2119C(a4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v5;

  v4 = a3;
  v5 = self;
  sub_231C212E4();

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v5;

  v4 = a3;
  v5 = self;
  sub_231C21424();

}

- (void)respondToHorizontalSizeClassChanges
{
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v2;

  v2 = self;
  sub_231C188B4();

}

- (void)respondToContentSizeChanges
{
  _TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *v2;

  v2 = self;
  sub_231C12298();
  sub_231C124AC();

}

@end
