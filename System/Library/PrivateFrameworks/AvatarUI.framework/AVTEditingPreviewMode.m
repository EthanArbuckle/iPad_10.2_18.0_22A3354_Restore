@implementation AVTEditingPreviewMode

+ (id)defaultPreviewMode
{
  AVTEditingPreviewMode *v2;
  void *v3;
  AVTEditingPreviewMode *v4;

  v2 = [AVTEditingPreviewMode alloc];
  +[AVTEditingPreviewModeOptions defaultOptions](AVTEditingPreviewModeOptions, "defaultOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AVTEditingPreviewMode initWithType:options:](v2, "initWithType:options:", 0, v3);

  return v4;
}

+ (unint64_t)previewModeTypeForString:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("body"));
}

+ (id)stringForPreviewModeType:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("body");
  else
    return CFSTR("default");
}

- (AVTEditingPreviewMode)initWithType:(unint64_t)a3 options:(id)a4
{
  id v7;
  AVTEditingPreviewMode *v8;
  AVTEditingPreviewMode *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AVTEditingPreviewMode;
  v8 = -[AVTEditingPreviewMode init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTEditingPreviewMode;
  -[AVTEditingPreviewMode description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "stringForPreviewModeType:", -[AVTEditingPreviewMode type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" type: %@\n"), v5);

  -[AVTEditingPreviewMode options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" options: %@\n"), v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (AVTEditingPreviewModeOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
