@implementation PHASEPushStreamNodeDefinition

- (PHASEPushStreamNodeDefinition)init
{
  -[PHASEPushStreamNodeDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEPushStreamNodeDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEPushStreamNodeDefinition)initWithMixerDefinition:(PHASEMixerDefinition *)mixerDefinition format:(AVAudioFormat *)format identifier:(NSString *)identifier
{
  PHASEMixerDefinition *v8;
  AVAudioFormat *v9;
  NSString *v10;
  PHASEPushStreamNodeDefinition *v11;
  PHASEPushStreamNodeDefinition *v12;

  v8 = mixerDefinition;
  v9 = format;
  v10 = identifier;
  v11 = -[PHASEPushStreamNodeDefinition initWithMixerDefinition:format:](self, "initWithMixerDefinition:format:", v8, v9);
  v12 = v11;
  if (v11)
    -[PHASEDefinition setIdentifier:](v11, "setIdentifier:", v10);

  return v12;
}

- (PHASEPushStreamNodeDefinition)initWithMixerDefinition:(PHASEMixerDefinition *)mixerDefinition format:(AVAudioFormat *)format
{
  PHASEMixerDefinition *v6;
  AVAudioFormat *v7;
  _QWORD *v8;
  Phase::Logger *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  PHASEPushStreamNodeDefinition *v14;
  void *v15;
  _BOOL4 v16;
  AVAudioFormat *v17;
  void *v18;
  Phase::Logger *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v30;
  AVAudioChannelCount v31;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  AVAudioChannelCount v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = mixerDefinition;
  v7 = format;
  v32.receiver = self;
  v32.super_class = (Class)PHASEPushStreamNodeDefinition;
  v8 = -[PHASEGeneratorNodeDefinition initInternal:](&v32, sel_initInternal_, v6);
  if (!v8)
    goto LABEL_23;
  v9 = -[AVAudioFormat commonFormat](v7, "commonFormat");
  if (v9 == (Phase::Logger *)1)
  {
    if (-[AVAudioFormat channelCount](v7, "channelCount") < 2
      || (v9 = (Phase::Logger *)-[AVAudioFormat isInterleaved](v7, "isInterleaved"), !(_DWORD)v9))
    {
      -[AVAudioFormat channelLayout](v7, "channelLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 == 0;

      if (!v16)
      {
        v17 = v7;
        v18 = (void *)v8[11];
        v8[11] = v17;
LABEL_22:

        *((_BYTE *)v8 + 80) = 0;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -12.0);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v8[13];
        v8[13] = v27;

LABEL_23:
        v14 = v8;
        goto LABEL_24;
      }
      v19 = (Phase::Logger *)-[AVAudioFormat channelCount](v7, "channelCount");
      switch((_DWORD)v19)
      {
        case 0:
          v23 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v19) + 432));
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            goto LABEL_8;
          *(_DWORD *)buf = 136315394;
          v34 = "PHASESoundEventNodes.mm";
          v35 = 1024;
          v36 = 769;
          v11 = "%25s:%-5d Failed to initialize new instance of PHASEPushStreamNodeDefinition. An AVAudioFormat object wi"
                "th a nil channelLayout and channelCount of 0 was provided which is invalid.";
          v12 = v23;
          v13 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_7;
        case 1:
          v20 = 6553601;
          v21 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v19) + 432));
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
LABEL_21:
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB17E8]), "initWithLayoutTag:", v20);
            v24 = objc_alloc(MEMORY[0x24BDB1818]);
            -[AVAudioFormat sampleRate](v7, "sampleRate");
            v25 = objc_msgSend(v24, "initStandardFormatWithSampleRate:channelLayout:", v18);
            v26 = (void *)v8[11];
            v8[11] = v25;

            goto LABEL_22;
          }
          *(_DWORD *)buf = 136315394;
          v34 = "PHASESoundEventNodes.mm";
          v35 = 1024;
          v36 = 776;
          v22 = "%25s:%-5d An AVAudioFormat object with a nil channelLayout and channelCount of 1 was provided to PHASEPu"
                "shStreamNodeDefinition.initWithMixerDefinition. Note that a mono channelLayout will be automatically ass"
                "igned to the audio format property.";
          break;
        case 2:
          v20 = 6619138;
          v21 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v19) + 432));
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          *(_DWORD *)buf = 136315394;
          v34 = "PHASESoundEventNodes.mm";
          v35 = 1024;
          v36 = 785;
          v22 = "%25s:%-5d An AVAudioFormat object with a nil channelLayout and channelCount of 2 was provided to PHASEPu"
                "shStreamNodeDefinition.initWithMixerDefinition. Note that a stereo channelLayout will be automatically a"
                "ssigned to the audio format property";
          break;
        default:
          v30 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v19)
                                                                                              + 432)));
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = -[AVAudioFormat channelCount](v7, "channelCount");
            *(_DWORD *)buf = 136315650;
            v34 = "PHASESoundEventNodes.mm";
            v35 = 1024;
            v36 = 796;
            v37 = 1024;
            v38 = v31;
            _os_log_impl(&dword_2164CC000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d It's unexpected to have an AVAudioFormat object with a nil channelLayout for a channel count of %d. Please verify the AVAudioFormat API has not changed for channelCounts > 2.", buf, 0x18u);
          }

          goto LABEL_8;
      }
      _os_log_impl(&dword_2164CC000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0x12u);
      goto LABEL_21;
    }
  }
  v10 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v9) + 432));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "PHASESoundEventNodes.mm";
    v35 = 1024;
    v36 = 753;
    v11 = "%25s:%-5d Audio Format must be deinterleaved 32-bit floating-point PCM.";
    v12 = v10;
    v13 = OS_LOG_TYPE_ERROR;
LABEL_7:
    _os_log_impl(&dword_2164CC000, v12, v13, v11, buf, 0x12u);
  }
LABEL_8:
  v14 = 0;
LABEL_24:

  return v14;
}

- (void)setTargetLKFS:(id)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSNumber *v10;
  NSNumber *targetLKFS;
  id v12;

  v12 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v9 = PHASEGetPropertyBounded<double>(v6, v7, v8, -100.0, 0.0);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  targetLKFS = self->_targetLKFS;
  self->_targetLKFS = v10;

}

- (AVAudioFormat)format
{
  return self->_format;
}

- (BOOL)normalize
{
  return self->_normalize;
}

- (void)setNormalize:(BOOL)normalize
{
  self->_normalize = normalize;
}

- (double)referenceGainDbSpl
{
  return self->_referenceGainDbSpl;
}

- (void)setReferenceGainDbSpl:(double)a3
{
  self->_referenceGainDbSpl = a3;
}

- (NSNumber)targetLKFS
{
  return self->_targetLKFS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLKFS, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

@end
