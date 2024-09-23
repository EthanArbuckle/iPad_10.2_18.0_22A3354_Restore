@implementation MUGradientView

- (BOOL)shouldReduceTransparency
{
  objc_super v4;

  if (-[MUGradientView disableReduceTransparency](self, "disableReduceTransparency"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)MUGradientView;
  return -[_MKGradientView shouldReduceTransparency](&v4, sel_shouldReduceTransparency);
}

- (BOOL)disableReduceTransparency
{
  return self->_disableReduceTransparency;
}

- (void)setDisableReduceTransparency:(BOOL)a3
{
  self->_disableReduceTransparency = a3;
}

@end
