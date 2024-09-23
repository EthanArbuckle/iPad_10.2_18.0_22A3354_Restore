@implementation CNAutocompleteCoreAnalyticsUsageMonitorProbe

- (CNAutocompleteCoreAnalyticsUsageMonitorProbe)init
{
  CNAutocompleteCoreAnalyticsUsageMonitorProbe *v2;
  uint64_t v3;
  NSMutableDictionary *coreAnalyticsDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNAutocompleteCoreAnalyticsUsageMonitorProbe;
  v2 = -[CNAutocompleteCoreAnalyticsUsageMonitorProbe init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    coreAnalyticsDictionary = v2->_coreAnalyticsDictionary;
    v2->_coreAnalyticsDictionary = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)sourceKeysForSourceType:(unint64_t)a3
{
  void *v4;
  void *v5;
  __CFString **v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a3 & 0x40) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("calendarServer"));
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("contacts"));
  if ((a3 & 8) == 0)
  {
LABEL_4:
    if ((a3 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  objc_msgSend(v5, "addObject:", CFSTR("directoryServer"));
  if ((a3 & 1) != 0)
LABEL_5:
    objc_msgSend(v5, "addObject:", CFSTR("recents"));
LABEL_6:
  if (+[CNAutocompleteResult isSourceTypeConsideredSuggestion:](CNAutocompleteResult, "isSourceTypeConsideredSuggestion:", a3))
  {
    v6 = CNAutocompleteProbeSourceTypeKeyPureSuggestion;
  }
  else
  {
    if ((a3 & 4) == 0)
    {
      if ((a3 & 0x20) != 0)
        goto LABEL_20;
LABEL_14:
      if ((a3 & 0x10) != 0)
        goto LABEL_21;
      goto LABEL_15;
    }
    v6 = CNAutocompleteProbeSourceTypeKeySuggestion;
  }
  objc_msgSend(v5, "addObject:", *v6);
  if ((a3 & 0x20) == 0)
    goto LABEL_14;
LABEL_20:
  objc_msgSend(v5, "addObject:", CFSTR("supplemental"));
  if ((a3 & 0x10) != 0)
  {
LABEL_21:
    objc_msgSend(v5, "addObject:", CFSTR("duetPromoted"));
    if ((a3 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_15:
  if ((a3 & 0x200) != 0)
LABEL_16:
    objc_msgSend(v5, "addObject:", CFSTR("stewie"));
LABEL_17:
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

- (void)recordUserSawResultsConsideredSuggestion:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](self, "coreAnalyticsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("prefixedPureSuggestionResultCount"));

}

- (void)recordUserSelectedIndex:(unint64_t)a3
{
  int64_t v4;
  id v5;

  if (a3 > 0x7FFFFFFFFFFFFFFELL)
    v4 = -1;
  else
    v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteCoreAnalyticsUsageMonitorProbe setSelectedIndex:](self, "setSelectedIndex:", v5);

}

- (void)recordDuetReturnedResults:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](self, "coreAnalyticsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("duetReturnedResults"));

}

- (void)recordUserTypedInNumberOfCharacters:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteCoreAnalyticsUsageMonitorProbe setLengthOfSearchString:](self, "setLengthOfSearchString:", v4);

}

- (void)recordUserSelectedPredictionAtIndex:(unint64_t)a3
{
  int64_t v4;
  id v5;

  if (a3 > 0x7FFFFFFFFFFFFFFELL)
    v4 = -1;
  else
    v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteCoreAnalyticsUsageMonitorProbe setSelectedPredictionIndex:](self, "setSelectedPredictionIndex:", v5);

}

- (void)recordUserSelectedResultWithSourceType:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteCoreAnalyticsUsageMonitorProbe setSourceType:](self, "setSourceType:", v4);

}

- (void)recordUserIgnoredPredictionAfterDelay:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](self, "coreAnalyticsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("predictionUserIgnoreDelay"));

}

- (void)recordUserIgnoredPrefixedResultAfterDelay:(double)a3 batch:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](self, "coreAnalyticsDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("prefixedUserIgnoreDelay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](self, "coreAnalyticsDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("prefixedUserIgnoreDelayBatch"));

}

- (void)sendData
{
  CNAutocompleteCoreAnalyticsUsageMonitorProbe *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CNAutocompleteCoreAnalyticsUsageMonitorProbe *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v2 = self;
  v42 = *MEMORY[0x1E0C80C00];
  -[CNAutocompleteCoreAnalyticsUsageMonitorProbe selectedIndex](self, "selectedIndex");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CNAutocompleteCoreAnalyticsUsageMonitorProbe sourceType](v2, "sourceType");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[CNAutocompleteCoreAnalyticsUsageMonitorProbe lengthOfSearchString](v2, "lengthOfSearchString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[CNAutocompleteCoreAnalyticsUsageMonitorProbe sourceType](v2, "sourceType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "unsignedIntegerValue");

        if (v9)
        {
          -[CNAutocompleteCoreAnalyticsUsageMonitorProbe selectedIndex](v2, "selectedIndex");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](v2, "coreAnalyticsDictionary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("selectedIndex"));

        }
        else
        {
          -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](v2, "coreAnalyticsDictionary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E70EFFA0, CFSTR("selectedIndex"));
        }

        -[CNAutocompleteCoreAnalyticsUsageMonitorProbe lengthOfSearchString](v2, "lengthOfSearchString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](v2, "coreAnalyticsDictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("stringLength"));

        -[CNAutocompleteCoreAnalyticsUsageMonitorProbe sourceType](v2, "sourceType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAutocompleteCoreAnalyticsUsageMonitorProbe sourceKeysForSourceType:](v2, "sourceKeysForSourceType:", objc_msgSend(v20, "unsignedIntegerValue"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v2;
        if (!objc_msgSend(v21, "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("unknown"));
          v23 = objc_claimAutoreleasedReturnValue();

          v21 = (void *)v23;
        }
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        obj = v21;
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v38 != v26)
                objc_enumerationMutation(obj);
              v28 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "isEqual:", CFSTR("duetPromoted"));
              -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](v22, "coreAnalyticsDictionary");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if (v28)
                v31 = &unk_1E70EFFB8;
              else
                v31 = &unk_1E70EFFD0;
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("promotedByDuet"));

            }
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          }
          while (v25);
        }

        v2 = v22;
        -[CNAutocompleteCoreAnalyticsUsageMonitorProbe bundleIdentifierOfCurrentProcess](v22, "bundleIdentifierOfCurrentProcess");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](v22, "coreAnalyticsDictionary");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("bundleId"));

        goto LABEL_23;
      }
    }
    else
    {

    }
  }
  -[CNAutocompleteCoreAnalyticsUsageMonitorProbe selectedPredictionIndex](v2, "selectedPredictionIndex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CNAutocompleteCoreAnalyticsUsageMonitorProbe selectedPredictionIndex](v2, "selectedPredictionIndex");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](v2, "coreAnalyticsDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("selectedPredictionIndex"));

    -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](v2, "coreAnalyticsDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E70EFFB8, CFSTR("promotedByDuet"));

    -[CNAutocompleteCoreAnalyticsUsageMonitorProbe bundleIdentifierOfCurrentProcess](v2, "bundleIdentifierOfCurrentProcess");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](v2, "coreAnalyticsDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("bundleId"));

  }
LABEL_23:
  -[CNAutocompleteCoreAnalyticsUsageMonitorProbe coreAnalyticsDictionary](v2, "coreAnalyticsDictionary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35)
    AnalyticsSendEventLazy();
}

uint64_t __56__CNAutocompleteCoreAnalyticsUsageMonitorProbe_sendData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "coreAnalyticsDictionary");
}

- (id)bundleIdentifierOfCurrentProcess
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__CNAutocompleteCoreAnalyticsUsageMonitorProbe_bundleIdentifierOfCurrentProcess__block_invoke;
  block[3] = &unk_1E70DEE90;
  block[4] = self;
  if (bundleIdentifierOfCurrentProcess_cn_once_token_0 != -1)
    dispatch_once(&bundleIdentifierOfCurrentProcess_cn_once_token_0, block);
  return (id)bundleIdentifierOfCurrentProcess_cn_once_object_0;
}

void __80__CNAutocompleteCoreAnalyticsUsageMonitorProbe_bundleIdentifierOfCurrentProcess__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "makeBundleIdentifierOfCurrentProcess");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)bundleIdentifierOfCurrentProcess_cn_once_object_0;
  bundleIdentifierOfCurrentProcess_cn_once_object_0 = v1;

}

- (id)makeBundleIdentifierOfCurrentProcess
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSMutableDictionary)coreAnalyticsDictionary
{
  return self->_coreAnalyticsDictionary;
}

- (void)setCoreAnalyticsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_coreAnalyticsDictionary, a3);
}

- (NSNumber)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndex, a3);
}

- (NSNumber)selectedPredictionIndex
{
  return self->_selectedPredictionIndex;
}

- (void)setSelectedPredictionIndex:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPredictionIndex, a3);
}

- (NSNumber)lengthOfSearchString
{
  return self->_lengthOfSearchString;
}

- (void)setLengthOfSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_lengthOfSearchString, a3);
}

- (NSNumber)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(id)a3
{
  objc_storeStrong((id *)&self->_sourceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceType, 0);
  objc_storeStrong((id *)&self->_lengthOfSearchString, 0);
  objc_storeStrong((id *)&self->_selectedPredictionIndex, 0);
  objc_storeStrong((id *)&self->_selectedIndex, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsDictionary, 0);
}

@end
