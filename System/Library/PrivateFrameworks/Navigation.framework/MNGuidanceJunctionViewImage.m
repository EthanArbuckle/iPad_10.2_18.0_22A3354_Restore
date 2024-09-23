@implementation MNGuidanceJunctionViewImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNGuidanceJunctionViewImage)initWithCoder:(id)a3
{
  id v4;
  MNGuidanceJunctionViewImage *v5;
  uint64_t v6;
  NSData *imageData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MNGuidanceJunctionViewImage;
  v5 = -[MNGuidanceJunctionViewImage init](&v9, sel_init);
  if (v5)
  {
    v5->_imageID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_imageID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imageData"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t imageID;
  id v5;

  imageID = self->_imageID;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", imageID, CFSTR("_imageID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageData, CFSTR("_imageData"));

}

- (void)setImageID:(unint64_t)a3
{
  self->_imageID = a3;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (unint64_t)imageID
{
  return self->_imageID;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
