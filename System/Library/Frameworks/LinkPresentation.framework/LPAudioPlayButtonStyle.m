@implementation LPAudioPlayButtonStyle

- (LPAudioPlayButtonStyle)initWithPlatform:(int64_t)a3
{
  LPPointUnit *v3;
  LPAudioPlayButtonStyle *v5;
  LPSize *v6;
  uint64_t v7;
  LPSize *size;
  LPPointUnit *v9;
  LPPointUnit *glyphSize;
  void *v11;
  LPAudioPlayButtonTheme *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  LPAudioPlayButtonTheme *defaultTheme;
  LPAudioPlayButtonTheme *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  LPAudioPlayButtonTheme *appleMusicTheme;
  LPAudioPlayButtonTheme *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  LPAudioPlayButtonTheme *podcastsTheme;
  void *v27;
  LPAudioPlayButtonTheme *v28;
  void *v29;
  uint64_t v30;
  LPAudioPlayButtonTheme *audioBookTheme;
  LPAudioPlayButtonTheme *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  LPAudioPlayButtonTheme *lyricExcerptTheme;
  LPAudioPlayButtonStyle *v40;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)LPAudioPlayButtonStyle;
  v5 = -[LPAudioPlayButtonStyle init](&v42, sel_init);
  if (v5)
  {
    v6 = [LPSize alloc];
    if ((unint64_t)a3 <= 6)
      v3 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", dbl_1A0D65E88[a3]);
    v7 = -[LPSize initWithSquarePoints:](v6, "initWithSquarePoints:", v3);
    size = v5->_size;
    v5->_size = (LPSize *)v7;

    if ((unint64_t)a3 <= 6)
      v9 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", dbl_1A0D65EC0[a3]);
    glyphSize = v5->_glyphSize;
    v5->_glyphSize = v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.725490196, 0.725490196, 0.741176471, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [LPAudioPlayButtonTheme alloc];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[LPAudioPlayButtonTheme initWithKeyColor:secondaryColor:outerBorderColor:useInvertedInactiveState:](v12, "initWithKeyColor:secondaryColor:outerBorderColor:useInvertedInactiveState:", v13, v14, v11, 0);
    defaultTheme = v5->_defaultTheme;
    v5->_defaultTheme = (LPAudioPlayButtonTheme *)v15;

    v17 = [LPAudioPlayButtonTheme alloc];
    +[LPResources appleMusicKeyColor](LPResources, "appleMusicKeyColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[LPAudioPlayButtonTheme initWithKeyColor:secondaryColor:outerBorderColor:useInvertedInactiveState:](v17, "initWithKeyColor:secondaryColor:outerBorderColor:useInvertedInactiveState:", v18, v19, v11, 0);
    appleMusicTheme = v5->_appleMusicTheme;
    v5->_appleMusicTheme = (LPAudioPlayButtonTheme *)v20;

    v22 = [LPAudioPlayButtonTheme alloc];
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.447, 0.141, 0.847, 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[LPAudioPlayButtonTheme initWithKeyColor:secondaryColor:outerBorderColor:useInvertedInactiveState:](v22, "initWithKeyColor:secondaryColor:outerBorderColor:useInvertedInactiveState:", v23, v24, v11, 0);
    podcastsTheme = v5->_podcastsTheme;
    v5->_podcastsTheme = (LPAudioPlayButtonTheme *)v25;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = [LPAudioPlayButtonTheme alloc];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[LPAudioPlayButtonTheme initWithKeyColor:secondaryColor:outerBorderColor:useInvertedInactiveState:](v28, "initWithKeyColor:secondaryColor:outerBorderColor:useInvertedInactiveState:", v29, v27, v11, 0);
    audioBookTheme = v5->_audioBookTheme;
    v5->_audioBookTheme = (LPAudioPlayButtonTheme *)v30;

    v32 = [LPAudioPlayButtonTheme alloc];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "colorWithAlphaComponent:", 0.1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "colorWithAlphaComponent:", 0.1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[LPAudioPlayButtonTheme initWithKeyColor:secondaryColor:outerBorderColor:useInvertedInactiveState:](v32, "initWithKeyColor:secondaryColor:outerBorderColor:useInvertedInactiveState:", v33, v35, v37, 1);
    lyricExcerptTheme = v5->_lyricExcerptTheme;
    v5->_lyricExcerptTheme = (LPAudioPlayButtonTheme *)v38;

    v40 = v5;
  }

  return v5;
}

- (LPSize)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (LPPointUnit)glyphSize
{
  return self->_glyphSize;
}

- (void)setGlyphSize:(id)a3
{
  objc_storeStrong((id *)&self->_glyphSize, a3);
}

- (LPAudioPlayButtonTheme)defaultTheme
{
  return self->_defaultTheme;
}

- (LPAudioPlayButtonTheme)appleMusicTheme
{
  return self->_appleMusicTheme;
}

- (LPAudioPlayButtonTheme)podcastsTheme
{
  return self->_podcastsTheme;
}

- (LPAudioPlayButtonTheme)audioBookTheme
{
  return self->_audioBookTheme;
}

- (LPAudioPlayButtonTheme)lyricExcerptTheme
{
  return self->_lyricExcerptTheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricExcerptTheme, 0);
  objc_storeStrong((id *)&self->_audioBookTheme, 0);
  objc_storeStrong((id *)&self->_podcastsTheme, 0);
  objc_storeStrong((id *)&self->_appleMusicTheme, 0);
  objc_storeStrong((id *)&self->_defaultTheme, 0);
  objc_storeStrong((id *)&self->_glyphSize, 0);
  objc_storeStrong((id *)&self->_size, 0);
}

@end
