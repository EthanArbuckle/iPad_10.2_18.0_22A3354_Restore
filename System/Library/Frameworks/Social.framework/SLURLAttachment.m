@implementation SLURLAttachment

- (SLURLAttachment)initWithURL:(id)a3 previewImage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  SLURLAttachment *v9;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isMusicStoreURL") & 1) != 0)
  {
    v8 = 3;
  }
  else if (objc_msgSend(v6, "isAppStoreURL"))
  {
    v8 = 4;
  }
  else
  {
    v8 = 0;
  }
  v9 = -[SLURLAttachment initWithURL:ofType:preview:](self, "initWithURL:ofType:preview:", v6, v8, v7);

  return v9;
}

- (SLURLAttachment)initWithURL:(id)a3 ofType:(int64_t)a4 preview:(id)a5
{
  uint64_t v5;
  SLURLAttachment *v6;
  SLURLAttachment *v8;
  SLURLAttachment *v9;
  objc_super v11;

  v6 = self;
  if (a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)SLURLAttachment;
    v8 = -[SLAttachment initWithPayload:type:previewImage:](&v11, sel_initWithPayload_type_previewImage_);
    if (v8)
      v8->_urlType = a4;
    v6 = v8;
    v9 = v6;
  }
  else
  {
    _SLLog(v5, 3, CFSTR("SLURLAttachment must be created with a non-nil URL."));
    v9 = 0;
  }

  return v9;
}

- (int64_t)urlType
{
  return self->_urlType;
}

@end
