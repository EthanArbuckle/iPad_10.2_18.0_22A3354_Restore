@implementation AVAudioUnitSplitter

- (AVAudioUnitSplitter)init
{
  __int128 v3;
  int v4;

  v3 = xmmword_19B85A250;
  v4 = 0;
  return -[AVAudioUnitSplitter initWithAudioComponentDescription:](self, "initWithAudioComponentDescription:", &v3);
}

- (AVAudioUnitSplitter)initWithAudioComponentDescription:(AudioComponentDescription *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)operator new();
  AVAudioNodeImpl::AVAudioNodeImpl((uint64_t)v5, 0, a3, 1);
  *v5 = &off_1E3BE6C98;
  return -[AVAudioNode initWithImpl:](self, "initWithImpl:", v5);
}

@end
