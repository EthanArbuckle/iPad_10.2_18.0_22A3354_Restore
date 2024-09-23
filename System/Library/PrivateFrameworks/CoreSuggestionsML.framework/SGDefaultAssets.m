@implementation SGDefaultAssets

+ (id)filesystemPathForFilename:(id)a3
{
  return +[SGDefaultAssets _filesystemPathForFilename:isFault:](SGDefaultAssets, "_filesystemPathForFilename:isFault:", a3, 1);
}

+ (id)checkFilesystemPathForFilename:(id)a3
{
  return +[SGDefaultAssets _filesystemPathForFilename:isFault:](SGDefaultAssets, "_filesystemPathForFilename:isFault:", a3, 0);
}

+ (id)_filesystemPathForFilename:(id)a3 isFault:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v4 = a4;
  v7 = a3;
  objc_msgSend(v7, "stringByDeletingPathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathForResource:ofType:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGDefaultAssets.m"), 38, CFSTR("no path for filename %@"), v7);

  }
  return v11;
}

+ (id)quickResponsesPrediction
{
  return +[SGDefaultAssets dictionaryWithPlistFilename:](SGDefaultAssets, "dictionaryWithPlistFilename:", CFSTR("MLQuickResponsesPrediction"));
}

+ (id)quickResponsesPredictionVocab
{
  return 0;
}

+ (id)responseToRobotParams
{
  return +[SGDefaultAssets dictionaryWithPlistFilename:](SGDefaultAssets, "dictionaryWithPlistFilename:", CFSTR("RepliesToRobots"));
}

+ (id)dictionaryWithPlistFilename:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", v4, CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGDefaultAssets dictionaryWithPlistAssetPath:](SGDefaultAssets, "dictionaryWithPlistAssetPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)dictionaryWithPlistAssetPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v12 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", v3, 1, &v12);
    v5 = v12;
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v3;
        v15 = 2112;
        v16 = v5;
        _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error loading model plist %@: %@", buf, 0x16u);
      }
      v8 = 0;
      goto LABEL_17;
    }
    if ((unint64_t)objc_msgSend(v4, "length") >= 0x400
      && (objc_msgSend(MEMORY[0x24BE7A5F8], "dictionaryWithData:error:", v4, 0),
          (v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = (void *)v6;
    }
    else
    {
      v11 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 0, 0, &v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;

      if (v9)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v14 = v4;
          v15 = 2112;
          v16 = v9;
          _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error deserializing model plist %@: %@", buf, 0x16u);
        }
        v8 = 0;
        goto LABEL_16;
      }
      v5 = 0;
    }
    v8 = v7;
    v9 = v5;
    v7 = v8;
LABEL_16:

    v5 = v9;
LABEL_17:

    goto LABEL_18;
  }
  v8 = 0;
LABEL_18:

  return v8;
}

+ (id)vocabWithTrieAssetPath:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE79AF8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPath:", v4);

  return v5;
}

@end
