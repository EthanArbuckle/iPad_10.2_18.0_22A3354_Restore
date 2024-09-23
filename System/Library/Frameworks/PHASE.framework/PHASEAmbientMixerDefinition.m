@implementation PHASEAmbientMixerDefinition

- (PHASEAmbientMixerDefinition)init
{
  -[PHASEAmbientMixerDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEAmbientMixerDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEAmbientMixerDefinition)initWithChannelLayout:(AVAudioChannelLayout *)layout orientation:(simd_quatf)orientation identifier:(NSString *)identifier
{
  AVAudioChannelLayout *v7;
  NSString *v8;
  PHASEAmbientMixerDefinition *v9;
  PHASEAmbientMixerDefinition *v10;
  PHASEAmbientMixerDefinition *v11;
  double v13;

  v13 = *(double *)orientation.vector.i64;
  v7 = layout;
  v8 = identifier;
  v9 = -[PHASEAmbientMixerDefinition initWithChannelLayout:orientation:](self, "initWithChannelLayout:orientation:", v7, v13);
  v10 = v9;
  if (v9)
  {
    -[PHASEDefinition setIdentifier:](v9, "setIdentifier:", v8);
    v11 = v10;
  }

  return v10;
}

- (PHASEAmbientMixerDefinition)initWithChannelLayout:(AVAudioChannelLayout *)layout orientation:(simd_quatf)orientation
{
  AVAudioChannelLayout *v6;
  id v7;
  Phase::ChannelLayout *v8;
  const AudioChannelLayout *v9;
  unsigned int *v10;
  float v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSObject *v16;
  PHASEAmbientMixerDefinition *v17;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = layout;
  v20.receiver = self;
  v20.super_class = (Class)PHASEAmbientMixerDefinition;
  v7 = -[PHASEMixerDefinition initInternal](&v20, sel_initInternal);
  if (!v7)
    goto LABEL_11;
  v8 = -[AVAudioChannelLayout layout](v6, "layout");
  v10 = Phase::ChannelLayout::IsLayoutSupported(v8, v9);
  if ((v10 & 1) != 0)
  {
    v11 = 1.0
        - sqrtf(vmuls_lane_f32(orientation.vector.f32[3], (float32x4_t)orientation, 3)+ (float)(vmuls_lane_f32(orientation.vector.f32[2], (float32x4_t)orientation, 2)+ (float)(vmulq_f32((float32x4_t)orientation, (float32x4_t)orientation).f32[0]+ vmuls_lane_f32(orientation.vector.f32[1], *(float32x2_t *)orientation.vector.f32, 1))));
    if (v11 < 0.0)
      v11 = -v11;
    if (v11 <= 0.1)
    {
      *((simd_quatf *)v7 + 3) = orientation;
      objc_storeStrong((id *)v7 + 5, layout);
      v17 = (PHASEAmbientMixerDefinition *)v7;
      goto LABEL_12;
    }
    v12 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v10) + 432));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v22 = "PHASEMixer.mm";
      v23 = 1024;
      v24 = 406;
      v25 = 2048;
      v26 = orientation.vector.f32[0];
      v27 = 2048;
      v28 = orientation.vector.f32[1];
      v29 = 2048;
      v30 = orientation.vector.f32[2];
      v31 = 2048;
      v32 = orientation.vector.f32[3];
      v13 = "%25s:%-5d Failed to initialize Ambient Mixer Definition: orientation [%f, %f, %f, %f] must be normalized";
      v14 = v12;
      v15 = 58;
LABEL_10:
      _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    }
  }
  else
  {
    v16 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v10) + 432));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "PHASEMixer.mm";
      v23 = 1024;
      v24 = 398;
      v13 = "%25s:%-5d Failed to initialize Ambient Mixer Definition: unsupported channel layout";
      v14 = v16;
      v15 = 18;
      goto LABEL_10;
    }
  }
LABEL_11:
  v17 = 0;
LABEL_12:

  return v17;
}

- (simd_quatf)orientation
{
  return (simd_quatf)self[1].super.super;
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
