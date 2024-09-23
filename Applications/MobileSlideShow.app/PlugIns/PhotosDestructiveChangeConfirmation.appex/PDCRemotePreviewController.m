@implementation PDCRemotePreviewController

- (void)loadView
{
  double y;
  double v4;
  double v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  void *v15;
  id v16;

  y = CGPointZero.y;
  -[PDCRemotePreviewController preferredContentSize](self, "preferredContentSize");
  v16 = objc_msgSend(objc_alloc((Class)PUStackView), "initWithFrame:", CGPointZero.x, y, v4, v5);
  v6 = +[PUStackView maximumNumberOfVisibleImagesForStyle:](PUStackView, "maximumNumberOfVisibleImagesForStyle:", 1);
  objc_msgSend(v16, "setStyle:", 1);
  objc_msgSend(v16, "setStackPerspectiveInsets:", 0.0, 5.0, 0.0, 5.0);
  objc_msgSend(v16, "setStackPerspectiveOffset:", 0.0, -3.5);
  v7 = objc_alloc_init((Class)PUPhotoDecoration);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v7, "setBorderColor:", v8);

  objc_msgSend(v7, "setBorderWidth:", 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v7, "setForegroundColor:", v9);

  PUPixelSizeFromPointSize(objc_msgSend(v16, "setPhotoDecoration:", v7), 272.0, 204.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDCRemotePreviewController imagesWithTargetSize:contentMode:maximumCount:](self, "imagesWithTargetSize:contentMode:maximumCount:", 1, v6));
  objc_msgSend(v16, "setNumberOfVisibleItems:", objc_msgSend(v10, "count"));
  v11 = (double)((unint64_t)objc_msgSend(v16, "numberOfVisibleItems") - 1);
  objc_msgSend(v16, "stackPerspectiveOffset");
  v13 = 204.0 - v11 * fabs(v12);
  objc_msgSend(v16, "setStackSize:", 272.0, v13);
  objc_msgSend(v16, "setStackOffset:", 0.0, (204.0 - v13) * 0.5);
  if (objc_msgSend(v10, "count"))
  {
    v14 = 0;
    do
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v14));
      objc_msgSend(v16, "setImage:forItemAtIndex:", v15, v14);

      ++v14;
    }
    while (v14 < (unint64_t)objc_msgSend(v10, "count"));
  }
  -[PDCRemotePreviewController setView:](self, "setView:", v16);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 272.0;
  v3 = 204.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)imagesWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 maximumCount:(unint64_t)a5
{
  return 0;
}

@end
