@implementation FIUIPushyLabelCharacter

- (NSAttributedString)sourceText
{
  return (NSAttributedString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSourceText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (UIView)renderedView
{
  return (UIView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRenderedView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedView, 0);
  objc_storeStrong((id *)&self->_sourceText, 0);
}

@end
