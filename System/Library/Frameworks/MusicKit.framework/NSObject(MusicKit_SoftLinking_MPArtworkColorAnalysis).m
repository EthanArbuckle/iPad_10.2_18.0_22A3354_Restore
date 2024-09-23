@implementation NSObject(MusicKit_SoftLinking_MPArtworkColorAnalysis)

- (id)_musicKit_self_artworkColorAnalysis
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPArtworkColorAnalysisClass_softClass;
  v9 = getMPArtworkColorAnalysisClass_softClass;
  if (!getMPArtworkColorAnalysisClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPArtworkColorAnalysisClass_block_invoke;
    v5[3] = &unk_24CD1CC68;
    v5[4] = &v6;
    __getMPArtworkColorAnalysisClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a1;
  else
    return 0;
}

- (uint64_t)musicKit_backgroundColor
{
  void *v1;
  id v2;
  uint64_t v3;

  objc_msgSend(a1, "_musicKit_self_artworkColorAnalysis");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "backgroundColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "CGColor");

  return v3;
}

- (uint64_t)musicKit_primaryTextColor
{
  void *v1;
  id v2;
  uint64_t v3;

  objc_msgSend(a1, "_musicKit_self_artworkColorAnalysis");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "primaryTextColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "CGColor");

  return v3;
}

- (uint64_t)musicKit_secondaryTextColor
{
  void *v1;
  id v2;
  uint64_t v3;

  objc_msgSend(a1, "_musicKit_self_artworkColorAnalysis");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "secondaryTextColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "CGColor");

  return v3;
}

- (uint64_t)musicKit_tertiaryTextColor
{
  void *v1;
  id v2;
  uint64_t v3;

  objc_msgSend(a1, "_musicKit_self_artworkColorAnalysis");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tertiaryTextColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "CGColor");

  return v3;
}

@end
