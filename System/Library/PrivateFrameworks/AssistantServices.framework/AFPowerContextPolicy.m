@implementation AFPowerContextPolicy

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 siriUIPolicy:(AFPowerContext *)a6 thermalMitigationLevel:(unint64_t)a7 platformContext:(unint64_t)a8
{
  AFPowerContextPolicy *result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AFPowerContextPolicy;
  result = -[AFPowerContextPolicy init](&v19, sel_init);
  if (result)
  {
    v15 = *(_OWORD *)&a3->cpuContext;
    result->_asrAssistantPolicy.gpuContext = a3->gpuContext;
    *(_OWORD *)&result->_asrAssistantPolicy.cpuContext = v15;
    v16 = *(_OWORD *)&a4->cpuContext;
    result->_asrDictationPolicy.gpuContext = a4->gpuContext;
    *(_OWORD *)&result->_asrDictationPolicy.cpuContext = v16;
    v17 = *(_OWORD *)&a5->cpuContext;
    result->_ttsPolicy.gpuContext = a5->gpuContext;
    *(_OWORD *)&result->_ttsPolicy.cpuContext = v17;
    v18 = *(_OWORD *)&a6->cpuContext;
    result->_siriUIPolicy.gpuContext = a6->gpuContext;
    *(_OWORD *)&result->_siriUIPolicy.cpuContext = v18;
    result->_thermalMitigationLevel = a7;
    result->_platformContext = a8;
  }
  return result;
}

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 siriUIPolicy:(AFPowerContext *)a6 thermalMitigationLevel:(unint64_t)a7
{
  AFPowerContext v8;
  AFPowerContext v9;
  AFPowerContext v10;
  AFPowerContext v11;

  v11 = *a3;
  v10 = *a4;
  v9 = *a5;
  v8 = *a6;
  return -[AFPowerContextPolicy initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:](self, "initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:", &v11, &v10, &v9, &v8, a7, 0);
}

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 siriUIPolicy:(AFPowerContext *)a6
{
  AFPowerContext v7;
  AFPowerContext v8;
  AFPowerContext v9;
  AFPowerContext v10;

  v10 = *a3;
  v9 = *a4;
  v8 = *a5;
  v7 = *a6;
  return -[AFPowerContextPolicy initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:](self, "initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:", &v10, &v9, &v8, &v7, 0, 0);
}

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 thermalMitigationLevel:(unint64_t)a6
{
  _QWORD v7[3];
  AFPowerContext v8;
  AFPowerContext v9;
  AFPowerContext v10;

  v10 = *a3;
  v9 = *a4;
  v8 = *a5;
  memset(v7, 0, sizeof(v7));
  return -[AFPowerContextPolicy initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:](self, "initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:", &v10, &v9, &v8, v7, a6, 0);
}

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 thermalMitigationLevel:(unint64_t)a6 platformContext:(unint64_t)a7
{
  _QWORD v8[3];
  AFPowerContext v9;
  AFPowerContext v10;
  AFPowerContext v11;

  v11 = *a3;
  v10 = *a4;
  v9 = *a5;
  memset(v8, 0, sizeof(v8));
  return -[AFPowerContextPolicy initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:](self, "initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:", &v11, &v10, &v9, v8, a6, a7);
}

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5
{
  _QWORD v6[3];
  AFPowerContext v7;
  AFPowerContext v8;
  AFPowerContext v9;

  v9 = *a3;
  v8 = *a4;
  v7 = *a5;
  memset(v6, 0, sizeof(v6));
  return -[AFPowerContextPolicy initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:](self, "initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:", &v9, &v8, &v7, v6, 0, 0);
}

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 platformContext:(unint64_t)a6
{
  _QWORD v7[3];
  AFPowerContext v8;
  AFPowerContext v9;
  AFPowerContext v10;

  v10 = *a3;
  v9 = *a4;
  v8 = *a5;
  memset(v7, 0, sizeof(v7));
  return -[AFPowerContextPolicy initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:](self, "initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:", &v10, &v9, &v8, v7, 0, a6);
}

- (AFPowerContextPolicy)initWithEncodedPolicy:(unint64_t)a3
{
  unint64_t v3;
  char *v4;
  uint64x2_t v5;
  int8x16_t v6;
  objc_super v8;

  v3 = a3;
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)AFPowerContextPolicy;
    v4 = -[AFPowerContextPolicy init](&v8, sel_init);
    if (v4)
    {
      v5 = (uint64x2_t)vdupq_n_s64(v3);
      *((_QWORD *)v4 + 3) = v3 & 3;
      v6 = (int8x16_t)vdupq_n_s64(3uLL);
      *((int8x16_t *)v4 + 2) = vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_19B0EC6A0), v6);
      *((int8x16_t *)v4 + 3) = vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_19B0EC6B0), v6);
      *((int8x16_t *)v4 + 4) = vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_19B0EC6C0), v6);
      *((int8x16_t *)v4 + 5) = vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_19B0EC6D0), v6);
      *((int8x16_t *)v4 + 6) = vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_19B0EC6E0), v6);
      *((_QWORD *)v4 + 14) = (v3 >> 22) & 3;
      *(int8x16_t *)(v4 + 8) = vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_19B0EC6F0), (int8x16_t)xmmword_19B0EC700);
    }
    self = v4;
    v3 = (unint64_t)self;
  }

  return (AFPowerContextPolicy *)v3;
}

- (unint64_t)encodePolicy
{
  return self->_asrAssistantPolicy.cpuContext
       + 0x1000000
       + vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64((int64x2_t)vshlq_u64(*(uint64x2_t *)&self->_asrAssistantPolicy.aneContext, (uint64x2_t)xmmword_19B0EC720), (int64x2_t)vshlq_u64(*(uint64x2_t *)&self->_asrDictationPolicy.gpuContext, (uint64x2_t)xmmword_19B0EC710)), vaddq_s64((int64x2_t)vshlq_u64(*(uint64x2_t *)&self->_asrDictationPolicy.cpuContext, (uint64x2_t)xmmword_19B0EC740), (int64x2_t)vshlq_u64(*(uint64x2_t *)&self->_ttsPolicy.aneContext, (uint64x2_t)xmmword_19B0EC730))), vaddq_s64((int64x2_t)vshlq_u64(*(uint64x2_t *)&self->_siriUIPolicy.aneContext, (uint64x2_t)xmmword_19B0EC760), (int64x2_t)vshlq_u64(*(uint64x2_t *)&self->_thermalMitigationLevel, (uint64x2_t)xmmword_19B0EC750))))+ (self->_siriUIPolicy.cpuContext << 18);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t cpuContext;
  unint64_t aneContext;
  unint64_t gpuContext;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t thermalMitigationLevel;
  unint64_t platformContext;
  BOOL v21;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  v5 = v4;
  cpuContext = self->_asrAssistantPolicy.cpuContext;
  if (v4)
  {
    objc_msgSend(v4, "asrAssistantPolicy");
    if (cpuContext != v34)
      goto LABEL_28;
    aneContext = self->_asrAssistantPolicy.aneContext;
    objc_msgSend(v5, "asrAssistantPolicy");
    if (aneContext != v33)
      goto LABEL_28;
    gpuContext = self->_asrAssistantPolicy.gpuContext;
    objc_msgSend(v5, "asrAssistantPolicy");
    if (gpuContext != v32)
      goto LABEL_28;
    v9 = self->_asrDictationPolicy.cpuContext;
    objc_msgSend(v5, "asrDictationPolicy");
    if (v9 != v31)
      goto LABEL_28;
    v10 = self->_asrDictationPolicy.aneContext;
    objc_msgSend(v5, "asrDictationPolicy");
    if (v10 != v30)
      goto LABEL_28;
    v11 = self->_asrDictationPolicy.gpuContext;
    objc_msgSend(v5, "asrDictationPolicy");
    if (v11 != v29)
      goto LABEL_28;
    v12 = self->_ttsPolicy.cpuContext;
    objc_msgSend(v5, "ttsPolicy");
    if (v12 != v28)
      goto LABEL_28;
    v13 = self->_ttsPolicy.aneContext;
    objc_msgSend(v5, "ttsPolicy");
    if (v13 != v27)
      goto LABEL_28;
    v14 = self->_ttsPolicy.gpuContext;
    objc_msgSend(v5, "ttsPolicy");
    if (v14 != v26)
      goto LABEL_28;
    v15 = self->_siriUIPolicy.cpuContext;
    objc_msgSend(v5, "siriUIPolicy");
    if (v15 != v25)
      goto LABEL_28;
    v16 = self->_siriUIPolicy.aneContext;
    objc_msgSend(v5, "siriUIPolicy");
    if (v16 != v24)
      goto LABEL_28;
    v17 = self->_siriUIPolicy.gpuContext;
    objc_msgSend(v5, "siriUIPolicy");
    v18 = v23;
  }
  else
  {
    if (cpuContext)
      goto LABEL_28;
    if (self->_asrAssistantPolicy.aneContext)
      goto LABEL_28;
    if (self->_asrAssistantPolicy.gpuContext)
      goto LABEL_28;
    if (self->_asrDictationPolicy.cpuContext)
      goto LABEL_28;
    if (self->_asrDictationPolicy.aneContext)
      goto LABEL_28;
    if (self->_asrDictationPolicy.gpuContext)
      goto LABEL_28;
    if (self->_ttsPolicy.cpuContext)
      goto LABEL_28;
    if (self->_ttsPolicy.aneContext)
      goto LABEL_28;
    if (self->_ttsPolicy.gpuContext)
      goto LABEL_28;
    if (self->_siriUIPolicy.cpuContext)
      goto LABEL_28;
    v18 = self->_siriUIPolicy.aneContext;
    if (v18)
      goto LABEL_28;
    v17 = self->_siriUIPolicy.gpuContext;
  }
  if (v17 != v18
    || (thermalMitigationLevel = self->_thermalMitigationLevel,
        thermalMitigationLevel != objc_msgSend(v5, "thermalMitigationLevel")))
  {
LABEL_28:
    v21 = 0;
    goto LABEL_29;
  }
  platformContext = self->_platformContext;
  v21 = platformContext == objc_msgSend(v5, "platformContext");
LABEL_29:

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AFPowerContextPolicy *v4;
  unint64_t thermalMitigationLevel;
  unint64_t platformContext;
  AFPowerContext siriUIPolicy;
  AFPowerContext ttsPolicy;
  AFPowerContext asrDictationPolicy;
  AFPowerContext asrAssistantPolicy;

  v4 = +[AFPowerContextPolicy allocWithZone:](AFPowerContextPolicy, "allocWithZone:", a3);
  thermalMitigationLevel = self->_thermalMitigationLevel;
  platformContext = self->_platformContext;
  asrAssistantPolicy = self->_asrAssistantPolicy;
  asrDictationPolicy = self->_asrDictationPolicy;
  ttsPolicy = self->_ttsPolicy;
  siriUIPolicy = self->_siriUIPolicy;
  return -[AFPowerContextPolicy initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:](v4, "initWithAsrAssistantPolicy:asrDictationPolicy:ttsPolicy:siriUIPolicy:thermalMitigationLevel:platformContext:", &asrAssistantPolicy, &asrDictationPolicy, &ttsPolicy, &siriUIPolicy, thermalMitigationLevel, platformContext);
}

- (AFPowerContextPolicy)initWithCoder:(id)a3
{
  return -[AFPowerContextPolicy initWithEncodedPolicy:](self, "initWithEncodedPolicy:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("AFPowerContextPolicy::encodedPolicy")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[AFPowerContextPolicy encodePolicy](self, "encodePolicy"), CFSTR("AFPowerContextPolicy::encodedPolicy"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)AFPowerContextPolicy;
  -[AFPowerContextPolicy description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR(" -\nASR Assistant Power Context { cpu:%lu, ane:%lu, gpu:%lu }\n"), self->_asrAssistantPolicy.cpuContext, self->_asrAssistantPolicy.aneContext, self->_asrAssistantPolicy.gpuContext);
  objc_msgSend(v5, "appendFormat:", CFSTR("ASR Dictation Power Context { cpu:%lu, ane:%lu, gpu:%lu }\n"), self->_asrDictationPolicy.cpuContext, self->_asrDictationPolicy.aneContext, self->_asrDictationPolicy.gpuContext);
  objc_msgSend(v5, "appendFormat:", CFSTR("TTS Power Context { cpu:%lu, ane:%lu, gpu:%lu }\n"), self->_ttsPolicy.cpuContext, self->_ttsPolicy.aneContext, self->_ttsPolicy.gpuContext);
  objc_msgSend(v5, "appendFormat:", CFSTR("SiriUI Power Context { cpu:%lu, ane:%lu, gpu:%lu }\n"), self->_siriUIPolicy.cpuContext, self->_siriUIPolicy.aneContext, self->_siriUIPolicy.gpuContext);
  objc_msgSend(v5, "appendFormat:", CFSTR("Thermal Mitigation Level #uxm #tml:%lu\n"), self->_thermalMitigationLevel);
  objc_msgSend(v5, "appendFormat:", CFSTR("Encoded Platform Context:%lu"), self->_platformContext);
  return v5;
}

- (AFPowerContext)asrAssistantPolicy
{
  *retstr = self[1];
  return self;
}

- (AFPowerContext)asrDictationPolicy
{
  *retstr = self[2];
  return self;
}

- (AFPowerContext)ttsPolicy
{
  *retstr = self[3];
  return self;
}

- (AFPowerContext)siriUIPolicy
{
  *retstr = self[4];
  return self;
}

- (unint64_t)thermalMitigationLevel
{
  return self->_thermalMitigationLevel;
}

- (unint64_t)platformContext
{
  return self->_platformContext;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
