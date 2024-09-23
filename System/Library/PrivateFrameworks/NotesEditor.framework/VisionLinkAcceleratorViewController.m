@implementation VisionLinkAcceleratorViewController

- (_TtC11NotesEditor35VisionLinkAcceleratorViewController)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_pillOrnamentViewController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_editorXOffset) = (Class)0xC030000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_editorYOffset) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_editorYPadding) = (Class)0x4040000000000000;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[iOSLinkAcceleratorViewController init](&v5, sel_init);
}

- (_TtC11NotesEditor35VisionLinkAcceleratorViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_pillOrnamentViewController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_editorXOffset) = (Class)0xC030000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_editorYOffset) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_editorYPadding) = (Class)0x4040000000000000;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[iOSLinkAcceleratorViewController initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_pillOrnamentViewController));
}

@end
