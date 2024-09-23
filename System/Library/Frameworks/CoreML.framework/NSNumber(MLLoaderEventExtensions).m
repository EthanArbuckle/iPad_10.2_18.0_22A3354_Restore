@implementation NSNumber(MLLoaderEventExtensions)

+ (void)modelOriginNumberFromUserDefinedDictionary:()MLLoaderEventExtensions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;

  v3 = a3;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "count"))
    goto LABEL_32;
  if ((objc_msgSend(v5, "containsObject:", CFSTR("com.apple.createml.app.version")) & 1) == 0)
  {
    if ((objc_msgSend(v5, "containsObject:", CFSTR("com.apple.createml.version")) & 1) != 0)
    {
      v6 = &unk_1E3DA2248;
      goto LABEL_33;
    }
    if ((objc_msgSend(v5, "containsObject:", CFSTR("com.github.apple.turicreate.version")) & 1) != 0)
    {
      v6 = &unk_1E3DA2260;
      goto LABEL_33;
    }
    if ((objc_msgSend(v5, "containsObject:", CFSTR("com.apple.developer.machine-learning.models.version")) & 1) != 0)
    {
      v6 = &unk_1E3DA2278;
      goto LABEL_33;
    }
    if (objc_msgSend(v5, "containsObject:", CFSTR("com.github.apple.coremltools.source")))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.github.apple.coremltools.source"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsString:", CFSTR("keras"));

      if ((v8 & 1) != 0)
      {
        v6 = &unk_1E3DA2290;
        goto LABEL_33;
      }
    }
    if (objc_msgSend(v5, "containsObject:", CFSTR("com.github.apple.coremltools.source")))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.github.apple.coremltools.source"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsString:", CFSTR("torch"));

      if ((v10 & 1) != 0)
      {
        v6 = &unk_1E3DA22A8;
        goto LABEL_33;
      }
    }
    if (objc_msgSend(v5, "containsObject:", CFSTR("com.github.apple.coremltools.source")))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.github.apple.coremltools.source"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsString:", CFSTR("tensorflow"));

      if ((v12 & 1) != 0)
      {
        v6 = &unk_1E3DA22C0;
        goto LABEL_33;
      }
    }
    if (objc_msgSend(v5, "containsObject:", CFSTR("com.github.apple.coremltools.source")))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.github.apple.coremltools.source"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsString:", CFSTR("onnx"));

      if ((v14 & 1) != 0)
      {
        v6 = &unk_1E3DA22D8;
        goto LABEL_33;
      }
    }
    if (objc_msgSend(v5, "containsObject:", CFSTR("com.github.apple.coremltools.source")))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.github.apple.coremltools.source"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsString:", CFSTR("scikit-learn"));

      if ((v16 & 1) != 0)
      {
        v6 = &unk_1E3DA22F0;
        goto LABEL_33;
      }
    }
    if (objc_msgSend(v5, "containsObject:", CFSTR("com.github.apple.coremltools.source")))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.github.apple.coremltools.source"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsString:", CFSTR("xgboost"));

      if ((v18 & 1) != 0)
      {
        v6 = &unk_1E3DA2308;
        goto LABEL_33;
      }
    }
    if (objc_msgSend(v5, "containsObject:", CFSTR("com.github.apple.coremltools.source")))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.github.apple.coremltools.source"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "containsString:", CFSTR("libsvm"));

      if ((v20 & 1) != 0)
      {
        v6 = &unk_1E3DA2320;
        goto LABEL_33;
      }
    }
LABEL_32:
    v6 = &unk_1E3DA2218;
    goto LABEL_33;
  }
  v6 = &unk_1E3DA2230;
LABEL_33:

  return v6;
}

@end
