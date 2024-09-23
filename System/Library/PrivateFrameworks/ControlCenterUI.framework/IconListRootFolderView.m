@implementation IconListRootFolderView

- (_TtC15ControlCenterUI22IconListRootFolderView)initWithConfiguration:(id)a3
{
  return (_TtC15ControlCenterUI22IconListRootFolderView *)sub_1CFBE86EC(a3);
}

- (SBFolder)folder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IconListRootFolderView();
  return -[SBFolderView folder](&v3, sel_folder);
}

- (void)setFolder:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IconListRootFolderView();
  v4 = a3;
  v5 = v6.receiver;
  -[SBFolderView setFolder:](&v6, sel_setFolder_, v4);
  sub_1CFBB88B8(objc_msgSend(v5, sel_folder, v6.receiver, v6.super_class));

}

- (void)_didAddIconListView:(id)a3
{
  id v4;
  _TtC15ControlCenterUI22IconListRootFolderView *v5;

  v4 = a3;
  v5 = self;
  sub_1CFBE90B8(v4);

}

- (void)_updatePageControlNumberOfPages
{
  _TtC15ControlCenterUI22IconListRootFolderView *v2;
  SBIconListPageControl *v3;
  id v4;
  SBIconListPageControl *v5;
  id v6;
  objc_super v7;

  v2 = self;
  v3 = -[SBFolderView pageControl](v2, sel_pageControl);
  v4 = -[SBIconListPageControl numberOfPages](v3, sel_numberOfPages);

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for IconListRootFolderView();
  -[SBFolderView _updatePageControlNumberOfPages](&v7, sel__updatePageControlNumberOfPages);
  v5 = -[SBFolderView pageControl](v2, sel_pageControl);
  v6 = -[SBIconListPageControl numberOfPages](v5, sel_numberOfPages);

  if (v4 != v6)
  {
    sub_1CFBE9C24();
    -[SBFolderView setNeedsLayout](v2, sel_setNeedsLayout);
  }

}

- (void)pageControl:(id)a3 didMoveCurrentPageToPage:(int64_t)a4 withScrubbing:(BOOL)a5
{
  char v7;
  id v8;
  _TtC15ControlCenterUI22IconListRootFolderView *v9;

  v7 = *((_BYTE *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isScrubbing);
  v8 = a3;
  v9 = self;
  sub_1CFBE92D0(a4, 1, v7);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return *(Class *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageControlScrubbingGestureRecognizer) == a3;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IconListRootFolderView();
  v2 = v3.receiver;
  -[SBFolderView layoutSubviews](&v3, sel_layoutSubviews);
  sub_1CFBE96E4();

}

- (id)indicatorDescriptionForPageIndex:(int64_t)a3
{
  void *v3;

  sub_1CFBE9EB4(a3);
  v3 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)handlePageControlInteraction:(id)a3
{
  id v4;
  _TtC15ControlCenterUI22IconListRootFolderView *v5;

  v4 = a3;
  v5 = self;
  sub_1CFBEA358(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageIndicatorProvider));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_interactivePagingTouchContinuationTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageControlScrubbingGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___pagingDidChangeAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___scrubbingAnimationSettings));
}

- (double)pageContentAlpha
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewAlpha);
}

- (void)setPageContentAlpha:(double)a3
{
  _TtC15ControlCenterUI22IconListRootFolderView *v4;

  v4 = self;
  sub_1CFBEB48C(a3);

}

- (double)pageContentScale
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewScale);
}

- (void)setPageContentScale:(double)a3
{
  double v3;
  _TtC15ControlCenterUI22IconListRootFolderView *v4;

  v3 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewScale);
  *(double *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewScale) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_1CFBEAACC();

  }
}

- (CGPoint)pageContentTranslation
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation);
  v3 = *(double *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPageContentTranslation:(CGPoint)a3
{
  double v3;
  double v4;
  _TtC15ControlCenterUI22IconListRootFolderView *v6;

  v3 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation);
  v4 = *(double *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation);
  *(CGPoint *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation) = a3;
  if (v3 != a3.x || v4 != a3.y)
  {
    v6 = self;
    sub_1CFBEAACC();

  }
}

- (BOOL)shouldExtendAreaForPagingContinuation
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView__shouldExtendAreaForPagingContinuation);
}

- (void)setShouldExtendAreaForPagingContinuation:(BOOL)a3
{
  int v3;
  _TtC15ControlCenterUI22IconListRootFolderView *v4;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView__shouldExtendAreaForPagingContinuation);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView__shouldExtendAreaForPagingContinuation) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_1CFBE96E4();

  }
}

- (void)addPagingDidChangeHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  _TtC15ControlCenterUI22IconListRootFolderView *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1CFBEC5A4;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = (_QWORD **)((char *)self + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pagingDidChangeHandlers);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1CFBEBEFC(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v12 = v8[2];
  v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1CFBEBEFC((_QWORD *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1CFBEC5DC;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (BOOL)canBeginPagingAtLocation:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC15ControlCenterUI22IconListRootFolderView *v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  LOBYTE(self) = sub_1CFBEB824((uint64_t)v7, x, y);

  return self & 1;
}

- (void)willBeginPagingInteractively:(BOOL)a3
{
  _TtC15ControlCenterUI22IconListRootFolderView *v3;

  v3 = self;
  sub_1CFBEC3D8();

}

@end
