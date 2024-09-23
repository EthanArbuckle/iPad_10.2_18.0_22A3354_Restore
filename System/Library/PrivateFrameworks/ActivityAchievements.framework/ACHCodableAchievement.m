@implementation ACHCodableAchievement

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  __int16 has;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  __int16 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_achievementTemplate)
    PBDataWriterWriteSubmessage();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = self->_earnedInstances;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v7);
  }

  if (self->_localizationBundleURL)
    PBDataWriterWriteStringField();
  if (self->_resourceBundleURL)
    PBDataWriterWriteStringField();
  if (self->_stickerBundleURL)
    PBDataWriterWriteStringField();
  if (self->_badgeShapeName)
    PBDataWriterWriteStringField();
  if (self->_badgeMetalColor)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_badgeEnamelColor)
    PBDataWriterWriteSubmessage();
  if (self->_propertyListBundleURL)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_progressUnitString)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_goalUnitString)
    PBDataWriterWriteStringField();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = self->_customPlaceholderValues;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v12);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = self->_textureFilenames;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v17);
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_section)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_enamelTriColor1)
    PBDataWriterWriteSubmessage();
  if (self->_enamelTriColor2)
    PBDataWriterWriteSubmessage();
  if (self->_enamelTriColor3)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_relevantEarnedInstance)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_has & 2) != 0)
    PBDataWriterWriteInt64Field();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v21 = self->_badgeModelFilenames;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v28;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteStringField();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v23);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_glyphTextureFilename)
    PBDataWriterWriteStringField();
  v26 = (__int16)self->_has;
  if ((v26 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v26 = (__int16)self->_has;
  }
  if ((v26 & 8) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_syncIdentity)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)badgeUsesTriColorEnamel
{
  return self->_badgeUsesTriColorEnamel;
}

- (BOOL)unearnedUsesTwoToneEnamel
{
  return self->_unearnedUsesTwoToneEnamel;
}

- (NSMutableArray)textureFilenames
{
  return self->_textureFilenames;
}

- (NSString)section
{
  return self->_section;
}

- (NSString)resourceBundleURL
{
  return self->_resourceBundleURL;
}

- (NSString)propertyListBundleURL
{
  return self->_propertyListBundleURL;
}

- (BOOL)prerequisiteMet
{
  return self->_prerequisiteMet;
}

- (NSString)localizationBundleURL
{
  return self->_localizationBundleURL;
}

- (BOOL)hasStickerBundleURL
{
  return self->_stickerBundleURL != 0;
}

- (BOOL)hasResourceBundleURL
{
  return self->_resourceBundleURL != 0;
}

- (BOOL)hasRelevantEarnedInstance
{
  return self->_relevantEarnedInstance != 0;
}

- (BOOL)hasPropertyListBundleURL
{
  return self->_propertyListBundleURL != 0;
}

- (BOOL)hasProgressValue
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasLocalizationBundleURL
{
  return self->_localizationBundleURL != 0;
}

- (BOOL)hasGoalValue
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasEarnedInstanceCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasBadgeModelVersion
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasBadgeMetalColor
{
  return self->_badgeMetalColor != 0;
}

- (BOOL)hasBadgeEnamelColor
{
  return self->_badgeEnamelColor != 0;
}

- (double)glyphTextureScale
{
  return self->_glyphTextureScale;
}

- (NSString)glyphTextureFilename
{
  return self->_glyphTextureFilename;
}

- (double)glyphPositionOffsetY
{
  return self->_glyphPositionOffsetY;
}

- (double)glyphPositionOffsetX
{
  return self->_glyphPositionOffsetX;
}

- (BOOL)faceHasMetalInlay
{
  return self->_faceHasMetalInlay;
}

- (NSMutableArray)earnedInstances
{
  return self->_earnedInstances;
}

- (int64_t)earnedInstanceCount
{
  return self->_earnedInstanceCount;
}

- (unint64_t)customPlaceholderValuesCount
{
  return -[NSMutableArray count](self->_customPlaceholderValues, "count");
}

- (BOOL)badgeUsesFullColorEnamel
{
  return self->_badgeUsesFullColorEnamel;
}

- (NSString)badgeShapeName
{
  return self->_badgeShapeName;
}

- (int64_t)badgeModelVersion
{
  return self->_badgeModelVersion;
}

- (NSMutableArray)badgeModelFilenames
{
  return self->_badgeModelFilenames;
}

- (ACHCodableColor)badgeMetalColor
{
  return self->_badgeMetalColor;
}

- (ACHCodableColor)badgeEnamelColor
{
  return self->_badgeEnamelColor;
}

- (ACHCodableTemplate)achievementTemplate
{
  return self->_achievementTemplate;
}

- (void)setUnearnedUsesTwoToneEnamel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unearnedUsesTwoToneEnamel = a3;
}

- (void)setTextureFilenames:(id)a3
{
  objc_storeStrong((id *)&self->_textureFilenames, a3);
}

- (void)setStickerBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_stickerBundleURL, a3);
}

- (void)setSection:(id)a3
{
  objc_storeStrong((id *)&self->_section, a3);
}

- (void)setResourceBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_resourceBundleURL, a3);
}

- (void)setPropertyListBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_propertyListBundleURL, a3);
}

- (void)setPrerequisiteMet:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_prerequisiteMet = a3;
}

- (void)setLocalizationBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_localizationBundleURL, a3);
}

- (void)setGlyphTextureScale:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_glyphTextureScale = a3;
}

- (void)setGlyphTextureFilename:(id)a3
{
  objc_storeStrong((id *)&self->_glyphTextureFilename, a3);
}

- (void)setGlyphPositionOffsetY:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_glyphPositionOffsetY = a3;
}

- (void)setGlyphPositionOffsetX:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_glyphPositionOffsetX = a3;
}

- (void)setFaceHasMetalInlay:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_faceHasMetalInlay = a3;
}

- (void)setEarnedInstances:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstances, a3);
}

- (void)setEarnedInstanceCount:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_earnedInstanceCount = a3;
}

- (void)setBadgeUsesTriColorEnamel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_badgeUsesTriColorEnamel = a3;
}

- (void)setBadgeUsesFullColorEnamel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_badgeUsesFullColorEnamel = a3;
}

- (void)setBadgeShapeName:(id)a3
{
  objc_storeStrong((id *)&self->_badgeShapeName, a3);
}

- (void)setBadgeModelVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_badgeModelVersion = a3;
}

- (void)setBadgeModelFilenames:(id)a3
{
  objc_storeStrong((id *)&self->_badgeModelFilenames, a3);
}

- (void)setBadgeMetalColor:(id)a3
{
  objc_storeStrong((id *)&self->_badgeMetalColor, a3);
}

- (void)setBadgeEnamelColor:(id)a3
{
  objc_storeStrong((id *)&self->_badgeEnamelColor, a3);
}

- (void)setAchievementTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_achievementTemplate, a3);
}

- (void)setProgressValue:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_progressValue = a3;
}

- (void)setProgressUnitString:(id)a3
{
  objc_storeStrong((id *)&self->_progressUnitString, a3);
}

- (void)setGoalValue:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_goalValue = a3;
}

- (void)setGoalUnitString:(id)a3
{
  objc_storeStrong((id *)&self->_goalUnitString, a3);
}

- (double)progressValue
{
  return self->_progressValue;
}

- (NSString)progressUnitString
{
  return self->_progressUnitString;
}

- (BOOL)hasProgressUnitString
{
  return self->_progressUnitString != 0;
}

- (BOOL)hasGoalUnitString
{
  return self->_goalUnitString != 0;
}

- (double)goalValue
{
  return self->_goalValue;
}

- (NSString)goalUnitString
{
  return self->_goalUnitString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureFilenames, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_stickerBundleURL, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_resourceBundleURL, 0);
  objc_storeStrong((id *)&self->_relevantEarnedInstance, 0);
  objc_storeStrong((id *)&self->_propertyListBundleURL, 0);
  objc_storeStrong((id *)&self->_progressUnitString, 0);
  objc_storeStrong((id *)&self->_localizationBundleURL, 0);
  objc_storeStrong((id *)&self->_goalUnitString, 0);
  objc_storeStrong((id *)&self->_glyphTextureFilename, 0);
  objc_storeStrong((id *)&self->_enamelTriColor3, 0);
  objc_storeStrong((id *)&self->_enamelTriColor2, 0);
  objc_storeStrong((id *)&self->_enamelTriColor1, 0);
  objc_storeStrong((id *)&self->_earnedInstances, 0);
  objc_storeStrong((id *)&self->_customPlaceholderValues, 0);
  objc_storeStrong((id *)&self->_badgeShapeName, 0);
  objc_storeStrong((id *)&self->_badgeModelFilenames, 0);
  objc_storeStrong((id *)&self->_badgeMetalColor, 0);
  objc_storeStrong((id *)&self->_badgeEnamelColor, 0);
  objc_storeStrong((id *)&self->_achievementTemplate, 0);
}

- (void)addBadgeModelFilenames:(id)a3
{
  id v4;
  NSMutableArray *badgeModelFilenames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  badgeModelFilenames = self->_badgeModelFilenames;
  v8 = v4;
  if (!badgeModelFilenames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_badgeModelFilenames;
    self->_badgeModelFilenames = v6;

    v4 = v8;
    badgeModelFilenames = self->_badgeModelFilenames;
  }
  -[NSMutableArray addObject:](badgeModelFilenames, "addObject:", v4);

}

- (void)addTextureFilenames:(id)a3
{
  id v4;
  NSMutableArray *textureFilenames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  textureFilenames = self->_textureFilenames;
  v8 = v4;
  if (!textureFilenames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_textureFilenames;
    self->_textureFilenames = v6;

    v4 = v8;
    textureFilenames = self->_textureFilenames;
  }
  -[NSMutableArray addObject:](textureFilenames, "addObject:", v4);

}

- (BOOL)hasAchievementTemplate
{
  return self->_achievementTemplate != 0;
}

- (void)clearEarnedInstances
{
  -[NSMutableArray removeAllObjects](self->_earnedInstances, "removeAllObjects");
}

- (void)addEarnedInstances:(id)a3
{
  id v4;
  NSMutableArray *earnedInstances;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  earnedInstances = self->_earnedInstances;
  v8 = v4;
  if (!earnedInstances)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_earnedInstances;
    self->_earnedInstances = v6;

    v4 = v8;
    earnedInstances = self->_earnedInstances;
  }
  -[NSMutableArray addObject:](earnedInstances, "addObject:", v4);

}

- (unint64_t)earnedInstancesCount
{
  return -[NSMutableArray count](self->_earnedInstances, "count");
}

- (id)earnedInstancesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_earnedInstances, "objectAtIndex:", a3);
}

+ (Class)earnedInstancesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBadgeShapeName
{
  return self->_badgeShapeName != 0;
}

- (void)setHasBadgeUsesFullColorEnamel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasBadgeUsesFullColorEnamel
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasProgressValue:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setHasGoalValue:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)clearCustomPlaceholderValues
{
  -[NSMutableArray removeAllObjects](self->_customPlaceholderValues, "removeAllObjects");
}

- (void)addCustomPlaceholderValues:(id)a3
{
  id v4;
  NSMutableArray *customPlaceholderValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  customPlaceholderValues = self->_customPlaceholderValues;
  v8 = v4;
  if (!customPlaceholderValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_customPlaceholderValues;
    self->_customPlaceholderValues = v6;

    v4 = v8;
    customPlaceholderValues = self->_customPlaceholderValues;
  }
  -[NSMutableArray addObject:](customPlaceholderValues, "addObject:", v4);

}

- (id)customPlaceholderValuesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_customPlaceholderValues, "objectAtIndex:", a3);
}

+ (Class)customPlaceholderValuesType
{
  return (Class)objc_opt_class();
}

- (void)clearTextureFilenames
{
  -[NSMutableArray removeAllObjects](self->_textureFilenames, "removeAllObjects");
}

- (unint64_t)textureFilenamesCount
{
  return -[NSMutableArray count](self->_textureFilenames, "count");
}

- (id)textureFilenamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_textureFilenames, "objectAtIndex:", a3);
}

+ (Class)textureFilenamesType
{
  return (Class)objc_opt_class();
}

- (void)setHasUnearnedUsesTwoToneEnamel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUnearnedUsesTwoToneEnamel
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasSection
{
  return self->_section != 0;
}

- (void)setHasFaceHasMetalInlay:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasFaceHasMetalInlay
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasBadgeUsesTriColorEnamel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasBadgeUsesTriColorEnamel
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasEnamelTriColor1
{
  return self->_enamelTriColor1 != 0;
}

- (BOOL)hasEnamelTriColor2
{
  return self->_enamelTriColor2 != 0;
}

- (BOOL)hasEnamelTriColor3
{
  return self->_enamelTriColor3 != 0;
}

- (void)setHasBadgeModelVersion:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setHasEarnedInstanceCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)clearBadgeModelFilenames
{
  -[NSMutableArray removeAllObjects](self->_badgeModelFilenames, "removeAllObjects");
}

- (unint64_t)badgeModelFilenamesCount
{
  return -[NSMutableArray count](self->_badgeModelFilenames, "count");
}

- (id)badgeModelFilenamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_badgeModelFilenames, "objectAtIndex:", a3);
}

+ (Class)badgeModelFilenamesType
{
  return (Class)objc_opt_class();
}

- (void)setHasGlyphTextureScale:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasGlyphTextureScale
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasGlyphTextureFilename
{
  return self->_glyphTextureFilename != 0;
}

- (void)setHasGlyphPositionOffsetX:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGlyphPositionOffsetX
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasGlyphPositionOffsetY:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGlyphPositionOffsetY
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (void)setHasPrerequisiteMet:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPrerequisiteMet
{
  return (*(_WORD *)&self->_has >> 10) & 1;
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
  v8.super_class = (Class)ACHCodableAchievement;
  -[ACHCodableAchievement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ACHCodableTemplate *achievementTemplate;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSString *localizationBundleURL;
  NSString *resourceBundleURL;
  NSString *stickerBundleURL;
  NSString *badgeShapeName;
  ACHCodableColor *badgeMetalColor;
  void *v18;
  void *v19;
  ACHCodableColor *badgeEnamelColor;
  void *v21;
  NSString *propertyListBundleURL;
  void *v23;
  NSString *progressUnitString;
  void *v25;
  NSString *goalUnitString;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  NSMutableArray *textureFilenames;
  void *v35;
  NSString *section;
  __int16 has;
  void *v38;
  void *v39;
  ACHCodableColor *enamelTriColor1;
  void *v41;
  ACHCodableColor *enamelTriColor2;
  void *v43;
  ACHCodableColor *enamelTriColor3;
  void *v45;
  void *v46;
  ACHCodableEarnedInstance *relevantEarnedInstance;
  void *v48;
  void *v49;
  NSMutableArray *badgeModelFilenames;
  void *v51;
  NSString *glyphTextureFilename;
  __int16 v53;
  void *v54;
  void *v55;
  ACHCodableSyncIdentity *syncIdentity;
  void *v57;
  void *v58;
  id v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  achievementTemplate = self->_achievementTemplate;
  if (achievementTemplate)
  {
    -[ACHCodableTemplate dictionaryRepresentation](achievementTemplate, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("achievementTemplate"));

  }
  if (-[NSMutableArray count](self->_earnedInstances, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_earnedInstances, "count"));
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v7 = self->_earnedInstances;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v66 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("earnedInstances"));
  }
  localizationBundleURL = self->_localizationBundleURL;
  if (localizationBundleURL)
    objc_msgSend(v3, "setObject:forKey:", localizationBundleURL, CFSTR("localizationBundleURL"));
  resourceBundleURL = self->_resourceBundleURL;
  if (resourceBundleURL)
    objc_msgSend(v3, "setObject:forKey:", resourceBundleURL, CFSTR("resourceBundleURL"));
  stickerBundleURL = self->_stickerBundleURL;
  if (stickerBundleURL)
    objc_msgSend(v3, "setObject:forKey:", stickerBundleURL, CFSTR("stickerBundleURL"));
  badgeShapeName = self->_badgeShapeName;
  if (badgeShapeName)
    objc_msgSend(v3, "setObject:forKey:", badgeShapeName, CFSTR("badgeShapeName"));
  badgeMetalColor = self->_badgeMetalColor;
  if (badgeMetalColor)
  {
    -[ACHCodableColor dictionaryRepresentation](badgeMetalColor, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("badgeMetalColor"));

  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_badgeUsesFullColorEnamel);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("badgeUsesFullColorEnamel"));

  }
  badgeEnamelColor = self->_badgeEnamelColor;
  if (badgeEnamelColor)
  {
    -[ACHCodableColor dictionaryRepresentation](badgeEnamelColor, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("badgeEnamelColor"));

  }
  propertyListBundleURL = self->_propertyListBundleURL;
  if (propertyListBundleURL)
    objc_msgSend(v3, "setObject:forKey:", propertyListBundleURL, CFSTR("propertyListBundleURL"));
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_progressValue);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("progressValue"));

  }
  progressUnitString = self->_progressUnitString;
  if (progressUnitString)
    objc_msgSend(v3, "setObject:forKey:", progressUnitString, CFSTR("progressUnitString"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_goalValue);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("goalValue"));

  }
  goalUnitString = self->_goalUnitString;
  if (goalUnitString)
    objc_msgSend(v3, "setObject:forKey:", goalUnitString, CFSTR("goalUnitString"));
  if (-[NSMutableArray count](self->_customPlaceholderValues, "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_customPlaceholderValues, "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v28 = self->_customPlaceholderValues;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v62 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v61);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v30);
    }

    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("customPlaceholderValues"));
  }
  textureFilenames = self->_textureFilenames;
  if (textureFilenames)
    objc_msgSend(v3, "setObject:forKey:", textureFilenames, CFSTR("textureFilenames"));
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_unearnedUsesTwoToneEnamel);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("unearnedUsesTwoToneEnamel"));

  }
  section = self->_section;
  if (section)
    objc_msgSend(v3, "setObject:forKey:", section, CFSTR("section"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_faceHasMetalInlay);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("faceHasMetalInlay"));

    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_badgeUsesTriColorEnamel);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("badgeUsesTriColorEnamel"));

  }
  enamelTriColor1 = self->_enamelTriColor1;
  if (enamelTriColor1)
  {
    -[ACHCodableColor dictionaryRepresentation](enamelTriColor1, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("enamelTriColor1"));

  }
  enamelTriColor2 = self->_enamelTriColor2;
  if (enamelTriColor2)
  {
    -[ACHCodableColor dictionaryRepresentation](enamelTriColor2, "dictionaryRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("enamelTriColor2"));

  }
  enamelTriColor3 = self->_enamelTriColor3;
  if (enamelTriColor3)
  {
    -[ACHCodableColor dictionaryRepresentation](enamelTriColor3, "dictionaryRepresentation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("enamelTriColor3"));

  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_badgeModelVersion);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("badgeModelVersion"));

  }
  relevantEarnedInstance = self->_relevantEarnedInstance;
  if (relevantEarnedInstance)
  {
    -[ACHCodableEarnedInstance dictionaryRepresentation](relevantEarnedInstance, "dictionaryRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("relevantEarnedInstance"));

  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_earnedInstanceCount);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("earnedInstanceCount"));

  }
  badgeModelFilenames = self->_badgeModelFilenames;
  if (badgeModelFilenames)
    objc_msgSend(v3, "setObject:forKey:", badgeModelFilenames, CFSTR("badgeModelFilenames"));
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_glyphTextureScale);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("glyphTextureScale"));

  }
  glyphTextureFilename = self->_glyphTextureFilename;
  if (glyphTextureFilename)
    objc_msgSend(v3, "setObject:forKey:", glyphTextureFilename, CFSTR("glyphTextureFilename"));
  v53 = (__int16)self->_has;
  if ((v53 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_glyphPositionOffsetX);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("glyphPositionOffsetX"));

    v53 = (__int16)self->_has;
  }
  if ((v53 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_glyphPositionOffsetY);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("glyphPositionOffsetY"));

  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[ACHCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("syncIdentity"));

  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_prerequisiteMet);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("prerequisiteMet"));

  }
  v59 = v3;

  return v59;
}

- (BOOL)readFrom:(id)a3
{
  return ACHCodableAchievementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  _BYTE *v17;
  __int16 has;
  unint64_t v19;
  unint64_t v20;
  uint64_t m;
  void *v22;
  _QWORD *v23;
  __int16 v24;
  id v25;

  v25 = a3;
  if (self->_achievementTemplate)
    objc_msgSend(v25, "setAchievementTemplate:");
  if (-[ACHCodableAchievement earnedInstancesCount](self, "earnedInstancesCount"))
  {
    objc_msgSend(v25, "clearEarnedInstances");
    v4 = -[ACHCodableAchievement earnedInstancesCount](self, "earnedInstancesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ACHCodableAchievement earnedInstancesAtIndex:](self, "earnedInstancesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addEarnedInstances:", v7);

      }
    }
  }
  if (self->_localizationBundleURL)
    objc_msgSend(v25, "setLocalizationBundleURL:");
  v8 = v25;
  if (self->_resourceBundleURL)
  {
    objc_msgSend(v25, "setResourceBundleURL:");
    v8 = v25;
  }
  if (self->_stickerBundleURL)
  {
    objc_msgSend(v25, "setStickerBundleURL:");
    v8 = v25;
  }
  if (self->_badgeShapeName)
  {
    objc_msgSend(v25, "setBadgeShapeName:");
    v8 = v25;
  }
  if (self->_badgeMetalColor)
  {
    objc_msgSend(v25, "setBadgeMetalColor:");
    v8 = v25;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v8[232] = self->_badgeUsesFullColorEnamel;
    *((_WORD *)v8 + 120) |= 0x80u;
  }
  if (self->_badgeEnamelColor)
  {
    objc_msgSend(v25, "setBadgeEnamelColor:");
    v8 = v25;
  }
  if (self->_propertyListBundleURL)
  {
    objc_msgSend(v25, "setPropertyListBundleURL:");
    v8 = v25;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *((_QWORD *)v8 + 7) = *(_QWORD *)&self->_progressValue;
    *((_WORD *)v8 + 120) |= 0x40u;
  }
  if (self->_progressUnitString)
  {
    objc_msgSend(v25, "setProgressUnitString:");
    v8 = v25;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_QWORD *)v8 + 6) = *(_QWORD *)&self->_goalValue;
    *((_WORD *)v8 + 120) |= 0x20u;
  }
  if (self->_goalUnitString)
    objc_msgSend(v25, "setGoalUnitString:");
  if (-[ACHCodableAchievement customPlaceholderValuesCount](self, "customPlaceholderValuesCount"))
  {
    objc_msgSend(v25, "clearCustomPlaceholderValues");
    v9 = -[ACHCodableAchievement customPlaceholderValuesCount](self, "customPlaceholderValuesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[ACHCodableAchievement customPlaceholderValuesAtIndex:](self, "customPlaceholderValuesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addCustomPlaceholderValues:", v12);

      }
    }
  }
  if (-[ACHCodableAchievement textureFilenamesCount](self, "textureFilenamesCount"))
  {
    objc_msgSend(v25, "clearTextureFilenames");
    v13 = -[ACHCodableAchievement textureFilenamesCount](self, "textureFilenamesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[ACHCodableAchievement textureFilenamesAtIndex:](self, "textureFilenamesAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addTextureFilenames:", v16);

      }
    }
  }
  v17 = v25;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *((_BYTE *)v25 + 236) = self->_unearnedUsesTwoToneEnamel;
    *((_WORD *)v25 + 120) |= 0x800u;
  }
  if (self->_section)
  {
    objc_msgSend(v25, "setSection:");
    v17 = v25;
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v17[234] = self->_faceHasMetalInlay;
    *((_WORD *)v17 + 120) |= 0x200u;
    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    v17[233] = self->_badgeUsesTriColorEnamel;
    *((_WORD *)v17 + 120) |= 0x100u;
  }
  if (self->_enamelTriColor1)
  {
    objc_msgSend(v25, "setEnamelTriColor1:");
    v17 = v25;
  }
  if (self->_enamelTriColor2)
  {
    objc_msgSend(v25, "setEnamelTriColor2:");
    v17 = v25;
  }
  if (self->_enamelTriColor3)
  {
    objc_msgSend(v25, "setEnamelTriColor3:");
    v17 = v25;
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v17 + 1) = self->_badgeModelVersion;
    *((_WORD *)v17 + 120) |= 1u;
  }
  if (self->_relevantEarnedInstance)
  {
    objc_msgSend(v25, "setRelevantEarnedInstance:");
    v17 = v25;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v17 + 2) = self->_earnedInstanceCount;
    *((_WORD *)v17 + 120) |= 2u;
  }
  if (-[ACHCodableAchievement badgeModelFilenamesCount](self, "badgeModelFilenamesCount"))
  {
    objc_msgSend(v25, "clearBadgeModelFilenames");
    v19 = -[ACHCodableAchievement badgeModelFilenamesCount](self, "badgeModelFilenamesCount");
    if (v19)
    {
      v20 = v19;
      for (m = 0; m != v20; ++m)
      {
        -[ACHCodableAchievement badgeModelFilenamesAtIndex:](self, "badgeModelFilenamesAtIndex:", m);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addBadgeModelFilenames:", v22);

      }
    }
  }
  v23 = v25;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((_QWORD *)v25 + 5) = *(_QWORD *)&self->_glyphTextureScale;
    *((_WORD *)v25 + 120) |= 0x10u;
  }
  if (self->_glyphTextureFilename)
  {
    objc_msgSend(v25, "setGlyphTextureFilename:");
    v23 = v25;
  }
  v24 = (__int16)self->_has;
  if ((v24 & 4) != 0)
  {
    v23[3] = *(_QWORD *)&self->_glyphPositionOffsetX;
    *((_WORD *)v23 + 120) |= 4u;
    v24 = (__int16)self->_has;
  }
  if ((v24 & 8) != 0)
  {
    v23[4] = *(_QWORD *)&self->_glyphPositionOffsetY;
    *((_WORD *)v23 + 120) |= 8u;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v25, "setSyncIdentity:");
    v23 = v25;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_BYTE *)v23 + 235) = self->_prerequisiteMet;
    *((_WORD *)v23 + 120) |= 0x400u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  uint64_t v44;
  void *v45;
  __int16 has;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  void *v60;
  uint64_t v61;
  void *v62;
  __int16 v63;
  id v64;
  void *v65;
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
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ACHCodableTemplate copyWithZone:](self->_achievementTemplate, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v8 = self->_earnedInstances;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v80 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEarnedInstances:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_localizationBundleURL, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v14;

  v16 = -[NSString copyWithZone:](self->_resourceBundleURL, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v16;

  v18 = -[NSString copyWithZone:](self->_stickerBundleURL, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v18;

  v20 = -[NSString copyWithZone:](self->_badgeShapeName, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v20;

  v22 = -[ACHCodableColor copyWithZone:](self->_badgeMetalColor, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v22;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 232) = self->_badgeUsesFullColorEnamel;
    *(_WORD *)(v5 + 240) |= 0x80u;
  }
  v24 = -[ACHCodableColor copyWithZone:](self->_badgeEnamelColor, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v24;

  v26 = -[NSString copyWithZone:](self->_propertyListBundleURL, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v26;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(double *)(v5 + 56) = self->_progressValue;
    *(_WORD *)(v5 + 240) |= 0x40u;
  }
  v28 = -[NSString copyWithZone:](self->_progressUnitString, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v28;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_goalValue;
    *(_WORD *)(v5 + 240) |= 0x20u;
  }
  v30 = -[NSString copyWithZone:](self->_goalUnitString, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v30;

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v32 = self->_customPlaceholderValues;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v76 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCustomPlaceholderValues:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
    }
    while (v34);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v38 = self->_textureFilenames;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v72;
    do
    {
      for (k = 0; k != v40; ++k)
      {
        if (*(_QWORD *)v72 != v41)
          objc_enumerationMutation(v38);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTextureFilenames:", v43);

      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
    }
    while (v40);
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *(_BYTE *)(v5 + 236) = self->_unearnedUsesTwoToneEnamel;
    *(_WORD *)(v5 + 240) |= 0x800u;
  }
  v44 = -[NSString copyWithZone:](self->_section, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v44;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 234) = self->_faceHasMetalInlay;
    *(_WORD *)(v5 + 240) |= 0x200u;
    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    *(_BYTE *)(v5 + 233) = self->_badgeUsesTriColorEnamel;
    *(_WORD *)(v5 + 240) |= 0x100u;
  }
  v47 = -[ACHCodableColor copyWithZone:](self->_enamelTriColor1, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v47;

  v49 = -[ACHCodableColor copyWithZone:](self->_enamelTriColor2, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v49;

  v51 = -[ACHCodableColor copyWithZone:](self->_enamelTriColor3, "copyWithZone:", a3);
  v52 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v51;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_badgeModelVersion;
    *(_WORD *)(v5 + 240) |= 1u;
  }
  v53 = -[ACHCodableEarnedInstance copyWithZone:](self->_relevantEarnedInstance, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v53;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_earnedInstanceCount;
    *(_WORD *)(v5 + 240) |= 2u;
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v55 = self->_badgeModelFilenames;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v68;
    do
    {
      for (m = 0; m != v57; ++m)
      {
        if (*(_QWORD *)v68 != v58)
          objc_enumerationMutation(v55);
        v60 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v67);
        objc_msgSend((id)v5, "addBadgeModelFilenames:", v60);

      }
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
    }
    while (v57);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(double *)(v5 + 40) = self->_glyphTextureScale;
    *(_WORD *)(v5 + 240) |= 0x10u;
  }
  v61 = -[NSString copyWithZone:](self->_glyphTextureFilename, "copyWithZone:", a3, (_QWORD)v67);
  v62 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v61;

  v63 = (__int16)self->_has;
  if ((v63 & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_glyphPositionOffsetX;
    *(_WORD *)(v5 + 240) |= 4u;
    v63 = (__int16)self->_has;
  }
  if ((v63 & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_glyphPositionOffsetY;
    *(_WORD *)(v5 + 240) |= 8u;
  }
  v64 = -[ACHCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v65 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v64;

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 235) = self->_prerequisiteMet;
    *(_WORD *)(v5 + 240) |= 0x400u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ACHCodableTemplate *achievementTemplate;
  NSMutableArray *earnedInstances;
  NSString *localizationBundleURL;
  NSString *resourceBundleURL;
  NSString *stickerBundleURL;
  NSString *badgeShapeName;
  ACHCodableColor *badgeMetalColor;
  __int16 v12;
  ACHCodableColor *badgeEnamelColor;
  NSString *propertyListBundleURL;
  __int16 has;
  __int16 v16;
  NSString *progressUnitString;
  __int16 v18;
  NSString *goalUnitString;
  NSMutableArray *customPlaceholderValues;
  NSMutableArray *textureFilenames;
  __int16 v22;
  NSString *section;
  ACHCodableColor *enamelTriColor1;
  ACHCodableColor *enamelTriColor2;
  ACHCodableColor *enamelTriColor3;
  __int16 v27;
  __int16 v28;
  ACHCodableEarnedInstance *relevantEarnedInstance;
  __int16 v30;
  NSMutableArray *badgeModelFilenames;
  __int16 v32;
  NSString *glyphTextureFilename;
  __int16 v34;
  ACHCodableSyncIdentity *syncIdentity;
  BOOL v36;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_120;
  achievementTemplate = self->_achievementTemplate;
  if ((unint64_t)achievementTemplate | *((_QWORD *)v4 + 8))
  {
    if (!-[ACHCodableTemplate isEqual:](achievementTemplate, "isEqual:"))
      goto LABEL_120;
  }
  earnedInstances = self->_earnedInstances;
  if ((unint64_t)earnedInstances | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](earnedInstances, "isEqual:"))
      goto LABEL_120;
  }
  localizationBundleURL = self->_localizationBundleURL;
  if ((unint64_t)localizationBundleURL | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](localizationBundleURL, "isEqual:"))
      goto LABEL_120;
  }
  resourceBundleURL = self->_resourceBundleURL;
  if ((unint64_t)resourceBundleURL | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](resourceBundleURL, "isEqual:"))
      goto LABEL_120;
  }
  stickerBundleURL = self->_stickerBundleURL;
  if ((unint64_t)stickerBundleURL | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](stickerBundleURL, "isEqual:"))
      goto LABEL_120;
  }
  badgeShapeName = self->_badgeShapeName;
  if ((unint64_t)badgeShapeName | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](badgeShapeName, "isEqual:"))
      goto LABEL_120;
  }
  badgeMetalColor = self->_badgeMetalColor;
  if ((unint64_t)badgeMetalColor | *((_QWORD *)v4 + 10))
  {
    if (!-[ACHCodableColor isEqual:](badgeMetalColor, "isEqual:"))
      goto LABEL_120;
  }
  v12 = *((_WORD *)v4 + 120);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0)
      goto LABEL_120;
    if (self->_badgeUsesFullColorEnamel)
    {
      if (!*((_BYTE *)v4 + 232))
        goto LABEL_120;
    }
    else if (*((_BYTE *)v4 + 232))
    {
      goto LABEL_120;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_120;
  }
  badgeEnamelColor = self->_badgeEnamelColor;
  if ((unint64_t)badgeEnamelColor | *((_QWORD *)v4 + 9)
    && !-[ACHCodableColor isEqual:](badgeEnamelColor, "isEqual:"))
  {
    goto LABEL_120;
  }
  propertyListBundleURL = self->_propertyListBundleURL;
  if ((unint64_t)propertyListBundleURL | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](propertyListBundleURL, "isEqual:"))
      goto LABEL_120;
  }
  has = (__int16)self->_has;
  v16 = *((_WORD *)v4 + 120);
  if ((has & 0x40) != 0)
  {
    if ((v16 & 0x40) == 0 || self->_progressValue != *((double *)v4 + 7))
      goto LABEL_120;
  }
  else if ((v16 & 0x40) != 0)
  {
    goto LABEL_120;
  }
  progressUnitString = self->_progressUnitString;
  if ((unint64_t)progressUnitString | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](progressUnitString, "isEqual:"))
      goto LABEL_120;
    has = (__int16)self->_has;
  }
  v18 = *((_WORD *)v4 + 120);
  if ((has & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_goalValue != *((double *)v4 + 6))
      goto LABEL_120;
  }
  else if ((v18 & 0x20) != 0)
  {
    goto LABEL_120;
  }
  goalUnitString = self->_goalUnitString;
  if ((unint64_t)goalUnitString | *((_QWORD *)v4 + 19)
    && !-[NSString isEqual:](goalUnitString, "isEqual:"))
  {
    goto LABEL_120;
  }
  customPlaceholderValues = self->_customPlaceholderValues;
  if ((unint64_t)customPlaceholderValues | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](customPlaceholderValues, "isEqual:"))
      goto LABEL_120;
  }
  textureFilenames = self->_textureFilenames;
  if ((unint64_t)textureFilenames | *((_QWORD *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](textureFilenames, "isEqual:"))
      goto LABEL_120;
  }
  v22 = (__int16)self->_has;
  if ((v22 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 120) & 0x800) == 0)
      goto LABEL_120;
    if (self->_unearnedUsesTwoToneEnamel)
    {
      if (!*((_BYTE *)v4 + 236))
        goto LABEL_120;
    }
    else if (*((_BYTE *)v4 + 236))
    {
      goto LABEL_120;
    }
  }
  else if ((*((_WORD *)v4 + 120) & 0x800) != 0)
  {
    goto LABEL_120;
  }
  section = self->_section;
  if ((unint64_t)section | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](section, "isEqual:"))
      goto LABEL_120;
    v22 = (__int16)self->_has;
  }
  if ((v22 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 120) & 0x200) == 0)
      goto LABEL_120;
    if (self->_faceHasMetalInlay)
    {
      if (!*((_BYTE *)v4 + 234))
        goto LABEL_120;
    }
    else if (*((_BYTE *)v4 + 234))
    {
      goto LABEL_120;
    }
  }
  else if ((*((_WORD *)v4 + 120) & 0x200) != 0)
  {
    goto LABEL_120;
  }
  if ((v22 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 120) & 0x100) == 0)
      goto LABEL_120;
    if (self->_badgeUsesTriColorEnamel)
    {
      if (!*((_BYTE *)v4 + 233))
        goto LABEL_120;
    }
    else if (*((_BYTE *)v4 + 233))
    {
      goto LABEL_120;
    }
  }
  else if ((*((_WORD *)v4 + 120) & 0x100) != 0)
  {
    goto LABEL_120;
  }
  enamelTriColor1 = self->_enamelTriColor1;
  if ((unint64_t)enamelTriColor1 | *((_QWORD *)v4 + 15)
    && !-[ACHCodableColor isEqual:](enamelTriColor1, "isEqual:"))
  {
    goto LABEL_120;
  }
  enamelTriColor2 = self->_enamelTriColor2;
  if ((unint64_t)enamelTriColor2 | *((_QWORD *)v4 + 16))
  {
    if (!-[ACHCodableColor isEqual:](enamelTriColor2, "isEqual:"))
      goto LABEL_120;
  }
  enamelTriColor3 = self->_enamelTriColor3;
  if ((unint64_t)enamelTriColor3 | *((_QWORD *)v4 + 17))
  {
    if (!-[ACHCodableColor isEqual:](enamelTriColor3, "isEqual:"))
      goto LABEL_120;
  }
  v27 = (__int16)self->_has;
  v28 = *((_WORD *)v4 + 120);
  if ((v27 & 1) != 0)
  {
    if ((v28 & 1) == 0 || self->_badgeModelVersion != *((_QWORD *)v4 + 1))
      goto LABEL_120;
  }
  else if ((v28 & 1) != 0)
  {
    goto LABEL_120;
  }
  relevantEarnedInstance = self->_relevantEarnedInstance;
  if ((unint64_t)relevantEarnedInstance | *((_QWORD *)v4 + 23))
  {
    if (!-[ACHCodableEarnedInstance isEqual:](relevantEarnedInstance, "isEqual:"))
      goto LABEL_120;
    v27 = (__int16)self->_has;
  }
  v30 = *((_WORD *)v4 + 120);
  if ((v27 & 2) != 0)
  {
    if ((v30 & 2) == 0 || self->_earnedInstanceCount != *((_QWORD *)v4 + 2))
      goto LABEL_120;
  }
  else if ((v30 & 2) != 0)
  {
    goto LABEL_120;
  }
  badgeModelFilenames = self->_badgeModelFilenames;
  if ((unint64_t)badgeModelFilenames | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](badgeModelFilenames, "isEqual:"))
      goto LABEL_120;
    v27 = (__int16)self->_has;
  }
  v32 = *((_WORD *)v4 + 120);
  if ((v27 & 0x10) != 0)
  {
    if ((v32 & 0x10) == 0 || self->_glyphTextureScale != *((double *)v4 + 5))
      goto LABEL_120;
  }
  else if ((v32 & 0x10) != 0)
  {
    goto LABEL_120;
  }
  glyphTextureFilename = self->_glyphTextureFilename;
  if ((unint64_t)glyphTextureFilename | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](glyphTextureFilename, "isEqual:"))
      goto LABEL_120;
    v27 = (__int16)self->_has;
  }
  v34 = *((_WORD *)v4 + 120);
  if ((v27 & 4) != 0)
  {
    if ((v34 & 4) == 0 || self->_glyphPositionOffsetX != *((double *)v4 + 3))
      goto LABEL_120;
  }
  else if ((v34 & 4) != 0)
  {
    goto LABEL_120;
  }
  if ((v27 & 8) != 0)
  {
    if ((v34 & 8) == 0 || self->_glyphPositionOffsetY != *((double *)v4 + 4))
      goto LABEL_120;
  }
  else if ((v34 & 8) != 0)
  {
    goto LABEL_120;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 27))
  {
    if (!-[ACHCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
      goto LABEL_120;
    v27 = (__int16)self->_has;
  }
  if ((v27 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 120) & 0x400) != 0)
    {
      if (self->_prerequisiteMet)
      {
        if (!*((_BYTE *)v4 + 235))
          goto LABEL_120;
      }
      else if (*((_BYTE *)v4 + 235))
      {
        goto LABEL_120;
      }
      v36 = 1;
      goto LABEL_121;
    }
LABEL_120:
    v36 = 0;
    goto LABEL_121;
  }
  v36 = (*((_WORD *)v4 + 120) & 0x400) == 0;
LABEL_121:

  return v36;
}

- (unint64_t)hash
{
  double progressValue;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double goalValue;
  double v12;
  long double v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  double glyphTextureScale;
  double v24;
  long double v25;
  double v26;
  NSUInteger v27;
  __int16 has;
  unint64_t v29;
  double glyphPositionOffsetX;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double glyphPositionOffsetY;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSUInteger v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSUInteger v52;
  unint64_t v53;
  NSUInteger v54;
  unint64_t v55;
  NSUInteger v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  NSUInteger v60;
  NSUInteger v61;
  NSUInteger v62;
  NSUInteger v63;
  uint64_t v64;
  unint64_t v65;

  v65 = -[ACHCodableTemplate hash](self->_achievementTemplate, "hash");
  v64 = -[NSMutableArray hash](self->_earnedInstances, "hash");
  v63 = -[NSString hash](self->_localizationBundleURL, "hash");
  v62 = -[NSString hash](self->_resourceBundleURL, "hash");
  v61 = -[NSString hash](self->_stickerBundleURL, "hash");
  v60 = -[NSString hash](self->_badgeShapeName, "hash");
  v59 = -[ACHCodableColor hash](self->_badgeMetalColor, "hash");
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    v58 = 2654435761 * self->_badgeUsesFullColorEnamel;
  else
    v58 = 0;
  v57 = -[ACHCodableColor hash](self->_badgeEnamelColor, "hash");
  v56 = -[NSString hash](self->_propertyListBundleURL, "hash");
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    progressValue = self->_progressValue;
    v4 = -progressValue;
    if (progressValue >= 0.0)
      v4 = self->_progressValue;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = fmod(v5, 1.84467441e19);
    v8 = 2654435761u * (unint64_t)v7;
    v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0)
      v9 = 2654435761u * (unint64_t)v7;
    v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0)
      v10 = v9;
    v55 = v10;
  }
  else
  {
    v55 = 0;
  }
  v54 = -[NSString hash](self->_progressUnitString, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    goalValue = self->_goalValue;
    v12 = -goalValue;
    if (goalValue >= 0.0)
      v12 = self->_goalValue;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v15 = fmod(v13, 1.84467441e19);
    v16 = 2654435761u * (unint64_t)v15;
    v17 = v16 + (unint64_t)v14;
    if (v14 <= 0.0)
      v17 = 2654435761u * (unint64_t)v15;
    v18 = v16 - (unint64_t)fabs(v14);
    if (v14 >= 0.0)
      v18 = v17;
    v53 = v18;
  }
  else
  {
    v53 = 0;
  }
  v52 = -[NSString hash](self->_goalUnitString, "hash");
  v51 = -[NSMutableArray hash](self->_customPlaceholderValues, "hash");
  v50 = -[NSMutableArray hash](self->_textureFilenames, "hash");
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    v49 = 2654435761 * self->_unearnedUsesTwoToneEnamel;
  else
    v49 = 0;
  v48 = -[NSString hash](self->_section, "hash");
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v47 = 2654435761 * self->_faceHasMetalInlay;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_27;
  }
  else
  {
    v47 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_27:
      v46 = 2654435761 * self->_badgeUsesTriColorEnamel;
      goto LABEL_30;
    }
  }
  v46 = 0;
LABEL_30:
  v45 = -[ACHCodableColor hash](self->_enamelTriColor1, "hash");
  v44 = -[ACHCodableColor hash](self->_enamelTriColor2, "hash");
  v43 = -[ACHCodableColor hash](self->_enamelTriColor3, "hash");
  if ((*(_WORD *)&self->_has & 1) != 0)
    v42 = 2654435761 * self->_badgeModelVersion;
  else
    v42 = 0;
  v19 = -[ACHCodableEarnedInstance hash](self->_relevantEarnedInstance, "hash");
  if ((*(_WORD *)&self->_has & 2) != 0)
    v20 = 2654435761 * self->_earnedInstanceCount;
  else
    v20 = 0;
  v21 = -[NSMutableArray hash](self->_badgeModelFilenames, "hash");
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    glyphTextureScale = self->_glyphTextureScale;
    v24 = -glyphTextureScale;
    if (glyphTextureScale >= 0.0)
      v24 = self->_glyphTextureScale;
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
  v27 = -[NSString hash](self->_glyphTextureFilename, "hash");
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    glyphPositionOffsetX = self->_glyphPositionOffsetX;
    v31 = -glyphPositionOffsetX;
    if (glyphPositionOffsetX >= 0.0)
      v31 = self->_glyphPositionOffsetX;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((has & 8) != 0)
  {
    glyphPositionOffsetY = self->_glyphPositionOffsetY;
    v36 = -glyphPositionOffsetY;
    if (glyphPositionOffsetY >= 0.0)
      v36 = self->_glyphPositionOffsetY;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  v39 = -[ACHCodableSyncIdentity hash](self->_syncIdentity, "hash");
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    v40 = 2654435761 * self->_prerequisiteMet;
  else
    v40 = 0;
  return v64 ^ v65 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v19 ^ v20 ^ v21 ^ v22 ^ v27 ^ v29 ^ v34 ^ v39 ^ v40;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ACHCodableTemplate *achievementTemplate;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  ACHCodableColor *badgeMetalColor;
  uint64_t v13;
  ACHCodableColor *badgeEnamelColor;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  __int16 v26;
  ACHCodableColor *enamelTriColor1;
  uint64_t v28;
  ACHCodableColor *enamelTriColor2;
  uint64_t v30;
  ACHCodableColor *enamelTriColor3;
  uint64_t v32;
  ACHCodableEarnedInstance *relevantEarnedInstance;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  __int16 v40;
  ACHCodableSyncIdentity *syncIdentity;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  achievementTemplate = self->_achievementTemplate;
  v6 = *((_QWORD *)v4 + 8);
  if (achievementTemplate)
  {
    if (v6)
      -[ACHCodableTemplate mergeFrom:](achievementTemplate, "mergeFrom:");
  }
  else if (v6)
  {
    -[ACHCodableAchievement setAchievementTemplate:](self, "setAchievementTemplate:");
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v7 = *((id *)v4 + 14);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v56 != v10)
          objc_enumerationMutation(v7);
        -[ACHCodableAchievement addEarnedInstances:](self, "addEarnedInstances:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 20))
    -[ACHCodableAchievement setLocalizationBundleURL:](self, "setLocalizationBundleURL:");
  if (*((_QWORD *)v4 + 24))
    -[ACHCodableAchievement setResourceBundleURL:](self, "setResourceBundleURL:");
  if (*((_QWORD *)v4 + 26))
    -[ACHCodableAchievement setStickerBundleURL:](self, "setStickerBundleURL:");
  if (*((_QWORD *)v4 + 12))
    -[ACHCodableAchievement setBadgeShapeName:](self, "setBadgeShapeName:");
  badgeMetalColor = self->_badgeMetalColor;
  v13 = *((_QWORD *)v4 + 10);
  if (badgeMetalColor)
  {
    if (v13)
      -[ACHCodableColor mergeFrom:](badgeMetalColor, "mergeFrom:");
  }
  else if (v13)
  {
    -[ACHCodableAchievement setBadgeMetalColor:](self, "setBadgeMetalColor:");
  }
  if ((*((_WORD *)v4 + 120) & 0x80) != 0)
  {
    self->_badgeUsesFullColorEnamel = *((_BYTE *)v4 + 232);
    *(_WORD *)&self->_has |= 0x80u;
  }
  badgeEnamelColor = self->_badgeEnamelColor;
  v15 = *((_QWORD *)v4 + 9);
  if (badgeEnamelColor)
  {
    if (v15)
      -[ACHCodableColor mergeFrom:](badgeEnamelColor, "mergeFrom:");
  }
  else if (v15)
  {
    -[ACHCodableAchievement setBadgeEnamelColor:](self, "setBadgeEnamelColor:");
  }
  if (*((_QWORD *)v4 + 22))
    -[ACHCodableAchievement setPropertyListBundleURL:](self, "setPropertyListBundleURL:");
  if ((*((_WORD *)v4 + 120) & 0x40) != 0)
  {
    self->_progressValue = *((double *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v4 + 21))
    -[ACHCodableAchievement setProgressUnitString:](self, "setProgressUnitString:");
  if ((*((_WORD *)v4 + 120) & 0x20) != 0)
  {
    self->_goalValue = *((double *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 19))
    -[ACHCodableAchievement setGoalUnitString:](self, "setGoalUnitString:");
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v16 = *((id *)v4 + 13);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v52 != v19)
          objc_enumerationMutation(v16);
        -[ACHCodableAchievement addCustomPlaceholderValues:](self, "addCustomPlaceholderValues:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v18);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v21 = *((id *)v4 + 28);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v48 != v24)
          objc_enumerationMutation(v21);
        -[ACHCodableAchievement addTextureFilenames:](self, "addTextureFilenames:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    }
    while (v23);
  }

  if ((*((_WORD *)v4 + 120) & 0x800) != 0)
  {
    self->_unearnedUsesTwoToneEnamel = *((_BYTE *)v4 + 236);
    *(_WORD *)&self->_has |= 0x800u;
  }
  if (*((_QWORD *)v4 + 25))
    -[ACHCodableAchievement setSection:](self, "setSection:");
  v26 = *((_WORD *)v4 + 120);
  if ((v26 & 0x200) != 0)
  {
    self->_faceHasMetalInlay = *((_BYTE *)v4 + 234);
    *(_WORD *)&self->_has |= 0x200u;
    v26 = *((_WORD *)v4 + 120);
  }
  if ((v26 & 0x100) != 0)
  {
    self->_badgeUsesTriColorEnamel = *((_BYTE *)v4 + 233);
    *(_WORD *)&self->_has |= 0x100u;
  }
  enamelTriColor1 = self->_enamelTriColor1;
  v28 = *((_QWORD *)v4 + 15);
  if (enamelTriColor1)
  {
    if (v28)
      -[ACHCodableColor mergeFrom:](enamelTriColor1, "mergeFrom:");
  }
  else if (v28)
  {
    -[ACHCodableAchievement setEnamelTriColor1:](self, "setEnamelTriColor1:");
  }
  enamelTriColor2 = self->_enamelTriColor2;
  v30 = *((_QWORD *)v4 + 16);
  if (enamelTriColor2)
  {
    if (v30)
      -[ACHCodableColor mergeFrom:](enamelTriColor2, "mergeFrom:");
  }
  else if (v30)
  {
    -[ACHCodableAchievement setEnamelTriColor2:](self, "setEnamelTriColor2:");
  }
  enamelTriColor3 = self->_enamelTriColor3;
  v32 = *((_QWORD *)v4 + 17);
  if (enamelTriColor3)
  {
    if (v32)
      -[ACHCodableColor mergeFrom:](enamelTriColor3, "mergeFrom:");
  }
  else if (v32)
  {
    -[ACHCodableAchievement setEnamelTriColor3:](self, "setEnamelTriColor3:");
  }
  if ((*((_WORD *)v4 + 120) & 1) != 0)
  {
    self->_badgeModelVersion = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  relevantEarnedInstance = self->_relevantEarnedInstance;
  v34 = *((_QWORD *)v4 + 23);
  if (relevantEarnedInstance)
  {
    if (v34)
      -[ACHCodableEarnedInstance mergeFrom:](relevantEarnedInstance, "mergeFrom:");
  }
  else if (v34)
  {
    -[ACHCodableAchievement setRelevantEarnedInstance:](self, "setRelevantEarnedInstance:");
  }
  if ((*((_WORD *)v4 + 120) & 2) != 0)
  {
    self->_earnedInstanceCount = *((_QWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v35 = *((id *)v4 + 11);
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v37; ++m)
      {
        if (*(_QWORD *)v44 != v38)
          objc_enumerationMutation(v35);
        -[ACHCodableAchievement addBadgeModelFilenames:](self, "addBadgeModelFilenames:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * m), (_QWORD)v43);
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
    }
    while (v37);
  }

  if ((*((_WORD *)v4 + 120) & 0x10) != 0)
  {
    self->_glyphTextureScale = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 18))
    -[ACHCodableAchievement setGlyphTextureFilename:](self, "setGlyphTextureFilename:");
  v40 = *((_WORD *)v4 + 120);
  if ((v40 & 4) != 0)
  {
    self->_glyphPositionOffsetX = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
    v40 = *((_WORD *)v4 + 120);
  }
  if ((v40 & 8) != 0)
  {
    self->_glyphPositionOffsetY = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
  syncIdentity = self->_syncIdentity;
  v42 = *((_QWORD *)v4 + 27);
  if (syncIdentity)
  {
    if (v42)
      -[ACHCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else if (v42)
  {
    -[ACHCodableAchievement setSyncIdentity:](self, "setSyncIdentity:");
  }
  if ((*((_WORD *)v4 + 120) & 0x400) != 0)
  {
    self->_prerequisiteMet = *((_BYTE *)v4 + 235);
    *(_WORD *)&self->_has |= 0x400u;
  }

}

- (NSString)stickerBundleURL
{
  return self->_stickerBundleURL;
}

- (NSMutableArray)customPlaceholderValues
{
  return self->_customPlaceholderValues;
}

- (void)setCustomPlaceholderValues:(id)a3
{
  objc_storeStrong((id *)&self->_customPlaceholderValues, a3);
}

- (ACHCodableColor)enamelTriColor1
{
  return self->_enamelTriColor1;
}

- (void)setEnamelTriColor1:(id)a3
{
  objc_storeStrong((id *)&self->_enamelTriColor1, a3);
}

- (ACHCodableColor)enamelTriColor2
{
  return self->_enamelTriColor2;
}

- (void)setEnamelTriColor2:(id)a3
{
  objc_storeStrong((id *)&self->_enamelTriColor2, a3);
}

- (ACHCodableColor)enamelTriColor3
{
  return self->_enamelTriColor3;
}

- (void)setEnamelTriColor3:(id)a3
{
  objc_storeStrong((id *)&self->_enamelTriColor3, a3);
}

- (ACHCodableEarnedInstance)relevantEarnedInstance
{
  return self->_relevantEarnedInstance;
}

- (void)setRelevantEarnedInstance:(id)a3
{
  objc_storeStrong((id *)&self->_relevantEarnedInstance, a3);
}

- (ACHCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (ACHCodableAchievement)initWithSerializedData:(id)a3 error:(id *)a4
{
  id v5;
  ACHCodableAchievement *v6;

  v5 = a3;
  v6 = -[ACHCodableAchievement initWithData:]([ACHCodableAchievement alloc], "initWithData:", v5);

  return v6;
}

@end
