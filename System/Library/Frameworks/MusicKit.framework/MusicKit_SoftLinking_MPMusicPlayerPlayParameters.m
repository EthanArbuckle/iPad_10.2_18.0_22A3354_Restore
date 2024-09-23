@implementation MusicKit_SoftLinking_MPMusicPlayerPlayParameters

- (MusicKit_SoftLinking_MPMusicPlayerPlayParameters)initWithDictionary:(id)a3
{
  id v4;
  MusicKit_SoftLinking_MPMusicPlayerPlayParameters *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  MPMusicPlayerPlayParameters *underlyingPlayParameters;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPMusicPlayerPlayParameters;
  v5 = -[MusicKit_SoftLinking_MPMusicPlayerPlayParameters init](&v11, sel_init);
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v6 = (void *)getMPMusicPlayerPlayParametersClass_softClass;
    v16 = getMPMusicPlayerPlayParametersClass_softClass;
    if (!getMPMusicPlayerPlayParametersClass_softClass)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __getMPMusicPlayerPlayParametersClass_block_invoke;
      v12[3] = &unk_24CD1CC68;
      v12[4] = &v13;
      __getMPMusicPlayerPlayParametersClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v13, 8);
    v8 = objc_msgSend([v7 alloc], "initWithDictionary:", v4);
    underlyingPlayParameters = v5->_underlyingPlayParameters;
    v5->_underlyingPlayParameters = (MPMusicPlayerPlayParameters *)v8;

    if (!v5->_underlyingPlayParameters)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (MPMusicPlayerPlayParameters)_underlyingPlayParameters
{
  return self->_underlyingPlayParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingPlayParameters, 0);
}

@end
