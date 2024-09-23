@implementation UpdateCoalescingTableView

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (BOOL)_sectionContentInsetFollowsLayoutMargins
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UpdateCoalescingTableView();
  return -[UpdateCoalescingTableView _sectionContentInsetFollowsLayoutMargins](&v3, sel__sectionContentInsetFollowsLayoutMargins);
}

- (void)_setSectionContentInsetFollowsLayoutMargins:(BOOL)a3
{
  _BOOL8 v3;
  _TtC7SwiftUI25UpdateCoalescingTableView *v4;
  objc_super v5;

  v3 = a3;
  v4 = self;
  if (-[UpdateCoalescingTableView _sectionContentInsetFollowsLayoutMargins](v4, sel__sectionContentInsetFollowsLayoutMargins) == v3)
  {

  }
  else
  {
    v5.receiver = v4;
    v5.super_class = (Class)type metadata accessor for UpdateCoalescingTableView();
    -[UpdateCoalescingTableView _setSectionContentInsetFollowsLayoutMargins:](&v5, sel__setSectionContentInsetFollowsLayoutMargins_, v3);

  }
}

- (_TtC7SwiftUI25UpdateCoalescingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  return (_TtC7SwiftUI25UpdateCoalescingTableView *)UpdateCoalescingTableView.init(frame:style:)(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7SwiftUI25UpdateCoalescingTableView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized UpdateCoalescingTableView.init(coder:)();
}

+ (BOOL)_isInternalTableView
{
  return 1;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UpdateCoalescingTableView();
  -[UpdateCoalescingTableView bounds](&v6, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC7SwiftUI25UpdateCoalescingTableView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  UpdateCoalescingTableView.bounds.setter(x, y, width, height);

}

- (void)layoutMarginsDidChange
{
  _TtC7SwiftUI25UpdateCoalescingTableView *v2;

  v2 = self;
  UpdateCoalescingTableView.layoutMarginsDidChange()((SEL *)&selRef_layoutMarginsDidChange);

}

- (void)safeAreaInsetsDidChange
{
  _TtC7SwiftUI25UpdateCoalescingTableView *v2;

  v2 = self;
  UpdateCoalescingTableView.layoutMarginsDidChange()((SEL *)&selRef_safeAreaInsetsDidChange);

}

- (double)_alignedContentMarginGivenMargin:(double)result
{
  if (*((_BYTE *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC7SwiftUI25UpdateCoalescingTableView_isSidebarStyle))
    return result + 8.0;
  return result;
}

- (double)_rowSpacing
{
  double result;
  objc_super v3;

  if ((*((_BYTE *)&self->super.super.super.super._responderFlags
        + OBJC_IVAR____TtC7SwiftUI25UpdateCoalescingTableView_rowSpacing) & 1) == 0)
    return *(double *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI25UpdateCoalescingTableView_rowSpacing);
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UpdateCoalescingTableView();
  -[UpdateCoalescingTableView _rowSpacing](&v3, sel__rowSpacing);
  return result;
}

- (void)layoutSubviews
{
  _TtC7SwiftUI25UpdateCoalescingTableView *v2;

  v2 = self;
  UpdateCoalescingTableView.layoutSubviews()();

}

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char);
  _TtC7SwiftUI25UpdateCoalescingTableView *v12;

  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  v8 = v7;
  if (!v6)
  {
    v9 = 0;
    if (v7)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v6;
  v6 = _sIeyB_Ieg_TRTA_0;
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  v11 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Bool) -> ();
LABEL_6:
  v12 = self;
  UpdateCoalescingTableView.performBatchUpdates(_:completion:)((uint64_t)v6, v9, (uint64_t)v11, v10);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v11);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v6);

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  outlined destroy of IntelligenceElement?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25UpdateCoalescingTableView_pendingScrollTarget, &lazy cache variable for type metadata for BridgedListState.ScrollTarget?, (void (*)(uint64_t))type metadata accessor for BridgedListState.ScrollTarget);
  swift_release();
}

@end
