@implementation SHReferenceSignature

- (SHReferenceSignature)initWithID:(id)a3 trackID:(unint64_t)a4 signature:(id)a5
{
  id v9;
  id v10;
  SHReferenceSignature *v11;
  SHReferenceSignature *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SHReferenceSignature;
  v11 = -[SHReferenceSignature init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ID, a3);
    v12->_trackID = a4;
    objc_storeStrong((id *)&v12->_signature, a5);
  }

  return v12;
}

- (NSString)ID
{
  return self->_ID;
}

- (unint64_t)trackID
{
  return self->_trackID;
}

- (SHSignature)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end
