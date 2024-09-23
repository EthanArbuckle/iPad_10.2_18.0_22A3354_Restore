@implementation ULCustomLoiConfiguration

- (ULCustomLoiConfiguration)initWithEnableInRoomDetection:(BOOL)a3
{
  _BOOL8 v3;
  ULCustomLoiConfiguration *v4;
  ULCustomLoiConfiguration *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ULCustomLoiConfiguration;
  v4 = -[ULCustomLoiConfiguration init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ULCustomLoiConfiguration setIsInRoomDetectionEnabled:](v4, "setIsInRoomDetectionEnabled:", v3);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithEnableInRoomDetection:", self->_isInRoomDetectionEnabled);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ULCustomLoiConfiguration)initWithCoder:(id)a3
{
  id v4;
  ULCustomLoiConfiguration *v5;
  ULCustomLoiConfiguration *v6;
  ULCustomLoiConfiguration *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULCustomLoiConfiguration;
  v5 = -[ULCustomLoiConfiguration init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isInRoomDetectionEnabled"));
    v6 = (ULCustomLoiConfiguration *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = -[ULCustomLoiConfiguration BOOLValue](v6, "BOOLValue");

      v5->_isInRoomDetectionEnabled = v8;
      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  _BOOL8 isInRoomDetectionEnabled;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  isInRoomDetectionEnabled = self->_isInRoomDetectionEnabled;
  v5 = a3;
  objc_msgSend(v3, "numberWithBool:", isInRoomDetectionEnabled);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("isInRoomDetectionEnabled"));

}

- (BOOL)isInRoomDetectionEnabled
{
  return self->_isInRoomDetectionEnabled;
}

- (void)setIsInRoomDetectionEnabled:(BOOL)a3
{
  self->_isInRoomDetectionEnabled = a3;
}

@end
