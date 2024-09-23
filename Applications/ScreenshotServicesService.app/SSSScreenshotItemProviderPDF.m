@implementation SSSScreenshotItemProviderPDF

- (id)placeholderItemForScreenshot:(id)a3
{
  return +[NSData data](NSData, "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a4)
  {
    v5 = (void *)objc_opt_class(self, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProviderPDF activityType](self, "activityType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider screenshot](self, "screenshot"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_sharableItemForActivityType:screenshot:", v6, v7));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = a4;
  v7 = objc_msgSend((id)objc_opt_class(self, v6), "_dataTypeIdentifierForActivityType:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
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
  void *v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  void **v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v5 = (void *)qword_1000AD6E0;
  v29 = qword_1000AD6E0;
  if (!qword_1000AD6E0)
  {
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_100006C0C;
    v24 = &unk_100091848;
    v25 = &v26;
    sub_100006C0C((uint64_t)&v21);
    v5 = (void *)v27[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v26, 8);
  v7 = objc_alloc_init(v6);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v8 = (void *)qword_1000AD6F0;
  v29 = qword_1000AD6F0;
  if (!qword_1000AD6F0)
  {
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_100006D0C;
    v24 = &unk_100091848;
    v25 = &v26;
    sub_100006D0C((uint64_t)&v21);
    v8 = (void *)v27[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v26, 8);
  v10 = objc_alloc_init(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider screenshot](self, "screenshot"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "PDFDocument"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pageAtIndex:", 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "thumbnailOfSize:forBox:", 1, 300.0, 300.0));

  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v15 = (void *)qword_1000AD6F8;
  v29 = qword_1000AD6F8;
  if (!qword_1000AD6F8)
  {
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_100006D60;
    v24 = &unk_100091848;
    v25 = &v26;
    sub_100006D60((uint64_t)&v21);
    v15 = (void *)v27[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v26, 8);
  v17 = objc_msgSend([v16 alloc], "initWithPlatformImage:", v14);
  objc_msgSend(v10, "setThumbnail:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider nameForScreenshot](self, "nameForScreenshot"));
  objc_msgSend(v10, "setName:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePDF, "identifier"));
  objc_msgSend(v10, "setType:", v19);

  objc_msgSend(v7, "setSpecialization:", v10);
  return v7;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotItemProvider nameForScreenshot](self, "nameForScreenshot", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("pdf")));

  return v5;
}

+ (id)_dataTypeIdentifierForActivityType:(id)a3
{
  return objc_msgSend(UTTypePDF, "identifier", a3);
}

+ (id)_sharableItemForActivityType:(id)a3 screenshot:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "editedPDFDataForShareSheet"));
  if (v7 && objc_msgSend(v6, "isEqualToString:", UIActivityTypeCopyToPasteboard))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_dataTypeIdentifierForActivityType:", v6));
    v11 = v8;
    v12 = v7;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));

  }
  else
  {
    v9 = v7;
  }

  return v9;
}

@end
