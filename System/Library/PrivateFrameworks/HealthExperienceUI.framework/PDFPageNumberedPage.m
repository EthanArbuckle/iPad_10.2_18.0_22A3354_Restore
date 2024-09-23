@implementation PDFPageNumberedPage

- (_TtC18HealthExperienceUI19PDFPageNumberedPage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PDFWithCustomFooterTextPage init](&v3, sel_init);
}

- (_TtC18HealthExperienceUI19PDFPageNumberedPage)initWithImage:(id)a3 options:(id)a4
{
  objc_class *ObjectType;
  id v7;
  void *v8;
  _TtC18HealthExperienceUI19PDFPageNumberedPage *v9;
  _TtC18HealthExperienceUI19PDFPageNumberedPage *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for ImageInitializationOption(0);
  sub_1A96156AC(&qword_1EEB09930, (uint64_t (*)(uint64_t))type metadata accessor for ImageInitializationOption, (uint64_t)&unk_1A9AA0DA8);
  sub_1A9A95710();
  v7 = a3;
  v8 = (void *)sub_1A9A95704();
  swift_bridgeObjectRelease();
  v12.receiver = self;
  v12.super_class = ObjectType;
  v9 = -[PDFWithCustomFooterTextPage initWithImage:options:](&v12, sel_initWithImage_options_, v7, v8);

  v10 = v9;
  if (v10)

  return v10;
}

@end
