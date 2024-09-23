@implementation NTKGreenfieldDraftRecipe

- (NTKGreenfieldDraftRecipe)initWithFace:(id)a3
{
  id v5;
  NTKGreenfieldDraftRecipe *v6;
  NTKGreenfieldDraftRecipe *v7;
  uint64_t v8;
  NSMutableDictionary *complicationUniqueIdentifierToOptionTypeMapping;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKGreenfieldDraftRecipe;
  v6 = -[NTKGreenfieldDraftRecipe init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalface, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    complicationUniqueIdentifierToOptionTypeMapping = v7->_complicationUniqueIdentifierToOptionTypeMapping;
    v7->_complicationUniqueIdentifierToOptionTypeMapping = (NSMutableDictionary *)v8;

    -[NTKGreenfieldDraftRecipe _buildSlotToSampleTemplateMapping](v7, "_buildSlotToSampleTemplateMapping");
    -[NTKGreenfieldDraftRecipe _buildSlotToItemIdAndBundleIdMapping](v7, "_buildSlotToItemIdAndBundleIdMapping");
    -[NTKGreenfieldDraftRecipe _buildOptionTypeMapping](v7, "_buildOptionTypeMapping");
  }

  return v7;
}

- (void)setComplicationOption:(unint64_t)a3 forComplicationUniqueIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_complicationUniqueIdentifierToOptionTypeMapping, "setObject:forKeyedSubscript:", v8, v7);

}

- (unint64_t)optionForComplicationUniqueIdentifier:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_complicationUniqueIdentifierToOptionTypeMapping, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)hasComplicationSharingOptions
{
  void *v2;
  BOOL v3;

  -[NTKGreenfieldDraftRecipe sortedComplicationSharingOptions](self, "sortedComplicationSharingOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)slotToItemIdMapping
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  NTKGreenfieldDraftRecipe *v12;
  id v13;

  v3 = (void *)-[NSMutableDictionary mutableCopy](self->_slotToItemIdMapping, "mutableCopy");
  -[NSMutableDictionary allKeys](self->_slotToItemIdMapping, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __47__NTKGreenfieldDraftRecipe_slotToItemIdMapping__block_invoke;
  v11 = &unk_1E6BCD908;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

void __47__NTKGreenfieldDraftRecipe_slotToItemIdMapping__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldIncludeMetadataForSlot:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v3);

}

- (id)slotToSampleTemplateMapping
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  NTKGreenfieldDraftRecipe *v12;
  id v13;

  v3 = (void *)-[NSMutableDictionary mutableCopy](self->_slotToSampleTemplateMapping, "mutableCopy");
  -[NSMutableDictionary allKeys](self->_slotToSampleTemplateMapping, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __55__NTKGreenfieldDraftRecipe_slotToSampleTemplateMapping__block_invoke;
  v11 = &unk_1E6BCD908;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

void __55__NTKGreenfieldDraftRecipe_slotToSampleTemplateMapping__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldIncludeMetadataForSlot:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v3);

}

- (id)slotToBundleIdMapping
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  NTKGreenfieldDraftRecipe *v12;
  id v13;

  v3 = (void *)-[NSMutableDictionary mutableCopy](self->_slotToAppIdentifierMapping, "mutableCopy");
  -[NSMutableDictionary allKeys](self->_slotToAppIdentifierMapping, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __49__NTKGreenfieldDraftRecipe_slotToBundleIdMapping__block_invoke;
  v11 = &unk_1E6BCD908;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

void __49__NTKGreenfieldDraftRecipe_slotToBundleIdMapping__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldIncludeMetadataForSlot:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v3);

}

- (id)sortedComplicationSharingOptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NTKFace *originalface;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  -[NTKFace device](self->_originalface, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  originalface = self->_originalface;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__NTKGreenfieldDraftRecipe_sortedComplicationSharingOptions__block_invoke;
  v13[3] = &unk_1E6BD5850;
  v13[4] = self;
  v14 = v4;
  v16 = v3;
  v17 = v5;
  v15 = v6;
  v8 = v3;
  v9 = v6;
  v10 = v4;
  -[NTKFace enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:](originalface, "enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:", v13);
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_109);
  v11 = (void *)objc_msgSend(v8, "copy");

  return v11;
}

void __60__NTKGreenfieldDraftRecipe_sortedComplicationSharingOptions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "complicationForSlot:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "complicationType"))
  {
    objc_msgSend(v3, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v4) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "complicationDescriptor");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "hasUserInfo");

        v7 = v6;
      }
      else
      {
        v7 = 0;
      }
      objc_msgSend(*(id *)(a1 + 64), "richComplicationSlotsForDevice:", *(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "ntk_localizedNameWithOptions:forRichComplicationSlot:", 3, objc_msgSend(v8, "containsObject:", v11));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKGreenfieldComplicationSharingOption optionWithName:uniqueIdentifier:optionType:](NTKGreenfieldComplicationSharingOption, "optionWithName:uniqueIdentifier:optionType:", v9, v4, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);

    }
  }

}

uint64_t __60__NTKGreenfieldDraftRecipe_sortedComplicationSharingOptions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NTKFace)faceForSharing
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  NTKFace *v8;
  _QWORD v10[4];
  id v11;
  NTKGreenfieldDraftRecipe *v12;
  void *v13;

  -[NTKFace deepCopy](self->_originalface, "deepCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace allVisibleComplicationsForCurrentConfiguration](self->_originalface, "allVisibleComplicationsForCurrentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__NTKGreenfieldDraftRecipe_faceForSharing__block_invoke;
  v10[3] = &unk_1E6BCF558;
  v5 = v3;
  v11 = v5;
  v12 = self;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateComplicationSlotsWithBlock:", v10);
  v7 = v13;
  v8 = (NTKFace *)v5;

  return v8;
}

void __42__NTKGreenfieldDraftRecipe_faceForSharing__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "optionForComplicationUniqueIdentifier:", v6);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = 2;
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v3))
    v8 = v7;
  else
    v8 = 2;
  if (v8 == 2)
  {
    v9 = *(void **)(a1 + 32);
    +[NTKComplication nullComplication](NTKComplication, "nullComplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setComplication:forSlot:", v10, v3);

    goto LABEL_18;
  }
  if (v8 != 1)
    goto LABEL_18;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "resetComplicationDescriptor");
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[NTKComplication anyComplicationOfType:](NTKComplication, "anyComplicationOfType:", 24);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setComplication:forSlot:", v11, v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_18;
    v11 = v4;
    objc_msgSend(v11, "complication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.NanoCompass.complications.waypoints")))
    {
      objc_msgSend(v11, "complication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      +[NTKBundleComplication bundledComplicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:](NTKBundleComplication, "bundledComplicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", CFSTR("com.apple.NanoCompass.complications.waypoint"), v15, 0);
      v16 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "setComplication:forSlot:", v16, v3);
      v11 = (id)v16;
    }

  }
LABEL_18:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      NTKFaceStyleDescription(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "faceStyle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v3;
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "Removing placeholder complication at slot: %@ face: %@", (uint8_t *)&v21, 0x16u);

    }
    v19 = *(void **)(a1 + 32);
    +[NTKComplication nullComplication](NTKComplication, "nullComplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setComplication:forSlot:", v20, v3);

  }
}

- (unint64_t)faceForSharingComplicationOptionsCount
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  NTKGreenfieldDraftRecipe *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[NTKGreenfieldDraftRecipe faceForSharing](self, "faceForSharing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace deepCopy](self->_originalface, "deepCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__NTKGreenfieldDraftRecipe_faceForSharingComplicationOptionsCount__block_invoke;
  v8[3] = &unk_1E6BD1360;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  objc_msgSend(v3, "enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:", v8);
  v6 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __66__NTKGreenfieldDraftRecipe_faceForSharingComplicationOptionsCount__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  unint64_t v5;
  char isKindOfClass;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v7, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "optionForComplicationUniqueIdentifier:", v4);

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (objc_msgSend(v7, "complicationType") && (isKindOfClass & 1) == 0 && v5 <= 1)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

+ (id)titleFromComplicationOption:(unint64_t)a3
{
  __CFString *v3;
  __CFString *v4;

  switch(a3)
  {
    case 2uLL:
      v3 = CFSTR("GREENFIELD_SHARE_OPTIONS_REMOVE_COMPLICATION");
      v4 = CFSTR("Don't include");
      goto LABEL_7;
    case 1uLL:
      v3 = CFSTR("GREENFIELD_SHARE_OPTIONS_KEEP_COMPLICATION_WITHOUT_USER_INFO");
      v4 = CFSTR("Include without data");
      goto LABEL_7;
    case 0uLL:
      v3 = CFSTR("GREENFIELD_SHARE_OPTIONS_KEEP_COMPLICATION_INCLUDE_USER_INFO");
      v4 = CFSTR("Include with data");
LABEL_7:
      NTKClockFaceLocalizedString(v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return a1;
}

+ (id)descriptionFromComplicationOption:(unint64_t)a3
{
  __CFString *v3;
  __CFString *v4;

  switch(a3)
  {
    case 2uLL:
      v3 = CFSTR("GREENFIELD_SHARE_OPTIONS_REMOVE_COMPLICATION_FOOTER");
      v4 = CFSTR("This complication will not be shared as part of the watch face.");
      goto LABEL_7;
    case 1uLL:
      v3 = CFSTR("GREENFIELD_SHARE_OPTIONS_KEEP_COMPLICATION_WITHOUT_USER_INFO_FOOTER");
      v4 = CFSTR("Including this complication without data will share a generic complication that launches the app but will not include personal data.");
      goto LABEL_7;
    case 0uLL:
      v3 = CFSTR("GREENFIELD_SHARE_OPTIONS_KEEP_COMPLICATION_INCLUDE_USER_INFO_FOOTER");
      v4 = CFSTR("Including this complication with data could share location, descriptions, keywords, names, or other personally identifiable information.");
LABEL_7:
      NTKClockFaceLocalizedString(v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return a1;
}

- (BOOL)_shouldIncludeMetadataForSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v4 = a3;
  -[NTKFace allVisibleComplicationsForCurrentConfiguration](self->_originalface, "allVisibleComplicationsForCurrentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    -[NTKFace complicationForSlot:](self->_originalface, "complicationForSlot:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NTKGreenfieldDraftRecipe optionForComplicationUniqueIdentifier:](self, "optionForComplicationUniqueIdentifier:", v7);

    v9 = v8 != 2;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_buildSlotToSampleTemplateMapping
{
  NSMutableDictionary *v3;
  NSMutableDictionary *slotToSampleTemplateMapping;
  NTKFace *originalface;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  slotToSampleTemplateMapping = self->_slotToSampleTemplateMapping;
  self->_slotToSampleTemplateMapping = v3;

  originalface = self->_originalface;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__NTKGreenfieldDraftRecipe__buildSlotToSampleTemplateMapping__block_invoke;
  v6[3] = &unk_1E6BD2138;
  v6[4] = self;
  -[NTKFace enumerateComplicationSlotsWithBlock:](originalface, "enumerateComplicationSlotsWithBlock:", v6);
}

void __61__NTKGreenfieldDraftRecipe__buildSlotToSampleTemplateMapping__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;

  v3 = a2;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend((id)objc_opt_class(), "templateForComplicationAtSlot:face:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "canShareTemplate:slot:", v5, v3))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v5, v3);
  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __61__NTKGreenfieldDraftRecipe__buildSlotToSampleTemplateMapping__block_invoke_cold_1((uint64_t)v3, v4, v6);

  }
}

+ (id)templateForComplicationAtSlot:(id)a3 face:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NTKCompanionRemoteComplicationDataSource *v17;
  void *v18;
  void *v19;
  NTKCompanionRemoteComplicationDataSource *v20;
  void *v21;
  void *v23;
  void *v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "complicationForSlot:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "complicationVariantForComplication:withSlot:", v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "family");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v7;
      objc_msgSend(v6, "device");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:](NTKCompanionComplicationCollectionManager, "sharedComplicationCollectionForDevice:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clientIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "complicationDescriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v12;
      objc_msgSend(v12, "sampleTemplateForClientIdentifier:descriptor:applicationID:family:", v13, v14, v15, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v17 = [NTKCompanionRemoteComplicationDataSource alloc];
        objc_msgSend(v6, "device");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_opt_new();
        v20 = -[CLKCComplicationDataSource initWithComplication:family:forDevice:context:](v17, "initWithComplication:family:forDevice:context:", v11, v10, v18, v19);

        -[NTKCompanionRemoteComplicationDataSource currentSwitcherTemplate](v20, "currentSwitcherTemplate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      objc_msgSend(v6, "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKComplicationController controllerForComplication:variant:device:](NTKComplicationController, "controllerForComplication:variant:device:", v7, v9, v21);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "sharingTemplate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
    }

    v8 = v16;
  }

  return v8;
}

- (BOOL)canShareTemplate:(id)a3 slot:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  NTKGreenfieldDraftRecipe *v23;
  id v24;
  uint64_t *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  v8 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke;
  v34[3] = &unk_1E6BD58B8;
  v9 = v6;
  v35 = v9;
  v37 = &v38;
  v10 = v7;
  v36 = v10;
  objc_msgSend(v9, "_enumerateFullColorImageProviderKeysWithBlock:", v34);
  if (*((_BYTE *)v39 + 24))
  {
    v30[0] = v8;
    v30[1] = 3221225472;
    v30[2] = __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke_43;
    v30[3] = &unk_1E6BD58E0;
    v11 = v9;
    v31 = v11;
    v33 = &v38;
    v12 = v10;
    v32 = v12;
    objc_msgSend(v11, "enumerateTextProviderKeysWithBlock:", v30);
    if (*((_BYTE *)v39 + 24))
    {
      v26[0] = v8;
      v26[1] = 3221225472;
      v26[2] = __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke_48;
      v26[3] = &unk_1E6BD58E0;
      v13 = v11;
      v27 = v13;
      v29 = &v38;
      v14 = v12;
      v28 = v14;
      objc_msgSend(v13, "enumerateImageProviderKeysWithBlock:", v26);
      if (!*((_BYTE *)v39 + 24))
        goto LABEL_11;
      v15 = objc_opt_class();
      objc_msgSend(v13, "metadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_msgSend((id)v15, "dictionaryIsCompatibleWithJSONSerialization:", v16);

      if ((v15 & 1) == 0)
      {
        *((_BYTE *)v39 + 24) = 0;
        _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "metadata");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v43 = v14;
          v44 = 2112;
          v45 = v18;
          _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "Sample template for slot: %@ can't be shared because it has a non JSON representable dictionary %@.", buf, 0x16u);

        }
      }
      if (*((_BYTE *)v39 + 24))
      {
        v21[0] = v8;
        v21[1] = 3221225472;
        v21[2] = __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke_50;
        v21[3] = &unk_1E6BD5908;
        v22 = v13;
        v23 = self;
        v24 = v14;
        v25 = &v38;
        objc_msgSend(v22, "_enumerateEmbeddedTemplateKeysWithBlock:", v21);
        v19 = *((_BYTE *)v39 + 24) != 0;

      }
      else
      {
LABEL_11:
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  _Block_object_dispose(&v38, 8);
  return v19;
}

void __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "ImageViewClass"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a7 = 1;
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "Sample template for slot: %@ can't be shared because it has a custom view class.", (uint8_t *)&v12, 0xCu);
    }

  }
}

void __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke_43(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("DoseTextProvider")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "Sample template for slot: %@ can't be shared because it is CLKOverrideTextProvider.", (uint8_t *)&v12, 0xCu);
    }

  }
}

void __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke_48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageViewCreationHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "Sample template for slot: %@ can't be shared because it is has a custom image view class.", (uint8_t *)&v11, 0xCu);
    }

  }
}

void __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke_50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "canShareTemplate:slot:") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a5 = 1;
  }

}

- (void)_buildSlotToItemIdAndBundleIdMapping
{
  NSMutableDictionary *v3;
  NSMutableDictionary *slotToItemIdMapping;
  NSMutableDictionary *v5;
  NSMutableDictionary *slotToAppIdentifierMapping;
  NTKFace *originalface;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  slotToItemIdMapping = self->_slotToItemIdMapping;
  self->_slotToItemIdMapping = v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  slotToAppIdentifierMapping = self->_slotToAppIdentifierMapping;
  self->_slotToAppIdentifierMapping = v5;

  originalface = self->_originalface;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__NTKGreenfieldDraftRecipe__buildSlotToItemIdAndBundleIdMapping__block_invoke;
  v8[3] = &unk_1E6BD2138;
  v8[4] = self;
  -[NTKFace enumerateComplicationSlotsWithBlock:](originalface, "enumerateComplicationSlotsWithBlock:", v8);
}

void __64__NTKGreenfieldDraftRecipe__buildSlotToItemIdAndBundleIdMapping__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "complicationForSlot:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "clientIdentifier");
    else
      objc_msgSend(v3, "appIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      NTKSharedRemoteComplicationProvider();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemIdForVendorWithClientIdentifier:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        v7 = v6;
      else
        v7 = &unk_1E6C9F2E0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v7, v9);
      objc_msgSend(v3, "appIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v8, v9);

    }
  }

}

- (void)_buildOptionTypeMapping
{
  NSMutableDictionary *v3;
  NSMutableDictionary *complicationUniqueIdentifierToOptionTypeMapping;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  complicationUniqueIdentifierToOptionTypeMapping = self->_complicationUniqueIdentifierToOptionTypeMapping;
  self->_complicationUniqueIdentifierToOptionTypeMapping = v3;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NTKGreenfieldDraftRecipe sortedComplicationSharingOptions](self, "sortedComplicationSharingOptions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "optionType");
        if (v12)
        {
          if (v12 != 1)
            goto LABEL_11;
          v13 = &unk_1E6C9F310;
        }
        else
        {
          v13 = &unk_1E6C9F2F8;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_complicationUniqueIdentifierToOptionTypeMapping, "setObject:forKeyedSubscript:", v13, v11);
LABEL_11:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NTKFace *originalface;
  id v5;
  id v6;

  originalface = self->_originalface;
  v5 = a3;
  -[NTKFace instanceDescriptor](originalface, "instanceDescriptor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("kNTKGreenfieldWatchfaceKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_complicationUniqueIdentifierToOptionTypeMapping, CFSTR("kNTKGreenfieldComplicationUniqueIdentifierToOptionTypeMappingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tempPathOverride, CFSTR("kNTKGreenfieldTempPathKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_slotToSampleTemplateMapping, CFSTR("kNTKGreenfieldSlotToSampleTemplateMappingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_slotToItemIdMapping, CFSTR("kNTKGreenfieldSlotToItemIdMappingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_slotToAppIdentifierMapping, CFSTR("kNTKGreenfieldSlotToBundleIdMappingKey"));

}

- (NTKGreenfieldDraftRecipe)initWithCoder:(id)a3
{
  id v4;
  NTKGreenfieldDraftRecipe *v5;
  void *v6;
  uint64_t v7;
  NTKFace *originalface;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *complicationUniqueIdentifierToOptionTypeMapping;
  uint64_t v16;
  NSString *tempPathOverride;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSMutableDictionary *slotToSampleTemplateMapping;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSMutableDictionary *slotToItemIdMapping;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSMutableDictionary *slotToAppIdentifierMapping;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)NTKGreenfieldDraftRecipe;
  v5 = -[NTKGreenfieldDraftRecipe init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNTKGreenfieldWatchfaceKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKFace faceWithInstanceDescriptor:](NTKFace, "faceWithInstanceDescriptor:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    originalface = v5->_originalface;
    v5->_originalface = (NTKFace *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kNTKGreenfieldComplicationUniqueIdentifierToOptionTypeMappingKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    complicationUniqueIdentifierToOptionTypeMapping = v5->_complicationUniqueIdentifierToOptionTypeMapping;
    v5->_complicationUniqueIdentifierToOptionTypeMapping = (NSMutableDictionary *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNTKGreenfieldTempPathKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    tempPathOverride = v5->_tempPathOverride;
    v5->_tempPathOverride = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("kNTKGreenfieldSlotToSampleTemplateMappingKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    slotToSampleTemplateMapping = v5->_slotToSampleTemplateMapping;
    v5->_slotToSampleTemplateMapping = (NSMutableDictionary *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("kNTKGreenfieldSlotToItemIdMappingKey"));
    v28 = objc_claimAutoreleasedReturnValue();
    slotToItemIdMapping = v5->_slotToItemIdMapping;
    v5->_slotToItemIdMapping = (NSMutableDictionary *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("kNTKGreenfieldSlotToBundleIdMappingKey"));
    v33 = objc_claimAutoreleasedReturnValue();
    slotToAppIdentifierMapping = v5->_slotToAppIdentifierMapping;
    v5->_slotToAppIdentifierMapping = (NSMutableDictionary *)v33;

  }
  return v5;
}

- (NSString)tempPathOverride
{
  return self->_tempPathOverride;
}

- (void)setTempPathOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempPathOverride, 0);
  objc_storeStrong((id *)&self->_slotToAppIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_complicationUniqueIdentifierToOptionTypeMapping, 0);
  objc_storeStrong((id *)&self->_slotToItemIdMapping, 0);
  objc_storeStrong((id *)&self->_slotToSampleTemplateMapping, 0);
  objc_storeStrong((id *)&self->_originalface, 0);
}

void __61__NTKGreenfieldDraftRecipe__buildSlotToSampleTemplateMapping__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NTKFaceStyleDescription(objc_msgSend(a2, "faceStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1B72A3000, a3, OS_LOG_TYPE_ERROR, "Missing sample template for slot: %@ face: %@", (uint8_t *)&v6, 0x16u);

}

@end
