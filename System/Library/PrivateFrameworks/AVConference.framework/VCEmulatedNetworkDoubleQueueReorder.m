@implementation VCEmulatedNetworkDoubleQueueReorder

- (VCEmulatedNetworkDoubleQueueReorder)initWithPolicies:(id)a3
{
  VCEmulatedNetworkDoubleQueueReorder *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  NSObject *v9;
  double probability;
  double correlation;
  int reorderGap;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCEmulatedNetworkDoubleQueueReorder;
  v4 = -[VCEmulatedNetworkDoubleQueue initWithPolicies:](&v14, sel_initWithPolicies_);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DoubleQueueImpairments"));
    objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ReorderProbability")), "doubleValue");
    v4->_probability = v6;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ReorderCorrelation"))
      && objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ReorderGap")))
    {
      v4->_useMarkovModel = 1;
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ReorderCorrelation")), "doubleValue");
      v4->_correlation = v7;
      v4->_reorderGap = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ReorderGap")), "integerValue");
      v4->_state = 0;
      v4->_gap = 1;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        probability = v4->_probability;
        correlation = v4->_correlation;
        reorderGap = v4->_reorderGap;
        *(_DWORD *)buf = 136316418;
        v16 = v8;
        v17 = 2080;
        v18 = "-[VCEmulatedNetworkDoubleQueueReorder initWithPolicies:]";
        v19 = 1024;
        v20 = 26;
        v21 = 2048;
        v22 = probability;
        v23 = 2048;
        v24 = correlation;
        v25 = 1024;
        v26 = reorderGap;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reorder profile probability: %2.2f correlation: %2.2f gap: %d", buf, 0x36u);
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)VCEmulatedNetworkDoubleQueueReorder;
  -[VCEmulatedNetworkDoubleQueue dealloc](&v2, sel_dealloc);
}

- (BOOL)shouldSendPacketImmediatelyMM
{
  char v3;
  int gap;
  int reorderGap;
  uint64_t v6;
  double v7;
  int v8;
  BOOL v9;

  switch(self->_state)
  {
    case 0xFFFFFFFF:
      NSLog(CFSTR("Invalid state %d!"), a2, 0xFFFFFFFFLL);
      goto LABEL_3;
    case 0:
      gap = self->_gap;
      reorderGap = self->_reorderGap;
      v3 = gap >= reorderGap;
      if (gap < reorderGap)
      {
        self->_state = 0;
        gap = self->_gap + 1;
        self->_gap = gap;
        reorderGap = self->_reorderGap;
      }
      if (gap == reorderGap - 1)
      {
        self->_gap = 1;
        self->_state = 1;
      }
      return v3 & 1;
    case 1:
      v6 = 64;
      goto LABEL_10;
    case 2:
      v6 = 72;
LABEL_10:
      v7 = *(double *)((char *)&self->super.super.super.isa + v6);
      v8 = 2;
      if (v7 <= *(double *)"")
      {
        v3 = 1;
      }
      else
      {
        v9 = (double)(unsigned __int16)arc4random_uniform(0xFFFFu) / 65535.0 <= v7;
        v3 = !v9;
        if (v9)
          v8 = 3;
        else
          v8 = 2;
      }
      self->_state = v8;
      break;
    case 3:
      v3 = 0;
      self->_state = 0;
      break;
    default:
LABEL_3:
      v3 = 1;
      break;
  }
  return v3 & 1;
}

- (void)push:(id)a3
{
  double probability;
  int *v6;
  uint64_t v7;
  NSObject *v8;
  void (**pushCompletionHandler)(id, id);

  if (!self->_useMarkovModel)
  {
    probability = self->_probability;
    if (probability > *(double *)"" && (double)(unsigned __int16)arc4random_uniform(0xFFFFu) / 65535.0 <= probability)
      goto LABEL_7;
LABEL_6:
    v6 = &OBJC_IVAR___VCEmulatedNetworkDoubleQueue__networkQueueA;
    goto LABEL_8;
  }
  if (-[VCEmulatedNetworkDoubleQueueReorder shouldSendPacketImmediatelyMM](self, "shouldSendPacketImmediatelyMM"))
    goto LABEL_6;
LABEL_7:
  v6 = &OBJC_IVAR___VCEmulatedNetworkDoubleQueue__networkQueueB;
LABEL_8:
  if (objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "write:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCEmulatedNetworkDoubleQueueReorder push:].cold.1(v7, a3, v8);
    }
  }
  else
  {
    pushCompletionHandler = (void (**)(id, id))self->super.super._pushCompletionHandler;
    if (pushCompletionHandler)
      pushCompletionHandler[2](pushCompletionHandler, a3);
  }
}

- (void)push:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = 136315906;
  if ((objc_msgSend(a2, "packetID") & 1) != 0)
    v5 = 65;
  else
    v5 = 66;
  v7 = a1;
  v8 = 2080;
  v9 = "-[VCEmulatedNetworkDoubleQueueReorder push:]";
  v10 = 1024;
  v11 = 90;
  v12 = 1024;
  v13 = v5;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to write to network queue %c", (uint8_t *)&v6, 0x22u);
}

@end
