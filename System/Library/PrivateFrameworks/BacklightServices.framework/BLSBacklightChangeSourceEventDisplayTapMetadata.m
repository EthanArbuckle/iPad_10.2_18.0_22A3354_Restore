@implementation BLSBacklightChangeSourceEventDisplayTapMetadata

- (BLSBacklightChangeSourceEventDisplayTapMetadata)initWithPosition:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  BLSBacklightChangeSourceEventDisplayTapMetadata *result;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)BLSBacklightChangeSourceEventDisplayTapMetadata;
  result = -[BLSBacklightChangeSourceEventDisplayTapMetadata init](&v6, sel_init);
  if (result)
  {
    result->_position.x = x;
    result->_position.y = y;
  }
  return result;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendPoint:withName:", CFSTR("position"), self->_position.x, self->_position.y);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendCGPoint:", self->_position.x, self->_position.y);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BLSBacklightChangeSourceEventDisplayTapMetadata *v4;
  CGPoint *p_position;
  double v6;
  double v7;
  BOOL v8;

  v4 = (BLSBacklightChangeSourceEventDisplayTapMetadata *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      p_position = &self->_position;
      -[BLSBacklightChangeSourceEventDisplayTapMetadata position](v4, "position");
      v8 = p_position->y == v7 && p_position->x == v6;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BLSBacklightChangeSourceEventDisplayTapMetadata)initWithXPCDictionary:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(CFSTR("position"), "UTF8String");
  BSDeserializeCGPointFromXPCDictionaryWithKey();
  v6 = v5;
  v8 = v7;

  return -[BLSBacklightChangeSourceEventDisplayTapMetadata initWithPosition:](self, "initWithPosition:", v6, v8);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(CFSTR("position"), "UTF8String");
  BSSerializeCGPointToXPCDictionaryWithKey();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSBacklightChangeSourceEventDisplayTapMetadata)initWithCoder:(id)a3
{
  objc_msgSend(a3, "decodePointForKey:", CFSTR("position"));
  return -[BLSBacklightChangeSourceEventDisplayTapMetadata initWithPosition:](self, "initWithPosition:");
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodePoint:forKey:", CFSTR("position"), self->_position.x, self->_position.y);
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
