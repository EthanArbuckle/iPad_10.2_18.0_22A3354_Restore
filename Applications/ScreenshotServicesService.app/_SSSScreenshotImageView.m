@implementation _SSSScreenshotImageView

- (_SSSScreenshotImageView)initWithFrame:(CGRect)a3
{
  _SSSScreenshotImageView *v3;
  _SSSScreenshotPaperKitImageView *v4;
  _SSSScreenshotCropableView *imageView;
  _SSSScreenshotFullsizeStaticImageView *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _SSSScreenshotFullsizeStaticImageView *v11;
  _SSSScreenshotCropableView *cachedOutputImageView;
  int v13;
  _SSSScreenshotCropableView *v14;
  VKCImageAnalysisInteraction *v15;
  VKCImageAnalysisInteraction *imageInteraction;
  id v17;
  uint64_t v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *analysisHelperQueue;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_SSSScreenshotImageView;
  v3 = -[_SSSScreenshotAnnotationView initWithFrame:](&v24, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages"))
  {
    v4 = objc_alloc_init(_SSSScreenshotPaperKitImageView);
    -[_SSSScreenshotPaperKitImageView setDelegate:](v4, "setDelegate:", v3);
    imageView = v3->_imageView;
    v3->_imageView = (_SSSScreenshotCropableView *)v4;
  }
  else
  {
    v6 = objc_alloc_init(_SSSScreenshotFullsizeStaticImageView);
    imageView = v3->_imageView;
    v3->_imageView = (_SSSScreenshotCropableView *)v6;
  }

  v3->_inhibitImageAnalysis = 1;
  -[_SSSScreenshotImageView addSubview:](v3, "addSubview:", v3->_imageView);
  if ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages") & 1) == 0)
  {
    v7 = objc_alloc_init((Class)UIView);
    -[_SSSScreenshotAnnotationView setVellumView:](v3, "setVellumView:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](v3, "vellumView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v8, "setBackgroundColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](v3, "vellumView"));
    -[_SSSScreenshotImageView addSubview:](v3, "addSubview:", v10);

  }
  -[_SSSScreenshotAnnotationView setScreenshotEditsSnapshotted:](v3, "setScreenshotEditsSnapshotted:", 1);
  v11 = objc_alloc_init(_SSSScreenshotFullsizeStaticImageView);
  cachedOutputImageView = v3->_cachedOutputImageView;
  v3->_cachedOutputImageView = (_SSSScreenshotCropableView *)v11;

  v13 = _os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages");
  v14 = v3->_cachedOutputImageView;
  if (v13)
    -[_SSSScreenshotImageView insertSubview:belowSubview:](v3, "insertSubview:belowSubview:", v14, v3->_imageView);
  else
    -[_SSSScreenshotImageView addSubview:](v3, "addSubview:", v14);
  if (+[VKCImageAnalyzer supportedAnalysisTypes](VKCImageAnalyzer, "supportedAnalysisTypes"))
  {
    v15 = (VKCImageAnalysisInteraction *)objc_alloc_init((Class)VKCImageAnalysisInteraction);
    imageInteraction = v3->_imageInteraction;
    v3->_imageInteraction = v15;

    -[VKCImageAnalysisInteraction setAnalysisButtonRequiresVisibleContentGating:](v3->_imageInteraction, "setAnalysisButtonRequiresVisibleContentGating:", 0);
    -[VKCImageAnalysisInteraction setDelegate:](v3->_imageInteraction, "setDelegate:", v3);
    -[VKCImageAnalysisInteraction setWantsAutomaticContentsRectCalculation:](v3->_imageInteraction, "setWantsAutomaticContentsRectCalculation:", 0);
    v17 = -[VKCImageAnalysisInteraction setAutomaticallyShowVisualSearchResults:](v3->_imageInteraction, "setAutomaticallyShowVisualSearchResults:", 1);
    if (_SSQuickActionsEnabled(v17, v18))
    {
      -[VKCImageAnalysisInteraction setActionInfoViewHidden:](v3->_imageInteraction, "setActionInfoViewHidden:", 0);
      -[VKCImageAnalysisInteraction setWantsTranslucentActionInfoButtons:](v3->_imageInteraction, "setWantsTranslucentActionInfoButtons:", 1);
      -[VKCImageAnalysisInteraction setActionInfoLiveTextButtonDisabled:](v3->_imageInteraction, "setActionInfoLiveTextButtonDisabled:", 1);
    }
    v19 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_create("com.apple.screenshotServicesService.VKAnalysisHelper", v20);
    analysisHelperQueue = v3->_analysisHelperQueue;
    v3->_analysisHelperQueue = (OS_dispatch_queue *)v21;

    -[_SSSScreenshotImageView addInteraction:](v3, "addInteraction:", v3->_imageInteraction);
  }
  return v3;
}

- (void)willMoveToWindow:(id)a3
{
  VKCImageAnalysisInteraction *imageInteraction;
  VKCImageAnalysisInteraction *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SSSScreenshotImageView;
  -[_SSSScreenshotImageView willMoveToWindow:](&v7, "willMoveToWindow:");
  if (!a3)
  {
    imageInteraction = self->_imageInteraction;
    if (imageInteraction)
    {
      -[VKCImageAnalysisInteraction setDelegate:](imageInteraction, "setDelegate:", 0);
      -[_SSSScreenshotImageView removeInteraction:](self, "removeInteraction:", self->_imageInteraction);
      v6 = self->_imageInteraction;
      self->_imageInteraction = 0;

    }
  }
}

- (void)setAnnotationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_annotationsEnabled = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView paperKitImageView](self, "paperKitImageView"));
  objc_msgSend(v4, "setAnnotationsEnabled:", v3);

}

- (void)setInteractionMode:(unint64_t)a3
{
  _SSSScreenshotImageView *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = self;
  if (a3 && !self->_interactionMode && self->_hasOutstandingEdits)
  {
    self->_hasOutstandingEdits = 0;
    self = (_SSSScreenshotImageView *)-[_SSSScreenshotImageView reanalyzeImage](self, "reanalyzeImage");
  }
  v4->_interactionMode = a3;
  switch(a3)
  {
    case 0uLL:
      v5 = 0;
      v6 = 1;
      v7 = 1;
      v8 = 1;
      break;
    case 1uLL:
      v6 = 0;
      v8 = 0;
      v7 = 1;
      v5 = 9;
      break;
    case 2uLL:
      v6 = 0;
      v7 = 0;
      v8 = 1;
      v5 = 4;
      break;
    case 3uLL:
      v6 = 0;
      v8 = 0;
      v7 = 1;
      v5 = 11;
      break;
    default:
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v5 = 0;
      break;
  }
  v9 = a3 == 3;
  if (!_SSRemoveBackgroundEnabled(self, a2))
    v5 &= 7u;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](v4, "imageInteraction"));
  objc_msgSend(v13, "setActiveInteractionTypes:", v5);
  objc_msgSend(v13, "setHighlightSelectableItems:", v9);
  objc_msgSend(v13, "setForceAnalysisBarButtonItemEnabled:", v8);
  if (v7)
    objc_msgSend(v13, "resetSelection");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView annotationOverlayView](v4, "annotationOverlayView"));
  objc_msgSend(v10, "setUserInteractionEnabled:", v6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](v4, "overlayController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "annotationKitController"));
  objc_msgSend(v12, "setAllEditingDisabled:", v6 ^ 1);

}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SSSScreenshotImageView;
  -[_SSSScreenshotImageView setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_SSSScreenshotImageView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SSSScreenshotImageView;
  -[_SSSScreenshotImageView setBounds:](&v4, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_SSSScreenshotImageView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)layoutSubviews
{
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
  void *v14;
  void *v15;
  void *v16;
  _SSSScreenshotCropableView *imageView;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  -[_SSSScreenshotImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_SSSScreenshotCropableView setFrame:](self->_imageView, "setFrame:");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView cachedOutputImageView](self, "cachedOutputImageView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView annotationOverlayView](self, "annotationOverlayView"));
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](self, "vellumView"));
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "modelModificationInfo"));
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "cropInfo");
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    v32 = 0u;
  }

  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  sub_100048FB0((uint64_t)&v29, *(double *)&v32, *((double *)&v32 + 1));
  imageView = self->_imageView;
  v26 = v29;
  v27 = v30;
  v28 = v31;
  -[_SSSScreenshotCropableView setCropInfo:](imageView, "setCropInfo:", &v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView cachedOutputImageView](self, "cachedOutputImageView"));
  v26 = v32;
  v27 = v33;
  v28 = v34;
  objc_msgSend(v18, "setCropInfo:", &v26);

  v19 = v8 / *(double *)&v29;
  v20 = v10 / *((double *)&v29 + 1);
  -[_SSSScreenshotCropableView setSizeMultiplier:](self->_imageView, "setSizeMultiplier:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView cachedOutputImageView](self, "cachedOutputImageView"));
  objc_msgSend(v21, "setSizeMultiplier:", v19, v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView vellumView](self, "vellumView"));
  -[_SSSScreenshotAnnotationView vellumOpacity](self, "vellumOpacity");
  objc_msgSend(v22, "setAlpha:");

  -[_SSSScreenshotCropableView setUseTrilinearMinificationFilter:](self->_imageView, "setUseTrilinearMinificationFilter:", -[_SSSScreenshotImageView useTrilinearMinificationFilter](self, "useTrilinearMinificationFilter"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView cachedOutputImageView](self, "cachedOutputImageView"));
  objc_msgSend(v23, "setUseTrilinearMinificationFilter:", -[_SSSScreenshotImageView useTrilinearMinificationFilter](self, "useTrilinearMinificationFilter"));

  if ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages") & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView cachedOutputImageView](self, "cachedOutputImageView"));
    -[_SSSScreenshotImageView bringSubviewToFront:](self, "bringSubviewToFront:", v24);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self, "overlayController"));
  objc_msgSend(v25, "setViewState:", 0, 0);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "environmentDescription"));
  objc_msgSend(v3, "imagePointSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_SSSScreenshotPaperKitImageView)paperKitImageView
{
  _SSSScreenshotCropableView *v3;

  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages"))
    v3 = self->_imageView;
  else
    v3 = 0;
  return (_SSSScreenshotPaperKitImageView *)v3;
}

- (void)setVellumOpacity:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SSSScreenshotImageView;
  -[_SSSScreenshotAnnotationView setVellumOpacity:](&v6, "setVellumOpacity:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView paperKitImageView](self, "paperKitImageView"));
  objc_msgSend(v5, "setVellumOpacity:", a3);

}

- (UIGestureRecognizer)drawingGestureRecognizer
{
  void *v3;

  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotCropableView drawingGestureRecognizer](self->_imageView, "drawingGestureRecognizer"));
  else
    v3 = 0;
  return (UIGestureRecognizer *)v3;
}

- (void)setScreenshot:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;
  objc_super v13;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot"));

  if (v5 != v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)_SSSScreenshotImageView;
    -[_SSSScreenshotAnnotationView setScreenshot:](&v13, "setScreenshot:", v4);
    if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages"))
      objc_msgSend(v4, "setImageGenerator:", self->_imageView);
    objc_initWeak(&location, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageProvider"));
    v7 = _NSConcreteStackBlock;
    v8 = 3221225472;
    v9 = sub_1000115DC;
    v10 = &unk_100091A30;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v6, "requestUneditedImageForUI:", &v7);

    -[_SSSScreenshotImageView setNeedsLayout](self, "setNeedsLayout", v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (_SSSScreenshotImageView)viewWithScreenshotImage
{
  return (_SSSScreenshotImageView *)self->_imageView;
}

- (void)setUseTrilinearMinificationFilter:(BOOL)a3
{
  self->_useTrilinearMinificationFilter = a3;
  -[_SSSScreenshotImageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setInhibitImageAnalysis:(BOOL)a3
{
  if (self->_inhibitImageAnalysis != a3)
  {
    self->_inhibitImageAnalysis = a3;
    -[_SSSScreenshotImageView analyzeCurrentImageIfNecessary](self, "analyzeCurrentImageIfNecessary");
  }
}

- (void)reanalyzeImage
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](self, "imageInteraction"));
  objc_msgSend(v3, "setAnalysis:", 0);

  -[_SSSScreenshotImageView analyzeCurrentImageIfNecessary](self, "analyzeCurrentImageIfNecessary");
}

- (void)analyzeCurrentImageIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  _QWORD *v18;
  _QWORD block[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id from;
  id location;

  if (!-[_SSSScreenshotImageView inhibitImageAnalysis](self, "inhibitImageAnalysis"))
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](self, "imageInteraction"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "analysis"));
    if (v3)
    {

    }
    else
    {
      v4 = +[VKCImageAnalyzer supportedAnalysisTypes](VKCImageAnalyzer, "supportedAnalysisTypes");

      if (v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageAnalyzer](self, "imageAnalyzer"));
        objc_initWeak(&location, self);
        objc_initWeak(&from, v5);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100011A50;
        v22[3] = &unk_100091A80;
        objc_copyWeak(&v24, &location);
        v7 = v6;
        v23 = v7;
        objc_copyWeak(&v25, &from);
        v8 = objc_retainBlock(v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot"));
        v10 = objc_msgSend(v9, "hasEverBeenEditedForMode:", 0);

        if ((v10 & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageProvider"));
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_100011DD0;
          v17[3] = &unk_100091AA8;
          v18 = v8;
          objc_msgSend(v12, "requestOutputImageForSaving:", v17);

          v13 = v18;
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotCropableView image](self->_imageView, "image"));
          v15 = objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView analysisHelperQueue](self, "analysisHelperQueue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100011D88;
          block[3] = &unk_100091960;
          v20 = v14;
          v21 = v8;
          v13 = v14;
          dispatch_async(v15, block);

        }
        objc_destroyWeak(&v25);

        objc_destroyWeak(&v24);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);

      }
    }
  }
}

- (CGRect)contentsRectForImageAnalysisInteraction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _OWORD v17[3];
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelModificationInfo"));
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "cropInfo");
  else
    memset(v17, 0, sizeof(v17));
  v6 = sub_100049018((double *)v17);
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (UIActivity)visionKitFeedbackActivity
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](self, "imageInteraction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "feedbackActivity"));

  return (UIActivity *)v3;
}

- (void)setRulerHostView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView paperKitImageView](self, "paperKitImageView"));
    objc_msgSend(v5, "setRulerHostView:", v4);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_SSSScreenshotImageView;
    -[_SSSScreenshotAnnotationView setRulerHostView:](&v6, "setRulerHostView:", v4);
  }

}

- (unint64_t)feedbackTypeForImageAnalysisInteraction:(id)a3
{
  return 0;
}

- (void)clearImageAnalysisTextSelection
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](self, "imageInteraction"));
  objc_msgSend(v2, "resetSelection");

}

- (void)_updateInteractionModeFromAnalysisButtonPress
{
  void *v3;
  _SSSScreenshotImageView *v4;
  uint64_t v5;
  id v6;

  if ((id)-[_SSSScreenshotImageView interactionMode](self, "interactionMode") == (id)1
    || !-[_SSSScreenshotImageView interactionMode](self, "interactionMode"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView delegate](self, "delegate"));
    v6 = v3;
    v4 = self;
    v5 = 3;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView delegate](self, "delegate"));
    v6 = v3;
    v4 = self;
    v5 = 1;
  }
  objc_msgSend(v3, "imageView:requestsUpdateToInteractionMode:", v4, v5);

}

- (void)imageAnalysisInteraction:(id)a3 imageAnalysisBarItemPressed:(id)a4
{
  -[_SSSScreenshotImageView _updateInteractionModeFromAnalysisButtonPress](self, "_updateInteractionModeFromAnalysisButtonPress", a3, a4);
}

- (void)imageAnalysisInteraction:(id)a3 imageAnalysisButtonPressed:(id)a4
{
  -[_SSSScreenshotImageView _updateInteractionModeFromAnalysisButtonPress](self, "_updateInteractionModeFromAnalysisButtonPress", a3, a4);
}

- (void)imageAnalysisInteraction:(id)a3 highlightSelectedItemsValueDidChange:(BOOL)a4
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012074;
  v4[3] = &unk_100091AD0;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)updateInteractionHighlightStatusIfNecessary
{
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView imageInteraction](self, "imageInteraction"));
  v3 = objc_msgSend(v7, "highlightSelectableItems");
  v4 = -[_SSSScreenshotImageView interactionMode](self, "interactionMode");
  if ((v4 | 2) == 3)
  {
    if (v3)
      v5 = v4 | 2;
    else
      v5 = 1;
    if (v4 != v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView delegate](self, "delegate"));
      objc_msgSend(v6, "imageView:requestsUpdateToInteractionMode:", self, v5);

    }
  }

}

- (void)cropControllerDidZoomInScrollView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView paperKitImageView](self, "paperKitImageView"));
    objc_msgSend(v4, "cropControllerDidZoomInScrollView:", v5);

  }
}

- (void)cropControllerDidUpdateScrollView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView paperKitImageView](self, "paperKitImageView"));
    objc_msgSend(v4, "cropControllerDidUpdateScrollView:", v5);

  }
}

- (void)deselectAllAnnotations
{
  id v3;

  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView paperKitImageView](self, "paperKitImageView"));
    objc_msgSend(v3, "deselectAllAnnotations");

  }
}

- (void)enterEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages"))
  {
    -[_SSSScreenshotCropableView setEditable:](self->_imageView, "setEditable:", 1);
    -[_SSSScreenshotCropableView updatePaletteVisibilityIfNecessary:](self->_imageView, "updatePaletteVisibilityIfNecessary:", 1);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView annotationOverlayView](self, "annotationOverlayView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self, "overlayController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "overlayView"));

    if (v3 != v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView annotationOverlayView](self, "annotationOverlayView"));
      objc_msgSend(v6, "removeFromSuperview");

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self, "overlayController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "overlayView"));
      -[_SSSScreenshotAnnotationView setAnnotationOverlayView:](self, "setAnnotationOverlayView:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView annotationOverlayView](self, "annotationOverlayView"));
      -[_SSSScreenshotImageView addSubview:](self, "addSubview:", v9);

    }
  }
  v10.receiver = self;
  v10.super_class = (Class)_SSSScreenshotImageView;
  -[_SSSScreenshotAnnotationView enterEditing](&v10, "enterEditing");
}

- (void)endedEditing
{
  objc_super v3;

  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages"))
    -[_SSSScreenshotCropableView setEditable:](self->_imageView, "setEditable:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_SSSScreenshotImageView;
  -[_SSSScreenshotAnnotationView endedEditing](&v3, "endedEditing");
}

- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages"))
    -[_SSSScreenshotCropableView updatePaletteVisibilityIfNecessary:](self->_imageView, "updatePaletteVisibilityIfNecessary:", v3);
}

- (void)generateSnapshotImageIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  id v13;
  id location;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v4
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageProvider")),
        v8,
        v7,
        v8))
  {
    objc_initWeak(&location, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageProvider"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001257C;
    v11[3] = &unk_100091B20;
    objc_copyWeak(&v13, &location);
    v12 = v6;
    objc_msgSend(v10, "requestOutputImageForUI:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else if (v6)
  {
    v6[2](v6);
  }

}

- (void)setCachedViewsHidden:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages") & 1) == 0)
    -[_SSSScreenshotCropableView setHidden:](self->_cachedOutputImageView, "setHidden:", v3);
}

+ (id)_createDirectoryForSysdiagnoseIfNecessary
{
  void *v2;
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = 0;
  v3 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/private/var/db/sysdiagnose/com.apple.ScreenshotServicesService/"), 1, 0, &v13);
  v4 = v13;

  if ((v3 & 1) == 0)
  {
    v5 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100057594((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return v4;
}

+ (void)_saveImageForSysdiagnose:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v4 = a3;
  if (MGGetBoolAnswer(CFSTR("apple-internal-install")))
  {
    v5 = SSCGImageBackedImageFromImage(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);

    v11 = dispatch_queue_create("com.apple.ScreenshotServicesService.SysdiagnoseSavingQueue", v10);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100012898;
    v14[3] = &unk_100091B48;
    v15 = v6;
    v16 = objc_opt_class(a1, v12);
    v13 = v6;
    dispatch_async(v11, v14);

  }
}

- (void)_paperKitImageDidChangeInView:(id)a3 changeCounter:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v6 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView screenshot](self, "screenshot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageDescription"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "viewModificationInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageDescription"));

  v10 = v7;
  v11 = v9;
  v12 = v11;
  if (v10 == v11)
  {

    v14 = v17;
  }
  else
  {
    if (!v10 || !v11)
    {

      v14 = v17;
LABEL_9:
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "viewModificationInfo"));
      objc_msgSend(v15, "setImageDescription:", v10);
      v16 = 4;
      goto LABEL_10;
    }
    v13 = objc_msgSend(v10, "isEqualToString:", v11);

    v14 = v17;
    if ((v13 & 1) == 0)
      goto LABEL_9;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "viewModificationInfo"));
  objc_msgSend(v15, "setPaperKitChangeCounter:", a4);
  v16 = 2;
LABEL_10:

  objc_msgSend(v17, "promoteViewValueToModelValueForKey:forState:createUndoCommand:", v16, 0, 0, 0);
}

- (void)_paperKitImageView:(id)a3 startEditingOpacityInAccessoryView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView delegate](self, "delegate"));
  objc_msgSend(v6, "imageView:startEditingOpacityInAccessoryView:", self, v5);

}

- (void)_paperKitImageView:(id)a3 willBeginUpdatingImage:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView cachedOutputImageView](self, "cachedOutputImageView"));
  objc_msgSend(v6, "setImage:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView cachedOutputImageView](self, "cachedOutputImageView"));
  objc_msgSend(v7, "setHidden:", 0);

}

- (void)_paperKitImageView:(id)a3 didFinishUpdatingImage:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView delegate](self, "delegate", a3, a4));
  objc_msgSend(v5, "imageViewDidLoadImage:", self);

}

- (id)_paperKitImageViewOverlayViewController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotImageView delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageViewOverlayViewController:", self));

  return v5;
}

- (SSSScreenshotImageViewDelegate)delegate
{
  return (SSSScreenshotImageViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)useTrilinearMinificationFilter
{
  return self->_useTrilinearMinificationFilter;
}

- (BOOL)annotationsEnabled
{
  return self->_annotationsEnabled;
}

- (_SSSScreenshotCropableView)cachedOutputImageView
{
  return self->_cachedOutputImageView;
}

- (void)setCachedOutputImageView:(id)a3
{
  objc_storeStrong((id *)&self->_cachedOutputImageView, a3);
}

- (VKCImageAnalyzer)imageAnalyzer
{
  return self->_imageAnalyzer;
}

- (void)setImageAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_imageAnalyzer, a3);
}

- (unint64_t)interactionMode
{
  return self->_interactionMode;
}

- (BOOL)inhibitImageAnalysis
{
  return self->_inhibitImageAnalysis;
}

- (BOOL)hasOutstandingEdits
{
  return self->_hasOutstandingEdits;
}

- (void)setHasOutstandingEdits:(BOOL)a3
{
  self->_hasOutstandingEdits = a3;
}

- (VKCImageAnalysisInteraction)imageInteraction
{
  return self->_imageInteraction;
}

- (void)setImageInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_imageInteraction, a3);
}

- (OS_dispatch_queue)analysisHelperQueue
{
  return self->_analysisHelperQueue;
}

- (void)setAnalysisHelperQueue:(id)a3
{
  objc_storeStrong((id *)&self->_analysisHelperQueue, a3);
}

- (int)currentInProcessRequestID
{
  return self->_currentInProcessRequestID;
}

- (void)setCurrentInProcessRequestID:(int)a3
{
  self->_currentInProcessRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisHelperQueue, 0);
  objc_storeStrong((id *)&self->_imageInteraction, 0);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_cachedOutputImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
