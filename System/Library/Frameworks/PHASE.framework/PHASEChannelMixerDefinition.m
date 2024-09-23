@implementation PHASEChannelMixerDefinition

- (PHASEChannelMixerDefinition)init
{
  -[PHASEChannelMixerDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEChannelMixerDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEChannelMixerDefinition)initWithChannelLayout:(id)a3 mode:(int64_t)a4 uid:(id)a5
{
  id v8;
  id v9;
  PHASEChannelMixerDefinition *v10;
  PHASEChannelMixerDefinition *v11;
  PHASEChannelMixerDefinition *v12;

  v8 = a3;
  v9 = a5;
  v10 = -[PHASEChannelMixerDefinition initWithChannelLayout:mode:](self, "initWithChannelLayout:mode:", v8, a4);
  v11 = v10;
  if (v10)
  {
    -[PHASEDefinition setIdentifier:](v10, "setIdentifier:", v9);
    v12 = v11;
  }

  return v11;
}

- (PHASEChannelMixerDefinition)initWithChannelLayout:(id)a3 mode:(int64_t)a4
{
  PHASEChannelMixerDefinition *v4;
  PHASEChannelMixerDefinition *v5;
  PHASEChannelMixerDefinition *v6;

  v4 = -[PHASEChannelMixerDefinition initWithChannelLayout:](self, "initWithChannelLayout:", a3, a4);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (PHASEChannelMixerDefinition)initWithChannelLayout:(AVAudioChannelLayout *)layout identifier:(NSString *)identifier
{
  AVAudioChannelLayout *v6;
  NSString *v7;
  PHASEChannelMixerDefinition *v8;
  PHASEChannelMixerDefinition *v9;
  PHASEChannelMixerDefinition *v10;

  v6 = layout;
  v7 = identifier;
  v8 = -[PHASEChannelMixerDefinition initWithChannelLayout:](self, "initWithChannelLayout:", v6);
  v9 = v8;
  if (v8)
  {
    -[PHASEDefinition setIdentifier:](v8, "setIdentifier:", v7);
    v10 = v9;
  }

  return v9;
}

- (PHASEChannelMixerDefinition)initWithChannelLayout:(AVAudioChannelLayout *)layout
{
  AVAudioChannelLayout *v5;
  id *v6;
  Phase::ChannelLayout *v7;
  const AudioChannelLayout *v8;
  unsigned int *v9;
  PHASEChannelMixerDefinition *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = layout;
  v13.receiver = self;
  v13.super_class = (Class)PHASEChannelMixerDefinition;
  v6 = -[PHASEMixerDefinition initInternal](&v13, sel_initInternal);
  if (!v6)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v7 = -[AVAudioChannelLayout layout](v5, "layout");
  v9 = Phase::ChannelLayout::IsLayoutSupported(v7, v8);
  if ((v9 & 1) == 0)
  {
    v11 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v9) + 432));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "PHASEMixer.mm";
      v16 = 1024;
      v17 = 348;
      _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to initialize Channel Mixer Definition: unsupported channel layout", buf, 0x12u);
    }
    goto LABEL_6;
  }
  objc_storeStrong(v6 + 4, layout);
  v10 = v6;
LABEL_7:

  return v10;
}

- (AVAudioChannelLayout)inputChannelLayout
{
  return self->_inputChannelLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputChannelLayout, 0);
}

@end
