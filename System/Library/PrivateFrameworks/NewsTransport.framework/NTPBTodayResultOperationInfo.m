@implementation NTPBTodayResultOperationInfo

- (void)setSlotsLimit:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_slotsLimit = a3;
}

- (void)setHasSlotsLimit:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasSlotsLimit
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setRespectsWidgetSlotsLimit:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_respectsWidgetSlotsLimit = a3;
}

- (void)setHasRespectsWidgetSlotsLimit:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRespectsWidgetSlotsLimit
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setPreferCompactSectionName:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_preferCompactSectionName = a3;
}

- (void)setHasPreferCompactSectionName:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPreferCompactSectionName
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setPreferCompactSourceName:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_preferCompactSourceName = a3;
}

- (void)setHasPreferCompactSourceName:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasPreferCompactSourceName
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setThumbnailSizePreset:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_thumbnailSizePreset = a3;
}

- (void)setHasThumbnailSizePreset:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasThumbnailSizePreset
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setSourceNameImageSizePreset:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_sourceNameImageSizePreset = a3;
}

- (void)setHasSourceNameImageSizePreset:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasSourceNameImageSizePreset
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setQualityOfService:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_qualityOfService = a3;
}

- (void)setHasQualityOfService:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasQualityOfService
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasSectionSlotCostInfo
{
  return self->_sectionSlotCostInfo != 0;
}

- (void)setFetchWidgetConfig:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_fetchWidgetConfig = a3;
}

- (void)setHasFetchWidgetConfig:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasFetchWidgetConfig
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setAllowOnlyWatchEligibleSections:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_allowOnlyWatchEligibleSections = a3;
}

- (void)setHasAllowOnlyWatchEligibleSections:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasAllowOnlyWatchEligibleSections
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRespectsWidgetVisibleSectionsPerQueueLimit:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_respectsWidgetVisibleSectionsPerQueueLimit = a3;
}

- (void)setHasRespectsWidgetVisibleSectionsPerQueueLimit:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasRespectsWidgetVisibleSectionsPerQueueLimit
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasAssetsDirectoryFileURLString
{
  return self->_assetsDirectoryFileURLString != 0;
}

- (void)setLeadingCellThumbnailSizePreset:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_leadingCellThumbnailSizePreset = a3;
}

- (void)setHasLeadingCellThumbnailSizePreset:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasLeadingCellThumbnailSizePreset
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDynamicThumbnailSizePresetMinimumWidthInPixels:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_dynamicThumbnailSizePresetMinimumWidthInPixels = a3;
}

- (void)setHasDynamicThumbnailSizePresetMinimumWidthInPixels:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasDynamicThumbnailSizePresetMinimumWidthInPixels
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setDynamicThumbnailSizePresetMinimumHeightInPixels:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_dynamicThumbnailSizePresetMinimumHeightInPixels = a3;
}

- (void)setHasDynamicThumbnailSizePresetMinimumHeightInPixels:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasDynamicThumbnailSizePresetMinimumHeightInPixels
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setAllowSectionTitles:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_allowSectionTitles = a3;
}

- (void)setHasAllowSectionTitles:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAllowSectionTitles
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setEmbedsLimit:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_embedsLimit = a3;
}

- (void)setHasEmbedsLimit:(BOOL)a3
{
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasEmbedsLimit
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setScale:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_scale = a3;
}

- (void)setHasScale:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasScale
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasKeyboardInputMode
{
  return self->_keyboardInputMode != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (void)setMinHeadlineScale:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_minHeadlineScale = a3;
}

- (void)setHasMinHeadlineScale:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasMinHeadlineScale
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMaxHeadlineScale:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_maxHeadlineScale = a3;
}

- (void)setHasMaxHeadlineScale:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasMaxHeadlineScale
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)widgetSize
{
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    return self->_widgetSize;
  else
    return 0;
}

- (void)setWidgetSize:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_widgetSize = a3;
}

- (void)setHasWidgetSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($5FD0D616E592121A3554181266B41E1D)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasWidgetSize
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBTodayResultOperationInfo;
  -[NTPBTodayResultOperationInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTodayResultOperationInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $5FD0D616E592121A3554181266B41E1D has;
  void *v5;
  NTPBSectionSlotCostInfo *sectionSlotCostInfo;
  void *v7;
  $5FD0D616E592121A3554181266B41E1D v8;
  void *v9;
  NSString *assetsDirectoryFileURLString;
  $5FD0D616E592121A3554181266B41E1D v11;
  void *v12;
  NSString *keyboardInputMode;
  NTPBTodayModuleContentRequest *request;
  void *v15;
  $5FD0D616E592121A3554181266B41E1D v16;
  void *v17;
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
  void *v33;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_slotsLimit);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("slots_limit"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_respectsWidgetSlotsLimit);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("respects_widget_slots_limit"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_preferCompactSectionName);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("prefer_compact_section_name"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_preferCompactSourceName);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("prefer_compact_source_name"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_thumbnailSizePreset);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("thumbnail_size_preset"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sourceNameImageSizePreset);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("source_name_image_size_preset"));

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_qualityOfService);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("quality_of_service"));

  }
LABEL_9:
  sectionSlotCostInfo = self->_sectionSlotCostInfo;
  if (sectionSlotCostInfo)
  {
    -[NTPBSectionSlotCostInfo dictionaryRepresentation](sectionSlotCostInfo, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("section_slot_cost_info"));

  }
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fetchWidgetConfig);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("fetch_widget_config"));

    v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x1000) == 0)
    {
LABEL_13:
      if ((*(_DWORD *)&v8 & 0x40000) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowOnlyWatchEligibleSections);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("allow_only_watch_eligible_sections"));

  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_respectsWidgetVisibleSectionsPerQueueLimit);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("respects_widget_visible_sections_per_queue_limit"));

  }
LABEL_15:
  assetsDirectoryFileURLString = self->_assetsDirectoryFileURLString;
  if (assetsDirectoryFileURLString)
    objc_msgSend(v3, "setObject:forKey:", assetsDirectoryFileURLString, CFSTR("assets_directory_file_URL_string"));
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_leadingCellThumbnailSizePreset);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("leading_cell_thumbnail_size_preset"));

    v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x400) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&v11 & 0x200) == 0)
        goto LABEL_20;
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&v11 & 0x400) == 0)
  {
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dynamicThumbnailSizePresetMinimumWidthInPixels);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("dynamic_thumbnail_size_preset_minimum_width_in_pixels"));

  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x200) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v11 & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dynamicThumbnailSizePresetMinimumHeightInPixels);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("dynamic_thumbnail_size_preset_minimum_height_in_pixels"));

  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x2000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v11 & 1) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowSectionTitles);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("allow_section_titles"));

  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 1) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v11 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_embedsLimit);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("embeds_limit"));

  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_scale);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("scale"));

  }
LABEL_24:
  keyboardInputMode = self->_keyboardInputMode;
  if (keyboardInputMode)
    objc_msgSend(v3, "setObject:forKey:", keyboardInputMode, CFSTR("keyboard_input_mode"));
  request = self->_request;
  if (request)
  {
    -[NTPBTodayModuleContentRequest dictionaryRepresentation](request, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("request"));

  }
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 8) == 0)
  {
    if ((*(_BYTE *)&v16 & 4) == 0)
      goto LABEL_30;
LABEL_50:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_maxHeadlineScale);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("max_headline_scale"));

    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      return v3;
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_minHeadlineScale);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("min_headline_scale"));

  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 4) != 0)
    goto LABEL_50;
LABEL_30:
  if ((*(_WORD *)&v16 & 0x800) != 0)
  {
LABEL_31:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetSize);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("widget_size"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayResultOperationInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $5FD0D616E592121A3554181266B41E1D has;
  $5FD0D616E592121A3554181266B41E1D v5;
  $5FD0D616E592121A3554181266B41E1D v6;
  $5FD0D616E592121A3554181266B41E1D v7;
  id v8;

  v8 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_38:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
LABEL_8:
    PBDataWriterWriteInt64Field();
LABEL_9:
  if (self->_sectionSlotCostInfo)
    PBDataWriterWriteSubmessage();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x1000) == 0)
    {
LABEL_13:
      if ((*(_DWORD *)&v5 & 0x40000) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
LABEL_14:
    PBDataWriterWriteBOOLField();
LABEL_15:
  if (self->_assetsDirectoryFileURLString)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&v6 & 0x200) == 0)
        goto LABEL_20;
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v6 & 1) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 1) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v6 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_47:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
LABEL_23:
    PBDataWriterWriteDoubleField();
LABEL_24:
  if (self->_keyboardInputMode)
    PBDataWriterWriteStringField();
  if (self->_request)
    PBDataWriterWriteSubmessage();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 8) == 0)
  {
    if ((*(_BYTE *)&v7 & 4) == 0)
      goto LABEL_30;
LABEL_50:
    PBDataWriterWriteDoubleField();
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
  PBDataWriterWriteDoubleField();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 4) != 0)
    goto LABEL_50;
LABEL_30:
  if ((*(_WORD *)&v7 & 0x800) != 0)
LABEL_31:
    PBDataWriterWriteInt32Field();
LABEL_32:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $5FD0D616E592121A3554181266B41E1D has;
  id v8;
  void *v9;
  $5FD0D616E592121A3554181266B41E1D v10;
  uint64_t v11;
  void *v12;
  $5FD0D616E592121A3554181266B41E1D v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  $5FD0D616E592121A3554181266B41E1D v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    *(double *)(v5 + 56) = self->_slotsLimit;
    *(_DWORD *)(v5 + 132) |= 0x40u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 129) = self->_respectsWidgetSlotsLimit;
  *(_DWORD *)(v5 + 132) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  *(_BYTE *)(v5 + 127) = self->_preferCompactSectionName;
  *(_DWORD *)(v5 + 132) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  *(_BYTE *)(v5 + 128) = self->_preferCompactSourceName;
  *(_DWORD *)(v5 + 132) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  *(_QWORD *)(v5 + 72) = self->_thumbnailSizePreset;
  *(_DWORD *)(v5 + 132) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_30:
  *(_QWORD *)(v5 + 64) = self->_sourceNameImageSizePreset;
  *(_DWORD *)(v5 + 132) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *(_QWORD *)(v5 + 40) = self->_qualityOfService;
    *(_DWORD *)(v5 + 132) |= 0x10u;
  }
LABEL_9:
  v8 = -[NTPBSectionSlotCostInfo copyWithZone:](self->_sectionSlotCostInfo, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v8;

  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    *(_BYTE *)(v6 + 126) = self->_fetchWidgetConfig;
    *(_DWORD *)(v6 + 132) |= 0x4000u;
    v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x1000) == 0)
    {
LABEL_11:
      if ((*(_DWORD *)&v10 & 0x40000) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&v10 & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  *(_BYTE *)(v6 + 124) = self->_allowOnlyWatchEligibleSections;
  *(_DWORD *)(v6 + 132) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_12:
    *(_BYTE *)(v6 + 130) = self->_respectsWidgetVisibleSectionsPerQueueLimit;
    *(_DWORD *)(v6 + 132) |= 0x40000u;
  }
LABEL_13:
  v11 = -[NSString copyWithZone:](self->_assetsDirectoryFileURLString, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v11;

  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_leadingCellThumbnailSizePreset;
    *(_DWORD *)(v6 + 132) |= 2u;
    v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x400) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v13 & 0x200) == 0)
        goto LABEL_16;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&v13 & 0x400) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 92) = self->_dynamicThumbnailSizePresetMinimumWidthInPixels;
  *(_DWORD *)(v6 + 132) |= 0x400u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v13 & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v6 + 88) = self->_dynamicThumbnailSizePresetMinimumHeightInPixels;
  *(_DWORD *)(v6 + 132) |= 0x200u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v13 & 1) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  *(_BYTE *)(v6 + 125) = self->_allowSectionTitles;
  *(_DWORD *)(v6 + 132) |= 0x2000u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 1) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v13 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_39:
  *(_QWORD *)(v6 + 8) = self->_embedsLimit;
  *(_DWORD *)(v6 + 132) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_19:
    *(double *)(v6 + 48) = self->_scale;
    *(_DWORD *)(v6 + 132) |= 0x20u;
  }
LABEL_20:
  v14 = -[NSString copyWithZone:](self->_keyboardInputMode, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v14;

  v16 = -[NTPBTodayModuleContentRequest copyWithZone:](self->_request, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v16;

  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 8) == 0)
  {
    if ((*(_BYTE *)&v18 & 4) == 0)
      goto LABEL_22;
LABEL_42:
    *(double *)(v6 + 24) = self->_maxHeadlineScale;
    *(_DWORD *)(v6 + 132) |= 4u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      return (id)v6;
    goto LABEL_23;
  }
  *(double *)(v6 + 32) = self->_minHeadlineScale;
  *(_DWORD *)(v6 + 132) |= 8u;
  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 4) != 0)
    goto LABEL_42;
LABEL_22:
  if ((*(_WORD *)&v18 & 0x800) != 0)
  {
LABEL_23:
    *(_DWORD *)(v6 + 120) = self->_widgetSize;
    *(_DWORD *)(v6 + 132) |= 0x800u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $5FD0D616E592121A3554181266B41E1D has;
  int v6;
  NTPBSectionSlotCostInfo *sectionSlotCostInfo;
  int v8;
  NSString *assetsDirectoryFileURLString;
  int v10;
  NSString *keyboardInputMode;
  NTPBTodayModuleContentRequest *request;
  $5FD0D616E592121A3554181266B41E1D v13;
  int v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_128;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 33);
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_slotsLimit != *((double *)v4 + 7))
      goto LABEL_128;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0)
      goto LABEL_128;
    if (self->_respectsWidgetSlotsLimit)
    {
      if (!*((_BYTE *)v4 + 129))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 129))
    {
      goto LABEL_128;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0)
      goto LABEL_128;
    if (self->_preferCompactSectionName)
    {
      if (!*((_BYTE *)v4 + 127))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 127))
    {
      goto LABEL_128;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0)
      goto LABEL_128;
    if (self->_preferCompactSourceName)
    {
      if (!*((_BYTE *)v4 + 128))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 128))
    {
      goto LABEL_128;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_thumbnailSizePreset != *((_QWORD *)v4 + 9))
      goto LABEL_128;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_sourceNameImageSizePreset != *((_QWORD *)v4 + 8))
      goto LABEL_128;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_qualityOfService != *((_QWORD *)v4 + 5))
      goto LABEL_128;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_128;
  }
  sectionSlotCostInfo = self->_sectionSlotCostInfo;
  if ((unint64_t)sectionSlotCostInfo | *((_QWORD *)v4 + 14))
  {
    if (!-[NTPBSectionSlotCostInfo isEqual:](sectionSlotCostInfo, "isEqual:"))
      goto LABEL_128;
    has = self->_has;
  }
  v8 = *((_DWORD *)v4 + 33);
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0)
      goto LABEL_128;
    if (self->_fetchWidgetConfig)
    {
      if (!*((_BYTE *)v4 + 126))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 126))
    {
      goto LABEL_128;
    }
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0)
      goto LABEL_128;
    if (self->_allowOnlyWatchEligibleSections)
    {
      if (!*((_BYTE *)v4 + 124))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 124))
    {
      goto LABEL_128;
    }
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0)
      goto LABEL_128;
    if (self->_respectsWidgetVisibleSectionsPerQueueLimit)
    {
      if (!*((_BYTE *)v4 + 130))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 130))
    {
      goto LABEL_128;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_128;
  }
  assetsDirectoryFileURLString = self->_assetsDirectoryFileURLString;
  if ((unint64_t)assetsDirectoryFileURLString | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](assetsDirectoryFileURLString, "isEqual:"))
      goto LABEL_128;
    has = self->_has;
  }
  v10 = *((_DWORD *)v4 + 33);
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_leadingCellThumbnailSizePreset != *((_QWORD *)v4 + 2))
      goto LABEL_128;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_dynamicThumbnailSizePresetMinimumWidthInPixels != *((_DWORD *)v4 + 23))
      goto LABEL_128;
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_dynamicThumbnailSizePresetMinimumHeightInPixels != *((_DWORD *)v4 + 22))
      goto LABEL_128;
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v10 & 0x2000) != 0)
    {
      if (self->_allowSectionTitles)
      {
        if (!*((_BYTE *)v4 + 125))
          goto LABEL_128;
        goto LABEL_99;
      }
      if (!*((_BYTE *)v4 + 125))
        goto LABEL_99;
    }
LABEL_128:
    v15 = 0;
    goto LABEL_129;
  }
  if ((v10 & 0x2000) != 0)
    goto LABEL_128;
LABEL_99:
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_embedsLimit != *((_QWORD *)v4 + 1))
      goto LABEL_128;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_scale != *((double *)v4 + 6))
      goto LABEL_128;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_128;
  }
  keyboardInputMode = self->_keyboardInputMode;
  if ((unint64_t)keyboardInputMode | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](keyboardInputMode, "isEqual:"))
  {
    goto LABEL_128;
  }
  request = self->_request;
  if ((unint64_t)request | *((_QWORD *)v4 + 13))
  {
    if (!-[NTPBTodayModuleContentRequest isEqual:](request, "isEqual:"))
      goto LABEL_128;
  }
  v13 = self->_has;
  v14 = *((_DWORD *)v4 + 33);
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_minHeadlineScale != *((double *)v4 + 4))
      goto LABEL_128;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_BYTE *)&v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_maxHeadlineScale != *((double *)v4 + 3))
      goto LABEL_128;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    if ((v14 & 0x800) == 0 || self->_widgetSize != *((_DWORD *)v4 + 30))
      goto LABEL_128;
    v15 = 1;
  }
  else
  {
    v15 = (*((_DWORD *)v4 + 33) & 0x800) == 0;
  }
LABEL_129:

  return v15;
}

- (unint64_t)hash
{
  $5FD0D616E592121A3554181266B41E1D has;
  unint64_t v4;
  double slotsLimit;
  double v6;
  long double v7;
  double v8;
  $5FD0D616E592121A3554181266B41E1D v9;
  $5FD0D616E592121A3554181266B41E1D v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double scale;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  NSUInteger v19;
  unint64_t v20;
  $5FD0D616E592121A3554181266B41E1D v21;
  unint64_t v22;
  double minHeadlineScale;
  double v24;
  long double v25;
  double v26;
  unint64_t v27;
  double maxHeadlineScale;
  double v29;
  long double v30;
  double v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSUInteger v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    slotsLimit = self->_slotsLimit;
    v6 = -slotsLimit;
    if (slotsLimit >= 0.0)
      v6 = self->_slotsLimit;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v47 = 2654435761 * self->_respectsWidgetSlotsLimit;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_11:
      v46 = 2654435761 * self->_preferCompactSectionName;
      if ((*(_DWORD *)&has & 0x10000) != 0)
        goto LABEL_12;
      goto LABEL_17;
    }
  }
  else
  {
    v47 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_11;
  }
  v46 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_12:
    v45 = 2654435761 * self->_preferCompactSourceName;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_13;
LABEL_18:
    v44 = 0;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_14;
    goto LABEL_19;
  }
LABEL_17:
  v45 = 0;
  if ((*(_WORD *)&has & 0x100) == 0)
    goto LABEL_18;
LABEL_13:
  v44 = 2654435761 * self->_thumbnailSizePreset;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_14:
    v43 = 2654435761 * self->_sourceNameImageSizePreset;
    goto LABEL_20;
  }
LABEL_19:
  v43 = 0;
LABEL_20:
  v48 = v4;
  if ((*(_BYTE *)&has & 0x10) != 0)
    v42 = 2654435761 * self->_qualityOfService;
  else
    v42 = 0;
  v41 = -[NTPBSectionSlotCostInfo hash](self->_sectionSlotCostInfo, "hash");
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
    v40 = 0;
    if ((*(_WORD *)&v9 & 0x1000) != 0)
      goto LABEL_25;
LABEL_28:
    v39 = 0;
    if ((*(_DWORD *)&v9 & 0x40000) != 0)
      goto LABEL_26;
    goto LABEL_29;
  }
  v40 = 2654435761 * self->_fetchWidgetConfig;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
    goto LABEL_28;
LABEL_25:
  v39 = 2654435761 * self->_allowOnlyWatchEligibleSections;
  if ((*(_DWORD *)&v9 & 0x40000) != 0)
  {
LABEL_26:
    v38 = 2654435761 * self->_respectsWidgetVisibleSectionsPerQueueLimit;
    goto LABEL_30;
  }
LABEL_29:
  v38 = 0;
LABEL_30:
  v37 = -[NSString hash](self->_assetsDirectoryFileURLString, "hash");
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 2) != 0)
  {
    v36 = 2654435761 * self->_leadingCellThumbnailSizePreset;
    if ((*(_WORD *)&v10 & 0x400) != 0)
    {
LABEL_32:
      v34 = 2654435761 * self->_dynamicThumbnailSizePresetMinimumWidthInPixels;
      if ((*(_WORD *)&v10 & 0x200) != 0)
        goto LABEL_33;
      goto LABEL_42;
    }
  }
  else
  {
    v36 = 0;
    if ((*(_WORD *)&v10 & 0x400) != 0)
      goto LABEL_32;
  }
  v34 = 0;
  if ((*(_WORD *)&v10 & 0x200) != 0)
  {
LABEL_33:
    v11 = 2654435761 * self->_dynamicThumbnailSizePresetMinimumHeightInPixels;
    if ((*(_WORD *)&v10 & 0x2000) != 0)
      goto LABEL_34;
    goto LABEL_43;
  }
LABEL_42:
  v11 = 0;
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
LABEL_34:
    v12 = 2654435761 * self->_allowSectionTitles;
    if ((*(_BYTE *)&v10 & 1) != 0)
      goto LABEL_35;
LABEL_44:
    v13 = 0;
    if ((*(_BYTE *)&v10 & 0x20) != 0)
      goto LABEL_36;
LABEL_45:
    v18 = 0;
    goto LABEL_48;
  }
LABEL_43:
  v12 = 0;
  if ((*(_BYTE *)&v10 & 1) == 0)
    goto LABEL_44;
LABEL_35:
  v13 = 2654435761 * self->_embedsLimit;
  if ((*(_BYTE *)&v10 & 0x20) == 0)
    goto LABEL_45;
LABEL_36:
  scale = self->_scale;
  v15 = -scale;
  if (scale >= 0.0)
    v15 = self->_scale;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_48:
  v19 = -[NSString hash](self->_keyboardInputMode, "hash", v34);
  v20 = -[NTPBTodayModuleContentRequest hash](self->_request, "hash");
  v21 = self->_has;
  if ((*(_BYTE *)&v21 & 8) != 0)
  {
    minHeadlineScale = self->_minHeadlineScale;
    v24 = -minHeadlineScale;
    if (minHeadlineScale >= 0.0)
      v24 = self->_minHeadlineScale;
    v25 = floor(v24 + 0.5);
    v26 = (v24 - v25) * 1.84467441e19;
    v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0)
        v22 += (unint64_t)v26;
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    v22 = 0;
  }
  if ((*(_BYTE *)&v21 & 4) != 0)
  {
    maxHeadlineScale = self->_maxHeadlineScale;
    v29 = -maxHeadlineScale;
    if (maxHeadlineScale >= 0.0)
      v29 = self->_maxHeadlineScale;
    v30 = floor(v29 + 0.5);
    v31 = (v29 - v30) * 1.84467441e19;
    v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0)
        v27 += (unint64_t)v31;
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    v27 = 0;
  }
  if ((*(_WORD *)&v21 & 0x800) != 0)
    v32 = 2654435761 * self->_widgetSize;
  else
    v32 = 0;
  return v47 ^ v48 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v40 ^ v39 ^ v38 ^ v41 ^ v37 ^ v36 ^ v35 ^ v11 ^ v12 ^ v13 ^ v18 ^ v19 ^ v20 ^ v22 ^ v27 ^ v32;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  int v6;
  NTPBSectionSlotCostInfo *sectionSlotCostInfo;
  uint64_t v8;
  int v9;
  int v10;
  NTPBTodayModuleContentRequest *request;
  uint64_t v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = v4;
  v6 = *((_DWORD *)v4 + 33);
  if ((v6 & 0x40) != 0)
  {
    self->_slotsLimit = *((double *)v4 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
    v6 = *((_DWORD *)v4 + 33);
    if ((v6 & 0x20000) == 0)
    {
LABEL_3:
      if ((v6 & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v6 & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  self->_respectsWidgetSlotsLimit = *((_BYTE *)v4 + 129);
  *(_DWORD *)&self->_has |= 0x20000u;
  v6 = *((_DWORD *)v4 + 33);
  if ((v6 & 0x8000) == 0)
  {
LABEL_4:
    if ((v6 & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_preferCompactSectionName = *((_BYTE *)v4 + 127);
  *(_DWORD *)&self->_has |= 0x8000u;
  v6 = *((_DWORD *)v4 + 33);
  if ((v6 & 0x10000) == 0)
  {
LABEL_5:
    if ((v6 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_preferCompactSourceName = *((_BYTE *)v4 + 128);
  *(_DWORD *)&self->_has |= 0x10000u;
  v6 = *((_DWORD *)v4 + 33);
  if ((v6 & 0x100) == 0)
  {
LABEL_6:
    if ((v6 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_thumbnailSizePreset = *((_QWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v6 = *((_DWORD *)v4 + 33);
  if ((v6 & 0x80) == 0)
  {
LABEL_7:
    if ((v6 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  self->_sourceNameImageSizePreset = *((_QWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)v4 + 33) & 0x10) != 0)
  {
LABEL_8:
    self->_qualityOfService = *((_QWORD *)v4 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_9:
  sectionSlotCostInfo = self->_sectionSlotCostInfo;
  v8 = *((_QWORD *)v5 + 14);
  v14 = v5;
  if (sectionSlotCostInfo)
  {
    if (!v8)
      goto LABEL_22;
    -[NTPBSectionSlotCostInfo mergeFrom:](sectionSlotCostInfo, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_22;
    -[NTPBTodayResultOperationInfo setSectionSlotCostInfo:](self, "setSectionSlotCostInfo:");
  }
  v5 = v14;
LABEL_22:
  v9 = *((_DWORD *)v5 + 33);
  if ((v9 & 0x4000) != 0)
  {
    self->_fetchWidgetConfig = *((_BYTE *)v5 + 126);
    *(_DWORD *)&self->_has |= 0x4000u;
    v9 = *((_DWORD *)v5 + 33);
    if ((v9 & 0x1000) == 0)
    {
LABEL_24:
      if ((v9 & 0x40000) == 0)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  else if ((v9 & 0x1000) == 0)
  {
    goto LABEL_24;
  }
  self->_allowOnlyWatchEligibleSections = *((_BYTE *)v5 + 124);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v5 + 33) & 0x40000) != 0)
  {
LABEL_25:
    self->_respectsWidgetVisibleSectionsPerQueueLimit = *((_BYTE *)v5 + 130);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_26:
  if (*((_QWORD *)v5 + 10))
  {
    -[NTPBTodayResultOperationInfo setAssetsDirectoryFileURLString:](self, "setAssetsDirectoryFileURLString:");
    v5 = v14;
  }
  v10 = *((_DWORD *)v5 + 33);
  if ((v10 & 2) != 0)
  {
    self->_leadingCellThumbnailSizePreset = *((_QWORD *)v5 + 2);
    *(_DWORD *)&self->_has |= 2u;
    v10 = *((_DWORD *)v5 + 33);
    if ((v10 & 0x400) == 0)
    {
LABEL_30:
      if ((v10 & 0x200) == 0)
        goto LABEL_31;
      goto LABEL_45;
    }
  }
  else if ((v10 & 0x400) == 0)
  {
    goto LABEL_30;
  }
  self->_dynamicThumbnailSizePresetMinimumWidthInPixels = *((_DWORD *)v5 + 23);
  *(_DWORD *)&self->_has |= 0x400u;
  v10 = *((_DWORD *)v5 + 33);
  if ((v10 & 0x200) == 0)
  {
LABEL_31:
    if ((v10 & 0x2000) == 0)
      goto LABEL_32;
    goto LABEL_46;
  }
LABEL_45:
  self->_dynamicThumbnailSizePresetMinimumHeightInPixels = *((_DWORD *)v5 + 22);
  *(_DWORD *)&self->_has |= 0x200u;
  v10 = *((_DWORD *)v5 + 33);
  if ((v10 & 0x2000) == 0)
  {
LABEL_32:
    if ((v10 & 1) == 0)
      goto LABEL_33;
    goto LABEL_47;
  }
LABEL_46:
  self->_allowSectionTitles = *((_BYTE *)v5 + 125);
  *(_DWORD *)&self->_has |= 0x2000u;
  v10 = *((_DWORD *)v5 + 33);
  if ((v10 & 1) == 0)
  {
LABEL_33:
    if ((v10 & 0x20) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_47:
  self->_embedsLimit = *((_QWORD *)v5 + 1);
  *(_DWORD *)&self->_has |= 1u;
  if ((*((_DWORD *)v5 + 33) & 0x20) != 0)
  {
LABEL_34:
    self->_scale = *((double *)v5 + 6);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_35:
  if (*((_QWORD *)v5 + 12))
  {
    -[NTPBTodayResultOperationInfo setKeyboardInputMode:](self, "setKeyboardInputMode:");
    v5 = v14;
  }
  request = self->_request;
  v12 = *((_QWORD *)v5 + 13);
  if (request)
  {
    if (!v12)
      goto LABEL_52;
    -[NTPBTodayModuleContentRequest mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_52;
    -[NTPBTodayResultOperationInfo setRequest:](self, "setRequest:");
  }
  v5 = v14;
LABEL_52:
  v13 = *((_DWORD *)v5 + 33);
  if ((v13 & 8) == 0)
  {
    if ((v13 & 4) == 0)
      goto LABEL_54;
LABEL_58:
    self->_maxHeadlineScale = *((double *)v5 + 3);
    *(_DWORD *)&self->_has |= 4u;
    if ((*((_DWORD *)v5 + 33) & 0x800) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
  self->_minHeadlineScale = *((double *)v5 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v13 = *((_DWORD *)v5 + 33);
  if ((v13 & 4) != 0)
    goto LABEL_58;
LABEL_54:
  if ((v13 & 0x800) != 0)
  {
LABEL_55:
    self->_widgetSize = *((_DWORD *)v5 + 30);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_56:

}

- (double)slotsLimit
{
  return self->_slotsLimit;
}

- (BOOL)respectsWidgetSlotsLimit
{
  return self->_respectsWidgetSlotsLimit;
}

- (BOOL)preferCompactSectionName
{
  return self->_preferCompactSectionName;
}

- (BOOL)preferCompactSourceName
{
  return self->_preferCompactSourceName;
}

- (int64_t)thumbnailSizePreset
{
  return self->_thumbnailSizePreset;
}

- (int64_t)sourceNameImageSizePreset
{
  return self->_sourceNameImageSizePreset;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (NTPBSectionSlotCostInfo)sectionSlotCostInfo
{
  return self->_sectionSlotCostInfo;
}

- (void)setSectionSlotCostInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sectionSlotCostInfo, a3);
}

- (BOOL)fetchWidgetConfig
{
  return self->_fetchWidgetConfig;
}

- (BOOL)allowOnlyWatchEligibleSections
{
  return self->_allowOnlyWatchEligibleSections;
}

- (BOOL)respectsWidgetVisibleSectionsPerQueueLimit
{
  return self->_respectsWidgetVisibleSectionsPerQueueLimit;
}

- (NSString)assetsDirectoryFileURLString
{
  return self->_assetsDirectoryFileURLString;
}

- (void)setAssetsDirectoryFileURLString:(id)a3
{
  objc_storeStrong((id *)&self->_assetsDirectoryFileURLString, a3);
}

- (int64_t)leadingCellThumbnailSizePreset
{
  return self->_leadingCellThumbnailSizePreset;
}

- (unsigned)dynamicThumbnailSizePresetMinimumWidthInPixels
{
  return self->_dynamicThumbnailSizePresetMinimumWidthInPixels;
}

- (unsigned)dynamicThumbnailSizePresetMinimumHeightInPixels
{
  return self->_dynamicThumbnailSizePresetMinimumHeightInPixels;
}

- (BOOL)allowSectionTitles
{
  return self->_allowSectionTitles;
}

- (int64_t)embedsLimit
{
  return self->_embedsLimit;
}

- (double)scale
{
  return self->_scale;
}

- (NSString)keyboardInputMode
{
  return self->_keyboardInputMode;
}

- (void)setKeyboardInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardInputMode, a3);
}

- (NTPBTodayModuleContentRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (double)minHeadlineScale
{
  return self->_minHeadlineScale;
}

- (double)maxHeadlineScale
{
  return self->_maxHeadlineScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionSlotCostInfo, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_keyboardInputMode, 0);
  objc_storeStrong((id *)&self->_assetsDirectoryFileURLString, 0);
}

@end
