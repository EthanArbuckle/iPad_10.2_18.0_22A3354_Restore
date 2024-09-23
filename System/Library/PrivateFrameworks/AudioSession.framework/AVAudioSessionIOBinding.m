@implementation AVAudioSessionIOBinding

- (AVAudioSessionIOBinding)initWithSession:(id)a3
{
  id v5;
  AVAudioSessionIOBinding *v6;
  AVAudioSessionIOBinding *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVAudioSessionIOBinding;
  v6 = -[AVAudioSessionIOBinding init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_session, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AVAudioSessionIOBinding session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioSessionIOBinding streams](self, "streams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<AVAudioSessionIOBinding@%p: session %@, streams %@>"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AVAudioSessionIOBinding)initWithSession:(id)a3 streams:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (a5)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D50];
      v14[0] = CFSTR("Bad parameter");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("AVAudioSession Error"), -50, v11);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
    }
  }
  else
  {
    a5 = -[AVAudioSessionIOBinding initWithSession:]([AVAudioSessionIOBinding alloc], "initWithSession:", v8);
  }

  return (AVAudioSessionIOBinding *)a5;
}

- (AVAudioSession)session
{
  return self->_session;
}

- (NSArray)streams
{
  return self->_streams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streams, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
