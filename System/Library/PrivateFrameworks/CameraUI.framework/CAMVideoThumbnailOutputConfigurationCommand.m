@implementation CAMVideoThumbnailOutputConfigurationCommand

- (CAMVideoThumbnailOutputConfigurationCommand)initWithConfiguration:(id)a3
{
  id v5;
  CAMVideoThumbnailOutputConfigurationCommand *v6;
  CAMVideoThumbnailOutputConfigurationCommand *v7;
  CAMVideoThumbnailOutputConfigurationCommand *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMVideoThumbnailOutputConfigurationCommand;
  v6 = -[CAMCaptureCommand init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "currentVideoThumbnailOutput");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CAMVideoThumbnailOutputConfigurationCommand configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnailSize");
    objc_msgSend(v6, "setThumbnailSize:");
    objc_msgSend(v4, "filters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v5);

  }
}

- (CAMVideoThumbnailOutputConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (CAMVideoThumbnailOutputConfigurationCommand)initWithCoder:(id)a3
{
  id v4;
  CAMVideoThumbnailOutputConfigurationCommand *v5;
  uint64_t v6;
  CAMVideoThumbnailOutputConfiguration *configuration;
  CAMVideoThumbnailOutputConfigurationCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMVideoThumbnailOutputConfigurationCommand;
  v5 = -[CAMCaptureCommand init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMVideoThumbnailOutputConfigurationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (CAMVideoThumbnailOutputConfiguration *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoThumbnailOutputConfigurationCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CAMVideoThumbnailOutputConfigurationCommand configuration](self, "configuration", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAMVideoThumbnailOutputConfigurationKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMVideoThumbnailOutputConfigurationCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[CAMVideoThumbnailOutputConfigurationCommand configuration](self, "configuration");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

@end
