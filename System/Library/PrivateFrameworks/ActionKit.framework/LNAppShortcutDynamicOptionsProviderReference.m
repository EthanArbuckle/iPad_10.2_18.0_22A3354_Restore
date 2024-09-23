@implementation LNAppShortcutDynamicOptionsProviderReference

void __75__LNAppShortcutDynamicOptionsProviderReference_TopHits__appShortcutMapping__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x24BDAC8D0];
  v12[0] = &unk_24F93A358;
  v12[1] = &unk_24F93A370;
  v13[0] = CFSTR("WFStartCallActionCollectionIdentifierFavorites");
  v13[1] = CFSTR("WFStartCallActionCollectionIdentifierRecents");
  v14[0] = &unk_24F93A340;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v0;
  v14[1] = &unk_24F93A388;
  v10 = &unk_24F93A358;
  v11 = *MEMORY[0x24BEC1A38];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v1;
  v14[2] = &unk_24F93A3A0;
  v8 = &unk_24F93A358;
  v9 = *MEMORY[0x24BEC1A40];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v2;
  v14[3] = &unk_24F93A3B8;
  v6 = &unk_24F93A358;
  v7 = CFSTR("WFStartCallActionCollectionIdentifierFaceTimeRecents");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = &unk_24F93A3D0;
  v15[3] = v3;
  v15[4] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)appShortcutMapping_mapping;
  appShortcutMapping_mapping = v4;

}

@end
