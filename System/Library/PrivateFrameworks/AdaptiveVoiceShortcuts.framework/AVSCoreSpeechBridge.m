@implementation AVSCoreSpeechBridge

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_instance;
}

void __37__AVSCoreSpeechBridge_sharedInstance__block_invoke()
{
  AVSCoreSpeechBridge *v0;
  void *v1;

  v0 = objc_alloc_init(AVSCoreSpeechBridge);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (AVSCoreSpeechBridge)init
{
  AVSCoreSpeechBridge *v2;
  CSCommandControlListener *v3;
  CSCommandControlListener *commandControlListener;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVSCoreSpeechBridge;
  v2 = -[AVSCoreSpeechBridge init](&v6, sel_init);
  if (v2)
  {
    v3 = (CSCommandControlListener *)objc_alloc_init(MEMORY[0x24BE282D0]);
    commandControlListener = v2->_commandControlListener;
    v2->_commandControlListener = v3;

    -[CSCommandControlListener setDelegate:](v2->_commandControlListener, "setDelegate:", v2);
  }
  return v2;
}

- (const)recordingASBD
{
  void *v2;
  const AudioStreamBasicDescription *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithCommonFormat:sampleRate:channels:interleaved:", 3, 1, 0, 16000.0);
  v3 = (const AudioStreamBasicDescription *)objc_msgSend(v2, "streamDescription");

  return v3;
}

- (void)startListening:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  dispatch_semaphore_t v5;
  id v6;
  CSCommandControlListener *commandControlListener;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, char, id);
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = objc_alloc_init(MEMORY[0x24BE282D8]);
  commandControlListener = self->_commandControlListener;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __38__AVSCoreSpeechBridge_startListening___block_invoke;
  v17 = &unk_25074F350;
  v19 = &v27;
  v20 = &v21;
  v8 = v5;
  v18 = v8;
  -[CSCommandControlListener startListenWithOption:completion:](commandControlListener, "startListenWithOption:completion:", v6, &v14);
  v9 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    *((_BYTE *)v28 + 24) = 0;
    v10 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FD8];
    v32[0] = CFSTR("Timed out");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1, v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("CoreSpeechBridge"), -1, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v22[5];
    v22[5] = v12;

  }
  if (v4)
    v4[2](v4, *((unsigned __int8 *)v28 + 24), v22[5]);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

void __38__AVSCoreSpeechBridge_startListening___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)stopListening:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CSCommandControlListener stopListenWithCompletion:](self->_commandControlListener, "stopListenWithCompletion:", &__block_literal_global_186);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t, _QWORD))v5 + 2))(v5, 1, 0);
    v4 = v5;
  }

}

- (void)commandControlListener:(id)a3 hasLPCMBufferAvailable:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[AVSCoreSpeechBridge commandControlListener:hasLPCMBufferAvailable:hostTime:](self, "commandControlListener:hasLPCMBufferAvailable:hostTime:", v7, v6, mach_absolute_time());

}

- (void)commandControlListener:(id)a3 hasLPCMBufferAvailable:(id)a4 hostTime:(unint64_t)a5
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = a4;
  if (v6 && self->_onBufferReceived)
  {
    v12 = v6;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithCommonFormat:sampleRate:channels:interleaved:", 3, 1, 0, 16000.0);
    v8 = (unint64_t)objc_msgSend(v12, "length") >> 1;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1838]), "initWithPCMFormat:frameCapacity:", v7, v8);
    objc_msgSend(v9, "setFrameLength:", objc_msgSend(v9, "frameCapacity"));
    v10 = *(void **)objc_msgSend(v9, "int16ChannelData");
    v11 = objc_retainAutorelease(v12);
    memcpy(v10, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));

    (*((void (**)(void))self->_onBufferReceived + 2))();
    v6 = v12;
  }

}

- (void)commandControlListener:(id)a3 didStopUnexpectedly:(BOOL)a4
{
  void (**onStopped)(id, BOOL);

  onStopped = (void (**)(id, BOOL))self->_onStopped;
  if (onStopped)
    onStopped[2](onStopped, a4);
}

- (id)onBufferReceived
{
  return self->_onBufferReceived;
}

- (void)setOnBufferReceived:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)onStopped
{
  return self->_onStopped;
}

- (void)setOnStopped:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onStopped, 0);
  objc_storeStrong(&self->_onBufferReceived, 0);
  objc_storeStrong((id *)&self->_commandControlListener, 0);
}

@end
