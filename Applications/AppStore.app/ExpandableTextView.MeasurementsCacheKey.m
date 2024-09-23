@implementation ExpandableTextView.MeasurementsCacheKey

- (BOOL)isEqual:(id)a3
{
  return sub_1004C1564(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *, __n128))sub_1004C1010);
}

- (int64_t)hash
{
  _TtCC8AppStore18ExpandableTextViewP33_059173C074D556A1611F1918B5AC36A120MeasurementsCacheKey *v2;
  Swift::Int v3;

  v2 = self;
  v3 = sub_1004C1224();

  return v3;
}

- (_TtCC8AppStore18ExpandableTextViewP33_059173C074D556A1611F1918B5AC36A120MeasurementsCacheKey)init
{
  _TtCC8AppStore18ExpandableTextViewP33_059173C074D556A1611F1918B5AC36A120MeasurementsCacheKey *result;

  result = (_TtCC8AppStore18ExpandableTextViewP33_059173C074D556A1611F1918B5AC36A120MeasurementsCacheKey *)_swift_stdlib_reportUnimplementedInitializer("AppStore.MeasurementsCacheKey", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8AppStore18ExpandableTextViewP33_059173C074D556A1611F1918B5AC36A120MeasurementsCacheKey_traitCollection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8AppStore18ExpandableTextViewP33_059173C074D556A1611F1918B5AC36A120MeasurementsCacheKey_attributedText));
}

@end
