@implementation AVBorealisServerPortManager

- (AVBorealisServerPortManager)initWithPortType:(unint64_t)a3 hysteresisDurationSeconds:(float)a4 notificationBlock:(id)a5
{
  id v8;
  AVBorealisServerPortManager *v9;
  AVBorealisServerPortManager *v10;
  uint64_t v11;
  id notificationBlock;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AVBorealisServerPortManager;
  v9 = -[AVBorealisServerPortManager init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_portType = a3;
    v9->_hysteresisDurationSeconds = a4;
    v11 = objc_msgSend(v8, "copy");
    notificationBlock = v10->_notificationBlock;
    v10->_notificationBlock = (id)v11;

    *(_WORD *)&v10->_listeningEnabled = 1;
    v10->_generation = 0;
    if (a3 == 1)
      v10->_listeningEnabled = 0;
  }

  return v10;
}

- (void)callNotificationBlock:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t portType;
  const char *v6;
  void (**notificationBlock)(id, unint64_t, _BOOL8);
  void *v8;
  _BOOL4 listeningEnabled;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BYTE v15[14];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (self->_lastStateSent != a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    portType = self->_portType;
    v10 = 136315906;
    v11 = "AVBorealisServer.mm";
    v12 = 1024;
    v13 = 243;
    v14 = 1024;
    *(_DWORD *)v15 = v3;
    *(_WORD *)&v15[4] = 2048;
    *(_QWORD *)&v15[6] = portType;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d setting cached active state: %d for port: %lu", (uint8_t *)&v10, 0x22u);
  }
  self->_lastStateSent = v3;
  if (v3)
    v6 = "com.apple.coreaudio.speaker.active";
  else
    v6 = "com.apple.coreaudio.speaker.inactive";
  notify_post(v6);
  if (self->_listeningEnabled
    && (notificationBlock = (void (**)(id, unint64_t, _BOOL8))self->_notificationBlock) != 0)
  {
    notificationBlock[2](notificationBlock, self->_portType, v3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v8 = _Block_copy(self->_notificationBlock);
    listeningEnabled = self->_listeningEnabled;
    v10 = 136315906;
    v11 = "AVBorealisServer.mm";
    v12 = 1024;
    v13 = 259;
    v14 = 2048;
    *(_QWORD *)v15 = v8;
    *(_WORD *)&v15[8] = 1024;
    *(_DWORD *)&v15[10] = listeningEnabled;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d not calling notificationBlock(%p), listening is : %d ", (uint8_t *)&v10, 0x22u);

  }
}

- (void)notifyStateChanged:(BOOL)a3 onQueue:(id)a4
{
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AVBorealisServerPortManager_notifyStateChanged_onQueue___block_invoke;
  block[3] = &unk_1E45093D8;
  v10 = a3;
  block[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(v7, block);

}

- (unint64_t)portType
{
  return self->_portType;
}

- (void)setPortType:(unint64_t)a3
{
  self->_portType = a3;
}

- (float)hysteresisDurationSeconds
{
  return self->_hysteresisDurationSeconds;
}

- (void)setHysteresisDurationSeconds:(float)a3
{
  self->_hysteresisDurationSeconds = a3;
}

- (id)notificationBlock
{
  return self->_notificationBlock;
}

- (void)setNotificationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)listeningEnabled
{
  return self->_listeningEnabled;
}

- (void)setListeningEnabled:(BOOL)a3
{
  self->_listeningEnabled = a3;
}

- (BOOL)lastStateSent
{
  return self->_lastStateSent;
}

- (void)setLastStateSent:(BOOL)a3
{
  self->_lastStateSent = a3;
}

- (int64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(int64_t)a3
{
  self->_generation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationBlock, 0);
}

void __58__AVBorealisServerPortManager_notifyStateChanged_onQueue___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  uint64_t v5;
  float v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD block[6];
  char v10;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = objc_msgSend(*(id *)(a1 + 32), "lastStateSent");
  if (v2)
  {
    if ((v3 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "setGeneration:", objc_msgSend(*(id *)(a1 + 32), "generation") + 1);
    else
      objc_msgSend(*(id *)(a1 + 32), "callNotificationBlock:", *(unsigned __int8 *)(a1 + 48));
  }
  else if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = objc_msgSend(v4, "generation") + 1;
    objc_msgSend(v4, "setGeneration:", v5);
    objc_msgSend(*(id *)(a1 + 32), "hysteresisDurationSeconds");
    v7 = dispatch_time(0, (uint64_t)(float)(v6 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AVBorealisServerPortManager_notifyStateChanged_onQueue___block_invoke_2;
    block[3] = &unk_1E45093B0;
    v8 = *(NSObject **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v5;
    v10 = *(_BYTE *)(a1 + 48);
    dispatch_after(v7, v8, block);
  }
}

uint64_t __58__AVBorealisServerPortManager_notifyStateChanged_onQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "generation");
  if (v2 == result)
    return objc_msgSend(*(id *)(a1 + 32), "callNotificationBlock:", *(unsigned __int8 *)(a1 + 48));
  return result;
}

@end
