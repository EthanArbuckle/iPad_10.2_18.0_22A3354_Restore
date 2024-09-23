@implementation NTKGroupedBezelProperties

- (UIColor)bezelTextColor
{
  return self->_bezelTextColor;
}

- (void)setBezelTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_bezelTextColor, a3);
}

- (double)bezelTextRadius
{
  return self->_bezelTextRadius;
}

- (void)setBezelTextRadius:(double)a3
{
  self->_bezelTextRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bezelTextColor, 0);
}

@end
