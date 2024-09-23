@implementation SSSScreenshotItemProviderPDFAsImage

- (SSSScreenshotItemProviderPDFAsImage)initWithScreenshot:(id)a3
{
  SSSScreenshotItemProviderPDFAsImage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSSScreenshotItemProviderPDFAsImage;
  v3 = -[SSSScreenshotItemProvider initWithScreenshot:](&v11, "initWithScreenshot:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider screenshot](v3, "screenshot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "PDFDocument"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pageAtIndex:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "thumbnailOfSize:forBox:", 1, 300.0, 300.0));
  -[SSSScreenshotItemProviderPDFAsImage setThumbnailImage:](v3, "setThumbnailImage:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider screenshot](v3, "screenshot"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pdfAsImage"));
  -[SSSScreenshotItemProviderPDFAsImage setPdfAsImage:](v3, "setPdfAsImage:", v9);

  return v3;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void **v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v5 = (void *)qword_1000AD7A0;
  v27 = qword_1000AD7A0;
  if (!qword_1000AD7A0)
  {
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_1000342F8;
    v22 = &unk_100091848;
    v23 = &v24;
    sub_1000342F8((uint64_t)&v19);
    v5 = (void *)v25[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v24, 8);
  v7 = objc_alloc_init(v6);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v8 = (void *)qword_1000AD7B0;
  v27 = qword_1000AD7B0;
  if (!qword_1000AD7B0)
  {
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_1000343F8;
    v22 = &unk_100091848;
    v23 = &v24;
    sub_1000343F8((uint64_t)&v19);
    v8 = (void *)v25[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v24, 8);
  v10 = objc_alloc_init(v9);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v11 = (void *)qword_1000AD7B8;
  v27 = qword_1000AD7B8;
  if (!qword_1000AD7B8)
  {
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_10003444C;
    v22 = &unk_100091848;
    v23 = &v24;
    sub_10003444C((uint64_t)&v19);
    v11 = (void *)v25[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v24, 8);
  v13 = [v12 alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProviderPDFAsImage thumbnailImage](self, "thumbnailImage"));
  v15 = objc_msgSend(v13, "initWithPlatformImage:", v14);
  objc_msgSend(v10, "setThumbnail:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider nameForScreenshot](self, "nameForScreenshot"));
  objc_msgSend(v10, "setName:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  objc_msgSend(v10, "setType:", v17);

  objc_msgSend(v7, "setSpecialization:", v10);
  return v7;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider nameForScreenshot](self, "nameForScreenshot", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("jpeg")));

  return v5;
}

- (id)activityViewController:(id)a3 thumbnailImageDataForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  return -[SSSScreenshotItemProviderPDFAsImage imageData](self, "imageData", a3, a4, a5.width, a5.height);
}

- (id)imageData
{
  UIImage *v2;
  NSData *v3;
  void *v4;

  v2 = (UIImage *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProviderPDFAsImage pdfAsImage](self, "pdfAsImage"));
  v3 = UIImageJPEGRepresentation(v2, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImage, a3);
}

- (UIImage)pdfAsImage
{
  return self->_pdfAsImage;
}

- (void)setPdfAsImage:(id)a3
{
  objc_storeStrong((id *)&self->_pdfAsImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfAsImage, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
}

@end
