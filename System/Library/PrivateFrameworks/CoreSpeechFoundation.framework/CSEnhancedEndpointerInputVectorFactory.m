@implementation CSEnhancedEndpointerInputVectorFactory

+ (id)inputVectorWithShape:(id)a3 dataType:(int64_t)a4 error:(id *)a5
{
  unint64_t v6;
  void *v7;

  sub_1B5034CA4();
  v6 = sub_1B50CBC6C();
  v7 = (void *)sub_1B5034788(v6, a4);
  swift_bridgeObjectRelease();
  return v7;
}

- (_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CSEnhancedEndpointerInputVectorFactory();
  return -[CSEnhancedEndpointerInputVectorFactory init](&v3, sel_init);
}

@end
