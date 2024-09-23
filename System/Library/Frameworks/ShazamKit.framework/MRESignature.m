@implementation MRESignature

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRESignature;
  -[MRESignature dealloc](&v3, sel_dealloc);
}

- (MRESignature)initWithSignatureData:(id)a3 trackID:(unint64_t)a4
{
  MRESignature *v6;
  NSData *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRESignature;
  v6 = -[MRESignature init](&v9, sel_init);
  if (v6)
  {
    v7 = (NSData *)a3;
    v6->_trackID = a4;
    v6->_signatureData = v7;
  }
  return v6;
}

- (unint64_t)trackID
{
  return self->_trackID;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

@end
