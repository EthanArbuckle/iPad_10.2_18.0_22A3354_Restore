@implementation CKAppIconLinkView

- (CKAppIconLinkView)initWithFrame:(CGRect)a3 withAppName:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  CKAppIconLinkView *v9;
  CKAppIconLinkView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CKAppIconLinkView;
  v9 = -[CKAppIconLinkView initWithFrame:](&v12, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    -[CKAppIconLinkView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CKAppIconLinkView setUpViewsForApp:](v10, "setUpViewsForApp:", a4);
    -[CKAppIconLinkView setLinkFrame:](v10, "setLinkFrame:", x, y, width, height);
  }
  return v10;
}

- (void)setUpViewsForApp:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSString *v9;
  NSString *previewString;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  UIImage *v32;
  void *v33;
  void *v34;
  CKSyndicationOnboardingTailedBubble *v35;
  CKSyndicationOnboardingTailedBubble *v36;
  id v37;

  -[CKAppIconLinkView setAppName:](self, "setAppName:");
  if (a3 == 4)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("HighlightTV"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("WHATS_NEW_SYNDICATION_TV_FULL");
  }
  else if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("HighlightMusic"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("WHATS_NEW_SYNDICATION_MUSIC_FULL");
  }
  else
  {
    if (a3)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("HighlightSafari"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("WHATS_NEW_SYNDICATION_SAFARI_FULL");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  previewString = self->_previewString;
  self->_previewString = v9;

  -[CKAppIconLinkView setPreviewImageForImage:](self, "setPreviewImageForImage:", v5);
LABEL_8:
  v11 = objc_alloc(MEMORY[0x1E0CB3778]);
  -[CKAppIconLinkView previewString](self, "previewString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (id)objc_msgSend(v11, "initWithString:", v12);

  v13 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "__ck_shortPreferredFontForTextStyle:size:", *MEMORY[0x1E0CEB538], 10.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addAttribute:value:range:", v13, v14, 0, objc_msgSend(v37, "length"));

  v15 = -[CKAppIconLinkView appName](self, "appName");
  switch(v15)
  {
    case 4:
      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_TV_HEADER"), &stru_1E276D870, CFSTR("ChatKit"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0C99E98];
      v19 = CFSTR("https://tv.apple.com/us/show/mythic-quest/umc.cmc.1nfdfd5zlk05fo1bwwetzldy3?ctx_brand=tvs.sbd.4000");
      goto LABEL_14;
    case 1:
      CKFrameworkBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_MUSIC_HEADER"), &stru_1E276D870, CFSTR("ChatKit"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0C99E98];
      v19 = CFSTR("https://music.apple.com/us/album/green-eyes/1534718812?i=1534719300");
      goto LABEL_14;
    case 0:
      CKFrameworkBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_SAFARI_HEADER"), &stru_1E276D870, CFSTR("ChatKit"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0C99E98];
      v19 = CFSTR("https://www.azuremagazine.com/article/atelier-schwimmer-completes-a-lake-cabin-for-two-fun-loving-brothers/");
LABEL_14:
      objc_msgSend(v18, "URLWithString:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      goto LABEL_16;
  }
  v23 = objc_msgSend(v37, "length");
  v22 = 0;
  v17 = 0;
LABEL_16:
  v24 = objc_msgSend(v17, "length");
  if (v24 <= objc_msgSend(v37, "length"))
    v23 = objc_msgSend(v17, "length");
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 10.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addAttribute:value:range:", v13, v25, 0, v23);

  }
  v26 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  objc_msgSend(v26, "setOriginalURL:", v22);
  objc_msgSend(v26, "setURL:", v22);
  objc_msgSend(v22, "absoluteString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "hasPrefix:", CFSTR("https://tv")))
  {
    +[CKSyndicationOnboardingLinkBalloonView tvSpecialization](CKSyndicationOnboardingLinkBalloonView, "tvSpecialization");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v27, "hasPrefix:", CFSTR("https://music")))
    {
      CKFrameworkBundle();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_SAFARI_HEADER"), &stru_1E276D870, CFSTR("ChatKit"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTitle:", v31);

      objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("HighlightSafari"));
      v32 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v32);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithData:MIMEType:", v29, CFSTR("image/jpeg"));
      objc_msgSend(v26, "setImage:", v33);

      goto LABEL_26;
    }
    +[CKSyndicationOnboardingLinkBalloonView musicSpecialization](CKSyndicationOnboardingLinkBalloonView, "musicSpecialization");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v28;
  objc_msgSend(v26, "setSpecialization:", v28);
LABEL_26:

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC11C8]), "initWithMetadata:", v26);
  objc_msgSend(v34, "_setPreferredSizeClass:", 7);
  objc_msgSend(v34, "_setApplyCornerRadius:", 0);
  objc_msgSend(v34, "_setDisableTapGesture:", 1);
  objc_msgSend(v34, "_setDisableAnimations:", 1);
  objc_msgSend(v34, "_setForceFlexibleWidth:", 1);
  v35 = [CKSyndicationOnboardingTailedBubble alloc];
  v36 = -[CKSyndicationOnboardingTailedBubble initWithFrame:withAppName:withLPLinkView:](v35, "initWithFrame:withAppName:withLPLinkView:", a3, v34, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKSyndicationOnboardingTailedBubble setTranslatesAutoresizingMaskIntoConstraints:](v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKAppIconLinkView setTailedBubble:](self, "setTailedBubble:", v36);
  -[CKAppIconLinkView addSubview:](self, "addSubview:", v36);

}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
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
  uint64_t v17;
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
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  -[CKAppIconLinkView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[CKAppIconLinkView constraints](self, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconLinkView setConstraints:](self, "setConstraints:", v7);

  -[CKAppIconLinkView constraints](self, "constraints");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconLinkView tailedBubble](self, "tailedBubble");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconLinkView widthAnchor](self, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v26;
  -[CKAppIconLinkView tailedBubble](self, "tailedBubble");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconLinkView heightAnchor](self, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v21;
  -[CKAppIconLinkView tailedBubble](self, "tailedBubble");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconLinkView leadingAnchor](self, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v10;
  -[CKAppIconLinkView tailedBubble](self, "tailedBubble");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconLinkView topAnchor](self, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v15);

  -[CKAppIconLinkView constraints](self, "constraints");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0CB3718];
    -[CKAppIconLinkView constraints](self, "constraints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v19);

  }
  v30.receiver = self;
  v30.super_class = (Class)CKAppIconLinkView;
  -[CKAppIconLinkView updateConstraints](&v30, sel_updateConstraints);
}

- (id)generateCroppedImageFromPreviewImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  float v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  float v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA618], "preferredFormat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppIconLinkView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    objc_msgSend(v5, "setScale:");

    objc_msgSend(v5, "setPreferredRange:", 0);
    objc_msgSend(v4, "size");
    v8 = v7;
    objc_msgSend(v4, "size");
    v10 = v8 * (23.0 / v9);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v5, v10, 23.0);
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __58__CKAppIconLinkView_generateCroppedImageFromPreviewImage___block_invoke;
    v23[3] = &unk_1E2751E98;
    v25 = 0;
    v26 = 0;
    v24 = v4;
    v27 = v10;
    v28 = 0x4037000000000000;
    objc_msgSend(v11, "imageWithActions:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageWithRenderingMode:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", 23.0, 23.0);
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __58__CKAppIconLinkView_generateCroppedImageFromPreviewImage___block_invoke_2;
    v20[3] = &unk_1E2759098;
    v21 = v14;
    v22 = v10;
    v16 = v14;
    objc_msgSend(v15, "imageWithActions:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageWithRenderingMode:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __58__CKAppIconLinkView_generateCroppedImageFromPreviewImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __58__CKAppIconLinkView_generateCroppedImageFromPreviewImage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", (float)((float)(*(float *)(a1 + 40) + -20.0) * -0.5), 0.0);
}

- (void)setPreviewImageForImage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CKAppIconLinkView generateCroppedImageFromPreviewImage:](self, "generateCroppedImageFromPreviewImage:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v9);
  -[CKAppIconLinkView setPreviewView:](self, "setPreviewView:", v4);

  -[CKAppIconLinkView previewView](self, "previewView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CKAppIconLinkView previewView](self, "previewView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", 6.0);

  -[CKAppIconLinkView previewView](self, "previewView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClipsToBounds:", 1);

}

- (int64_t)appName
{
  return self->_appName;
}

- (void)setAppName:(int64_t)a3
{
  self->_appName = a3;
}

- (CGRect)linkFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_linkFrame.origin.x;
  y = self->_linkFrame.origin.y;
  width = self->_linkFrame.size.width;
  height = self->_linkFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLinkFrame:(CGRect)a3
{
  self->_linkFrame = a3;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_previewView, a3);
}

- (NSString)previewString
{
  return self->_previewString;
}

- (void)setPreviewString:(id)a3
{
  objc_storeStrong((id *)&self->_previewString, a3);
}

- (CKSyndicationOnboardingTailedBubble)tailedBubble
{
  return self->_tailedBubble;
}

- (void)setTailedBubble:(id)a3
{
  objc_storeStrong((id *)&self->_tailedBubble, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_tailedBubble, 0);
  objc_storeStrong((id *)&self->_previewString, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
}

@end
