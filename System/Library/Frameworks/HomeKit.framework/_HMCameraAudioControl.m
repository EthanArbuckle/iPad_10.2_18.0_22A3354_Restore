@implementation _HMCameraAudioControl

- (_HMCameraAudioControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4 service:(id)a5
{
  id v8;
  _HMCameraAudioControl *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  int *v18;
  void *v19;
  int v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_HMCameraAudioControl;
  v9 = -[_HMCameraControl initWithCameraProfile:profileUniqueIdentifier:](&v26, sel_initWithCameraProfile_profileUniqueIdentifier_, a3, a4);
  if (v9)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v8, "characteristics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v15, "characteristicType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("0000011A-0000-1000-8000-0026BB765291"));

          v18 = &OBJC_IVAR____HMCameraAudioControl__mute;
          if ((v17 & 1) == 0)
          {
            objc_msgSend(v15, "characteristicType");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("00000119-0000-1000-8000-0026BB765291"));

            v18 = &OBJC_IVAR____HMCameraAudioControl__volume;
            if (!v20)
              continue;
          }
          objc_storeStrong((id *)((char *)&v9->super.super.isa + *v18), v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v12);
    }

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_mute, 0);
}

- (HMCharacteristic)mute
{
  return self->_mute;
}

- (HMCharacteristic)volume
{
  return self->_volume;
}

@end
