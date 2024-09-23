@implementation ICAbstractAttachmentViewController

- (BOOL)isInResponderChain
{
  return self->_isInResponderChain;
}

- (BOOL)forManualRendering
{
  return self->_forManualRendering;
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (void)setForegroundAlpha:(double)a3
{
  self->_foregroundAlpha = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end
