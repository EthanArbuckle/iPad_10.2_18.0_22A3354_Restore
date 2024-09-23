@implementation MPCSharedListeningQueueEventPlaybackModeChanged

- (MPCSharedListeningQueueEventPlaybackModeChanged)initWithUpdatedShuffleType:(int64_t)a3
{
  MPCSharedListeningQueueEventPlaybackModeChanged *v4;
  MPCSharedListeningQueueEventPlaybackModeChanged *v5;
  uint64_t v6;
  uint64_t v7;
  id shuffleType;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPCSharedListeningQueueEventPlaybackModeChanged;
  v4 = -[MPCSharedListeningQueueEventPlaybackModeChanged init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x24BDAC760];
    v4->_kind = 1;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __78__MPCSharedListeningQueueEventPlaybackModeChanged_initWithUpdatedShuffleType___block_invoke;
    v10[3] = &__block_descriptor_40_e5_q8__0l;
    v10[4] = a3;
    v7 = objc_msgSend(v10, "copy");
    shuffleType = v5->_shuffleType;
    v5->_shuffleType = (id)v7;

  }
  return v5;
}

- (MPCSharedListeningQueueEventPlaybackModeChanged)initWithUpdatedRepeatType:(int64_t)a3
{
  MPCSharedListeningQueueEventPlaybackModeChanged *v4;
  MPCSharedListeningQueueEventPlaybackModeChanged *v5;
  uint64_t v6;
  uint64_t v7;
  id repeatType;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPCSharedListeningQueueEventPlaybackModeChanged;
  v4 = -[MPCSharedListeningQueueEventPlaybackModeChanged init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x24BDAC760];
    v4->_kind = 2;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __77__MPCSharedListeningQueueEventPlaybackModeChanged_initWithUpdatedRepeatType___block_invoke;
    v10[3] = &__block_descriptor_40_e5_q8__0l;
    v10[4] = a3;
    v7 = objc_msgSend(v10, "copy");
    repeatType = v5->_repeatType;
    v5->_repeatType = (id)v7;

  }
  return v5;
}

- (MPCSharedListeningQueueEventPlaybackModeChanged)initWithUpdatedAutoPlayEnabled:(BOOL)a3
{
  MPCSharedListeningQueueEventPlaybackModeChanged *v4;
  MPCSharedListeningQueueEventPlaybackModeChanged *v5;
  uint64_t v6;
  uint64_t v7;
  id autoPlayEnabled;
  _QWORD v10[4];
  BOOL v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MPCSharedListeningQueueEventPlaybackModeChanged;
  v4 = -[MPCSharedListeningQueueEventPlaybackModeChanged init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x24BDAC760];
    v4->_kind = 3;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __82__MPCSharedListeningQueueEventPlaybackModeChanged_initWithUpdatedAutoPlayEnabled___block_invoke;
    v10[3] = &__block_descriptor_33_e5_B8__0l;
    v11 = a3;
    v7 = objc_msgSend(v10, "copy");
    autoPlayEnabled = v5->_autoPlayEnabled;
    v5->_autoPlayEnabled = (id)v7;

  }
  return v5;
}

- (id)description
{
  int64_t kind;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v12;

  kind = self->_kind;
  switch(kind)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEventPlaybackModeChanged: %p unknown/invalid>"), self, v12);
      goto LABEL_10;
    case 1:
      v4 = (void *)MEMORY[0x24BDD17C8];
      (*((void (**)(void))self->_shuffleType + 2))();
      MPNSStringFromShuffleType();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEventPlaybackModeChanged: %p shuffleType=%@>"), self, v5);
      goto LABEL_6;
    case 2:
      v6 = (void *)MEMORY[0x24BDD17C8];
      (*((void (**)(void))self->_repeatType + 2))();
      MPNSStringFromRepeatType();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEventPlaybackModeChanged: %p repeatType=%@>"), self, v5);
LABEL_6:
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    case 3:
      v8 = (void *)MEMORY[0x24BDD17C8];
      v9 = (*((uint64_t (**)(void))self->_autoPlayEnabled + 2))();
      v10 = CFSTR("NO");
      if (v9)
        v10 = CFSTR("YES");
      objc_msgSend(v8, "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEventPlaybackModeChanged: %p autoPlayEnabled=%@>"), self, v10);
      goto LABEL_10;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEventPlaybackModeChanged: %p unknown/kind=%ld>"), self, kind);
LABEL_10:
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
  }
}

- (int64_t)kind
{
  return self->_kind;
}

- (id)shuffleType
{
  return self->_shuffleType;
}

- (id)repeatType
{
  return self->_repeatType;
}

- (id)autoPlayEnabled
{
  return self->_autoPlayEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_autoPlayEnabled, 0);
  objc_storeStrong(&self->_repeatType, 0);
  objc_storeStrong(&self->_shuffleType, 0);
}

uint64_t __82__MPCSharedListeningQueueEventPlaybackModeChanged_initWithUpdatedAutoPlayEnabled___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t __77__MPCSharedListeningQueueEventPlaybackModeChanged_initWithUpdatedRepeatType___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t __78__MPCSharedListeningQueueEventPlaybackModeChanged_initWithUpdatedShuffleType___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

@end
