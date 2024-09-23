@implementation VNImageFingerprintsObservation

- (VNImageFingerprintsObservation)initWithOriginatingRequestSpecifier:(id)a3 fingerprintHashes:(id)a4
{
  id v6;
  VNImageFingerprintsObservation *v7;
  uint64_t v8;
  NSArray *fingerprintHashes;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNImageFingerprintsObservation;
  v7 = -[VNObservation initWithOriginatingRequestSpecifier:](&v11, sel_initWithOriginatingRequestSpecifier_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    fingerprintHashes = v7->_fingerprintHashes;
    v7->_fingerprintHashes = (NSArray *)v8;

  }
  return v7;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_fingerprintHashes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  VNImageFingerprintsObservation *v4;
  VNImageFingerprintsObservation *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (VNImageFingerprintsObservation *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNImageFingerprintsObservation fingerprintHashes](self, "fingerprintHashes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageFingerprintsObservation fingerprintHashes](v5, "fingerprintHashes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToArray:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNImageFingerprintsObservation;
  v4 = a3;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fingerprintHashes, CFSTR("hashes"), v5.receiver, v5.super_class);

}

- (VNImageFingerprintsObservation)initWithCoder:(id)a3
{
  id v4;
  VNImageFingerprintsObservation *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *fingerprintHashes;
  VNImageFingerprintsObservation *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNImageFingerprintsObservation;
  v5 = -[VNObservation initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_3;
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("hashes"));
  v9 = objc_claimAutoreleasedReturnValue();
  fingerprintHashes = v5->_fingerprintHashes;
  v5->_fingerprintHashes = (NSArray *)v9;

  if (!v5->_fingerprintHashes)
    v11 = 0;
  else
LABEL_3:
    v11 = v5;

  return v11;
}

- (NSArray)fingerprintHashes
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprintHashes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
