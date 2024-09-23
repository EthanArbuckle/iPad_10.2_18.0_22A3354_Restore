@implementation WKOptionGroupPickerCell

- (WKOptionGroupPickerCell)initWithOptionItem:(const void *)a3
{
  WKOptionGroupPickerCell *v4;
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
    -[UIPickerContentView setChecked:](v4, "setChecked:", 0);
    v7 = -[UIPickerContentView titleLabel](v4, "titleLabel");
    -[UILabel setTextColor:](v7, "setTextColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.5));
    -[WKOptionPickerCell setDisabled:](v4, "setDisabled:", 1);
    if (v6)
      CFRelease(v6);
  }
  return v4;
}

- (double)labelWidthForBounds:(CGRect)a3
{
  double Width;
  double v4;

  Width = CGRectGetWidth(a3);
  objc_msgSend(MEMORY[0x1E0CEA830], "_checkmarkOffset");
  return Width - v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double MaxX;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;

  if (-[UIPickerContentView titleLabel](self, "titleLabel"))
  {
    -[WKOptionGroupPickerCell bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0CEA830], "_checkmarkOffset");
    v12 = v11;
    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    MaxX = CGRectGetMaxX(v16);
    objc_msgSend(MEMORY[0x1E0CEA830], "_checkmarkOffset");
    v15 = MaxX - v14;
    v17.origin.x = v4;
    v17.origin.y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    -[UILabel setFrame:](-[UIPickerContentView titleLabel](self, "titleLabel"), "setFrame:", v12, 0.0, v15, CGRectGetHeight(v17));
  }
}

@end
