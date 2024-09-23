@implementation CSEnhancedEndpointerInputVectorDefault

- (_TtP20CoreSpeechFoundation29CSEnhancedEndpointerModelType_)modelType
{
  return (_TtP20CoreSpeechFoundation29CSEnhancedEndpointerModelType_ *)(id)swift_unknownObjectRetain();
}

- (void)setModelType:(id)a3
{
  sub_1B5033E88((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_modelType);
}

- (MLMultiArray)multiArray
{
  return (MLMultiArray *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_multiArray));
}

- (void)setMultiArray:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_multiArray);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_multiArray) = (Class)a3;
  v3 = a3;

}

- (_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault)initWithShape:(id)a3 dataType:(int64_t)a4 error:(id *)a5
{
  return (_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault *)sub_1B5034018((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t))sub_1B5033C68);
}

- (id)modelName
{
  return sub_1B50340C8((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_modelType);
}

- (int64_t)endpointerType
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_modelType), sel_endpointerType);
}

- (id)multiArrayWithContext:(id)a3
{
  id v4;
  _TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1B5033A6C(v4);
  v7 = v6;

  return v7;
}

- (_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault)init
{
  _TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault *result;

  result = (_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_multiArray));
}

@end
