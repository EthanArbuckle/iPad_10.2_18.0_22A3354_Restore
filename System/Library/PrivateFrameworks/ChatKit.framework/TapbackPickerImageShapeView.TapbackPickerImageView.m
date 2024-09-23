@implementation TapbackPickerImageShapeView.TapbackPickerImageView

- (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView)initWithCoder:(id)a3
{
  _TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView *result;

  result = (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView *)sub_18E769320();
  __break(1u);
  return result;
}

- (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView)initWithImage:(id)a3
{
  id v4;
  _TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView *v5;
  id v6;
  _TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TapbackPickerImageShapeView.TapbackPickerImageView();
  v4 = a3;
  v5 = -[TapbackPickerImageShapeView.TapbackPickerImageView initWithImage:](&v11, sel_initWithImage_, v4);
  sub_18E768984();
  v6 = objc_allocWithZone(MEMORY[0x1E0CD2780]);
  v7 = v5;
  v8 = (void *)sub_18E768954();
  v9 = objc_msgSend(v6, sel_initWithType_, v8, v11.receiver, v11.super_class);

  sub_18E62A9DC(v9);
  swift_bridgeObjectRelease();

  return v7;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView *v7;
  char v8;

  if (a3)
  {
    v4 = sub_18E768984();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = sub_18E6F4AA4(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5;
  id v6;
  _TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView *result;

  v5 = a3;
  v6 = a4;
  result = (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView)initWithFrame:(CGRect)a3
{
  _TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView *result;

  result = (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
