@implementation ICTK2TextContainer

- (BOOL)isSimpleRectangularTextContainer
{
  void *v3;
  _BOOL4 v4;

  -[ICTK2TextContainer exclusionPaths](self, "exclusionPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") || -[ICTK2TextContainer maximumNumberOfLines](self, "maximumNumberOfLines"))
    LOBYTE(v4) = 0;
  else
    v4 = !-[ICTK2TextContainer inPreviewMode](self, "inPreviewMode");

  return v4;
}

- (BOOL)inPreviewMode
{
  return self->_inPreviewMode;
}

- (ICTK2TextView)tk2TextView
{
  return (ICTK2TextView *)objc_loadWeakRetained((id *)&self->_tk2TextView);
}

- (void)setTk2TextView:(id)a3
{
  objc_storeWeak((id *)&self->_tk2TextView, a3);
}

- (void)setLinkDelegate:(id)a3
{
  self->_linkDelegate = (ICLinkMenuDelegate *)a3;
}

- (void)setInsideSystemPaper:(BOOL)a3
{
  self->_insideSystemPaper = a3;
}

- (id)layoutManager
{
  return 0;
}

- (void)setInPreviewMode:(BOOL)a3
{
  self->_inPreviewMode = a3;
}

- (BOOL)insideSystemPaper
{
  return self->_insideSystemPaper;
}

- (BOOL)insideSiriSnippet
{
  return self->_insideSiriSnippet;
}

- (void)setInsideSiriSnippet:(BOOL)a3
{
  self->_insideSiriSnippet = a3;
}

- (ICLinkMenuDelegate)linkDelegate
{
  return self->_linkDelegate;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tk2TextView);
}

@end
