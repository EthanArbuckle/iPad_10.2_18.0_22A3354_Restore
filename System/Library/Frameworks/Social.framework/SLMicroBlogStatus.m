@implementation SLMicroBlogStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SLMicroBlogStatus statusText](self, "statusText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("statusText"));

  -[SLMicroBlogStatus imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("imageData"));

  -[SLMicroBlogStatus imageAssetURLs](self, "imageAssetURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("imageAssetURLs"));

  -[SLMicroBlogStatus maskedApplicationID](self, "maskedApplicationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SLMicroBlogStatus maskedApplicationID](self, "maskedApplicationID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("maskedApplicationID"));

  }
  -[SLMicroBlogStatus inReplyToStatusID](self, "inReplyToStatusID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SLMicroBlogStatus inReplyToStatusID](self, "inReplyToStatusID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("inReplyToStatusID"));

  }
}

- (SLMicroBlogStatus)initWithCoder:(id)a3
{
  id v4;
  SLMicroBlogStatus *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SLMicroBlogStatus;
  v5 = -[SLMicroBlogStatus init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLMicroBlogStatus setStatusText:](v5, "setStatusText:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("imageData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLMicroBlogStatus setImageData:](v5, "setImageData:", v10);

    v11 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("imageAssetURLs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLMicroBlogStatus setImageAssetURLs:](v5, "setImageAssetURLs:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maskedApplicationID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLMicroBlogStatus setMaskedApplicationID:](v5, "setMaskedApplicationID:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inReplyToStatusID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLMicroBlogStatus setInReplyToStatusID:](v5, "setInReplyToStatusID:", v16);

  }
  return v5;
}

- (void)loadAssetDataIfNecessaryWithMaxByteSize:(unint64_t)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
  objc_storeStrong((id *)&self->_statusText, a3);
}

- (NSArray)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (NSArray)imageAssetURLs
{
  return self->_imageAssetURLs;
}

- (void)setImageAssetURLs:(id)a3
{
  objc_storeStrong((id *)&self->_imageAssetURLs, a3);
}

- (NSString)maskedApplicationID
{
  return self->_maskedApplicationID;
}

- (void)setMaskedApplicationID:(id)a3
{
  objc_storeStrong((id *)&self->_maskedApplicationID, a3);
}

- (NSString)inReplyToStatusID
{
  return self->_inReplyToStatusID;
}

- (void)setInReplyToStatusID:(id)a3
{
  objc_storeStrong((id *)&self->_inReplyToStatusID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inReplyToStatusID, 0);
  objc_storeStrong((id *)&self->_maskedApplicationID, 0);
  objc_storeStrong((id *)&self->_imageAssetURLs, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
}

@end
