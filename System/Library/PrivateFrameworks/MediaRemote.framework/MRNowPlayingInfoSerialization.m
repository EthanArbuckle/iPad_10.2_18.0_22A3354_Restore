@implementation MRNowPlayingInfoSerialization

uint64_t ___MRNowPlayingInfoSerialization_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)_MRNowPlayingInfoSerialization___serialization;
  _MRNowPlayingInfoSerialization___serialization = v0;

  v2 = (void *)_MRNowPlayingInfoSerialization___serialization;
  _MRNowPlayingInfoDictionaryKeyToProtobufKeyMapping();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDictionaryKeyToProtobufKeyMapping:", v3);

  objc_msgSend((id)_MRNowPlayingInfoSerialization___serialization, "setProtobufClass:", objc_opt_class());
  objc_msgSend((id)_MRNowPlayingInfoSerialization___serialization, "setDictionaryValueToProtobufValueTransformer:", &__block_literal_global_217);
  return objc_msgSend((id)_MRNowPlayingInfoSerialization___serialization, "setProtobufValueToDictionaryValueTransformer:", &__block_literal_global_218);
}

id ___MRNowPlayingInfoSerialization_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("kMRMediaRemoteNowPlayingInfoStartTime"))
    || objc_msgSend(v5, "isEqualToString:", CFSTR("kMRMediaRemoteNowPlayingInfoTimestamp")))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v11 = (void *)v8;

    v6 = v11;
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("kMRMediaRemoteNowPlayingInfoRepeatMode"))
    || objc_msgSend(v5, "isEqualToString:", CFSTR("kMRMediaRemoteNowPlayingInfoShuffleMode")))
  {
    v9 = objc_msgSend(v6, "unsignedIntValue");
    if (v9 - 1 >= 3)
      v10 = 0;
    else
      v10 = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

id ___MRNowPlayingInfoSerialization_block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  NSStringFromSelector(sel_timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v17 = (void *)v10;

    v6 = v17;
    goto LABEL_10;
  }
  NSStringFromSelector(sel_repeatMode);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "isEqualToString:", v11);

  if (v12
    || (NSStringFromSelector(sel_shuffleMode),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v5, "isEqualToString:", v13),
        v13,
        v14))
  {
    v15 = objc_msgSend(v6, "unsignedIntValue");
    if (v15 - 1 >= 3)
      v16 = 0;
    else
      v16 = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

@end
