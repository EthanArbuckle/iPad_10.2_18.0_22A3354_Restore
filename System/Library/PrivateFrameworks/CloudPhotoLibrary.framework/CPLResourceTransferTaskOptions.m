@implementation CPLResourceTransferTaskOptions

- (CPLResourceTransferTaskOptions)initWithIntent:(unint64_t)a3 priority:(unint64_t)a4 timeRange:(id *)a5
{
  CPLResourceTransferTaskOptions *result;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CPLResourceTransferTaskOptions;
  result = -[CPLResourceTransferTaskOptions init](&v11, sel_init);
  if (result)
  {
    result->_intent = a3;
    result->_priority = a4;
    v9 = *(_OWORD *)&a5->var0.var0;
    v10 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&result->_timeRange.duration.timescale = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)&result->_timeRange.start.epoch = v10;
    *(_OWORD *)&result->_timeRange.start.value = v9;
  }
  return result;
}

- (CPLResourceTransferTaskOptions)initWithIntent:(unint64_t)a3 priority:(unint64_t)a4
{
  __int128 v4;
  _OWORD v6[3];

  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v6[0] = *MEMORY[0x1E0CA2E40];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  return -[CPLResourceTransferTaskOptions initWithIntent:priority:timeRange:](self, "initWithIntent:priority:timeRange:", a3, a4, v6);
}

- (CPLResourceTransferTaskOptions)initWithHighPriority:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 0;
  else
    v3 = 2;
  return -[CPLResourceTransferTaskOptions initWithIntent:priority:](self, "initWithIntent:priority:", 0, v3);
}

- (CPLResourceTransferTaskOptions)init
{
  return -[CPLResourceTransferTaskOptions initWithIntent:priority:](self, "initWithIntent:priority:", 0, 0);
}

- (BOOL)isHighPriority
{
  return objc_msgSend((id)objc_opt_class(), "isHighPriorityForIntent:priority:", self->_intent, self->_priority);
}

- (BOOL)isForeground
{
  return objc_msgSend((id)objc_opt_class(), "isForegroundOperationForIntent:priority:", self->_intent, self->_priority);
}

- (BOOL)shouldKeepPower
{
  return +[CPLResourceTransferTaskOptions isForegroundOperationForIntent:priority:](CPLResourceTransferTaskOptions, "isForegroundOperationForIntent:priority:", self->_intent, self->_priority);
}

- (BOOL)hasValidTimeRange
{
  return (self->_timeRange.start.flags & 1) != 0
      && (self->_timeRange.duration.flags & 1) != 0
      && !self->_timeRange.duration.epoch
      && self->_timeRange.duration.value >= 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFAllocator *v7;
  __int128 v8;
  __CFString *v9;
  CMTimeRange range;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend((id)objc_opt_class(), "descriptionForIntent:", self->_intent);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "descriptionForIntentPriority:", self->_priority);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("intent %@ priority %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CPLResourceTransferTaskOptions hasValidTimeRange](self, "hasValidTimeRange"))
  {
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v8 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    v9 = (__CFString *)CMTimeRangeCopyDescription(v7, &range);
    objc_msgSend(v6, "appendFormat:", CFSTR(" timeRange %@"), v9);

  }
  return v6;
}

- (unint64_t)legacyIntent
{
  unint64_t intent;
  unint64_t result;
  unint64_t priority;
  _QWORD *v6;

  intent = self->_intent;
  result = 1;
  switch(intent)
  {
    case 0uLL:
      priority = self->_priority;
      if (priority >= 3)
        goto LABEL_2;
      v6 = &unk_1B053F5D0;
      goto LABEL_12;
    case 1uLL:
    case 5uLL:
      return result;
    case 2uLL:
    case 8uLL:
    case 9uLL:
      return intent;
    case 3uLL:
      priority = self->_priority;
      if (priority >= 3)
        return 4;
      v6 = &unk_1B053F5E8;
      goto LABEL_12;
    case 4uLL:
      return 4;
    case 6uLL:
      priority = self->_priority;
      if (priority >= 3)
        goto LABEL_9;
      v6 = &unk_1B053F600;
LABEL_12:
      result = v6[priority];
      break;
    case 7uLL:
LABEL_9:
      result = 7;
      break;
    default:
LABEL_2:
      result = 0;
      break;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t intent;
  id v5;
  __int128 v6;
  _OWORD v7[3];

  intent = self->_intent;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", intent, CFSTR("intent"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_priority, CFSTR("priority"));
  v6 = *(_OWORD *)&self->_timeRange.start.epoch;
  v7[0] = *(_OWORD *)&self->_timeRange.start.value;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  objc_msgSend(v5, "encodeCMTimeRange:forKey:", v7, CFSTR("timeRange"));

}

- (CPLResourceTransferTaskOptions)initWithCoder:(id)a3
{
  id v4;
  CPLResourceTransferTaskOptions *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = a3;
  v5 = -[CPLResourceTransferTaskOptions init](self, "init");
  if (v5)
  {
    v5->_intent = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("intent"));
    v5->_priority = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("priority"));
    if (v4)
    {
      objc_msgSend(v4, "decodeCMTimeRangeForKey:", CFSTR("timeRange"));
    }
    else
    {
      v8 = 0u;
      v9 = 0u;
      v7 = 0u;
    }
    *(_OWORD *)&v5->_timeRange.start.value = v7;
    *(_OWORD *)&v5->_timeRange.start.epoch = v8;
    *(_OWORD *)&v5->_timeRange.duration.timescale = v9;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;

  result = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)result + 1) = self->_intent;
  *((_QWORD *)result + 2) = self->_priority;
  v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  v6 = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_timeRange.duration.timescale;
  *(_OWORD *)((char *)result + 24) = v6;
  *(_OWORD *)((char *)result + 40) = v5;
  return result;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (unint64_t)priority
{
  return self->_priority;
}

- ($0E4A422D128941990FD19C13E5416F99)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

+ (id)defaultOptions
{
  return objc_alloc_init((Class)a1);
}

+ (id)intentsToBackgroundDownload
{
  return &unk_1E611B700;
}

+ (id)descriptionForIntent:(unint64_t)a3
{
  __CFString *v3;

  if (a3 >= 0x11)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CPLResourceTransferTaskIntent-%lu"), a3);
  else
    v3 = off_1E60DA708[a3];
  return v3;
}

+ (id)descriptionForIntentPriority:(unint64_t)a3
{
  __CFString *v3;

  if (a3 >= 3)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CPLResourceTransferTaskIntentPriority-%lu"), a3);
  else
    v3 = off_1E60DA790[a3];
  return v3;
}

+ (BOOL)isHighPriorityForIntent:(unint64_t)a3 priority:(unint64_t)a4
{
  BOOL v4;
  BOOL v5;

  v4 = ((1 << a3) & 0x41) == 0 || a4 != 2;
  v5 = ((1 << a3) & 0x8036) == 0 && v4;
  return a3 > 0xF || v5;
}

+ (BOOL)isForegroundOperationForIntent:(unint64_t)a3 priority:(unint64_t)a4
{
  BOOL v4;
  BOOL v5;

  v4 = ((1 << a3) & 9) == 0 || a4 != 2;
  v5 = ((1 << a3) & 0x1DC76) == 0 && v4;
  return a3 > 0x10 || v5;
}

+ (id)optionsForLegacyIntent:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3 - 1;
  if (a3 - 1 > 9)
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    v4 = qword_1B053F530[v3];
    v5 = qword_1B053F580[v3];
  }
  return -[CPLResourceTransferTaskOptions initWithIntent:priority:]([CPLResourceTransferTaskOptions alloc], "initWithIntent:priority:", v5, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
