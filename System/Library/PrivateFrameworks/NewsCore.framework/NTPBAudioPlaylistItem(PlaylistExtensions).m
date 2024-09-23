@implementation NTPBAudioPlaylistItem(PlaylistExtensions)

+ (uint64_t)keyValuePairType
{
  return 16;
}

+ (uint64_t)readValueFromKeyValuePair:()PlaylistExtensions
{
  return objc_msgSend(a3, "audioPlaylistItem");
}

- (void)writeToKeyValuePair:()PlaylistExtensions
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  objc_msgSend(v4, "setAudioPlaylistItem:", a1);

}

- (id)order
{
  void *v2;

  if (objc_msgSend(a1, "hasListOrder"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a1, "listOrder"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)copyWithOrder:()PlaylistExtensions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "copy");
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setListOrder:", objc_msgSend(v4, "longLongValue"));
  }
  else
  {
    objc_msgSend(v5, "setListOrder:", 0);
    objc_msgSend(v6, "setHasListOrder:", 0);
  }

  return v6;
}

@end
