@implementation _SSSCropInfoContainer

- (SSSCropInfo)cropInfo
{
  CGPoint v3;

  v3 = *(CGPoint *)&self->currentRect.origin.y;
  retstr->totalSize = *(CGSize *)&self->totalSize.height;
  retstr->currentRect.origin = v3;
  retstr->currentRect.size = *(CGSize *)&self->currentRect.size.height;
  return self;
}

- (void)setCropInfo:(SSSCropInfo *)a3
{
  CGSize totalSize;
  CGPoint origin;

  totalSize = a3->totalSize;
  origin = a3->currentRect.origin;
  self->_cropInfo.currentRect.size = a3->currentRect.size;
  self->_cropInfo.currentRect.origin = origin;
  self->_cropInfo.totalSize = totalSize;
}

@end
