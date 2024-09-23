@implementation IXPromisedStreamingZipTransferSeed

- (IXPromisedStreamingZipTransferSeed)initWithCoder:(id)a3
{
  id v4;
  IXPromisedStreamingZipTransferSeed *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *szOptions;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IXPromisedStreamingZipTransferSeed;
  v5 = -[IXOwnedDataPromiseSeed initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archiveBytesConsumed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_archiveBytesConsumed = objc_msgSend(v6, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archiveSizeBytes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_archiveSizeBytes = objc_msgSend(v7, "unsignedLongLongValue");

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("szOptions"));
    v8 = objc_claimAutoreleasedReturnValue();
    szOptions = v5->_szOptions;
    v5->_szOptions = (NSDictionary *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IXPromisedStreamingZipTransferSeed;
  v4 = a3;
  -[IXOwnedDataPromiseSeed encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[IXPromisedStreamingZipTransferSeed archiveBytesConsumed](self, "archiveBytesConsumed", v8.receiver, v8.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("archiveBytesConsumed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[IXPromisedStreamingZipTransferSeed archiveSizeBytes](self, "archiveSizeBytes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("archiveSizeBytes"));

  -[IXPromisedStreamingZipTransferSeed szOptions](self, "szOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("szOptions"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IXPromisedStreamingZipTransferSeed;
  v4 = -[IXOwnedDataPromiseSeed copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setArchiveBytesConsumed:", -[IXPromisedStreamingZipTransferSeed archiveBytesConsumed](self, "archiveBytesConsumed"));
  objc_msgSend(v4, "setArchiveSizeBytes:", -[IXPromisedStreamingZipTransferSeed archiveSizeBytes](self, "archiveSizeBytes"));
  -[IXPromisedStreamingZipTransferSeed szOptions](self, "szOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSzOptions:", v5);

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

- (NSDictionary)szOptions
{
  return self->_szOptions;
}

- (void)setSzOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_szOptions, 0);
}

@end
