@implementation SSSScreenshotItemProviderImage

- (id)placeholderItemForScreenshot:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "imageProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestOutputImageForUIBlocking"));

  return v4;
}

- (id)item
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider screenshot](self, "screenshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestOutputImageForSavingBlocking"));

  return v4;
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
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  double v32;
  void **v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v5 = (void *)qword_1000AD6B0;
  v41 = qword_1000AD6B0;
  if (!qword_1000AD6B0)
  {
    v33 = _NSConcreteStackBlock;
    v34 = 3221225472;
    v35 = sub_100005DE8;
    v36 = &unk_100091848;
    v37 = &v38;
    sub_100005DE8((uint64_t)&v33);
    v5 = (void *)v39[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v38, 8);
  v7 = objc_alloc_init(v6);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v8 = (void *)qword_1000AD6C0;
  v41 = qword_1000AD6C0;
  if (!qword_1000AD6C0)
  {
    v33 = _NSConcreteStackBlock;
    v34 = 3221225472;
    v35 = sub_100005EE8;
    v36 = &unk_100091848;
    v37 = &v38;
    sub_100005EE8((uint64_t)&v33);
    v8 = (void *)v39[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v38, 8);
  v10 = objc_alloc_init(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider screenshot](self, "screenshot"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "requestOutputImageForUIBlocking"));

  v14 = SSCGImageBackedImageFromImage(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  objc_msgSend(v15, "size");
  v17 = v16;
  objc_msgSend(v15, "size");
  v19 = 128.0 / (v17 / v18);
  v20 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", 128.0, v19);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100005C88;
  v29[3] = &unk_100091820;
  v31 = 0x4060000000000000;
  v32 = v19;
  v21 = v15;
  v30 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageWithActions:", v29));
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v23 = (void *)qword_1000AD6C8;
  v41 = qword_1000AD6C8;
  if (!qword_1000AD6C8)
  {
    v33 = _NSConcreteStackBlock;
    v34 = 3221225472;
    v35 = sub_100005F3C;
    v36 = &unk_100091848;
    v37 = &v38;
    sub_100005F3C((uint64_t)&v33);
    v23 = (void *)v39[3];
  }
  v24 = objc_retainAutorelease(v23);
  _Block_object_dispose(&v38, 8);
  v25 = objc_msgSend([v24 alloc], "initWithPlatformImage:", v22);
  objc_msgSend(v10, "setThumbnail:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider nameForScreenshot](self, "nameForScreenshot"));
  objc_msgSend(v10, "setName:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  objc_msgSend(v10, "setType:", v27);

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
  return -[SSSScreenshotItemProviderImage imageData](self, "imageData", a3, a4, a5.width, a5.height);
}

- (id)imageData
{
  void *v2;
  void *v3;
  UIImage *v4;
  NSData *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider screenshot](self, "screenshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageProvider"));
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestOutputImageForSavingBlocking"));

  v5 = UIImageJPEGRepresentation(v4, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)activityViewControllerSuggestionAssetLocalIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider screenshot](self, "screenshot", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  return v4;
}

@end
