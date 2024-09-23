@implementation CUIKCalendarSpecialDayData

- (CUIKCalendarSpecialDayData)init
{
  CUIKCalendarSpecialDayData *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIKCalendarSpecialDayData;
  result = -[CUIKCalendarSpecialDayData init](&v3, sel_init);
  if (result)
    result->_dayType = 0;
  return result;
}

- (UIColor)color
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", -[CUIKCalendarSpecialDayData cgColor](self, "cgColor"));
}

- (void)setColor:(id)a3
{
  -[CUIKCalendarSpecialDayData setCgColor:](self, "setCgColor:", objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
}

- (int64_t)dayType
{
  return self->_dayType;
}

- (void)setDayType:(int64_t)a3
{
  self->_dayType = a3;
}

- (CGColor)cgColor
{
  return self->_cgColor;
}

- (void)setCgColor:(CGColor *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
