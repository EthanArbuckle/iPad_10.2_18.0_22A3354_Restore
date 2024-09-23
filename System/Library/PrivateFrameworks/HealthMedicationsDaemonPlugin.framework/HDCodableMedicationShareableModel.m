@implementation HDCodableMedicationShareableModel

- (BOOL)hasConceptIdentifier
{
  return self->_conceptIdentifier != 0;
}

- (BOOL)hasAudienceRawValue
{
  return self->_audienceRawValue != 0;
}

- (BOOL)hasBaseUnitStrength
{
  return self->_baseUnitStrength != 0;
}

- (void)clearIngredientComponentStrings
{
  -[NSMutableArray removeAllObjects](self->_ingredientComponentStrings, "removeAllObjects");
}

- (void)addIngredientComponentStrings:(id)a3
{
  id v4;
  NSMutableArray *ingredientComponentStrings;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ingredientComponentStrings = self->_ingredientComponentStrings;
  v8 = v4;
  if (!ingredientComponentStrings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_ingredientComponentStrings;
    self->_ingredientComponentStrings = v6;

    v4 = v8;
    ingredientComponentStrings = self->_ingredientComponentStrings;
  }
  -[NSMutableArray addObject:](ingredientComponentStrings, "addObject:", v4);

}

- (unint64_t)ingredientComponentStringsCount
{
  return -[NSMutableArray count](self->_ingredientComponentStrings, "count");
}

- (id)ingredientComponentStringsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ingredientComponentStrings, "objectAtIndex:", a3);
}

+ (Class)ingredientComponentStringsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasOntologyLoggingUnitSingular
{
  return self->_ontologyLoggingUnitSingular != 0;
}

- (BOOL)hasOntologyLoggingUnitPlural
{
  return self->_ontologyLoggingUnitPlural != 0;
}

- (BOOL)hasEduContentString
{
  return self->_eduContentString != 0;
}

- (BOOL)hasSideEffectsContentString
{
  return self->_sideEffectsContentString != 0;
}

- (BOOL)hasMedicationVisualizationConfigJSONString
{
  return self->_medicationVisualizationConfigJSONString != 0;
}

- (void)setFreeTextMedicationForm:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_freeTextMedicationForm = a3;
}

- (void)setHasFreeTextMedicationForm:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFreeTextMedicationForm
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFreeTextMedicationLoggingUnit:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_freeTextMedicationLoggingUnit = a3;
}

- (void)setHasFreeTextMedicationLoggingUnit:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFreeTextMedicationLoggingUnit
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSchedule
{
  return self->_schedule != 0;
}

- (BOOL)hasMostRecentDose
{
  return self->_mostRecentDose != 0;
}

- (void)clearMonthHighlights
{
  -[NSMutableArray removeAllObjects](self->_monthHighlights, "removeAllObjects");
}

- (void)addMonthHighlights:(id)a3
{
  id v4;
  NSMutableArray *monthHighlights;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  monthHighlights = self->_monthHighlights;
  v8 = v4;
  if (!monthHighlights)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_monthHighlights;
    self->_monthHighlights = v6;

    v4 = v8;
    monthHighlights = self->_monthHighlights;
  }
  -[NSMutableArray addObject:](monthHighlights, "addObject:", v4);

}

- (unint64_t)monthHighlightsCount
{
  return -[NSMutableArray count](self->_monthHighlights, "count");
}

- (id)monthHighlightsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_monthHighlights, "objectAtIndex:", a3);
}

+ (Class)monthHighlightsType
{
  return (Class)objc_opt_class();
}

- (void)setArchived:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_archived = a3;
}

- (void)setHasArchived:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasArchived
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_latestSupportedVersion = a3;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLatestSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_minimumSupportedVersion = a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasChartSeries
{
  return self->_chartSeries != 0;
}

- (BOOL)hasPreferredName
{
  return self->_preferredName != 0;
}

- (BOOL)hasBrandName
{
  return self->_brandName != 0;
}

- (BOOL)hasGenericName
{
  return self->_genericName != 0;
}

- (BOOL)hasManufacturedDoseForm
{
  return self->_manufacturedDoseForm != 0;
}

- (BOOL)hasBasicDoseForm
{
  return self->_basicDoseForm != 0;
}

- (BOOL)hasFreeTextMedicationName
{
  return self->_freeTextMedicationName != 0;
}

- (BOOL)hasFreeTextMedicationStrengthQuantity
{
  return self->_freeTextMedicationStrengthQuantity != 0;
}

- (BOOL)hasPregnancyDescriptionContentString
{
  return self->_pregnancyDescriptionContentString != 0;
}

- (BOOL)hasLactationDescriptionContentString
{
  return self->_lactationDescriptionContentString != 0;
}

- (void)setIsPregnancyDescriptionCritical:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isPregnancyDescriptionCritical = a3;
}

- (void)setHasIsPregnancyDescriptionCritical:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsPregnancyDescriptionCritical
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIsLactationDescriptionCritical:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isLactationDescriptionCritical = a3;
}

- (void)setHasIsLactationDescriptionCritical:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsLactationDescriptionCritical
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMedicationShareableModel;
  -[HDCodableMedicationShareableModel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationShareableModel dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *conceptIdentifier;
  NSString *audienceRawValue;
  NSString *baseUnitStrength;
  NSMutableArray *ingredientComponentStrings;
  NSString *ontologyLoggingUnitSingular;
  NSString *ontologyLoggingUnitPlural;
  NSString *eduContentString;
  NSString *sideEffectsContentString;
  NSString *medicationVisualizationConfigJSONString;
  char has;
  void *v15;
  void *v16;
  HDCodableMedicationSchedule *schedule;
  void *v18;
  HDCodableMedicationDoseEvent *mostRecentDose;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  char v28;
  void *v29;
  HDCodableMedicationChartSeries *chartSeries;
  void *v31;
  NSString *preferredName;
  NSString *brandName;
  NSString *genericName;
  NSString *manufacturedDoseForm;
  NSString *basicDoseForm;
  NSString *freeTextMedicationName;
  HDCodableQuantity *freeTextMedicationStrengthQuantity;
  void *v39;
  NSString *pregnancyDescriptionContentString;
  NSString *lactationDescriptionContentString;
  char v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  conceptIdentifier = self->_conceptIdentifier;
  if (conceptIdentifier)
    objc_msgSend(v3, "setObject:forKey:", conceptIdentifier, CFSTR("conceptIdentifier"));
  audienceRawValue = self->_audienceRawValue;
  if (audienceRawValue)
    objc_msgSend(v4, "setObject:forKey:", audienceRawValue, CFSTR("audienceRawValue"));
  baseUnitStrength = self->_baseUnitStrength;
  if (baseUnitStrength)
    objc_msgSend(v4, "setObject:forKey:", baseUnitStrength, CFSTR("baseUnitStrength"));
  ingredientComponentStrings = self->_ingredientComponentStrings;
  if (ingredientComponentStrings)
    objc_msgSend(v4, "setObject:forKey:", ingredientComponentStrings, CFSTR("ingredientComponentStrings"));
  ontologyLoggingUnitSingular = self->_ontologyLoggingUnitSingular;
  if (ontologyLoggingUnitSingular)
    objc_msgSend(v4, "setObject:forKey:", ontologyLoggingUnitSingular, CFSTR("ontologyLoggingUnitSingular"));
  ontologyLoggingUnitPlural = self->_ontologyLoggingUnitPlural;
  if (ontologyLoggingUnitPlural)
    objc_msgSend(v4, "setObject:forKey:", ontologyLoggingUnitPlural, CFSTR("ontologyLoggingUnitPlural"));
  eduContentString = self->_eduContentString;
  if (eduContentString)
    objc_msgSend(v4, "setObject:forKey:", eduContentString, CFSTR("eduContentString"));
  sideEffectsContentString = self->_sideEffectsContentString;
  if (sideEffectsContentString)
    objc_msgSend(v4, "setObject:forKey:", sideEffectsContentString, CFSTR("sideEffectsContentString"));
  medicationVisualizationConfigJSONString = self->_medicationVisualizationConfigJSONString;
  if (medicationVisualizationConfigJSONString)
    objc_msgSend(v4, "setObject:forKey:", medicationVisualizationConfigJSONString, CFSTR("medicationVisualizationConfigJSONString"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_freeTextMedicationForm);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("freeTextMedicationForm"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_freeTextMedicationLoggingUnit);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("freeTextMedicationLoggingUnit"));

  }
  schedule = self->_schedule;
  if (schedule)
  {
    -[HDCodableMedicationSchedule dictionaryRepresentation](schedule, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("schedule"));

  }
  mostRecentDose = self->_mostRecentDose;
  if (mostRecentDose)
  {
    -[HDCodableMedicationDoseEvent dictionaryRepresentation](mostRecentDose, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("mostRecentDose"));

  }
  if (-[NSMutableArray count](self->_monthHighlights, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_monthHighlights, "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v22 = self->_monthHighlights;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v49 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v48);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v24);
    }

    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("monthHighlights"));
  }
  v28 = (char)self->_has;
  if ((v28 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_archived);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("archived"));

    v28 = (char)self->_has;
    if ((v28 & 4) == 0)
    {
LABEL_38:
      if ((v28 & 8) == 0)
        goto LABEL_40;
      goto LABEL_39;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_latestSupportedVersion, (_QWORD)v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("latestSupportedVersion"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minimumSupportedVersion, (_QWORD)v48);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("minimumSupportedVersion"));

  }
LABEL_40:
  chartSeries = self->_chartSeries;
  if (chartSeries)
  {
    -[HDCodableMedicationChartSeries dictionaryRepresentation](chartSeries, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("chartSeries"));

  }
  preferredName = self->_preferredName;
  if (preferredName)
    objc_msgSend(v4, "setObject:forKey:", preferredName, CFSTR("preferredName"));
  brandName = self->_brandName;
  if (brandName)
    objc_msgSend(v4, "setObject:forKey:", brandName, CFSTR("brandName"));
  genericName = self->_genericName;
  if (genericName)
    objc_msgSend(v4, "setObject:forKey:", genericName, CFSTR("genericName"));
  manufacturedDoseForm = self->_manufacturedDoseForm;
  if (manufacturedDoseForm)
    objc_msgSend(v4, "setObject:forKey:", manufacturedDoseForm, CFSTR("manufacturedDoseForm"));
  basicDoseForm = self->_basicDoseForm;
  if (basicDoseForm)
    objc_msgSend(v4, "setObject:forKey:", basicDoseForm, CFSTR("basicDoseForm"));
  freeTextMedicationName = self->_freeTextMedicationName;
  if (freeTextMedicationName)
    objc_msgSend(v4, "setObject:forKey:", freeTextMedicationName, CFSTR("freeTextMedicationName"));
  freeTextMedicationStrengthQuantity = self->_freeTextMedicationStrengthQuantity;
  if (freeTextMedicationStrengthQuantity)
  {
    -[HDCodableQuantity dictionaryRepresentation](freeTextMedicationStrengthQuantity, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("freeTextMedicationStrengthQuantity"));

  }
  pregnancyDescriptionContentString = self->_pregnancyDescriptionContentString;
  if (pregnancyDescriptionContentString)
    objc_msgSend(v4, "setObject:forKey:", pregnancyDescriptionContentString, CFSTR("pregnancyDescriptionContentString"));
  lactationDescriptionContentString = self->_lactationDescriptionContentString;
  if (lactationDescriptionContentString)
    objc_msgSend(v4, "setObject:forKey:", lactationDescriptionContentString, CFSTR("lactationDescriptionContentString"));
  v42 = (char)self->_has;
  if ((v42 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPregnancyDescriptionCritical);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("isPregnancyDescriptionCritical"));

    v42 = (char)self->_has;
  }
  if ((v42 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLactationDescriptionCritical);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("isLactationDescriptionCritical"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicationShareableModelReadFrom((uint64_t)self, (uint64_t)a3);
}

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
  char has;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_conceptIdentifier)
    PBDataWriterWriteStringField();
  if (self->_audienceRawValue)
    PBDataWriterWriteStringField();
  if (self->_baseUnitStrength)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_ingredientComponentStrings;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  if (self->_ontologyLoggingUnitSingular)
    PBDataWriterWriteStringField();
  if (self->_ontologyLoggingUnitPlural)
    PBDataWriterWriteStringField();
  if (self->_eduContentString)
    PBDataWriterWriteStringField();
  if (self->_sideEffectsContentString)
    PBDataWriterWriteStringField();
  if (self->_medicationVisualizationConfigJSONString)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_schedule)
    PBDataWriterWriteSubmessage();
  if (self->_mostRecentDose)
    PBDataWriterWriteSubmessage();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_monthHighlights;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_39:
      if ((has & 8) == 0)
        goto LABEL_41;
      goto LABEL_40;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_39;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_40:
    PBDataWriterWriteInt64Field();
LABEL_41:
  if (self->_chartSeries)
    PBDataWriterWriteSubmessage();
  if (self->_preferredName)
    PBDataWriterWriteStringField();
  if (self->_brandName)
    PBDataWriterWriteStringField();
  if (self->_genericName)
    PBDataWriterWriteStringField();
  if (self->_manufacturedDoseForm)
    PBDataWriterWriteStringField();
  if (self->_basicDoseForm)
    PBDataWriterWriteStringField();
  if (self->_freeTextMedicationName)
    PBDataWriterWriteStringField();
  if (self->_freeTextMedicationStrengthQuantity)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_pregnancyDescriptionContentString)
    PBDataWriterWriteStringField();
  if (self->_lactationDescriptionContentString)
    PBDataWriterWriteStringField();
  v16 = (char)self->_has;
  if ((v16 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v16 = (char)self->_has;
  }
  if ((v16 & 0x20) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  char has;
  _QWORD *v14;
  char v15;
  id v16;

  v16 = a3;
  if (self->_conceptIdentifier)
    objc_msgSend(v16, "setConceptIdentifier:");
  if (self->_audienceRawValue)
    objc_msgSend(v16, "setAudienceRawValue:");
  if (self->_baseUnitStrength)
    objc_msgSend(v16, "setBaseUnitStrength:");
  if (-[HDCodableMedicationShareableModel ingredientComponentStringsCount](self, "ingredientComponentStringsCount"))
  {
    objc_msgSend(v16, "clearIngredientComponentStrings");
    v4 = -[HDCodableMedicationShareableModel ingredientComponentStringsCount](self, "ingredientComponentStringsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCodableMedicationShareableModel ingredientComponentStringsAtIndex:](self, "ingredientComponentStringsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addIngredientComponentStrings:", v7);

      }
    }
  }
  if (self->_ontologyLoggingUnitSingular)
    objc_msgSend(v16, "setOntologyLoggingUnitSingular:");
  v8 = v16;
  if (self->_ontologyLoggingUnitPlural)
  {
    objc_msgSend(v16, "setOntologyLoggingUnitPlural:");
    v8 = v16;
  }
  if (self->_eduContentString)
  {
    objc_msgSend(v16, "setEduContentString:");
    v8 = v16;
  }
  if (self->_sideEffectsContentString)
  {
    objc_msgSend(v16, "setSideEffectsContentString:");
    v8 = v16;
  }
  if (self->_medicationVisualizationConfigJSONString)
  {
    objc_msgSend(v16, "setMedicationVisualizationConfigJSONString:");
    v8 = v16;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8[1] = self->_freeTextMedicationForm;
    *((_BYTE *)v8 + 220) |= 1u;
  }
  if (self->_schedule)
    objc_msgSend(v16, "setSchedule:");
  if (self->_mostRecentDose)
    objc_msgSend(v16, "setMostRecentDose:");
  if (-[HDCodableMedicationShareableModel monthHighlightsCount](self, "monthHighlightsCount"))
  {
    objc_msgSend(v16, "clearMonthHighlights");
    v9 = -[HDCodableMedicationShareableModel monthHighlightsCount](self, "monthHighlightsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[HDCodableMedicationShareableModel monthHighlightsAtIndex:](self, "monthHighlightsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addMonthHighlights:", v12);

      }
    }
  }
  has = (char)self->_has;
  v14 = v16;
  if ((has & 0x10) != 0)
  {
    *((_BYTE *)v16 + 216) = self->_archived;
    *((_BYTE *)v16 + 220) |= 0x10u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_33:
      if ((has & 8) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_33;
  }
  *((_QWORD *)v16 + 3) = self->_latestSupportedVersion;
  *((_BYTE *)v16 + 220) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_34:
    *((_QWORD *)v16 + 4) = self->_minimumSupportedVersion;
    *((_BYTE *)v16 + 220) |= 8u;
  }
LABEL_35:
  if (self->_chartSeries)
  {
    objc_msgSend(v16, "setChartSeries:");
    v14 = v16;
  }
  if (self->_preferredName)
  {
    objc_msgSend(v16, "setPreferredName:");
    v14 = v16;
  }
  if (self->_brandName)
  {
    objc_msgSend(v16, "setBrandName:");
    v14 = v16;
  }
  if (self->_genericName)
  {
    objc_msgSend(v16, "setGenericName:");
    v14 = v16;
  }
  if (self->_manufacturedDoseForm)
  {
    objc_msgSend(v16, "setManufacturedDoseForm:");
    v14 = v16;
  }
  if (self->_basicDoseForm)
  {
    objc_msgSend(v16, "setBasicDoseForm:");
    v14 = v16;
  }
  if (self->_freeTextMedicationName)
  {
    objc_msgSend(v16, "setFreeTextMedicationName:");
    v14 = v16;
  }
  if (self->_freeTextMedicationStrengthQuantity)
  {
    objc_msgSend(v16, "setFreeTextMedicationStrengthQuantity:");
    v14 = v16;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v14[2] = self->_freeTextMedicationLoggingUnit;
    *((_BYTE *)v14 + 220) |= 2u;
  }
  if (self->_pregnancyDescriptionContentString)
  {
    objc_msgSend(v16, "setPregnancyDescriptionContentString:");
    v14 = v16;
  }
  if (self->_lactationDescriptionContentString)
  {
    objc_msgSend(v16, "setLactationDescriptionContentString:");
    v14 = v16;
  }
  v15 = (char)self->_has;
  if ((v15 & 0x40) != 0)
  {
    *((_BYTE *)v14 + 218) = self->_isPregnancyDescriptionCritical;
    *((_BYTE *)v14 + 220) |= 0x40u;
    v15 = (char)self->_has;
  }
  if ((v15 & 0x20) != 0)
  {
    *((_BYTE *)v14 + 217) = self->_isLactationDescriptionCritical;
    *((_BYTE *)v14 + 220) |= 0x20u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
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
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  char has;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  char v59;
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

  v71 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_conceptIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  v8 = -[NSString copyWithZone:](self->_audienceRawValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_baseUnitStrength, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v12 = self->_ingredientComponentStrings;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v66 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIngredientComponentStrings:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v14);
  }

  v18 = -[NSString copyWithZone:](self->_ontologyLoggingUnitSingular, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v18;

  v20 = -[NSString copyWithZone:](self->_ontologyLoggingUnitPlural, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v20;

  v22 = -[NSString copyWithZone:](self->_eduContentString, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v22;

  v24 = -[NSString copyWithZone:](self->_sideEffectsContentString, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v24;

  v26 = -[NSString copyWithZone:](self->_medicationVisualizationConfigJSONString, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v26;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_freeTextMedicationForm;
    *(_BYTE *)(v5 + 220) |= 1u;
  }
  v28 = -[HDCodableMedicationSchedule copyWithZone:](self->_schedule, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v28;

  v30 = -[HDCodableMedicationDoseEvent copyWithZone:](self->_mostRecentDose, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v30;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v32 = self->_monthHighlights;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v62 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v61);
        objc_msgSend((id)v5, "addMonthHighlights:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v34);
  }

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 216) = self->_archived;
    *(_BYTE *)(v5 + 220) |= 0x10u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_19:
      if ((has & 8) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_19;
  }
  *(_QWORD *)(v5 + 24) = self->_latestSupportedVersion;
  *(_BYTE *)(v5 + 220) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_20:
    *(_QWORD *)(v5 + 32) = self->_minimumSupportedVersion;
    *(_BYTE *)(v5 + 220) |= 8u;
  }
LABEL_21:
  v39 = -[HDCodableMedicationChartSeries copyWithZone:](self->_chartSeries, "copyWithZone:", a3, (_QWORD)v61);
  v40 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v39;

  v41 = -[NSString copyWithZone:](self->_preferredName, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v41;

  v43 = -[NSString copyWithZone:](self->_brandName, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v43;

  v45 = -[NSString copyWithZone:](self->_genericName, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v45;

  v47 = -[NSString copyWithZone:](self->_manufacturedDoseForm, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v47;

  v49 = -[NSString copyWithZone:](self->_basicDoseForm, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v49;

  v51 = -[NSString copyWithZone:](self->_freeTextMedicationName, "copyWithZone:", a3);
  v52 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v51;

  v53 = -[HDCodableQuantity copyWithZone:](self->_freeTextMedicationStrengthQuantity, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v53;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_freeTextMedicationLoggingUnit;
    *(_BYTE *)(v5 + 220) |= 2u;
  }
  v55 = -[NSString copyWithZone:](self->_pregnancyDescriptionContentString, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v55;

  v57 = -[NSString copyWithZone:](self->_lactationDescriptionContentString, "copyWithZone:", a3);
  v58 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v57;

  v59 = (char)self->_has;
  if ((v59 & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 218) = self->_isPregnancyDescriptionCritical;
    *(_BYTE *)(v5 + 220) |= 0x40u;
    v59 = (char)self->_has;
  }
  if ((v59 & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 217) = self->_isLactationDescriptionCritical;
    *(_BYTE *)(v5 + 220) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *conceptIdentifier;
  NSString *audienceRawValue;
  NSString *baseUnitStrength;
  NSMutableArray *ingredientComponentStrings;
  NSString *ontologyLoggingUnitSingular;
  NSString *ontologyLoggingUnitPlural;
  NSString *eduContentString;
  NSString *sideEffectsContentString;
  NSString *medicationVisualizationConfigJSONString;
  HDCodableMedicationSchedule *schedule;
  HDCodableMedicationDoseEvent *mostRecentDose;
  NSMutableArray *monthHighlights;
  HDCodableMedicationChartSeries *chartSeries;
  NSString *preferredName;
  NSString *brandName;
  NSString *genericName;
  NSString *manufacturedDoseForm;
  NSString *basicDoseForm;
  NSString *freeTextMedicationName;
  HDCodableQuantity *freeTextMedicationStrengthQuantity;
  NSString *pregnancyDescriptionContentString;
  NSString *lactationDescriptionContentString;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_85;
  conceptIdentifier = self->_conceptIdentifier;
  if ((unint64_t)conceptIdentifier | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](conceptIdentifier, "isEqual:"))
      goto LABEL_85;
  }
  audienceRawValue = self->_audienceRawValue;
  if ((unint64_t)audienceRawValue | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](audienceRawValue, "isEqual:"))
      goto LABEL_85;
  }
  baseUnitStrength = self->_baseUnitStrength;
  if ((unint64_t)baseUnitStrength | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](baseUnitStrength, "isEqual:"))
      goto LABEL_85;
  }
  ingredientComponentStrings = self->_ingredientComponentStrings;
  if ((unint64_t)ingredientComponentStrings | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](ingredientComponentStrings, "isEqual:"))
      goto LABEL_85;
  }
  ontologyLoggingUnitSingular = self->_ontologyLoggingUnitSingular;
  if ((unint64_t)ontologyLoggingUnitSingular | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](ontologyLoggingUnitSingular, "isEqual:"))
      goto LABEL_85;
  }
  ontologyLoggingUnitPlural = self->_ontologyLoggingUnitPlural;
  if ((unint64_t)ontologyLoggingUnitPlural | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](ontologyLoggingUnitPlural, "isEqual:"))
      goto LABEL_85;
  }
  eduContentString = self->_eduContentString;
  if ((unint64_t)eduContentString | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](eduContentString, "isEqual:"))
      goto LABEL_85;
  }
  sideEffectsContentString = self->_sideEffectsContentString;
  if ((unint64_t)sideEffectsContentString | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](sideEffectsContentString, "isEqual:"))
      goto LABEL_85;
  }
  medicationVisualizationConfigJSONString = self->_medicationVisualizationConfigJSONString;
  if ((unint64_t)medicationVisualizationConfigJSONString | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](medicationVisualizationConfigJSONString, "isEqual:"))
      goto LABEL_85;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 220) & 1) == 0 || self->_freeTextMedicationForm != *((_QWORD *)v4 + 1))
      goto LABEL_85;
  }
  else if ((*((_BYTE *)v4 + 220) & 1) != 0)
  {
    goto LABEL_85;
  }
  schedule = self->_schedule;
  if ((unint64_t)schedule | *((_QWORD *)v4 + 25)
    && !-[HDCodableMedicationSchedule isEqual:](schedule, "isEqual:"))
  {
    goto LABEL_85;
  }
  mostRecentDose = self->_mostRecentDose;
  if ((unint64_t)mostRecentDose | *((_QWORD *)v4 + 20))
  {
    if (!-[HDCodableMedicationDoseEvent isEqual:](mostRecentDose, "isEqual:"))
      goto LABEL_85;
  }
  monthHighlights = self->_monthHighlights;
  if ((unint64_t)monthHighlights | *((_QWORD *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](monthHighlights, "isEqual:"))
      goto LABEL_85;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 220) & 0x10) == 0)
      goto LABEL_85;
    if (self->_archived)
    {
      if (!*((_BYTE *)v4 + 216))
        goto LABEL_85;
    }
    else if (*((_BYTE *)v4 + 216))
    {
      goto LABEL_85;
    }
  }
  else if ((*((_BYTE *)v4 + 220) & 0x10) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 220) & 4) == 0 || self->_latestSupportedVersion != *((_QWORD *)v4 + 3))
      goto LABEL_85;
  }
  else if ((*((_BYTE *)v4 + 220) & 4) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 220) & 8) == 0 || self->_minimumSupportedVersion != *((_QWORD *)v4 + 4))
      goto LABEL_85;
  }
  else if ((*((_BYTE *)v4 + 220) & 8) != 0)
  {
    goto LABEL_85;
  }
  chartSeries = self->_chartSeries;
  if ((unint64_t)chartSeries | *((_QWORD *)v4 + 9)
    && !-[HDCodableMedicationChartSeries isEqual:](chartSeries, "isEqual:"))
  {
    goto LABEL_85;
  }
  preferredName = self->_preferredName;
  if ((unint64_t)preferredName | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](preferredName, "isEqual:"))
      goto LABEL_85;
  }
  brandName = self->_brandName;
  if ((unint64_t)brandName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](brandName, "isEqual:"))
      goto LABEL_85;
  }
  genericName = self->_genericName;
  if ((unint64_t)genericName | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](genericName, "isEqual:"))
      goto LABEL_85;
  }
  manufacturedDoseForm = self->_manufacturedDoseForm;
  if ((unint64_t)manufacturedDoseForm | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](manufacturedDoseForm, "isEqual:"))
      goto LABEL_85;
  }
  basicDoseForm = self->_basicDoseForm;
  if ((unint64_t)basicDoseForm | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](basicDoseForm, "isEqual:"))
      goto LABEL_85;
  }
  freeTextMedicationName = self->_freeTextMedicationName;
  if ((unint64_t)freeTextMedicationName | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](freeTextMedicationName, "isEqual:"))
      goto LABEL_85;
  }
  freeTextMedicationStrengthQuantity = self->_freeTextMedicationStrengthQuantity;
  if ((unint64_t)freeTextMedicationStrengthQuantity | *((_QWORD *)v4 + 13))
  {
    if (!-[HDCodableQuantity isEqual:](freeTextMedicationStrengthQuantity, "isEqual:"))
      goto LABEL_85;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 220) & 2) == 0 || self->_freeTextMedicationLoggingUnit != *((_QWORD *)v4 + 2))
      goto LABEL_85;
  }
  else if ((*((_BYTE *)v4 + 220) & 2) != 0)
  {
    goto LABEL_85;
  }
  pregnancyDescriptionContentString = self->_pregnancyDescriptionContentString;
  if ((unint64_t)pregnancyDescriptionContentString | *((_QWORD *)v4 + 24)
    && !-[NSString isEqual:](pregnancyDescriptionContentString, "isEqual:"))
  {
    goto LABEL_85;
  }
  lactationDescriptionContentString = self->_lactationDescriptionContentString;
  if ((unint64_t)lactationDescriptionContentString | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](lactationDescriptionContentString, "isEqual:"))
      goto LABEL_85;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 220) & 0x40) == 0)
      goto LABEL_85;
    if (self->_isPregnancyDescriptionCritical)
    {
      if (!*((_BYTE *)v4 + 218))
        goto LABEL_85;
    }
    else if (*((_BYTE *)v4 + 218))
    {
      goto LABEL_85;
    }
  }
  else if ((*((_BYTE *)v4 + 220) & 0x40) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 220) & 0x20) != 0)
    {
      if (self->_isLactationDescriptionCritical)
      {
        if (!*((_BYTE *)v4 + 217))
          goto LABEL_85;
      }
      else if (*((_BYTE *)v4 + 217))
      {
        goto LABEL_85;
      }
      v27 = 1;
      goto LABEL_86;
    }
LABEL_85:
    v27 = 0;
    goto LABEL_86;
  }
  v27 = (*((_BYTE *)v4 + 220) & 0x20) == 0;
LABEL_86:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v14;
  NSUInteger v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  uint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;

  v32 = -[NSString hash](self->_conceptIdentifier, "hash");
  v31 = -[NSString hash](self->_audienceRawValue, "hash");
  v30 = -[NSString hash](self->_baseUnitStrength, "hash");
  v29 = -[NSMutableArray hash](self->_ingredientComponentStrings, "hash");
  v28 = -[NSString hash](self->_ontologyLoggingUnitSingular, "hash");
  v27 = -[NSString hash](self->_ontologyLoggingUnitPlural, "hash");
  v26 = -[NSString hash](self->_eduContentString, "hash");
  v25 = -[NSString hash](self->_sideEffectsContentString, "hash");
  v24 = -[NSString hash](self->_medicationVisualizationConfigJSONString, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v23 = 2654435761 * self->_freeTextMedicationForm;
  else
    v23 = 0;
  v22 = -[HDCodableMedicationSchedule hash](self->_schedule, "hash");
  v21 = -[HDCodableMedicationDoseEvent hash](self->_mostRecentDose, "hash");
  v20 = -[NSMutableArray hash](self->_monthHighlights, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    v19 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v18 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v19 = 2654435761 * self->_archived;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v18 = 2654435761 * self->_latestSupportedVersion;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v17 = 2654435761 * self->_minimumSupportedVersion;
    goto LABEL_11;
  }
LABEL_10:
  v17 = 0;
LABEL_11:
  v16 = -[HDCodableMedicationChartSeries hash](self->_chartSeries, "hash");
  v15 = -[NSString hash](self->_preferredName, "hash");
  v14 = -[NSString hash](self->_brandName, "hash");
  v3 = -[NSString hash](self->_genericName, "hash");
  v4 = -[NSString hash](self->_manufacturedDoseForm, "hash");
  v5 = -[NSString hash](self->_basicDoseForm, "hash");
  v6 = -[NSString hash](self->_freeTextMedicationName, "hash");
  v7 = -[HDCodableQuantity hash](self->_freeTextMedicationStrengthQuantity, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_freeTextMedicationLoggingUnit;
  else
    v8 = 0;
  v9 = -[NSString hash](self->_pregnancyDescriptionContentString, "hash");
  v10 = -[NSString hash](self->_lactationDescriptionContentString, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v11 = 2654435761 * self->_isPregnancyDescriptionCritical;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_16;
LABEL_18:
    v12 = 0;
    return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_18;
LABEL_16:
  v12 = 2654435761 * self->_isLactationDescriptionCritical;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  HDCodableMedicationSchedule *schedule;
  uint64_t v11;
  HDCodableMedicationDoseEvent *mostRecentDose;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  char v19;
  HDCodableMedicationChartSeries *chartSeries;
  uint64_t v21;
  HDCodableQuantity *freeTextMedicationStrengthQuantity;
  uint64_t v23;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 10))
    -[HDCodableMedicationShareableModel setConceptIdentifier:](self, "setConceptIdentifier:");
  if (*((_QWORD *)v4 + 5))
    -[HDCodableMedicationShareableModel setAudienceRawValue:](self, "setAudienceRawValue:");
  if (*((_QWORD *)v4 + 6))
    -[HDCodableMedicationShareableModel setBaseUnitStrength:](self, "setBaseUnitStrength:");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = *((id *)v4 + 15);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        -[HDCodableMedicationShareableModel addIngredientComponentStrings:](self, "addIngredientComponentStrings:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 22))
    -[HDCodableMedicationShareableModel setOntologyLoggingUnitSingular:](self, "setOntologyLoggingUnitSingular:");
  if (*((_QWORD *)v4 + 21))
    -[HDCodableMedicationShareableModel setOntologyLoggingUnitPlural:](self, "setOntologyLoggingUnitPlural:");
  if (*((_QWORD *)v4 + 11))
    -[HDCodableMedicationShareableModel setEduContentString:](self, "setEduContentString:");
  if (*((_QWORD *)v4 + 26))
    -[HDCodableMedicationShareableModel setSideEffectsContentString:](self, "setSideEffectsContentString:");
  if (*((_QWORD *)v4 + 18))
    -[HDCodableMedicationShareableModel setMedicationVisualizationConfigJSONString:](self, "setMedicationVisualizationConfigJSONString:");
  if ((*((_BYTE *)v4 + 220) & 1) != 0)
  {
    self->_freeTextMedicationForm = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  schedule = self->_schedule;
  v11 = *((_QWORD *)v4 + 25);
  if (schedule)
  {
    if (v11)
      -[HDCodableMedicationSchedule mergeFrom:](schedule, "mergeFrom:");
  }
  else if (v11)
  {
    -[HDCodableMedicationShareableModel setSchedule:](self, "setSchedule:");
  }
  mostRecentDose = self->_mostRecentDose;
  v13 = *((_QWORD *)v4 + 20);
  if (mostRecentDose)
  {
    if (v13)
      -[HDCodableMedicationDoseEvent mergeFrom:](mostRecentDose, "mergeFrom:");
  }
  else if (v13)
  {
    -[HDCodableMedicationShareableModel setMostRecentDose:](self, "setMostRecentDose:");
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = *((id *)v4 + 19);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        -[HDCodableMedicationShareableModel addMonthHighlights:](self, "addMonthHighlights:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), (_QWORD)v25);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v16);
  }

  v19 = *((_BYTE *)v4 + 220);
  if ((v19 & 0x10) != 0)
  {
    self->_archived = *((_BYTE *)v4 + 216);
    *(_BYTE *)&self->_has |= 0x10u;
    v19 = *((_BYTE *)v4 + 220);
    if ((v19 & 4) == 0)
    {
LABEL_45:
      if ((v19 & 8) == 0)
        goto LABEL_47;
      goto LABEL_46;
    }
  }
  else if ((*((_BYTE *)v4 + 220) & 4) == 0)
  {
    goto LABEL_45;
  }
  self->_latestSupportedVersion = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 220) & 8) != 0)
  {
LABEL_46:
    self->_minimumSupportedVersion = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_47:
  chartSeries = self->_chartSeries;
  v21 = *((_QWORD *)v4 + 9);
  if (chartSeries)
  {
    if (v21)
      -[HDCodableMedicationChartSeries mergeFrom:](chartSeries, "mergeFrom:");
  }
  else if (v21)
  {
    -[HDCodableMedicationShareableModel setChartSeries:](self, "setChartSeries:");
  }
  if (*((_QWORD *)v4 + 23))
    -[HDCodableMedicationShareableModel setPreferredName:](self, "setPreferredName:");
  if (*((_QWORD *)v4 + 8))
    -[HDCodableMedicationShareableModel setBrandName:](self, "setBrandName:");
  if (*((_QWORD *)v4 + 14))
    -[HDCodableMedicationShareableModel setGenericName:](self, "setGenericName:");
  if (*((_QWORD *)v4 + 17))
    -[HDCodableMedicationShareableModel setManufacturedDoseForm:](self, "setManufacturedDoseForm:");
  if (*((_QWORD *)v4 + 7))
    -[HDCodableMedicationShareableModel setBasicDoseForm:](self, "setBasicDoseForm:");
  if (*((_QWORD *)v4 + 12))
    -[HDCodableMedicationShareableModel setFreeTextMedicationName:](self, "setFreeTextMedicationName:");
  freeTextMedicationStrengthQuantity = self->_freeTextMedicationStrengthQuantity;
  v23 = *((_QWORD *)v4 + 13);
  if (freeTextMedicationStrengthQuantity)
  {
    if (v23)
      -[HDCodableQuantity mergeFrom:](freeTextMedicationStrengthQuantity, "mergeFrom:");
  }
  else if (v23)
  {
    -[HDCodableMedicationShareableModel setFreeTextMedicationStrengthQuantity:](self, "setFreeTextMedicationStrengthQuantity:");
  }
  if ((*((_BYTE *)v4 + 220) & 2) != 0)
  {
    self->_freeTextMedicationLoggingUnit = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 24))
    -[HDCodableMedicationShareableModel setPregnancyDescriptionContentString:](self, "setPregnancyDescriptionContentString:");
  if (*((_QWORD *)v4 + 16))
    -[HDCodableMedicationShareableModel setLactationDescriptionContentString:](self, "setLactationDescriptionContentString:");
  v24 = *((_BYTE *)v4 + 220);
  if ((v24 & 0x40) != 0)
  {
    self->_isPregnancyDescriptionCritical = *((_BYTE *)v4 + 218);
    *(_BYTE *)&self->_has |= 0x40u;
    v24 = *((_BYTE *)v4 + 220);
  }
  if ((v24 & 0x20) != 0)
  {
    self->_isLactationDescriptionCritical = *((_BYTE *)v4 + 217);
    *(_BYTE *)&self->_has |= 0x20u;
  }

}

- (NSString)conceptIdentifier
{
  return self->_conceptIdentifier;
}

- (void)setConceptIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_conceptIdentifier, a3);
}

- (NSString)audienceRawValue
{
  return self->_audienceRawValue;
}

- (void)setAudienceRawValue:(id)a3
{
  objc_storeStrong((id *)&self->_audienceRawValue, a3);
}

- (NSString)baseUnitStrength
{
  return self->_baseUnitStrength;
}

- (void)setBaseUnitStrength:(id)a3
{
  objc_storeStrong((id *)&self->_baseUnitStrength, a3);
}

- (NSMutableArray)ingredientComponentStrings
{
  return self->_ingredientComponentStrings;
}

- (void)setIngredientComponentStrings:(id)a3
{
  objc_storeStrong((id *)&self->_ingredientComponentStrings, a3);
}

- (NSString)ontologyLoggingUnitSingular
{
  return self->_ontologyLoggingUnitSingular;
}

- (void)setOntologyLoggingUnitSingular:(id)a3
{
  objc_storeStrong((id *)&self->_ontologyLoggingUnitSingular, a3);
}

- (NSString)ontologyLoggingUnitPlural
{
  return self->_ontologyLoggingUnitPlural;
}

- (void)setOntologyLoggingUnitPlural:(id)a3
{
  objc_storeStrong((id *)&self->_ontologyLoggingUnitPlural, a3);
}

- (NSString)eduContentString
{
  return self->_eduContentString;
}

- (void)setEduContentString:(id)a3
{
  objc_storeStrong((id *)&self->_eduContentString, a3);
}

- (NSString)sideEffectsContentString
{
  return self->_sideEffectsContentString;
}

- (void)setSideEffectsContentString:(id)a3
{
  objc_storeStrong((id *)&self->_sideEffectsContentString, a3);
}

- (NSString)medicationVisualizationConfigJSONString
{
  return self->_medicationVisualizationConfigJSONString;
}

- (void)setMedicationVisualizationConfigJSONString:(id)a3
{
  objc_storeStrong((id *)&self->_medicationVisualizationConfigJSONString, a3);
}

- (int64_t)freeTextMedicationForm
{
  return self->_freeTextMedicationForm;
}

- (int64_t)freeTextMedicationLoggingUnit
{
  return self->_freeTextMedicationLoggingUnit;
}

- (HDCodableMedicationSchedule)schedule
{
  return self->_schedule;
}

- (void)setSchedule:(id)a3
{
  objc_storeStrong((id *)&self->_schedule, a3);
}

- (HDCodableMedicationDoseEvent)mostRecentDose
{
  return self->_mostRecentDose;
}

- (void)setMostRecentDose:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentDose, a3);
}

- (NSMutableArray)monthHighlights
{
  return self->_monthHighlights;
}

- (void)setMonthHighlights:(id)a3
{
  objc_storeStrong((id *)&self->_monthHighlights, a3);
}

- (BOOL)archived
{
  return self->_archived;
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (HDCodableMedicationChartSeries)chartSeries
{
  return self->_chartSeries;
}

- (void)setChartSeries:(id)a3
{
  objc_storeStrong((id *)&self->_chartSeries, a3);
}

- (NSString)preferredName
{
  return self->_preferredName;
}

- (void)setPreferredName:(id)a3
{
  objc_storeStrong((id *)&self->_preferredName, a3);
}

- (NSString)brandName
{
  return self->_brandName;
}

- (void)setBrandName:(id)a3
{
  objc_storeStrong((id *)&self->_brandName, a3);
}

- (NSString)genericName
{
  return self->_genericName;
}

- (void)setGenericName:(id)a3
{
  objc_storeStrong((id *)&self->_genericName, a3);
}

- (NSString)manufacturedDoseForm
{
  return self->_manufacturedDoseForm;
}

- (void)setManufacturedDoseForm:(id)a3
{
  objc_storeStrong((id *)&self->_manufacturedDoseForm, a3);
}

- (NSString)basicDoseForm
{
  return self->_basicDoseForm;
}

- (void)setBasicDoseForm:(id)a3
{
  objc_storeStrong((id *)&self->_basicDoseForm, a3);
}

- (NSString)freeTextMedicationName
{
  return self->_freeTextMedicationName;
}

- (void)setFreeTextMedicationName:(id)a3
{
  objc_storeStrong((id *)&self->_freeTextMedicationName, a3);
}

- (HDCodableQuantity)freeTextMedicationStrengthQuantity
{
  return self->_freeTextMedicationStrengthQuantity;
}

- (void)setFreeTextMedicationStrengthQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_freeTextMedicationStrengthQuantity, a3);
}

- (NSString)pregnancyDescriptionContentString
{
  return self->_pregnancyDescriptionContentString;
}

- (void)setPregnancyDescriptionContentString:(id)a3
{
  objc_storeStrong((id *)&self->_pregnancyDescriptionContentString, a3);
}

- (NSString)lactationDescriptionContentString
{
  return self->_lactationDescriptionContentString;
}

- (void)setLactationDescriptionContentString:(id)a3
{
  objc_storeStrong((id *)&self->_lactationDescriptionContentString, a3);
}

- (BOOL)isPregnancyDescriptionCritical
{
  return self->_isPregnancyDescriptionCritical;
}

- (BOOL)isLactationDescriptionCritical
{
  return self->_isLactationDescriptionCritical;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sideEffectsContentString, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_pregnancyDescriptionContentString, 0);
  objc_storeStrong((id *)&self->_preferredName, 0);
  objc_storeStrong((id *)&self->_ontologyLoggingUnitSingular, 0);
  objc_storeStrong((id *)&self->_ontologyLoggingUnitPlural, 0);
  objc_storeStrong((id *)&self->_mostRecentDose, 0);
  objc_storeStrong((id *)&self->_monthHighlights, 0);
  objc_storeStrong((id *)&self->_medicationVisualizationConfigJSONString, 0);
  objc_storeStrong((id *)&self->_manufacturedDoseForm, 0);
  objc_storeStrong((id *)&self->_lactationDescriptionContentString, 0);
  objc_storeStrong((id *)&self->_ingredientComponentStrings, 0);
  objc_storeStrong((id *)&self->_genericName, 0);
  objc_storeStrong((id *)&self->_freeTextMedicationStrengthQuantity, 0);
  objc_storeStrong((id *)&self->_freeTextMedicationName, 0);
  objc_storeStrong((id *)&self->_eduContentString, 0);
  objc_storeStrong((id *)&self->_conceptIdentifier, 0);
  objc_storeStrong((id *)&self->_chartSeries, 0);
  objc_storeStrong((id *)&self->_brandName, 0);
  objc_storeStrong((id *)&self->_basicDoseForm, 0);
  objc_storeStrong((id *)&self->_baseUnitStrength, 0);
  objc_storeStrong((id *)&self->_audienceRawValue, 0);
}

@end
