@implementation IconListRootFolderController

- (_TtC15ControlCenterUI22IconListRootFolderView)folderView
{
  _TtC15ControlCenterUI18IconListFolderView *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for IconListRootFolderController();
  v2 = -[IconListFolderController folderView](&v4, sel_folderView);
  type metadata accessor for IconListRootFolderView();
  return (_TtC15ControlCenterUI22IconListRootFolderView *)(id)swift_dynamicCastClassUnconditional();
}

+ (Class)_contentViewClass
{
  type metadata accessor for IconListRootFolderView();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15ControlCenterUI28IconListRootFolderController)initWithConfiguration:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IconListRootFolderController();
  return -[IconListFolderController initWithConfiguration:](&v5, sel_initWithConfiguration_, a3);
}

@end
