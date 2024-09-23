@implementation CKThumbsUpAcknowledgmentGlyphView

- (int64_t)acknowledgmentType
{
  return 2001;
}

- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  id v29;
  dispatch_time_t v30;
  void *v31;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidY;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  uint64_t v43;
  void *v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double MidX;
  double v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  double MaxX;
  id v65;
  void *v66;
  void *v69;
  void *v70;
  double v71;
  _QWORD block[4];
  id v73;
  _QWORD aBlock[5];
  id v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  v6 = a5;
  -[CKThumbsUpAcknowledgmentGlyphView animationLayer](self, "animationLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v8 = (void *)MEMORY[0x1E0CD28B0];
  -[CKThumbsUpAcknowledgmentGlyphView animationDuration](self, "animationDuration");
  objc_msgSend(v8, "setAnimationDuration:");
  -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "position");
  v12 = v11;
  v14 = v13;

  -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeFromSuperview");

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKThumbsUpAcknowledgmentGlyphView setAnimationLayer:](self, "setAnimationLayer:", v25);
  v26 = v17;
  v71 = v23;
  objc_msgSend(v25, "setBounds:", v17, v19, v21, v23);
  objc_msgSend(v25, "setPosition:", v12, v14);
  -[CKThumbsUpAcknowledgmentGlyphView layer](self, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSublayer:", v25);

  v28 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__CKThumbsUpAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke;
  aBlock[3] = &unk_1E274A108;
  aBlock[4] = self;
  v29 = v25;
  v75 = v29;
  v70 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:");
  if (v6)
  {
    v30 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = v28;
    block[1] = 3221225472;
    block[2] = __85__CKThumbsUpAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke_2;
    block[3] = &unk_1E274AED0;
    v73 = v6;
    dispatch_after(v30, MEMORY[0x1E0C80D38], block);

  }
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v69 = v6;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bounds");
  x = v76.origin.x;
  y = v76.origin.y;
  width = v76.size.width;
  height = v76.size.height;
  CGRectGetMidX(v76);
  v77.origin.x = x;
  v77.origin.y = y;
  v77.size.width = width;
  v77.size.height = height;
  MidY = CGRectGetMidY(v77);
  objc_msgSend(v31, "setBounds:", v26, v19, v21, v71);
  objc_msgSend(v31, "setPosition:", 0.0, MidY);
  objc_msgSend(v29, "addSublayer:", v31);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v38) = -1073345902;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFromValue:", v39);

  LODWORD(v40) = 1054828275;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setToValue:", v41);

  objc_msgSend(v37, "setMass:", 1.0);
  objc_msgSend(v37, "setStiffness:", 250.0);
  objc_msgSend(v37, "setDamping:", 20.0);
  LODWORD(v42) = 1.0;
  objc_msgSend(v37, "setSpeed:", v42);
  objc_msgSend(v37, "setDuration:", 1.15);
  objc_msgSend(v37, "setBeginTime:", a3);
  v43 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v37, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v31, "addAnimation:forKey:", v37, CFSTR("transform.rotation.z"));
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  v45 = v78.origin.x;
  v46 = v78.origin.y;
  v47 = v78.size.width;
  v48 = v78.size.height;
  MidX = CGRectGetMidX(v78);
  v79.origin.x = v45;
  v79.origin.y = v46;
  v79.size.width = v47;
  v79.size.height = v48;
  v50 = CGRectGetMidY(v79);
  objc_msgSend(v44, "setBounds:", v26, v19, v21, v71);
  objc_msgSend(v44, "setPosition:", MidX, v50);
  objc_msgSend(v31, "addSublayer:", v44);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v52) = -1092655373;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setToValue:", v53);

  objc_msgSend(v51, "setMass:", 1.0);
  objc_msgSend(v51, "setStiffness:", 400.0);
  objc_msgSend(v51, "setDamping:", 15.0);
  LODWORD(v54) = 1.0;
  objc_msgSend(v51, "setSpeed:", v54);
  objc_msgSend(v51, "setDuration:", 1.0);
  objc_msgSend(v51, "setBeginTime:", a3 + 0.150000006);
  objc_msgSend(v51, "setFillMode:", v43);
  objc_msgSend(v44, "addAnimation:forKey:", v51, CFSTR("transform.rotation.z"));
  -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "image");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v56);
  objc_msgSend(v57, "layer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "bounds");
  v59 = v80.origin.x;
  v60 = v80.origin.y;
  v61 = v80.size.width;
  v62 = v80.size.height;
  CGRectGetMidX(v80);
  v81.origin.x = v59;
  v81.origin.y = v60;
  v81.size.width = v61;
  v81.size.height = v62;
  v63 = CGRectGetMidY(v81);
  v82.origin.x = v26;
  v82.origin.y = v19;
  v82.size.width = v21;
  v82.size.height = v71;
  MaxX = CGRectGetMaxX(v82);
  objc_msgSend(v58, "setBounds:", v26, v19, v21, v71);
  objc_msgSend(v58, "setPosition:", MaxX, v63);
  v65 = objc_retainAutorelease(v56);
  objc_msgSend(v58, "setContents:", objc_msgSend(v65, "CGImage"));
  objc_msgSend(v65, "scale");
  objc_msgSend(v58, "setContentsScale:");
  objc_msgSend(v58, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
  -[CKThumbsUpAcknowledgmentGlyphView setContentLayer:](self, "setContentLayer:", v58);
  objc_msgSend(v44, "addSublayer:", v58);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setFromValue:", &unk_1E2870FD8);
  objc_msgSend(v66, "setMass:", 1.0);
  objc_msgSend(v66, "setStiffness:", 350.0);
  objc_msgSend(v66, "setDamping:", 25.0);
  objc_msgSend(v66, "setBeginTime:", a3 + 0.0500000007);
  objc_msgSend(v66, "setFillMode:", v43);
  objc_msgSend(v58, "addAnimation:forKey:", v66, CFSTR("transform.scale.xy"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __85__CKThumbsUpAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "glyph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperlayer");
  objc_msgSend(*(id *)(a1 + 32), "setAnimationLayer:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setContentLayer:", 0);
}

uint64_t __85__CKThumbsUpAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke_2(uint64_t a1)
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
  v9.super_class = (Class)CKThumbsUpAcknowledgmentGlyphView;
  -[CKSimpleAcknowledgementGlyphView setGlyphColor:](&v9, sel_setGlyphColor_, a3);
  -[CKThumbsUpAcknowledgmentGlyphView contentLayer](self, "contentLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKThumbsUpAcknowledgmentGlyphView contentLayer](self, "contentLayer");
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
