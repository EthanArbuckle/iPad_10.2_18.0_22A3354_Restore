@implementation VCPSongDetector

- (VCPSongDetector)init
{
  char *v2;
  VCPSongDetector *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  char *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VCPSongDetector;
  v2 = -[VCPSongDetector init](&v9, sel_init);
  v3 = (VCPSongDetector *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 2) = 0;
    *((_DWORD *)v2 + 6) = 1182400512;
    v4 = MEMORY[0x1E0CA2E18];
    v5 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v2 + 40) = *MEMORY[0x1E0CA2E18];
    v6 = *(_QWORD *)(v4 + 16);
    *((_QWORD *)v2 + 7) = v6;
    *((_OWORD *)v2 + 4) = v5;
    *((_QWORD *)v2 + 10) = v6;
    v7 = v2;
  }

  return v3;
}

- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 andSampleBatchSize:(int)a4
{
  uint64_t v4;
  const opaqueCMFormatDescription *FormatDescription;
  const AudioStreamBasicDescription *StreamBasicDescription;
  float mSampleRate;
  void *v9;
  AVAudioPCMBuffer *v10;
  AVAudioPCMBuffer *pcmBuffer;
  AVAudioPCMBuffer *v12;
  void *v13;
  objc_class *v14;
  SHMutableSignature *v15;
  SHMutableSignature *signature;
  int v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
  if (!StreamBasicDescription)
    return -50;
  mSampleRate = StreamBasicDescription->mSampleRate;
  self->_sampleRate = mSampleRate;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithCommonFormat:sampleRate:channels:interleaved:", 1, 1, 1, self->_sampleRate);
  v10 = (AVAudioPCMBuffer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC0]), "initWithPCMFormat:frameCapacity:", v9, v4);
  pcmBuffer = self->_pcmBuffer;
  self->_pcmBuffer = v10;

  v12 = self->_pcmBuffer;
  if (v12)
  {
    -[AVAudioPCMBuffer setFrameLength:](v12, "setFrameLength:", v4);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v13 = (void *)getSHMutableSignatureClass(void)::softClass;
    v23 = getSHMutableSignatureClass(void)::softClass;
    if (!getSHMutableSignatureClass(void)::softClass)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = ___ZL26getSHMutableSignatureClassv_block_invoke;
      v19[3] = &unk_1E6B15540;
      v19[4] = &v20;
      ___ZL26getSHMutableSignatureClassv_block_invoke((uint64_t)v19);
      v13 = (void *)v21[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v20, 8);
    v15 = (SHMutableSignature *)objc_alloc_init(v14);
    signature = self->_signature;
    self->_signature = v15;

    if (self->_signature)
      v17 = 0;
    else
      v17 = -18;
  }
  else
  {
    v17 = -18;
  }

  return v17;
}

- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4
{
  float *p_sampleRate;
  int v7;
  void *mData;
  uint64_t mDataByteSize;
  SHMutableSignature *signature;
  AVAudioPCMBuffer *pcmBuffer;
  char v12;
  id v13;
  int64_t v14;
  void *v15;
  id v17;
  CMTime v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((self->_startTime.flags & 1) == 0)
  {
    p_sampleRate = &self->_sampleRate;
    CMTimeMake(&v18, 0, (int)self->_sampleRate);
    self->_startTime = ($95D729B680665BEAEFA1D6FCA8238556)v18;
    CMTimeMake(&v18, 0, (int)*p_sampleRate);
    self->_endTime = ($95D729B680665BEAEFA1D6FCA8238556)v18;
  }
  if ((float)(self->_sampleRate * 11.0) < (float)self->_framePosition)
    return 0;
  mData = a3->mBuffers[0].mData;
  mDataByteSize = (int)a3->mBuffers[0].mDataByteSize;
  if (mDataByteSize != 4 * -[AVAudioPCMBuffer frameLength](self->_pcmBuffer, "frameLength", a3, a4))
    return -50;
  memcpy(*(void **)(-[AVAudioPCMBuffer mutableAudioBufferList](self->_pcmBuffer, "mutableAudioBufferList") + 16), mData, 4 * -[AVAudioPCMBuffer frameLength](self->_pcmBuffer, "frameLength"));
  signature = self->_signature;
  pcmBuffer = self->_pcmBuffer;
  v17 = 0;
  v12 = -[SHMutableSignature appendBuffer:atTime:error:](signature, "appendBuffer:atTime:error:", pcmBuffer, 0, &v17);
  v13 = v17;
  if ((v12 & 1) != 0)
  {
    v14 = self->_framePosition + -[AVAudioPCMBuffer frameLength](self->_pcmBuffer, "frameLength");
    self->_framePosition = v14;
    CMTimeMake(&v18, v14, (int)self->_sampleRate);
    v7 = 0;
    self->_endTime = ($95D729B680665BEAEFA1D6FCA8238556)v18;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18.value) = 138412290;
      *(CMTimeValue *)((char *)&v18.value + 4) = (CMTimeValue)v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "song analysis failed %@", (uint8_t *)&v18, 0xCu);

    }
    v7 = -18;
  }

  return v7;
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  return 0;
}

- (id)results
{
  void *v3;
  void *v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  $95D729B680665BEAEFA1D6FCA8238556 startTime;
  const __CFString *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[3];
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (self->_signature)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v3, "encodeObject:forKey:", self->_signature, CFSTR("songSignature"));
    objc_msgSend(v3, "encodedData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v19 = CFSTR("SongResults");
      v16[0] = CFSTR("start");
      startTime = self->_startTime;
      v5 = CMTimeCopyAsDictionary((CMTime *)&startTime, 0);
      v17[0] = v5;
      v16[1] = CFSTR("duration");
      startTime = self->_endTime;
      v6 = CMTimeCopyAsDictionary((CMTime *)&startTime, 0);
      v17[1] = v6;
      v16[2] = CFSTR("attributes");
      v14 = CFSTR("songSignature");
      objc_msgSend(v3, "encodedData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      return v11;
    }

  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_pcmBuffer, 0);
}

@end
