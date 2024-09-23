@implementation PDFCycleTrackingPage

- (void)drawWithBox:(int64_t)a3 toContext:(CGContext *)a4
{
  CGContext *v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)swift_getObjectType();
  v6 = a4;
  v7 = v16.receiver;
  -[PDFCycleTrackingPage drawWithBox:toContext:](&v16, sel_drawWithBox_toContext_, a3, v6);
  UIGraphicsPushContext(v6);
  CGContextSaveGState(v6);
  objc_msgSend(v7, sel_boundsForBox_, a3, v16.receiver, v16.super_class);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  CGContextTranslateCTM(v6, 0.0, v14);
  CGContextScaleCTM(v6, 1.0, -1.0);
  sub_231C39D70(v9, v11, v13, v15);
  CGContextRestoreGState(v6);
  UIGraphicsPopContext();

}

- (_TtC24MenstrualCyclesAppPlugin20PDFCycleTrackingPage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PDFCycleTrackingPage init](&v3, sel_init);
}

- (_TtC24MenstrualCyclesAppPlugin20PDFCycleTrackingPage)initWithImage:(id)a3 options:(id)a4
{
  objc_class *ObjectType;
  id v7;
  void *v8;
  _TtC24MenstrualCyclesAppPlugin20PDFCycleTrackingPage *v9;
  _TtC24MenstrualCyclesAppPlugin20PDFCycleTrackingPage *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for ImageInitializationOption(0);
  sub_23190BE38(&qword_255F3D6E0, (uint64_t (*)(uint64_t))type metadata accessor for ImageInitializationOption, (uint64_t)&unk_231CA9504);
  sub_231CA1AAC();
  v7 = a3;
  v8 = (void *)sub_231CA1A94();
  swift_bridgeObjectRelease();
  v12.receiver = self;
  v12.super_class = ObjectType;
  v9 = -[PDFCycleTrackingPage initWithImage:options:](&v12, sel_initWithImage_options_, v7, v8);

  v10 = v9;
  if (v10)

  return v10;
}

@end
