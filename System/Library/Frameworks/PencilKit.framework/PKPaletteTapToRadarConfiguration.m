@implementation PKPaletteTapToRadarConfiguration

- (BOOL)hasContent
{
  void *v2;
  char v3;

  -[PKPaletteTapToRadarConfiguration debugSharpenerLog](self, "debugSharpenerLog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasContent");

  return v3;
}

- (PKTextInputDebugSharpenerLog)debugSharpenerLog
{
  return self->_debugSharpenerLog;
}

- (void)setDebugSharpenerLog:(id)a3
{
  objc_storeStrong((id *)&self->_debugSharpenerLog, a3);
}

- (UIViewController)presentationViewController
{
  return self->_presentationViewController;
}

- (void)setPresentationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentationViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationViewController, 0);
  objc_storeStrong((id *)&self->_debugSharpenerLog, 0);
}

@end
