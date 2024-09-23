@implementation NSObject(MusicKit_SoftLinking_MPNowPlayingInfoAudioFormat)

- (id)_musicKit_self_nowPlayingInfoAudioFormat
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPNowPlayingInfoAudioFormatClass_softClass;
  v9 = getMPNowPlayingInfoAudioFormatClass_softClass;
  if (!getMPNowPlayingInfoAudioFormatClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPNowPlayingInfoAudioFormatClass_block_invoke;
    v5[3] = &unk_24CD1CC68;
    v5[4] = &v6;
    __getMPNowPlayingInfoAudioFormatClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a1;
  else
    return 0;
}

- (unint64_t)musicKit_nowPlayingInfoAudioFormat_badging
{
  void *v1;
  unint64_t v2;

  objc_msgSend(a1, "_musicKit_self_nowPlayingInfoAudioFormat");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "badging");

  if (v2 < 6)
    return v2 + 1;
  else
    return 0;
}

@end
