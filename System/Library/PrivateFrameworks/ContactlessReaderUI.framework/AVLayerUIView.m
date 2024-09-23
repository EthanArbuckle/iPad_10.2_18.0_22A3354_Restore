@implementation AVLayerUIView

+ (Class)layerClass
{
  sub_22F8BFFBC();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView_looper) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView_url;
  v9 = sub_22F98D30C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AVLayerUIView(0);
  return -[AVLayerUIView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView_looper) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView_url;
  v6 = sub_22F98D30C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AVLayerUIView(0);
  return -[AVLayerUIView initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView_looper));
  sub_22F87AC20((uint64_t)self + OBJC_IVAR____TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView_url, &qword_255E22140);
}

@end
