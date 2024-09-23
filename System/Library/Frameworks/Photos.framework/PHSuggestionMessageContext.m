@implementation PHSuggestionMessageContext

- (PHSuggestionMessageContext)initWithMessages:(id)a3 participantsFromContacts:(id)a4 photoLibrary:(id)a5
{
  id v9;
  id v10;
  PHSuggestionMessageContext *v11;
  PHSuggestionMessageContext *v12;
  uint64_t v13;
  NSMutableDictionary *suggestionMatchingResultsBySuggestionIdentifier;

  v9 = a4;
  v10 = a5;
  v11 = -[PHSuggestionMessageContext initWithMessages:](self, "initWithMessages:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a5);
    objc_storeStrong((id *)&v12->_cnParticipants, a4);
    v12->_numberOfParticipants = objc_msgSend(v9, "count");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    suggestionMatchingResultsBySuggestionIdentifier = v12->_suggestionMatchingResultsBySuggestionIdentifier;
    v12->_suggestionMatchingResultsBySuggestionIdentifier = (NSMutableDictionary *)v13;

  }
  return v12;
}

- (PHSuggestionMessageContext)initWithMessages:(id)a3
{
  id v4;
  PHSuggestionMessageContext *v5;
  uint64_t v6;
  NSArray *messages;
  NSArray *messageTokens;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDateInterval *dateInterval;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHSuggestionMessageContext;
  v5 = -[PHSuggestionMessageContext init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    messages = v5->_messages;
    v5->_messages = (NSArray *)v6;

    messageTokens = v5->_messageTokens;
    v5->_messageTokens = 0;

    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71900], "dateIntervalsFromMessage:onDate:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "firstObject");
      v12 = objc_claimAutoreleasedReturnValue();
      dateInterval = v5->_dateInterval;
      v5->_dateInterval = (NSDateInterval *)v12;
    }
    else
    {
      dateInterval = v5->_dateInterval;
      v5->_dateInterval = 0;
    }

  }
  return v5;
}

- (PHSuggestionMessageContext)initWithMessages:(id)a3 participantsFromPersons:(id)a4 photoLibrary:(id)a5
{
  id v9;
  id v10;
  PHSuggestionMessageContext *v11;
  PHSuggestionMessageContext *v12;
  uint64_t v13;
  NSMutableDictionary *suggestionMatchingResultsBySuggestionIdentifier;

  v9 = a4;
  v10 = a5;
  v11 = -[PHSuggestionMessageContext initWithMessages:](self, "initWithMessages:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a5);
    objc_storeStrong((id *)&v12->_phParticipants, a4);
    v12->_numberOfParticipants = objc_msgSend(v9, "count");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    suggestionMatchingResultsBySuggestionIdentifier = v12->_suggestionMatchingResultsBySuggestionIdentifier;
    v12->_suggestionMatchingResultsBySuggestionIdentifier = (NSMutableDictionary *)v13;

  }
  return v12;
}

- (void)setCnParticipants:(id)a3
{
  NSArray *resolvedParticipants;
  id v6;

  objc_storeStrong((id *)&self->_cnParticipants, a3);
  v6 = a3;
  resolvedParticipants = self->_resolvedParticipants;
  self->_resolvedParticipants = 0;

}

- (void)setPhParticipants:(id)a3
{
  NSArray *resolvedParticipants;
  id v6;

  objc_storeStrong((id *)&self->_phParticipants, a3);
  v6 = a3;
  resolvedParticipants = self->_resolvedParticipants;
  self->_resolvedParticipants = 0;

}

- (NSArray)resolvedParticipants
{
  NSArray *resolvedParticipants;
  NSArray *v4;
  NSArray *v5;
  NSArray *cnParticipants;
  void *v7;
  uint64_t v8;
  PHManualFetchResult *v9;
  PHPhotoLibrary *photoLibrary;
  NSArray *v11;
  NSArray *v12;

  resolvedParticipants = self->_resolvedParticipants;
  if (!resolvedParticipants)
  {
    if (-[NSArray count](self->_phParticipants, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_phParticipants);
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v5 = self->_resolvedParticipants;
      self->_resolvedParticipants = v4;
    }
    else
    {
      if (-[NSArray count](self->_cnParticipants, "count"))
      {
        cnParticipants = self->_cnParticipants;
        -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHPerson fetchPersonsForContacts:options:](PHPerson, "fetchPersonsForContacts:options:", cnParticipants, v7);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = [PHManualFetchResult alloc];
        photoLibrary = self->_photoLibrary;
        +[PHPerson fetchType](PHPerson, "fetchType");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v9, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", MEMORY[0x1E0C9AA60], photoLibrary, v7, 0, 0, 0);
      }
      v5 = (NSArray *)v8;

      -[NSArray fetchedObjects](v5, "fetchedObjects");
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v12 = self->_resolvedParticipants;
      self->_resolvedParticipants = v11;

    }
    resolvedParticipants = self->_resolvedParticipants;
  }
  return resolvedParticipants;
}

- (NSArray)messageTokens
{
  NSArray *messageTokens;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  messageTokens = self->_messageTokens;
  if (!messageTokens)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_messages;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)MEMORY[0x1E0D71900];
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "lowercaseString", (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "tokensFromString:options:", v11, 14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "addObjectsFromArray:", v12);
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = self->_messageTokens;
    self->_messageTokens = v13;

    messageTokens = self->_messageTokens;
  }
  return messageTokens;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PHSuggestionMessageContext;
  -[PHSuggestionMessageContext description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PHSuggestionMessageContext numberOfParticipants](self, "numberOfParticipants");
  -[NSArray componentsJoinedByString:](self->_messages, "componentsJoinedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Participants=%lu, messages=%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)detailedDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDateInterval *dateInterval;
  void *v14;
  void *v15;
  void *v16;
  NSDateInterval *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[PHSuggestionMessageContext _suggestionsMatchingType:](self, "_suggestionsMatchingType:", 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSuggestionMessageContext _suggestionsMatchingType:](self, "_suggestionsMatchingType:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSuggestionMessageContext _suggestionsMatchingType:](self, "_suggestionsMatchingType:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%lu"), -[PHSuggestionMessageContext numberOfParticipants](self, "numberOfParticipants"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PHSuggestionMessageContext resolvedParticipants](self, "resolvedParticipants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "localIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(" %@ (%@)"), v11, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  v19 = (void *)MEMORY[0x1E0CB3940];
  -[NSArray componentsJoinedByString:](self->_messages, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  dateInterval = self->_dateInterval;
  if (!dateInterval)
    dateInterval = (NSDateInterval *)CFSTR("None");
  v18 = dateInterval;
  -[PHSuggestionMessageContext messageTokens](self, "messageTokens");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(" "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("Message Context:\n\tParticipants: %@\n\tMessages: %@\n\tTime constraint: %@\n\tTokens:%@\n\tSuggestions: %lu\n\tSuggestions matching time constraints: %lu\n\tSuggestions matching message: %lu\n\tSuggestions matching participants: %lu"), v3, v12, v18, v15, self->_suggestionMatchingResultsBySuggestionIdentifier, objc_msgSend(v22, "count"), objc_msgSend(v21, "count"), objc_msgSend(v20, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_suggestionsMatchingType:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_suggestionMatchingResultsBySuggestionIdentifier, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "scoreForSuggestionMatchingType:", a3);
        if (v12 != 0.0)
        {
          objc_msgSend(v11, "suggestion");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)matchWithSuggestions:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *suggestionMatchingResultsBySuggestionIdentifier;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_suggestionMatchingResultsBySuggestionIdentifier;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  suggestionMatchingResultsBySuggestionIdentifier = self->_suggestionMatchingResultsBySuggestionIdentifier;
  self->_suggestionMatchingResultsBySuggestionIdentifier = v6;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "localIdentifier", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_suggestionMatchingResultsBySuggestionIdentifier, "setObject:forKeyedSubscript:", v15, v14);
        }
        else
        {
          -[PHSuggestionMessageContext matchingResultWithSuggestion:](self, "matchingResultWithSuggestion:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_suggestionMatchingResultsBySuggestionIdentifier, "setObject:forKeyedSubscript:", v16, v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (id)matchingResultWithSuggestion:(id)a3
{
  id v4;
  NSDateInterval *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t numberOfParticipants;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  double v49;
  unint64_t v50;
  NSObject *v51;
  void *v52;
  void *v54;
  void *v55;
  NSDateInterval *v56;
  id v57;
  id obj;
  void *v59;
  void *v60;
  PHSuggestionMessageMatchingResult *v61;
  PHSuggestionMessageContext *v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  id v84;
  __int16 v85;
  void *v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61 = -[PHSuggestionMessageMatchingResult initWithSuggestion:messageContext:]([PHSuggestionMessageMatchingResult alloc], "initWithSuggestion:messageContext:", v4, self);
  v5 = self->_dateInterval;
  if (v5)
  {
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v6, v7);
    if (-[NSDateInterval intersectsDateInterval:](v5, "intersectsDateInterval:", v8))
      -[PHSuggestionMessageMatchingResult registerMatchingType:weight:](v61, "registerMatchingType:weight:", 3, 1.0);

  }
  objc_msgSend(v4, "featuresProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("features"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_opt_new();
    numberOfParticipants = self->_numberOfParticipants;
    if (numberOfParticipants | -[NSArray count](self->_messages, "count"))
    {
      v62 = self;
      v55 = v9;
      v56 = v5;
      v57 = v4;
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v54 = v10;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v78 != v15)
              objc_enumerationMutation(v12);
            +[PHTextFeature textFeatureWithData:](PHTextFeature, "textFeatureWithData:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17)
            {
              PLPhotoKitGetLog();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v84 = v4;
                _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "Failure reading text features from data for suggestion %@", buf, 0xCu);
              }
              goto LABEL_18;
            }
            objc_msgSend(v60, "addObject:", v17);
            if (numberOfParticipants && objc_msgSend(v17, "type") == 1)
            {
              objc_msgSend(v17, "string");
              v18 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "addObject:", v18);
LABEL_18:

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
        }
        while (v14);
      }

      if (numberOfParticipants && objc_msgSend(v59, "count"))
      {
        -[PHSuggestionMessageContext resolvedParticipants](v62, "resolvedParticipants");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v74;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v74 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
              objc_msgSend(v24, "localIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "lowercaseString");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v59, "containsObject:", v26);

              if (v27)
              {
                PLPhotoKitGetLog();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v24, "localIdentifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "localIdentifier");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v84 = v29;
                  v85 = 2112;
                  v86 = v30;
                  _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_DEFAULT, "PHSuggestionMessageContext: Matched participant %@ between message context and suggestion %@", buf, 0x16u);

                }
                -[PHSuggestionMessageMatchingResult registerMatchingType:weight:](v61, "registerMatchingType:weight:", 1, 1.0);
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
          }
          while (v21);
        }

      }
      -[PHSuggestionMessageContext messageTokens](v62, "messageTokens");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      obj = v60;
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      if (v64)
      {
        v63 = *(_QWORD *)v70;
        do
        {
          for (k = 0; k != v64; ++k)
          {
            if (*(_QWORD *)v70 != v63)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * k), "string");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "componentsSeparatedByString:", CFSTR("_"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v36 = v34;
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
            if (v37)
            {
              v38 = v37;
              v39 = 0;
              v40 = *(_QWORD *)v66;
              do
              {
                for (m = 0; m != v38; ++m)
                {
                  if (*(_QWORD *)v66 != v40)
                    objc_enumerationMutation(v36);
                  v42 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * m);
                  if (objc_msgSend(v31, "containsObject:", v42))
                  {
                    objc_msgSend(v35, "addObject:", v42);
                    v43 = objc_msgSend(v42, "length");
                    if (v43 > v39)
                      v39 = v43;
                  }
                }
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
              }
              while (v38);
            }
            else
            {
              v39 = 0;
            }

            v44 = objc_msgSend(v35, "count");
            if (v44)
            {
              v45 = v44;
              v46 = objc_msgSend(v36, "count");
              if (v45 == v46)
              {
                PLPhotoKitGetLog();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v35, "componentsJoinedByString:", CFSTR(", "));
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v84 = v48;
                  v85 = 2112;
                  v86 = v33;
                  _os_log_impl(&dword_1991EC000, v47, OS_LOG_TYPE_DEFAULT, "PHSuggestionMessageContext: Matched message tokens [%@] between message context and suggestion text feature %@", buf, 0x16u);

                }
                v49 = 1.0;
              }
              else
              {
                if (v39 < 4)
                  goto LABEL_62;
                v50 = v46;
                PLPhotoKitGetLog();
                v51 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v35, "componentsJoinedByString:", CFSTR(", "));
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v84 = v52;
                  v85 = 2112;
                  v86 = v33;
                  _os_log_impl(&dword_1991EC000, v51, OS_LOG_TYPE_DEFAULT, "PHSuggestionMessageContext: Matched message tokens [%@] between message context and suggestion text feature %@", buf, 0x16u);

                }
                v49 = (double)v45 / (double)v50;
              }
              -[PHSuggestionMessageMatchingResult registerMatchingType:weight:](v61, "registerMatchingType:weight:", 2, v49);
            }
LABEL_62:

          }
          v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
        }
        while (v64);
      }

      v4 = v57;
      v9 = v55;
      v5 = v56;
      v10 = v54;
    }

  }
  return v61;
}

- (id)confidentMatchSuggestionUsingStrategy:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  double v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t j;
  void *v39;
  void *v40;
  double v41;
  double v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  double v47;
  double v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  double v64;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  _BOOL4 v71;
  void *v72;
  uint64_t v73;
  void *v75;
  void *v76;
  void *v77;
  PHSuggestionMessageContext *v78;
  NSObject *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint8_t v99[128];
  uint8_t buf[4];
  unint64_t v101;
  __int16 v102;
  double v103;
  __int16 v104;
  unint64_t v105;
  __int16 v106;
  _BOOL4 v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  PLPhotoKitGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PHSuggestionMessageContext suggestionMatchingResultsBySuggestionIdentifier](self, "suggestionMatchingResultsBySuggestionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v8 = -[PHSuggestionMessageContext numberOfParticipants](self, "numberOfParticipants");
    -[PHSuggestionMessageContext messages](self, "messages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218752;
    v101 = a3;
    v102 = 2048;
    v103 = *(double *)&v7;
    v104 = 2048;
    v105 = v8;
    v106 = 1024;
    v107 = objc_msgSend(v9, "count") != 0;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: Searching confident match suggestion using strategy %lu among %lu suggestions using message context (%lu participants, message string available: %d)", buf, 0x26u);

  }
  if (!-[NSMutableDictionary count](self->_suggestionMatchingResultsBySuggestionIdentifier, "count"))
  {
    PLPhotoKitGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: Error no suggestions are found", buf, 2u);
    }
    v26 = 0;
    goto LABEL_90;
  }
  -[NSMutableDictionary allValues](self->_suggestionMatchingResultsBySuggestionIdentifier, "allValues");
  v10 = objc_claimAutoreleasedReturnValue();
  -[PHSuggestionMessageContext dateInterval](self, "dateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v11;
  v78 = self;
  v79 = v10;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v15 = v10;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v94;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v94 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
          objc_msgSend(v20, "scoreForSuggestionMatchingType:", 3);
          if (v21 > 0.0)
          {
            objc_msgSend(v14, "addObject:", v20);
            objc_msgSend(v20, "suggestion");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v22);

          }
        }
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
      }
      while (v17);
    }

    v23 = objc_msgSend(v14, "count");
    if (!(a3 | v23))
    {
      PLPhotoKitGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v13;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: No result - NLP Date range is found and no suggestion is matching it", buf, 2u);
      }
      v26 = 0;
      v27 = v79;
      goto LABEL_89;
    }
    v25 = v13;
    if (v23)
    {
      v27 = v79;
      if (v23 == 1)
      {
        objc_msgSend(v14, "anyObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "suggestion");
        v26 = (id)objc_claimAutoreleasedReturnValue();

        PLPhotoKitGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v26, "localIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v101 = (unint64_t)v29;
          _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: found a matching suggestion (%@) - unique suggestion matching NLP Date Range", buf, 0xCu);

        }
        goto LABEL_89;
      }
      objc_msgSend(v13, "unionSet:", v14);
      PLPhotoKitGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = objc_msgSend(v14, "count");
        *(_DWORD *)buf = 134217984;
        v101 = v31;
        _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: filtering out the candidate set to the %lu suggestions matching NLP Date Range", buf, 0xCu);
      }

    }
  }
  else
  {
    v25 = -[NSObject mutableCopy](v10, "mutableCopy");
    v14 = v13;
  }
  v77 = v12;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v25 = v25;
  v33 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
  v80 = v25;
  if (!v33)
  {
    v14 = 0;
    v37 = 0.0;
    goto LABEL_50;
  }
  v34 = v33;
  v14 = 0;
  v35 = *(_QWORD *)v90;
  v36 = 0.0;
  v37 = 0.0;
  do
  {
    for (j = 0; j != v34; ++j)
    {
      if (*(_QWORD *)v90 != v35)
        objc_enumerationMutation(v25);
      v39 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
      objc_msgSend(v39, "suggestion");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "scoreForSuggestionMatchingType:", 2);
      if (v41 > 0.0)
      {
        v42 = v41;
        PLPhotoKitGetLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v40, "localIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v101 = (unint64_t)v44;
          v102 = 2048;
          v103 = v42;
          _os_log_impl(&dword_1991EC000, v43, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: suggestion %@ matching nlp context with score %f", buf, 0x16u);

          v25 = v80;
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "addObject:", v45);

        objc_msgSend(v84, "addObject:", v40);
        if (v42 > v37)
        {
          v46 = v40;

          v14 = v46;
          v37 = v42;
        }
      }
      objc_msgSend(v39, "scoreForSuggestionMatchingType:", 1);
      if (v47 > 0.0)
      {
        v48 = v47;
        PLPhotoKitGetLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v40, "localIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v101 = (unint64_t)v50;
          v102 = 2048;
          v103 = v48;
          _os_log_impl(&dword_1991EC000, v49, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: suggestion %@ matching participant with score %f", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "addObject:", v51);

        objc_msgSend(v83, "addObject:", v40);
        if (v48 <= v36)
        {
          if (v48 != v36)
            goto LABEL_46;
        }
        else
        {
          -[NSObject removeAllObjects](v32, "removeAllObjects");
          v36 = v48;
        }
        -[NSObject addObject:](v32, "addObject:", v40);
      }
LABEL_46:

    }
    v34 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
  }
  while (v34);
LABEL_50:

  v52 = objc_msgSend(v84, "count");
  v12 = v77;
  if (!v52)
  {
    v57 = objc_msgSend(v83, "count");
    v24 = v32;
    if (v57)
    {
      if (v57 == 1)
      {
        objc_msgSend(v83, "anyObject");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        PLPhotoKitGetLog();
        v54 = objc_claimAutoreleasedReturnValue();
        v27 = v79;
        if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          goto LABEL_87;
        objc_msgSend(v14, "localIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v101 = (unint64_t)v55;
        v56 = "Message sharing suggestion: found a matching suggestion (%@) - unique suggestion matching participants";
      }
      else
      {
        v27 = v79;
        if (-[PHSuggestionMessageContext numberOfParticipants](v78, "numberOfParticipants") >= 2)
        {
          v69 = -[NSObject count](v32, "count");
          PLPhotoKitGetLog();
          v70 = objc_claimAutoreleasedReturnValue();
          v71 = os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT);
          if (v69 == 1)
          {
            if (v71)
            {
              objc_msgSend(v14, "localIdentifier");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v101 = (unint64_t)v72;
              _os_log_impl(&dword_1991EC000, v70, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: found a matching suggestion (%@) - suggestion that matches the most participants in the group thread", buf, 0xCu);

            }
            -[NSObject anyObject](v32, "anyObject");
            v73 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v71)
            {
              objc_msgSend(v14, "localIdentifier");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v101 = (unint64_t)v75;
              _os_log_impl(&dword_1991EC000, v70, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: found a matching suggestion (%@) - suggestion that matches the most participants in the group thread and is the most recent", buf, 0xCu);

            }
            -[PHSuggestionMessageContext _mostRecentSuggestionFromSuggestions:](v78, "_mostRecentSuggestionFromSuggestions:", v32);
            v73 = objc_claimAutoreleasedReturnValue();
          }
          v26 = (id)v73;
          goto LABEL_88;
        }
        -[PHSuggestionMessageContext _mostRecentSuggestionFromSuggestions:](v78, "_mostRecentSuggestionFromSuggestions:", v83);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        PLPhotoKitGetLog();
        v54 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          goto LABEL_87;
        objc_msgSend(v26, "localIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v101 = (unint64_t)v55;
        v56 = "Message sharing suggestion: found a matching suggestion (%@) - most recent suggestion matching participants";
      }
    }
    else
    {
      v27 = v79;
      if (!v76)
      {
        v26 = 0;
        goto LABEL_88;
      }
      -[PHSuggestionMessageContext _mostRecentSuggestionFromSuggestions:](v78, "_mostRecentSuggestionFromSuggestions:", v77);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      PLPhotoKitGetLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        goto LABEL_87;
      objc_msgSend(v26, "localIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v101 = (unint64_t)v55;
      v56 = "Message sharing suggestion: found several matching suggestions matching NLP Date Range - returning the most recent one %@";
    }
LABEL_86:
    _os_log_impl(&dword_1991EC000, v54, OS_LOG_TYPE_DEFAULT, v56, buf, 0xCu);

    goto LABEL_87;
  }
  v53 = v52;
  if (v52 == 1)
  {
    objc_msgSend(v84, "anyObject");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    PLPhotoKitGetLog();
    v54 = objc_claimAutoreleasedReturnValue();
    v27 = v79;
    v24 = v32;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "localIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v101 = (unint64_t)v55;
      v56 = "Message sharing suggestion: found a matching suggestion (%@) - unique suggestion matching NLP Context";
      goto LABEL_86;
    }
LABEL_87:

  }
  else
  {
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v58 = v82;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
    v27 = v79;
    if (v59)
    {
      v60 = v59;
      v61 = 0;
      v62 = *(_QWORD *)v86;
      while (2)
      {
        for (k = 0; k != v60; ++k)
        {
          if (*(_QWORD *)v86 != v62)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * k), "doubleValue");
          if (v64 == v37)
          {
            if (v61)
              goto LABEL_72;
            v61 = 1;
          }
          else if (v37 < v64 + v64)
          {
LABEL_72:

            -[PHSuggestionMessageContext _mostRecentSuggestionFromSuggestions:](v78, "_mostRecentSuggestionFromSuggestions:", v84);
            v26 = (id)objc_claimAutoreleasedReturnValue();
            PLPhotoKitGetLog();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v26, "localIdentifier");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v101 = (unint64_t)v68;
              v102 = 2048;
              v103 = *(double *)&v53;
              _os_log_impl(&dword_1991EC000, v67, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: found a matching suggestion (%@) - most recent suggestion among the %lu suggestions matching NLP context", buf, 0x16u);

            }
            goto LABEL_75;
          }
        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
        if (v60)
          continue;
        break;
      }
    }

    PLPhotoKitGetLog();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "localIdentifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v101 = (unint64_t)v66;
      v102 = 2048;
      v103 = *(double *)&v53;
      _os_log_impl(&dword_1991EC000, v65, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: found a matching suggestion (%@) - outlier high score among %lu suggestions matching NLP context", buf, 0x16u);

    }
    v26 = v14;
LABEL_75:
    v25 = v80;
    v24 = v32;
  }
LABEL_88:

LABEL_89:
LABEL_90:

  return v26;
}

- (id)_mostRecentSuggestionFromSuggestions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "startDate", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "compare:", v5) >= 1)
        {
          v13 = v12;

          v14 = v11;
          v5 = v13;
          v4 = v14;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v4;
}

- (NSArray)messages
{
  return self->_messages;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setResolvedParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedParticipants, a3);
}

- (void)setMessageTokens:(id)a3
{
  objc_storeStrong((id *)&self->_messageTokens, a3);
}

- (unint64_t)numberOfParticipants
{
  return self->_numberOfParticipants;
}

- (NSArray)cnParticipants
{
  return self->_cnParticipants;
}

- (NSArray)phParticipants
{
  return self->_phParticipants;
}

- (NSMutableDictionary)suggestionMatchingResultsBySuggestionIdentifier
{
  return self->_suggestionMatchingResultsBySuggestionIdentifier;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_suggestionMatchingResultsBySuggestionIdentifier, 0);
  objc_storeStrong((id *)&self->_phParticipants, 0);
  objc_storeStrong((id *)&self->_cnParticipants, 0);
  objc_storeStrong((id *)&self->_messageTokens, 0);
  objc_storeStrong((id *)&self->_resolvedParticipants, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

@end
