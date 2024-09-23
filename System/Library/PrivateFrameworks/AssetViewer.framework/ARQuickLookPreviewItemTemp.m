@implementation ARQuickLookPreviewItemTemp

- (ARQuickLookPreviewItemTemp)initWithFileAtURL:(id)a3
{
  id v5;
  ARQuickLookPreviewItemTemp *v6;
  ARQuickLookPreviewItemTemp *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARQuickLookPreviewItemTemp;
  v6 = -[ARQuickLookPreviewItem initWithFileAtURL:](&v9, sel_initWithFileAtURL_, v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_myPreviewURL, a3);

  return v7;
}

- (NSURL)previewItemURL
{
  return self->_myPreviewURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myPreviewURL, 0);
}

@end
