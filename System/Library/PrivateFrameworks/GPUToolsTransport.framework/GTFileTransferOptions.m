@implementation GTFileTransferOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTFileTransferOptions)init
{
  GTFileTransferOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTFileTransferOptions;
  result = -[GTFileTransferOptions init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_chunkSize = xmmword_22D0CE120;
  return result;
}

- (GTFileTransferOptions)initWithCoder:(id)a3
{
  id v4;
  GTFileTransferOptions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GTFileTransferOptions;
  v5 = -[GTFileTransferOptions init](&v7, sel_init);
  if (v5)
  {
    v5->_chunkSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("chunkSize"));
    v5->_compressionAlgorithm = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("compressionAlgorithm"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t chunkSize;
  id v5;

  chunkSize = self->_chunkSize;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", chunkSize, CFSTR("chunkSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_compressionAlgorithm, CFSTR("compressionAlgorithm"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setChunkSize:", self->_chunkSize);
  objc_msgSend(v4, "setCompressionAlgorithm:", self->_compressionAlgorithm);
  return v4;
}

- (unint64_t)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(unint64_t)a3
{
  self->_chunkSize = a3;
}

- (int64_t)compressionAlgorithm
{
  return self->_compressionAlgorithm;
}

- (void)setCompressionAlgorithm:(int64_t)a3
{
  self->_compressionAlgorithm = a3;
}

@end
