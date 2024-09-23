@implementation AFUIAudioMessagePlayer

- (id)_audioURL
{
  void *v3;
  void *v4;
  void *v5;

  -[AFUIAudioPlayer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAudioPlayer playbackCommand](self, "playbackCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioPlayer:audioURLForCommand:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
