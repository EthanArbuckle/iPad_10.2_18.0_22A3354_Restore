@implementation MUPlaceCoverPhotoTransitionController

- (MUPlaceCoverPhotoTransitionController)initWithMetrics:(MUPlaceHeaderMetrics *)a3 updateHandler:(id)a4
{
  id v6;
  char *v7;
  MUPlaceCoverPhotoTransitionController *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  id updateHandler;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceCoverPhotoTransitionController;
  v7 = -[MUPlaceCoverPhotoTransitionController init](&v15, sel_init);
  v8 = (MUPlaceCoverPhotoTransitionController *)v7;
  if (v7)
  {
    *(_OWORD *)(v7 + 8) = *(_OWORD *)&a3->topToTitleSpacing;
    v9 = *(_OWORD *)&a3->coverPhotoMetrics.hasLogo;
    v10 = *(_OWORD *)&a3->coverPhotoMetrics.logoSize.height;
    v11 = *(_OWORD *)&a3->coverPhotoMetrics.coverPhotoContainerToTitleSpacing;
    *((_QWORD *)v7 + 9) = *(_QWORD *)&a3->coverPhotoMetrics.endingLogoAlphaTransitionValue;
    *(_OWORD *)(v7 + 56) = v11;
    *(_OWORD *)(v7 + 40) = v10;
    *(_OWORD *)(v7 + 24) = v9;
    v12 = _Block_copy(v6);
    updateHandler = v8->_updateHandler;
    v8->_updateHandler = v12;

  }
  return v8;
}

- (void)setExpansionProgress:(double)a3
{
  double v3;

  v3 = fmin(fmax(a3, 0.0), 1.0);
  if (self->_expansionProgress != v3)
  {
    self->_expansionProgress = v3;
    -[MUPlaceCoverPhotoTransitionController _updateWithOldProgress:](self, "_updateWithOldProgress:");
  }
}

- (BOOL)hideLogo
{
  return self->_expansionProgress == 0.0;
}

- (double)coverPhotoAlpha
{
  return self->_expansionProgress;
}

- (double)coverPhotoHeightForProposedWidth:(double)a3
{
  double coverPhotoBottomToLogoBottomSpacing;
  double v4;
  double v5;

  if (self->_metrics.coverPhotoMetrics.hasLogo)
    coverPhotoBottomToLogoBottomSpacing = self->_metrics.coverPhotoMetrics.coverPhotoBottomToLogoBottomSpacing;
  else
    coverPhotoBottomToLogoBottomSpacing = 0.0;
  v4 = coverPhotoBottomToLogoBottomSpacing + self->_metrics.coverPhotoMetrics.aspectRatio * a3;
  -[MUPlaceCoverPhotoTransitionController expansionProgress](self, "expansionProgress");
  return v4 * v5;
}

- (void)_updateWithOldProgress:(double)a3
{
  double expansionProgress;
  int64_t v5;
  void (**updateHandler)(id, MUPlaceCoverPhotoTransitionController *);

  expansionProgress = self->_expansionProgress;
  if (expansionProgress <= a3)
  {
    if (expansionProgress >= a3)
      goto LABEL_6;
    v5 = 2;
  }
  else
  {
    v5 = 1;
  }
  self->_currentScrollDirection = v5;
LABEL_6:
  updateHandler = (void (**)(id, MUPlaceCoverPhotoTransitionController *))self->_updateHandler;
  if (updateHandler)
    updateHandler[2](updateHandler, self);
}

- (double)logoImageAlpha
{
  double result;

  if ((unint64_t)(self->_currentScrollDirection - 1) > 1)
    return 0.0;
  -[MUPlaceCoverPhotoTransitionController _logoImageAlphaForVerticalDrag](self, "_logoImageAlphaForVerticalDrag");
  return result;
}

- (double)_logoImageAlphaForVerticalDrag
{
  double v3;
  double v4;
  double startingLogoAlphaTransitionValue;
  double v6;
  double endingLogoAlphaTransitionValue;
  double v8;
  double v9;
  NSObject *v10;
  double v12;
  uint8_t buf[4];
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MUPlaceCoverPhotoTransitionController expansionProgress](self, "expansionProgress");
  v4 = v3;
  startingLogoAlphaTransitionValue = self->_metrics.coverPhotoMetrics.startingLogoAlphaTransitionValue;
  v6 = 0.0;
  if (v4 >= startingLogoAlphaTransitionValue)
  {
    endingLogoAlphaTransitionValue = self->_metrics.coverPhotoMetrics.endingLogoAlphaTransitionValue;
    v6 = 1.0;
    if (v4 <= endingLogoAlphaTransitionValue)
    {
      v8 = v4 - startingLogoAlphaTransitionValue;
      v9 = endingLogoAlphaTransitionValue - startingLogoAlphaTransitionValue;
      if (qword_1ED01B518 != -1)
      {
        v12 = v9;
        dispatch_once(&qword_1ED01B518, &__block_literal_global_3);
        v9 = v12;
      }
      v10 = _MergedGlobals_115;
      v6 = v8 / v9;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_115, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v14 = v4;
        v15 = 2048;
        v16 = v6;
        _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_DEBUG, "Progress for logo transition is %f and evaluated alpha is %f", buf, 0x16u);
      }
    }
  }
  return v6;
}

- (double)interpolatedCoverPhotoToTitleSpacing
{
  double topToTitleSpacing;
  double v4;

  topToTitleSpacing = self->_metrics.topToTitleSpacing;
  if (!self->_metrics.coverPhotoMetrics.hasLogo)
    return self->_metrics.topToTitleSpacing;
  -[MUPlaceCoverPhotoTransitionController expansionProgress](self, "expansionProgress");
  return topToTitleSpacing - v4 * self->_metrics.coverPhotoMetrics.coverPhotoContainerToTitleSpacing;
}

- (BOOL)shouldBlurChromeHeaderButtons
{
  return self->_expansionProgress > 0.3;
}

- (int64_t)currentScrollDirection
{
  return self->_currentScrollDirection;
}

- (double)expansionProgress
{
  return self->_expansionProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
}

@end
