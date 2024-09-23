@implementation CNSharedProfileAnimationGenerator

+ (id)log
{
  if (log_cn_once_token_1_51911 != -1)
    dispatch_once(&log_cn_once_token_1_51911, &__block_literal_global_51912);
  return (id)log_cn_once_object_1_51913;
}

void __40__CNSharedProfileAnimationGenerator_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "CNSharedProfileAnimationGenerator");
  v1 = (void *)log_cn_once_object_1_51913;
  log_cn_once_object_1_51913 = (uint64_t)v0;

}

- (void)performCoinFlipAnimationForAnimatingAvatarView:(id)a3 toContact:(id)a4 rightToLeft:(BOOL)a5 avatarSize:(CGSize)a6 completionHandler:(id)a7
{
  double height;
  double width;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  void *v16;
  CNAvatarImageRenderer *v17;
  void *v18;
  CNAvatarImageRenderer *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  height = a6.height;
  width = a6.width;
  v10 = a5;
  v25[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = v15;
  if (v14)
  {
    v17 = [CNAvatarImageRenderer alloc];
    +[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CNAvatarImageRenderer initWithSettings:](v17, "initWithSettings:", v18);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scale");
    +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v10, 0, width, height, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarImageRenderer avatarImageForContacts:scope:](v19, "avatarImageForContacts:scope:", v23, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNSharedProfileAnimationGenerator performCoinFlipAnimationForAnimatingAvatarView:toAvatarImage:completionHandler:](self, "performCoinFlipAnimationForAnimatingAvatarView:toAvatarImage:completionHandler:", v13, v24, v16);
  }
  else if (v15)
  {
    (*((void (**)(id))v15 + 2))(v15);
  }

}

- (void)performCoinFlipAnimationForAnimatingAvatarView:(id)a3 pendingNickname:(id)a4 contact:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "destinationAvatarImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v13, "destinationAvatarImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNSharedProfileAvatarImageGenerator sharedAvatarImageForNickname:contact:size:isRTL:](CNSharedProfileAvatarImageGenerator, "sharedAvatarImageForNickname:contact:size:isRTL:", v12, v11, objc_msgSend(v20, "layoutDirection") == 1, v16, v18);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[CNSharedProfileAnimationGenerator performCoinFlipAnimationForAnimatingAvatarView:toAvatarImage:completionHandler:](self, "performCoinFlipAnimationForAnimatingAvatarView:toAvatarImage:completionHandler:", v13, v21, v10);
}

- (void)performCoinFlipAnimationForAnimatingAvatarView:(id)a3 toAvatarImage:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  CATransform3D v57;
  CATransform3D v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  uint8_t buf[4];
  id v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v49 = a5;
  v9 = a3;
  objc_msgSend(v9, "sourceAvatarLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destinationAvatarImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setImage:", v8);
  objc_msgSend((id)objc_opt_class(), "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349312;
    v63 = v8;
    v64 = 2050;
    v65 = v48;
    _os_log_debug_impl(&dword_18AC56000, v12, OS_LOG_TYPE_DEBUG, "Setting contents (%{public}p) for coin flip animation on destination avatar layer: %{public}p", buf, 0x16u);

  }
  v51 = v8;

  objc_msgSend(v10, "mask");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(v11, "bounds");
    v17 = v16;
    objc_msgSend(v11, "bounds");
    objc_msgSend(v15, "bezierPathWithOvalInRect:", 0.0, 0.0, v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "setPath:", objc_msgSend(v18, "CGPath"));

    objc_msgSend(v10, "setMask:", v14);
    objc_msgSend((id)objc_opt_class(), "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349312;
      v63 = v14;
      v64 = 2050;
      v65 = v10;
      _os_log_debug_impl(&dword_18AC56000, v19, OS_LOG_TYPE_DEBUG, "Setting source avatar layer mask (%{public}p) for coin flip animation on layer: %{public}p", buf, 0x16u);
    }

  }
  objc_msgSend(v10, "setDoubleSided:", 0, v49);
  objc_msgSend(v11, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDoubleSided:", 0);

  -[CNSharedProfileAnimationGenerator applyBlurFilterToLayer:inputRadius:](self, "applyBlurFilterToLayer:inputRadius:", v10, 0.0);
  objc_msgSend(v11, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileAnimationGenerator applyBlurFilterToLayer:inputRadius:](self, "applyBlurFilterToLayer:inputRadius:", v21, 13.0);

  v22 = objc_alloc_init(MEMORY[0x1E0CD2700]);
  -[CNSharedProfileAnimationGenerator coinFlipSpringAnimationWithKeyPath:fromValue:toValue:](self, "coinFlipSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("transform.rotation.y"), 0.0, 3.14159265);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v23;
  -[CNSharedProfileAnimationGenerator coinFlipSpringAnimationWithKeyPath:fromValue:toValue:](self, "coinFlipSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("filters.gaussianBlur.inputHardEdges"), 0.0, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v24;
  -[CNSharedProfileAnimationGenerator coinFlipSpringAnimationWithKeyPath:fromValue:toValue:](self, "coinFlipSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("filters.gaussianBlur.inputNormalizeEdges"), 0.0, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v25;
  -[CNSharedProfileAnimationGenerator coinFlipSpringAnimationWithKeyPath:fromValue:toValue:](self, "coinFlipSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("filters.gaussianBlur.inputRadius"), 0.0, 13.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAnimations:", v27);

  objc_msgSend(v22, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v22, "animations");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "duration");
  objc_msgSend(v22, "setDuration:");

  v30 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v22, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v22, "setRemovedOnCompletion:", 0);
  v31 = objc_alloc_init(MEMORY[0x1E0CD2700]);
  -[CNSharedProfileAnimationGenerator coinFlipSpringAnimationWithKeyPath:fromValue:toValue:](self, "coinFlipSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("transform.rotation.y"), 3.14159265, 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAnimations:", v33);

  objc_msgSend(v31, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v31, "animations");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "firstObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "duration");
  objc_msgSend(v31, "setDuration:");

  objc_msgSend(v31, "setFillMode:", v30);
  objc_msgSend(v31, "setRemovedOnCompletion:", 0);
  v36 = objc_alloc_init(MEMORY[0x1E0CD2700]);
  -[CNSharedProfileAnimationGenerator coinFlipSpringAnimationWithKeyPath:fromValue:toValue:](self, "coinFlipSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("filters.gaussianBlur.inputRadius"), 13.0, 0.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAnimations:", v38);

  objc_msgSend(v36, "setBeginTime:", CACurrentMediaTime() + 0.2);
  objc_msgSend(v36, "animations");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "duration");
  objc_msgSend(v36, "setDuration:");

  objc_msgSend(v36, "setFillMode:", v30);
  objc_msgSend(v36, "setRemovedOnCompletion:", 0);
  CATransform3DMakeRotation(&v58, 3.14159265, 0.0, 1.0, 0.0);
  v57 = v58;
  objc_msgSend(v11, "setTransform3D:", &v57);
  v41 = (void *)MEMORY[0x1E0CD28B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __116__CNSharedProfileAnimationGenerator_performCoinFlipAnimationForAnimatingAvatarView_toAvatarImage_completionHandler___block_invoke;
  v52[3] = &unk_1E204E640;
  v53 = v10;
  v54 = v51;
  v55 = v11;
  v56 = v50;
  v42 = v50;
  v43 = v11;
  v44 = v51;
  v45 = v10;
  objc_msgSend(v41, "setCompletionBlock:", v52);
  objc_msgSend(v45, "addAnimation:forKey:", v22, 0);
  objc_msgSend(v43, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addAnimation:forKey:", v31, 0);

  objc_msgSend(v43, "layer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addAnimation:forKey:", v36, 0);

}

- (void)performPeekABooAnimationForAnimatingAvatarView:(id)a3 pendingNickname:(id)a4 contact:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  CATransform3D v79;
  CATransform3D v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _QWORD v85[2];
  _QWORD v86[7];

  v86[4] = *MEMORY[0x1E0C80C00];
  v73 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "sourceAvatarLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "destinationAvatarImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "destinationAvatarImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v12, "destinationAvatarImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNSharedProfileAvatarImageGenerator sharedAvatarImageForNickname:contact:size:isRTL:](CNSharedProfileAvatarImageGenerator, "sharedAvatarImageForNickname:contact:size:isRTL:", v11, v10, objc_msgSend(v21, "layoutDirection") == 1, v17, v19);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setImage:", v74);
  v72 = v13;
  objc_msgSend(v13, "setDoubleSided:", 0);
  objc_msgSend(v14, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDoubleSided:", 0);

  -[CNSharedProfileAnimationGenerator applyBlurFilterToLayer:inputRadius:](self, "applyBlurFilterToLayer:inputRadius:", v13, 0.0);
  objc_msgSend(v14, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileAnimationGenerator applyBlurFilterToLayer:inputRadius:](self, "applyBlurFilterToLayer:inputRadius:", v23, 13.0);

  v24 = objc_alloc_init(MEMORY[0x1E0CD2700]);
  -[CNSharedProfileAnimationGenerator peekABooIntermediateSpringAnimationWithKeyPath:fromValue:toValue:](self, "peekABooIntermediateSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("transform.rotation.y"), 0.0, 3.14159265);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v25;
  -[CNSharedProfileAnimationGenerator peekABooIntermediateSpringAnimationWithKeyPath:fromValue:toValue:](self, "peekABooIntermediateSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("filters.gaussianBlur.inputHardEdges"), 0.0, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v26;
  -[CNSharedProfileAnimationGenerator peekABooIntermediateSpringAnimationWithKeyPath:fromValue:toValue:](self, "peekABooIntermediateSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("filters.gaussianBlur.inputNormalizeEdges"), 0.0, 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v27;
  -[CNSharedProfileAnimationGenerator peekABooIntermediateSpringAnimationWithKeyPath:fromValue:toValue:](self, "peekABooIntermediateSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("filters.gaussianBlur.inputRadius"), 0.0, 13.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v86[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAnimations:", v29);

  objc_msgSend(v24, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v24, "setDuration:", 1.0);
  v30 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v24, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v24, "setRemovedOnCompletion:", 0);
  v31 = objc_alloc_init(MEMORY[0x1E0CD2700]);
  -[CNSharedProfileAnimationGenerator peekABooFinalSpringAnimationWithKeyPath:fromValue:toValue:](self, "peekABooFinalSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("transform.rotation.y"), 3.14159265, 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v32;
  -[CNSharedProfileAnimationGenerator peekABooFinalSpringAnimationWithKeyPath:fromValue:toValue:](self, "peekABooFinalSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("filters.gaussianBlur.inputRadius"), 13.0, 0.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAnimations:", v34);

  v71 = v24;
  objc_msgSend(v24, "beginTime");
  v36 = v35;
  objc_msgSend(v24, "duration");
  objc_msgSend(v31, "setBeginTime:", v36 + v37);
  objc_msgSend(v31, "animations");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "firstObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "duration");
  objc_msgSend(v31, "setDuration:");

  objc_msgSend(v31, "setFillMode:", v30);
  objc_msgSend(v31, "setRemovedOnCompletion:", 0);
  v40 = objc_alloc_init(MEMORY[0x1E0CD2700]);
  -[CNSharedProfileAnimationGenerator peekABooIntermediateSpringAnimationWithKeyPath:fromValue:toValue:](self, "peekABooIntermediateSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("transform.rotation.y"), 3.14159265, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAnimations:", v42);

  objc_msgSend(v40, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v40, "setDuration:", 1.0);
  objc_msgSend(v40, "setFillMode:", v30);
  objc_msgSend(v40, "setRemovedOnCompletion:", 0);
  v43 = objc_alloc_init(MEMORY[0x1E0CD2700]);
  -[CNSharedProfileAnimationGenerator peekABooIntermediateSpringAnimationWithKeyPath:fromValue:toValue:](self, "peekABooIntermediateSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("filters.gaussianBlur.inputRadius"), 13.0, 0.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAnimations:", v45);

  objc_msgSend(v40, "beginTime");
  objc_msgSend(v43, "setBeginTime:", v46 + 0.2);
  objc_msgSend(v43, "animations");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "firstObject");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "duration");
  objc_msgSend(v43, "setDuration:");

  objc_msgSend(v43, "setFillMode:", v30);
  objc_msgSend(v43, "setRemovedOnCompletion:", 0);
  v49 = objc_alloc_init(MEMORY[0x1E0CD2700]);
  -[CNSharedProfileAnimationGenerator peekABooFinalSpringAnimationWithKeyPath:fromValue:toValue:](self, "peekABooFinalSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("transform.rotation.y"), 0.0, 3.14159265);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setAnimations:", v51);

  objc_msgSend(v40, "beginTime");
  v53 = v52;
  objc_msgSend(v40, "duration");
  objc_msgSend(v49, "setBeginTime:", v53 + v54);
  objc_msgSend(v49, "animations");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "firstObject");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "duration");
  objc_msgSend(v49, "setDuration:");

  objc_msgSend(v49, "setFillMode:", v30);
  objc_msgSend(v49, "setRemovedOnCompletion:", 0);
  v57 = objc_alloc_init(MEMORY[0x1E0CD2700]);
  -[CNSharedProfileAnimationGenerator peekABooFinalSpringAnimationWithKeyPath:fromValue:toValue:](self, "peekABooFinalSpringAnimationWithKeyPath:fromValue:toValue:", CFSTR("filters.gaussianBlur.inputRadius"), 0.0, 13.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setAnimations:", v59);

  objc_msgSend(v49, "beginTime");
  objc_msgSend(v57, "setBeginTime:", v60 + 0.2);
  objc_msgSend(v57, "animations");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "firstObject");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "duration");
  objc_msgSend(v57, "setDuration:");

  objc_msgSend(v57, "setFillMode:", v30);
  objc_msgSend(v57, "setRemovedOnCompletion:", 0);
  CATransform3DMakeRotation(&v80, 3.14159265, 0.0, 1.0, 0.0);
  v79 = v80;
  objc_msgSend(v14, "setTransform3D:", &v79);
  v63 = (void *)MEMORY[0x1E0CD28B0];
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __126__CNSharedProfileAnimationGenerator_performPeekABooAnimationForAnimatingAvatarView_pendingNickname_contact_completionHandler___block_invoke;
  v75[3] = &unk_1E204F098;
  v76 = v72;
  v77 = v14;
  v78 = v73;
  v64 = v73;
  v65 = v14;
  v66 = v72;
  objc_msgSend(v63, "setCompletionBlock:", v75);
  objc_msgSend(v66, "addAnimation:forKey:", v71, 0);
  objc_msgSend(v66, "addAnimation:forKey:", v31, 0);
  objc_msgSend(v65, "layer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addAnimation:forKey:", v40, 0);

  objc_msgSend(v65, "layer");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addAnimation:forKey:", v43, 0);

  objc_msgSend(v65, "layer");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addAnimation:forKey:", v49, 0);

  objc_msgSend(v65, "layer");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "addAnimation:forKey:", v57, 0);

}

- (id)coinFlipSpringAnimationWithKeyPath:(id)a3 fromValue:(double)a4 toValue:(double)a5
{
  return -[CNSharedProfileAnimationGenerator springAnimationWithKeyPath:fromValue:toValue:stiffness:damping:mass:](self, "springAnimationWithKeyPath:fromValue:toValue:stiffness:damping:mass:", a3, a4, a5, 25.0, 5.0, 1.0);
}

- (id)peekABooIntermediateSpringAnimationWithKeyPath:(id)a3 fromValue:(double)a4 toValue:(double)a5
{
  return -[CNSharedProfileAnimationGenerator springAnimationWithKeyPath:fromValue:toValue:stiffness:damping:mass:](self, "springAnimationWithKeyPath:fromValue:toValue:stiffness:damping:mass:", a3, a4, a5, 25.0, 5.0, 1.0);
}

- (id)peekABooFinalSpringAnimationWithKeyPath:(id)a3 fromValue:(double)a4 toValue:(double)a5
{
  return -[CNSharedProfileAnimationGenerator springAnimationWithKeyPath:fromValue:toValue:stiffness:damping:mass:](self, "springAnimationWithKeyPath:fromValue:toValue:stiffness:damping:mass:", a3, a4, a5, 25.0, 5.0, 1.0);
}

- (id)springAnimationWithKeyPath:(id)a3 fromValue:(double)a4 toValue:(double)a5 stiffness:(double)a6 damping:(double)a7 mass:(double)a8
{
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFromValue:", v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setToValue:", v15);

  objc_msgSend(v13, "setStiffness:", a6);
  objc_msgSend(v13, "setDamping:", a7);
  objc_msgSend(v13, "setMass:", a8);
  objc_msgSend(v13, "setInitialVelocity:", 0.0);
  objc_msgSend(v13, "settlingDuration");
  objc_msgSend(v13, "setDuration:");
  return v13;
}

- (void)applyBlurFilterToLayer:(id)a3 inputRadius:(double)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CD2780];
  v6 = *MEMORY[0x1E0CD2C88];
  v7 = a3;
  objc_msgSend(v5, "filterWithType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilters:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v10, CFSTR("inputRadius"));

}

uint64_t __126__CNSharedProfileAnimationGenerator_performPeekABooAnimationForAnimatingAvatarView_pendingNickname_contact_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = MEMORY[0x1E0C9AA60];
  objc_msgSend(*(id *)(a1 + 32), "setFilters:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", v2);

  objc_msgSend(*(id *)(a1 + 32), "removeAllAnimations");
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __116__CNSharedProfileAnimationGenerator_performCoinFlipAnimationForAnimatingAvatarView_toAvatarImage_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t result;
  _OWORD v11[8];

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setContents:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage"));
  v2 = *(void **)(a1 + 48);
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v11[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v11[5] = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v11[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v11[7] = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v11[0] = *MEMORY[0x1E0CD2610];
  v11[1] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v11[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v11[3] = v6;
  objc_msgSend(v2, "setTransform3D:", v11);
  v7 = MEMORY[0x1E0C9AA60];
  objc_msgSend(*(id *)(a1 + 32), "setFilters:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(*(id *)(a1 + 48), "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilters:", v7);

  objc_msgSend(*(id *)(a1 + 32), "removeAllAnimations");
  objc_msgSend(*(id *)(a1 + 48), "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllAnimations");

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
