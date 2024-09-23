@implementation MKAudioDecoder

- (MKAudioDecoder)init
{
  MKAudioDecoder *v2;
  MKAudioDecoder *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKAudioDecoder;
  v2 = -[MKVideoDecoder init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MKVideoDecoder setMediaType:](v2, "setMediaType:", *MEMORY[0x24BDB1CF0]);
  return v3;
}

@end
