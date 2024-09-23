@implementation SCNAudioPlayer

- (SCNAudioPlayer)initWithSource:(SCNAudioSource *)source
{
  SCNAudioPlayer *v4;
  AVAudioPlayerNode *v5;
  SCNAudioSource *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNAudioPlayer;
  v4 = -[SCNAudioPlayer init](&v8, sel_init);
  if (v4)
  {
    v5 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x1E0C89AD8]);
    v4->_audioNode = &v5->super;
    v4->_audioPlayer = v5;
    v4->_customAudioNode = 0;
    v6 = source;
    v4->_audioSource = v6;
    -[AVAudioPlayerNode setRenderingAlgorithm:](v4->_audioPlayer, "setRenderingAlgorithm:", -[SCNAudioSource renderingAlgorithm](v6, "renderingAlgorithm"));
    -[SCNAudioSource rate](v4->_audioSource, "rate");
    -[AVAudioPlayerNode setRate:](v4->_audioPlayer, "setRate:");
    -[SCNAudioSource volume](v4->_audioSource, "volume");
    -[AVAudioPlayerNode setVolume:](v4->_audioPlayer, "setVolume:");
    -[SCNAudioSource reverbBlend](v4->_audioSource, "reverbBlend");
    -[AVAudioPlayerNode setReverbBlend:](v4->_audioPlayer, "setReverbBlend:");
  }
  return v4;
}

- (SCNAudioPlayer)initWithAVAudioNode:(AVAudioNode *)audioNode
{
  SCNAudioPlayer *v4;
  AVAudioNode *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNAudioPlayer;
  v4 = -[SCNAudioPlayer init](&v7, sel_init);
  if (v4)
  {
    v5 = audioNode;
    v4->_customAudioNode = 1;
    v4->_audioPlayer = 0;
    v4->_audioSource = 0;
    v4->_audioNode = v5;
  }
  return v4;
}

+ (SCNAudioPlayer)audioPlayerWithAVAudioNode:(AVAudioNode *)audioNode
{
  SCNAudioPlayer *result;

  result = -[SCNAudioPlayer initWithAVAudioNode:]([SCNAudioPlayer alloc], "initWithAVAudioNode:", audioNode);
  result->_shouldRecycle = 1;
  return result;
}

- (void)reset
{
  -[SCNAudioPlayer setWillStartPlayback:](self, "setWillStartPlayback:", 0);
  -[SCNAudioPlayer setDidFinishPlayback:](self, "setDidFinishPlayback:", 0);
  self->_nodeRef = 0;
  self->_scene = 0;

  self->_audioSource = 0;
}

+ (SCNAudioPlayer)audioPlayerWithSource:(SCNAudioSource *)source
{
  id *v4;
  id *v5;
  SCNAudioSource *v6;
  SCNAudioPlayer *result;

  if (gAudioPlayers && objc_msgSend((id)gAudioPlayers, "count"))
  {
    v4 = (id *)objc_msgSend((id)gAudioPlayers, "anyObject");
    v5 = v4;
    objc_msgSend((id)gAudioPlayers, "removeObject:", v4);
    v6 = source;
    v4[3] = v6;
    objc_msgSend(v4[2], "setRenderingAlgorithm:", -[SCNAudioSource renderingAlgorithm](v6, "renderingAlgorithm"));
    objc_msgSend(v4[3], "rate");
    objc_msgSend(v4[2], "setRate:");
    objc_msgSend(v4[3], "volume");
    objc_msgSend(v4[2], "setVolume:");
    objc_msgSend(v4[3], "reverbBlend");
    objc_msgSend(v4[2], "setReverbBlend:");
    return (SCNAudioPlayer *)v4;
  }
  else
  {
    result = -[SCNAudioPlayer initWithSource:]([SCNAudioPlayer alloc], "initWithSource:", source);
    result->_shouldRecycle = 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNAudioPlayer;
  -[SCNAudioPlayer dealloc](&v3, sel_dealloc);
}

- (void)setNodeRef:(__C3DNode *)a3
{
  self->_nodeRef = a3;
  if (a3)
    self->_scene = (__C3DScene *)C3DGetScene(a3);
}

- (__C3DNode)nodeRef
{
  return self->_nodeRef;
}

- (void)play
{
  SCNAudioSource *audioSource;
  AVAudioPlayerNode *audioPlayer;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  __C3DNode *nodeRef;
  id v9;
  __C3DNode *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  SCNAudioPlayer *v15;
  _QWORD v16[8];
  _QWORD v17[8];
  _QWORD block[5];

  audioSource = self->_audioSource;
  if (audioSource && !self->_customAudioNode)
  {
    audioPlayer = self->_audioPlayer;
    v5 = -[SCNAudioSource audioBuffer](audioSource, "audioBuffer");
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __22__SCNAudioPlayer_play__block_invoke;
    block[3] = &unk_1EA59E288;
    block[4] = self;
    -[SCNAudioPlayer setCompleted:](self, "setCompleted:", 0);
    v7 = -[SCNAudioSource shouldStream](self->_audioSource, "shouldStream");
    nodeRef = self->_nodeRef;
    if (nodeRef)
      CFRetain(self->_nodeRef);
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __22__SCNAudioPlayer_play__block_invoke_2;
    v17[3] = &unk_1EA59E2D8;
    v17[6] = block;
    v17[7] = nodeRef;
    v17[4] = self;
    v17[5] = audioPlayer;
    if (v5)
    {
      -[AVAudioPlayerNode scheduleBuffer:atTime:options:completionHandler:](audioPlayer, "scheduleBuffer:atTime:options:completionHandler:", v5, 0, -[SCNAudioSource loops](self->_audioSource, "loops"), v17);
LABEL_9:
      v11 = v6;
      v12 = 3221225472;
      v13 = __22__SCNAudioPlayer_play__block_invoke_7;
      v14 = &unk_1EA59E288;
      v15 = self;
      dispatch_async(MEMORY[0x1E0C80D38], &v11);
      return;
    }
    if (v7)
    {
      v9 = -[SCNAudioSource audioFile](self->_audioSource, "audioFile");
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __22__SCNAudioPlayer_play__block_invoke_4;
      v16[3] = &unk_1EA59E300;
      v16[4] = self;
      v16[5] = audioPlayer;
      v16[6] = v17;
      v16[7] = nodeRef;
      -[AVAudioPlayerNode scheduleFile:atTime:completionHandler:](audioPlayer, "scheduleFile:atTime:completionHandler:", v9, 0, v16);
      goto LABEL_9;
    }
    v11 = v6;
    v12 = 3221225472;
    v13 = __22__SCNAudioPlayer_play__block_invoke_7;
    v14 = &unk_1EA59E288;
    v15 = self;
    dispatch_async(MEMORY[0x1E0C80D38], &v11);
    v10 = self->_nodeRef;
    if (v10)
      CFRelease(v10);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[SCNAudioPlayer setCompleted:](self, "setCompleted:", 1);
  }
}

uint64_t __22__SCNAudioPlayer_play__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "didFinishPlayback");
  if (result)
    return (*(uint64_t (**)(void))(objc_msgSend(*(id *)(a1 + 32), "didFinishPlayback") + 16))();
  return result;
}

uint64_t __22__SCNAudioPlayer_play__block_invoke_2(uint64_t a1)
{
  int8x16_t v2;
  _QWORD v4[4];
  int8x16_t v5;
  uint64_t v6;

  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setCompleted:", 1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __22__SCNAudioPlayer_play__block_invoke_3;
  v4[3] = &unk_1EA59E2B0;
  v6 = *(_QWORD *)(a1 + 56);
  v2 = *(int8x16_t *)(a1 + 32);
  v5 = vextq_s8(v2, v2, 8uLL);
  return +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, v2.i64[0], v4);
}

uint64_t __22__SCNAudioPlayer_play__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  _BYTE *v4;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    C3DNodeRemoveAudioPlayer(v2, *(const void **)(a1 + 32), 1);
    v3 = *(const void **)(a1 + 48);
    if (v3)
      CFRelease(v3);
  }
  v4 = *(_BYTE **)(a1 + 40);
  if (v4[50])
    return objc_msgSend(v4, "recycle");
  else
    return objc_msgSend(v4, "reset");
}

uint64_t __22__SCNAudioPlayer_play__block_invoke_4(int8x16_t *a1)
{
  uint64_t v2;
  int8x16_t v3;
  _QWORD v5[4];
  int8x16_t v6;
  uint64_t v7;

  if (!objc_msgSend(*(id *)(a1[2].i64[0] + 24), "loops"))
    return (*(uint64_t (**)(void))(a1[3].i64[0] + 16))();
  v2 = a1[3].i64[1];
  if (!v2)
    return (*(uint64_t (**)(void))(a1[3].i64[0] + 16))();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__SCNAudioPlayer_play__block_invoke_5;
  v5[3] = &unk_1EA59E2B0;
  v7 = v2;
  v3 = a1[2];
  v6 = vextq_s8(v3, v3, 8uLL);
  return +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, v3.i64[0], v5);
}

void __22__SCNAudioPlayer_play__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    C3DNodeRemoveAudioPlayer(v2, *(const void **)(a1 + 32), 1);
    v3 = *(const void **)(a1 + 48);
    if (v3)
      CFRelease(v3);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__SCNAudioPlayer_play__block_invoke_6;
  block[3] = &unk_1EA59E288;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __22__SCNAudioPlayer_play__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "play");
}

uint64_t __22__SCNAudioPlayer_play__block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "willStartPlayback");
  if (result)
    return (*(uint64_t (**)(void))(objc_msgSend(*(id *)(a1 + 32), "willStartPlayback") + 16))();
  return result;
}

- (void)recycle
{
  void *v3;
  id v4;

  objc_sync_enter(self);
  -[SCNAudioPlayer reset](self, "reset");
  v3 = (void *)gAudioPlayers;
  if (!gAudioPlayers)
  {
    gAudioPlayers = objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (id)gAudioPlayers;
    v3 = (void *)gAudioPlayers;
  }
  objc_msgSend(v3, "addObject:", self);
  objc_sync_exit(self);
}

- (id)audioBufferFormat
{
  return -[SCNAudioSource audioBufferFormat](self->_audioSource, "audioBufferFormat");
}

- (void)willStartPlayback
{
  return self->willStartPlayback;
}

- (void)setWillStartPlayback:(void *)willStartPlayback
{
  objc_setProperty_nonatomic_copy(self, a2, willStartPlayback, 56);
}

- (void)didFinishPlayback
{
  return self->didFinishPlayback;
}

- (void)setDidFinishPlayback:(void *)didFinishPlayback
{
  objc_setProperty_nonatomic_copy(self, a2, didFinishPlayback, 64);
}

- (AVAudioNode)audioNode
{
  return self->_audioNode;
}

- (AVAudioPlayerNode)audioPlayer
{
  return self->_audioPlayer;
}

- (SCNAudioSource)audioSource
{
  return self->_audioSource;
}

- (__C3DScene)scene
{
  return self->_scene;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)customAudioNode
{
  return self->_customAudioNode;
}

@end
