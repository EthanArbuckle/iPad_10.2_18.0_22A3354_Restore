@implementation AFBundleResourceGetSoundMap

void ___AFBundleResourceGetSoundMap_block_invoke()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[13];
  _QWORD v16[15];

  v16[13] = *MEMORY[0x1E0C80C00];
  v15[0] = &unk_1E3AA59E0;
  v14 = +[AFBundleResource newWithBuilder:](AFBundleResource, "newWithBuilder:", &__block_literal_global_71);
  v16[0] = v14;
  v15[1] = &unk_1E3AA59F8;
  v13 = +[AFBundleResource newWithBuilder:](AFBundleResource, "newWithBuilder:", &__block_literal_global_78);
  v16[1] = v13;
  v15[2] = &unk_1E3AA5A10;
  v12 = +[AFBundleResource newWithBuilder:](AFBundleResource, "newWithBuilder:", &__block_literal_global_83);
  v16[2] = v12;
  v15[3] = &unk_1E3AA5A28;
  v0 = +[AFBundleResource newWithBuilder:](AFBundleResource, "newWithBuilder:", &__block_literal_global_88);
  v16[3] = v0;
  v15[4] = &unk_1E3AA5A40;
  v1 = +[AFBundleResource newWithBuilder:](AFBundleResource, "newWithBuilder:", &__block_literal_global_95);
  v16[4] = v1;
  v15[5] = &unk_1E3AA5A58;
  v2 = +[AFBundleResource newWithBuilder:](AFBundleResource, "newWithBuilder:", &__block_literal_global_100);
  v16[5] = v2;
  v15[6] = &unk_1E3AA5A70;
  v3 = +[AFBundleResource newWithBuilder:](AFBundleResource, "newWithBuilder:", &__block_literal_global_105);
  v16[6] = v3;
  v15[7] = &unk_1E3AA5A88;
  v4 = +[AFBundleResource newWithBuilder:](AFBundleResource, "newWithBuilder:", &__block_literal_global_110);
  v16[7] = v4;
  v15[8] = &unk_1E3AA5AA0;
  v5 = +[AFBundleResource newWithBuilder:](AFBundleResource, "newWithBuilder:", &__block_literal_global_115);
  v16[8] = v5;
  v15[9] = &unk_1E3AA5AB8;
  v6 = +[AFBundleResource newWithBuilder:](AFBundleResource, "newWithBuilder:", &__block_literal_global_120);
  v16[9] = v6;
  v15[10] = &unk_1E3AA5AD0;
  v7 = +[AFBundleResource newWithBuilder:](AFBundleResource, "newWithBuilder:", &__block_literal_global_125);
  v16[10] = v7;
  v15[11] = &unk_1E3AA5AE8;
  v8 = +[AFBundleResource newWithBuilder:](AFBundleResource, "newWithBuilder:", &__block_literal_global_130);
  v16[11] = v8;
  v15[12] = &unk_1E3AA5B00;
  v9 = +[AFBundleResource newWithBuilder:](AFBundleResource, "newWithBuilder:", &__block_literal_global_135);
  v16[12] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 13);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_AFBundleResourceGetSoundMap_map;
  _AFBundleResourceGetSoundMap_map = v10;

}

void ___AFBundleResourceGetSoundMap_block_invoke_134(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setName:", CFSTR("begin_sae_short"));
  objc_msgSend(v2, "setExtension:", CFSTR("caf"));

}

void ___AFBundleResourceGetSoundMap_block_invoke_129(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setName:", CFSTR("jbl_latency_sae"));
  objc_msgSend(v2, "setExtension:", CFSTR("caf"));

}

void ___AFBundleResourceGetSoundMap_block_invoke_124(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setName:", CFSTR("jbl_success_sae"));
  objc_msgSend(v2, "setExtension:", CFSTR("caf"));

}

void ___AFBundleResourceGetSoundMap_block_invoke_119(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setName:", CFSTR("jbl_begin_sae"));
  objc_msgSend(v2, "setExtension:", CFSTR("caf"));

}

void ___AFBundleResourceGetSoundMap_block_invoke_114(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setName:", CFSTR("attending-window-end"));
  objc_msgSend(v2, "setExtension:", CFSTR("wav"));

}

void ___AFBundleResourceGetSoundMap_block_invoke_109(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setName:", CFSTR("interstitial-delay-tone"));
  objc_msgSend(v2, "setExtension:", CFSTR("wav"));

}

void ___AFBundleResourceGetSoundMap_block_invoke_104(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setName:", CFSTR("announce-messages-tone-carplay"));
  objc_msgSend(v2, "setExtension:", CFSTR("wav"));

}

void ___AFBundleResourceGetSoundMap_block_invoke_99(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setName:", CFSTR("home-announcement-received"));
  objc_msgSend(v2, "setExtension:", CFSTR("wav"));

}

void ___AFBundleResourceGetSoundMap_block_invoke_94(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setName:", CFSTR("home-announcement-recording-begin"));
  objc_msgSend(v2, "setExtension:", CFSTR("caf"));

}

void ___AFBundleResourceGetSoundMap_block_invoke_87(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setName:", CFSTR("announce-messages-tone"));
  objc_msgSend(v2, "setExtension:", CFSTR("wav"));

}

void ___AFBundleResourceGetSoundMap_block_invoke_82(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setName:", CFSTR("dt-cancel"));
  objc_msgSend(v2, "setExtension:", CFSTR("caf"));

}

void ___AFBundleResourceGetSoundMap_block_invoke_77(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setName:", CFSTR("dt-confirm"));
  objc_msgSend(v2, "setExtension:", CFSTR("caf"));

}

void ___AFBundleResourceGetSoundMap_block_invoke_69(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setName:", CFSTR("dt-begin"));
  objc_msgSend(v2, "setExtension:", CFSTR("caf"));

}

@end
