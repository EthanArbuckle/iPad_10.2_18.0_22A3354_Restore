@implementation _INPBQueryHealthSampleIntent

- (void)setExpectedResultType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_expectedResultType = a3;
  }
}

- (BOOL)hasExpectedResultType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExpectedResultType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)expectedResultTypeAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E228AAB8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsExpectedResultType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_RESULT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAW")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AVERAGE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MINIMUM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAXIMUM")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUM")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIRST")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAST")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ABOVE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BELOW")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setObjectType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_objectType = a3;
  }
}

- (BOOL)hasObjectType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasObjectType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)objectTypeAsString:(int)a3
{
  if (a3 < 0x4B)
    return off_1E228AB08[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsObjectType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BASAL_BODY_TEMPERATURE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BIOTIN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLOOD_ALCOHOL_CONTENT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLOOD_GLUCOSE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLOOD_PRESSURE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLOOD_PRESSURE_DIASTOLIC")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLOOD_PRESSURE_SYSTOLIC")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLOOD_TYPE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BODY_FAT_PERCENTAGE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BODY_MASS_INDEX")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BODY_TEMPERATURE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAFFEINE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CALCIUM")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARBOHYDRATES")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHLORIDE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHROMIUM")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COPPER")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIETARY_CHOLESTEROL")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIETARY_SUGAR")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ELECTRODERMAL_ACTIVITY")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENERGY_CONSUMED")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAT_MONOUN_SATURATED")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAT_POLYUN_SATURATED")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAT_SATURATED")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAT_TOTAL")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIBER")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOLATE")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FORCED_EXPIRATORY_VOLUME")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FORCED_VITAL_CAPACITY")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEART_RATE")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEART_RATE_VARIABILITY_SDNN")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEIGHT")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INHALER_USAGE")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INSULIN_DELIVERY")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IODINE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IRON")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEAN_BODY_MASS")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAGNESIUM")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MANGANESE")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOLYBDENUM")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NIACIN")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NUMBER_OF_TIMES_FALLEN")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OXYGEN_SATURATION")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PANTOTHENIC_ACID")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PEAK_EXPIRATORY_FLOW_RATE")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERIPHERAL_PERFUSION_INDEX")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOSPHORUS")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POTASSIUM")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROTEIN")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESPIRATORY_RATE")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTINGHEART_RATE")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIBOFLAVIN")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SELENIUM")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SODIUM")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THIAMIN")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UV_INDEX")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VITAMIN_A")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VITAMIN_B12")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VITAMIN_B6")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VITAMIN_C")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VITAMIN_D")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VITAMIN_E")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VITAMIN_K")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAIST_CIRCUMFERENCE")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_HEART_RATE_AVERAGE")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATER")) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEIGHT")) & 1) != 0)
  {
    v4 = 67;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ZINC")) & 1) != 0)
  {
    v4 = 68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CERVICAL_MUCUS_QUALITY")) & 1) != 0)
  {
    v4 = 69;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OVULATION_TEST_RESULT")) & 1) != 0)
  {
    v4 = 70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MENSTRUAL_FLOW")) & 1) != 0)
  {
    v4 = 71;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERMENSTRUAL_BLEEDING")) & 1) != 0)
  {
    v4 = 72;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEXUAL_ACTIVITY")) & 1) != 0)
  {
    v4 = 73;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MINDFUL_SESSION")))
  {
    v4 = 74;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setQuestionType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_questionType = a3;
  }
}

- (BOOL)hasQuestionType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasQuestionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)questionTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_1E228AD60[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsQuestionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_QUESTION_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERIFICATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUANTIFICATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEMPORAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPARISON")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUALITY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPEED_RATE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSTANCE_COUNT")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRecordDates:(id)a3
{
  NSArray *v4;
  NSArray *recordDates;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  recordDates = self->_recordDates;
  self->_recordDates = v4;

}

- (void)clearRecordDates
{
  -[NSArray removeAllObjects](self->_recordDates, "removeAllObjects");
}

- (void)addRecordDate:(id)a3
{
  id v4;
  NSArray *recordDates;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  recordDates = self->_recordDates;
  v8 = v4;
  if (!recordDates)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_recordDates;
    self->_recordDates = v6;

    v4 = v8;
    recordDates = self->_recordDates;
  }
  -[NSArray addObject:](recordDates, "addObject:", v4);

}

- (unint64_t)recordDatesCount
{
  return -[NSArray count](self->_recordDates, "count");
}

- (id)recordDateAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_recordDates, "objectAtIndexedSubscript:", a3);
}

- (void)setThresholdValues:(id)a3
{
  NSArray *v4;
  NSArray *thresholdValues;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  thresholdValues = self->_thresholdValues;
  self->_thresholdValues = v4;

}

- (void)clearThresholdValues
{
  -[NSArray removeAllObjects](self->_thresholdValues, "removeAllObjects");
}

- (void)addThresholdValues:(id)a3
{
  id v4;
  NSArray *thresholdValues;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  thresholdValues = self->_thresholdValues;
  v8 = v4;
  if (!thresholdValues)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_thresholdValues;
    self->_thresholdValues = v6;

    v4 = v8;
    thresholdValues = self->_thresholdValues;
  }
  -[NSArray addObject:](thresholdValues, "addObject:", v4);

}

- (unint64_t)thresholdValuesCount
{
  return -[NSArray count](self->_thresholdValues, "count");
}

- (id)thresholdValuesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_thresholdValues, "objectAtIndexedSubscript:", a3);
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (BOOL)hasUnit
{
  return self->_unit != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBQueryHealthSampleIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBQueryHealthSampleIntent hasExpectedResultType](self, "hasExpectedResultType"))
    PBDataWriterWriteInt32Field();
  -[_INPBQueryHealthSampleIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBQueryHealthSampleIntent intentMetadata](self, "intentMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBQueryHealthSampleIntent hasObjectType](self, "hasObjectType"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBQueryHealthSampleIntent hasQuestionType](self, "hasQuestionType"))
    PBDataWriterWriteInt32Field();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_recordDates;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_thresholdValues;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  -[_INPBQueryHealthSampleIntent unit](self, "unit", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[_INPBQueryHealthSampleIntent unit](self, "unit");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBQueryHealthSampleIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBQueryHealthSampleIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBQueryHealthSampleIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBQueryHealthSampleIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBQueryHealthSampleIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBQueryHealthSampleIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBQueryHealthSampleIntent *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = -[_INPBQueryHealthSampleIntent init](+[_INPBQueryHealthSampleIntent allocWithZone:](_INPBQueryHealthSampleIntent, "allocWithZone:"), "init");
  if (-[_INPBQueryHealthSampleIntent hasExpectedResultType](self, "hasExpectedResultType"))
    -[_INPBQueryHealthSampleIntent setExpectedResultType:](v5, "setExpectedResultType:", -[_INPBQueryHealthSampleIntent expectedResultType](self, "expectedResultType"));
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBQueryHealthSampleIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  if (-[_INPBQueryHealthSampleIntent hasObjectType](self, "hasObjectType"))
    -[_INPBQueryHealthSampleIntent setObjectType:](v5, "setObjectType:", -[_INPBQueryHealthSampleIntent objectType](self, "objectType"));
  if (-[_INPBQueryHealthSampleIntent hasQuestionType](self, "hasQuestionType"))
    -[_INPBQueryHealthSampleIntent setQuestionType:](v5, "setQuestionType:", -[_INPBQueryHealthSampleIntent questionType](self, "questionType"));
  v7 = (void *)-[NSArray copyWithZone:](self->_recordDates, "copyWithZone:", a3);
  -[_INPBQueryHealthSampleIntent setRecordDates:](v5, "setRecordDates:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_thresholdValues, "copyWithZone:", a3);
  -[_INPBQueryHealthSampleIntent setThresholdValues:](v5, "setThresholdValues:", v8);

  v9 = -[_INPBWellnessUnitType copyWithZone:](self->_unit, "copyWithZone:", a3);
  -[_INPBQueryHealthSampleIntent setUnit:](v5, "setUnit:", v9);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int expectedResultType;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int objectType;
  int v16;
  int questionType;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  v5 = -[_INPBQueryHealthSampleIntent hasExpectedResultType](self, "hasExpectedResultType");
  if (v5 != objc_msgSend(v4, "hasExpectedResultType"))
    goto LABEL_34;
  if (-[_INPBQueryHealthSampleIntent hasExpectedResultType](self, "hasExpectedResultType"))
  {
    if (objc_msgSend(v4, "hasExpectedResultType"))
    {
      expectedResultType = self->_expectedResultType;
      if (expectedResultType != objc_msgSend(v4, "expectedResultType"))
        goto LABEL_34;
    }
  }
  -[_INPBQueryHealthSampleIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_33;
  -[_INPBQueryHealthSampleIntent intentMetadata](self, "intentMetadata");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBQueryHealthSampleIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_34;
  }
  else
  {

  }
  v14 = -[_INPBQueryHealthSampleIntent hasObjectType](self, "hasObjectType");
  if (v14 != objc_msgSend(v4, "hasObjectType"))
    goto LABEL_34;
  if (-[_INPBQueryHealthSampleIntent hasObjectType](self, "hasObjectType"))
  {
    if (objc_msgSend(v4, "hasObjectType"))
    {
      objectType = self->_objectType;
      if (objectType != objc_msgSend(v4, "objectType"))
        goto LABEL_34;
    }
  }
  v16 = -[_INPBQueryHealthSampleIntent hasQuestionType](self, "hasQuestionType");
  if (v16 != objc_msgSend(v4, "hasQuestionType"))
    goto LABEL_34;
  if (-[_INPBQueryHealthSampleIntent hasQuestionType](self, "hasQuestionType"))
  {
    if (objc_msgSend(v4, "hasQuestionType"))
    {
      questionType = self->_questionType;
      if (questionType != objc_msgSend(v4, "questionType"))
        goto LABEL_34;
    }
  }
  -[_INPBQueryHealthSampleIntent recordDates](self, "recordDates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordDates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_33;
  -[_INPBQueryHealthSampleIntent recordDates](self, "recordDates");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[_INPBQueryHealthSampleIntent recordDates](self, "recordDates");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordDates");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_34;
  }
  else
  {

  }
  -[_INPBQueryHealthSampleIntent thresholdValues](self, "thresholdValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thresholdValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_33;
  -[_INPBQueryHealthSampleIntent thresholdValues](self, "thresholdValues");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_INPBQueryHealthSampleIntent thresholdValues](self, "thresholdValues");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thresholdValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_34;
  }
  else
  {

  }
  -[_INPBQueryHealthSampleIntent unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBQueryHealthSampleIntent unit](self, "unit");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_37:
      v33 = 1;
      goto LABEL_35;
    }
    v29 = (void *)v28;
    -[_INPBQueryHealthSampleIntent unit](self, "unit");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unit");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_37;
  }
  else
  {
LABEL_33:

  }
LABEL_34:
  v33 = 0;
LABEL_35:

  return v33;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (-[_INPBQueryHealthSampleIntent hasExpectedResultType](self, "hasExpectedResultType"))
    v3 = 2654435761 * self->_expectedResultType;
  else
    v3 = 0;
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBQueryHealthSampleIntent hasObjectType](self, "hasObjectType"))
    v5 = 2654435761 * self->_objectType;
  else
    v5 = 0;
  if (-[_INPBQueryHealthSampleIntent hasQuestionType](self, "hasQuestionType"))
    v6 = 2654435761 * self->_questionType;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSArray hash](self->_recordDates, "hash");
  v8 = -[NSArray hash](self->_thresholdValues, "hash");
  return v7 ^ v8 ^ -[_INPBWellnessUnitType hash](self->_unit, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBQueryHealthSampleIntent hasExpectedResultType](self, "hasExpectedResultType"))
  {
    v4 = -[_INPBQueryHealthSampleIntent expectedResultType](self, "expectedResultType");
    if (v4 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E228AAB8[v4];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("expectedResultType"));

  }
  -[_INPBQueryHealthSampleIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  if (-[_INPBQueryHealthSampleIntent hasObjectType](self, "hasObjectType"))
  {
    v8 = -[_INPBQueryHealthSampleIntent objectType](self, "objectType");
    if (v8 >= 0x4B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E228AB08[v8];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("objectType"));

  }
  if (-[_INPBQueryHealthSampleIntent hasQuestionType](self, "hasQuestionType"))
  {
    v10 = -[_INPBQueryHealthSampleIntent questionType](self, "questionType");
    if (v10 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E228AD60[v10];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("questionType"));

  }
  if (-[NSArray count](self->_recordDates, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v13 = self->_recordDates;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v17), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("recordDate"));
  }
  if (-[NSArray count](self->_thresholdValues, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = self->_thresholdValues;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v24), "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("thresholdValues"));
  }
  -[_INPBQueryHealthSampleIntent unit](self, "unit");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("unit"));

  return v3;
}

- (int)expectedResultType
{
  return self->_expectedResultType;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)objectType
{
  return self->_objectType;
}

- (int)questionType
{
  return self->_questionType;
}

- (NSArray)recordDates
{
  return self->_recordDates;
}

- (NSArray)thresholdValues
{
  return self->_thresholdValues;
}

- (_INPBWellnessUnitType)unit
{
  return self->_unit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_thresholdValues, 0);
  objc_storeStrong((id *)&self->_recordDates, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (Class)recordDateType
{
  return (Class)objc_opt_class();
}

+ (Class)thresholdValuesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
