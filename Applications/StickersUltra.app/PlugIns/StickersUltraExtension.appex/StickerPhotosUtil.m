@implementation StickerPhotosUtil

- (void)loadLivePhotoFromItemProvider:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v7 = objc_msgSend(v8, "loadObjectOfClass:completionHandler:", objc_opt_class(PHLivePhoto, v6), v5);

}

- (void)loadImageFromItemProvider:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v7 = objc_msgSend(v8, "loadObjectOfClass:completionHandler:", objc_opt_class(UIImage, v6), v5);

}

- (void)imageAnalysisInteraction:(id)a3 createStickerRepresentationsAtIndexSet:(id)a4 type:(unint64_t)a5 stickerIDs:(id)a6 progress:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v13 = a6;
  v14 = a7;
  v15 = a8;
  v16 = a4;
  v17 = a3;
  if ((objc_opt_respondsToSelector(v17, "createStickerRepresentationsAtIndexSet:type:stickerIDs:progress:completion:") & 1) != 0)
  {
    objc_msgSend(v17, "createStickerRepresentationsAtIndexSet:type:stickerIDs:progress:completion:", v16, a5, v13, v14, v15);

  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100009A68;
    v18[3] = &unk_10008A090;
    v19 = v15;
    objc_msgSend(v17, "createStickerRepresentationsAtIndexSet:completion:", v16, v18);

    v17 = v19;
  }

}

- (id)imageAnalysisInteraction:(id)a3 videoPreviewSubjectMatteAtCompositionTime:(id *)a4
{
  id v5;
  void *v6;
  __int128 v8;
  int64_t var3;

  v5 = a3;
  if ((objc_opt_respondsToSelector(v5, "videoPreviewSubjectMatteAtCompositionTime:") & 1) != 0)
  {
    v8 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "videoPreviewSubjectMatteAtCompositionTime:", &v8));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- ($EBD969CC01689D77F00D98CF40540A93)videoPreviewTimeRangeForImageAnalysisInteraction:(SEL)a3
{
  id v5;
  $EBD969CC01689D77F00D98CF40540A93 *result;
  CMTime v7;
  CMTime start;

  v5 = a4;
  if ((objc_opt_respondsToSelector(v5, "videoPreviewTimeRange") & 1) != 0)
  {
    if (v5)
    {
      objc_msgSend(v5, "videoPreviewTimeRange");
    }
    else
    {
      *(_OWORD *)&retstr->var0.var3 = 0u;
      *(_OWORD *)&retstr->var1.var1 = 0u;
      *(_OWORD *)&retstr->var0.var0 = 0u;
    }
  }
  else
  {
    start = kCMTimeZero;
    v7 = start;
    CMTimeRangeMake((CMTimeRange *)retstr, &start, &v7);
  }

  return result;
}

- (CGRect)videoPreviewNormalizedCropRectForImageAnalysisInteraction:(id)a3
{
  id v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "videoPreviewNormalizedCropRect") & 1) != 0)
  {
    objc_msgSend(v3, "videoPreviewNormalizedCropRect");
    x = v4;
    y = v6;
    width = v8;
    height = v10;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setUsesLightDimmingViewInLightModeForImageAnalysisInteraction:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "setUsesLightDimmingViewInLightMode:") & 1) != 0)
    objc_msgSend(v3, "setUsesLightDimmingViewInLightMode:", 1);

}

@end
