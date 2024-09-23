@implementation _INPBPrivatePlayMediaIntentData

- (void)setAlternativeProviderBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeProviderBundleIdentifier, a3);
}

- (BOOL)hasAlternativeProviderBundleIdentifier
{
  return self->_alternativeProviderBundleIdentifier != 0;
}

- (void)setAmpPAFDataSetID:(id)a3
{
  objc_storeStrong((id *)&self->_ampPAFDataSetID, a3);
}

- (BOOL)hasAmpPAFDataSetID
{
  return self->_ampPAFDataSetID != 0;
}

- (void)setAppInferred:(BOOL)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_appInferred = a3;
}

- (BOOL)hasAppInferred
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasAppInferred:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setAppSelectionEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_appSelectionEnabled = a3;
}

- (BOOL)hasAppSelectionEnabled
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasAppSelectionEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setAppSelectionSignalsEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_appSelectionSignalsEnabled = a3;
}

- (BOOL)hasAppSelectionSignalsEnabled
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasAppSelectionSignalsEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setAppSelectionSignalsFrequencyDenominator:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_appSelectionSignalsFrequencyDenominator = a3;
}

- (BOOL)hasAppSelectionSignalsFrequencyDenominator
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasAppSelectionSignalsFrequencyDenominator:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setAudioSearchResults:(id)a3
{
  NSArray *v4;
  NSArray *audioSearchResults;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  audioSearchResults = self->_audioSearchResults;
  self->_audioSearchResults = v4;

}

- (void)clearAudioSearchResults
{
  -[NSArray removeAllObjects](self->_audioSearchResults, "removeAllObjects");
}

- (void)addAudioSearchResults:(id)a3
{
  id v4;
  NSArray *audioSearchResults;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  audioSearchResults = self->_audioSearchResults;
  v8 = v4;
  if (!audioSearchResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_audioSearchResults;
    self->_audioSearchResults = v6;

    v4 = v8;
    audioSearchResults = self->_audioSearchResults;
  }
  -[NSArray addObject:](audioSearchResults, "addObject:", v4);

}

- (unint64_t)audioSearchResultsCount
{
  return -[NSArray count](self->_audioSearchResults, "count");
}

- (id)audioSearchResultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_audioSearchResults, "objectAtIndexedSubscript:", a3);
}

- (void)setEntityConfidenceSignalsEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_entityConfidenceSignalsEnabled = a3;
}

- (BOOL)hasEntityConfidenceSignalsEnabled
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasEntityConfidenceSignalsEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setEntityConfidenceSignalsFrequencyDenominatorInternal:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_entityConfidenceSignalsFrequencyDenominatorInternal = a3;
}

- (BOOL)hasEntityConfidenceSignalsFrequencyDenominatorInternal
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasEntityConfidenceSignalsFrequencyDenominatorInternal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setEntityConfidenceSignalsFrequencyDenominatorProd:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_entityConfidenceSignalsFrequencyDenominatorProd = a3;
}

- (BOOL)hasEntityConfidenceSignalsFrequencyDenominatorProd
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasEntityConfidenceSignalsFrequencyDenominatorProd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setEntityConfidenceSignalsMaxItemsToDisambiguate:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_entityConfidenceSignalsMaxItemsToDisambiguate = a3;
}

- (BOOL)hasEntityConfidenceSignalsMaxItemsToDisambiguate
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasEntityConfidenceSignalsMaxItemsToDisambiguate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setImmediatelyStartPlayback:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_immediatelyStartPlayback = a3;
}

- (BOOL)hasImmediatelyStartPlayback
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasImmediatelyStartPlayback:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setInternalSignals:(id)a3
{
  NSArray *v4;
  NSArray *internalSignals;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  internalSignals = self->_internalSignals;
  self->_internalSignals = v4;

}

- (void)clearInternalSignals
{
  -[NSArray removeAllObjects](self->_internalSignals, "removeAllObjects");
}

- (void)addInternalSignal:(id)a3
{
  id v4;
  NSArray *internalSignals;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  internalSignals = self->_internalSignals;
  v8 = v4;
  if (!internalSignals)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_internalSignals;
    self->_internalSignals = v6;

    v4 = v8;
    internalSignals = self->_internalSignals;
  }
  -[NSArray addObject:](internalSignals, "addObject:", v4);

}

- (unint64_t)internalSignalsCount
{
  return -[NSArray count](self->_internalSignals, "count");
}

- (id)internalSignalAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_internalSignals, "objectAtIndexedSubscript:", a3);
}

- (void)setIsAmbiguousPlay:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isAmbiguousPlay = a3;
}

- (BOOL)hasIsAmbiguousPlay
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasIsAmbiguousPlay:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setIsPersonalizedRequest:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isPersonalizedRequest = a3;
}

- (BOOL)hasIsPersonalizedRequest
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasIsPersonalizedRequest:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setPegasusMetaData:(id)a3
{
  NSData *v4;
  NSData *pegasusMetaData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  pegasusMetaData = self->_pegasusMetaData;
  self->_pegasusMetaData = v4;

}

- (BOOL)hasPegasusMetaData
{
  return self->_pegasusMetaData != 0;
}

- (void)setPrivateMediaIntentData:(id)a3
{
  objc_storeStrong((id *)&self->_privateMediaIntentData, a3);
}

- (BOOL)hasPrivateMediaIntentData
{
  return self->_privateMediaIntentData != 0;
}

- (void)setShouldSuppressCommonWholeHouseAudioRoutes:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_shouldSuppressCommonWholeHouseAudioRoutes = a3;
}

- (BOOL)hasShouldSuppressCommonWholeHouseAudioRoutes
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasShouldSuppressCommonWholeHouseAudioRoutes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPrivatePlayMediaIntentDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBPrivatePlayMediaIntentData alternativeProviderBundleIdentifier](self, "alternativeProviderBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBPrivatePlayMediaIntentData alternativeProviderBundleIdentifier](self, "alternativeProviderBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPrivatePlayMediaIntentData ampPAFDataSetID](self, "ampPAFDataSetID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBPrivatePlayMediaIntentData ampPAFDataSetID](self, "ampPAFDataSetID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBPrivatePlayMediaIntentData hasAppInferred](self, "hasAppInferred"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionEnabled](self, "hasAppSelectionEnabled"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionSignalsEnabled](self, "hasAppSelectionSignalsEnabled"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionSignalsFrequencyDenominator](self, "hasAppSelectionSignalsFrequencyDenominator"))
  {
    PBDataWriterWriteInt32Field();
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self->_audioSearchResults;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v11);
  }

  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsEnabled](self, "hasEntityConfidenceSignalsEnabled"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsFrequencyDenominatorInternal](self, "hasEntityConfidenceSignalsFrequencyDenominatorInternal"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsFrequencyDenominatorProd](self, "hasEntityConfidenceSignalsFrequencyDenominatorProd"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsMaxItemsToDisambiguate](self, "hasEntityConfidenceSignalsMaxItemsToDisambiguate"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPrivatePlayMediaIntentData hasImmediatelyStartPlayback](self, "hasImmediatelyStartPlayback"))
    PBDataWriterWriteBOOLField();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = self->_internalSignals;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteStringField();
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  if (-[_INPBPrivatePlayMediaIntentData hasIsAmbiguousPlay](self, "hasIsAmbiguousPlay", v22))
    PBDataWriterWriteBOOLField();
  if (-[_INPBPrivatePlayMediaIntentData hasIsPersonalizedRequest](self, "hasIsPersonalizedRequest"))
    PBDataWriterWriteBOOLField();
  -[_INPBPrivatePlayMediaIntentData pegasusMetaData](self, "pegasusMetaData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    PBDataWriterWriteDataField();
  -[_INPBPrivatePlayMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_INPBPrivatePlayMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBPrivatePlayMediaIntentData hasShouldSuppressCommonWholeHouseAudioRoutes](self, "hasShouldSuppressCommonWholeHouseAudioRoutes"))
  {
    PBDataWriterWriteBOOLField();
  }

}

- (_INPBPrivatePlayMediaIntentData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPrivatePlayMediaIntentData *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPrivatePlayMediaIntentData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPrivatePlayMediaIntentData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPrivatePlayMediaIntentData initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBPrivatePlayMediaIntentData data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPrivatePlayMediaIntentData *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = -[_INPBPrivatePlayMediaIntentData init](+[_INPBPrivatePlayMediaIntentData allocWithZone:](_INPBPrivatePlayMediaIntentData, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_alternativeProviderBundleIdentifier, "copyWithZone:", a3);
  -[_INPBPrivatePlayMediaIntentData setAlternativeProviderBundleIdentifier:](v5, "setAlternativeProviderBundleIdentifier:", v6);

  v7 = -[_INPBString copyWithZone:](self->_ampPAFDataSetID, "copyWithZone:", a3);
  -[_INPBPrivatePlayMediaIntentData setAmpPAFDataSetID:](v5, "setAmpPAFDataSetID:", v7);

  if (-[_INPBPrivatePlayMediaIntentData hasAppInferred](self, "hasAppInferred"))
    -[_INPBPrivatePlayMediaIntentData setAppInferred:](v5, "setAppInferred:", -[_INPBPrivatePlayMediaIntentData appInferred](self, "appInferred"));
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionEnabled](self, "hasAppSelectionEnabled"))
    -[_INPBPrivatePlayMediaIntentData setAppSelectionEnabled:](v5, "setAppSelectionEnabled:", -[_INPBPrivatePlayMediaIntentData appSelectionEnabled](self, "appSelectionEnabled"));
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionSignalsEnabled](self, "hasAppSelectionSignalsEnabled"))
    -[_INPBPrivatePlayMediaIntentData setAppSelectionSignalsEnabled:](v5, "setAppSelectionSignalsEnabled:", -[_INPBPrivatePlayMediaIntentData appSelectionSignalsEnabled](self, "appSelectionSignalsEnabled"));
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionSignalsFrequencyDenominator](self, "hasAppSelectionSignalsFrequencyDenominator"))
  {
    -[_INPBPrivatePlayMediaIntentData setAppSelectionSignalsFrequencyDenominator:](v5, "setAppSelectionSignalsFrequencyDenominator:", -[_INPBPrivatePlayMediaIntentData appSelectionSignalsFrequencyDenominator](self, "appSelectionSignalsFrequencyDenominator"));
  }
  v8 = (void *)-[NSArray copyWithZone:](self->_audioSearchResults, "copyWithZone:", a3);
  -[_INPBPrivatePlayMediaIntentData setAudioSearchResults:](v5, "setAudioSearchResults:", v8);

  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsEnabled](self, "hasEntityConfidenceSignalsEnabled"))
    -[_INPBPrivatePlayMediaIntentData setEntityConfidenceSignalsEnabled:](v5, "setEntityConfidenceSignalsEnabled:", -[_INPBPrivatePlayMediaIntentData entityConfidenceSignalsEnabled](self, "entityConfidenceSignalsEnabled"));
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsFrequencyDenominatorInternal](self, "hasEntityConfidenceSignalsFrequencyDenominatorInternal"))
  {
    -[_INPBPrivatePlayMediaIntentData setEntityConfidenceSignalsFrequencyDenominatorInternal:](v5, "setEntityConfidenceSignalsFrequencyDenominatorInternal:", -[_INPBPrivatePlayMediaIntentData entityConfidenceSignalsFrequencyDenominatorInternal](self, "entityConfidenceSignalsFrequencyDenominatorInternal"));
  }
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsFrequencyDenominatorProd](self, "hasEntityConfidenceSignalsFrequencyDenominatorProd"))
  {
    -[_INPBPrivatePlayMediaIntentData setEntityConfidenceSignalsFrequencyDenominatorProd:](v5, "setEntityConfidenceSignalsFrequencyDenominatorProd:", -[_INPBPrivatePlayMediaIntentData entityConfidenceSignalsFrequencyDenominatorProd](self, "entityConfidenceSignalsFrequencyDenominatorProd"));
  }
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsMaxItemsToDisambiguate](self, "hasEntityConfidenceSignalsMaxItemsToDisambiguate"))
  {
    -[_INPBPrivatePlayMediaIntentData setEntityConfidenceSignalsMaxItemsToDisambiguate:](v5, "setEntityConfidenceSignalsMaxItemsToDisambiguate:", -[_INPBPrivatePlayMediaIntentData entityConfidenceSignalsMaxItemsToDisambiguate](self, "entityConfidenceSignalsMaxItemsToDisambiguate"));
  }
  if (-[_INPBPrivatePlayMediaIntentData hasImmediatelyStartPlayback](self, "hasImmediatelyStartPlayback"))
    -[_INPBPrivatePlayMediaIntentData setImmediatelyStartPlayback:](v5, "setImmediatelyStartPlayback:", -[_INPBPrivatePlayMediaIntentData immediatelyStartPlayback](self, "immediatelyStartPlayback"));
  v9 = (void *)-[NSArray copyWithZone:](self->_internalSignals, "copyWithZone:", a3);
  -[_INPBPrivatePlayMediaIntentData setInternalSignals:](v5, "setInternalSignals:", v9);

  if (-[_INPBPrivatePlayMediaIntentData hasIsAmbiguousPlay](self, "hasIsAmbiguousPlay"))
    -[_INPBPrivatePlayMediaIntentData setIsAmbiguousPlay:](v5, "setIsAmbiguousPlay:", -[_INPBPrivatePlayMediaIntentData isAmbiguousPlay](self, "isAmbiguousPlay"));
  if (-[_INPBPrivatePlayMediaIntentData hasIsPersonalizedRequest](self, "hasIsPersonalizedRequest"))
    -[_INPBPrivatePlayMediaIntentData setIsPersonalizedRequest:](v5, "setIsPersonalizedRequest:", -[_INPBPrivatePlayMediaIntentData isPersonalizedRequest](self, "isPersonalizedRequest"));
  v10 = (void *)-[NSData copyWithZone:](self->_pegasusMetaData, "copyWithZone:", a3);
  -[_INPBPrivatePlayMediaIntentData setPegasusMetaData:](v5, "setPegasusMetaData:", v10);

  v11 = -[_INPBPrivateMediaIntentData copyWithZone:](self->_privateMediaIntentData, "copyWithZone:", a3);
  -[_INPBPrivatePlayMediaIntentData setPrivateMediaIntentData:](v5, "setPrivateMediaIntentData:", v11);

  if (-[_INPBPrivatePlayMediaIntentData hasShouldSuppressCommonWholeHouseAudioRoutes](self, "hasShouldSuppressCommonWholeHouseAudioRoutes"))
  {
    -[_INPBPrivatePlayMediaIntentData setShouldSuppressCommonWholeHouseAudioRoutes:](v5, "setShouldSuppressCommonWholeHouseAudioRoutes:", -[_INPBPrivatePlayMediaIntentData shouldSuppressCommonWholeHouseAudioRoutes](self, "shouldSuppressCommonWholeHouseAudioRoutes"));
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int appInferred;
  int v19;
  int appSelectionEnabled;
  int v21;
  int appSelectionSignalsEnabled;
  int v23;
  int appSelectionSignalsFrequencyDenominator;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  int entityConfidenceSignalsEnabled;
  int v32;
  int entityConfidenceSignalsFrequencyDenominatorInternal;
  int v34;
  int entityConfidenceSignalsFrequencyDenominatorProd;
  int v36;
  int entityConfidenceSignalsMaxItemsToDisambiguate;
  int v38;
  int immediatelyStartPlayback;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  int isAmbiguousPlay;
  int v47;
  int isPersonalizedRequest;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  BOOL v59;
  int v61;
  int shouldSuppressCommonWholeHouseAudioRoutes;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_76;
  -[_INPBPrivatePlayMediaIntentData alternativeProviderBundleIdentifier](self, "alternativeProviderBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternativeProviderBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBPrivatePlayMediaIntentData alternativeProviderBundleIdentifier](self, "alternativeProviderBundleIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBPrivatePlayMediaIntentData alternativeProviderBundleIdentifier](self, "alternativeProviderBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternativeProviderBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBPrivatePlayMediaIntentData ampPAFDataSetID](self, "ampPAFDataSetID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ampPAFDataSetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBPrivatePlayMediaIntentData ampPAFDataSetID](self, "ampPAFDataSetID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBPrivatePlayMediaIntentData ampPAFDataSetID](self, "ampPAFDataSetID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ampPAFDataSetID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_76;
  }
  else
  {

  }
  v17 = -[_INPBPrivatePlayMediaIntentData hasAppInferred](self, "hasAppInferred");
  if (v17 != objc_msgSend(v4, "hasAppInferred"))
    goto LABEL_76;
  if (-[_INPBPrivatePlayMediaIntentData hasAppInferred](self, "hasAppInferred"))
  {
    if (objc_msgSend(v4, "hasAppInferred"))
    {
      appInferred = self->_appInferred;
      if (appInferred != objc_msgSend(v4, "appInferred"))
        goto LABEL_76;
    }
  }
  v19 = -[_INPBPrivatePlayMediaIntentData hasAppSelectionEnabled](self, "hasAppSelectionEnabled");
  if (v19 != objc_msgSend(v4, "hasAppSelectionEnabled"))
    goto LABEL_76;
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionEnabled](self, "hasAppSelectionEnabled"))
  {
    if (objc_msgSend(v4, "hasAppSelectionEnabled"))
    {
      appSelectionEnabled = self->_appSelectionEnabled;
      if (appSelectionEnabled != objc_msgSend(v4, "appSelectionEnabled"))
        goto LABEL_76;
    }
  }
  v21 = -[_INPBPrivatePlayMediaIntentData hasAppSelectionSignalsEnabled](self, "hasAppSelectionSignalsEnabled");
  if (v21 != objc_msgSend(v4, "hasAppSelectionSignalsEnabled"))
    goto LABEL_76;
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionSignalsEnabled](self, "hasAppSelectionSignalsEnabled"))
  {
    if (objc_msgSend(v4, "hasAppSelectionSignalsEnabled"))
    {
      appSelectionSignalsEnabled = self->_appSelectionSignalsEnabled;
      if (appSelectionSignalsEnabled != objc_msgSend(v4, "appSelectionSignalsEnabled"))
        goto LABEL_76;
    }
  }
  v23 = -[_INPBPrivatePlayMediaIntentData hasAppSelectionSignalsFrequencyDenominator](self, "hasAppSelectionSignalsFrequencyDenominator");
  if (v23 != objc_msgSend(v4, "hasAppSelectionSignalsFrequencyDenominator"))
    goto LABEL_76;
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionSignalsFrequencyDenominator](self, "hasAppSelectionSignalsFrequencyDenominator"))
  {
    if (objc_msgSend(v4, "hasAppSelectionSignalsFrequencyDenominator"))
    {
      appSelectionSignalsFrequencyDenominator = self->_appSelectionSignalsFrequencyDenominator;
      if (appSelectionSignalsFrequencyDenominator != objc_msgSend(v4, "appSelectionSignalsFrequencyDenominator"))goto LABEL_76;
    }
  }
  -[_INPBPrivatePlayMediaIntentData audioSearchResults](self, "audioSearchResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioSearchResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBPrivatePlayMediaIntentData audioSearchResults](self, "audioSearchResults");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_INPBPrivatePlayMediaIntentData audioSearchResults](self, "audioSearchResults");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioSearchResults");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_76;
  }
  else
  {

  }
  v30 = -[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsEnabled](self, "hasEntityConfidenceSignalsEnabled");
  if (v30 != objc_msgSend(v4, "hasEntityConfidenceSignalsEnabled"))
    goto LABEL_76;
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsEnabled](self, "hasEntityConfidenceSignalsEnabled"))
  {
    if (objc_msgSend(v4, "hasEntityConfidenceSignalsEnabled"))
    {
      entityConfidenceSignalsEnabled = self->_entityConfidenceSignalsEnabled;
      if (entityConfidenceSignalsEnabled != objc_msgSend(v4, "entityConfidenceSignalsEnabled"))
        goto LABEL_76;
    }
  }
  v32 = -[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsFrequencyDenominatorInternal](self, "hasEntityConfidenceSignalsFrequencyDenominatorInternal");
  if (v32 != objc_msgSend(v4, "hasEntityConfidenceSignalsFrequencyDenominatorInternal"))
    goto LABEL_76;
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsFrequencyDenominatorInternal](self, "hasEntityConfidenceSignalsFrequencyDenominatorInternal"))
  {
    if (objc_msgSend(v4, "hasEntityConfidenceSignalsFrequencyDenominatorInternal"))
    {
      entityConfidenceSignalsFrequencyDenominatorInternal = self->_entityConfidenceSignalsFrequencyDenominatorInternal;
      if (entityConfidenceSignalsFrequencyDenominatorInternal != objc_msgSend(v4, "entityConfidenceSignalsFrequencyDenominatorInternal"))goto LABEL_76;
    }
  }
  v34 = -[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsFrequencyDenominatorProd](self, "hasEntityConfidenceSignalsFrequencyDenominatorProd");
  if (v34 != objc_msgSend(v4, "hasEntityConfidenceSignalsFrequencyDenominatorProd"))
    goto LABEL_76;
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsFrequencyDenominatorProd](self, "hasEntityConfidenceSignalsFrequencyDenominatorProd"))
  {
    if (objc_msgSend(v4, "hasEntityConfidenceSignalsFrequencyDenominatorProd"))
    {
      entityConfidenceSignalsFrequencyDenominatorProd = self->_entityConfidenceSignalsFrequencyDenominatorProd;
      if (entityConfidenceSignalsFrequencyDenominatorProd != objc_msgSend(v4, "entityConfidenceSignalsFrequencyDenominatorProd"))goto LABEL_76;
    }
  }
  v36 = -[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsMaxItemsToDisambiguate](self, "hasEntityConfidenceSignalsMaxItemsToDisambiguate");
  if (v36 != objc_msgSend(v4, "hasEntityConfidenceSignalsMaxItemsToDisambiguate"))
    goto LABEL_76;
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsMaxItemsToDisambiguate](self, "hasEntityConfidenceSignalsMaxItemsToDisambiguate"))
  {
    if (objc_msgSend(v4, "hasEntityConfidenceSignalsMaxItemsToDisambiguate"))
    {
      entityConfidenceSignalsMaxItemsToDisambiguate = self->_entityConfidenceSignalsMaxItemsToDisambiguate;
      if (entityConfidenceSignalsMaxItemsToDisambiguate != objc_msgSend(v4, "entityConfidenceSignalsMaxItemsToDisambiguate"))goto LABEL_76;
    }
  }
  v38 = -[_INPBPrivatePlayMediaIntentData hasImmediatelyStartPlayback](self, "hasImmediatelyStartPlayback");
  if (v38 != objc_msgSend(v4, "hasImmediatelyStartPlayback"))
    goto LABEL_76;
  if (-[_INPBPrivatePlayMediaIntentData hasImmediatelyStartPlayback](self, "hasImmediatelyStartPlayback"))
  {
    if (objc_msgSend(v4, "hasImmediatelyStartPlayback"))
    {
      immediatelyStartPlayback = self->_immediatelyStartPlayback;
      if (immediatelyStartPlayback != objc_msgSend(v4, "immediatelyStartPlayback"))
        goto LABEL_76;
    }
  }
  -[_INPBPrivatePlayMediaIntentData internalSignals](self, "internalSignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBPrivatePlayMediaIntentData internalSignals](self, "internalSignals");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    -[_INPBPrivatePlayMediaIntentData internalSignals](self, "internalSignals");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internalSignals");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "isEqual:", v43);

    if (!v44)
      goto LABEL_76;
  }
  else
  {

  }
  v45 = -[_INPBPrivatePlayMediaIntentData hasIsAmbiguousPlay](self, "hasIsAmbiguousPlay");
  if (v45 != objc_msgSend(v4, "hasIsAmbiguousPlay"))
    goto LABEL_76;
  if (-[_INPBPrivatePlayMediaIntentData hasIsAmbiguousPlay](self, "hasIsAmbiguousPlay"))
  {
    if (objc_msgSend(v4, "hasIsAmbiguousPlay"))
    {
      isAmbiguousPlay = self->_isAmbiguousPlay;
      if (isAmbiguousPlay != objc_msgSend(v4, "isAmbiguousPlay"))
        goto LABEL_76;
    }
  }
  v47 = -[_INPBPrivatePlayMediaIntentData hasIsPersonalizedRequest](self, "hasIsPersonalizedRequest");
  if (v47 != objc_msgSend(v4, "hasIsPersonalizedRequest"))
    goto LABEL_76;
  if (-[_INPBPrivatePlayMediaIntentData hasIsPersonalizedRequest](self, "hasIsPersonalizedRequest"))
  {
    if (objc_msgSend(v4, "hasIsPersonalizedRequest"))
    {
      isPersonalizedRequest = self->_isPersonalizedRequest;
      if (isPersonalizedRequest != objc_msgSend(v4, "isPersonalizedRequest"))
        goto LABEL_76;
    }
  }
  -[_INPBPrivatePlayMediaIntentData pegasusMetaData](self, "pegasusMetaData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusMetaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBPrivatePlayMediaIntentData pegasusMetaData](self, "pegasusMetaData");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = (void *)v49;
    -[_INPBPrivatePlayMediaIntentData pegasusMetaData](self, "pegasusMetaData");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusMetaData");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "isEqual:", v52);

    if (!v53)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBPrivatePlayMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateMediaIntentData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_75:

    goto LABEL_76;
  }
  -[_INPBPrivatePlayMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    -[_INPBPrivatePlayMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateMediaIntentData");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v56, "isEqual:", v57);

    if (!v58)
      goto LABEL_76;
  }
  else
  {

  }
  v61 = -[_INPBPrivatePlayMediaIntentData hasShouldSuppressCommonWholeHouseAudioRoutes](self, "hasShouldSuppressCommonWholeHouseAudioRoutes");
  if (v61 == objc_msgSend(v4, "hasShouldSuppressCommonWholeHouseAudioRoutes"))
  {
    if (!-[_INPBPrivatePlayMediaIntentData hasShouldSuppressCommonWholeHouseAudioRoutes](self, "hasShouldSuppressCommonWholeHouseAudioRoutes")|| !objc_msgSend(v4, "hasShouldSuppressCommonWholeHouseAudioRoutes")|| (shouldSuppressCommonWholeHouseAudioRoutes = self->_shouldSuppressCommonWholeHouseAudioRoutes, shouldSuppressCommonWholeHouseAudioRoutes == objc_msgSend(v4, "shouldSuppressCommonWholeHouseAudioRoutes")))
    {
      v59 = 1;
      goto LABEL_77;
    }
  }
LABEL_76:
  v59 = 0;
LABEL_77:

  return v59;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v21 = -[_INPBString hash](self->_alternativeProviderBundleIdentifier, "hash");
  v20 = -[_INPBString hash](self->_ampPAFDataSetID, "hash");
  if (-[_INPBPrivatePlayMediaIntentData hasAppInferred](self, "hasAppInferred"))
    v19 = 2654435761 * self->_appInferred;
  else
    v19 = 0;
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionEnabled](self, "hasAppSelectionEnabled"))
    v18 = 2654435761 * self->_appSelectionEnabled;
  else
    v18 = 0;
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionSignalsEnabled](self, "hasAppSelectionSignalsEnabled"))
    v17 = 2654435761 * self->_appSelectionSignalsEnabled;
  else
    v17 = 0;
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionSignalsFrequencyDenominator](self, "hasAppSelectionSignalsFrequencyDenominator"))
  {
    v16 = 2654435761 * self->_appSelectionSignalsFrequencyDenominator;
  }
  else
  {
    v16 = 0;
  }
  v15 = -[NSArray hash](self->_audioSearchResults, "hash");
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsEnabled](self, "hasEntityConfidenceSignalsEnabled"))
    v14 = 2654435761 * self->_entityConfidenceSignalsEnabled;
  else
    v14 = 0;
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsFrequencyDenominatorInternal](self, "hasEntityConfidenceSignalsFrequencyDenominatorInternal"))
  {
    v13 = 2654435761 * self->_entityConfidenceSignalsFrequencyDenominatorInternal;
  }
  else
  {
    v13 = 0;
  }
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsFrequencyDenominatorProd](self, "hasEntityConfidenceSignalsFrequencyDenominatorProd"))
  {
    v3 = 2654435761 * self->_entityConfidenceSignalsFrequencyDenominatorProd;
  }
  else
  {
    v3 = 0;
  }
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsMaxItemsToDisambiguate](self, "hasEntityConfidenceSignalsMaxItemsToDisambiguate"))
  {
    v4 = 2654435761 * self->_entityConfidenceSignalsMaxItemsToDisambiguate;
  }
  else
  {
    v4 = 0;
  }
  if (-[_INPBPrivatePlayMediaIntentData hasImmediatelyStartPlayback](self, "hasImmediatelyStartPlayback"))
    v5 = 2654435761 * self->_immediatelyStartPlayback;
  else
    v5 = 0;
  v6 = -[NSArray hash](self->_internalSignals, "hash");
  if (-[_INPBPrivatePlayMediaIntentData hasIsAmbiguousPlay](self, "hasIsAmbiguousPlay"))
    v7 = 2654435761 * self->_isAmbiguousPlay;
  else
    v7 = 0;
  if (-[_INPBPrivatePlayMediaIntentData hasIsPersonalizedRequest](self, "hasIsPersonalizedRequest"))
    v8 = 2654435761 * self->_isPersonalizedRequest;
  else
    v8 = 0;
  v9 = -[NSData hash](self->_pegasusMetaData, "hash");
  v10 = -[_INPBPrivateMediaIntentData hash](self->_privateMediaIntentData, "hash");
  if (-[_INPBPrivatePlayMediaIntentData hasShouldSuppressCommonWholeHouseAudioRoutes](self, "hasShouldSuppressCommonWholeHouseAudioRoutes"))
  {
    v11 = 2654435761 * self->_shouldSuppressCommonWholeHouseAudioRoutes;
  }
  else
  {
    v11 = 0;
  }
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBPrivatePlayMediaIntentData alternativeProviderBundleIdentifier](self, "alternativeProviderBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alternativeProviderBundleIdentifier"));

  -[_INPBPrivatePlayMediaIntentData ampPAFDataSetID](self, "ampPAFDataSetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ampPAFDataSetID"));

  if (-[_INPBPrivatePlayMediaIntentData hasAppInferred](self, "hasAppInferred"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivatePlayMediaIntentData appInferred](self, "appInferred"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appInferred"));

  }
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionEnabled](self, "hasAppSelectionEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivatePlayMediaIntentData appSelectionEnabled](self, "appSelectionEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appSelectionEnabled"));

  }
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionSignalsEnabled](self, "hasAppSelectionSignalsEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivatePlayMediaIntentData appSelectionSignalsEnabled](self, "appSelectionSignalsEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("appSelectionSignalsEnabled"));

  }
  if (-[_INPBPrivatePlayMediaIntentData hasAppSelectionSignalsFrequencyDenominator](self, "hasAppSelectionSignalsFrequencyDenominator"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_INPBPrivatePlayMediaIntentData appSelectionSignalsFrequencyDenominator](self, "appSelectionSignalsFrequencyDenominator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("appSelectionSignalsFrequencyDenominator"));

  }
  if (-[NSArray count](self->_audioSearchResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v13 = self->_audioSearchResults;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v17), "dictionaryRepresentation", (_QWORD)v34);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("audioSearchResults"));
  }
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsEnabled](self, "hasEntityConfidenceSignalsEnabled", (_QWORD)v34))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivatePlayMediaIntentData entityConfidenceSignalsEnabled](self, "entityConfidenceSignalsEnabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("entityConfidenceSignalsEnabled"));

  }
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsFrequencyDenominatorInternal](self, "hasEntityConfidenceSignalsFrequencyDenominatorInternal"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_INPBPrivatePlayMediaIntentData entityConfidenceSignalsFrequencyDenominatorInternal](self, "entityConfidenceSignalsFrequencyDenominatorInternal"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("entityConfidenceSignalsFrequencyDenominatorInternal"));

  }
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsFrequencyDenominatorProd](self, "hasEntityConfidenceSignalsFrequencyDenominatorProd"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_INPBPrivatePlayMediaIntentData entityConfidenceSignalsFrequencyDenominatorProd](self, "entityConfidenceSignalsFrequencyDenominatorProd"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("entityConfidenceSignalsFrequencyDenominatorProd"));

  }
  if (-[_INPBPrivatePlayMediaIntentData hasEntityConfidenceSignalsMaxItemsToDisambiguate](self, "hasEntityConfidenceSignalsMaxItemsToDisambiguate"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_INPBPrivatePlayMediaIntentData entityConfidenceSignalsMaxItemsToDisambiguate](self, "entityConfidenceSignalsMaxItemsToDisambiguate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("entityConfidenceSignalsMaxItemsToDisambiguate"));

  }
  if (-[_INPBPrivatePlayMediaIntentData hasImmediatelyStartPlayback](self, "hasImmediatelyStartPlayback"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivatePlayMediaIntentData immediatelyStartPlayback](self, "immediatelyStartPlayback"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("immediatelyStartPlayback"));

  }
  if (self->_internalSignals)
  {
    -[_INPBPrivatePlayMediaIntentData internalSignals](self, "internalSignals");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("internalSignal"));

  }
  if (-[_INPBPrivatePlayMediaIntentData hasIsAmbiguousPlay](self, "hasIsAmbiguousPlay"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivatePlayMediaIntentData isAmbiguousPlay](self, "isAmbiguousPlay"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("isAmbiguousPlay"));

  }
  if (-[_INPBPrivatePlayMediaIntentData hasIsPersonalizedRequest](self, "hasIsPersonalizedRequest"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivatePlayMediaIntentData isPersonalizedRequest](self, "isPersonalizedRequest"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("isPersonalizedRequest"));

  }
  if (self->_pegasusMetaData)
  {
    -[_INPBPrivatePlayMediaIntentData pegasusMetaData](self, "pegasusMetaData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("pegasusMetaData"));

  }
  -[_INPBPrivatePlayMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dictionaryRepresentation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("privateMediaIntentData"));

  if (-[_INPBPrivatePlayMediaIntentData hasShouldSuppressCommonWholeHouseAudioRoutes](self, "hasShouldSuppressCommonWholeHouseAudioRoutes"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivatePlayMediaIntentData shouldSuppressCommonWholeHouseAudioRoutes](self, "shouldSuppressCommonWholeHouseAudioRoutes"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("shouldSuppressCommonWholeHouseAudioRoutes"));

  }
  return v3;
}

- (_INPBString)alternativeProviderBundleIdentifier
{
  return self->_alternativeProviderBundleIdentifier;
}

- (_INPBString)ampPAFDataSetID
{
  return self->_ampPAFDataSetID;
}

- (BOOL)appInferred
{
  return self->_appInferred;
}

- (BOOL)appSelectionEnabled
{
  return self->_appSelectionEnabled;
}

- (BOOL)appSelectionSignalsEnabled
{
  return self->_appSelectionSignalsEnabled;
}

- (int)appSelectionSignalsFrequencyDenominator
{
  return self->_appSelectionSignalsFrequencyDenominator;
}

- (NSArray)audioSearchResults
{
  return self->_audioSearchResults;
}

- (BOOL)entityConfidenceSignalsEnabled
{
  return self->_entityConfidenceSignalsEnabled;
}

- (int)entityConfidenceSignalsFrequencyDenominatorInternal
{
  return self->_entityConfidenceSignalsFrequencyDenominatorInternal;
}

- (int)entityConfidenceSignalsFrequencyDenominatorProd
{
  return self->_entityConfidenceSignalsFrequencyDenominatorProd;
}

- (int)entityConfidenceSignalsMaxItemsToDisambiguate
{
  return self->_entityConfidenceSignalsMaxItemsToDisambiguate;
}

- (BOOL)immediatelyStartPlayback
{
  return self->_immediatelyStartPlayback;
}

- (NSArray)internalSignals
{
  return self->_internalSignals;
}

- (BOOL)isAmbiguousPlay
{
  return self->_isAmbiguousPlay;
}

- (BOOL)isPersonalizedRequest
{
  return self->_isPersonalizedRequest;
}

- (NSData)pegasusMetaData
{
  return self->_pegasusMetaData;
}

- (_INPBPrivateMediaIntentData)privateMediaIntentData
{
  return self->_privateMediaIntentData;
}

- (BOOL)shouldSuppressCommonWholeHouseAudioRoutes
{
  return self->_shouldSuppressCommonWholeHouseAudioRoutes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateMediaIntentData, 0);
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);
  objc_storeStrong((id *)&self->_audioSearchResults, 0);
  objc_storeStrong((id *)&self->_ampPAFDataSetID, 0);
  objc_storeStrong((id *)&self->_alternativeProviderBundleIdentifier, 0);
}

+ (Class)audioSearchResultsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
