@implementation ICFallbackPDFAttachmentView

- (id)pdfURL
{
  void *v2;
  void *v3;

  -[ICFallbackPDFAttachmentView attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fallbackPDFURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)needToStartRender
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[ICFallbackPDFAttachmentView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICFallbackPDFAttachmentView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && !-[ICPDFAttachmentView isRendering](self, "isRendering"))
      v5 = !-[ICPDFAttachmentView availableImageIsAcceptable](self, "availableImageIsAcceptable");
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

@end
