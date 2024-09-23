@implementation NRSwitchRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRSwitchRecord)initWithDeviceID:(id)a3 date:(id)a4 switchIndex:(unsigned int)a5
{
  id v8;
  id v9;
  NRSwitchRecord *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;

  v8 = a3;
  v9 = a4;
  v10 = -[NRSwitchRecord init](self, "init");
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "fromUUID:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v10->super._deviceIDBytes, v11);

    v12 = v9;
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      *(_BYTE *)&v10->super._has |= 1u;
      v10->super._dateTimeInterval = v14;
    }
    else
    {
      *(_BYTE *)&v10->super._has &= ~1u;
    }

    *(_BYTE *)&v10->super._has |= 2u;
    v10->super._switchIndex = a5;
  }

  return v10;
}

@end
