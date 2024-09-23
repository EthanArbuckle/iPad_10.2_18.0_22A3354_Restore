@implementation NUBufferImageAccumulationNode

- (id)_newImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NUImageAccumulationNode layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageAccumulationNode pixelFormat](self, "pixelFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageAccumulationNode colorSpace](self, "colorSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUImageFactory bufferImageWithLayout:format:colorSpace:](NUImageFactory, "bufferImageWithLayout:format:colorSpace:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
