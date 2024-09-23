@implementation IconListFolderView

- (_TtC15ControlCenterUI18IconListFolderView)initWithConfiguration:(id)a3
{
  return (_TtC15ControlCenterUI18IconListFolderView *)sub_1CFBECD44(a3);
}

+ (Class)defaultIconListViewClass
{
  type metadata accessor for IconListFolderView.IconListView();
  return (Class)swift_getObjCClassFromMetadata();
}

+ (Class)_scrollViewClass
{
  sub_1CFBBAA24(0, &qword_1ED90ADD8);
  return (Class)swift_getObjCClassFromMetadata();
}

- (CCUIIconScrollView)scrollView
{
  UIScrollView *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for IconListFolderView();
  v2 = -[SBFolderView scrollView](&v4, sel_scrollView);
  objc_opt_self();
  return (CCUIIconScrollView *)(id)swift_dynamicCastObjCClassUnconditional();
}

- (void)_configureIconListView:(id)a3
{
  id v4;
  _TtC15ControlCenterUI18IconListFolderView *v5;

  v4 = a3;
  v5 = self;
  sub_1CFBECFA8(v4);

}

- (CGRect)_frameForIconListAtIndex:(unint64_t)a3
{
  _TtC15ControlCenterUI18IconListFolderView *v4;
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
  double v15;
  double v16;
  CGRect result;

  v4 = self;
  sub_1CFBED158(a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC15ControlCenterUI18IconListFolderView *v5;

  v4 = a3;
  v5 = self;
  sub_1CFBED308((uint64_t)v4);

}

@end
