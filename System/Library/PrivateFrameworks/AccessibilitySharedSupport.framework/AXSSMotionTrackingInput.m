@implementation AXSSMotionTrackingInput

- (AXSSMotionTrackingInput)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXSSMotionTrackingInput;
  return -[AXSSMotionTrackingInput init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSSMotionTrackingInput)initWithCoder:(id)a3
{

  return 0;
}

- (BOOL)isCamera
{
  return 0;
}

- (BOOL)isVideoFile
{
  return 0;
}

- (BOOL)isHIDDevice
{
  return 0;
}

- (BOOL)supportsExpressions
{
  return 0;
}

- (BOOL)supportsLookAtPoint
{
  return -[AXSSMotionTrackingInput trackingType](self, "trackingType") != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  -[AXSSMotionTrackingInput plistDictionary](self, "plistDictionary", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXSSMotionTrackingInput motionTrackingInputFromPlistDictionary:](AXSSMotionTrackingInput, "motionTrackingInputFromPlistDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqualToMotionTrackingInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXSSMotionTrackingInput plistDictionary](self, "plistDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plistDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AXSSMotionTrackingInput plistDictionary](self, "plistDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[AXSSMotionTrackingInput isEqualToMotionTrackingInput:](self, "isEqualToMotionTrackingInput:", v4);

  return v5;
}

- (NSDictionary)plistDictionary
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("motionTrackingInputClass"));
  v5 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v5;
}

+ (id)motionTrackingInputFromPlistDictionary:(id)a3
{
  id v3;
  NSString *v4;
  objc_class *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("motionTrackingInputClass"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = NSClassFromString(v4),
        -[objc_class isSubclassOfClass:](v5, "isSubclassOfClass:", objc_opt_class())))
  {
    v6 = (void *)objc_msgSend([v5 alloc], "initWithPlistDictionary:", v3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (AXSSMotionTrackingInput)initWithPlistDictionary:(id)a3
{

  return 0;
}

@end
