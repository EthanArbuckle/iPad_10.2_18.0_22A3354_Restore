@implementation JPSignatureVerifier

- (void)dealloc
{
  objc_super v3;

  if (-[JPSignatureVerifier releaseBackingOnDealloc](self, "releaseBackingOnDealloc"))
    JetPackSignatureVerifierDestroy((uint64_t)-[JPSignatureVerifier backing](self, "backing"));
  v3.receiver = self;
  v3.super_class = (Class)JPSignatureVerifier;
  -[JPSignatureVerifier dealloc](&v3, sel_dealloc);
}

- (BOOL)releaseBackingOnDealloc
{
  return self->_releaseBackingOnDealloc;
}

- (JetPackSignatureVerifier)backing
{
  return self->_backing;
}

+ (id)defaultSignatureVerifier
{
  return -[JPSignatureVerifier initWithBacking:releaseOnDealloc:]([JPSignatureVerifier alloc], "initWithBacking:releaseOnDealloc:", JetPackSignatureVerifierCreateDefault(), 1);
}

- (JPSignatureVerifier)initWithBacking:(JetPackSignatureVerifier *)a3 releaseOnDealloc:(BOOL)a4
{
  JPSignatureVerifier *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JPSignatureVerifier;
  result = -[JPSignatureVerifier init](&v7, sel_init);
  if (result)
  {
    result->_backing = a3;
    result->_releaseBackingOnDealloc = a4;
  }
  return result;
}

+ (id)unsafeIgnoreSignatureVerifier
{
  return -[JPSignatureVerifier initWithBacking:releaseOnDealloc:]([JPSignatureVerifier alloc], "initWithBacking:releaseOnDealloc:", JetPackSignatureVerifierCreateUnsafeIgnoreSignatureVerifier(a1, a2), 1);
}

+ (id)signatureVerifierWithCertificate:(id)a3
{
  id v3;
  const void *v4;
  size_t v5;

  v3 = objc_retainAutorelease(a3);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  return -[JPSignatureVerifier initWithBacking:releaseOnDealloc:]([JPSignatureVerifier alloc], "initWithBacking:releaseOnDealloc:", JetPackSignatureVerifierCreateWithCertificateData(v4, v5), 1);
}

- (void)setBacking:(JetPackSignatureVerifier *)a3
{
  self->_backing = a3;
}

@end
