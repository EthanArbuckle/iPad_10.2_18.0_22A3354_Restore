@implementation AVAudioChannelGroupSemantics

- (AVAudioChannelGroupSemantics)init
{

  return 0;
}

- (AVAudioChannelGroupSemantics)initWithChannelCount:(unsigned int)a3 semantics:(unsigned int)a4 terminalType:(unsigned int)a5 layout:(id)a6
{
  id v11;
  AVAudioChannelGroupSemantics *v12;
  AVAudioChannelGroupSemantics *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)AVAudioChannelGroupSemantics;
  v12 = -[AVAudioChannelGroupSemantics init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_terminalType = a5;
    v12->_channelCount = a3;
    v12->_semantics = a4;
    objc_storeStrong((id *)&v12->_layout, a6);
  }

  return v13;
}

- (AVAudioChannelGroupSemantics)initWithAudioChannelGroupSemantics:(const AudioChannelGroupSemantics *)a3
{
  AVAudioChannelGroupSemantics *v4;
  AVAudioChannelGroupSemantics *v5;
  uint64_t v6;
  AVAudioChannelLayout *layout;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAudioChannelGroupSemantics;
  v4 = -[AVAudioChannelGroupSemantics init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_channelCount = a3->var0;
    v4->_semantics = a3->var1;
    v4->_terminalType = a3->var2;
    v6 = objc_msgSend(objc_alloc((Class)getAVAudioChannelLayoutClass()), "initWithLayout:", &a3->var3);
    layout = v5->_layout;
    v5->_layout = (AVAudioChannelLayout *)v6;

  }
  return v5;
}

- (AudioChannelGroupSemantics)createAudioChannelGroupSemantics
{
  uint64_t v3;
  AudioChannelGroupSemantics *v4;
  AudioChannelGroupSemantics *v5;
  int v7;
  AudioChannelGroupSemantics **v8;
  AudioChannelGroupSemantics *v9;

  if ((_DWORD)-[AVAudioChannelLayout layout](self->_layout, "layout")[8])
    v3 = 20 * ((_DWORD)-[AVAudioChannelLayout layout](self->_layout, "layout")[8] - 1);
  else
    v3 = 0;
  v4 = (AudioChannelGroupSemantics *)malloc_type_malloc(v3 + 44, 0xAAD716A5uLL);
  v9 = v4;
  v7 = MEMORY[0x193FFE424]();
  v8 = &v9;
  v4->var0 = self->_channelCount;
  v4->var1 = self->_semantics;
  v4->var2 = self->_terminalType;
  memcpy(&v4->var3, -[AVAudioChannelLayout layout](self->_layout, "layout"), v3 + 12);
  v5 = v9;
  applesauce::raii::v1::detail::ScopeGuard<-[AVAudioChannelGroupSemantics createAudioChannelGroupSemantics]::$_0,applesauce::raii::v1::detail::StackFailPolicy>::~ScopeGuard((uint64_t)&v7);
  return v5;
}

- (AVAudioChannelGroupSemantics)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  AVAudioChannelGroupSemantics *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("channelCount"));
  v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("semantics"));
  v7 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("terminalType"));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("layout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVAudioChannelGroupSemantics initWithChannelCount:semantics:terminalType:layout:](self, "initWithChannelCount:semantics:terminalType:layout:", v5, v6, v7, v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", self->_channelCount, CFSTR("channelCount"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_semantics, CFSTR("semantics"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_terminalType, CFSTR("terminalType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_layout, CFSTR("layout"));

}

- (AVAudioChannelLayout)layout
{
  return (AVAudioChannelLayout *)(id)objc_msgSend(objc_alloc((Class)getAVAudioChannelLayoutClass()), "initWithLayout:", -[AVAudioChannelLayout layout](self->_layout, "layout"));
}

- (void)setLayout:(id)a3
{
  AVAudioChannelLayout *v4;
  AVAudioChannelLayout *layout;
  id v6;

  v6 = a3;
  v4 = (AVAudioChannelLayout *)objc_msgSend(objc_alloc((Class)getAVAudioChannelLayoutClass()), "initWithLayout:", objc_msgSend(v6, "layout"));
  layout = self->_layout;
  self->_layout = v4;

}

- (unsigned)semantics
{
  return self->_semantics;
}

- (void)setSemantics:(unsigned int)a3
{
  self->_semantics = a3;
}

- (unsigned)terminalType
{
  return self->_terminalType;
}

- (void)setTerminalType:(unsigned int)a3
{
  self->_terminalType = a3;
}

- (unsigned)channelCount
{
  return self->_channelCount;
}

- (void)setChannelCount:(unsigned int)a3
{
  self->_channelCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

- (uint64_t)createAudioChannelGroupSemantics
{
  if ((int)MEMORY[0x193FFE424]() > *(_DWORD *)a1)
  {
    free(**(void ***)(a1 + 8));
    **(_QWORD **)(a1 + 8) = 0;
  }
  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
