@implementation GEOETAUpdateableWillSendRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOETAUpdateableWillSendRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  GEOETAUpdateableWillSendRequest *v4;
  GEOETAUpdateableWillSendRequest *v5;
  GEOETAUpdateableWillSendRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOETAUpdateableWillSendRequest;
  v4 = -[GEOXPCRequest initWithXPCDictionary:error:](&v8, sel_initWithXPCDictionary_error_, a3, a4);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (void)encodeToXPCDictionary:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GEOETAUpdateableWillSendRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v3, sel_encodeToXPCDictionary_, a3);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

@end
