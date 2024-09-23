@implementation CellularCallCount

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPeriodSeconds:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_periodSeconds = a3;
}

- (void)setHasPeriodSeconds:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPeriodSeconds
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNumTotalCallsCdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_numTotalCallsCdma = a3;
}

- (void)setHasNumTotalCallsCdma:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNumTotalCallsCdma
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setNumConnectedCallsCdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_numConnectedCallsCdma = a3;
}

- (void)setHasNumConnectedCallsCdma:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasNumConnectedCallsCdma
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumNormalReleaseCallsCdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_numNormalReleaseCallsCdma = a3;
}

- (void)setHasNumNormalReleaseCallsCdma:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasNumNormalReleaseCallsCdma
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)clearEndStatusCountConnectedCdmas
{
  -[NSMutableArray removeAllObjects](self->_endStatusCountConnectedCdmas, "removeAllObjects");
}

- (void)addEndStatusCountConnectedCdma:(id)a3
{
  id v4;
  NSMutableArray *endStatusCountConnectedCdmas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  endStatusCountConnectedCdmas = self->_endStatusCountConnectedCdmas;
  v8 = v4;
  if (!endStatusCountConnectedCdmas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_endStatusCountConnectedCdmas;
    self->_endStatusCountConnectedCdmas = v6;

    v4 = v8;
    endStatusCountConnectedCdmas = self->_endStatusCountConnectedCdmas;
  }
  -[NSMutableArray addObject:](endStatusCountConnectedCdmas, "addObject:", v4);

}

- (unint64_t)endStatusCountConnectedCdmasCount
{
  return (unint64_t)-[NSMutableArray count](self->_endStatusCountConnectedCdmas, "count");
}

- (id)endStatusCountConnectedCdmaAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_endStatusCountConnectedCdmas, "objectAtIndex:", a3);
}

+ (Class)endStatusCountConnectedCdmaType
{
  return (Class)objc_opt_class(PerEndStatus, a2);
}

- (void)clearEndStatusCountNotConnectedCdmas
{
  -[NSMutableArray removeAllObjects](self->_endStatusCountNotConnectedCdmas, "removeAllObjects");
}

- (void)addEndStatusCountNotConnectedCdma:(id)a3
{
  id v4;
  NSMutableArray *endStatusCountNotConnectedCdmas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  endStatusCountNotConnectedCdmas = self->_endStatusCountNotConnectedCdmas;
  v8 = v4;
  if (!endStatusCountNotConnectedCdmas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_endStatusCountNotConnectedCdmas;
    self->_endStatusCountNotConnectedCdmas = v6;

    v4 = v8;
    endStatusCountNotConnectedCdmas = self->_endStatusCountNotConnectedCdmas;
  }
  -[NSMutableArray addObject:](endStatusCountNotConnectedCdmas, "addObject:", v4);

}

- (unint64_t)endStatusCountNotConnectedCdmasCount
{
  return (unint64_t)-[NSMutableArray count](self->_endStatusCountNotConnectedCdmas, "count");
}

- (id)endStatusCountNotConnectedCdmaAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_endStatusCountNotConnectedCdmas, "objectAtIndex:", a3);
}

+ (Class)endStatusCountNotConnectedCdmaType
{
  return (Class)objc_opt_class(PerEndStatus, a2);
}

- (void)setTotalConnectedSecondsCdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_totalConnectedSecondsCdma = a3;
}

- (void)setHasTotalConnectedSecondsCdma:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTotalConnectedSecondsCdma
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setNumTotalCallsGw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_numTotalCallsGw = a3;
}

- (void)setHasNumTotalCallsGw:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNumTotalCallsGw
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setNumConnectedCallsGw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_numConnectedCallsGw = a3;
}

- (void)setHasNumConnectedCallsGw:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasNumConnectedCallsGw
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNumNormalReleaseCallsGw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_numNormalReleaseCallsGw = a3;
}

- (void)setHasNumNormalReleaseCallsGw:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasNumNormalReleaseCallsGw
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)clearEndStatusCountConnectedGws
{
  -[NSMutableArray removeAllObjects](self->_endStatusCountConnectedGws, "removeAllObjects");
}

- (void)addEndStatusCountConnectedGw:(id)a3
{
  id v4;
  NSMutableArray *endStatusCountConnectedGws;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  endStatusCountConnectedGws = self->_endStatusCountConnectedGws;
  v8 = v4;
  if (!endStatusCountConnectedGws)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_endStatusCountConnectedGws;
    self->_endStatusCountConnectedGws = v6;

    v4 = v8;
    endStatusCountConnectedGws = self->_endStatusCountConnectedGws;
  }
  -[NSMutableArray addObject:](endStatusCountConnectedGws, "addObject:", v4);

}

- (unint64_t)endStatusCountConnectedGwsCount
{
  return (unint64_t)-[NSMutableArray count](self->_endStatusCountConnectedGws, "count");
}

- (id)endStatusCountConnectedGwAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_endStatusCountConnectedGws, "objectAtIndex:", a3);
}

+ (Class)endStatusCountConnectedGwType
{
  return (Class)objc_opt_class(PerEndStatus, a2);
}

- (void)clearEndStatusCountNotConnectedGws
{
  -[NSMutableArray removeAllObjects](self->_endStatusCountNotConnectedGws, "removeAllObjects");
}

- (void)addEndStatusCountNotConnectedGw:(id)a3
{
  id v4;
  NSMutableArray *endStatusCountNotConnectedGws;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  endStatusCountNotConnectedGws = self->_endStatusCountNotConnectedGws;
  v8 = v4;
  if (!endStatusCountNotConnectedGws)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_endStatusCountNotConnectedGws;
    self->_endStatusCountNotConnectedGws = v6;

    v4 = v8;
    endStatusCountNotConnectedGws = self->_endStatusCountNotConnectedGws;
  }
  -[NSMutableArray addObject:](endStatusCountNotConnectedGws, "addObject:", v4);

}

- (unint64_t)endStatusCountNotConnectedGwsCount
{
  return (unint64_t)-[NSMutableArray count](self->_endStatusCountNotConnectedGws, "count");
}

- (id)endStatusCountNotConnectedGwAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_endStatusCountNotConnectedGws, "objectAtIndex:", a3);
}

+ (Class)endStatusCountNotConnectedGwType
{
  return (Class)objc_opt_class(PerEndStatus, a2);
}

- (void)setNumMultiRabEverCalls:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_numMultiRabEverCalls = a3;
}

- (void)setHasNumMultiRabEverCalls:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNumMultiRabEverCalls
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setNumMultiRabEndCalls:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_numMultiRabEndCalls = a3;
}

- (void)setHasNumMultiRabEndCalls:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasNumMultiRabEndCalls
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)clearReleaseCauseCountConnecteds
{
  -[NSMutableArray removeAllObjects](self->_releaseCauseCountConnecteds, "removeAllObjects");
}

- (void)addReleaseCauseCountConnected:(id)a3
{
  id v4;
  NSMutableArray *releaseCauseCountConnecteds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  releaseCauseCountConnecteds = self->_releaseCauseCountConnecteds;
  v8 = v4;
  if (!releaseCauseCountConnecteds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_releaseCauseCountConnecteds;
    self->_releaseCauseCountConnecteds = v6;

    v4 = v8;
    releaseCauseCountConnecteds = self->_releaseCauseCountConnecteds;
  }
  -[NSMutableArray addObject:](releaseCauseCountConnecteds, "addObject:", v4);

}

- (unint64_t)releaseCauseCountConnectedsCount
{
  return (unint64_t)-[NSMutableArray count](self->_releaseCauseCountConnecteds, "count");
}

- (id)releaseCauseCountConnectedAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_releaseCauseCountConnecteds, "objectAtIndex:", a3);
}

+ (Class)releaseCauseCountConnectedType
{
  return (Class)objc_opt_class(PerReleaseCause, a2);
}

- (void)clearReleaseCauseCountNotConnecteds
{
  -[NSMutableArray removeAllObjects](self->_releaseCauseCountNotConnecteds, "removeAllObjects");
}

- (void)addReleaseCauseCountNotConnected:(id)a3
{
  id v4;
  NSMutableArray *releaseCauseCountNotConnecteds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  releaseCauseCountNotConnecteds = self->_releaseCauseCountNotConnecteds;
  v8 = v4;
  if (!releaseCauseCountNotConnecteds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_releaseCauseCountNotConnecteds;
    self->_releaseCauseCountNotConnecteds = v6;

    v4 = v8;
    releaseCauseCountNotConnecteds = self->_releaseCauseCountNotConnecteds;
  }
  -[NSMutableArray addObject:](releaseCauseCountNotConnecteds, "addObject:", v4);

}

- (unint64_t)releaseCauseCountNotConnectedsCount
{
  return (unint64_t)-[NSMutableArray count](self->_releaseCauseCountNotConnecteds, "count");
}

- (id)releaseCauseCountNotConnectedAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_releaseCauseCountNotConnecteds, "objectAtIndex:", a3);
}

+ (Class)releaseCauseCountNotConnectedType
{
  return (Class)objc_opt_class(PerReleaseCause, a2);
}

- (void)setNumTotalCallsGsm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_numTotalCallsGsm = a3;
}

- (void)setHasNumTotalCallsGsm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNumTotalCallsGsm
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setNumConnectedCallsGsm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_numConnectedCallsGsm = a3;
}

- (void)setHasNumConnectedCallsGsm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasNumConnectedCallsGsm
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumNormalReleaseCallsGsm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_numNormalReleaseCallsGsm = a3;
}

- (void)setHasNumNormalReleaseCallsGsm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNumNormalReleaseCallsGsm
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)clearReleaseCauseCountConnectedGsms
{
  -[NSMutableArray removeAllObjects](self->_releaseCauseCountConnectedGsms, "removeAllObjects");
}

- (void)addReleaseCauseCountConnectedGsm:(id)a3
{
  id v4;
  NSMutableArray *releaseCauseCountConnectedGsms;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  releaseCauseCountConnectedGsms = self->_releaseCauseCountConnectedGsms;
  v8 = v4;
  if (!releaseCauseCountConnectedGsms)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_releaseCauseCountConnectedGsms;
    self->_releaseCauseCountConnectedGsms = v6;

    v4 = v8;
    releaseCauseCountConnectedGsms = self->_releaseCauseCountConnectedGsms;
  }
  -[NSMutableArray addObject:](releaseCauseCountConnectedGsms, "addObject:", v4);

}

- (unint64_t)releaseCauseCountConnectedGsmsCount
{
  return (unint64_t)-[NSMutableArray count](self->_releaseCauseCountConnectedGsms, "count");
}

- (id)releaseCauseCountConnectedGsmAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_releaseCauseCountConnectedGsms, "objectAtIndex:", a3);
}

+ (Class)releaseCauseCountConnectedGsmType
{
  return (Class)objc_opt_class(PerReleaseCause, a2);
}

- (void)clearReleaseCauseCountNotConnectedGsms
{
  -[NSMutableArray removeAllObjects](self->_releaseCauseCountNotConnectedGsms, "removeAllObjects");
}

- (void)addReleaseCauseCountNotConnectedGsm:(id)a3
{
  id v4;
  NSMutableArray *releaseCauseCountNotConnectedGsms;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  releaseCauseCountNotConnectedGsms = self->_releaseCauseCountNotConnectedGsms;
  v8 = v4;
  if (!releaseCauseCountNotConnectedGsms)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_releaseCauseCountNotConnectedGsms;
    self->_releaseCauseCountNotConnectedGsms = v6;

    v4 = v8;
    releaseCauseCountNotConnectedGsms = self->_releaseCauseCountNotConnectedGsms;
  }
  -[NSMutableArray addObject:](releaseCauseCountNotConnectedGsms, "addObject:", v4);

}

- (unint64_t)releaseCauseCountNotConnectedGsmsCount
{
  return (unint64_t)-[NSMutableArray count](self->_releaseCauseCountNotConnectedGsms, "count");
}

- (id)releaseCauseCountNotConnectedGsmAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_releaseCauseCountNotConnectedGsms, "objectAtIndex:", a3);
}

+ (Class)releaseCauseCountNotConnectedGsmType
{
  return (Class)objc_opt_class(PerReleaseCause, a2);
}

- (void)setTotalConnectedSecondsGsm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_totalConnectedSecondsGsm = a3;
}

- (void)setHasTotalConnectedSecondsGsm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTotalConnectedSecondsGsm
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setNumTotalCallsWcdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_numTotalCallsWcdma = a3;
}

- (void)setHasNumTotalCallsWcdma:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasNumTotalCallsWcdma
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setNumConnectedCallsWcdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_numConnectedCallsWcdma = a3;
}

- (void)setHasNumConnectedCallsWcdma:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasNumConnectedCallsWcdma
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setNumNormalReleaseCallsWcdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_numNormalReleaseCallsWcdma = a3;
}

- (void)setHasNumNormalReleaseCallsWcdma:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNumNormalReleaseCallsWcdma
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)clearReleaseCauseCountConnectedWcdmas
{
  -[NSMutableArray removeAllObjects](self->_releaseCauseCountConnectedWcdmas, "removeAllObjects");
}

- (void)addReleaseCauseCountConnectedWcdma:(id)a3
{
  id v4;
  NSMutableArray *releaseCauseCountConnectedWcdmas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  releaseCauseCountConnectedWcdmas = self->_releaseCauseCountConnectedWcdmas;
  v8 = v4;
  if (!releaseCauseCountConnectedWcdmas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_releaseCauseCountConnectedWcdmas;
    self->_releaseCauseCountConnectedWcdmas = v6;

    v4 = v8;
    releaseCauseCountConnectedWcdmas = self->_releaseCauseCountConnectedWcdmas;
  }
  -[NSMutableArray addObject:](releaseCauseCountConnectedWcdmas, "addObject:", v4);

}

- (unint64_t)releaseCauseCountConnectedWcdmasCount
{
  return (unint64_t)-[NSMutableArray count](self->_releaseCauseCountConnectedWcdmas, "count");
}

- (id)releaseCauseCountConnectedWcdmaAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_releaseCauseCountConnectedWcdmas, "objectAtIndex:", a3);
}

+ (Class)releaseCauseCountConnectedWcdmaType
{
  return (Class)objc_opt_class(PerReleaseCause, a2);
}

- (void)clearReleaseCauseCountNotConnectedWcdmas
{
  -[NSMutableArray removeAllObjects](self->_releaseCauseCountNotConnectedWcdmas, "removeAllObjects");
}

- (void)addReleaseCauseCountNotConnectedWcdma:(id)a3
{
  id v4;
  NSMutableArray *releaseCauseCountNotConnectedWcdmas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  releaseCauseCountNotConnectedWcdmas = self->_releaseCauseCountNotConnectedWcdmas;
  v8 = v4;
  if (!releaseCauseCountNotConnectedWcdmas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_releaseCauseCountNotConnectedWcdmas;
    self->_releaseCauseCountNotConnectedWcdmas = v6;

    v4 = v8;
    releaseCauseCountNotConnectedWcdmas = self->_releaseCauseCountNotConnectedWcdmas;
  }
  -[NSMutableArray addObject:](releaseCauseCountNotConnectedWcdmas, "addObject:", v4);

}

- (unint64_t)releaseCauseCountNotConnectedWcdmasCount
{
  return (unint64_t)-[NSMutableArray count](self->_releaseCauseCountNotConnectedWcdmas, "count");
}

- (id)releaseCauseCountNotConnectedWcdmaAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_releaseCauseCountNotConnectedWcdmas, "objectAtIndex:", a3);
}

+ (Class)releaseCauseCountNotConnectedWcdmaType
{
  return (Class)objc_opt_class(PerReleaseCause, a2);
}

- (void)setTotalConnectedSecondsWcdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_totalConnectedSecondsWcdma = a3;
}

- (void)setHasTotalConnectedSecondsWcdma:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTotalConnectedSecondsWcdma
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularCallCount;
  v3 = -[CellularCallCount description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallCount dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $6BF4D661EEBB0D17828DA0D6CA72866A has;
  void *v5;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  $6BF4D661EEBB0D17828DA0D6CA72866A v20;
  void *v21;
  id v22;
  NSMutableArray *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSMutableArray *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  $6BF4D661EEBB0D17828DA0D6CA72866A v36;
  void *v37;
  void *v38;
  id v39;
  NSMutableArray *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  NSMutableArray *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  $6BF4D661EEBB0D17828DA0D6CA72866A v53;
  void *v54;
  id v55;
  NSMutableArray *v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  NSMutableArray *v63;
  id v64;
  id v65;
  uint64_t v66;
  void *v67;
  void *v68;
  $6BF4D661EEBB0D17828DA0D6CA72866A v69;
  void *v70;
  id v71;
  NSMutableArray *v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  NSMutableArray *v79;
  id v80;
  id v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_120;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_periodSeconds));
  objc_msgSend(v3, "setObject:forKey:", v89, CFSTR("period_seconds"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_121;
  }
LABEL_120:
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numTotalCallsCdma));
  objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("num_total_calls_cdma"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_121:
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numConnectedCallsCdma));
  objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("num_connected_calls_cdma"));

  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numNormalReleaseCallsCdma));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("num_normal_release_calls_cdma"));

  }
LABEL_7:
  if (-[NSMutableArray count](self->_endStatusCountConnectedCdmas, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_endStatusCountConnectedCdmas, "count"));
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v7 = self->_endStatusCountConnectedCdmas;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v136, v149, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v137;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v137 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)v11), "dictionaryRepresentation"));
          objc_msgSend(v6, "addObject:", v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v136, v149, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("end_status_count_connected_cdma"));
  }
  if (-[NSMutableArray count](self->_endStatusCountNotConnectedCdmas, "count"))
  {
    v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_endStatusCountNotConnectedCdmas, "count"));
    v132 = 0u;
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v14 = self->_endStatusCountNotConnectedCdmas;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v132, v148, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v133;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v133 != v17)
            objc_enumerationMutation(v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v132 + 1) + 8 * (_QWORD)v18), "dictionaryRepresentation"));
          objc_msgSend(v13, "addObject:", v19);

          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v132, v148, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("end_status_count_not_connected_cdma"));
  }
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000) != 0)
  {
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalConnectedSecondsCdma));
    objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("total_connected_seconds_cdma"));

    v20 = self->_has;
    if ((*(_WORD *)&v20 & 0x2000) == 0)
    {
LABEL_27:
      if ((*(_BYTE *)&v20 & 8) == 0)
        goto LABEL_28;
      goto LABEL_125;
    }
  }
  else if ((*(_WORD *)&v20 & 0x2000) == 0)
  {
    goto LABEL_27;
  }
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numTotalCallsGw));
  objc_msgSend(v3, "setObject:forKey:", v93, CFSTR("num_total_calls_gw"));

  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 8) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v20 & 0x200) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_125:
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numConnectedCallsGw));
  objc_msgSend(v3, "setObject:forKey:", v94, CFSTR("num_connected_calls_gw"));

  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_29:
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numNormalReleaseCallsGw));
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("num_normal_release_calls_gw"));

  }
LABEL_30:
  if (-[NSMutableArray count](self->_endStatusCountConnectedGws, "count"))
  {
    v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_endStatusCountConnectedGws, "count"));
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v23 = self->_endStatusCountConnectedGws;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v128, v147, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v129;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v129 != v26)
            objc_enumerationMutation(v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * (_QWORD)v27), "dictionaryRepresentation"));
          objc_msgSend(v22, "addObject:", v28);

          v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v128, v147, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("end_status_count_connected_gw"));
  }
  if (-[NSMutableArray count](self->_endStatusCountNotConnectedGws, "count"))
  {
    v29 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_endStatusCountNotConnectedGws, "count"));
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v30 = self->_endStatusCountNotConnectedGws;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v124, v146, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v125;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v125 != v33)
            objc_enumerationMutation(v30);
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)v34), "dictionaryRepresentation"));
          objc_msgSend(v29, "addObject:", v35);

          v34 = (char *)v34 + 1;
        }
        while (v32 != v34);
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v124, v146, 16);
      }
      while (v32);
    }

    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("end_status_count_not_connected_gw"));
  }
  v36 = self->_has;
  if ((*(_BYTE *)&v36 & 0x40) != 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMultiRabEverCalls));
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("num_multi_rab_ever_calls"));

    v36 = self->_has;
  }
  if ((*(_BYTE *)&v36 & 0x20) != 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMultiRabEndCalls));
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("num_multi_rab_end_calls"));

  }
  if (-[NSMutableArray count](self->_releaseCauseCountConnecteds, "count"))
  {
    v39 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_releaseCauseCountConnecteds, "count"));
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v40 = self->_releaseCauseCountConnecteds;
    v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v120, v145, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v121;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v121 != v43)
            objc_enumerationMutation(v40);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)v44), "dictionaryRepresentation"));
          objc_msgSend(v39, "addObject:", v45);

          v44 = (char *)v44 + 1;
        }
        while (v42 != v44);
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v120, v145, 16);
      }
      while (v42);
    }

    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("release_cause_count_connected"));
  }
  if (-[NSMutableArray count](self->_releaseCauseCountNotConnecteds, "count"))
  {
    v46 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_releaseCauseCountNotConnecteds, "count"));
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v47 = self->_releaseCauseCountNotConnecteds;
    v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v116, v144, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v117;
      do
      {
        v51 = 0;
        do
        {
          if (*(_QWORD *)v117 != v50)
            objc_enumerationMutation(v47);
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)v51), "dictionaryRepresentation"));
          objc_msgSend(v46, "addObject:", v52);

          v51 = (char *)v51 + 1;
        }
        while (v49 != v51);
        v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v116, v144, 16);
      }
      while (v49);
    }

    objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("release_cause_count_not_connected"));
  }
  v53 = self->_has;
  if ((*(_WORD *)&v53 & 0x1000) != 0)
  {
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numTotalCallsGsm));
    objc_msgSend(v3, "setObject:forKey:", v95, CFSTR("num_total_calls_gsm"));

    v53 = self->_has;
    if ((*(_BYTE *)&v53 & 4) == 0)
    {
LABEL_72:
      if ((*(_WORD *)&v53 & 0x100) == 0)
        goto LABEL_74;
      goto LABEL_73;
    }
  }
  else if ((*(_BYTE *)&v53 & 4) == 0)
  {
    goto LABEL_72;
  }
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numConnectedCallsGsm));
  objc_msgSend(v3, "setObject:forKey:", v96, CFSTR("num_connected_calls_gsm"));

  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_73:
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numNormalReleaseCallsGsm));
    objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("num_normal_release_calls_gsm"));

  }
LABEL_74:
  if (-[NSMutableArray count](self->_releaseCauseCountConnectedGsms, "count"))
  {
    v55 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_releaseCauseCountConnectedGsms, "count"));
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v56 = self->_releaseCauseCountConnectedGsms;
    v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v112, v143, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v113;
      do
      {
        v60 = 0;
        do
        {
          if (*(_QWORD *)v113 != v59)
            objc_enumerationMutation(v56);
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)v60), "dictionaryRepresentation"));
          objc_msgSend(v55, "addObject:", v61);

          v60 = (char *)v60 + 1;
        }
        while (v58 != v60);
        v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v112, v143, 16);
      }
      while (v58);
    }

    objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("release_cause_count_connected_gsm"));
  }
  if (-[NSMutableArray count](self->_releaseCauseCountNotConnectedGsms, "count"))
  {
    v62 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_releaseCauseCountNotConnectedGsms, "count"));
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v63 = self->_releaseCauseCountNotConnectedGsms;
    v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v108, v142, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v109;
      do
      {
        v67 = 0;
        do
        {
          if (*(_QWORD *)v109 != v66)
            objc_enumerationMutation(v63);
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)v67), "dictionaryRepresentation"));
          objc_msgSend(v62, "addObject:", v68);

          v67 = (char *)v67 + 1;
        }
        while (v65 != v67);
        v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v108, v142, 16);
      }
      while (v65);
    }

    objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("release_cause_count_not_connected_gsm"));
  }
  v69 = self->_has;
  if ((*(_DWORD *)&v69 & 0x20000) != 0)
  {
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalConnectedSecondsGsm));
    objc_msgSend(v3, "setObject:forKey:", v97, CFSTR("total_connected_seconds_gsm"));

    v69 = self->_has;
    if ((*(_WORD *)&v69 & 0x4000) == 0)
    {
LABEL_94:
      if ((*(_BYTE *)&v69 & 0x10) == 0)
        goto LABEL_95;
      goto LABEL_132;
    }
  }
  else if ((*(_WORD *)&v69 & 0x4000) == 0)
  {
    goto LABEL_94;
  }
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numTotalCallsWcdma));
  objc_msgSend(v3, "setObject:forKey:", v98, CFSTR("num_total_calls_wcdma"));

  v69 = self->_has;
  if ((*(_BYTE *)&v69 & 0x10) == 0)
  {
LABEL_95:
    if ((*(_WORD *)&v69 & 0x400) == 0)
      goto LABEL_97;
    goto LABEL_96;
  }
LABEL_132:
  v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numConnectedCallsWcdma));
  objc_msgSend(v3, "setObject:forKey:", v99, CFSTR("num_connected_calls_wcdma"));

  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_96:
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numNormalReleaseCallsWcdma));
    objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("num_normal_release_calls_wcdma"));

  }
LABEL_97:
  if (-[NSMutableArray count](self->_releaseCauseCountConnectedWcdmas, "count"))
  {
    v71 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_releaseCauseCountConnectedWcdmas, "count"));
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v72 = self->_releaseCauseCountConnectedWcdmas;
    v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v104, v141, 16);
    if (v73)
    {
      v74 = v73;
      v75 = *(_QWORD *)v105;
      do
      {
        v76 = 0;
        do
        {
          if (*(_QWORD *)v105 != v75)
            objc_enumerationMutation(v72);
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)v76), "dictionaryRepresentation"));
          objc_msgSend(v71, "addObject:", v77);

          v76 = (char *)v76 + 1;
        }
        while (v74 != v76);
        v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v104, v141, 16);
      }
      while (v74);
    }

    objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("release_cause_count_connected_wcdma"));
  }
  if (-[NSMutableArray count](self->_releaseCauseCountNotConnectedWcdmas, "count"))
  {
    v78 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_releaseCauseCountNotConnectedWcdmas, "count"));
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v79 = self->_releaseCauseCountNotConnectedWcdmas;
    v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v100, v140, 16);
    if (v80)
    {
      v81 = v80;
      v82 = *(_QWORD *)v101;
      do
      {
        v83 = 0;
        do
        {
          if (*(_QWORD *)v101 != v82)
            objc_enumerationMutation(v79);
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)v83), "dictionaryRepresentation", (_QWORD)v100));
          objc_msgSend(v78, "addObject:", v84);

          v83 = (char *)v83 + 1;
        }
        while (v81 != v83);
        v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v100, v140, 16);
      }
      while (v81);
    }

    objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("release_cause_count_not_connected_wcdma"));
  }
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalConnectedSecondsWcdma));
    objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("total_connected_seconds_wcdma"));

  }
  v86 = v3;

  return v86;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000315E8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  $6BF4D661EEBB0D17828DA0D6CA72866A has;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  $6BF4D661EEBB0D17828DA0D6CA72866A v17;
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  $6BF4D661EEBB0D17828DA0D6CA72866A v28;
  NSMutableArray *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  NSMutableArray *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  $6BF4D661EEBB0D17828DA0D6CA72866A v39;
  NSMutableArray *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  NSMutableArray *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  $6BF4D661EEBB0D17828DA0D6CA72866A v50;
  NSMutableArray *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  NSMutableArray *v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];

  v4 = a3;
  v5 = v4;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_99;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_periodSeconds, 2);
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field(v5, self->_numTotalCallsCdma, 5);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_100:
  PBDataWriterWriteUint32Field(v5, self->_numConnectedCallsCdma, 6);
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field(v5, self->_numNormalReleaseCallsCdma, 7);
LABEL_7:
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v7 = self->_endStatusCountConnectedCdmas;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v98;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v98 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)v11), 8);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
    }
    while (v9);
  }

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v12 = self->_endStatusCountNotConnectedCdmas;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v94;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v94 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)v16), 9);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
    }
    while (v14);
  }

  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x10000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_totalConnectedSecondsCdma, 10);
    v17 = self->_has;
    if ((*(_BYTE *)&v17 & 0x40) == 0)
    {
LABEL_23:
      if ((*(_BYTE *)&v17 & 0x20) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&v17 & 0x40) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteUint32Field(v5, self->_numMultiRabEverCalls, 11);
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
LABEL_24:
    PBDataWriterWriteUint32Field(v5, self->_numMultiRabEndCalls, 12);
LABEL_25:
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v18 = self->_releaseCauseCountConnecteds;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v89, v108, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v90;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v90 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v22), 13);
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v89, v108, 16);
    }
    while (v20);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v23 = self->_releaseCauseCountNotConnecteds;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v86;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v86 != v26)
          objc_enumerationMutation(v23);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)v27), 14);
        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
    }
    while (v25);
  }

  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x2000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_numTotalCallsGw, 15);
    v28 = self->_has;
    if ((*(_BYTE *)&v28 & 8) == 0)
    {
LABEL_41:
      if ((*(_WORD *)&v28 & 0x200) == 0)
        goto LABEL_43;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&v28 & 8) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteUint32Field(v5, self->_numConnectedCallsGw, 16);
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
LABEL_42:
    PBDataWriterWriteUint32Field(v5, self->_numNormalReleaseCallsGw, 17);
LABEL_43:
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v29 = self->_endStatusCountConnectedGws;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v81, v106, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v82;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v82 != v32)
          objc_enumerationMutation(v29);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)v33), 18);
        v33 = (char *)v33 + 1;
      }
      while (v31 != v33);
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v81, v106, 16);
    }
    while (v31);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v34 = self->_endStatusCountNotConnectedGws;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v77, v105, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v78;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v78 != v37)
          objc_enumerationMutation(v34);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)v38), 19);
        v38 = (char *)v38 + 1;
      }
      while (v36 != v38);
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v77, v105, 16);
    }
    while (v36);
  }

  v39 = self->_has;
  if ((*(_WORD *)&v39 & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_numTotalCallsGsm, 25);
    v39 = self->_has;
    if ((*(_BYTE *)&v39 & 4) == 0)
    {
LABEL_59:
      if ((*(_WORD *)&v39 & 0x100) == 0)
        goto LABEL_61;
      goto LABEL_60;
    }
  }
  else if ((*(_BYTE *)&v39 & 4) == 0)
  {
    goto LABEL_59;
  }
  PBDataWriterWriteUint32Field(v5, self->_numConnectedCallsGsm, 26);
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
LABEL_60:
    PBDataWriterWriteUint32Field(v5, self->_numNormalReleaseCallsGsm, 27);
LABEL_61:
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v40 = self->_releaseCauseCountConnectedGsms;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v73, v104, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v74;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v74 != v43)
          objc_enumerationMutation(v40);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)v44), 28);
        v44 = (char *)v44 + 1;
      }
      while (v42 != v44);
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v73, v104, 16);
    }
    while (v42);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v45 = self->_releaseCauseCountNotConnectedGsms;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v69, v103, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v70;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v70 != v48)
          objc_enumerationMutation(v45);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v49), 29);
        v49 = (char *)v49 + 1;
      }
      while (v47 != v49);
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v69, v103, 16);
    }
    while (v47);
  }

  v50 = self->_has;
  if ((*(_DWORD *)&v50 & 0x20000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_totalConnectedSecondsGsm, 30);
    v50 = self->_has;
    if ((*(_WORD *)&v50 & 0x4000) == 0)
    {
LABEL_77:
      if ((*(_BYTE *)&v50 & 0x10) == 0)
        goto LABEL_78;
      goto LABEL_113;
    }
  }
  else if ((*(_WORD *)&v50 & 0x4000) == 0)
  {
    goto LABEL_77;
  }
  PBDataWriterWriteUint32Field(v5, self->_numTotalCallsWcdma, 35);
  v50 = self->_has;
  if ((*(_BYTE *)&v50 & 0x10) == 0)
  {
LABEL_78:
    if ((*(_WORD *)&v50 & 0x400) == 0)
      goto LABEL_80;
    goto LABEL_79;
  }
LABEL_113:
  PBDataWriterWriteUint32Field(v5, self->_numConnectedCallsWcdma, 36);
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
LABEL_79:
    PBDataWriterWriteUint32Field(v5, self->_numNormalReleaseCallsWcdma, 37);
LABEL_80:
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v51 = self->_releaseCauseCountConnectedWcdmas;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v65, v102, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v66;
    do
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v66 != v54)
          objc_enumerationMutation(v51);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)v55), 38);
        v55 = (char *)v55 + 1;
      }
      while (v53 != v55);
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v65, v102, 16);
    }
    while (v53);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v56 = self->_releaseCauseCountNotConnectedWcdmas;
  v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v61, v101, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v62;
    do
    {
      v60 = 0;
      do
      {
        if (*(_QWORD *)v62 != v59)
          objc_enumerationMutation(v56);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v60), 39);
        v60 = (char *)v60 + 1;
      }
      while (v58 != v60);
      v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v61, v101, 16);
    }
    while (v58);
  }

  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    PBDataWriterWriteUint32Field(v5, self->_totalConnectedSecondsWcdma, 40);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $6BF4D661EEBB0D17828DA0D6CA72866A has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  $6BF4D661EEBB0D17828DA0D6CA72866A v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t k;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t m;
  void *v22;
  $6BF4D661EEBB0D17828DA0D6CA72866A v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t n;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t ii;
  void *v31;
  $6BF4D661EEBB0D17828DA0D6CA72866A v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t jj;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t kk;
  void *v40;
  $6BF4D661EEBB0D17828DA0D6CA72866A v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t mm;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t nn;
  void *v49;
  _DWORD *v50;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 43) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 26) = self->_periodSeconds;
  *((_DWORD *)v4 + 43) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
LABEL_70:
    *((_DWORD *)v4 + 12) = self->_numConnectedCallsCdma;
    *((_DWORD *)v4 + 43) |= 2u;
    if ((*(_DWORD *)&self->_has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_69:
  *((_DWORD *)v4 + 22) = self->_numTotalCallsCdma;
  *((_DWORD *)v4 + 43) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
    goto LABEL_70;
LABEL_5:
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 18) = self->_numNormalReleaseCallsCdma;
    *((_DWORD *)v4 + 43) |= 0x80u;
  }
LABEL_7:
  v50 = v4;
  if (-[CellularCallCount endStatusCountConnectedCdmasCount](self, "endStatusCountConnectedCdmasCount"))
  {
    objc_msgSend(v50, "clearEndStatusCountConnectedCdmas");
    v6 = -[CellularCallCount endStatusCountConnectedCdmasCount](self, "endStatusCountConnectedCdmasCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallCount endStatusCountConnectedCdmaAtIndex:](self, "endStatusCountConnectedCdmaAtIndex:", i));
        objc_msgSend(v50, "addEndStatusCountConnectedCdma:", v9);

      }
    }
  }
  if (-[CellularCallCount endStatusCountNotConnectedCdmasCount](self, "endStatusCountNotConnectedCdmasCount"))
  {
    objc_msgSend(v50, "clearEndStatusCountNotConnectedCdmas");
    v10 = -[CellularCallCount endStatusCountNotConnectedCdmasCount](self, "endStatusCountNotConnectedCdmasCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallCount endStatusCountNotConnectedCdmaAtIndex:](self, "endStatusCountNotConnectedCdmaAtIndex:", j));
        objc_msgSend(v50, "addEndStatusCountNotConnectedCdma:", v13);

      }
    }
  }
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
    if ((*(_BYTE *)&v14 & 0x40) == 0)
      goto LABEL_17;
LABEL_73:
    v50[17] = self->_numMultiRabEverCalls;
    v50[43] |= 0x40u;
    if ((*(_DWORD *)&self->_has & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  v50[40] = self->_totalConnectedSecondsCdma;
  v50[43] |= 0x10000u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x40) != 0)
    goto LABEL_73;
LABEL_17:
  if ((*(_BYTE *)&v14 & 0x20) != 0)
  {
LABEL_18:
    v50[16] = self->_numMultiRabEndCalls;
    v50[43] |= 0x20u;
  }
LABEL_19:
  if (-[CellularCallCount releaseCauseCountConnectedsCount](self, "releaseCauseCountConnectedsCount"))
  {
    objc_msgSend(v50, "clearReleaseCauseCountConnecteds");
    v15 = -[CellularCallCount releaseCauseCountConnectedsCount](self, "releaseCauseCountConnectedsCount");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallCount releaseCauseCountConnectedAtIndex:](self, "releaseCauseCountConnectedAtIndex:", k));
        objc_msgSend(v50, "addReleaseCauseCountConnected:", v18);

      }
    }
  }
  if (-[CellularCallCount releaseCauseCountNotConnectedsCount](self, "releaseCauseCountNotConnectedsCount"))
  {
    objc_msgSend(v50, "clearReleaseCauseCountNotConnecteds");
    v19 = -[CellularCallCount releaseCauseCountNotConnectedsCount](self, "releaseCauseCountNotConnectedsCount");
    if (v19)
    {
      v20 = v19;
      for (m = 0; m != v20; ++m)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallCount releaseCauseCountNotConnectedAtIndex:](self, "releaseCauseCountNotConnectedAtIndex:", m));
        objc_msgSend(v50, "addReleaseCauseCountNotConnected:", v22);

      }
    }
  }
  v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x2000) == 0)
  {
    if ((*(_BYTE *)&v23 & 8) == 0)
      goto LABEL_29;
LABEL_76:
    v50[14] = self->_numConnectedCallsGw;
    v50[43] |= 8u;
    if ((*(_DWORD *)&self->_has & 0x200) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
  v50[24] = self->_numTotalCallsGw;
  v50[43] |= 0x2000u;
  v23 = self->_has;
  if ((*(_BYTE *)&v23 & 8) != 0)
    goto LABEL_76;
LABEL_29:
  if ((*(_WORD *)&v23 & 0x200) != 0)
  {
LABEL_30:
    v50[20] = self->_numNormalReleaseCallsGw;
    v50[43] |= 0x200u;
  }
LABEL_31:
  if (-[CellularCallCount endStatusCountConnectedGwsCount](self, "endStatusCountConnectedGwsCount"))
  {
    objc_msgSend(v50, "clearEndStatusCountConnectedGws");
    v24 = -[CellularCallCount endStatusCountConnectedGwsCount](self, "endStatusCountConnectedGwsCount");
    if (v24)
    {
      v25 = v24;
      for (n = 0; n != v25; ++n)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallCount endStatusCountConnectedGwAtIndex:](self, "endStatusCountConnectedGwAtIndex:", n));
        objc_msgSend(v50, "addEndStatusCountConnectedGw:", v27);

      }
    }
  }
  if (-[CellularCallCount endStatusCountNotConnectedGwsCount](self, "endStatusCountNotConnectedGwsCount"))
  {
    objc_msgSend(v50, "clearEndStatusCountNotConnectedGws");
    v28 = -[CellularCallCount endStatusCountNotConnectedGwsCount](self, "endStatusCountNotConnectedGwsCount");
    if (v28)
    {
      v29 = v28;
      for (ii = 0; ii != v29; ++ii)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallCount endStatusCountNotConnectedGwAtIndex:](self, "endStatusCountNotConnectedGwAtIndex:", ii));
        objc_msgSend(v50, "addEndStatusCountNotConnectedGw:", v31);

      }
    }
  }
  v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x1000) == 0)
  {
    if ((*(_BYTE *)&v32 & 4) == 0)
      goto LABEL_41;
LABEL_79:
    v50[13] = self->_numConnectedCallsGsm;
    v50[43] |= 4u;
    if ((*(_DWORD *)&self->_has & 0x100) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
  v50[23] = self->_numTotalCallsGsm;
  v50[43] |= 0x1000u;
  v32 = self->_has;
  if ((*(_BYTE *)&v32 & 4) != 0)
    goto LABEL_79;
LABEL_41:
  if ((*(_WORD *)&v32 & 0x100) != 0)
  {
LABEL_42:
    v50[19] = self->_numNormalReleaseCallsGsm;
    v50[43] |= 0x100u;
  }
LABEL_43:
  if (-[CellularCallCount releaseCauseCountConnectedGsmsCount](self, "releaseCauseCountConnectedGsmsCount"))
  {
    objc_msgSend(v50, "clearReleaseCauseCountConnectedGsms");
    v33 = -[CellularCallCount releaseCauseCountConnectedGsmsCount](self, "releaseCauseCountConnectedGsmsCount");
    if (v33)
    {
      v34 = v33;
      for (jj = 0; jj != v34; ++jj)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallCount releaseCauseCountConnectedGsmAtIndex:](self, "releaseCauseCountConnectedGsmAtIndex:", jj));
        objc_msgSend(v50, "addReleaseCauseCountConnectedGsm:", v36);

      }
    }
  }
  if (-[CellularCallCount releaseCauseCountNotConnectedGsmsCount](self, "releaseCauseCountNotConnectedGsmsCount"))
  {
    objc_msgSend(v50, "clearReleaseCauseCountNotConnectedGsms");
    v37 = -[CellularCallCount releaseCauseCountNotConnectedGsmsCount](self, "releaseCauseCountNotConnectedGsmsCount");
    if (v37)
    {
      v38 = v37;
      for (kk = 0; kk != v38; ++kk)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallCount releaseCauseCountNotConnectedGsmAtIndex:](self, "releaseCauseCountNotConnectedGsmAtIndex:", kk));
        objc_msgSend(v50, "addReleaseCauseCountNotConnectedGsm:", v40);

      }
    }
  }
  v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x20000) != 0)
  {
    v50[41] = self->_totalConnectedSecondsGsm;
    v50[43] |= 0x20000u;
    v41 = self->_has;
    if ((*(_WORD *)&v41 & 0x4000) == 0)
    {
LABEL_53:
      if ((*(_BYTE *)&v41 & 0x10) == 0)
        goto LABEL_54;
LABEL_83:
      v50[15] = self->_numConnectedCallsWcdma;
      v50[43] |= 0x10u;
      if ((*(_DWORD *)&self->_has & 0x400) == 0)
        goto LABEL_56;
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&v41 & 0x4000) == 0)
  {
    goto LABEL_53;
  }
  v50[25] = self->_numTotalCallsWcdma;
  v50[43] |= 0x4000u;
  v41 = self->_has;
  if ((*(_BYTE *)&v41 & 0x10) != 0)
    goto LABEL_83;
LABEL_54:
  if ((*(_WORD *)&v41 & 0x400) != 0)
  {
LABEL_55:
    v50[21] = self->_numNormalReleaseCallsWcdma;
    v50[43] |= 0x400u;
  }
LABEL_56:
  if (-[CellularCallCount releaseCauseCountConnectedWcdmasCount](self, "releaseCauseCountConnectedWcdmasCount"))
  {
    objc_msgSend(v50, "clearReleaseCauseCountConnectedWcdmas");
    v42 = -[CellularCallCount releaseCauseCountConnectedWcdmasCount](self, "releaseCauseCountConnectedWcdmasCount");
    if (v42)
    {
      v43 = v42;
      for (mm = 0; mm != v43; ++mm)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallCount releaseCauseCountConnectedWcdmaAtIndex:](self, "releaseCauseCountConnectedWcdmaAtIndex:", mm));
        objc_msgSend(v50, "addReleaseCauseCountConnectedWcdma:", v45);

      }
    }
  }
  if (-[CellularCallCount releaseCauseCountNotConnectedWcdmasCount](self, "releaseCauseCountNotConnectedWcdmasCount"))
  {
    objc_msgSend(v50, "clearReleaseCauseCountNotConnectedWcdmas");
    v46 = -[CellularCallCount releaseCauseCountNotConnectedWcdmasCount](self, "releaseCauseCountNotConnectedWcdmasCount");
    if (v46)
    {
      v47 = v46;
      for (nn = 0; nn != v47; ++nn)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallCount releaseCauseCountNotConnectedWcdmaAtIndex:](self, "releaseCauseCountNotConnectedWcdmaAtIndex:", nn));
        objc_msgSend(v50, "addReleaseCauseCountNotConnectedWcdma:", v49);

      }
    }
  }
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    v50[42] = self->_totalConnectedSecondsWcdma;
    v50[43] |= 0x40000u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _DWORD *v6;
  $6BF4D661EEBB0D17828DA0D6CA72866A has;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  $6BF4D661EEBB0D17828DA0D6CA72866A v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSMutableArray *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  $6BF4D661EEBB0D17828DA0D6CA72866A v33;
  NSMutableArray *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSMutableArray *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  $6BF4D661EEBB0D17828DA0D6CA72866A v46;
  NSMutableArray *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  NSMutableArray *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *v57;
  id v58;
  $6BF4D661EEBB0D17828DA0D6CA72866A v59;
  NSMutableArray *v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  id v65;
  NSMutableArray *v66;
  id v67;
  id v68;
  uint64_t v69;
  void *v70;
  id v71;
  _DWORD *v72;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)v5 + 1) = self->_timestamp;
    v5[43] |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_99;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  v5[26] = self->_periodSeconds;
  v5[43] |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_100;
  }
LABEL_99:
  v5[22] = self->_numTotalCallsCdma;
  v5[43] |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_100:
  v5[12] = self->_numConnectedCallsCdma;
  v5[43] |= 2u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    v5[18] = self->_numNormalReleaseCallsCdma;
    v5[43] |= 0x80u;
  }
LABEL_7:
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v8 = self->_endStatusCountConnectedCdmas;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v111;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v111 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)v12), "copyWithZone:", a3);
        objc_msgSend(v6, "addEndStatusCountConnectedCdma:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
    }
    while (v10);
  }

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v14 = self->_endStatusCountNotConnectedCdmas;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v107;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v107 != v17)
          objc_enumerationMutation(v14);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)v18), "copyWithZone:", a3);
        objc_msgSend(v6, "addEndStatusCountNotConnectedCdma:", v19);

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
    }
    while (v16);
  }

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000) != 0)
  {
    v6[40] = self->_totalConnectedSecondsCdma;
    v6[43] |= 0x10000u;
    v20 = self->_has;
    if ((*(_BYTE *)&v20 & 0x40) == 0)
    {
LABEL_23:
      if ((*(_BYTE *)&v20 & 0x20) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&v20 & 0x40) == 0)
  {
    goto LABEL_23;
  }
  v6[17] = self->_numMultiRabEverCalls;
  v6[43] |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_24:
    v6[16] = self->_numMultiRabEndCalls;
    v6[43] |= 0x20u;
  }
LABEL_25:
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v21 = self->_releaseCauseCountConnecteds;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v103;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v103 != v24)
          objc_enumerationMutation(v21);
        v26 = objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)v25), "copyWithZone:", a3);
        objc_msgSend(v6, "addReleaseCauseCountConnected:", v26);

        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
    }
    while (v23);
  }

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v27 = self->_releaseCauseCountNotConnecteds;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v99;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v99 != v30)
          objc_enumerationMutation(v27);
        v32 = objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)v31), "copyWithZone:", a3);
        objc_msgSend(v6, "addReleaseCauseCountNotConnected:", v32);

        v31 = (char *)v31 + 1;
      }
      while (v29 != v31);
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
    }
    while (v29);
  }

  v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x2000) != 0)
  {
    v6[24] = self->_numTotalCallsGw;
    v6[43] |= 0x2000u;
    v33 = self->_has;
    if ((*(_BYTE *)&v33 & 8) == 0)
    {
LABEL_41:
      if ((*(_WORD *)&v33 & 0x200) == 0)
        goto LABEL_43;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&v33 & 8) == 0)
  {
    goto LABEL_41;
  }
  v6[14] = self->_numConnectedCallsGw;
  v6[43] |= 8u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_42:
    v6[20] = self->_numNormalReleaseCallsGw;
    v6[43] |= 0x200u;
  }
LABEL_43:
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v34 = self->_endStatusCountConnectedGws;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v94, v119, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v95;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v95 != v37)
          objc_enumerationMutation(v34);
        v39 = objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)v38), "copyWithZone:", a3);
        objc_msgSend(v6, "addEndStatusCountConnectedGw:", v39);

        v38 = (char *)v38 + 1;
      }
      while (v36 != v38);
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v94, v119, 16);
    }
    while (v36);
  }

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v40 = self->_endStatusCountNotConnectedGws;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v90, v118, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v91;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v91 != v43)
          objc_enumerationMutation(v40);
        v45 = objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)v44), "copyWithZone:", a3);
        objc_msgSend(v6, "addEndStatusCountNotConnectedGw:", v45);

        v44 = (char *)v44 + 1;
      }
      while (v42 != v44);
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v90, v118, 16);
    }
    while (v42);
  }

  v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x1000) != 0)
  {
    v6[23] = self->_numTotalCallsGsm;
    v6[43] |= 0x1000u;
    v46 = self->_has;
    if ((*(_BYTE *)&v46 & 4) == 0)
    {
LABEL_59:
      if ((*(_WORD *)&v46 & 0x100) == 0)
        goto LABEL_61;
      goto LABEL_60;
    }
  }
  else if ((*(_BYTE *)&v46 & 4) == 0)
  {
    goto LABEL_59;
  }
  v6[13] = self->_numConnectedCallsGsm;
  v6[43] |= 4u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_60:
    v6[19] = self->_numNormalReleaseCallsGsm;
    v6[43] |= 0x100u;
  }
LABEL_61:
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v47 = self->_releaseCauseCountConnectedGsms;
  v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v86, v117, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v87;
    do
    {
      v51 = 0;
      do
      {
        if (*(_QWORD *)v87 != v50)
          objc_enumerationMutation(v47);
        v52 = objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)v51), "copyWithZone:", a3);
        objc_msgSend(v6, "addReleaseCauseCountConnectedGsm:", v52);

        v51 = (char *)v51 + 1;
      }
      while (v49 != v51);
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v86, v117, 16);
    }
    while (v49);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v53 = self->_releaseCauseCountNotConnectedGsms;
  v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v82, v116, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v83;
    do
    {
      v57 = 0;
      do
      {
        if (*(_QWORD *)v83 != v56)
          objc_enumerationMutation(v53);
        v58 = objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)v57), "copyWithZone:", a3);
        objc_msgSend(v6, "addReleaseCauseCountNotConnectedGsm:", v58);

        v57 = (char *)v57 + 1;
      }
      while (v55 != v57);
      v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v82, v116, 16);
    }
    while (v55);
  }

  v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x20000) != 0)
  {
    v6[41] = self->_totalConnectedSecondsGsm;
    v6[43] |= 0x20000u;
    v59 = self->_has;
    if ((*(_WORD *)&v59 & 0x4000) == 0)
    {
LABEL_77:
      if ((*(_BYTE *)&v59 & 0x10) == 0)
        goto LABEL_78;
      goto LABEL_113;
    }
  }
  else if ((*(_WORD *)&v59 & 0x4000) == 0)
  {
    goto LABEL_77;
  }
  v6[25] = self->_numTotalCallsWcdma;
  v6[43] |= 0x4000u;
  v59 = self->_has;
  if ((*(_BYTE *)&v59 & 0x10) == 0)
  {
LABEL_78:
    if ((*(_WORD *)&v59 & 0x400) == 0)
      goto LABEL_80;
    goto LABEL_79;
  }
LABEL_113:
  v6[15] = self->_numConnectedCallsWcdma;
  v6[43] |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_79:
    v6[21] = self->_numNormalReleaseCallsWcdma;
    v6[43] |= 0x400u;
  }
LABEL_80:
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v60 = self->_releaseCauseCountConnectedWcdmas;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v78, v115, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v79;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v79 != v63)
          objc_enumerationMutation(v60);
        v65 = objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)v64), "copyWithZone:", a3);
        objc_msgSend(v6, "addReleaseCauseCountConnectedWcdma:", v65);

        v64 = (char *)v64 + 1;
      }
      while (v62 != v64);
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v78, v115, 16);
    }
    while (v62);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v66 = self->_releaseCauseCountNotConnectedWcdmas;
  v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v74, v114, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v75;
    do
    {
      v70 = 0;
      do
      {
        if (*(_QWORD *)v75 != v69)
          objc_enumerationMutation(v66);
        v71 = objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)v70), "copyWithZone:", a3, (_QWORD)v74);
        objc_msgSend(v6, "addReleaseCauseCountNotConnectedWcdma:", v71);

        v70 = (char *)v70 + 1;
      }
      while (v68 != v70);
      v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v74, v114, 16);
    }
    while (v68);
  }

  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    v6[42] = self->_totalConnectedSecondsWcdma;
    v6[43] |= 0x40000u;
  }
  v72 = v6;

  return v72;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  $6BF4D661EEBB0D17828DA0D6CA72866A has;
  int v7;
  NSMutableArray *endStatusCountConnectedCdmas;
  NSMutableArray *endStatusCountNotConnectedCdmas;
  $6BF4D661EEBB0D17828DA0D6CA72866A v10;
  int v11;
  NSMutableArray *releaseCauseCountConnecteds;
  NSMutableArray *releaseCauseCountNotConnecteds;
  $6BF4D661EEBB0D17828DA0D6CA72866A v14;
  int v15;
  NSMutableArray *endStatusCountConnectedGws;
  NSMutableArray *endStatusCountNotConnectedGws;
  $6BF4D661EEBB0D17828DA0D6CA72866A v18;
  int v19;
  NSMutableArray *releaseCauseCountConnectedGsms;
  NSMutableArray *releaseCauseCountNotConnectedGsms;
  $6BF4D661EEBB0D17828DA0D6CA72866A v22;
  int v23;
  NSMutableArray *releaseCauseCountConnectedWcdmas;
  NSMutableArray *releaseCauseCountNotConnectedWcdmas;
  int v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_117;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 43);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_117;
  }
  else if ((v7 & 1) != 0)
  {
LABEL_117:
    v27 = 0;
    goto LABEL_118;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_periodSeconds != *((_DWORD *)v4 + 26))
      goto LABEL_117;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_numTotalCallsCdma != *((_DWORD *)v4 + 22))
      goto LABEL_117;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_numConnectedCallsCdma != *((_DWORD *)v4 + 12))
      goto LABEL_117;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_numNormalReleaseCallsCdma != *((_DWORD *)v4 + 18))
      goto LABEL_117;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_117;
  }
  endStatusCountConnectedCdmas = self->_endStatusCountConnectedCdmas;
  if ((unint64_t)endStatusCountConnectedCdmas | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](endStatusCountConnectedCdmas, "isEqual:"))
  {
    goto LABEL_117;
  }
  endStatusCountNotConnectedCdmas = self->_endStatusCountNotConnectedCdmas;
  if ((unint64_t)endStatusCountNotConnectedCdmas | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](endStatusCountNotConnectedCdmas, "isEqual:"))
      goto LABEL_117;
  }
  v10 = self->_has;
  v11 = *((_DWORD *)v4 + 43);
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0 || self->_totalConnectedSecondsCdma != *((_DWORD *)v4 + 40))
      goto LABEL_117;
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_BYTE *)&v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_numMultiRabEverCalls != *((_DWORD *)v4 + 17))
      goto LABEL_117;
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_BYTE *)&v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_numMultiRabEndCalls != *((_DWORD *)v4 + 16))
      goto LABEL_117;
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_117;
  }
  releaseCauseCountConnecteds = self->_releaseCauseCountConnecteds;
  if ((unint64_t)releaseCauseCountConnecteds | *((_QWORD *)v4 + 16)
    && !-[NSMutableArray isEqual:](releaseCauseCountConnecteds, "isEqual:"))
  {
    goto LABEL_117;
  }
  releaseCauseCountNotConnecteds = self->_releaseCauseCountNotConnecteds;
  if ((unint64_t)releaseCauseCountNotConnecteds | *((_QWORD *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](releaseCauseCountNotConnecteds, "isEqual:"))
      goto LABEL_117;
  }
  v14 = self->_has;
  v15 = *((_DWORD *)v4 + 43);
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
    if ((v15 & 0x2000) == 0 || self->_numTotalCallsGw != *((_DWORD *)v4 + 24))
      goto LABEL_117;
  }
  else if ((v15 & 0x2000) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_BYTE *)&v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_numConnectedCallsGw != *((_DWORD *)v4 + 14))
      goto LABEL_117;
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    if ((v15 & 0x200) == 0 || self->_numNormalReleaseCallsGw != *((_DWORD *)v4 + 20))
      goto LABEL_117;
  }
  else if ((v15 & 0x200) != 0)
  {
    goto LABEL_117;
  }
  endStatusCountConnectedGws = self->_endStatusCountConnectedGws;
  if ((unint64_t)endStatusCountConnectedGws | *((_QWORD *)v4 + 3)
    && !-[NSMutableArray isEqual:](endStatusCountConnectedGws, "isEqual:"))
  {
    goto LABEL_117;
  }
  endStatusCountNotConnectedGws = self->_endStatusCountNotConnectedGws;
  if ((unint64_t)endStatusCountNotConnectedGws | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](endStatusCountNotConnectedGws, "isEqual:"))
      goto LABEL_117;
  }
  v18 = self->_has;
  v19 = *((_DWORD *)v4 + 43);
  if ((*(_WORD *)&v18 & 0x1000) != 0)
  {
    if ((v19 & 0x1000) == 0 || self->_numTotalCallsGsm != *((_DWORD *)v4 + 23))
      goto LABEL_117;
  }
  else if ((v19 & 0x1000) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_BYTE *)&v18 & 4) != 0)
  {
    if ((v19 & 4) == 0 || self->_numConnectedCallsGsm != *((_DWORD *)v4 + 13))
      goto LABEL_117;
  }
  else if ((v19 & 4) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&v18 & 0x100) != 0)
  {
    if ((v19 & 0x100) == 0 || self->_numNormalReleaseCallsGsm != *((_DWORD *)v4 + 19))
      goto LABEL_117;
  }
  else if ((v19 & 0x100) != 0)
  {
    goto LABEL_117;
  }
  releaseCauseCountConnectedGsms = self->_releaseCauseCountConnectedGsms;
  if ((unint64_t)releaseCauseCountConnectedGsms | *((_QWORD *)v4 + 14)
    && !-[NSMutableArray isEqual:](releaseCauseCountConnectedGsms, "isEqual:"))
  {
    goto LABEL_117;
  }
  releaseCauseCountNotConnectedGsms = self->_releaseCauseCountNotConnectedGsms;
  if ((unint64_t)releaseCauseCountNotConnectedGsms | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](releaseCauseCountNotConnectedGsms, "isEqual:"))
      goto LABEL_117;
  }
  v22 = self->_has;
  v23 = *((_DWORD *)v4 + 43);
  if ((*(_DWORD *)&v22 & 0x20000) != 0)
  {
    if ((v23 & 0x20000) == 0 || self->_totalConnectedSecondsGsm != *((_DWORD *)v4 + 41))
      goto LABEL_117;
  }
  else if ((v23 & 0x20000) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&v22 & 0x4000) != 0)
  {
    if ((v23 & 0x4000) == 0 || self->_numTotalCallsWcdma != *((_DWORD *)v4 + 25))
      goto LABEL_117;
  }
  else if ((v23 & 0x4000) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_BYTE *)&v22 & 0x10) != 0)
  {
    if ((v23 & 0x10) == 0 || self->_numConnectedCallsWcdma != *((_DWORD *)v4 + 15))
      goto LABEL_117;
  }
  else if ((v23 & 0x10) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&v22 & 0x400) != 0)
  {
    if ((v23 & 0x400) == 0 || self->_numNormalReleaseCallsWcdma != *((_DWORD *)v4 + 21))
      goto LABEL_117;
  }
  else if ((v23 & 0x400) != 0)
  {
    goto LABEL_117;
  }
  releaseCauseCountConnectedWcdmas = self->_releaseCauseCountConnectedWcdmas;
  if ((unint64_t)releaseCauseCountConnectedWcdmas | *((_QWORD *)v4 + 15)
    && !-[NSMutableArray isEqual:](releaseCauseCountConnectedWcdmas, "isEqual:"))
  {
    goto LABEL_117;
  }
  releaseCauseCountNotConnectedWcdmas = self->_releaseCauseCountNotConnectedWcdmas;
  if ((unint64_t)releaseCauseCountNotConnectedWcdmas | *((_QWORD *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](releaseCauseCountNotConnectedWcdmas, "isEqual:"))
      goto LABEL_117;
  }
  v26 = *((_DWORD *)v4 + 43);
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    if ((v26 & 0x40000) == 0 || self->_totalConnectedSecondsWcdma != *((_DWORD *)v4 + 42))
      goto LABEL_117;
    v27 = 1;
  }
  else
  {
    v27 = (v26 & 0x40000) == 0;
  }
LABEL_118:

  return v27;
}

- (unint64_t)hash
{
  $6BF4D661EEBB0D17828DA0D6CA72866A has;
  $6BF4D661EEBB0D17828DA0D6CA72866A v4;
  $6BF4D661EEBB0D17828DA0D6CA72866A v5;
  $6BF4D661EEBB0D17828DA0D6CA72866A v6;
  unint64_t v7;
  unint64_t v8;
  $6BF4D661EEBB0D17828DA0D6CA72866A v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v37 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      v36 = 2654435761 * self->_periodSeconds;
      if ((*(_WORD *)&has & 0x800) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v37 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_3;
  }
  v36 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_4:
    v35 = 2654435761 * self->_numTotalCallsCdma;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_5;
LABEL_10:
    v34 = 0;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v35 = 0;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_10;
LABEL_5:
  v34 = 2654435761 * self->_numConnectedCallsCdma;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_6:
    v33 = 2654435761 * self->_numNormalReleaseCallsCdma;
    goto LABEL_12;
  }
LABEL_11:
  v33 = 0;
LABEL_12:
  v32 = (unint64_t)-[NSMutableArray hash](self->_endStatusCountConnectedCdmas, "hash");
  v31 = (unint64_t)-[NSMutableArray hash](self->_endStatusCountNotConnectedCdmas, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x10000) == 0)
  {
    v30 = 0;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_14;
LABEL_17:
    v29 = 0;
    if ((*(_BYTE *)&v4 & 0x20) != 0)
      goto LABEL_15;
    goto LABEL_18;
  }
  v30 = 2654435761 * self->_totalConnectedSecondsCdma;
  if ((*(_BYTE *)&v4 & 0x40) == 0)
    goto LABEL_17;
LABEL_14:
  v29 = 2654435761 * self->_numMultiRabEverCalls;
  if ((*(_BYTE *)&v4 & 0x20) != 0)
  {
LABEL_15:
    v28 = 2654435761 * self->_numMultiRabEndCalls;
    goto LABEL_19;
  }
LABEL_18:
  v28 = 0;
LABEL_19:
  v27 = (unint64_t)-[NSMutableArray hash](self->_releaseCauseCountConnecteds, "hash");
  v26 = (unint64_t)-[NSMutableArray hash](self->_releaseCauseCountNotConnecteds, "hash");
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
    v25 = 0;
    if ((*(_BYTE *)&v5 & 8) != 0)
      goto LABEL_21;
LABEL_24:
    v24 = 0;
    if ((*(_WORD *)&v5 & 0x200) != 0)
      goto LABEL_22;
    goto LABEL_25;
  }
  v25 = 2654435761 * self->_numTotalCallsGw;
  if ((*(_BYTE *)&v5 & 8) == 0)
    goto LABEL_24;
LABEL_21:
  v24 = 2654435761 * self->_numConnectedCallsGw;
  if ((*(_WORD *)&v5 & 0x200) != 0)
  {
LABEL_22:
    v23 = 2654435761 * self->_numNormalReleaseCallsGw;
    goto LABEL_26;
  }
LABEL_25:
  v23 = 0;
LABEL_26:
  v22 = (unint64_t)-[NSMutableArray hash](self->_endStatusCountConnectedGws, "hash");
  v21 = (unint64_t)-[NSMutableArray hash](self->_endStatusCountNotConnectedGws, "hash");
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
    v20 = 0;
    if ((*(_BYTE *)&v6 & 4) != 0)
      goto LABEL_28;
LABEL_31:
    v19 = 0;
    if ((*(_WORD *)&v6 & 0x100) != 0)
      goto LABEL_29;
    goto LABEL_32;
  }
  v20 = 2654435761 * self->_numTotalCallsGsm;
  if ((*(_BYTE *)&v6 & 4) == 0)
    goto LABEL_31;
LABEL_28:
  v19 = 2654435761 * self->_numConnectedCallsGsm;
  if ((*(_WORD *)&v6 & 0x100) != 0)
  {
LABEL_29:
    v18 = 2654435761 * self->_numNormalReleaseCallsGsm;
    goto LABEL_33;
  }
LABEL_32:
  v18 = 0;
LABEL_33:
  v7 = (unint64_t)-[NSMutableArray hash](self->_releaseCauseCountConnectedGsms, "hash");
  v8 = (unint64_t)-[NSMutableArray hash](self->_releaseCauseCountNotConnectedGsms, "hash");
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) != 0)
  {
    v10 = 2654435761 * self->_totalConnectedSecondsGsm;
    if ((*(_WORD *)&v9 & 0x4000) != 0)
    {
LABEL_35:
      v11 = 2654435761 * self->_numTotalCallsWcdma;
      if ((*(_BYTE *)&v9 & 0x10) != 0)
        goto LABEL_36;
LABEL_40:
      v12 = 0;
      if ((*(_WORD *)&v9 & 0x400) != 0)
        goto LABEL_37;
      goto LABEL_41;
    }
  }
  else
  {
    v10 = 0;
    if ((*(_WORD *)&v9 & 0x4000) != 0)
      goto LABEL_35;
  }
  v11 = 0;
  if ((*(_BYTE *)&v9 & 0x10) == 0)
    goto LABEL_40;
LABEL_36:
  v12 = 2654435761 * self->_numConnectedCallsWcdma;
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
LABEL_37:
    v13 = 2654435761 * self->_numNormalReleaseCallsWcdma;
    goto LABEL_42;
  }
LABEL_41:
  v13 = 0;
LABEL_42:
  v14 = (unint64_t)-[NSMutableArray hash](self->_releaseCauseCountConnectedWcdmas, "hash");
  v15 = (unint64_t)-[NSMutableArray hash](self->_releaseCauseCountNotConnectedWcdmas, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    v16 = 2654435761 * self->_totalConnectedSecondsWcdma;
  else
    v16 = 0;
  return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  int v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  int v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  int v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_DWORD *)v4 + 43);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v6 = *((_DWORD *)v4 + 43);
    if ((v6 & 0x8000) == 0)
    {
LABEL_3:
      if ((v6 & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  self->_periodSeconds = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x8000u;
  v6 = *((_DWORD *)v4 + 43);
  if ((v6 & 0x800) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0)
      goto LABEL_5;
    goto LABEL_100;
  }
LABEL_99:
  self->_numTotalCallsCdma = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)v4 + 43);
  if ((v6 & 2) == 0)
  {
LABEL_5:
    if ((v6 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_100:
  self->_numConnectedCallsCdma = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v4 + 43) & 0x80) != 0)
  {
LABEL_6:
    self->_numNormalReleaseCallsCdma = *((_DWORD *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_7:
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v98;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v98 != v10)
          objc_enumerationMutation(v7);
        -[CellularCallCount addEndStatusCountConnectedCdma:](self, "addEndStatusCountConnectedCdma:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
    }
    while (v9);
  }

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v12 = *((id *)v5 + 4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v94;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v94 != v15)
          objc_enumerationMutation(v12);
        -[CellularCallCount addEndStatusCountNotConnectedCdma:](self, "addEndStatusCountNotConnectedCdma:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)v16));
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
    }
    while (v14);
  }

  v17 = *((_DWORD *)v5 + 43);
  if ((v17 & 0x10000) != 0)
  {
    self->_totalConnectedSecondsCdma = *((_DWORD *)v5 + 40);
    *(_DWORD *)&self->_has |= 0x10000u;
    v17 = *((_DWORD *)v5 + 43);
    if ((v17 & 0x40) == 0)
    {
LABEL_23:
      if ((v17 & 0x20) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((v17 & 0x40) == 0)
  {
    goto LABEL_23;
  }
  self->_numMultiRabEverCalls = *((_DWORD *)v5 + 17);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)v5 + 43) & 0x20) != 0)
  {
LABEL_24:
    self->_numMultiRabEndCalls = *((_DWORD *)v5 + 16);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_25:
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v18 = *((id *)v5 + 16);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v89, v108, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v90;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v90 != v21)
          objc_enumerationMutation(v18);
        -[CellularCallCount addReleaseCauseCountConnected:](self, "addReleaseCauseCountConnected:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v22));
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v89, v108, 16);
    }
    while (v20);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v23 = *((id *)v5 + 19);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v86;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v86 != v26)
          objc_enumerationMutation(v23);
        -[CellularCallCount addReleaseCauseCountNotConnected:](self, "addReleaseCauseCountNotConnected:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)v27));
        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
    }
    while (v25);
  }

  v28 = *((_DWORD *)v5 + 43);
  if ((v28 & 0x2000) != 0)
  {
    self->_numTotalCallsGw = *((_DWORD *)v5 + 24);
    *(_DWORD *)&self->_has |= 0x2000u;
    v28 = *((_DWORD *)v5 + 43);
    if ((v28 & 8) == 0)
    {
LABEL_41:
      if ((v28 & 0x200) == 0)
        goto LABEL_43;
      goto LABEL_42;
    }
  }
  else if ((v28 & 8) == 0)
  {
    goto LABEL_41;
  }
  self->_numConnectedCallsGw = *((_DWORD *)v5 + 14);
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)v5 + 43) & 0x200) != 0)
  {
LABEL_42:
    self->_numNormalReleaseCallsGw = *((_DWORD *)v5 + 20);
    *(_DWORD *)&self->_has |= 0x200u;
  }
LABEL_43:
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v29 = *((id *)v5 + 3);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v81, v106, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v82;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v82 != v32)
          objc_enumerationMutation(v29);
        -[CellularCallCount addEndStatusCountConnectedGw:](self, "addEndStatusCountConnectedGw:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)v33));
        v33 = (char *)v33 + 1;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v81, v106, 16);
    }
    while (v31);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v34 = *((id *)v5 + 5);
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v77, v105, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v78;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v78 != v37)
          objc_enumerationMutation(v34);
        -[CellularCallCount addEndStatusCountNotConnectedGw:](self, "addEndStatusCountNotConnectedGw:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)v38));
        v38 = (char *)v38 + 1;
      }
      while (v36 != v38);
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v77, v105, 16);
    }
    while (v36);
  }

  v39 = *((_DWORD *)v5 + 43);
  if ((v39 & 0x1000) != 0)
  {
    self->_numTotalCallsGsm = *((_DWORD *)v5 + 23);
    *(_DWORD *)&self->_has |= 0x1000u;
    v39 = *((_DWORD *)v5 + 43);
    if ((v39 & 4) == 0)
    {
LABEL_59:
      if ((v39 & 0x100) == 0)
        goto LABEL_61;
      goto LABEL_60;
    }
  }
  else if ((v39 & 4) == 0)
  {
    goto LABEL_59;
  }
  self->_numConnectedCallsGsm = *((_DWORD *)v5 + 13);
  *(_DWORD *)&self->_has |= 4u;
  if ((*((_DWORD *)v5 + 43) & 0x100) != 0)
  {
LABEL_60:
    self->_numNormalReleaseCallsGsm = *((_DWORD *)v5 + 19);
    *(_DWORD *)&self->_has |= 0x100u;
  }
LABEL_61:
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v40 = *((id *)v5 + 14);
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v73, v104, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v74;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v74 != v43)
          objc_enumerationMutation(v40);
        -[CellularCallCount addReleaseCauseCountConnectedGsm:](self, "addReleaseCauseCountConnectedGsm:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)v44));
        v44 = (char *)v44 + 1;
      }
      while (v42 != v44);
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v73, v104, 16);
    }
    while (v42);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v45 = *((id *)v5 + 17);
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v69, v103, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v70;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v70 != v48)
          objc_enumerationMutation(v45);
        -[CellularCallCount addReleaseCauseCountNotConnectedGsm:](self, "addReleaseCauseCountNotConnectedGsm:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v49));
        v49 = (char *)v49 + 1;
      }
      while (v47 != v49);
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v69, v103, 16);
    }
    while (v47);
  }

  v50 = *((_DWORD *)v5 + 43);
  if ((v50 & 0x20000) != 0)
  {
    self->_totalConnectedSecondsGsm = *((_DWORD *)v5 + 41);
    *(_DWORD *)&self->_has |= 0x20000u;
    v50 = *((_DWORD *)v5 + 43);
    if ((v50 & 0x4000) == 0)
    {
LABEL_77:
      if ((v50 & 0x10) == 0)
        goto LABEL_78;
      goto LABEL_113;
    }
  }
  else if ((v50 & 0x4000) == 0)
  {
    goto LABEL_77;
  }
  self->_numTotalCallsWcdma = *((_DWORD *)v5 + 25);
  *(_DWORD *)&self->_has |= 0x4000u;
  v50 = *((_DWORD *)v5 + 43);
  if ((v50 & 0x10) == 0)
  {
LABEL_78:
    if ((v50 & 0x400) == 0)
      goto LABEL_80;
    goto LABEL_79;
  }
LABEL_113:
  self->_numConnectedCallsWcdma = *((_DWORD *)v5 + 15);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)v5 + 43) & 0x400) != 0)
  {
LABEL_79:
    self->_numNormalReleaseCallsWcdma = *((_DWORD *)v5 + 21);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_80:
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v51 = *((id *)v5 + 15);
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v65, v102, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v66;
    do
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v66 != v54)
          objc_enumerationMutation(v51);
        -[CellularCallCount addReleaseCauseCountConnectedWcdma:](self, "addReleaseCauseCountConnectedWcdma:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)v55));
        v55 = (char *)v55 + 1;
      }
      while (v53 != v55);
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v65, v102, 16);
    }
    while (v53);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v56 = *((id *)v5 + 18);
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v61, v101, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v62;
    do
    {
      v60 = 0;
      do
      {
        if (*(_QWORD *)v62 != v59)
          objc_enumerationMutation(v56);
        -[CellularCallCount addReleaseCauseCountNotConnectedWcdma:](self, "addReleaseCauseCountNotConnectedWcdma:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v60), (_QWORD)v61);
        v60 = (char *)v60 + 1;
      }
      while (v58 != v60);
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v61, v101, 16);
    }
    while (v58);
  }

  if ((*((_BYTE *)v5 + 174) & 4) != 0)
  {
    self->_totalConnectedSecondsWcdma = *((_DWORD *)v5 + 42);
    *(_DWORD *)&self->_has |= 0x40000u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)periodSeconds
{
  return self->_periodSeconds;
}

- (unsigned)numTotalCallsCdma
{
  return self->_numTotalCallsCdma;
}

- (unsigned)numConnectedCallsCdma
{
  return self->_numConnectedCallsCdma;
}

- (unsigned)numNormalReleaseCallsCdma
{
  return self->_numNormalReleaseCallsCdma;
}

- (NSMutableArray)endStatusCountConnectedCdmas
{
  return self->_endStatusCountConnectedCdmas;
}

- (void)setEndStatusCountConnectedCdmas:(id)a3
{
  objc_storeStrong((id *)&self->_endStatusCountConnectedCdmas, a3);
}

- (NSMutableArray)endStatusCountNotConnectedCdmas
{
  return self->_endStatusCountNotConnectedCdmas;
}

- (void)setEndStatusCountNotConnectedCdmas:(id)a3
{
  objc_storeStrong((id *)&self->_endStatusCountNotConnectedCdmas, a3);
}

- (unsigned)totalConnectedSecondsCdma
{
  return self->_totalConnectedSecondsCdma;
}

- (unsigned)numTotalCallsGw
{
  return self->_numTotalCallsGw;
}

- (unsigned)numConnectedCallsGw
{
  return self->_numConnectedCallsGw;
}

- (unsigned)numNormalReleaseCallsGw
{
  return self->_numNormalReleaseCallsGw;
}

- (NSMutableArray)endStatusCountConnectedGws
{
  return self->_endStatusCountConnectedGws;
}

- (void)setEndStatusCountConnectedGws:(id)a3
{
  objc_storeStrong((id *)&self->_endStatusCountConnectedGws, a3);
}

- (NSMutableArray)endStatusCountNotConnectedGws
{
  return self->_endStatusCountNotConnectedGws;
}

- (void)setEndStatusCountNotConnectedGws:(id)a3
{
  objc_storeStrong((id *)&self->_endStatusCountNotConnectedGws, a3);
}

- (unsigned)numMultiRabEverCalls
{
  return self->_numMultiRabEverCalls;
}

- (unsigned)numMultiRabEndCalls
{
  return self->_numMultiRabEndCalls;
}

- (NSMutableArray)releaseCauseCountConnecteds
{
  return self->_releaseCauseCountConnecteds;
}

- (void)setReleaseCauseCountConnecteds:(id)a3
{
  objc_storeStrong((id *)&self->_releaseCauseCountConnecteds, a3);
}

- (NSMutableArray)releaseCauseCountNotConnecteds
{
  return self->_releaseCauseCountNotConnecteds;
}

- (void)setReleaseCauseCountNotConnecteds:(id)a3
{
  objc_storeStrong((id *)&self->_releaseCauseCountNotConnecteds, a3);
}

- (unsigned)numTotalCallsGsm
{
  return self->_numTotalCallsGsm;
}

- (unsigned)numConnectedCallsGsm
{
  return self->_numConnectedCallsGsm;
}

- (unsigned)numNormalReleaseCallsGsm
{
  return self->_numNormalReleaseCallsGsm;
}

- (NSMutableArray)releaseCauseCountConnectedGsms
{
  return self->_releaseCauseCountConnectedGsms;
}

- (void)setReleaseCauseCountConnectedGsms:(id)a3
{
  objc_storeStrong((id *)&self->_releaseCauseCountConnectedGsms, a3);
}

- (NSMutableArray)releaseCauseCountNotConnectedGsms
{
  return self->_releaseCauseCountNotConnectedGsms;
}

- (void)setReleaseCauseCountNotConnectedGsms:(id)a3
{
  objc_storeStrong((id *)&self->_releaseCauseCountNotConnectedGsms, a3);
}

- (unsigned)totalConnectedSecondsGsm
{
  return self->_totalConnectedSecondsGsm;
}

- (unsigned)numTotalCallsWcdma
{
  return self->_numTotalCallsWcdma;
}

- (unsigned)numConnectedCallsWcdma
{
  return self->_numConnectedCallsWcdma;
}

- (unsigned)numNormalReleaseCallsWcdma
{
  return self->_numNormalReleaseCallsWcdma;
}

- (NSMutableArray)releaseCauseCountConnectedWcdmas
{
  return self->_releaseCauseCountConnectedWcdmas;
}

- (void)setReleaseCauseCountConnectedWcdmas:(id)a3
{
  objc_storeStrong((id *)&self->_releaseCauseCountConnectedWcdmas, a3);
}

- (NSMutableArray)releaseCauseCountNotConnectedWcdmas
{
  return self->_releaseCauseCountNotConnectedWcdmas;
}

- (void)setReleaseCauseCountNotConnectedWcdmas:(id)a3
{
  objc_storeStrong((id *)&self->_releaseCauseCountNotConnectedWcdmas, a3);
}

- (unsigned)totalConnectedSecondsWcdma
{
  return self->_totalConnectedSecondsWcdma;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseCauseCountNotConnecteds, 0);
  objc_storeStrong((id *)&self->_releaseCauseCountNotConnectedWcdmas, 0);
  objc_storeStrong((id *)&self->_releaseCauseCountNotConnectedGsms, 0);
  objc_storeStrong((id *)&self->_releaseCauseCountConnecteds, 0);
  objc_storeStrong((id *)&self->_releaseCauseCountConnectedWcdmas, 0);
  objc_storeStrong((id *)&self->_releaseCauseCountConnectedGsms, 0);
  objc_storeStrong((id *)&self->_endStatusCountNotConnectedGws, 0);
  objc_storeStrong((id *)&self->_endStatusCountNotConnectedCdmas, 0);
  objc_storeStrong((id *)&self->_endStatusCountConnectedGws, 0);
  objc_storeStrong((id *)&self->_endStatusCountConnectedCdmas, 0);
}

@end
