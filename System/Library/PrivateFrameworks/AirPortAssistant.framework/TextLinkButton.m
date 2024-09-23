@implementation TextLinkButton

- (TextLinkButton)initWithFrame:(CGRect)a3
{
  TextLinkButton *v3;
  const char *v4;
  TextLinkButton *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)TextLinkButton;
  v3 = -[TextLinkButton initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v3;
  if (v3)
  {
    objc_msgSend_addTarget_action_forControlEvents_(v3, v4, (uint64_t)v3, sel_tapAction_, 64);
    v8 = objc_msgSend_systemBlueColor(MEMORY[0x24BDF6950], v6, v7);
    objc_msgSend_setTitleColor_forState_(v5, v9, v8, 0);
    v12 = (void *)objc_msgSend_titleLabel(v5, v10, v11);
    objc_msgSend_setTextAlignment_(v12, v13, 1);
    v16 = (void *)objc_msgSend_titleLabel(v5, v14, v15);
    v19 = objc_msgSend_boldSystemFontOfSize_(MEMORY[0x24BDF6A70], v17, v18, 14.0);
    objc_msgSend_setFont_(v16, v20, v19);
    v23 = (void *)objc_msgSend_titleLabel(v5, v21, v22);
    objc_msgSend_setLineBreakMode_(v23, v24, 0);
    v27 = (void *)objc_msgSend_titleLabel(v5, v25, v26);
    v30 = objc_msgSend_clearColor(MEMORY[0x24BDF6950], v28, v29);
    objc_msgSend_setBackgroundColor_(v27, v31, v30);
  }
  return v5;
}

- (TextLinkButton)initWithCoder:(id)a3
{
  TextLinkButton *v3;
  const char *v4;
  TextLinkButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TextLinkButton;
  v3 = -[TextLinkButton initWithCoder:](&v7, sel_initWithCoder_, a3);
  v5 = v3;
  if (v3)
    objc_msgSend_addTarget_action_forControlEvents_(v3, v4, (uint64_t)v3, sel_tapAction_, 64);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend_setUrlString_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)TextLinkButton;
  -[TextLinkButton dealloc](&v3, sel_dealloc);
}

- (void)tapAction:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = (void *)objc_msgSend_urlString(self, a2, (uint64_t)a3);
  if (objc_msgSend_length(v4, v5, v6))
  {
    v9 = (void *)objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], v7, v8);
    v10 = (void *)MEMORY[0x24BDBCF48];
    v13 = objc_msgSend_urlString(self, v11, v12);
    v15 = objc_msgSend_URLWithString_(v10, v14, v13);
    if (objc_msgSend_canOpenURL_(v9, v16, v15))
    {
      objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v17, v18);
      MEMORY[0x24BEDD108](v9, sel_openURL_options_completionHandler_, v15);
    }
  }
  else if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    MEMORY[0x24BEDD108](self->_delegate, sel_handleTextLinkTap, v19);
  }
}

- (TextLinkButtonDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TextLinkButtonDelegate *)a3;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 752);
}

@end
