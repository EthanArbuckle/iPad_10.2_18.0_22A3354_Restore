@implementation WKDateTimeInputControl

- (WKDateTimeInputControl)initWithView:(id)a3
{
  unsigned int v5;
  WKDateTimeInputControl *v6;
  WKDateTimePicker *v8;
  CFTypeRef v9;
  objc_super v10;
  CFTypeRef cf;

  v5 = *(unsigned __int8 *)(objc_msgSend(a3, "focusedElementInformation") + 185) - 11;
  if (v5 < 5 && ((0x17u >> v5) & 1) != 0)
  {
    v8 = -[WKDateTimePicker initWithView:datePickerMode:]([WKDateTimePicker alloc], "initWithView:datePickerMode:", a3, qword_1978D0400[(char)v5]);
    v10.receiver = self;
    v10.super_class = (Class)WKDateTimeInputControl;
    cf = v8;
    v6 = -[WKFormPeripheralBase initWithView:control:](&v10, sel_initWithView_control_, a3, &cf);
    v9 = cf;
    cf = 0;
    if (v9)
      CFRelease(v9);
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)setTimePickerHour:(int64_t)a3 minute:(int64_t)a4
{
  WKFormControl *v6;

  v6 = -[WKFormPeripheralBase control](self, "control");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v6)
      -[WKFormControl setHour:minute:](v6, "setHour:minute:", a3, a4);
  }
}

- (NSString)dateTimePickerCalendarType
{
  WKFormControl *v2;

  v2 = -[WKFormPeripheralBase control](self, "control");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v2)
    return (NSString *)-[WKFormControl calendarType](v2, "calendarType");
  else
    return 0;
}

- (double)timePickerValueHour
{
  WKFormControl *v2;
  double result;

  v2 = -[WKFormPeripheralBase control](self, "control");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !v2)
    return -1.0;
  -[WKFormControl hour](v2, "hour");
  return result;
}

- (double)timePickerValueMinute
{
  WKFormControl *v2;
  double result;

  v2 = -[WKFormPeripheralBase control](self, "control");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !v2)
    return -1.0;
  -[WKFormControl minute](v2, "minute");
  return result;
}

- (BOOL)dismissWithAnimationForTesting
{
  WKFormControl *v2;

  v2 = -[WKFormPeripheralBase control](self, "control");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v2 = 0;
  if (v2)
  {
    objc_msgSend((id)-[WKFormControl datePickerController](v2, "datePickerController"), "assertAccessoryViewCanBeHitTestedForTesting");
    objc_msgSend((id)-[WKFormControl datePickerController](v2, "datePickerController"), "dismissDatePicker");
  }
  return v2 != 0;
}

@end
