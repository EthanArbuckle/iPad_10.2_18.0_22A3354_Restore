@implementation AVTEditingPreviewModeOptions

+ (id)defaultOptions
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithFramingMode:bodyPosePack:", *MEMORY[0x1E0D005C8], 0);
}

- (AVTEditingPreviewModeOptions)initWithFramingMode:(id)a3 bodyPosePack:(id)a4
{
  id v7;
  id v8;
  AVTEditingPreviewModeOptions *v9;
  AVTEditingPreviewModeOptions *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTEditingPreviewModeOptions;
  v9 = -[AVTEditingPreviewModeOptions init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_framingMode, a3);
    objc_storeStrong((id *)&v10->_bodyPosePack, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTEditingPreviewModeOptions;
  -[AVTEditingPreviewModeOptions description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTEditingPreviewModeOptions framingMode](self, "framingMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" framingMode: %@\n"), v5);

  -[AVTEditingPreviewModeOptions bodyPosePack](self, "bodyPosePack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AVTEditingPreviewModeOptions bodyPosePack](self, "bodyPosePack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" posePack:%@\n"), v7);

  }
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (NSString)framingMode
{
  return self->_framingMode;
}

- (NSString)bodyPosePack
{
  return self->_bodyPosePack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyPosePack, 0);
  objc_storeStrong((id *)&self->_framingMode, 0);
}

@end
