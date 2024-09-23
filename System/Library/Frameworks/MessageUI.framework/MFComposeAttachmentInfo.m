@implementation MFComposeAttachmentInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MFComposeAttachmentInfo)initWithURL:(id)a3 filename:(id)a4 isBasicImage:(BOOL)a5 isDisplayableImage:(BOOL)a6 className:(id)a7
{
  id v12;
  id v13;
  id v14;
  MFComposeAttachmentInfo *v15;
  MFComposeAttachmentInfo *v16;
  uint64_t v17;
  NSString *className;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MFComposeAttachmentInfo;
  v15 = -[MSAttachmentInfo initWithURL:filename:](&v20, sel_initWithURL_filename_, v12, v13);
  v16 = v15;
  if (v15)
  {
    v15->_isBasicImage = a5;
    v15->_isDisplayableImage = a6;
    v17 = objc_msgSend(v14, "copy");
    className = v16->_className;
    v16->_className = (NSString *)v17;

  }
  return v16;
}

- (MFComposeAttachmentInfo)initWithCoder:(id)a3
{
  id v4;
  MFComposeAttachmentInfo *v5;
  uint64_t v6;
  NSString *className;
  MFComposeAttachmentInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFComposeAttachmentInfo;
  v5 = -[MSAttachmentInfo initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    goto LABEL_5;
  v5->_isBasicImage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsBasicImage"));
  v5->_isDisplayableImage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsDisplayableImage"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClassName"));
  v6 = objc_claimAutoreleasedReturnValue();
  className = v5->_className;
  v5->_className = (NSString *)v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
LABEL_4:
    v8 = v5;
  else
LABEL_5:
    v8 = 0;

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeAttachmentInfo;
  -[MSAttachmentInfo encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isBasicImage, CFSTR("IsBasicImage"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isDisplayableImage, CFSTR("IsDisplayableImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_className, CFSTR("ClassName"));

}

- (BOOL)isBasicImage
{
  return self->_isBasicImage;
}

- (BOOL)isDisplayableImage
{
  return self->_isDisplayableImage;
}

- (NSString)className
{
  return self->_className;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_className, 0);
}

@end
