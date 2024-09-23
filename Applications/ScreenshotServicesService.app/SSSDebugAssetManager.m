@implementation SSSDebugAssetManager

+ (id)newTestScreenshot
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  UIImage *ImageFromCurrentImageContext;
  void *v15;
  CGSize v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v17.width = v8;
  v17.height = v10;
  UIGraphicsBeginImageContext(v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windows"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  objc_msgSend(v13, "drawViewHierarchyInRect:afterScreenUpdates:", 0, v4, v6, v8, v10);

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v15;
}

- (void)registerEntryWithImage:(id)a3 options:(id)a4 identifierHandler:(id)a5
{
  (*((void (**)(id, const __CFString *, _QWORD))a5 + 2))(a5, CFSTR("identifier"), 0);
}

- (void)imageForPreviouslyRegisteredIdentifier:(id)a3 imageHandler:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100025F94;
  v5[3] = &unk_100091960;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)updateImageData:(id)a3 withModificationData:(id)a4 forEntryWithIdentifier:(id)a5 registrationOptions:(id)a6 imageDescription:(id)a7 completionHandler:(id)a8
{
  (*((void (**)(id, uint64_t, _QWORD))a8 + 2))(a8, 1, 0);
}

- (void)saveImageToTemporaryLocation:(id)a3 withName:(id)a4 imageDescription:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD, _QWORD))a6 + 2))(a6, 0, 0);
}

- (void)removeEntryWithIdentifier:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

@end
