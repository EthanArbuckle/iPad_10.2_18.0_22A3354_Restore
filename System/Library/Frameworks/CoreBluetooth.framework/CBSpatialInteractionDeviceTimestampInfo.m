@implementation CBSpatialInteractionDeviceTimestampInfo

- (id)description
{
  return -[CBSpatialInteractionDeviceTimestampInfo descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v11;

  if (a3 > 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&self->_timestamp);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_timestamp == 0.0)
      goto LABEL_5;
LABEL_8:
    NSAppendPrintF_safe();
    v7 = 0;
    if (!self->_reason)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (qword_1ECF9A200 != -1)
    dispatch_once(&qword_1ECF9A200, &__block_literal_global_633);
  v4 = (void *)qword_1ECF9A1F8;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", self->_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_timestamp != 0.0)
    goto LABEL_8;
LABEL_5:
  v7 = 0;
  if (self->_reason)
  {
LABEL_9:
    CUPrintFlags32();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v8 = v7;

    v7 = v8;
  }
LABEL_10:
  if (self->_duplicateCount)
  {
    NSAppendPrintF_safe();
    v9 = v7;

    v7 = v9;
  }

  return v7;
}

uint64_t __64__CBSpatialInteractionDeviceTimestampInfo_descriptionWithLevel___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECF9A1F8;
  qword_1ECF9A1F8 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ECF9A1F8, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
}

- (unsigned)duplicateCount
{
  return self->_duplicateCount;
}

- (void)setDuplicateCount:(unsigned __int8)a3
{
  self->_duplicateCount = a3;
}

- (unsigned)reason
{
  return self->_reason;
}

- (void)setReason:(unsigned __int8)a3
{
  self->_reason = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
