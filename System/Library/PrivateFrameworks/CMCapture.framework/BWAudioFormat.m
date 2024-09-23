@implementation BWAudioFormat

- (void)dealloc
{
  opaqueCMFormatDescription *audioFormatDescription;
  objc_super v4;

  audioFormatDescription = self->_audioFormatDescription;
  if (audioFormatDescription)
    CFRelease(audioFormatDescription);

  v4.receiver = self;
  v4.super_class = (Class)BWAudioFormat;
  -[BWAudioFormat dealloc](&v4, sel_dealloc);
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_audioFormatDescription;
}

+ (id)formatWithAudioFormatDescription:(opaqueCMFormatDescription *)a3
{
  return -[BWAudioFormat _initWithAudioFormatDescription:]([BWAudioFormat alloc], a3);
}

- (_QWORD)_initWithAudioFormatDescription:(void *)a1
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  if (!a2)
  {

    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)BWAudioFormat;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
    v3[1] = CFRetain(a2);
  return v3;
}

+ (void)initialize
{
  objc_opt_class();
  objc_opt_class();
}

+ (BOOL)compressionOptionTrimSampleBufferDurationsIsRequiredForAudioSettings:(id)a3
{
  uint64_t v4;

  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVEncoderBitRateKey"))
    || (v4 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVEncoderBitRatePerChannelKey"))) != 0)
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

+ (id)formatForAVAudioSettings:(id)a3 inputFormat:(id)a4
{
  return -[BWAudioFormat _initForAVAudioSettings:inputFormat:]([BWAudioFormat alloc], (unint64_t)a3, (unint64_t)a4);
}

- (_QWORD)_initForAVAudioSettings:(unint64_t)a3 inputFormat:
{
  uint64_t v3;
  _QWORD *v4;
  const opaqueCMFormatDescription *v6;
  const opaqueCMFormatDescription *v7;
  AudioFormatID mFormatID;
  Float64 v9;
  double v10;
  UInt32 mChannelsPerFrame;
  UInt32 mBitsPerChannel;
  AudioFormatFlags v13;
  const opaqueCMFormatDescription *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  const AudioChannelLayout *v19;
  const AudioStreamBasicDescription *StreamBasicDescription;
  UInt32 v21;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  UInt32 ioPropertyDataSize;
  AudioStreamBasicDescription outPropertyData;
  CMAudioFormatDescriptionRef formatDescriptionOut;

  v4 = a1;
  if (!a1)
    return v4;
  if (!(a2 | a3))
  {
    fig_log_get_emitter();
    v27 = v3;
    LODWORD(v26) = 0;
    FigDebugAssert3();
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    v25 = CFSTR("Can't make a BWAudioFormat when audioSettings and inputFormat are both nil");
    goto LABEL_49;
  }
  formatDescriptionOut = 0;
  v6 = (const opaqueCMFormatDescription *)objc_msgSend((id)a3, "formatDescription");
  v7 = v6;
  if (a2)
  {
    memset(&outPropertyData.mFormatID, 0, 32);
    mFormatID = objc_msgSend((id)objc_msgSend((id)a2, "objectForKeyedSubscript:", CFSTR("AVFormatIDKey")), "intValue");
    outPropertyData.mFormatID = mFormatID;
    objc_msgSend((id)objc_msgSend((id)a2, "objectForKeyedSubscript:", CFSTR("AVSampleRateKey")), "doubleValue");
    v10 = v9;
    outPropertyData.mSampleRate = v9;
    mChannelsPerFrame = objc_msgSend((id)objc_msgSend((id)a2, "objectForKeyedSubscript:", CFSTR("AVNumberOfChannelsKey")), "intValue");
    outPropertyData.mChannelsPerFrame = mChannelsPerFrame;
    if (mFormatID == 1819304813)
    {
      mBitsPerChannel = objc_msgSend((id)objc_msgSend((id)a2, "objectForKeyedSubscript:", CFSTR("AVLinearPCMBitDepthKey")), "intValue");
      outPropertyData.mBitsPerChannel = mBitsPerChannel;
      if (objc_msgSend((id)objc_msgSend((id)a2, "objectForKeyedSubscript:", CFSTR("AVLinearPCMIsBigEndianKey")), "BOOLValue"))
      {
        v13 = 2;
        outPropertyData.mFormatFlags = 2;
      }
      else
      {
        v13 = 0;
      }
      v15 = (void *)objc_msgSend((id)a2, "objectForKeyedSubscript:", CFSTR("AVLinearPCMIsFloatKey"));
      if (v15)
      {
        if (objc_msgSend(v15, "BOOLValue"))
          v16 = 1;
        else
          v16 = 4;
        v13 |= v16 | 8;
        outPropertyData.mFormatFlags = v13;
      }
      if (objc_msgSend((id)objc_msgSend((id)a2, "objectForKeyedSubscript:", CFSTR("AVLinearPCMIsNonInterleaved")), "BOOLValue"))
      {
        v13 |= 0x20u;
        outPropertyData.mFormatFlags = v13;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
      mBitsPerChannel = 0;
    }
    v17 = (void *)objc_msgSend((id)a2, "objectForKeyedSubscript:", CFSTR("AVChannelLayoutKey"));
    v18 = v17;
    if (v17)
    {
      v19 = (const AudioChannelLayout *)objc_msgSend(v17, "bytes");
      v18 = (void *)objc_msgSend(v18, "length");
      if (!v7)
        goto LABEL_28;
    }
    else
    {
      v19 = 0;
      if (!v7)
        goto LABEL_28;
    }
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v7);
    if (!mFormatID)
    {
      mFormatID = StreamBasicDescription->mFormatID;
      outPropertyData.mFormatID = mFormatID;
    }
    if (v10 == 0.0)
      outPropertyData.mSampleRate = StreamBasicDescription->mSampleRate;
    if (!mChannelsPerFrame)
    {
      mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
      outPropertyData.mChannelsPerFrame = mChannelsPerFrame;
    }
LABEL_28:
    if (mFormatID != 1819304813)
      goto LABEL_38;
    if (v7 && !mBitsPerChannel)
    {
      mBitsPerChannel = CMAudioFormatDescriptionGetStreamBasicDescription(v7)->mBitsPerChannel;
      outPropertyData.mBitsPerChannel = mBitsPerChannel;
    }
    outPropertyData.mFramesPerPacket = 1;
    if (!mBitsPerChannel)
      goto LABEL_38;
    if ((v13 & 0x20) != 0)
    {
      v21 = mBitsPerChannel >> 3;
    }
    else
    {
      if (!mChannelsPerFrame)
        goto LABEL_38;
      v21 = mChannelsPerFrame * (mBitsPerChannel >> 3);
    }
    outPropertyData.mBytesPerPacket = v21;
    outPropertyData.mBytesPerFrame = v21;
LABEL_38:
    ioPropertyDataSize = 40;
    if (AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &outPropertyData)
      || CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &outPropertyData, (size_t)v18, v19, 0, 0, 0, &formatDescriptionOut))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
    v14 = formatDescriptionOut;
    goto LABEL_41;
  }
  if (!v6)
  {
    fig_log_get_emitter();
    v27 = v3;
    LODWORD(v26) = 0;
    FigDebugAssert3();
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    v25 = CFSTR("Can't make a BWAudioFormat because the provided input format produced a NULL CMFormatDescription");
LABEL_49:
    objc_exception_throw((id)objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, v25, 0, v26, v27));
  }
  v14 = (const opaqueCMFormatDescription *)CFRetain(v6);
  formatDescriptionOut = v14;
LABEL_41:
  v4 = -[BWAudioFormat _initWithAudioFormatDescription:](v4, v14);
  if (v4)
    v4[2] = objc_msgSend((id)a2, "copy");
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  return v4;
}

- (opaqueCMFormatDescription)audioFormatDescription
{
  return self->_audioFormatDescription;
}

- (NSDictionary)audioCompressionSBPOptions
{
  NSDictionary *v3;
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;
  const AudioStreamBasicDescription *StreamBasicDescription;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  void *v17;
  void *v18;
  char v20;
  id v21;

  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = -[NSDictionary objectForKeyedSubscript:](self->_avAudioSettings, "objectForKeyedSubscript:", CFSTR("AVEncoderBitRateKey"));
  v5 = (_QWORD *)MEMORY[0x1E0CC3D98];
  if (v4)
    -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CC3D98]);
  v6 = -[NSDictionary objectForKeyedSubscript:](self->_avAudioSettings, "objectForKeyedSubscript:", CFSTR("AVEncoderBitRatePerChannelKey"));
  if (v6)
  {
    v7 = v6;
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(self->_audioFormatDescription);
    if (StreamBasicDescription)
      -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", StreamBasicDescription->mChannelsPerFrame * objc_msgSend(v7, "intValue")), *v5);
  }
  if (+[BWAudioFormat compressionOptionTrimSampleBufferDurationsIsRequiredForAudioSettings:](BWAudioFormat, "compressionOptionTrimSampleBufferDurationsIsRequiredForAudioSettings:", self->_avAudioSettings))
  {
    -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC3DD8]);
  }
  v9 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_avAudioSettings, "objectForKeyedSubscript:", CFSTR("AVAudioEncoderSpecificationKey")), "objectForKeyedSubscript:", CFSTR("AVAudioEncoderSpecificationUseHardwareEncoderIfAvailableKey"));
  if (v9)
    v10 = objc_msgSend(v9, "BOOLValue");
  else
    v10 = 1;
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CC3DE0]);
  v12 = -[NSDictionary objectForKeyedSubscript:](self->_avAudioSettings, "objectForKeyedSubscript:", CFSTR("AVEncoderBitRateStrategyKey"));
  if (v12)
  {
    v13 = v12;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("AVAudioBitRateStrategy_Constant")) & 1) != 0)
    {
      v14 = &unk_1E49F8988;
LABEL_16:
      v15 = (_QWORD *)MEMORY[0x1E0CC3DB0];
LABEL_17:
      -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, *v15);
      goto LABEL_18;
    }
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AVAudioBitRateStrategy_LongTermAverage")) & 1) != 0)
    {
      v14 = &unk_1E49F89A0;
      goto LABEL_16;
    }
    v20 = objc_msgSend(v13, "isEqualToString:", CFSTR("AVAudioBitRateStrategy_VariableConstrained"));
    v15 = (_QWORD *)MEMORY[0x1E0CC3DB0];
    if ((v20 & 1) != 0)
    {
      v14 = &unk_1E49F89B8;
      goto LABEL_17;
    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("AVAudioBitRateStrategy_Variable")))
    {
      -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &unk_1E49F89D0, *v15);
      v21 = -[NSDictionary objectForKeyedSubscript:](self->_avAudioSettings, "objectForKeyedSubscript:", CFSTR("AVEncoderQualityForVBRKey"));
      if (v21)
      {
        v14 = v21;
        v15 = (_QWORD *)MEMORY[0x1E0CC3DD0];
        goto LABEL_17;
      }
    }
  }
LABEL_18:
  v16 = -[NSDictionary objectForKeyedSubscript:](self->_avAudioSettings, "objectForKeyedSubscript:", CFSTR("AVSampleRateConverterAlgorithmKey"));
  if (v16)
  {
    v17 = v16;
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AVSampleRateConverterAlgorithm_Normal")) & 1) != 0)
    {
      v18 = &unk_1E49F89E8;
LABEL_23:
      -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CC3DA0]);
      goto LABEL_24;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("AVSampleRateConverterAlgorithm_Normal")))
    {
      v18 = &unk_1E49F8A00;
      goto LABEL_23;
    }
  }
LABEL_24:
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kFigAudioCompressionOption_UseAudioConverterForMixing"));
  return v3;
}

- (id)description
{
  void *v3;
  const AudioStreamBasicDescription *StreamBasicDescription;
  const AudioStreamBasicDescription *v5;
  const char *v6;
  uint64_t mFormatFlags;
  const char *v8;
  const char *v9;
  NSDictionary *avAudioSettings;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  const __CFString *v16;
  id v17;
  void *v18;
  const __CFString *v19;
  id v21;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(self->_audioFormatDescription);
  if (!StreamBasicDescription)
    return v3;
  v5 = StreamBasicDescription;
  objc_msgSend(v3, "appendFormat:", CFSTR("'%@'@%.0fHz, %d Chn"), BWStringForOSType(StreamBasicDescription->mFormatID), *(_QWORD *)&v5->mSampleRate, v5->mChannelsPerFrame);
  if (v5->mFormatID == 1819304813)
  {
    v6 = "BE";
    mFormatFlags = v5->mFormatFlags;
    if ((mFormatFlags & 2) == 0)
      v6 = "LE";
    v8 = "Int";
    if ((mFormatFlags & 1) != 0)
      v8 = "Float";
    objc_msgSend(v3, "appendFormat:", CFSTR(", %d-bit %s %s (mFormatFlags: 0x%0x)"), v5->mBitsPerChannel, v6, v8, mFormatFlags);
    v9 = "Non-interleaved";
    if ((mFormatFlags & 0x20) == 0)
      v9 = "Interleaved";
    objc_msgSend(v3, "appendFormat:", CFSTR(", %s"), v9);
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(", %d FPP"), v5->mFramesPerPacket);
  }
  avAudioSettings = self->_avAudioSettings;
  if (!avAudioSettings)
    return v3;
  v11 = -[NSDictionary objectForKeyedSubscript:](avAudioSettings, "objectForKeyedSubscript:", CFSTR("AVEncoderBitRateKey"));
  if (v11)
    objc_msgSend(v3, "appendFormat:", CFSTR(", %d bps"), objc_msgSend(v11, "intValue"));
  v12 = -[NSDictionary objectForKeyedSubscript:](self->_avAudioSettings, "objectForKeyedSubscript:", CFSTR("AVEncoderBitRatePerChannelKey"));
  if (v12)
    objc_msgSend(v3, "appendFormat:", CFSTR(", %d bps"), v5->mChannelsPerFrame * objc_msgSend(v12, "intValue"));
  v13 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_avAudioSettings, "objectForKeyedSubscript:", CFSTR("AVAudioEncoderSpecificationKey")), "objectForKeyedSubscript:", CFSTR("AVAudioEncoderSpecificationUseHardwareEncoderIfAvailableKey"));
  if (v13 && (objc_msgSend(v13, "BOOLValue") & 1) == 0)
    objc_msgSend(v3, "appendString:", CFSTR(", SOFTWARE"));
  v14 = -[NSDictionary objectForKeyedSubscript:](self->_avAudioSettings, "objectForKeyedSubscript:", CFSTR("AVEncoderBitRateStrategyKey"));
  if (v14)
  {
    v15 = v14;
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("AVAudioBitRateStrategy_Constant")))
    {
      v16 = CFSTR(", Constant BRCM");
LABEL_26:
      objc_msgSend(v3, "appendString:", v16);
      goto LABEL_27;
    }
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("AVAudioBitRateStrategy_LongTermAverage")))
    {
      v16 = CFSTR(", LongTermAvg BRCM");
      goto LABEL_26;
    }
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("AVAudioBitRateStrategy_VariableConstrained")))
    {
      v16 = CFSTR(", VariableConstrained BRCM");
      goto LABEL_26;
    }
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("AVAudioBitRateStrategy_Variable")))
    {
      objc_msgSend(v3, "appendString:", CFSTR(", Variable BRCM"));
      v21 = -[NSDictionary objectForKeyedSubscript:](self->_avAudioSettings, "objectForKeyedSubscript:", CFSTR("AVEncoderQualityForVBRKey"));
      if (v21)
        objc_msgSend(v3, "appendFormat:", CFSTR(", Quality %d"), objc_msgSend(v21, "intValue"));
    }
  }
LABEL_27:
  v17 = -[NSDictionary objectForKeyedSubscript:](self->_avAudioSettings, "objectForKeyedSubscript:", CFSTR("AVSampleRateConverterAlgorithmKey"));
  if (v17)
  {
    v18 = v17;
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("AVSampleRateConverterAlgorithm_Normal")) & 1) != 0)
    {
      v19 = CFSTR(", Mastering SRC");
LABEL_32:
      objc_msgSend(v3, "appendString:", v19);
      return v3;
    }
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("AVSampleRateConverterAlgorithm_Normal")))
    {
      v19 = CFSTR(", Normal SRC");
      goto LABEL_32;
    }
  }
  return v3;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), NSStringFromClass(v4), self, -[BWAudioFormat description](self, "description"));
}

- (unsigned)mediaType
{
  return 1936684398;
}

@end
