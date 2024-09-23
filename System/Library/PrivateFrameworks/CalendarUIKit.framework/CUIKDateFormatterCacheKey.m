@implementation CUIKDateFormatterCacheKey

- (CUIKDateFormatterCacheKey)initWithCalendar:(id)a3 is24HourFormat:(BOOL)a4 dropDesignator:(BOOL)a5 canDropMinutes:(BOOL)a6 designatorRequiresWhitespace:(BOOL)a7 addDate:(BOOL)a8
{
  id v15;
  CUIKDateFormatterCacheKey *v16;
  CUIKDateFormatterCacheKey *v17;
  objc_super v19;

  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CUIKDateFormatterCacheKey;
  v16 = -[CUIKDateFormatterCacheKey init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_calendar, a3);
    v17->_is24HourFormat = a4;
    v17->_dropDesignator = a5;
    v17->_canDropMinutes = a6;
    v17->_designatorRequiresWhitespace = a7;
    v17->_addDate = a8;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  _QWORD *v7;

  v4 = a3;
  if (v4 && (v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    v7 = v4;
    v6 = -[NSCalendar isEqual:](self->_calendar, "isEqual:", v7[2])
      && self->_is24HourFormat == *((unsigned __int8 *)v7 + 8)
      && self->_dropDesignator == *((unsigned __int8 *)v7 + 9)
      && self->_canDropMinutes == *((unsigned __int8 *)v7 + 10)
      && self->_designatorRequiresWhitespace == *((unsigned __int8 *)v7 + 11)
      && self->_addDate == *((unsigned __int8 *)v7 + 12);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint8x8_t v4;
  uint32x4_t v5;
  int64x2_t v6;
  int8x16_t v7;
  int8x16_t v8;

  v3 = -[NSCalendar hash](self->_calendar, "hash");
  v4.i32[0] = *(_DWORD *)&self->_dropDesignator;
  v5 = vmovl_u16((uint16x4_t)vceqz_s16((int16x4_t)*(_OWORD *)&vmovl_u8(v4)));
  v6.i64[0] = v5.u32[0];
  v6.i64[1] = v5.u32[1];
  v7 = (int8x16_t)vshrq_n_s64(vshlq_n_s64(v6, 0x38uLL), 0x38uLL);
  v6.i64[0] = v5.u32[2];
  v6.i64[1] = v5.u32[3];
  v8 = vorrq_s8(vbicq_s8((int8x16_t)xmmword_1B8BA4AB0, v7), vbicq_s8((int8x16_t)xmmword_1B8BA4AA0, (int8x16_t)vshrq_n_s64(vshlq_n_s64(v6, 0x38uLL), 0x38uLL)));
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v8.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)) ^ v3 ^ self->_is24HourFormat;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (BOOL)is24HourFormat
{
  return self->_is24HourFormat;
}

- (BOOL)dropDesignator
{
  return self->_dropDesignator;
}

- (BOOL)canDropMinutes
{
  return self->_canDropMinutes;
}

- (BOOL)designatorRequiresWhitespace
{
  return self->_designatorRequiresWhitespace;
}

- (BOOL)addDate
{
  return self->_addDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
