@implementation HMIHTMLReportBox

- (HMIHTMLReportBox)initWithBoundingBox:(CGRect)a3 text:(id)a4 color:(id)a5 opacity:(float)a6 value:(float)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  HMIHTMLReportBox *v18;
  HMIHTMLReportBox *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMIHTMLReportBox;
  v18 = -[HMIHTMLReportBox init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_boundingBox.origin.x = x;
    v18->_boundingBox.origin.y = y;
    v18->_boundingBox.size.width = width;
    v18->_boundingBox.size.height = height;
    objc_storeStrong((id *)&v18->_text, a4);
    objc_storeStrong((id *)&v19->_color, a5);
    v19->_opacity = a6;
    v19->_value = a7;
  }

  return v19;
}

- (CGRect)boundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)color
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (float)opacity
{
  return self->_opacity;
}

- (float)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
