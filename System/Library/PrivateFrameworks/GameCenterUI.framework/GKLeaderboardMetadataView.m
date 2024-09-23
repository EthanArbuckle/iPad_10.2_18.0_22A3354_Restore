@implementation GKLeaderboardMetadataView

- (void)awakeFromNib
{
  int ShouldUsePadUI;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)GKLeaderboardMetadataView;
  -[GKLeaderboardMetadataView awakeFromNib](&v25, sel_awakeFromNib);
  ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();
  v4 = *MEMORY[0x1E0DC4AE8];
  if (ShouldUsePadUI)
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:design:weight:", v4, *MEMORY[0x1E0DC13A8], *MEMORY[0x1E0DC1448]);
  else
    objc_msgSend(MEMORY[0x1E0DC1350], "_gkPreferredFontForTextStyle:design:", v4, *MEMORY[0x1E0DC1400]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardMetadataView rank](self, "rank");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardMetadataView rank](self, "rank");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardMetadataView title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC1440]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardMetadataView footnote](self, "footnote");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "secondaryLabelCompositingFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardMetadataView footnote](self, "footnote");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCompositingFilter:", v14);

  -[GKLeaderboardMetadataView avatarContainer1](self, "avatarContainer1");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", 1);

  -[GKLeaderboardMetadataView avatarContainer2](self, "avatarContainer2");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidden:", 1);

  -[GKLeaderboardMetadataView avatarContainer3](self, "avatarContainer3");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", 1);

  -[GKLeaderboardMetadataView rank](self, "rank");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", 1);

  -[GKLeaderboardMetadataView vibrancyView](self, "vibrancyView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidden:", 1);

  -[GKLeaderboardMetadataView rank](self, "rank");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", &stru_1E59EB978);

  v23 = (void *)objc_opt_new();
  -[GKLeaderboardMetadataView vibrancyView](self, "vibrancyView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setEffect:", v23);

}

- (void)configureVibrancy:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  if (a3 && *MEMORY[0x1E0D253F8])
  {
    objc_msgSend(MEMORY[0x1E0DC3F50], "_gkGameLayerContentVibrancyEffect");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v6 = (id)v4;
  -[GKLeaderboardMetadataView vibrancyView](self, "vibrancyView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEffect:", v6);

}

- (void)configureWithRank:(id)a3 title:(id)a4 footnote:(id)a5 vibrant:(BOOL)a6
{
  -[GKLeaderboardMetadataView configureWithRank:title:footnote:altFootnote:vibrant:](self, "configureWithRank:title:footnote:altFootnote:vibrant:", a3, a4, a5, 0, a6);
}

- (void)configureWithRank:(id)a3 title:(id)a4 footnote:(id)a5 altFootnote:(id)a6 vibrant:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[GKLeaderboardMetadataView avatarContainer1](self, "avatarContainer1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", 1);

  -[GKLeaderboardMetadataView avatarContainer2](self, "avatarContainer2");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", 1);

  -[GKLeaderboardMetadataView avatarContainer3](self, "avatarContainer3");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidden:", 1);

  -[GKLeaderboardMetadataView rank](self, "rank");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", 0);

  -[GKLeaderboardMetadataView vibrancyView](self, "vibrancyView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", 0);

  -[GKLeaderboardMetadataView rank](self, "rank");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v15);

  -[GKLeaderboardMetadataView title](self, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v14);

  -[GKLeaderboardMetadataView configureFootnote:altFootnote:](self, "configureFootnote:altFootnote:", v13, v12);
  -[GKLeaderboardMetadataView configureVibrancy:](self, "configureVibrancy:", v7);
}

- (void)configureWithPlayers:(id)a3 title:(id)a4 footnote:(id)a5
{
  -[GKLeaderboardMetadataView configureWithPlayers:title:footnote:altFootnote:](self, "configureWithPlayers:title:footnote:altFootnote:", a3, a4, a5, 0);
}

- (void)configureWithPlayers:(id)a3 title:(id)a4 footnote:(id)a5 altFootnote:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
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
  id v26;

  v26 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = objc_msgSend(v26, "count");
  -[GKLeaderboardMetadataView rank](self, "rank");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

  -[GKLeaderboardMetadataView vibrancyView](self, "vibrancyView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", 1);

  -[GKLeaderboardMetadataView avatarContainer1](self, "avatarContainer1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v13 < 1);

  -[GKLeaderboardMetadataView avatarContainer2](self, "avatarContainer2");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", v13 < 2);

  -[GKLeaderboardMetadataView avatarContainer3](self, "avatarContainer3");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidden:", v13 < 3);

  -[GKLeaderboardMetadataView title](self, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v12);

  -[GKLeaderboardMetadataView configureFootnote:altFootnote:](self, "configureFootnote:altFootnote:", v11, v10);
  if (v13 >= 1)
  {
    -[GKLeaderboardMetadataView avatarContainer1](self, "avatarContainer1");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardMetadataView updateAvatarContainer:withPlayer:](self, "updateAvatarContainer:withPlayer:", v20, v21);

    if (v13 != 1)
    {
      -[GKLeaderboardMetadataView avatarContainer2](self, "avatarContainer2");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardMetadataView updateAvatarContainer:withPlayer:](self, "updateAvatarContainer:withPlayer:", v22, v23);

      if ((unint64_t)v13 >= 3)
      {
        -[GKLeaderboardMetadataView avatarContainer3](self, "avatarContainer3");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKLeaderboardMetadataView updateAvatarContainer:withPlayer:](self, "updateAvatarContainer:withPlayer:", v24, v25);

      }
    }
  }
  -[GKLeaderboardMetadataView configureVibrancy:](self, "configureVibrancy:", 0);

}

- (void)configureFootnote:(id)a3 altFootnote:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[GKLeaderboardMetadataView footnote](self, "footnote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v6);

  if (objc_msgSend(v7, "length"))
  {
    -[GKLeaderboardMetadataView footnote](self, "footnote");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

    -[GKLeaderboardMetadataView footnote](self, "footnote");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutIfNeeded");

    -[GKLeaderboardMetadataView footnote](self, "footnote");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v23 = *MEMORY[0x1E0DC1138];
    -[GKLeaderboardMetadataView footnote](self, "footnote");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v16, 0, v13, 1.79769313e308);
    v18 = v17;

    -[GKLeaderboardMetadataView footnote](self, "footnote");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v21 = v20;

    if (v18 > v21)
    {
      -[GKLeaderboardMetadataView footnote](self, "footnote");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setText:", v7);

    }
  }

}

- (void)updateAvatarContainer:(id)a3 withPlayer:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  GKDashboardPlayerPhotoView *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  id v17;

  v17 = a3;
  v5 = a4;
  objc_msgSend(v17, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    goto LABEL_6;
  objc_msgSend(v17, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (GKDashboardPlayerPhotoView *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v9 = objc_alloc_init(GKDashboardPlayerPhotoView);
    objc_msgSend(v17, "addSubview:", v9);
    -[GKDashboardPlayerPhotoView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB3718], "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v9, v17);
    -[GKDashboardPlayerPhotoView layer](v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowOffset:", 0.0, 0.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "CGColor");
    -[GKDashboardPlayerPhotoView layer](v9, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShadowColor:", v12);

    -[GKDashboardPlayerPhotoView layer](v9, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShadowRadius:", 2.0);

    -[GKDashboardPlayerPhotoView layer](v9, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = 1050253722;
    objc_msgSend(v15, "setShadowOpacity:", v16);

    goto LABEL_7;
  }
  if (!v9)
    goto LABEL_6;
LABEL_7:
  -[GKDashboardPlayerPhotoView setPlayer:](v9, "setPlayer:", v5);

}

- (UILabel)rank
{
  return self->_rank;
}

- (void)setRank:(id)a3
{
  objc_storeStrong((id *)&self->_rank, a3);
}

- (UILabel)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (UILabel)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_storeStrong((id *)&self->_footnote, a3);
}

- (UIStackView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (NSLayoutConstraint)containerRightMargin
{
  return self->_containerRightMargin;
}

- (void)setContainerRightMargin:(id)a3
{
  objc_storeStrong((id *)&self->_containerRightMargin, a3);
}

- (UIStackView)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (NSLayoutConstraint)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(id)a3
{
  objc_storeStrong((id *)&self->_headerHeight, a3);
}

- (UIView)avatarContainer1
{
  return self->_avatarContainer1;
}

- (void)setAvatarContainer1:(id)a3
{
  objc_storeStrong((id *)&self->_avatarContainer1, a3);
}

- (UIView)avatarContainer2
{
  return self->_avatarContainer2;
}

- (void)setAvatarContainer2:(id)a3
{
  objc_storeStrong((id *)&self->_avatarContainer2, a3);
}

- (UIView)avatarContainer3
{
  return self->_avatarContainer3;
}

- (void)setAvatarContainer3:(id)a3
{
  objc_storeStrong((id *)&self->_avatarContainer3, a3);
}

- (UIStackView)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_avatarContainer3, 0);
  objc_storeStrong((id *)&self->_avatarContainer2, 0);
  objc_storeStrong((id *)&self->_avatarContainer1, 0);
  objc_storeStrong((id *)&self->_headerHeight, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_containerRightMargin, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_rank, 0);
}

@end
