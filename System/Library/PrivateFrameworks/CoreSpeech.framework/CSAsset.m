@implementation CSAsset

uint64_t __44__CSAsset_RTModel___splitBlobsByPhraseType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("majorVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("majorVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  if (v7 > v9)
    goto LABEL_5;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("majorVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("majorVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntValue");

  if (v11 < v13)
  {
    v14 = 1;
    goto LABEL_6;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minorVersion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("minorVersion"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntValue");

  if (v16 > v18)
  {
LABEL_5:
    v14 = -1;
    goto LABEL_6;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minorVersion"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("minorVersion"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntValue");

  if (v21 < v23)
    v14 = 1;
  else
    v14 = -1;
LABEL_6:

  return v14;
}

void __58__CSAsset_RTModel__latestHearstRTModelWithRequestOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEngineMajorVersion:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEngineMinorVersion:", v7);

}

@end
