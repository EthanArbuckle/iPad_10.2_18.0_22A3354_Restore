@implementation CLKComplicationTemplateExtraLargeDate

- (CLKComplicationTemplateExtraLargeDate)initWithWeekdayTextProvider:(id)a3 dayTextProvider:(id)a4
{
  id v6;
  id v7;
  CLKComplicationTemplateExtraLargeDate *v8;
  CLKComplicationTemplateExtraLargeDate *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateExtraLargeDate;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateExtraLargeDate setWeekdayTextProvider:](v8, "setWeekdayTextProvider:", v6);
    -[CLKComplicationTemplateExtraLargeDate setDayTextProvider:](v9, "setDayTextProvider:", v7);
  }

  return v9;
}

+ (id)templateWithWeekdayTextProvider:(id)a3 dayTextProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWeekdayTextProvider:dayTextProvider:", v7, v6);

  return v8;
}

- (int64_t)compatibleFamily
{
  return 7;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, _QWORD, char *))v3 + 2))(v3, CFSTR("weekdayTextProvider"), 0, 0, &v4);
  if (!v4)
    (*((void (**)(id, const __CFString *, _QWORD, _QWORD, char *))v3 + 2))(v3, CFSTR("dayTextProvider"), 0, 0, &v4);

}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, void *, char *))a3 + 2))(a3, CFSTR("highlightMode"), 0, &__block_literal_global_741, &v3);
}

BOOL __72__CLKComplicationTemplateExtraLargeDate__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidForegroundHighlightMode(a2);
}

- (void)setHighlightLine2:(BOOL)a3
{
  -[CLKComplicationTemplateExtraLargeDate setHighlightMode:](self, "setHighlightMode:", a3);
}

- (BOOL)highlightLine2
{
  return -[CLKComplicationTemplateExtraLargeDate highlightMode](self, "highlightMode") != 0;
}

- (CLKDateTextProvider)weekdayTextProvider
{
  return self->_weekdayTextProvider;
}

- (void)setWeekdayTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CLKDateTextProvider)dayTextProvider
{
  return self->_dayTextProvider;
}

- (void)setDayTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)highlightMode
{
  return self->_highlightMode;
}

- (void)setHighlightMode:(unint64_t)a3
{
  self->_highlightMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayTextProvider, 0);
  objc_storeStrong((id *)&self->_weekdayTextProvider, 0);
}

@end
