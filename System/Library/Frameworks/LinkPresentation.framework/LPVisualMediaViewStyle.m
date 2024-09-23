@implementation LPVisualMediaViewStyle

- (LPVisualMediaViewStyle)initWithPlatform:(int64_t)a3
{
  char *v4;
  LPVideoPlayButtonStyle *v5;
  void *v6;
  LPImageViewStyle *v7;
  void *v8;
  LPSize *v9;
  LPPadding *v10;
  void *v11;
  LPPointUnit *v12;
  void *v13;
  LPPointUnit *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  char *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)LPVisualMediaViewStyle;
  v4 = -[LPVisualMediaViewStyle init](&v25, sel_init);
  if (v4)
  {
    v5 = -[LPVideoPlayButtonStyle initWithPlatform:]([LPVideoPlayButtonStyle alloc], "initWithPlatform:", a3);
    v6 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = v5;

    v7 = objc_alloc_init(LPImageViewStyle);
    v8 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v7;

    v9 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 30.0);
    objc_msgSend(*((id *)v4 + 2), "setFixedSize:", v9);

    v10 = objc_alloc_init(LPPadding);
    v11 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = v10;

    v12 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 12.0);
    objc_msgSend(*((id *)v4 + 3), "setTrailing:", v12);

    objc_msgSend(*((id *)v4 + 3), "trailing");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v4 + 3), "setLeading:", v13);

    v14 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 11.0);
    objc_msgSend(*((id *)v4 + 3), "setTop:", v14);

    objc_msgSend(*((id *)v4 + 3), "top");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v4 + 3), "setBottom:", v15);

    *((_OWORD *)v4 + 2) = xmmword_1A0D66100;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v4 + 6);
    *((_QWORD *)v4 + 6) = v16;

    *(_OWORD *)(v4 + 56) = xmmword_1A0D66100;
    LODWORD(v18) = 1058306785;
    LODWORD(v19) = 0;
    LODWORD(v20) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", 0.500000117, v19, v18, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v4 + 9);
    *((_QWORD *)v4 + 9) = v21;

    v23 = v4;
  }

  return (LPVisualMediaViewStyle *)v4;
}

- (LPVideoPlayButtonStyle)playButton
{
  return self->_playButton;
}

- (LPImageViewStyle)muteButton
{
  return self->_muteButton;
}

- (LPPadding)muteButtonPadding
{
  return self->_muteButtonPadding;
}

- (double)muteButtonOpacity
{
  return self->_muteButtonOpacity;
}

- (void)setMuteButtonOpacity:(double)a3
{
  self->_muteButtonOpacity = a3;
}

- (double)muteButtonHighlightedOpacity
{
  return self->_muteButtonHighlightedOpacity;
}

- (void)setMuteButtonHighlightedOpacity:(double)a3
{
  self->_muteButtonHighlightedOpacity = a3;
}

- (UIColor)pulsingLoadIndicatorColor
{
  return self->_pulsingLoadIndicatorColor;
}

- (void)setPulsingLoadIndicatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_pulsingLoadIndicatorColor, a3);
}

- (double)pulsingLoadIndicatorMaximumOpacity
{
  return self->_pulsingLoadIndicatorMaximumOpacity;
}

- (void)setPulsingLoadIndicatorMaximumOpacity:(double)a3
{
  self->_pulsingLoadIndicatorMaximumOpacity = a3;
}

- (double)pulsingLoadIndicatorDuration
{
  return self->_pulsingLoadIndicatorDuration;
}

- (void)setPulsingLoadIndicatorDuration:(double)a3
{
  self->_pulsingLoadIndicatorDuration = a3;
}

- (CAMediaTimingFunction)pulsingLoadIndicatorTimingFunction
{
  return self->_pulsingLoadIndicatorTimingFunction;
}

- (void)setPulsingLoadIndicatorTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_pulsingLoadIndicatorTimingFunction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pulsingLoadIndicatorTimingFunction, 0);
  objc_storeStrong((id *)&self->_pulsingLoadIndicatorColor, 0);
  objc_storeStrong((id *)&self->_muteButtonPadding, 0);
  objc_storeStrong((id *)&self->_muteButton, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
}

@end
