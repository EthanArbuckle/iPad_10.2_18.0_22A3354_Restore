@implementation SecConcrete_sec_certificate

- (void)dealloc
{
  __SecCertificate *certificate;
  objc_super v4;

  certificate = self->certificate;
  if (certificate)
  {
    CFRelease(certificate);
    self->certificate = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SecConcrete_sec_certificate;
  -[SecConcrete_sec_certificate dealloc](&v4, sel_dealloc);
}

- (SecConcrete_sec_certificate)initWithCertificate:(__SecCertificate *)a3
{
  SecConcrete_sec_certificate *v3;
  SecConcrete_sec_certificate *v4;
  objc_super v6;

  v3 = (SecConcrete_sec_certificate *)a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SecConcrete_sec_certificate;
    self = -[SecConcrete_sec_certificate init](&v6, sel_init);
    if (self)
    {
      v4 = self;
      CFRetain(v3);
      v4->certificate = (__SecCertificate *)v3;
      self = v4;
      v3 = self;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

@end
