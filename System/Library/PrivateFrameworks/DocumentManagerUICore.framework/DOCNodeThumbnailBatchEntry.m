@implementation DOCNodeThumbnailBatchEntry

- (DOCNodeThumbnail)thumbnail
{
  return self->_thumbnail;
}

- (unint64_t)fetchOptions
{
  return self->_fetchOptions;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (void)setFetchOptions:(unint64_t)a3
{
  self->_fetchOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
}

@end
