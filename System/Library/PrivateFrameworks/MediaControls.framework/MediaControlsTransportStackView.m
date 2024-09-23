@implementation MediaControlsTransportStackView

- (MediaControlsTransportStackView)initWithFrame:(CGRect)a3
{
  MediaControlsTransportStackView *v3;
  MediaControlsTransportStackView *v4;
  uint64_t v5;
  MediaControlsTransportButton *tvRemoteButton;
  uint64_t v7;
  MediaControlsTransportButton *leftButton;
  uint64_t v9;
  MediaControlsTransportButton *middleButton;
  uint64_t v11;
  MediaControlsTransportButton *rightButton;
  uint64_t v13;
  MediaControlsTransportButton *languageOptionsButton;
  MediaControlsTransportButton *v15;
  void *v16;
  MediaControlsTransportButton *v17;
  void *v18;
  MediaControlsTransportButton *v19;
  void *v20;
  MediaControlsTransportButton *v21;
  void *v22;
  MediaControlsTransportButton *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)MediaControlsTransportStackView;
  v3 = -[MediaControlsTransportStackView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MediaControlsTransportStackView _createTransportButton](v3, "_createTransportButton");
    v5 = objc_claimAutoreleasedReturnValue();
    tvRemoteButton = v4->_tvRemoteButton;
    v4->_tvRemoteButton = (MediaControlsTransportButton *)v5;

    -[MediaControlsTransportStackView _createTransportButton](v4, "_createTransportButton");
    v7 = objc_claimAutoreleasedReturnValue();
    leftButton = v4->_leftButton;
    v4->_leftButton = (MediaControlsTransportButton *)v7;

    -[MediaControlsTransportStackView _createTransportButton](v4, "_createTransportButton");
    v9 = objc_claimAutoreleasedReturnValue();
    middleButton = v4->_middleButton;
    v4->_middleButton = (MediaControlsTransportButton *)v9;

    -[MediaControlsTransportStackView _createTransportButton](v4, "_createTransportButton");
    v11 = objc_claimAutoreleasedReturnValue();
    rightButton = v4->_rightButton;
    v4->_rightButton = (MediaControlsTransportButton *)v11;

    -[MediaControlsTransportStackView _createTransportButton](v4, "_createTransportButton");
    v13 = objc_claimAutoreleasedReturnValue();
    languageOptionsButton = v4->_languageOptionsButton;
    v4->_languageOptionsButton = (MediaControlsTransportButton *)v13;

    -[MediaControlsTransportStackView _updateButtonConfiguration](v4, "_updateButtonConfiguration");
    v15 = v4->_tvRemoteButton;
    +[MediaControlsTheme appleTVRemote](MediaControlsTheme, "appleTVRemote");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setImage:forState:](v15, "setImage:forState:", v16, 0);

    v17 = v4->_leftButton;
    +[MediaControlsTheme backwardImage](MediaControlsTheme, "backwardImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setImage:forState:](v17, "setImage:forState:", v18, 0);

    v19 = v4->_middleButton;
    +[MediaControlsTheme playImage](MediaControlsTheme, "playImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setImage:forState:](v19, "setImage:forState:", v20, 0);

    v21 = v4->_rightButton;
    +[MediaControlsTheme forwardImage](MediaControlsTheme, "forwardImage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setImage:forState:](v21, "setImage:forState:", v22, 0);

    v23 = v4->_languageOptionsButton;
    +[MediaControlsTheme captionsImage](MediaControlsTheme, "captionsImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setImage:forState:](v23, "setImage:forState:", v24, 0);

    -[MediaControlsTransportButton addTarget:action:forControlEvents:](v4->_tvRemoteButton, "addTarget:action:forControlEvents:", v4, sel_touchUpInsideHangdogButton_, 64);
    -[MediaControlsTransportButton addTarget:action:forControlEvents:](v4->_leftButton, "addTarget:action:forControlEvents:", v4, sel_touchUpInsideLeftButton_, 64);
    -[MediaControlsTransportButton addTarget:action:forControlEvents:](v4->_middleButton, "addTarget:action:forControlEvents:", v4, sel_touchUpInsideMiddleButton_, 64);
    -[MediaControlsTransportButton addTarget:action:forControlEvents:](v4->_rightButton, "addTarget:action:forControlEvents:", v4, sel_touchUpInsideRightButton_, 64);
    -[MediaControlsTransportButton addTarget:action:forControlEvents:](v4->_languageOptionsButton, "addTarget:action:forControlEvents:", v4, sel_touchUpInsideCaptionsButton_, 64);
    -[MediaControlsTransportButton addTarget:action:forControlEvents:](v4->_leftButton, "addTarget:action:forControlEvents:", v4, sel_buttonHoldBegan_, 0x1000000);
    -[MediaControlsTransportButton addTarget:action:forControlEvents:](v4->_leftButton, "addTarget:action:forControlEvents:", v4, sel_buttonHoldReleased_, 0x2000000);
    -[MediaControlsTransportButton addTarget:action:forControlEvents:](v4->_rightButton, "addTarget:action:forControlEvents:", v4, sel_buttonHoldBegan_, 0x1000000);
    -[MediaControlsTransportButton addTarget:action:forControlEvents:](v4->_rightButton, "addTarget:action:forControlEvents:", v4, sel_buttonHoldReleased_, 0x2000000);
  }
  return v4;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  CGFloat rect;
  CGFloat recta;
  objc_super v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v54.receiver = self;
  v54.super_class = (Class)MediaControlsTransportStackView;
  -[MediaControlsTransportStackView layoutSubviews](&v54, sel_layoutSubviews);
  if (self->_style == 1 || !self->_shouldShowTVRemoteButton)
  {
    -[MediaControlsTransportStackView bounds](self, "bounds");
    x = v64.origin.x;
    y = v64.origin.y;
    width = v64.size.width;
    height = v64.size.height;
    CGRectGetWidth(v64);
    UIRoundToViewScale();
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    CGRectGetMinX(v65);
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    CGRectGetMinY(v66);
    UIRectCenteredYInRect();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[MediaControlsTransportButton setFrame:](self->_tvRemoteButton, "setFrame:");
    v67.origin.x = v22;
    v67.origin.y = v24;
    v67.size.width = v26;
    v67.size.height = v28;
    CGRectGetMaxX(v67);
    v68.origin.x = x;
    v68.origin.y = y;
    v68.size.width = width;
    v68.size.height = height;
    CGRectGetMinY(v68);
    UIRectCenteredYInRect();
    -[MediaControlsTransportButton setFrame:](self->_leftButton, "setFrame:");
    UIRectCenteredRect();
    UIRectCenteredRect();
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[MediaControlsTransportButton setFrame:](self->_middleButton, "setFrame:");
    v69.origin.x = v30;
    v69.origin.y = v32;
    v69.size.width = v34;
    v69.size.height = v36;
    CGRectGetMaxX(v69);
    v70.origin.x = x;
    v70.origin.y = y;
    v70.size.width = width;
    v70.size.height = height;
    CGRectGetMinY(v70);
    UIRectCenteredYInRect();
    -[MediaControlsTransportButton setFrame:](self->_rightButton, "setFrame:");
    v71.origin.x = x;
    v71.origin.y = y;
    v71.size.width = width;
    v71.size.height = height;
    CGRectGetMaxX(v71);
  }
  else
  {
    -[MediaControlsTransportStackView bounds](self, "bounds");
    UIRectInset();
    x = v55.origin.x;
    y = v55.origin.y;
    width = v55.size.width;
    height = v55.size.height;
    CGRectGetWidth(v55);
    UIRoundToViewScale();
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    CGRectGetMinX(v56);
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = height;
    CGRectGetMinY(v57);
    UIRectCenteredYInRect();
    v8 = v7;
    v10 = v9;
    v12 = v11;
    rect = v13;
    -[MediaControlsTransportButton setFrame:](self->_tvRemoteButton, "setFrame:");
    v58.origin.x = v8;
    v58.origin.y = v10;
    v58.size.width = v12;
    v58.size.height = rect;
    CGRectGetMaxX(v58);
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    CGRectGetMinY(v59);
    UIRectCenteredYInRect();
    -[MediaControlsTransportButton setFrame:](self->_leftButton, "setFrame:");
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    CGRectGetMinY(v60);
    UIRectCenteredRect();
    v15 = v14;
    v17 = v16;
    v19 = v18;
    recta = v20;
    -[MediaControlsTransportButton setFrame:](self->_middleButton, "setFrame:");
    v61.origin.x = v15;
    v61.origin.y = v17;
    v61.size.width = v19;
    v61.size.height = recta;
    CGRectGetMaxX(v61);
    v62.origin.x = x;
    v62.origin.y = y;
    v62.size.width = width;
    v62.size.height = height;
    CGRectGetMinY(v62);
    UIRectCenteredYInRect();
    -[MediaControlsTransportButton setFrame:](self->_rightButton, "setFrame:");
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    CGRectGetMaxX(v63);
  }
  v72.origin.x = x;
  v72.origin.y = y;
  v72.size.width = width;
  v72.size.height = height;
  CGRectGetMinY(v72);
  UIRectCenteredYInRect();
  -[MediaControlsTransportButton setFrame:](self->_languageOptionsButton, "setFrame:");
  -[MediaControlsTransportStackView leftButton](self, "leftButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "frame");
  CGRectGetMaxX(v73);
  -[MediaControlsTransportStackView middleButton](self, "middleButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");
  CGRectGetMinX(v74);

  UIEdgeInsetsMakeWithEdges();
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  -[MediaControlsTransportStackView tvRemoteButton](self, "tvRemoteButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setHitRectInsets:", v40, v42, v44, v46);

  -[MediaControlsTransportStackView leftButton](self, "leftButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setHitRectInsets:", v40, v42, v44, v46);

  -[MediaControlsTransportStackView middleButton](self, "middleButton");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setHitRectInsets:", v40, v42, v44, v46);

  -[MediaControlsTransportStackView rightButton](self, "rightButton");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setHitRectInsets:", v40, v42, v44, v46);

  -[MediaControlsTransportStackView languageOptionsButton](self, "languageOptionsButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setHitRectInsets:", v40, v42, v44, v46);

  -[MediaControlsTransportStackView _updateVisualStylingForButtons](self, "_updateVisualStylingForButtons");
}

- (void)touchUpInsideHangdogButton:(id)a3
{
  id v3;

  -[MediaControlsTransportStackView actionsDelegate](self, "actionsDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentTVRemote");

}

- (void)touchUpInsideLeftButton:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a3;
  -[MediaControlsTransportStackView leftButton](self, "leftButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldPresentActionSheet");

  if (v5)
  {
    -[MediaControlsTransportStackView actionsDelegate](self, "actionsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[MPCPlayerResponse tracklist](self->_response, "tracklist");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "playingItemIndexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[MPCPlayerResponse tracklist](self->_response, "tracklist");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "items");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itemAtIndexPath:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "presentRatingActionSheet:sourceView:", v11, v15);
      }

    }
    goto LABEL_8;
  }
  -[MediaControlsTransportStackView leftButton](self, "leftButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isHolding");

  if ((v13 & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0D4B358];
    objc_msgSend(v15, "touchUpInsideCommandRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performRequest:completion:", v6, 0);
LABEL_8:

  }
}

- (void)touchUpInsideMiddleButton:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x1E0D4B358];
  objc_msgSend(a3, "touchUpInsideCommandRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRequest:completion:", v4, 0);

}

- (void)touchUpInsideRightButton:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MediaControlsTransportStackView rightButton](self, "rightButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHolding");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0D4B358];
    objc_msgSend(v8, "touchUpInsideCommandRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performRequest:completion:", v7, 0);

  }
}

- (void)touchUpInsideCaptionsButton:(id)a3
{
  id v3;

  -[MediaControlsTransportStackView actionsDelegate](self, "actionsDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentLanguageOptions");

}

- (void)buttonHoldBegan:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x1E0D4B358];
  objc_msgSend(a3, "holdBeginCommandRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRequest:completion:", v4, 0);

}

- (void)buttonHoldReleased:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x1E0D4B358];
  objc_msgSend(a3, "holdEndCommandRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRequest:completion:", v4, 0);

}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[MediaControlsTransportStackView _updateButtonLayout](self, "_updateButtonLayout");
  }
}

- (void)setResponse:(id)a3
{
  MPCPlayerResponse *v5;
  MPCPlayerResponse **p_response;
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
  uint64_t v18;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  unsigned int v93;
  void *v94;
  void *v95;
  void *v96;
  char v97;

  v5 = (MPCPlayerResponse *)a3;
  p_response = &self->_response;
  if (self->_response != v5)
  {
    objc_storeStrong((id *)&self->_response, a3);
    -[MediaControlsTransportStackView tvRemoteButton](self, "tvRemoteButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportStackView _resetTransportButton:](self, "_resetTransportButton:", v7);

    -[MediaControlsTransportStackView leftButton](self, "leftButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportStackView _resetTransportButton:](self, "_resetTransportButton:", v8);

    -[MediaControlsTransportStackView middleButton](self, "middleButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportStackView _resetTransportButton:](self, "_resetTransportButton:", v9);

    -[MediaControlsTransportStackView rightButton](self, "rightButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportStackView _resetTransportButton:](self, "_resetTransportButton:", v10);

    -[MediaControlsTransportStackView languageOptionsButton](self, "languageOptionsButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportStackView _resetTransportButton:](self, "_resetTransportButton:", v11);

    -[MPCPlayerResponse tracklist](v5, "tracklist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playingItemIndexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[MPCPlayerResponse tracklist](v5, "tracklist");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "items");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "itemAtIndexPath:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    -[MPCPlayerResponse play](*p_response, "play");
    v17 = objc_claimAutoreleasedReturnValue();
    -[MPCPlayerResponse pause](*p_response, "pause");
    v18 = objc_claimAutoreleasedReturnValue();
    -[MPCPlayerResponse stop](*p_response, "stop");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportStackView middleButton](self, "middleButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUserInteractionEnabled:", 1);

    v95 = (void *)v17;
    if (v19 && v16 && (objc_msgSend(v16, "duration"), v97))
    {
      -[MediaControlsTransportStackView middleButton](self, "middleButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[MediaControlsTheme stopImage](MediaControlsTheme, "stopImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setImage:forState:", v22, 0);

      -[MediaControlsTransportStackView middleButton](self, "middleButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = v19;
    }
    else if (v18)
    {
      -[MediaControlsTransportStackView middleButton](self, "middleButton");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[MediaControlsTheme pauseImage](MediaControlsTheme, "pauseImage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setImage:forState:", v27, 0);

      -[MediaControlsTransportStackView middleButton](self, "middleButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = (void *)v18;
    }
    else
    {
      if (!v17)
      {
        v93 = 0;
LABEL_14:
        -[MPCPlayerResponse tracklist](*p_response, "tracklist");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "changeItemCommand");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "previousItem");
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "likeCommand");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = (void *)v18;
        if (objc_msgSend(v32, "presentationStyle") == 3)
        {
LABEL_17:

LABEL_18:
          -[MediaControlsTransportStackView leftButton](self, "leftButton");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[MediaControlsTheme hamburgerImage](MediaControlsTheme, "hamburgerImage");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setImage:forState:", v35, 0);

          -[MediaControlsTransportStackView leftButton](self, "leftButton");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setTouchUpInsideCommandRequest:", 0);
LABEL_19:
          v37 = 1;
LABEL_20:

          v38 = 1;
          goto LABEL_21;
        }
        objc_msgSend(v16, "dislikeCommand");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "presentationStyle") == 3)
        {

          goto LABEL_17;
        }
        objc_msgSend(v16, "wishlistCommand");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "presentationStyle");

        if (v67 == 3)
          goto LABEL_18;
        objc_msgSend(v16, "seekCommand");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "preferredBackwardJumpIntervals");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "count");

        if (v70)
        {
          objc_msgSend(v16, "seekCommand");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "preferredBackwardJumpIntervals");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "firstObject");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "doubleValue");
          v75 = v74;

          objc_msgSend(v16, "seekCommand");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "jumpByInterval:", v75);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          +[MediaControlsTheme goBackwardImageForTimeInterval:](MediaControlsTheme, "goBackwardImageForTimeInterval:", v75);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsTransportStackView leftButton](self, "leftButton");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setImage:forState:", v77, 0);

          -[MediaControlsTransportStackView leftButton](self, "leftButton");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setTouchUpInsideCommandRequest:", v36);

LABEL_35:
          v37 = 0;
          goto LABEL_20;
        }
        objc_msgSend(v16, "likeCommand");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (v80)
        {

        }
        else
        {
          objc_msgSend(v16, "dislikeCommand");
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v81)
          {
            -[MediaControlsTransportStackView leftButton](self, "leftButton");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            +[MediaControlsTheme backwardImage](MediaControlsTheme, "backwardImage");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "setImage:forState:", v86, 0);

            if (!v96)
            {
              v37 = 0;
              v38 = 0;
LABEL_21:
              -[MediaControlsTransportStackView leftButton](self, "leftButton");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setShouldPresentActionSheet:", v37);

              -[MPCPlayerResponse tracklist](*p_response, "tracklist");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "changeItemCommand");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "nextItem");
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v16, "seekCommand");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "preferredForwardJumpIntervals");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "count");

              if (v45)
              {
                objc_msgSend(v16, "seekCommand");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "preferredForwardJumpIntervals");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "firstObject");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "doubleValue");
                v50 = v49;

                objc_msgSend(v16, "seekCommand");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "jumpByInterval:", v50);
                v52 = (void *)objc_claimAutoreleasedReturnValue();

                +[MediaControlsTheme goForwardImageForTimeInterval:](MediaControlsTheme, "goForwardImageForTimeInterval:", v50);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                -[MediaControlsTransportStackView rightButton](self, "rightButton");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "setImage:forState:", v53, 0);

                -[MediaControlsTransportStackView rightButton](self, "rightButton");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "setTouchUpInsideCommandRequest:", v52);
              }
              else
              {
                -[MediaControlsTransportStackView rightButton](self, "rightButton");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                +[MediaControlsTheme forwardImage](MediaControlsTheme, "forwardImage");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "setImage:forState:", v61, 0);

                if (!v42)
                {
                  v56 = 0;
                  goto LABEL_25;
                }
                -[MediaControlsTransportStackView rightButton](self, "rightButton");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "setTouchUpInsideCommandRequest:", v42);

                objc_msgSend(v16, "seekCommand");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "beginSeekWithDirection:", 1);
                v52 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v16, "seekCommand");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "endSeek");
                v53 = (void *)objc_claimAutoreleasedReturnValue();

                if (v52)
                {
                  -[MediaControlsTransportStackView rightButton](self, "rightButton");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "setHoldBeginCommandRequest:", v52);

                }
                if (!v53)
                {
LABEL_24:

                  v56 = 1;
LABEL_25:
                  -[MediaControlsTransportStackView leftButton](self, "leftButton");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "setUserInteractionEnabled:", v38);

                  -[MediaControlsTransportStackView middleButton](self, "middleButton");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "setUserInteractionEnabled:", v93);

                  -[MediaControlsTransportStackView rightButton](self, "rightButton");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "setUserInteractionEnabled:", v56);

                  -[MediaControlsTransportStackView _updateButtonLayout](self, "_updateButtonLayout");
                  -[MediaControlsTransportStackView _updateVisualStylingForButtons](self, "_updateVisualStylingForButtons");
                  -[MediaControlsTransportStackView setNeedsLayout](self, "setNeedsLayout");

                  goto LABEL_26;
                }
                -[MediaControlsTransportStackView rightButton](self, "rightButton");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "setHoldEndCommandRequest:", v53);
              }

              goto LABEL_24;
            }
            -[MediaControlsTransportStackView leftButton](self, "leftButton");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "setTouchUpInsideCommandRequest:", v96);

            objc_msgSend(v16, "seekCommand");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "beginSeekWithDirection:", -1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "seekCommand");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "endSeek");
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              -[MediaControlsTransportStackView leftButton](self, "leftButton");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "setHoldBeginCommandRequest:", v36);

            }
            if (v90)
            {
              -[MediaControlsTransportStackView leftButton](self, "leftButton");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "setHoldEndCommandRequest:", v90);

            }
            goto LABEL_35;
          }
        }
        objc_msgSend(v16, "likeCommand");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v82, "value") & 1) != 0)
          +[MediaControlsTheme starFillImage](MediaControlsTheme, "starFillImage");
        else
          +[MediaControlsTheme starImage](MediaControlsTheme, "starImage");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        -[MediaControlsTransportStackView leftButton](self, "leftButton");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "setImage:forState:", v36, 0);

        -[MediaControlsTransportStackView leftButton](self, "leftButton");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setTouchUpInsideCommandRequest:", 0);

        goto LABEL_19;
      }
      -[MediaControlsTransportStackView middleButton](self, "middleButton");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[MediaControlsTheme playImage](MediaControlsTheme, "playImage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setImage:forState:", v29, 0);

      -[MediaControlsTransportStackView middleButton](self, "middleButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = (void *)v17;
    }
    objc_msgSend(v23, "setTouchUpInsideCommandRequest:", v25);

    v93 = 1;
    goto LABEL_14;
  }
LABEL_26:

}

- (void)updateOnRouteChange
{
  -[MediaControlsTransportStackView _updateButtonLayout](self, "_updateButtonLayout");
  -[MediaControlsTransportStackView _updateVisualStylingForButtons](self, "_updateVisualStylingForButtons");
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 44.0;
  result.height = v3;
  return result;
}

- (void)setVisualStylingProvider:(id)a3
{
  MTVisualStylingProvider *v5;
  MTVisualStylingProvider *visualStylingProvider;
  MTVisualStylingProvider *v7;

  v5 = (MTVisualStylingProvider *)a3;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v7 = v5;
    -[MTVisualStylingProvider _removeObserver:](visualStylingProvider, "_removeObserver:", self);
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    -[MTVisualStylingProvider _addObserver:](self->_visualStylingProvider, "_addObserver:", self);
    -[MediaControlsTransportStackView _updateVisualStylingForButtons](self, "_updateVisualStylingForButtons");
    v5 = v7;
  }

}

- (void)_updateVisualStylingForButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MediaControlsTransportStackView tvRemoteButton](self, "tvRemoteButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTransportStackView _updateButtonVisualStyling:](self, "_updateButtonVisualStyling:", v3);

  -[MediaControlsTransportStackView leftButton](self, "leftButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTransportStackView _updateButtonVisualStyling:](self, "_updateButtonVisualStyling:", v4);

  -[MediaControlsTransportStackView middleButton](self, "middleButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTransportStackView _updateButtonVisualStyling:](self, "_updateButtonVisualStyling:", v5);

  -[MediaControlsTransportStackView rightButton](self, "rightButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTransportStackView _updateButtonVisualStyling:](self, "_updateButtonVisualStyling:", v6);

  -[MediaControlsTransportStackView languageOptionsButton](self, "languageOptionsButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTransportStackView _updateButtonVisualStyling:](self, "_updateButtonVisualStyling:", v7);

}

- (void)_updateButtonVisualStyling:(id)a3
{
  int v4;
  MTVisualStylingProvider *visualStylingProvider;
  void *v6;
  MTVisualStylingProvider *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "isUserInteractionEnabled");
  visualStylingProvider = self->_visualStylingProvider;
  if (v4)
  {
    if (visualStylingProvider)
    {
      objc_msgSend(v12, "imageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = self->_visualStylingProvider;
      v8 = 0;
LABEL_6:
      -[MTVisualStylingProvider _visualStylingForStyle:](v7, "_visualStylingForStyle:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mt_replaceVisualStyling:", v9);
LABEL_10:

      goto LABEL_11;
    }
  }
  else if (visualStylingProvider)
  {
    objc_msgSend(v12, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_visualStylingProvider;
    v8 = 2;
    goto LABEL_6;
  }
  v10 = objc_msgSend(v12, "isUserInteractionEnabled");
  -[MediaControlsTransportStackView tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[MediaControlsTransportStackView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tertiaryColorForInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTintColor:", v11);

    goto LABEL_10;
  }
  objc_msgSend(v12, "setTintColor:", v6);
LABEL_11:

}

- (id)_createTransportButton
{
  void *v3;
  void *v4;

  +[MPButton easyTouchButtonWithType:](MediaControlsTransportButton, "easyTouchButtonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  objc_msgSend(v3, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", 1);

  -[MediaControlsTransportStackView addSubview:](self, "addSubview:", v3);
  return v3;
}

- (void)_resetTransportButton:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setTouchUpInsideCommandRequest:", 0);
  objc_msgSend(v3, "setHoldBeginCommandRequest:", 0);
  objc_msgSend(v3, "setHoldEndCommandRequest:", 0);
  objc_msgSend(v3, "setShouldPresentActionSheet:", 0);

}

- (void)_updateButtonLayout
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_actionsDelegate);
  v4 = objc_msgSend(WeakRetained, "shouldShowTVRemoteButton");

  -[MediaControlsTransportStackView tvRemoteButton](self, "tvRemoteButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4 ^ 1);

  -[MediaControlsTransportStackView tvRemoteButton](self, "tvRemoteButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v4);

  -[MPCPlayerResponse tracklist](self->_response, "tracklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playingItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "languageOptionGroups");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
    v9 = objc_msgSend(v12, "indexOfObjectPassingTest:", &__block_literal_global_31) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v9 = 0;
  -[MediaControlsTransportStackView languageOptionsButton](self, "languageOptionsButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v4 ^ 1);

  -[MediaControlsTransportStackView languageOptionsButton](self, "languageOptionsButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInteractionEnabled:", v9);

  -[MediaControlsTransportStackView _updateButtonConfiguration](self, "_updateButtonConfiguration");
  self->_shouldShowTVRemoteButton = v4;
  -[MediaControlsTransportStackView setNeedsLayout](self, "setNeedsLayout");

}

BOOL __54__MediaControlsTransportStackView__updateButtonLayout__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "numberOfOptions") > 1;
}

- (void)_updateButtonConfiguration
{
  MediaControlsTransportButton *tvRemoteButton;
  void *v4;
  MediaControlsTransportButton **p_leftButton;
  MediaControlsTransportButton *leftButton;
  void *v7;
  MediaControlsTransportButton **p_middleButton;
  MediaControlsTransportButton *middleButton;
  void *v10;
  MediaControlsTransportButton **p_rightButton;
  MediaControlsTransportButton *rightButton;
  void *v13;
  MediaControlsTransportButton **p_languageOptionsButton;
  MediaControlsTransportButton *languageOptionsButton;
  void *v16;
  double v17;
  void *v18;
  MediaControlsTransportButton *v19;
  void *v20;
  MediaControlsTransportButton *v21;
  void *v22;
  MediaControlsTransportButton *v23;
  void *v24;
  MediaControlsTransportButton *v25;

  tvRemoteButton = self->_tvRemoteButton;
  if (self->_style == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, 20.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setPreferredSymbolConfiguration:forImageInState:](tvRemoteButton, "setPreferredSymbolConfiguration:forImageInState:", v4, 0);

    p_leftButton = &self->_leftButton;
    leftButton = self->_leftButton;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, 20.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setPreferredSymbolConfiguration:forImageInState:](leftButton, "setPreferredSymbolConfiguration:forImageInState:", v7, 0);

    p_middleButton = &self->_middleButton;
    middleButton = self->_middleButton;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 3, 20.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setPreferredSymbolConfiguration:forImageInState:](middleButton, "setPreferredSymbolConfiguration:forImageInState:", v10, 0);

    p_rightButton = &self->_rightButton;
    rightButton = self->_rightButton;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, 20.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setPreferredSymbolConfiguration:forImageInState:](rightButton, "setPreferredSymbolConfiguration:forImageInState:", v13, 0);

    p_languageOptionsButton = &self->_languageOptionsButton;
    languageOptionsButton = self->_languageOptionsButton;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, 20.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setPreferredSymbolConfiguration:forImageInState:](languageOptionsButton, "setPreferredSymbolConfiguration:forImageInState:", v16, 0);
    v17 = 0.86459;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, 32.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setPreferredSymbolConfiguration:forImageInState:](tvRemoteButton, "setPreferredSymbolConfiguration:forImageInState:", v18, 0);

    p_leftButton = &self->_leftButton;
    v19 = self->_leftButton;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, 32.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setPreferredSymbolConfiguration:forImageInState:](v19, "setPreferredSymbolConfiguration:forImageInState:", v20, 0);

    p_middleButton = &self->_middleButton;
    v21 = self->_middleButton;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 3, 32.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setPreferredSymbolConfiguration:forImageInState:](v21, "setPreferredSymbolConfiguration:forImageInState:", v22, 0);

    p_rightButton = &self->_rightButton;
    v23 = self->_rightButton;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, 32.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setPreferredSymbolConfiguration:forImageInState:](v23, "setPreferredSymbolConfiguration:forImageInState:", v24, 0);

    p_languageOptionsButton = &self->_languageOptionsButton;
    v25 = self->_languageOptionsButton;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, 32.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsTransportButton setPreferredSymbolConfiguration:forImageInState:](v25, "setPreferredSymbolConfiguration:forImageInState:", v16, 0);
    v17 = 1.4;
  }

  -[MediaControlsTransportButton setCursorScale:](self->_tvRemoteButton, "setCursorScale:", v17);
  -[MediaControlsTransportButton setCursorScale:](*p_leftButton, "setCursorScale:", v17);
  -[MediaControlsTransportButton setCursorScale:](*p_middleButton, "setCursorScale:", v17);
  -[MediaControlsTransportButton setCursorScale:](*p_rightButton, "setCursorScale:", v17);
  -[MediaControlsTransportButton setCursorScale:](*p_languageOptionsButton, "setCursorScale:", v17);
}

- (int64_t)style
{
  return self->_style;
}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (void)setEmpty:(BOOL)a3
{
  self->_empty = a3;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (MediaControlsActionsDelegate)actionsDelegate
{
  return (MediaControlsActionsDelegate *)objc_loadWeakRetained((id *)&self->_actionsDelegate);
}

- (void)setActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionsDelegate, a3);
}

- (MediaControlsTransportButton)tvRemoteButton
{
  return self->_tvRemoteButton;
}

- (void)setTvRemoteButton:(id)a3
{
  objc_storeStrong((id *)&self->_tvRemoteButton, a3);
}

- (MediaControlsTransportButton)leftButton
{
  return self->_leftButton;
}

- (void)setLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_leftButton, a3);
}

- (MediaControlsTransportButton)middleButton
{
  return self->_middleButton;
}

- (void)setMiddleButton:(id)a3
{
  objc_storeStrong((id *)&self->_middleButton, a3);
}

- (MediaControlsTransportButton)rightButton
{
  return self->_rightButton;
}

- (void)setRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightButton, a3);
}

- (MediaControlsTransportButton)languageOptionsButton
{
  return self->_languageOptionsButton;
}

- (void)setLanguageOptionsButton:(id)a3
{
  objc_storeStrong((id *)&self->_languageOptionsButton, a3);
}

- (BOOL)shouldShowTVRemoteButton
{
  return self->_shouldShowTVRemoteButton;
}

- (void)setShouldShowTVRemoteButton:(BOOL)a3
{
  self->_shouldShowTVRemoteButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageOptionsButton, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_middleButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_tvRemoteButton, 0);
  objc_destroyWeak((id *)&self->_actionsDelegate);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
