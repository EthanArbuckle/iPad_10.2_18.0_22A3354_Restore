@implementation AVAudioSourceNode

- (AVAudioSourceNode)initWithRenderBlock:(AVAudioSourceNodeRenderBlock)block
{
  id v4;
  _QWORD *v5;
  AVAudioSourceNode *v6;
  objc_super v8;

  v4 = +[AVAudioSourceNode pullInputBlockFromRenderBlock:](AVAudioSourceNode, "pullInputBlockFromRenderBlock:", block);
  v5 = (_QWORD *)operator new();
  AVAudioSourceNodeImpl::AVAudioSourceNodeImpl(v5, v4, 0);
  v8.receiver = self;
  v8.super_class = (Class)AVAudioSourceNode;
  v6 = -[AVAudioNode initWithImpl:](&v8, sel_initWithImpl_, v5);
  _Block_release(v4);
  return v6;
}

- (AVAudioSourceNode)initWithFormat:(AVAudioFormat *)format renderBlock:(AVAudioSourceNodeRenderBlock)block
{
  id v6;
  _QWORD *v7;
  AVAudioSourceNode *v8;
  objc_super v10;

  v6 = +[AVAudioSourceNode pullInputBlockFromRenderBlock:](AVAudioSourceNode, "pullInputBlockFromRenderBlock:", block);
  v7 = (_QWORD *)operator new();
  AVAudioSourceNodeImpl::AVAudioSourceNodeImpl(v7, v6, (uint64_t)format);
  v10.receiver = self;
  v10.super_class = (Class)AVAudioSourceNode;
  v8 = -[AVAudioNode initWithImpl:](&v10, sel_initWithImpl_, v7);
  _Block_release(v6);
  return v8;
}

+ (id)pullInputBlockFromRenderBlock:(id)a3
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__AVAudioSourceNode_pullInputBlockFromRenderBlock___block_invoke;
  aBlock[3] = &unk_1E3BEBDC0;
  aBlock[4] = a3;
  return _Block_copy(aBlock);
}

uint64_t __51__AVAudioSourceNode_pullInputBlockFromRenderBlock___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  char v4;

  v4 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v4)
    *a2 |= 0x10u;
  return result;
}

@end
