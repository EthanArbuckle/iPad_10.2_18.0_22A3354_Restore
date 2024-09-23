@implementation ISSymbol

+ (id)symbolForURL:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ISSymbol *v9;

  v3 = a3;
  if (objc_msgSend(v3, "__is_isApplication"))
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithURL:allowPlaceholder:error:", v3, 1, 0);
  }
  else
  {
    if (!objc_msgSend(v3, "__is_isAppExtension"))
    {
      v5 = 0;
LABEL_10:
      objc_msgSend(v3, "__is_typeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[ISSymbol symbolForType:](ISSymbol, "symbolForType:", v7);
      v9 = (ISSymbol *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithURL:error:", v3, 0);
  }
  v5 = (void *)v4;
  if (!v4)
    goto LABEL_10;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_10;
  objc_msgSend(v5, "iconDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_IF_stringForKey:", 0x1E5802AF8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_10;
  objc_msgSend(v5, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IFSymbol initWithSymbolName:bundleURL:]([ISSymbol alloc], "initWithSymbolName:bundleURL:", v7, v8);

LABEL_11:
  return v9;
}

+ (id)symbolForType:(id)a3
{
  id v4;
  ISSymbol *v5;
  id v6;
  NSObject *v7;
  id v9;

  v4 = a3;
  if (!v4)
    v4 = (id)*MEMORY[0x1E0CA5BA0];
  v9 = 0;
  objc_msgSend(a1, "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v4, 0, 1, &v9);
  v5 = (ISSymbol *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (!v5)
  {
    _ISDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ISSymbol symbolForType:].cold.1((uint64_t)v4, v6, v7);

    v5 = -[IFSymbol initWithSymbolName:bundleURL:]([ISSymbol alloc], "initWithSymbolName:bundleURL:", CFSTR("questionmark.square"), 0);
  }

  return v5;
}

+ (id)symbolForTypeIdentifier:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", a3, 0, 1, a4);
}

+ (id)symbolForTypeIdentifier:(id)a3 withResolutionStrategy:(int64_t)a4 variantOptions:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  ISSymbol *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (v10)
  {
    objc_msgSend(a1, "_generateVariantKeyFromOptions:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    switch(a4)
    {
      case 0:
        objc_msgSend(v12, "_IS_symbolProvidingRecordWithVariantKey:allowNonVariantMatch:", v11, 0);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 1:
        objc_msgSend(v12, "_IS_symbolProvidingRecordWithVariantKey:allowNonVariantMatch:preferHeroOverBaseSymbol:", v11, 0, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v18;
        if (v11)
          goto LABEL_14;
        objc_msgSend(v18, "_IS_symbolHeroName");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
          goto LABEL_18;
        goto LABEL_17;
      case 2:
        objc_msgSend(v12, "_IS_symbolProvidingRecordWithVariantKey:allowNonVariantMatch:", v11, 1);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 3:
        v14 = v12;
LABEL_13:
        v17 = v14;
        if (!v11)
          goto LABEL_18;
LABEL_14:
        objc_msgSend(v17, "_IS_symbolNameForVariantKey:", v11);
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      case 4:
        v20 = v12;
LABEL_16:
        v17 = v20;
        objc_msgSend(v20, "_IS_symbolNameForVariantKey:", v11);
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
LABEL_17:
          v22 = (void *)v19;
LABEL_20:
          if ((objc_msgSend(v17, "isCoreType") & 1) != 0)
          {
            v23 = 0;
          }
          else
          {
            objc_msgSend(v17, "iconResourceBundleURL");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v16 = -[IFSymbol initWithSymbolName:bundleURL:]([ISSymbol alloc], "initWithSymbolName:bundleURL:", v22, v23);

          goto LABEL_26;
        }
LABEL_18:
        objc_msgSend(v17, "_IS_symbolName");
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v22 = (void *)v21;
        if (v21)
          goto LABEL_20;
LABEL_22:
        if (a6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to find symbol using type id: %@. Options: %lu, strategy: %ld"), v10, a5, a4, *MEMORY[0x1E0CB2D50]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.iconServices.symbol-error"), -1, v22);
          v16 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

          goto LABEL_27;
        }
        v16 = 0;
LABEL_27:

        break;
      default:
        v17 = 0;
        goto LABEL_22;
    }
    goto LABEL_28;
  }
  if (a6)
  {
    v28 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid type id"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.iconServices.symbol-error"), -2, v11);
    v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

    goto LABEL_29;
  }
  v16 = 0;
LABEL_29:

  return v16;
}

+ (id)_generateVariantKeyFromOptions:(unint64_t)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) != 0)
    return 0;
  if (_generateVariantKeyFromOptions__onceToken != -1)
    dispatch_once(&_generateVariantKeyFromOptions__onceToken, &__block_literal_global_14);
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)_generateVariantKeyFromOptions__orderedOptions;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v10, "unsignedIntegerValue", (_QWORD)v15) & a3) != 0)
        {
          objc_msgSend((id)_generateVariantKeyFromOptions__optionsToKeyPieces, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _ISDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[ISSymbol _generateVariantKeyFromOptions:].cold.1(v14);

    v12 = 0;
  }

  return v12;
}

void __43__ISSymbol__generateVariantKeyFromOptions___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[25];
  _QWORD v6[26];

  v6[25] = *MEMORY[0x1E0C80C00];
  v5[0] = &unk_1E58161B8;
  v5[1] = &unk_1E58161D0;
  v6[0] = CFSTR("fill");
  v6[1] = CFSTR("landscape");
  v5[2] = &unk_1E58161E8;
  v5[3] = &unk_1E5816200;
  v6[2] = CFSTR("slash");
  v6[3] = CFSTR("radio_leftright");
  v5[4] = &unk_1E5816218;
  v5[5] = &unk_1E5816230;
  v6[4] = CFSTR("apps");
  v6[5] = CFSTR("righttoleft");
  v5[6] = &unk_1E5816248;
  v5[7] = &unk_1E5816260;
  v6[6] = CFSTR("badge_play");
  v6[7] = CFSTR("badge_plus");
  v5[8] = &unk_1E5816278;
  v5[9] = &unk_1E5816290;
  v6[8] = CFSTR("arrow_forward");
  v6[9] = CFSTR("arrow_turnupforward");
  v5[10] = &unk_1E58162A8;
  v5[11] = &unk_1E58162C0;
  v6[10] = CFSTR("lock_locked");
  v6[11] = CFSTR("lock_unlocked");
  v5[12] = &unk_1E58162D8;
  v5[13] = &unk_1E58162F0;
  v6[12] = CFSTR("camerarear");
  v6[13] = CFSTR("sideright");
  v5[14] = &unk_1E5816308;
  v5[15] = &unk_1E5816320;
  v6[14] = CFSTR("exclamationmark");
  v6[15] = CFSTR("figurerun");
  v5[16] = &unk_1E5816338;
  v5[17] = &unk_1E5816350;
  v6[16] = CFSTR("watchface");
  v6[17] = CFSTR("left");
  v5[18] = &unk_1E5816368;
  v5[19] = &unk_1E5816380;
  v6[18] = CFSTR("right");
  v6[19] = CFSTR("chargingcase");
  v5[20] = &unk_1E5816398;
  v5[21] = &unk_1E58163B0;
  v6[20] = CFSTR("radio_forward");
  v6[21] = CFSTR("homepod");
  v5[22] = &unk_1E58163C8;
  v5[23] = &unk_1E58163E0;
  v6[22] = CFSTR("homepodmini");
  v6[23] = CFSTR("appletv");
  v5[24] = &unk_1E58163F8;
  v6[24] = CFSTR("laptop");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 25);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_generateVariantKeyFromOptions__optionsToKeyPieces;
  _generateVariantKeyFromOptions__optionsToKeyPieces = v0;

  objc_msgSend((id)_generateVariantKeyFromOptions__optionsToKeyPieces, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_generateVariantKeyFromOptions__orderedOptions;
  _generateVariantKeyFromOptions__orderedOptions = v3;

}

+ (void)symbolForType:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1AA928000, a3, OS_LOG_TYPE_ERROR, "Failed to find symbol with type %@. Error: %@.", (uint8_t *)&v6, 0x16u);

}

+ (void)_generateVariantKeyFromOptions:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AA928000, log, OS_LOG_TYPE_ERROR, "Unknown variant option", v1, 2u);
}

@end
