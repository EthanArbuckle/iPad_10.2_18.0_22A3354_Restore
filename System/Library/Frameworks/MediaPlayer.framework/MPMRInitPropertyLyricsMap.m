@implementation MPMRInitPropertyLyricsMap

id ___MPMRInitPropertyLyricsMap_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "lyrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lyrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v2, "deviceSpecificUserInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lrcsGzpData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      MSVGzipDecompressData();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
      else
        v4 = 0;

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

@end
