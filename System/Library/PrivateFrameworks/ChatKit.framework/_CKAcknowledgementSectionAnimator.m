@implementation _CKAcknowledgementSectionAnimator

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[UIImageView layer](self->_ackIconView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[CNAvatarView layer](self->_avatarView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  -[CNAvatarView layer](self->_avatarView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  -[UILabel layer](self->_voteCountLabel, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  v8.receiver = self;
  v8.super_class = (Class)_CKAcknowledgementSectionAnimator;
  -[_CKAcknowledgementSectionAnimator dealloc](&v8, sel_dealloc);
}

- (void)animateInAckIconView:(double)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  CATransform3D v31;
  CATransform3D v32;
  CGAffineTransform v33;
  CGAffineTransform v34;

  -[_CKAcknowledgementSectionAnimator ackIconView](self, "ackIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[_CKAcknowledgementSectionAnimator ackIconViewAttr](self, "ackIconViewAttr");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v8 = (void *)objc_msgSend(v6, "initWithFrame:");
    -[_CKAcknowledgementSectionAnimator setAckIconView:](self, "setAckIconView:", v8);

    CGAffineTransformMakeScale(&v34, 0.001, 0.001);
    -[_CKAcknowledgementSectionAnimator ackIconView](self, "ackIconView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v34;
    objc_msgSend(v9, "setTransform:", &v33);

    v10 = (void *)MEMORY[0x1E0CEA638];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageAcknowledgmentPollingImageNameForAcknowledgmentType:", -[_CKAcknowledgementSectionAnimator acknowledgmentType](self, "acknowledgmentType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ckTemplateImageNamed:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CKAcknowledgementSectionAnimator ackIconView](self, "ackIconView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v13);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "theme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "messageAcknowledgment:acknowledgmentImageColor:", 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CKAcknowledgementSectionAnimator ackIconView](self, "ackIconView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTintColor:", v17);

    -[_CKAcknowledgementSectionAnimator containerView](self, "containerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CKAcknowledgementSectionAnimator ackIconView](self, "ackIconView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

  }
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v32, 0.001, 0.001, 1.0);
  objc_msgSend(v22, "valueWithCATransform3D:", &v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFromValue:", v23);

  v24 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v31, 1.0, 1.0, 1.0);
  objc_msgSend(v24, "valueWithCATransform3D:", &v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setToValue:", v25);

  -[_CKAcknowledgementSectionAnimator containerView](self, "containerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "convertTime:fromLayer:", 0, a3);
  objc_msgSend(v21, "setBeginTime:");

  objc_msgSend(v21, "setMass:", 3.0);
  objc_msgSend(v21, "setStiffness:", 70.0);
  objc_msgSend(v21, "setDamping:", 20.0);
  objc_msgSend(v21, "settlingDuration");
  objc_msgSend(v21, "setDuration:");
  objc_msgSend(v21, "setRemovedOnCompletion:", 0);
  objc_msgSend(v21, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  LODWORD(v28) = 4.0;
  objc_msgSend(v21, "setSpeed:", v28);
  -[_CKAcknowledgementSectionAnimator ackIconView](self, "ackIconView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addAnimation:forKey:", v21, CFSTR("initial-transform"));

}

- (void)_updateVoteCountViewDelayTime:(double)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double MidX;
  void *v23;
  double MidY;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  id v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  -[_CKAcknowledgementSectionAnimator voteCountLabel](self, "voteCountLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CEA700]);
    -[_CKAcknowledgementSectionAnimator voteCountViewAttr](self, "voteCountViewAttr");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v8 = (void *)objc_msgSend(v6, "initWithFrame:");
    -[_CKAcknowledgementSectionAnimator setVoteCountLabel:](self, "setVoteCountLabel:", v8);

    -[_CKAcknowledgementSectionAnimator voteCountLabel](self, "voteCountLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextAlignment:", 2);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageAcknowledgmentVoteCountFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CKAcknowledgementSectionAnimator voteCountLabel](self, "voteCountLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CKAcknowledgementSectionAnimator voteCountLabel](self, "voteCountLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CKAcknowledgementSectionAnimator ackVoteCount](self, "ackVoteCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CKAcknowledgementSectionAnimator voteCountLabel](self, "voteCountLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    -[_CKAcknowledgementSectionAnimator containerView](self, "containerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CKAcknowledgementSectionAnimator voteCountLabel](self, "voteCountLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

  }
  -[_CKAcknowledgementSectionAnimator voteCountLabel](self, "voteCountLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  MidX = CGRectGetMidX(v44);
  -[_CKAcknowledgementSectionAnimator voteCountLabel](self, "voteCountLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  MidY = CGRectGetMidY(v45);
  -[_CKAcknowledgementSectionAnimator voteCountLabel](self, "voteCountLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v26 = MidY - CGRectGetHeight(v46);

  -[_CKAcknowledgementSectionAnimator voteCountLabel](self, "voteCountLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  v28 = CGRectGetMidX(v47);
  -[_CKAcknowledgementSectionAnimator voteCountLabel](self, "voteCountLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frame");
  v30 = CGRectGetMidY(v48);

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", MidX, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFromValue:", v31);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v28, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setToValue:", v32);

  -[_CKAcknowledgementSectionAnimator containerView](self, "containerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "convertTime:fromLayer:", 0, CACurrentMediaTime() + a3);
  objc_msgSend(v43, "setBeginTime:");

  objc_msgSend(v43, "setMass:", 3.0);
  objc_msgSend(v43, "setStiffness:", 70.0);
  objc_msgSend(v43, "setDamping:", 20.0);
  objc_msgSend(v43, "settlingDuration");
  objc_msgSend(v43, "setDuration:");
  objc_msgSend(v43, "setRemovedOnCompletion:", 0);
  v35 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v43, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  LODWORD(v36) = 4.0;
  objc_msgSend(v43, "setSpeed:", v36);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFromValue:", &unk_1E28713E0);
  objc_msgSend(v37, "setToValue:", &unk_1E28713F0);
  -[_CKAcknowledgementSectionAnimator containerView](self, "containerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "convertTime:fromLayer:", 0, CACurrentMediaTime() + a3);
  objc_msgSend(v37, "setBeginTime:");

  objc_msgSend(v37, "setMass:", 3.0);
  objc_msgSend(v37, "setStiffness:", 70.0);
  objc_msgSend(v37, "setDamping:", 20.0);
  objc_msgSend(v37, "settlingDuration");
  objc_msgSend(v37, "setDuration:");
  objc_msgSend(v37, "setRemovedOnCompletion:", 0);
  objc_msgSend(v37, "setFillMode:", v35);
  LODWORD(v40) = 4.0;
  objc_msgSend(v37, "setSpeed:", v40);
  -[_CKAcknowledgementSectionAnimator voteCountLabel](self, "voteCountLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addAnimation:forKey:", v43, CFSTR("position"));

  -[_CKAcknowledgementSectionAnimator voteCountLabel](self, "voteCountLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addAnimation:forKey:", v37, CFSTR("opacity"));

}

- (void)_updateAckIconViewDelayTime:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CATransform3D v20;
  CATransform3D v21;
  CATransform3D v22;
  _QWORD v23[2];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v22, 1.0, 1.0, 1.0);
  objc_msgSend(v6, "valueWithCATransform3D:", &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  v8 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v21, 1.2, 1.2, 1.0);
  objc_msgSend(v8, "valueWithCATransform3D:", &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  v10 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v20, 1.0, 1.0, 1.0);
  objc_msgSend(v10, "valueWithCATransform3D:", &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValues:", v12);

  objc_msgSend(v5, "setKeyTimes:", &unk_1E286F820);
  -[_CKAcknowledgementSectionAnimator containerView](self, "containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertTime:fromLayer:", 0, CACurrentMediaTime() + a3);
  objc_msgSend(v5, "setBeginTime:");

  objc_msgSend(v5, "setDuration:", 0.1);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunctions:", v17);

  -[_CKAcknowledgementSectionAnimator ackIconView](self, "ackIconView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v5, CFSTR("heartbeat-transform"));

}

- (void)insertAvatarDelayTime:(double)a3
{
  -[_CKAcknowledgementSectionAnimator _updateAckIconViewDelayTime:](self, "_updateAckIconViewDelayTime:");
  -[_CKAcknowledgementSectionAnimator _updateAvatarViewDelayTime:](self, "_updateAvatarViewDelayTime:", a3);
  -[_CKAcknowledgementSectionAnimator _updateVoteCountViewDelayTime:](self, "_updateVoteCountViewDelayTime:", a3);
}

- (void)_updateAvatarViewDelayTime:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CGFloat v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CATransform3D v34;
  CATransform3D v35;
  CGRect v36;

  -[_CKAcknowledgementSectionAnimator avatarViewAttr](self, "avatarViewAttr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v7, v9, v11, v13);
  v15 = objc_alloc(MEMORY[0x1E0C97468]);
  -[_CKAcknowledgementSectionAnimator entityToShow](self, "entityToShow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithContact:", v17);

  objc_msgSend(v14, "bounds");
  objc_msgSend(v18, "setFrame:");
  objc_msgSend(v18, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v19);

  v36.origin.x = v7;
  v36.origin.y = v9;
  v36.size.width = v11;
  v36.size.height = v13;
  v20 = CGRectGetWidth(v36) * 0.5;
  objc_msgSend(v14, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCornerRadius:", v20);

  objc_msgSend(v14, "addSubview:", v18);
  -[_CKAcknowledgementSectionAnimator containerView](self, "containerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v14);

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CKAcknowledgementSectionAnimator containerView](self, "containerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "convertTime:fromLayer:", 0, CACurrentMediaTime() + a3);
  objc_msgSend(v23, "setBeginTime:");

  objc_msgSend(v23, "settlingDuration");
  objc_msgSend(v23, "setDuration:");
  v26 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v35, 0.0, 0.0, 1.0);
  objc_msgSend(v26, "valueWithCATransform3D:", &v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFromValue:", v27);

  v28 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v34, 1.0, 1.0, 1.0);
  objc_msgSend(v28, "valueWithCATransform3D:", &v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setToValue:", v29);

  objc_msgSend(v23, "setMass:", 3.0);
  objc_msgSend(v23, "setDamping:", 20.0);
  objc_msgSend(v23, "setStiffness:", 70.0);
  LODWORD(v30) = 4.0;
  objc_msgSend(v23, "setSpeed:", v30);
  objc_msgSend(v23, "setInitialVelocity:", 1.0);
  objc_msgSend(v23, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v14, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addAnimation:forKey:", v23, CFSTR("initial-insertion"));

  CGAffineTransformMakeScale(&v33, 1.0, 1.0);
  v32 = v33;
  objc_msgSend(v14, "setTransform:", &v32);
  -[_CKAcknowledgementSectionAnimator setAvatarView:](self, "setAvatarView:", v18);

}

- (UICollectionViewLayoutAttributes)avatarViewAttr
{
  return self->_avatarViewAttr;
}

- (void)setAvatarViewAttr:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewAttr, a3);
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UILabel)voteCountLabel
{
  return self->_voteCountLabel;
}

- (void)setVoteCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_voteCountLabel, a3);
}

- (UICollectionViewLayoutAttributes)voteCountViewAttr
{
  return self->_voteCountViewAttr;
}

- (void)setVoteCountViewAttr:(id)a3
{
  objc_storeStrong((id *)&self->_voteCountViewAttr, a3);
}

- (UIImageView)ackIconView
{
  return self->_ackIconView;
}

- (void)setAckIconView:(id)a3
{
  objc_storeStrong((id *)&self->_ackIconView, a3);
}

- (UICollectionViewLayoutAttributes)ackIconViewAttr
{
  return self->_ackIconViewAttr;
}

- (void)setAckIconViewAttr:(id)a3
{
  objc_storeStrong((id *)&self->_ackIconViewAttr, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (unint64_t)ackVoteCount
{
  return self->_ackVoteCount;
}

- (void)setAckVoteCount:(unint64_t)a3
{
  self->_ackVoteCount = a3;
}

- (CKEntity)entityToShow
{
  return self->_entityToShow;
}

- (void)setEntityToShow:(id)a3
{
  objc_storeStrong((id *)&self->_entityToShow, a3);
}

- (int64_t)acknowledgmentType
{
  return self->_acknowledgmentType;
}

- (void)setAcknowledgmentType:(int64_t)a3
{
  self->_acknowledgmentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityToShow, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_ackIconViewAttr, 0);
  objc_storeStrong((id *)&self->_ackIconView, 0);
  objc_storeStrong((id *)&self->_voteCountViewAttr, 0);
  objc_storeStrong((id *)&self->_voteCountLabel, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_avatarViewAttr, 0);
}

@end
