@implementation CAMStartPanoramaCommand

- (CAMStartPanoramaCommand)initWithRequest:(id)a3
{
  id v5;
  CAMStartPanoramaCommand *v6;
  CAMStartPanoramaCommand *v7;
  CAMStartPanoramaCommand *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMStartPanoramaCommand;
  v6 = -[CAMCaptureCommand initWithSubcommands:](&v10, sel_initWithSubcommands_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__request, a3);
    v8 = v7;
  }

  return v7;
}

- (CAMStartPanoramaCommand)initWithCoder:(id)a3
{
  id v4;
  CAMStartPanoramaCommand *v5;
  uint64_t v6;
  CAMPanoramaCaptureRequest *request;
  CAMStartPanoramaCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMStartPanoramaCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMPanoramaCaptureCommandRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->__request;
    v5->__request = (CAMPanoramaCaptureRequest *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMStartPanoramaCommand _request](self, "_request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAMPanoramaCaptureCommandRequest"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMStartPanoramaCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[CAMStartPanoramaCommand _request](self, "_request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[3];
  v4[3] = v6;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMStartPanoramaCommand _request](self, "_request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startPanoramaCaptureWithRequest:", v5);

}

- (CAMPanoramaCaptureRequest)_request
{
  return self->__request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__request, 0);
}

@end
