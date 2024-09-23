@implementation BCSFlagMeasurement

+ (id)newFlagMeasurement:(int64_t)a3 withHandlers:(id)a4
{
  id v6;
  BCSFlagMeasurement *v7;
  id v8;
  BCSFlagMeasurement *v9;
  objc_super v11;

  v6 = a4;
  v7 = [BCSFlagMeasurement alloc];
  v8 = v6;
  if (v7)
  {
    v11.receiver = v7;
    v11.super_class = (Class)BCSFlagMeasurement;
    v9 = (BCSFlagMeasurement *)objc_msgSendSuper2(&v11, sel__init);
    v7 = v9;
    if (v9)
    {
      v9->_flagMeasurementType = a3;
      objc_storeStrong((id *)&v9->_realTimeMeasurementHandlers, a4);
    }
  }

  return v7;
}

- (void)setFlag:(BOOL)a3
{
  NSArray *realTimeMeasurementHandlers;
  _QWORD v4[5];

  if (!self || !self->_flagWasSet)
  {
    self->_flag = a3;
    self->_flagWasSet = 1;
    realTimeMeasurementHandlers = self->_realTimeMeasurementHandlers;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __30__BCSFlagMeasurement_setFlag___block_invoke;
    v4[3] = &unk_24C39CD08;
    v4[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](realTimeMeasurementHandlers, "enumerateObjectsUsingBlock:", v4);
  }
}

void __30__BCSFlagMeasurement_setFlag___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "flagMeasurementDidChange:forMeasurement:", objc_msgSend(v3, "flag"), *(_QWORD *)(a1 + 32));

}

- (BOOL)flag
{
  return self->_flag;
}

- (int64_t)flagMeasurementType
{
  return self->_flagMeasurementType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realTimeMeasurementHandlers, 0);
}

@end
