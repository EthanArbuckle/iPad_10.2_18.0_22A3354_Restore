@implementation WKPDFConfiguration

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKPDFConfiguration accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKPDFConfiguration accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_196BCC000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (WKPDFConfiguration)init
{
  WKPDFConfiguration *v2;
  WKPDFConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKPDFConfiguration;
  v2 = -[WKPDFConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WKPDFConfiguration setRect:](v2, "setRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    -[WKPDFConfiguration setAllowTransparentBackground:](v3, "setAllowTransparentBackground:", 0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[WKPDFConfiguration rect](self, "rect");
  objc_msgSend(v4, "setRect:");
  objc_msgSend(v4, "setAllowTransparentBackground:", -[WKPDFConfiguration allowTransparentBackground](self, "allowTransparentBackground"));
  return v4;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)rect
{
  self->_rect = rect;
}

- (BOOL)allowTransparentBackground
{
  return self->_allowTransparentBackground;
}

- (void)setAllowTransparentBackground:(BOOL)allowTransparentBackground
{
  self->_allowTransparentBackground = allowTransparentBackground;
}

@end
