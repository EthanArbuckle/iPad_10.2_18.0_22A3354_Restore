@implementation MUImpressionElement

- (MUImpressionElement)initWithElementIdentifier:(id)a3 visibilityThreshold:(double)a4
{
  id v7;
  BOOL v8;
  MUImpressionElement *v9;
  MUImpressionElement *v10;
  double *v11;
  objc_super v13;

  v7 = a3;
  if (v7 && (a4 > 0.0 ? (v8 = a4 <= 1.0) : (v8 = 0), v8))
  {
    v13.receiver = self;
    v13.super_class = (Class)MUImpressionElement;
    v10 = -[MUImpressionElement init](&v13, sel_init);
    v11 = (double *)v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_elementIdentifier, a3);
      v11[3] = a4;
    }
    self = v11;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUUID)elementIdentifier
{
  return self->_elementIdentifier;
}

- (double)visibilityThreshold
{
  return self->_visibilityThreshold;
}

- (NSObject)customData
{
  return self->_customData;
}

- (void)setCustomData:(id)a3
{
  objc_storeStrong((id *)&self->_customData, a3);
}

- (NSString)debugString
{
  return self->_debugString;
}

- (void)setDebugString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugString, 0);
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
