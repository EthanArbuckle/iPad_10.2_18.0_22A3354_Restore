@implementation FlexSongProxy

- (FlexSongProxy)initWithUID:(id)a3 songName:(id)a4 artistName:(id)a5 tagIDs:(id)a6 keywords:(id)a7 weightedKeywords:(id)a8 hidden:(BOOL)a9 recalled:(BOOL)a10 assets:(id)a11 audioEncoderPresetName:(id)a12 metadataVersion:(int64_t)a13 songFormat:(id)a14
{
  id v20;
  FlexSongProxy *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  FlexSongProxy *v25;
  __int16 v27;
  objc_super v29;

  v20 = a11;
  v29.receiver = self;
  v29.super_class = (Class)FlexSongProxy;
  HIBYTE(v27) = a10;
  LOBYTE(v27) = a9;
  v21 = -[FlexSongBackend initWithUID:songName:artistName:tagIDs:keywords:weightedKeywords:hidden:recalled:audioEncoderPresetName:metadataVersion:songFormat:sampleRate:customOptions:](&v29, sel_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_audioEncoderPresetName_metadataVersion_songFormat_sampleRate_customOptions_, a3, a4, a5, a6, a7, a8, v27, a12, a13, a14, 0, 0);
  v25 = v21;
  if (v21)
    objc_msgSend_updateAssets_(v21, v22, (uint64_t)v20, v23, v24);

  return v25;
}

- (BOOL)canPlay
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  objc_msgSend_existingAssetWithID_(self, a2, (uint64_t)CFSTR("FMSongBundleAssetID"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localURL(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  return v10;
}

@end
