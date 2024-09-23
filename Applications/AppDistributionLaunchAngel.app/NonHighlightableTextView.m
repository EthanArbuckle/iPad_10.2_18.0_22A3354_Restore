@implementation NonHighlightableTextView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC26AppDistributionLaunchAngel24NonHighlightableTextView *v14;
  uint64_t v15;
  unsigned __int8 v16;

  y = a3.y;
  x = a3.x;
  v8 = type metadata accessor for MainActor(0, a2);
  v9 = static MainActor.shared.getter(v8);
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  v12 = v11;
  if ((swift_task_isCurrentExecutor(v10) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 186, v10, v12);
  v13 = a4;
  v14 = self;
  v16 = sub_100013E74(x, y, (uint64_t)v14, v15);
  swift_release(v9);

  return v16 & 1;
}

- (_TtC26AppDistributionLaunchAngel24NonHighlightableTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC26AppDistributionLaunchAngel24NonHighlightableTextView *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = type metadata accessor for MainActor(0, a2);
  v11 = static MainActor.shared.getter(v10);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  v14 = v13;
  if ((swift_task_isCurrentExecutor(v12) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 185, v12, v14);
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for NonHighlightableTextView();
  v15 = -[NonHighlightableTextView initWithFrame:textContainer:](&v17, "initWithFrame:textContainer:", a4, x, y, width, height);
  swift_release(v11);
  return v15;
}

- (_TtC26AppDistributionLaunchAngel24NonHighlightableTextView)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC26AppDistributionLaunchAngel24NonHighlightableTextView *v10;
  objc_super v12;

  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 185, v7, v9);
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for NonHighlightableTextView();
  v10 = -[NonHighlightableTextView initWithCoder:](&v12, "initWithCoder:", a3);
  swift_release(v6);
  return v10;
}

@end
