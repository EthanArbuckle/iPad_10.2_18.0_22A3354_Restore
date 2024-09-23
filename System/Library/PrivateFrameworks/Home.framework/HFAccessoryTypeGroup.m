@implementation HFAccessoryTypeGroup

+ (id)otherAccessoryTypeGroup
{
  if (qword_1ED3788A0 != -1)
    dispatch_once(&qword_1ED3788A0, &__block_literal_global_152);
  return (id)qword_1ED3788A8;
}

+ (id)lightAccessoryTypeGroup
{
  if (qword_1ED378830 != -1)
    dispatch_once(&qword_1ED378830, &__block_literal_global_115_0);
  return (id)qword_1ED378838;
}

+ (id)switchAccessoryTypeGroup
{
  if (qword_1ED378890 != -1)
    dispatch_once(&qword_1ED378890, &__block_literal_global_146);
  return (id)qword_1ED378898;
}

+ (id)outletAccessoryTypeGroup
{
  if (qword_1ED378870 != -1)
    dispatch_once(&qword_1ED378870, &__block_literal_global_138);
  return (id)qword_1ED378878;
}

- (BOOL)containsType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HFAccessoryTypeGroup types](self, "types");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "na_safeContainsObject:", v4);

  return v6;
}

- (NSSet)types
{
  return self->_types;
}

+ (id)energyAccessoryTypeGroup
{
  if (qword_1ED378820 != -1)
    dispatch_once(&qword_1ED378820, &__block_literal_global_111);
  return (id)qword_1ED378828;
}

+ (id)climateAccessoryTypeGroup
{
  if (qword_1ED378810 != -1)
    dispatch_once(&qword_1ED378810, &__block_literal_global_103_1);
  return (id)qword_1ED378818;
}

+ (id)mediaAccessoryTypeGroup
{
  if (qword_1ED378840 != -1)
    dispatch_once(&qword_1ED378840, &__block_literal_global_125);
  return (id)qword_1ED378848;
}

+ (id)securityAccessoryTypeGroup
{
  if (qword_1ED378850 != -1)
    dispatch_once(&qword_1ED378850, &__block_literal_global_129_0);
  return (id)qword_1ED378858;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__fullName, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

+ (void)warmUp
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = (id)objc_msgSend(a1, "climateAccessoryTypeGroup");
  v4 = (id)objc_msgSend(a1, "energyAccessoryTypeGroup");
  v5 = (id)objc_msgSend(a1, "lightAccessoryTypeGroup");
  v6 = (id)objc_msgSend(a1, "mediaAccessoryTypeGroup");
  v7 = (id)objc_msgSend(a1, "securityAccessoryTypeGroup");
  v8 = (id)objc_msgSend(a1, "waterAccessoryTypeGroup");
  v9 = (id)objc_msgSend(a1, "hiddenFromScenesAndAutomationsAccessoryTypeGroup");
  v10 = (id)objc_msgSend(a1, "sensorAccessoryTypeGroup");
  v11 = (id)objc_msgSend(a1, "otherAccessoryTypeGroup");
}

+ (id)sensorAccessoryTypeGroup
{
  if (qword_1ED378880 != -1)
    dispatch_once(&qword_1ED378880, &__block_literal_global_142);
  return (id)qword_1ED378888;
}

+ (id)hiddenFromScenesAndAutomationsAccessoryTypeGroup
{
  if (qword_1ED3788F0 != -1)
    dispatch_once(&qword_1ED3788F0, &__block_literal_global_165);
  return (id)qword_1ED3788F8;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

+ (id)waterAccessoryTypeGroup
{
  if (qword_1ED378860 != -1)
    dispatch_once(&qword_1ED378860, &__block_literal_global_134);
  return (id)qword_1ED378868;
}

void __47__HFAccessoryTypeGroup_mediaAccessoryTypeGroup__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HFAccessoryTypeGroup *v12;
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  v12 = [HFAccessoryTypeGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryTypeGroupNameSpeakersAndTVs"), CFSTR("HFAccessoryTypeGroupNameSpeakersAndTVs"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", *MEMORY[0x1E0CB7A08]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", *MEMORY[0x1E0CB7A18]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v2;
  +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", *MEMORY[0x1E0CB7A20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v3;
  +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", *MEMORY[0x1E0CB7A58]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v4;
  +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", *MEMORY[0x1E0CB7AC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v5;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9AC0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v6;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9AF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v7;
  +[HFAccessoryType mediaSystemType](HFAccessoryType, "mediaSystemType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFAccessoryTypeGroup _initWithIdentifierString:name:accessoryTypes:](v12, "_initWithIdentifierString:name:accessoryTypes:", CFSTR("7A5BD1AB-6478-4560-AD68-D91053B75F44"), v0, v9);
  v11 = (void *)qword_1ED378848;
  qword_1ED378848 = v10;

}

void __47__HFAccessoryTypeGroup_waterAccessoryTypeGroup__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HFAccessoryTypeGroup *v13;
  _QWORD v14[9];

  v14[8] = *MEMORY[0x1E0C80C00];
  v13 = [HFAccessoryTypeGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryTypeGroupNameWater"), CFSTR("HFAccessoryTypeGroupNameWater"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A18]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v1;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A50]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v2;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v3;
  v4 = *MEMORY[0x1E0CB9B08];
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9B08]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v5;
  +[HFAccessoryType serviceType:subtype:](HFAccessoryType, "serviceType:subtype:", v4, *MEMORY[0x1E0CB9970]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v6;
  +[HFAccessoryType serviceType:subtype:](HFAccessoryType, "serviceType:subtype:", v4, *MEMORY[0x1E0CB9978]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v7;
  +[HFAccessoryType serviceType:subtype:](HFAccessoryType, "serviceType:subtype:", v4, *MEMORY[0x1E0CB9980]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v8;
  +[HFAccessoryType serviceType:subtype:](HFAccessoryType, "serviceType:subtype:", v4, *MEMORY[0x1E0CB9990]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HFAccessoryTypeGroup _initWithIdentifierString:name:accessoryTypes:](v13, "_initWithIdentifierString:name:accessoryTypes:", CFSTR("3E68745D-F0E1-4B73-8FBD-0E8978A33403"), v0, v10);
  v12 = (void *)qword_1ED378868;
  qword_1ED378868 = v11;

}

void __72__HFAccessoryTypeGroup_hiddenFromScenesAndAutomationsAccessoryTypeGroup__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HFAccessoryTypeGroup *v14;
  void *v15;
  void *v16;
  _QWORD v17[11];

  v17[10] = *MEMORY[0x1E0C80C00];
  v14 = [HFAccessoryTypeGroup alloc];
  v0 = (void *)MEMORY[0x1E0C99E60];
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A18]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v16;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A50]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v15;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A60]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v1;
  v2 = *MEMORY[0x1E0CB9B08];
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9B08]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v3;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9B18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v4;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9B20]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v5;
  +[HFAccessoryType serviceType:subtype:](HFAccessoryType, "serviceType:subtype:", v2, *MEMORY[0x1E0CB9970]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v6;
  +[HFAccessoryType serviceType:subtype:](HFAccessoryType, "serviceType:subtype:", v2, *MEMORY[0x1E0CB9978]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v7;
  +[HFAccessoryType serviceType:subtype:](HFAccessoryType, "serviceType:subtype:", v2, *MEMORY[0x1E0CB9980]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v8;
  +[HFAccessoryType serviceType:subtype:](HFAccessoryType, "serviceType:subtype:", v2, *MEMORY[0x1E0CB9990]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HFAccessoryTypeGroup _initWithName:set:](v14, "_initWithName:set:", 0, v11);
  v13 = (void *)qword_1ED3788F8;
  qword_1ED3788F8 = v12;

}

void __49__HFAccessoryTypeGroup_climateAccessoryTypeGroup__block_invoke_2()
{
  HFAccessoryTypeGroup *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[13];

  v17[12] = *MEMORY[0x1E0C80C00];
  v0 = [HFAccessoryTypeGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryTypeGroupNameClimate"), CFSTR("HFAccessoryTypeGroupNameClimate"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", CFSTR("9D302CDA-1467-4E19-ABC9-9ED36BE34508"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v16;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB99A8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v15;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB99B0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v14;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A10]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v13;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A30]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v1;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A38]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v2;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v3;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9AF8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v4;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9B00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v5;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9B10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v6;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9B30]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[10] = v7;
  +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_1EA7CB8F0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[11] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFAccessoryTypeGroup _initWithIdentifierString:name:accessoryTypes:](v0, "_initWithIdentifierString:name:accessoryTypes:", CFSTR("0CA6536B-8EAD-4013-AA62-01754F256DD5"), v12, v9);
  v11 = (void *)qword_1ED378818;
  qword_1ED378818 = v10;

}

void __48__HFAccessoryTypeGroup_sensorAccessoryTypeGroup__block_invoke_2()
{
  HFAccessoryTypeGroup *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[13];

  v17[12] = *MEMORY[0x1E0C80C00];
  v0 = [HFAccessoryTypeGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryTypeGroupNameSensors"), CFSTR("HFAccessoryTypeGroupNameSensors"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", *MEMORY[0x1E0CB7A98]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v16;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A60]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v15;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A68]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v14;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9AB8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v13;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A90]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v1;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB99F0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v2;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v3;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v4;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9AF8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v5;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB99B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v6;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB99E0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[10] = v7;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB99E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[11] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFAccessoryTypeGroup _initWithIdentifierString:name:accessoryTypes:](v0, "_initWithIdentifierString:name:accessoryTypes:", CFSTR("63489665-5E39-4C17-A590-755E1AAC02AE"), v12, v9);
  v11 = (void *)qword_1ED378888;
  qword_1ED378888 = v10;

}

void __50__HFAccessoryTypeGroup_securityAccessoryTypeGroup__block_invoke_2()
{
  HFAccessoryTypeGroup *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[16];

  v19[14] = *MEMORY[0x1E0C80C00];
  v0 = [HFAccessoryTypeGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryTypeGroupNameSecurity"), CFSTR("HFAccessoryTypeGroupNameSecurity"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", *MEMORY[0x1E0CB7A60]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v18;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB99E0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB99E8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v16;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB99F0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v15;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A00]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v14;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A28]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v12;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A80]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v1;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A78]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v2;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v3;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v4;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9AA8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v5;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9AB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v6;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9B28]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v7;
  +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_1EA7CB968);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[13] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFAccessoryTypeGroup _initWithIdentifierString:name:accessoryTypes:](v0, "_initWithIdentifierString:name:accessoryTypes:", CFSTR("430C9F25-44E0-4F7E-BE63-1D00B1500545"), v13, v9);
  v11 = (void *)qword_1ED378858;
  qword_1ED378858 = v10;

}

+ (id)unionGroups:(id)a3
{
  id v3;
  HFAccessoryTypeGroup *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  HFAccessoryTypeGroup *v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  v4 = [HFAccessoryTypeGroup alloc];
  v13 = -[HFAccessoryTypeGroup initWithAccessoryTypes:](v4, "initWithAccessoryTypes:", MEMORY[0x1E0C9AA60]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__HFAccessoryTypeGroup_unionGroups___block_invoke;
  v7[3] = &unk_1EA729940;
  v7[4] = &v8;
  objc_msgSend(v3, "na_each:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (HFAccessoryTypeGroup)initWithAccessoryTypes:(id)a3
{
  return -[HFAccessoryTypeGroup initWithName:accessoryTypes:](self, "initWithName:accessoryTypes:", 0, a3);
}

void __36__HFAccessoryTypeGroup_unionGroups___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "groupByUnioningGroup:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_initWithIdentifierString:(id)a3 name:(id)a4 accessoryTypes:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v8 = (objc_class *)MEMORY[0x1E0CB3A28];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithUUIDString:", v11);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HFAccessoryTypeGroup _initWithIdentifier:name:set:](self, "_initWithIdentifier:name:set:", v12, v10, v13);
  return v14;
}

- (id)groupByUnioningGroup:(id)a3
{
  id v4;
  HFAccessoryTypeGroup *v5;
  void *v6;
  void *v7;
  void *v8;
  HFAccessoryTypeGroup *v9;

  if (a3)
  {
    v4 = a3;
    v5 = [HFAccessoryTypeGroup alloc];
    -[HFAccessoryTypeGroup types](self, "types");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "types");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setByAddingObjectsFromSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HFAccessoryTypeGroup _initWithName:set:](v5, "_initWithName:set:", 0, v8);

  }
  else
  {
    v9 = self;
  }
  return v9;
}

- (HFAccessoryTypeGroup)initWithName:(id)a3 accessoryTypes:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  HFAccessoryTypeGroup *v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend(v6, "setWithArray:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFAccessoryTypeGroup _initWithName:set:](self, "_initWithName:set:", v7, v8);

  return v9;
}

- (id)_initWithName:(id)a3 set:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFAccessoryTypeGroup _initWithIdentifier:name:set:](self, "_initWithIdentifier:name:set:", v9, v8, v7);

  return v10;
}

- (id)_initWithIdentifier:(id)a3 name:(id)a4 set:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFAccessoryTypeGroup *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFAccessoryTypeGroup;
  v12 = -[HFAccessoryTypeGroup init](&v15, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uniqueIdentifier, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

void __48__HFAccessoryTypeGroup_energyAccessoryTypeGroup__block_invoke_2()
{
  HFAccessoryTypeGroup *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [HFAccessoryTypeGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryTypeGroupNameEnergy"), CFSTR("HFAccessoryTypeGroupNameEnergy"), 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[HFAccessoryTypeGroup _initWithIdentifierString:name:accessoryTypes:](v0, "_initWithIdentifierString:name:accessoryTypes:", CFSTR("b92aceee-dff5-4773-a058-c5e64bc487b2"), v3, MEMORY[0x1E0C9AA60]);
  v2 = (void *)qword_1ED378828;
  qword_1ED378828 = v1;

}

void __47__HFAccessoryTypeGroup_otherAccessoryTypeGroup__block_invoke_2()
{
  HFAccessoryTypeGroup *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [HFAccessoryTypeGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryTypeGroupNameOther"), CFSTR("HFAccessoryTypeGroupNameOther"), 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[HFAccessoryTypeGroup _initWithIdentifierString:name:accessoryTypes:](v0, "_initWithIdentifierString:name:accessoryTypes:", CFSTR("7FADD792-61A4-4340-A849-215882E2F008"), v3, MEMORY[0x1E0C9AA60]);
  v2 = (void *)qword_1ED3788A8;
  qword_1ED3788A8 = v1;

}

void __47__HFAccessoryTypeGroup_lightAccessoryTypeGroup__block_invoke_2()
{
  HFAccessoryTypeGroup *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v0 = [HFAccessoryTypeGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryTypeGroupNameLights"), CFSTR("HFAccessoryTypeGroupNameLights"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9A70]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_1EA7CB908, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_1EA7CB920);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_1EA7CB938);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_1EA7CB950);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFAccessoryTypeGroup _initWithIdentifierString:name:accessoryTypes:](v0, "_initWithIdentifierString:name:accessoryTypes:", CFSTR("563F7D20-6AFC-44CE-986D-63B28F62C9E3"), v1, v7);

  v9 = (void *)qword_1ED378838;
  qword_1ED378838 = v8;

}

void __48__HFAccessoryTypeGroup_switchAccessoryTypeGroup__block_invoke_2()
{
  HFAccessoryTypeGroup *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v0 = [HFAccessoryTypeGroup alloc];
  v1 = (void *)MEMORY[0x1E0C99E60];
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9AD8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_1EA7CB9B0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_1EA7CB9C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_1EA7CB9E0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_1EA7CB9F8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFAccessoryTypeGroup _initWithName:set:](v0, "_initWithName:set:", 0, v8);
  v10 = (void *)qword_1ED378898;
  qword_1ED378898 = v9;

}

void __48__HFAccessoryTypeGroup_outletAccessoryTypeGroup__block_invoke_2()
{
  HFAccessoryTypeGroup *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v0 = [HFAccessoryTypeGroup alloc];
  v1 = (void *)MEMORY[0x1E0C99E60];
  +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", CFSTR("3047A1A5-8BFC-4112-9888-21314F438FF3"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9AA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_1EA7CB980);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_1EA7CB998);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFAccessoryTypeGroup _initWithName:set:](v0, "_initWithName:set:", 0, v7);
  v9 = (void *)qword_1ED378878;
  qword_1ED378878 = v8;

}

+ (id)restrictedGuestAccessoryTypeGroups
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v2 = (void *)objc_opt_new();
  if (qword_1ED3788B0 != -1)
    dispatch_once(&qword_1ED3788B0, &__block_literal_global_157_0);
  v3 = (id)qword_1ED3788B8;
  if (qword_1ED3788C0 != -1)
    dispatch_once(&qword_1ED3788C0, &__block_literal_global_159_0);
  v4 = (id)qword_1ED3788C8;
  if (qword_1ED3788D0 != -1)
    dispatch_once(&qword_1ED3788D0, &__block_literal_global_161_0);
  v5 = (id)qword_1ED3788D8;
  if (qword_1ED3788E0 != -1)
    dispatch_once(&qword_1ED3788E0, &__block_literal_global_163_0);
  v6 = (id)qword_1ED3788E8;
  objc_msgSend(v2, "addObject:", v3);
  objc_msgSend(v2, "addObject:", v4);
  objc_msgSend(v2, "addObject:", v5);
  objc_msgSend(v2, "addObject:", v6);

  return v2;
}

void __58__HFAccessoryTypeGroup_restrictedGuestAccessoryTypeGroups__block_invoke_2()
{
  HFAccessoryTypeGroup *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = [HFAccessoryTypeGroup alloc];
  +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", *MEMORY[0x1E0CB7A30]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HFAccessoryTypeGroup initWithAccessoryTypes:](v0, "initWithAccessoryTypes:", v2);
  v4 = (void *)qword_1ED3788B8;
  qword_1ED3788B8 = v3;

}

void __58__HFAccessoryTypeGroup_restrictedGuestAccessoryTypeGroups__block_invoke_4()
{
  HFAccessoryTypeGroup *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = [HFAccessoryTypeGroup alloc];
  +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", *MEMORY[0x1E0CB7A50]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HFAccessoryTypeGroup initWithAccessoryTypes:](v0, "initWithAccessoryTypes:", v2);
  v4 = (void *)qword_1ED3788C8;
  qword_1ED3788C8 = v3;

}

void __58__HFAccessoryTypeGroup_restrictedGuestAccessoryTypeGroups__block_invoke_6()
{
  HFAccessoryTypeGroup *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = [HFAccessoryTypeGroup alloc];
  +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", *MEMORY[0x1E0CB7A38]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HFAccessoryTypeGroup initWithAccessoryTypes:](v0, "initWithAccessoryTypes:", v2);
  v4 = (void *)qword_1ED3788D8;
  qword_1ED3788D8 = v3;

}

void __58__HFAccessoryTypeGroup_restrictedGuestAccessoryTypeGroups__block_invoke_8()
{
  HFAccessoryTypeGroup *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = [HFAccessoryTypeGroup alloc];
  +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", *MEMORY[0x1E0CB7A90]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HFAccessoryTypeGroup initWithAccessoryTypes:](v0, "initWithAccessoryTypes:", v2);
  v4 = (void *)qword_1ED3788E8;
  qword_1ED3788E8 = v3;

}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HFAccessoryTypeGroup fullName](self, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (HFAccessoryTypeGroup)accessoryTypeGroupWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[12];

  v23[10] = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "climateAccessoryTypeGroup");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  objc_msgSend(a1, "energyAccessoryTypeGroup");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v18;
  objc_msgSend(a1, "lightAccessoryTypeGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v5;
  objc_msgSend(a1, "mediaAccessoryTypeGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v6;
  objc_msgSend(a1, "securityAccessoryTypeGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v7;
  objc_msgSend(a1, "outletAccessoryTypeGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v8;
  objc_msgSend(a1, "sensorAccessoryTypeGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v9;
  objc_msgSend(a1, "switchAccessoryTypeGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v10;
  objc_msgSend(a1, "waterAccessoryTypeGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v11;
  objc_msgSend(a1, "otherAccessoryTypeGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__HFAccessoryTypeGroup_accessoryTypeGroupWithIdentifier___block_invoke;
  v21[3] = &unk_1EA729968;
  v22 = v20;
  v15 = v20;
  objc_msgSend(v14, "na_firstObjectPassingTest:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFAccessoryTypeGroup *)v16;
}

uint64_t __57__HFAccessoryTypeGroup_accessoryTypeGroupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)intersectsGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFAccessoryTypeGroup types](self, "types");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "types");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "intersectsSet:", v6);
  return (char)v4;
}

- (id)groupByIntersectingGroup:(id)a3
{
  id v4;
  HFAccessoryTypeGroup *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = [HFAccessoryTypeGroup alloc];
    -[HFAccessoryTypeGroup types](self, "types");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "types");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_setByIntersectingWithSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HFAccessoryTypeGroup _initWithName:set:](v5, "_initWithName:set:", 0, v8);

  }
  else
  {
    if (qword_1ED378900 != -1)
      dispatch_once(&qword_1ED378900, &__block_literal_global_171);
    v9 = (id)qword_1ED378908;
  }

  return v9;
}

void __49__HFAccessoryTypeGroup_groupByIntersectingGroup___block_invoke_2()
{
  HFAccessoryTypeGroup *v0;
  void *v1;

  v0 = objc_alloc_init(HFAccessoryTypeGroup);
  v1 = (void *)qword_1ED378908;
  qword_1ED378908 = (uint64_t)v0;

}

- (id)groupBySubtractingGroup:(id)a3
{
  id v4;
  HFAccessoryTypeGroup *v5;
  void *v6;
  void *v7;
  void *v8;
  HFAccessoryTypeGroup *v9;

  if (a3)
  {
    v4 = a3;
    v5 = [HFAccessoryTypeGroup alloc];
    -[HFAccessoryTypeGroup types](self, "types");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "types");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "na_setByRemovingObjectsFromSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HFAccessoryTypeGroup _initWithName:set:](v5, "_initWithName:set:", 0, v8);

  }
  else
  {
    v9 = self;
  }
  return v9;
}

- (NSString)fullName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HFAccessoryTypeGroup _fullName](self, "_fullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HFAccessoryTypeGroup name](self, "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)_fullName
{
  return self->__fullName;
}

- (void)set_fullName:(id)a3
{
  objc_storeStrong((id *)&self->__fullName, a3);
}

- (id)filterAccessoryRepresentableObjects:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__HFAccessoryTypeGroup_Filtering__filterAccessoryRepresentableObjects___block_invoke;
  v4[3] = &unk_1EA72B188;
  v4[4] = self;
  objc_msgSend(a3, "na_filter:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __71__HFAccessoryTypeGroup_Filtering__filterAccessoryRepresentableObjects___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hf_accessoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsType:", v3);

  return v4;
}

@end
