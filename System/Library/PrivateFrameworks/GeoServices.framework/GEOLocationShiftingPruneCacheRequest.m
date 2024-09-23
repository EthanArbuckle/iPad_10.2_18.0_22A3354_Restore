@implementation GEOLocationShiftingPruneCacheRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOLocationShiftingPruneCacheRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("locationshift.pruneDiskCache"), a3, a4, a5);
}

- (GEOLocationShiftingPruneCacheRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  GEOLocationShiftingPruneCacheRequest *v4;
  GEOLocationShiftingPruneCacheRequest *v5;
  GEOLocationShiftingPruneCacheRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOLocationShiftingPruneCacheRequest;
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
  v3.super_class = (Class)GEOLocationShiftingPruneCacheRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v3, sel_encodeToXPCDictionary_, a3);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

@end
