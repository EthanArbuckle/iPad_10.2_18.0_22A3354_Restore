@implementation BLSBacklightChangeSourceEventDisplaySwipeMetadata

- (BLSBacklightChangeSourceEventDisplaySwipeMetadata)initWithDirection:(int64_t)a3
{
  BLSBacklightChangeSourceEventDisplaySwipeMetadata *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BLSBacklightChangeSourceEventDisplaySwipeMetadata;
  result = -[BLSBacklightChangeSourceEventDisplaySwipeMetadata init](&v5, sel_init);
  if (result)
    result->_direction = a3;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = self->_direction - 1;
  if (v5 > 3)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E621AB80[v5];
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("direction"));
  objc_msgSend(v4, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_direction);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BLSBacklightChangeSourceEventDisplaySwipeMetadata *v4;
  int64_t direction;
  BOOL v6;

  v4 = (BLSBacklightChangeSourceEventDisplaySwipeMetadata *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      direction = self->_direction;
      v6 = direction == -[BLSBacklightChangeSourceEventDisplaySwipeMetadata direction](v4, "direction");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BLSBacklightChangeSourceEventDisplaySwipeMetadata)initWithXPCDictionary:(id)a3
{
  id v4;
  int64_t int64;

  v4 = a3;
  int64 = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("direction"), "UTF8String"));

  return -[BLSBacklightChangeSourceEventDisplaySwipeMetadata initWithDirection:](self, "initWithDirection:", int64);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("direction"), "UTF8String"), self->_direction);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSBacklightChangeSourceEventDisplaySwipeMetadata)initWithCoder:(id)a3
{
  return -[BLSBacklightChangeSourceEventDisplaySwipeMetadata initWithDirection:](self, "initWithDirection:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("direction")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_direction, CFSTR("direction"));
}

- (int64_t)direction
{
  return self->_direction;
}

@end
