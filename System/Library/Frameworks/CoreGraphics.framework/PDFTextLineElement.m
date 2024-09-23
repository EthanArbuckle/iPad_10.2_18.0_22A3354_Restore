@implementation PDFTextLineElement

- (PDFTextLineElement)initWithTextLine:(TextLine *)a3 boundingBox:(id)a4
{
  PDFTextLineElement *result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PDFTextLineElement;
  result = -[PDFAtomicElement initWithType:boundingBox:layoutDirection:](&v9, sel_initWithType_boundingBox_layoutDirection_, 1, a4, 1);
  if (result)
  {
    result->_textLine.textRange = a3->textRange;
    v7 = *(_OWORD *)&a3->bbox.origin.y;
    v6 = *(_OWORD *)&a3->bbox.size.height;
    v8 = *(_OWORD *)&a3->uniCharStart;
    result->_textLine.identifier = a3->identifier;
    *(_OWORD *)&result->_textLine.bbox.origin.y = v7;
    *(_OWORD *)&result->_textLine.bbox.size.height = v6;
    *(_OWORD *)&result->_textLine.uniCharStart = v8;
  }
  return result;
}

- (TextLine)textLine
{
  TextLine *result;

  objc_copyStruct(retstr, &self->_textLine, 72, 1, 0);
  return result;
}

- (void)setTextLine:(TextLine *)a3
{
  objc_copyStruct(&self->_textLine, a3, 72, 1, 0);
}

- (id).cxx_construct
{
  *((CGRect *)self + 2) = CGRectNull;
  return self;
}

@end
