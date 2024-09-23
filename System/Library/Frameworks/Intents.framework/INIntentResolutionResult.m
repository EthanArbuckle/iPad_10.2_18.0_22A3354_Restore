@implementation INIntentResolutionResult

- (id)_objectForIntentSlotValue:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  INStartCallRequestMetadata *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  void (**v42)(_QWORD, _QWORD);
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "valueStyle");
  if (objc_msgSend(v5, "payloadStringValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadStringValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromStringValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadStringValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromStringValue(v8);
    }
LABEL_542:
    v38 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v38;
    goto LABEL_67;
  }
  if (objc_msgSend(v5, "payloadDoubleValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadDoubleValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDoubleValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadDoubleValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDoubleValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadIntegerValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadIntegerValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromIntegerValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadIntegerValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromIntegerValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadContactValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadContactValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromContactValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadContactValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromContactValueWithAlternatives(v8, 0);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadDateTimeRangeValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadDateTimeRangeValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDateTimeRangeValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadDateTimeRangeValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDateTimeRangeValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadLocationsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadLocations");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromLocationValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadLocationAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromLocationValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadDataStringsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadDataStrings");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDataStrings(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadDataStringAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDataString(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadLongValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadLongValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromLongValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadLongValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromLongValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadPaymentMethodValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadPaymentMethodValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromPaymentMethodValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadPaymentMethodValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromPaymentMethodValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadTemperatureValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadTemperatureValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromTemperatureValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadTemperatureValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromTemperatureValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadDistanceValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadDistanceValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDistanceValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadDistanceValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDistanceValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadDateTimeValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadDateTimeValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDateTimes(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadDateTimeValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDateTime(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadMassValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadMassValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromMassValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadMassValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromMassValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadVolumeValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadVolumeValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromVolumeValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadVolumeValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromVolumeValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadSpeedValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadSpeedValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromSpeedValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadSpeedValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromSpeedValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadEnergyValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadEnergyValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromEnergyValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadEnergyValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromEnergyValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadStringListsCount"))
  {
    objc_msgSend(v5, "payloadStringListAtIndex:", 0);
    v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
    -[INStartCallRequestMetadata dataStrings](v8, "dataStrings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromStrings(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  if (objc_msgSend(v5, "payloadDoubleListsCount"))
  {
    objc_msgSend(v5, "payloadDoubleListAtIndex:", 0);
    v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
    -[INStartCallRequestMetadata dataStrings](v8, "dataStrings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromDoubles(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  if (objc_msgSend(v5, "payloadIntegerListsCount"))
  {
    objc_msgSend(v5, "payloadIntegerListAtIndex:", 0);
    v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
    -[INStartCallRequestMetadata dataStrings](v8, "dataStrings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromIntegers(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  if (objc_msgSend(v5, "payloadContactListsCount"))
  {
    objc_msgSend(v5, "payloadContactListAtIndex:", 0);
    v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
    -[INStartCallRequestMetadata contacts](v8, "contacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromContacts(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  if (objc_msgSend(v5, "payloadDateTimeRangeListsCount"))
  {
    objc_msgSend(v5, "payloadDateTimeRangeListAtIndex:", 0);
    v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
    -[INStartCallRequestMetadata dateRanges](v8, "dateRanges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromDateTimeRanges(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  if (objc_msgSend(v5, "payloadLocationListsCount"))
  {
    objc_msgSend(v5, "payloadLocationListAtIndex:", 0);
    v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
    -[INStartCallRequestMetadata locations](v8, "locations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromLocations(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  if (objc_msgSend(v5, "payloadDataStringListsCount"))
  {
    objc_msgSend(v5, "payloadDataStringListAtIndex:", 0);
    v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
    -[INStartCallRequestMetadata dataStrings](v8, "dataStrings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromDataStrings(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  if (objc_msgSend(v5, "payloadLongListsCount"))
  {
    objc_msgSend(v5, "payloadLongListAtIndex:", 0);
    v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
    -[INStartCallRequestMetadata dataStrings](v8, "dataStrings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromLongs(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  if (objc_msgSend(v5, "payloadPaymentMethodListsCount"))
  {
    objc_msgSend(v5, "payloadPaymentMethodListAtIndex:", 0);
    v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
    -[INStartCallRequestMetadata paymentMethods](v8, "paymentMethods");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromPaymentMethods(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  if (objc_msgSend(v5, "payloadTemperatureListsCount"))
  {
    objc_msgSend(v5, "payloadTemperatureListAtIndex:", 0);
    v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
    -[INStartCallRequestMetadata temperatures](v8, "temperatures");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromTemperatures(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  if (objc_msgSend(v5, "payloadDistanceListsCount"))
  {
    objc_msgSend(v5, "payloadDistanceListAtIndex:", 0);
    v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
    -[INStartCallRequestMetadata distances](v8, "distances");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromDistances(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  if (objc_msgSend(v5, "payloadPrimitiveBoolsCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "payloadPrimitiveBoolAtIndex:", 0));
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_100:
    v12 = (void *)v13;
    goto LABEL_68;
  }
  if (objc_msgSend(v5, "payloadPrimitiveIntsCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadPrimitiveIntAtIndex:", 0);
LABEL_94:
    objc_msgSend(v14, "numberWithInt:", v15);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_100;
  }
  if (objc_msgSend(v5, "payloadPrimitiveLongsCount"))
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    v17 = objc_msgSend(v5, "payloadPrimitiveLongAtIndex:", 0);
LABEL_97:
    objc_msgSend(v16, "numberWithLongLong:", v17);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_100;
  }
  if (objc_msgSend(v5, "payloadPrimitiveDoublesCount"))
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "payloadPrimitiveDoubleAtIndex:", 0);
    objc_msgSend(v18, "numberWithDouble:");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_100;
  }
  if (objc_msgSend(v5, "payloadPrimitiveStringsCount"))
  {
    if (v7 == 3)
      objc_msgSend(v5, "payloadPrimitiveStrings");
    else
      objc_msgSend(v5, "payloadPrimitiveStringAtIndex:", 0);
LABEL_104:
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_100;
  }
  if (objc_msgSend(v5, "payloadIntentsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadIntents");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromIntents(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadIntentAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromIntent(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadModifyRelationshipsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadModifyRelationships");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromModifyRelationships(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadModifyRelationshipAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromModifyRelationship(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadModifyNicknamesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadModifyNicknames");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromModifyNicknames(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadModifyNicknameAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromModifyNickname(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadCalendarEventsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadCalendarEvents");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromCalendarEvents(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadCalendarEventAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromCalendarEvent(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadEventParticipantsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadEventParticipants");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromEventParticipants(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadEventParticipantAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromEventParticipant(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadEventAttributesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadEventAttributeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadEnumerationsCount"))
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    v17 = objc_msgSend(v5, "payloadEnumerationAtIndex:", 0);
    goto LABEL_97;
  }
  if (objc_msgSend(v5, "payloadAlarmsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadAlarms");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromAlarms(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadAlarmAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromAlarm(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadAlarmPeriodsCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadAlarmPeriodAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadAlarmRepeatSchedulesCount"))
  {
    if (v7 != 3)
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = objc_msgSend(v5, "payloadAlarmRepeatScheduleAtIndex:", 0);
      goto LABEL_94;
    }
    v57 = 0;
    if (objc_msgSend(v5, "payloadAlarmRepeatSchedulesCount"))
    {
      v19 = 0;
      do
        INAlarmRepeatScheduleOptionsAddBackingType(&v57, objc_msgSend(v5, "payloadAlarmRepeatScheduleAtIndex:", v19++));
      while (v19 < objc_msgSend(v5, "payloadAlarmRepeatSchedulesCount"));
LABEL_141:
      v20 = v57;
LABEL_487:
      v36 = (void *)MEMORY[0x1E0CB37E8];
      goto LABEL_488;
    }
    goto LABEL_486;
  }
  if (objc_msgSend(v5, "payloadAlarmSearchsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadAlarmSearchs");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromAlarmSearchs(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadAlarmSearchAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromAlarmSearch(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadAlarmSearchTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadAlarmSearchTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadChangeAlarmStatusOperationsCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadChangeAlarmStatusOperationAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadSleepAlarmAttributesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadSleepAlarmAttributes");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromSleepAlarmAttributes(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadSleepAlarmAttributeAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromSleepAlarmAttribute(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadUpdateAlarmOperationsCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadUpdateAlarmOperationAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadCallAudioRoutesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadCallAudioRouteAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadCallCapabilitiesCount"))
  {
    if (v7 != 3)
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = objc_msgSend(v5, "payloadCallCapabilityAtIndex:", 0);
      goto LABEL_94;
    }
    v21 = 0;
    if (objc_msgSend(v5, "payloadCallCapabilitiesCount"))
    {
      v22 = 0;
      do
      {
        v23 = objc_msgSend(v5, "payloadCallCapabilityAtIndex:", v22);
        v24 = v21 | 1;
        if (v23 != 1)
          v24 = v21;
        if (v23 == 2)
          v21 |= 2uLL;
        else
          v21 = v24;
        ++v22;
      }
      while (v22 < objc_msgSend(v5, "payloadCallCapabilitiesCount"));
    }
    goto LABEL_453;
  }
  if (objc_msgSend(v5, "payloadCallDestinationTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadCallDestinationTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadCallGroupsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadCallGroups");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromCallGroups(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadCallGroupAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromCallGroup(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadCallGroupConversationsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadCallGroupConversations");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromCallGroupConversations(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadCallGroupConversationAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromCallGroupConversation(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadCallRecordFiltersCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadCallRecordFilters");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromCallRecordFilters(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadCallRecordFilterAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromCallRecordFilter(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadCallRecordTypesCount"))
  {
    if (v7 != 3)
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = objc_msgSend(v5, "payloadCallRecordTypeAtIndex:", 0);
      goto LABEL_94;
    }
    v57 = 0;
    if (objc_msgSend(v5, "payloadCallRecordTypesCount"))
    {
      v25 = 0;
      do
        INCallRecordTypeOptionsAddBackingType(&v57, objc_msgSend(v5, "payloadCallRecordTypeAtIndex:", v25++));
      while (v25 < objc_msgSend(v5, "payloadCallRecordTypesCount"));
      goto LABEL_141;
    }
LABEL_486:
    v20 = 0;
    goto LABEL_487;
  }
  if (objc_msgSend(v5, "payloadCallRecordValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadCallRecordValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromCallRecordValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadCallRecordValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromCallRecordValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadDialingContactsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadDialingContacts");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDialingContacts(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadDialingContactAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDialingContact(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadPreferredCallProvidersCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadPreferredCallProviderAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadStartCallRequestMetadatasCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadStartCallRequestMetadatas");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromStartCallRequestMetadatas(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadStartCallRequestMetadataAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromStartCallRequestMetadata(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadCarAirCirculationModesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadCarAirCirculationModeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadCarAudioSourcesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadCarAudioSourceAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadCarDefrostersCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadCarDefrosterAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadCarSeatsCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadCarSeatAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadCarSignalIdentifiersCount"))
  {
    if (v7 != 3)
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = objc_msgSend(v5, "payloadCarSignalIdentifierAtIndex:", 0);
      goto LABEL_94;
    }
    v21 = 0;
    if (objc_msgSend(v5, "payloadCarSignalIdentifiersCount"))
    {
      v26 = 0;
      do
      {
        v27 = objc_msgSend(v5, "payloadCarSignalIdentifierAtIndex:", v26);
        v28 = v21 | 1;
        if (v27 != 1)
          v28 = v21;
        if (v27 == 2)
          v21 |= 2uLL;
        else
          v21 = v28;
        ++v26;
      }
      while (v26 < objc_msgSend(v5, "payloadCarSignalIdentifiersCount"));
    }
    goto LABEL_453;
  }
  if (objc_msgSend(v5, "payloadChargingConnectorTypesCount"))
  {
    if (v7 == 3)
      objc_msgSend(v5, "payloadChargingConnectorTypes");
    else
      objc_msgSend(v5, "payloadChargingConnectorTypeAtIndex:", 0);
    goto LABEL_104;
  }
  if (objc_msgSend(v5, "payloadRelativeReferencesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadRelativeReferenceAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadRelativeSettingsCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadRelativeSettingAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadDeviceDetailsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadDeviceDetails");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDeviceDetails(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadDeviceDetailAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDeviceDetail(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadSupportedTrafficIncidentTypesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadSupportedTrafficIncidentTypes");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromSupportedTrafficIncidentTypes(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadSupportedTrafficIncidentTypeAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromSupportedTrafficIncidentType(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadHomeAttributesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadHomeAttributes");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromHomeAttributes(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadHomeAttributeAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromHomeAttribute(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadHomeAttributeTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadHomeAttributeTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadHomeAttributeValueTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadHomeAttributeValueTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadHomeDeviceTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadHomeDeviceTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadHomeEntitiesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadHomeEntities");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromHomeEntities(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadHomeEntityAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromHomeEntity(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadHomeEntityTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadHomeEntityTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadHomeFiltersCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadHomeFilters");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromHomeFilters(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadHomeFilterAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromHomeFilter(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadHomeUserTasksCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadHomeUserTasks");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromHomeUserTasks(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadHomeUserTaskAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromHomeUserTask(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadAnnouncementsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadAnnouncements");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromAnnouncements(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadAnnouncementAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromAnnouncement(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadReadActionTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadReadActionTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadUserNotificationTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadUserNotificationTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadMediaAffinityTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadMediaAffinityTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadMediaDestinationsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadMediaDestinations");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromMediaDestinations(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadMediaDestinationAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromMediaDestination(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadMediaItemGroupsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadMediaItemGroups");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromMediaItemGroups(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadMediaItemGroupAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromMediaItemGroup(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadMediaItemValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadMediaItemValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromMediaItemValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadMediaItemValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromMediaItemValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadMediaSearchsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadMediaSearchs");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromMediaSearchs(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadMediaSearchAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromMediaSearch(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadParsecCategoriesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadParsecCategoryAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadPlaybackQueueLocationsCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadPlaybackQueueLocationAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadPlaybackRepeatModesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadPlaybackRepeatModeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadPrivateAddMediaIntentDatasCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadPrivateAddMediaIntentDatas");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromPrivateAddMediaIntentDatas(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadPrivateAddMediaIntentDataAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromPrivateAddMediaIntentData(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadPrivatePlayMediaIntentDatasCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadPrivatePlayMediaIntentDatas");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromPrivatePlayMediaIntentDatas(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadPrivatePlayMediaIntentDataAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromPrivatePlayMediaIntentData((INPrivatePlayMediaIntentData *)v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadPrivateSearchForMediaIntentDatasCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadPrivateSearchForMediaIntentDatas");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromPrivateSearchForMediaIntentDatas(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadPrivateSearchForMediaIntentDataAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromPrivateSearchForMediaIntentData(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadPrivateUpdateMediaAffinityIntentDatasCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadPrivateUpdateMediaAffinityIntentDatas");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromPrivateUpdateMediaAffinityIntentDatas(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadPrivateUpdateMediaAffinityIntentDataAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromPrivateUpdateMediaAffinityIntentData(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadRadioTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadRadioTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadContactEventTriggersCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadContactEventTriggers");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromContactEventTriggers(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadContactEventTriggerAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromContactEventTrigger(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadDateSearchTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadDateSearchTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadLocationSearchTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadLocationSearchTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadNotesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadNotes");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromNotes(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadNoteAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromNote(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadNoteContentsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadNoteContents");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromNoteContents(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadNoteContentAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromNoteContent(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadNotebookItemTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadNotebookItemTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadSpatialEventTriggersCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadSpatialEventTriggers");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromSpatialEventTriggers(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadSpatialEventTriggerAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromSpatialEventTrigger(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadTasksCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadTasks");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromTasks(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadTaskAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromTask(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadTaskListsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadTaskLists");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromTaskLists(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadTaskListAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromTaskList(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadTaskPrioritiesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadTaskPriorityAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadTaskReferencesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadTaskReferenceAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadTaskStatusCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadTaskStatusAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadTemporalEventTriggersCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadTemporalEventTriggers");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromTemporalEventTriggers(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadTemporalEventTriggerAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromTemporalEventTrigger(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadTemporalEventTriggerTypesCount"))
  {
    if (v7 != 3)
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = objc_msgSend(v5, "payloadTemporalEventTriggerTypeAtIndex:", 0);
      goto LABEL_94;
    }
    v21 = 0;
    if (objc_msgSend(v5, "payloadTemporalEventTriggerTypesCount"))
    {
      v29 = 0;
      do
      {
        v30 = objc_msgSend(v5, "payloadTemporalEventTriggerTypeAtIndex:", v29);
        v31 = v21 | 2;
        v32 = v21 | 1;
        if (v30 != 1)
          v32 = v21;
        if (v30 != 2)
          v31 = v32;
        if (v30 == 3)
          v21 |= 4uLL;
        else
          v21 = v31;
        ++v29;
      }
      while (v29 < objc_msgSend(v5, "payloadTemporalEventTriggerTypesCount"));
    }
    goto LABEL_453;
  }
  if (objc_msgSend(v5, "payloadAccountTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadAccountTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadBalanceTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadBalanceTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadBillDetailsValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadBillDetailsValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromBillDetailsValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadBillDetailsValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromBillDetailsValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadBillPayeeValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadBillPayeeValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromBillPayeeValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadBillPayeeValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromBillPayeeValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadBillTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadBillTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadCurrencyAmountsCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadCurrencyAmounts");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromCurrencyAmounts(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadCurrencyAmountAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromCurrencyAmount(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadFinancialAccountValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadFinancialAccountValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromFinancialAccountValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadFinancialAccountValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromFinancialAccountValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadPaymentAmountValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadPaymentAmountValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromPaymentAmountValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadPaymentAmountValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromPaymentAmountValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadPaymentStatusCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadPaymentStatusAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadBinarySettingValuesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadBinarySettingValueAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadBoundedSettingValuesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadBoundedSettingValueAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadDevicesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadDevices");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDevices(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadDeviceAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromDevice(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadGetSettingResponseDatasCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadGetSettingResponseDatas");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromGetSettingResponseDatas(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadGetSettingResponseDataAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromGetSettingResponseData(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadNumericSettingUnitsCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadNumericSettingUnitAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadNumericSettingValuesCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadNumericSettingValues");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromNumericSettingValues(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadNumericSettingValueAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromNumericSettingValue(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadSettingActionsCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadSettingActionAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadSettingMetadatasCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadSettingMetadatas");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromSettingMetadatas(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadSettingMetadataAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromSettingMetadata(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadTimersCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadTimers");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromTimers(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadTimerAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromTimer(v8);
    }
    goto LABEL_542;
  }
  if (objc_msgSend(v5, "payloadTimerStatesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadTimerStateAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadTimerTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadTimerTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadVisualCodeTypesCount"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend(v5, "payloadVisualCodeTypeAtIndex:", 0);
    goto LABEL_94;
  }
  if (objc_msgSend(v5, "payloadAppIdentifiersCount"))
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadAppIdentifiers");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromAppIdentifiers(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadAppIdentifierAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromAppIdentifier(v8);
    }
    goto LABEL_542;
  }
  if (!objc_msgSend(v5, "payloadArchivedObjectsCount"))
  {
    if (objc_msgSend(v5, "payloadCustomObjectsCount"))
    {
      if (v7 == 3)
      {
        objc_msgSend(v5, "payloadCustomObjects");
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromCustomObjects(v8);
      }
      else
      {
        objc_msgSend(v5, "payloadCustomObjectAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromCustomObject(v8);
      }
      goto LABEL_542;
    }
    if (objc_msgSend(v5, "payloadFilesCount"))
    {
      if (v7 == 3)
      {
        objc_msgSend(v5, "payloadFiles");
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromFiles(v8);
      }
      else
      {
        objc_msgSend(v5, "payloadFileAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromFile(v8);
      }
      goto LABEL_542;
    }
    if (objc_msgSend(v5, "payloadIntentExecutionResultsCount"))
    {
      if (v7 == 3)
      {
        objc_msgSend(v5, "payloadIntentExecutionResults");
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromIntentExecutionResults(v8);
      }
      else
      {
        objc_msgSend(v5, "payloadIntentExecutionResultAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromIntentExecutionResult(v8);
      }
      goto LABEL_542;
    }
    if (objc_msgSend(v5, "payloadURLValuesCount"))
    {
      if (v7 == 3)
      {
        objc_msgSend(v5, "payloadURLValues");
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromURLValues(v8);
      }
      else
      {
        objc_msgSend(v5, "payloadURLValueAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromURLValue(v8);
      }
      goto LABEL_542;
    }
    if (objc_msgSend(v5, "payloadVoiceCommandDeviceInformationsCount"))
    {
      if (v7 == 3)
      {
        objc_msgSend(v5, "payloadVoiceCommandDeviceInformations");
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromVoiceCommandDeviceInformations(v8);
      }
      else
      {
        objc_msgSend(v5, "payloadVoiceCommandDeviceInformationAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromVoiceCommandDeviceInformation(v8);
      }
      goto LABEL_542;
    }
    if (objc_msgSend(v5, "payloadWellnessMetadataPairsCount"))
    {
      if (v7 == 3)
      {
        objc_msgSend(v5, "payloadWellnessMetadataPairs");
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromWellnessMetadataPairs(v8);
      }
      else
      {
        objc_msgSend(v5, "payloadWellnessMetadataPairAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromWellnessMetadataPair(v8);
      }
      goto LABEL_542;
    }
    if (objc_msgSend(v5, "payloadWellnessObjectResultValuesCount"))
    {
      if (v7 == 3)
      {
        objc_msgSend(v5, "payloadWellnessObjectResultValues");
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromWellnessObjectResultValues(v8);
      }
      else
      {
        objc_msgSend(v5, "payloadWellnessObjectResultValueAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromWellnessObjectResultValue(v8);
      }
      goto LABEL_542;
    }
    if (objc_msgSend(v5, "payloadWellnessObjectTypesCount"))
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = objc_msgSend(v5, "payloadWellnessObjectTypeAtIndex:", 0);
      goto LABEL_94;
    }
    if (objc_msgSend(v5, "payloadWellnessQueryResultTypesCount"))
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = objc_msgSend(v5, "payloadWellnessQueryResultTypeAtIndex:", 0);
      goto LABEL_94;
    }
    if (objc_msgSend(v5, "payloadWellnessQuestionTypesCount"))
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = objc_msgSend(v5, "payloadWellnessQuestionTypeAtIndex:", 0);
      goto LABEL_94;
    }
    if (objc_msgSend(v5, "payloadWellnessUnitTypesCount"))
    {
      if (v7 == 3)
      {
        objc_msgSend(v5, "payloadWellnessUnitTypes");
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromWellnessUnitTypes(v8);
      }
      else
      {
        objc_msgSend(v5, "payloadWellnessUnitTypeAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromWellnessUnitType(v8);
      }
      goto LABEL_542;
    }
    if (objc_msgSend(v5, "payloadWellnessValuesCount"))
    {
      if (v7 == 3)
      {
        objc_msgSend(v5, "payloadWellnessValues");
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromWellnessValues(v8);
      }
      else
      {
        objc_msgSend(v5, "payloadWellnessValueAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromWellnessValue(v8);
      }
      goto LABEL_542;
    }
    if (objc_msgSend(v5, "payloadWorkoutAssociatedItemsCount"))
    {
      if (v7 == 3)
      {
        objc_msgSend(v5, "payloadWorkoutAssociatedItems");
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromWorkoutAssociatedItems(v8);
      }
      else
      {
        objc_msgSend(v5, "payloadWorkoutAssociatedItemAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromWorkoutAssociatedItem(v8);
      }
      goto LABEL_542;
    }
    if (objc_msgSend(v5, "payloadWorkoutCustomizationsCount"))
    {
      if (v7 == 3)
      {
        objc_msgSend(v5, "payloadWorkoutCustomizations");
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromWorkoutCustomizations(v8);
      }
      else
      {
        objc_msgSend(v5, "payloadWorkoutCustomizationAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromWorkoutCustomization(v8);
      }
      goto LABEL_542;
    }
    if (objc_msgSend(v5, "payloadWorkoutGoalUnitTypesCount"))
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = objc_msgSend(v5, "payloadWorkoutGoalUnitTypeAtIndex:", 0);
      goto LABEL_94;
    }
    if (objc_msgSend(v5, "payloadWorkoutLocationTypesCount"))
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = objc_msgSend(v5, "payloadWorkoutLocationTypeAtIndex:", 0);
      goto LABEL_94;
    }
    if (objc_msgSend(v5, "payloadWorkoutSequenceLabelsCount"))
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = objc_msgSend(v5, "payloadWorkoutSequenceLabelAtIndex:", 0);
      goto LABEL_94;
    }
    if (!objc_msgSend(v5, "payloadMessageAttributesCount"))
    {
      if (objc_msgSend(v5, "payloadMessageEffectsCount"))
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        v15 = objc_msgSend(v5, "payloadMessageEffectAtIndex:", 0);
        goto LABEL_94;
      }
      if (objc_msgSend(v5, "payloadMessageTypesCount"))
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        v15 = objc_msgSend(v5, "payloadMessageTypeAtIndex:", 0);
        goto LABEL_94;
      }
      if (objc_msgSend(v5, "payloadOutgoingMessageTypesCount"))
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        v15 = objc_msgSend(v5, "payloadOutgoingMessageTypeAtIndex:", 0);
        goto LABEL_94;
      }
      if (objc_msgSend(v5, "payloadSendMessageAttachmentsCount"))
      {
        if (v7 == 3)
        {
          objc_msgSend(v5, "payloadSendMessageAttachments");
          v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
          INIntentSlotValueTransformFromSendMessageAttachments(v8);
        }
        else
        {
          objc_msgSend(v5, "payloadSendMessageAttachmentAtIndex:", 0);
          v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
          INIntentSlotValueTransformFromSendMessageAttachment(v8);
        }
        goto LABEL_542;
      }
      if (objc_msgSend(v5, "payloadActivitiesCount"))
      {
        if (v7 == 3)
        {
          objc_msgSend(v5, "payloadActivities");
          v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
          INIntentSlotValueTransformFromActivities(v8);
        }
        else
        {
          objc_msgSend(v5, "payloadActivityAtIndex:", 0);
          v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
          INIntentSlotValueTransformFromActivity(v8);
        }
        goto LABEL_542;
      }
      if (objc_msgSend(v5, "payloadActivityListsCount"))
      {
        objc_msgSend(v5, "payloadActivityListAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        -[INStartCallRequestMetadata activities](v8, "activities");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromActivities(v9);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_89;
      }
      if (objc_msgSend(v5, "payloadEventsCount"))
      {
        if (v7 == 3)
        {
          objc_msgSend(v5, "payloadEvents");
          v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
          INIntentSlotValueTransformFromEvents(v8);
        }
        else
        {
          objc_msgSend(v5, "payloadEventAtIndex:", 0);
          v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
          INIntentSlotValueTransformFromEvent(v8);
        }
        goto LABEL_542;
      }
      if (objc_msgSend(v5, "payloadEventListsCount"))
      {
        objc_msgSend(v5, "payloadEventListAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        -[INStartCallRequestMetadata events](v8, "events");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromEvents(v9);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_89;
      }
      if (objc_msgSend(v5, "payloadGeographicalFeaturesCount"))
      {
        if (v7 == 3)
        {
          objc_msgSend(v5, "payloadGeographicalFeatures");
          v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
          INIntentSlotValueTransformFromGeographicalFeatures(v8);
        }
        else
        {
          objc_msgSend(v5, "payloadGeographicalFeatureAtIndex:", 0);
          v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
          INIntentSlotValueTransformFromGeographicalFeature(v8);
        }
        goto LABEL_542;
      }
      if (objc_msgSend(v5, "payloadGeographicalFeatureListsCount"))
      {
        objc_msgSend(v5, "payloadGeographicalFeatureListAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        -[INStartCallRequestMetadata geographicalFeatures](v8, "geographicalFeatures");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromGeographicalFeatures(v9);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_89;
      }
      if (objc_msgSend(v5, "payloadPersonalPlaceTypesCount"))
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        v15 = objc_msgSend(v5, "payloadPersonalPlaceTypeAtIndex:", 0);
        goto LABEL_94;
      }
      if (!objc_msgSend(v5, "payloadPhotoAttributesCount"))
      {
        if (objc_msgSend(v5, "payloadPlacesCount"))
        {
          if (v7 == 3)
          {
            objc_msgSend(v5, "payloadPlaces");
            v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
            INIntentSlotValueTransformFromPlaces(v8);
          }
          else
          {
            objc_msgSend(v5, "payloadPlaceAtIndex:", 0);
            v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
            INIntentSlotValueTransformFromPlace(v8);
          }
          goto LABEL_542;
        }
        if (!objc_msgSend(v5, "payloadPlaceListsCount"))
        {
          v12 = 0;
          goto LABEL_68;
        }
        objc_msgSend(v5, "payloadPlaceListAtIndex:", 0);
        v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
        -[INStartCallRequestMetadata places](v8, "places");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromPlaces(v9);
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_89:
        v12 = (void *)v10;

LABEL_67:
        goto LABEL_68;
      }
      if (v7 != 3)
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        v15 = objc_msgSend(v5, "payloadPhotoAttributeAtIndex:", 0);
        goto LABEL_94;
      }
      v57 = 0;
      if (objc_msgSend(v5, "payloadPhotoAttributesCount"))
      {
        v37 = 0;
        do
          INPhotoAttributeOptionsAddBackingType(&v57, objc_msgSend(v5, "payloadPhotoAttributeAtIndex:", v37++));
        while (v37 < objc_msgSend(v5, "payloadPhotoAttributesCount"));
        goto LABEL_141;
      }
      goto LABEL_486;
    }
    if (v7 != 3)
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = objc_msgSend(v5, "payloadMessageAttributeAtIndex:", 0);
      goto LABEL_94;
    }
    v21 = 0;
    if (objc_msgSend(v5, "payloadMessageAttributesCount"))
    {
      v35 = 0;
      do
      {
        switch(objc_msgSend(v5, "payloadMessageAttributeAtIndex:", v35))
        {
          case 1u:
            v21 |= 1uLL;
            break;
          case 2u:
            v21 |= 2uLL;
            break;
          case 3u:
            v21 |= 4uLL;
            break;
          case 4u:
            v21 |= 8uLL;
            break;
          case 5u:
            v21 |= 0x10uLL;
            break;
          default:
            break;
        }
        ++v35;
      }
      while (v35 < objc_msgSend(v5, "payloadMessageAttributesCount"));
    }
LABEL_453:
    v36 = (void *)MEMORY[0x1E0CB37E8];
    v20 = v21;
LABEL_488:
    objc_msgSend(v36, "numberWithUnsignedInteger:", v20);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_100;
  }
  if (objc_msgSend(v6, "valueType") != 225)
  {
    if (v7 == 3)
    {
      objc_msgSend(v5, "payloadArchivedObjects");
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromArchivedObjects(v8);
    }
    else
    {
      objc_msgSend(v5, "payloadArchivedObjectAtIndex:", 0);
      v8 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromArchivedObject(v8);
    }
    goto LABEL_542;
  }
  objc_msgSend(v6, "codableAttribute");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
  }
  else
  {
    v34 = 0;
  }
  v39 = v34;

  objc_msgSend(v39, "codableDescription");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __81__INIntentResolutionResult_Transform___objectForIntentSlotValue_slotDescription___block_invoke;
  v54[3] = &unk_1E228CDA8;
  v49 = v40;
  v55 = v49;
  v41 = v39;
  v56 = v41;
  v42 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D7812C4](v54);
  if (v7 == 3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "payloadArchivedObjectsCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v5, "payloadArchivedObjects");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v51 != v46)
            objc_enumerationMutation(v43);
          v42[2](v42, *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v48);

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v45);
    }
  }
  else
  {
    objc_msgSend(v5, "payloadArchivedObjectAtIndex:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v42)[2](v42, v43);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_68:
  return v12;
}

id __81__INIntentResolutionResult_Transform___objectForIntentSlotValue_slotDescription___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  INCodable *v4;
  uint64_t v5;
  void *v6;
  INCodable *v7;
  void *v8;
  void *v9;

  INIntentSlotValueTransformFromArchivedObject(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [INCodable alloc];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "messageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[INCodable initWithCodableDescription:data:](v4, "initWithCodableDescription:data:", v5, v6);

  objc_msgSend(*(id *)(a1 + 40), "valueTransformer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reverseTransformedValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (INIntentResolutionResult)confirmationRequiredWithItemToConfirm:(id)itemToConfirm forReason:(NSInteger)reason
{
  void *v5;

  objc_msgSend(a1, "resolutionResultConfirmationRequiredWithItemToConfirm:", itemToConfirm);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfirmationReason:", reason);
  return (INIntentResolutionResult *)v5;
}

- (id)_initWithResultCode:(int64_t)a3
{
  INIntentResolutionResult *v4;
  INIntentResolutionResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INIntentResolutionResult;
  v4 = -[INIntentResolutionResult init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[INIntentResolutionResult setResolutionResultCode:](v4, "setResolutionResultCode:", a3);
  return v5;
}

- (id)resolutionResultDataForIntent:(id)a3 intentSlotDescription:(id)a4 error:(id *)a5
{
  if (a5)
    *a5 = 0;
  return -[INIntentResolutionResult _dataForIntentSlotDescription:](self, "_dataForIntentSlotDescription:", a4);
}

- (void)transformResolutionResultForIntent:(id)a3 intentSlotDescription:(id)a4 withOptionsProvider:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  INIntentResolutionResult *v25;
  id v26;
  id v27;
  id v28;
  int64_t v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode");
  objc_msgSend(v10, "_metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "facadePropertyName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "forceNeedsValueForParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v16);

  if (v18)
  {
    objc_msgSend(v10, "valueForKey:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 || v14 == 2)
    {

    }
    else if (v14 != 3)
    {
      v14 = 4;
      -[INIntentResolutionResult setResolutionResultCode:](self, "setResolutionResultCode:", 4);
    }
    objc_msgSend(v15, "forceNeedsValueForParameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "if_arrayByRemovingObject:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setForceNeedsValueForParameters:", v20);

  }
  if (v14 == 4 || v14 == 1)
  {
    objc_msgSend(v11, "provideOptionsSelectorStrings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v17, "count") != 0;
  }
  else
  {
    v21 = 0;
  }
  if (v14 == 4 || v14 == 1)

  if (v21)
  {
    objc_msgSend(v11, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __116__INIntentResolutionResult_transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke;
    v23[3] = &unk_1E2290888;
    v24 = v11;
    v28 = v13;
    v25 = self;
    v26 = v12;
    v27 = v10;
    v29 = v14;
    objc_msgSend(v26, "getSupportsParameterOptionsForParameterNamed:intent:completionHandler:", v22, v27, v23);

  }
  else
  {
    (*((void (**)(id, INIntentResolutionResult *))v13 + 2))(v13, self);
  }

}

- (id)_dataForIntentSlotDescription:(id)a3
{
  void *v3;
  void *v4;

  -[INIntentResolutionResult _buildIntentSlotResolutionResultWithIntentSlotDescription:](self, "_buildIntentSlotResolutionResultWithIntentSlotDescription:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3
{
  _INPBIntentSlotResolutionResult *v4;
  _INPBPayloadSuccess *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _INPBPayloadUnsupported *v10;
  _INPBPayloadConfirmation *v11;
  _INPBSelectionItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _INPBPayloadNeedsValue *v19;
  _INPBPayloadNeedsExecuteIntent *v20;
  _INPBIntentExecutionRequest *v21;
  _INPBAppIdentifier *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _INPBConflictingParameter *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  _INPBSelectionItem *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _INPBPayloadNeedsDisambiguation *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  uint64_t v59;
  _INPBSelectionItem *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  _INPBIntentSlotResolutionResult *v67;
  _INPBIntentSlotResolutionResult *v68;
  id obj;
  id obja;
  INIntentResolutionResult *v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v4 = objc_alloc_init(_INPBIntentSlotResolutionResult);
  v71 = self;
  switch(-[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode"))
  {
    case 0:
      v5 = objc_alloc_init(_INPBPayloadSuccess);
      objc_msgSend(v72, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBPayloadSuccess setResolvedKeyPath:](v5, "setResolvedKeyPath:", v6);

      -[INIntentResolutionResult resolvedValue](self, "resolvedValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntentResolutionResult _intentSlotValueForObject:slotDescription:](self, "_intentSlotValueForObject:slotDescription:", v7, v72);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[_INPBPayloadSuccess setResolvedValue:](v5, "setResolvedValue:", v8);
      -[_INPBIntentSlotResolutionResult setPayloadSuccess:](v4, "setPayloadSuccess:", v5);

      v9 = 1;
      break;
    case 1:
      v10 = objc_alloc_init(_INPBPayloadUnsupported);
      if (-[INIntentResolutionResult unsupportedReason](self, "unsupportedReason"))
      {
        -[_INPBPayloadUnsupported setReason:](v10, "setReason:", 1000);
        -[_INPBPayloadUnsupported setCustomUnsupportedReason:](v10, "setCustomUnsupportedReason:", -[INIntentResolutionResult unsupportedReason](self, "unsupportedReason"));
      }
      else
      {
        -[_INPBPayloadUnsupported setReason:](v10, "setReason:", 1);
      }
      -[INIntentResolutionResult alternatives](self, "alternatives");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "count"))
      {
        v67 = v4;
        v42 = objc_alloc_init(_INPBConflictingParameter);
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v66 = v41;
        obj = v41;
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v79;
          do
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v79 != v45)
                objc_enumerationMutation(obj);
              v47 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
              v48 = objc_alloc_init(_INPBSelectionItem);
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "UUIDString");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              -[_INPBSelectionItem setUuid:](v48, "setUuid:", v50);

              -[INIntentResolutionResult _intentSlotValueForObject:slotDescription:](v71, "_intentSlotValueForObject:slotDescription:", v47, v72);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              -[_INPBSelectionItem setValue:](v48, "setValue:", v51);

              -[INIntentResolutionResult _vocabularyValueForObject:slotDescription:](v71, "_vocabularyValueForObject:slotDescription:", v47, v72);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              -[_INPBSelectionItem setVocabularyValue:](v48, "setVocabularyValue:", v52);

              -[_INPBConflictingParameter addAlternateItems:](v42, "addAlternateItems:", v48);
            }
            v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
          }
          while (v44);
        }

        -[_INPBPayloadUnsupported addConflictingParameters:](v10, "addConflictingParameters:", v42);
        v4 = v67;
        self = v71;
        v41 = v66;
      }
      -[_INPBIntentSlotResolutionResult setPayloadUnsupported:](v4, "setPayloadUnsupported:", v10);

      goto LABEL_26;
    case 2:
      v9 = 4;
      break;
    case 3:
      v11 = objc_alloc_init(_INPBPayloadConfirmation);
      v12 = objc_alloc_init(_INPBSelectionItem);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBSelectionItem setUuid:](v12, "setUuid:", v14);

      -[INIntentResolutionResult itemToConfirm](self, "itemToConfirm");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntentResolutionResult _intentSlotValueForObject:slotDescription:](self, "_intentSlotValueForObject:slotDescription:", v15, v72);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBSelectionItem setValue:](v12, "setValue:", v16);

      -[INIntentResolutionResult itemToConfirm](self, "itemToConfirm");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntentResolutionResult _vocabularyValueForObject:slotDescription:](self, "_vocabularyValueForObject:slotDescription:", v17, v72);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBSelectionItem setVocabularyValue:](v12, "setVocabularyValue:", v18);

      -[_INPBPayloadConfirmation setConfirmationItem:](v11, "setConfirmationItem:", v12);
      -[_INPBIntentSlotResolutionResult setPayloadConfirmation:](v4, "setPayloadConfirmation:", v11);

      v9 = 6;
      break;
    case 4:
      v19 = objc_alloc_init(_INPBPayloadNeedsValue);
      -[_INPBIntentSlotResolutionResult setPayloadNeedsValue:](v4, "setPayloadNeedsValue:", v19);

      v9 = 3;
      break;
    case 5:
      v9 = 7;
      break;
    case 6:
      v20 = objc_alloc_init(_INPBPayloadNeedsExecuteIntent);
      v21 = objc_alloc_init(_INPBIntentExecutionRequest);
      v22 = objc_alloc_init(_INPBAppIdentifier);
      -[INIntentResolutionResult intentToExecute](self, "intentToExecute");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "launchId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBAppIdentifier setBundleIdentifier:](v22, "setBundleIdentifier:", v24);

      -[_INPBIntentExecutionRequest setAppIdentifier:](v21, "setAppIdentifier:", v22);
      -[_INPBIntentExecutionRequest setEncodingFormat:](v21, "setEncodingFormat:", 1);
      -[INIntentResolutionResult intentToExecute](self, "intentToExecute");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_JSONDictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "if_JSONStringRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBIntentExecutionRequest setEncodedIntent:](v21, "setEncodedIntent:", v27);

      -[INIntentResolutionResult intentToExecute](self, "intentToExecute");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_codableDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "schema");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        -[INIntentResolutionResult intentToExecute](self, "intentToExecute");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "extensionBundleId");
        v32 = (id)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          -[INIntentResolutionResult intentToExecute](self, "intentToExecute");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "launchId");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = 0;
          INExtractAppInfoFromSiriLaunchId(v34, &v77, 0);
          v32 = v77;

        }
        objc_msgSend(v29, "className");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), CFSTR("sirikit.intents.custom."), v32, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        INSchemaWithTypeName(v36, 0, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[INIntentResolutionResult intentToExecute](self, "intentToExecute");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[INStringLocalizer siriLocalizer](INStringLocalizer, "siriLocalizer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "dictionaryRepresentationForIntent:localizer:", v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "if_JSONStringRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBIntentExecutionRequest setEncodedIntentDefinition:](v21, "setEncodedIntentDefinition:", v40);

      -[_INPBPayloadNeedsExecuteIntent setIntentExecution:](v20, "setIntentExecution:", v21);
      -[_INPBIntentSlotResolutionResult setPayloadNeedsExecuteIntent:](v4, "setPayloadNeedsExecuteIntent:", v20);

      v9 = 11;
      break;
    case 7:
      v9 = 9;
      break;
    default:
LABEL_26:
      v9 = 2;
      break;
  }
  -[INIntentResolutionResult disambiguationItems](self, "disambiguationItems");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v68 = v4;
    v54 = objc_alloc_init(_INPBPayloadNeedsDisambiguation);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    obja = v53;
    v55 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(_QWORD *)v74 != v57)
            objc_enumerationMutation(obja);
          v59 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j);
          v60 = objc_alloc_init(_INPBSelectionItem);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "UUIDString");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[_INPBSelectionItem setUuid:](v60, "setUuid:", v62);

          -[INIntentResolutionResult _intentSlotValueForObject:slotDescription:](v71, "_intentSlotValueForObject:slotDescription:", v59, v72);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[_INPBSelectionItem setValue:](v60, "setValue:", v63);

          -[INIntentResolutionResult _vocabularyValueForObject:slotDescription:](v71, "_vocabularyValueForObject:slotDescription:", v59, v72);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[_INPBSelectionItem setVocabularyValue:](v60, "setVocabularyValue:", v64);
          -[_INPBPayloadNeedsDisambiguation addDisambiguationItems:](v54, "addDisambiguationItems:", v60);

        }
        v56 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
      }
      while (v56);
    }

    v4 = v68;
    -[_INPBIntentSlotResolutionResult setPayloadNeedsDisambiguation:](v68, "setPayloadNeedsDisambiguation:", v54);

    v9 = v9;
  }
  -[_INPBIntentSlotResolutionResult setType:](v4, "setType:", v9);

  return v4;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  return 0;
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  return 0;
}

- (id)_initWithResolutionResult:(id)a3
{
  id v4;
  INIntentResolutionResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INIntentResolutionResult;
  v5 = -[INIntentResolutionResult init](&v11, sel_init);
  if (v5)
  {
    -[INIntentResolutionResult setResolutionResultCode:](v5, "setResolutionResultCode:", objc_msgSend(v4, "resolutionResultCode"));
    objc_msgSend(v4, "disambiguationItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResolutionResult setDisambiguationItems:](v5, "setDisambiguationItems:", v6);

    objc_msgSend(v4, "alternatives");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResolutionResult setAlternatives:](v5, "setAlternatives:", v7);

    objc_msgSend(v4, "resolvedValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResolutionResult setResolvedValue:](v5, "setResolvedValue:", v8);

    objc_msgSend(v4, "itemToConfirm");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResolutionResult setItemToConfirm:](v5, "setItemToConfirm:", v9);

    -[INIntentResolutionResult setUnsupportedReason:](v5, "setUnsupportedReason:", objc_msgSend(v4, "unsupportedReason"));
    -[INIntentResolutionResult setConfirmationReason:](v5, "setConfirmationReason:", objc_msgSend(v4, "confirmationReason"));
  }

  return v5;
}

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6;
  id v7;
  INIntentResolutionResult *v8;
  INIntentResolutionResult *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  INIntentResolutionResult *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)INIntentResolutionResult;
  v8 = -[INIntentResolutionResult init](&v53, sel_init);
  if (v8)
  {
    v9 = 0;
    switch(objc_msgSend(v6, "type"))
    {
      case 1u:
        -[INIntentResolutionResult setResolutionResultCode:](v8, "setResolutionResultCode:", 0);
        objc_msgSend(v6, "payloadSuccess");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "resolvedValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[INIntentResolutionResult _objectForIntentSlotValue:slotDescription:](v8, "_objectForIntentSlotValue:slotDescription:", v11, v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[INIntentResolutionResult setResolvedValue:](v8, "setResolvedValue:", v12);
        goto LABEL_18;
      case 2u:
        -[INIntentResolutionResult setResolutionResultCode:](v8, "setResolutionResultCode:", 1);
        objc_msgSend(v6, "payloadUnsupported");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "hasCustomUnsupportedReason"))
          -[INIntentResolutionResult setUnsupportedReason:](v8, "setUnsupportedReason:", objc_msgSend(v10, "customUnsupportedReason"));
        objc_msgSend(v10, "conflictingParameters");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "alternateItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count"))
        {
          v44 = v10;
          v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v43 = v11;
          v16 = v11;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v50;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v50 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "value", v43);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[INIntentResolutionResult _objectForIntentSlotValue:slotDescription:](v8, "_objectForIntentSlotValue:slotDescription:", v21, v7);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "addObject:", v22);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
            }
            while (v18);
          }

          -[INIntentResolutionResult setAlternatives:](v8, "setAlternatives:", v15);
          v11 = v43;
          v10 = v44;
        }
        goto LABEL_19;
      case 3u:
        v23 = v8;
        v24 = 4;
        goto LABEL_22;
      case 4u:
        v23 = v8;
        v24 = 2;
        goto LABEL_22;
      case 6u:
        -[INIntentResolutionResult setResolutionResultCode:](v8, "setResolutionResultCode:", 3);
        objc_msgSend(v6, "payloadConfirmation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "confirmationItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[INIntentResolutionResult _objectForIntentSlotValue:slotDescription:](v8, "_objectForIntentSlotValue:slotDescription:", v12, v7);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[INIntentResolutionResult setItemToConfirm:](v8, "setItemToConfirm:", v25);

LABEL_18:
LABEL_19:

        break;
      case 7u:
        v23 = v8;
        v24 = 5;
        goto LABEL_22;
      case 8u:
      case 0xAu:
        goto LABEL_33;
      case 9u:
        v23 = v8;
        v24 = 7;
LABEL_22:
        -[INIntentResolutionResult setResolutionResultCode:](v23, "setResolutionResultCode:", v24);
        break;
      case 0xBu:
        -[INIntentResolutionResult setResolutionResultCode:](v8, "setResolutionResultCode:", 6);
        objc_msgSend(v6, "payloadNeedsExecuteIntent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "intentExecution");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "encodedIntent");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "dataUsingEncoding:", 4);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        INIntentCreate(0, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[INIntentResolutionResult setIntentToExecute:](v8, "setIntentToExecute:", v42);

        break;
      default:
        break;
    }
  }
  objc_msgSend(v6, "payloadNeedsDisambiguation", v43);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "disambiguationItemsCount");

  if (v27)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v27);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v6, "payloadNeedsDisambiguation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "disambiguationItems");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v46 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "value");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[INIntentResolutionResult _objectForIntentSlotValue:slotDescription:](v8, "_objectForIntentSlotValue:slotDescription:", v35, v7);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v36);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v32);
    }

    -[INIntentResolutionResult setDisambiguationItems:](v8, "setDisambiguationItems:", v28);
  }
  v9 = v8;
LABEL_33:

  return v9;
}

- (INIntentResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  INIntentResolutionResult *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char isKindOfClass;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _QWORD *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  INJSONDecoder *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  uint8_t v54[128];
  uint8_t buf[4];
  const char *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v56 = "-[INIntentResolutionResult initWithJSONDictionary:forIntent:]";
    _os_log_debug_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_DEBUG, "%s _initWithJSONDictionary called", buf, 0xCu);
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("status"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = v9;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Success")) & 1) != 0)
    {
      v11 = 0;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Unsupported")) & 1) != 0)
    {
      v11 = 1;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("NeedsDisambiguation")) & 1) != 0)
    {
      v11 = 2;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("NeedsConfirmation")) & 1) != 0)
    {
      v11 = 3;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("NeedsValue")) & 1) != 0)
    {
      v11 = 4;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("NotRequired")) & 1) != 0)
    {
      v11 = 5;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("NeedsExecuteIntent")) & 1) != 0)
    {
      v11 = 6;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("CalleeNotImplemented")))
    {
      v11 = 7;
    }
    else
    {
      v11 = 1;
    }

    v13 = -[INIntentResolutionResult _initWithResultCode:](self, "_initWithResultCode:", v11);
    if (v13)
    {
      v47 = objc_alloc_init(INJSONDecoder);
      objc_msgSend(v6, "objectForKey:", CFSTR("keyPath"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      v16 = v15;

      objc_msgSend(v7, "_codableDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v16;
      objc_msgSend(v17, "attributeByName:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v18, "resolutionResultClass");
      if (v19)
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("value"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[INJSONDecoder decodeWithCodableAttribute:from:](v47, "decodeWithCodableAttribute:from:", v18, v20);
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = 4;
            if (v13[1] == 3)
              v22 = 5;
            v23 = (void *)v13[v22];
            v13[v22] = v21;

          }
        }

      }
      objc_msgSend(v6, "objectForKey:", CFSTR("reason"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v18, "unsupportedReasons");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __61__INIntentResolutionResult_initWithJSONDictionary_forIntent___block_invoke;
        v52[3] = &unk_1E22908B0;
        v45 = v24;
        v53 = v45;
        objc_msgSend(v25, "if_firstObjectPassingTest:", v52);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v13[6] = objc_msgSend(v18, "indexForUnsupportedReason:", v26);
        v24 = v53;
      }
      else
      {
        v45 = 0;
      }

      objc_msgSend(v6, "objectForKey:", CFSTR("selectionItems"));
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = (void *)v27;
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
          v30 = v28;
        else
          v30 = 0;
        v31 = v30;

        if (v19 && (isKindOfClass & 1) != 0)
        {
          v42 = v13;
          v43 = v7;
          v44 = v6;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v31, "count"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v31 = v31;
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v49;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v49 != v35)
                  objc_enumerationMutation(v31);
                objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "objectForKey:", CFSTR("value"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                if (v37)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    -[INJSONDecoder decodeWithCodableAttribute:from:](v47, "decodeWithCodableAttribute:from:", v18, v37);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "addObject:", v38);

                  }
                }

              }
              v34 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
            }
            while (v34);
          }

          v39 = objc_msgSend(v32, "copy");
          v13 = v42;
          v40 = (void *)v42[2];
          v42[2] = v39;

          v7 = v43;
          v6 = v44;
        }
      }
      else
      {
        v31 = 0;
      }

    }
    self = v13;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_JSONDictionaryRepresentationForIntent:(id)a3 parameterName:(id)a4
{
  id v6;
  id v7;
  INJSONEncoder *v8;
  INJSONEncoderConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  INIntentResolutionResult *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  id v39;
  id obj;
  void *v41;
  INJSONEncoder *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [INJSONEncoder alloc];
  v9 = objc_alloc_init(INJSONEncoderConfiguration);
  +[INPreferences siriLanguageCode](INPreferences, "siriLanguageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INJSONEncoderConfiguration setLanguageCode:](v9, "setLanguageCode:", v10);

  v42 = -[INJSONEncoder initWithConfiguration:](v8, "initWithConfiguration:", v9);
  objc_msgSend(v6, "_codableDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributeByName:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_intentInstanceDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "slotByName:", v7);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode");
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[INIntentResolutionResult _stringForResultCode:](self, "_stringForResultCode:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "if_setObjectIfNonNil:forKey:", v16, CFSTR("status"));

  if (v14 == 3)
    -[INIntentResolutionResult itemToConfirm](self, "itemToConfirm");
  else
    -[INIntentResolutionResult resolvedValue](self, "resolvedValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[INJSONEncoder encodeObject:withCodableAttribute:](v42, "encodeObject:withCodableAttribute:", v17, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "if_setObjectIfNonNil:forKey:", v18, CFSTR("value"));

  if (-[INIntentResolutionResult unsupportedReason](self, "unsupportedReason"))
  {
    objc_msgSend(v12, "unsupportedReasonWithIndex:", -[INIntentResolutionResult unsupportedReason](self, "unsupportedReason"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "code");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "if_setObjectIfNonNil:forKey:", v20, CFSTR("reason"));

  }
  else
  {
    objc_msgSend(v15, "if_setObjectIfNonNil:forKey:", 0, CFSTR("reason"));
  }
  -[INIntentResolutionResult disambiguationItems](self, "disambiguationItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v37 = v15;
    v38 = v7;
    v39 = v6;
    v22 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[INIntentResolutionResult disambiguationItems](self, "disambiguationItems");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[INIntentResolutionResult disambiguationItems](self, "disambiguationItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          v29 = self;
          if (*(_QWORD *)v44 != v27)
            objc_enumerationMutation(obj);
          v30 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "UUIDString");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "if_setObjectIfNonNil:forKey:", v33, CFSTR("uuid"));

          -[INJSONEncoder encodeObject:withCodableAttribute:](v42, "encodeObject:withCodableAttribute:", v30, v12);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "if_setObjectIfNonNil:forKey:", v34, CFSTR("value"));

          self = v29;
          -[INIntentResolutionResult _vocabularyValueForObject:slotDescription:](v29, "_vocabularyValueForObject:slotDescription:", v30, v41);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "if_setObjectIfNonNil:forKey:", v35, CFSTR("vocabularyValue"));

          objc_msgSend(v24, "addObject:", v31);
        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v26);
    }

    v15 = v37;
    objc_msgSend(v37, "setObject:forKey:", v24, CFSTR("selectionItems"));

    v7 = v38;
    v6 = v39;
  }
  objc_msgSend(v15, "if_setObjectIfNonNil:forKey:", v7, CFSTR("keyPath"), v37);

  return v15;
}

- (NSString)description
{
  return (NSString *)-[INIntentResolutionResult descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INIntentResolutionResult;
  -[INIntentResolutionResult description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResolutionResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_stringForResultCode:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return &stru_1E2295770;
  else
    return off_1E22908F8[a3];
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSArray *disambiguationItems;
  void *v5;
  id resolvedValue;
  void *v7;
  id itemToConfirm;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("resolutionResultCode");
  -[INIntentResolutionResult _stringForResultCode:](self, "_stringForResultCode:", -[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("disambiguationItems");
  disambiguationItems = self->_disambiguationItems;
  v5 = disambiguationItems;
  if (!disambiguationItems)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v5;
  v13[2] = CFSTR("resolvedValue");
  resolvedValue = self->_resolvedValue;
  v7 = resolvedValue;
  if (!resolvedValue)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v7;
  v13[3] = CFSTR("itemToConfirm");
  itemToConfirm = self->_itemToConfirm;
  v9 = itemToConfirm;
  if (!itemToConfirm)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v9;
  v13[4] = CFSTR("unsupportedReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_unsupportedReason);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (itemToConfirm)
  {
    if (resolvedValue)
      goto LABEL_9;
LABEL_12:

    if (disambiguationItems)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!resolvedValue)
    goto LABEL_12;
LABEL_9:
  if (!disambiguationItems)
    goto LABEL_13;
LABEL_10:

  return v11;
}

- (int64_t)resolutionResultCode
{
  return self->_resolutionResultCode;
}

- (void)setResolutionResultCode:(int64_t)a3
{
  self->_resolutionResultCode = a3;
}

- (NSArray)disambiguationItems
{
  return self->_disambiguationItems;
}

- (void)setDisambiguationItems:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationItems, a3);
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void)setAlternatives:(id)a3
{
  objc_storeStrong((id *)&self->_alternatives, a3);
}

- (id)resolvedValue
{
  return self->_resolvedValue;
}

- (void)setResolvedValue:(id)a3
{
  objc_storeStrong(&self->_resolvedValue, a3);
}

- (id)itemToConfirm
{
  return self->_itemToConfirm;
}

- (void)setItemToConfirm:(id)a3
{
  objc_storeStrong(&self->_itemToConfirm, a3);
}

- (unint64_t)unsupportedReason
{
  return self->_unsupportedReason;
}

- (void)setUnsupportedReason:(unint64_t)a3
{
  self->_unsupportedReason = a3;
}

- (unint64_t)confirmationReason
{
  return self->_confirmationReason;
}

- (void)setConfirmationReason:(unint64_t)a3
{
  self->_confirmationReason = a3;
}

- (INIntent)intentToExecute
{
  return self->_intentToExecute;
}

- (void)setIntentToExecute:(id)a3
{
  objc_storeStrong((id *)&self->_intentToExecute, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentToExecute, 0);
  objc_storeStrong(&self->_itemToConfirm, 0);
  objc_storeStrong(&self->_resolvedValue, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_disambiguationItems, 0);
}

uint64_t __61__INIntentResolutionResult_initWithJSONDictionary_forIntent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "code");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __116__INIntentResolutionResult_transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  if (a2
    && (objc_msgSend(*(id *)(a1 + 32), "codableAttribute"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "supportsSearch"),
        v3,
        !v4))
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __116__INIntentResolutionResult_transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke_2;
    v9[3] = &unk_1E2290860;
    v7 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 72);
    v9[4] = v7;
    v8 = *(_QWORD *)(a1 + 56);
    v10 = *(id *)(a1 + 64);
    objc_msgSend(v5, "getParameterOptionsForParameterNamed:intent:searchTerm:completionBlock:", v6, v8, 0, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __116__INIntentResolutionResult_transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    if (*(_QWORD *)(a1 + 48) == 4)
      objc_msgSend(*(id *)(a1 + 32), "setResolutionResultCode:", 2);
    objc_msgSend(*(id *)(a1 + 32), "setDisambiguationItems:", v6);
  }
  else if (v5)
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[INIntentResolutionResult transformResolutionResultForIntent:intentSlotDescription:withOptionsProvider:compl"
           "etion:]_block_invoke_2";
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s Failed updating needsValue to needsDisambiguate for custom object: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (INIntentResolutionResult)needsValue
{
  return (INIntentResolutionResult *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithResultCode:", 4);
}

+ (INIntentResolutionResult)notRequired
{
  return (INIntentResolutionResult *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithResultCode:", 5);
}

+ (INIntentResolutionResult)unsupported
{
  return (INIntentResolutionResult *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithResultCode:", 1);
}

+ (id)resolutionResultSuccessWithResolvedValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4 && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || objc_msgSend(v4, "count")))
  {
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResultCode:", 0);
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "setResolvedValue:", v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)resolutionResultDisambiguationWithItemsToDisambiguate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2
    && (v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResultCode:", 2)) != 0)
  {
    v6 = v5;
    objc_msgSend(v5, "setDisambiguationItems:", v4);
  }
  else if (objc_msgSend(v4, "count") == 1)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResultCode:", 3);
    if (v6)
    {
      objc_msgSend(v4, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setItemToConfirm:", v7);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)resolutionResultConfirmationRequiredWithItemToConfirm:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResultCode:", 3);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setItemToConfirm:", v4);

  return v6;
}

+ (id)resolutionResultUnsupportedWithReason:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResultCode:", 1);
  objc_msgSend(v4, "setUnsupportedReason:", a3);
  return v4;
}

+ (id)resolutionResultUnsupportedWithReason:(unint64_t)a3 alternativeItems:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "resolutionResultUnsupportedWithReason:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlternatives:", v6);

  return v7;
}

+ (id)requiresExecutionOfIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v12[2];

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResultCode:", 6);
  objc_msgSend(v4, "_metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "if_auditToken");
  else
    memset(v12, 0, sizeof(v12));
  objc_msgSend(v7, "if_dataWithAuditToken:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAuditTokenData:", v10);

  objc_msgSend(v5, "setIntentToExecute:", v4);
  return v5;
}

+ (id)_dataForResolutionMethodUnimplemented
{
  _INPBIntentSlotResolutionResult *v2;
  void *v3;

  v2 = objc_alloc_init(_INPBIntentSlotResolutionResult);
  -[_INPBIntentSlotResolutionResult setType:](v2, "setType:", 9);
  -[_INPBIntentSlotResolutionResult data](v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_resolutionResultWithData:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  _INPBIntentSlotResolutionMulticardinalResult *v7;
  _INPBIntentSlotResolutionResult *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = -[_INPBIntentSlotResolutionMulticardinalResult initWithData:]([_INPBIntentSlotResolutionMulticardinalResult alloc], "initWithData:", v5);
  if (-[_INPBIntentSlotResolutionMulticardinalResult resolutionResultsCount](v7, "resolutionResultsCount"))
  {
    v8 = (_INPBIntentSlotResolutionResult *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[_INPBIntentSlotResolutionMulticardinalResult resolutionResultsCount](v7, "resolutionResultsCount"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[_INPBIntentSlotResolutionMulticardinalResult resolutionResults](v7, "resolutionResults", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithIntentSlotResolutionResult:slotDescription:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), v6);
          __70__INIntentResolutionResult__resolutionResultWithData_slotDescription___block_invoke(v14);
          -[_INPBIntentSlotResolutionResult addObject:](v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    v15 = (void *)-[_INPBIntentSlotResolutionResult copy](v8, "copy");
  }
  else
  {
    v8 = -[_INPBIntentSlotResolutionResult initWithData:]([_INPBIntentSlotResolutionResult alloc], "initWithData:", v5);
    v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithIntentSlotResolutionResult:slotDescription:", v8, v6);
    __70__INIntentResolutionResult__resolutionResultWithData_slotDescription___block_invoke(v15);
  }

  return v15;
}

void __70__INIntentResolutionResult__resolutionResultWithData_slotDescription___block_invoke(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "resolvedValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "itemToConfirm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "disambiguationItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "alternatives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setResolvedValue:", v6);

  }
  else
  {
    objc_msgSend(v1, "setResolvedValue:", v2);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setItemToConfirm:", v7);

  }
  else
  {
    objc_msgSend(v1, "setItemToConfirm:", v3);
  }
  v24 = v5;
  v25 = v4;
  if (v4)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "firstObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
          else
          {
            objc_msgSend(v8, "addObject:", v14);
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v11);
    }

    objc_msgSend(v1, "setDisambiguationItems:", v8);
    v5 = v24;
    v4 = v25;
  }
  if (v5)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v5;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v21);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v22, "firstObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v23);

          }
          else
          {
            objc_msgSend(v16, "addObject:", v22);
          }
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v19);
    }

    objc_msgSend(v1, "setAlternatives:", v16);
    v5 = v24;
    v4 = v25;
  }

}

@end
