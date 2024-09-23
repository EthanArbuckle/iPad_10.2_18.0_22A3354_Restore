@implementation NTKSampleComplicationDataSource

+ (BOOL)acceptsComplicationType:(unint64_t)NSSComplicationDataSourceClass withFamily:(int64_t)a4 forDevice:(id)a5
{
  id v8;
  BOOL v9;
  BOOL v10;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;
  int v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  unsigned int v24;
  void *v25;
  BOOL v26;
  int v27;
  void *v28;
  char v29;

  v8 = a5;
  if (+[NTKWidgetComplicationMigrationDefines hasMigratedComplicationType:family:forDevice:](NTKWidgetComplicationMigrationDefines, "hasMigratedComplicationType:family:forDevice:", NSSComplicationDataSourceClass, a4, v8))
  {
    goto LABEL_13;
  }
  v9 = a4 == 100 || a4 == 101;
  v10 = v9 || a4 == 102;
  if (v10 || a4 == 103)
    goto LABEL_13;
  if (a4 == 6)
  {
    if (acceptsComplicationType_withFamily_forDevice__onceToken != -1)
      dispatch_once(&acceptsComplicationType_withFamily_forDevice__onceToken, &__block_literal_global_18);
    v13 = (void *)acceptsComplicationType_withFamily_forDevice__smallFlatComplications;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", NSSComplicationDataSourceClass);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(NSSComplicationDataSourceClass) = objc_msgSend(v13, "containsObject:", v14);

    goto LABEL_14;
  }
  if (a4 == 104)
  {
    if (acceptsComplicationType_withFamily_forDevice__onceToken_266 != -1)
      dispatch_once(&acceptsComplicationType_withFamily_forDevice__onceToken_266, &__block_literal_global_268);
    v15 = (void *)acceptsComplicationType_withFamily_forDevice__specialCasedComplicationTypes;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", NSSComplicationDataSourceClass);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v15, "containsObject:", v16);

    if (!(_DWORD)v15)
    {
LABEL_13:
      LOBYTE(NSSComplicationDataSourceClass) = 0;
      goto LABEL_14;
    }
  }
  switch(NSSComplicationDataSourceClass)
  {
    case 2uLL:
    case 0xFuLL:
    case 0x11uLL:
    case 0x2AuLL:
      LOBYTE(NSSComplicationDataSourceClass) = 1;
      if (a4 != 12 && (a4 & 0xFFFFFFFFFFFFFFFCLL) != 8)
        goto LABEL_26;
      break;
    case 4uLL:
      LOBYTE(NSSComplicationDataSourceClass) = 1;
      if ((unint64_t)(a4 - 8) >= 5 && *MEMORY[0x1E0C93EA8] != a4)
        goto LABEL_26;
      break;
    case 5uLL:
      if ((unint64_t)(a4 - 8) >= 5 || ((0x17u >> (a4 - 8)) & 1) == 0)
      {
        v19 = _os_feature_enabled_impl();
        if (a4 != 11)
          goto LABEL_26;
        if (!v19)
          goto LABEL_26;
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2C1C2266-9A61-4756-8AFD-9DFE14C54864"));
        v21 = objc_msgSend(v8, "supportsCapability:", v20);

        if ((v21 & 1) == 0)
          goto LABEL_26;
      }
      goto LABEL_71;
    case 0xDuLL:
      if ((unint64_t)(a4 - 8) < 5 && ((0x17u >> (a4 - 8)) & 1) != 0)
        goto LABEL_71;
      goto LABEL_26;
    case 0x13uLL:
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2A51E7B3-1B80-4981-9F09-F725BC3A8065"));
      v23 = objc_msgSend(v8, "supportsCapability:", v22);

      if ((v23 & 1) != 0)
        goto LABEL_13;
      LOBYTE(NSSComplicationDataSourceClass) = 1;
      if ((a4 & 0xFFFFFFFFFFFFFFFBLL) == 0 || *MEMORY[0x1E0C93E90] == a4)
        break;
      if ((unint64_t)a4 >= 0xD)
        goto LABEL_13;
      v24 = 6020;
LABEL_66:
      LODWORD(NSSComplicationDataSourceClass) = (v24 >> a4) & 1;
      break;
    case 0x14uLL:
      if (a4 == 8)
        goto LABEL_71;
      goto LABEL_26;
    case 0x1AuLL:
      NSSComplicationDataSourceClass = (unint64_t)getNSSComplicationDataSourceClass();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend((id)NSSComplicationDataSourceClass, "nss_newsComplicationTemplateForFamily:compact:", a4, objc_msgSend(v8, "sizeClass") == 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(NSSComplicationDataSourceClass) = v25 != 0;

      }
      else
      {
LABEL_26:
        v17 = objc_msgSend(a1, "_isComplicationFamilyAvaialbleBeforeGlory:", a4);
LABEL_27:
        LOBYTE(NSSComplicationDataSourceClass) = v17;
      }
      break;
    case 0x1DuLL:
      if (a4)
        v26 = a4 == 10;
      else
        v26 = 1;
      LOBYTE(NSSComplicationDataSourceClass) = v26;
      break;
    case 0x20uLL:
      if (a4 != 3)
        goto LABEL_13;
      v17 = NTKIsConnectivityPhoneComplicationEnabled();
      goto LABEL_27;
    case 0x22uLL:
      if ((unint64_t)a4 >= 0xC)
        goto LABEL_13;
      v24 = 2058;
      goto LABEL_66;
    case 0x23uLL:
      v17 = objc_msgSend(v8, "isRadioPhoneComplicationEnabled");
      goto LABEL_27;
    case 0x26uLL:
    case 0x27uLL:
    case 0x29uLL:
      v18 = a4 != 12 && (unint64_t)(a4 - 9) >= 2;
      goto LABEL_31;
    case 0x28uLL:
      v27 = _os_feature_enabled_impl();
      if (a4 == 11
        && v27
        && (v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2C1C2266-9A61-4756-8AFD-9DFE14C54864")), v29 = objc_msgSend(v8, "supportsCapability:", v28), v28, (v29 & 1) != 0))
      {
LABEL_71:
        LOBYTE(NSSComplicationDataSourceClass) = 1;
      }
      else
      {
        v18 = a4 != 12 && (unint64_t)(a4 - 8) >= 3;
LABEL_31:
        LOBYTE(NSSComplicationDataSourceClass) = !v18;
      }
      break;
    default:
      v17 = objc_msgSend(a1, "acceptsClassicComplicationType:withFamily:", NSSComplicationDataSourceClass, a4);
      goto LABEL_27;
  }
LABEL_14:

  return NSSComplicationDataSourceClass;
}

void __80__NTKSampleComplicationDataSource_acceptsComplicationType_withFamily_forDevice___block_invoke()
{
  void *v0;

  v0 = (void *)acceptsComplicationType_withFamily_forDevice__smallFlatComplications;
  acceptsComplicationType_withFamily_forDevice__smallFlatComplications = (uint64_t)&unk_1E6CA8BF0;

}

void __80__NTKSampleComplicationDataSource_acceptsComplicationType_withFamily_forDevice___block_invoke_267()
{
  void *v0;

  v0 = (void *)acceptsComplicationType_withFamily_forDevice__specialCasedComplicationTypes;
  acceptsComplicationType_withFamily_forDevice__specialCasedComplicationTypes = (uint64_t)&unk_1E6CA8C08;

}

+ (BOOL)acceptsClassicComplicationType:(unint64_t)a3 withFamily:(int64_t)a4
{
  int v5;
  BOOL v7;

  v5 = objc_msgSend(a1, "_isComplicationFamilyAvaialbleBeforeGlory:", a4);
  v7 = a3 == 26 || a3 == 11;
  return v5 && v7;
}

+ (BOOL)_isComplicationFamilyAvaialbleBeforeGlory:(int64_t)a3
{
  if ((unint64_t)a3 < 7 && ((0x5Fu >> a3) & 1) != 0)
    return 1;
  return a3 == 7 || *MEMORY[0x1E0C93E90] == a3;
}

- (Class)richComplicationDisplayViewClassForDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  _QWORD v19[7];
  _QWORD v20[7];
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[7];
  _QWORD v26[7];
  _QWORD v27[7];
  _QWORD v28[9];

  v28[7] = *MEMORY[0x1E0C80C00];
  v18 = -[CLKCComplicationDataSource family](self, "family", a3);
  v27[0] = &unk_1E6C9DB88;
  v28[0] = objc_opt_class();
  v27[1] = &unk_1E6C9DBA0;
  v28[1] = objc_opt_class();
  v27[2] = &unk_1E6C9DBB8;
  v28[2] = objc_opt_class();
  v27[3] = &unk_1E6C9DBD0;
  v28[3] = objc_opt_class();
  v27[4] = &unk_1E6C9DAE0;
  v28[4] = objc_opt_class();
  v27[5] = &unk_1E6C9DB10;
  v28[5] = objc_opt_class();
  v27[6] = &unk_1E6C9DB28;
  v28[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = &unk_1E6C9DB88;
  v26[0] = objc_opt_class();
  v25[1] = &unk_1E6C9DBA0;
  v26[1] = objc_opt_class();
  v25[2] = &unk_1E6C9DBB8;
  v26[2] = objc_opt_class();
  v25[3] = &unk_1E6C9DBD0;
  v26[3] = objc_opt_class();
  v25[4] = &unk_1E6C9DAE0;
  v26[4] = objc_opt_class();
  v25[5] = &unk_1E6C9DB28;
  v26[5] = objc_opt_class();
  v25[6] = &unk_1E6C9DB10;
  v26[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = &unk_1E6C9DBA0;
  v24 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = &unk_1E6C9DB58;
  v22 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = &unk_1E6C9DB88;
  v20[0] = objc_opt_class();
  v19[1] = &unk_1E6C9DBA0;
  v20[1] = objc_opt_class();
  v19[2] = &unk_1E6C9DBB8;
  v20[2] = objc_opt_class();
  v19[3] = &unk_1E6C9DBD0;
  v20[3] = objc_opt_class();
  v19[4] = &unk_1E6C9DAE0;
  v20[4] = objc_opt_class();
  v19[5] = &unk_1E6C9DB10;
  v20[5] = objc_opt_class();
  v19[6] = &unk_1E6C9DB28;
  v20[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKCComplicationDataSource complication](self, "complication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "complicationType");

  switch(v18)
  {
    case 8:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v15;
      objc_msgSend(v15, "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v16;
      v11 = v17;
      goto LABEL_11;
    case 9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v16;
      objc_msgSend(v16, "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
      goto LABEL_10;
    case 10:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
      objc_msgSend(v17, "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 11:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v4;
      goto LABEL_8;
    case 12:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v5;
LABEL_8:
      objc_msgSend(v13, "objectForKeyedSubscript:", v8, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
LABEL_9:
      v12 = v16;
LABEL_10:
      v9 = v15;
LABEL_11:

      break;
    default:
      v10 = 0;
      v12 = v16;
      v11 = v17;
      v9 = v15;
      break;
  }

  return (Class)v10;
}

- (NTKSampleComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  NTKSampleComplicationDataSource *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKSampleComplicationDataSource;
  v5 = -[CLKCComplicationDataSource initWithComplication:family:forDevice:](&v8, sel_initWithComplication_family_forDevice_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__localeDidChange_, *MEMORY[0x1E0C99720], 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

  v4.receiver = self;
  v4.super_class = (Class)NTKSampleComplicationDataSource;
  -[NTKSampleComplicationDataSource dealloc](&v4, sel_dealloc);
}

- (id)currentSwitcherTemplate
{
  void *v3;
  uint64_t v4;
  CLKComplicationTemplate *v5;
  NTKSampleComplicationDataSource *v6;
  uint64_t v7;
  CLKComplicationTemplate *complicationTemplate;

  if (!self->_complicationTemplate)
  {
    -[CLKCComplicationDataSource complication](self, "complication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "complicationType");

    switch(v4)
    {
      case 2:
        -[NTKSampleComplicationDataSource _alarmTemplate](self, "_alarmTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 4:
        -[NTKSampleComplicationDataSource _stopwatchTemplate](self, "_stopwatchTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 5:
        -[NTKSampleComplicationDataSource _worldClockTemplate](self, "_worldClockTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 11:
        -[NTKSampleComplicationDataSource _moonPhaseTemplate](self, "_moonPhaseTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 13:
        -[NTKSampleComplicationDataSource _batteryTemplate](self, "_batteryTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 15:
        -[NTKSampleComplicationDataSource _heartrateTemplate](self, "_heartrateTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 17:
        -[NTKSampleComplicationDataSource _musicTemplate](self, "_musicTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 19:
        -[NTKSampleComplicationDataSource _breathingTemplate](self, "_breathingTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 20:
        -[NTKSampleComplicationDataSource _reminderTemplate](self, "_reminderTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 26:
        -[NTKSampleComplicationDataSource _newsTemplate](self, "_newsTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 29:
        -[NTKSampleComplicationDataSource _siriTemplate](self, "_siriTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 34:
        -[NTKSampleComplicationDataSource _nowPlayingTemplate](self, "_nowPlayingTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 35:
        -[NTKSampleComplicationDataSource _radioTemplate](self, "_radioTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 38:
        -[NTKSampleComplicationDataSource _solarTemplate](self, "_solarTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 39:
        v6 = self;
        v7 = 0;
        goto LABEL_20;
      case 40:
        v6 = self;
        v7 = 1;
        goto LABEL_20;
      case 41:
        v6 = self;
        v7 = 2;
LABEL_20:
        -[NTKSampleComplicationDataSource _astronomyTemplateFromVista:](v6, "_astronomyTemplateFromVista:", v7);
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 42:
        -[NTKSampleComplicationDataSource _podcastsTemplate](self, "_podcastsTemplate");
        v5 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
LABEL_22:
        complicationTemplate = self->_complicationTemplate;
        self->_complicationTemplate = v5;

        break;
      default:
        return (id)-[CLKComplicationTemplate finalizedCopy](self->_complicationTemplate, "finalizedCopy");
    }
  }
  return (id)-[CLKComplicationTemplate finalizedCopy](self->_complicationTemplate, "finalizedCopy");
}

- (id)_batteryTemplate
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntryDate:", v4);

  LODWORD(v5) = 1.0;
  objc_msgSend(v3, "setLevel:", v5);
  objc_msgSend(v3, "setState:", 1);
  objc_msgSend(v3, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "complicationTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_heartrateTemplate
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  NTKSampleComplicationDataSource *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[10];

  v39[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setEntryDate:", v3);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 64, -3, v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMeasurementDate:", v6);

  objc_msgSend(v4, "setHasBPM:", 1);
  objc_msgSend(v4, "setBPM:", 64);
  if (-[CLKCComplicationDataSource family](self, "family") == 11)
  {
    v32 = v5;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 54, 11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v31;
    v33 = self;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 66, 40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addIndexesInRange:", 125, 25);
    v8 = (void *)objc_msgSend(v7, "copy");

    v39[1] = v8;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 63, 82);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIndexesInRange:", 155, 18);
    v10 = (void *)objc_msgSend(v9, "copy");

    v39[2] = v10;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 65, 10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v11;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 55, 21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v12;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 60, 35);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39[5] = v13;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 62, 18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addIndexesInRange:", 90, 18);
    v15 = (void *)objc_msgSend(v14, "copy");

    v39[6] = v15;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 65, 30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39[7] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NTKStartOfDayForDate(v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "components:fromDate:", 124, v3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __53__NTKSampleComplicationDataSource__heartrateTemplate__block_invoke;
    v34[3] = &unk_1E6BCF160;
    v35 = v21;
    v36 = v20;
    v37 = v19;
    v38 = v18;
    v22 = v18;
    v23 = v19;
    self = v33;
    v24 = v23;
    v25 = v20;
    v26 = v21;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v34);
    objc_msgSend(v4, "setHasSummary:", 1);
    objc_msgSend(v4, "setDailyHighBPM:", 173);
    objc_msgSend(v4, "setDailyLowBPM:", 54);
    v27 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v4, "setChartPoints:", v27);

    v5 = v32;
  }
  objc_msgSend(v4, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "complicationTemplate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

void __53__NTKSampleComplicationDataSource__heartrateTemplate__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHour:", objc_msgSend(v5, "hour") + ((a3 & 1) == 0));
    v7 = (a3 << 63 >> 63) & 0x1E;
  }
  else
  {
    objc_msgSend(v5, "setHour:", 6);
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setMinute:", v7);
  objc_msgSend(*(id *)(a1 + 40), "nextDateAfterDate:matchingComponents:options:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), 2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0D221D8], "chartPointWithDate:valueIndexSet:", v10, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v9);
}

- (id)_moonPhaseTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setPhaseNumber:", 88);
  objc_msgSend(v3, "setHemisphere:", 0);
  objc_msgSend(v3, "setEvent:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateBySettingHour:minute:second:ofDate:options:", 21, 58, 0, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventDate:", v6);

  NUNILocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPhaseName:", v7);

  objc_msgSend(v3, "templateForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CLKCComplicationDataSource family](self, "family") == 1)
  {
    v9 = v8;
    objc_msgSend(v9, "body2TextProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "body2TextProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setRelativeToDate:", v12);

    }
  }

  return v8;
}

- (id)_stopwatchTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C94530];
  CLKFormatTimeIntervalSeconds();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textProviderWithText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C94530];
  CLKFormatTimeIntervalSeconds();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textProviderWithText:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CLKCComplicationDataSource family](self, "family");
  v10 = 0;
  switch(v9)
  {
    case 0:
      -[CLKCComplicationDataSource device](self, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKComplicationModuleView _modularSmallStopwatchImageProviderForDevice:](NTKComplicationModuleView, "_modularSmallStopwatchImageProviderForDevice:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0C94448];
      goto LABEL_8;
    case 1:
      v17 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("STOPWATCH_TITLE"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textProviderWithText:", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94408], "templateWithHeaderTextProvider:bodyTextProvider:", v15, v8);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
    case 6:
      +[NTKUtilityComplicationView _stopwatchImageProvider](NTKUtilityComplicationView, "_stopwatchImageProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C94468];
      v13 = v5;
      goto LABEL_12;
    case 3:
      +[NTKUtilityComplicationView _stopwatchImageProvider](NTKUtilityComplicationView, "_stopwatchImageProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C94460];
      goto LABEL_11;
    case 4:
      +[NTKCircularComplicationView _stopwatchImageProviderMedium:](NTKCircularComplicationView, "_stopwatchImageProviderMedium:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C941C0], "templateWithImageProvider:", v11);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 7:
      -[CLKCComplicationDataSource device](self, "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKComplicationModuleView _extraLargeStopwatchImageProviderForDevice:](NTKComplicationModuleView, "_extraLargeStopwatchImageProviderForDevice:", v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0C94228];
LABEL_8:
      objc_msgSend(v16, "templateWithLine1ImageProvider:line2TextProvider:", v15, v5);
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = (void *)v19;

      goto LABEL_15;
    case 8:
      objc_msgSend(MEMORY[0x1E0C944E0], "symbolImageProviderWithSystemName:", CFSTR("stopwatch"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMonochromeFilterType:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTintColor:", v22);

      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTintColor:", v23);

      v12 = (void *)MEMORY[0x1E0C94308];
LABEL_11:
      v13 = v8;
LABEL_12:
      objc_msgSend(v12, "templateWithTextProvider:imageProvider:", v13, v11);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 9:
      v36 = CFSTR("NTKStopwatchBezelComplicationMetadataTimeTextProviderKey");
      v37[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94240], "templateWithMetadata:", v11);
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v10 = (void *)v20;
      goto LABEL_14;
    case 10:
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", CFSTR("NTKStopwatchComplicationMetadataStateValue_Stopped"), CFSTR("NTKStopwatchComplicationMetadataStateKey"));
      v28 = (void *)MEMORY[0x1E0C94268];
      goto LABEL_26;
    case 11:
      objc_msgSend(MEMORY[0x1E0C944E0], "symbolImageProviderWithSystemName:", CFSTR("stopwatch"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMonochromeFilterType:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTintColor:", v29);

      v30 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("STOPWATCH_TITLE"), CFSTR("Stopwatch"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "textProviderWithText:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setTintColor:", v33);

      objc_msgSend(MEMORY[0x1E0C943B0], "templateWithHeaderImageProvider:headerTextProvider:bodyTextProvider:", v11, v32, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
      goto LABEL_15;
    case 12:
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", CFSTR("NTKStopwatchComplicationMetadataStateValue_Stopped"), CFSTR("NTKStopwatchComplicationMetadataStateKey"));
      v28 = (void *)MEMORY[0x1E0C94338];
LABEL_26:
      objc_msgSend(v28, "templateWithMetadata:", v26);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    default:
LABEL_15:
      if (v9 == *MEMORY[0x1E0C93E90])
      {
        +[NTKCircularComplicationView _stopwatchImageProviderMedium:](NTKCircularComplicationView, "_stopwatchImageProviderMedium:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94180], "templateWithImageProvider:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (v9 != *MEMORY[0x1E0C93EA8])
          goto LABEL_20;
        objc_msgSend(MEMORY[0x1E0C94458], "templateWithTextProvider:", v8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = CFSTR("NTKSimpleTextComplicationTypeMetadataKey");
        v35 = &unk_1E6C9DB10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setMetadata:", v24);
      }
      v10 = v25;

LABEL_20:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTintColor:", v26);
LABEL_21:

      return v10;
  }
}

- (id)_alarmTemplate
{
  void *v3;
  void *v4;
  void *v5;

  -[CLKCComplicationDataSource device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKAlarmTimelineEntry companionModelWithDevice:](NTKAlarmTimelineEntry, "companionModelWithDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "templateForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_worldClockTemplate
{
  void *v3;
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
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;

  -[NTKSampleComplicationDataSource _city](self, "_city");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0C99E80];
    objc_msgSend(v3, "timeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeZoneWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0C94530];
    NTKWorldClockCityAbbreviation(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textProviderWithText:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C94530];
    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textProviderWithText:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0C94560];
    NTKIdealizedDate();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textProviderWithDate:timeZone:", v15, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
    v13 = 0;
    v10 = 0;
    v7 = 0;
  }
  v17 = -[CLKCComplicationDataSource family](self, "family");
  v18 = 0;
  if (v17 == 104)
    v19 = 6;
  else
    v19 = v17;
  switch(v19)
  {
    case 0:
      if (v10 && v16)
      {
        v20 = v10;
        v25 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", &stru_1E6BDC918);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", &stru_1E6BDC918);
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v21 = v25;
      v29 = (void *)MEMORY[0x1E0C94450];
      goto LABEL_32;
    case 1:
      v53 = v13;
      if (v13)
      {
        v26 = v13;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", &stru_1E6BDC918);
        v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      v20 = v26;
      v36 = objc_msgSend(v7, "secondsFromGMT");
      objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (double)(v36 - objc_msgSend(v37, "secondsFromGMT"));

      objc_msgSend(MEMORY[0x1E0C94580], "dayForOffset:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94580], "differenceForOffset:caps:suppressZero:", 0, 0, v38);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0C94530];
      objc_msgSend(v54, "string");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "textProviderWithText:", v41);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      NTKClockFaceLocalizedString(CFSTR("WORLDCLOCK_DAY_BEFORE_TIME"), CFSTR("string used by localizers as a BOOL"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v41) = objc_msgSend(v42, "BOOLValue");

      NTKClockFaceLocalizedString(CFSTR("WORLDCLOCK_NO_SPACE_BETWEEN_DAY_TIME"), CFSTR("string used by localizers as a BOOL"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "BOOLValue");

      v45 = v16;
      v46 = v39;
      if ((_DWORD)v41)
      {
        v47 = v45;
      }
      else
      {
        v39 = v45;
        v47 = v46;
      }
      v48 = (void *)MEMORY[0x1E0C94540];
      if (v44)
        v49 = CFSTR("%@%@");
      else
        v49 = CFSTR("%@ %@");
      v51 = v46;
      objc_msgSend(v48, "textProviderWithFormat:", v49, v39, v47);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderTextProvider:body1TextProvider:body2TextProvider:", v20, v50, v52);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v53;
      goto LABEL_34;
    case 2:
    case 6:
      objc_msgSend(v16, "setDisallowBothMinutesAndDesignator:", 1);
      if (CLKIsCurrentLocaleCJK())
        v23 = CFSTR("%@ %@");
      else
        v23 = CFSTR("%@ %@");
      objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", v23, v10, v16);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0C94468];
      goto LABEL_19;
    case 3:
      objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", CFSTR("%@ %@"), v16, v13);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0C94460];
LABEL_19:
      objc_msgSend(v24, "templateWithTextProvider:", v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    case 4:
      if (v10 && v16)
      {
        v20 = v10;
        v27 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", &stru_1E6BDC918);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", &stru_1E6BDC918);
        v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      v21 = v27;
      v29 = (void *)MEMORY[0x1E0C941D8];
      goto LABEL_32;
    case 7:
      if (v10 && v16)
      {
        v20 = v10;
        v28 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", &stru_1E6BDC918);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", &stru_1E6BDC918);
        v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      v21 = v28;
      v29 = (void *)MEMORY[0x1E0C94230];
LABEL_32:
      objc_msgSend(v29, "templateWithLine1TextProvider:line2TextProvider:", v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      -[NTKSampleComplicationDataSource _currentEntryModel](self, "_currentEntryModel");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "entryForComplicationFamily:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "complicationTemplate");
      v22 = objc_claimAutoreleasedReturnValue();
LABEL_33:
      v18 = (void *)v22;

LABEL_34:
      break;
    default:
      break;
  }
  if (v19 == *MEMORY[0x1E0C93E90])
  {
    if (v10 && v16)
    {
      v30 = v10;
      v31 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", &stru_1E6BDC918);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", &stru_1E6BDC918);
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    v32 = v31;
    objc_msgSend(MEMORY[0x1E0C94198], "templateWithLine1TextProvider:line2TextProvider:", v30, v31);
    v33 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v33;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTintColor:", v34);

  return v18;
}

- (id)_currentEntryModel
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntryDate:", v4);

  objc_msgSend(v3, "setShowIdealizedTime:", 1);
  -[NTKSampleComplicationDataSource _city](self, "_city");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCity:", v5);

  return v3;
}

- (id)_city
{
  void *v2;
  void *v3;

  -[CLKCComplicationDataSource complication](self, "complication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "city");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_musicTemplate
{
  int64_t v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
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
  void (**v25)(_QWORD);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(_QWORD);
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  uint64_t v48;
  void *v49;
  int v50;
  id v51;
  void *v52;
  void *v53;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  void (**v79)(_QWORD);
  void (**v80)(_QWORD);
  _QWORD aBlock[5];
  __CFString *v82;
  id v83;
  uint64_t v84;

  v3 = -[CLKCComplicationDataSource family](self, "family");
  v4 = CFSTR("music");
  NTKMusicTintColor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__NTKSampleComplicationDataSource__musicTemplate__block_invoke;
  aBlock[3] = &unk_1E6BCF188;
  aBlock[4] = self;
  v6 = v4;
  v82 = v6;
  v7 = v5;
  v83 = v7;
  v84 = 0x3FEB333333333333;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  NTKClockFaceLocalizedString(CFSTR("MUSIC_COMPLICATION_SIGNATURE_NOW_PLAYING_TITLE"), CFSTR("%1$@ - %2$@"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, CFSTR("Try Me"), CFSTR("Jorja Smith"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  switch(v3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, &unk_1E6C9DC18, v12, CFSTR("modularSmallMusicProgress"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0C94428];
      goto LABEL_8;
    case 1:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Try Me"));
      v77 = v10;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0C944E8];
      NTKImageNamed(CFSTR("modularLargeMusicEqualizer"));
      v79 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "imageProviderWithOnePieceImage:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Jorja Smith"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94500], "textProviderWithText:overrideBlock:", CFSTR("falling or flying"), &__block_literal_global_567);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:", v19, v16, v20, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v79;
      v10 = v77;
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, &unk_1E6C9DBE8, v22, CFSTR("utilityCornerMusicProgress"));
      v23 = v10;
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94528], "simpleProgressProviderWithProgress:", 0.85);
      v25 = v8;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTintColor:", v7);
      objc_msgSend(MEMORY[0x1E0C94470], "templateWithImageProvider:progressProvider:ringStyle:", v24, v26, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v25;
      v10 = v23;
      break;
    case 3:
      v27 = (void *)MEMORY[0x1E0C944E8];
      NTKImageNamed(CFSTR("utilityLongMusicEqualizer"));
      v28 = v10;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "imageProviderWithOnePieceImage:", v29);
      v30 = v8;
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Try Me"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:imageProvider:", v32, v31);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v28;
      v8 = v30;
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, &unk_1E6C9DC00, v33, CFSTR("colorAnalogMusicProgress"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0C941B0];
      goto LABEL_8;
    case 7:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v34, CFSTR("modularXLMusicProgress"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0C94208];
LABEL_8:
      LODWORD(v14) = 1062836634;
      objc_msgSend(v15, "templateWithImageProvider:fillFraction:ringStyle:", v13, 0, v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 8:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:](self, "_fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:", v6, v35, CFSTR("music_signature_corner"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v10);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setTintColor:", v7);
      objc_msgSend(MEMORY[0x1E0C94308], "templateWithTextProvider:imageProvider:", v36, v13);
      v37 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 9:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v10);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)MEMORY[0x1E0C94238];
      v8[2](v8);
      v75 = v6;
      v40 = v9;
      v41 = v10;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "templateWithCircularTemplate:textProvider:", v42, v38);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v41;
      v9 = v40;
      v6 = v75;

      break;
    case 10:
      v8[2](v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      NTKImageNamed(CFSTR("modularLargeMusicEqualizer"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "imageWithRenderingMode:", 2);
      v56 = objc_claimAutoreleasedReturnValue();

      v73 = (void *)v56;
      objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v56, 1, 0);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setTintColor:", v7);
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Try Me"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKCComplicationDataSource context](self, "context");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v10;
      v80 = v8;
      v74 = v57;
      if ((objc_msgSend(v58, "showsBackground") & 1) != 0)
      {
        NTKMusicTintColorHeadline();
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = v57;
        v61 = (void *)v59;
        objc_msgSend(v60, "setTintColor:", v59);

      }
      else
      {
        objc_msgSend(v57, "setTintColor:", v7);
      }

      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Jorja Smith"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("falling or flying"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKCComplicationDataSource context](self, "context");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "showsBackground");

      if (v65)
      {
        NTKMusicTintColorBody();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setTintColor:", v66);

        NTKMusicTintColorBody2();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setTintColor:", v67);

      }
      objc_msgSend(MEMORY[0x1E0C943C8], "templateWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:", v76, v74, v62, v63);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKCComplicationDataSource context](self, "context");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "showsBackground");

      if (v69)
      {
        v70 = objc_alloc(MEMORY[0x1E0C94140]);
        NTKMusicPlatterBackgroundColor();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = (void *)objc_msgSend(v70, "initWithBackgroundColor:", v71);
        objc_msgSend(v11, "setBackgroundDescriptor:", v72);

      }
      v10 = v78;
      v8 = v80;
      break;
    case 12:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:](self, "_fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:", v6, v43, CFSTR("graphicXLMusicProgress"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v44) = 1062836634;
      objc_msgSend(MEMORY[0x1E0C94520], "gaugeProviderWithStyle:gaugeColor:fillFraction:", 1, v7, v44);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94318], "templateWithGaugeProvider:imageProvider:", v36, v13);
      v37 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v11 = (void *)v37;

LABEL_13:
      break;
    default:
      break;
  }
  if (v3 == *MEMORY[0x1E0C93E90])
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v45, CFSTR("victoryMusicProgress"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v47) = 1062836634;
    objc_msgSend(MEMORY[0x1E0C94178], "templateWithImageProvider:fillFraction:ringStyle:", v46, 0, v47);
    v48 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v48;
  }
  if (v3 == 11
    && (-[CLKCComplicationDataSource context](self, "context"),
        v49 = (void *)objc_claimAutoreleasedReturnValue(),
        v50 = objc_msgSend(v49, "showsBackground"),
        v49,
        v50))
  {
    v51 = objc_alloc(MEMORY[0x1E0C94140]);
    NTKMusicPlatterBackgroundColor();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v51, "initWithBackgroundColor:", v52);
    objc_msgSend(v11, "setBackgroundDescriptor:", v53);

  }
  else
  {
    objc_msgSend(v11, "setTintColor:", v7);
  }

  return v11;
}

id __49__NTKSampleComplicationDataSource__musicTemplate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:", v3, v4, CFSTR("victoryMusicProgress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(double *)(a1 + 56);
  *(float *)&v6 = v6;
  objc_msgSend(MEMORY[0x1E0C94520], "gaugeProviderWithStyle:gaugeColor:fillFraction:", 1, *(_QWORD *)(a1 + 48), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94248], "templateWithGaugeProvider:imageProvider:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_radioTemplate
{
  int64_t v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
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
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v34;
  _QWORD aBlock[5];
  __CFString *v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v3 = -[CLKCComplicationDataSource family](self, "family");
  v4 = CFSTR("dot.radiowaves.left.and.right");
  NTKRadioTintColor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__NTKSampleComplicationDataSource__radioTemplate__block_invoke;
  aBlock[3] = &unk_1E6BCF1B0;
  aBlock[4] = self;
  v6 = v4;
  v36 = v6;
  v7 = v5;
  v37 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v9 = v8;
  v10 = 0;
  switch(v3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v11, CFSTR("ModularSmallRadio"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0C94438];
      goto LABEL_8;
    case 1:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Try Me"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v7, CFSTR("ModularLargeRadio"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Jorja Smith"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94500], "textProviderWithText:overrideBlock:", CFSTR("falling or flying"), &__block_literal_global_567);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:", v14, v12, v15, v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v17, CFSTR("UtilityCornerRadio"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0C94488];
      goto LABEL_8;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v18, CFSTR("UtilityTextStringRadio"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Try Me"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0C94460];
      goto LABEL_10;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v20, CFSTR("ColorRadio"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0C941C0];
      goto LABEL_8;
    case 7:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v21, CFSTR("XLRadio"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0C94218];
LABEL_8:
      objc_msgSend(v13, "templateWithImageProvider:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 8:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:](self, "_fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:", v6, v22, CFSTR("GraphicCornerRadio"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Try Me"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTintColor:", v7);
      v19 = (void *)MEMORY[0x1E0C94308];
LABEL_10:
      objc_msgSend(v19, "templateWithTextProvider:imageProvider:", v14, v12);
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 9:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Try Me"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0C94238];
      v9[2](v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "templateWithCircularTemplate:textProvider:", v14, v12);
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v10 = (void *)v23;
      goto LABEL_16;
    case 10:
      v8[2](v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      NTKImageNamed(CFSTR("modularLargeMusicEqualizer"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "imageWithRenderingMode:", 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Try Me"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTintColor:", v7);
      objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v34, 1, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTintColor:", v7);
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Jorja Smith"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("falling or flying"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C943C8], "templateWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:", v27, v26, v28, v29);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 12:
      -[NTKSampleComplicationDataSource _fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:](self, "_fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:", v6, v7, CFSTR("GraphicXLRadio"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94330], "templateWithImageProvider:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *MEMORY[0x1E0C94118];
      v39[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMetadata:", v14);
LABEL_16:

LABEL_17:
      break;
    default:
      break;
  }
  if (v3 == *MEMORY[0x1E0C93E90])
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v30, CFSTR("VictoryDigitalRadio"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C94180], "templateWithImageProvider:", v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v32;
  }
  objc_msgSend(v10, "setTintColor:", v7);

  return v10;
}

id __49__NTKSampleComplicationDataSource__radioTemplate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("VictoryDigitalRadio"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94260], "templateWithImageProvider:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C94118];
  v6[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMetadata:", v3);

  return v2;
}

- (id)_podcastsTemplate
{
  int64_t v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
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
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  id v35;
  void *v36;
  void *v37;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  _QWORD aBlock[5];
  __CFString *v51;
  id v52;

  v3 = -[CLKCComplicationDataSource family](self, "family");
  v4 = CFSTR("podcasts");
  NTKPodcastsTintColor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__NTKSampleComplicationDataSource__podcastsTemplate__block_invoke;
  aBlock[3] = &unk_1E6BCF1B0;
  aBlock[4] = self;
  v6 = v4;
  v51 = v6;
  v7 = v5;
  v52 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v9 = v8;
  v10 = 0;
  switch(v3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v11, CFSTR("ModularSmallPodcast"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTintColor:", v13);

      v14 = (void *)MEMORY[0x1E0C94438];
      goto LABEL_12;
    case 1:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Bigfoot"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0C944E8];
      NTKImageNamed(CFSTR("modularLargeMusicEqualizer"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageProviderWithOnePieceImage:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Science Vs"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderImageProvider:headerTextProvider:body1TextProvider:", v17, v12, v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v19, CFSTR("UtilityCornerPodcast"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0C94488];
      goto LABEL_12;
    case 3:
      v20 = (void *)MEMORY[0x1E0C944E8];
      NTKImageNamed(CFSTR("utilityLongMusicEqualizer"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "imageProviderWithOnePieceImage:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Bigfoot"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:imageProvider:", v23, v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v24, CFSTR("ColorPodcast"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0C941C0];
      goto LABEL_12;
    case 7:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v25, CFSTR("XLPodcast"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0C94218];
      goto LABEL_12;
    case 8:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSampleComplicationDataSource _fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:](self, "_fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:", v6, v26, CFSTR("GraphicCornerPodcast"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Bigfoot"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTintColor:", v7);
      objc_msgSend(MEMORY[0x1E0C94308], "templateWithTextProvider:imageProvider:", v27, v12);
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 9:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Bigfoot"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0C94238];
      v9[2](v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "templateWithCircularTemplate:textProvider:", v27, v12);
      v28 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v10 = (void *)v28;

      goto LABEL_13;
    case 10:
      v8[2](v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      NTKImageNamed(CFSTR("modularLargeMusicEqualizer"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "imageWithRenderingMode:", 2);
      v40 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Bigfoot"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKCComplicationDataSource context](self, "context");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v42, "showsBackground") & 1) != 0)
      {
        NTKPodcastsTintColorHeadline();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setTintColor:", v43);

      }
      else
      {
        objc_msgSend(v41, "setTintColor:", v7);
      }

      v49 = (void *)v40;
      objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v40, 1, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setTintColor:", v7);
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Science Vs"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKCComplicationDataSource context](self, "context");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "showsBackground");

      if (v47)
      {
        NTKPodcastsTintColorBody();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setTintColor:", v48);

      }
      objc_msgSend(MEMORY[0x1E0C943C8], "templateWithHeaderImageProvider:headerTextProvider:body1TextProvider:", v44, v41, v45);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 12:
      -[NTKSampleComplicationDataSource _fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:](self, "_fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:", v6, v7, CFSTR("GraphicXLPodcast"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0C94330];
LABEL_12:
      objc_msgSend(v14, "templateWithImageProvider:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

      break;
    default:
      break;
  }
  if (v3 == *MEMORY[0x1E0C93E90])
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSampleComplicationDataSource _imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:](self, "_imageProviderWithSystemImageName:overridePointSize:tintColor:fallbackImageName:", v6, 0, v30, CFSTR("VictoryDigitalPodcast"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C94180], "templateWithImageProvider:", v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v32;
  }
  if (v3 == 11
    && (-[CLKCComplicationDataSource context](self, "context"),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        v34 = objc_msgSend(v33, "showsBackground"),
        v33,
        v34))
  {
    v35 = objc_alloc(MEMORY[0x1E0C94140]);
    NTKPodcastsPlatterBackgroundColor();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v35, "initWithBackgroundColor:", v36);
    objc_msgSend(v10, "setBackgroundDescriptor:", v37);

  }
  else
  {
    objc_msgSend(v10, "setTintColor:", v7);
  }

  return v10;
}

id __52__NTKSampleComplicationDataSource__podcastsTemplate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_fullColorImageProviderWithSystemImageName:tintColor:fallbackImageName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("VictoryDigitalPodcast"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94260], "templateWithImageProvider:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C94118];
  v6[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMetadata:", v3);

  return v2;
}

- (id)_nowPlayingTemplate
{
  int64_t v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;

  v3 = -[CLKCComplicationDataSource family](self, "family");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Try Me"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C944E8];
    NTKImageNamed(CFSTR("modularLargeMusicEqualizer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageProviderWithOnePieceImage:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Jorja Smith"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C94500], "textProviderWithText:overrideBlock:", CFSTR("falling or flying"), &__block_literal_global_567);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:", v8, v7, v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (v3 != 11)
  {
    if (v3 != 3)
    {
      v9 = 0;
      goto LABEL_15;
    }
    v5 = (void *)MEMORY[0x1E0C944E8];
    NTKImageNamed(CFSTR("utilityLongMusicEqualizer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageProviderWithOnePieceImage:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Try Me"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:imageProvider:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_15:
    objc_msgSend(v9, "setTintColor:", v4);
    goto LABEL_16;
  }
  NTKImageNamed(CFSTR("modularLargeMusicEqualizer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageWithRenderingMode:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Try Me"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v15, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTintColor:", v4);
  -[CLKCComplicationDataSource context](self, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "showsBackground") & 1) != 0)
  {
    NTKNowPlayingTintColorHeadline();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTintColor:", v19);

  }
  else
  {
    objc_msgSend(v16, "setTintColor:", v4);
  }

  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("Jorja Smith"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("falling or flying"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKCComplicationDataSource context](self, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "showsBackground");

  if (v23)
  {
    NTKNowPlayingTintColorBody();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTintColor:", v24);

    NTKNowPlayingTintColorBody2();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTintColor:", v25);

  }
  objc_msgSend(MEMORY[0x1E0C943C8], "templateWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:", v17, v16, v20, v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKCComplicationDataSource context](self, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "showsBackground");

  if (!v27)
    goto LABEL_15;
  v28 = objc_alloc(MEMORY[0x1E0C94140]);
  NTKNowPlayingPlatterBackgroundColor();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v28, "initWithBackgroundColor:", v29);
  objc_msgSend(v9, "setBackgroundDescriptor:", v30);

LABEL_16:
  return v9;
}

- (id)_reminderTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  NTKClockFaceLocalizedString(CFSTR("COMPLICATION_SAMPLE_REMINDER"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimaryReminderTitle:", v4);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKDate unmodifiedDate](NTKDate, "unmodifiedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", 15, 0, 0, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDueDate:", v7);

  objc_msgSend(v3, "setOverlappingReminderCount:", 1);
  objc_msgSend(v3, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "complicationTemplate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_breathingTemplate
{
  int64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
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
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v3 = -[CLKCComplicationDataSource family](self, "family");
  v4 = 0;
  switch(v3)
  {
    case 0:
      v10 = -[NTKSampleComplicationDataSource supportsFlowerImages](self, "supportsFlowerImages");
      v11 = (void *)MEMORY[0x1E0C944E8];
      if (v10)
      {
        NTKImageNamed(CFSTR("modularSmallBreathe"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "imageProviderWithOnePieceImage:", v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        NTKImageNamed(CFSTR("modularSmallBreatheMulticolor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setForegroundAccentImage:", v13);
      }
      else
      {
        NTKImageNamed(CFSTR("modularBreatheBee"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "imageProviderWithOnePieceImage:", v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v35 = (void *)MEMORY[0x1E0C94438];
      goto LABEL_24;
    case 2:
    case 6:
      v5 = -[NTKSampleComplicationDataSource supportsFlowerImages](self, "supportsFlowerImages");
      v6 = (void *)MEMORY[0x1E0C944E8];
      if (v5)
      {
        NTKImageNamed(CFSTR("utilityCornerBreathe"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "imageProviderWithOnePieceImage:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        NTKImageNamed(CFSTR("utilityCornerBreatheMulticolor"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setForegroundAccentImage:", v9);
      }
      else
      {
        NTKImageNamed(CFSTR("analogCornerBreatheBee"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "imageProviderWithOnePieceImage:", v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v35 = (void *)MEMORY[0x1E0C94488];
      goto LABEL_24;
    case 4:
      if (-[NTKSampleComplicationDataSource supportsFlowerImages](self, "supportsFlowerImages"))
        v14 = CFSTR("circularSmallBreathe");
      else
        v14 = CFSTR("colorAnalogBreatheBee");
      NTKImageNamed(v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithOnePieceImage:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C941A0], "templateWithImageProvider:", v15);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.22, 0.64, 0.68, 1.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTintColor:", v16);
      goto LABEL_14;
    case 7:
      v17 = -[NTKSampleComplicationDataSource supportsFlowerImages](self, "supportsFlowerImages");
      v18 = (void *)MEMORY[0x1E0C944E8];
      if (v17)
      {
        NTKImageNamed(CFSTR("XLBreathe"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "imageProviderWithOnePieceImage:", v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        NTKImageNamed(CFSTR("XLBreatheMulticolor"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setForegroundAccentImage:", v20);
      }
      else
      {
        NTKImageNamed(CFSTR("XLModularBreatheBee"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "imageProviderWithOnePieceImage:", v20);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v35 = (void *)MEMORY[0x1E0C94218];
LABEL_24:
      objc_msgSend(v35, "templateWithImageProvider:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.22, 0.64, 0.68, 1.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTintColor:", v15);
      goto LABEL_25;
    case 8:
      NTKClockFaceLocalizedFormat(CFSTR("BREATHE_MINUTES_FORMAT"), CFSTR("%i MINUTES"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v8, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.22, 0.64, 0.68, 1.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTintColor:", v21);

      v22 = (void *)MEMORY[0x1E0C944D8];
      NTKImageNamed(CFSTR("signatureCornerBreatheSmall"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "providerWithFullColorImage:monochromeFilterType:", v23, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94308], "templateWithTextProvider:imageProvider:", v16, v24);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    case 9:
      v25 = (void *)MEMORY[0x1E0C944D8];
      NTKImageNamed(CFSTR("signatureCircularBreathe"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "providerWithFullColorImage:monochromeFilterType:", v26, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94260], "templateWithImageProvider:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NTKClockFaceLocalizedFormat(CFSTR("BREATHE_MINUTES_TODAY_FORMAT"), CFSTR("%i MINUTES TODAY"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v16, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94238], "templateWithCircularTemplate:textProvider:", v15, v28);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
LABEL_25:

      break;
    case 10:
      v29 = (void *)MEMORY[0x1E0C944D8];
      NTKImageNamed(CFSTR("signatureCircularBreathe"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "providerWithFullColorImage:monochromeFilterType:", v30, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94260], "templateWithImageProvider:", v31);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 12:
      v32 = (void *)MEMORY[0x1E0C944D8];
      NTKImageNamed(CFSTR("graphicXLCircularBreathe"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "providerWithFullColorImage:monochromeFilterType:", v33, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94330], "templateWithImageProvider:", v31);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *MEMORY[0x1E0C94118];
      v43[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMetadata:", v34);

LABEL_17:
      break;
    default:
      break;
  }
  if (v3 == *MEMORY[0x1E0C93E90])
  {
    if (-[NTKSampleComplicationDataSource supportsFlowerImages](self, "supportsFlowerImages"))
      v36 = CFSTR("circularMediumBreathe");
    else
      v36 = CFSTR("victoryNTKBreatheBee");
    NTKImageNamed(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithOnePieceImage:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C94170], "templateWithImageProvider:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.22, 0.64, 0.68, 1.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTintColor:", v40);

    v4 = v39;
  }
  return v4;
}

- (BOOL)supportsFlowerImages
{
  void *v2;
  BOOL v3;

  -[CLKCComplicationDataSource device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "nrDeviceVersion") >> 16 > 4;

  return v3;
}

- (id)_newsTemplate
{
  id NSSComplicationDataSourceClass;
  int64_t v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  if (!NewsServicesLibraryCore_frameworkLibrary)
    NewsServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (NewsServicesLibraryCore_frameworkLibrary
    && (NSSComplicationDataSourceClass = getNSSComplicationDataSourceClass(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    v4 = -[CLKCComplicationDataSource family](self, "family");
    -[CLKCComplicationDataSource device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sizeClass") == 0;

    objc_msgSend(NSSComplicationDataSourceClass, "nss_newsComplicationTemplateForFamily:compact:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_siriTemplate
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  if (-[CLKCComplicationDataSource family](self, "family") == 10)
  {
    objc_msgSend(MEMORY[0x1E0C944D8], "fullColorImageProviderWithImageViewClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0C94260];
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__NTKSampleComplicationDataSource__siriTemplate__block_invoke;
    v7[3] = &unk_1E6BCF1D8;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithImageViewCreationHandler:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0C94438];
  }
  objc_msgSend(v4, "templateWithImageProvider:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

NTKStaticSiriAnimationView *__48__NTKSampleComplicationDataSource__siriTemplate__block_invoke(uint64_t a1, double a2, double a3)
{
  NTKStaticSiriAnimationView *v6;
  void *v7;
  NTKStaticSiriAnimationView *v8;

  v6 = [NTKStaticSiriAnimationView alloc];
  objc_msgSend(*(id *)(a1 + 32), "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NTKStaticSiriAnimationView initWithFrame:forDevice:](v6, "initWithFrame:forDevice:", v7, 0.0, 0.0, a2, a3);

  return v8;
}

- (id)_solarTemplate
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  id *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("NTKSolarComplicationEntryLocationKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NTKSolarComplicationUseIdealizedTimeKey"));
  v6 = -[CLKCComplicationDataSource family](self, "family");
  switch(v6)
  {
    case 12:
      v7 = (id *)0x1E0C94338;
      break;
    case 10:
      v7 = (id *)0x1E0C94268;
      break;
    case 9:
      v7 = (id *)0x1E0C94240;
      break;
    default:
      v8 = 0;
      goto LABEL_9;
  }
  objc_msgSend(*v7, "templateWithMetadata:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v8;
}

- (id)_astronomyTemplateFromVista:(unint64_t)a3
{
  void *v5;
  void *v6;
  NTKAstronomyTimelineEntryModel *v7;
  void *v8;
  void *v9;
  NTKAstronomyTimelineEntryModel *v10;
  void *v11;

  +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [NTKAstronomyTimelineEntryModel alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NTKIdealizedDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NTKAstronomyTimelineEntryModel initWithVista:entryDate:currentDate:currentLocation:anyLocation:](v7, "initWithVista:entryDate:currentDate:currentLocation:anyLocation:", a3, v8, v9, v6, v6);

  -[NTKAstronomyTimelineEntryModel templateForComplicationFamily:](v10, "templateForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_localeDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NTKSampleComplicationDataSource__localeDidChange___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __52__NTKSampleComplicationDataSource__localeDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateSwitcherTemplate");

}

- (id)_imageProviderWithSystemImageName:(id)a3 overridePointSize:(id)a4 tintColor:(id)a5 fallbackImageName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = (void *)objc_opt_class();
  -[CLKCComplicationDataSource device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v14, "_shouldUseFallbackImagesForDevice:", v15);

  if ((_DWORD)v14)
  {
    v16 = (void *)MEMORY[0x1E0C944E8];
    NTKImageNamed(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageProviderWithOnePieceImage:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setTintColor:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C94538], "_symbolImageProviderWithSystemName:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTintColor:", v13);

    objc_msgSend(v18, "setOverridePointSize:", v11);
  }

  return v18;
}

- (id)_fullColorImageProviderWithSystemImageName:(id)a3 tintColor:(id)a4 fallbackImageName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_opt_class();
  -[CLKCComplicationDataSource device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "_shouldUseFallbackImagesForDevice:", v12) & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0C944D8];
    NTKImageNamed(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageWithRenderingMode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v15, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C944E0], "_symbolImageProviderWithSystemName:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v16, "setTintColor:", v10);
  return v16;
}

+ (BOOL)_shouldUseFallbackImagesForDevice:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("436C3C42-1855-4417-BD50-BD3D1B870E0F"));
  v6 = objc_msgSend(v4, "supportsCapability:", v5);

  return v6 ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationTemplate, 0);
}

@end
