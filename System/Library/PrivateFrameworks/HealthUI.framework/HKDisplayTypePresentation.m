@implementation HKDisplayTypePresentation

- (HKDisplayTypePresentation)initWithDefaultConfiguration:(id)a3 configurationOverrides:(id)a4 scaleFactor:(double)a5 showAllDataHierarchically:(BOOL)a6 showAppDataHierarchically:(BOOL)a7 shouldDisplayUnitStringOnYAxis:(BOOL)a8 useSecondsWhenDisplayingDuration:(BOOL)a9 isCriticalForAutoscale:(BOOL)a10 detailImageName:(id)a11 listIconImageNameOverride:(id)a12 summaryAttribution:(id)a13
{
  id v20;
  id v21;
  id v22;
  id v23;
  HKDisplayTypePresentation *v24;
  uint64_t v25;
  HKDisplayTypePresentationConfiguration *defaultConfiguration;
  uint64_t v27;
  NSDictionary *configurationOverrides;
  uint64_t v29;
  NSString *detailImageName;
  uint64_t v31;
  NSString *listIconImageNameOverride;
  uint64_t v33;
  HKDisplayTypeSummaryAttribution *summaryAttribution;
  id v36;
  objc_super v37;

  v36 = a3;
  v20 = a4;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v37.receiver = self;
  v37.super_class = (Class)HKDisplayTypePresentation;
  v24 = -[HKDisplayTypePresentation init](&v37, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v36, "copy");
    defaultConfiguration = v24->_defaultConfiguration;
    v24->_defaultConfiguration = (HKDisplayTypePresentationConfiguration *)v25;

    v27 = objc_msgSend(v20, "copy");
    configurationOverrides = v24->_configurationOverrides;
    v24->_configurationOverrides = (NSDictionary *)v27;

    v24->_scaleFactor = a5;
    v24->_showAllDataHierarchically = a6;
    v24->_showAppDataHierarchically = a7;
    v24->_shouldDisplayUnitStringOnYAxis = a8;
    v24->_useSecondsWhenDisplayingDuration = a9;
    v24->_isCriticalForAutoscale = a10;
    v29 = objc_msgSend(v21, "copy");
    detailImageName = v24->_detailImageName;
    v24->_detailImageName = (NSString *)v29;

    v31 = objc_msgSend(v22, "copy");
    listIconImageNameOverride = v24->_listIconImageNameOverride;
    v24->_listIconImageNameOverride = (NSString *)v31;

    v33 = objc_msgSend(v23, "copy");
    summaryAttribution = v24->_summaryAttribution;
    v24->_summaryAttribution = (HKDisplayTypeSummaryAttribution *)v33;

  }
  return v24;
}

- (BOOL)isCriticalForAutoscale
{
  return self->_isCriticalForAutoscale;
}

- (double)adjustedDoubleForDaemonDouble:(double)a3
{
  double scaleFactor;

  scaleFactor = self->_scaleFactor;
  if (fabs(scaleFactor + -1.0) < 0.00000011920929)
    scaleFactor = 1.0;
  return scaleFactor * a3;
}

- (id)adjustedValueForDaemonValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (fabs(self->_scaleFactor + -1.0) >= 0.00000011920929)
    {
      objc_msgSend(v4, "doubleValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8 * self->_scaleFactor);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v4;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HKDisplayTypePresentation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)configurationForTimeScope:(int64_t)a3
{
  NSDictionary *configurationOverrides;
  void *v5;
  HKDisplayTypePresentationConfiguration *v6;
  HKDisplayTypePresentationConfiguration *defaultConfiguration;
  HKDisplayTypePresentationConfiguration *v8;

  configurationOverrides = self->_configurationOverrides;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](configurationOverrides, "objectForKeyedSubscript:", v5);
  v6 = (HKDisplayTypePresentationConfiguration *)objc_claimAutoreleasedReturnValue();

  defaultConfiguration = v6;
  if (!v6)
    defaultConfiguration = self->_defaultConfiguration;
  v8 = defaultConfiguration;

  return v8;
}

- (id)adjustedValueForClientValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (fabs(self->_scaleFactor + -1.0) >= 0.00000011920929)
    {
      objc_msgSend(v4, "doubleValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8 / self->_scaleFactor);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v4;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)adjustedDoubleForClientDouble:(double)a3
{
  double scaleFactor;

  scaleFactor = self->_scaleFactor;
  if (fabs(scaleFactor + -1.0) < 0.00000011920929)
    scaleFactor = 1.0;
  return a3 / scaleFactor;
}

- (id)copyWithIsCriticalForAutoscale:(BOOL)a3
{
  uint64_t v4;

  LOBYTE(v4) = a3;
  return -[HKDisplayTypePresentation initWithDefaultConfiguration:configurationOverrides:scaleFactor:showAllDataHierarchically:showAppDataHierarchically:shouldDisplayUnitStringOnYAxis:useSecondsWhenDisplayingDuration:isCriticalForAutoscale:detailImageName:listIconImageNameOverride:summaryAttribution:]([HKDisplayTypePresentation alloc], "initWithDefaultConfiguration:configurationOverrides:scaleFactor:showAllDataHierarchically:showAppDataHierarchically:shouldDisplayUnitStringOnYAxis:useSecondsWhenDisplayingDuration:isCriticalForAutoscale:detailImageName:listIconImageNameOverride:summaryAttribution:", self->_defaultConfiguration, self->_configurationOverrides, self->_showAllDataHierarchically, self->_showAppDataHierarchically, self->_shouldDisplayUnitStringOnYAxis, self->_useSecondsWhenDisplayingDuration, self->_scaleFactor, v4, self->_detailImageName, self->_listIconImageNameOverride, self->_summaryAttribution);
}

- (id)copyWithListIconImageNameOverride:(id)a3
{
  id v4;
  HKDisplayTypePresentation *v5;
  HKDisplayTypePresentation *v6;
  uint64_t v8;

  v4 = a3;
  v5 = [HKDisplayTypePresentation alloc];
  LOBYTE(v8) = self->_isCriticalForAutoscale;
  v6 = -[HKDisplayTypePresentation initWithDefaultConfiguration:configurationOverrides:scaleFactor:showAllDataHierarchically:showAppDataHierarchically:shouldDisplayUnitStringOnYAxis:useSecondsWhenDisplayingDuration:isCriticalForAutoscale:detailImageName:listIconImageNameOverride:summaryAttribution:](v5, "initWithDefaultConfiguration:configurationOverrides:scaleFactor:showAllDataHierarchically:showAppDataHierarchically:shouldDisplayUnitStringOnYAxis:useSecondsWhenDisplayingDuration:isCriticalForAutoscale:detailImageName:listIconImageNameOverride:summaryAttribution:", self->_defaultConfiguration, self->_configurationOverrides, self->_showAllDataHierarchically, self->_showAppDataHierarchically, self->_shouldDisplayUnitStringOnYAxis, self->_useSecondsWhenDisplayingDuration, self->_scaleFactor, v8, self->_detailImageName, v4, self->_summaryAttribution);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  double scaleFactor;
  uint64_t v6;
  _BOOL8 isCriticalForAutoscale;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  int8x8_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v16;

  v3 = -[HKDisplayTypePresentationConfiguration hash](self->_defaultConfiguration, "hash");
  v4 = -[NSDictionary hash](self->_configurationOverrides, "hash");
  scaleFactor = self->_scaleFactor;
  v6 = (uint64_t)scaleFactor;
  LODWORD(scaleFactor) = *(_DWORD *)&self->_showAllDataHierarchically;
  v16 = (int8x16_t)vmovl_u16(vshl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)&scaleFactor), (uint16x4_t)0x4000300020001));
  isCriticalForAutoscale = self->_isCriticalForAutoscale;
  v8 = -[NSString hash](self->_detailImageName, "hash");
  v9 = -[NSString hash](self->_listIconImageNameOverride, "hash");
  v10 = -[HKDisplayTypeSummaryAttribution hash](self->_summaryAttribution, "hash");
  v11 = veor_s8(*(int8x8_t *)v16.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL));
  v12.i64[0] = v11.u32[0];
  v12.i64[1] = v11.u32[1];
  v13.i64[0] = 255;
  v13.i64[1] = 255;
  v14 = vandq_s8(v12, v13);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v14.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL)) ^ (32 * isCriticalForAutoscale) ^ v10 ^ v9 ^ v8 ^ v4 ^ v3 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  NSString *detailImageName;
  NSString *v6;
  NSString *listIconImageNameOverride;
  NSString *v8;
  HKDisplayTypeSummaryAttribution *summaryAttribution;
  HKDisplayTypeSummaryAttribution *v10;
  char v11;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_19;
  if (!-[HKDisplayTypePresentationConfiguration isEqual:](self->_defaultConfiguration, "isEqual:", *((_QWORD *)v4 + 1)))
    goto LABEL_19;
  if (!-[NSDictionary isEqual:](self->_configurationOverrides, "isEqual:", *((_QWORD *)v4 + 2)))
    goto LABEL_19;
  if (vabdd_f64(self->_scaleFactor, *((double *)v4 + 4)) >= 0.00000011920929)
    goto LABEL_19;
  if (self->_showAllDataHierarchically != v4[24])
    goto LABEL_19;
  if (self->_showAppDataHierarchically != v4[25])
    goto LABEL_19;
  if (self->_shouldDisplayUnitStringOnYAxis != v4[26])
    goto LABEL_19;
  if (self->_useSecondsWhenDisplayingDuration != v4[27])
    goto LABEL_19;
  if (self->_isCriticalForAutoscale != v4[28])
    goto LABEL_19;
  detailImageName = self->_detailImageName;
  v6 = (NSString *)*((_QWORD *)v4 + 5);
  if (detailImageName != v6 && (!v6 || !-[NSString isEqualToString:](detailImageName, "isEqualToString:")))
    goto LABEL_19;
  listIconImageNameOverride = self->_listIconImageNameOverride;
  v8 = (NSString *)*((_QWORD *)v4 + 6);
  if (listIconImageNameOverride != v8
    && (!v8 || !-[NSString isEqualToString:](listIconImageNameOverride, "isEqualToString:")))
  {
    goto LABEL_19;
  }
  summaryAttribution = self->_summaryAttribution;
  v10 = (HKDisplayTypeSummaryAttribution *)*((_QWORD *)v4 + 7);
  if (summaryAttribution == v10)
  {
    v11 = 1;
    goto LABEL_20;
  }
  if (v10)
    v11 = -[HKDisplayTypeSummaryAttribution isEqual:](summaryAttribution, "isEqual:");
  else
LABEL_19:
    v11 = 0;
LABEL_20:

  return v11;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (BOOL)showAllDataHierarchically
{
  return self->_showAllDataHierarchically;
}

- (BOOL)showAppDataHierarchically
{
  return self->_showAppDataHierarchically;
}

- (BOOL)shouldDisplayUnitStringOnYAxis
{
  return self->_shouldDisplayUnitStringOnYAxis;
}

- (BOOL)useSecondsWhenDisplayingDuration
{
  return self->_useSecondsWhenDisplayingDuration;
}

- (NSString)detailImageName
{
  return self->_detailImageName;
}

- (NSString)listIconImageNameOverride
{
  return self->_listIconImageNameOverride;
}

- (HKDisplayTypeSummaryAttribution)summaryAttribution
{
  return self->_summaryAttribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryAttribution, 0);
  objc_storeStrong((id *)&self->_listIconImageNameOverride, 0);
  objc_storeStrong((id *)&self->_detailImageName, 0);
  objc_storeStrong((id *)&self->_configurationOverrides, 0);
  objc_storeStrong((id *)&self->_defaultConfiguration, 0);
}

@end
