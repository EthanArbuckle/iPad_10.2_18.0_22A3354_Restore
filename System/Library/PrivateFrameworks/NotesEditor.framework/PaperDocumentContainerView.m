@implementation PaperDocumentContainerView

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v10;
  id v11;
  char v12;
  BOOL v13;
  char v14;
  id v15;
  id v16;
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v17;

  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_doubleTapEater);
  if (!v7)
  {
    v15 = a3;
    v16 = a4;
    v17 = self;
    goto LABEL_5;
  }
  sub_1DD7C0C74(0, &qword_1F03F6418);
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = v7;
  v12 = sub_1DD9D28E4();

  if ((v12 & 1) == 0)
  {
LABEL_5:
    type metadata accessor for PanEaterGestureRecognizer();
    swift_dynamicCastClass();

    v14 = 1;
    goto LABEL_6;
  }
  v13 = sub_1DD8EC734();

  v14 = !v13;
LABEL_6:

  return v14 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v8;
  char v9;
  char v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DD8ECA38((uint64_t)v6, v7);
  v10 = v9;

  return v10 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1DD8FC28C(v7);

  return v9 & 1;
}

- (_TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DD8FC36C();
}

- (void)willMoveToWindow:(id)a3
{
  id v5;
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v6;

  v5 = a3;
  v6 = self;
  sub_1DD8ECE3C((uint64_t)a3);

}

- (void)didMoveToWindow
{
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v2;

  v2 = self;
  sub_1DD8ED098();

}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  void *v5;
  id v6;
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v7;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  objc_msgSend(v5, sel_cancelPreviousPerformRequestsWithTarget_selector_object_, v7, sel_updatePaletteVisibility, 0);
  -[PaperDocumentContainerView performSelector:withObject:afterDelay:](v7, sel_performSelector_withObject_afterDelay_, sel_updatePaletteVisibility, 0, 0.0);

}

- (void)updateConstraints
{
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v2;

  v2 = self;
  sub_1DD8ED4C8();

}

- (void)layoutSubviews
{
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v2;

  v2 = self;
  sub_1DD8ED740();

}

- (void)pdfViewMightHaveZoomed:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v8;
  uint64_t v9;

  v4 = sub_1DD9D0538();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD9D0514();
  v8 = self;
  sub_1DD8EE3A4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)pdfViewSelectedPageThumbnail:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v8;
  uint64_t v9;

  v4 = sub_1DD9D0538();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD9D0514();
  v8 = self;
  sub_1DD8EE88C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)scrollViewDidZoom:(id)a3
{
  id v4;
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v5;

  v4 = a3;
  v5 = self;
  sub_1DD8EEA3C(v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v10;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = self;
  sub_1DD8EEEF8(v9, &a5->x, x, y);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v5;
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v6;

  v5 = a3;
  v6 = self;
  sub_1DD8EFDB8(a3);

}

- (void)updatePaletteVisibility
{
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v2;

  v2 = self;
  sub_1DD8ED25C();

}

- (_TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView)initWithFrame:(CGRect)a3
{
  sub_1DD8F3BCC();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_inlineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_autoFillBannerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_headerContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_headerContainer));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_collapseThumbnailsConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_collapseFormFillingBannerConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_stickyHeaderConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_pushStickyHeaderAwayConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_doubleTapEater));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_nestedScrollViewInteraction));
}

- (UIScrollView)scrollView
{
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v2;
  UIScrollView *result;
  UIScrollView *v4;
  void *v5;
  id v6;

  v2 = self;
  result = (UIScrollView *)sub_1DD9D19E4();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  v4 = result;
  v5 = (void *)sub_1DD9D1978();

  if (!v5)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v6 = objc_msgSend(v5, sel_documentScrollView);

  if (v6)
  {

    return (UIScrollView *)v6;
  }
LABEL_7:
  __break(1u);
  return result;
}

- (BOOL)isZoomed
{
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1DD8F044C(sub_1DD8E4EC0);
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isLocked
{
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1DD8F044C((void (*)(void))sub_1DD8EC734);
  v4 = v3;

  return v4 & 1;
}

- (CGRect)frameInContainingScrollView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_1DD8F089C(self, (uint64_t)a2, (double (*)(void))sub_1DD8F0524);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)contentOffset
{
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = self;
  sub_1DD8F07E8((SEL *)&selRef_contentOffset);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_1DD8F06F8(x, y);

}

- (CGSize)contentSize
{
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1DD8F07E8((SEL *)&selRef_contentSize);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)scrollBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_1DD8F089C(self, (uint64_t)a2, (double (*)(void))sub_1DD8F08F8);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIEdgeInsets)adjustedContentInset
{
  _TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v2 = self;
  sub_1DD8F0A04();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

@end
