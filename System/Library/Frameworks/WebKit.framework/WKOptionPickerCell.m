@implementation WKOptionPickerCell

- (BOOL)_isSelectable
{
  return !-[WKOptionPickerCell disabled](self, "disabled");
}

- (WKOptionPickerCell)init
{
  double v2;
  double v3;
  double v4;
  double v5;
  WKOptionPickerCell *v6;
  WKOptionPickerCell *v7;
  objc_super v9;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9.receiver = self;
  v9.super_class = (Class)WKOptionPickerCell;
  v6 = -[WKOptionPickerCell initWithFrame:](&v9, sel_initWithFrame_, v2, v3, v4, v5);
  v7 = v6;
  if (v6)
    -[UILabel setLineBreakMode:](-[UIPickerContentView titleLabel](v6, "titleLabel"), "setLineBreakMode:", 5);
  return v7;
}

- (WKOptionPickerCell)initWithOptionItem:(const void *)a3
{
  WKOptionPickerCell *v4;
  __CFString *v5;
  __CFString *v6;
  UILabel *v7;

  v4 = -[WKOptionPickerCell init](self, "init");
  if (v4)
  {
    if (*(_QWORD *)a3)
      v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    else
      v5 = &stru_1E351F1B8;
    v6 = (__CFString *)-[__CFString mutableCopy](v5, "mutableCopy");
    CFStringTrimWhitespace(v6);
    -[UILabel setText:](-[UIPickerContentView titleLabel](v4, "titleLabel"), "setText:", v6);
    -[UIPickerContentView setChecked:](v4, "setChecked:", *((unsigned __int8 *)a3 + 9));
    -[WKOptionPickerCell setDisabled:](v4, "setDisabled:", *((unsigned __int8 *)a3 + 10));
    if (*((_BYTE *)&v4->super._pickerContentViewFlags + 4))
    {
      v7 = -[UIPickerContentView titleLabel](v4, "titleLabel");
      -[UILabel setTextColor:](v7, "setTextColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.300000012));
    }
    if (v6)
      CFRelease(v6);
  }
  return v4;
}

- (BOOL)disabled
{
  return *((_BYTE *)&self->super._pickerContentViewFlags + 4);
}

- (void)setDisabled:(BOOL)a3
{
  *((_BYTE *)&self->super._pickerContentViewFlags + 4) = a3;
}

@end
