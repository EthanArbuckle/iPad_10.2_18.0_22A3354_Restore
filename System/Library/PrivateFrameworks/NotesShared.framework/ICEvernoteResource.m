@implementation ICEvernoteResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICEvernoteResource)initWithCoder:(id)a3
{
  id v4;
  ICEvernoteResource *v5;
  uint64_t v6;
  NSString *mime;
  uint64_t v8;
  NSString *fileName;
  uint64_t v10;
  NSData *data;
  uint64_t v12;
  NSString *md5Hash;
  float v14;
  float v15;
  double v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICEvernoteResource;
  v5 = -[ICEvernoteResource init](&v18, sel_init);
  if (v5)
  {
    v5->_isAttachment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAttachment"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mime"));
    v6 = objc_claimAutoreleasedReturnValue();
    mime = v5->_mime;
    v5->_mime = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileName"));
    v8 = objc_claimAutoreleasedReturnValue();
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v10 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("md5Hash"));
    v12 = objc_claimAutoreleasedReturnValue();
    md5Hash = v5->_md5Hash;
    v5->_md5Hash = (NSString *)v12;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("imageWidth"));
    v5->_imageWidth = v14;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("imageHeight"));
    v5->_imageHeight = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_duration = v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "encodeBool:forKey:", -[ICEvernoteResource isAttachment](self, "isAttachment"), CFSTR("isAttachment"));
  -[ICEvernoteResource mime](self, "mime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("mime"));

  -[ICEvernoteResource fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("fileName"));

  -[ICEvernoteResource data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("data"));

  -[ICEvernoteResource md5Hash](self, "md5Hash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("md5Hash"));

  -[ICEvernoteResource imageWidth](self, "imageWidth");
  *(float *)&v8 = v8;
  objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("imageWidth"), v8);
  -[ICEvernoteResource imageHeight](self, "imageHeight");
  *(float *)&v9 = v9;
  objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("imageHeight"), v9);
  -[ICEvernoteResource duration](self, "duration");
  *(float *)&v10 = v10;
  objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("duration"), v10);

}

- (BOOL)isAttachment
{
  return self->_isAttachment;
}

- (void)setIsAttachment:(BOOL)a3
{
  self->_isAttachment = a3;
}

- (NSString)mime
{
  return self->_mime;
}

- (void)setMime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)md5Hash
{
  return self->_md5Hash;
}

- (void)setMd5Hash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(double)a3
{
  self->_imageWidth = a3;
}

- (double)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(double)a3
{
  self->_imageHeight = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_md5Hash, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_mime, 0);
}

@end
