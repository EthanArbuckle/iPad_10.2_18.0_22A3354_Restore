@implementation SSSScreenshotMutableModificationInfo

- (void)setCropInfo:(SSSCropInfo *)a3
{
  CGSize totalSize;
  CGSize size;
  id v6;

  totalSize = a3->totalSize;
  size = a3->currentRect.size;
  self->super._cropInfo.currentRect.origin = a3->currentRect.origin;
  self->super._cropInfo.currentRect.size = size;
  self->super._cropInfo.totalSize = totalSize;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotMutableModificationInfo changeObserver](self, "changeObserver"));
  objc_msgSend(v6, "screenshotMutableModificationInfo:valueChangedForKey:", self, 0);

}

- (void)setAnnotationNSDatas:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->super._annotationNSDatas, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotMutableModificationInfo changeObserver](self, "changeObserver"));
  objc_msgSend(v4, "screenshotMutableModificationInfo:valueChangedForKey:", self, 1);

}

- (void)setOriginalAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->super._originalAnnotations, a3);
}

- (void)setVellumOpacity:(double)a3
{
  id v4;

  self->super._vellumOpacity = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotMutableModificationInfo changeObserver](self, "changeObserver"));
  objc_msgSend(v4, "screenshotMutableModificationInfo:valueChangedForKey:", self, 3);

}

- (void)setImageDescription:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->super._imageDescription, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotMutableModificationInfo changeObserver](self, "changeObserver"));
  objc_msgSend(v4, "screenshotMutableModificationInfo:valueChangedForKey:", self, 4);

}

- (void)setPaperKitChangeCounter:(unint64_t)a3
{
  id v4;

  self->super._paperKitChangeCounter = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotMutableModificationInfo changeObserver](self, "changeObserver"));
  objc_msgSend(v4, "screenshotMutableModificationInfo:valueChangedForKey:", self, 2);

}

- (void)takeValueFromModificationInfo:(id)a3 forKey:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v10[3];

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0uLL:
      if (v6)
        objc_msgSend(v6, "cropInfo");
      else
        memset(v10, 0, sizeof(v10));
      -[SSSScreenshotMutableModificationInfo setCropInfo:](self, "setCropInfo:", v10);
      break;
    case 1uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotationNSDatas"));
      -[SSSScreenshotMutableModificationInfo setAnnotationNSDatas:](self, "setAnnotationNSDatas:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "originalAnnotations"));
      -[SSSScreenshotMutableModificationInfo setOriginalAnnotations:](self, "setOriginalAnnotations:", v9);
      goto LABEL_8;
    case 2uLL:
      -[SSSScreenshotMutableModificationInfo setPaperKitChangeCounter:](self, "setPaperKitChangeCounter:", objc_msgSend(v6, "paperKitChangeCounter"));
      break;
    case 3uLL:
      objc_msgSend(v6, "vellumOpacity");
      -[SSSScreenshotMutableModificationInfo setVellumOpacity:](self, "setVellumOpacity:");
      break;
    case 4uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageDescription"));
      -[SSSScreenshotMutableModificationInfo setImageDescription:](self, "setImageDescription:", v9);
LABEL_8:

      break;
    default:
      break;
  }

}

- (SSSScreenshotMutableModificationInfoChangeObserver)changeObserver
{
  return (SSSScreenshotMutableModificationInfoChangeObserver *)objc_loadWeakRetained((id *)&self->_changeObserver);
}

- (void)setChangeObserver:(id)a3
{
  objc_storeWeak((id *)&self->_changeObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_changeObserver);
}

@end
