@implementation BETextDocumentRequest

- (id)_initWithUIKitDocumentRequest:(id)a3
{
  id v5;
  BETextDocumentRequest *v6;
  BETextDocumentRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BETextDocumentRequest;
  v6 = -[BETextDocumentRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backingDocumentRequest, a3);

  return v7;
}

- (id)_uikitDocumentRequest
{
  return self->_backingDocumentRequest;
}

- (CGRect)_documentRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIWKDocumentRequest documentRect](self->_backingDocumentRequest, "documentRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)set_documentRect:(CGRect)a3
{
  -[UIWKDocumentRequest setDocumentRect:](self->_backingDocumentRequest, "setDocumentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (int64_t)options
{
  void *v2;
  int64_t v3;

  -[BETextDocumentRequest backingDocumentRequest](self, "backingDocumentRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "flags");

  return v3;
}

- (void)setOptions:(int64_t)a3
{
  -[UIWKDocumentRequest setFlags:](self->_backingDocumentRequest, "setFlags:", a3);
}

- (int64_t)surroundingGranularity
{
  return -[UIWKDocumentRequest surroundingGranularity](self->_backingDocumentRequest, "surroundingGranularity");
}

- (void)setSurroundingGranularity:(int64_t)a3
{
  -[UIWKDocumentRequest setSurroundingGranularity:](self->_backingDocumentRequest, "setSurroundingGranularity:", a3);
}

- (int64_t)granularityCount
{
  return -[UIWKDocumentRequest granularityCount](self->_backingDocumentRequest, "granularityCount");
}

- (void)setGranularityCount:(int64_t)a3
{
  -[UIWKDocumentRequest setGranularityCount:](self->_backingDocumentRequest, "setGranularityCount:", a3);
}

- (NSCopying)inputElementIdentifier
{
  return (NSCopying *)-[UIWKDocumentRequest inputElementIdentifier](self->_backingDocumentRequest, "inputElementIdentifier");
}

- (void)setInputElementIdentifier:(id)a3
{
  -[UIWKDocumentRequest setInputElementIdentifier:](self->_backingDocumentRequest, "setInputElementIdentifier:", a3);
}

- (UIWKDocumentRequest)backingDocumentRequest
{
  return self->_backingDocumentRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingDocumentRequest, 0);
}

@end
