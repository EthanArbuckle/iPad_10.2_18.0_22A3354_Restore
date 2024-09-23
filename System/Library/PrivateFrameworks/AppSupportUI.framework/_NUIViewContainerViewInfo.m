@implementation _NUIViewContainerViewInfo

- (double)resetCaches
{
  char v1;
  double result;

  if (a1)
  {
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a1 + 8);
    v1 = *(_BYTE *)(a1 + 144);
    *(_BYTE *)(a1 + 144) = v1 & 0xF7;
    if ((v1 & 0x10) == 0)
    {
      result = 1.79769313e308;
      *(_QWORD *)(a1 + 128) = 0x7FEFFFFFFFFFFFFFLL;
    }
    if ((v1 & 0x20) == 0)
    {
      result = 1.79769313e308;
      *(_QWORD *)(a1 + 136) = 0x7FEFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (_NUIViewContainerViewInfo)init
{
  _NUIViewContainerViewInfo *result;
  char flags;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NUIViewContainerViewInfo;
  result = -[_NUIViewContainerViewInfo init](&v4, sel_init);
  if (result)
  {
    result->_minSize = (CGSize)*MEMORY[0x1E0C9D820];
    result->_maxSize = (CGSize)vdupq_n_s64(0x40C3880000000000uLL);
    *(_OWORD *)&result->_alignmentInsets.top = NUIContainerViewInsetsUseDefault;
    *(_OWORD *)&result->_alignmentInsets.bottom = unk_1AA8377D0;
    result->_sizeCache.__end_ = result->_sizeCache.__begin_;
    flags = (char)result->_flags;
    *(_BYTE *)&result->_flags = flags & 0xF7;
    if ((flags & 0x10) == 0)
      result->_baselines.baseLineFromTop = 1.79769313e308;
    if ((flags & 0x20) == 0)
      result->_baselines.baseLineFromBottom = 1.79769313e308;
  }
  return result;
}

- (void).cxx_destruct
{
  void *begin;

  begin = self->_sizeCache.__begin_;
  if (begin)
  {
    self->_sizeCache.__end_ = begin;
    operator delete(begin);
  }
}

@end
