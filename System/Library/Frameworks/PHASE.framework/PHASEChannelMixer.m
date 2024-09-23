@implementation PHASEChannelMixer

- (PHASEChannelMixer)init
{
  PHASEChannelMixer *v2;
  PHASEChannelMixer *v3;
  PHASEChannelMixer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHASEChannelMixer;
  v2 = -[PHASEMixer init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (PHASEChannelMixer)initWithIdentifier:(id)a3 inputChannelLayout:(id)a4
{
  id v7;
  PHASEChannelMixer *v8;
  PHASEChannelMixer *v9;
  PHASEChannelMixer *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHASEChannelMixer;
  v8 = -[PHASEMixer initWithIdentifier:](&v12, sel_initWithIdentifier_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_inputChannelLayout, a4);
    v10 = v9;
  }

  return v9;
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
