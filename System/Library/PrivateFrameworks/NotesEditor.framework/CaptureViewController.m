@implementation CaptureViewController

- (BOOL)shouldAutorotate
{
  objc_super v3;

  if ((*((_BYTE *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController_disableAutorotate) & 1) != 0)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[CaptureViewController shouldAutorotate](&v3, sel_shouldAutorotate);
}

- (_TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_class *ObjectType;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController_disableAutorotate) = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[CaptureViewController initWithNavigationBarClass:toolbarClass:](&v9, sel_initWithNavigationBarClass_toolbarClass_, a3, a4);
}

- (_TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController)initWithRootViewController:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController_disableAutorotate) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[CaptureViewController initWithRootViewController:](&v7, sel_initWithRootViewController_, a3);
}

- (_TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  id v8;
  id v9;
  _TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1DD9D2170();
    *((_BYTE *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController_disableAutorotate) = 0;
    v8 = a4;
    a3 = (id)sub_1DD9D2140();
    swift_bridgeObjectRelease();
  }
  else
  {
    *((_BYTE *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController_disableAutorotate) = 0;
    v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[CaptureViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);

  return v10;
}

- (_TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController_disableAutorotate) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[CaptureViewController initWithCoder:](&v7, sel_initWithCoder_, a3);
}

@end
