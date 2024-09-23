@implementation PKStrokePreviewView

- (PKStrokePreviewView)initWithFrame:(CGRect)a3
{
  PKStrokePreviewView *v3;
  PKStrokePreviewView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKStrokePreviewView;
  v3 = -[PKStrokePreviewView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKStrokePreviewView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (void)prepareWithFrame:(double)a3 strokeBounds:(double)a4 strokes:(double)a5
{
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  dispatch_semaphore_t v28;
  PKImageRenderer *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  _BOOL4 v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  double x;
  double y;
  double width;
  double height;
  CGImage *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  double v59;
  _QWORD v60[4];
  NSObject *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  CGRect v69;
  CGRect v70;

  v19 = a2;
  v20 = v19;
  if (a1)
  {
    if (objc_msgSend(v19, "count"))
    {
      if (!a1[54])
      {
        v21 = objc_alloc_init(MEMORY[0x1E0C9DD90]);
        v22 = a1[54];
        a1[54] = v21;

      }
      objc_msgSend(a1, "window", *(_QWORD *)&a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "screen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "nativeScale");
      v26 = v25;

      v27 = fmax(v26, 1.0);
      v28 = dispatch_semaphore_create(0);
      v29 = -[PKImageRenderer initWithSize:scale:renderQueue:sixChannelBlending:]([PKImageRenderer alloc], "initWithSize:scale:renderQueue:sixChannelBlending:", 0, 0, a5, a6, v27);
      objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKImageRenderer setInvertColors:](v29, "setInvertColors:", objc_msgSend(v30, "userInterfaceStyle") == 2);

      v63 = 0;
      v64 = &v63;
      v65 = 0x3032000000;
      v66 = __Block_byref_object_copy__26;
      v67 = __Block_byref_object_dispose__26;
      v68 = 0;
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __61__PKStrokePreviewView_prepareWithFrame_strokeBounds_strokes___block_invoke;
      v60[3] = &unk_1E7779240;
      v62 = &v63;
      v31 = v28;
      v61 = v31;
      -[PKImageRenderer renderStrokes:clippedToStrokeSpaceRect:scale:completion:](v29, "renderStrokes:clippedToStrokeSpaceRect:scale:completion:", v20, v60, a7, a8, a9, a10, v27);
      dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(a1, "traitCollection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "userInterfaceStyle");

      v34 = v33 == 2;
      if (v33 == 2)
        v35 = 0.5;
      else
        v35 = 0.0;
      objc_msgSend(MEMORY[0x1E0C9DDB8], "colorMatrixFilter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setRVector:", v37);

      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setGVector:", v38);

      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, v35);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setBVector:", v39);
      v40 = dbl_1BE4FE7E0[v34];

      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAVector:", v41);

      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", objc_msgSend(objc_retainAutorelease((id)v64[5]), "CGImage"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setInputImage:", v42);

      objc_msgSend(v36, "outputImage");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "imageByApplyingGaussianBlurWithSigma:", 2.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      objc_msgSend(a1, "setFrame:", a3, v59, a5, a6);
      if (!a1[53])
      {
        v45 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
        v46 = a1[53];
        a1[53] = v45;

        objc_msgSend(a1, "layer");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addSublayer:", a1[53]);

      }
      objc_msgSend(a1, "bounds");
      v70 = CGRectInset(v69, -2.0, -2.0);
      x = v70.origin.x;
      y = v70.origin.y;
      width = v70.size.width;
      height = v70.size.height;
      v52 = (CGImage *)objc_msgSend(a1[54], "createCGImage:fromRect:", v44, v27 * v70.origin.x, v27 * v70.origin.y, v27 * v70.size.width, v27 * v70.size.height);
      objc_msgSend(a1[53], "setContents:", v52);
      CGImageRelease(v52);
      objc_msgSend(a1[53], "setFrame:", x + 2.0, y + 2.0, width, height);
      if (!a1[52])
      {
        v53 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
        v54 = a1[52];
        a1[52] = v53;

        objc_msgSend(a1, "layer");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addSublayer:", a1[52]);

      }
      objc_msgSend(a1, "bounds");
      objc_msgSend(a1[52], "setFrame:");
      objc_msgSend(a1[52], "setContents:", objc_msgSend(objc_retainAutorelease((id)v64[5]), "CGImage"));
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

      _Block_object_dispose(&v63, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      objc_msgSend(a1[52], "removeFromSuperlayer");
      v56 = a1[52];
      a1[52] = 0;

      objc_msgSend(a1[53], "removeFromSuperlayer");
      v57 = a1[53];
      a1[53] = 0;

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      v58 = a1[54];
      a1[54] = 0;

    }
  }

}

void __61__PKStrokePreviewView_prepareWithFrame_strokeBounds_strokes___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_drawingLayer, 0);
}

@end
