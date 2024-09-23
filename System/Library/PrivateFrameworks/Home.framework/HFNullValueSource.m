@implementation HFNullValueSource

- (BOOL)isNaturalLightingSupportedForProfile:(id)a3
{
  return 0;
}

- (BOOL)isNaturalLightingEnabledForProfile:(id)a3
{
  return 0;
}

- (id)writeNaturalLightEnabledState:(BOOL)a3 forProfile:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", a3, a4);
}

- (id)readValuesForCharacteristics:(id)a3
{
  void *v3;
  HFCharacteristicBatchReadResponse *v4;
  void *v5;

  objc_msgSend(a3, "na_map:", &__block_literal_global_106);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFCharacteristicBatchReadResponse initWithReadResponses:contextProvider:]([HFCharacteristicBatchReadResponse alloc], "initWithReadResponses:contextProvider:", v3, 0);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

HFCharacteristicReadResponse *__50__HFNullValueSource_readValuesForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HFCharacteristicReadResponse *v3;
  void *v4;
  HFCharacteristicReadResponse *v5;

  v2 = a2;
  v3 = [HFCharacteristicReadResponse alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("ExplicitlyDisallowed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFCharacteristicReadResponse initWithCharacteristic:readTraits:value:error:](v3, "initWithCharacteristic:readTraits:value:error:", v2, v4, 0, 0);

  return v5;
}

- (id)readValuesForCharacteristicTypes:(id)a3 inServices:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HFCharacteristicBatchReadResponse *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__HFNullValueSource_readValuesForCharacteristicTypes_inServices___block_invoke;
  v12[3] = &unk_1EA72DFA0;
  v13 = v5;
  v6 = v5;
  objc_msgSend(a4, "na_map:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_setByFlattening");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HFCharacteristicBatchReadResponse initWithReadResponses:contextProvider:]([HFCharacteristicBatchReadResponse alloc], "initWithReadResponses:contextProvider:", v8, 0);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __65__HFNullValueSource_readValuesForCharacteristicTypes_inServices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__HFNullValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_2;
  v9[3] = &unk_1EA72BB50;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v5, "na_filter:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_5_6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __65__HFNullValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

HFCharacteristicReadResponse *__65__HFNullValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  HFCharacteristicReadResponse *v3;
  void *v4;
  HFCharacteristicReadResponse *v5;

  v2 = a2;
  v3 = [HFCharacteristicReadResponse alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("ExplicitlyDisallowed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFCharacteristicReadResponse initWithCharacteristic:readTraits:value:error:](v3, "initWithCharacteristic:readTraits:value:error:", v2, v4, 0, 0);

  return v5;
}

- (id)writeValuesForCharacteristics:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", a3);
}

- (id)cachedValueForCharacteristic:(id)a3
{
  return 0;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_260 != -1)
    dispatch_once(&_MergedGlobals_260, &__block_literal_global_10_6);
  return (NAIdentity *)(id)qword_1ED379170;
}

void __32__HFNullValueSource_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379170;
  qword_1ED379170 = v0;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (id)mediaProfileContainerForRouteID:(id)a3
{
  return 0;
}

- (int64_t)lastPlaybackStateForProfileForRouteID:(id)a3
{
  return 0;
}

- (id)writePlaybackState:(int64_t)a3 playbackArchive:(id)a4 forRouteID:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", a3, a4, a5);
}

- (BOOL)hasPendingWritesForRouteID:(id)a3
{
  return 0;
}

- (id)cachedPlaybackStateWriteErrorForRouteID:(id)a3
{
  return 0;
}

@end
