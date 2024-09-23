@implementation AVAudioMixProcessingEffectScheduledParameterEvent

- (AVAudioMixProcessingEffectScheduledParameterEvent)initWithParameters:(id)a3 at:(id *)a4
{
  AVAudioMixProcessingEffectScheduledParameterEvent *v6;
  int64_t var3;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAudioMixProcessingEffectScheduledParameterEvent;
  v6 = -[AVAudioMixProcessingEffectScheduledParameterEvent init](&v9, sel_init);
  if (v6)
  {
    v6->_parameters = (NSArray *)objc_msgSend(a3, "copy");
    var3 = a4->var3;
    *(_OWORD *)&v6->_time.value = *(_OWORD *)&a4->var0;
    v6->_time.epoch = var3;
  }
  return v6;
}

+ (id)eventWithParameters:(id)a3 at:(id *)a4
{
  AVAudioMixProcessingEffectScheduledParameterEvent *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v6 = [AVAudioMixProcessingEffectScheduledParameterEvent alloc];
  v8 = *a4;
  return -[AVAudioMixProcessingEffectScheduledParameterEvent initWithParameters:at:](v6, "initWithParameters:at:", a3, &v8);
}

- (id)parameters
{
  return self->_parameters;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  CMTime v7;
  CMTime time1;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a3 == self)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v5 = -[NSArray isEqual:](self->_parameters, "isEqual:", *((_QWORD *)a3 + 1));
      if (v5)
      {
        time1 = (CMTime)self->_time;
        v7 = *(CMTime *)((char *)a3 + 16);
        LOBYTE(v5) = CMTimeCompare(&time1, &v7) == 0;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  $95D729B680665BEAEFA1D6FCA8238556 time;

  v3 = -[NSArray hash](self->_parameters, "hash");
  time = self->_time;
  return CMTimeHash((CMTime *)&time) ^ v3;
}

- (id)_figSchedule
{
  void *v3;
  const __CFAllocator *v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  int v15;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTime time;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  time = (CMTime)self->_time;
  v5 = CMTimeCopyAsDictionary(&time, v4);
  objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x1E0CC3E78]);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 12* objc_msgSend(-[AVAudioMixProcessingEffectScheduledParameterEvent parameters](self, "parameters"), "count"));
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 4* objc_msgSend(-[AVAudioMixProcessingEffectScheduledParameterEvent parameters](self, "parameters"), "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = -[AVAudioMixProcessingEffectScheduledParameterEvent parameters](self, "parameters");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        time.timescale = 0;
        time.value = 0;
        v14 = objc_msgSend(v13, "fourcc");
        time.timescale = 0;
        time.value = v14;
        objc_msgSend(v6, "appendData:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &time, 12));
        v17 = 0;
        objc_msgSend(v13, "value");
        v17 = v15;
        objc_msgSend(v7, "appendData:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v17, 4));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v10);
  }
  objc_msgSend(v3, "setObject:forKey:", v6, *MEMORY[0x1E0CC3E70]);
  objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x1E0CC3E80]);
  if (v5)
    CFRelease(v5);
  return v3;
}

@end
