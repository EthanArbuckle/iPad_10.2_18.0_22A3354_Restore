@implementation HMFActivity(HMMTaggedLogging)

- (id)tagProcessorList
{
  id v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1172;
  v8 = __Block_byref_object_dispose__1173;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__HMFActivity_HMMTaggedLogging__tagProcessorList__block_invoke;
  v3[3] = &unk_1E898A760;
  v3[4] = a1;
  v3[5] = &v4;
  objc_msgSend(a1, "synchronizeWithActivityLock:", v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

+ (id)currentTagProcessorList
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D28540], "_currentActivity");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "tagProcessorList");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
