@implementation CEKLightingEffectManager

+ (id)ciFilterNameForLightingType:(int64_t)a3 version:(int64_t)a4
{
  __CFString *v4;

  if ((unint64_t)(a3 - 2) > 4)
    v4 = 0;
  else
    v4 = off_1E70A57A0[a3 - 2];
  if (a4 == 2)
  {
    if (a3 != 6)
    {
      -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("V2"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (!a4)
  {
    v4 = 0;
  }
  return v4;
}

+ (id)filtersForLightingType:(int64_t)a3 applyDepthEffect:(BOOL)a4 version:(int64_t)a5
{
  _BOOL4 v6;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
    objc_msgSend(v9, "addObject:", CFSTR("CIDepthEffect"));
  objc_msgSend(a1, "ciFilterNameForLightingType:version:", a3, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v10, "addObject:", v11);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __76__CEKLightingEffectManager_filtersForLightingType_applyDepthEffect_version___block_invoke;
  v18 = &unk_1E70A5020;
  v20 = &v21;
  v12 = v10;
  v19 = v12;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v15);
  v13 = (void *)objc_msgSend((id)v22[5], "copy", v15, v16, v17, v18);

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __76__CEKLightingEffectManager_filtersForLightingType_applyDepthEffect_version___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v4, "addObject:", v8);
    v3 = v8;
  }

}

+ (int64_t)ciLightingTypeForFilterName:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("V2"), &stru_1E70A5BC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CIPortraitEffectStudio")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CIPortraitEffectContour")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CIPortraitEffectStage")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CIPortraitEffectStageMono")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CIPortraitEffectStageWhite")) & 1) != 0)
  {
    v4 = 6;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CIDepthEffect"));
  }

  return v4;
}

+ (id)displayNameForLightingType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  CEKLocalizedFrameworkString(off_1E70A57C8[a3 - 1], 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)aggdNameForLightingType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return off_1E70A57F8[a3 - 1];
}

+ (id)displayImageForLightingType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 1:
      v3 = (void *)MEMORY[0x1E0DC3870];
      CEKFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("CEKLightingEffectNatural");
      goto LABEL_8;
    case 2:
    case 6:
      v3 = (void *)MEMORY[0x1E0DC3870];
      CEKFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("CEKLightingEffectStudio");
      goto LABEL_8;
    case 3:
      v3 = (void *)MEMORY[0x1E0DC3870];
      CEKFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("CEKLightingEffectContour");
      goto LABEL_8;
    case 4:
      v3 = (void *)MEMORY[0x1E0DC3870];
      CEKFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("CEKLightingEffectStage");
      goto LABEL_8;
    case 5:
      v3 = (void *)MEMORY[0x1E0DC3870];
      CEKFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("CEKLightingEffectStageMono");
LABEL_8:
      objc_msgSend(v3, "imageNamed:inBundle:", v5, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)portraitOriginalPhotoFilters
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIPortraitEffectLight"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
