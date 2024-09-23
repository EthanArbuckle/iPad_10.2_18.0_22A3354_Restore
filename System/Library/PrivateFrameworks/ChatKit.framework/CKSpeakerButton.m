@implementation CKSpeakerButton

- (CKSpeakerButton)initWithFrame:(CGRect)a3
{
  CKSpeakerButton *v3;
  CKSpeakerButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKSpeakerButton;
  v3 = -[CKSpeakerButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKSpeakerButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel_touchUpInside_, 64);
    v4->_speakerEnabled = 1;
    -[CKSpeakerButton updateSpeakerImage](v4, "updateSpeakerImage");
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)CKSpeakerButton;
  -[CKSpeakerButton sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setOrientation:(char)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[CKSpeakerButton updateSpeakerImage](self, "updateSpeakerImage");
  }
}

- (void)setSpeakerEnabled:(BOOL)a3
{
  if (self->_speakerEnabled != a3)
  {
    self->_speakerEnabled = a3;
    -[CKSpeakerButton updateSpeakerImage](self, "updateSpeakerImage");
  }
}

+ (id)speakerImageWithOrientation:(char)a3 speakerEnabled:(BOOL)a4 shouldShowText:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSString *v21;
  NSComparisonResult v22;
  uint64_t *v23;
  uint64_t *v24;
  __objc2_class **v25;
  uint64_t *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  __objc2_class **v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  double v84;
  double v85;
  void *v86;
  double v87;
  _BOOL4 v88;
  void *v89;
  _BYTE v90[3];
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  _QWORD v96[3];
  CGSize v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v96[1] = *MEMORY[0x1E0C80C00];
  if (speakerImageWithOrientation_speakerEnabled_shouldShowText__once != -1)
    dispatch_once(&speakerImageWithOrientation_speakerEnabled_shouldShowText__once, &__block_literal_global_245);
  v90[0] = v7;
  v90[1] = v6;
  v90[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v90, "{?=cBB}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)speakerImageWithOrientation_speakerEnabled_shouldShowText__sSpeakerImageCache, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v88 = v6;
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 4, 17.0);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("speaker.wave.3.fill"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = (void *)v10;
    objc_msgSend(v11, "imageWithSymbolConfiguration:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithTintColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageWithTintColor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "size");
    v18 = v17;
    v20 = v19;
    CKPreferredContentSizeCategory();
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    v22 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)speakerImageWithOrientation_speakerEnabled_shouldShowText__sContentSizeCategory_SpeakerTextWidth, v21);
    v23 = &macJoinFaceTimeNSToolbarItemSize_once;
    v24 = &macJoinFaceTimeNSToolbarItemSize_once;
    v25 = off_1E2733000;
    v26 = (uint64_t *)MEMORY[0x1E0DC1138];
    if (v22)
    {
      CKFrameworkBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("AUDIO_MESSAGE_SPEAKER_ON"), &stru_1E276D870, CFSTR("ChatKit"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = *MEMORY[0x1E0DC1138];
      v29 = v95;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v86 = v16;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "transcriptBoldFont");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v96[0] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, &v95, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sizeWithAttributes:", v32);
      v34 = v33;
      v36 = v35;

      CKFrameworkBundle();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("AUDIO_MESSAGE_SPEAKER_OFF"), &stru_1E276D870, CFSTR("ChatKit"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v29;
      v26 = (uint64_t *)MEMORY[0x1E0DC1138];
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "transcriptBoldFont");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "sizeWithAttributes:", v41);
      v43 = v42;
      v45 = v44;

      v23 = &macJoinFaceTimeNSToolbarItemSize_once;
      v16 = v86;

      v25 = off_1E2733000;
      v24 = &macJoinFaceTimeNSToolbarItemSize_once;
      speakerImageWithOrientation_speakerEnabled_shouldShowText__sSpeakerTextMaxWidth = fmax(v34, v43);
      speakerImageWithOrientation_speakerEnabled_shouldShowText__sSpeakerTextMaxHeight = fmax(v36, v45);
      objc_storeStrong((id *)&speakerImageWithOrientation_speakerEnabled_shouldShowText__sContentSizeCategory_SpeakerTextWidth, v21);
    }
    v46 = *((double *)v23 + 429);
    v47 = v24[430];

    v48 = v18 + 5.0 + v46;
    v97.width = v48;
    v97.height = v20;
    UIGraphicsBeginImageContextWithOptions(v97, 0, 0.0);
    v49 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (v7)
    {
      v98.origin.x = 0.0;
      v98.origin.y = 0.0;
      v98.size.width = v18 + 5.0 + v46;
      v98.size.height = v20;
      v50 = CGRectGetMaxX(v98) - v18;
    }
    else
    {
      v50 = *MEMORY[0x1E0C9D538];
    }
    objc_msgSend(v16, "drawInRect:", v50, v49, v18, v20);
    if (v5)
    {
      v85 = v20;
      v87 = v18 + 5.0 + v46;
      v51 = v16;
      if (v7)
      {
        v52 = v50 + -5.0 - v46;
      }
      else
      {
        v99.origin.x = v50;
        v99.origin.y = v49;
        v99.size.width = v18;
        v99.size.height = v20;
        v52 = CGRectGetMaxX(v99) + 5.0;
      }
      v53 = v25;
      -[__objc2_class sharedBehaviors](v25[421], "sharedBehaviors", v47);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "transcriptBoldTextAlignmentInsets");
      v56 = v55;
      v58 = v57;
      v60 = v59;
      v62 = v61;

      v63 = v52 + v58;
      v64 = v58 + v62;
      v65 = v46 - v64;
      v66 = v56 + v60;
      v67 = v84 - v66;
      if (CKMainScreenScale_once_97 != -1)
        dispatch_once(&CKMainScreenScale_once_97, &__block_literal_global_83_2);
      v68 = *(double *)&CKMainScreenScale_sMainScreenScale_97;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_97 == 0.0)
        v68 = 1.0;
      v69 = 1.0 / v68 * (v49 * v68 + floor((v85 * v68 - v67 * v68) * 0.5));
      v70 = v63 - v58;
      v20 = v85;
      v71 = v69 - v56;
      v72 = v66 + v67;
      CKFrameworkBundle();
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v73;
      if (v88)
        v75 = CFSTR("AUDIO_MESSAGE_SPEAKER_ON");
      else
        v75 = CFSTR("AUDIO_MESSAGE_SPEAKER_OFF");
      objc_msgSend(v73, "localizedStringForKey:value:table:", v75, &stru_1E276D870, CFSTR("ChatKit"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v91 = *v26;
      -[__objc2_class sharedBehaviors](v53[421], "sharedBehaviors");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "transcriptBoldFont");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = v78;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "drawInRect:withAttributes:", v79, v70, v71, v64 + v65, v72);

      v16 = v51;
      v48 = v87;
    }
    if (v88)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 1;
    }
    objc_msgSend(v80, "set");
    v100.origin.x = 0.0;
    v100.origin.y = 0.0;
    v100.size.width = v48;
    v100.size.height = v20;
    UIRectFillUsingBlendMode(v100, kCGBlendModeSourceIn);
    UIGraphicsGetImageFromCurrentImageContext();
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v82, "imageWithRenderingMode:", v81);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    objc_msgSend((id)speakerImageWithOrientation_speakerEnabled_shouldShowText__sSpeakerImageCache, "setObject:forKey:", v9, v8);

  }
  return v9;
}

void __77__CKSpeakerButton_speakerImageWithOrientation_speakerEnabled_shouldShowText___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v0 = CKDefaultCacheLimit();
  CKCreateCache(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)speakerImageWithOrientation_speakerEnabled_shouldShowText__sSpeakerImageCache;
  speakerImageWithOrientation_speakerEnabled_shouldShowText__sSpeakerImageCache = v1;

}

- (void)updateSpeakerImage
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRichAudioMessagesEnabled");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[CKSpeakerButton speakerImageWithEnabledState:](CKSpeakerButton, "speakerImageWithEnabledState:", -[CKSpeakerButton isSpeakerEnabled](self, "isSpeakerEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v5);

    -[CKSpeakerButton setConfiguration:](self, "setConfiguration:", v6);
  }
  else
  {
    +[CKSpeakerButton speakerImageWithOrientation:speakerEnabled:shouldShowText:](CKSpeakerButton, "speakerImageWithOrientation:speakerEnabled:shouldShowText:", -[CKSpeakerButton orientation](self, "orientation"), -[CKSpeakerButton isSpeakerEnabled](self, "isSpeakerEnabled"), -[CKSpeakerButton shouldShowText](self, "shouldShowText"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CKSpeakerButton setImage:forState:](self, "setImage:forState:");
  }

}

- (void)setShouldShowText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRichAudioMessagesEnabled");

  if (self->_shouldShowText != v3)
  {
    if (v6)
      v7 = 0;
    else
      v7 = v3;
    self->_shouldShowText = v7;
    -[CKSpeakerButton updateSpeakerImage](self, "updateSpeakerImage");
  }
}

- (void)touchUpInside:(id)a3
{
  void *v4;
  char v5;

  -[CKSpeakerButton setSpeakerEnabled:](self, "setSpeakerEnabled:", -[CKSpeakerButton isSpeakerEnabled](self, "isSpeakerEnabled", a3) ^ 1);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRichAudioMessagesEnabled");

  if ((v5 & 1) == 0)
  {
    -[CKSpeakerButton setShouldShowText:](self, "setShouldShowText:", 1);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_hideSpeakerText, 0);
    -[CKSpeakerButton performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_hideSpeakerText, 0, 1.5);
  }
}

- (void)hideSpeakerText
{
  objc_msgSend(MEMORY[0x1E0CEABB0], "transitionWithView:duration:options:animations:completion:", 0.25);
}

uint64_t __34__CKSpeakerButton_hideSpeakerText__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldShowText:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSpeakerButton;
  -[CKSpeakerButton traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKSpeakerButton updateSpeakerImage](self, "updateSpeakerImage");
}

+ (id)speakerImageWithEnabledState:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD v28[2];

  if (speakerImageWithEnabledState__once != -1)
    dispatch_once(&speakerImageWithEnabledState__once, &__block_literal_global_49_1);
  v28[0] = a3;
  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = objc_msgSend(v4, "userInterfaceStyle");

  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v28, "{?=Bq}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)speakerImageWithEnabledState__sSpeakerImageCache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 4, 14.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("speaker.wave.3.fill"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithSymbolConfiguration:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "imageWithRenderingMode:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithTintColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "size");
    v17 = v15;
    v18 = v16;
    if (v15 + 12.0 >= v16 + 12.0)
      v19 = v15 + 12.0;
    else
      v19 = v16 + 12.0;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", v19, v19);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __48__CKSpeakerButton_speakerImageWithEnabledState___block_invoke_2;
    v22[3] = &unk_1E2751E98;
    v24 = v19;
    v25 = v19;
    v26 = v17;
    v27 = v18;
    v7 = v14;
    v23 = v7;
    objc_msgSend(v20, "imageWithActions:", v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)speakerImageWithEnabledState__sSpeakerImageCache, "setObject:forKey:", v8, v5);

  }
  return v8;
}

void __48__CKSpeakerButton_speakerImageWithEnabledState___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v0 = CKDefaultCacheLimit();
  CKCreateCache(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)speakerImageWithEnabledState__sSpeakerImageCache;
  speakerImageWithEnabledState__sSpeakerImageCache = v1;

}

void __48__CKSpeakerButton_speakerImageWithEnabledState___block_invoke_2(uint64_t a1)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  __asm { FMOV            V1.2D, #0.5 }
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", vsubq_f64(vmulq_f64(*(float64x2_t *)(a1 + 40), _Q1), vmulq_f64(*(float64x2_t *)(a1 + 56), _Q1)));
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLineWidth:", 1.0);
  objc_msgSend(v10, "setLineJoinStyle:", 1);
  objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, *(double *)(a1 + 40) * 0.5, *(double *)(a1 + 48) * 0.5, *(double *)(a1 + 48) * 0.5 + -1.0, 0.0, 6.28318531);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quickActionButtonStrokeColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStroke");

  objc_msgSend(v10, "stroke");
}

- (char)orientation
{
  return self->_orientation;
}

- (BOOL)isSpeakerEnabled
{
  return self->_speakerEnabled;
}

- (BOOL)shouldShowText
{
  return self->_shouldShowText;
}

@end
