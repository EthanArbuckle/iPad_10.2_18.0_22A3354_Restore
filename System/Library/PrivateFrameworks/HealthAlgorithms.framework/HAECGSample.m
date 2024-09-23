@implementation HAECGSample

- (void)setTimestampWithRtpTicks:(unint64_t)a3 withMetadata:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  double v11;
  NSDate *v12;
  NSDate *timestamp;
  id v14;

  v14 = a4;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("timestampReference"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("rtpTicksPerSecond"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("wallclockTimeReference"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", (double)(a3 - v7) / (double)v9 + v11);
  timestamp = self->_timestamp;
  self->_timestamp = v12;

}

- (id)decodeHALV2Payload:(id *)a3 withMetadata:(id)a4 withPayloadVersion2:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  _BOOL4 v11;
  float v12;
  HAECGData *v13;
  double v14;
  HAECGData *v15;

  v5 = a5;
  self->_frequency = (float)*(unsigned int *)((char *)&a3->var5 + 1) * 0.000015259;
  -[HAECGSample setTimestampWithRtpTicks:withMetadata:](self, "setTimestampWithRtpTicks:withMetadata:", *(_QWORD *)((char *)&a3->var4 + 1), a4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 16);
  if (a3->var2)
  {
    v8 = 0;
    v9 = (unsigned int *)((char *)&a3->var6.var4 + 3);
    do
    {
      v10 = *v9;
      v11 = (*v9 & 0xFFFFFD7F | *(v9 - 1) & 0x2660) != 0;
      v12 = CinnAlgs::convertAdcAcVolt((uint64_t)a3, (unsigned __int16)v8, v5);
      v13 = [HAECGData alloc];
      *(float *)&v14 = v12;
      v15 = -[HAECGData initWithFlags:value:](v13, "initWithFlags:value:", (v10 >> 6) & 2 | v11, v14);
      objc_msgSend(v7, "addObject:", v15);
      v9 += 7;

      ++v8;
    }
    while (v8 < a3->var2);
  }
  return v7;
}

- (id)decodeHALV1Payload:(id *)a3 withMetadata:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _BYTE *v10;
  void *v11;
  _BYTE v13[32];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[31];

  v6 = a4;
  v39 = 0u;
  memset(v40, 0, sizeof(v40));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  *(_OWORD *)&v13[16] = 0u;
  v14 = 0u;
  *(_OWORD *)v13 = 0u;
  v13[4] = a3->var2;
  *(_QWORD *)&v13[9] = *(_QWORD *)((char *)&a3->var4 + 1);
  *(_DWORD *)&v13[17] = *(_DWORD *)((char *)&a3->var5 + 1);
  *(_WORD *)&v13[25] = *(_WORD *)((char *)&a3->var5 + 5);
  if (v13[4])
  {
    v7 = 0;
    v8 = 28 * v13[4];
    v9 = (char *)&a3->var6 + 1;
    do
    {
      v10 = &v13[v7];
      *(_WORD *)(v10 + 33) = *(_WORD *)v9;
      *(_QWORD *)(v10 + 35) = *(_QWORD *)(v9 + 2);
      *(_DWORD *)(v10 + 47) = *((_DWORD *)v9 + 3);
      v7 += 28;
      v9 += 18;
    }
    while (v8 != v7);
  }
  -[HAECGSample decodeHALV2Payload:withMetadata:withPayloadVersion2:](self, "decodeHALV2Payload:withMetadata:withPayloadVersion2:", v13, v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)parseRepresentation:(id)a3 withMetadata:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSArray *v17;
  NSArray *v18;
  NSObject *v19;
  BOOL v20;
  unint64_t v22;
  NSArray *v23;
  NSArray *ecgData;
  NSString *v25;
  NSString *sessionIdentifier;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  unsigned __int16 v34;
  int v35;
  _BYTE v36[492];
  int v37;
  char v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v34 = 0;
  if ((unint64_t)objc_msgSend(v6, "length") <= 1)
  {
    ha_get_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[HAECGSample parseRepresentation:withMetadata:].cold.1(&v35, objc_msgSend(v6, "length"));

    goto LABEL_28;
  }
  if (!v7)
  {
    ha_get_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[HAECGSample parseRepresentation:withMetadata:].cold.2(v19);
    goto LABEL_27;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timestampReference"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_25:
    ha_get_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[HAECGSample parseRepresentation:withMetadata:].cold.3(v19);
LABEL_27:

    goto LABEL_28;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rtpTicksPerSecond"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_24:

    goto LABEL_25;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("wallclockTimeReference"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_23:

    goto LABEL_24;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sessionIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_22:

    goto LABEL_23;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ecgApp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

    goto LABEL_22;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("contactDetected"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_25;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("contactDetected"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if ((v16 & 1) == 0)
    goto LABEL_28;
  objc_msgSend(v6, "getBytes:length:", &v34, 2);
  if (v34 > 0x105u)
  {
    if (v34 == 262)
    {
      if (objc_msgSend(v6, "length") != 13)
      {
        ha_get_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          -[HAECGSample parseRepresentation:withMetadata:].cold.6(&v35, objc_msgSend(v6, "length"));
        goto LABEL_57;
      }
      objc_msgSend(v6, "getBytes:length:", &v37, 13);
      -[HAECGSample setTimestampWithRtpTicks:withMetadata:](self, "setTimestampWithRtpTicks:withMetadata:", v39, v7);
      if (!v38)
        goto LABEL_41;
      v22 = self->_flags | 1;
    }
    else
    {
      if (v34 != 265)
        goto LABEL_28;
      if (objc_msgSend(v6, "length") != 13)
      {
        ha_get_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          -[HAECGSample parseRepresentation:withMetadata:].cold.6(&v35, objc_msgSend(v6, "length"));
        goto LABEL_57;
      }
      objc_msgSend(v6, "getBytes:length:", &v37, 13);
      -[HAECGSample setTimestampWithRtpTicks:withMetadata:](self, "setTimestampWithRtpTicks:withMetadata:", v39, v7);
      if (!v38)
        goto LABEL_41;
      v22 = self->_flags | 2;
    }
    self->_flags = v22;
    goto LABEL_41;
  }
  if (v34 == 170)
  {
    if (objc_msgSend(v6, "length") == 315)
    {
      objc_msgSend(v6, "getBytes:length:", &v35, 315);
      -[HAECGSample decodeHALV1Payload:withMetadata:](self, "decodeHALV1Payload:withMetadata:", v36, v7);
      v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
      ecgData = self->_ecgData;
      self->_ecgData = v23;

      goto LABEL_41;
    }
    ha_get_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      -[HAECGSample parseRepresentation:withMetadata:].cold.4(&v37, objc_msgSend(v6, "length"));
    goto LABEL_57;
  }
  if (v34 != 216)
  {
LABEL_28:
    v20 = 0;
    goto LABEL_29;
  }
  if (objc_msgSend(v6, "length") != 483)
  {
    ha_get_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      -[HAECGSample parseRepresentation:withMetadata:].cold.5(&v37, objc_msgSend(v6, "length"));
LABEL_57:

    goto LABEL_28;
  }
  objc_msgSend(v6, "getBytes:length:", &v35, 483);
  -[HAECGSample decodeHALV2Payload:withMetadata:withPayloadVersion2:](self, "decodeHALV2Payload:withMetadata:withPayloadVersion2:", v36, v7, 1);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v18 = self->_ecgData;
  self->_ecgData = v17;

LABEL_41:
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sessionIdentifier"));
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  sessionIdentifier = self->_sessionIdentifier;
  self->_sessionIdentifier = v25;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ecgApp"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "BOOLValue");
  v29 = 4;
  if (!v28)
    v29 = 0;
  self->_flags |= v29;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rightWrist"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "BOOLValue");
  v32 = 8;
  if (v31)
    v32 = 0;
  self->_flags |= v32;

  v20 = 1;
LABEL_29:

  return v20;
}

- (HAECGSample)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v7;
  id v8;
  HAECGSample *v9;
  HAECGSample *v10;
  HAECGSample *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HAECGSample;
  v9 = -[HAECGSample init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    -[HAECGSample parseRepresentation:withMetadata:](v9, "parseRepresentation:withMetadata:", v7, v8);
    v11 = v10;
  }

  return v10;
}

- (HAECGSample)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  HAECGSample *v8;
  HAECGSample *v9;
  HAECGSample *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAECGSample;
  v8 = -[HAECGSample init](&v12, sel_init);
  v9 = v8;
  if (v8 && -[HAECGSample parseRepresentation:withMetadata:](v8, "parseRepresentation:withMetadata:", v6, v7))
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (float)frequency
{
  return self->_frequency;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSArray)ecgData
{
  return self->_ecgData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecgData, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (void)parseRepresentation:(_DWORD *)a1 withMetadata:(uint64_t)a2 .cold.1(_DWORD *a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  *a1 = 134218240;
  OUTLINED_FUNCTION_1((uint64_t)a1, a2, 2);
  OUTLINED_FUNCTION_0_1(&dword_216C97000, v2, v3, "invalid packet length: expected >= %zu, received %zu", v4);
}

- (void)parseRepresentation:(os_log_t)log withMetadata:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_216C97000, log, OS_LOG_TYPE_ERROR, "Metadata is nil", v1, 2u);
}

- (void)parseRepresentation:(os_log_t)log withMetadata:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_216C97000, log, OS_LOG_TYPE_FAULT, "Required metadata key(s) missing", v1, 2u);
}

- (void)parseRepresentation:(_DWORD *)a1 withMetadata:(uint64_t)a2 .cold.4(_DWORD *a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  *a1 = 134218240;
  OUTLINED_FUNCTION_1((uint64_t)a1, a2, 315);
  OUTLINED_FUNCTION_0_1(&dword_216C97000, v2, v3, "invalid packet length: expected = %zu, received %zu", v4);
}

- (void)parseRepresentation:(_DWORD *)a1 withMetadata:(uint64_t)a2 .cold.5(_DWORD *a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  *a1 = 134218240;
  OUTLINED_FUNCTION_1((uint64_t)a1, a2, 483);
  OUTLINED_FUNCTION_0_1(&dword_216C97000, v2, v3, "invalid packet length: expected = %zu, received %zu", v4);
}

- (void)parseRepresentation:(_DWORD *)a1 withMetadata:(uint64_t)a2 .cold.6(_DWORD *a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  *a1 = 134218240;
  OUTLINED_FUNCTION_1((uint64_t)a1, a2, 13);
  OUTLINED_FUNCTION_0_1(&dword_216C97000, v2, v3, "invalid packet length: expected = %zu, received %zu", v4);
}

@end
