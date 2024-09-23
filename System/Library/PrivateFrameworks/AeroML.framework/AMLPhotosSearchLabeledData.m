@implementation AMLPhotosSearchLabeledData

- (BOOL)hasSearchSessionUUID
{
  return self->_searchSessionUUID != 0;
}

- (int)uiSurface
{
  if ((*((_BYTE *)&self->_has + 6) & 1) != 0)
    return self->_uiSurface;
  else
    return 0;
}

- (void)setUiSurface:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_uiSurface = a3;
}

- (void)setHasUiSurface:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasUiSurface
{
  return *((_BYTE *)&self->_has + 6) & 1;
}

- (id)uiSurfaceAsString:(int)a3
{
  if (a3 < 4)
    return off_250752EE8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUiSurface:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AMLUISurfaceTypeUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AMLUISurfaceTypeSpotlight")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AMLUISurfaceTypePhotosApp")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AMLUISurfaceTypeStoryTellingBackground")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMatchedPeopleRatio:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_matchedPeopleRatio = a3;
}

- (void)setHasMatchedPeopleRatio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasMatchedPeopleRatio
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setMatchedLocationRatio:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_matchedLocationRatio = a3;
}

- (void)setHasMatchedLocationRatio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasMatchedLocationRatio
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setMatchedSceneRatio:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_matchedSceneRatio = a3;
}

- (void)setHasMatchedSceneRatio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedSceneRatio
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setMatchedSceneConfidence:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_matchedSceneConfidence = a3;
}

- (void)setHasMatchedSceneConfidence:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasMatchedSceneConfidence
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setMatchedSceneBoundingBox:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_matchedSceneBoundingBox = a3;
}

- (void)setHasMatchedSceneBoundingBox:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasMatchedSceneBoundingBox
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setMatchedOCRCharacterRatio:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_matchedOCRCharacterRatio = a3;
}

- (void)setHasMatchedOCRCharacterRatio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasMatchedOCRCharacterRatio
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setMatchedOCRImportance:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_matchedOCRImportance = a3;
}

- (void)setHasMatchedOCRImportance:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasMatchedOCRImportance
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setMatchedFieldsCount:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_matchedFieldsCount = a3;
}

- (void)setHasMatchedFieldsCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedFieldsCount
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setL1Score:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_l1Score = a3;
}

- (void)setHasL1Score:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasL1Score
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setFreshness:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_freshness = a3;
}

- (void)setHasFreshness:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasFreshness
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setFavorited:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_favorited = a3;
}

- (void)setHasFavorited:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasFavorited
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setAestheticScore:(double)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_aestheticScore = a3;
}

- (void)setHasAestheticScore:(BOOL)a3
{
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAestheticScore
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCurationScore:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_curationScore = a3;
}

- (void)setHasCurationScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasCurationScore
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasEverClickInLastWeek:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_hasEverClickInLastWeek = a3;
}

- (void)setHasHasEverClickInLastWeek:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasHasEverClickInLastWeek
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasEverClickInLastMonth:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_hasEverClickInLastMonth = a3;
}

- (void)setHasHasEverClickInLastMonth:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasHasEverClickInLastMonth
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasEverShareInLastWeek:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_hasEverShareInLastWeek = a3;
}

- (void)setHasHasEverShareInLastWeek:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasHasEverShareInLastWeek
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasEverShareInLastMonth:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_hasEverShareInLastMonth = a3;
}

- (void)setHasHasEverShareInLastMonth:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasHasEverShareInLastMonth
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setClickCountInLastWeekNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_clickCountInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasClickCountInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setClickCountInLastMonthNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_clickCountInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasClickCountInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setShareCountInLastWeekNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_shareCountInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasShareCountInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setShareCountInLastMonthNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_shareCountInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasShareCountInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setClickCountGivenLocationInLastWeekNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenLocationInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasClickCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setClickCountGivenLocationInLastMonthNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenLocationInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasClickCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setShareCountGivenLocationInLastWeekNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenLocationInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setShareCountGivenLocationInLastMonthNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenLocationInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setClipScore:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_clipScore = a3;
}

- (void)setHasClipScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasClipScore
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setClicked:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_clicked = a3;
}

- (void)setHasClicked:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasClicked
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setClickOrder:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_clickOrder = a3;
}

- (void)setHasClickOrder:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasClickOrder
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setItemPosition:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_itemPosition = a3;
}

- (void)setHasItemPosition:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasItemPosition
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setL2ModelScore:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_l2ModelScore = a3;
}

- (void)setHasL2ModelScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasL2ModelScore
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setIsDuplicate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_isDuplicate = a3;
}

- (void)setHasIsDuplicate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasIsDuplicate
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setIsCompleteMatch:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_isCompleteMatch = a3;
}

- (void)setHasIsCompleteMatch:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasIsCompleteMatch
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
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
  v8.super_class = (Class)AMLPhotosSearchLabeledData;
  -[AMLPhotosSearchLabeledData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMLPhotosSearchLabeledData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *searchSessionUUID;
  $4C4BBB02FAA7C3350847BB4120A7B85D has;
  uint64_t uiSurface;
  __CFString *v8;
  void *v9;
  id v10;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  searchSessionUUID = self->_searchSessionUUID;
  if (searchSessionUUID)
    objc_msgSend(v3, "setObject:forKey:", searchSessionUUID, CFSTR("searchSessionUUID"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    uiSurface = self->_uiSurface;
    if (uiSurface >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_uiSurface);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_250752EE8[uiSurface];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("uiSurface"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_matchedPeopleRatio);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("matchedPeopleRatio"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x4000000) == 0)
    {
LABEL_10:
      if ((*(_QWORD *)&has & 0x100000000) == 0)
        goto LABEL_11;
      goto LABEL_62;
    }
  }
  else if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_matchedLocationRatio);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("matchedLocationRatio"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_12;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_matchedSceneRatio);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("matchedSceneRatio"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_13;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_matchedSceneConfidence);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("matchedSceneConfidence"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_14;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_matchedSceneBoundingBox);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("matchedSceneBoundingBox"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_15;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_matchedOCRCharacterRatio);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("matchedOCRCharacterRatio"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x800000000000) == 0)
      goto LABEL_16;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_matchedOCRImportance);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("matchedOCRImportance"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_17;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_matchedFieldsCount);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("matchedFieldsCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_l1Score);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("L1Score"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&has & 0x4000000000000) == 0)
      goto LABEL_19;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_freshness);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("freshness"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_20;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_favorited);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("favorited"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_aestheticScore);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("aestheticScore"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_22;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_curationScore);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("curationScore"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_23;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_hasEverClickInLastWeek);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("hasEverClickInLastWeek"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_24;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_hasEverClickInLastMonth);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("hasEverClickInLastMonth"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_25;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_hasEverShareInLastWeek);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("hasEverShareInLastWeek"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_26;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_hasEverShareInLastMonth);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("hasEverShareInLastMonth"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_27;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountInLastWeekNormalizedAcrossItems);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("clickCountInLastWeekNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_28;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountInLastMonthNormalizedAcrossItems);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("clickCountInLastMonthNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_29;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shareCountInLastWeekNormalizedAcrossItems);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("shareCountInLastWeekNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_30;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shareCountInLastMonthNormalizedAcrossItems);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("shareCountInLastMonthNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_31;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_32;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_33;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("clickCountGivenLocationInLastWeekNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_34;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("clickCountGivenLocationInLastMonthNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_35;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_36;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_37;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_38;
    goto LABEL_89;
  }
LABEL_88:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_39;
    goto LABEL_90;
  }
LABEL_89:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_39:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_40;
    goto LABEL_91;
  }
LABEL_90:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_40:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_41;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_42;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_43;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_44;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_44:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_45;
    goto LABEL_96;
  }
LABEL_95:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("shareCountGivenLocationInLastWeekNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_46;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("shareCountGivenLocationInLastMonthNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_47;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_47:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_48;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_48:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_49;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_49:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_50;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_50:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_51;
    goto LABEL_102;
  }
LABEL_101:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_52;
    goto LABEL_103;
  }
LABEL_102:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_52:
    if ((*(_QWORD *)&has & 0x2000000000000) == 0)
      goto LABEL_53;
    goto LABEL_104;
  }
LABEL_103:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clipScore);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("clipScore"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000000) == 0)
  {
LABEL_53:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_54;
    goto LABEL_105;
  }
LABEL_104:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_clicked);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("clicked"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_54:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_55;
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_clickOrder);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("clickOrder"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_56;
    goto LABEL_107;
  }
LABEL_106:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_itemPosition);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("itemPosition"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_57;
LABEL_108:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_isDuplicate);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("isDuplicate"));

    if ((*(_QWORD *)&self->_has & 0x400000) == 0)
      goto LABEL_59;
    goto LABEL_58;
  }
LABEL_107:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_l2ModelScore);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v59, CFSTR("L2ModelScore"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
    goto LABEL_108;
LABEL_57:
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_58:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_isCompleteMatch);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("isCompleteMatch"));

  }
LABEL_59:
  v10 = v4;

  return v10;
}

- (BOOL)readFrom:(id)a3
{
  return AMLPhotosSearchLabeledDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $4C4BBB02FAA7C3350847BB4120A7B85D has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_searchSessionUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_6;
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_7;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_8;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_9;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_10;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_11;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&has & 0x800000000000) == 0)
      goto LABEL_12;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_13;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_QWORD *)&has & 0x4000000000000) == 0)
      goto LABEL_15;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_16;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_20;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_24;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_25;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_27;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_30;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_31;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_32;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_33;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_35;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_36;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_37;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_38;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_39;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_39:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_40;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_41;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_42;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_44;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_44:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_45;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_46;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_47;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_48;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_48:
    if ((*(_QWORD *)&has & 0x2000000000000) == 0)
      goto LABEL_49;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000000) == 0)
  {
LABEL_49:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_50;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_50:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_51;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_52;
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_53;
LABEL_105:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_QWORD *)&self->_has & 0x400000) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_104:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
    goto LABEL_105;
LABEL_53:
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_54:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_55:

}

- (void)copyTo:(id)a3
{
  id v4;
  $4C4BBB02FAA7C3350847BB4120A7B85D has;
  id v6;

  v4 = a3;
  if (self->_searchSessionUUID)
  {
    v6 = v4;
    objc_msgSend(v4, "setSearchSessionUUID:");
    v4 = v6;
  }
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    *((_DWORD *)v4 + 98) = self->_uiSurface;
    *((_QWORD *)v4 + 50) |= 0x1000000000000uLL;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_6;
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 30) = *(_QWORD *)&self->_matchedPeopleRatio;
  *((_QWORD *)v4 + 50) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_7;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)v4 + 27) = *(_QWORD *)&self->_matchedLocationRatio;
  *((_QWORD *)v4 + 50) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_8;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)v4 + 33) = *(_QWORD *)&self->_matchedSceneRatio;
  *((_QWORD *)v4 + 50) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_9;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)v4 + 32) = *(_QWORD *)&self->_matchedSceneConfidence;
  *((_QWORD *)v4 + 50) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_10;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)v4 + 31) = *(_QWORD *)&self->_matchedSceneBoundingBox;
  *((_QWORD *)v4 + 50) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_11;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)v4 + 28) = *(_QWORD *)&self->_matchedOCRCharacterRatio;
  *((_QWORD *)v4 + 50) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&has & 0x800000000000) == 0)
      goto LABEL_12;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)v4 + 29) = *(_QWORD *)&self->_matchedOCRImportance;
  *((_QWORD *)v4 + 50) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_13;
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v4 + 94) = self->_matchedFieldsCount;
  *((_QWORD *)v4 + 50) |= 0x800000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)v4 + 25) = *(_QWORD *)&self->_l1Score;
  *((_QWORD *)v4 + 50) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_QWORD *)&has & 0x4000000000000) == 0)
      goto LABEL_15;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)v4 + 18) = *(_QWORD *)&self->_freshness;
  *((_QWORD *)v4 + 50) |= 0x20000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_16;
    goto LABEL_68;
  }
LABEL_67:
  *((_BYTE *)v4 + 397) = self->_favorited;
  *((_QWORD *)v4 + 50) |= 0x4000000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_aestheticScore;
  *((_QWORD *)v4 + 50) |= 1uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)v4 + 17) = *(_QWORD *)&self->_curationScore;
  *((_QWORD *)v4 + 50) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_71;
  }
LABEL_70:
  *((_QWORD *)v4 + 20) = *(_QWORD *)&self->_hasEverClickInLastWeek;
  *((_QWORD *)v4 + 50) |= 0x80000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_20;
    goto LABEL_72;
  }
LABEL_71:
  *((_QWORD *)v4 + 19) = *(_QWORD *)&self->_hasEverClickInLastMonth;
  *((_QWORD *)v4 + 50) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_73;
  }
LABEL_72:
  *((_QWORD *)v4 + 22) = *(_QWORD *)&self->_hasEverShareInLastWeek;
  *((_QWORD *)v4 + 50) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_74;
  }
LABEL_73:
  *((_QWORD *)v4 + 21) = *(_QWORD *)&self->_hasEverShareInLastMonth;
  *((_QWORD *)v4 + 50) |= 0x100000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_75;
  }
LABEL_74:
  *((_QWORD *)v4 + 15) = *(_QWORD *)&self->_clickCountInLastWeekNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_24;
    goto LABEL_76;
  }
LABEL_75:
  *((_QWORD *)v4 + 14) = *(_QWORD *)&self->_clickCountInLastMonthNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x2000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_25;
    goto LABEL_77;
  }
LABEL_76:
  *((_QWORD *)v4 + 45) = *(_QWORD *)&self->_shareCountInLastWeekNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x100000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_78;
  }
LABEL_77:
  *((_QWORD *)v4 + 44) = *(_QWORD *)&self->_shareCountInLastMonthNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x80000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_27;
    goto LABEL_79;
  }
LABEL_78:
  *((_QWORD *)v4 + 13) = *(_QWORD *)&self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_80;
  }
LABEL_79:
  *((_QWORD *)v4 + 12) = *(_QWORD *)&self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x800uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_81;
  }
LABEL_80:
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_30;
    goto LABEL_82;
  }
LABEL_81:
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_31;
    goto LABEL_83;
  }
LABEL_82:
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 4uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_32;
    goto LABEL_84;
  }
LABEL_83:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 2uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_33;
    goto LABEL_85;
  }
LABEL_84:
  *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x100uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_86;
  }
LABEL_85:
  *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_35;
    goto LABEL_87;
  }
LABEL_86:
  *((_QWORD *)v4 + 11) = *(_QWORD *)&self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_36;
    goto LABEL_88;
  }
LABEL_87:
  *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_37;
    goto LABEL_89;
  }
LABEL_88:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_38;
    goto LABEL_90;
  }
LABEL_89:
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 8uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_39;
    goto LABEL_91;
  }
LABEL_90:
  *((_QWORD *)v4 + 43) = *(_QWORD *)&self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_39:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_40;
    goto LABEL_92;
  }
LABEL_91:
  *((_QWORD *)v4 + 42) = *(_QWORD *)&self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_41;
    goto LABEL_93;
  }
LABEL_92:
  *((_QWORD *)v4 + 39) = *(_QWORD *)&self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_42;
    goto LABEL_94;
  }
LABEL_93:
  *((_QWORD *)v4 + 38) = *(_QWORD *)&self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_94:
  *((_QWORD *)v4 + 35) = *(_QWORD *)&self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_44;
    goto LABEL_96;
  }
LABEL_95:
  *((_QWORD *)v4 + 34) = *(_QWORD *)&self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_44:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_45;
    goto LABEL_97;
  }
LABEL_96:
  *((_QWORD *)v4 + 41) = *(_QWORD *)&self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_46;
    goto LABEL_98;
  }
LABEL_97:
  *((_QWORD *)v4 + 40) = *(_QWORD *)&self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_47;
    goto LABEL_99;
  }
LABEL_98:
  *((_QWORD *)v4 + 37) = *(_QWORD *)&self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_48;
    goto LABEL_100;
  }
LABEL_99:
  *((_QWORD *)v4 + 36) = *(_QWORD *)&self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
  *((_QWORD *)v4 + 50) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_48:
    if ((*(_QWORD *)&has & 0x2000000000000) == 0)
      goto LABEL_49;
    goto LABEL_101;
  }
LABEL_100:
  *((_QWORD *)v4 + 16) = *(_QWORD *)&self->_clipScore;
  *((_QWORD *)v4 + 50) |= 0x8000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000000) == 0)
  {
LABEL_49:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_50;
    goto LABEL_102;
  }
LABEL_101:
  *((_BYTE *)v4 + 396) = self->_clicked;
  *((_QWORD *)v4 + 50) |= 0x2000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_50:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_51;
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)v4 + 92) = self->_clickOrder;
  *((_QWORD *)v4 + 50) |= 0x200000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_52;
    goto LABEL_104;
  }
LABEL_103:
  *((_DWORD *)v4 + 93) = self->_itemPosition;
  *((_QWORD *)v4 + 50) |= 0x400000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_53;
LABEL_105:
    *((_QWORD *)v4 + 24) = *(_QWORD *)&self->_isDuplicate;
    *((_QWORD *)v4 + 50) |= 0x800000uLL;
    if ((*(_QWORD *)&self->_has & 0x400000) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_104:
  *((_QWORD *)v4 + 26) = *(_QWORD *)&self->_l2ModelScore;
  *((_QWORD *)v4 + 50) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
    goto LABEL_105;
LABEL_53:
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_54:
    *((_QWORD *)v4 + 23) = *(_QWORD *)&self->_isCompleteMatch;
    *((_QWORD *)v4 + 50) |= 0x400000uLL;
  }
LABEL_55:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  $4C4BBB02FAA7C3350847BB4120A7B85D has;
  id v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_searchSessionUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v6;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    *(_DWORD *)(v5 + 392) = self->_uiSurface;
    *(_QWORD *)(v5 + 400) |= 0x1000000000000uLL;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_4;
      goto LABEL_56;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 240) = self->_matchedPeopleRatio;
  *(_QWORD *)(v5 + 400) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_5;
    goto LABEL_57;
  }
LABEL_56:
  *(double *)(v5 + 216) = self->_matchedLocationRatio;
  *(_QWORD *)(v5 + 400) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_6;
    goto LABEL_58;
  }
LABEL_57:
  *(double *)(v5 + 264) = self->_matchedSceneRatio;
  *(_QWORD *)(v5 + 400) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_7;
    goto LABEL_59;
  }
LABEL_58:
  *(double *)(v5 + 256) = self->_matchedSceneConfidence;
  *(_QWORD *)(v5 + 400) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_8;
    goto LABEL_60;
  }
LABEL_59:
  *(double *)(v5 + 248) = self->_matchedSceneBoundingBox;
  *(_QWORD *)(v5 + 400) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_9;
    goto LABEL_61;
  }
LABEL_60:
  *(double *)(v5 + 224) = self->_matchedOCRCharacterRatio;
  *(_QWORD *)(v5 + 400) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x800000000000) == 0)
      goto LABEL_10;
    goto LABEL_62;
  }
LABEL_61:
  *(double *)(v5 + 232) = self->_matchedOCRImportance;
  *(_QWORD *)(v5 + 400) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v5 + 376) = self->_matchedFieldsCount;
  *(_QWORD *)(v5 + 400) |= 0x800000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_64;
  }
LABEL_63:
  *(double *)(v5 + 200) = self->_l1Score;
  *(_QWORD *)(v5 + 400) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&has & 0x4000000000000) == 0)
      goto LABEL_13;
    goto LABEL_65;
  }
LABEL_64:
  *(double *)(v5 + 144) = self->_freshness;
  *(_QWORD *)(v5 + 400) |= 0x20000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_14;
    goto LABEL_66;
  }
LABEL_65:
  *(_BYTE *)(v5 + 397) = self->_favorited;
  *(_QWORD *)(v5 + 400) |= 0x4000000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_67;
  }
LABEL_66:
  *(double *)(v5 + 8) = self->_aestheticScore;
  *(_QWORD *)(v5 + 400) |= 1uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_68;
  }
LABEL_67:
  *(double *)(v5 + 136) = self->_curationScore;
  *(_QWORD *)(v5 + 400) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_17;
    goto LABEL_69;
  }
LABEL_68:
  *(double *)(v5 + 160) = self->_hasEverClickInLastWeek;
  *(_QWORD *)(v5 + 400) |= 0x80000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_18;
    goto LABEL_70;
  }
LABEL_69:
  *(double *)(v5 + 152) = self->_hasEverClickInLastMonth;
  *(_QWORD *)(v5 + 400) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_19;
    goto LABEL_71;
  }
LABEL_70:
  *(double *)(v5 + 176) = self->_hasEverShareInLastWeek;
  *(_QWORD *)(v5 + 400) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_72;
  }
LABEL_71:
  *(double *)(v5 + 168) = self->_hasEverShareInLastMonth;
  *(_QWORD *)(v5 + 400) |= 0x100000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_73;
  }
LABEL_72:
  *(double *)(v5 + 120) = self->_clickCountInLastWeekNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_22;
    goto LABEL_74;
  }
LABEL_73:
  *(double *)(v5 + 112) = self->_clickCountInLastMonthNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x2000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_23;
    goto LABEL_75;
  }
LABEL_74:
  *(double *)(v5 + 360) = self->_shareCountInLastWeekNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x100000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_24;
    goto LABEL_76;
  }
LABEL_75:
  *(double *)(v5 + 352) = self->_shareCountInLastMonthNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x80000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_25;
    goto LABEL_77;
  }
LABEL_76:
  *(double *)(v5 + 104) = self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_26;
    goto LABEL_78;
  }
LABEL_77:
  *(double *)(v5 + 96) = self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x800uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_79;
  }
LABEL_78:
  *(double *)(v5 + 56) = self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_28;
    goto LABEL_80;
  }
LABEL_79:
  *(double *)(v5 + 48) = self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_29;
    goto LABEL_81;
  }
LABEL_80:
  *(double *)(v5 + 24) = self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 4uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_30;
    goto LABEL_82;
  }
LABEL_81:
  *(double *)(v5 + 16) = self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 2uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_31;
    goto LABEL_83;
  }
LABEL_82:
  *(double *)(v5 + 72) = self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x100uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_32;
    goto LABEL_84;
  }
LABEL_83:
  *(double *)(v5 + 64) = self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_33;
    goto LABEL_85;
  }
LABEL_84:
  *(double *)(v5 + 88) = self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_34;
    goto LABEL_86;
  }
LABEL_85:
  *(double *)(v5 + 80) = self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_35;
    goto LABEL_87;
  }
LABEL_86:
  *(double *)(v5 + 40) = self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_36;
    goto LABEL_88;
  }
LABEL_87:
  *(double *)(v5 + 32) = self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 8uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_37;
    goto LABEL_89;
  }
LABEL_88:
  *(double *)(v5 + 344) = self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_38;
    goto LABEL_90;
  }
LABEL_89:
  *(double *)(v5 + 336) = self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_39;
    goto LABEL_91;
  }
LABEL_90:
  *(double *)(v5 + 312) = self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_39:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_40;
    goto LABEL_92;
  }
LABEL_91:
  *(double *)(v5 + 304) = self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_41;
    goto LABEL_93;
  }
LABEL_92:
  *(double *)(v5 + 280) = self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_42;
    goto LABEL_94;
  }
LABEL_93:
  *(double *)(v5 + 272) = self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_94:
  *(double *)(v5 + 328) = self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_44;
    goto LABEL_96;
  }
LABEL_95:
  *(double *)(v5 + 320) = self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_44:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_45;
    goto LABEL_97;
  }
LABEL_96:
  *(double *)(v5 + 296) = self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_46;
    goto LABEL_98;
  }
LABEL_97:
  *(double *)(v5 + 288) = self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
  *(_QWORD *)(v5 + 400) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&has & 0x2000000000000) == 0)
      goto LABEL_47;
    goto LABEL_99;
  }
LABEL_98:
  *(double *)(v5 + 128) = self->_clipScore;
  *(_QWORD *)(v5 + 400) |= 0x8000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000000) == 0)
  {
LABEL_47:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_48;
    goto LABEL_100;
  }
LABEL_99:
  *(_BYTE *)(v5 + 396) = self->_clicked;
  *(_QWORD *)(v5 + 400) |= 0x2000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_48:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_49;
    goto LABEL_101;
  }
LABEL_100:
  *(_DWORD *)(v5 + 368) = self->_clickOrder;
  *(_QWORD *)(v5 + 400) |= 0x200000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_50;
    goto LABEL_102;
  }
LABEL_101:
  *(_DWORD *)(v5 + 372) = self->_itemPosition;
  *(_QWORD *)(v5 + 400) |= 0x400000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_51;
LABEL_103:
    *(double *)(v5 + 192) = self->_isDuplicate;
    *(_QWORD *)(v5 + 400) |= 0x800000uLL;
    if ((*(_QWORD *)&self->_has & 0x400000) == 0)
      goto LABEL_53;
    goto LABEL_52;
  }
LABEL_102:
  *(double *)(v5 + 208) = self->_l2ModelScore;
  *(_QWORD *)(v5 + 400) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
    goto LABEL_103;
LABEL_51:
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_52:
    *(double *)(v5 + 184) = self->_isCompleteMatch;
    *(_QWORD *)(v5 + 400) |= 0x400000uLL;
  }
LABEL_53:
  v9 = (id)v5;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *searchSessionUUID;
  $4C4BBB02FAA7C3350847BB4120A7B85D has;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_265;
  searchSessionUUID = self->_searchSessionUUID;
  if ((unint64_t)searchSessionUUID | *((_QWORD *)v4 + 48))
  {
    if (!-[NSString isEqual:](searchSessionUUID, "isEqual:"))
      goto LABEL_265;
  }
  has = self->_has;
  v7 = *((_QWORD *)v4 + 50);
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    if ((v7 & 0x1000000000000) == 0 || self->_uiSurface != *((_DWORD *)v4 + 98))
      goto LABEL_265;
  }
  else if ((v7 & 0x1000000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0 || self->_matchedPeopleRatio != *((double *)v4 + 30))
      goto LABEL_265;
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0 || self->_matchedLocationRatio != *((double *)v4 + 27))
      goto LABEL_265;
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_matchedSceneRatio != *((double *)v4 + 33))
      goto LABEL_265;
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_matchedSceneConfidence != *((double *)v4 + 32))
      goto LABEL_265;
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0 || self->_matchedSceneBoundingBox != *((double *)v4 + 31))
      goto LABEL_265;
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_matchedOCRCharacterRatio != *((double *)v4 + 28))
      goto LABEL_265;
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_matchedOCRImportance != *((double *)v4 + 29))
      goto LABEL_265;
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x800000000000) != 0)
  {
    if ((v7 & 0x800000000000) == 0 || self->_matchedFieldsCount != *((_DWORD *)v4 + 94))
      goto LABEL_265;
  }
  else if ((v7 & 0x800000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_l1Score != *((double *)v4 + 25))
      goto LABEL_265;
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_freshness != *((double *)v4 + 18))
      goto LABEL_265;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x4000000000000) != 0)
  {
    if ((v7 & 0x4000000000000) == 0)
      goto LABEL_265;
    if (self->_favorited)
    {
      if (!*((_BYTE *)v4 + 397))
        goto LABEL_265;
    }
    else if (*((_BYTE *)v4 + 397))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x4000000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_aestheticScore != *((double *)v4 + 1))
      goto LABEL_265;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_curationScore != *((double *)v4 + 17))
      goto LABEL_265;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_hasEverClickInLastWeek != *((double *)v4 + 20))
      goto LABEL_265;
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_hasEverClickInLastMonth != *((double *)v4 + 19))
      goto LABEL_265;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_hasEverShareInLastWeek != *((double *)v4 + 22))
      goto LABEL_265;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_hasEverShareInLastMonth != *((double *)v4 + 21))
      goto LABEL_265;
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_clickCountInLastWeekNormalizedAcrossItems != *((double *)v4 + 15))
      goto LABEL_265;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_clickCountInLastMonthNormalizedAcrossItems != *((double *)v4 + 14))
      goto LABEL_265;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x100000000000) != 0)
  {
    if ((v7 & 0x100000000000) == 0 || self->_shareCountInLastWeekNormalizedAcrossItems != *((double *)v4 + 45))
      goto LABEL_265;
  }
  else if ((v7 & 0x100000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) == 0 || self->_shareCountInLastMonthNormalizedAcrossItems != *((double *)v4 + 44))
      goto LABEL_265;
  }
  else if ((v7 & 0x80000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems != *((double *)v4 + 13))
      goto LABEL_265;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems != *((double *)v4 + 12))
      goto LABEL_265;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems != *((double *)v4 + 7))
      goto LABEL_265;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems != *((double *)v4 + 6))
      goto LABEL_265;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 3))
      goto LABEL_265;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 2))
      goto LABEL_265;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0
      || self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 9))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0
      || self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 8))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 11))
      goto LABEL_265;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0
      || self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 10))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0
      || self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 5))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 4))
      goto LABEL_265;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0
      || self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems != *((double *)v4 + 43))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    if ((v7 & 0x20000000000) == 0
      || self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems != *((double *)v4 + 42))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x20000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0
      || self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems != *((double *)v4 + 39))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
    if ((v7 & 0x2000000000) == 0
      || self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems != *((double *)v4 + 38))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x2000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0
      || self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 35))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0
      || self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 34))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0
      || self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 41))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0
      || self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 40))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0
      || self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 37))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0
      || self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 36))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_clipScore != *((double *)v4 + 16))
      goto LABEL_265;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x2000000000000) != 0)
  {
    if ((v7 & 0x2000000000000) == 0)
      goto LABEL_265;
    if (self->_clicked)
    {
      if (!*((_BYTE *)v4 + 396))
        goto LABEL_265;
    }
    else if (*((_BYTE *)v4 + 396))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x2000000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x200000000000) != 0)
  {
    if ((v7 & 0x200000000000) == 0 || self->_clickOrder != *((_DWORD *)v4 + 92))
      goto LABEL_265;
  }
  else if ((v7 & 0x200000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x400000000000) != 0)
  {
    if ((v7 & 0x400000000000) == 0 || self->_itemPosition != *((_DWORD *)v4 + 93))
      goto LABEL_265;
  }
  else if ((v7 & 0x400000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_l2ModelScore != *((double *)v4 + 26))
      goto LABEL_265;
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    if ((v7 & 0x800000) == 0)
      goto LABEL_260;
LABEL_265:
    v9 = 0;
    goto LABEL_266;
  }
  if ((v7 & 0x800000) == 0 || self->_isDuplicate != *((double *)v4 + 24))
    goto LABEL_265;
LABEL_260:
  v8 = *((_QWORD *)v4 + 50);
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0 || self->_isCompleteMatch != *((double *)v4 + 23))
      goto LABEL_265;
    v9 = 1;
  }
  else
  {
    v9 = (v8 & 0x400000) == 0;
  }
LABEL_266:

  return v9;
}

- (unint64_t)hash
{
  $4C4BBB02FAA7C3350847BB4120A7B85D has;
  double matchedPeopleRatio;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double matchedLocationRatio;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double matchedSceneRatio;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double matchedSceneConfidence;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double matchedSceneBoundingBox;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double matchedOCRCharacterRatio;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double matchedOCRImportance;
  double v36;
  long double v37;
  double v38;
  double l1Score;
  double v40;
  long double v41;
  double v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  double freshness;
  double v47;
  long double v48;
  double v49;
  double aestheticScore;
  double v51;
  long double v52;
  double v53;
  unint64_t v54;
  unint64_t v55;
  double curationScore;
  double v57;
  long double v58;
  double v59;
  unint64_t v60;
  unint64_t v61;
  double hasEverClickInLastWeek;
  double v63;
  long double v64;
  double v65;
  unint64_t v66;
  unint64_t v67;
  double hasEverClickInLastMonth;
  double v69;
  long double v70;
  double v71;
  unint64_t v72;
  unint64_t v73;
  double hasEverShareInLastWeek;
  double v75;
  long double v76;
  double v77;
  unint64_t v78;
  unint64_t v79;
  double hasEverShareInLastMonth;
  double v81;
  long double v82;
  double v83;
  unint64_t v84;
  unint64_t v85;
  double clickCountInLastWeekNormalizedAcrossItems;
  double v87;
  long double v88;
  double v89;
  unint64_t v90;
  unint64_t v91;
  double clickCountInLastMonthNormalizedAcrossItems;
  double v93;
  long double v94;
  double v95;
  unint64_t v96;
  unint64_t v97;
  double shareCountInLastWeekNormalizedAcrossItems;
  double v99;
  long double v100;
  double v101;
  unint64_t v102;
  unint64_t v103;
  double shareCountInLastMonthNormalizedAcrossItems;
  double v105;
  long double v106;
  double v107;
  unint64_t v108;
  unint64_t v109;
  double clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  double v111;
  long double v112;
  double v113;
  unint64_t v114;
  unint64_t v115;
  double clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  double v117;
  long double v118;
  double v119;
  unint64_t v120;
  unint64_t v121;
  double clickCountGivenLocationInLastWeekNormalizedAcrossItems;
  double v123;
  long double v124;
  double v125;
  unint64_t v126;
  unint64_t v127;
  double clickCountGivenLocationInLastMonthNormalizedAcrossItems;
  double v129;
  long double v130;
  double v131;
  unint64_t v132;
  unint64_t v133;
  double clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  double v135;
  long double v136;
  double v137;
  double v138;
  unint64_t v139;
  double clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  double v141;
  long double v142;
  double v143;
  double v144;
  unint64_t v145;
  unint64_t v146;
  double clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
  double v148;
  long double v149;
  double v150;
  double clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
  double v152;
  long double v153;
  double v154;
  double v155;
  double clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
  double v157;
  long double v158;
  double v159;
  double v160;
  double clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
  double v162;
  long double v163;
  double v164;
  double v165;
  double clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
  double v167;
  long double v168;
  double v169;
  double v170;
  double clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
  double v172;
  long double v173;
  double v174;
  double v175;
  double shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  double v177;
  long double v178;
  double v179;
  double v180;
  double shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  double v182;
  long double v183;
  double v184;
  double v185;
  double shareCountGivenLocationInLastWeekNormalizedAcrossItems;
  double v187;
  long double v188;
  double v189;
  double v190;
  double shareCountGivenLocationInLastMonthNormalizedAcrossItems;
  double v192;
  long double v193;
  double v194;
  double v195;
  double shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  double v197;
  long double v198;
  double v199;
  double v200;
  double shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  double v202;
  long double v203;
  double v204;
  double v205;
  double shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
  double v207;
  long double v208;
  double v209;
  double v210;
  double shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
  double v212;
  long double v213;
  double v214;
  double v215;
  double shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
  double v217;
  long double v218;
  double v219;
  double v220;
  unint64_t v221;
  double shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
  double v223;
  long double v224;
  double v225;
  double clipScore;
  double v227;
  long double v228;
  double v229;
  double v230;
  double l2ModelScore;
  double v232;
  long double v233;
  double v234;
  unint64_t v235;
  unint64_t v236;
  unint64_t v237;
  unint64_t v238;
  unint64_t v239;
  double isDuplicate;
  double v241;
  long double v242;
  double v243;
  unint64_t v244;
  unint64_t v245;
  unint64_t v246;
  unint64_t v247;
  unint64_t v248;
  unint64_t v249;
  unint64_t v250;
  unint64_t v251;
  unint64_t v252;
  unint64_t v253;
  unint64_t v254;
  unint64_t v255;
  unint64_t v256;
  unint64_t v257;
  unint64_t v258;
  unint64_t v259;
  unint64_t v260;
  unint64_t v261;
  double isCompleteMatch;
  double v263;
  long double v264;
  double v265;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  unint64_t v270;
  unint64_t v271;
  uint64_t v272;
  unint64_t v273;
  uint64_t v274;
  unint64_t v275;
  unint64_t v276;
  uint64_t v277;
  NSUInteger v278;
  unint64_t v279;
  unint64_t v280;
  unint64_t v281;
  unint64_t v282;
  unint64_t v283;
  unint64_t v284;
  unint64_t v285;
  unint64_t v286;
  unint64_t v287;
  unint64_t v288;
  unint64_t v289;
  unint64_t v290;
  unint64_t v291;
  unint64_t v292;
  unint64_t v293;
  unint64_t v294;
  unint64_t v295;
  unint64_t v296;
  unint64_t v297;
  unint64_t v298;
  unint64_t v299;
  unint64_t v300;
  unint64_t v301;
  unint64_t v302;
  unint64_t v303;
  unint64_t v304;
  unint64_t v305;
  unint64_t v306;
  unint64_t v307;
  unint64_t v308;
  unint64_t v309;
  unint64_t v310;

  v278 = -[NSString hash](self->_searchSessionUUID, "hash");
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    v277 = 2654435761 * self->_uiSurface;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v277 = 0;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
    goto LABEL_8;
LABEL_3:
  matchedPeopleRatio = self->_matchedPeopleRatio;
  v5 = -matchedPeopleRatio;
  if (matchedPeopleRatio >= 0.0)
    v5 = self->_matchedPeopleRatio;
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
LABEL_11:
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    matchedLocationRatio = self->_matchedLocationRatio;
    v11 = -matchedLocationRatio;
    if (matchedLocationRatio >= 0.0)
      v11 = self->_matchedLocationRatio;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    matchedSceneRatio = self->_matchedSceneRatio;
    v16 = -matchedSceneRatio;
    if (matchedSceneRatio >= 0.0)
      v16 = self->_matchedSceneRatio;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    matchedSceneConfidence = self->_matchedSceneConfidence;
    v21 = -matchedSceneConfidence;
    if (matchedSceneConfidence >= 0.0)
      v21 = self->_matchedSceneConfidence;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  v276 = v8;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    matchedSceneBoundingBox = self->_matchedSceneBoundingBox;
    v26 = -matchedSceneBoundingBox;
    if (matchedSceneBoundingBox >= 0.0)
      v26 = self->_matchedSceneBoundingBox;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    matchedOCRCharacterRatio = self->_matchedOCRCharacterRatio;
    v31 = -matchedOCRCharacterRatio;
    if (matchedOCRCharacterRatio >= 0.0)
      v31 = self->_matchedOCRCharacterRatio;
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
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    matchedOCRImportance = self->_matchedOCRImportance;
    v36 = -matchedOCRImportance;
    if (matchedOCRImportance >= 0.0)
      v36 = self->_matchedOCRImportance;
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
  if ((*(_QWORD *)&has & 0x800000000000) == 0)
  {
    v274 = 0;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_61;
LABEL_66:
    v310 = 0;
    goto LABEL_70;
  }
  v274 = 2654435761 * self->_matchedFieldsCount;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
    goto LABEL_66;
LABEL_61:
  l1Score = self->_l1Score;
  v40 = -l1Score;
  if (l1Score >= 0.0)
    v40 = self->_l1Score;
  v41 = floor(v40 + 0.5);
  v42 = (v40 - v41) * 1.84467441e19;
  v43 = 2654435761u * (unint64_t)fmod(v41, 1.84467441e19);
  if (v42 >= 0.0)
  {
    v310 = v43;
    if (v42 <= 0.0)
      goto LABEL_70;
    v44 = v43 + (unint64_t)v42;
  }
  else
  {
    v44 = v43 - (unint64_t)fabs(v42);
  }
  v310 = v44;
LABEL_70:
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    freshness = self->_freshness;
    v47 = -freshness;
    if (freshness >= 0.0)
      v47 = self->_freshness;
    v48 = floor(v47 + 0.5);
    v49 = (v47 - v48) * 1.84467441e19;
    v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0)
        v45 += (unint64_t)v49;
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    v45 = 0;
  }
  v273 = v45;
  if ((*(_QWORD *)&has & 0x4000000000000) == 0)
  {
    v272 = 0;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_80;
LABEL_85:
    v309 = 0;
    goto LABEL_89;
  }
  v272 = 2654435761 * self->_favorited;
  if ((*(_BYTE *)&has & 1) == 0)
    goto LABEL_85;
LABEL_80:
  aestheticScore = self->_aestheticScore;
  v51 = -aestheticScore;
  if (aestheticScore >= 0.0)
    v51 = self->_aestheticScore;
  v52 = floor(v51 + 0.5);
  v53 = (v51 - v52) * 1.84467441e19;
  v54 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
  if (v53 >= 0.0)
  {
    v309 = v54;
    if (v53 <= 0.0)
      goto LABEL_89;
    v55 = v54 + (unint64_t)v53;
  }
  else
  {
    v55 = v54 - (unint64_t)fabs(v53);
  }
  v309 = v55;
LABEL_89:
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    v308 = 0;
    goto LABEL_98;
  }
  curationScore = self->_curationScore;
  v57 = -curationScore;
  if (curationScore >= 0.0)
    v57 = self->_curationScore;
  v58 = floor(v57 + 0.5);
  v59 = (v57 - v58) * 1.84467441e19;
  v60 = 2654435761u * (unint64_t)fmod(v58, 1.84467441e19);
  if (v59 >= 0.0)
  {
    v308 = v60;
    if (v59 <= 0.0)
      goto LABEL_98;
    v61 = v60 + (unint64_t)v59;
  }
  else
  {
    v61 = v60 - (unint64_t)fabs(v59);
  }
  v308 = v61;
LABEL_98:
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    v307 = 0;
    goto LABEL_107;
  }
  hasEverClickInLastWeek = self->_hasEverClickInLastWeek;
  v63 = -hasEverClickInLastWeek;
  if (hasEverClickInLastWeek >= 0.0)
    v63 = self->_hasEverClickInLastWeek;
  v64 = floor(v63 + 0.5);
  v65 = (v63 - v64) * 1.84467441e19;
  v66 = 2654435761u * (unint64_t)fmod(v64, 1.84467441e19);
  if (v65 >= 0.0)
  {
    v307 = v66;
    if (v65 <= 0.0)
      goto LABEL_107;
    v67 = v66 + (unint64_t)v65;
  }
  else
  {
    v67 = v66 - (unint64_t)fabs(v65);
  }
  v307 = v67;
LABEL_107:
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
    v306 = 0;
    goto LABEL_116;
  }
  hasEverClickInLastMonth = self->_hasEverClickInLastMonth;
  v69 = -hasEverClickInLastMonth;
  if (hasEverClickInLastMonth >= 0.0)
    v69 = self->_hasEverClickInLastMonth;
  v70 = floor(v69 + 0.5);
  v71 = (v69 - v70) * 1.84467441e19;
  v72 = 2654435761u * (unint64_t)fmod(v70, 1.84467441e19);
  if (v71 >= 0.0)
  {
    v306 = v72;
    if (v71 <= 0.0)
      goto LABEL_116;
    v73 = v72 + (unint64_t)v71;
  }
  else
  {
    v73 = v72 - (unint64_t)fabs(v71);
  }
  v306 = v73;
LABEL_116:
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
    v305 = 0;
    goto LABEL_125;
  }
  hasEverShareInLastWeek = self->_hasEverShareInLastWeek;
  v75 = -hasEverShareInLastWeek;
  if (hasEverShareInLastWeek >= 0.0)
    v75 = self->_hasEverShareInLastWeek;
  v76 = floor(v75 + 0.5);
  v77 = (v75 - v76) * 1.84467441e19;
  v78 = 2654435761u * (unint64_t)fmod(v76, 1.84467441e19);
  if (v77 >= 0.0)
  {
    v305 = v78;
    if (v77 <= 0.0)
      goto LABEL_125;
    v79 = v78 + (unint64_t)v77;
  }
  else
  {
    v79 = v78 - (unint64_t)fabs(v77);
  }
  v305 = v79;
LABEL_125:
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    v304 = 0;
    goto LABEL_134;
  }
  hasEverShareInLastMonth = self->_hasEverShareInLastMonth;
  v81 = -hasEverShareInLastMonth;
  if (hasEverShareInLastMonth >= 0.0)
    v81 = self->_hasEverShareInLastMonth;
  v82 = floor(v81 + 0.5);
  v83 = (v81 - v82) * 1.84467441e19;
  v84 = 2654435761u * (unint64_t)fmod(v82, 1.84467441e19);
  if (v83 >= 0.0)
  {
    v304 = v84;
    if (v83 <= 0.0)
      goto LABEL_134;
    v85 = v84 + (unint64_t)v83;
  }
  else
  {
    v85 = v84 - (unint64_t)fabs(v83);
  }
  v304 = v85;
LABEL_134:
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
    v303 = 0;
    goto LABEL_143;
  }
  clickCountInLastWeekNormalizedAcrossItems = self->_clickCountInLastWeekNormalizedAcrossItems;
  v87 = -clickCountInLastWeekNormalizedAcrossItems;
  if (clickCountInLastWeekNormalizedAcrossItems >= 0.0)
    v87 = self->_clickCountInLastWeekNormalizedAcrossItems;
  v88 = floor(v87 + 0.5);
  v89 = (v87 - v88) * 1.84467441e19;
  v90 = 2654435761u * (unint64_t)fmod(v88, 1.84467441e19);
  if (v89 >= 0.0)
  {
    v303 = v90;
    if (v89 <= 0.0)
      goto LABEL_143;
    v91 = v90 + (unint64_t)v89;
  }
  else
  {
    v91 = v90 - (unint64_t)fabs(v89);
  }
  v303 = v91;
LABEL_143:
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
    v302 = 0;
    goto LABEL_152;
  }
  clickCountInLastMonthNormalizedAcrossItems = self->_clickCountInLastMonthNormalizedAcrossItems;
  v93 = -clickCountInLastMonthNormalizedAcrossItems;
  if (clickCountInLastMonthNormalizedAcrossItems >= 0.0)
    v93 = self->_clickCountInLastMonthNormalizedAcrossItems;
  v94 = floor(v93 + 0.5);
  v95 = (v93 - v94) * 1.84467441e19;
  v96 = 2654435761u * (unint64_t)fmod(v94, 1.84467441e19);
  if (v95 >= 0.0)
  {
    v302 = v96;
    if (v95 <= 0.0)
      goto LABEL_152;
    v97 = v96 + (unint64_t)v95;
  }
  else
  {
    v97 = v96 - (unint64_t)fabs(v95);
  }
  v302 = v97;
LABEL_152:
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
    v301 = 0;
    goto LABEL_161;
  }
  shareCountInLastWeekNormalizedAcrossItems = self->_shareCountInLastWeekNormalizedAcrossItems;
  v99 = -shareCountInLastWeekNormalizedAcrossItems;
  if (shareCountInLastWeekNormalizedAcrossItems >= 0.0)
    v99 = self->_shareCountInLastWeekNormalizedAcrossItems;
  v100 = floor(v99 + 0.5);
  v101 = (v99 - v100) * 1.84467441e19;
  v102 = 2654435761u * (unint64_t)fmod(v100, 1.84467441e19);
  if (v101 >= 0.0)
  {
    v301 = v102;
    if (v101 <= 0.0)
      goto LABEL_161;
    v103 = v102 + (unint64_t)v101;
  }
  else
  {
    v103 = v102 - (unint64_t)fabs(v101);
  }
  v301 = v103;
LABEL_161:
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
    v300 = 0;
    goto LABEL_170;
  }
  shareCountInLastMonthNormalizedAcrossItems = self->_shareCountInLastMonthNormalizedAcrossItems;
  v105 = -shareCountInLastMonthNormalizedAcrossItems;
  if (shareCountInLastMonthNormalizedAcrossItems >= 0.0)
    v105 = self->_shareCountInLastMonthNormalizedAcrossItems;
  v106 = floor(v105 + 0.5);
  v107 = (v105 - v106) * 1.84467441e19;
  v108 = 2654435761u * (unint64_t)fmod(v106, 1.84467441e19);
  if (v107 >= 0.0)
  {
    v300 = v108;
    if (v107 <= 0.0)
      goto LABEL_170;
    v109 = v108 + (unint64_t)v107;
  }
  else
  {
    v109 = v108 - (unint64_t)fabs(v107);
  }
  v300 = v109;
LABEL_170:
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
    v299 = 0;
    goto LABEL_179;
  }
  clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  v111 = -clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  if (clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems >= 0.0)
    v111 = self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  v112 = floor(v111 + 0.5);
  v113 = (v111 - v112) * 1.84467441e19;
  v114 = 2654435761u * (unint64_t)fmod(v112, 1.84467441e19);
  if (v113 >= 0.0)
  {
    v299 = v114;
    if (v113 <= 0.0)
      goto LABEL_179;
    v115 = v114 + (unint64_t)v113;
  }
  else
  {
    v115 = v114 - (unint64_t)fabs(v113);
  }
  v299 = v115;
LABEL_179:
  if ((*(_WORD *)&has & 0x800) == 0)
  {
    v298 = 0;
    goto LABEL_188;
  }
  clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  v117 = -clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  if (clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems >= 0.0)
    v117 = self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  v118 = floor(v117 + 0.5);
  v119 = (v117 - v118) * 1.84467441e19;
  v120 = 2654435761u * (unint64_t)fmod(v118, 1.84467441e19);
  if (v119 >= 0.0)
  {
    v298 = v120;
    if (v119 <= 0.0)
      goto LABEL_188;
    v121 = v120 + (unint64_t)v119;
  }
  else
  {
    v121 = v120 - (unint64_t)fabs(v119);
  }
  v298 = v121;
LABEL_188:
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
    v297 = 0;
    goto LABEL_197;
  }
  clickCountGivenLocationInLastWeekNormalizedAcrossItems = self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems;
  v123 = -clickCountGivenLocationInLastWeekNormalizedAcrossItems;
  if (clickCountGivenLocationInLastWeekNormalizedAcrossItems >= 0.0)
    v123 = self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems;
  v124 = floor(v123 + 0.5);
  v125 = (v123 - v124) * 1.84467441e19;
  v126 = 2654435761u * (unint64_t)fmod(v124, 1.84467441e19);
  if (v125 >= 0.0)
  {
    v297 = v126;
    if (v125 <= 0.0)
      goto LABEL_197;
    v127 = v126 + (unint64_t)v125;
  }
  else
  {
    v127 = v126 - (unint64_t)fabs(v125);
  }
  v297 = v127;
LABEL_197:
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
    v296 = 0;
    goto LABEL_206;
  }
  clickCountGivenLocationInLastMonthNormalizedAcrossItems = self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems;
  v129 = -clickCountGivenLocationInLastMonthNormalizedAcrossItems;
  if (clickCountGivenLocationInLastMonthNormalizedAcrossItems >= 0.0)
    v129 = self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems;
  v130 = floor(v129 + 0.5);
  v131 = (v129 - v130) * 1.84467441e19;
  v132 = 2654435761u * (unint64_t)fmod(v130, 1.84467441e19);
  if (v131 >= 0.0)
  {
    v296 = v132;
    if (v131 <= 0.0)
      goto LABEL_206;
    v133 = v132 + (unint64_t)v131;
  }
  else
  {
    v133 = v132 - (unint64_t)fabs(v131);
  }
  v296 = v133;
LABEL_206:
  if ((*(_BYTE *)&has & 4) == 0)
  {
    v295 = 0;
    goto LABEL_215;
  }
  clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  v135 = -clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  if (clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems >= 0.0)
    v135 = self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  v136 = floor(v135 + 0.5);
  v137 = (v135 - v136) * 1.84467441e19;
  v138 = fmod(v136, 1.84467441e19);
  if (v137 >= 0.0)
  {
    v295 = 2654435761u * (unint64_t)v138;
    if (v137 <= 0.0)
      goto LABEL_215;
    v139 = v295 + (unint64_t)v137;
  }
  else
  {
    v139 = 2654435761u * (unint64_t)v138 - (unint64_t)fabs(v137);
  }
  v295 = v139;
LABEL_215:
  if ((*(_BYTE *)&has & 2) == 0)
  {
    v294 = 0;
    goto LABEL_224;
  }
  clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  v141 = -clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  if (clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems >= 0.0)
    v141 = self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  v142 = floor(v141 + 0.5);
  v143 = (v141 - v142) * 1.84467441e19;
  v144 = fmod(v142, 1.84467441e19);
  if (v143 >= 0.0)
  {
    v294 = 2654435761u * (unint64_t)v144;
    if (v143 <= 0.0)
      goto LABEL_224;
    v145 = v294 + (unint64_t)v143;
  }
  else
  {
    v145 = 2654435761u * (unint64_t)v144 - (unint64_t)fabs(v143);
  }
  v294 = v145;
LABEL_224:
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
    v148 = -clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
    if (clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems >= 0.0)
      v148 = self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
    v149 = floor(v148 + 0.5);
    v150 = (v148 - v149) * 1.84467441e19;
    v146 = 2654435761u * (unint64_t)fmod(v149, 1.84467441e19);
    if (v150 >= 0.0)
    {
      if (v150 > 0.0)
        v146 += (unint64_t)v150;
    }
    else
    {
      v146 -= (unint64_t)fabs(v150);
    }
  }
  else
  {
    v146 = 0;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
    v152 = -clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
    if (clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems >= 0.0)
      v152 = self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
    v153 = floor(v152 + 0.5);
    v154 = (v152 - v153) * 1.84467441e19;
    v155 = fmod(v153, 1.84467441e19);
    if (v154 >= 0.0)
    {
      v293 = 2654435761u * (unint64_t)v155;
      if (v154 > 0.0)
        v293 += (unint64_t)v154;
    }
    else
    {
      v293 = 2654435761u * (unint64_t)v155 - (unint64_t)fabs(v154);
    }
  }
  else
  {
    v293 = 0;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
    v157 = -clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
    if (clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems >= 0.0)
      v157 = self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
    v158 = floor(v157 + 0.5);
    v159 = (v157 - v158) * 1.84467441e19;
    v160 = fmod(v158, 1.84467441e19);
    if (v159 >= 0.0)
    {
      v292 = 2654435761u * (unint64_t)v160;
      if (v159 > 0.0)
        v292 += (unint64_t)v159;
    }
    else
    {
      v292 = 2654435761u * (unint64_t)v160 - (unint64_t)fabs(v159);
    }
  }
  else
  {
    v292 = 0;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
    v162 = -clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
    if (clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems >= 0.0)
      v162 = self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
    v163 = floor(v162 + 0.5);
    v164 = (v162 - v163) * 1.84467441e19;
    v165 = fmod(v163, 1.84467441e19);
    if (v164 >= 0.0)
    {
      v291 = 2654435761u * (unint64_t)v165;
      if (v164 > 0.0)
        v291 += (unint64_t)v164;
    }
    else
    {
      v291 = 2654435761u * (unint64_t)v165 - (unint64_t)fabs(v164);
    }
  }
  else
  {
    v291 = 0;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
    v167 = -clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
    if (clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems >= 0.0)
      v167 = self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
    v168 = floor(v167 + 0.5);
    v169 = (v167 - v168) * 1.84467441e19;
    v170 = fmod(v168, 1.84467441e19);
    if (v169 >= 0.0)
    {
      v290 = 2654435761u * (unint64_t)v170;
      if (v169 > 0.0)
        v290 += (unint64_t)v169;
    }
    else
    {
      v290 = 2654435761u * (unint64_t)v170 - (unint64_t)fabs(v169);
    }
  }
  else
  {
    v290 = 0;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
    v172 = -clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
    if (clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems >= 0.0)
      v172 = self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
    v173 = floor(v172 + 0.5);
    v174 = (v172 - v173) * 1.84467441e19;
    v175 = fmod(v173, 1.84467441e19);
    if (v174 >= 0.0)
    {
      v289 = 2654435761u * (unint64_t)v175;
      if (v174 > 0.0)
        v289 += (unint64_t)v174;
    }
    else
    {
      v289 = 2654435761u * (unint64_t)v175 - (unint64_t)fabs(v174);
    }
  }
  else
  {
    v289 = 0;
  }
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
    v177 = -shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
    if (shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems >= 0.0)
      v177 = self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
    v178 = floor(v177 + 0.5);
    v179 = (v177 - v178) * 1.84467441e19;
    v180 = fmod(v178, 1.84467441e19);
    if (v179 >= 0.0)
    {
      v288 = 2654435761u * (unint64_t)v180;
      if (v179 > 0.0)
        v288 += (unint64_t)v179;
    }
    else
    {
      v288 = 2654435761u * (unint64_t)v180 - (unint64_t)fabs(v179);
    }
  }
  else
  {
    v288 = 0;
  }
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
    v182 = -shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
    if (shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems >= 0.0)
      v182 = self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
    v183 = floor(v182 + 0.5);
    v184 = (v182 - v183) * 1.84467441e19;
    v185 = fmod(v183, 1.84467441e19);
    if (v184 >= 0.0)
    {
      v287 = 2654435761u * (unint64_t)v185;
      if (v184 > 0.0)
        v287 += (unint64_t)v184;
    }
    else
    {
      v287 = 2654435761u * (unint64_t)v185 - (unint64_t)fabs(v184);
    }
  }
  else
  {
    v287 = 0;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    shareCountGivenLocationInLastWeekNormalizedAcrossItems = self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems;
    v187 = -shareCountGivenLocationInLastWeekNormalizedAcrossItems;
    if (shareCountGivenLocationInLastWeekNormalizedAcrossItems >= 0.0)
      v187 = self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems;
    v188 = floor(v187 + 0.5);
    v189 = (v187 - v188) * 1.84467441e19;
    v190 = fmod(v188, 1.84467441e19);
    if (v189 >= 0.0)
    {
      v286 = 2654435761u * (unint64_t)v190;
      if (v189 > 0.0)
        v286 += (unint64_t)v189;
    }
    else
    {
      v286 = 2654435761u * (unint64_t)v190 - (unint64_t)fabs(v189);
    }
  }
  else
  {
    v286 = 0;
  }
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
    shareCountGivenLocationInLastMonthNormalizedAcrossItems = self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems;
    v192 = -shareCountGivenLocationInLastMonthNormalizedAcrossItems;
    if (shareCountGivenLocationInLastMonthNormalizedAcrossItems >= 0.0)
      v192 = self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems;
    v193 = floor(v192 + 0.5);
    v194 = (v192 - v193) * 1.84467441e19;
    v195 = fmod(v193, 1.84467441e19);
    if (v194 >= 0.0)
    {
      v285 = 2654435761u * (unint64_t)v195;
      if (v194 > 0.0)
        v285 += (unint64_t)v194;
    }
    else
    {
      v285 = 2654435761u * (unint64_t)v195 - (unint64_t)fabs(v194);
    }
  }
  else
  {
    v285 = 0;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
    v197 = -shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
    if (shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems >= 0.0)
      v197 = self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
    v198 = floor(v197 + 0.5);
    v199 = (v197 - v198) * 1.84467441e19;
    v200 = fmod(v198, 1.84467441e19);
    if (v199 >= 0.0)
    {
      v284 = 2654435761u * (unint64_t)v200;
      if (v199 > 0.0)
        v284 += (unint64_t)v199;
    }
    else
    {
      v284 = 2654435761u * (unint64_t)v200 - (unint64_t)fabs(v199);
    }
  }
  else
  {
    v284 = 0;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
    v202 = -shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
    if (shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems >= 0.0)
      v202 = self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
    v203 = floor(v202 + 0.5);
    v204 = (v202 - v203) * 1.84467441e19;
    v205 = fmod(v203, 1.84467441e19);
    if (v204 >= 0.0)
    {
      v283 = 2654435761u * (unint64_t)v205;
      if (v204 > 0.0)
        v283 += (unint64_t)v204;
    }
    else
    {
      v283 = 2654435761u * (unint64_t)v205 - (unint64_t)fabs(v204);
    }
  }
  else
  {
    v283 = 0;
  }
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
    v207 = -shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
    if (shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems >= 0.0)
      v207 = self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
    v208 = floor(v207 + 0.5);
    v209 = (v207 - v208) * 1.84467441e19;
    v210 = fmod(v208, 1.84467441e19);
    if (v209 >= 0.0)
    {
      v282 = 2654435761u * (unint64_t)v210;
      if (v209 > 0.0)
        v282 += (unint64_t)v209;
    }
    else
    {
      v282 = 2654435761u * (unint64_t)v210 - (unint64_t)fabs(v209);
    }
  }
  else
  {
    v282 = 0;
  }
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
    shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
    v212 = -shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
    if (shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems >= 0.0)
      v212 = self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
    v213 = floor(v212 + 0.5);
    v214 = (v212 - v213) * 1.84467441e19;
    v215 = fmod(v213, 1.84467441e19);
    if (v214 >= 0.0)
    {
      v281 = 2654435761u * (unint64_t)v215;
      if (v214 > 0.0)
        v281 += (unint64_t)v214;
    }
    else
    {
      v281 = 2654435761u * (unint64_t)v215 - (unint64_t)fabs(v214);
    }
  }
  else
  {
    v281 = 0;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
    v217 = -shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
    if (shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems >= 0.0)
      v217 = self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
    v218 = floor(v217 + 0.5);
    v219 = (v217 - v218) * 1.84467441e19;
    v220 = fmod(v218, 1.84467441e19);
    if (v219 >= 0.0)
    {
      v280 = 2654435761u * (unint64_t)v220;
      if (v219 > 0.0)
        v280 += (unint64_t)v219;
    }
    else
    {
      v280 = 2654435761u * (unint64_t)v220 - (unint64_t)fabs(v219);
    }
  }
  else
  {
    v280 = 0;
  }
  v275 = v9;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
    v223 = -shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
    if (shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems >= 0.0)
      v223 = self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
    v224 = floor(v223 + 0.5);
    v225 = (v223 - v224) * 1.84467441e19;
    v221 = 2654435761u * (unint64_t)fmod(v224, 1.84467441e19);
    if (v225 >= 0.0)
    {
      if (v225 > 0.0)
        v221 += (unint64_t)v225;
    }
    else
    {
      v221 -= (unint64_t)fabs(v225);
    }
  }
  else
  {
    v221 = 0;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    clipScore = self->_clipScore;
    v227 = -clipScore;
    if (clipScore >= 0.0)
      v227 = self->_clipScore;
    v228 = floor(v227 + 0.5);
    v229 = (v227 - v228) * 1.84467441e19;
    v230 = fmod(v228, 1.84467441e19);
    if (v229 >= 0.0)
    {
      v279 = 2654435761u * (unint64_t)v230;
      if (v229 > 0.0)
        v279 += (unint64_t)v229;
    }
    else
    {
      v279 = 2654435761u * (unint64_t)v230 - (unint64_t)fabs(v229);
    }
  }
  else
  {
    v279 = 0;
  }
  if ((*(_QWORD *)&has & 0x2000000000000) != 0)
    v269 = 2654435761 * self->_clicked;
  else
    v269 = 0;
  v271 = v24;
  if ((*(_QWORD *)&has & 0x200000000000) != 0)
    v268 = 2654435761 * self->_clickOrder;
  else
    v268 = 0;
  v270 = v19;
  if ((*(_QWORD *)&has & 0x400000000000) != 0)
  {
    v267 = 2654435761 * self->_itemPosition;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_368;
LABEL_373:
    v236 = v221;
    v235 = 0;
    goto LABEL_376;
  }
  v267 = 0;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
    goto LABEL_373;
LABEL_368:
  l2ModelScore = self->_l2ModelScore;
  v232 = -l2ModelScore;
  if (l2ModelScore >= 0.0)
    v232 = self->_l2ModelScore;
  v233 = floor(v232 + 0.5);
  v234 = (v232 - v233) * 1.84467441e19;
  v235 = 2654435761u * (unint64_t)fmod(v233, 1.84467441e19);
  v236 = v221;
  if (v234 >= 0.0)
  {
    if (v234 > 0.0)
      v235 += (unint64_t)v234;
  }
  else
  {
    v235 -= (unint64_t)fabs(v234);
  }
LABEL_376:
  v237 = v34;
  v238 = v29;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    isDuplicate = self->_isDuplicate;
    v241 = -isDuplicate;
    if (isDuplicate >= 0.0)
      v241 = self->_isDuplicate;
    v242 = floor(v241 + 0.5);
    v243 = (v241 - v242) * 1.84467441e19;
    v239 = 2654435761u * (unint64_t)fmod(v242, 1.84467441e19);
    if (v243 >= 0.0)
    {
      if (v243 > 0.0)
        v239 += (unint64_t)v243;
    }
    else
    {
      v239 -= (unint64_t)fabs(v243);
    }
  }
  else
  {
    v239 = 0;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    isCompleteMatch = self->_isCompleteMatch;
    v263 = -isCompleteMatch;
    if (isCompleteMatch >= 0.0)
      v263 = self->_isCompleteMatch;
    v264 = floor(v263 + 0.5);
    v265 = (v263 - v264) * 1.84467441e19;
    v244 = 2654435761u * (unint64_t)fmod(v264, 1.84467441e19);
    if (v265 >= 0.0)
    {
      v246 = v309;
      v245 = v310;
      v248 = v307;
      v247 = v308;
      v250 = v305;
      v249 = v306;
      v252 = v303;
      v251 = v304;
      v254 = v301;
      v253 = v302;
      v256 = v299;
      v255 = v300;
      v258 = v297;
      v257 = v298;
      v259 = v296;
      v261 = v294;
      v260 = v295;
      if (v265 > 0.0)
        v244 += (unint64_t)v265;
    }
    else
    {
      v244 -= (unint64_t)fabs(v265);
      v246 = v309;
      v245 = v310;
      v248 = v307;
      v247 = v308;
      v250 = v305;
      v249 = v306;
      v252 = v303;
      v251 = v304;
      v254 = v301;
      v253 = v302;
      v256 = v299;
      v255 = v300;
      v258 = v297;
      v257 = v298;
      v259 = v296;
      v261 = v294;
      v260 = v295;
    }
  }
  else
  {
    v244 = 0;
    v246 = v309;
    v245 = v310;
    v248 = v307;
    v247 = v308;
    v250 = v305;
    v249 = v306;
    v252 = v303;
    v251 = v304;
    v254 = v301;
    v253 = v302;
    v256 = v299;
    v255 = v300;
    v258 = v297;
    v257 = v298;
    v259 = v296;
    v261 = v294;
    v260 = v295;
  }
  return v277 ^ v278 ^ v276 ^ v275 ^ v14 ^ v270 ^ v271 ^ v238 ^ v237 ^ v274 ^ v245 ^ v273 ^ v272 ^ v246 ^ v247 ^ v248 ^ v249 ^ v250 ^ v251 ^ v252 ^ v253 ^ v254 ^ v255 ^ v256 ^ v257 ^ v258 ^ v259 ^ v260 ^ v261 ^ v146 ^ v293 ^ v292 ^ v291 ^ v290 ^ v289 ^ v288 ^ v287 ^ v286 ^ v285 ^ v284 ^ v283 ^ v282 ^ v281 ^ v280 ^ v236 ^ v279 ^ v269 ^ v268 ^ v267 ^ v235 ^ v239 ^ v244;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 48))
  {
    v6 = v4;
    -[AMLPhotosSearchLabeledData setSearchSessionUUID:](self, "setSearchSessionUUID:");
    v4 = v6;
  }
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x1000000000000) != 0)
  {
    self->_uiSurface = *((_DWORD *)v4 + 98);
    *(_QWORD *)&self->_has |= 0x1000000000000uLL;
    v5 = *((_QWORD *)v4 + 50);
    if ((v5 & 0x20000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x4000000) == 0)
        goto LABEL_6;
      goto LABEL_58;
    }
  }
  else if ((v5 & 0x20000000) == 0)
  {
    goto LABEL_5;
  }
  self->_matchedPeopleRatio = *((double *)v4 + 30);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_7;
    goto LABEL_59;
  }
LABEL_58:
  self->_matchedLocationRatio = *((double *)v4 + 27);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_8;
    goto LABEL_60;
  }
LABEL_59:
  self->_matchedSceneRatio = *((double *)v4 + 33);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_9;
    goto LABEL_61;
  }
LABEL_60:
  self->_matchedSceneConfidence = *((double *)v4 + 32);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_10;
    goto LABEL_62;
  }
LABEL_61:
  self->_matchedSceneBoundingBox = *((double *)v4 + 31);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_11;
    goto LABEL_63;
  }
LABEL_62:
  self->_matchedOCRCharacterRatio = *((double *)v4 + 28);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x800000000000) == 0)
      goto LABEL_12;
    goto LABEL_64;
  }
LABEL_63:
  self->_matchedOCRImportance = *((double *)v4 + 29);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x800000000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_13;
    goto LABEL_65;
  }
LABEL_64:
  self->_matchedFieldsCount = *((_DWORD *)v4 + 94);
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_66;
  }
LABEL_65:
  self->_l1Score = *((double *)v4 + 25);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x20000) == 0)
  {
LABEL_14:
    if ((v5 & 0x4000000000000) == 0)
      goto LABEL_15;
    goto LABEL_67;
  }
LABEL_66:
  self->_freshness = *((double *)v4 + 18);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x4000000000000) == 0)
  {
LABEL_15:
    if ((v5 & 1) == 0)
      goto LABEL_16;
    goto LABEL_68;
  }
LABEL_67:
  self->_favorited = *((_BYTE *)v4 + 397);
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 1) == 0)
  {
LABEL_16:
    if ((v5 & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_69;
  }
LABEL_68:
  self->_aestheticScore = *((double *)v4 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x10000) == 0)
  {
LABEL_17:
    if ((v5 & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_70;
  }
LABEL_69:
  self->_curationScore = *((double *)v4 + 17);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x80000) == 0)
  {
LABEL_18:
    if ((v5 & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_71;
  }
LABEL_70:
  self->_hasEverClickInLastWeek = *((double *)v4 + 20);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x40000) == 0)
  {
LABEL_19:
    if ((v5 & 0x200000) == 0)
      goto LABEL_20;
    goto LABEL_72;
  }
LABEL_71:
  self->_hasEverClickInLastMonth = *((double *)v4 + 19);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x200000) == 0)
  {
LABEL_20:
    if ((v5 & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_73;
  }
LABEL_72:
  self->_hasEverShareInLastWeek = *((double *)v4 + 22);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x100000) == 0)
  {
LABEL_21:
    if ((v5 & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_74;
  }
LABEL_73:
  self->_hasEverShareInLastMonth = *((double *)v4 + 21);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x4000) == 0)
  {
LABEL_22:
    if ((v5 & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_75;
  }
LABEL_74:
  self->_clickCountInLastWeekNormalizedAcrossItems = *((double *)v4 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x2000) == 0)
  {
LABEL_23:
    if ((v5 & 0x100000000000) == 0)
      goto LABEL_24;
    goto LABEL_76;
  }
LABEL_75:
  self->_clickCountInLastMonthNormalizedAcrossItems = *((double *)v4 + 14);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x100000000000) == 0)
  {
LABEL_24:
    if ((v5 & 0x80000000000) == 0)
      goto LABEL_25;
    goto LABEL_77;
  }
LABEL_76:
  self->_shareCountInLastWeekNormalizedAcrossItems = *((double *)v4 + 45);
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x80000000000) == 0)
  {
LABEL_25:
    if ((v5 & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_78;
  }
LABEL_77:
  self->_shareCountInLastMonthNormalizedAcrossItems = *((double *)v4 + 44);
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x1000) == 0)
  {
LABEL_26:
    if ((v5 & 0x800) == 0)
      goto LABEL_27;
    goto LABEL_79;
  }
LABEL_78:
  self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = *((double *)v4 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x800) == 0)
  {
LABEL_27:
    if ((v5 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_80;
  }
LABEL_79:
  self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = *((double *)v4 + 12);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x40) == 0)
  {
LABEL_28:
    if ((v5 & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_81;
  }
LABEL_80:
  self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems = *((double *)v4 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x20) == 0)
  {
LABEL_29:
    if ((v5 & 4) == 0)
      goto LABEL_30;
    goto LABEL_82;
  }
LABEL_81:
  self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems = *((double *)v4 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 4) == 0)
  {
LABEL_30:
    if ((v5 & 2) == 0)
      goto LABEL_31;
    goto LABEL_83;
  }
LABEL_82:
  self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 2) == 0)
  {
LABEL_31:
    if ((v5 & 0x100) == 0)
      goto LABEL_32;
    goto LABEL_84;
  }
LABEL_83:
  self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x100) == 0)
  {
LABEL_32:
    if ((v5 & 0x80) == 0)
      goto LABEL_33;
    goto LABEL_85;
  }
LABEL_84:
  self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x80) == 0)
  {
LABEL_33:
    if ((v5 & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_86;
  }
LABEL_85:
  self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x400) == 0)
  {
LABEL_34:
    if ((v5 & 0x200) == 0)
      goto LABEL_35;
    goto LABEL_87;
  }
LABEL_86:
  self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x200) == 0)
  {
LABEL_35:
    if ((v5 & 0x10) == 0)
      goto LABEL_36;
    goto LABEL_88;
  }
LABEL_87:
  self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x10) == 0)
  {
LABEL_36:
    if ((v5 & 8) == 0)
      goto LABEL_37;
    goto LABEL_89;
  }
LABEL_88:
  self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 8) == 0)
  {
LABEL_37:
    if ((v5 & 0x40000000000) == 0)
      goto LABEL_38;
    goto LABEL_90;
  }
LABEL_89:
  self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x20000000000) == 0)
      goto LABEL_39;
    goto LABEL_91;
  }
LABEL_90:
  self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = *((double *)v4 + 43);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x4000000000) == 0)
      goto LABEL_40;
    goto LABEL_92;
  }
LABEL_91:
  self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = *((double *)v4 + 42);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_40:
    if ((v5 & 0x2000000000) == 0)
      goto LABEL_41;
    goto LABEL_93;
  }
LABEL_92:
  self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems = *((double *)v4 + 39);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_42;
    goto LABEL_94;
  }
LABEL_93:
  self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems = *((double *)v4 + 38);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_42:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_94:
  self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 35);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_43:
    if ((v5 & 0x10000000000) == 0)
      goto LABEL_44;
    goto LABEL_96;
  }
LABEL_95:
  self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 34);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_44:
    if ((v5 & 0x8000000000) == 0)
      goto LABEL_45;
    goto LABEL_97;
  }
LABEL_96:
  self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 41);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_45:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_46;
    goto LABEL_98;
  }
LABEL_97:
  self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 40);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_46:
    if ((v5 & 0x800000000) == 0)
      goto LABEL_47;
    goto LABEL_99;
  }
LABEL_98:
  self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 37);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_47:
    if ((v5 & 0x8000) == 0)
      goto LABEL_48;
    goto LABEL_100;
  }
LABEL_99:
  self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 36);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x8000) == 0)
  {
LABEL_48:
    if ((v5 & 0x2000000000000) == 0)
      goto LABEL_49;
    goto LABEL_101;
  }
LABEL_100:
  self->_clipScore = *((double *)v4 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x2000000000000) == 0)
  {
LABEL_49:
    if ((v5 & 0x200000000000) == 0)
      goto LABEL_50;
    goto LABEL_102;
  }
LABEL_101:
  self->_clicked = *((_BYTE *)v4 + 396);
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x200000000000) == 0)
  {
LABEL_50:
    if ((v5 & 0x400000000000) == 0)
      goto LABEL_51;
    goto LABEL_103;
  }
LABEL_102:
  self->_clickOrder = *((_DWORD *)v4 + 92);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x400000000000) == 0)
  {
LABEL_51:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_52;
    goto LABEL_104;
  }
LABEL_103:
  self->_itemPosition = *((_DWORD *)v4 + 93);
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_52:
    if ((v5 & 0x800000) == 0)
      goto LABEL_53;
LABEL_105:
    self->_isDuplicate = *((double *)v4 + 24);
    *(_QWORD *)&self->_has |= 0x800000uLL;
    if ((*((_QWORD *)v4 + 50) & 0x400000) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_104:
  self->_l2ModelScore = *((double *)v4 + 26);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v5 = *((_QWORD *)v4 + 50);
  if ((v5 & 0x800000) != 0)
    goto LABEL_105;
LABEL_53:
  if ((v5 & 0x400000) != 0)
  {
LABEL_54:
    self->_isCompleteMatch = *((double *)v4 + 23);
    *(_QWORD *)&self->_has |= 0x400000uLL;
  }
LABEL_55:

}

- (NSString)searchSessionUUID
{
  return self->_searchSessionUUID;
}

- (void)setSearchSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_searchSessionUUID, a3);
}

- (double)matchedPeopleRatio
{
  return self->_matchedPeopleRatio;
}

- (double)matchedLocationRatio
{
  return self->_matchedLocationRatio;
}

- (double)matchedSceneRatio
{
  return self->_matchedSceneRatio;
}

- (double)matchedSceneConfidence
{
  return self->_matchedSceneConfidence;
}

- (double)matchedSceneBoundingBox
{
  return self->_matchedSceneBoundingBox;
}

- (double)matchedOCRCharacterRatio
{
  return self->_matchedOCRCharacterRatio;
}

- (double)matchedOCRImportance
{
  return self->_matchedOCRImportance;
}

- (unsigned)matchedFieldsCount
{
  return self->_matchedFieldsCount;
}

- (double)l1Score
{
  return self->_l1Score;
}

- (double)freshness
{
  return self->_freshness;
}

- (BOOL)favorited
{
  return self->_favorited;
}

- (double)aestheticScore
{
  return self->_aestheticScore;
}

- (double)curationScore
{
  return self->_curationScore;
}

- (double)hasEverClickInLastWeek
{
  return self->_hasEverClickInLastWeek;
}

- (double)hasEverClickInLastMonth
{
  return self->_hasEverClickInLastMonth;
}

- (double)hasEverShareInLastWeek
{
  return self->_hasEverShareInLastWeek;
}

- (double)hasEverShareInLastMonth
{
  return self->_hasEverShareInLastMonth;
}

- (double)clickCountInLastWeekNormalizedAcrossItems
{
  return self->_clickCountInLastWeekNormalizedAcrossItems;
}

- (double)clickCountInLastMonthNormalizedAcrossItems
{
  return self->_clickCountInLastMonthNormalizedAcrossItems;
}

- (double)shareCountInLastWeekNormalizedAcrossItems
{
  return self->_shareCountInLastWeekNormalizedAcrossItems;
}

- (double)shareCountInLastMonthNormalizedAcrossItems
{
  return self->_shareCountInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
}

- (double)clipScore
{
  return self->_clipScore;
}

- (BOOL)clicked
{
  return self->_clicked;
}

- (unsigned)clickOrder
{
  return self->_clickOrder;
}

- (unsigned)itemPosition
{
  return self->_itemPosition;
}

- (double)l2ModelScore
{
  return self->_l2ModelScore;
}

- (double)isDuplicate
{
  return self->_isDuplicate;
}

- (double)isCompleteMatch
{
  return self->_isCompleteMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSessionUUID, 0);
}

@end
