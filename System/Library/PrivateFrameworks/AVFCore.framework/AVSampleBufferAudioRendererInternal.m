@implementation AVSampleBufferAudioRendererInternal

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->weakContentKeySession);
}

@end
