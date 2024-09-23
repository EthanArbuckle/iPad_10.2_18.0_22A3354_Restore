@implementation AVAssetWriterInternal

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->finishWritingDelegate);
}

@end
