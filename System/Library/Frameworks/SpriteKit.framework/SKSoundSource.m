@implementation SKSoundSource

- (SKSoundSource)init
{
  SKSoundSource *v2;
  SKSoundSource *v3;
  uint64_t v4;
  NSMutableArray *buffers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKSoundSource;
  v2 = -[SKSoundSource init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_sourceId = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    buffers = v3->_buffers;
    v3->_buffers = (NSMutableArray *)v4;

  }
  return v3;
}

+ (id)source
{
  SKSoundSource *v2;
  ALuint sources;

  v2 = objc_alloc_init(SKSoundSource);
  sources = 0;
  alGenSources(1, &sources);
  v2->_sourceId = sources;
  return v2;
}

+ (SKSoundSource)sourceWithBuffer:(id)a3
{
  id v3;
  void *v4;

  if (a3)
  {
    v3 = a3;
    +[SKSoundSource source](SKSoundSource, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queueBuffer:", v3);

  }
  else
  {
    v4 = 0;
  }
  return (SKSoundSource *)v4;
}

- (void)queueBuffer:(id)a3
{
  id v4;
  void *v5;
  ALuint bids;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_sourceId)
  {
    bids = objc_msgSend(v4, "bufferId");
    alSourceQueueBuffers(self->_sourceId, 1, &bids);
    -[NSMutableArray addObject:](self->_buffers, "addObject:", v5);
  }

}

- (BOOL)play
{
  ALuint sourceId;
  BOOL result;

  sourceId = self->_sourceId;
  result = 1;
  if (sourceId)
  {
    alSourcePlay(sourceId);
    if (alGetError())
      return 0;
  }
  return result;
}

- (void)pause
{
  ALuint sourceId;

  sourceId = self->_sourceId;
  if (sourceId)
    alSourcePause(sourceId);
}

- (void)stop
{
  ALuint sourceId;

  sourceId = self->_sourceId;
  if (sourceId)
    alSourceStop(sourceId);
}

- (BOOL)shouldLoop
{
  unsigned int sourceId;
  ALint value;

  sourceId = self->_sourceId;
  if (sourceId)
  {
    value = 0;
    alGetSourcei(sourceId, 4103, &value);
    LOBYTE(sourceId) = value == 1;
  }
  return sourceId;
}

- (void)setShouldLoop:(BOOL)a3
{
  ALuint sourceId;

  sourceId = self->_sourceId;
  if (sourceId)
    alSourcei(sourceId, 4103, a3);
}

- (double)gain
{
  ALuint sourceId;
  ALfloat value;

  sourceId = self->_sourceId;
  if (!sourceId)
    return 0.0;
  value = 0.0;
  alGetSourcef(sourceId, 4106, &value);
  return value;
}

- (void)setGain:(double)a3
{
  ALuint sourceId;
  ALfloat v4;

  sourceId = self->_sourceId;
  if (sourceId)
  {
    v4 = a3;
    alSourcef(sourceId, 4106, v4);
  }
}

- (CGPoint)position
{
  ALuint sourceId;
  double v3;
  double v4;
  ALfloat value3;
  ALfloat value2;
  ALfloat value1;
  CGPoint result;

  sourceId = self->_sourceId;
  if (sourceId)
  {
    value1 = 0.0;
    value3 = 0.0;
    value2 = 0.0;
    alGetSource3f(sourceId, 4100, &value1, &value2, &value3);
    v3 = value1;
    v4 = value2;
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  ALuint sourceId;
  ALfloat x;
  ALfloat y;

  sourceId = self->_sourceId;
  if (sourceId)
  {
    x = a3.x;
    y = a3.y;
    alSource3f(sourceId, 4100, x, y, 0.0);
  }
}

- (BOOL)isPlaying
{
  unsigned int sourceId;
  ALint value;

  sourceId = self->_sourceId;
  if (sourceId)
  {
    value = 0;
    alGetSourcei(sourceId, 4112, &value);
    LOBYTE(sourceId) = value == 4114;
  }
  return sourceId;
}

- (int)completedBufferCount
{
  int result;
  ALint value;

  result = self->_sourceId;
  if (result)
  {
    value = 0;
    alGetSourcei(result, 4118, &value);
    return value;
  }
  return result;
}

- (int)queuedBufferCount
{
  int result;
  ALint v4;
  ALint value;

  result = self->_sourceId;
  if (result)
  {
    value = 0;
    alGetSourcei(result, 4117, &value);
    v4 = value;
    return v4 - -[SKSoundSource completedBufferCount](self, "completedBufferCount");
  }
  return result;
}

- (void)purgeCompletedBuffers
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  ALsizei v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (self->_sourceId)
  {
    v3 = -[SKSoundSource completedBufferCount](self, "completedBufferCount");
    if (v3 >= 1)
    {
      v4 = v3;
      MEMORY[0x1E0C80A78]();
      alSourceUnqueueBuffers(self->_sourceId, v6, (ALuint *)((char *)v7 - v5));
      -[NSMutableArray removeObjectsInRange:](self->_buffers, "removeObjectsInRange:", 0, v4);
    }
  }
}

- (id)description
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  const __CFString *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_buffers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = &stru_1EA5021F8;
    do
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR("\n\t%@"), v10);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v7 = &stru_1EA5021F8;
  }

  v11 = -[SKSoundSource queuedBufferCount](self, "queuedBufferCount");
  v12 = -[SKSoundSource completedBufferCount](self, "completedBufferCount");
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = -[SKSoundSource isPlaying](self, "isPlaying");
  v15 = CFSTR("NO");
  if (v14)
    v15 = CFSTR("YES");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("paused:%@ totalBuffers:%d completed:%d queued:%d buffers = {%@\n}"), v15, (v12 + v11), v12, v11, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[SKSoundSource stop](self, "stop");
  -[SKSoundSource purgeCompletedBuffers](self, "purgeCompletedBuffers");
  -[NSMutableArray removeAllObjects](self->_buffers, "removeAllObjects");
  if (self->_sourceId)
  {
    alDeleteSources(1, &self->_sourceId);
    self->_sourceId = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SKSoundSource;
  -[SKSoundSource dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffers, 0);
}

@end
