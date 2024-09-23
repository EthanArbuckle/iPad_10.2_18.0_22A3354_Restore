@implementation MPCPlayerLanguageOptionGroup

- (MPCPlayerLanguageOptionGroup)initWithLanguageOptionGroups:(id)a3 currentLanguageOptions:(id)a4 response:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPCPlayerLanguageOptionGroup *v11;
  MPCPlayerLanguageOptionGroup *v12;
  uint64_t v13;
  NSArray *options;
  NSArray *v15;
  _QWORD v17[4];
  id v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPCPlayerLanguageOptionGroup;
  v11 = -[MPCPlayerLanguageOptionGroup init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_response, v10);
    v12->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
    v12->_allowEmptySelection = objc_msgSend(v8, "allowEmptySelection");
    objc_msgSend(v8, "languageOptions");
    v13 = objc_claimAutoreleasedReturnValue();
    options = v12->_options;
    v12->_options = (NSArray *)v13;

    v15 = v12->_options;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __93__MPCPlayerLanguageOptionGroup_initWithLanguageOptionGroups_currentLanguageOptions_response___block_invoke;
    v17[3] = &unk_24CAB94D0;
    v18 = v9;
    v12->_currentIndex = -[NSArray indexOfObjectPassingTest:](v15, "indexOfObjectPassingTest:", v17);

  }
  return v12;
}

- (NSString)localizedTitle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  -[NSArray firstObject](self->_options, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "languageOptionType");

  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("LANGUAGE_OPTIONS_SUBTITLE_SECTION_TITLE");
    goto LABEL_5;
  }
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("LANGUAGE_OPTIONS_AUDIO_SECTION_TITLE");
LABEL_5:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24CABB5D0, CFSTR("MediaPlaybackCore"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v2;
}

- (unint64_t)numberOfOptions
{
  return -[NSArray count](self->_options, "count") + self->_allowEmptySelection;
}

- (unint64_t)indexOfSelectedOption
{
  unint64_t currentIndex;
  _BOOL8 allowEmptySelection;
  unint64_t result;
  _BOOL4 v5;

  currentIndex = self->_currentIndex;
  allowEmptySelection = self->_allowEmptySelection;
  if (currentIndex != 0x7FFFFFFFFFFFFFFFLL)
    return currentIndex + allowEmptySelection;
  result = 0;
  v5 = allowEmptySelection;
  allowEmptySelection = 0;
  if (!v5)
    return currentIndex + allowEmptySelection;
  return result;
}

- (MPNowPlayingInfoLanguageOption)selectedOption
{
  if (self->_currentIndex == 0x7FFFFFFFFFFFFFFFLL)
    return (MPNowPlayingInfoLanguageOption *)0;
  -[NSArray objectAtIndexedSubscript:](self->_options, "objectAtIndexedSubscript:");
  return (MPNowPlayingInfoLanguageOption *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)localizedTitleForOptionAtIndex:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;

  if (a3 || !self->_allowEmptySelection)
  {
    -[NSArray objectAtIndexedSubscript:](self->_options, "objectAtIndexedSubscript:", a3 - self->_allowEmptySelection);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else if ((objc_msgSend(v3, "isAutomaticLegibleLanguageOption") & 1) != 0
           || objc_msgSend(v3, "isAutomaticAudibleLanguageOption"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LANGUAGE_OPTIONS_AUTO_SELECTION_TITLE"), &stru_24CABB5D0, CFSTR("MediaPlaybackCore"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    objc_msgSend(v3, "displayName");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LANGUAGE_OPTIONS_EMPTY_SELECTION_TITLE"), &stru_24CABB5D0, CFSTR("MediaPlaybackCore"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
LABEL_8:

  return v6;
}

- (id)changeRequestForOptionAtIndex:(unint64_t)a3
{
  _BOOL8 allowEmptySelection;
  NSArray *options;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  MPCPlayerCommandRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MPCPlayerCommandRequest *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  allowEmptySelection = self->_allowEmptySelection;
  options = self->_options;
  if (a3 || !allowEmptySelection)
  {
    -[NSArray objectAtIndexedSubscript:](options, "objectAtIndexedSubscript:", a3 - allowEmptySelection);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_currentIndex = a3 - self->_allowEmptySelection;
    v8 = 27;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](options, "objectAtIndexedSubscript:", self->_currentIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
    v8 = 28;
  }
  v9 = (void *)objc_msgSend(v7, "copyExternalRepresentation");
  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_response);
    v11 = [MPCPlayerCommandRequest alloc];
    v18 = *MEMORY[0x24BE65920];
    v19[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "controller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v11, "initWithMediaRemoteCommand:options:controller:label:", v8, v12, v13, v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSArray)options
{
  return self->_options;
}

- (BOOL)allowEmptySelection
{
  return self->_allowEmptySelection;
}

- (MPCPlayerResponse)response
{
  return (MPCPlayerResponse *)objc_loadWeakRetained((id *)&self->_response);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_response);
  objc_storeStrong((id *)&self->_options, 0);
}

uint64_t __93__MPCPlayerLanguageOptionGroup_initWithLanguageOptionGroups_currentLanguageOptions_response___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "isEqualToLanguageOption:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

@end
