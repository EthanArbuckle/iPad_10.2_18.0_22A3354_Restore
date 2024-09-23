@implementation CNPhotoPickerAnimojiPosePreviewView

- (void)setupPreview
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_class *v8;
  AVTView *v9;
  AVTView *avtView;
  void *v11;
  CAShapeLayer *v12;
  CAShapeLayer *clippingLayer;
  CAShapeLayer *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  -[CNPhotoPickerAnimojiPosePreviewView frame](self, "frame");
  v4 = v3;
  -[CNPhotoPickerAnimojiPosePreviewView frame](self, "frame");
  v6 = v5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v7 = (void *)getAVTViewClass_softClass_51895;
  v20 = getAVTViewClass_softClass_51895;
  if (!getAVTViewClass_softClass_51895)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getAVTViewClass_block_invoke_51896;
    v16[3] = &unk_1E204EBC0;
    v16[4] = &v17;
    __getAVTViewClass_block_invoke_51896((uint64_t)v16);
    v7 = (void *)v18[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v17, 8);
  v9 = (AVTView *)objc_msgSend([v8 alloc], "initWithFrame:", 0.0, 0.0, v4, v6);
  avtView = self->_avtView;
  self->_avtView = v9;

  -[AVTView setEnableFaceTracking:](self->_avtView, "setEnableFaceTracking:", 0);
  -[AVTView setAutoresizingMask:](self->_avtView, "setAutoresizingMask:", 18);
  +[CNUIColorRepository photoPickerAvatarBackgroundDefaultColor](CNUIColorRepository, "photoPickerAvatarBackgroundDefaultColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTView setBackgroundColor:](self->_avtView, "setBackgroundColor:", v11);

  -[CNPhotoPickerAnimojiPosePreviewView addSubview:](self, "addSubview:", self->_avtView);
  v12 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
  clippingLayer = self->_clippingLayer;
  self->_clippingLayer = v12;

  v14 = self->_clippingLayer;
  -[AVTView layer](self->_avtView, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMask:", v14);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNPhotoPickerAnimojiPosePreviewView;
  -[CNPhotoPickerPreviewView layoutSubviews](&v8, sel_layoutSubviews);
  v3 = (void *)MEMORY[0x1E0DC3508];
  -[CNPhotoPickerAnimojiPosePreviewView avtView](self, "avtView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGPath");
  -[CNPhotoPickerAnimojiPosePreviewView clippingLayer](self, "clippingLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPath:", v6);

}

- (void)updatePreviewWithItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[CNPhotoPickerAnimojiPosePreviewView avtView](self, "avtView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "avatar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "poseConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerAnimojiPosePreviewView updatePoseWithConfiguration:](self, "updatePoseWithConfiguration:", v10);

    }
    else
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2050000000;
      v11 = (void *)getAVTAvatarRecordRenderingClass_softClass_51877;
      v20 = getAVTAvatarRecordRenderingClass_softClass_51877;
      if (!getAVTAvatarRecordRenderingClass_softClass_51877)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __getAVTAvatarRecordRenderingClass_block_invoke_51878;
        v16[3] = &unk_1E204EBC0;
        v16[4] = &v17;
        __getAVTAvatarRecordRenderingClass_block_invoke_51878((uint64_t)v16);
        v11 = (void *)v18[3];
      }
      v12 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v17, 8);
      objc_msgSend(v7, "avatarRecord");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "avatarForRecord:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerAnimojiPosePreviewView avtView](self, "avtView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAvatar:", v14);

    }
  }

}

- (void)updatePoseWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_msgSend(v4, "loadIfNeeded");
  -[CNPhotoPickerAnimojiPosePreviewView avtView](self, "avtView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avatar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stopTransitionAnimation");
  objc_msgSend(v4, "poseAnimation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "staticPose");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pose");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__CNPhotoPickerAnimojiPosePreviewView_updatePoseWithConfiguration___block_invoke;
  v11[3] = &unk_1E2050400;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v6, "transitionFromPose:toPose:duration:delay:completionHandler:", v9, v10, v11, 0.25, 0.0);

}

- (AVTView)avtView
{
  return self->_avtView;
}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (void)setClippingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_clippingLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clippingLayer, 0);
  objc_storeStrong((id *)&self->_avtView, 0);
}

void __67__CNPhotoPickerAnimojiPosePreviewView_updatePoseWithConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "avtView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPose:", *(_QWORD *)(a1 + 40));

}

@end
