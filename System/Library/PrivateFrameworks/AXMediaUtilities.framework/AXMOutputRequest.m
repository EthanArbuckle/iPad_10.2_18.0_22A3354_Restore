@implementation AXMOutputRequest

+ (id)speechItemSeparator
{
  if (speechItemSeparator_onceToken != -1)
    dispatch_once(&speechItemSeparator_onceToken, &__block_literal_global_1);
  return (id)speechItemSeparator__Separator;
}

void __39__AXMOutputRequest_speechItemSeparator__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(".\n "));
  v1 = (void *)speechItemSeparator__Separator;
  speechItemSeparator__Separator = v0;

}

- (AXMOutputRequest)init
{
  AXMOutputRequest *v2;
  AXMOutputRequestHandle *v3;
  AXMOutputRequestHandle *handle;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMutableArray *queue_actions;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXMOutputRequest;
  v2 = -[AXMOutputRequest init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AXMOutputRequestHandle);
    handle = v2->_handle;
    v2->_handle = v3;

    v5 = dispatch_queue_create("AXMOutputRequest", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    queue_actions = v2->_queue_actions;
    v2->_queue_actions = (NSMutableArray *)v7;

  }
  return v2;
}

- (NSArray)actions
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AXMOutputRequest_actions__block_invoke;
  v5[3] = &unk_1E625CA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __27__AXMOutputRequest_actions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)speechActions
{
  void *v2;
  void *v3;
  void *v4;

  -[AXMOutputRequest actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __33__AXMOutputRequest_speechActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)oneShotSoundActions
{
  void *v2;
  void *v3;
  void *v4;

  -[AXMOutputRequest actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_27);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __39__AXMOutputRequest_oneShotSoundActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)activeSoundActions
{
  void *v2;
  void *v3;
  void *v4;

  -[AXMOutputRequest actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __38__AXMOutputRequest_activeSoundActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)hapticActions
{
  void *v2;
  void *v3;
  void *v4;

  -[AXMOutputRequest actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_31);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __33__AXMOutputRequest_hapticActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_addAction:(id)a3
{
  id v4;
  NSObject *queue;
  AXMOutputRequestHandle *handle;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AXMOutputRequest__addAction___block_invoke;
  block[3] = &unk_1E625CB18;
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(queue, block);
  handle = self->_handle;
  objc_msgSend(v8, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMOutputRequestHandle addActionHandle:](handle, "addActionHandle:", v7);

}

uint64_t __31__AXMOutputRequest__addAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)addSpeechItem:(id)a3
{
  id v4;
  AXMSpeechOutputAction *v5;

  v4 = a3;
  v5 = -[AXMSpeechOutputAction initWithText:]([AXMSpeechOutputAction alloc], "initWithText:", v4);

  -[AXMOutputRequest _addAction:](self, "_addAction:", v5);
}

- (void)addSoundItemWithID:(id)a3
{
  id v4;
  AXMOneShotSoundOutputAction *v5;
  NSObject *v6;

  v4 = a3;
  v5 = -[AXMSoundOutputAction initWithSoundID:]([AXMOneShotSoundOutputAction alloc], "initWithSoundID:", v4);
  if (v5)
  {
    -[AXMOutputRequest _addAction:](self, "_addAction:", v5);
  }
  else
  {
    AXMediaLogSounds();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXMOutputRequest addSoundItemWithID:].cold.1();

  }
}

- (void)addSoundItemWithURL:(id)a3
{
  id v4;
  AXMOneShotSoundOutputAction *v5;
  NSObject *v6;

  v4 = a3;
  v5 = -[AXMSoundOutputAction initWithURL:]([AXMOneShotSoundOutputAction alloc], "initWithURL:", v4);
  if (v5)
  {
    -[AXMOutputRequest _addAction:](self, "_addAction:", v5);
  }
  else
  {
    AXMediaLogSounds();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXMOutputRequest addSoundItemWithURL:].cold.1();

  }
}

- (void)addActiveSoundItemWithID:(id)a3
{
  id v4;
  AXMActiveSoundOutputAction *v5;
  NSObject *v6;

  v4 = a3;
  v5 = -[AXMActiveSoundOutputAction initWithSoundID:]([AXMActiveSoundOutputAction alloc], "initWithSoundID:", v4);
  if (v5)
  {
    -[AXMOutputRequest _addAction:](self, "_addAction:", v5);
  }
  else
  {
    AXMediaLogSounds();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXMOutputRequest addSoundItemWithID:].cold.1();

  }
}

- (void)addActiveSoundItemWithURL:(id)a3
{
  id v4;
  AXMActiveSoundOutputAction *v5;
  NSObject *v6;

  v4 = a3;
  v5 = -[AXMActiveSoundOutputAction initWithURL:]([AXMActiveSoundOutputAction alloc], "initWithURL:", v4);
  if (v5)
  {
    -[AXMOutputRequest _addAction:](self, "_addAction:", v5);
  }
  else
  {
    AXMediaLogSounds();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXMOutputRequest addActiveSoundItemWithURL:].cold.1();

  }
}

- (void)addHapticItemWithURL:(id)a3
{
  -[AXMOutputRequest addHapticItemWithURL:intensity:](self, "addHapticItemWithURL:intensity:", a3, 1.0);
}

- (void)addHapticItemWithURL:(id)a3 intensity:(double)a4
{
  id v6;
  AXMHapticOutputAction *v7;
  NSObject *v8;

  v6 = a3;
  v7 = -[AXMHapticOutputAction initWithURL:]([AXMHapticOutputAction alloc], "initWithURL:", v6);
  -[AXMHapticOutputAction setHapticIntensity:](v7, "setHapticIntensity:", a4);
  if (v7)
  {
    -[AXMOutputRequest _addAction:](self, "_addAction:", v7);
  }
  else
  {
    AXMediaLogSounds();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AXMOutputRequest addHapticItemWithURL:intensity:].cold.1();

  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)interruptsAndClearsQueue
{
  return self->_interruptsAndClearsQueue;
}

- (void)setInterruptsAndClearsQueue:(BOOL)a3
{
  self->_interruptsAndClearsQueue = a3;
}

- (AXMOutputRequestHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_queue_actions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (void)addSoundItemWithID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Could not produce URL for soundID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addSoundItemWithURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Could not make soundAction url does not exist: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addActiveSoundItemWithURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Could not make sound. Action url does not exist: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addHapticItemWithURL:intensity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Could not make haptic. Action url does not exist: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
