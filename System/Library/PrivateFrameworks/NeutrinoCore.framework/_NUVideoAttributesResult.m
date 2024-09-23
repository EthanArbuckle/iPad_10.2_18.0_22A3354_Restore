@implementation _NUVideoAttributesResult

- (NUVideoAttributes)videoAttributes
{
  return self->_videoAttributes;
}

- (void)setVideoAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_videoAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAttributes, 0);
}

@end
