@implementation CPUITableCellConfiguration

+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 showExplicit:(BOOL)a6 accessory:(id)a7 showActivityIndicator:(BOOL)a8 showPlaybackProgress:(BOOL)a9 playbackProgress:(double)a10 playbackState:(int64_t)a11 playingIndicatorLeadingSide:(BOOL)a12 isEnabled:(BOOL)a13
{
  _BOOL8 v14;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _BOOL4 v24;

  v24 = a8;
  v14 = a6;
  v18 = a7;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setText:", v21);

  objc_msgSend(v22, "setDetailText:", v20);
  objc_msgSend(v22, "setImage:", v19);

  objc_msgSend(v22, "setShowExplicit:", v14);
  objc_msgSend(v22, "setAccessory:", v18);

  objc_msgSend(v22, "setShouldShowPlaybackProgress:", a9);
  objc_msgSend(v22, "setPlaybackProgress:", a10);
  objc_msgSend(v22, "setPlaybackState:", a11);
  objc_msgSend(v22, "setShowActivityIndicator:", v24);
  objc_msgSend(v22, "setPlayingIndicatorLeadingSide:", a12);
  objc_msgSend(v22, "setEnabled:", a13);
  return v22;
}

+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 showExplicit:(BOOL)a6 accessory:(id)a7 showActivityIndicator:(BOOL)a8 showPlaybackProgress:(BOOL)a9 playbackProgress:(double)a10 currentlyPlaying:(BOOL)a11 playingIndicatorLeadingSide:(BOOL)a12 isEnabled:(BOOL)a13
{
  uint64_t v14;
  uint64_t v15;

  LOWORD(v15) = __PAIR16__(a13, a12);
  LOBYTE(v14) = a9;
  return (id)objc_msgSend(a1, "configurationWithText:detailText:image:showExplicit:accessory:showActivityIndicator:showPlaybackProgress:playbackProgress:playbackState:playingIndicatorLeadingSide:isEnabled:", a3, a4, a5, a6, a7, a8, a10, v14, a11, v15);
}

+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 showExplicit:(BOOL)a6 accessory:(id)a7 showActivityIndicator:(BOOL)a8 showPlaybackProgress:(BOOL)a9 playbackProgress:(double)a10 currentlyPlaying:(BOOL)a11 playingIndicatorLeadingSide:(BOOL)a12
{
  uint64_t v13;

  BYTE3(v13) = 1;
  *(_WORD *)((char *)&v13 + 1) = __PAIR16__(a12, a11);
  LOBYTE(v13) = a9;
  return (id)objc_msgSend(a1, "configurationWithText:detailText:image:showExplicit:accessory:showActivityIndicator:showPlaybackProgress:playbackProgress:currentlyPlaying:playingIndicatorLeadingSide:isEnabled:", a3, a4, a5, a6, a7, a8, a10, v13);
}

+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 showExplicit:(BOOL)a6 accessory:(id)a7 showActivityIndicator:(BOOL)a8 showPlaybackProgress:(BOOL)a9 playbackProgress:(double)a10 currentlyPlaying:(BOOL)a11
{
  uint64_t v12;

  BYTE2(v12) = 1;
  LOWORD(v12) = __PAIR16__(a11, a9);
  return (id)objc_msgSend(a1, "configurationWithText:detailText:image:showExplicit:accessory:showActivityIndicator:showPlaybackProgress:playbackProgress:currentlyPlaying:playingIndicatorLeadingSide:", a3, a4, a5, a6, a7, a8, a10, v12);
}

- (BOOL)currentlyPlaying
{
  return (unint64_t)(-[CPUITableCellConfiguration playbackState](self, "playbackState") - 1) < 2;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CPUITableCellAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)showExplicit
{
  return self->_showExplicit;
}

- (void)setShowExplicit:(BOOL)a3
{
  self->_showExplicit = a3;
}

- (double)playbackProgress
{
  return self->_playbackProgress;
}

- (void)setPlaybackProgress:(double)a3
{
  self->_playbackProgress = a3;
}

- (BOOL)shouldShowPlaybackProgress
{
  return self->_shouldShowPlaybackProgress;
}

- (void)setShouldShowPlaybackProgress:(BOOL)a3
{
  self->_shouldShowPlaybackProgress = a3;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(int64_t)a3
{
  self->_playbackState = a3;
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  self->_showActivityIndicator = a3;
}

- (BOOL)playingIndicatorLeadingSide
{
  return self->_playingIndicatorLeadingSide;
}

- (void)setPlayingIndicatorLeadingSide:(BOOL)a3
{
  self->_playingIndicatorLeadingSide = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
