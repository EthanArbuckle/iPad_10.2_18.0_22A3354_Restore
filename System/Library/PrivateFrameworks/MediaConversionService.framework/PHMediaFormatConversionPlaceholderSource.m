@implementation PHMediaFormatConversionPlaceholderSource

- (PHMediaFormatConversionPlaceholderSource)initWithFileType:(id)a3 mediaType:(int64_t)a4
{
  id v7;
  PHMediaFormatConversionPlaceholderSource *v8;
  void *v10;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHMediaFormatConversionPlaceholderSource;
  v8 = -[PHMediaFormatConversionPlaceholderSource init](&v11, sel_init);
  if (v8)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("PHMediaFormatConversion.m"), 469, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileType"));

    }
    -[PHMediaFormatConversionPlaceholderSource setFileType:](v8, "setFileType:", v7);
    -[PHMediaFormatConversionContent setMediaType:](v8, "setMediaType:", a4);
  }

  return v8;
}

- (id)fileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0CEC3F8];
  -[PHMediaFormatConversionPlaceholderSource fileType](self, "fileType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredFilenameExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(CFSTR("IMG_0001"), "stringByAppendingPathExtension:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:isDirectory:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)length
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ does not support %@"), v6, v7);

  return 0;
}

- (CGSize)imageDimensions
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  CGSize result;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ does not support %@"), v6, v7);

  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v9;
  result.width = v8;
  return result;
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void)setFileType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileType, 0);
}

+ (id)imageSourceForFileType:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFileType:mediaType:", v4, 2);

  return v5;
}

+ (id)videoSourceForFileType:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFileType:mediaType:", v4, 1);

  return v5;
}

@end
