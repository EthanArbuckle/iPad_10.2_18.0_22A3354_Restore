@implementation TwelveMonthPDFHeaderView

- (_TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView *)sub_231BBC3D4(v3, v4);
}

- (_TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView_showPDF);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView____lazy_storage___button) = 0;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23192E728(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView_showPDF));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView____lazy_storage___button));
}

@end
