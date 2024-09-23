@implementation SKSoundBuffer

- (SKSoundBuffer)init
{
  SKSoundBuffer *v2;
  SKSoundBuffer *v3;
  NSString *path;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKSoundBuffer;
  v2 = -[SKSoundBuffer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_bufferId = 0;
    path = v2->_path;
    v2->_path = 0;

    v3->_duration = 0.0;
  }
  return v3;
}

+ (id)bufferWithFileNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  SKSoundBuffer *v11;
  SKSoundBuffer *v12;
  const __CFURL *v13;
  const __CFURL *v14;
  ALsizei v15;
  BOOL v16;
  int v17;
  int v18;
  ALenum v19;
  void *v20;
  void *v21;
  void *v22;
  UInt32 v24;
  void *v25;
  void *v26;
  void *v27;
  ALuint buffers;
  AudioBufferList ioData;
  UInt32 ioNumberFrames;
  double v31;
  uint64_t v32;
  double inPropertyData;
  __int128 v34;
  __int128 v35;
  ExtAudioFileRef outExtAudioFile;
  UInt32 ioDataSize;
  double outPropertyData;
  int v39;
  int v40;
  int v41;
  UInt32 ioNumBytes;
  AudioFileID outAudioFile;

  v3 = a3;
  +[SKSoundContext currentContext](SKSoundContext, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_44;
  if (+[SKSoundBuffer bufferWithFileNamed:]::onceToken == -1)
  {
    if (!v3)
      goto LABEL_44;
  }
  else
  {
    dispatch_once(&+[SKSoundBuffer bufferWithFileNamed:]::onceToken, &__block_literal_global_9);
    if (!v3)
      goto LABEL_44;
  }
  if (objc_msgSend(v3, "isAbsolutePath"))
  {
    v3 = v3;
    v5 = v3;
    goto LABEL_9;
  }
  objc_msgSend(v3, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("caf"));
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v7;
  }
  SKGetResourceBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathForResource:ofType:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_44:
    v12 = 0;
    goto LABEL_45;
  }
LABEL_9:
  objc_msgSend((id)_buffers, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "nonretainedObjectValue");
    v11 = (SKSoundBuffer *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_11;
  }
  v11 = objc_alloc_init(SKSoundBuffer);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v13 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_20;
  }
  outAudioFile = 0;
  if (AudioFileOpenURL(v13, kAudioFileReadPermission, 0, &outAudioFile))
  {
LABEL_14:

    goto LABEL_15;
  }
  ioNumBytes = 0;
  ioDataSize = 40;
  if (AudioFileGetProperty(outAudioFile, 0x64666D74u, &ioDataSize, &outPropertyData))
  {
    AudioFileClose(outAudioFile);
    goto LABEL_18;
  }
  v15 = (int)outPropertyData;
  if (v39 != 1819304813)
    goto LABEL_25;
  if (v41 != 16)
  {
    if (v41 == 8)
    {
      v16 = v40 == 1;
      v17 = 4354;
      v18 = 4352;
      goto LABEL_30;
    }
LABEL_25:
    outExtAudioFile = 0;
    if (ExtAudioFileWrapAudioFileID(outAudioFile, 0, &outExtAudioFile))
    {
      AudioFileClose(outAudioFile);
    }
    else
    {
      inPropertyData = (double)v15;
      v34 = xmmword_1DC922D40;
      v35 = xmmword_1DC922D50;
      ioDataSize = 40;
      if (ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, &inPropertyData))
      {
        ExtAudioFileDispose(outExtAudioFile);
      }
      else
      {
        v32 = 0;
        ioDataSize = 8;
        if (ExtAudioFileGetProperty(outExtAudioFile, 0x2366726Du, &ioDataSize, &v32))
        {
          ExtAudioFileDispose(outExtAudioFile);
        }
        else
        {
          v31 = 0.0;
          ioDataSize = 8;
          if (AudioFileGetProperty(outAudioFile, 0x65647572u, &ioDataSize, &v31))
          {
            ExtAudioFileDispose(outExtAudioFile);
          }
          else
          {
            v24 = v35 * v32;
            ioNumberFrames = v32;
            v25 = malloc_type_malloc((int)v35 * (int)v32, 0xFF3DE448uLL);
            ioData.mNumberBuffers = 1;
            ioData.mBuffers[0].mNumberChannels = 2;
            ioData.mBuffers[0].mDataByteSize = v24;
            ioData.mBuffers[0].mData = v25;
            if (!ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &ioData))
            {
              ExtAudioFileDispose(outExtAudioFile);
              buffers = 0;
              alGenBuffers(1, &buffers);
              alBufferData(buffers, 4355, v25, v24, v15);
              free(v25);
              objc_storeStrong((id *)&v11->_path, v5);
              v11->_bufferId = buffers;
              v11->_duration = v31;
              v26 = (void *)_buffers;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v11);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKey:", v27, v11->_path);

              v12 = v11;
              goto LABEL_19;
            }
            ExtAudioFileDispose(outExtAudioFile);
            if (v25)
              free(v25);
          }
        }
      }
    }
LABEL_18:
    v12 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v16 = v40 == 1;
  v17 = 4355;
  v18 = 4353;
LABEL_30:
  if (v16)
    v19 = v18;
  else
    v19 = v17;
  inPropertyData = 0.0;
  ioDataSize = 8;
  AudioFileGetProperty(outAudioFile, 0x65647572u, &ioDataSize, &inPropertyData);
  *(_QWORD *)&ioData.mNumberBuffers = 0;
  ioDataSize = 8;
  if (AudioFileGetProperty(outAudioFile, 0x62636E74u, &ioDataSize, &ioData))
  {
    AudioFileClose(outAudioFile);
    goto LABEL_14;
  }
  ioNumBytes = ioData.mNumberBuffers;
  v20 = malloc_type_malloc(ioData.mNumberBuffers, 0x738D52CCuLL);
  if (AudioFileReadBytes(outAudioFile, 0, 0, &ioNumBytes, v20))
  {
    AudioFileClose(outAudioFile);
    if (v20)
      free(v20);
    goto LABEL_14;
  }
  AudioFileClose(outAudioFile);
  LODWORD(outExtAudioFile) = 0;
  alGenBuffers(1, (ALuint *)&outExtAudioFile);
  alBufferData((ALuint)outExtAudioFile, v19, v20, ioNumBytes, v15);
  free(v20);
  objc_storeStrong((id *)&v11->_path, v5);
  v11->_bufferId = outExtAudioFile;
  v11->_duration = inPropertyData;
  v21 = (void *)_buffers;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v22, v11->_path);

LABEL_11:
  v11 = v11;
  v12 = v11;
LABEL_20:

LABEL_45:
  return v12;
}

void __37__SKSoundBuffer_bufferWithFileNamed___block_invoke()
{
  SKThreadSafeMapTable *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SKThreadSafeMapTable alloc];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SKThreadSafeMapTable initWithNSMapTable:](v0, "initWithNSMapTable:");
  v2 = (void *)_buffers;
  _buffers = v1;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSString lastPathComponent](self->_path, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("file:'%@' duration:%.2f bufferId:%d"), v4, *(_QWORD *)&self->_duration, self->_bufferId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)bufferId
{
  return self->_bufferId;
}

- (double)duration
{
  return self->_duration;
}

- (void)dealloc
{
  unsigned int *p_bufferId;
  objc_super v4;

  p_bufferId = &self->_bufferId;
  if (self->_bufferId)
  {
    objc_msgSend((id)_buffers, "removeObjectForKey:", self->_path);
    alDeleteBuffers(1, p_bufferId);
    *p_bufferId = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKSoundBuffer;
  -[SKSoundBuffer dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
