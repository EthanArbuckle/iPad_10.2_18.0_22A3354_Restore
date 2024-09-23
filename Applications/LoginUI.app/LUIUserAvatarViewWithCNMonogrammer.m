@implementation LUIUserAvatarViewWithCNMonogrammer

- (LUIUserAvatarViewWithCNMonogrammer)initWithFrame:(CGRect)a3
{
  LUIUserAvatarViewWithCNMonogrammer *v3;
  LUIUserAvatarViewWithCNMonogrammer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIUserAvatarViewWithCNMonogrammer;
  v3 = -[LUIUserAvatarView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LUIUserAvatarViewWithCNMonogrammer _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  NSOperationQueue *v3;
  NSOperationQueue *mOperationQueue;
  UIImageView *v5;
  UIImageView *imageView;

  v3 = objc_opt_new(NSOperationQueue);
  mOperationQueue = self->mOperationQueue;
  self->mOperationQueue = v3;

  v5 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  imageView = self->imageView;
  self->imageView = v5;

  -[LUIUserAvatarViewWithCNMonogrammer addSubview:](self, "addSubview:", self->imageView);
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LUIUserAvatarViewWithCNMonogrammer;
  -[LUIUserAvatarView layoutSubviews](&v10, "layoutSubviews");
  -[UIImageView frame](self->imageView, "frame");
  -[LUIUserAvatarViewWithCNMonogrammer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[LUIUserAvatarView monogramDiameter](self, "monogramDiameter");
  v8 = v7;
  -[LUIUserAvatarView monogramDiameter](self, "monogramDiameter");
  -[UIImageView setFrame:](self->imageView, "setFrame:", (v4 - v8) * 0.5, (v6 - v9) * 0.5, v8);
  -[UIImageView layoutSubviews](self->imageView, "layoutSubviews");
}

- (BOOL)_isDistortedImage:(id)a3
{
  id v4;
  double v5;
  void *v6;
  CGColor *v7;
  float64x2_t *Components;
  BOOL v9;

  v4 = a3;
  -[LUIUserAvatarView monogramDiameter](self, "monogramDiameter");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorAtPixel:", v5 * 0.5, 20.0));

  if (v6)
  {
    v7 = CGColorRetain((CGColorRef)objc_msgSend(objc_retainAutorelease(v6), "CGColor"));
    if (CGColorGetNumberOfComponents(v7) >= 4 && (Components = (float64x2_t *)CGColorGetComponents(v7)) != 0)
      v9 = vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqzq_f64(*Components), (int32x4_t)vceqzq_f64(Components[1])))) & 1;
    else
      v9 = 0;
    CGColorRelease(v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateMonogram
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIImageView *imageView;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  LUIUserAvatarViewWithCNMonogrammer *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  LUIUserAvatarViewWithCNMonogrammer *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)LUIUserAvatarViewWithCNMonogrammer;
  -[LUIUserAvatarView updateMonogram](&v25, "updateMonogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserAvatarView contacts](self, "contacts"));
  if (objc_msgSend(v3, "count"))
  {
    -[LUIUserAvatarView monogramDiameter](self, "monogramDiameter");
    v5 = v4;

    if (v5 <= 0.0)
      return;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v7 = objc_msgSend(v6, "avatarStyle");
    -[LUIUserAvatarView monogramDiameter](self, "monogramDiameter");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIMonogrammerSupport monogramWithStyle:diameter:](LUIMonogrammerSupport, "monogramWithStyle:diameter:", v7));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserAvatarView contacts](self, "contacts"));
    v9 = objc_msgSend(v8, "count");

    if (v9 == (id)1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserAvatarView contacts](self, "contacts"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[LUIImageCache sharedInstance](LUIImageCache, "sharedInstance"));
      -[LUIUserAvatarView monogramDiameter](self, "monogramDiameter");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageForContact:forMonogramDiameter:", v11));

      imageView = self->imageView;
      if (v13)
      {
        -[UIImageView setImage:](self->imageView, "setImage:", v13);
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "silhouetteMonogram"));
        -[UIImageView setImage:](imageView, "setImage:", v16);

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10002E0E4;
        v21[3] = &unk_100068D60;
        v22 = v3;
        v23 = v11;
        v24 = self;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v21));
        -[NSOperationQueue addOperation:](self->mOperationQueue, "addOperation:", v17);

      }
    }
    else
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10002E2B8;
      v18[3] = &unk_100068C30;
      v19 = v3;
      v20 = self;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v18));
      -[NSOperationQueue addOperation:](self->mOperationQueue, "addOperation:", v15);

      v11 = v19;
    }

    -[LUIUserAvatarViewWithCNMonogrammer setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setImageViewAlpha:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUIUserAvatarViewWithCNMonogrammer;
  -[LUIUserAvatarView setImageViewAlpha:](&v5, "setImageViewAlpha:");
  -[UIImageView setAlpha:](self->imageView, "setAlpha:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOperationQueue, 0);
  objc_storeStrong((id *)&self->imageView, 0);
  objc_storeStrong((id *)&self->monogrammer, 0);
}

@end
