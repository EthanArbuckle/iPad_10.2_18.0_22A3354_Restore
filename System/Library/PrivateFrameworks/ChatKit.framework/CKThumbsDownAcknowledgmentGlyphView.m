@implementation CKThumbsDownAcknowledgmentGlyphView

- (int64_t)acknowledgmentType
{
  return 2002;
}

- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  dispatch_time_t v32;
  void *v33;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidY;
  double MaxX;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  uint64_t v46;
  void *v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double MidX;
  double v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  id v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  _QWORD block[4];
  id v74;
  _QWORD aBlock[5];
  id v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  v7 = a5;
  -[CKThumbsDownAcknowledgmentGlyphView animationLayer](self, "animationLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 1);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v9 = (void *)MEMORY[0x1E0CD28B0];
  -[CKThumbsDownAcknowledgmentGlyphView animationDuration](self, "animationDuration");
  objc_msgSend(v9, "setAnimationDuration:");
  -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "position");
  v13 = v12;
  v15 = v14;

  -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeFromSuperview");

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKThumbsDownAcknowledgmentGlyphView setAnimationLayer:](self, "setAnimationLayer:", v26);
  v27 = v24;
  objc_msgSend(v26, "setBounds:", v18, v20, v22, v24);
  objc_msgSend(v26, "setPosition:", v13, v15);
  -[CKThumbsDownAcknowledgmentGlyphView layer](self, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSublayer:", v26);

  v29 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__CKThumbsDownAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke;
  aBlock[3] = &unk_1E274A108;
  aBlock[4] = self;
  v30 = v26;
  v76 = v30;
  v31 = _Block_copy(aBlock);
  if (v7)
  {
    v32 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = v29;
    block[1] = 3221225472;
    block[2] = __87__CKThumbsDownAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke_2;
    block[3] = &unk_1E274AED0;
    v74 = v7;
    dispatch_after(v32, MEMORY[0x1E0C80D38], block);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v31);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v71 = v7;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  x = v77.origin.x;
  y = v77.origin.y;
  width = v77.size.width;
  height = v77.size.height;
  CGRectGetMidX(v77);
  v78.origin.x = x;
  v78.origin.y = y;
  v78.size.width = width;
  v78.size.height = height;
  MidY = CGRectGetMidY(v78);
  objc_msgSend(v30, "bounds");
  MaxX = CGRectGetMaxX(v79);
  v69 = v27;
  objc_msgSend(v33, "setBounds:", v18, v20, v22, v27);
  objc_msgSend(v33, "setPosition:", MaxX, MidY);
  objc_msgSend(v30, "addSublayer:", v33);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v41) = 1074137746;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFromValue:", v42);

  LODWORD(v43) = -1092655373;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setToValue:", v44);

  objc_msgSend(v40, "setMass:", 1.0);
  objc_msgSend(v40, "setStiffness:", 250.0);
  objc_msgSend(v40, "setDamping:", 20.0);
  LODWORD(v45) = 1.0;
  objc_msgSend(v40, "setSpeed:", v45);
  objc_msgSend(v40, "setDuration:", 1.15);
  objc_msgSend(v40, "setBeginTime:", a3);
  v70 = v31;
  v46 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v40, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v33, "addAnimation:forKey:", v40, CFSTR("transform.rotation.z"));
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bounds");
  v48 = v80.origin.x;
  v49 = v80.origin.y;
  v50 = v80.size.width;
  v51 = v80.size.height;
  MidX = CGRectGetMidX(v80);
  v81.origin.x = v48;
  v81.origin.y = v49;
  v81.size.width = v50;
  v81.size.height = v51;
  v53 = CGRectGetMidY(v81);
  objc_msgSend(v47, "setBounds:", v18, v20, v22, v69);
  objc_msgSend(v47, "setPosition:", MidX, v53);
  objc_msgSend(v33, "addSublayer:", v47);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v55) = 1054828275;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setToValue:", v56);

  objc_msgSend(v54, "setMass:", 1.0);
  objc_msgSend(v54, "setStiffness:", 400.0);
  objc_msgSend(v54, "setDamping:", 15.0);
  LODWORD(v57) = 1.0;
  objc_msgSend(v54, "setSpeed:", v57);
  objc_msgSend(v54, "setDuration:", 1.0);
  objc_msgSend(v54, "setBeginTime:", a3 + 0.150000006);
  objc_msgSend(v54, "setFillMode:", v46);
  objc_msgSend(v47, "addAnimation:forKey:", v54, CFSTR("transform.rotation.z"));
  -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "image");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v59);
  objc_msgSend(v60, "layer");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "bounds");
  v62 = v82.origin.x;
  v63 = v82.origin.y;
  v64 = v82.size.width;
  v65 = v82.size.height;
  CGRectGetMidX(v82);
  v83.origin.x = v62;
  v83.origin.y = v63;
  v83.size.width = v64;
  v83.size.height = v65;
  v66 = CGRectGetMidY(v83);
  objc_msgSend(v61, "setBounds:", v18, v20, v22, v69);
  objc_msgSend(v61, "setPosition:", 0.0, v66);
  v67 = objc_retainAutorelease(v59);
  objc_msgSend(v61, "setContents:", objc_msgSend(v67, "CGImage"));
  objc_msgSend(v67, "scale");
  objc_msgSend(v61, "setContentsScale:");
  objc_msgSend(v61, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
  -[CKThumbsDownAcknowledgmentGlyphView setContentLayer:](self, "setContentLayer:", v61);
  objc_msgSend(v47, "addSublayer:", v61);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setFromValue:", &unk_1E2870FD8);
  objc_msgSend(v68, "setMass:", 1.0);
  objc_msgSend(v68, "setStiffness:", 350.0);
  objc_msgSend(v68, "setDamping:", 25.0);
  objc_msgSend(v68, "setBeginTime:", a3 + 0.0500000007);
  objc_msgSend(v68, "setFillMode:", v46);
  objc_msgSend(v61, "addAnimation:forKey:", v68, CFSTR("transform.scale.xy"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __87__CKThumbsDownAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "glyph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperlayer");
}

uint64_t __87__CKThumbsDownAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)animationDuration
{
  return 1.15;
}

- (void)setGlyphColor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKThumbsDownAcknowledgmentGlyphView;
  -[CKSimpleAcknowledgementGlyphView setGlyphColor:](&v9, sel_setGlyphColor_, a3);
  -[CKThumbsDownAcknowledgmentGlyphView contentLayer](self, "contentLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKThumbsDownAcknowledgmentGlyphView contentLayer](self, "contentLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_retainAutorelease(v6);
    objc_msgSend(v7, "setContents:", objc_msgSend(v8, "CGImage"));

  }
}

- (CALayer)animationLayer
{
  return self->_animationLayer;
}

- (void)setAnimationLayer:(id)a3
{
  objc_storeStrong((id *)&self->_animationLayer, a3);
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_contentLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_animationLayer, 0);
}

@end
