@implementation APAudioFormatInitializeMagicCookieForCodec

uint64_t __APAudioFormatInitializeMagicCookieForCodec_block_invoke()
{
  uint64_t PropertyInfo;
  uint64_t Property;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  AudioConverterRef outAudioConverter[2];
  __int128 v16;
  int inPropertyData;
  AudioConverterRef inAudioConverter;
  AudioStreamBasicDescription inDestinationFormat;
  AudioStreamBasicDescription inSourceFormat;

  if (IsAppleTV())
    goto LABEL_5;
  if (APSIsAPMSpeaker_sCheckOnce != -1)
    dispatch_once(&APSIsAPMSpeaker_sCheckOnce, &__block_literal_global_9);
  if (APSIsAPMSpeaker_sIsAPMSpeaker)
  {
LABEL_5:
    outAudioConverter[0] = 0;
    inSourceFormat.mSampleRate = 48000.0;
    *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DAA00;
    *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DAA10;
    inDestinationFormat.mSampleRate = 48000.0;
    *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DA950;
    *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA860;
    PropertyInfo = AudioConverterNew(&inSourceFormat, &inDestinationFormat, outAudioConverter);
    if ((_DWORD)PropertyInfo
      || (PropertyInfo = AudioConverterGetPropertyInfo(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAAC_LCMagicSurroundSize51, 0), (_DWORD)PropertyInfo)|| (sAAC_LCMagicSurround51 = (uint64_t)malloc_type_malloc(sAAC_LCMagicSurroundSize51, 0x80E994E6uLL), PropertyInfo = AudioConverterGetProperty(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAAC_LCMagicSurroundSize51, (void *)sAAC_LCMagicSurround51), (_DWORD)PropertyInfo))
    {
      APSLogErrorAt(PropertyInfo);
    }
    AudioConverterDispose(outAudioConverter[0]);
    inAudioConverter = 0;
    inPropertyData = 699835888;
    *(_OWORD *)outAudioConverter = 0u;
    v16 = 0u;
    inSourceFormat.mSampleRate = 48000.0;
    *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DA9E0;
    *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DA9F0;
    inDestinationFormat.mSampleRate = 48000.0;
    *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DA950;
    *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA850;
    Property = AudioConverterNew(&inSourceFormat, &inDestinationFormat, &inAudioConverter);
    if ((_DWORD)Property)
      goto LABEL_68;
    *(_OWORD *)outAudioConverter = APAudioFormatIndexToAudioChannelLayout_gAPLayout_5_1_2;
    v16 = *(_OWORD *)algn_1C96DA35C;
    Property = AudioConverterSetProperty(inAudioConverter, 0x6869646Eu, 4u, &inPropertyData);
    if ((_DWORD)Property
      || (Property = AudioConverterSetProperty(inAudioConverter, 0x69636C20u, 0xCu, outAudioConverter), (_DWORD)Property)
      || (Property = AudioConverterSetProperty(inAudioConverter, 0x6F636C20u, 0xCu, outAudioConverter), (_DWORD)Property)
      || (Property = AudioConverterGetPropertyInfo(inAudioConverter, 0x636D6763u, (UInt32 *)&sAAC_LCMagicSurroundSize512, 0), (_DWORD)Property)|| (sAAC_LCMagicSurround512 = (uint64_t)malloc_type_malloc(sAAC_LCMagicSurroundSize512, 0xD9585E41uLL), Property = AudioConverterGetProperty(inAudioConverter, 0x636D6763u, (UInt32 *)&sAAC_LCMagicSurroundSize512, (void *)sAAC_LCMagicSurround512), (_DWORD)Property))
    {
LABEL_68:
      APSLogErrorAt(Property);
    }
    AudioConverterDispose(inAudioConverter);
    outAudioConverter[0] = 0;
    inSourceFormat.mSampleRate = 48000.0;
    *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DA9E0;
    *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DA9F0;
    inDestinationFormat.mSampleRate = 48000.0;
    *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA850;
    *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DAB40;
    v2 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, outAudioConverter);
    if ((_DWORD)v2
      || (v2 = AudioConverterGetPropertyInfo(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAAC_ELDMagicSurroundSize512, 0), (_DWORD)v2)|| (sAAC_ELDMagicSurround512 = (uint64_t)malloc_type_malloc(sAAC_ELDMagicSurroundSize512, 0x2CF065A2uLL), v2 = AudioConverterGetProperty(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAAC_ELDMagicSurroundSize512, (void *)sAAC_ELDMagicSurround512), (_DWORD)v2))
    {
      APSLogErrorAt(v2);
    }
    AudioConverterDispose(outAudioConverter[0]);
  }
  outAudioConverter[0] = 0;
  inSourceFormat.mSampleRate = 44100.0;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DAB00;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DAB10;
  inDestinationFormat.mSampleRate = 44100.0;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DA980;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA810;
  v3 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, outAudioConverter);
  if ((_DWORD)v3
    || (v3 = AudioConverterGetPropertyInfo(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAAC_ALAC44k16BitSizeStereo, 0), (_DWORD)v3)|| (v3 = (uint64_t)malloc_type_malloc(sAAC_ALAC44k16BitSizeStereo, 0xDDEA3BE3uLL), (sAAC_ALAC44k16BitStereo = v3) == 0)|| (v3 = AudioConverterGetProperty(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAAC_ALAC44k16BitSizeStereo, (void *)v3), (_DWORD)v3))
  {
    APSLogErrorAt(v3);
  }
  AudioConverterDispose(outAudioConverter[0]);
  outAudioConverter[0] = 0;
  inSourceFormat.mSampleRate = 44100.0;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DAAC0;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DAAD0;
  inDestinationFormat.mSampleRate = 44100.0;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DA960;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA810;
  v4 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, outAudioConverter);
  if ((_DWORD)v4
    || (v4 = AudioConverterGetPropertyInfo(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAAC_ALAC44k24BitSizeStereo, 0), (_DWORD)v4)|| (v4 = (uint64_t)malloc_type_malloc(sAAC_ALAC44k24BitSizeStereo, 0xE35383BAuLL), (sAAC_ALAC44k24BitStereo = v4) == 0)|| (v4 = AudioConverterGetProperty(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAAC_ALAC44k24BitSizeStereo, (void *)v4), (_DWORD)v4))
  {
    APSLogErrorAt(v4);
  }
  AudioConverterDispose(outAudioConverter[0]);
  outAudioConverter[0] = 0;
  inSourceFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DAB00;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DAB10;
  inDestinationFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DA980;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA810;
  v5 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, outAudioConverter);
  if ((_DWORD)v5
    || (v5 = AudioConverterGetPropertyInfo(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAAC_ALAC48k16BitSizeStereo, 0), (_DWORD)v5)|| (v5 = (uint64_t)malloc_type_malloc(sAAC_ALAC48k16BitSizeStereo, 0xF594688CuLL), (sAAC_ALAC48k16BitStereo = v5) == 0)|| (v5 = AudioConverterGetProperty(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAAC_ALAC48k16BitSizeStereo, (void *)v5), (_DWORD)v5))
  {
    APSLogErrorAt(v5);
  }
  AudioConverterDispose(outAudioConverter[0]);
  outAudioConverter[0] = 0;
  inSourceFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DAAC0;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DAAD0;
  inDestinationFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DA960;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA810;
  v6 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, outAudioConverter);
  if ((_DWORD)v6
    || (v6 = AudioConverterGetPropertyInfo(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAAC_ALAC48k24BitSizeStereo, 0), (_DWORD)v6)|| (v6 = (uint64_t)malloc_type_malloc(sAAC_ALAC48k24BitSizeStereo, 0xDBD5C349uLL), (sAAC_ALAC48k24BitStereo = v6) == 0)|| (v6 = AudioConverterGetProperty(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAAC_ALAC48k24BitSizeStereo, (void *)v6), (_DWORD)v6))
  {
    APSLogErrorAt(v6);
  }
  AudioConverterDispose(outAudioConverter[0]);
  outAudioConverter[0] = 0;
  LODWORD(inAudioConverter) = 0;
  inSourceFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DAA20;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DAA30;
  inDestinationFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DA820;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA810;
  v7 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, outAudioConverter);
  if ((_DWORD)v7
    || (AudioConverterSetProperty(outAudioConverter[0], 0x63647263u, 4u, &inAudioConverter),
        v7 = AudioConverterGetPropertyInfo(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicStereoSize, 0),
        (_DWORD)v7)
    || (sAPAC_MagicStereo = (uint64_t)malloc_type_malloc(sAPAC_MagicStereoSize, 0x5CB18AA0uLL),
        v7 = AudioConverterGetProperty(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicStereoSize, (void *)sAPAC_MagicStereo), (_DWORD)v7))
  {
    APSLogErrorAt(v7);
  }
  AudioConverterDispose(outAudioConverter[0]);
  outAudioConverter[0] = 0;
  LODWORD(inAudioConverter) = 0;
  inSourceFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DAA00;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DAA10;
  inDestinationFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DA820;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA860;
  v8 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, outAudioConverter);
  if ((_DWORD)v8
    || (AudioConverterSetProperty(outAudioConverter[0], 0x63647263u, 4u, &inAudioConverter),
        v8 = AudioConverterGetPropertyInfo(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicSurround51Size, 0),
        (_DWORD)v8)
    || (sAPAC_MagicSurround51 = (uint64_t)malloc_type_malloc(sAPAC_MagicSurround51Size, 0x7198A7B7uLL),
        v8 = AudioConverterGetProperty(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicSurround51Size, (void *)sAPAC_MagicSurround51), (_DWORD)v8))
  {
    APSLogErrorAt(v8);
  }
  AudioConverterDispose(outAudioConverter[0]);
  outAudioConverter[0] = 0;
  LODWORD(inAudioConverter) = 0;
  inSourceFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DA9E0;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DA9F0;
  inDestinationFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DA820;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA850;
  v9 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, outAudioConverter);
  if ((_DWORD)v9
    || (AudioConverterSetProperty(outAudioConverter[0], 0x63647263u, 4u, &inAudioConverter),
        v9 = AudioConverterGetPropertyInfo(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicSurround512Size, 0), (_DWORD)v9)|| (sAPAC_MagicSurround512 = (uint64_t)malloc_type_malloc(sAPAC_MagicSurround512Size, 0x1F820131uLL), v9 = AudioConverterGetProperty(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicSurround512Size, (void *)sAPAC_MagicSurround512), (_DWORD)v9))
  {
    APSLogErrorAt(v9);
  }
  AudioConverterDispose(outAudioConverter[0]);
  outAudioConverter[0] = 0;
  LODWORD(inAudioConverter) = 0;
  inSourceFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DA9E0;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DA9F0;
  inDestinationFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DA820;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA850;
  v10 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, outAudioConverter);
  if ((_DWORD)v10
    || (AudioConverterSetProperty(outAudioConverter[0], 0x63647263u, 4u, &inAudioConverter),
        v10 = AudioConverterGetPropertyInfo(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicSurround71Size, 0), (_DWORD)v10)|| (sAPAC_MagicSurround71 = (uint64_t)malloc_type_malloc(sAPAC_MagicSurround71Size, 0x812A3CFuLL), v10 = AudioConverterGetProperty(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicSurround71Size, (void *)sAPAC_MagicSurround71), (_DWORD)v10))
  {
    APSLogErrorAt(v10);
  }
  AudioConverterDispose(outAudioConverter[0]);
  outAudioConverter[0] = 0;
  LODWORD(inAudioConverter) = 0;
  inSourceFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DA9C0;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DA9D0;
  inDestinationFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DA820;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA840;
  v11 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, outAudioConverter);
  if ((_DWORD)v11
    || (AudioConverterSetProperty(outAudioConverter[0], 0x63647263u, 4u, &inAudioConverter),
        v11 = AudioConverterGetPropertyInfo(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicSurround514Size, 0), (_DWORD)v11)|| (sAPAC_MagicSurround514 = (uint64_t)malloc_type_malloc(sAPAC_MagicSurround514Size, 0xA912A423uLL), v11 = AudioConverterGetProperty(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicSurround514Size, (void *)sAPAC_MagicSurround514), (_DWORD)v11))
  {
    APSLogErrorAt(v11);
  }
  AudioConverterDispose(outAudioConverter[0]);
  outAudioConverter[0] = 0;
  LODWORD(inAudioConverter) = 0;
  inSourceFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DA9C0;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DA9D0;
  inDestinationFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DA820;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA840;
  v12 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, outAudioConverter);
  if ((_DWORD)v12
    || (AudioConverterSetProperty(outAudioConverter[0], 0x63647263u, 4u, &inAudioConverter),
        v12 = AudioConverterGetPropertyInfo(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicSurround712Size, 0), (_DWORD)v12)|| (sAPAC_MagicSurround712 = (uint64_t)malloc_type_malloc(sAPAC_MagicSurround71Size, 0xA854BA81uLL), v12 = AudioConverterGetProperty(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicSurround712Size, (void *)sAPAC_MagicSurround712), (_DWORD)v12))
  {
    APSLogErrorAt(v12);
  }
  AudioConverterDispose(outAudioConverter[0]);
  outAudioConverter[0] = 0;
  LODWORD(inAudioConverter) = 0;
  inSourceFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1C96DA9A0;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1C96DA9B0;
  inDestinationFormat.mSampleRate = 48000.0;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1C96DA820;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1C96DA830;
  v13 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, outAudioConverter);
  if ((_DWORD)v13
    || (AudioConverterSetProperty(outAudioConverter[0], 0x63647263u, 4u, &inAudioConverter),
        v13 = AudioConverterGetPropertyInfo(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicSurround714Size, 0), (_DWORD)v13)|| (sAPAC_MagicSurround714 = (uint64_t)malloc_type_malloc(sAPAC_MagicSurround714Size, 0x11F78588uLL), v13 = AudioConverterGetProperty(outAudioConverter[0], 0x636D6763u, (UInt32 *)&sAPAC_MagicSurround714Size, (void *)sAPAC_MagicSurround714), (_DWORD)v13))
  {
    APSLogErrorAt(v13);
  }
  return AudioConverterDispose(outAudioConverter[0]);
}

@end
