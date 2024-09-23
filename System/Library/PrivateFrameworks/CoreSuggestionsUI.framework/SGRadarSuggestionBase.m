@implementation SGRadarSuggestionBase

- (SGRadarSuggestionBase)initWithSourceMessageId:(id)a3
{
  id v5;
  SGRadarSuggestionBase *v6;
  SGRadarSuggestionBase *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGRadarSuggestionBase;
  v6 = -[SGRadarSuggestionBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sourceMessageId, a3);

  return v7;
}

- (id)suggestionTitle
{
  return CFSTR("Siri Found in Apps [Internal]");
}

- (id)suggestionSubtitle
{
  return CFSTR("An exception has occurred\nPlease file a radar for analysis");
}

- (id)suggestionsSecondTitle
{
  return &stru_1E62D74E0;
}

- (id)suggestionDismissAction
{
  return 0;
}

- (int64_t)suggestionActionButtonType
{
  void *v2;
  _BOOL4 v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 6;

  return 4 * v3;
}

- (id)suggestionCategoryId
{
  __CFString *v2;

  v2 = CFSTR("com.apple.suggestions.SGRadarSuggestion");
  return CFSTR("com.apple.suggestions.SGRadarSuggestion");
}

- (id)suggestionCategoryImage
{
  return 0;
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    v4 = CFSTR("1 radar");
  }
  else if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v4 = CFSTR("No radars");
  }
  else
  {
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tu radars"), objc_msgSend(v3, "count"));
  }

  return v4;
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    if (v4 == 1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestionTitle");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tu radars"), v4);
    }
  }
  else
  {
    v6 = &stru_1E62D74E0;
  }

  return v6;
}

- (id)suggestionCategoryTitle
{
  return CFSTR("Radars");
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  void *v3;
  __CFString *v4;

  if (objc_msgSend(a3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerMultipleSuggestionsTitleFormat"), &stru_1E62D74E0, 0);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1E62D74E0;
  }
  return v4;
}

- (id)realtimeSuggestion
{
  return 0;
}

- (id)primaryActionTitle
{
  if (_currentContext)
    return CFSTR("File a Radar");
  else
    return CFSTR("File");
}

- (SGSuggestionDelegate)suggestionDelegate
{
  return (SGSuggestionDelegate *)objc_loadWeakRetained((id *)&self->_suggestionDelegate);
}

- (void)setSuggestionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionDelegate);
  objc_storeStrong((id *)&self->_sourceMessageId, 0);
}

@end
