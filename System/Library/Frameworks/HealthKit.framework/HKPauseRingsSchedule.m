@implementation HKPauseRingsSchedule

+ (id)pauseRingsScheduleWithStartDateIndex:(int64_t)a3 endDateIndex:(int64_t)a4 device:(id)a5 metadata:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;
  _QWORD aBlock[6];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__HKPauseRingsSchedule_pauseRingsScheduleWithStartDateIndex_endDateIndex_device_metadata___block_invoke;
  aBlock[3] = &__block_descriptor_48_e8_v16__0_8l;
  aBlock[4] = a3;
  aBlock[5] = a4;
  v8 = a6;
  v9 = a5;
  v10 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKObjectType pauseRingsScheduleType](HKSampleType, "pauseRingsScheduleType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___HKPauseRingsSchedule;
  v13 = objc_msgSendSuper2(&v15, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v12, v11, v11, v9, v8, v10);

  return v13;
}

uint64_t __90__HKPauseRingsSchedule_pauseRingsScheduleWithStartDateIndex_endDateIndex_device_metadata___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 96) = *(_QWORD *)(result + 32);
  *(_QWORD *)(a2 + 104) = *(_QWORD *)(result + 40);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKPauseRingsSchedule;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_startDateIndex, CFSTR("StartDateIndex"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_endDateIndex, CFSTR("EndDateIndex"));

}

- (HKPauseRingsSchedule)initWithCoder:(id)a3
{
  id v4;
  HKPauseRingsSchedule *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKPauseRingsSchedule;
  v5 = -[HKSample initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_startDateIndex = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("StartDateIndex"));
    v5->_endDateIndex = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("EndDateIndex"));
  }

  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)HKPauseRingsSchedule,
        -[HKSample isEquivalent:](&v10, sel_isEquivalent_, v4)))
  {
    v5 = v4;
    v6 = -[HKPauseRingsSchedule startDateIndex](self, "startDateIndex");
    if (v6 == objc_msgSend(v5, "startDateIndex"))
    {
      v7 = -[HKPauseRingsSchedule endDateIndex](self, "endDateIndex");
      v8 = v7 == objc_msgSend(v5, "endDateIndex");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (int64_t)startDateIndex
{
  return self->_startDateIndex;
}

- (void)setStartDateIndex:(int64_t)a3
{
  self->_startDateIndex = a3;
}

- (int64_t)endDateIndex
{
  return self->_endDateIndex;
}

- (void)setEndDateIndex:(int64_t)a3
{
  self->_endDateIndex = a3;
}

@end
