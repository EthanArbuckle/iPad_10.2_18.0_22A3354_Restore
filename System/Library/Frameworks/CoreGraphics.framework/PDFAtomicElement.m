@implementation PDFAtomicElement

- (PDFAtomicElement)initWithType:(unsigned int)a3 boundingBox:(id)a4 layoutDirection:(unint64_t)a5
{
  id v9;
  PDFAtomicElement *v10;
  PDFAtomicElement *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PDFAtomicElement;
  v10 = -[PDFAtomicElement init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_boundingQuad, a4);
    v11->_layoutDirection = a5;
    v11->_type = a3;
    objc_storeWeak((id *)&v11->_parent, 0);
  }

  return v11;
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (void)setBoundingQuad:(id)a3
{
  objc_storeStrong((id *)&self->_boundingQuad, a3);
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (PDFCRGroupRegion)parent
{
  return (PDFCRGroupRegion *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
}

@end
