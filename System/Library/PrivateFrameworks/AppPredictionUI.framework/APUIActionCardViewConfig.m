@implementation APUIActionCardViewConfig

- (APUIActionCardViewConfig)init
{
  APUIActionCardViewConfig *v2;
  APUIActionCardViewConfig *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APUIActionCardViewConfig;
  v2 = -[APUIActionCardViewConfig init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[APUIActionCardViewConfig setMaxLinesForTitle:](v2, "setMaxLinesForTitle:", 2);
    -[APUIActionCardViewConfig setMaxLinesForSubtitle:](v3, "setMaxLinesForSubtitle:", 2);
    -[APUIActionCardViewConfig setMaxLinesForFootnote:](v3, "setMaxLinesForFootnote:", 1);
  }
  return v3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)showThumbnailImage
{
  return self->_showThumbnailImage;
}

- (void)setShowThumbnailImage:(BOOL)a3
{
  self->_showThumbnailImage = a3;
}

- (BOOL)useAppIconAsThumbnail
{
  return self->_useAppIconAsThumbnail;
}

- (void)setUseAppIconAsThumbnail:(BOOL)a3
{
  self->_useAppIconAsThumbnail = a3;
}

- (BOOL)showActionButton
{
  return self->_showActionButton;
}

- (void)setShowActionButton:(BOOL)a3
{
  self->_showActionButton = a3;
}

- (BOOL)showAppFootnote
{
  return self->_showAppFootnote;
}

- (void)setShowAppFootnote:(BOOL)a3
{
  self->_showAppFootnote = a3;
}

- (BOOL)showAppFootnoteIcon
{
  return self->_showAppFootnoteIcon;
}

- (void)setShowAppFootnoteIcon:(BOOL)a3
{
  self->_showAppFootnoteIcon = a3;
}

- (BOOL)useTinyIconVariant
{
  return self->_useTinyIconVariant;
}

- (void)setUseTinyIconVariant:(BOOL)a3
{
  self->_useTinyIconVariant = a3;
}

- (int64_t)maxLinesForTitle
{
  return self->_maxLinesForTitle;
}

- (void)setMaxLinesForTitle:(int64_t)a3
{
  self->_maxLinesForTitle = a3;
}

- (int64_t)maxLinesForSubtitle
{
  return self->_maxLinesForSubtitle;
}

- (void)setMaxLinesForSubtitle:(int64_t)a3
{
  self->_maxLinesForSubtitle = a3;
}

- (int64_t)maxLinesForFootnote
{
  return self->_maxLinesForFootnote;
}

- (void)setMaxLinesForFootnote:(int64_t)a3
{
  self->_maxLinesForFootnote = a3;
}

- (BOOL)fallbackToCustomResponseString
{
  return self->_fallbackToCustomResponseString;
}

- (void)setFallbackToCustomResponseString:(BOOL)a3
{
  self->_fallbackToCustomResponseString = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
