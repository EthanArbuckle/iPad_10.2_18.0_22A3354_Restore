@implementation PDFListItemElement

- (PDFListItemElement)initWithTextLines:(const void *)a3 boundingBox:(id)a4
{
  id v6;
  PDFListItemElement *v7;
  PDFListItemElement *v8;
  char *p_textLines;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PDFListItemElement;
  v7 = -[PDFAtomicElement initWithType:boundingBox:layoutDirection:](&v11, sel_initWithType_boundingBox_layoutDirection_, 4, v6, 1);
  v8 = v7;
  if (v7)
  {
    p_textLines = (char *)&v7->_textLines;
    if (&v8->_textLines != a3)
      std::vector<PageLayout::TextLine>::__assign_with_size[abi:se180100]<PageLayout::TextLine*,PageLayout::TextLine*>(p_textLines, *(char **)a3, *((_QWORD *)a3 + 1), 0x8E38E38E38E38E39 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3));
  }

  return v8;
}

- (vector<PageLayout::TextLine,)textLines
{
  vector<PageLayout::TextLine, std::allocator<PageLayout::TextLine>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_textLines, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (void)setTextLines:()vector<PageLayout:(std::allocator<PageLayout::TextLine>> *)a3 :TextLine
{
  objc_copyCppObjectAtomic(&self->_textLines, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
}

- (void).cxx_destruct
{
  vector<PageLayout::TextLine, std::allocator<PageLayout::TextLine>> *p_textLines;
  TextLine *begin;

  p_textLines = &self->_textLines;
  begin = self->_textLines.__begin_;
  if (begin)
  {
    p_textLines->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
