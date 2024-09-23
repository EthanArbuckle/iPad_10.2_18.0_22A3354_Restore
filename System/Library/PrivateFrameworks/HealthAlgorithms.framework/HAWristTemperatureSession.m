@implementation HAWristTemperatureSession

- (id)sessionIntervalV0WithStartTime:(double)a3
{
  void *v5;
  unint64_t v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  _DWORD v12[6];

  -[HAWristTemperatureSession representation](self, "representation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getBytes:range:", v12, -[HAWristTemperatureSession firstSampleOffset](self, "firstSampleOffset")+ 21 * -[HAWristTemperatureSession numWristTemperatures](self, "numWristTemperatures")- 21, 21);

  if (-[HAWristTemperatureSession numWristTemperatures](self, "numWristTemperatures"))
  {
    LODWORD(v6) = v12[0];
    v7 = (double)v6 / 1000.0;
  }
  else
  {
    v7 = 0.0;
  }
  v8 = objc_alloc(MEMORY[0x24BDD1508]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", a3);
  v10 = (void *)objc_msgSend(v8, "initWithStartDate:duration:", v9, v7);

  return v10;
}

- (BOOL)parsePacket:()variant<PackedWristTemperatureHeaderV0
{
  uint64_t var5_low;
  int v5;
  uint64_t v6;
  char v7;
  HAWristTemperatureSession **v9;
  HAWristTemperatureSession *v10;
  HAWristTemperatureSession ***v11;

  v9 = &v10;
  v10 = self;
  var5_low = LODWORD(a3->var0.var0.var1.var0.var5);
  if ((_DWORD)var5_low == -1)
    goto LABEL_6;
  v11 = &v9;
  v5 = ((uint64_t (*)(HAWristTemperatureSession ****, variant<PackedWristTemperatureHeaderV0, PackedWristTemperatureHeaderV1> *))off_24D60BA80[var5_low])(&v11, a3);
  if (v5)
  {
    v6 = LODWORD(a3->var0.var0.var1.var0.var5);
    if ((_DWORD)v6 != -1)
    {
      v11 = &v9;
      v7 = ((uint64_t (*)(HAWristTemperatureSession ****, variant<PackedWristTemperatureHeaderV0, PackedWristTemperatureHeaderV1> *))off_24D60BA90[v6])(&v11, a3);
      v10->_isPublishable = v7;
      return v5;
    }
LABEL_6:
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  return v5;
}

- (HAWristTemperatureSession)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(id)a5
{
  id v7;
  HAWristTemperatureSession *v8;
  BOOL v9;
  NSObject *v10;
  HAWristTemperatureSession *v11;
  NSObject *v12;
  _DWORD v14[8];
  _BYTE v15[28];
  int v16;
  objc_super v17;
  _DWORD v18[6];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    v17.receiver = self;
    v17.super_class = (Class)HAWristTemperatureSession;
    v8 = -[HAWristTemperatureSession init](&v17, sel_init);
    if (v8)
    {
      objc_msgSend(v7, "getBytes:length:", &v8->_dataVersion, 1);
      objc_storeStrong((id *)&v8->_representation, a3);
      if (v8->_dataVersion == 1)
      {
        v14[7] = 1;
        v9 = -[HAWristTemperatureSession parsePacket:](v8, "parsePacket:", v14);
      }
      else
      {
        if (v8->_dataVersion)
        {
          ha_get_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            -[HAWristTemperatureSession initWithBinarySampleRepresentation:metadata:timestamp:].cold.2(&v8->_dataVersion, v12);

          goto LABEL_17;
        }
        v16 = 0;
        v9 = -[HAWristTemperatureSession parsePacket:](v8, "parsePacket:", v15);
      }
      if (v9)
      {
        self = v8;
        v11 = self;
        goto LABEL_18;
      }
LABEL_17:
      v11 = 0;
      self = v8;
      goto LABEL_18;
    }
    self = 0;
  }
  else
  {
    ha_get_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[HAWristTemperatureSession initWithBinarySampleRepresentation:metadata:timestamp:].cold.1(v18, objc_msgSend(v7, "length"));

  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (HAWristTemperatureEnumerator)wristTemperatureEnumerator
{
  HAWristTemperatureEnumerator *v3;
  void *v4;
  void *v5;
  void *v6;
  HAWristTemperatureEnumerator *v7;

  v3 = [HAWristTemperatureEnumerator alloc];
  -[HAWristTemperatureSession representation](self, "representation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAWristTemperatureSession sessionInterval](self, "sessionInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAWristTemperatureEnumerator initWithData:withSessionStartDate:numWristTemperatures:firstSampleOffset:](v3, "initWithData:withSessionStartDate:numWristTemperatures:firstSampleOffset:", v4, v6, -[HAWristTemperatureSession numWristTemperatures](self, "numWristTemperatures"), -[HAWristTemperatureSession firstSampleOffset](self, "firstSampleOffset"));

  return v7;
}

- (NSDateInterval)sessionInterval
{
  return self->_sessionInterval;
}

- (NSString)algorithmVersion
{
  return self->_algorithmVersion;
}

- (float)a0CorrectionCoefficient
{
  return self->_a0CorrectionCoefficient;
}

- (float)c0CorrectionCoefficient
{
  return self->_c0CorrectionCoefficient;
}

- (NSMeasurement)meanQuiescentPower
{
  return self->_meanQuiescentPower;
}

- (NSMeasurement)stdDevQuiescentPower
{
  return self->_stdDevQuiescentPower;
}

- (BOOL)isPublishable
{
  return self->_isPublishable;
}

- (NSData)representation
{
  return self->_representation;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unint64_t)numWristTemperatures
{
  return self->_numWristTemperatures;
}

- (unint64_t)firstSampleOffset
{
  return self->_firstSampleOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representation, 0);
  objc_storeStrong((id *)&self->_stdDevQuiescentPower, 0);
  objc_storeStrong((id *)&self->_meanQuiescentPower, 0);
  objc_storeStrong((id *)&self->_algorithmVersion, 0);
  objc_storeStrong((id *)&self->_sessionInterval, 0);
}

- (void)initWithBinarySampleRepresentation:(_DWORD *)a1 metadata:(uint64_t)a2 timestamp:.cold.1(_DWORD *a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  *a1 = 134218240;
  OUTLINED_FUNCTION_1((uint64_t)a1, a2, 1);
  OUTLINED_FUNCTION_0_0(&dword_216C97000, v2, (uint64_t)v2, "invalid packet length: expected >= %zu, received %zu", v3);
}

- (void)initWithBinarySampleRepresentation:(unsigned __int8 *)a1 metadata:(NSObject *)a2 timestamp:.cold.2(unsigned __int8 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_216C97000, a2, OS_LOG_TYPE_FAULT, "unrecognized wrist temperature reading data version (%uhh)", (uint8_t *)v3, 8u);
}

@end
