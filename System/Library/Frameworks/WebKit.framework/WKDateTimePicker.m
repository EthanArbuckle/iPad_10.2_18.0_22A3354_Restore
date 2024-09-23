@implementation WKDateTimePicker

- (WKDateTimePicker)initWithView:(id)a3 datePickerMode:(int64_t)a4
{
  WKDateTimePicker *v6;
  WKDateTimePicker *v7;
  CGFloat v8;
  CGFloat v9;
  unsigned int v10;
  id v11;
  void *m_ptr;
  BOOL v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WKDateTimePicker;
  v6 = -[WKDateTimePicker init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_view = (WKContentView *)a3;
    objc_msgSend(a3, "lastInteractionLocation");
    v7->_interactionPoint.x = v8;
    v7->_interactionPoint.y = v9;
    v10 = *(unsigned __int8 *)(objc_msgSend(a3, "focusedElementInformation") + 185) - 11;
    if (v10 <= 4 && ((0x17u >> v10) & 1) != 0)
      v7->_formatString = (NSString *)*((_QWORD *)&off_1E34CEF20 + (char)v10);
    v11 = objc_alloc_init(MEMORY[0x1E0CEA4E8]);
    m_ptr = v7->_datePicker.m_ptr;
    v7->_datePicker.m_ptr = v11;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v11 = v7->_datePicker.m_ptr;
    }
    objc_msgSend(v11, "addTarget:action:forControlEvents:", v7, sel__dateChanged, 4096);
    if (-[WKDateTimePicker shouldForceGregorianCalendar](v7, "shouldForceGregorianCalendar"))
      objc_msgSend(v7->_datePicker.m_ptr, "setCalendar:", objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]));
    objc_msgSend(v7->_datePicker.m_ptr, "setDatePickerMode:", a4);
    if (a4)
      v13 = a4 == 4269;
    else
      v13 = 1;
    if (v13)
      v14 = 1;
    else
      v14 = 3;
    objc_msgSend(v7->_datePicker.m_ptr, "setPreferredDatePickerStyle:", v14);
    v7->_isDismissingDatePicker = 0;
  }
  return v7;
}

- (void)datePickerPopoverControllerDidReset:(id)a3
{
  _QWORD *v4;
  char *v5;
  uint64_t v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  _QWORD v10[2];

  -[WKDateTimePicker setDateTimePickerToInitialValue](self, "setDateTimePickerToInitialValue", a3);
  v4 = -[WKContentView page](self->_view, "page");
  v5 = -[WKContentView focusedElementInformation](self->_view, "focusedElementInformation");
  v9 = 0;
  v10[0] = v5 + 16;
  v6 = v4[26];
  v10[1] = &v9;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetFocusedElementValue>(v6, (uint64_t)v10, *(_QWORD *)(v4[4] + 1896), 0);
  v8 = v9;
  v9 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v7);
    else
      *(_DWORD *)v8 -= 2;
  }
}

- (void)handleDatePickerPresentationDismissal
{
  if (!self->_isDismissingDatePicker)
  {
    self->_isDismissingDatePicker = 1;
    -[WKContentView accessoryDone](self->_view, "accessoryDone");
    self->_isDismissingDatePicker = 0;
  }
}

- (void)removeDatePickerPresentation
{
  void *m_ptr;

  m_ptr = self->_datePickerController.m_ptr;
  if (m_ptr)
  {
    if (self->_isDismissingDatePicker)
    {
      self->_datePickerController.m_ptr = 0;
    }
    else
    {
      self->_isDismissingDatePicker = 1;
      objc_msgSend(m_ptr, "dismissViewControllerAnimated:completion:", 0, 0);
      self->_isDismissingDatePicker = 0;
      m_ptr = self->_datePickerController.m_ptr;
      self->_datePickerController.m_ptr = 0;
      if (!m_ptr)
      {
LABEL_7:
        objc_msgSend(-[WKContentView webView](self->_view, "webView"), "_didDismissContextMenu");
        return;
      }
    }
    CFRelease(m_ptr);
    goto LABEL_7;
  }
}

- (WKDatePickerPopoverController)datePickerController
{
  return (WKDatePickerPopoverController *)self->_datePickerController.m_ptr;
}

- (void)showDateTimePicker
{
  WKDatePickerPopoverController *v3;
  void *m_ptr;
  WKContentView *view;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CFTypeRef v14;
  _QWORD v15[4];
  CFTypeRef cf;

  v3 = -[WKDatePickerPopoverController initWithDatePicker:delegate:]([WKDatePickerPopoverController alloc], "initWithDatePicker:delegate:", self->_datePicker.m_ptr, self);
  m_ptr = self->_datePickerController.m_ptr;
  self->_datePickerController.m_ptr = v3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v3 = (WKDatePickerPopoverController *)self->_datePickerController.m_ptr;
  }
  view = self->_view;
  -[WKContentView focusedElementInformation](view, "focusedElementInformation");
  WebCore::IntRect::operator CGRect();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3321888768;
  v15[2] = __38__WKDateTimePicker_showDateTimePicker__block_invoke;
  v15[3] = &__block_descriptor_40_e8_32c51_ZTSKZ38__WKDateTimePicker_showDateTimePicker_E3__2_e5_v8__0l;
  CFRetain(self);
  cf = self;
  CFRetain(self);
  -[WKDatePickerPopoverController presentInView:sourceRect:completion:](v3, "presentInView:sourceRect:completion:", view, v15, v7, v9, v11, v13);
  CFRelease(self);
  v14 = cf;
  cf = 0;
  if (v14)
    CFRelease(v14);
}

uint64_t __38__WKDateTimePicker_showDateTimePicker__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "webView"), "_didShowContextMenu");
}

- (BOOL)shouldForceGregorianCalendar
{
  return *(unsigned __int8 *)(-[WKContentView focusedElementInformation](self->_view, "focusedElementInformation")+ 296)- 29 < 3;
}

- (void)dealloc
{
  objc_super v3;

  -[WKDateTimePicker removeDatePickerPresentation](self, "removeDatePickerPresentation");
  v3.receiver = self;
  v3.super_class = (Class)WKDateTimePicker;
  -[WKDateTimePicker dealloc](&v3, sel_dealloc);
}

- (id)_sanitizeInputValueForFormatter:(id)a3
{
  void *v6;

  if (*(_BYTE *)(-[WKContentView focusedElementInformation](self->_view, "focusedElementInformation") + 185) == 15)
    return (id)objc_msgSend(a3, "substringToIndex:", objc_msgSend(CFSTR("HH:mm"), "length"));
  if (*(_BYTE *)(-[WKContentView focusedElementInformation](self->_view, "focusedElementInformation") + 185) != 12)
    return a3;
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("T")), "objectAtIndex:", 1);
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", v6, objc_msgSend(v6, "substringToIndex:", objc_msgSend(CFSTR("HH:mm"), "length")));
}

- (RetainPtr<NSDateFormatter>)dateFormatterForPicker
{
  _QWORD *v2;
  _QWORD *v4;
  const void *v5;
  id v6;
  RetainPtr<NSDateFormatter> v7;

  v4 = v2;
  v5 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  *v4 = v6;
  objc_msgSend(v6, "setTimeZone:", objc_msgSend(self->_datePicker.m_ptr, "timeZone"));
  objc_msgSend(v6, "setDateFormat:", self->_formatString);
  v7.var0 = (void *)objc_msgSend(v6, "setLocale:", v5);
  if (v5)
    CFRelease(v5);
  return v7;
}

- (void)_dateChanged
{
  void *v3;
  CFTypeRef cf;

  if (self)
  {
    -[WKDateTimePicker dateFormatterForPicker](self, "dateFormatterForPicker");
    v3 = (void *)cf;
  }
  else
  {
    v3 = 0;
    cf = 0;
  }
  -[WKContentView updateFocusedElementValue:](self->_view, "updateFocusedElementValue:", objc_msgSend(v3, "stringFromDate:", objc_msgSend(self->_datePicker.m_ptr, "date")));
  if (cf)
    CFRelease(cf);
}

- (void)setDateTimePickerToInitialValue
{
  uint64_t v3;
  void *m_ptr;
  void *cf;

  if (objc_msgSend(self->_initialValue.m_ptr, "length"))
  {
    -[WKDateTimePicker dateFormatterForPicker](self, "dateFormatterForPicker");
    v3 = objc_msgSend(cf, "dateFromString:", -[WKDateTimePicker _sanitizeInputValueForFormatter:](self, "_sanitizeInputValueForFormatter:", self->_initialValue.m_ptr));
    if (cf)
      CFRelease(cf);
    m_ptr = self->_datePicker.m_ptr;
    if (!v3)
      v3 = objc_msgSend(MEMORY[0x1E0C99D68], "date");
    objc_msgSend(m_ptr, "setDate:", v3);
  }
  else
  {
    objc_msgSend(self->_datePicker.m_ptr, "setDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
    -[WKDateTimePicker _dateChanged](self, "_dateChanged");
  }
}

- (id)controlView
{
  return 0;
}

- (void)controlBeginEditing
{
  int v3;
  const __CFString *v5;
  RetainPtr<NSString> *p_initialValue;
  void *m_ptr;

  v3 = *(unsigned __int8 *)(-[WKContentView focusedElementInformation](self->_view, "focusedElementInformation") + 185);
  if (v3 == 15 || v3 == 12)
    -[WKContentView startRelinquishingFirstResponderToFocusedElement](self->_view, "startRelinquishingFirstResponderToFocusedElement");
  objc_msgSend(self->_datePicker.m_ptr, "setTimeZone:", objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone"));
  if (*(_QWORD *)(-[WKContentView focusedElementInformation](self->_view, "focusedElementInformation") + 224))
  {
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    p_initialValue = &self->_initialValue;
    if (!v5)
      goto LABEL_10;
  }
  else
  {
    p_initialValue = &self->_initialValue;
    v5 = &stru_1E351F1B8;
  }
  CFRetain(v5);
LABEL_10:
  m_ptr = p_initialValue->m_ptr;
  p_initialValue->m_ptr = (void *)v5;
  if (m_ptr)
    CFRelease(m_ptr);
  -[WKDateTimePicker setDateTimePickerToInitialValue](self, "setDateTimePickerToInitialValue");
  -[WKDateTimePicker showDateTimePicker](self, "showDateTimePicker");
}

- (void)controlEndEditing
{
  -[WKContentView stopRelinquishingFirstResponderToFocusedElement](self->_view, "stopRelinquishingFirstResponderToFocusedElement");
  -[WKDateTimePicker removeDatePickerPresentation](self, "removeDatePickerPresentation");
}

- (NSString)calendarType
{
  return (NSString *)objc_msgSend((id)objc_msgSend(self->_datePicker.m_ptr, "calendar"), "calendarIdentifier");
}

- (double)hour
{
  return (double)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"), "components:fromDate:", 32, objc_msgSend(self->_datePicker.m_ptr, "date")), "hour");
}

- (double)minute
{
  return (double)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"), "components:fromDate:", 64, objc_msgSend(self->_datePicker.m_ptr, "date")), "minute");
}

- (void)setHour:(int64_t)a3 minute:(int64_t)a4
{
  uint64_t v5;
  void *m_ptr;
  void *cf;

  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2ld:%.2ld"), a3, a4);
  m_ptr = self->_datePicker.m_ptr;
  -[WKDateTimePicker dateFormatterForPicker](self, "dateFormatterForPicker");
  objc_msgSend(m_ptr, "setDate:", objc_msgSend(cf, "dateFromString:", v5));
  if (cf)
    CFRelease(cf);
  -[WKDateTimePicker _dateChanged](self, "_dateChanged");
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  m_ptr = self->_datePickerController.m_ptr;
  self->_datePickerController.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_datePicker.m_ptr;
  self->_datePicker.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_initialValue.m_ptr;
  self->_initialValue.m_ptr = 0;
  if (v5)
    CFRelease(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
