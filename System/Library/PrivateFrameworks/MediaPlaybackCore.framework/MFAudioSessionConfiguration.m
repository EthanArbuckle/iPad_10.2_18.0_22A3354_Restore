@implementation MFAudioSessionConfiguration

- (void).cxx_destruct
{

}

- (MFAudioSessionConfiguration)initWithCategory:(id)a3 routeSharingPolicy:(unint64_t)a4 options:(unint64_t)a5
{
  return (MFAudioSessionConfiguration *)AudioSessionConfiguration.init(category:routeSharingPolicy:options:)((uint64_t)a3, a4, a5);
}

- (MFAudioSessionConfiguration)init
{
  AudioSessionConfiguration.init()();
}

@end
