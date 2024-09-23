@implementation BitrateLimits

- (BitrateLimits)initWithOperatingMode:(unsigned __int8)a3 withBitrateCap:(unint64_t)a4 useCaseWatchContinuity:(BOOL)a5
{
  int v7;
  BitrateLimits *v8;
  BitrateLimits *v9;
  id v10;
  void *v11;
  NSArray *v12;
  void *v13;
  uint64_t v14;
  NSArray *v15;
  objc_super v17;
  _QWORD v18[2];

  v7 = a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)BitrateLimits;
  v8 = -[BitrateLimits init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    switch(v7)
    {
      case 0:
      case 1:
      case 4:
      case 5:
        v10 = -[BitrateLimits commonAudioVideoLimits](v8, "commonAudioVideoLimits");
        v11 = &unk_1E9EFA328;
        goto LABEL_4;
      case 2:
        v12 = -[BitrateLimits commonAudioOnlyLimitsLegacy](v8, "commonAudioOnlyLimitsLegacy");
        if (a5)
          goto LABEL_13;
        v13 = &unk_1E9EFA2F8;
        break;
      case 3:
        v12 = -[BitrateLimits commonAudioOnlyLimits](v8, "commonAudioOnlyLimits");
        if (a5)
          goto LABEL_13;
        v13 = &unk_1E9EFA310;
        break;
      case 6:
        v18[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v9->defaultValue = a4;
        v9->defaultValueCellular = a4;
        v9->defaultValue2G = a4;
        v9->limits = (NSArray *)v14;
        goto LABEL_14;
      case 7:
        v12 = -[BitrateLimits commonAudioOnlyLimitsLegacy](v8, "commonAudioOnlyLimitsLegacy");
        goto LABEL_13;
      case 8:
        v12 = -[BitrateLimits commonAudioOnlyLimits](v8, "commonAudioOnlyLimits");
        v13 = &unk_1E9EFA340;
        break;
      case 9:
        v10 = -[BitrateLimits commonAudioVideoLimits](v8, "commonAudioVideoLimits");
        v11 = &unk_1E9EFA358;
LABEL_4:
        v9->limits = (NSArray *)objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
        -[BitrateLimits setUpDefaultValuesAudioVideo](v9, "setUpDefaultValuesAudioVideo");
        goto LABEL_14;
      default:
        goto LABEL_14;
    }
    v12 = -[NSArray arrayByAddingObjectsFromArray:](v12, "arrayByAddingObjectsFromArray:", v13);
LABEL_13:
    v9->limits = v12;
    -[BitrateLimits setupDefaultValuesAudio](v9, "setupDefaultValuesAudio");
LABEL_14:
    -[BitrateLimits capDefaultValues:](v9, "capDefaultValues:", a4);
    v15 = v9->limits;
  }
  return v9;
}

- (void)setupDefaultValuesAudio
{
  *(int64x2_t *)&self->defaultValue = vdupq_n_s64(0x9C40uLL);
  self->defaultValue2G = 40000;
}

- (void)setUpDefaultValuesAudioVideo
{
  *(_OWORD *)&self->defaultValue = xmmword_1D910F360;
  self->defaultValue2G = 32000;
}

- (id)commonAudioOnlyLimitsLegacy
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E9EFA370);
}

- (id)commonAudioOnlyLimits
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E9EFA388);
}

- (id)commonAudioVideoLimits
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E9EFA3A0);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)BitrateLimits;
  -[BitrateLimits dealloc](&v3, sel_dealloc);
}

- (void)capDefaultValues:(unint64_t)a3
{
  NSUInteger v5;
  unint64_t v6;
  unsigned int v7;
  unint64_t defaultValue2G;
  int8x16_t v9;

  v5 = -[NSArray count](self->limits, "count") - 1;
  v6 = +[VCArrayUtils insertionIndexForValue:array:](VCArrayUtils, "insertionIndexForValue:array:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3), self->limits);
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  defaultValue2G = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->limits, "objectAtIndexedSubscript:", v7), "unsignedIntegerValue");
  v9 = (int8x16_t)vdupq_n_s64(defaultValue2G);
  *(int8x16_t *)&self->defaultValue = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v9, *(uint64x2_t *)&self->defaultValue), *(int8x16_t *)&self->defaultValue, v9);
  if (self->defaultValue2G < defaultValue2G)
    defaultValue2G = self->defaultValue2G;
  self->defaultValue2G = defaultValue2G;
}

- (unint64_t)defaultValueForNetwork:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (a3)
    v3 = 16;
  return *(unint64_t *)((char *)&self->super.isa + v3);
}

- (NSArray)limits
{
  return self->limits;
}

@end
