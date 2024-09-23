@implementation CAMPanoramaPreviewView

- (void)setImageQueue:(_CAImageQueue *)a3
{
  id v4;

  -[CAMPanoramaPreviewView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContents:", a3);

}

- (_CAImageQueue)imageQueue
{
  void *v2;
  _CAImageQueue *v3;

  -[CAMPanoramaPreviewView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (_CAImageQueue *)objc_msgSend(v2, "contents");

  return v3;
}

@end
