@implementation FigCaptureMicSourcePipelineConfiguration

- (void)micConnectionConfigurationsForMicSourcePosition:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = *(void **)(a1 + 16);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "builtInMicrophonePosition") == a2)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMicSourcePipelineConfiguration;
  -[FigCaptureMicSourcePipelineConfiguration dealloc](&v3, sel_dealloc);
}

- (uint64_t)setConfiguresAppAudioSession:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 56) = a2;
  return result;
}

- (uint64_t)setClientOSVersionSupportsDecoupledIO:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 59) = a2;
  return result;
}

- (__n128)setClientAuditToken:(uint64_t)a1
{
  __n128 result;

  if (a1)
  {
    result = *(__n128 *)a2;
    *(_OWORD *)(a1 + 76) = *(_OWORD *)(a2 + 16);
    *(__n128 *)(a1 + 60) = result;
  }
  return result;
}

- (uint64_t)setAudioSourceNodeShouldCallEndInterruption:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 58) = a2;
  return result;
}

- (uint64_t)setConfiguresAppAudioSessionToMixWithOthers:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 57) = a2;
  return result;
}

@end
