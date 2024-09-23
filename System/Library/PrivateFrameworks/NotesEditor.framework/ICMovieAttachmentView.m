@implementation ICMovieAttachmentView

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("movie attachment"), &stru_1EA7E9860, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentView icaxAttachmentViewTypeDescription](self, "icaxAttachmentViewTypeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __ICAccessibilityStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)icaxHintString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Double tap to play movie"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Movie"), &stru_1EA7E9860, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  -[ICMovieAttachmentView accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)sharedInit:(BOOL)a3
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)ICMovieAttachmentView;
  -[ICImageAttachmentView sharedInit:](&v38, sel_sharedInit_, a3);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachment_video_play"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMovieAttachmentView setPlayButtonImage:](self, "setPlayButtonImage:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  -[ICMovieAttachmentView setPlayButtonLayer:](self, "setPlayButtonLayer:", v5);

  -[ICMovieAttachmentView bounds](self, "bounds");
  v7 = v6;
  -[ICMovieAttachmentView bounds](self, "bounds");
  v9 = v8;
  -[ICMovieAttachmentView playButtonImage](self, "playButtonImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v7 + (v9 - v11) * 0.5;

  v13 = fmax(v12, 0.0);
  -[ICMovieAttachmentView bounds](self, "bounds");
  v15 = v14;
  -[ICMovieAttachmentView bounds](self, "bounds");
  v17 = v16;
  -[ICMovieAttachmentView playButtonImage](self, "playButtonImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "size");
  v20 = v15 + (v17 - v19) * 0.5;

  v21 = fmax(v20, 0.0);
  -[ICMovieAttachmentView playButtonImage](self, "playButtonImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "size");
  v24 = v23;
  v26 = v25;

  -[ICMovieAttachmentView setPlayButtonFrame:](self, "setPlayButtonFrame:", v13, v21, v24, v26);
  -[ICMovieAttachmentView playButtonLayer](self, "playButtonLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v13, v21, v24, v26);

  v28 = *MEMORY[0x1E0CD2F88];
  -[ICMovieAttachmentView playButtonLayer](self, "playButtonLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setContentsGravity:", v28);

  -[ICMovieAttachmentView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[ICMovieAttachmentView playButtonImage](self, "playButtonImage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "ic_CGImage");
  -[ICMovieAttachmentView playButtonLayer](self, "playButtonLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setContents:", v31);

  -[ICMovieAttachmentView playButtonLayer](self, "playButtonLayer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = 0;
  objc_msgSend(v33, "setOpacity:", v34);

  -[ICMovieAttachmentView layer](self, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMovieAttachmentView playButtonLayer](self, "playButtonLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "insertSublayer:above:", v36, v37);

}

- (BOOL)allowsPictureInPicture
{
  ICMovieAttachmentView *v2;
  uint64_t v3;
  char v4;

  v2 = self;
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      -[ICMovieAttachmentView nextResponder](v2, "nextResponder");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (ICMovieAttachmentView *)v3;
      if (!v3)
        goto LABEL_6;
    }
    v2 = v2;
  }
LABEL_6:
  v4 = -[ICMovieAttachmentView isEditingOnSystemPaper](v2, "isEditingOnSystemPaper") ^ 1;

  return v4;
}

- (void)updateImageSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  _BOOL4 v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  -[ICImageAttachmentView imageSize](self, "imageSize");
  v9 = v8;
  v11 = v10;
  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  if (TSDNearlyEqualSizes())
  {
    -[ICImageAttachmentView imageLayer](self, "imageLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v16 = v15 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v14 == *MEMORY[0x1E0C9D820];

  }
  else
  {
    v16 = 1;
  }

  -[ICImageAttachmentView imageLayer](self, "imageLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);

  -[ICMovieAttachmentView bounds](self, "bounds");
  v19 = v18;
  -[ICMovieAttachmentView bounds](self, "bounds");
  v21 = v20;
  -[ICMovieAttachmentView playButtonImage](self, "playButtonImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "size");
  v24 = v19 + (v21 - v23) * 0.5;

  v25 = fmax(v24, 0.0);
  -[ICMovieAttachmentView bounds](self, "bounds");
  v27 = v26;
  -[ICMovieAttachmentView bounds](self, "bounds");
  v29 = v28;
  -[ICMovieAttachmentView playButtonImage](self, "playButtonImage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "size");
  v32 = v27 + (v29 - v31) * 0.5;

  v33 = fmax(v32, 0.0);
  -[ICMovieAttachmentView playButtonImage](self, "playButtonImage");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "size");
  v36 = v35;
  v38 = v37;

  -[ICMovieAttachmentView setPlayButtonFrame:](self, "setPlayButtonFrame:", v25, v33, v36, v38);
  -[ICMovieAttachmentView playButtonLayer](self, "playButtonLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v25, v33, v36, v38);

  -[ICMovieAttachmentView playButtonLayer](self, "playButtonLayer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v41) = 1.0;
  objc_msgSend(v40, "setOpacity:", v41);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  if (v16)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__ICMovieAttachmentView_updateImageSize__block_invoke;
    block[3] = &unk_1EA7DD2D8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __40__ICMovieAttachmentView_updateImageSize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didChangeSize");
}

- (void)willDeleteAttachment
{
  +[ICMovieController pauseIfPlaying](ICMovieController, "pauseIfPlaying");
}

- (void)didChangeAttachment
{
  void *v3;
  ICMovieAttachmentView *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICMovieAttachmentView;
  -[ICImageAttachmentView didChangeAttachment](&v6, sel_didChangeAttachment);
  +[ICMovieController sharedController](ICMovieController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeMovieAttachmentView");
  v4 = (ICMovieAttachmentView *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    +[ICMovieController sharedController](ICMovieController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updatePlayer");

  }
}

- (void)didChangeMedia
{
  void *v3;
  ICMovieAttachmentView *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICMovieAttachmentView;
  -[ICImageAttachmentView didChangeMedia](&v6, sel_didChangeMedia);
  +[ICMovieController sharedController](ICMovieController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeMovieAttachmentView");
  v4 = (ICMovieAttachmentView *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    +[ICMovieController sharedController](ICMovieController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updatePlayer");

  }
}

- (void)didTapAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  if (-[ICMovieAttachmentView ic_isInSecureWindow](self, "ic_isInSecureWindow"))
  {
    v9.receiver = self;
    v9.super_class = (Class)ICMovieAttachmentView;
    -[ICAttachmentView didTapAttachment:](&v9, sel_didTapAttachment_, v4);
  }
  else
  {
    -[ICAttachmentView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

    +[ICMovieController sharedController](ICMovieController, "sharedController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActiveMovieAttachmentView:", self);

    +[ICMovieController sharedController](ICMovieController, "sharedController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updatePlayer");

    +[ICMovieController sharedController](ICMovieController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "moviePlayerTapped");

  }
}

- (void)setShowLoadingImage:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ICMovieAttachmentView;
  -[ICImageAttachmentView setShowLoadingImage:](&v6, sel_setShowLoadingImage_);
  -[ICMovieAttachmentView playButtonLayer](self, "playButtonLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

}

- (id)placeholderImageSystemName
{
  return CFSTR("photo.tv");
}

- (CALayer)playButtonLayer
{
  return self->playButtonLayer;
}

- (void)setPlayButtonLayer:(id)a3
{
  objc_storeStrong((id *)&self->playButtonLayer, a3);
}

- (UIImage)playButtonImage
{
  return self->playButtonImage;
}

- (void)setPlayButtonImage:(id)a3
{
  objc_storeStrong((id *)&self->playButtonImage, a3);
}

- (CGRect)playButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_playButtonFrame.origin.x;
  y = self->_playButtonFrame.origin.y;
  width = self->_playButtonFrame.size.width;
  height = self->_playButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPlayButtonFrame:(CGRect)a3
{
  self->_playButtonFrame = a3;
}

- (BOOL)icaxIsShowingPlayer
{
  return self->_icaxIsShowingPlayer;
}

- (void)setIcaxIsShowingPlayer:(BOOL)a3
{
  self->_icaxIsShowingPlayer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->playButtonImage, 0);
  objc_storeStrong((id *)&self->playButtonLayer, 0);
}

@end
