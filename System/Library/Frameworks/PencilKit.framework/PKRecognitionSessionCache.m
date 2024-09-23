@implementation PKRecognitionSessionCache

+ (id)recognitionSessionForUUID:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_opt_self();
  objc_opt_self();
  +[PKRecognitionSessionCache _recognitionSessions]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      -[PKRecognitionSessionManager cleanupSessionIfNecessary]((uint64_t)v6);
      objc_msgSend(v4, "nextObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }

  if (v2)
  {
    +[PKRecognitionSessionCache _recognitionSessions]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_recognitionSessions
{
  objc_opt_self();
  if (qword_1ECEE61A8 != -1)
    dispatch_once(&qword_1ECEE61A8, &__block_literal_global_28);
  return (id)_MergedGlobals_123;
}

+ (void)addRecognitionSession:(void *)a3 forUUID:
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  objc_opt_self();
  if (v6 && v4)
  {
    +[PKRecognitionSessionCache _recognitionSessions]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v4);

  }
}

void __49__PKRecognitionSessionCache__recognitionSessions__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_123;
  _MergedGlobals_123 = v0;

}

@end
