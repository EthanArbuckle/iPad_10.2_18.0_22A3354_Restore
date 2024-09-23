@implementation ACHCodableTemplate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityStartDate, 0);
  objc_storeStrong((id *)&self->_visibilityPredicate, 0);
  objc_storeStrong((id *)&self->_visibilityEndDate, 0);
  objc_storeStrong((id *)&self->_valueExpression, 0);
  objc_storeStrong((id *)&self->_uniqueName, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_progressExpression, 0);
  objc_storeStrong((id *)&self->_prerequisiteTemplateName, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_graceVisibilityPredicate, 0);
  objc_storeStrong((id *)&self->_graceValueExpression, 0);
  objc_storeStrong((id *)&self->_graceProgressExpression, 0);
  objc_storeStrong((id *)&self->_gracePredicate, 0);
  objc_storeStrong((id *)&self->_graceGoalExpression, 0);
  objc_storeStrong((id *)&self->_goalExpression, 0);
  objc_storeStrong((id *)&self->_dailyTargetCanonicalUnit, 0);
  objc_storeStrong((id *)&self->_canonicalUnit, 0);
  objc_storeStrong((id *)&self->_availableSuffixes, 0);
  objc_storeStrong((id *)&self->_availableCountryCodes, 0);
  objc_storeStrong((id *)&self->_availabilityStartDate, 0);
  objc_storeStrong((id *)&self->_availabilityPredicate, 0);
  objc_storeStrong((id *)&self->_availabilityEndDate, 0);
  objc_storeStrong((id *)&self->_alertabilityPredicate, 0);
  objc_storeStrong((id *)&self->_alertDates, 0);
}

- (NSString)canonicalUnit
{
  return self->_canonicalUnit;
}

- (NSString)visibilityStartDate
{
  return self->_visibilityStartDate;
}

- (NSString)visibilityPredicate
{
  return self->_visibilityPredicate;
}

- (NSString)visibilityEndDate
{
  return self->_visibilityEndDate;
}

- (int64_t)version
{
  return self->_version;
}

- (NSString)valueExpression
{
  return self->_valueExpression;
}

- (NSString)uniqueName
{
  return self->_uniqueName;
}

- (int64_t)triggers
{
  return self->_triggers;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setVisibilityStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_visibilityStartDate, a3);
}

- (void)setVisibilityPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_visibilityPredicate, a3);
}

- (void)setVisibilityEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_visibilityEndDate, a3);
}

- (void)setVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_version = a3;
}

- (void)setValueExpression:(id)a3
{
  objc_storeStrong((id *)&self->_valueExpression, a3);
}

- (void)setUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueName, a3);
}

- (void)setTriggers:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_triggers = a3;
}

- (void)setSourceName:(id)a3
{
  objc_storeStrong((id *)&self->_sourceName, a3);
}

- (void)setProgressExpression:(id)a3
{
  objc_storeStrong((id *)&self->_progressExpression, a3);
}

- (void)setPrerequisiteTemplateName:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteTemplateName, a3);
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (void)setMobileAssetVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_mobileAssetVersion = a3;
}

- (void)setMinimumEngineVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_minimumEngineVersion = a3;
}

- (void)setKey:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_key = a3;
}

- (void)setGraceVisibilityPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_graceVisibilityPredicate, a3);
}

- (void)setGraceValueExpression:(id)a3
{
  objc_storeStrong((id *)&self->_graceValueExpression, a3);
}

- (void)setGraceProgressExpression:(id)a3
{
  objc_storeStrong((id *)&self->_graceProgressExpression, a3);
}

- (void)setGracePredicate:(id)a3
{
  objc_storeStrong((id *)&self->_gracePredicate, a3);
}

- (void)setGraceGoalExpression:(id)a3
{
  objc_storeStrong((id *)&self->_graceGoalExpression, a3);
}

- (void)setGoalExpression:(id)a3
{
  objc_storeStrong((id *)&self->_goalExpression, a3);
}

- (void)setEarnLimit:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_earnLimit = a3;
}

- (void)setEarnDateStrategy:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_earnDateStrategy = a3;
}

- (void)setDuplicateRemovalStrategy:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_duplicateRemovalStrategy = a3;
}

- (void)setDuplicateRemovalCalendarUnit:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_duplicateRemovalCalendarUnit = a3;
}

- (void)setDisplaysEarnedInstanceCount:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_displaysEarnedInstanceCount = a3;
}

- (void)setDisplayOrder:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_displayOrder = a3;
}

- (void)setDailyTargetCanonicalUnit:(id)a3
{
  objc_storeStrong((id *)&self->_dailyTargetCanonicalUnit, a3);
}

- (void)setDailyTarget:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_dailyTarget = a3;
}

- (void)setCreatorDevice:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_creatorDevice = a3;
}

- (void)setCreatedDate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_createdDate = a3;
}

- (void)setCanonicalUnit:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalUnit, a3);
}

- (void)setAvailableSuffixes:(id)a3
{
  objc_storeStrong((id *)&self->_availableSuffixes, a3);
}

- (void)setAvailableOnPairedDevice:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_availableOnPairedDevice = a3;
}

- (void)setAvailableCountryCodes:(id)a3
{
  objc_storeStrong((id *)&self->_availableCountryCodes, a3);
}

- (void)setAvailabilityStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityStartDate, a3);
}

- (void)setAvailabilityPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityPredicate, a3);
}

- (void)setAvailabilityEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityEndDate, a3);
}

- (void)setAlertabilityPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_alertabilityPredicate, a3);
}

- (void)setAlertDates:(id)a3
{
  objc_storeStrong((id *)&self->_alertDates, a3);
}

- (NSString)progressExpression
{
  return self->_progressExpression;
}

- (NSString)prerequisiteTemplateName
{
  return self->_prerequisiteTemplateName;
}

- (NSString)predicate
{
  return self->_predicate;
}

- (int64_t)mobileAssetVersion
{
  return self->_mobileAssetVersion;
}

- (int64_t)minimumEngineVersion
{
  return self->_minimumEngineVersion;
}

- (int64_t)key
{
  return self->_key;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (NSString)graceVisibilityPredicate
{
  return self->_graceVisibilityPredicate;
}

- (NSString)graceValueExpression
{
  return self->_graceValueExpression;
}

- (NSString)graceProgressExpression
{
  return self->_graceProgressExpression;
}

- (NSString)gracePredicate
{
  return self->_gracePredicate;
}

- (NSString)graceGoalExpression
{
  return self->_graceGoalExpression;
}

- (NSString)goalExpression
{
  return self->_goalExpression;
}

- (int64_t)earnLimit
{
  return self->_earnLimit;
}

- (int64_t)earnDateStrategy
{
  return self->_earnDateStrategy;
}

- (int64_t)duplicateRemovalStrategy
{
  return self->_duplicateRemovalStrategy;
}

- (int64_t)duplicateRemovalCalendarUnit
{
  return self->_duplicateRemovalCalendarUnit;
}

- (BOOL)displaysEarnedInstanceCount
{
  return self->_displaysEarnedInstanceCount;
}

- (int64_t)displayOrder
{
  return self->_displayOrder;
}

- (double)dailyTarget
{
  return self->_dailyTarget;
}

- (NSString)dailyTargetCanonicalUnit
{
  return self->_dailyTargetCanonicalUnit;
}

- (int64_t)creatorDevice
{
  return self->_creatorDevice;
}

- (double)createdDate
{
  return self->_createdDate;
}

- (NSString)availableSuffixes
{
  return self->_availableSuffixes;
}

- (BOOL)availableOnPairedDevice
{
  return self->_availableOnPairedDevice;
}

- (NSString)availableCountryCodes
{
  return self->_availableCountryCodes;
}

- (NSString)availabilityStartDate
{
  return self->_availabilityStartDate;
}

- (NSString)availabilityPredicate
{
  return self->_availabilityPredicate;
}

- (NSString)availabilityEndDate
{
  return self->_availabilityEndDate;
}

- (NSString)alertabilityPredicate
{
  return self->_alertabilityPredicate;
}

- (NSString)alertDates
{
  return self->_alertDates;
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_uniqueName)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v10;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_76;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  v4 = v10;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_76:
  PBDataWriterWriteDoubleField();
  v4 = v10;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt64Field();
    v4 = v10;
  }
LABEL_8:
  if (self->_sourceName)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_predicate)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v10;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x80) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v10;
  }
  if (self->_visibilityPredicate)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_visibilityStartDate)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_visibilityEndDate)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_availabilityPredicate)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_availabilityStartDate)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_availabilityEndDate)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_alertabilityPredicate)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_alertDates)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v10;
    v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_34:
      if ((v7 & 0x40) == 0)
        goto LABEL_36;
      goto LABEL_35;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_34;
  }
  PBDataWriterWriteInt64Field();
  v4 = v10;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_35:
    PBDataWriterWriteInt64Field();
    v4 = v10;
  }
LABEL_36:
  if (self->_canonicalUnit)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_valueExpression)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_progressExpression)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_goalExpression)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  v8 = (__int16)self->_has;
  if ((v8 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v10;
    v8 = (__int16)self->_has;
  }
  if ((v8 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v10;
  }
  if (self->_availableCountryCodes)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_availableSuffixes)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_gracePredicate)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_graceVisibilityPredicate)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_graceValueExpression)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_graceProgressExpression)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_graceGoalExpression)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  v9 = (__int16)self->_has;
  if ((v9 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v10;
    v9 = (__int16)self->_has;
    if ((v9 & 0x400) == 0)
    {
LABEL_64:
      if ((v9 & 0x100) == 0)
        goto LABEL_65;
      goto LABEL_83;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_64;
  }
  PBDataWriterWriteInt64Field();
  v4 = v10;
  v9 = (__int16)self->_has;
  if ((v9 & 0x100) == 0)
  {
LABEL_65:
    if ((v9 & 4) == 0)
      goto LABEL_67;
    goto LABEL_66;
  }
LABEL_83:
  PBDataWriterWriteInt64Field();
  v4 = v10;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_66:
    PBDataWriterWriteDoubleField();
    v4 = v10;
  }
LABEL_67:
  if (self->_dailyTargetCanonicalUnit)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v10;
  }
  if (self->_prerequisiteTemplateName)
  {
    PBDataWriterWriteStringField();
    v4 = v10;
  }

}

- (BOOL)hasUniqueName
{
  return self->_uniqueName != 0;
}

- (void)setHasVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasVersion
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasMinimumEngineVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMinimumEngineVersion
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasCreatedDate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCreatedDate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasCreatorDevice:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCreatorDevice
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasSourceName
{
  return self->_sourceName != 0;
}

- (BOOL)hasPredicate
{
  return self->_predicate != 0;
}

- (void)setHasTriggers:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTriggers
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasEarnLimit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasEarnLimit
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasVisibilityPredicate
{
  return self->_visibilityPredicate != 0;
}

- (BOOL)hasVisibilityStartDate
{
  return self->_visibilityStartDate != 0;
}

- (BOOL)hasVisibilityEndDate
{
  return self->_visibilityEndDate != 0;
}

- (BOOL)hasAvailabilityPredicate
{
  return self->_availabilityPredicate != 0;
}

- (BOOL)hasAvailabilityStartDate
{
  return self->_availabilityStartDate != 0;
}

- (BOOL)hasAvailabilityEndDate
{
  return self->_availabilityEndDate != 0;
}

- (BOOL)hasAlertabilityPredicate
{
  return self->_alertabilityPredicate != 0;
}

- (BOOL)hasAlertDates
{
  return self->_alertDates != 0;
}

- (void)setHasDuplicateRemovalStrategy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDuplicateRemovalStrategy
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasDuplicateRemovalCalendarUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDuplicateRemovalCalendarUnit
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasEarnDateStrategy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEarnDateStrategy
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasCanonicalUnit
{
  return self->_canonicalUnit != 0;
}

- (BOOL)hasValueExpression
{
  return self->_valueExpression != 0;
}

- (BOOL)hasProgressExpression
{
  return self->_progressExpression != 0;
}

- (BOOL)hasGoalExpression
{
  return self->_goalExpression != 0;
}

- (void)setHasDisplayOrder:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDisplayOrder
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasDisplaysEarnedInstanceCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasDisplaysEarnedInstanceCount
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (BOOL)hasAvailableCountryCodes
{
  return self->_availableCountryCodes != 0;
}

- (BOOL)hasAvailableSuffixes
{
  return self->_availableSuffixes != 0;
}

- (BOOL)hasGracePredicate
{
  return self->_gracePredicate != 0;
}

- (BOOL)hasGraceVisibilityPredicate
{
  return self->_graceVisibilityPredicate != 0;
}

- (BOOL)hasGraceValueExpression
{
  return self->_graceValueExpression != 0;
}

- (BOOL)hasGraceProgressExpression
{
  return self->_graceProgressExpression != 0;
}

- (BOOL)hasGraceGoalExpression
{
  return self->_graceGoalExpression != 0;
}

- (void)setHasAvailableOnPairedDevice:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasAvailableOnPairedDevice
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasMobileAssetVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasMobileAssetVersion
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasKey:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasKey
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasDailyTarget:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDailyTarget
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasDailyTargetCanonicalUnit
{
  return self->_dailyTargetCanonicalUnit != 0;
}

- (BOOL)hasPrerequisiteTemplateName
{
  return self->_prerequisiteTemplateName != 0;
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
  v8.super_class = (Class)ACHCodableTemplate;
  -[ACHCodableTemplate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableTemplate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uniqueName;
  __int16 has;
  void *v7;
  NSString *sourceName;
  NSString *predicate;
  __int16 v10;
  void *v11;
  void *v12;
  NSString *visibilityPredicate;
  NSString *visibilityStartDate;
  NSString *visibilityEndDate;
  NSString *availabilityPredicate;
  NSString *availabilityStartDate;
  NSString *availabilityEndDate;
  NSString *alertabilityPredicate;
  NSString *alertDates;
  __int16 v21;
  void *v22;
  NSString *canonicalUnit;
  NSString *valueExpression;
  NSString *progressExpression;
  NSString *goalExpression;
  __int16 v27;
  void *v28;
  void *v29;
  NSString *availableCountryCodes;
  NSString *availableSuffixes;
  NSString *gracePredicate;
  NSString *graceVisibilityPredicate;
  NSString *graceValueExpression;
  NSString *graceProgressExpression;
  NSString *graceGoalExpression;
  __int16 v37;
  void *v38;
  NSString *dailyTargetCanonicalUnit;
  ACHCodableSyncIdentity *syncIdentity;
  void *v41;
  NSString *prerequisiteTemplateName;
  id v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uniqueName = self->_uniqueName;
  if (uniqueName)
    objc_msgSend(v3, "setObject:forKey:", uniqueName, CFSTR("uniqueName"));
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_version);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("version"));

    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_76;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumEngineVersion);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("minimumEngineVersion"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_76:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_createdDate);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("createdDate"));

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_creatorDevice);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("creatorDevice"));

  }
LABEL_8:
  sourceName = self->_sourceName;
  if (sourceName)
    objc_msgSend(v4, "setObject:forKey:", sourceName, CFSTR("sourceName"));
  predicate = self->_predicate;
  if (predicate)
    objc_msgSend(v4, "setObject:forKey:", predicate, CFSTR("predicate"));
  v10 = (__int16)self->_has;
  if ((v10 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_triggers);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("triggers"));

    v10 = (__int16)self->_has;
  }
  if ((v10 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_earnLimit);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("earnLimit"));

  }
  visibilityPredicate = self->_visibilityPredicate;
  if (visibilityPredicate)
    objc_msgSend(v4, "setObject:forKey:", visibilityPredicate, CFSTR("visibilityPredicate"));
  visibilityStartDate = self->_visibilityStartDate;
  if (visibilityStartDate)
    objc_msgSend(v4, "setObject:forKey:", visibilityStartDate, CFSTR("visibilityStartDate"));
  visibilityEndDate = self->_visibilityEndDate;
  if (visibilityEndDate)
    objc_msgSend(v4, "setObject:forKey:", visibilityEndDate, CFSTR("visibilityEndDate"));
  availabilityPredicate = self->_availabilityPredicate;
  if (availabilityPredicate)
    objc_msgSend(v4, "setObject:forKey:", availabilityPredicate, CFSTR("availabilityPredicate"));
  availabilityStartDate = self->_availabilityStartDate;
  if (availabilityStartDate)
    objc_msgSend(v4, "setObject:forKey:", availabilityStartDate, CFSTR("availabilityStartDate"));
  availabilityEndDate = self->_availabilityEndDate;
  if (availabilityEndDate)
    objc_msgSend(v4, "setObject:forKey:", availabilityEndDate, CFSTR("availabilityEndDate"));
  alertabilityPredicate = self->_alertabilityPredicate;
  if (alertabilityPredicate)
    objc_msgSend(v4, "setObject:forKey:", alertabilityPredicate, CFSTR("alertabilityPredicate"));
  alertDates = self->_alertDates;
  if (alertDates)
    objc_msgSend(v4, "setObject:forKey:", alertDates, CFSTR("alertDates"));
  v21 = (__int16)self->_has;
  if ((v21 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_duplicateRemovalStrategy);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("duplicateRemovalStrategy"));

    v21 = (__int16)self->_has;
    if ((v21 & 0x10) == 0)
    {
LABEL_34:
      if ((v21 & 0x40) == 0)
        goto LABEL_36;
      goto LABEL_35;
    }
  }
  else if ((v21 & 0x10) == 0)
  {
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_duplicateRemovalCalendarUnit);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("duplicateRemovalCalendarUnit"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_35:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_earnDateStrategy);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("earnDateStrategy"));

  }
LABEL_36:
  canonicalUnit = self->_canonicalUnit;
  if (canonicalUnit)
    objc_msgSend(v4, "setObject:forKey:", canonicalUnit, CFSTR("canonicalUnit"));
  valueExpression = self->_valueExpression;
  if (valueExpression)
    objc_msgSend(v4, "setObject:forKey:", valueExpression, CFSTR("valueExpression"));
  progressExpression = self->_progressExpression;
  if (progressExpression)
    objc_msgSend(v4, "setObject:forKey:", progressExpression, CFSTR("progressExpression"));
  goalExpression = self->_goalExpression;
  if (goalExpression)
    objc_msgSend(v4, "setObject:forKey:", goalExpression, CFSTR("goalExpression"));
  v27 = (__int16)self->_has;
  if ((v27 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_displayOrder);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("displayOrder"));

    v27 = (__int16)self->_has;
  }
  if ((v27 & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_displaysEarnedInstanceCount);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("displaysEarnedInstanceCount"));

  }
  availableCountryCodes = self->_availableCountryCodes;
  if (availableCountryCodes)
    objc_msgSend(v4, "setObject:forKey:", availableCountryCodes, CFSTR("availableCountryCodes"));
  availableSuffixes = self->_availableSuffixes;
  if (availableSuffixes)
    objc_msgSend(v4, "setObject:forKey:", availableSuffixes, CFSTR("availableSuffixes"));
  gracePredicate = self->_gracePredicate;
  if (gracePredicate)
    objc_msgSend(v4, "setObject:forKey:", gracePredicate, CFSTR("gracePredicate"));
  graceVisibilityPredicate = self->_graceVisibilityPredicate;
  if (graceVisibilityPredicate)
    objc_msgSend(v4, "setObject:forKey:", graceVisibilityPredicate, CFSTR("graceVisibilityPredicate"));
  graceValueExpression = self->_graceValueExpression;
  if (graceValueExpression)
    objc_msgSend(v4, "setObject:forKey:", graceValueExpression, CFSTR("graceValueExpression"));
  graceProgressExpression = self->_graceProgressExpression;
  if (graceProgressExpression)
    objc_msgSend(v4, "setObject:forKey:", graceProgressExpression, CFSTR("graceProgressExpression"));
  graceGoalExpression = self->_graceGoalExpression;
  if (graceGoalExpression)
    objc_msgSend(v4, "setObject:forKey:", graceGoalExpression, CFSTR("graceGoalExpression"));
  v37 = (__int16)self->_has;
  if ((v37 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_availableOnPairedDevice);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("availableOnPairedDevice"));

    v37 = (__int16)self->_has;
    if ((v37 & 0x400) == 0)
    {
LABEL_64:
      if ((v37 & 0x100) == 0)
        goto LABEL_65;
      goto LABEL_83;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_64;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_mobileAssetVersion);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("mobileAssetVersion"));

  v37 = (__int16)self->_has;
  if ((v37 & 0x100) == 0)
  {
LABEL_65:
    if ((v37 & 4) == 0)
      goto LABEL_67;
    goto LABEL_66;
  }
LABEL_83:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_key);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("key"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_66:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_dailyTarget);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("dailyTarget"));

  }
LABEL_67:
  dailyTargetCanonicalUnit = self->_dailyTargetCanonicalUnit;
  if (dailyTargetCanonicalUnit)
    objc_msgSend(v4, "setObject:forKey:", dailyTargetCanonicalUnit, CFSTR("dailyTargetCanonicalUnit"));
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[ACHCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("syncIdentity"));

  }
  prerequisiteTemplateName = self->_prerequisiteTemplateName;
  if (prerequisiteTemplateName)
    objc_msgSend(v4, "setObject:forKey:", prerequisiteTemplateName, CFSTR("prerequisiteTemplateName"));
  v43 = v4;

  return v43;
}

- (BOOL)readFrom:(id)a3
{
  return ACHCodableTemplateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_uniqueName)
  {
    objc_msgSend(v4, "setUniqueName:");
    v4 = v10;
  }
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *((_QWORD *)v4 + 13) = self->_version;
    *((_WORD *)v4 + 158) |= 0x1000u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_76;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 10) = self->_minimumEngineVersion;
  *((_WORD *)v4 + 158) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_76:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_createdDate;
  *((_WORD *)v4 + 158) |= 1u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    *((_QWORD *)v4 + 2) = self->_creatorDevice;
    *((_WORD *)v4 + 158) |= 2u;
  }
LABEL_8:
  if (self->_sourceName)
  {
    objc_msgSend(v10, "setSourceName:");
    v4 = v10;
  }
  if (self->_predicate)
  {
    objc_msgSend(v10, "setPredicate:");
    v4 = v10;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) != 0)
  {
    *((_QWORD *)v4 + 12) = self->_triggers;
    *((_WORD *)v4 + 158) |= 0x800u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x80) != 0)
  {
    *((_QWORD *)v4 + 8) = self->_earnLimit;
    *((_WORD *)v4 + 158) |= 0x80u;
  }
  if (self->_visibilityPredicate)
  {
    objc_msgSend(v10, "setVisibilityPredicate:");
    v4 = v10;
  }
  if (self->_visibilityStartDate)
  {
    objc_msgSend(v10, "setVisibilityStartDate:");
    v4 = v10;
  }
  if (self->_visibilityEndDate)
  {
    objc_msgSend(v10, "setVisibilityEndDate:");
    v4 = v10;
  }
  if (self->_availabilityPredicate)
  {
    objc_msgSend(v10, "setAvailabilityPredicate:");
    v4 = v10;
  }
  if (self->_availabilityStartDate)
  {
    objc_msgSend(v10, "setAvailabilityStartDate:");
    v4 = v10;
  }
  if (self->_availabilityEndDate)
  {
    objc_msgSend(v10, "setAvailabilityEndDate:");
    v4 = v10;
  }
  if (self->_alertabilityPredicate)
  {
    objc_msgSend(v10, "setAlertabilityPredicate:");
    v4 = v10;
  }
  if (self->_alertDates)
  {
    objc_msgSend(v10, "setAlertDates:");
    v4 = v10;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x20) != 0)
  {
    *((_QWORD *)v4 + 6) = self->_duplicateRemovalStrategy;
    *((_WORD *)v4 + 158) |= 0x20u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_34:
      if ((v7 & 0x40) == 0)
        goto LABEL_36;
      goto LABEL_35;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_34;
  }
  *((_QWORD *)v4 + 5) = self->_duplicateRemovalCalendarUnit;
  *((_WORD *)v4 + 158) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_35:
    *((_QWORD *)v4 + 7) = self->_earnDateStrategy;
    *((_WORD *)v4 + 158) |= 0x40u;
  }
LABEL_36:
  if (self->_canonicalUnit)
  {
    objc_msgSend(v10, "setCanonicalUnit:");
    v4 = v10;
  }
  if (self->_valueExpression)
  {
    objc_msgSend(v10, "setValueExpression:");
    v4 = v10;
  }
  if (self->_progressExpression)
  {
    objc_msgSend(v10, "setProgressExpression:");
    v4 = v10;
  }
  if (self->_goalExpression)
  {
    objc_msgSend(v10, "setGoalExpression:");
    v4 = v10;
  }
  v8 = (__int16)self->_has;
  if ((v8 & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_displayOrder;
    *((_WORD *)v4 + 158) |= 8u;
    v8 = (__int16)self->_has;
  }
  if ((v8 & 0x4000) != 0)
  {
    *((_BYTE *)v4 + 313) = self->_displaysEarnedInstanceCount;
    *((_WORD *)v4 + 158) |= 0x4000u;
  }
  if (self->_availableCountryCodes)
  {
    objc_msgSend(v10, "setAvailableCountryCodes:");
    v4 = v10;
  }
  if (self->_availableSuffixes)
  {
    objc_msgSend(v10, "setAvailableSuffixes:");
    v4 = v10;
  }
  if (self->_gracePredicate)
  {
    objc_msgSend(v10, "setGracePredicate:");
    v4 = v10;
  }
  if (self->_graceVisibilityPredicate)
  {
    objc_msgSend(v10, "setGraceVisibilityPredicate:");
    v4 = v10;
  }
  if (self->_graceValueExpression)
  {
    objc_msgSend(v10, "setGraceValueExpression:");
    v4 = v10;
  }
  if (self->_graceProgressExpression)
  {
    objc_msgSend(v10, "setGraceProgressExpression:");
    v4 = v10;
  }
  if (self->_graceGoalExpression)
  {
    objc_msgSend(v10, "setGraceGoalExpression:");
    v4 = v10;
  }
  v9 = (__int16)self->_has;
  if ((v9 & 0x2000) != 0)
  {
    *((_BYTE *)v4 + 312) = self->_availableOnPairedDevice;
    *((_WORD *)v4 + 158) |= 0x2000u;
    v9 = (__int16)self->_has;
    if ((v9 & 0x400) == 0)
    {
LABEL_64:
      if ((v9 & 0x100) == 0)
        goto LABEL_65;
      goto LABEL_83;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_64;
  }
  *((_QWORD *)v4 + 11) = self->_mobileAssetVersion;
  *((_WORD *)v4 + 158) |= 0x400u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x100) == 0)
  {
LABEL_65:
    if ((v9 & 4) == 0)
      goto LABEL_67;
    goto LABEL_66;
  }
LABEL_83:
  *((_QWORD *)v4 + 9) = self->_key;
  *((_WORD *)v4 + 158) |= 0x100u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_66:
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_dailyTarget;
    *((_WORD *)v4 + 158) |= 4u;
  }
LABEL_67:
  if (self->_dailyTargetCanonicalUnit)
  {
    objc_msgSend(v10, "setDailyTargetCanonicalUnit:");
    v4 = v10;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v10, "setSyncIdentity:");
    v4 = v10;
  }
  if (self->_prerequisiteTemplateName)
  {
    objc_msgSend(v10, "setPrerequisiteTemplateName:");
    v4 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int16 has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v6;

  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *(_QWORD *)(v5 + 104) = self->_version;
    *(_WORD *)(v5 + 316) |= 0x1000u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 80) = self->_minimumEngineVersion;
  *(_WORD *)(v5 + 316) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_26:
  *(double *)(v5 + 8) = self->_createdDate;
  *(_WORD *)(v5 + 316) |= 1u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_5:
    *(_QWORD *)(v5 + 16) = self->_creatorDevice;
    *(_WORD *)(v5 + 316) |= 2u;
  }
LABEL_6:
  v9 = -[NSString copyWithZone:](self->_sourceName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v9;

  v11 = -[NSString copyWithZone:](self->_predicate, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v11;

  v13 = (__int16)self->_has;
  if ((v13 & 0x800) != 0)
  {
    *(_QWORD *)(v5 + 96) = self->_triggers;
    *(_WORD *)(v5 + 316) |= 0x800u;
    v13 = (__int16)self->_has;
  }
  if ((v13 & 0x80) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_earnLimit;
    *(_WORD *)(v5 + 316) |= 0x80u;
  }
  v14 = -[NSString copyWithZone:](self->_visibilityPredicate, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v14;

  v16 = -[NSString copyWithZone:](self->_visibilityStartDate, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v16;

  v18 = -[NSString copyWithZone:](self->_visibilityEndDate, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v18;

  v20 = -[NSString copyWithZone:](self->_availabilityPredicate, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v20;

  v22 = -[NSString copyWithZone:](self->_availabilityStartDate, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v22;

  v24 = -[NSString copyWithZone:](self->_availabilityEndDate, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v24;

  v26 = -[NSString copyWithZone:](self->_alertabilityPredicate, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v26;

  v28 = -[NSString copyWithZone:](self->_alertDates, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v28;

  v30 = (__int16)self->_has;
  if ((v30 & 0x20) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_duplicateRemovalStrategy;
    *(_WORD *)(v5 + 316) |= 0x20u;
    v30 = (__int16)self->_has;
    if ((v30 & 0x10) == 0)
    {
LABEL_12:
      if ((v30 & 0x40) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((v30 & 0x10) == 0)
  {
    goto LABEL_12;
  }
  *(_QWORD *)(v5 + 40) = self->_duplicateRemovalCalendarUnit;
  *(_WORD *)(v5 + 316) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    *(_QWORD *)(v5 + 56) = self->_earnDateStrategy;
    *(_WORD *)(v5 + 316) |= 0x40u;
  }
LABEL_14:
  v31 = -[NSString copyWithZone:](self->_canonicalUnit, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v31;

  v33 = -[NSString copyWithZone:](self->_valueExpression, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v33;

  v35 = -[NSString copyWithZone:](self->_progressExpression, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v35;

  v37 = -[NSString copyWithZone:](self->_goalExpression, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v37;

  v39 = (__int16)self->_has;
  if ((v39 & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_displayOrder;
    *(_WORD *)(v5 + 316) |= 8u;
    v39 = (__int16)self->_has;
  }
  if ((v39 & 0x4000) != 0)
  {
    *(_BYTE *)(v5 + 313) = self->_displaysEarnedInstanceCount;
    *(_WORD *)(v5 + 316) |= 0x4000u;
  }
  v40 = -[NSString copyWithZone:](self->_availableCountryCodes, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v40;

  v42 = -[NSString copyWithZone:](self->_availableSuffixes, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v42;

  v44 = -[NSString copyWithZone:](self->_gracePredicate, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v44;

  v46 = -[NSString copyWithZone:](self->_graceVisibilityPredicate, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v46;

  v48 = -[NSString copyWithZone:](self->_graceValueExpression, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v48;

  v50 = -[NSString copyWithZone:](self->_graceProgressExpression, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v50;

  v52 = -[NSString copyWithZone:](self->_graceGoalExpression, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v52;

  v54 = (__int16)self->_has;
  if ((v54 & 0x2000) != 0)
  {
    *(_BYTE *)(v5 + 312) = self->_availableOnPairedDevice;
    *(_WORD *)(v5 + 316) |= 0x2000u;
    v54 = (__int16)self->_has;
    if ((v54 & 0x400) == 0)
    {
LABEL_20:
      if ((v54 & 0x100) == 0)
        goto LABEL_21;
LABEL_33:
      *(_QWORD *)(v5 + 72) = self->_key;
      *(_WORD *)(v5 + 316) |= 0x100u;
      if ((*(_WORD *)&self->_has & 4) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_20;
  }
  *(_QWORD *)(v5 + 88) = self->_mobileAssetVersion;
  *(_WORD *)(v5 + 316) |= 0x400u;
  v54 = (__int16)self->_has;
  if ((v54 & 0x100) != 0)
    goto LABEL_33;
LABEL_21:
  if ((v54 & 4) != 0)
  {
LABEL_22:
    *(double *)(v5 + 24) = self->_dailyTarget;
    *(_WORD *)(v5 + 316) |= 4u;
  }
LABEL_23:
  v55 = -[NSString copyWithZone:](self->_dailyTargetCanonicalUnit, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v55;

  v57 = -[ACHCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v58 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v57;

  v59 = -[NSString copyWithZone:](self->_prerequisiteTemplateName, "copyWithZone:", a3);
  v60 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v59;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueName;
  __int16 has;
  __int16 v7;
  NSString *sourceName;
  NSString *predicate;
  __int16 v10;
  __int16 v11;
  NSString *visibilityPredicate;
  NSString *visibilityStartDate;
  NSString *visibilityEndDate;
  NSString *availabilityPredicate;
  NSString *availabilityStartDate;
  NSString *availabilityEndDate;
  NSString *alertabilityPredicate;
  NSString *alertDates;
  __int16 v20;
  __int16 v21;
  NSString *canonicalUnit;
  NSString *valueExpression;
  NSString *progressExpression;
  NSString *goalExpression;
  __int16 v26;
  NSString *availableCountryCodes;
  NSString *availableSuffixes;
  NSString *gracePredicate;
  NSString *graceVisibilityPredicate;
  NSString *graceValueExpression;
  NSString *graceProgressExpression;
  NSString *graceGoalExpression;
  __int16 v34;
  __int16 v35;
  NSString *dailyTargetCanonicalUnit;
  ACHCodableSyncIdentity *syncIdentity;
  NSString *prerequisiteTemplateName;
  char v39;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_133;
  uniqueName = self->_uniqueName;
  if ((unint64_t)uniqueName | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](uniqueName, "isEqual:"))
      goto LABEL_133;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 158);
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x1000) == 0 || self->_version != *((_QWORD *)v4 + 13))
      goto LABEL_133;
  }
  else if ((*((_WORD *)v4 + 158) & 0x1000) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x200) == 0 || self->_minimumEngineVersion != *((_QWORD *)v4 + 10))
      goto LABEL_133;
  }
  else if ((*((_WORD *)v4 + 158) & 0x200) != 0)
  {
    goto LABEL_133;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_createdDate != *((double *)v4 + 1))
      goto LABEL_133;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_133;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_creatorDevice != *((_QWORD *)v4 + 2))
      goto LABEL_133;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_133;
  }
  sourceName = self->_sourceName;
  if ((unint64_t)sourceName | *((_QWORD *)v4 + 32)
    && !-[NSString isEqual:](sourceName, "isEqual:"))
  {
    goto LABEL_133;
  }
  predicate = self->_predicate;
  if ((unint64_t)predicate | *((_QWORD *)v4 + 29))
  {
    if (!-[NSString isEqual:](predicate, "isEqual:"))
      goto LABEL_133;
  }
  v10 = (__int16)self->_has;
  v11 = *((_WORD *)v4 + 158);
  if ((v10 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x800) == 0 || self->_triggers != *((_QWORD *)v4 + 12))
      goto LABEL_133;
  }
  else if ((*((_WORD *)v4 + 158) & 0x800) != 0)
  {
    goto LABEL_133;
  }
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_earnLimit != *((_QWORD *)v4 + 8))
      goto LABEL_133;
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_133;
  }
  visibilityPredicate = self->_visibilityPredicate;
  if ((unint64_t)visibilityPredicate | *((_QWORD *)v4 + 37)
    && !-[NSString isEqual:](visibilityPredicate, "isEqual:"))
  {
    goto LABEL_133;
  }
  visibilityStartDate = self->_visibilityStartDate;
  if ((unint64_t)visibilityStartDate | *((_QWORD *)v4 + 38))
  {
    if (!-[NSString isEqual:](visibilityStartDate, "isEqual:"))
      goto LABEL_133;
  }
  visibilityEndDate = self->_visibilityEndDate;
  if ((unint64_t)visibilityEndDate | *((_QWORD *)v4 + 36))
  {
    if (!-[NSString isEqual:](visibilityEndDate, "isEqual:"))
      goto LABEL_133;
  }
  availabilityPredicate = self->_availabilityPredicate;
  if ((unint64_t)availabilityPredicate | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](availabilityPredicate, "isEqual:"))
      goto LABEL_133;
  }
  availabilityStartDate = self->_availabilityStartDate;
  if ((unint64_t)availabilityStartDate | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](availabilityStartDate, "isEqual:"))
      goto LABEL_133;
  }
  availabilityEndDate = self->_availabilityEndDate;
  if ((unint64_t)availabilityEndDate | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](availabilityEndDate, "isEqual:"))
      goto LABEL_133;
  }
  alertabilityPredicate = self->_alertabilityPredicate;
  if ((unint64_t)alertabilityPredicate | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](alertabilityPredicate, "isEqual:"))
      goto LABEL_133;
  }
  alertDates = self->_alertDates;
  if ((unint64_t)alertDates | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](alertDates, "isEqual:"))
      goto LABEL_133;
  }
  v20 = (__int16)self->_has;
  v21 = *((_WORD *)v4 + 158);
  if ((v20 & 0x20) != 0)
  {
    if ((v21 & 0x20) == 0 || self->_duplicateRemovalStrategy != *((_QWORD *)v4 + 6))
      goto LABEL_133;
  }
  else if ((v21 & 0x20) != 0)
  {
    goto LABEL_133;
  }
  if ((v20 & 0x10) != 0)
  {
    if ((v21 & 0x10) == 0 || self->_duplicateRemovalCalendarUnit != *((_QWORD *)v4 + 5))
      goto LABEL_133;
  }
  else if ((v21 & 0x10) != 0)
  {
    goto LABEL_133;
  }
  if ((v20 & 0x40) != 0)
  {
    if ((v21 & 0x40) == 0 || self->_earnDateStrategy != *((_QWORD *)v4 + 7))
      goto LABEL_133;
  }
  else if ((v21 & 0x40) != 0)
  {
    goto LABEL_133;
  }
  canonicalUnit = self->_canonicalUnit;
  if ((unint64_t)canonicalUnit | *((_QWORD *)v4 + 21)
    && !-[NSString isEqual:](canonicalUnit, "isEqual:"))
  {
    goto LABEL_133;
  }
  valueExpression = self->_valueExpression;
  if ((unint64_t)valueExpression | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](valueExpression, "isEqual:"))
      goto LABEL_133;
  }
  progressExpression = self->_progressExpression;
  if ((unint64_t)progressExpression | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](progressExpression, "isEqual:"))
      goto LABEL_133;
  }
  goalExpression = self->_goalExpression;
  if ((unint64_t)goalExpression | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](goalExpression, "isEqual:"))
      goto LABEL_133;
  }
  v26 = *((_WORD *)v4 + 158);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    if ((v26 & 8) == 0 || self->_displayOrder != *((_QWORD *)v4 + 4))
      goto LABEL_133;
  }
  else if ((v26 & 8) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x4000) == 0)
      goto LABEL_133;
    if (self->_displaysEarnedInstanceCount)
    {
      if (!*((_BYTE *)v4 + 313))
        goto LABEL_133;
    }
    else if (*((_BYTE *)v4 + 313))
    {
      goto LABEL_133;
    }
  }
  else if ((*((_WORD *)v4 + 158) & 0x4000) != 0)
  {
    goto LABEL_133;
  }
  availableCountryCodes = self->_availableCountryCodes;
  if ((unint64_t)availableCountryCodes | *((_QWORD *)v4 + 19)
    && !-[NSString isEqual:](availableCountryCodes, "isEqual:"))
  {
    goto LABEL_133;
  }
  availableSuffixes = self->_availableSuffixes;
  if ((unint64_t)availableSuffixes | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](availableSuffixes, "isEqual:"))
      goto LABEL_133;
  }
  gracePredicate = self->_gracePredicate;
  if ((unint64_t)gracePredicate | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](gracePredicate, "isEqual:"))
      goto LABEL_133;
  }
  graceVisibilityPredicate = self->_graceVisibilityPredicate;
  if ((unint64_t)graceVisibilityPredicate | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](graceVisibilityPredicate, "isEqual:"))
      goto LABEL_133;
  }
  graceValueExpression = self->_graceValueExpression;
  if ((unint64_t)graceValueExpression | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](graceValueExpression, "isEqual:"))
      goto LABEL_133;
  }
  graceProgressExpression = self->_graceProgressExpression;
  if ((unint64_t)graceProgressExpression | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](graceProgressExpression, "isEqual:"))
      goto LABEL_133;
  }
  graceGoalExpression = self->_graceGoalExpression;
  if ((unint64_t)graceGoalExpression | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](graceGoalExpression, "isEqual:"))
      goto LABEL_133;
  }
  v34 = (__int16)self->_has;
  v35 = *((_WORD *)v4 + 158);
  if ((v34 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x2000) != 0)
    {
      if (self->_availableOnPairedDevice)
      {
        if (!*((_BYTE *)v4 + 312))
          goto LABEL_133;
        goto LABEL_112;
      }
      if (!*((_BYTE *)v4 + 312))
        goto LABEL_112;
    }
LABEL_133:
    v39 = 0;
    goto LABEL_134;
  }
  if ((*((_WORD *)v4 + 158) & 0x2000) != 0)
    goto LABEL_133;
LABEL_112:
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x400) == 0 || self->_mobileAssetVersion != *((_QWORD *)v4 + 11))
      goto LABEL_133;
  }
  else if ((*((_WORD *)v4 + 158) & 0x400) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x100) == 0 || self->_key != *((_QWORD *)v4 + 9))
      goto LABEL_133;
  }
  else if ((*((_WORD *)v4 + 158) & 0x100) != 0)
  {
    goto LABEL_133;
  }
  if ((v34 & 4) != 0)
  {
    if ((v35 & 4) == 0 || self->_dailyTarget != *((double *)v4 + 3))
      goto LABEL_133;
  }
  else if ((v35 & 4) != 0)
  {
    goto LABEL_133;
  }
  dailyTargetCanonicalUnit = self->_dailyTargetCanonicalUnit;
  if ((unint64_t)dailyTargetCanonicalUnit | *((_QWORD *)v4 + 22)
    && !-[NSString isEqual:](dailyTargetCanonicalUnit, "isEqual:"))
  {
    goto LABEL_133;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 33))
  {
    if (!-[ACHCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
      goto LABEL_133;
  }
  prerequisiteTemplateName = self->_prerequisiteTemplateName;
  if ((unint64_t)prerequisiteTemplateName | *((_QWORD *)v4 + 30))
    v39 = -[NSString isEqual:](prerequisiteTemplateName, "isEqual:");
  else
    v39 = 1;
LABEL_134:

  return v39;
}

- (unint64_t)hash
{
  __int16 has;
  double createdDate;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  __int16 v9;
  __int16 v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double dailyTarget;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  NSUInteger v25;
  NSUInteger v26;
  unint64_t v27;
  NSUInteger v29;
  NSUInteger v30;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSUInteger v40;
  NSUInteger v41;
  NSUInteger v42;
  NSUInteger v43;
  NSUInteger v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  uint64_t v48;
  uint64_t v49;
  NSUInteger v50;
  NSUInteger v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSUInteger v56;

  v56 = -[NSString hash](self->_uniqueName, "hash");
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
    v55 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_3;
LABEL_9:
    v54 = 0;
    if ((has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v8 = 0;
    goto LABEL_13;
  }
  v55 = 2654435761 * self->_version;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_9;
LABEL_3:
  v54 = 2654435761 * self->_minimumEngineVersion;
  if ((has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  createdDate = self->_createdDate;
  v5 = -createdDate;
  if (createdDate >= 0.0)
    v5 = self->_createdDate;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_13:
  v53 = v8;
  if ((has & 2) != 0)
    v52 = 2654435761 * self->_creatorDevice;
  else
    v52 = 0;
  v51 = -[NSString hash](self->_sourceName, "hash");
  v50 = -[NSString hash](self->_predicate, "hash");
  v9 = (__int16)self->_has;
  if ((v9 & 0x800) != 0)
  {
    v49 = 2654435761 * self->_triggers;
    if ((v9 & 0x80) != 0)
      goto LABEL_18;
  }
  else
  {
    v49 = 0;
    if ((v9 & 0x80) != 0)
    {
LABEL_18:
      v48 = 2654435761 * self->_earnLimit;
      goto LABEL_21;
    }
  }
  v48 = 0;
LABEL_21:
  v47 = -[NSString hash](self->_visibilityPredicate, "hash");
  v46 = -[NSString hash](self->_visibilityStartDate, "hash");
  v45 = -[NSString hash](self->_visibilityEndDate, "hash");
  v44 = -[NSString hash](self->_availabilityPredicate, "hash");
  v43 = -[NSString hash](self->_availabilityStartDate, "hash");
  v42 = -[NSString hash](self->_availabilityEndDate, "hash");
  v41 = -[NSString hash](self->_alertabilityPredicate, "hash");
  v40 = -[NSString hash](self->_alertDates, "hash");
  v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
    v39 = 0;
    if ((v10 & 0x10) != 0)
      goto LABEL_23;
LABEL_26:
    v38 = 0;
    if ((v10 & 0x40) != 0)
      goto LABEL_24;
    goto LABEL_27;
  }
  v39 = 2654435761 * self->_duplicateRemovalStrategy;
  if ((v10 & 0x10) == 0)
    goto LABEL_26;
LABEL_23:
  v38 = 2654435761 * self->_duplicateRemovalCalendarUnit;
  if ((v10 & 0x40) != 0)
  {
LABEL_24:
    v37 = 2654435761 * self->_earnDateStrategy;
    goto LABEL_28;
  }
LABEL_27:
  v37 = 0;
LABEL_28:
  v36 = -[NSString hash](self->_canonicalUnit, "hash");
  v35 = -[NSString hash](self->_valueExpression, "hash");
  v34 = -[NSString hash](self->_progressExpression, "hash");
  v33 = -[NSString hash](self->_goalExpression, "hash");
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v32 = 2654435761 * self->_displayOrder;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_30;
  }
  else
  {
    v32 = 0;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
    {
LABEL_30:
      v31 = 2654435761 * self->_displaysEarnedInstanceCount;
      goto LABEL_33;
    }
  }
  v31 = 0;
LABEL_33:
  v30 = -[NSString hash](self->_availableCountryCodes, "hash");
  v29 = -[NSString hash](self->_availableSuffixes, "hash");
  v11 = -[NSString hash](self->_gracePredicate, "hash");
  v12 = -[NSString hash](self->_graceVisibilityPredicate, "hash");
  v13 = -[NSString hash](self->_graceValueExpression, "hash");
  v14 = -[NSString hash](self->_graceProgressExpression, "hash");
  v15 = -[NSString hash](self->_graceGoalExpression, "hash");
  v16 = (__int16)self->_has;
  if ((v16 & 0x2000) != 0)
  {
    v17 = 2654435761 * self->_availableOnPairedDevice;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_35:
      v18 = 2654435761 * self->_mobileAssetVersion;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_36;
LABEL_43:
      v19 = 0;
      if ((v16 & 4) != 0)
        goto LABEL_37;
LABEL_44:
      v24 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    v17 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_35;
  }
  v18 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_43;
LABEL_36:
  v19 = 2654435761 * self->_key;
  if ((v16 & 4) == 0)
    goto LABEL_44;
LABEL_37:
  dailyTarget = self->_dailyTarget;
  v21 = -dailyTarget;
  if (dailyTarget >= 0.0)
    v21 = self->_dailyTarget;
  v22 = floor(v21 + 0.5);
  v23 = (v21 - v22) * 1.84467441e19;
  v24 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0)
      v24 += (unint64_t)v23;
  }
  else
  {
    v24 -= (unint64_t)fabs(v23);
  }
LABEL_47:
  v25 = v55 ^ v56 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v11 ^ v12 ^ v13 ^ v14;
  v26 = v15 ^ v17 ^ v18 ^ v19 ^ v24 ^ -[NSString hash](self->_dailyTargetCanonicalUnit, "hash");
  v27 = v26 ^ -[ACHCodableSyncIdentity hash](self->_syncIdentity, "hash");
  return v25 ^ v27 ^ -[NSString hash](self->_prerequisiteTemplateName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  ACHCodableSyncIdentity *syncIdentity;
  uint64_t v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (*((_QWORD *)v4 + 34))
  {
    -[ACHCodableTemplate setUniqueName:](self, "setUniqueName:");
    v4 = v12;
  }
  v5 = *((_WORD *)v4 + 158);
  if ((v5 & 0x1000) != 0)
  {
    self->_version = *((_QWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 0x1000u;
    v5 = *((_WORD *)v4 + 158);
    if ((v5 & 0x200) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_6;
      goto LABEL_74;
    }
  }
  else if ((*((_WORD *)v4 + 158) & 0x200) == 0)
  {
    goto LABEL_5;
  }
  self->_minimumEngineVersion = *((_QWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 158);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_74:
  self->_createdDate = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 158) & 2) != 0)
  {
LABEL_7:
    self->_creatorDevice = *((_QWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 32))
  {
    -[ACHCodableTemplate setSourceName:](self, "setSourceName:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 29))
  {
    -[ACHCodableTemplate setPredicate:](self, "setPredicate:");
    v4 = v12;
  }
  v6 = *((_WORD *)v4 + 158);
  if ((v6 & 0x800) != 0)
  {
    self->_triggers = *((_QWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x800u;
    v6 = *((_WORD *)v4 + 158);
  }
  if ((v6 & 0x80) != 0)
  {
    self->_earnLimit = *((_QWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 37))
  {
    -[ACHCodableTemplate setVisibilityPredicate:](self, "setVisibilityPredicate:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 38))
  {
    -[ACHCodableTemplate setVisibilityStartDate:](self, "setVisibilityStartDate:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 36))
  {
    -[ACHCodableTemplate setVisibilityEndDate:](self, "setVisibilityEndDate:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 17))
  {
    -[ACHCodableTemplate setAvailabilityPredicate:](self, "setAvailabilityPredicate:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 18))
  {
    -[ACHCodableTemplate setAvailabilityStartDate:](self, "setAvailabilityStartDate:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[ACHCodableTemplate setAvailabilityEndDate:](self, "setAvailabilityEndDate:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[ACHCodableTemplate setAlertabilityPredicate:](self, "setAlertabilityPredicate:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[ACHCodableTemplate setAlertDates:](self, "setAlertDates:");
    v4 = v12;
  }
  v7 = *((_WORD *)v4 + 158);
  if ((v7 & 0x20) != 0)
  {
    self->_duplicateRemovalStrategy = *((_QWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    v7 = *((_WORD *)v4 + 158);
    if ((v7 & 0x10) == 0)
    {
LABEL_34:
      if ((v7 & 0x40) == 0)
        goto LABEL_36;
      goto LABEL_35;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_34;
  }
  self->_duplicateRemovalCalendarUnit = *((_QWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 158) & 0x40) != 0)
  {
LABEL_35:
    self->_earnDateStrategy = *((_QWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_36:
  if (*((_QWORD *)v4 + 21))
  {
    -[ACHCodableTemplate setCanonicalUnit:](self, "setCanonicalUnit:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 35))
  {
    -[ACHCodableTemplate setValueExpression:](self, "setValueExpression:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 31))
  {
    -[ACHCodableTemplate setProgressExpression:](self, "setProgressExpression:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 23))
  {
    -[ACHCodableTemplate setGoalExpression:](self, "setGoalExpression:");
    v4 = v12;
  }
  v8 = *((_WORD *)v4 + 158);
  if ((v8 & 8) != 0)
  {
    self->_displayOrder = *((_QWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    v8 = *((_WORD *)v4 + 158);
  }
  if ((v8 & 0x4000) != 0)
  {
    self->_displaysEarnedInstanceCount = *((_BYTE *)v4 + 313);
    *(_WORD *)&self->_has |= 0x4000u;
  }
  if (*((_QWORD *)v4 + 19))
  {
    -[ACHCodableTemplate setAvailableCountryCodes:](self, "setAvailableCountryCodes:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 20))
  {
    -[ACHCodableTemplate setAvailableSuffixes:](self, "setAvailableSuffixes:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 25))
  {
    -[ACHCodableTemplate setGracePredicate:](self, "setGracePredicate:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 28))
  {
    -[ACHCodableTemplate setGraceVisibilityPredicate:](self, "setGraceVisibilityPredicate:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 27))
  {
    -[ACHCodableTemplate setGraceValueExpression:](self, "setGraceValueExpression:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 26))
  {
    -[ACHCodableTemplate setGraceProgressExpression:](self, "setGraceProgressExpression:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 24))
  {
    -[ACHCodableTemplate setGraceGoalExpression:](self, "setGraceGoalExpression:");
    v4 = v12;
  }
  v9 = *((_WORD *)v4 + 158);
  if ((v9 & 0x2000) != 0)
  {
    self->_availableOnPairedDevice = *((_BYTE *)v4 + 312);
    *(_WORD *)&self->_has |= 0x2000u;
    v9 = *((_WORD *)v4 + 158);
    if ((v9 & 0x400) == 0)
    {
LABEL_64:
      if ((v9 & 0x100) == 0)
        goto LABEL_65;
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 158) & 0x400) == 0)
  {
    goto LABEL_64;
  }
  self->_mobileAssetVersion = *((_QWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  v9 = *((_WORD *)v4 + 158);
  if ((v9 & 0x100) == 0)
  {
LABEL_65:
    if ((v9 & 4) == 0)
      goto LABEL_67;
    goto LABEL_66;
  }
LABEL_81:
  self->_key = *((_QWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 158) & 4) != 0)
  {
LABEL_66:
    self->_dailyTarget = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_67:
  if (*((_QWORD *)v4 + 22))
  {
    -[ACHCodableTemplate setDailyTargetCanonicalUnit:](self, "setDailyTargetCanonicalUnit:");
    v4 = v12;
  }
  syncIdentity = self->_syncIdentity;
  v11 = *((_QWORD *)v4 + 33);
  if (syncIdentity)
  {
    if (!v11)
      goto LABEL_86;
    -[ACHCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_86;
    -[ACHCodableTemplate setSyncIdentity:](self, "setSyncIdentity:");
  }
  v4 = v12;
LABEL_86:
  if (*((_QWORD *)v4 + 30))
  {
    -[ACHCodableTemplate setPrerequisiteTemplateName:](self, "setPrerequisiteTemplateName:");
    v4 = v12;
  }

}

- (ACHCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

@end
