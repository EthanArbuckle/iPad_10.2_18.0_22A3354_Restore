@implementation AVAudioSecureSession

- (AVAudioSecureSession)initWithIsolatedAudioUseCaseID:(unsigned int)a3
{
  uint64_t v3;
  AVAudioSecureSession *v4;
  AVAudioSession *v5;
  AVAudioSession *innerSession;
  AVAudioSession *v7;
  AVAudioSecureSession *v8;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)AVAudioSecureSession;
  v4 = -[AVAudioSecureSession init](&v10, sel_init);
  if (v4)
  {
    v5 = -[AVAudioSession initWithIsolatedAudioUseCaseID:]([AVAudioSession alloc], "initWithIsolatedAudioUseCaseID:", v3);
    innerSession = v4->_innerSession;
    v4->_innerSession = v5;

    v7 = v4->_innerSession;
    if (!v7)
    {
      v8 = 0;
      goto LABEL_6;
    }
    -[AVAudioSession registerPublishingSessionNotifications:](v7, "registerPublishingSessionNotifications:", v4);
  }
  v8 = v4;
LABEL_6:

  return v8;
}

- (NSArray)availableCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AVAudioSessionCategoryRecord");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)setCategory:(id)a3 error:(id *)a4
{
  return -[AVAudioSession setCategory:error:](self->_innerSession, "setCategory:error:", a3, a4);
}

- (BOOL)setCategory:(id)a3 mode:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  BOOL v12;

  v10 = a3;
  v11 = a4;
  if (a5)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
      v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = -[AVAudioSession setCategory:mode:options:error:](self->_innerSession, "setCategory:mode:options:error:", v10, v11, -1, a6);
  }

  return v12;
}

- (NSString)category
{
  return -[AVAudioSession category](self->_innerSession, "category");
}

- (NSArray)availableModes
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AVAudioSessionModeDefault");
  v3[1] = CFSTR("AVAudioSessionModeSpeechRecognition");
  v3[2] = CFSTR("AVAudioSessionModeVoiceChat");
  v3[3] = CFSTR("AVAudioSessionModeVideoChat");
  v3[4] = CFSTR("AVAudioSessionModeGameChat");
  v3[5] = CFSTR("AVAudioSessionModeSoundRecognition");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)mode
{
  return -[AVAudioSession mode](self->_innerSession, "mode");
}

- (BOOL)setActive:(BOOL)a3 error:(id *)a4
{
  return -[AVAudioSession setActive:error:](self->_innerSession, "setActive:error:", a3, a4);
}

- (double)inputSampleRate
{
  double result;

  -[AVAudioSession inputSampleRate](self->_innerSession, "inputSampleRate");
  return result;
}

- (double)IOBufferDuration
{
  double result;

  -[AVAudioSession IOBufferDuration](self->_innerSession, "IOBufferDuration");
  return result;
}

- (double)inputLatency
{
  double result;

  -[AVAudioSession inputLatency](self->_innerSession, "inputLatency");
  return result;
}

- (unint64_t)IOBufferFrameSize
{
  return -[AVAudioSession IOBufferFrameSize](self->_innerSession, "IOBufferFrameSize");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerSession, 0);
}

@end
