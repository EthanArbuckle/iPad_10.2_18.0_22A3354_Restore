@implementation AVAudioSinkNode

- (AVAudioSinkNode)initWithReceiverBlock:(AVAudioSinkNodeReceiverBlock)block
{
  id v4;
  AVAudioSinkNodeImpl *v5;
  const void **v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  AVAudioSinkNode *v10;
  objc_super v12;
  AudioComponentDescription __x;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = +[AVAudioSinkNode pullInputBlockFromReceiverBlock:](AVAudioSinkNode, "pullInputBlockFromReceiverBlock:", block);
  v5 = (AVAudioSinkNodeImpl *)operator new();
  *(_OWORD *)&__x.componentType = xmmword_19B85A210;
  __x.componentFlagsMask = 0;
  AVAudioNodeImpl::AVAudioNodeImpl((uint64_t)v5, 0, &__x, 0);
  *(_QWORD *)v5 = &off_1E3BE7EC0;
  v6 = (const void **)operator new();
  *v6 = 0;
  AVAEBlock<int({block_pointer})(unsigned int *,AudioTimeStamp const*,unsigned int,long,AudioBufferList *)>::Set(v6, v4);
  *((_QWORD *)v5 + 23) = v6;
  LOBYTE(__x.componentType) = 0;
  std::vector<char>::vector((std::vector<char> *)((char *)v5 + 200), 8uLL, (const std::vector<char>::value_type *)&__x);
  **((_DWORD **)v5 + 25) = 0;
  caulk::pooled_semaphore_mutex::pooled_semaphore_mutex((AVAudioSinkNodeImpl *)((char *)v5 + 224));
  v7 = (*(uint64_t (**)(AVAudioSinkNodeImpl *))(*(_QWORD *)v5 + 40))(v5);
  (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)v7 + 64))(v7, 0, 0, 1);
  if ((AVAudioSinkNodeImpl::SetOutputFormat(v5, v8, 0) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      __x.componentType = 136316418;
      *(_QWORD *)&__x.componentSubType = "AVAEInternal.h";
      LOWORD(__x.componentFlags) = 1024;
      *(UInt32 *)((char *)&__x.componentFlags + 2) = 71;
      HIWORD(__x.componentFlagsMask) = 2080;
      v14 = "AVAudioSinkNode.mm";
      v15 = 1024;
      v16 = 19;
      v17 = 2080;
      v18 = "AVAudioSinkNodeImpl";
      v19 = 2080;
      v20 = "AVAudioSinkNodeImpl::SetOutputFormat(0, format)";
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", (uint8_t *)&__x, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "AVAudioSinkNodeImpl::SetOutputFormat(0, format)");
  }
  v12.receiver = self;
  v12.super_class = (Class)AVAudioSinkNode;
  v10 = -[AVAudioNode initWithImpl:](&v12, sel_initWithImpl_, v5);
  _Block_release(v4);
  return v10;
}

+ (id)pullInputBlockFromReceiverBlock:(id)a3
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__AVAudioSinkNode_pullInputBlockFromReceiverBlock___block_invoke;
  aBlock[3] = &unk_1E3BEBDC0;
  aBlock[4] = a3;
  return _Block_copy(aBlock);
}

uint64_t __51__AVAudioSinkNode_pullInputBlockFromReceiverBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
