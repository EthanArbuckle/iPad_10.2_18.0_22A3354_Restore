@implementation ATXCandidateRelevanceModelPBEvaluationMetrics

- (void)setUiEvaluationSuccessAt1:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_uiEvaluationSuccessAt1 = a3;
}

- (void)setHasUiEvaluationSuccessAt1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasUiEvaluationSuccessAt1
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setUiEvaluationSuccessAt2:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_uiEvaluationSuccessAt2 = a3;
}

- (void)setHasUiEvaluationSuccessAt2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasUiEvaluationSuccessAt2
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setUiEvaluationSuccessAt4:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_uiEvaluationSuccessAt4 = a3;
}

- (void)setHasUiEvaluationSuccessAt4:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasUiEvaluationSuccessAt4
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setUiEvaluationSuccessAt8:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_uiEvaluationSuccessAt8 = a3;
}

- (void)setHasUiEvaluationSuccessAt8:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = 0x80000000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(v3 & 0x80000000 | *(_DWORD *)&self->_has & 0x7FFFFFFF);
}

- (BOOL)hasUiEvaluationSuccessAt8
{
  return *(_DWORD *)&self->_has >> 31;
}

- (void)setUiEvaluationMRR:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_uiEvaluationMRR = a3;
}

- (void)setHasUiEvaluationMRR:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasUiEvaluationMRR
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setUiEvaluationNumberOfSessionsWithPredictions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_uiEvaluationNumberOfSessionsWithPredictions = a3;
}

- (void)setHasUiEvaluationNumberOfSessionsWithPredictions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasUiEvaluationNumberOfSessionsWithPredictions
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setUiEvaluationNumberOfSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_uiEvaluationNumberOfSessions = a3;
}

- (void)setHasUiEvaluationNumberOfSessions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasUiEvaluationNumberOfSessions
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setUiEvaluationNumberOfDaysWithSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_uiEvaluationNumberOfDaysWithSessions = a3;
}

- (void)setHasUiEvaluationNumberOfDaysWithSessions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasUiEvaluationNumberOfDaysWithSessions
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setShadowEvaluationSuccessAt1:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_shadowEvaluationSuccessAt1 = a3;
}

- (void)setHasShadowEvaluationSuccessAt1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasShadowEvaluationSuccessAt1
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setShadowEvaluationSuccessAt2:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_shadowEvaluationSuccessAt2 = a3;
}

- (void)setHasShadowEvaluationSuccessAt2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasShadowEvaluationSuccessAt2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setShadowEvaluationSuccessAt4:(float)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_shadowEvaluationSuccessAt4 = a3;
}

- (void)setHasShadowEvaluationSuccessAt4:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasShadowEvaluationSuccessAt4
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setShadowEvaluationSuccessAt8:(float)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_shadowEvaluationSuccessAt8 = a3;
}

- (void)setHasShadowEvaluationSuccessAt8:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasShadowEvaluationSuccessAt8
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setShadowEvaluationMRR:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_shadowEvaluationMRR = a3;
}

- (void)setHasShadowEvaluationMRR:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasShadowEvaluationMRR
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setShadowEvaluationNumberOfSessionsWithPredictions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_shadowEvaluationNumberOfSessionsWithPredictions = a3;
}

- (void)setHasShadowEvaluationNumberOfSessionsWithPredictions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasShadowEvaluationNumberOfSessionsWithPredictions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setShadowEvaluationNumberOfSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_shadowEvaluationNumberOfSessions = a3;
}

- (void)setHasShadowEvaluationNumberOfSessions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasShadowEvaluationNumberOfSessions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setShadowEvaluationNumberOfDaysWithSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_shadowEvaluationNumberOfDaysWithSessions = a3;
}

- (void)setHasShadowEvaluationNumberOfDaysWithSessions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasShadowEvaluationNumberOfDaysWithSessions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setProdUIEvaluationSuccessAt1:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_prodUIEvaluationSuccessAt1 = a3;
}

- (void)setHasProdUIEvaluationSuccessAt1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasProdUIEvaluationSuccessAt1
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setProdUIEvaluationSuccessAt2:(float)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_prodUIEvaluationSuccessAt2 = a3;
}

- (void)setHasProdUIEvaluationSuccessAt2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasProdUIEvaluationSuccessAt2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setProdUIEvaluationSuccessAt4:(float)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_prodUIEvaluationSuccessAt4 = a3;
}

- (void)setHasProdUIEvaluationSuccessAt4:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasProdUIEvaluationSuccessAt4
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setProdUIEvaluationSuccessAt8:(float)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_prodUIEvaluationSuccessAt8 = a3;
}

- (void)setHasProdUIEvaluationSuccessAt8:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasProdUIEvaluationSuccessAt8
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setProdUIEvaluationMRR:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_prodUIEvaluationMRR = a3;
}

- (void)setHasProdUIEvaluationMRR:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasProdUIEvaluationMRR
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setProdUIEvaluationNumberOfSessionsWithPredictions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_prodUIEvaluationNumberOfSessionsWithPredictions = a3;
}

- (void)setHasProdUIEvaluationNumberOfSessionsWithPredictions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasProdUIEvaluationNumberOfSessionsWithPredictions
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setProdUIEvaluationNumberOfSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_prodUIEvaluationNumberOfSessions = a3;
}

- (void)setHasProdUIEvaluationNumberOfSessions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasProdUIEvaluationNumberOfSessions
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setProdUIEvaluationNumberOfDaysWithSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_prodUIEvaluationNumberOfDaysWithSessions = a3;
}

- (void)setHasProdUIEvaluationNumberOfDaysWithSessions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasProdUIEvaluationNumberOfDaysWithSessions
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setProdShadowEvaluationSuccessAt1:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_prodShadowEvaluationSuccessAt1 = a3;
}

- (void)setHasProdShadowEvaluationSuccessAt1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasProdShadowEvaluationSuccessAt1
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setProdShadowEvaluationSuccessAt2:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_prodShadowEvaluationSuccessAt2 = a3;
}

- (void)setHasProdShadowEvaluationSuccessAt2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasProdShadowEvaluationSuccessAt2
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setProdShadowEvaluationSuccessAt4:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_prodShadowEvaluationSuccessAt4 = a3;
}

- (void)setHasProdShadowEvaluationSuccessAt4:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasProdShadowEvaluationSuccessAt4
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setProdShadowEvaluationSuccessAt8:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_prodShadowEvaluationSuccessAt8 = a3;
}

- (void)setHasProdShadowEvaluationSuccessAt8:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasProdShadowEvaluationSuccessAt8
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setProdShadowEvaluationMRR:(float)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_prodShadowEvaluationMRR = a3;
}

- (void)setHasProdShadowEvaluationMRR:(BOOL)a3
{
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasProdShadowEvaluationMRR
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setProdShadowEvaluationNumberOfSessionsWithPredictions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_prodShadowEvaluationNumberOfSessionsWithPredictions = a3;
}

- (void)setHasProdShadowEvaluationNumberOfSessionsWithPredictions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasProdShadowEvaluationNumberOfSessionsWithPredictions
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setProdShadowEvaluationNumberOfSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_prodShadowEvaluationNumberOfSessions = a3;
}

- (void)setHasProdShadowEvaluationNumberOfSessions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasProdShadowEvaluationNumberOfSessions
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setProdShadowEvaluationNumberOfDaysWithSessions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_prodShadowEvaluationNumberOfDaysWithSessions = a3;
}

- (void)setHasProdShadowEvaluationNumberOfDaysWithSessions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($5AB72B52232868EB22FCB063F65FE071)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasProdShadowEvaluationNumberOfDaysWithSessions
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXCandidateRelevanceModelPBEvaluationMetrics;
  -[ATXCandidateRelevanceModelPBEvaluationMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCandidateRelevanceModelPBEvaluationMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  $5AB72B52232868EB22FCB063F65FE071 has;
  void *v6;
  id v7;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    *(float *)&v4 = self->_uiEvaluationSuccessAt1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("uiEvaluationSuccessAt1"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&v4 = self->_uiEvaluationSuccessAt2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("uiEvaluationSuccessAt2"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  *(float *)&v4 = self->_uiEvaluationSuccessAt4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("uiEvaluationSuccessAt4"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  *(float *)&v4 = self->_uiEvaluationSuccessAt8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("uiEvaluationSuccessAt8"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  *(float *)&v4 = self->_uiEvaluationMRR;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("uiEvaluationMRR"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_uiEvaluationNumberOfSessionsWithPredictions);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("uiEvaluationNumberOfSessionsWithPredictions"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_uiEvaluationNumberOfSessions);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("uiEvaluationNumberOfSessions"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_uiEvaluationNumberOfDaysWithSessions);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("uiEvaluationNumberOfDaysWithSessions"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  *(float *)&v4 = self->_shadowEvaluationSuccessAt1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("shadowEvaluationSuccessAt1"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  *(float *)&v4 = self->_shadowEvaluationSuccessAt2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("shadowEvaluationSuccessAt2"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  *(float *)&v4 = self->_shadowEvaluationSuccessAt4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("shadowEvaluationSuccessAt4"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  *(float *)&v4 = self->_shadowEvaluationSuccessAt8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("shadowEvaluationSuccessAt8"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  *(float *)&v4 = self->_shadowEvaluationMRR;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("shadowEvaluationMRR"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_shadowEvaluationNumberOfSessionsWithPredictions);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("shadowEvaluationNumberOfSessionsWithPredictions"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_shadowEvaluationNumberOfSessions);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("shadowEvaluationNumberOfSessions"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_shadowEvaluationNumberOfDaysWithSessions);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("shadowEvaluationNumberOfDaysWithSessions"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  *(float *)&v4 = self->_prodUIEvaluationSuccessAt1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("prodUIEvaluationSuccessAt1"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  *(float *)&v4 = self->_prodUIEvaluationSuccessAt2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("prodUIEvaluationSuccessAt2"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  *(float *)&v4 = self->_prodUIEvaluationSuccessAt4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("prodUIEvaluationSuccessAt4"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_55;
  }
LABEL_54:
  *(float *)&v4 = self->_prodUIEvaluationSuccessAt8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("prodUIEvaluationSuccessAt8"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_56;
  }
LABEL_55:
  *(float *)&v4 = self->_prodUIEvaluationMRR;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("prodUIEvaluationMRR"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_24;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prodUIEvaluationNumberOfSessionsWithPredictions);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("prodUIEvaluationNumberOfSessionsWithPredictions"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prodUIEvaluationNumberOfSessions);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("prodUIEvaluationNumberOfSessions"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prodUIEvaluationNumberOfDaysWithSessions);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("prodUIEvaluationNumberOfDaysWithSessions"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_60;
  }
LABEL_59:
  *(float *)&v4 = self->_prodShadowEvaluationSuccessAt1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("prodShadowEvaluationSuccessAt1"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_61;
  }
LABEL_60:
  *(float *)&v4 = self->_prodShadowEvaluationSuccessAt2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("prodShadowEvaluationSuccessAt2"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_29;
    goto LABEL_62;
  }
LABEL_61:
  *(float *)&v4 = self->_prodShadowEvaluationSuccessAt4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("prodShadowEvaluationSuccessAt4"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_30;
    goto LABEL_63;
  }
LABEL_62:
  *(float *)&v4 = self->_prodShadowEvaluationSuccessAt8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("prodShadowEvaluationSuccessAt8"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_31;
    goto LABEL_64;
  }
LABEL_63:
  *(float *)&v4 = self->_prodShadowEvaluationMRR;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("prodShadowEvaluationMRR"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_32;
LABEL_65:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prodShadowEvaluationNumberOfSessions);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("prodShadowEvaluationNumberOfSessions"));

    if ((*(_DWORD *)&self->_has & 2) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prodShadowEvaluationNumberOfSessionsWithPredictions);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("prodShadowEvaluationNumberOfSessionsWithPredictions"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
    goto LABEL_65;
LABEL_32:
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prodShadowEvaluationNumberOfDaysWithSessions);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("prodShadowEvaluationNumberOfDaysWithSessions"));

  }
LABEL_34:
  v7 = v3;

  return v7;
}

- (BOOL)readFrom:(id)a3
{
  return ATXCandidateRelevanceModelPBEvaluationMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $5AB72B52232868EB22FCB063F65FE071 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    PBDataWriterWriteFloatField();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_24;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_29;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_30;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_31;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_32;
LABEL_65:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_has & 2) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
    goto LABEL_65;
LABEL_32:
  if ((*(_BYTE *)&has & 2) != 0)
LABEL_33:
    PBDataWriterWriteUint32Field();
LABEL_34:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  $5AB72B52232868EB22FCB063F65FE071 has;

  v4 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    v4[30] = LODWORD(self->_uiEvaluationSuccessAt1);
    v4[34] |= 0x10000000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  v4[31] = LODWORD(self->_uiEvaluationSuccessAt2);
  v4[34] |= 0x20000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  v4[32] = LODWORD(self->_uiEvaluationSuccessAt4);
  v4[34] |= 0x40000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  v4[33] = LODWORD(self->_uiEvaluationSuccessAt8);
  v4[34] |= 0x80000000;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  v4[26] = LODWORD(self->_uiEvaluationMRR);
  v4[34] |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_41;
  }
LABEL_40:
  v4[29] = self->_uiEvaluationNumberOfSessionsWithPredictions;
  v4[34] |= 0x8000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  v4[28] = self->_uiEvaluationNumberOfSessions;
  v4[34] |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  v4[27] = self->_uiEvaluationNumberOfDaysWithSessions;
  v4[34] |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  v4[22] = LODWORD(self->_shadowEvaluationSuccessAt1);
  v4[34] |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  v4[23] = LODWORD(self->_shadowEvaluationSuccessAt2);
  v4[34] |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  v4[24] = LODWORD(self->_shadowEvaluationSuccessAt4);
  v4[34] |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  v4[25] = LODWORD(self->_shadowEvaluationSuccessAt8);
  v4[34] |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  v4[18] = LODWORD(self->_shadowEvaluationMRR);
  v4[34] |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  v4[21] = self->_shadowEvaluationNumberOfSessionsWithPredictions;
  v4[34] |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  v4[20] = self->_shadowEvaluationNumberOfSessions;
  v4[34] |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  v4[19] = self->_shadowEvaluationNumberOfDaysWithSessions;
  v4[34] |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  v4[14] = LODWORD(self->_prodUIEvaluationSuccessAt1);
  v4[34] |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  v4[15] = LODWORD(self->_prodUIEvaluationSuccessAt2);
  v4[34] |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  v4[16] = LODWORD(self->_prodUIEvaluationSuccessAt4);
  v4[34] |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_55;
  }
LABEL_54:
  v4[17] = LODWORD(self->_prodUIEvaluationSuccessAt8);
  v4[34] |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_56;
  }
LABEL_55:
  v4[10] = LODWORD(self->_prodUIEvaluationMRR);
  v4[34] |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_24;
    goto LABEL_57;
  }
LABEL_56:
  v4[13] = self->_prodUIEvaluationNumberOfSessionsWithPredictions;
  v4[34] |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_58;
  }
LABEL_57:
  v4[12] = self->_prodUIEvaluationNumberOfSessions;
  v4[34] |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_59;
  }
LABEL_58:
  v4[11] = self->_prodUIEvaluationNumberOfDaysWithSessions;
  v4[34] |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_60;
  }
LABEL_59:
  v4[6] = LODWORD(self->_prodShadowEvaluationSuccessAt1);
  v4[34] |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_61;
  }
LABEL_60:
  v4[7] = LODWORD(self->_prodShadowEvaluationSuccessAt2);
  v4[34] |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_29;
    goto LABEL_62;
  }
LABEL_61:
  v4[8] = LODWORD(self->_prodShadowEvaluationSuccessAt4);
  v4[34] |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_30;
    goto LABEL_63;
  }
LABEL_62:
  v4[9] = LODWORD(self->_prodShadowEvaluationSuccessAt8);
  v4[34] |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_31;
    goto LABEL_64;
  }
LABEL_63:
  v4[2] = LODWORD(self->_prodShadowEvaluationMRR);
  v4[34] |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_32;
LABEL_65:
    v4[4] = self->_prodShadowEvaluationNumberOfSessions;
    v4[34] |= 4u;
    if ((*(_DWORD *)&self->_has & 2) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_64:
  v4[5] = self->_prodShadowEvaluationNumberOfSessionsWithPredictions;
  v4[34] |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
    goto LABEL_65;
LABEL_32:
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_33:
    v4[3] = self->_prodShadowEvaluationNumberOfDaysWithSessions;
    v4[34] |= 2u;
  }
LABEL_34:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  $5AB72B52232868EB22FCB063F65FE071 has;
  id v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    *(float *)(v4 + 120) = self->_uiEvaluationSuccessAt1;
    *(_DWORD *)(v4 + 136) |= 0x10000000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v4 + 124) = self->_uiEvaluationSuccessAt2;
  *(_DWORD *)(v4 + 136) |= 0x20000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  *(float *)(v4 + 128) = self->_uiEvaluationSuccessAt4;
  *(_DWORD *)(v4 + 136) |= 0x40000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  *(float *)(v4 + 132) = self->_uiEvaluationSuccessAt8;
  *(_DWORD *)(v4 + 136) |= 0x80000000;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  *(float *)(v4 + 104) = self->_uiEvaluationMRR;
  *(_DWORD *)(v4 + 136) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v4 + 116) = self->_uiEvaluationNumberOfSessionsWithPredictions;
  *(_DWORD *)(v4 + 136) |= 0x8000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v4 + 112) = self->_uiEvaluationNumberOfSessions;
  *(_DWORD *)(v4 + 136) |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v4 + 108) = self->_uiEvaluationNumberOfDaysWithSessions;
  *(_DWORD *)(v4 + 136) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  *(float *)(v4 + 88) = self->_shadowEvaluationSuccessAt1;
  *(_DWORD *)(v4 + 136) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  *(float *)(v4 + 92) = self->_shadowEvaluationSuccessAt2;
  *(_DWORD *)(v4 + 136) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  *(float *)(v4 + 96) = self->_shadowEvaluationSuccessAt4;
  *(_DWORD *)(v4 + 136) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  *(float *)(v4 + 100) = self->_shadowEvaluationSuccessAt8;
  *(_DWORD *)(v4 + 136) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  *(float *)(v4 + 72) = self->_shadowEvaluationMRR;
  *(_DWORD *)(v4 + 136) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v4 + 84) = self->_shadowEvaluationNumberOfSessionsWithPredictions;
  *(_DWORD *)(v4 + 136) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v4 + 80) = self->_shadowEvaluationNumberOfSessions;
  *(_DWORD *)(v4 + 136) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v4 + 76) = self->_shadowEvaluationNumberOfDaysWithSessions;
  *(_DWORD *)(v4 + 136) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  *(float *)(v4 + 56) = self->_prodUIEvaluationSuccessAt1;
  *(_DWORD *)(v4 + 136) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  *(float *)(v4 + 60) = self->_prodUIEvaluationSuccessAt2;
  *(_DWORD *)(v4 + 136) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  *(float *)(v4 + 64) = self->_prodUIEvaluationSuccessAt4;
  *(_DWORD *)(v4 + 136) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_55;
  }
LABEL_54:
  *(float *)(v4 + 68) = self->_prodUIEvaluationSuccessAt8;
  *(_DWORD *)(v4 + 136) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_56;
  }
LABEL_55:
  *(float *)(v4 + 40) = self->_prodUIEvaluationMRR;
  *(_DWORD *)(v4 + 136) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_24;
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v4 + 52) = self->_prodUIEvaluationNumberOfSessionsWithPredictions;
  *(_DWORD *)(v4 + 136) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v4 + 48) = self->_prodUIEvaluationNumberOfSessions;
  *(_DWORD *)(v4 + 136) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v4 + 44) = self->_prodUIEvaluationNumberOfDaysWithSessions;
  *(_DWORD *)(v4 + 136) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_60;
  }
LABEL_59:
  *(float *)(v4 + 24) = self->_prodShadowEvaluationSuccessAt1;
  *(_DWORD *)(v4 + 136) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_61;
  }
LABEL_60:
  *(float *)(v4 + 28) = self->_prodShadowEvaluationSuccessAt2;
  *(_DWORD *)(v4 + 136) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_29;
    goto LABEL_62;
  }
LABEL_61:
  *(float *)(v4 + 32) = self->_prodShadowEvaluationSuccessAt4;
  *(_DWORD *)(v4 + 136) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_30;
    goto LABEL_63;
  }
LABEL_62:
  *(float *)(v4 + 36) = self->_prodShadowEvaluationSuccessAt8;
  *(_DWORD *)(v4 + 136) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_31;
    goto LABEL_64;
  }
LABEL_63:
  *(float *)(v4 + 8) = self->_prodShadowEvaluationMRR;
  *(_DWORD *)(v4 + 136) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_32;
LABEL_65:
    *(_DWORD *)(v4 + 16) = self->_prodShadowEvaluationNumberOfSessions;
    *(_DWORD *)(v4 + 136) |= 4u;
    if ((*(_DWORD *)&self->_has & 2) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_64:
  *(_DWORD *)(v4 + 20) = self->_prodShadowEvaluationNumberOfSessionsWithPredictions;
  *(_DWORD *)(v4 + 136) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
    goto LABEL_65;
LABEL_32:
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_33:
    *(_DWORD *)(v4 + 12) = self->_prodShadowEvaluationNumberOfDaysWithSessions;
    *(_DWORD *)(v4 + 136) |= 2u;
  }
LABEL_34:
  v6 = (id)v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $5AB72B52232868EB22FCB063F65FE071 has;
  int v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_162;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 34);
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_uiEvaluationSuccessAt1 != *((float *)v4 + 30))
      goto LABEL_162;
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0 || self->_uiEvaluationSuccessAt2 != *((float *)v4 + 31))
      goto LABEL_162;
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0 || self->_uiEvaluationSuccessAt4 != *((float *)v4 + 32))
      goto LABEL_162;
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0 || self->_uiEvaluationSuccessAt8 != *((float *)v4 + 33))
      goto LABEL_162;
  }
  else if (v6 < 0)
  {
LABEL_162:
    v7 = 0;
    goto LABEL_163;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_uiEvaluationMRR != *((float *)v4 + 26))
      goto LABEL_162;
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_uiEvaluationNumberOfSessionsWithPredictions != *((_DWORD *)v4 + 29))
      goto LABEL_162;
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_uiEvaluationNumberOfSessions != *((_DWORD *)v4 + 28))
      goto LABEL_162;
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_uiEvaluationNumberOfDaysWithSessions != *((_DWORD *)v4 + 27))
      goto LABEL_162;
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_shadowEvaluationSuccessAt1 != *((float *)v4 + 22))
      goto LABEL_162;
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_shadowEvaluationSuccessAt2 != *((float *)v4 + 23))
      goto LABEL_162;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_shadowEvaluationSuccessAt4 != *((float *)v4 + 24))
      goto LABEL_162;
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_shadowEvaluationSuccessAt8 != *((float *)v4 + 25))
      goto LABEL_162;
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_shadowEvaluationMRR != *((float *)v4 + 18))
      goto LABEL_162;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_shadowEvaluationNumberOfSessionsWithPredictions != *((_DWORD *)v4 + 21))
      goto LABEL_162;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_shadowEvaluationNumberOfSessions != *((_DWORD *)v4 + 20))
      goto LABEL_162;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_shadowEvaluationNumberOfDaysWithSessions != *((_DWORD *)v4 + 19))
      goto LABEL_162;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_prodUIEvaluationSuccessAt1 != *((float *)v4 + 14))
      goto LABEL_162;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_prodUIEvaluationSuccessAt2 != *((float *)v4 + 15))
      goto LABEL_162;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_prodUIEvaluationSuccessAt4 != *((float *)v4 + 16))
      goto LABEL_162;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_prodUIEvaluationSuccessAt8 != *((float *)v4 + 17))
      goto LABEL_162;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_prodUIEvaluationMRR != *((float *)v4 + 10))
      goto LABEL_162;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_prodUIEvaluationNumberOfSessionsWithPredictions != *((_DWORD *)v4 + 13))
      goto LABEL_162;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_prodUIEvaluationNumberOfSessions != *((_DWORD *)v4 + 12))
      goto LABEL_162;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_prodUIEvaluationNumberOfDaysWithSessions != *((_DWORD *)v4 + 11))
      goto LABEL_162;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_prodShadowEvaluationSuccessAt1 != *((float *)v4 + 6))
      goto LABEL_162;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_prodShadowEvaluationSuccessAt2 != *((float *)v4 + 7))
      goto LABEL_162;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_prodShadowEvaluationSuccessAt4 != *((float *)v4 + 8))
      goto LABEL_162;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_prodShadowEvaluationSuccessAt8 != *((float *)v4 + 9))
      goto LABEL_162;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_prodShadowEvaluationMRR != *((float *)v4 + 2))
      goto LABEL_162;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_prodShadowEvaluationNumberOfSessionsWithPredictions != *((_DWORD *)v4 + 5))
      goto LABEL_162;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_prodShadowEvaluationNumberOfSessions != *((_DWORD *)v4 + 4))
      goto LABEL_162;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_prodShadowEvaluationNumberOfDaysWithSessions != *((_DWORD *)v4 + 3))
      goto LABEL_162;
    v7 = 1;
  }
  else
  {
    v7 = (*((_DWORD *)v4 + 34) & 2) == 0;
  }
LABEL_163:

  return v7;
}

- (unint64_t)hash
{
  $5AB72B52232868EB22FCB063F65FE071 has;
  unint64_t v4;
  float uiEvaluationSuccessAt1;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  float uiEvaluationSuccessAt2;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float uiEvaluationSuccessAt4;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  float uiEvaluationSuccessAt8;
  float v21;
  float v22;
  float v23;
  unint64_t v24;
  float uiEvaluationMRR;
  float v26;
  float v27;
  float v28;
  float shadowEvaluationSuccessAt1;
  float v30;
  float v31;
  float v32;
  unint64_t v33;
  unint64_t v34;
  float shadowEvaluationSuccessAt2;
  float v36;
  float v37;
  float v38;
  float shadowEvaluationSuccessAt4;
  float v40;
  float v41;
  float v42;
  unint64_t v43;
  unint64_t v44;
  float shadowEvaluationSuccessAt8;
  float v46;
  float v47;
  float v48;
  unint64_t v49;
  unint64_t v50;
  float shadowEvaluationMRR;
  float v52;
  float v53;
  float v54;
  unint64_t v55;
  unint64_t v56;
  float prodUIEvaluationSuccessAt1;
  float v58;
  float v59;
  float v60;
  float v61;
  unint64_t v62;
  float prodUIEvaluationSuccessAt2;
  float v64;
  float v65;
  float v66;
  float v67;
  unint64_t v68;
  float prodUIEvaluationSuccessAt4;
  float v70;
  float v71;
  float v72;
  float v73;
  unint64_t v74;
  float prodUIEvaluationSuccessAt8;
  float v76;
  float v77;
  float v78;
  float v79;
  unint64_t v80;
  float prodUIEvaluationMRR;
  float v82;
  float v83;
  float v84;
  float v85;
  unint64_t v86;
  unint64_t v87;
  float prodShadowEvaluationSuccessAt1;
  float v89;
  float v90;
  float v91;
  unint64_t v92;
  float prodShadowEvaluationSuccessAt2;
  float v94;
  float v95;
  float v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  float prodShadowEvaluationSuccessAt4;
  float v101;
  float v102;
  float v103;
  unint64_t v104;
  unint64_t v105;
  float prodShadowEvaluationSuccessAt8;
  float v107;
  float v108;
  float v109;
  unint64_t v110;
  float prodShadowEvaluationMRR;
  float v112;
  float v113;
  float v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    uiEvaluationSuccessAt1 = self->_uiEvaluationSuccessAt1;
    v6 = -uiEvaluationSuccessAt1;
    if (uiEvaluationSuccessAt1 >= 0.0)
      v6 = self->_uiEvaluationSuccessAt1;
    v7 = floorf(v6 + 0.5);
    v8 = (float)(v6 - v7) * 1.8447e19;
    v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    uiEvaluationSuccessAt2 = self->_uiEvaluationSuccessAt2;
    v11 = -uiEvaluationSuccessAt2;
    if (uiEvaluationSuccessAt2 >= 0.0)
      v11 = self->_uiEvaluationSuccessAt2;
    v12 = floorf(v11 + 0.5);
    v13 = (float)(v11 - v12) * 1.8447e19;
    v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    uiEvaluationSuccessAt4 = self->_uiEvaluationSuccessAt4;
    v16 = -uiEvaluationSuccessAt4;
    if (uiEvaluationSuccessAt4 >= 0.0)
      v16 = self->_uiEvaluationSuccessAt4;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    uiEvaluationSuccessAt8 = self->_uiEvaluationSuccessAt8;
    v21 = -uiEvaluationSuccessAt8;
    if (uiEvaluationSuccessAt8 >= 0.0)
      v21 = self->_uiEvaluationSuccessAt8;
    v22 = floorf(v21 + 0.5);
    v23 = (float)(v21 - v22) * 1.8447e19;
    v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    uiEvaluationMRR = self->_uiEvaluationMRR;
    v26 = -uiEvaluationMRR;
    if (uiEvaluationMRR >= 0.0)
      v26 = self->_uiEvaluationMRR;
    v27 = floorf(v26 + 0.5);
    v28 = (float)(v26 - v27) * 1.8447e19;
    v24 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabsf(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    v125 = 2654435761 * self->_uiEvaluationNumberOfSessionsWithPredictions;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
LABEL_43:
      v124 = 2654435761 * self->_uiEvaluationNumberOfSessions;
      if ((*(_DWORD *)&has & 0x2000000) != 0)
        goto LABEL_44;
LABEL_51:
      v123 = 0;
      if ((*(_DWORD *)&has & 0x100000) != 0)
        goto LABEL_45;
LABEL_52:
      v33 = 0;
      goto LABEL_53;
    }
  }
  else
  {
    v125 = 0;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_43;
  }
  v124 = 0;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
    goto LABEL_51;
LABEL_44:
  v123 = 2654435761 * self->_uiEvaluationNumberOfDaysWithSessions;
  if ((*(_DWORD *)&has & 0x100000) == 0)
    goto LABEL_52;
LABEL_45:
  shadowEvaluationSuccessAt1 = self->_shadowEvaluationSuccessAt1;
  v30 = -shadowEvaluationSuccessAt1;
  if (shadowEvaluationSuccessAt1 >= 0.0)
    v30 = self->_shadowEvaluationSuccessAt1;
  v31 = floorf(v30 + 0.5);
  v32 = (float)(v30 - v31) * 1.8447e19;
  v33 = 2654435761u * (unint64_t)fmodf(v31, 1.8447e19);
  if (v32 >= 0.0)
  {
    if (v32 > 0.0)
      v33 += (unint64_t)v32;
  }
  else
  {
    v33 -= (unint64_t)fabsf(v32);
  }
LABEL_53:
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    shadowEvaluationSuccessAt2 = self->_shadowEvaluationSuccessAt2;
    v36 = -shadowEvaluationSuccessAt2;
    if (shadowEvaluationSuccessAt2 >= 0.0)
      v36 = self->_shadowEvaluationSuccessAt2;
    v37 = floorf(v36 + 0.5);
    v38 = (float)(v36 - v37) * 1.8447e19;
    v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    v138 = 0;
    goto LABEL_72;
  }
  shadowEvaluationSuccessAt4 = self->_shadowEvaluationSuccessAt4;
  v40 = -shadowEvaluationSuccessAt4;
  if (shadowEvaluationSuccessAt4 >= 0.0)
    v40 = self->_shadowEvaluationSuccessAt4;
  v41 = floorf(v40 + 0.5);
  v42 = (float)(v40 - v41) * 1.8447e19;
  v43 = 2654435761u * (unint64_t)fmodf(v41, 1.8447e19);
  if (v42 >= 0.0)
  {
    v138 = v43;
    if (v42 <= 0.0)
      goto LABEL_72;
    v44 = v43 + (unint64_t)v42;
  }
  else
  {
    v44 = v43 - (unint64_t)fabsf(v42);
  }
  v138 = v44;
LABEL_72:
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    v137 = 0;
    goto LABEL_81;
  }
  shadowEvaluationSuccessAt8 = self->_shadowEvaluationSuccessAt8;
  v46 = -shadowEvaluationSuccessAt8;
  if (shadowEvaluationSuccessAt8 >= 0.0)
    v46 = self->_shadowEvaluationSuccessAt8;
  v47 = floorf(v46 + 0.5);
  v48 = (float)(v46 - v47) * 1.8447e19;
  v49 = 2654435761u * (unint64_t)fmodf(v47, 1.8447e19);
  if (v48 >= 0.0)
  {
    v137 = v49;
    if (v48 <= 0.0)
      goto LABEL_81;
    v50 = v49 + (unint64_t)v48;
  }
  else
  {
    v50 = v49 - (unint64_t)fabsf(v48);
  }
  v137 = v50;
LABEL_81:
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    v136 = 0;
    goto LABEL_90;
  }
  shadowEvaluationMRR = self->_shadowEvaluationMRR;
  v52 = -shadowEvaluationMRR;
  if (shadowEvaluationMRR >= 0.0)
    v52 = self->_shadowEvaluationMRR;
  v53 = floorf(v52 + 0.5);
  v54 = (float)(v52 - v53) * 1.8447e19;
  v55 = 2654435761u * (unint64_t)fmodf(v53, 1.8447e19);
  if (v54 >= 0.0)
  {
    v136 = v55;
    if (v54 <= 0.0)
      goto LABEL_90;
    v56 = v55 + (unint64_t)v54;
  }
  else
  {
    v56 = v55 - (unint64_t)fabsf(v54);
  }
  v136 = v56;
LABEL_90:
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    v122 = 2654435761 * self->_shadowEvaluationNumberOfSessionsWithPredictions;
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
LABEL_92:
      v121 = 2654435761 * self->_shadowEvaluationNumberOfSessions;
      if ((*(_DWORD *)&has & 0x20000) != 0)
        goto LABEL_93;
      goto LABEL_100;
    }
  }
  else
  {
    v122 = 0;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_92;
  }
  v121 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_93:
    v120 = 2654435761 * self->_shadowEvaluationNumberOfDaysWithSessions;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_94;
LABEL_101:
    v135 = 0;
    goto LABEL_105;
  }
LABEL_100:
  v120 = 0;
  if ((*(_WORD *)&has & 0x1000) == 0)
    goto LABEL_101;
LABEL_94:
  prodUIEvaluationSuccessAt1 = self->_prodUIEvaluationSuccessAt1;
  v58 = -prodUIEvaluationSuccessAt1;
  if (prodUIEvaluationSuccessAt1 >= 0.0)
    v58 = self->_prodUIEvaluationSuccessAt1;
  v59 = floorf(v58 + 0.5);
  v60 = (float)(v58 - v59) * 1.8447e19;
  v61 = fmodf(v59, 1.8447e19);
  if (v60 >= 0.0)
  {
    v135 = 2654435761u * (unint64_t)v61;
    if (v60 <= 0.0)
      goto LABEL_105;
    v62 = v135 + (unint64_t)v60;
  }
  else
  {
    v62 = 2654435761u * (unint64_t)v61 - (unint64_t)fabsf(v60);
  }
  v135 = v62;
LABEL_105:
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
    v134 = 0;
    goto LABEL_114;
  }
  prodUIEvaluationSuccessAt2 = self->_prodUIEvaluationSuccessAt2;
  v64 = -prodUIEvaluationSuccessAt2;
  if (prodUIEvaluationSuccessAt2 >= 0.0)
    v64 = self->_prodUIEvaluationSuccessAt2;
  v65 = floorf(v64 + 0.5);
  v66 = (float)(v64 - v65) * 1.8447e19;
  v67 = fmodf(v65, 1.8447e19);
  if (v66 >= 0.0)
  {
    v134 = 2654435761u * (unint64_t)v67;
    if (v66 <= 0.0)
      goto LABEL_114;
    v68 = v134 + (unint64_t)v66;
  }
  else
  {
    v68 = 2654435761u * (unint64_t)v67 - (unint64_t)fabsf(v66);
  }
  v134 = v68;
LABEL_114:
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
    v133 = 0;
    goto LABEL_123;
  }
  prodUIEvaluationSuccessAt4 = self->_prodUIEvaluationSuccessAt4;
  v70 = -prodUIEvaluationSuccessAt4;
  if (prodUIEvaluationSuccessAt4 >= 0.0)
    v70 = self->_prodUIEvaluationSuccessAt4;
  v71 = floorf(v70 + 0.5);
  v72 = (float)(v70 - v71) * 1.8447e19;
  v73 = fmodf(v71, 1.8447e19);
  if (v72 >= 0.0)
  {
    v133 = 2654435761u * (unint64_t)v73;
    if (v72 <= 0.0)
      goto LABEL_123;
    v74 = v133 + (unint64_t)v72;
  }
  else
  {
    v74 = 2654435761u * (unint64_t)v73 - (unint64_t)fabsf(v72);
  }
  v133 = v74;
LABEL_123:
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
    v132 = 0;
    goto LABEL_132;
  }
  prodUIEvaluationSuccessAt8 = self->_prodUIEvaluationSuccessAt8;
  v76 = -prodUIEvaluationSuccessAt8;
  if (prodUIEvaluationSuccessAt8 >= 0.0)
    v76 = self->_prodUIEvaluationSuccessAt8;
  v77 = floorf(v76 + 0.5);
  v78 = (float)(v76 - v77) * 1.8447e19;
  v79 = fmodf(v77, 1.8447e19);
  if (v78 >= 0.0)
  {
    v132 = 2654435761u * (unint64_t)v79;
    if (v78 <= 0.0)
      goto LABEL_132;
    v80 = v132 + (unint64_t)v78;
  }
  else
  {
    v80 = 2654435761u * (unint64_t)v79 - (unint64_t)fabsf(v78);
  }
  v132 = v80;
LABEL_132:
  v130 = v4;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
    v131 = 0;
    goto LABEL_141;
  }
  prodUIEvaluationMRR = self->_prodUIEvaluationMRR;
  v82 = -prodUIEvaluationMRR;
  if (prodUIEvaluationMRR >= 0.0)
    v82 = self->_prodUIEvaluationMRR;
  v83 = floorf(v82 + 0.5);
  v84 = (float)(v82 - v83) * 1.8447e19;
  v85 = fmodf(v83, 1.8447e19);
  if (v84 >= 0.0)
  {
    v131 = 2654435761u * (unint64_t)v85;
    if (v84 <= 0.0)
      goto LABEL_141;
    v86 = v131 + (unint64_t)v84;
  }
  else
  {
    v86 = 2654435761u * (unint64_t)v85 - (unint64_t)fabsf(v84);
  }
  v131 = v86;
LABEL_141:
  if ((*(_WORD *)&has & 0x800) == 0)
  {
    v119 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_143;
LABEL_146:
    v127 = 0;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_144;
    goto LABEL_147;
  }
  v119 = 2654435761 * self->_prodUIEvaluationNumberOfSessionsWithPredictions;
  if ((*(_WORD *)&has & 0x400) == 0)
    goto LABEL_146;
LABEL_143:
  v127 = 2654435761 * self->_prodUIEvaluationNumberOfSessions;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_144:
    v126 = 2654435761 * self->_prodUIEvaluationNumberOfDaysWithSessions;
    goto LABEL_148;
  }
LABEL_147:
  v126 = 0;
LABEL_148:
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    prodShadowEvaluationSuccessAt1 = self->_prodShadowEvaluationSuccessAt1;
    v89 = -prodShadowEvaluationSuccessAt1;
    if (prodShadowEvaluationSuccessAt1 >= 0.0)
      v89 = self->_prodShadowEvaluationSuccessAt1;
    v90 = floorf(v89 + 0.5);
    v91 = (float)(v89 - v90) * 1.8447e19;
    v87 = 2654435761u * (unint64_t)fmodf(v90, 1.8447e19);
    if (v91 >= 0.0)
    {
      if (v91 > 0.0)
        v87 += (unint64_t)v91;
    }
    else
    {
      v87 -= (unint64_t)fabsf(v91);
    }
  }
  else
  {
    v87 = 0;
  }
  v129 = v9;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    prodShadowEvaluationSuccessAt2 = self->_prodShadowEvaluationSuccessAt2;
    v94 = -prodShadowEvaluationSuccessAt2;
    if (prodShadowEvaluationSuccessAt2 >= 0.0)
      v94 = self->_prodShadowEvaluationSuccessAt2;
    v95 = floorf(v94 + 0.5);
    v96 = (float)(v94 - v95) * 1.8447e19;
    v92 = 2654435761u * (unint64_t)fmodf(v95, 1.8447e19);
    if (v96 >= 0.0)
    {
      if (v96 > 0.0)
        v92 += (unint64_t)v96;
    }
    else
    {
      v92 -= (unint64_t)fabsf(v96);
    }
  }
  else
  {
    v92 = 0;
  }
  v128 = v87;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    v97 = v33;
    v98 = v14;
    prodShadowEvaluationSuccessAt4 = self->_prodShadowEvaluationSuccessAt4;
    v101 = -prodShadowEvaluationSuccessAt4;
    if (prodShadowEvaluationSuccessAt4 >= 0.0)
      v101 = self->_prodShadowEvaluationSuccessAt4;
    v102 = floorf(v101 + 0.5);
    v103 = (float)(v101 - v102) * 1.8447e19;
    v99 = 2654435761u * (unint64_t)fmodf(v102, 1.8447e19);
    if (v103 >= 0.0)
    {
      if (v103 > 0.0)
        v99 += (unint64_t)v103;
    }
    else
    {
      v99 -= (unint64_t)fabsf(v103);
    }
  }
  else
  {
    v97 = v33;
    v98 = v14;
    v99 = 0;
  }
  v104 = v19;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    prodShadowEvaluationSuccessAt8 = self->_prodShadowEvaluationSuccessAt8;
    v107 = -prodShadowEvaluationSuccessAt8;
    if (prodShadowEvaluationSuccessAt8 >= 0.0)
      v107 = self->_prodShadowEvaluationSuccessAt8;
    v108 = floorf(v107 + 0.5);
    v109 = (float)(v107 - v108) * 1.8447e19;
    v105 = 2654435761u * (unint64_t)fmodf(v108, 1.8447e19);
    if (v109 >= 0.0)
    {
      if (v109 > 0.0)
        v105 += (unint64_t)v109;
    }
    else
    {
      v105 -= (unint64_t)fabsf(v109);
    }
  }
  else
  {
    v105 = 0;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    prodShadowEvaluationMRR = self->_prodShadowEvaluationMRR;
    v112 = -prodShadowEvaluationMRR;
    if (prodShadowEvaluationMRR >= 0.0)
      v112 = self->_prodShadowEvaluationMRR;
    v113 = floorf(v112 + 0.5);
    v114 = (float)(v112 - v113) * 1.8447e19;
    v110 = 2654435761u * (unint64_t)fmodf(v113, 1.8447e19);
    if (v114 >= 0.0)
    {
      if (v114 > 0.0)
        v110 += (unint64_t)v114;
    }
    else
    {
      v110 -= (unint64_t)fabsf(v114);
    }
  }
  else
  {
    v110 = 0;
  }
  if ((*(_BYTE *)&has & 8) == 0)
  {
    v115 = 0;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_190;
LABEL_193:
    v116 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_191;
LABEL_194:
    v117 = 0;
    return v129 ^ v130 ^ v98 ^ v104 ^ v24 ^ v125 ^ v124 ^ v123 ^ v97 ^ v34 ^ v138 ^ v137 ^ v136 ^ v122 ^ v121 ^ v120 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v119 ^ v127 ^ v126 ^ v128 ^ v92 ^ v99 ^ v105 ^ v110 ^ v115 ^ v116 ^ v117;
  }
  v115 = 2654435761 * self->_prodShadowEvaluationNumberOfSessionsWithPredictions;
  if ((*(_BYTE *)&has & 4) == 0)
    goto LABEL_193;
LABEL_190:
  v116 = 2654435761 * self->_prodShadowEvaluationNumberOfSessions;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_194;
LABEL_191:
  v117 = 2654435761 * self->_prodShadowEvaluationNumberOfDaysWithSessions;
  return v129 ^ v130 ^ v98 ^ v104 ^ v24 ^ v125 ^ v124 ^ v123 ^ v97 ^ v34 ^ v138 ^ v137 ^ v136 ^ v122 ^ v121 ^ v120 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v119 ^ v127 ^ v126 ^ v128 ^ v92 ^ v99 ^ v105 ^ v110 ^ v115 ^ v116 ^ v117;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x10000000) != 0)
  {
    self->_uiEvaluationSuccessAt1 = *((float *)v4 + 30);
    *(_DWORD *)&self->_has |= 0x10000000u;
    v5 = *((_DWORD *)v4 + 34);
    if ((v5 & 0x20000000) == 0)
    {
LABEL_3:
      if ((v5 & 0x40000000) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((v5 & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  self->_uiEvaluationSuccessAt2 = *((float *)v4 + 31);
  *(_DWORD *)&self->_has |= 0x20000000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  self->_uiEvaluationSuccessAt4 = *((float *)v4 + 32);
  *(_DWORD *)&self->_has |= 0x40000000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_5:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  self->_uiEvaluationSuccessAt8 = *((float *)v4 + 33);
  *(_DWORD *)&self->_has |= 0x80000000;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  self->_uiEvaluationMRR = *((float *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_41;
  }
LABEL_40:
  self->_uiEvaluationNumberOfSessionsWithPredictions = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  self->_uiEvaluationNumberOfSessions = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  self->_uiEvaluationNumberOfDaysWithSessions = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x100000) == 0)
  {
LABEL_10:
    if ((v5 & 0x200000) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  self->_shadowEvaluationSuccessAt1 = *((float *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x200000) == 0)
  {
LABEL_11:
    if ((v5 & 0x400000) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  self->_shadowEvaluationSuccessAt2 = *((float *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x200000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x400000) == 0)
  {
LABEL_12:
    if ((v5 & 0x800000) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  self->_shadowEvaluationSuccessAt4 = *((float *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x800000) == 0)
  {
LABEL_13:
    if ((v5 & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  self->_shadowEvaluationSuccessAt8 = *((float *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x800000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x10000) == 0)
  {
LABEL_14:
    if ((v5 & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  self->_shadowEvaluationMRR = *((float *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x80000) == 0)
  {
LABEL_15:
    if ((v5 & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  self->_shadowEvaluationNumberOfSessionsWithPredictions = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x40000) == 0)
  {
LABEL_16:
    if ((v5 & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  self->_shadowEvaluationNumberOfSessions = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x20000) == 0)
  {
LABEL_17:
    if ((v5 & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  self->_shadowEvaluationNumberOfDaysWithSessions = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x1000) == 0)
  {
LABEL_18:
    if ((v5 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  self->_prodUIEvaluationSuccessAt1 = *((float *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x2000) == 0)
  {
LABEL_19:
    if ((v5 & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  self->_prodUIEvaluationSuccessAt2 = *((float *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x4000) == 0)
  {
LABEL_20:
    if ((v5 & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  self->_prodUIEvaluationSuccessAt4 = *((float *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x8000) == 0)
  {
LABEL_21:
    if ((v5 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_55;
  }
LABEL_54:
  self->_prodUIEvaluationSuccessAt8 = *((float *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x100) == 0)
  {
LABEL_22:
    if ((v5 & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_56;
  }
LABEL_55:
  self->_prodUIEvaluationMRR = *((float *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x800) == 0)
  {
LABEL_23:
    if ((v5 & 0x400) == 0)
      goto LABEL_24;
    goto LABEL_57;
  }
LABEL_56:
  self->_prodUIEvaluationNumberOfSessionsWithPredictions = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x400) == 0)
  {
LABEL_24:
    if ((v5 & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_58;
  }
LABEL_57:
  self->_prodUIEvaluationNumberOfSessions = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x200) == 0)
  {
LABEL_25:
    if ((v5 & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_59;
  }
LABEL_58:
  self->_prodUIEvaluationNumberOfDaysWithSessions = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x10) == 0)
  {
LABEL_26:
    if ((v5 & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_60;
  }
LABEL_59:
  self->_prodShadowEvaluationSuccessAt1 = *((float *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x20) == 0)
  {
LABEL_27:
    if ((v5 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_61;
  }
LABEL_60:
  self->_prodShadowEvaluationSuccessAt2 = *((float *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x40) == 0)
  {
LABEL_28:
    if ((v5 & 0x80) == 0)
      goto LABEL_29;
    goto LABEL_62;
  }
LABEL_61:
  self->_prodShadowEvaluationSuccessAt4 = *((float *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 0x80) == 0)
  {
LABEL_29:
    if ((v5 & 1) == 0)
      goto LABEL_30;
    goto LABEL_63;
  }
LABEL_62:
  self->_prodShadowEvaluationSuccessAt8 = *((float *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 1) == 0)
  {
LABEL_30:
    if ((v5 & 8) == 0)
      goto LABEL_31;
    goto LABEL_64;
  }
LABEL_63:
  self->_prodShadowEvaluationMRR = *((float *)v4 + 2);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 8) == 0)
  {
LABEL_31:
    if ((v5 & 4) == 0)
      goto LABEL_32;
LABEL_65:
    self->_prodShadowEvaluationNumberOfSessions = *((_DWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 4u;
    if ((*((_DWORD *)v4 + 34) & 2) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_64:
  self->_prodShadowEvaluationNumberOfSessionsWithPredictions = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 4) != 0)
    goto LABEL_65;
LABEL_32:
  if ((v5 & 2) != 0)
  {
LABEL_33:
    self->_prodShadowEvaluationNumberOfDaysWithSessions = *((_DWORD *)v4 + 3);
    *(_DWORD *)&self->_has |= 2u;
  }
LABEL_34:

}

- (float)uiEvaluationSuccessAt1
{
  return self->_uiEvaluationSuccessAt1;
}

- (float)uiEvaluationSuccessAt2
{
  return self->_uiEvaluationSuccessAt2;
}

- (float)uiEvaluationSuccessAt4
{
  return self->_uiEvaluationSuccessAt4;
}

- (float)uiEvaluationSuccessAt8
{
  return self->_uiEvaluationSuccessAt8;
}

- (float)uiEvaluationMRR
{
  return self->_uiEvaluationMRR;
}

- (unsigned)uiEvaluationNumberOfSessionsWithPredictions
{
  return self->_uiEvaluationNumberOfSessionsWithPredictions;
}

- (unsigned)uiEvaluationNumberOfSessions
{
  return self->_uiEvaluationNumberOfSessions;
}

- (unsigned)uiEvaluationNumberOfDaysWithSessions
{
  return self->_uiEvaluationNumberOfDaysWithSessions;
}

- (float)shadowEvaluationSuccessAt1
{
  return self->_shadowEvaluationSuccessAt1;
}

- (float)shadowEvaluationSuccessAt2
{
  return self->_shadowEvaluationSuccessAt2;
}

- (float)shadowEvaluationSuccessAt4
{
  return self->_shadowEvaluationSuccessAt4;
}

- (float)shadowEvaluationSuccessAt8
{
  return self->_shadowEvaluationSuccessAt8;
}

- (float)shadowEvaluationMRR
{
  return self->_shadowEvaluationMRR;
}

- (unsigned)shadowEvaluationNumberOfSessionsWithPredictions
{
  return self->_shadowEvaluationNumberOfSessionsWithPredictions;
}

- (unsigned)shadowEvaluationNumberOfSessions
{
  return self->_shadowEvaluationNumberOfSessions;
}

- (unsigned)shadowEvaluationNumberOfDaysWithSessions
{
  return self->_shadowEvaluationNumberOfDaysWithSessions;
}

- (float)prodUIEvaluationSuccessAt1
{
  return self->_prodUIEvaluationSuccessAt1;
}

- (float)prodUIEvaluationSuccessAt2
{
  return self->_prodUIEvaluationSuccessAt2;
}

- (float)prodUIEvaluationSuccessAt4
{
  return self->_prodUIEvaluationSuccessAt4;
}

- (float)prodUIEvaluationSuccessAt8
{
  return self->_prodUIEvaluationSuccessAt8;
}

- (float)prodUIEvaluationMRR
{
  return self->_prodUIEvaluationMRR;
}

- (unsigned)prodUIEvaluationNumberOfSessionsWithPredictions
{
  return self->_prodUIEvaluationNumberOfSessionsWithPredictions;
}

- (unsigned)prodUIEvaluationNumberOfSessions
{
  return self->_prodUIEvaluationNumberOfSessions;
}

- (unsigned)prodUIEvaluationNumberOfDaysWithSessions
{
  return self->_prodUIEvaluationNumberOfDaysWithSessions;
}

- (float)prodShadowEvaluationSuccessAt1
{
  return self->_prodShadowEvaluationSuccessAt1;
}

- (float)prodShadowEvaluationSuccessAt2
{
  return self->_prodShadowEvaluationSuccessAt2;
}

- (float)prodShadowEvaluationSuccessAt4
{
  return self->_prodShadowEvaluationSuccessAt4;
}

- (float)prodShadowEvaluationSuccessAt8
{
  return self->_prodShadowEvaluationSuccessAt8;
}

- (float)prodShadowEvaluationMRR
{
  return self->_prodShadowEvaluationMRR;
}

- (unsigned)prodShadowEvaluationNumberOfSessionsWithPredictions
{
  return self->_prodShadowEvaluationNumberOfSessionsWithPredictions;
}

- (unsigned)prodShadowEvaluationNumberOfSessions
{
  return self->_prodShadowEvaluationNumberOfSessions;
}

- (unsigned)prodShadowEvaluationNumberOfDaysWithSessions
{
  return self->_prodShadowEvaluationNumberOfDaysWithSessions;
}

@end
