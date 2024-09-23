@implementation CKSaveToPhotosActivity

- (CKSaveToPhotosActivity)initWithMediaObject:(id)a3 presenterViewController:(id)a4
{
  id v7;
  id v8;
  CKSaveToPhotosActivity *v9;
  CKSaveToPhotosActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKSaveToPhotosActivity;
  v9 = -[UIActivity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaObject, a3);
    objc_storeWeak((id *)&v10->_presenterViewController, v8);
  }

  return v10;
}

- (id)activityType
{
  return CFSTR("CKActivityTypeSaveToPhotos");
}

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityTitle
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[CKSaveToPhotosActivity mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaType");

  if (v3 == 2)
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("PREVIEW_SAVE_VIDEO");
  }
  else
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == 3)
    {
      v5 = v4;
      v6 = CFSTR("PREVIEW_SAVE_PHOTO");
    }
    else
    {
      v5 = v4;
      v6 = CFSTR("PREVIEW_SAVE_ITEM");
    }
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_systemImageName
{
  return CFSTR("square.and.arrow.down");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return objc_msgSend(a3, "count") != 0;
}

- (void)performActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[CKSaveToPhotosActivity mediaObject](self, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSaveToPhotosActivity presenterViewController](self, "presenterViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_IMWillLog())
  {
    v10 = v3;
    v11 = v4;
    _IMAlwaysLog();
  }
  if (v4 && v3)
  {
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CKMomentShareURLForMediaObjects(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0D38880];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__CKSaveToPhotosActivity_performActivity__block_invoke;
    v12[3] = &unk_1E274B1A0;
    v12[4] = self;
    +[CKUtilities quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:](CKUtilities, "quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:", v7, v6, 0, v8, 0, 0, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "presentViewController:animated:completion:", v9, 1, 0);
    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }

  }
  else
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    -[UIActivity activityDidFinish:](self, "activityDidFinish:", 0, v10, v11);
  }

}

uint64_t __41__CKSaveToPhotosActivity_performActivity__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", a2);
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (UIViewController)presenterViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presenterViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenterViewController);
  objc_storeStrong((id *)&self->_mediaObject, 0);
}

@end
