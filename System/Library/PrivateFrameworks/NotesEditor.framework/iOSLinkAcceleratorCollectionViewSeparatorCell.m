@implementation iOSLinkAcceleratorCollectionViewSeparatorCell

- (_TtC11NotesEditor45iOSLinkAcceleratorCollectionViewSeparatorCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC11NotesEditor45iOSLinkAcceleratorCollectionViewSeparatorCell *v7;
  uint64_t v8;
  _TtC11NotesEditor45iOSLinkAcceleratorCollectionViewSeparatorCell *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  v7 = -[iOSLinkAcceleratorCollectionViewSeparatorCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v8 = qword_1F03F5DA8;
  v9 = v7;
  if (v8 != -1)
    swift_once();
  -[iOSLinkAcceleratorCollectionViewSeparatorCell setBackgroundColor:](v9, sel_setBackgroundColor_, qword_1F03F9E50);

  return v9;
}

- (_TtC11NotesEditor45iOSLinkAcceleratorCollectionViewSeparatorCell)initWithCoder:(id)a3
{
  _TtC11NotesEditor45iOSLinkAcceleratorCollectionViewSeparatorCell *result;

  result = (_TtC11NotesEditor45iOSLinkAcceleratorCollectionViewSeparatorCell *)sub_1DD9D2CEC();
  __break(1u);
  return result;
}

@end
