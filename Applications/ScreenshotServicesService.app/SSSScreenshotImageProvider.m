@implementation SSSScreenshotImageProvider

- (SSSScreenshotImageProvider)initWithScreenshot:(id)a3
{
  id v3;
  id v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SSSScreenshotImageProvider;
  v3 = a3;
  v4 = -[SSSScreenshotImageProvider init](&v19, "init");
  objc_storeWeak((id *)v4 + 2, v3);

  *((_DWORD *)v4 + 2) = 0;
  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = dispatch_queue_create("ScreenshotPotentiallyLowQualityOutputImageQueue", v6);
  v8 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v7;

  v9 = dispatch_queue_create("ScreenshotHighQualityOutputImageQueue", v6);
  v10 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v9;

  *((_BYTE *)v4 + 13) = 1;
  dispatch_set_target_queue(*((dispatch_object_t *)v4 + 4), *((dispatch_queue_t *)v4 + 3));
  dispatch_suspend(*((dispatch_object_t *)v4 + 4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screenshot", v19.receiver, v19.super_class));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "modelModificationInfo"));
  v13 = objc_msgSend(v12, "copy");
  v14 = (void *)*((_QWORD *)v4 + 7);
  *((_QWORD *)v4 + 7) = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screenshot"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "backingImage"));
  v17 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v16;

  return (SSSScreenshotImageProvider *)v4;
}

- (void)dealloc
{
  NSObject *potentiallyLowQualityImageQueue;
  objc_super v4;
  _QWORD block[5];

  if (-[SSSScreenshotImageProvider highQualityQueueIsValid](self, "highQualityQueueIsValid")
    && !-[SSSScreenshotImageProvider highQualityQueueHasBeenResumed](self, "highQualityQueueHasBeenResumed"))
  {
    -[SSSScreenshotImageProvider setHighQualityQueueIsValid:](self, "setHighQualityQueueIsValid:", 0);
    potentiallyLowQualityImageQueue = self->_potentiallyLowQualityImageQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100026FCC;
    block[3] = &unk_100091920;
    block[4] = self;
    dispatch_sync(potentiallyLowQualityImageQueue, block);
    dispatch_sync((dispatch_queue_t)self->_potentiallyLowQualityImageQueue, &stru_1000921F0);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSSScreenshotImageProvider;
  -[SSSScreenshotImageProvider dealloc](&v4, "dealloc");
}

- (void)_resumeHighQualityQueueIfNecessary
{
  NSObject *v3;

  if (!-[SSSScreenshotImageProvider highQualityQueueHasBeenResumed](self, "highQualityQueueHasBeenResumed"))
  {
    -[SSSScreenshotImageProvider setHighQualityQueueHasBeenResumed:](self, "setHighQualityQueueHasBeenResumed:", 1);
    v3 = objc_claimAutoreleasedReturnValue(-[SSSScreenshotImageProvider highQualityImageQueue](self, "highQualityImageQueue"));
    dispatch_resume(v3);

  }
}

- (id)_outputImageOnCurrentUneditedImage
{
  os_unfair_lock_s *p_outputImageLock;
  void *v4;
  void *v5;
  SSSScreenshotModificationInfo *cachedModificationInfo;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;
  UIImage *v12;

  p_outputImageLock = &self->_outputImageLock;
  os_unfair_lock_lock(&self->_outputImageLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotImageProvider screenshot](self, "screenshot"));
  v5 = v4;
  if (v4)
  {
    cachedModificationInfo = self->_cachedModificationInfo;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modelModificationInfo"));
    if (-[SSSScreenshotModificationInfo isEqual:](cachedModificationInfo, "isEqual:", v7))
    {
      v8 = -[SSSScreenshotImageProvider hasChangedBackingImage](self, "hasChangedBackingImage");

      if ((v8 & 1) == 0)
        goto LABEL_12;
    }
    else
    {

    }
  }
  else if (!-[SSSScreenshotImageProvider hasChangedBackingImage](self, "hasChangedBackingImage"))
  {
    goto LABEL_12;
  }
  if (-[SSSScreenshotImageProvider hasChangedBackingImage](self, "hasChangedBackingImage"))
    -[SSSScreenshotImageProvider setHasChangedBackingImage:](self, "setHasChangedBackingImage:", 0);
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _sss_imageFromScreenshot:](UIImage, "_sss_imageFromScreenshot:", v5));
    -[SSSScreenshotImageProvider setCachedOutputImage:](self, "setCachedOutputImage:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelModificationInfo"));
    v11 = objc_msgSend(v10, "copy");
    -[SSSScreenshotImageProvider setCachedModificationInfo:](self, "setCachedModificationInfo:", v11);

  }
LABEL_12:
  os_unfair_lock_unlock(p_outputImageLock);
  v12 = self->_cachedOutputImage;

  return v12;
}

- (void)requestOutputImageForSaving:(id)a3
{
  -[SSSScreenshotImageProvider requestOutputImageInTransition:forSaving:](self, "requestOutputImageInTransition:forSaving:", 0, a3);
}

- (void)requestOutputImageInTransition:(BOOL)a3 forSaving:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  dispatch_time_t v13;
  NSObject *highQualityImageQueue;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotImageProvider screenshot](self, "screenshot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageGenerator"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSSSpringAnimationParameters scaleAnimationParameters](SSSSpringAnimationParameters, "scaleAnimationParameters"));
  objc_msgSend(v9, "duration");
  v11 = v10;

  if (v4)
  {
    v12 = v11 * 1000000000.0;
    if (v11 >= 0.5)
      v12 = 500000000.0;
    v13 = dispatch_time(0, (uint64_t)v12);
  }
  else
  {
    v13 = 0;
  }
  highQualityImageQueue = self->_highQualityImageQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000272E4;
  v17[3] = &unk_100091AF8;
  objc_copyWeak(&v20, &location);
  v18 = v8;
  v19 = v6;
  v15 = v6;
  v16 = v8;
  dispatch_after(v13, highQualityImageQueue, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)requestOutputImageForUI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *potentiallyLowQualityImageQueue;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotImageProvider screenshot](self, "screenshot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageGenerator"));

  potentiallyLowQualityImageQueue = self->_potentiallyLowQualityImageQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000274DC;
  v10[3] = &unk_100092240;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  objc_copyWeak(&v13, &location);
  dispatch_async(potentiallyLowQualityImageQueue, v10);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

- (id)requestOutputImageForSavingBlocking
{
  NSObject *v3;
  id v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100027640;
  v13 = sub_100027650;
  v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027658;
  v6[3] = &unk_100092268;
  v8 = &v9;
  v3 = dispatch_semaphore_create(0);
  v7 = v3;
  -[SSSScreenshotImageProvider requestOutputImageForSaving:](self, "requestOutputImageForSaving:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)requestOutputImageForUIBlocking
{
  NSObject *v3;
  id v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100027640;
  v13 = sub_100027650;
  v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002779C;
  v6[3] = &unk_100092268;
  v8 = &v9;
  v3 = dispatch_semaphore_create(0);
  v7 = v3;
  -[SSSScreenshotImageProvider requestOutputImageForUI:](self, "requestOutputImageForUI:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)requestUneditedImageForUI:(id)a3
{
  id v4;
  NSObject *potentiallyLowQualityImageQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  potentiallyLowQualityImageQueue = self->_potentiallyLowQualityImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000278A0;
  block[3] = &unk_100092290;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(potentiallyLowQualityImageQueue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (id)requestUneditedImageForUIBlocking
{
  NSObject *v3;
  id v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100027640;
  v13 = sub_100027650;
  v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027A04;
  v6[3] = &unk_100092268;
  v8 = &v9;
  v3 = dispatch_semaphore_create(0);
  v7 = v3;
  -[SSSScreenshotImageProvider requestUneditedImageForUI:](self, "requestUneditedImageForUI:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)requestCGImageBackedUneditedImageForUI:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[SSSScreenshotImageProvider potentiallyLowQualityImageQueue](self, "potentiallyLowQualityImageQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027B2C;
  v7[3] = &unk_1000922B8;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)requestCGImageBackedUneditedImageForUIBlocking
{
  NSObject *v3;
  id v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100027640;
  v13 = sub_100027650;
  v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027D78;
  v6[3] = &unk_100092268;
  v8 = &v9;
  v3 = dispatch_semaphore_create(0);
  v7 = v3;
  -[SSSScreenshotImageProvider requestCGImageBackedUneditedImageForUI:](self, "requestCGImageBackedUneditedImageForUI:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)_loadUneditedImageIfNecessaryWithCompletionBlock:(id)a3
{
  void (**v4)(_QWORD);
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  id location;

  v4 = (void (**)(_QWORD))a3;
  if (!self->_hasOriginalUneditedImage)
  {
    objc_initWeak(&location, self);
    v5 = dispatch_semaphore_create(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSScreenshotAssetManager sharedAssetManager](SSScreenshotAssetManager, "sharedAssetManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotImageProvider screenshot](self, "screenshot"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100027F14;
    v10[3] = &unk_1000922E0;
    objc_copyWeak(&v12, &location);
    v9 = v5;
    v11 = v9;
    objc_msgSend(v6, "imageWithPreviouslyRegisteredIdentifier:withAccessBlock:", v8, v10);

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
  v4[2](v4);

}

- (void)processImageIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotImageProvider screenshot](self, "screenshot"));
  objc_msgSend(v5, "setIdentifier:", v4);

  objc_initWeak(&location, self);
  v6 = objc_claimAutoreleasedReturnValue(-[SSSScreenshotImageProvider potentiallyLowQualityImageQueue](self, "potentiallyLowQualityImageQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000280E4;
  v7[3] = &unk_100091AD0;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (id)pdfDocument
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotImageProvider requestOutputImageForSavingBlocking](self, "requestOutputImageForSavingBlocking"));
  v3 = objc_msgSend(objc_alloc((Class)PDFPage), "initWithImage:", v2);
  objc_msgSend(v2, "size");
  v5 = v4;
  objc_msgSend(v2, "size");
  objc_msgSend(v3, "setBounds:forBox:", 1, 0.0, 0.0, v5, v6);
  v7 = objc_alloc_init((Class)PDFDocument);
  objc_msgSend(v7, "insertPage:atIndex:", v3, 0);

  return v7;
}

- (void)scheduleDeletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[SSSScreenshotImageProvider highQualityImageQueue](self, "highQualityImageQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028290;
  block[3] = &unk_100091E08;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (SSSScreenshot)screenshot
{
  return (SSSScreenshot *)objc_loadWeakRetained((id *)&self->_screenshot);
}

- (void)setScreenshot:(id)a3
{
  objc_storeWeak((id *)&self->_screenshot, a3);
}

- (OS_dispatch_queue)potentiallyLowQualityImageQueue
{
  return self->_potentiallyLowQualityImageQueue;
}

- (void)setPotentiallyLowQualityImageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_potentiallyLowQualityImageQueue, a3);
}

- (OS_dispatch_queue)highQualityImageQueue
{
  return self->_highQualityImageQueue;
}

- (void)setHighQualityImageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_highQualityImageQueue, a3);
}

- (BOOL)highQualityQueueHasBeenResumed
{
  return self->_highQualityQueueHasBeenResumed;
}

- (void)setHighQualityQueueHasBeenResumed:(BOOL)a3
{
  self->_highQualityQueueHasBeenResumed = a3;
}

- (BOOL)highQualityQueueIsValid
{
  return self->_highQualityQueueIsValid;
}

- (void)setHighQualityQueueIsValid:(BOOL)a3
{
  self->_highQualityQueueIsValid = a3;
}

- (BOOL)hasOriginalUneditedImage
{
  return self->_hasOriginalUneditedImage;
}

- (void)setHasOriginalUneditedImage:(BOOL)a3
{
  self->_hasOriginalUneditedImage = a3;
}

- (BOOL)hasChangedBackingImage
{
  return self->_hasChangedBackingImage;
}

- (void)setHasChangedBackingImage:(BOOL)a3
{
  self->_hasChangedBackingImage = a3;
}

- (UIImage)cachedOutputImage
{
  return self->_cachedOutputImage;
}

- (void)setCachedOutputImage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedOutputImage, a3);
}

- (UIImage)cachedCGImageBackedUneditedImageForUI
{
  return self->_cachedCGImageBackedUneditedImageForUI;
}

- (void)setCachedCGImageBackedUneditedImageForUI:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCGImageBackedUneditedImageForUI, a3);
}

- (SSSScreenshotModificationInfo)cachedModificationInfo
{
  return self->_cachedModificationInfo;
}

- (void)setCachedModificationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cachedModificationInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedModificationInfo, 0);
  objc_storeStrong((id *)&self->_cachedCGImageBackedUneditedImageForUI, 0);
  objc_storeStrong((id *)&self->_cachedOutputImage, 0);
  objc_storeStrong((id *)&self->_highQualityImageQueue, 0);
  objc_storeStrong((id *)&self->_potentiallyLowQualityImageQueue, 0);
  objc_destroyWeak((id *)&self->_screenshot);
}

@end
