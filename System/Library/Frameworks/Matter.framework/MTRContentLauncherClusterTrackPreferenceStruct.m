@implementation MTRContentLauncherClusterTrackPreferenceStruct

- (MTRContentLauncherClusterTrackPreferenceStruct)init
{
  MTRContentLauncherClusterTrackPreferenceStruct *v2;
  MTRContentLauncherClusterTrackPreferenceStruct *v3;
  NSString *languageCode;
  NSArray *characteristics;
  NSNumber *audioOutputIndex;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRContentLauncherClusterTrackPreferenceStruct;
  v2 = -[MTRContentLauncherClusterTrackPreferenceStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    languageCode = v2->_languageCode;
    v2->_languageCode = (NSString *)&stru_2505249E8;

    characteristics = v3->_characteristics;
    v3->_characteristics = 0;

    audioOutputIndex = v3->_audioOutputIndex;
    v3->_audioOutputIndex = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRContentLauncherClusterTrackPreferenceStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;

  v4 = objc_alloc_init(MTRContentLauncherClusterTrackPreferenceStruct);
  objc_msgSend_languageCode(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLanguageCode_(v4, v8, (uint64_t)v7);

  objc_msgSend_characteristics(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCharacteristics_(v4, v12, (uint64_t)v11);

  objc_msgSend_audioOutputIndex(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAudioOutputIndex_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: languageCode:%@; characteristics:%@; audioOutputIndex:%@; >"),
    v5,
    self->_languageCode,
    self->_characteristics,
    self->_audioOutputIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)audioOutputIndex
{
  return self->_audioOutputIndex;
}

- (void)setAudioOutputIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioOutputIndex, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

@end
