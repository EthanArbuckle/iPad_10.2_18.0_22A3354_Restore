@implementation BMEventClassForStreamIdentifier

void __BMEventClassForStreamIdentifier_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  BiomeLibraryAndInternalLibraryNode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamWithIdentifier:error:", *(_QWORD *)(a1 + 32), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v5;
  if (v5)
  {
    objc_msgSend(v5, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BMEventClassForStreamIdentifier_silentModeEventClass = objc_msgSend(v4, "eventClass");

    v3 = v5;
  }

}

void __BMEventClassForStreamIdentifier_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  BiomeLibraryAndInternalLibraryNode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamWithIdentifier:error:", *(_QWORD *)(a1 + 32), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v5;
  if (v5)
  {
    objc_msgSend(v5, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BMEventClassForStreamIdentifier_ambientMusicEventClass = objc_msgSend(v4, "eventClass");

    v3 = v5;
  }

}

@end
