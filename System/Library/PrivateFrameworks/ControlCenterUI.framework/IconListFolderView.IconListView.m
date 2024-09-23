@implementation IconListFolderView.IconListView

- (NSString)iconDragTypeIdentifier
{
  return (NSString *)(id)sub_1CFBFA870();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for IconListFolderView.IconListView();
  v7 = v12.receiver;
  v8 = a4;
  v9 = -[IconListFolderView.IconListView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v8, x, y);
  if (!v9 || (v10 = v9, v8, v8 = v7, v10 == v7))
  {

    v10 = 0;
  }

  return v10;
}

+ (unint64_t)defaultIconViewConfigurationOptions
{
  swift_getObjCClassMetadata();
  return sub_1CFBED534();
}

- (void)layoutIconsIfNeeded
{
  _TtCC15ControlCenterUI18IconListFolderViewP33_DD187FCCAF2994A2EE3FBE03915C670412IconListView *v2;

  v2 = self;
  sub_1CFBED574();

}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for IconListFolderView.IconListView();
  v6 = a3;
  v7 = a4;
  v8 = v10.receiver;
  -[SBIconListView configureIconView:forIcon:](&v10, sel_configureIconView_forIcon_, v6, v7);
  v9 = objc_msgSend(v6, sel_contentContainerView, v10.receiver, v10.super_class);
  objc_msgSend(v9, sel_setOverrideUserInterfaceStyle_, 1);

}

- (id)makeEmptyGridCellView
{
  return sub_1CFBEDCF8();
}

- (void)willRotateWithTransitionCoordinator:(id)a3
{
  _TtCC15ControlCenterUI18IconListFolderViewP33_DD187FCCAF2994A2EE3FBE03915C670412IconListView *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1CFBEDACC(a3);
  swift_unknownObjectRelease();

}

- (_TtCC15ControlCenterUI18IconListFolderViewP33_DD187FCCAF2994A2EE3FBE03915C670412IconListView)initWithModel:(id)a3 layoutProvider:(id)a4 iconLocation:(id)a5 orientation:(int64_t)a6 iconViewProvider:(id)a7
{
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for IconListFolderView.IconListView();
  return -[SBIconListView initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:](&v13, sel_initWithModel_layoutProvider_iconLocation_orientation_iconViewProvider_, a3, a4, a5, a6, a7);
}

@end
