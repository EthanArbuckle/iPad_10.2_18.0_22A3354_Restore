@implementation AmbientCompactMatchingFlowView

- (_TtC16MusicRecognition30AmbientCompactMatchingFlowView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtC16MusicRecognition30AmbientCompactMatchingFlowView *v11;
  _TtC16MusicRecognition30AmbientCompactMatchingFlowView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = OBJC_IVAR____TtC16MusicRecognition30AmbientCompactMatchingFlowView_imageView;
  v10 = objc_allocWithZone((Class)UIImageView);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[AmbientCompactMatchingFlowView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  sub_1000BD9E0();

  return v12;
}

- (_TtC16MusicRecognition30AmbientCompactMatchingFlowView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC16MusicRecognition30AmbientCompactMatchingFlowView *)sub_1000BDD34(v3, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition30AmbientCompactMatchingFlowView_imageView));
}

@end
