@implementation MCUIPINPane

- (void)setStyle:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_style != a3)
  {
    self->_style = a3;
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (int)*MEMORY[0x1E0D80550];
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "setBackgroundColor:", v4);

      v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v5);
      MCUILocalizedStringByDevice(CFSTR("PIN_MESSAGE_USER_ENROLLMENT"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA5E8], "MCUIBoldTitleFontWithSize:", 32.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:font:", v8, v7);

    }
  }
}

- (unint64_t)style
{
  return self->_style;
}

@end
