@implementation CKOrganicImageLivePhotoBalloonView

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  __int128 v12;
  void *v13;
  _OWORD v14[3];
  objc_super v15;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKOrganicImageLivePhotoBalloonView frame](self, "frame");
  v21.origin.x = v8;
  v21.origin.y = v9;
  v21.size.width = v10;
  v21.size.height = v11;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (!CGRectEqualToRect(v20, v21))
  {
    v18 = 0u;
    v19 = 0u;
    v17 = 0u;
    -[CKOrganicImageLivePhotoBalloonView transform](self, "transform");
    v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v16[0] = *MEMORY[0x1E0C9BAA8];
    v16[1] = v12;
    v16[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[CKOrganicImageLivePhotoBalloonView setTransform:](self, "setTransform:", v16);
    v15.receiver = self;
    v15.super_class = (Class)CKOrganicImageLivePhotoBalloonView;
    -[CKBalloonView setFrame:](&v15, sel_setFrame_, x, y, width, height);
    -[CKLivePhotoBalloonView livePhotoView](self, "livePhotoView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKOrganicImageLivePhotoBalloonView bounds](self, "bounds");
    objc_msgSend(v13, "setFrame:");

    v14[0] = v17;
    v14[1] = v18;
    v14[2] = v19;
    -[CKOrganicImageLivePhotoBalloonView setTransform:](self, "setTransform:", v14);
  }
}

- (BOOL)canUseOpaqueMask
{
  return 0;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  CKBalloonDescriptor_t *result;
  objc_super v5;

  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v5.receiver = self;
  v5.super_class = (Class)CKOrganicImageLivePhotoBalloonView;
  result = (CKBalloonDescriptor_t *)-[CKBalloonDescriptor_t balloonDescriptor](&v5, sel_balloonDescriptor);
  retstr->var4 = -1;
  retstr->var1 = 0;
  return result;
}

- (void)prepareForReuse
{
  __int128 v3;
  _OWORD v4[3];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKOrganicImageLivePhotoBalloonView;
  -[CKImageBalloonView prepareForReuse](&v5, sel_prepareForReuse);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[CKOrganicImageLivePhotoBalloonView setTransform:](self, "setTransform:", v4);
}

@end
