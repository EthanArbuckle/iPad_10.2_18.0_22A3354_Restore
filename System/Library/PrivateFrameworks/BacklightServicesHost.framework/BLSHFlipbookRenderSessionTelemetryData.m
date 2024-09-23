@implementation BLSHFlipbookRenderSessionTelemetryData

- (BLSHFlipbookRenderSessionTelemetryData)initWithTimestamp:(double)a3 environmentIdentifiers:(id)a4 reasonEnded:(id)a5 sessionFramesHistogram:(id)a6 totalPreparationDuration:(double)a7 accumulatedLayoutDuration:(double)a8 accumulatedRenderDuration:(double)a9 preventedSleepDuration:(double)a10 didFailToRender:(BOOL)a11 timedOutEnvironmentCount:(unsigned int)a12
{
  id v23;
  id v24;
  id v25;
  BLSHFlipbookRenderSessionTelemetryData *v26;
  BLSHFlipbookRenderSessionTelemetryData *v27;
  objc_super v29;

  v23 = a4;
  v24 = a5;
  v25 = a6;
  v29.receiver = self;
  v29.super_class = (Class)BLSHFlipbookRenderSessionTelemetryData;
  v26 = -[BLSHFlipbookRenderSessionTelemetryData init](&v29, sel_init);
  v27 = v26;
  if (v26)
  {
    v26->_timestamp = a3;
    objc_storeStrong((id *)&v26->_environmentIdentifiers, a4);
    objc_storeStrong((id *)&v27->_reasonEnded, a5);
    objc_storeStrong((id *)&v27->_sessionFramesHistogram, a6);
    v27->_totalPreparationDuration = a7;
    v27->_accumulatedLayoutDuration = a8;
    v27->_accumulatedRenderDuration = a9;
    v27->_preventedSleepDuration = a10;
    v27->_didFailToRender = a11;
    v27->_timedOutEnvironmentCount = a12;
  }

  return v27;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSArray *environmentIdentifiers;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  BLSHFlipbookRenderSessionTelemetryData *v15;
  _QWORD v16[4];
  id v17;
  BLSHFlipbookRenderSessionTelemetryData *v18;

  v3 = (void *)objc_opt_new();
  v4 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __53__BLSHFlipbookRenderSessionTelemetryData_description__block_invoke;
  v16[3] = &unk_24D1BBE80;
  v5 = v3;
  v17 = v5;
  v18 = self;
  objc_msgSend(v5, "appendProem:block:", self, v16);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __53__BLSHFlipbookRenderSessionTelemetryData_description__block_invoke_2;
  v13[3] = &unk_24D1BBE80;
  v6 = v5;
  v14 = v6;
  v15 = self;
  objc_msgSend(v6, "appendBodySectionWithName:openDelimiter:closeDelimiter:block:", 0, CFSTR(" {"), CFSTR("} "), v13);
  environmentIdentifiers = self->_environmentIdentifiers;
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __53__BLSHFlipbookRenderSessionTelemetryData_description__block_invoke_3;
  v11[3] = &unk_24D1BC7F8;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v8, "appendCollection:withName:itemBlock:", environmentIdentifiers, CFSTR("environments"), v11);
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __53__BLSHFlipbookRenderSessionTelemetryData_description__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id result;
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  BLSShortLoggingStringForContinuousMachTime();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("done@"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("reason"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", CFSTR("total"), 0, *(double *)(*(_QWORD *)(a1 + 40) + 48));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", CFSTR("layout"), 0, *(double *)(*(_QWORD *)(a1 + 40) + 56));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", CFSTR("render"), 0, *(double *)(*(_QWORD *)(a1 + 40) + 64));
  if (objc_msgSend(*(id *)(a1 + 40), "preventedSleep"))
    v9 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", CFSTR("preventedSleep"), 0, *(double *)(*(_QWORD *)(a1 + 40) + 72));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count"), CFSTR("env∑"));
  result = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("failedToRender"), 1);
  v12 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 12);
  if ((_DWORD)v12)
    return (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInt:withName:", v12, CFSTR("timeouts"));
  return result;
}

id __53__BLSHFlipbookRenderSessionTelemetryData_description__block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), 0);
}

id __53__BLSHFlipbookRenderSessionTelemetryData_description__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", a2, 0);
}

- (BOOL)preventedSleep
{
  return self->_preventedSleepDuration > 0.0;
}

- (NSString)firstEnvironmentIdentifier
{
  return (NSString *)-[NSArray firstObject](self->_environmentIdentifiers, "firstObject");
}

- (unsigned)environmentCount
{
  return -[NSArray count](self->_environmentIdentifiers, "count");
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSArray)environmentIdentifiers
{
  return self->_environmentIdentifiers;
}

- (NSString)reasonEnded
{
  return self->_reasonEnded;
}

- (BLSHFlipbookFramesHistogram)sessionFramesHistogram
{
  return self->_sessionFramesHistogram;
}

- (double)totalPreparationDuration
{
  return self->_totalPreparationDuration;
}

- (double)accumulatedLayoutDuration
{
  return self->_accumulatedLayoutDuration;
}

- (double)accumulatedRenderDuration
{
  return self->_accumulatedRenderDuration;
}

- (double)preventedSleepDuration
{
  return self->_preventedSleepDuration;
}

- (BOOL)didFailToRender
{
  return self->_didFailToRender;
}

- (unsigned)timedOutEnvironmentCount
{
  return self->_timedOutEnvironmentCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionFramesHistogram, 0);
  objc_storeStrong((id *)&self->_reasonEnded, 0);
  objc_storeStrong((id *)&self->_environmentIdentifiers, 0);
}

@end
