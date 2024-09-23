@implementation AXEventIOSMACPointerInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AXEventIOSMACPointerInfoRepresentation pressed](self, "pressed"), CFSTR("pressed"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXEventIOSMACPointerInfoRepresentation buttonIndex](self, "buttonIndex"), CFSTR("buttonIndex"));
  v5 = (void *)MEMORY[0x1E0CB3B18];
  -[AXEventIOSMACPointerInfoRepresentation location](self, "location");
  objc_msgSend(v5, "valueWithPoint:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("location"));

}

- (AXEventIOSMACPointerInfoRepresentation)initWithCoder:(id)a3
{
  id v3;
  AXEventIOSMACPointerInfoRepresentation *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXEventIOSMACPointerInfoRepresentation;
  v3 = a3;
  v4 = -[AXEventIOSMACPointerInfoRepresentation init](&v7, sel_init);
  -[AXEventIOSMACPointerInfoRepresentation setPressed:](v4, "setPressed:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("pressed"), v7.receiver, v7.super_class));
  -[AXEventIOSMACPointerInfoRepresentation setButtonIndex:](v4, "setButtonIndex:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("buttonIndex")));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pointValue");
  -[AXEventIOSMACPointerInfoRepresentation setLocation:](v4, "setLocation:");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXEventIOSMACPointerInfoRepresentation *v4;

  v4 = -[AXEventIOSMACPointerInfoRepresentation init]([AXEventIOSMACPointerInfoRepresentation alloc], "init");
  -[AXEventIOSMACPointerInfoRepresentation setPressed:](v4, "setPressed:", -[AXEventIOSMACPointerInfoRepresentation pressed](self, "pressed"));
  -[AXEventIOSMACPointerInfoRepresentation setButtonIndex:](v4, "setButtonIndex:", -[AXEventIOSMACPointerInfoRepresentation buttonIndex](self, "buttonIndex"));
  -[AXEventIOSMACPointerInfoRepresentation location](self, "location");
  -[AXEventIOSMACPointerInfoRepresentation setLocation:](v4, "setLocation:");
  return v4;
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (void)setPressed:(BOOL)a3
{
  self->_pressed = a3;
}

- (int64_t)buttonIndex
{
  return self->_buttonIndex;
}

- (void)setButtonIndex:(int64_t)a3
{
  self->_buttonIndex = a3;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

@end
