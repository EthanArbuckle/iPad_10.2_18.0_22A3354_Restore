@implementation IconListFolderController

+ (NSString)iconLocation
{
  if (qword_1ED90AD80 != -1)
    swift_once();
  return (NSString *)(id)qword_1ED90B8F0;
}

- (_TtC15ControlCenterUI18IconListFolderView)folderView
{
  SBFolderView *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for IconListFolderController();
  v2 = -[SBFolderController folderView](&v4, sel_folderView);
  type metadata accessor for IconListFolderView();
  return (_TtC15ControlCenterUI18IconListFolderView *)(id)swift_dynamicCastClassUnconditional();
}

+ (Class)_contentViewClass
{
  type metadata accessor for IconListFolderView();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for IconListFolderController();
  v6 = a3;
  v7 = a4;
  v8 = v9.receiver;
  -[SBFolderController iconListView:didAddIconView:](&v9, sel_iconListView_didAddIconView_, v6, v7);
  sub_1CFBC1CC0(v7);

}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for IconListFolderController();
  v6 = a3;
  v7 = a4;
  v8 = v9.receiver;
  -[SBFolderController iconView:didChangeCustomImageViewController:](&v9, sel_iconView_didChangeCustomImageViewController_, v6, v7);
  sub_1CFBC1F3C((uint64_t)a4);
  sub_1CFBC1CC0(v6);

}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for IconListFolderController();
  v6 = a3;
  v7 = a4;
  v8 = v10.receiver;
  -[SBFolderController iconListView:didRemoveIconView:](&v10, sel_iconListView_didRemoveIconView_, v6, v7);
  v9 = objc_msgSend(v7, sel_customIconImageViewController, v10.receiver, v10.super_class);
  sub_1CFBC1F3C((uint64_t)v9);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)ccui_shouldPropagateAppearanceCalls
{
  return 1;
}

- (_TtC15ControlCenterUI24IconListFolderController)initWithConfiguration:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15ControlCenterUI24IconListFolderController_iconListFolderDelegate) = 0;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15ControlCenterUI24IconListFolderController_allowsIconAdornments) = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IconListFolderController();
  return -[SBFolderController initWithConfiguration:](&v6, sel_initWithConfiguration_, a3);
}

- (void).cxx_destruct
{
  sub_1CFBB85D8((uint64_t)self + OBJC_IVAR____TtC15ControlCenterUI24IconListFolderController_iconListFolderDelegate);
}

@end
