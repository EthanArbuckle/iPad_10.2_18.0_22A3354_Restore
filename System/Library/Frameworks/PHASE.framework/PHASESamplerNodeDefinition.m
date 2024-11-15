@implementation PHASESamplerNodeDefinition

- (PHASESamplerNodeDefinition)init
{
  -[PHASESamplerNodeDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASESamplerNodeDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASESamplerNodeDefinition)initWithSoundAssetIdentifier:(NSString *)soundAssetIdentifier mixerDefinition:(PHASEMixerDefinition *)mixerDefinition identifier:(NSString *)identifier
{
  NSString *v8;
  PHASEMixerDefinition *v9;
  NSString *v10;
  PHASESamplerNodeDefinition *v11;
  PHASESamplerNodeDefinition *v12;

  v8 = soundAssetIdentifier;
  v9 = mixerDefinition;
  v10 = identifier;
  v11 = -[PHASESamplerNodeDefinition initWithSoundAssetIdentifier:mixerDefinition:](self, "initWithSoundAssetIdentifier:mixerDefinition:", v8, v9);
  v12 = v11;
  if (v11)
    -[PHASEDefinition setIdentifier:](v11, "setIdentifier:", v10);

  return v12;
}

- (PHASESamplerNodeDefinition)initWithSoundAssetIdentifier:(NSString *)soundAssetIdentifier mixerDefinition:(PHASEMixerDefinition *)mixerDefinition
{
  NSString *v7;
  PHASEMixerDefinition *v8;
  id *v9;
  id *v10;
  PHASESamplerNodeDefinition *v11;
  objc_super v13;

  v7 = soundAssetIdentifier;
  v8 = mixerDefinition;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)PHASESamplerNodeDefinition;
    v9 = -[PHASEGeneratorNodeDefinition initInternal:](&v13, sel_initInternal_, v8);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong(v9 + 10, soundAssetIdentifier);
      v10[11] = 0;
      v10[12] = 0;
    }
    self = v10;
    v11 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Cannot create a sampler with a nil soundAssetUID"));
    v11 = 0;
  }

  return v11;
}

- (void)setPlaybackType:(int64_t)a3
{
  if ((unint64_t)a3 <= 1)
    self->_playbackMode = a3;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (PHASECullOption)cullOption
{
  return self->_cullOption;
}

- (void)setCullOption:(PHASECullOption)cullOption
{
  self->_cullOption = cullOption;
}

- (PHASEPlaybackMode)playbackMode
{
  return self->_playbackMode;
}

- (void)setPlaybackMode:(PHASEPlaybackMode)playbackMode
{
  self->_playbackMode = playbackMode;
}

- (NSString)assetUID
{
  return self->_assetUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUID, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

@end
