@implementation _BlastDoorLPImage

- (_BlastDoorLPImage)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_BlastDoorLPImage;
  return -[_BlastDoorLPImage init](&v3, sel_init);
}

- (id)_initWithImage:(id)a3
{
  id *v4;
  NSData *v5;
  NSData *data;
  NSString *v7;
  NSString *MIMEType;
  _BlastDoorLPImageProperties *v9;
  _BlastDoorLPImageProperties *properties;
  _BlastDoorLPImage *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  if (v4
    && (v13.receiver = self,
        v13.super_class = (Class)_BlastDoorLPImage,
        (self = -[_BlastDoorLPImage init](&v13, sel_init)) != 0))
  {
    v5 = (NSData *)objc_msgSend(v4[1], "copy");
    data = self->_data;
    self->_data = v5;

    v7 = (NSString *)objc_msgSend(v4[2], "copy");
    MIMEType = self->_MIMEType;
    self->_MIMEType = v7;

    objc_storeStrong((id *)&self->_fileURL, v4[3]);
    v9 = (_BlastDoorLPImageProperties *)objc_msgSend(v4[4], "copy");
    properties = self->_properties;
    self->_properties = v9;

    self = self;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_initWithImage:(id)a3 properties:(id)a4
{
  id v7;
  id *v8;
  id *v9;
  id *v10;

  v7 = a4;
  v8 = -[_BlastDoorLPImage _initWithImage:](self, "_initWithImage:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 4, a4);
    v10 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPImage;
  if (-[_BlastDoorLPImage isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[1];
      if (v7 | (unint64_t)self->_data && !objc_msgSend((id)v7, "isEqual:")
        || (v8 = v6[2], v8 | (unint64_t)self->_MIMEType) && !objc_msgSend((id)v8, "isEqual:")
        || (v9 = v6[3], v9 | (unint64_t)self->_fileURL) && !objc_msgSend((id)v9, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v10 = v6[4];
        if (v10 | (unint64_t)self->_properties)
          v5 = objc_msgSend((id)v10, "isEqual:");
        else
          v5 = 1;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_data, "hash");
  return -[NSString hash](self->_MIMEType, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPImage)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPImage *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NSString *MIMEType;
  _BlastDoorLPImageProperties *v10;
  _BlastDoorLPImageProperties *properties;
  void *v12;
  void *v13;
  void *v14;
  _BlastDoorLPImage *v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_BlastDoorLPImage;
  v5 = -[_BlastDoorLPImage init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_bd_lp_strictlyDecodeNSDataForKey:", CFSTR("data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", CFSTR("MIMEType"));
    v8 = objc_claimAutoreleasedReturnValue();
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v8;

    v10 = objc_alloc_init(_BlastDoorLPImageProperties);
    properties = v5->_properties;
    v5->_properties = v10;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", CFSTR("accessibilityText"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPImageProperties setAccessibilityText:](v5->_properties, "setAccessibilityText:", v12);

    objc_msgSend(v4, "_bd_lp_strictlyDecodeColorForKey:", CFSTR("overlaidTextColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPImageProperties setOverlaidTextColor:](v5->_properties, "setOverlaidTextColor:", v13);

    objc_msgSend(v4, "_bd_lp_strictlyDecodeColorForKey:", CFSTR("dominantColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPImageProperties setDominantColor:](v5->_properties, "setDominantColor:", v14);

    -[_BlastDoorLPImageProperties setType:](v5->_properties, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("imageType")));
    if (-[_BlastDoorLPImageProperties type](v5->_properties, "type") >= 7)
      -[_BlastDoorLPImageProperties setType:](v5->_properties, "setType:", 0);
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_BlastDoorLPImage _shouldEncodeData](self, "_shouldEncodeData"))
    objc_msgSend(v7, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v7, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_MIMEType, CFSTR("MIMEType"));
  -[_BlastDoorLPImageProperties accessibilityText](self->_properties, "accessibilityText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("accessibilityText"));

  -[_BlastDoorLPImageProperties overlaidTextColor](self->_properties, "overlaidTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_bd_lp_encodeColorIfNotNil:forKey:", v5, CFSTR("overlaidTextColor"));

  -[_BlastDoorLPImageProperties dominantColor](self->_properties, "dominantColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_bd_lp_encodeColorIfNotNil:forKey:", v6, CFSTR("dominantColor"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[_BlastDoorLPImageProperties type](self->_properties, "type"), CFSTR("imageType"));
}

- (_BlastDoorLPImageProperties)properties
{
  return (_BlastDoorLPImageProperties *)(id)-[_BlastDoorLPImageProperties copy](self->_properties, "copy");
}

- (unint64_t)_encodedSize
{
  void *v2;
  unint64_t v3;

  -[_BlastDoorLPImage data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (BOOL)_shouldEncodeData
{
  return 1;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (void)setMIMEType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
