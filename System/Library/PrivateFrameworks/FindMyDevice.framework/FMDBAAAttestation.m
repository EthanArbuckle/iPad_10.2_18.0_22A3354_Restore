@implementation FMDBAAAttestation

- (FMDBAAAttestation)initWithAttestation:(id)a3 signature:(id)a4
{
  id v6;
  id v7;
  FMDBAAAttestation *v8;
  FMDBAAAttestation *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDBAAAttestation;
  v8 = -[FMDBAAAttestation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[FMDBAAAttestation setAttestation:](v8, "setAttestation:", v6);
    -[FMDBAAAttestation setSignature:](v9, "setSignature:", v7);
  }

  return v9;
}

- (FMDBAAAttestation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  FMDBAAAttestation *v11;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_attestation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_signature);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[FMDBAAAttestation initWithAttestation:signature:](self, "initWithAttestation:signature:", v7, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[FMDBAAAttestation attestation](self, "attestation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_attestation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[FMDBAAAttestation signature](self, "signature");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_signature);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)attestation
{
  return self->_attestation;
}

- (void)setAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_attestation, a3);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_attestation, 0);
}

@end
