@implementation _DPPListHelper

+ (id)loadPropertyListFromPath:(id)a3 overridePath:(id)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[_DPDeviceInfo isInternalBuild](_DPDeviceInfo, "isInternalBuild"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v12);

  }
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __67___DPPListHelper_loadPropertyListFromPath_overridePath_usingBlock___block_invoke;
  v21 = &unk_1E95D9980;
  v22 = v13;
  v14 = v9;
  v23 = v14;
  v15 = v13;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &v18);
  v16 = (void *)objc_msgSend(v15, "copy", v18, v19, v20, v21);

  objc_autoreleasePoolPop(v10);
  return v16;
}

@end
