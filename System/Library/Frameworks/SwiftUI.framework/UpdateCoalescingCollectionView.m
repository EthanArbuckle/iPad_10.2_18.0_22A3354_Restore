@implementation UpdateCoalescingCollectionView

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UpdateCoalescingCollectionView(0);
  -[UpdateCoalescingCollectionView bounds](&v6, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_class *updated;
  _TtC7SwiftUI30UpdateCoalescingCollectionView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  objc_super v13;

  height = a3.height;
  width = a3.width;
  updated = (objc_class *)type metadata accessor for UpdateCoalescingCollectionView(0);
  v13.receiver = self;
  v13.super_class = updated;
  v7 = self;
  -[UpdateCoalescingCollectionView contentSize](&v13, sel_contentSize);
  v9 = v8;
  v11 = v10;
  v12.receiver = v7;
  v12.super_class = updated;
  -[UpdateCoalescingCollectionView setContentSize:](&v12, sel_setContentSize_, width, height);
  UpdateCoalescingCollectionView.contentSize.didset(v9, v11);

}

- (CGSize)contentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for UpdateCoalescingCollectionView(0);
  -[UpdateCoalescingCollectionView contentSize](&v4, sel_contentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  _TtC7SwiftUI30UpdateCoalescingCollectionView *v2;

  v2 = self;
  UpdateCoalescingCollectionView.layoutSubviews()();

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC7SwiftUI30UpdateCoalescingCollectionView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  UpdateCoalescingCollectionView.bounds.setter(x, y, width, height);

}

- (_TtC7SwiftUI30UpdateCoalescingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  return (_TtC7SwiftUI30UpdateCoalescingCollectionView *)UpdateCoalescingCollectionView.init(frame:collectionViewLayout:)(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)_wantsConstraintBasedLayout
{
  return 0;
}

- (void)safeAreaInsetsDidChange
{
  _TtC7SwiftUI30UpdateCoalescingCollectionView *v2;

  v2 = self;
  UpdateCoalescingCollectionView.safeAreaInsetsDidChange()();

}

- (BOOL)canBecomeFirstResponder
{
  _TtC7SwiftUI30UpdateCoalescingCollectionView *v2;
  unsigned __int8 updated;

  v2 = self;
  updated = UpdateCoalescingCollectionView.canBecomeFirstResponder.getter();

  return updated & 1;
}

- (void)didMoveToWindow
{
  _TtC7SwiftUI30UpdateCoalescingCollectionView *v2;

  v2 = self;
  UpdateCoalescingCollectionView.didMoveToWindow()();

}

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI30UpdateCoalescingCollectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized UpdateCoalescingCollectionView.init(coder:)();
}

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char);
  _TtC7SwiftUI30UpdateCoalescingCollectionView *v12;

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
  v6 = partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ();
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  v11 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> ();
LABEL_6:
  v12 = self;
  UpdateCoalescingCollectionView.performBatchUpdates(_:completion:)((uint64_t)v6, v9, (uint64_t)v11, v10);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v11);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v6);

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI30UpdateCoalescingCollectionView_helper));
  swift_bridgeObjectRelease();
  outlined destroy of TaskPriority?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI30UpdateCoalescingCollectionView_pendingDeselectedItem, &lazy cache variable for type metadata for IndexPath?, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1658]);
  swift_release();
}

@end
