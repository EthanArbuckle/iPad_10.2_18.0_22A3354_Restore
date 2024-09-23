@implementation MPArtworkColorAnalysisOperation

- (MPArtworkColorAnalysisOperation)initWithURL:(id)a3
{
  id v5;
  MPArtworkColorAnalysisOperation *v6;
  MPArtworkColorAnalysisOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPArtworkColorAnalysisOperation;
  v6 = -[MPArtworkColorAnalysisOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sourceURL, a3);

  return v7;
}

- (MSVArtworkColorAnalysis)colorAnalysis
{
  return self->_colorAnalysis;
}

- (NSError)error
{
  return self->_error;
}

- (void)main
{
  CGImageSource *v3;
  CGImageSource *v4;
  CGImage *v5;
  void *v6;
  void *v7;
  MSVArtworkColorAnalysis *v8;
  void *colorAnalysis;
  NSError *v10;
  NSError *error;
  NSError *v12;
  NSError *v13;

  v3 = -[MPArtworkColorAnalysisOperation _createImageFromURL:](self, "_createImageFromURL:", self->_sourceURL);
  if (v3)
  {
    v4 = v3;
    v5 = -[MPArtworkColorAnalysisOperation _createImageFromSource:size:](self, "_createImageFromSource:size:", v3, 0);
    v13 = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D000]), "initWithSourceImage:", v5);
    -[NSError analyze](v13, "analyze");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
      colorAnalysis = self->_colorAnalysis;
      self->_colorAnalysis = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPArtworkColorAnalysisErrorDomain"), 1, 0);
      v12 = (NSError *)objc_claimAutoreleasedReturnValue();
      colorAnalysis = self->_error;
      self->_error = v12;
    }

    if (v5)
      CFRelease(v5);
    CFRelease(v4);

    error = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPArtworkColorAnalysisErrorDomain"), 0, 0);
    v10 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v10;
  }

}

- (CGImageSource)_createImageFromURL:(id)a3
{
  const __CFURL *v3;
  void *v4;
  void *v5;
  int v6;
  CGImageSource *v7;

  v3 = (const __CFURL *)a3;
  if (v3
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        -[__CFURL path](v3, "path"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "fileExistsAtPath:", v5),
        v5,
        v4,
        v6))
  {
    v7 = CGImageSourceCreateWithURL(v3, 0);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CGImage)_createImageFromSource:(CGImageSource *)a3 size:(unint64_t)a4
{
  const __CFDictionary *v6;
  CGImage *ImageAtIndex;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CBD240];
  v10[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, a4, v6);

  return ImageAtIndex;
}

- (void)cancel
{
  NSError *v3;
  NSError *error;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPArtworkColorAnalysisErrorDomain"), 2, 0);
  v3 = (NSError *)objc_claimAutoreleasedReturnValue();
  error = self->_error;
  self->_error = v3;

  v5.receiver = self;
  v5.super_class = (Class)MPArtworkColorAnalysisOperation;
  -[MPArtworkColorAnalysisOperation cancel](&v5, sel_cancel);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_colorAnalysis, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

@end
