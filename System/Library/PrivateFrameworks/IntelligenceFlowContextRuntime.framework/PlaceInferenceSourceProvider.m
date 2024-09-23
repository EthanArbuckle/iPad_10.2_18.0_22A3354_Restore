@implementation PlaceInferenceSourceProvider

- (_TtC30IntelligenceFlowContextRuntime28PlaceInferenceSourceProvider)init
{
  return (_TtC30IntelligenceFlowContextRuntime28PlaceInferenceSourceProvider *)sub_23F3164F0();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC30IntelligenceFlowContextRuntime28PlaceInferenceSourceProvider_type;
  v4 = sub_23F2F6C34();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC30IntelligenceFlowContextRuntime28PlaceInferenceSourceProvider_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC30IntelligenceFlowContextRuntime28PlaceInferenceSourceProvider_locationManager));
}

@end
