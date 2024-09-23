@implementation PKOverlayDrawingView

- (PKOverlayDrawingView)initWithFrame:(CGRect)a3
{
  PKOverlayDrawingView *v3;
  PKOverlayDrawingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKOverlayDrawingView;
  v3 = -[PKOverlayDrawingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKOverlayDrawingView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    -[PKOverlayDrawingView setClipsToBounds:](v4, "setClipsToBounds:", 0);
  }
  return v4;
}

- (id)imageView
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 52);
  return WeakRetained;
}

- (void)showImageView:(uint64_t)a3 frame:(double)a4 animationType:(double)a5 animationDuration:(double)a6
{
  id v14;
  id WeakRetained;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  _QWORD v42[5];
  id v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;

  v14 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 52);
    objc_msgSend(a1, "frame");
    v17 = v16 - a4;
    v19 = v18 - a5;
    objc_storeWeak(a1 + 52, v14);
    if (a3 == 1)
      v20 = a7 * 1.5 + 0.0;
    else
      v20 = 0.0;
    v21 = (void *)MEMORY[0x1E0DC3F10];
    v22 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __76__PKOverlayDrawingView_showImageView_frame_animationType_animationDuration___block_invoke;
    v42[3] = &unk_1E777AAC8;
    v42[4] = a1;
    v45 = a4;
    v46 = a5;
    v47 = a6;
    v48 = a7;
    v23 = WeakRetained;
    v43 = v23;
    v49 = v17;
    v50 = v19;
    v24 = v14;
    v44 = v24;
    v51 = 0;
    v52 = v20;
    v53 = a6;
    v54 = a7;
    objc_msgSend(v21, "performWithoutAnimation:", v42);
    v25 = (void *)MEMORY[0x1E0DC3F10];
    v35[0] = v22;
    v35[1] = 3221225472;
    v35[2] = __76__PKOverlayDrawingView_showImageView_frame_animationType_animationDuration___block_invoke_2;
    v35[3] = &unk_1E777AAF0;
    v38 = 0;
    v39 = 0;
    v36 = v24;
    v40 = a6;
    v41 = a7;
    v37 = v23;
    v28[0] = v22;
    v28[1] = 3221225472;
    v28[2] = __76__PKOverlayDrawingView_showImageView_frame_animationType_animationDuration___block_invoke_3;
    v28[3] = &unk_1E777AB18;
    v29 = v37;
    v31 = 0;
    v32 = 0;
    v30 = v36;
    v33 = a6;
    v34 = a7;
    v26 = v37;
    objc_msgSend(v25, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v35, v28, a8, 0.0, 1.0, 400.0, 20.0, 0.0);

  }
}

uint64_t __76__PKOverlayDrawingView_showImageView_frame_animationType_animationDuration___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v2, "frame");
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 88) + v3, v4 + *(double *)(a1 + 96));
  }
  return objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
}

uint64_t __76__PKOverlayDrawingView_showImageView_frame_animationType_animationDuration___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __76__PKOverlayDrawingView_showImageView_frame_animationType_animationDuration___block_invoke_3(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)hideImageViewWithDuration:(double)a3
{
  __int128 v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  if (a1)
  {
    objc_setProperty_nonatomic_copy((id)a1, a2, &stru_1E777DEE8, 432);
    v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(a1 + 440) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(a1 + 456) = v5;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 416));
    v7 = WeakRetained;
    if (WeakRetained)
    {
      v8 = (void *)MEMORY[0x1E0DC3F10];
      v9 = MEMORY[0x1E0C809B0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __50__PKOverlayDrawingView_hideImageViewWithDuration___block_invoke;
      v12[3] = &unk_1E7778020;
      v13 = WeakRetained;
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __50__PKOverlayDrawingView_hideImageViewWithDuration___block_invoke_2;
      v10[3] = &unk_1E7778650;
      v11 = v13;
      objc_msgSend(v8, "animateWithDuration:animations:completion:", v12, v10, a3);

    }
  }
}

uint64_t __50__PKOverlayDrawingView_hideImageViewWithDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __50__PKOverlayDrawingView_hideImageViewWithDuration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_imageView);
}

@end
