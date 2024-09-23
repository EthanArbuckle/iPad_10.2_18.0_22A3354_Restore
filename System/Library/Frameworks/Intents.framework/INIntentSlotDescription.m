@implementation INIntentSlotDescription

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSArray **v5;
  NSString *name;
  NSString *facadePropertyName;
  NSString *dataPropertyName;
  NSArray *resolveSelectorStrings;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NSArray **)v4;
    name = self->_name;
    v10 = 0;
    if ((name == (NSString *)v5[3] || -[NSString isEqualToString:](name, "isEqualToString:"))
      && (NSArray *)self->_tag == v5[4])
    {
      facadePropertyName = self->_facadePropertyName;
      if (facadePropertyName == (NSString *)v5[5]
        || -[NSString isEqualToString:](facadePropertyName, "isEqualToString:"))
      {
        dataPropertyName = self->_dataPropertyName;
        if ((dataPropertyName == (NSString *)v5[6] || -[NSString isEqualToString:](dataPropertyName, "isEqualToString:"))&& (NSArray *)self->_valueType == v5[7]&& (NSArray *)self->_valueStyle == v5[8]&& self->_isExtended == *((unsigned __int8 *)v5 + 8)&& self->_isPrivate == *((unsigned __int8 *)v5 + 9))
        {
          resolveSelectorStrings = self->_resolveSelectorStrings;
          if (resolveSelectorStrings == v5[9] || -[NSArray isEqualToArray:](resolveSelectorStrings, "isEqualToArray:"))
            v10 = 1;
        }
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setRank:(id)a3
{
  objc_storeStrong((id *)&self->_rank, a3);
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)rank
{
  return self->_rank;
}

- (INIntentSlotDescription)initWithName:(id)a3 tag:(unint64_t)a4 facadePropertyName:(id)a5 dataPropertyName:(id)a6 isExtended:(BOOL)a7 isPrivate:(BOOL)a8 valueType:(int64_t)a9 valueStyle:(int64_t)a10 defaultValueSelectorStrings:(id)a11 provideOptionsSelectorStrings:(id)a12 resolutionResultClass:(Class)a13 resolveSelectors:(SEL)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  INIntentSlotDescription *v25;
  const char *v26;
  uint64_t v27;
  NSString *name;
  uint64_t v29;
  NSString *facadePropertyName;
  uint64_t v31;
  NSString *dataPropertyName;
  NSArray *v33;
  void *v34;
  const char **v35;
  NSArray *resolveSelectorStrings;
  NSArray *v37;
  uint64_t v38;
  NSArray *provideOptionsSelectorStrings;
  uint64_t v40;
  NSArray *defaultValueSelectorStrings;
  id v43;
  const char **v44;
  objc_super v45;
  uint64_t v46;

  v20 = a3;
  v21 = a5;
  v22 = a6;
  v23 = a11;
  v24 = a12;
  v45.receiver = self;
  v45.super_class = (Class)INIntentSlotDescription;
  v25 = -[INIntentSlotDescription init](&v45, sel_init);
  if (v25)
  {
    v26 = a14;
    v43 = v20;
    v27 = objc_msgSend(v20, "copy");
    name = v25->_name;
    v25->_name = (NSString *)v27;

    v25->_tag = a4;
    v29 = objc_msgSend(v21, "copy");
    facadePropertyName = v25->_facadePropertyName;
    v25->_facadePropertyName = (NSString *)v29;

    v31 = objc_msgSend(v22, "copy");
    dataPropertyName = v25->_dataPropertyName;
    v25->_dataPropertyName = (NSString *)v31;

    v25->_valueType = a9;
    v25->_valueStyle = a10;
    v25->_isExtended = a7;
    v25->_isPrivate = a8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v44 = (const char **)&v46;
    if (a14)
    {
      do
      {
        NSStringFromSelector(v26);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v33, "addObject:", v34);

        v35 = v44++;
        v26 = *v35;
      }
      while (*v35);
    }
    resolveSelectorStrings = v25->_resolveSelectorStrings;
    v25->_resolveSelectorStrings = v33;
    v37 = v33;

    objc_storeStrong((id *)&v25->_resolutionResultClass, a13);
    v38 = objc_msgSend(v24, "copy");
    provideOptionsSelectorStrings = v25->_provideOptionsSelectorStrings;
    v25->_provideOptionsSelectorStrings = (NSArray *)v38;

    v40 = objc_msgSend(v23, "copy");
    defaultValueSelectorStrings = v25->_defaultValueSelectorStrings;
    v25->_defaultValueSelectorStrings = (NSArray *)v40;

    v20 = v43;
  }

  return v25;
}

- (void)setValue:(id)a3 forSlotComposer:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "intentSlotDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", self);

  if (v8)
  {
    -[INIntentSlotDescription facadePropertyName](self, "facadePropertyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v10, v9);

  }
}

- (id)valueForSlotComposer:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "intentSlotDescriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", self);

  if (v6)
  {
    -[INIntentSlotDescription facadePropertyName](self, "facadePropertyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)facadePropertyName
{
  return self->_facadePropertyName;
}

- (BOOL)isEnum
{
  uint64_t v3;
  char isKindOfClass;
  void *v6;

  v3 = -[INIntentSlotDescription valueType](self, "valueType");
  isKindOfClass = 1;
  if (v3 > 171)
  {
    if (((unint64_t)(v3 - 172) > 0x1F || ((1 << (v3 + 84)) & 0x800D1A61) == 0)
      && ((unint64_t)(v3 - 234) > 7 || ((1 << (v3 + 22)) & 0x87) == 0))
    {
LABEL_10:
      -[INIntentSlotDescription codableAttribute](self, "codableAttribute");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

    }
  }
  else
  {
    switch(v3)
    {
      case 57:
      case 58:
      case 63:
      case 64:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 84:
      case 85:
      case 88:
      case 90:
      case 91:
      case 95:
      case 96:
      case 97:
      case 98:
      case 114:
      case 115:
      case 116:
      case 118:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 136:
      case 140:
      case 141:
      case 143:
      case 149:
      case 155:
      case 156:
      case 158:
      case 161:
        return isKindOfClass & 1;
      case 59:
      case 60:
      case 61:
      case 62:
      case 65:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 86:
      case 87:
      case 89:
      case 92:
      case 93:
      case 94:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 117:
      case 119:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 137:
      case 138:
      case 139:
      case 142:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 157:
      case 159:
      case 160:
        goto LABEL_10;
      default:
        if (v3 != 1)
          goto LABEL_10;
        break;
    }
  }
  return isKindOfClass & 1;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (INCodableAttribute)codableAttribute
{
  return self->_codableAttribute;
}

- (INIntentSlotDescription)initWithName:(id)a3 tag:(unint64_t)a4 facadePropertyName:(id)a5 dataPropertyName:(id)a6 isExtended:(BOOL)a7 isPrivate:(BOOL)a8 valueType:(int64_t)a9 valueStyle:(int64_t)a10 codableAttribute:(id)a11 defaultValueSelectorStrings:(id)a12 provideOptionsSelectorStrings:(id)a13 resolutionResultClass:(Class)a14 resolveSelectors:(SEL)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  INIntentSlotDescription *v26;
  const char *v27;
  uint64_t v28;
  NSString *name;
  uint64_t v30;
  NSString *facadePropertyName;
  uint64_t v32;
  NSString *dataPropertyName;
  void *v34;
  void *v35;
  const char **v36;
  uint64_t v37;
  NSArray *resolveSelectorStrings;
  uint64_t v39;
  NSArray *provideOptionsSelectorStrings;
  uint64_t v41;
  NSArray *defaultValueSelectorStrings;
  id v44;
  const char **v46;
  objc_super v47;
  uint64_t v48;

  v20 = a3;
  v21 = a5;
  v22 = a6;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v47.receiver = self;
  v47.super_class = (Class)INIntentSlotDescription;
  v26 = -[INIntentSlotDescription init](&v47, sel_init);
  if (v26)
  {
    v44 = v23;
    v27 = a15;
    v28 = objc_msgSend(v20, "copy");
    name = v26->_name;
    v26->_name = (NSString *)v28;

    v26->_tag = a4;
    v30 = objc_msgSend(v21, "copy");
    facadePropertyName = v26->_facadePropertyName;
    v26->_facadePropertyName = (NSString *)v30;

    v32 = objc_msgSend(v22, "copy");
    dataPropertyName = v26->_dataPropertyName;
    v26->_dataPropertyName = (NSString *)v32;

    v26->_valueType = a9;
    v26->_valueStyle = a10;
    v26->_isExtended = a7;
    v26->_isPrivate = a8;
    objc_storeStrong((id *)&v26->_codableAttribute, a11);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (const char **)&v48;
    if (a15)
    {
      do
      {
        NSStringFromSelector(v27);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v35);

        v36 = v46++;
        v27 = *v36;
      }
      while (*v36);
    }
    v37 = objc_msgSend(v34, "copy");
    resolveSelectorStrings = v26->_resolveSelectorStrings;
    v26->_resolveSelectorStrings = (NSArray *)v37;

    v39 = objc_msgSend(v25, "copy");
    provideOptionsSelectorStrings = v26->_provideOptionsSelectorStrings;
    v26->_provideOptionsSelectorStrings = (NSArray *)v39;

    v41 = objc_msgSend(v24, "copy");
    defaultValueSelectorStrings = v26->_defaultValueSelectorStrings;
    v26->_defaultValueSelectorStrings = (NSArray *)v41;

    objc_storeStrong((id *)&v26->_resolutionResultClass, a14);
    v23 = v44;
  }

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rank, 0);
  objc_storeStrong((id *)&self->_codableAttribute, 0);
  objc_storeStrong((id *)&self->_defaultValueSelectorStrings, 0);
  objc_storeStrong((id *)&self->_provideOptionsSelectorStrings, 0);
  objc_storeStrong((id *)&self->_resolveSelectorStrings, 0);
  objc_storeStrong((id *)&self->_dataPropertyName, 0);
  objc_storeStrong((id *)&self->_facadePropertyName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_resolutionResultClass, 0);
}

- (id)localizeValue:(id)a3 forLanguage:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentSlotDescription localizeValue:withLocalizer:](self, "localizeValue:withLocalizer:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizeValue:(id)a3 withLocalizer:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  const __CFAllocator *v15;
  void *v16;
  const __CFDictionary *ComponentsFromLocaleIdentifier;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = -[INIntentSlotDescription valueType](self, "valueType");
  if (v8 > 171)
  {
    switch(v8)
    {
      case 172:
        INWellnessObjectTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 173:
      case 174:
      case 175:
      case 176:
      case 179:
      case 180:
      case 182:
      case 185:
      case 186:
      case 187:
      case 189:
LABEL_15:
        objc_msgSend(v6, "_intents_readableTitleWithLocalizer:", v7);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 177:
        INWellnessQuestionTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 178:
        INWellnessQueryResultTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 181:
        INAlarmRepeatScheduleOptionsGetLocalizedNames(objc_msgSend(v6, "unsignedIntegerValue"), v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_62:
        v12 = v22;
        objc_msgSend(v22, "_intents_readableTitleWithLocalizer:", v7);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_63;
      case 183:
        INUpdateAlarmOperationGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 184:
        INChangeAlarmStatusOperationGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 188:
        INAlarmSearchTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 190:
        INTimerStateGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 191:
        INTimerTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        switch(v8)
        {
          case 234:
            INBinarySettingValueGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
            v9 = objc_claimAutoreleasedReturnValue();
            break;
          case 235:
            INBoundedSettingValueGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
            v9 = objc_claimAutoreleasedReturnValue();
            break;
          case 236:
            INSettingActionGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
            v9 = objc_claimAutoreleasedReturnValue();
            break;
          case 237:
          case 238:
          case 239:
          case 240:
            goto LABEL_15;
          case 241:
            INEventAttributeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
            v9 = objc_claimAutoreleasedReturnValue();
            break;
          default:
            if (v8 != 203)
              goto LABEL_15;
            INDeviceIdiomGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
            v9 = objc_claimAutoreleasedReturnValue();
            break;
        }
        break;
    }
LABEL_72:
    v23 = (void *)v9;
  }
  else
  {
    switch(v8)
    {
      case 57:
        INBillTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 58:
        INPaymentStatusGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 59:
      case 60:
      case 61:
      case 62:
      case 65:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 86:
      case 87:
      case 89:
      case 92:
      case 93:
      case 94:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 117:
      case 119:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 137:
      case 138:
      case 139:
      case 142:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 157:
      case 159:
      case 160:
        goto LABEL_15;
      case 63:
        INAccountTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 64:
        INBalanceTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 66:
        INAudioCallTTYTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 67:
        INCallAudioRouteGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 68:
        INCallCapabilityOptionsGetLocalizedNames(objc_msgSend(v6, "unsignedIntegerValue"), v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      case 69:
        INCallCapabilityGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 70:
        INCallDestinationTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 71:
        INCallRecordTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 72:
        INCallRecordTypeOptionsGetLocalizedNames(objc_msgSend(v6, "unsignedIntegerValue"), v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      case 73:
        INPreferredCallProviderGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 84:
        INMessageAttributeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 85:
        INMessageAttributeOptionsGetLocalizedNames(objc_msgSend(v6, "unsignedIntegerValue"), v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      case 88:
        INMessageEffectTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 90:
        INOutgoingMessageTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 91:
        INMessageSoundTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 95:
        INAnnouncementSoundTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 96:
        INReadActionTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 97:
        INUserNotificationTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 98:
        INPhotoAttributeOptionsGetLocalizedNames(objc_msgSend(v6, "unsignedIntegerValue"), v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      case 114:
        INVisualCodeTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 115:
        INWorkoutGoalUnitTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 116:
        INWorkoutLocationTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 118:
        INWorkoutSequenceLabelGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 120:
        INCarAirCirculationModeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 121:
        INCarAudioSourceGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 122:
        INCarDefrosterGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 123:
        INCarSeatGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 124:
        INRelativeReferenceGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 125:
        INRelativeSettingGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 126:
        INDateSearchTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 127:
        INLocationSearchTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 128:
        INTaskStatusGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 129:
        INNotebookItemTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 136:
        INTaskReferenceGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 140:
        INTemporalEventTriggerTypeOptionsGetLocalizedNames(objc_msgSend(v6, "unsignedIntegerValue"), v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      case 141:
        INTaskPriorityGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 143:
        INCarSignalOptionsGetLocalizedNames(objc_msgSend(v6, "unsignedIntegerValue"), v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      case 149:
        INRadioTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 155:
        INPlaybackRepeatModeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 156:
        INPlaybackQueueLocationGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 158:
        INMediaAffinityTypeGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      case 161:
        INParsecCategoryGetLocalizedName(objc_msgSend(v6, "integerValue"), v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      default:
        if (v8 != 3)
          goto LABEL_15;
        -[INIntentSlotDescription name](self, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("duration"));

        if (!v11)
          goto LABEL_15;
        v12 = objc_alloc_init(MEMORY[0x1E0CB3570]);
        objc_msgSend(v7, "languageCode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          objc_msgSend(v14, "locale");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(v15, (CFLocaleIdentifier)objc_msgSend(v16, "localeIdentifier"));

          CFDictionaryGetValue(ComponentsFromLocaleIdentifier, CFSTR("numbers"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          CFRelease(ComponentsFromLocaleIdentifier);
          v19 = (void *)MEMORY[0x1E0C99DC8];
          if (v18)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@numbers=%@"), v13, v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "localeWithLocaleIdentifier:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setLocale:", v21);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v13);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setLocale:", v20);
          }

          objc_msgSend(v12, "setCalendar:", v14);
        }
        objc_msgSend(v12, "setUnitsStyle:", 3);
        objc_msgSend(v12, "setAllowedUnits:", 224);
        objc_msgSend(v6, "doubleValue");
        objc_msgSend(v12, "stringFromTimeInterval:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        break;
    }
LABEL_63:

  }
  return v23;
}

- (INIntentSlotDescription)initWithName:(id)a3 tag:(unint64_t)a4 facadePropertyName:(id)a5 dataPropertyName:(id)a6 valueType:(int64_t)a7 valueStyle:(int64_t)a8 isExtended:(BOOL)a9 isPrivate:(BOOL)a10 resolveSelectors:(SEL)a11
{
  id v17;
  id v18;
  id v19;
  INIntentSlotDescription *v20;
  const char *v21;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  NSString *facadePropertyName;
  uint64_t v26;
  NSString *dataPropertyName;
  NSArray *v28;
  void *v29;
  const char **v30;
  NSArray *resolveSelectorStrings;
  const char **v33;
  objc_super v34;
  uint64_t v35;

  v17 = a3;
  v18 = a5;
  v19 = a6;
  v34.receiver = self;
  v34.super_class = (Class)INIntentSlotDescription;
  v20 = -[INIntentSlotDescription init](&v34, sel_init);
  if (v20)
  {
    v21 = a11;
    v22 = objc_msgSend(v17, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v22;

    v20->_tag = a4;
    v24 = objc_msgSend(v18, "copy");
    facadePropertyName = v20->_facadePropertyName;
    v20->_facadePropertyName = (NSString *)v24;

    v26 = objc_msgSend(v19, "copy");
    dataPropertyName = v20->_dataPropertyName;
    v20->_dataPropertyName = (NSString *)v26;

    v20->_valueType = a7;
    v20->_valueStyle = a8;
    v20->_isExtended = a9;
    v20->_isPrivate = a10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v33 = (const char **)&v35;
    if (a11)
    {
      do
      {
        NSStringFromSelector(v21);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v28, "addObject:", v29);

        v30 = v33++;
        v21 = *v30;
      }
      while (*v30);
    }
    resolveSelectorStrings = v20->_resolveSelectorStrings;
    v20->_resolveSelectorStrings = v28;

  }
  return v20;
}

- (SEL)resolveSelector
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *v6;
  const char *v7;

  -[INIntentSlotDescription resolveSelectorStrings](self, "resolveSelectorStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[INIntentSlotDescription resolveSelectorStrings](self, "resolveSelectorStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = NSSelectorFromString(v6);

  return v7;
}

- (SEL)deprecatedResolveSelector
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSString *v7;
  const char *v8;

  -[INIntentSlotDescription resolveSelectorStrings](self, "resolveSelectorStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[INIntentSlotDescription resolveSelectorStrings](self, "resolveSelectorStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentSlotDescription resolveSelectorStrings](self, "resolveSelectorStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v6, "count") - 1);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = NSSelectorFromString(v7);

  return v8;
}

- (Class)resolutionResultClass
{
  void *resolutionResultClass;

  resolutionResultClass = self->_resolutionResultClass;
  if (!resolutionResultClass)
    resolutionResultClass = (void *)objc_opt_class();
  return (Class)resolutionResultClass;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = self->_tag ^ -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_facadePropertyName, "hash");
  v5 = v3 ^ v4 ^ -[NSString hash](self->_dataPropertyName, "hash") ^ self->_valueType ^ self->_valueStyle ^ self->_isExtended ^ self->_isPrivate;
  return v5 ^ -[NSArray hash](self->_resolveSelectorStrings, "hash");
}

- (unint64_t)tag
{
  return self->_tag;
}

- (NSString)dataPropertyName
{
  return self->_dataPropertyName;
}

- (int64_t)valueStyle
{
  return self->_valueStyle;
}

- (BOOL)isExtended
{
  return self->_isExtended;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (NSArray)resolveSelectorStrings
{
  return self->_resolveSelectorStrings;
}

- (NSArray)provideOptionsSelectorStrings
{
  return self->_provideOptionsSelectorStrings;
}

- (NSArray)defaultValueSelectorStrings
{
  return self->_defaultValueSelectorStrings;
}

@end
