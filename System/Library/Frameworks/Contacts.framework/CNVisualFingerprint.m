@implementation CNVisualFingerprint

- (CNVisualFingerprint)initWithVNFingerprintHashes:(id)a3
{
  void *v4;
  CNVisualFingerprint *v5;

  objc_msgSend(a3, "_cn_map:", &__block_literal_global_38);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNVisualFingerprint initWithHashData:](self, "initWithHashData:", v4);

  return v5;
}

uint64_t __51__CNVisualFingerprint_initWithVNFingerprintHashes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hashData");
}

- (CNVisualFingerprint)initWithHashData:(id)a3
{
  id v4;
  CNVisualFingerprint *v5;
  uint64_t v6;
  NSArray *hashData;
  CNVisualFingerprint *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVisualFingerprint;
  v5 = -[CNVisualFingerprint init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    hashData = v5->_hashData;
    v5->_hashData = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CNVisualFingerprint *v4;
  NSArray *hashData;
  BOOL v6;

  v4 = (CNVisualFingerprint *)a3;
  v6 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (hashData = self->_hashData, (unint64_t)hashData | (unint64_t)v4->_hashData)
      && !-[NSArray isEqual:](hashData, "isEqual:"))
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_hashData, CFSTR("hashData"));
}

- (CNVisualFingerprint)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CNVisualFingerprint *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("hashData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 2)
  {
    self = -[CNVisualFingerprint initWithHashData:](self, "initWithHashData:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)fingerprintFromArchive:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, 0);

  objc_msgSend(v5, "setRequiresSecureCoding:", 1);
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hashData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishDecoding");

  return v6;
}

+ (id)archiveWithFingerprint:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB36F8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("hashData"));

  objc_msgSend(v5, "finishEncoding");
  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)hashData
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashData, 0);
}

@end
