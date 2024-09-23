@implementation HUServiceDetailsIdentifyHomePodItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D30D70];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "mediaProfileContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (((objc_msgSend(MEMORY[0x1E0D31530], "isHomePod:", v9) & 1) != 0
       || objc_msgSend(MEMORY[0x1E0D31530], "isHomePodMediaSystem:", v9))
      && objc_msgSend(v9, "hf_isReachable")
      && objc_msgSend(v9, "hasValidSettings"))
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsIdentifyHomePodButton"), CFSTR("HUServiceDetailsIdentifyHomePodButton"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsIdentifyHomePodFooter"), CFSTR("HUServiceDetailsIdentifyHomePodFooter"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30D18]);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("HUServiceDetailsIdentifyHomePodFooterResultKey"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v5);

    }
  }
  v12 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithResult:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
