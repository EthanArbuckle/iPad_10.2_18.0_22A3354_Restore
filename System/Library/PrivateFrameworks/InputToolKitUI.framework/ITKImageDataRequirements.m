@implementation ITKImageDataRequirements

+ (ITKImageDataRequirements)stickerRequirements
{
  ITKImageDataRequirements *v2;
  void *v3;

  v2 = objc_alloc_init(ITKImageDataRequirements);
  objc_msgSend((id)*MEMORY[0x24BDF83E8], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ITKImageDataRequirements setUti:](v2, "setUti:", v3);

  -[ITKImageDataRequirements setMaxLength:](v2, "setMaxLength:", 900);
  -[ITKImageDataRequirements setMinLength:](v2, "setMinLength:", 300);
  -[ITKImageDataRequirements setMaxDataLength:](v2, "setMaxDataLength:", 500000);
  return v2;
}

+ (ITKImageDataRequirements)stickerThumbnailRequirements
{
  ITKImageDataRequirements *v2;
  void *v3;

  v2 = objc_alloc_init(ITKImageDataRequirements);
  objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ITKImageDataRequirements setUti:](v2, "setUti:", v3);

  -[ITKImageDataRequirements setMaxLength:](v2, "setMaxLength:", 100);
  -[ITKImageDataRequirements setMinLength:](v2, "setMinLength:", 50);
  -[ITKImageDataRequirements setMaxDataLength:](v2, "setMaxDataLength:", 500000);
  return v2;
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (unint64_t)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(unint64_t)a3
{
  self->_minLength = a3;
}

- (unint64_t)maxDataLength
{
  return self->_maxDataLength;
}

- (void)setMaxDataLength:(unint64_t)a3
{
  self->_maxDataLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uti, 0);
}

@end
