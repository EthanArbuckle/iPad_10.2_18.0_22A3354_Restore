@implementation PHLivePhotoExportSessionOptions

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_opt_new();
  v4[1] = -[PHLivePhotoExportSessionOptions format](self, "format");
  return v4;
}

- (int64_t)format
{
  return self->_format;
}

- (void)setFormat:(int64_t)a3
{
  self->_format = a3;
}

@end
