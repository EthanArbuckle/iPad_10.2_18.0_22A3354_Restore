@implementation IXPromisedOutOfBandStreamingZipTransferSeed

- (IXPromisedOutOfBandStreamingZipTransferSeed)initWithCoder:(id)a3
{
  id v4;
  IXPromisedOutOfBandStreamingZipTransferSeed *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *extractionPath;
  uint64_t v10;
  NSDictionary *szOptions;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IXPromisedOutOfBandStreamingZipTransferSeed;
  v5 = -[IXOpaqueDataPromiseSeed initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archiveBytesConsumed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_archiveBytesConsumed = objc_msgSend(v6, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archiveSizeBytes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_archiveSizeBytes = objc_msgSend(v7, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extractionPath"));
    v8 = objc_claimAutoreleasedReturnValue();
    extractionPath = v5->_extractionPath;
    v5->_extractionPath = (NSURL *)v8;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("szOptions"));
    v10 = objc_claimAutoreleasedReturnValue();
    szOptions = v5->_szOptions;
    v5->_szOptions = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IXPromisedOutOfBandStreamingZipTransferSeed;
  v4 = a3;
  -[IXOpaqueDataPromiseSeed encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[IXPromisedOutOfBandStreamingZipTransferSeed archiveBytesConsumed](self, "archiveBytesConsumed", v9.receiver, v9.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("archiveBytesConsumed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[IXPromisedOutOfBandStreamingZipTransferSeed archiveSizeBytes](self, "archiveSizeBytes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("archiveSizeBytes"));

  -[IXPromisedOutOfBandStreamingZipTransferSeed extractionPath](self, "extractionPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("extractionPath"));

  -[IXPromisedOutOfBandStreamingZipTransferSeed szOptions](self, "szOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("szOptions"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IXPromisedOutOfBandStreamingZipTransferSeed;
  v4 = -[IXOpaqueDataPromiseSeed copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setArchiveBytesConsumed:", -[IXPromisedOutOfBandStreamingZipTransferSeed archiveBytesConsumed](self, "archiveBytesConsumed"));
  objc_msgSend(v4, "setArchiveSizeBytes:", -[IXPromisedOutOfBandStreamingZipTransferSeed archiveSizeBytes](self, "archiveSizeBytes"));
  -[IXPromisedOutOfBandStreamingZipTransferSeed extractionPath](self, "extractionPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtractionPath:", v5);

  -[IXPromisedOutOfBandStreamingZipTransferSeed szOptions](self, "szOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSzOptions:", v6);

  return v4;
}

- (Class)clientPromiseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)archiveBytesConsumed
{
  return self->_archiveBytesConsumed;
}

- (void)setArchiveBytesConsumed:(unint64_t)a3
{
  self->_archiveBytesConsumed = a3;
}

- (unint64_t)archiveSizeBytes
{
  return self->_archiveSizeBytes;
}

- (void)setArchiveSizeBytes:(unint64_t)a3
{
  self->_archiveSizeBytes = a3;
}

- (NSURL)extractionPath
{
  return self->_extractionPath;
}

- (void)setExtractionPath:(id)a3
{
  objc_storeStrong((id *)&self->_extractionPath, a3);
}

- (NSDictionary)szOptions
{
  return self->_szOptions;
}

- (void)setSzOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_szOptions, 0);
  objc_storeStrong((id *)&self->_extractionPath, 0);
}

@end
