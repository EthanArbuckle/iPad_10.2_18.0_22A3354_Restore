@implementation MusicKit_SoftLinking_MPMusicPlayerPlayParametersQueueDescriptor

- (MusicKit_SoftLinking_MPMusicPlayerPlayParametersQueueDescriptor)initWithPlayParametersQueue:(id)a3
{
  id v4;
  MusicKit_SoftLinking_MPMusicPlayerPlayParametersQueueDescriptor *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  uint64_t v15;
  MPMusicPlayerPlayParametersQueueDescriptor *underlyingQueueDescriptor;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MusicKit_SoftLinking_MPMusicPlayerPlayParametersQueueDescriptor;
  v5 = -[MusicKit_SoftLinking_MPMusicPlayerPlayParametersQueueDescriptor init](&v22, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "_underlyingPlayParameters", (_QWORD)v18);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_msgSend(v6, "copy");
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v13 = (void *)getMPMusicPlayerPlayParametersQueueDescriptorClass_softClass;
    v27 = getMPMusicPlayerPlayParametersQueueDescriptorClass_softClass;
    if (!getMPMusicPlayerPlayParametersQueueDescriptorClass_softClass)
    {
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __getMPMusicPlayerPlayParametersQueueDescriptorClass_block_invoke;
      v23[3] = &unk_24CD1CC68;
      v23[4] = &v24;
      __getMPMusicPlayerPlayParametersQueueDescriptorClass_block_invoke((uint64_t)v23);
      v13 = (void *)v25[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v24, 8);
    v15 = objc_msgSend([v14 alloc], "initWithPlayParametersQueue:", v12);
    underlyingQueueDescriptor = v5->_underlyingQueueDescriptor;
    v5->_underlyingQueueDescriptor = (MPMusicPlayerPlayParametersQueueDescriptor *)v15;

  }
  return v5;
}

- (MPMusicPlayerPlayParametersQueueDescriptor)_underlyingQueueDescriptor
{
  return self->_underlyingQueueDescriptor;
}

- (void)setPlayActivityFeatureName:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *playActivityFeatureName;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_playActivityFeatureName;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      playActivityFeatureName = self->_playActivityFeatureName;
      self->_playActivityFeatureName = v6;

      -[MPMusicPlayerPlayParametersQueueDescriptor setPlayActivityFeatureName:](self->_underlyingQueueDescriptor, "setPlayActivityFeatureName:", v8);
    }
  }

}

- (void)setStartItemPlayParameters:(id)a3
{
  MusicKit_SoftLinking_MPMusicPlayerPlayParameters *v5;
  void *v6;
  MusicKit_SoftLinking_MPMusicPlayerPlayParameters *v7;

  v5 = (MusicKit_SoftLinking_MPMusicPlayerPlayParameters *)a3;
  if (self->_startItemPlayParameters != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_startItemPlayParameters, a3);
    -[MusicKit_SoftLinking_MPMusicPlayerPlayParameters _underlyingPlayParameters](self->_startItemPlayParameters, "_underlyingPlayParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMusicPlayerPlayParametersQueueDescriptor setStartItemPlayParameters:](self->_underlyingQueueDescriptor, "setStartItemPlayParameters:", v6);

    v5 = v7;
  }

}

- (void)setContainerPlayParameters:(id)a3
{
  MusicKit_SoftLinking_MPMusicPlayerPlayParameters *v5;
  void *v6;
  MusicKit_SoftLinking_MPMusicPlayerPlayParameters *v7;

  v5 = (MusicKit_SoftLinking_MPMusicPlayerPlayParameters *)a3;
  if (self->_containerPlayParameters != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_containerPlayParameters, a3);
    -[MusicKit_SoftLinking_MPMusicPlayerPlayParameters _underlyingPlayParameters](self->_containerPlayParameters, "_underlyingPlayParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMusicPlayerPlayParametersQueueDescriptor setContainerPlayParameters:](self->_underlyingQueueDescriptor, "setContainerPlayParameters:", v6);

    v5 = v7;
  }

}

- (void)setStartTime:(double)a3 forItemWithPlayParameters:(id)a4
{
  id v6;

  objc_msgSend(a4, "_underlyingPlayParameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMusicPlayerPlayParametersQueueDescriptor setStartTime:forItemWithPlayParameters:](self->_underlyingQueueDescriptor, "setStartTime:forItemWithPlayParameters:", v6, a3);

}

- (void)setEndTime:(double)a3 forItemWithPlayParameters:(id)a4
{
  id v6;

  objc_msgSend(a4, "_underlyingPlayParameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMusicPlayerPlayParametersQueueDescriptor setEndTime:forItemWithPlayParameters:](self->_underlyingQueueDescriptor, "setEndTime:forItemWithPlayParameters:", v6, a3);

}

- (NSString)playActivityFeatureName
{
  return self->_playActivityFeatureName;
}

- (MusicKit_SoftLinking_MPMusicPlayerPlayParameters)startItemPlayParameters
{
  return self->_startItemPlayParameters;
}

- (MusicKit_SoftLinking_MPMusicPlayerPlayParameters)containerPlayParameters
{
  return self->_containerPlayParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerPlayParameters, 0);
  objc_storeStrong((id *)&self->_startItemPlayParameters, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);
  objc_storeStrong((id *)&self->_underlyingQueueDescriptor, 0);
}

@end
