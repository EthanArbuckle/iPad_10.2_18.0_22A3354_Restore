@implementation NSMutableDictionary(TextEffects)

- (void)ck_addTypingAttributeFontTrait:()TextEffects
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v5 = *MEMORY[0x1E0DC1138];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v6, "ck_fontByAddingSymbolicTrait:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, v5);

    v6 = v8;
  }

}

- (void)ck_removeTypingAttributeFontTrait:()TextEffects
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v5 = *MEMORY[0x1E0DC1138];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v6, "ck_fontByRemovingSymbolicTrait:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, v5);

    v6 = v8;
  }

}

- (uint64_t)ck_removeBoldItalicUnderlineAndStrikethroughTypingAttributes
{
  objc_msgSend(a1, "ck_removeTypingAttributeFontTrait:", 2);
  objc_msgSend(a1, "ck_removeTypingAttributeFontTrait:", 1);
  objc_msgSend(a1, "removeObjectForKey:", *MEMORY[0x1E0DC1248]);
  objc_msgSend(a1, "removeObjectForKey:", *MEMORY[0x1E0DC11A8]);
  objc_msgSend(a1, "removeObjectForKey:", *MEMORY[0x1E0D393E8]);
  objc_msgSend(a1, "removeObjectForKey:", *MEMORY[0x1E0D39420]);
  objc_msgSend(a1, "removeObjectForKey:", *MEMORY[0x1E0D39440]);
  return objc_msgSend(a1, "removeObjectForKey:", *MEMORY[0x1E0D39428]);
}

- (uint64_t)ck_removeTextAnimationsTypingAttributes
{
  objc_msgSend(a1, "removeObjectForKey:", *MEMORY[0x1E0DC11D0]);
  return objc_msgSend(a1, "removeObjectForKey:", *MEMORY[0x1E0D393F0]);
}

- (void)ck_toggleTextStyles:()TextEffects baseFont:
{
  id v6;

  v6 = a4;
  if ((a3 & 4) != 0)
  {
    objc_msgSend(a1, "_ck_toggleTextStyleUnderline");
    if ((a3 & 8) == 0)
    {
LABEL_3:
      if ((a3 & 1) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(a1, "_ck_toggleTextStyleBoldUsingBaseFont:", v6);
      if ((a3 & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(a1, "_ck_toggleTextStyleStrikethrough");
  if ((a3 & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((a3 & 2) != 0)
LABEL_5:
    objc_msgSend(a1, "_ck_toggleTextStyleItalicUsingBaseFont:", v6);
LABEL_6:

}

- (void)_ck_toggleTextStyleUnderline
{
  uint64_t v2;
  id v3;

  v2 = *MEMORY[0x1E0D39440];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0D39440]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "removeObjectForKey:", v2);
    objc_msgSend(a1, "removeObjectForKey:", *MEMORY[0x1E0DC1248]);
  }
  else
  {
    objc_msgSend(a1, "setObject:forKeyedSubscript:", &unk_1E2870678, v2);
    objc_msgSend(a1, "setObject:forKeyedSubscript:", &unk_1E2870690, *MEMORY[0x1E0DC1248]);
  }

}

- (void)_ck_toggleTextStyleStrikethrough
{
  uint64_t v2;
  id v3;

  v2 = *MEMORY[0x1E0D39428];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0D39428]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "removeObjectForKey:", v2);
    objc_msgSend(a1, "removeObjectForKey:", *MEMORY[0x1E0DC11A8]);
  }
  else
  {
    objc_msgSend(a1, "setObject:forKeyedSubscript:", &unk_1E2870678, v2);
    objc_msgSend(a1, "setObject:forKeyedSubscript:", &unk_1E2870690, *MEMORY[0x1E0DC11A8]);
  }

}

- (id)__ck_fontUsedWhenTogglingTypingAttributesUsingBaseFont:()TextEffects
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(a1, "___ck_typingAttributesFont");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

- (void)_ck_toggleTextStyleBoldUsingBaseFont:()TextEffects
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *MEMORY[0x1E0D393E8];
  v5 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "__ck_fontUsedWhenTogglingTypingAttributesUsingBaseFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(a1, "removeObjectForKey:", v4);
  else
    objc_msgSend(a1, "setObject:forKeyedSubscript:", &unk_1E2870678, v4);
  objc_msgSend(v6, "ck_fontBySettingBoldEnabled:", v8 == 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC1138]);

}

- (void)_ck_toggleTextStyleItalicUsingBaseFont:()TextEffects
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *MEMORY[0x1E0D39420];
  v5 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "__ck_fontUsedWhenTogglingTypingAttributesUsingBaseFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(a1, "removeObjectForKey:", v4);
  else
    objc_msgSend(a1, "setObject:forKeyedSubscript:", &unk_1E2870678, v4);
  objc_msgSend(v6, "ck_fontBySettingItalicEnabled:", v8 == 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC1138]);

}

- (uint64_t)ck_toggleTextEffect:()TextEffects
{
  if (objc_msgSend(a1, "ck_activeTextEffectFromTypingAttributes") == a3)
    return objc_msgSend(a1, "_ck_removeTextEffect");
  else
    return objc_msgSend(a1, "_ck_addTextEffect:", a3);
}

- (void)_ck_addTextEffect:()TextEffects
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    IMTextEffectNameFromType();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v8 = v5;
      objc_msgSend(MEMORY[0x1E0CEAF28], "animationWithName:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(a1, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0DC11D0]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D393F0]);

      }
      v5 = v8;
    }

  }
}

- (uint64_t)_ck_removeTextEffect
{
  objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0DC11D0]);
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D393F0]);
}

@end
