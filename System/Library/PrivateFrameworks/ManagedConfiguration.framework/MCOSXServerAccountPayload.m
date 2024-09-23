@implementation MCOSXServerAccountPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.osxserver.account"));
}

- (MCOSXServerAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCOSXServerAccountPayload;
  return -[MCPayload initWithDictionary:profile:outError:](&v6, sel_initWithDictionary_profile_outError_, a3, a4, a5);
}

@end
