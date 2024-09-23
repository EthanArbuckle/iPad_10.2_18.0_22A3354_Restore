@implementation BDSDistributedPriceTrackingConfigUpdateScheduleStep

- (BDSDistributedPriceTrackingConfigUpdateScheduleStep)initWithDuration:(int64_t)a3 minUpdateInterval:(int64_t)a4 schedulerConfigIdealInterval:(int64_t)a5 schedulerConfigMinInterval:(int64_t)a6
{
  BDSDistributedPriceTrackingConfigUpdateScheduleStep *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BDSDistributedPriceTrackingConfigUpdateScheduleStep;
  result = -[BDSDistributedPriceTrackingConfigUpdateScheduleStep init](&v11, sel_init);
  if (result)
  {
    result->_duration = a3;
    result->_minUpdateInterval = a4;
    result->_schedulerConfigIdealInterval = a5;
    result->_schedulerConfigMinInterval = a6;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = objc_msgSend_duration(self, a2, v2, v3, v4);
  v11 = objc_msgSend_minUpdateInterval(self, v7, v8, v9, v10) ^ v6;
  v16 = objc_msgSend_schedulerConfigIdealInterval(self, v12, v13, v14, v15);
  return v11 ^ v16 ^ objc_msgSend_schedulerConfigIdealInterval(self, v17, v18, v19, v20);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  objc_opt_class();
  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = objc_msgSend_isEqualToStep_(self, v6, (uint64_t)v5, v7, v8);
  return (char)self;
}

- (BOOL)isEqualToStep:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t updated;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;

  v4 = a3;
  v9 = v4;
  if (v4
    && (v10 = objc_msgSend_duration(v4, v5, v6, v7, v8), v10 == objc_msgSend_duration(self, v11, v12, v13, v14))
    && (updated = objc_msgSend_minUpdateInterval(v9, v15, v16, v17, v18),
        updated == objc_msgSend_minUpdateInterval(self, v20, v21, v22, v23))
    && (v28 = objc_msgSend_schedulerConfigIdealInterval(v9, v24, v25, v26, v27),
        v28 == objc_msgSend_schedulerConfigIdealInterval(self, v29, v30, v31, v32)))
  {
    v37 = objc_msgSend_schedulerConfigMinInterval(v9, v33, v34, v35, v36);
    v42 = v37 == objc_msgSend_schedulerConfigMinInterval(self, v38, v39, v40, v41);
  }
  else
  {
    v42 = 0;
  }

  return v42;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t updated;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  id v32;

  v32 = a3;
  v8 = objc_msgSend_duration(self, v4, v5, v6, v7);
  objc_msgSend_encodeInteger_forKey_(v32, v9, v8, (uint64_t)CFSTR("duration"), v10);
  updated = objc_msgSend_minUpdateInterval(self, v11, v12, v13, v14);
  objc_msgSend_encodeInteger_forKey_(v32, v16, updated, (uint64_t)CFSTR("minUpdateInterval"), v17);
  v22 = objc_msgSend_schedulerConfigIdealInterval(self, v18, v19, v20, v21);
  objc_msgSend_encodeInteger_forKey_(v32, v23, v22, (uint64_t)CFSTR("schedulerConfigIdealInterval"), v24);
  v29 = objc_msgSend_schedulerConfigMinInterval(self, v25, v26, v27, v28);
  objc_msgSend_encodeInteger_forKey_(v32, v30, v29, (uint64_t)CFSTR("schedulerConfigMinInterval"), v31);

}

- (BDSDistributedPriceTrackingConfigUpdateScheduleStep)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v8 = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("duration"), v6, v7);
  v12 = objc_msgSend_decodeIntegerForKey_(v4, v9, (uint64_t)CFSTR("minUpdateInterval"), v10, v11);
  v16 = objc_msgSend_decodeIntegerForKey_(v4, v13, (uint64_t)CFSTR("schedulerConfigIdealInterval"), v14, v15);
  objc_msgSend_decodeIntegerForKey_(v4, v17, (uint64_t)CFSTR("schedulerConfigMinInterval"), v18, v19);

  return (BDSDistributedPriceTrackingConfigUpdateScheduleStep *)MEMORY[0x24BEDD108](self, sel_initWithDuration_minUpdateInterval_schedulerConfigIdealInterval_schedulerConfigMinInterval_, v8, v12, v16);
}

- (int64_t)duration
{
  return self->_duration;
}

- (int64_t)minUpdateInterval
{
  return self->_minUpdateInterval;
}

- (int64_t)schedulerConfigIdealInterval
{
  return self->_schedulerConfigIdealInterval;
}

- (int64_t)schedulerConfigMinInterval
{
  return self->_schedulerConfigMinInterval;
}

@end
