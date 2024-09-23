@implementation WFDictateTextLanguagePickerParameter

+ (id)availableLocaleIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDE9E40], "supportedLocales");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_128_38092);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __66__WFDictateTextLanguagePickerParameter_availableLocaleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localeIdentifier");
}

- (id)defaultSerializedRepresentation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC40C8]), "initWithValue:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7));
        -[WFLocalePickerParameter possibleStates](self, "possibleStates");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v8);

        if ((v10 & 1) != 0)
        {
          objc_msgSend(v8, "serializedRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

@end
