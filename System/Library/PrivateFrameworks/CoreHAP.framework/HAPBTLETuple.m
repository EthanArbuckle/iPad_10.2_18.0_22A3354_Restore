@implementation HAPBTLETuple

- (id)description
{
  if (-[HAPBTLETuple atvState](self, "atvState"))
    +[HAPBTLETuple atvState2String:](HAPBTLETuple, "atvState2String:", self->_atvState);
  else
    +[HAPBTLETuple state2String:](HAPBTLETuple, "state2String:", &self->_state);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)atvState
{
  return self->_atvState;
}

- (void)setAtvState:(unint64_t)a3
{
  self->_atvState = a3;
}

- (BTStatus)state
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1].leAcc;
  *(_OWORD *)&retstr->sco = *(_OWORD *)&self->isScanning;
  *(_OWORD *)&retstr->remote = v3;
  *(_QWORD *)&retstr->isScanning = self[1].a2dp;
  v4 = *(_OWORD *)&self->oneSniffAttemptDevices;
  *(_OWORD *)&retstr->btGC = *(_OWORD *)&self->nonHIDConnections;
  *(_OWORD *)&retstr->hk = v4;
  v5 = *(_OWORD *)&self->remote;
  *(_OWORD *)&retstr->nonHIDConnections = *(_OWORD *)&self->sco;
  *(_OWORD *)&retstr->oneSniffAttemptDevices = v5;
  v6 = *(_OWORD *)&self->hk;
  *(_OWORD *)&retstr->leRemote = *(_OWORD *)&self->btGC;
  *(_OWORD *)&retstr->btKB = v6;
  return self;
}

- (void)setState:(BTStatus *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  *(_OWORD *)&self->_state.leRemote = *(_OWORD *)&a3->leRemote;
  v3 = *(_OWORD *)&a3->btKB;
  v4 = *(_OWORD *)&a3->btGC;
  v5 = *(_OWORD *)&a3->nonHIDConnections;
  *(_OWORD *)&self->_state.hk = *(_OWORD *)&a3->hk;
  *(_OWORD *)&self->_state.nonHIDConnections = v5;
  *(_OWORD *)&self->_state.btKB = v3;
  *(_OWORD *)&self->_state.btGC = v4;
  v6 = *(_OWORD *)&a3->oneSniffAttemptDevices;
  v7 = *(_OWORD *)&a3->sco;
  v8 = *(_OWORD *)&a3->remote;
  *(_QWORD *)&self->_state.isScanning = *(_QWORD *)&a3->isScanning;
  *(_OWORD *)&self->_state.sco = v7;
  *(_OWORD *)&self->_state.remote = v8;
  *(_OWORD *)&self->_state.oneSniffAttemptDevices = v6;
}

- (int)maxHAPConnections
{
  return self->_maxHAPConnections;
}

- (void)setMaxHAPConnections:(int)a3
{
  self->_maxHAPConnections = a3;
}

- (float)minBandwidth
{
  return self->_minBandwidth;
}

- (void)setMinBandwidth:(float)a3
{
  self->_minBandwidth = a3;
}

- (float)maxBandwidth
{
  return self->_maxBandwidth;
}

- (void)setMaxBandwidth:(float)a3
{
  self->_maxBandwidth = a3;
}

+ (id)makeTupleWithATVState:(unint64_t)a3 MaxHAPConnections:(int)a4 MinBandwidth:(float)a5 MaxBandwidth:(float)a6
{
  uint64_t v8;
  HAPBTLETuple *v10;
  double v11;
  double v12;

  v8 = *(_QWORD *)&a4;
  v10 = objc_alloc_init(HAPBTLETuple);
  -[HAPBTLETuple setAtvState:](v10, "setAtvState:", a3);
  *(float *)&v11 = a5;
  -[HAPBTLETuple setMinBandwidth:](v10, "setMinBandwidth:", v11);
  *(float *)&v12 = a6;
  -[HAPBTLETuple setMaxBandwidth:](v10, "setMaxBandwidth:", v12);
  -[HAPBTLETuple setMaxHAPConnections:](v10, "setMaxHAPConnections:", v8);
  return v10;
}

+ (id)makeTupleWithATVState:(unint64_t)a3 MaxHAPConnections:(int)a4
{
  uint64_t v4;
  double v6;
  double v7;
  uint64_t v9;

  v4 = *(_QWORD *)&a4;
  v9 = 0;
  +[HAPBTLETuple bandwidthFromATVState:MinBandwidth:MaxBandwidth:](HAPBTLETuple, "bandwidthFromATVState:MinBandwidth:MaxBandwidth:", a3, (char *)&v9 + 4, &v9);
  LODWORD(v6) = HIDWORD(v9);
  LODWORD(v7) = v9;
  +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:MinBandwidth:MaxBandwidth:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:MinBandwidth:MaxBandwidth:", a3, v4, v6, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)bandwidthFromATVState:(unint64_t)a3 MinBandwidth:(float *)a4 MaxBandwidth:(float *)a5
{
  uint64_t v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  int8x8_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  float v16;
  float v17;
  float v18;
  _DWORD v19[2];
  int8x8_t v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;

  v5 = 0;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = (a3 >> 1) & 2;
  if ((a3 & 2) != 0)
    v6 = 1;
  while ((btgcConfig[v5] & a3) == 0)
  {
    if (++v5 == 4)
    {
      v7 = 0;
      goto LABEL_7;
    }
  }
  v7 = v5 + 1;
LABEL_7:
  v8 = 0;
  v9 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(a3), (uint32x2_t)0xFFFFFFF9FFFFFFFALL), (int8x8_t)0x100000001);
  while ((leaConfig[v8] & a3) == 0)
  {
    if (++v8 == 3)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  v10 = v8 + 1;
LABEL_12:
  v11 = 0;
  while ((eaConfig[v11] & a3) == 0)
  {
    if (++v11 == 3)
    {
      v12 = 0;
      goto LABEL_17;
    }
  }
  v12 = v11 + 1;
LABEL_17:
  v13 = 0;
  while ((hkConfig_20093[v13] & a3) == 0)
  {
    if (++v13 == 3)
    {
      v14 = 0;
      goto LABEL_22;
    }
  }
  v14 = v13 + 1;
LABEL_22:
  v15 = 0;
  v19[0] = v6;
  v19[1] = v10;
  v20 = v9;
  v16 = 0.0;
  v21 = v7;
  v22 = v12;
  v17 = 0.0;
  v23 = v14;
  do
  {
    v18 = (float)(int)v19[v15];
    v16 = fminf(v16 + (float)(*(float *)&maxFactors[v15] * v18), 100.0);
    v17 = fminf(v17 + (float)(*(float *)&minFactors[v15++] * v18), 100.0);
  }
  while (v15 != 7);
  *a4 = v17;
  *a5 = v16;
}

+ (id)atvState2String:(unint64_t)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d ("), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(&unk_1E8989BB8, "count"))
  {
    v5 = 0;
    do
    {
      if ((qword_1CCFA3518[v5] & a3) != 0)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(&unk_1E8989BB8, "objectAtIndexedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("%@|%@"), v4, v7);
        v8 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v8;
      }
      ++v5;
    }
    while (objc_msgSend(&unk_1E8989BB8, "count") > v5);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@)"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)makeTupleWithState:(BTStatus *)a3 MaxHAPConnections:(int)a4 MinBandwidth:(float)a5 MaxBandwidth:(float)a6
{
  uint64_t v8;
  HAPBTLETuple *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17;
  double v18;

  v8 = *(_QWORD *)&a4;
  v10 = objc_alloc_init(HAPBTLETuple);
  *(_OWORD *)&v10->_state.leRemote = *(_OWORD *)&a3->leRemote;
  v11 = *(_OWORD *)&a3->nonHIDConnections;
  v13 = *(_OWORD *)&a3->btKB;
  v12 = *(_OWORD *)&a3->btGC;
  *(_OWORD *)&v10->_state.hk = *(_OWORD *)&a3->hk;
  *(_OWORD *)&v10->_state.nonHIDConnections = v11;
  *(_OWORD *)&v10->_state.btKB = v13;
  *(_OWORD *)&v10->_state.btGC = v12;
  v15 = *(_OWORD *)&a3->sco;
  v14 = *(_OWORD *)&a3->remote;
  v16 = *(_OWORD *)&a3->oneSniffAttemptDevices;
  *(_QWORD *)&v10->_state.isScanning = *(_QWORD *)&a3->isScanning;
  *(_OWORD *)&v10->_state.sco = v15;
  *(_OWORD *)&v10->_state.remote = v14;
  *(_OWORD *)&v10->_state.oneSniffAttemptDevices = v16;
  -[HAPBTLETuple setAtvState:](v10, "setAtvState:", 0);
  *(float *)&v17 = a5;
  -[HAPBTLETuple setMinBandwidth:](v10, "setMinBandwidth:", v17);
  *(float *)&v18 = a6;
  -[HAPBTLETuple setMaxBandwidth:](v10, "setMaxBandwidth:", v18);
  -[HAPBTLETuple setMaxHAPConnections:](v10, "setMaxHAPConnections:", v8);
  return v10;
}

+ (id)state2String:(BTStatus *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ LE devices            : %zu \n"), &stru_1E894EFE8, a3->lowEnergyConnections);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ classic devices       : %zu \n"), v4, a3->connectedDevices);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ leRemote              : %zu \n"), v5, a3->leRemote);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ leAcc                 : %zu \n"), v6, a3->leAcc);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ btKb                  : %zu \n"), v7, a3->btKB);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ a2dp                  : %zu \n"), v8, a3->a2dp);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ btGC                  : %zu \n"), v9, a3->btGC);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ eAcc                  : %zu \n"), v10, a3->eAcc);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ HK                    : %zu \n"), v11, a3->hk);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ non-HID               : %zu \n"), v12, a3->nonHIDConnections);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ HID                   : %zu \n"), v13, a3->connectedHIDDevices);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ oneSniffAttemptDevices: %zu \n"), v14, a3->oneSniffAttemptDevices);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ twoSniffAttemptDevices: %zu \n"), v15, a3->twoSniffAttemptDevices);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ sco                   : %zu \n"), v16, a3->sco);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ wiap                  : %zu \n"), v17, a3->wiap);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ remote                : %zu \n"), v18, a3->remote);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3->isScanning)
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ scanning              : %@ \n"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3->isDiscoverable)
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ discoverable          : %@ \n"), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3->isConnectable)
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ connectable           : %@ \n"), v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

@end
