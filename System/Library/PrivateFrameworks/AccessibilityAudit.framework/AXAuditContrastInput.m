@implementation AXAuditContrastInput

- (AXAuditContrastInput)init
{
  AXAuditContrastInput *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXAuditContrastInput;
  result = -[AXAuditContrastInput init](&v3, sel_init);
  if (result)
    result->_displayScaleFactor = 1.0;
  return result;
}

- (id)description
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  objc_super v17;
  NSRect v18;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  -[AXAuditContrastInput identifier](self, "identifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = -[__CFString length](v4, "length");
  v6 = &stru_25071BA38;
  if (v5)
    v6 = v4;
  v7 = v6;

  v17.receiver = self;
  v17.super_class = (Class)AXAuditContrastInput;
  -[AXAuditContrastInput description](&v17, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditContrastInput imageFrame](self, "imageFrame");
  NSStringFromRect(v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@, %@, %@"), v8, v7, v9);

  if (-[AXAuditContrastInput enhanced](self, "enhanced"))
    objc_msgSend(v3, "appendString:", CFSTR(" Enhanced "));
  -[AXAuditContrastInput foregroundHexColorValue](self, "foregroundHexColorValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AXAuditContrastInput foregroundHexColorValue](self, "foregroundHexColorValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("ForegroundColor: %@"), v11);

  }
  -[AXAuditContrastInput backgroundHexColorValue](self, "backgroundHexColorValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AXAuditContrastInput backgroundHexColorValue](self, "backgroundHexColorValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("BackgroundColor: %@"), v13);

  }
  -[AXAuditContrastInput fontSize](self, "fontSize");
  if (v14 > 0.0)
  {
    -[AXAuditContrastInput fontSize](self, "fontSize");
    objc_msgSend(v3, "appendFormat:", CFSTR("FontSize: %.1f"), v15);
  }
  return v3;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (CGRect)imageFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_imageFrame.origin.x;
  y = self->_imageFrame.origin.y;
  width = self->_imageFrame.size.width;
  height = self->_imageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setImageFrame:(CGRect)a3
{
  self->_imageFrame = a3;
}

- (double)displayScaleFactor
{
  return self->_displayScaleFactor;
}

- (void)setDisplayScaleFactor:(double)a3
{
  self->_displayScaleFactor = a3;
}

- (BOOL)enhanced
{
  return self->_enhanced;
}

- (void)setEnhanced:(BOOL)a3
{
  self->_enhanced = a3;
}

- (NSString)foregroundHexColorValue
{
  return self->_foregroundHexColorValue;
}

- (void)setForegroundHexColorValue:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundHexColorValue, a3);
}

- (NSString)backgroundHexColorValue
{
  return self->_backgroundHexColorValue;
}

- (void)setBackgroundHexColorValue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundHexColorValue, a3);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_backgroundHexColorValue, 0);
  objc_storeStrong((id *)&self->_foregroundHexColorValue, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
