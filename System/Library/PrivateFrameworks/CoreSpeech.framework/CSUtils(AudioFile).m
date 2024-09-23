@implementation CSUtils(AudioFile)

+ (BOOL)readAudioChunksFrom:()AudioFile block:
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  id v7;
  OSStatus v8;
  _BOOL8 v9;
  OSStatus v10;
  NSObject *v11;
  UInt32 ioNumberFrames;
  AudioBufferList ioData;
  UInt32 ioPropertyDataSize;
  _OWORD outPropertyData[2];
  uint64_t v17;
  ExtAudioFileRef outExtAudioFile;
  AudioFileID outAudioFile;
  _OWORD inPropertyData[2];
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  OSStatus v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  inPropertyData[0] = xmmword_1C276CC58;
  inPropertyData[1] = unk_1C276CC68;
  v21 = 16;
  outExtAudioFile = 0;
  outAudioFile = 0;
  if (!AudioFileOpenURL((CFURLRef)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5), kAudioFileReadPermission, 0, &outAudioFile))
  {
    if (!ExtAudioFileWrapAudioFileID(outAudioFile, 0, &outExtAudioFile))
      goto LABEL_5;
    AudioFileClose(outAudioFile);
  }
  outAudioFile = 0;
LABEL_5:
  if (outExtAudioFile)
  {
    v17 = 0;
    memset(outPropertyData, 0, sizeof(outPropertyData));
    ioPropertyDataSize = 40;
    ExtAudioFileGetProperty(outExtAudioFile, 0x66666D74u, &ioPropertyDataSize, outPropertyData);
    ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, inPropertyData);
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 2048);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_QWORD *)&ioData.mNumberBuffers = 1;
    *(_QWORD *)&ioData.mBuffers[0].mNumberChannels = 0x80000000001;
    ioData.mBuffers[0].mData = (void *)objc_msgSend(v7, "mutableBytes");
    while (1)
    {
      ioNumberFrames = 1024;
      v8 = ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &ioData);
      v9 = v8 == 0;
      if (v8)
        break;
      if (!ioNumberFrames)
        goto LABEL_14;
      if (v6)
        v6[2](v6, ioData.mBuffers[0].mData, ioData.mBuffers[0].mDataByteSize >> 1);
    }
    v10 = v8;
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[CSUtils(AudioFile) readAudioChunksFrom:block:]";
      v24 = 1026;
      v25 = v10;
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Error reading audio file: %{public}d, skipping...", buf, 0x12u);
    }
LABEL_14:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
