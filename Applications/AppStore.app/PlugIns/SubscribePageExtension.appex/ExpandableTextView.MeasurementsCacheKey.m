@implementation ExpandableTextView.MeasurementsCacheKey

- (BOOL)isEqual:(id)a3
{
  return sub_10020DE58(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *, __n128))sub_10020D904);
}

- (int64_t)hash
{
  _TtCC22SubscribePageExtension18ExpandableTextViewP33_177A8550F09467BBA030D3A485389D2420MeasurementsCacheKey *v2;
  Swift::Int v3;

  v2 = self;
  v3 = sub_10020DB18();

  return v3;
}

- (_TtCC22SubscribePageExtension18ExpandableTextViewP33_177A8550F09467BBA030D3A485389D2420MeasurementsCacheKey)init
{
  _TtCC22SubscribePageExtension18ExpandableTextViewP33_177A8550F09467BBA030D3A485389D2420MeasurementsCacheKey *result;

  result = (_TtCC22SubscribePageExtension18ExpandableTextViewP33_177A8550F09467BBA030D3A485389D2420MeasurementsCacheKey *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.MeasurementsCacheKey", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22SubscribePageExtension18ExpandableTextViewP33_177A8550F09467BBA030D3A485389D2420MeasurementsCacheKey_traitCollection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22SubscribePageExtension18ExpandableTextViewP33_177A8550F09467BBA030D3A485389D2420MeasurementsCacheKey_attributedText));
}

@end
