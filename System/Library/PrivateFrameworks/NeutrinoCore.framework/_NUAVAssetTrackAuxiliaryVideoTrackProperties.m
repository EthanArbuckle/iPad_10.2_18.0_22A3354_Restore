@implementation _NUAVAssetTrackAuxiliaryVideoTrackProperties

- (_NUAVAssetTrackAuxiliaryVideoTrackProperties)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NUAVAssetTrackAuxiliaryVideoTrackProperties;
  return -[_NUAVAssetTrackAuxiliaryVideoTrackProperties init](&v3, sel_init);
}

- (int)trackID
{
  return self->_trackID;
}

- (void)setTrackID:(int)a3
{
  self->_trackID = a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height;
  int64_t width;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  height = self->_size.height;
  width = self->_size.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (void)setSize:(id)a3
{
  self->_size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
}

@end
