@implementation GTBulkDataUploadDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTBulkDataUploadDescriptor)initWithCoder:(id)a3
{
  id v4;
  GTBulkDataUploadDescriptor *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GTBulkDataUploadDescriptor;
  v5 = -[GTBulkDataUploadDescriptor init](&v7, sel_init);
  if (v5)
  {
    v5->_sizeHint = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sizeHint"));
    v5->_compressionAlgorithm = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("compressionAlgorithm"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sizeHint;
  id v5;

  sizeHint = self->_sizeHint;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", sizeHint, CFSTR("sizeHint"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_compressionAlgorithm, CFSTR("compressionAlgorithm"));

}

- (unint64_t)sizeHint
{
  return self->_sizeHint;
}

- (void)setSizeHint:(unint64_t)a3
{
  self->_sizeHint = a3;
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
