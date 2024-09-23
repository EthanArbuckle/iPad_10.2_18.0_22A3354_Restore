@implementation MPModelRadioStation

+ (id)__type_KEY
{
  return CFSTR("MPModelPropertyRadioStationType");
}

+ (id)__subtype_KEY
{
  return CFSTR("MPModelPropertyRadioStationSubtype");
}

+ (id)__subscriptionRequired_KEY
{
  return CFSTR("MPModelPropertyRadioStationSubscriptionRequired");
}

+ (id)__stationGlyphBlock_KEY
{
  return CFSTR("MPModelPropertyRadioStationGlyph");
}

+ (id)__stationEvents_KEY
{
  return CFSTR("MPModelPropertyRadioStationEvents");
}

+ (id)__startingAirDate_KEY
{
  return CFSTR("MPModelPropertyRadioStationStartingAirDate");
}

+ (id)__shortEditorNotes_KEY
{
  return CFSTR("MPModelPropertyRadioStationShortEditorNotes");
}

+ (id)__providerUniversalLink_KEY
{
  return CFSTR("MPModelPropertyRadioStationProviderUniversalLink");
}

+ (id)__providerName_KEY
{
  return CFSTR("MPModelPropertyRadioStationProviderName");
}

+ (id)__providerID_KEY
{
  return CFSTR("MPModelPropertyRadioStationProviderID");
}

+ (id)__providerBundleIdentifier_KEY
{
  return CFSTR("MPModelPropertyRadioStationProviderBundleIdentifier");
}

+ (id)__name_KEY
{
  return CFSTR("MPModelPropertyRadioStationName");
}

+ (id)__live_KEY
{
  return CFSTR("MPModelPropertyRadioStationLive");
}

+ (id)__hasExplicitContent_KEY
{
  return CFSTR("MPModelPropertyRadioStationHasExplicitContent");
}

+ (id)__endingAirDate_KEY
{
  return CFSTR("MPModelPropertyRadioStationEndingAirDate");
}

+ (id)__editorNotes_KEY
{
  return CFSTR("MPModelPropertyRadioStationEditorNotes");
}

+ (id)__containsVideo_KEY
{
  return CFSTR("MPModelPropertyRadioStationContainsVideo");
}

+ (id)__beats1_KEY
{
  return CFSTR("MPModelPropertyRadioStationBeats1");
}

+ (id)__attributionLabel_KEY
{
  return CFSTR("MPModelPropertyRadioStationAttributionLabel");
}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyRadioStationArtwork");
}

+ (id)__allowsItemLiking_KEY
{
  return CFSTR("MPModelPropertyRadioStationAllowsItemLiking");
}

- (id)artworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelRadioStation artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelRadioStation *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)contentItemCollectionInfo
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", CFSTR("_MPNowPlayingCollectionInfoCollectionTypeRadio"), CFSTR("_MPNowPlayingCollectionInfoKeyCollectionType"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__MPModelRadioStation_MPContentItemAdditions__contentItemCollectionInfo__block_invoke;
  v8[3] = &unk_1E31635F8;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __72__MPModelRadioStation_MPContentItemAdditions__contentItemCollectionInfo__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "name");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v11, CFSTR("_MPNowPlayingCollectionInfoKeyTitle"));
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "radio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stationStringID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("_MPNowPlayingInfoPropertyRadioStationStringIdentifier"));
  objc_msgSend(v2, "radio");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "stationID");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("_MPNowPlayingInfoPropertyRadioStationIdentifier"));

  }
  objc_msgSend(v2, "radio");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stationHash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("_MPNowPlayingInfoPropertyRadioStationHash"));
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, CFSTR("_MPNowPlayingCollectionInfoKeyIdentifiers"));

}

- (id)humanDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[MPModelObject identifiers](self, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "humanDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("radio station %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationName")))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MPModelRadioStation name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("“%@” "), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "insertString:atIndex:", v9, 0);
  }
  return v6;
}

- (id)stationGlyph
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelRadioStation stationGlyphBlock](self, "stationGlyphBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelRadioStation *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MPRadioStationEvent)currentStationEvent
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[MPModelRadioStation stationEvents](self, "stationEvents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v10 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v9, "startTime");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "endTime");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:", v11, v12);

        if (objc_msgSend(v13, "containsDate:", v3))
        {
          if (!v6)
            goto LABEL_9;
          objc_msgSend(v9, "startTime");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceNow");
          v16 = v15;
          objc_msgSend(v6, "startTime");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "timeIntervalSinceNow");
          v19 = v18;

          if (v16 < v19)
          {
LABEL_9:
            v20 = v9;

            v6 = v20;
          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return (MPRadioStationEvent *)v6;
}

- (MPRadioStationEvent)upcomingStationEvent
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[MPModelRadioStation stationEvents](self, "stationEvents", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "startTime");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "compare:", v11);

        if (v12 == -1)
        {
          if (!v7)
            goto LABEL_9;
          objc_msgSend(v10, "startTime");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "timeIntervalSinceNow");
          v15 = v14;
          objc_msgSend(v7, "startTime");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "timeIntervalSinceNow");
          v18 = v17;

          if (v15 < v18)
          {
LABEL_9:
            v19 = v10;

            v7 = v19;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return (MPRadioStationEvent *)v7;
}

+ (id)classesForSecureCoding
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)__MPModelPropertyRadioStationBeats1__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 84, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationBeats1"));

}

+ (void)__MPModelPropertyRadioStationLive__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 85, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationLive"));

}

+ (void)__MPModelPropertyRadioStationContainsVideo__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 86, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationContainsVideo"));

}

+ (void)__MPModelPropertyRadioStationName__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 87, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationName"));

}

+ (void)__MPModelPropertyRadioStationEditorNotes__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 88, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationEditorNotes"));

}

+ (void)__MPModelPropertyRadioStationShortEditorNotes__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 89, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationShortEditorNotes"));

}

+ (void)__MPModelPropertyRadioStationHasExplicitContent__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 90, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationHasExplicitContent"));

}

+ (void)__MPModelPropertyRadioStationEvents__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 91, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationEvents"));

}

+ (void)__MPModelPropertyRadioStationArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 92, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationArtwork"));

}

+ (void)__MPModelPropertyRadioStationGlyph__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 93, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationGlyph"));

}

+ (void)__MPModelPropertyRadioStationAllowsItemLiking__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 94, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationAllowsItemLiking"));

}

+ (void)__MPModelPropertyRadioStationType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 95, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationType"));

}

+ (void)__MPModelPropertyRadioStationSubtype__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 96, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationSubtype"));

}

+ (void)__MPModelPropertyRadioStationAttributionLabel__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 97, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationAttributionLabel"));

}

+ (void)__MPModelPropertyRadioStationProviderName__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 98, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationProviderName"));

}

+ (void)__MPModelPropertyRadioStationSubscriptionRequired__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 99, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationSubscriptionRequired"));

}

+ (void)__MPModelPropertyRadioStationProviderUniversalLink__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 100, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationProviderUniversalLink"));

}

+ (void)__MPModelPropertyRadioStationProviderBundleIdentifier__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 101, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationProviderBundleIdentifier"));

}

+ (void)__MPModelPropertyRadioStationProviderID__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 102, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationProviderID"));

}

+ (void)__MPModelPropertyRadioStationStartingAirDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 103, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationStartingAirDate"));

}

+ (void)__MPModelPropertyRadioStationEndingAirDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStation.m"), 104, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationEndingAirDate"));

}

+ (int64_t)genericObjectType
{
  return 13;
}

@end
