@implementation AWDHomeKitHomeConfiguration

- (void)setNumAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_numAccessories = a3;
}

- (void)setHasNumAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasNumAccessories
{
  return (*(_QWORD *)&self->_has >> 6) & 1;
}

- (void)setNumServices:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x10u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numServices = a3;
}

- (void)setHasNumServices:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFEF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 16;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFEF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumServices
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 4) & 1;
}

- (void)setNumUsers:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x800u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numUsers = a3;
}

- (void)setHasNumUsers:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xF7FF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 2048;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xF7FF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumUsers
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 11) & 1;
}

- (void)setNumAdmins:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_numAdmins = a3;
}

- (void)setHasNumAdmins:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasNumAdmins
{
  return (*(_QWORD *)&self->_has >> 15) & 1;
}

- (void)setNumScenes:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 8u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numScenes = a3;
}

- (void)setHasNumScenes:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 8;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFF7 | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumScenes
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 3) & 1;
}

- (void)setNumTriggers:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x400u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numTriggers = a3;
}

- (void)setHasNumTriggers:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFBFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 1024;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFBFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumTriggers
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 10) & 1;
}

- (void)setNumEventTriggers:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_numEventTriggers = a3;
}

- (void)setHasNumEventTriggers:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasNumEventTriggers
{
  return (*(_QWORD *)&self->_has >> 34) & 1;
}

- (void)setNumTimerTriggers:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x100u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numTimerTriggers = a3;
}

- (void)setHasNumTimerTriggers:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFEFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 256;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFEFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumTimerTriggers
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 8) & 1;
}

- (void)setNumAccessoryServiceGroups:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_numAccessoryServiceGroups = a3;
}

- (void)setHasNumAccessoryServiceGroups:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasNumAccessoryServiceGroups
{
  return (*(_QWORD *)&self->_has >> 14) & 1;
}

- (void)setNumRooms:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 4u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numRooms = a3;
}

- (void)setHasNumRooms:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFFB | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 4;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFB | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumRooms
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 2) & 1;
}

- (void)setNumZones:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x4000u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numZones = a3;
}

- (void)setHasNumZones:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xBFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 0x4000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xBFFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumZones
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 14) & 1;
}

- (void)setIsResidentAvailable:(BOOL)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x40000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_isResidentAvailable = a3;
}

- (void)setHasIsResidentAvailable:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFBFFFF;
  if (a3)
    v4 = 0x40000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasIsResidentAvailable
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 18) & 1;
}

- (void)setIsPrimaryResident:(BOOL)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x20000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_isPrimaryResident = a3;
}

- (void)setHasIsPrimaryResident:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFDFFFF;
  if (a3)
    v4 = 0x20000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasIsPrimaryResident
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 17) & 1;
}

- (void)setNumBridgedAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_numBridgedAccessories = a3;
}

- (void)setHasNumBridgedAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasNumBridgedAccessories
{
  return (*(_QWORD *)&self->_has >> 21) & 1;
}

- (void)setNumNotCertifiedAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_numNotCertifiedAccessories = a3;
}

- (void)setHasNumNotCertifiedAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumNotCertifiedAccessories
{
  return (*(_QWORD *)&self->_has >> 57) & 1;
}

- (void)setNumCertifiedAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_numCertifiedAccessories = a3;
}

- (void)setHasNumCertifiedAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasNumCertifiedAccessories
{
  return (*(_QWORD *)&self->_has >> 30) & 1;
}

- (void)clearEventTriggers
{
  -[NSMutableArray removeAllObjects](self->_eventTriggers, "removeAllObjects");
}

- (void)addEventTriggers:(id)a3
{
  id v4;
  NSMutableArray *eventTriggers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  eventTriggers = self->_eventTriggers;
  v8 = v4;
  if (!eventTriggers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_eventTriggers;
    self->_eventTriggers = v6;

    v4 = v8;
    eventTriggers = self->_eventTriggers;
  }
  -[NSMutableArray addObject:](eventTriggers, "addObject:", v4);

}

- (unint64_t)eventTriggersCount
{
  return -[NSMutableArray count](self->_eventTriggers, "count");
}

- (id)eventTriggersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_eventTriggers, "objectAtIndex:", a3);
}

- (void)setNumHAPAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_numHAPAccessories = a3;
}

- (void)setHasNumHAPAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasNumHAPAccessories
{
  return (*(_QWORD *)&self->_has >> 35) & 1;
}

- (void)setNumAppleMediaAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_numAppleMediaAccessories = a3;
}

- (void)setHasNumAppleMediaAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasNumAppleMediaAccessories
{
  return (*(_QWORD *)&self->_has >> 17) & 1;
}

- (void)setNumWholeHouseAudioAccessories:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x1000u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numWholeHouseAudioAccessories = a3;
}

- (void)setHasNumWholeHouseAudioAccessories:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xEFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 4096;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xEFFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumWholeHouseAudioAccessories
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 12) & 1;
}

- (void)setNumAppleAudioAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_numAppleAudioAccessories = a3;
}

- (void)setHasNumAppleAudioAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasNumAppleAudioAccessories
{
  return (*(_QWORD *)&self->_has >> 16) & 1;
}

- (void)setNumAppleTVAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_numAppleTVAccessories = a3;
}

- (void)setHasNumAppleTVAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasNumAppleTVAccessories
{
  return (*(_QWORD *)&self->_has >> 19) & 1;
}

- (void)setNumCameraAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_numCameraAccessories = a3;
}

- (void)setHasNumCameraAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasNumCameraAccessories
{
  return (*(_QWORD *)&self->_has >> 23) & 1;
}

- (void)setNumMediaSystems:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_numMediaSystems = a3;
}

- (void)setHasNumMediaSystems:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumMediaSystems
{
  return (*(_QWORD *)&self->_has >> 47) & 1;
}

- (void)setNumTargetControllers:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x40u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numTargetControllers = a3;
}

- (void)setHasNumTargetControllers:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFBF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 64;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFBF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumTargetControllers
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 6) & 1;
}

- (void)setNumCertifiedTargetControllers:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_numCertifiedTargetControllers = a3;
}

- (void)setHasNumCertifiedTargetControllers:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasNumCertifiedTargetControllers
{
  return HIDWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setNumBridgedTargetControllers:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_numBridgedTargetControllers = a3;
}

- (void)setHasNumBridgedTargetControllers:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasNumBridgedTargetControllers
{
  return (*(_QWORD *)&self->_has >> 22) & 1;
}

- (void)setNumCertifiedBridgedTargetControllers:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_numCertifiedBridgedTargetControllers = a3;
}

- (void)setHasNumCertifiedBridgedTargetControllers:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasNumCertifiedBridgedTargetControllers
{
  return (*(_QWORD *)&self->_has >> 31) & 1;
}

- (void)setNumConfiguredScenes:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_numConfiguredScenes = a3;
}

- (void)setHasNumConfiguredScenes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasNumConfiguredScenes
{
  return (*(_QWORD *)&self->_has >> 33) & 1;
}

- (void)setIsOwner:(BOOL)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x10000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_isOwner = a3;
}

- (void)setHasIsOwner:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFEFFFF;
  if (a3)
    v4 = 0x10000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasIsOwner
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 16) & 1;
}

- (void)setNumResidentsEnabled:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 2u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numResidentsEnabled = a3;
}

- (void)setHasNumResidentsEnabled:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFFD | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 2;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFD | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumResidentsEnabled
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 1) & 1;
}

- (void)setPrimaryReportingDevice:(BOOL)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x80000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_primaryReportingDevice = a3;
}

- (void)setHasPrimaryReportingDevice:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFF7FFFF;
  if (a3)
    v4 = 0x80000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasPrimaryReportingDevice
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 19) & 1;
}

- (void)setNumTelevisionAccessories:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x80u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numTelevisionAccessories = a3;
}

- (void)setHasNumTelevisionAccessories:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFF7F | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 128;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFF7F | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumTelevisionAccessories
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 7) & 1;
}

- (int)networkProtectionStatus
{
  if ((*(_QWORD *)&self->_has & 0x20) != 0)
    return self->_networkProtectionStatus;
  else
    return 0;
}

- (void)setNetworkProtectionStatus:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_networkProtectionStatus = a3;
}

- (void)setHasNetworkProtectionStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasNetworkProtectionStatus
{
  return (*(_QWORD *)&self->_has >> 5) & 1;
}

- (id)networkProtectionStatusAsString:(int)a3
{
  if (a3 < 3)
    return off_24E786450[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNetworkProtectionStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitNetworkProtectionStatus_NoManagedRouter")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitNetworkProtectionStatus_NotProtected")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitNetworkProtectionStatus_Protected")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNumAccessoriesWiFiPPSKCredential:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_numAccessoriesWiFiPPSKCredential = a3;
}

- (void)setHasNumAccessoriesWiFiPPSKCredential:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasNumAccessoriesWiFiPPSKCredential
{
  return (*(_QWORD *)&self->_has >> 13) & 1;
}

- (void)setNumAccessoriesNetworkProtectionAutoFullAccess:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_numAccessoriesNetworkProtectionAutoFullAccess = a3;
}

- (void)setHasNumAccessoriesNetworkProtectionAutoFullAccess:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasNumAccessoriesNetworkProtectionAutoFullAccess
{
  return (*(_QWORD *)&self->_has >> 7) & 1;
}

- (void)setNumAccessoriesNetworkProtectionAutoProtectedMainLAN:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_numAccessoriesNetworkProtectionAutoProtectedMainLAN = a3;
}

- (void)setHasNumAccessoriesNetworkProtectionAutoProtectedMainLAN:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasNumAccessoriesNetworkProtectionAutoProtectedMainLAN
{
  return (*(_QWORD *)&self->_has >> 9) & 1;
}

- (void)setNumAccessoriesNetworkProtectionAutoProtectedHomeKitLAN:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN = a3;
}

- (void)setHasNumAccessoriesNetworkProtectionAutoProtectedHomeKitLAN:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasNumAccessoriesNetworkProtectionAutoProtectedHomeKitLAN
{
  return (*(_QWORD *)&self->_has >> 8) & 1;
}

- (void)setNumAccessoriesNetworkProtectionFullAccess:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_numAccessoriesNetworkProtectionFullAccess = a3;
}

- (void)setHasNumAccessoriesNetworkProtectionFullAccess:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasNumAccessoriesNetworkProtectionFullAccess
{
  return (*(_QWORD *)&self->_has >> 10) & 1;
}

- (void)setNumAccessoriesNetworkProtectionHomeKitOnly:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_numAccessoriesNetworkProtectionHomeKitOnly = a3;
}

- (void)setHasNumAccessoriesNetworkProtectionHomeKitOnly:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasNumAccessoriesNetworkProtectionHomeKitOnly
{
  return (*(_QWORD *)&self->_has >> 11) & 1;
}

- (void)setNumAccessoriesNetworkProtectionUnprotected:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_numAccessoriesNetworkProtectionUnprotected = a3;
}

- (void)setHasNumAccessoriesNetworkProtectionUnprotected:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasNumAccessoriesNetworkProtectionUnprotected
{
  return (*(_QWORD *)&self->_has >> 12) & 1;
}

- (void)setNumShortcuts:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x20u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numShortcuts = a3;
}

- (void)setHasNumShortcuts:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFDF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 32;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFDF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumShortcuts
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 5) & 1;
}

- (void)clearHomeKitMultiUserSettings
{
  -[NSMutableArray removeAllObjects](self->_homeKitMultiUserSettings, "removeAllObjects");
}

- (void)addHomeKitMultiUserSettings:(id)a3
{
  id v4;
  NSMutableArray *homeKitMultiUserSettings;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  homeKitMultiUserSettings = self->_homeKitMultiUserSettings;
  v8 = v4;
  if (!homeKitMultiUserSettings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_homeKitMultiUserSettings;
    self->_homeKitMultiUserSettings = v6;

    v4 = v8;
    homeKitMultiUserSettings = self->_homeKitMultiUserSettings;
  }
  -[NSMutableArray addObject:](homeKitMultiUserSettings, "addObject:", v4);

}

- (unint64_t)homeKitMultiUserSettingsCount
{
  return -[NSMutableArray count](self->_homeKitMultiUserSettings, "count");
}

- (id)homeKitMultiUserSettingsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_homeKitMultiUserSettings, "objectAtIndex:", a3);
}

- (void)setNumHAPIPAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_numHAPIPAccessories = a3;
}

- (void)setHasNumHAPIPAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasNumHAPIPAccessories
{
  return (*(_QWORD *)&self->_has >> 39) & 1;
}

- (void)setNumHAPBTAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_numHAPBTAccessories = a3;
}

- (void)setHasNumHAPBTAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasNumHAPBTAccessories
{
  return (*(_QWORD *)&self->_has >> 37) & 1;
}

- (void)setNumHAPBatteryServiceAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_numHAPBatteryServiceAccessories = a3;
}

- (void)setHasNumHAPBatteryServiceAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasNumHAPBatteryServiceAccessories
{
  return (*(_QWORD *)&self->_has >> 38) & 1;
}

- (void)setNumCameraAccessoriesSupportRecording:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_numCameraAccessoriesSupportRecording = a3;
}

- (void)setHasNumCameraAccessoriesSupportRecording:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasNumCameraAccessoriesSupportRecording
{
  return (*(_QWORD *)&self->_has >> 28) & 1;
}

- (void)clearHapServicesLists
{
  -[NSMutableArray removeAllObjects](self->_hapServicesLists, "removeAllObjects");
}

- (void)addHapServicesList:(id)a3
{
  id v4;
  NSMutableArray *hapServicesLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  hapServicesLists = self->_hapServicesLists;
  v8 = v4;
  if (!hapServicesLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_hapServicesLists;
    self->_hapServicesLists = v6;

    v4 = v8;
    hapServicesLists = self->_hapServicesLists;
  }
  -[NSMutableArray addObject:](hapServicesLists, "addObject:", v4);

}

- (unint64_t)hapServicesListsCount
{
  return -[NSMutableArray count](self->_hapServicesLists, "count");
}

- (id)hapServicesListAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_hapServicesLists, "objectAtIndex:", a3);
}

- (void)clearPrimaryHAPServicesLists
{
  -[NSMutableArray removeAllObjects](self->_primaryHAPServicesLists, "removeAllObjects");
}

- (void)addPrimaryHAPServicesList:(id)a3
{
  id v4;
  NSMutableArray *primaryHAPServicesLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  primaryHAPServicesLists = self->_primaryHAPServicesLists;
  v8 = v4;
  if (!primaryHAPServicesLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_primaryHAPServicesLists;
    self->_primaryHAPServicesLists = v6;

    v4 = v8;
    primaryHAPServicesLists = self->_primaryHAPServicesLists;
  }
  -[NSMutableArray addObject:](primaryHAPServicesLists, "addObject:", v4);

}

- (unint64_t)primaryHAPServicesListsCount
{
  return -[NSMutableArray count](self->_primaryHAPServicesLists, "count");
}

- (id)primaryHAPServicesListAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_primaryHAPServicesLists, "objectAtIndex:", a3);
}

- (void)clearHapServicesListCertifieds
{
  -[NSMutableArray removeAllObjects](self->_hapServicesListCertifieds, "removeAllObjects");
}

- (void)addHapServicesListCertified:(id)a3
{
  id v4;
  NSMutableArray *hapServicesListCertifieds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  hapServicesListCertifieds = self->_hapServicesListCertifieds;
  v8 = v4;
  if (!hapServicesListCertifieds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_hapServicesListCertifieds;
    self->_hapServicesListCertifieds = v6;

    v4 = v8;
    hapServicesListCertifieds = self->_hapServicesListCertifieds;
  }
  -[NSMutableArray addObject:](hapServicesListCertifieds, "addObject:", v4);

}

- (unint64_t)hapServicesListCertifiedsCount
{
  return -[NSMutableArray count](self->_hapServicesListCertifieds, "count");
}

- (id)hapServicesListCertifiedAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_hapServicesListCertifieds, "objectAtIndex:", a3);
}

- (void)clearPrimaryHAPServicesListCertifieds
{
  -[NSMutableArray removeAllObjects](self->_primaryHAPServicesListCertifieds, "removeAllObjects");
}

- (void)addPrimaryHAPServicesListCertified:(id)a3
{
  id v4;
  NSMutableArray *primaryHAPServicesListCertifieds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  primaryHAPServicesListCertifieds = self->_primaryHAPServicesListCertifieds;
  v8 = v4;
  if (!primaryHAPServicesListCertifieds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_primaryHAPServicesListCertifieds;
    self->_primaryHAPServicesListCertifieds = v6;

    v4 = v8;
    primaryHAPServicesListCertifieds = self->_primaryHAPServicesListCertifieds;
  }
  -[NSMutableArray addObject:](primaryHAPServicesListCertifieds, "addObject:", v4);

}

- (unint64_t)primaryHAPServicesListCertifiedsCount
{
  return -[NSMutableArray count](self->_primaryHAPServicesListCertifieds, "count");
}

- (id)primaryHAPServicesListCertifiedAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_primaryHAPServicesListCertifieds, "objectAtIndex:", a3);
}

- (void)setNumHAPSpeakerServiceAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_numHAPSpeakerServiceAccessories = a3;
}

- (void)setHasNumHAPSpeakerServiceAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumHAPSpeakerServiceAccessories
{
  return (*(_QWORD *)&self->_has >> 42) & 1;
}

- (void)setNumPrimaryHAPSpeakerServiceAccessories:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 1u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numPrimaryHAPSpeakerServiceAccessories = a3;
}

- (void)setHasNumPrimaryHAPSpeakerServiceAccessories:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFE | a3;
}

- (BOOL)hasNumPrimaryHAPSpeakerServiceAccessories
{
  return *((_WORD *)&self->_has + 4) & 1;
}

- (void)setNumTriggerOwnedConfiguredScenes:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x200u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numTriggerOwnedConfiguredScenes = a3;
}

- (void)setHasNumTriggerOwnedConfiguredScenes:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFDFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 512;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFDFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumTriggerOwnedConfiguredScenes
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 9) & 1;
}

- (void)setNumCameraAccessoriesRecordingEnabled:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_numCameraAccessoriesRecordingEnabled = a3;
}

- (void)setHasNumCameraAccessoriesRecordingEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasNumCameraAccessoriesRecordingEnabled
{
  return (*(_QWORD *)&self->_has >> 26) & 1;
}

- (void)setNumCameraAccessoriesRecordingAudioEnabled:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_numCameraAccessoriesRecordingAudioEnabled = a3;
}

- (void)setHasNumCameraAccessoriesRecordingAudioEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasNumCameraAccessoriesRecordingAudioEnabled
{
  return (*(_QWORD *)&self->_has >> 25) & 1;
}

- (void)setNumCameraAccessoriesSmartBulletinNotificationEnabled:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_numCameraAccessoriesSmartBulletinNotificationEnabled = a3;
}

- (void)setHasNumCameraAccessoriesSmartBulletinNotificationEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasNumCameraAccessoriesSmartBulletinNotificationEnabled
{
  return (*(_QWORD *)&self->_has >> 27) & 1;
}

- (void)setNumCameraAccessoriesReachabilityNotificationEnabled:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_numCameraAccessoriesReachabilityNotificationEnabled = a3;
}

- (void)setHasNumCameraAccessoriesReachabilityNotificationEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasNumCameraAccessoriesReachabilityNotificationEnabled
{
  return (*(_QWORD *)&self->_has >> 24) & 1;
}

- (void)setNumCameraAccessoriesWithActivityZonesEnabled:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_numCameraAccessoriesWithActivityZonesEnabled = a3;
}

- (void)setHasNumCameraAccessoriesWithActivityZonesEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasNumCameraAccessoriesWithActivityZonesEnabled
{
  return (*(_QWORD *)&self->_has >> 29) & 1;
}

- (void)setEnabledResidentsDeviceCapabilities:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_enabledResidentsDeviceCapabilities = a3;
}

- (void)setHasEnabledResidentsDeviceCapabilities:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasEnabledResidentsDeviceCapabilities
{
  return (*(_QWORD *)&self->_has >> 1) & 1;
}

- (void)setNumLightProfilesWithNaturalLightingSupported:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_numLightProfilesWithNaturalLightingSupported = a3;
}

- (void)setHasNumLightProfilesWithNaturalLightingSupported:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumLightProfilesWithNaturalLightingSupported
{
  return (*(_QWORD *)&self->_has >> 45) & 1;
}

- (void)setNumLightProfilesWithNaturalLightingEnabled:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_numLightProfilesWithNaturalLightingEnabled = a3;
}

- (void)setHasNumLightProfilesWithNaturalLightingEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumLightProfilesWithNaturalLightingEnabled
{
  return (*(_QWORD *)&self->_has >> 44) & 1;
}

- (void)setNumLightProfilesWithNaturalLightingUsed:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_numLightProfilesWithNaturalLightingUsed = a3;
}

- (void)setHasNumLightProfilesWithNaturalLightingUsed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumLightProfilesWithNaturalLightingUsed
{
  return (*(_QWORD *)&self->_has >> 46) & 1;
}

- (void)setNumNoeBRs:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_numNoeBRs = a3;
}

- (void)setHasNumNoeBRs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumNoeBRs
{
  return (*(_QWORD *)&self->_has >> 52) & 1;
}

- (void)setNumNoeAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_numNoeAccessories = a3;
}

- (void)setHasNumNoeAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumNoeAccessories
{
  return (*(_QWORD *)&self->_has >> 50) & 1;
}

- (void)setNumNoeFullCap:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_numNoeFullCap = a3;
}

- (void)setHasNumNoeFullCap:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumNoeFullCap
{
  return (*(_QWORD *)&self->_has >> 53) & 1;
}

- (void)setNumNoeSleepCap:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_numNoeSleepCap = a3;
}

- (void)setHasNumNoeSleepCap:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumNoeSleepCap
{
  return HIBYTE(*(_QWORD *)&self->_has) & 1;
}

- (void)setNumNoeMinCap:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_numNoeMinCap = a3;
}

- (void)setHasNumNoeMinCap:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumNoeMinCap
{
  return (*(_QWORD *)&self->_has >> 54) & 1;
}

- (void)setNumNoeRoutCap:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_numNoeRoutCap = a3;
}

- (void)setHasNumNoeRoutCap:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumNoeRoutCap
{
  return (*(_QWORD *)&self->_has >> 55) & 1;
}

- (void)setNumNoeBRCap:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_numNoeBRCap = a3;
}

- (void)setHasNumNoeBRCap:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumNoeBRCap
{
  return (*(_QWORD *)&self->_has >> 51) & 1;
}

- (void)setAutoThirdPartyJetEnable:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x8000u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_autoThirdPartyJetEnable = a3;
}

- (void)setHasAutoThirdPartyJetEnable:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0x7FFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 0x8000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0x7FFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasAutoThirdPartyJetEnable
{
  return (unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 15;
}

- (void)setNumHAPBLEAccessoriesSupportJet:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_numHAPBLEAccessoriesSupportJet = a3;
}

- (void)setHasNumHAPBLEAccessoriesSupportJet:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasNumHAPBLEAccessoriesSupportJet
{
  return (*(_QWORD *)&self->_has >> 36) & 1;
}

- (void)setNumHAPIPAccessoriesSupportJet:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_numHAPIPAccessoriesSupportJet = a3;
}

- (void)setHasNumHAPIPAccessoriesSupportJet:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumHAPIPAccessoriesSupportJet
{
  return (*(_QWORD *)&self->_has >> 40) & 1;
}

- (void)setNumHAPNoeAccessoriesSupportJet:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_numHAPNoeAccessoriesSupportJet = a3;
}

- (void)setHasNumHAPNoeAccessoriesSupportJet:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumHAPNoeAccessoriesSupportJet
{
  return (*(_QWORD *)&self->_has >> 41) & 1;
}

- (void)setHomeCreationCohortWeek:(int)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_homeCreationCohortWeek = a3;
}

- (void)setHasHomeCreationCohortWeek:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasHomeCreationCohortWeek
{
  return (*(_QWORD *)&self->_has >> 3) & 1;
}

- (void)setFirstHAPAccessoryAddedCohortWeek:(int)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_firstHAPAccessoryAddedCohortWeek = a3;
}

- (void)setHasFirstHAPAccessoryAddedCohortWeek:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasFirstHAPAccessoryAddedCohortWeek
{
  return (*(_QWORD *)&self->_has >> 2) & 1;
}

- (int)currentMediaAccessoryFallbackMediaUserType
{
  if ((*(_QWORD *)&self->_has & 1) != 0)
    return self->_currentMediaAccessoryFallbackMediaUserType;
  else
    return 1;
}

- (void)setCurrentMediaAccessoryFallbackMediaUserType:(int)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_currentMediaAccessoryFallbackMediaUserType = a3;
}

- (void)setHasCurrentMediaAccessoryFallbackMediaUserType:(BOOL)a3
{
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasCurrentMediaAccessoryFallbackMediaUserType
{
  return *(_DWORD *)&self->_has & 1;
}

- (id)currentMediaAccessoryFallbackMediaUserTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_24E786468[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCurrentMediaAccessoryFallbackMediaUserType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMediaAccessoryFallbackMediaUserTypeAutomatic")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMediaAccessoryFallbackMediaUserTypeSpecificHomeUser")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMediaAccessoryFallbackMediaUserTypeOtheriTunesAccount")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setNumPoeCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  self->_numPoeCount = a3;
}

- (void)setHasNumPoeCount:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = v3 & 0x8000000000000000 | *(_QWORD *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasNumPoeCount
{
  return *(_QWORD *)&self->_has >> 63;
}

- (void)setNumPoe2Count:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  self->_numPoe2Count = a3;
}

- (void)setHasNumPoe2Count:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumPoe2Count
{
  return (*(_QWORD *)&self->_has >> 62) & 1;
}

- (void)setNumMoe1Accessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_numMoe1Accessories = a3;
}

- (void)setHasNumMoe1Accessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumMoe1Accessories
{
  return HIWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setNumMoe2Accessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_numMoe2Accessories = a3;
}

- (void)setHasNumMoe2Accessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumMoe2Accessories
{
  return (*(_QWORD *)&self->_has >> 49) & 1;
}

- (void)setHomepodSynchLatency:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_homepodSynchLatency = a3;
}

- (void)setHasHomepodSynchLatency:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasHomepodSynchLatency
{
  return (*(_QWORD *)&self->_has >> 4) & 1;
}

- (void)setNumHomePods:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_numHomePods = a3;
}

- (void)setHasNumHomePods:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasNumHomePods
{
  return (*(_QWORD *)&self->_has >> 43) & 1;
}

- (void)setNumBSPs:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_numBSPs = a3;
}

- (void)setHasNumBSPs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasNumBSPs
{
  return (*(_QWORD *)&self->_has >> 20) & 1;
}

- (void)setNumWoLAccessories:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x2000u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_numWoLAccessories = a3;
}

- (void)setHasNumWoLAccessories:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xDFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 0x2000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xDFFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasNumWoLAccessories
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 13) & 1;
}

- (void)setNumOfParticipantsHaveAccepted:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_numOfParticipantsHaveAccepted = a3;
}

- (void)setHasNumOfParticipantsHaveAccepted:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumOfParticipantsHaveAccepted
{
  return (*(_QWORD *)&self->_has >> 59) & 1;
}

- (void)setNumOfParticipantsHaveCloudShareIDAndHaveAccepted:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_numOfParticipantsHaveCloudShareIDAndHaveAccepted = a3;
}

- (void)setHasNumOfParticipantsHaveCloudShareIDAndHaveAccepted:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumOfParticipantsHaveCloudShareIDAndHaveAccepted
{
  return (*(_QWORD *)&self->_has >> 60) & 1;
}

- (void)setNumOfParticipantsHaveCloudShareIDButNotAccepted:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_numOfParticipantsHaveCloudShareIDButNotAccepted = a3;
}

- (void)setHasNumOfParticipantsHaveCloudShareIDButNotAccepted:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumOfParticipantsHaveCloudShareIDButNotAccepted
{
  return (*(_QWORD *)&self->_has >> 61) & 1;
}

- (void)setNumOfNonAcceptedParticipantsWithKnownCapability:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_numOfNonAcceptedParticipantsWithKnownCapability = a3;
}

- (void)setHasNumOfNonAcceptedParticipantsWithKnownCapability:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumOfNonAcceptedParticipantsWithKnownCapability
{
  return (*(_QWORD *)&self->_has >> 58) & 1;
}

- (void)setNumAppleTV4K2ndGenAccessories:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_numAppleTV4K2ndGenAccessories = a3;
}

- (void)setHasNumAppleTV4K2ndGenAccessories:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasNumAppleTV4K2ndGenAccessories
{
  return (*(_QWORD *)&self->_has >> 18) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDHomeKitHomeConfiguration;
  -[AWDHomeKitHomeConfiguration description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitHomeConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t has;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  $973D7089A3FD407A0279E2D4C7E02544 *p_has;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  $973D7089A3FD407A0279E2D4C7E02544 *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  void *v58;
  NSMutableArray *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  void *v64;
  void *v65;
  NSMutableArray *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t n;
  void *v71;
  void *v72;
  NSMutableArray *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t ii;
  void *v78;
  uint64_t v79;
  __int16 v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t networkProtectionStatus;
  __CFString *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  unsigned int v130;
  __CFString *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  uint64_t v181;

  v181 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (uint64_t)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAccessories);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("numAccessories"));

    v6 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v5 = *((unsigned __int16 *)&self->_has + 4);
  v6 = v5 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v5 & 0x10) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numServices);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("numServices"));

    v6 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (uint64_t)self->_has;
  }
LABEL_6:
  if ((v6 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numUsers);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("numUsers"));

    v6 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (uint64_t)self->_has;
    if ((has & 0x8000) == 0)
    {
LABEL_8:
      if ((v6 & 8) == 0)
        goto LABEL_9;
      goto LABEL_35;
    }
  }
  else if ((has & 0x8000) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAdmins);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("numAdmins"));

  v22 = *((unsigned __int16 *)&self->_has + 4);
  v6 = v22 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v22 & 8) == 0)
  {
LABEL_9:
    if ((v6 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numScenes);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("numScenes"));

  v24 = *((unsigned __int16 *)&self->_has + 4);
  v6 = v24 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v24 & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x400000000) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numTriggers);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("numTriggers"));

  v6 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_11:
    if ((v6 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numEventTriggers);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("numEventTriggers"));

  v27 = *((unsigned __int16 *)&self->_has + 4);
  v6 = v27 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v27 & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numTimerTriggers);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("numTimerTriggers"));

  v6 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((v6 & 4) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAccessoryServiceGroups);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("numAccessoryServiceGroups"));

  v30 = *((unsigned __int16 *)&self->_has + 4);
  v6 = v30 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v30 & 4) == 0)
  {
LABEL_14:
    if ((v6 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numRooms);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("numRooms"));

  v32 = *((unsigned __int16 *)&self->_has + 4);
  v6 = v32 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v32 & 0x4000) == 0)
  {
LABEL_15:
    if ((v6 & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numZones);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("numZones"));

  v6 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v6 & 0x40000) == 0)
  {
LABEL_16:
    if ((v6 & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isResidentAvailable);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("isResidentAvailable"));

  has = (uint64_t)self->_has;
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x20000) == 0)
  {
LABEL_17:
    if ((has & 0x200000) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPrimaryResident);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("isPrimaryResident"));

  has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_18:
    if ((has & 0x200000000000000) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numBridgedAccessories);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("numBridgedAccessories"));

  has = (uint64_t)self->_has;
  if ((has & 0x200000000000000) == 0)
  {
LABEL_19:
    if ((has & 0x40000000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numNotCertifiedAccessories);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("numNotCertifiedAccessories"));

  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numCertifiedAccessories);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("numCertifiedAccessories"));

  }
LABEL_21:
  if (-[NSMutableArray count](self->_eventTriggers, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_eventTriggers, "count"));
    v171 = 0u;
    v172 = 0u;
    v173 = 0u;
    v174 = 0u;
    v11 = self->_eventTriggers;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v171, v180, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v172;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v172 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v171 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v171, v180, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("eventTriggers"));
  }
  p_has = &self->_has;
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x800000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numHAPAccessories);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("numHAPAccessories"));

    v19 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v18 = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x20000) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
  v19 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v18 & 0x20000) != 0)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAppleMediaAccessories);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("numAppleMediaAccessories"));

    v19 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v18 = (uint64_t)self->_has;
  }
LABEL_49:
  if ((v19 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numWholeHouseAudioAccessories);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("numWholeHouseAudioAccessories"));

    v19 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v18 = (uint64_t)self->_has;
    if ((v18 & 0x10000) == 0)
    {
LABEL_51:
      if ((v18 & 0x80000) == 0)
        goto LABEL_52;
      goto LABEL_128;
    }
  }
  else if ((v18 & 0x10000) == 0)
  {
    goto LABEL_51;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAppleAudioAccessories);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v82, CFSTR("numAppleAudioAccessories"));

  v19 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x80000) == 0)
  {
LABEL_52:
    if ((v18 & 0x800000) == 0)
      goto LABEL_53;
    goto LABEL_129;
  }
LABEL_128:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAppleTVAccessories);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("numAppleTVAccessories"));

  v19 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x800000) == 0)
  {
LABEL_53:
    if ((v18 & 0x800000000000) == 0)
      goto LABEL_54;
    goto LABEL_130;
  }
LABEL_129:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numCameraAccessories);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("numCameraAccessories"));

  v19 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x800000000000) == 0)
  {
LABEL_54:
    if ((v19 & 0x40) == 0)
      goto LABEL_55;
    goto LABEL_131;
  }
LABEL_130:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numMediaSystems);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("numMediaSystems"));

  v86 = *((unsigned __int16 *)&self->_has + 4);
  v19 = v86 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v18 = (uint64_t)self->_has;
  if ((v86 & 0x40) == 0)
  {
LABEL_55:
    if ((v18 & 0x100000000) == 0)
      goto LABEL_56;
    goto LABEL_132;
  }
LABEL_131:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numTargetControllers);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v87, CFSTR("numTargetControllers"));

  v19 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x100000000) == 0)
  {
LABEL_56:
    if ((v18 & 0x400000) == 0)
      goto LABEL_57;
    goto LABEL_133;
  }
LABEL_132:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numCertifiedTargetControllers);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("numCertifiedTargetControllers"));

  v19 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x400000) == 0)
  {
LABEL_57:
    if ((v18 & 0x80000000) == 0)
      goto LABEL_58;
    goto LABEL_134;
  }
LABEL_133:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numBridgedTargetControllers);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v89, CFSTR("numBridgedTargetControllers"));

  v19 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x80000000) == 0)
  {
LABEL_58:
    if ((v18 & 0x200000000) == 0)
      goto LABEL_59;
    goto LABEL_135;
  }
LABEL_134:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numCertifiedBridgedTargetControllers);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("numCertifiedBridgedTargetControllers"));

  v19 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x200000000) == 0)
  {
LABEL_59:
    if ((v19 & 0x10000) == 0)
      goto LABEL_60;
    goto LABEL_136;
  }
LABEL_135:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numConfiguredScenes);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("numConfiguredScenes"));

  v19 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v18 = (uint64_t)self->_has;
  if ((v19 & 0x10000) == 0)
  {
LABEL_60:
    if ((v19 & 2) == 0)
      goto LABEL_61;
    goto LABEL_137;
  }
LABEL_136:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isOwner);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("isOwner"));

  v93 = *((unsigned __int16 *)&self->_has + 4);
  v19 = v93 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v18 = (uint64_t)self->_has;
  if ((v93 & 2) == 0)
  {
LABEL_61:
    if ((v19 & 0x80000) == 0)
      goto LABEL_62;
    goto LABEL_138;
  }
LABEL_137:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numResidentsEnabled);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v94, CFSTR("numResidentsEnabled"));

  v19 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v18 = (uint64_t)self->_has;
  if ((v19 & 0x80000) == 0)
  {
LABEL_62:
    if ((v19 & 0x80) == 0)
      goto LABEL_63;
    goto LABEL_139;
  }
LABEL_138:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_primaryReportingDevice);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v95, CFSTR("primaryReportingDevice"));

  LOBYTE(v19) = *((_WORD *)&self->_has + 4);
  v18 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
  {
LABEL_63:
    if ((v18 & 0x20) == 0)
      goto LABEL_64;
    goto LABEL_140;
  }
LABEL_139:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numTelevisionAccessories);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v96, CFSTR("numTelevisionAccessories"));

  LOWORD(v19) = *((_WORD *)&self->_has + 4);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x20) == 0)
  {
LABEL_64:
    if ((v18 & 0x2000) == 0)
      goto LABEL_65;
    goto LABEL_214;
  }
LABEL_140:
  networkProtectionStatus = self->_networkProtectionStatus;
  if (networkProtectionStatus >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_networkProtectionStatus);
    v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v98 = off_24E786450[networkProtectionStatus];
  }
  objc_msgSend(v3, "setObject:forKey:", v98, CFSTR("networkProtectionStatus"));

  LOWORD(v19) = *((_WORD *)&self->_has + 4);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x2000) == 0)
  {
LABEL_65:
    if ((v18 & 0x80) == 0)
      goto LABEL_66;
    goto LABEL_215;
  }
LABEL_214:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAccessoriesWiFiPPSKCredential);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v132, CFSTR("numAccessoriesWiFiPPSKCredential"));

  LOWORD(v19) = *((_WORD *)&self->_has + 4);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x80) == 0)
  {
LABEL_66:
    if ((v18 & 0x200) == 0)
      goto LABEL_67;
    goto LABEL_216;
  }
LABEL_215:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAccessoriesNetworkProtectionAutoFullAccess);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v133, CFSTR("numAccessoriesNetworkProtectionAutoFullAccess"));

  LOWORD(v19) = *((_WORD *)&self->_has + 4);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x200) == 0)
  {
LABEL_67:
    if ((v18 & 0x100) == 0)
      goto LABEL_68;
    goto LABEL_217;
  }
LABEL_216:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAccessoriesNetworkProtectionAutoProtectedMainLAN);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v134, CFSTR("numAccessoriesNetworkProtectionAutoProtectedMainLAN"));

  LOWORD(v19) = *((_WORD *)&self->_has + 4);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x100) == 0)
  {
LABEL_68:
    if ((v18 & 0x400) == 0)
      goto LABEL_69;
    goto LABEL_218;
  }
LABEL_217:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v135, CFSTR("numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN"));

  LOWORD(v19) = *((_WORD *)&self->_has + 4);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x400) == 0)
  {
LABEL_69:
    if ((v18 & 0x800) == 0)
      goto LABEL_70;
    goto LABEL_219;
  }
LABEL_218:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAccessoriesNetworkProtectionFullAccess);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v136, CFSTR("numAccessoriesNetworkProtectionFullAccess"));

  LOWORD(v19) = *((_WORD *)&self->_has + 4);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x800) == 0)
  {
LABEL_70:
    if ((v18 & 0x1000) == 0)
      goto LABEL_71;
    goto LABEL_220;
  }
LABEL_219:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAccessoriesNetworkProtectionHomeKitOnly);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v137, CFSTR("numAccessoriesNetworkProtectionHomeKitOnly"));

  LOWORD(v19) = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x1000) == 0)
  {
LABEL_71:
    if ((v19 & 0x20) == 0)
      goto LABEL_73;
    goto LABEL_72;
  }
LABEL_220:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAccessoriesNetworkProtectionUnprotected);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v138, CFSTR("numAccessoriesNetworkProtectionUnprotected"));

  if ((*((_WORD *)&self->_has + 4) & 0x20) != 0)
  {
LABEL_72:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numShortcuts);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("numShortcuts"));

  }
LABEL_73:
  if (-[NSMutableArray count](self->_homeKitMultiUserSettings, "count"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_homeKitMultiUserSettings, "count"));
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    v170 = 0u;
    v42 = self->_homeKitMultiUserSettings;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v167, v179, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v168;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v168 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v167 + 1) + 8 * j), "dictionaryRepresentation");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v47);

        }
        v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v167, v179, 16);
      }
      while (v44);
    }

    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("homeKitMultiUserSettings"));
  }
  v48 = &self->_has;
  v49 = (uint64_t)self->_has;
  if ((v49 & 0x8000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numHAPIPAccessories);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v99, CFSTR("numHAPIPAccessories"));

    v49 = *(_QWORD *)v48;
    if ((*(_QWORD *)v48 & 0x2000000000) == 0)
    {
LABEL_84:
      if ((v49 & 0x4000000000) == 0)
        goto LABEL_85;
      goto LABEL_144;
    }
  }
  else if ((v49 & 0x2000000000) == 0)
  {
    goto LABEL_84;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numHAPBTAccessories);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v100, CFSTR("numHAPBTAccessories"));

  v49 = (uint64_t)self->_has;
  if ((v49 & 0x4000000000) == 0)
  {
LABEL_85:
    if ((v49 & 0x10000000) == 0)
      goto LABEL_87;
    goto LABEL_86;
  }
LABEL_144:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numHAPBatteryServiceAccessories);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v101, CFSTR("numHAPBatteryServiceAccessories"));

  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_86:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numCameraAccessoriesSupportRecording);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("numCameraAccessoriesSupportRecording"));

  }
LABEL_87:
  if (-[NSMutableArray count](self->_hapServicesLists, "count"))
  {
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_hapServicesLists, "count"));
    v163 = 0u;
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    v52 = self->_hapServicesLists;
    v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v163, v178, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v164;
      do
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(_QWORD *)v164 != v55)
            objc_enumerationMutation(v52);
          objc_msgSend(*(id *)(*((_QWORD *)&v163 + 1) + 8 * k), "dictionaryRepresentation");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v57);

        }
        v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v163, v178, 16);
      }
      while (v54);
    }

    objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("hapServicesList"));
  }
  if (-[NSMutableArray count](self->_primaryHAPServicesLists, "count"))
  {
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_primaryHAPServicesLists, "count"));
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v59 = self->_primaryHAPServicesLists;
    v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v159, v177, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v160;
      do
      {
        for (m = 0; m != v61; ++m)
        {
          if (*(_QWORD *)v160 != v62)
            objc_enumerationMutation(v59);
          objc_msgSend(*(id *)(*((_QWORD *)&v159 + 1) + 8 * m), "dictionaryRepresentation");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObject:", v64);

        }
        v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v159, v177, 16);
      }
      while (v61);
    }

    objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("primaryHAPServicesList"));
  }
  if (-[NSMutableArray count](self->_hapServicesListCertifieds, "count"))
  {
    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_hapServicesListCertifieds, "count"));
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v66 = self->_hapServicesListCertifieds;
    v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v155, v176, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v156;
      do
      {
        for (n = 0; n != v68; ++n)
        {
          if (*(_QWORD *)v156 != v69)
            objc_enumerationMutation(v66);
          objc_msgSend(*(id *)(*((_QWORD *)&v155 + 1) + 8 * n), "dictionaryRepresentation");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addObject:", v71);

        }
        v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v155, v176, 16);
      }
      while (v68);
    }

    objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("hapServicesListCertified"));
  }
  if (-[NSMutableArray count](self->_primaryHAPServicesListCertifieds, "count"))
  {
    v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_primaryHAPServicesListCertifieds, "count"));
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    v154 = 0u;
    v73 = self->_primaryHAPServicesListCertifieds;
    v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v151, v175, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v152;
      do
      {
        for (ii = 0; ii != v75; ++ii)
        {
          if (*(_QWORD *)v152 != v76)
            objc_enumerationMutation(v73);
          objc_msgSend(*(id *)(*((_QWORD *)&v151 + 1) + 8 * ii), "dictionaryRepresentation");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "addObject:", v78);

        }
        v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v151, v175, 16);
      }
      while (v75);
    }

    objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("primaryHAPServicesListCertified"));
  }
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x40000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numHAPSpeakerServiceAccessories);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v102, CFSTR("numHAPSpeakerServiceAccessories"));

    v80 = *((_WORD *)&self->_has + 4);
    v79 = (uint64_t)self->_has;
    if ((v80 & 1) == 0)
      goto LABEL_148;
    goto LABEL_147;
  }
  v80 = *((_WORD *)&self->_has + 4);
  if ((v80 & 1) != 0)
  {
LABEL_147:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numPrimaryHAPSpeakerServiceAccessories);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v103, CFSTR("numPrimaryHAPSpeakerServiceAccessories"));

    v80 = *((_WORD *)&self->_has + 4);
    v79 = (uint64_t)self->_has;
  }
LABEL_148:
  if ((v80 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numTriggerOwnedConfiguredScenes);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v107, CFSTR("numTriggerOwnedConfiguredScenes"));

    v80 = *((_WORD *)&self->_has + 4);
    v79 = (uint64_t)self->_has;
    if ((v79 & 0x4000000) == 0)
    {
LABEL_150:
      if ((v79 & 0x2000000) == 0)
        goto LABEL_151;
      goto LABEL_189;
    }
  }
  else if ((v79 & 0x4000000) == 0)
  {
    goto LABEL_150;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numCameraAccessoriesRecordingEnabled);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v108, CFSTR("numCameraAccessoriesRecordingEnabled"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x2000000) == 0)
  {
LABEL_151:
    if ((v79 & 0x8000000) == 0)
      goto LABEL_152;
    goto LABEL_190;
  }
LABEL_189:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numCameraAccessoriesRecordingAudioEnabled);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v109, CFSTR("numCameraAccessoriesRecordingAudioEnabled"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x8000000) == 0)
  {
LABEL_152:
    if ((v79 & 0x1000000) == 0)
      goto LABEL_153;
    goto LABEL_191;
  }
LABEL_190:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numCameraAccessoriesSmartBulletinNotificationEnabled);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v110, CFSTR("numCameraAccessoriesSmartBulletinNotificationEnabled"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x1000000) == 0)
  {
LABEL_153:
    if ((v79 & 0x20000000) == 0)
      goto LABEL_154;
    goto LABEL_192;
  }
LABEL_191:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numCameraAccessoriesReachabilityNotificationEnabled);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v111, CFSTR("numCameraAccessoriesReachabilityNotificationEnabled"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x20000000) == 0)
  {
LABEL_154:
    if ((v79 & 2) == 0)
      goto LABEL_155;
    goto LABEL_193;
  }
LABEL_192:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numCameraAccessoriesWithActivityZonesEnabled);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v112, CFSTR("numCameraAccessoriesWithActivityZonesEnabled"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 2) == 0)
  {
LABEL_155:
    if ((v79 & 0x200000000000) == 0)
      goto LABEL_156;
    goto LABEL_194;
  }
LABEL_193:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_enabledResidentsDeviceCapabilities);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v113, CFSTR("enabledResidentsDeviceCapabilities"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x200000000000) == 0)
  {
LABEL_156:
    if ((v79 & 0x100000000000) == 0)
      goto LABEL_157;
    goto LABEL_195;
  }
LABEL_194:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numLightProfilesWithNaturalLightingSupported);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v114, CFSTR("numLightProfilesWithNaturalLightingSupported"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x100000000000) == 0)
  {
LABEL_157:
    if ((v79 & 0x400000000000) == 0)
      goto LABEL_158;
    goto LABEL_196;
  }
LABEL_195:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numLightProfilesWithNaturalLightingEnabled);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v115, CFSTR("numLightProfilesWithNaturalLightingEnabled"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x400000000000) == 0)
  {
LABEL_158:
    if ((v79 & 0x10000000000000) == 0)
      goto LABEL_159;
    goto LABEL_197;
  }
LABEL_196:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numLightProfilesWithNaturalLightingUsed);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v116, CFSTR("numLightProfilesWithNaturalLightingUsed"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x10000000000000) == 0)
  {
LABEL_159:
    if ((v79 & 0x4000000000000) == 0)
      goto LABEL_160;
    goto LABEL_198;
  }
LABEL_197:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numNoeBRs);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v117, CFSTR("numNoeBRs"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x4000000000000) == 0)
  {
LABEL_160:
    if ((v79 & 0x20000000000000) == 0)
      goto LABEL_161;
    goto LABEL_199;
  }
LABEL_198:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numNoeAccessories);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v118, CFSTR("numNoeAccessories"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x20000000000000) == 0)
  {
LABEL_161:
    if ((v79 & 0x100000000000000) == 0)
      goto LABEL_162;
    goto LABEL_200;
  }
LABEL_199:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numNoeFullCap);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v119, CFSTR("numNoeFullCap"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x100000000000000) == 0)
  {
LABEL_162:
    if ((v79 & 0x40000000000000) == 0)
      goto LABEL_163;
    goto LABEL_201;
  }
LABEL_200:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numNoeSleepCap);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v120, CFSTR("numNoeSleepCap"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x40000000000000) == 0)
  {
LABEL_163:
    if ((v79 & 0x80000000000000) == 0)
      goto LABEL_164;
    goto LABEL_202;
  }
LABEL_201:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numNoeMinCap);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v121, CFSTR("numNoeMinCap"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x80000000000000) == 0)
  {
LABEL_164:
    if ((v79 & 0x8000000000000) == 0)
      goto LABEL_165;
    goto LABEL_203;
  }
LABEL_202:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numNoeRoutCap);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v122, CFSTR("numNoeRoutCap"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x8000000000000) == 0)
  {
LABEL_165:
    if ((v80 & 0x8000) == 0)
      goto LABEL_166;
    goto LABEL_204;
  }
LABEL_203:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numNoeBRCap);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v123, CFSTR("numNoeBRCap"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v80 & 0x8000) == 0)
  {
LABEL_166:
    if ((v79 & 0x1000000000) == 0)
      goto LABEL_167;
    goto LABEL_205;
  }
LABEL_204:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_autoThirdPartyJetEnable);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v124, CFSTR("autoThirdPartyJetEnable"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x1000000000) == 0)
  {
LABEL_167:
    if ((v79 & 0x10000000000) == 0)
      goto LABEL_168;
    goto LABEL_206;
  }
LABEL_205:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numHAPBLEAccessoriesSupportJet);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v125, CFSTR("numHAPBLEAccessoriesSupportJet"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x10000000000) == 0)
  {
LABEL_168:
    if ((v79 & 0x20000000000) == 0)
      goto LABEL_169;
    goto LABEL_207;
  }
LABEL_206:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numHAPIPAccessoriesSupportJet);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v126, CFSTR("numHAPIPAccessoriesSupportJet"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x20000000000) == 0)
  {
LABEL_169:
    if ((v79 & 8) == 0)
      goto LABEL_170;
    goto LABEL_208;
  }
LABEL_207:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numHAPNoeAccessoriesSupportJet);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v127, CFSTR("numHAPNoeAccessoriesSupportJet"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 8) == 0)
  {
LABEL_170:
    if ((v79 & 4) == 0)
      goto LABEL_171;
    goto LABEL_209;
  }
LABEL_208:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_homeCreationCohortWeek);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v128, CFSTR("homeCreationCohortWeek"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 4) == 0)
  {
LABEL_171:
    if ((v79 & 1) == 0)
      goto LABEL_172;
    goto LABEL_210;
  }
LABEL_209:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_firstHAPAccessoryAddedCohortWeek);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v129, CFSTR("firstHAPAccessoryAddedCohortWeek"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 1) == 0)
  {
LABEL_172:
    if ((v79 & 0x8000000000000000) == 0)
      goto LABEL_173;
    goto LABEL_224;
  }
LABEL_210:
  v130 = self->_currentMediaAccessoryFallbackMediaUserType - 1;
  if (v130 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_currentMediaAccessoryFallbackMediaUserType);
    v131 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v131 = off_24E786468[v130];
  }
  objc_msgSend(v3, "setObject:forKey:", v131, CFSTR("currentMediaAccessoryFallbackMediaUserType"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x8000000000000000) == 0)
  {
LABEL_173:
    if ((v79 & 0x4000000000000000) == 0)
      goto LABEL_174;
    goto LABEL_225;
  }
LABEL_224:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_numPoeCount);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v139, CFSTR("numPoeCount"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x4000000000000000) == 0)
  {
LABEL_174:
    if ((v79 & 0x1000000000000) == 0)
      goto LABEL_175;
    goto LABEL_226;
  }
LABEL_225:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_numPoe2Count);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v140, CFSTR("numPoe2Count"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x1000000000000) == 0)
  {
LABEL_175:
    if ((v79 & 0x2000000000000) == 0)
      goto LABEL_176;
    goto LABEL_227;
  }
LABEL_226:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numMoe1Accessories);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v141, CFSTR("numMoe1Accessories"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x2000000000000) == 0)
  {
LABEL_176:
    if ((v79 & 0x10) == 0)
      goto LABEL_177;
    goto LABEL_228;
  }
LABEL_227:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numMoe2Accessories);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v142, CFSTR("numMoe2Accessories"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x10) == 0)
  {
LABEL_177:
    if ((v79 & 0x80000000000) == 0)
      goto LABEL_178;
    goto LABEL_229;
  }
LABEL_228:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_homepodSynchLatency);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v143, CFSTR("homepodSynchLatency"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x80000000000) == 0)
  {
LABEL_178:
    if ((v79 & 0x100000) == 0)
      goto LABEL_179;
    goto LABEL_230;
  }
LABEL_229:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numHomePods);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v144, CFSTR("numHomePods"));

  v80 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x100000) == 0)
  {
LABEL_179:
    if ((v80 & 0x2000) == 0)
      goto LABEL_180;
    goto LABEL_231;
  }
LABEL_230:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numBSPs);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v145, CFSTR("numBSPs"));

  v79 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x2000) == 0)
  {
LABEL_180:
    if ((v79 & 0x800000000000000) == 0)
      goto LABEL_181;
    goto LABEL_232;
  }
LABEL_231:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numWoLAccessories);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v146, CFSTR("numWoLAccessories"));

  v79 = (uint64_t)self->_has;
  if ((v79 & 0x800000000000000) == 0)
  {
LABEL_181:
    if ((v79 & 0x1000000000000000) == 0)
      goto LABEL_182;
    goto LABEL_233;
  }
LABEL_232:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numOfParticipantsHaveAccepted);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v147, CFSTR("numOfParticipantsHaveAccepted"));

  v79 = (uint64_t)self->_has;
  if ((v79 & 0x1000000000000000) == 0)
  {
LABEL_182:
    if ((v79 & 0x2000000000000000) == 0)
      goto LABEL_183;
    goto LABEL_234;
  }
LABEL_233:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numOfParticipantsHaveCloudShareIDAndHaveAccepted);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v148, CFSTR("numOfParticipantsHaveCloudShareIDAndHaveAccepted"));

  v79 = (uint64_t)self->_has;
  if ((v79 & 0x2000000000000000) == 0)
  {
LABEL_183:
    if ((v79 & 0x400000000000000) == 0)
      goto LABEL_184;
LABEL_235:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numOfNonAcceptedParticipantsWithKnownCapability);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v150, CFSTR("numOfNonAcceptedParticipantsWithKnownCapability"));

    if ((*(_QWORD *)&self->_has & 0x40000) == 0)
      goto LABEL_186;
    goto LABEL_185;
  }
LABEL_234:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numOfParticipantsHaveCloudShareIDButNotAccepted);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v149, CFSTR("numOfParticipantsHaveCloudShareIDButNotAccepted"));

  v79 = (uint64_t)self->_has;
  if ((v79 & 0x400000000000000) != 0)
    goto LABEL_235;
LABEL_184:
  if ((v79 & 0x40000) != 0)
  {
LABEL_185:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAppleTV4K2ndGenAccessories);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v104, CFSTR("numAppleTV4K2ndGenAccessories"));

  }
LABEL_186:
  v105 = v3;

  return v105;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitHomeConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  uint64_t has;
  int v6;
  int v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  $973D7089A3FD407A0279E2D4C7E02544 *p_has;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  $973D7089A3FD407A0279E2D4C7E02544 *v26;
  uint64_t v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  uint64_t v48;
  __int16 v49;
  int v50;
  int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
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
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = (uint64_t)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = *((unsigned __int16 *)&self->_has + 4);
  v7 = v6 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v6 & 0x10) != 0)
  {
LABEL_5:
    PBDataWriterWriteUint32Field();
    v7 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (uint64_t)self->_has;
  }
LABEL_6:
  if ((v7 & 0x800) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (uint64_t)self->_has;
    if ((has & 0x8000) == 0)
    {
LABEL_8:
      if ((v7 & 8) == 0)
        goto LABEL_9;
      goto LABEL_33;
    }
  }
  else if ((has & 0x8000) == 0)
  {
    goto LABEL_8;
  }
  PBDataWriterWriteUint32Field();
  v16 = *((unsigned __int16 *)&self->_has + 4);
  v7 = v16 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v16 & 8) == 0)
  {
LABEL_9:
    if ((v7 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  v17 = *((unsigned __int16 *)&self->_has + 4);
  v7 = v17 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v17 & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x400000000) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  v7 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_11:
    if ((v7 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  v18 = *((unsigned __int16 *)&self->_has + 4);
  v7 = v18 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v18 & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  v7 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((v7 & 4) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  v19 = *((unsigned __int16 *)&self->_has + 4);
  v7 = v19 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v19 & 4) == 0)
  {
LABEL_14:
    if ((v7 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  v20 = *((unsigned __int16 *)&self->_has + 4);
  v7 = v20 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v20 & 0x4000) == 0)
  {
LABEL_15:
    if ((v7 & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  v7 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v7 & 0x40000) == 0)
  {
LABEL_16:
    if ((v7 & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x20000) == 0)
  {
LABEL_17:
    if ((has & 0x200000) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_18:
    if ((has & 0x200000000000000) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = (uint64_t)self->_has;
  if ((has & 0x200000000000000) == 0)
  {
LABEL_19:
    if ((has & 0x40000000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
LABEL_20:
    PBDataWriterWriteUint32Field();
LABEL_21:
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v8 = self->_eventTriggers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v73 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    }
    while (v10);
  }

  p_has = &self->_has;
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x800000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v14 = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x20000) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
  v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v14 & 0x20000) != 0)
  {
LABEL_46:
    PBDataWriterWriteUint32Field();
    v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v14 = (uint64_t)self->_has;
  }
LABEL_47:
  if ((v15 & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v14 = (uint64_t)self->_has;
    if ((v14 & 0x10000) == 0)
    {
LABEL_49:
      if ((v14 & 0x80000) == 0)
        goto LABEL_50;
      goto LABEL_116;
    }
  }
  else if ((v14 & 0x10000) == 0)
  {
    goto LABEL_49;
  }
  PBDataWriterWriteUint32Field();
  v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x80000) == 0)
  {
LABEL_50:
    if ((v14 & 0x800000) == 0)
      goto LABEL_51;
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteUint32Field();
  v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x800000) == 0)
  {
LABEL_51:
    if ((v14 & 0x800000000000) == 0)
      goto LABEL_52;
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteUint32Field();
  v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x800000000000) == 0)
  {
LABEL_52:
    if ((v15 & 0x40) == 0)
      goto LABEL_53;
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteUint32Field();
  v50 = *((unsigned __int16 *)&self->_has + 4);
  v15 = v50 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v14 = (uint64_t)self->_has;
  if ((v50 & 0x40) == 0)
  {
LABEL_53:
    if ((v14 & 0x100000000) == 0)
      goto LABEL_54;
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteUint32Field();
  v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x100000000) == 0)
  {
LABEL_54:
    if ((v14 & 0x400000) == 0)
      goto LABEL_55;
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteUint32Field();
  v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x400000) == 0)
  {
LABEL_55:
    if ((v14 & 0x80000000) == 0)
      goto LABEL_56;
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteUint32Field();
  v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x80000000) == 0)
  {
LABEL_56:
    if ((v14 & 0x200000000) == 0)
      goto LABEL_57;
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteUint32Field();
  v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x200000000) == 0)
  {
LABEL_57:
    if ((v15 & 0x10000) == 0)
      goto LABEL_58;
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteUint32Field();
  v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v14 = (uint64_t)self->_has;
  if ((v15 & 0x10000) == 0)
  {
LABEL_58:
    if ((v15 & 2) == 0)
      goto LABEL_59;
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteBOOLField();
  v51 = *((unsigned __int16 *)&self->_has + 4);
  v15 = v51 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v14 = (uint64_t)self->_has;
  if ((v51 & 2) == 0)
  {
LABEL_59:
    if ((v15 & 0x80000) == 0)
      goto LABEL_60;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteUint32Field();
  v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v14 = (uint64_t)self->_has;
  if ((v15 & 0x80000) == 0)
  {
LABEL_60:
    if ((v15 & 0x80) == 0)
      goto LABEL_61;
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteBOOLField();
  LOBYTE(v15) = *((_WORD *)&self->_has + 4);
  v14 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
  {
LABEL_61:
    if ((v14 & 0x20) == 0)
      goto LABEL_62;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteUint32Field();
  LOWORD(v15) = *((_WORD *)&self->_has + 4);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x20) == 0)
  {
LABEL_62:
    if ((v14 & 0x2000) == 0)
      goto LABEL_63;
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteInt32Field();
  LOWORD(v15) = *((_WORD *)&self->_has + 4);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x2000) == 0)
  {
LABEL_63:
    if ((v14 & 0x80) == 0)
      goto LABEL_64;
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteUint32Field();
  LOWORD(v15) = *((_WORD *)&self->_has + 4);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x80) == 0)
  {
LABEL_64:
    if ((v14 & 0x200) == 0)
      goto LABEL_65;
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteUint32Field();
  LOWORD(v15) = *((_WORD *)&self->_has + 4);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x200) == 0)
  {
LABEL_65:
    if ((v14 & 0x100) == 0)
      goto LABEL_66;
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteUint32Field();
  LOWORD(v15) = *((_WORD *)&self->_has + 4);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x100) == 0)
  {
LABEL_66:
    if ((v14 & 0x400) == 0)
      goto LABEL_67;
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteUint32Field();
  LOWORD(v15) = *((_WORD *)&self->_has + 4);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x400) == 0)
  {
LABEL_67:
    if ((v14 & 0x800) == 0)
      goto LABEL_68;
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteUint32Field();
  LOWORD(v15) = *((_WORD *)&self->_has + 4);
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x800) == 0)
  {
LABEL_68:
    if ((v14 & 0x1000) == 0)
      goto LABEL_69;
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteUint32Field();
  LOWORD(v15) = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x1000) == 0)
  {
LABEL_69:
    if ((v15 & 0x20) == 0)
      goto LABEL_71;
    goto LABEL_70;
  }
LABEL_135:
  PBDataWriterWriteUint32Field();
  if ((*((_WORD *)&self->_has + 4) & 0x20) != 0)
LABEL_70:
    PBDataWriterWriteUint32Field();
LABEL_71:
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v21 = self->_homeKitMultiUserSettings;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v69 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    }
    while (v23);
  }

  v26 = &self->_has;
  v27 = (uint64_t)self->_has;
  if ((v27 & 0x8000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v27 = *(_QWORD *)v26;
    if ((*(_QWORD *)v26 & 0x2000000000) == 0)
    {
LABEL_80:
      if ((v27 & 0x4000000000) == 0)
        goto LABEL_81;
      goto LABEL_139;
    }
  }
  else if ((v27 & 0x2000000000) == 0)
  {
    goto LABEL_80;
  }
  PBDataWriterWriteUint32Field();
  v27 = (uint64_t)self->_has;
  if ((v27 & 0x4000000000) == 0)
  {
LABEL_81:
    if ((v27 & 0x10000000) == 0)
      goto LABEL_83;
    goto LABEL_82;
  }
LABEL_139:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
LABEL_82:
    PBDataWriterWriteUint32Field();
LABEL_83:
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v28 = self->_hapServicesLists;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v65;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v65 != v31)
          objc_enumerationMutation(v28);
        PBDataWriterWriteSubmessage();
      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
    }
    while (v30);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v33 = self->_primaryHAPServicesLists;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v61;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(_QWORD *)v61 != v36)
          objc_enumerationMutation(v33);
        PBDataWriterWriteSubmessage();
      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
    }
    while (v35);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v38 = self->_hapServicesListCertifieds;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v56, v77, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v57;
    do
    {
      for (n = 0; n != v40; ++n)
      {
        if (*(_QWORD *)v57 != v41)
          objc_enumerationMutation(v38);
        PBDataWriterWriteSubmessage();
      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v56, v77, 16);
    }
    while (v40);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v43 = self->_primaryHAPServicesListCertifieds;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v52, v76, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v53;
    do
    {
      for (ii = 0; ii != v45; ++ii)
      {
        if (*(_QWORD *)v53 != v46)
          objc_enumerationMutation(v43);
        PBDataWriterWriteSubmessage();
      }
      v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v52, v76, 16);
    }
    while (v45);
  }

  v48 = (uint64_t)self->_has;
  if ((v48 & 0x40000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v49 = *((_WORD *)&self->_has + 4);
    v48 = (uint64_t)self->_has;
    if ((v49 & 1) == 0)
      goto LABEL_143;
    goto LABEL_142;
  }
  v49 = *((_WORD *)&self->_has + 4);
  if ((v49 & 1) != 0)
  {
LABEL_142:
    PBDataWriterWriteUint32Field();
    v49 = *((_WORD *)&self->_has + 4);
    v48 = (uint64_t)self->_has;
  }
LABEL_143:
  if ((v49 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    v49 = *((_WORD *)&self->_has + 4);
    v48 = (uint64_t)self->_has;
    if ((v48 & 0x4000000) == 0)
    {
LABEL_145:
      if ((v48 & 0x2000000) == 0)
        goto LABEL_146;
      goto LABEL_184;
    }
  }
  else if ((v48 & 0x4000000) == 0)
  {
    goto LABEL_145;
  }
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x2000000) == 0)
  {
LABEL_146:
    if ((v48 & 0x8000000) == 0)
      goto LABEL_147;
    goto LABEL_185;
  }
LABEL_184:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x8000000) == 0)
  {
LABEL_147:
    if ((v48 & 0x1000000) == 0)
      goto LABEL_148;
    goto LABEL_186;
  }
LABEL_185:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x1000000) == 0)
  {
LABEL_148:
    if ((v48 & 0x20000000) == 0)
      goto LABEL_149;
    goto LABEL_187;
  }
LABEL_186:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x20000000) == 0)
  {
LABEL_149:
    if ((v48 & 2) == 0)
      goto LABEL_150;
    goto LABEL_188;
  }
LABEL_187:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 2) == 0)
  {
LABEL_150:
    if ((v48 & 0x200000000000) == 0)
      goto LABEL_151;
    goto LABEL_189;
  }
LABEL_188:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x200000000000) == 0)
  {
LABEL_151:
    if ((v48 & 0x100000000000) == 0)
      goto LABEL_152;
    goto LABEL_190;
  }
LABEL_189:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x100000000000) == 0)
  {
LABEL_152:
    if ((v48 & 0x400000000000) == 0)
      goto LABEL_153;
    goto LABEL_191;
  }
LABEL_190:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x400000000000) == 0)
  {
LABEL_153:
    if ((v48 & 0x10000000000000) == 0)
      goto LABEL_154;
    goto LABEL_192;
  }
LABEL_191:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x10000000000000) == 0)
  {
LABEL_154:
    if ((v48 & 0x4000000000000) == 0)
      goto LABEL_155;
    goto LABEL_193;
  }
LABEL_192:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x4000000000000) == 0)
  {
LABEL_155:
    if ((v48 & 0x20000000000000) == 0)
      goto LABEL_156;
    goto LABEL_194;
  }
LABEL_193:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x20000000000000) == 0)
  {
LABEL_156:
    if ((v48 & 0x100000000000000) == 0)
      goto LABEL_157;
    goto LABEL_195;
  }
LABEL_194:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x100000000000000) == 0)
  {
LABEL_157:
    if ((v48 & 0x40000000000000) == 0)
      goto LABEL_158;
    goto LABEL_196;
  }
LABEL_195:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x40000000000000) == 0)
  {
LABEL_158:
    if ((v48 & 0x80000000000000) == 0)
      goto LABEL_159;
    goto LABEL_197;
  }
LABEL_196:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x80000000000000) == 0)
  {
LABEL_159:
    if ((v48 & 0x8000000000000) == 0)
      goto LABEL_160;
    goto LABEL_198;
  }
LABEL_197:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x8000000000000) == 0)
  {
LABEL_160:
    if ((v49 & 0x8000) == 0)
      goto LABEL_161;
    goto LABEL_199;
  }
LABEL_198:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v49 & 0x8000) == 0)
  {
LABEL_161:
    if ((v48 & 0x1000000000) == 0)
      goto LABEL_162;
    goto LABEL_200;
  }
LABEL_199:
  PBDataWriterWriteBOOLField();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x1000000000) == 0)
  {
LABEL_162:
    if ((v48 & 0x10000000000) == 0)
      goto LABEL_163;
    goto LABEL_201;
  }
LABEL_200:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x10000000000) == 0)
  {
LABEL_163:
    if ((v48 & 0x20000000000) == 0)
      goto LABEL_164;
    goto LABEL_202;
  }
LABEL_201:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x20000000000) == 0)
  {
LABEL_164:
    if ((v48 & 8) == 0)
      goto LABEL_165;
    goto LABEL_203;
  }
LABEL_202:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 8) == 0)
  {
LABEL_165:
    if ((v48 & 4) == 0)
      goto LABEL_166;
    goto LABEL_204;
  }
LABEL_203:
  PBDataWriterWriteInt32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 4) == 0)
  {
LABEL_166:
    if ((v48 & 1) == 0)
      goto LABEL_167;
    goto LABEL_205;
  }
LABEL_204:
  PBDataWriterWriteInt32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 1) == 0)
  {
LABEL_167:
    if ((v48 & 0x8000000000000000) == 0)
      goto LABEL_168;
    goto LABEL_206;
  }
LABEL_205:
  PBDataWriterWriteInt32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x8000000000000000) == 0)
  {
LABEL_168:
    if ((v48 & 0x4000000000000000) == 0)
      goto LABEL_169;
    goto LABEL_207;
  }
LABEL_206:
  PBDataWriterWriteInt32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x4000000000000000) == 0)
  {
LABEL_169:
    if ((v48 & 0x1000000000000) == 0)
      goto LABEL_170;
    goto LABEL_208;
  }
LABEL_207:
  PBDataWriterWriteInt32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x1000000000000) == 0)
  {
LABEL_170:
    if ((v48 & 0x2000000000000) == 0)
      goto LABEL_171;
    goto LABEL_209;
  }
LABEL_208:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x2000000000000) == 0)
  {
LABEL_171:
    if ((v48 & 0x10) == 0)
      goto LABEL_172;
    goto LABEL_210;
  }
LABEL_209:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x10) == 0)
  {
LABEL_172:
    if ((v48 & 0x80000000000) == 0)
      goto LABEL_173;
    goto LABEL_211;
  }
LABEL_210:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x80000000000) == 0)
  {
LABEL_173:
    if ((v48 & 0x100000) == 0)
      goto LABEL_174;
    goto LABEL_212;
  }
LABEL_211:
  PBDataWriterWriteUint32Field();
  v49 = *((_WORD *)&self->_has + 4);
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x100000) == 0)
  {
LABEL_174:
    if ((v49 & 0x2000) == 0)
      goto LABEL_175;
    goto LABEL_213;
  }
LABEL_212:
  PBDataWriterWriteUint32Field();
  v48 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x2000) == 0)
  {
LABEL_175:
    if ((v48 & 0x800000000000000) == 0)
      goto LABEL_176;
    goto LABEL_214;
  }
LABEL_213:
  PBDataWriterWriteUint32Field();
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x800000000000000) == 0)
  {
LABEL_176:
    if ((v48 & 0x1000000000000000) == 0)
      goto LABEL_177;
    goto LABEL_215;
  }
LABEL_214:
  PBDataWriterWriteUint32Field();
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x1000000000000000) == 0)
  {
LABEL_177:
    if ((v48 & 0x2000000000000000) == 0)
      goto LABEL_178;
    goto LABEL_216;
  }
LABEL_215:
  PBDataWriterWriteUint32Field();
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x2000000000000000) == 0)
  {
LABEL_178:
    if ((v48 & 0x400000000000000) == 0)
      goto LABEL_179;
LABEL_217:
    PBDataWriterWriteUint32Field();
    if ((*(_QWORD *)&self->_has & 0x40000) == 0)
      goto LABEL_181;
    goto LABEL_180;
  }
LABEL_216:
  PBDataWriterWriteUint32Field();
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x400000000000000) != 0)
    goto LABEL_217;
LABEL_179:
  if ((v48 & 0x40000) != 0)
LABEL_180:
    PBDataWriterWriteUint32Field();
LABEL_181:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  uint64_t has;
  int v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  $973D7089A3FD407A0279E2D4C7E02544 *p_has;
  uint64_t v13;
  int v14;
  _DWORD *v15;
  char v16;
  int v17;
  char v18;
  int v19;
  char v20;
  int v21;
  char v22;
  int v23;
  char v24;
  int v25;
  char v26;
  int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t j;
  void *v34;
  $973D7089A3FD407A0279E2D4C7E02544 *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t k;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t m;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t n;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t ii;
  void *v52;
  uint64_t v53;
  __int16 v54;
  _DWORD *v55;
  char v56;
  int v57;
  char v58;
  int v59;
  unsigned int v60;
  int v61;
  char v62;
  int v63;
  unsigned int v64;
  char v65;
  char v66;
  char v67;
  char v68;
  char v69;
  id v70;

  v4 = a3;
  has = (uint64_t)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[18] = self->_numAccessories;
    *((_QWORD *)v4 + 49) |= 0x40uLL;
    v6 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x10) != 0)
  {
LABEL_5:
    v4[80] = self->_numServices;
    v7 = *((_BYTE *)v4 + 402);
    *((_WORD *)v4 + 200) |= 0x10u;
    *((_BYTE *)v4 + 402) = v7;
    v6 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (uint64_t)self->_has;
  }
LABEL_6:
  if ((v6 & 0x800) != 0)
  {
    v4[87] = self->_numUsers;
    v16 = *((_BYTE *)v4 + 402);
    *((_WORD *)v4 + 200) |= 0x800u;
    *((_BYTE *)v4 + 402) = v16;
    v6 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (uint64_t)self->_has;
    if ((has & 0x8000) == 0)
    {
LABEL_8:
      if ((v6 & 8) == 0)
        goto LABEL_9;
      goto LABEL_30;
    }
  }
  else if ((has & 0x8000) == 0)
  {
    goto LABEL_8;
  }
  v4[27] = self->_numAdmins;
  *((_QWORD *)v4 + 49) |= 0x8000uLL;
  v17 = *((unsigned __int16 *)&self->_has + 4);
  v6 = v17 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v17 & 8) == 0)
  {
LABEL_9:
    if ((v6 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  v4[79] = self->_numScenes;
  v18 = *((_BYTE *)v4 + 402);
  *((_WORD *)v4 + 200) |= 8u;
  *((_BYTE *)v4 + 402) = v18;
  v19 = *((unsigned __int16 *)&self->_has + 4);
  v6 = v19 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v19 & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x400000000) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  v4[86] = self->_numTriggers;
  v20 = *((_BYTE *)v4 + 402);
  *((_WORD *)v4 + 200) |= 0x400u;
  *((_BYTE *)v4 + 402) = v20;
  v6 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_11:
    if ((v6 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  v4[46] = self->_numEventTriggers;
  *((_QWORD *)v4 + 49) |= 0x400000000uLL;
  v21 = *((unsigned __int16 *)&self->_has + 4);
  v6 = v21 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v21 & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  v4[84] = self->_numTimerTriggers;
  v22 = *((_BYTE *)v4 + 402);
  *((_WORD *)v4 + 200) |= 0x100u;
  *((_BYTE *)v4 + 402) = v22;
  v6 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((v6 & 4) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  v4[26] = self->_numAccessoryServiceGroups;
  *((_QWORD *)v4 + 49) |= 0x4000uLL;
  v23 = *((unsigned __int16 *)&self->_has + 4);
  v6 = v23 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v23 & 4) == 0)
  {
LABEL_14:
    if ((v6 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  v4[78] = self->_numRooms;
  v24 = *((_BYTE *)v4 + 402);
  *((_WORD *)v4 + 200) |= 4u;
  *((_BYTE *)v4 + 402) = v24;
  v25 = *((unsigned __int16 *)&self->_has + 4);
  v6 = v25 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v25 & 0x4000) == 0)
  {
LABEL_15:
    if ((v6 & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  v4[90] = self->_numZones;
  v26 = *((_BYTE *)v4 + 402);
  *((_WORD *)v4 + 200) |= 0x4000u;
  *((_BYTE *)v4 + 402) = v26;
  v6 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v6 & 0x40000) == 0)
  {
LABEL_16:
    if ((v6 & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  *((_BYTE *)v4 + 387) = self->_isResidentAvailable;
  v27 = *((unsigned __int16 *)v4 + 200);
  v28 = (v27 | (*((unsigned __int8 *)v4 + 402) << 16) | 0x40000u) >> 16;
  *((_WORD *)v4 + 200) = v27;
  *((_BYTE *)v4 + 402) = v28;
  has = (uint64_t)self->_has;
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x20000) == 0)
  {
LABEL_17:
    if ((has & 0x200000) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  *((_BYTE *)v4 + 386) = self->_isPrimaryResident;
  v29 = *((unsigned __int16 *)v4 + 200);
  v30 = (v29 | (*((unsigned __int8 *)v4 + 402) << 16) | 0x20000u) >> 16;
  *((_WORD *)v4 + 200) = v29;
  *((_BYTE *)v4 + 402) = v30;
  has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_18:
    if ((has & 0x200000000000000) == 0)
      goto LABEL_19;
LABEL_40:
    v4[69] = self->_numNotCertifiedAccessories;
    *((_QWORD *)v4 + 49) |= 0x200000000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x40000000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_39:
  v4[33] = self->_numBridgedAccessories;
  *((_QWORD *)v4 + 49) |= 0x200000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000000000000) != 0)
    goto LABEL_40;
LABEL_19:
  if ((has & 0x40000000) != 0)
  {
LABEL_20:
    v4[42] = self->_numCertifiedAccessories;
    *((_QWORD *)v4 + 49) |= 0x40000000uLL;
  }
LABEL_21:
  v70 = v4;
  if (-[AWDHomeKitHomeConfiguration eventTriggersCount](self, "eventTriggersCount"))
  {
    objc_msgSend(v70, "clearEventTriggers");
    v8 = -[AWDHomeKitHomeConfiguration eventTriggersCount](self, "eventTriggersCount");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        -[AWDHomeKitHomeConfiguration eventTriggersAtIndex:](self, "eventTriggersAtIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addEventTriggers:", v11);

      }
    }
  }
  p_has = &self->_has;
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x800000000) != 0)
  {
    v15 = v70;
    *((_DWORD *)v70 + 47) = self->_numHAPAccessories;
    *((_QWORD *)v70 + 49) |= 0x800000000uLL;
    v14 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v13 = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x20000) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
  v14 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v15 = v70;
  if ((v13 & 0x20000) != 0)
  {
LABEL_43:
    v15[29] = self->_numAppleMediaAccessories;
    *((_QWORD *)v15 + 49) |= 0x20000uLL;
    v14 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v13 = (uint64_t)self->_has;
  }
LABEL_44:
  if ((v14 & 0x1000) != 0)
  {
    v15[88] = self->_numWholeHouseAudioAccessories;
    v56 = *((_BYTE *)v15 + 402);
    *((_WORD *)v15 + 200) |= 0x1000u;
    *((_BYTE *)v15 + 402) = v56;
    v14 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v13 = (uint64_t)self->_has;
    if ((v13 & 0x10000) == 0)
    {
LABEL_46:
      if ((v13 & 0x80000) == 0)
        goto LABEL_47;
      goto LABEL_98;
    }
  }
  else if ((v13 & 0x10000) == 0)
  {
    goto LABEL_46;
  }
  v15[28] = self->_numAppleAudioAccessories;
  *((_QWORD *)v15 + 49) |= 0x10000uLL;
  v14 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x80000) == 0)
  {
LABEL_47:
    if ((v13 & 0x800000) == 0)
      goto LABEL_48;
    goto LABEL_99;
  }
LABEL_98:
  v15[31] = self->_numAppleTVAccessories;
  *((_QWORD *)v15 + 49) |= 0x80000uLL;
  v14 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x800000) == 0)
  {
LABEL_48:
    if ((v13 & 0x800000000000) == 0)
      goto LABEL_49;
    goto LABEL_100;
  }
LABEL_99:
  v15[35] = self->_numCameraAccessories;
  *((_QWORD *)v15 + 49) |= 0x800000uLL;
  v14 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x800000000000) == 0)
  {
LABEL_49:
    if ((v14 & 0x40) == 0)
      goto LABEL_50;
    goto LABEL_101;
  }
LABEL_100:
  v15[59] = self->_numMediaSystems;
  *((_QWORD *)v15 + 49) |= 0x800000000000uLL;
  v57 = *((unsigned __int16 *)&self->_has + 4);
  v14 = v57 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v13 = (uint64_t)self->_has;
  if ((v57 & 0x40) == 0)
  {
LABEL_50:
    if ((v13 & 0x100000000) == 0)
      goto LABEL_51;
    goto LABEL_102;
  }
LABEL_101:
  v15[82] = self->_numTargetControllers;
  v58 = *((_BYTE *)v15 + 402);
  *((_WORD *)v15 + 200) |= 0x40u;
  *((_BYTE *)v15 + 402) = v58;
  v14 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x100000000) == 0)
  {
LABEL_51:
    if ((v13 & 0x400000) == 0)
      goto LABEL_52;
    goto LABEL_103;
  }
LABEL_102:
  v15[44] = self->_numCertifiedTargetControllers;
  *((_QWORD *)v15 + 49) |= 0x100000000uLL;
  v14 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x400000) == 0)
  {
LABEL_52:
    if ((v13 & 0x80000000) == 0)
      goto LABEL_53;
    goto LABEL_104;
  }
LABEL_103:
  v15[34] = self->_numBridgedTargetControllers;
  *((_QWORD *)v15 + 49) |= 0x400000uLL;
  v14 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x80000000) == 0)
  {
LABEL_53:
    if ((v13 & 0x200000000) == 0)
      goto LABEL_54;
    goto LABEL_105;
  }
LABEL_104:
  v15[43] = self->_numCertifiedBridgedTargetControllers;
  *((_QWORD *)v15 + 49) |= 0x80000000uLL;
  v14 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x200000000) == 0)
  {
LABEL_54:
    if ((v14 & 0x10000) == 0)
      goto LABEL_55;
    goto LABEL_106;
  }
LABEL_105:
  v15[45] = self->_numConfiguredScenes;
  *((_QWORD *)v15 + 49) |= 0x200000000uLL;
  v14 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v13 = (uint64_t)self->_has;
  if ((v14 & 0x10000) == 0)
  {
LABEL_55:
    if ((v14 & 2) == 0)
      goto LABEL_56;
    goto LABEL_107;
  }
LABEL_106:
  *((_BYTE *)v15 + 385) = self->_isOwner;
  v59 = *((unsigned __int16 *)v15 + 200);
  v60 = (v59 | (*((unsigned __int8 *)v15 + 402) << 16) | 0x10000u) >> 16;
  *((_WORD *)v15 + 200) = v59;
  *((_BYTE *)v15 + 402) = v60;
  v61 = *((unsigned __int16 *)&self->_has + 4);
  v14 = v61 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v13 = (uint64_t)self->_has;
  if ((v61 & 2) == 0)
  {
LABEL_56:
    if ((v14 & 0x80000) == 0)
      goto LABEL_57;
    goto LABEL_108;
  }
LABEL_107:
  v15[77] = self->_numResidentsEnabled;
  v62 = *((_BYTE *)v15 + 402);
  *((_WORD *)v15 + 200) |= 2u;
  *((_BYTE *)v15 + 402) = v62;
  v14 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v13 = (uint64_t)self->_has;
  if ((v14 & 0x80000) == 0)
  {
LABEL_57:
    if ((v14 & 0x80) == 0)
      goto LABEL_58;
    goto LABEL_109;
  }
LABEL_108:
  *((_BYTE *)v15 + 388) = self->_primaryReportingDevice;
  v63 = *((unsigned __int16 *)v15 + 200);
  v64 = (v63 | (*((unsigned __int8 *)v15 + 402) << 16) | 0x80000u) >> 16;
  *((_WORD *)v15 + 200) = v63;
  *((_BYTE *)v15 + 402) = v64;
  LOBYTE(v14) = *((_WORD *)&self->_has + 4);
  v13 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
  {
LABEL_58:
    if ((v13 & 0x20) == 0)
      goto LABEL_59;
    goto LABEL_110;
  }
LABEL_109:
  v15[83] = self->_numTelevisionAccessories;
  v65 = *((_BYTE *)v15 + 402);
  *((_WORD *)v15 + 200) |= 0x80u;
  *((_BYTE *)v15 + 402) = v65;
  LOWORD(v14) = *((_WORD *)&self->_has + 4);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x20) == 0)
  {
LABEL_59:
    if ((v13 & 0x2000) == 0)
      goto LABEL_60;
    goto LABEL_111;
  }
LABEL_110:
  v15[17] = self->_networkProtectionStatus;
  *((_QWORD *)v15 + 49) |= 0x20uLL;
  LOWORD(v14) = *((_WORD *)&self->_has + 4);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x2000) == 0)
  {
LABEL_60:
    if ((v13 & 0x80) == 0)
      goto LABEL_61;
    goto LABEL_112;
  }
LABEL_111:
  v15[25] = self->_numAccessoriesWiFiPPSKCredential;
  *((_QWORD *)v15 + 49) |= 0x2000uLL;
  LOWORD(v14) = *((_WORD *)&self->_has + 4);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x80) == 0)
  {
LABEL_61:
    if ((v13 & 0x200) == 0)
      goto LABEL_62;
    goto LABEL_113;
  }
LABEL_112:
  v15[19] = self->_numAccessoriesNetworkProtectionAutoFullAccess;
  *((_QWORD *)v15 + 49) |= 0x80uLL;
  LOWORD(v14) = *((_WORD *)&self->_has + 4);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x200) == 0)
  {
LABEL_62:
    if ((v13 & 0x100) == 0)
      goto LABEL_63;
    goto LABEL_114;
  }
LABEL_113:
  v15[21] = self->_numAccessoriesNetworkProtectionAutoProtectedMainLAN;
  *((_QWORD *)v15 + 49) |= 0x200uLL;
  LOWORD(v14) = *((_WORD *)&self->_has + 4);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x100) == 0)
  {
LABEL_63:
    if ((v13 & 0x400) == 0)
      goto LABEL_64;
    goto LABEL_115;
  }
LABEL_114:
  v15[20] = self->_numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN;
  *((_QWORD *)v15 + 49) |= 0x100uLL;
  LOWORD(v14) = *((_WORD *)&self->_has + 4);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x400) == 0)
  {
LABEL_64:
    if ((v13 & 0x800) == 0)
      goto LABEL_65;
    goto LABEL_116;
  }
LABEL_115:
  v15[22] = self->_numAccessoriesNetworkProtectionFullAccess;
  *((_QWORD *)v15 + 49) |= 0x400uLL;
  LOWORD(v14) = *((_WORD *)&self->_has + 4);
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x800) == 0)
  {
LABEL_65:
    if ((v13 & 0x1000) == 0)
      goto LABEL_66;
LABEL_117:
    v15[24] = self->_numAccessoriesNetworkProtectionUnprotected;
    *((_QWORD *)v15 + 49) |= 0x1000uLL;
    if ((*((_WORD *)&self->_has + 4) & 0x20) == 0)
      goto LABEL_68;
    goto LABEL_67;
  }
LABEL_116:
  v15[23] = self->_numAccessoriesNetworkProtectionHomeKitOnly;
  *((_QWORD *)v15 + 49) |= 0x800uLL;
  LOWORD(v14) = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x1000) != 0)
    goto LABEL_117;
LABEL_66:
  if ((v14 & 0x20) != 0)
  {
LABEL_67:
    v15[81] = self->_numShortcuts;
    *((_WORD *)v15 + 200) |= 0x20u;
  }
LABEL_68:
  if (-[AWDHomeKitHomeConfiguration homeKitMultiUserSettingsCount](self, "homeKitMultiUserSettingsCount"))
  {
    objc_msgSend(v70, "clearHomeKitMultiUserSettings");
    v31 = -[AWDHomeKitHomeConfiguration homeKitMultiUserSettingsCount](self, "homeKitMultiUserSettingsCount");
    if (v31)
    {
      v32 = v31;
      for (j = 0; j != v32; ++j)
      {
        -[AWDHomeKitHomeConfiguration homeKitMultiUserSettingsAtIndex:](self, "homeKitMultiUserSettingsAtIndex:", j);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addHomeKitMultiUserSettings:", v34);

      }
    }
  }
  v35 = &self->_has;
  v36 = (uint64_t)self->_has;
  if ((v36 & 0x8000000000) != 0)
  {
    *((_DWORD *)v70 + 51) = self->_numHAPIPAccessories;
    *((_QWORD *)v70 + 49) |= 0x8000000000uLL;
    v36 = *(_QWORD *)v35;
    if ((*(_QWORD *)v35 & 0x2000000000) == 0)
    {
LABEL_74:
      if ((v36 & 0x4000000000) == 0)
        goto LABEL_75;
LABEL_121:
      *((_DWORD *)v70 + 50) = self->_numHAPBatteryServiceAccessories;
      *((_QWORD *)v70 + 49) |= 0x4000000000uLL;
      if ((*(_QWORD *)&self->_has & 0x10000000) == 0)
        goto LABEL_77;
      goto LABEL_76;
    }
  }
  else if ((v36 & 0x2000000000) == 0)
  {
    goto LABEL_74;
  }
  *((_DWORD *)v70 + 49) = self->_numHAPBTAccessories;
  *((_QWORD *)v70 + 49) |= 0x2000000000uLL;
  v36 = (uint64_t)self->_has;
  if ((v36 & 0x4000000000) != 0)
    goto LABEL_121;
LABEL_75:
  if ((v36 & 0x10000000) != 0)
  {
LABEL_76:
    *((_DWORD *)v70 + 40) = self->_numCameraAccessoriesSupportRecording;
    *((_QWORD *)v70 + 49) |= 0x10000000uLL;
  }
LABEL_77:
  if (-[AWDHomeKitHomeConfiguration hapServicesListsCount](self, "hapServicesListsCount"))
  {
    objc_msgSend(v70, "clearHapServicesLists");
    v37 = -[AWDHomeKitHomeConfiguration hapServicesListsCount](self, "hapServicesListsCount");
    if (v37)
    {
      v38 = v37;
      for (k = 0; k != v38; ++k)
      {
        -[AWDHomeKitHomeConfiguration hapServicesListAtIndex:](self, "hapServicesListAtIndex:", k);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addHapServicesList:", v40);

      }
    }
  }
  if (-[AWDHomeKitHomeConfiguration primaryHAPServicesListsCount](self, "primaryHAPServicesListsCount"))
  {
    objc_msgSend(v70, "clearPrimaryHAPServicesLists");
    v41 = -[AWDHomeKitHomeConfiguration primaryHAPServicesListsCount](self, "primaryHAPServicesListsCount");
    if (v41)
    {
      v42 = v41;
      for (m = 0; m != v42; ++m)
      {
        -[AWDHomeKitHomeConfiguration primaryHAPServicesListAtIndex:](self, "primaryHAPServicesListAtIndex:", m);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addPrimaryHAPServicesList:", v44);

      }
    }
  }
  if (-[AWDHomeKitHomeConfiguration hapServicesListCertifiedsCount](self, "hapServicesListCertifiedsCount"))
  {
    objc_msgSend(v70, "clearHapServicesListCertifieds");
    v45 = -[AWDHomeKitHomeConfiguration hapServicesListCertifiedsCount](self, "hapServicesListCertifiedsCount");
    if (v45)
    {
      v46 = v45;
      for (n = 0; n != v46; ++n)
      {
        -[AWDHomeKitHomeConfiguration hapServicesListCertifiedAtIndex:](self, "hapServicesListCertifiedAtIndex:", n);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addHapServicesListCertified:", v48);

      }
    }
  }
  if (-[AWDHomeKitHomeConfiguration primaryHAPServicesListCertifiedsCount](self, "primaryHAPServicesListCertifiedsCount"))
  {
    objc_msgSend(v70, "clearPrimaryHAPServicesListCertifieds");
    v49 = -[AWDHomeKitHomeConfiguration primaryHAPServicesListCertifiedsCount](self, "primaryHAPServicesListCertifiedsCount");
    if (v49)
    {
      v50 = v49;
      for (ii = 0; ii != v50; ++ii)
      {
        -[AWDHomeKitHomeConfiguration primaryHAPServicesListCertifiedAtIndex:](self, "primaryHAPServicesListCertifiedAtIndex:", ii);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addPrimaryHAPServicesListCertified:", v52);

      }
    }
  }
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x40000000000) != 0)
  {
    v55 = v70;
    *((_DWORD *)v70 + 54) = self->_numHAPSpeakerServiceAccessories;
    *((_QWORD *)v70 + 49) |= 0x40000000000uLL;
    v54 = *((_WORD *)&self->_has + 4);
    v53 = (uint64_t)self->_has;
    if ((v54 & 1) == 0)
      goto LABEL_125;
    goto LABEL_124;
  }
  v54 = *((_WORD *)&self->_has + 4);
  v55 = v70;
  if ((v54 & 1) != 0)
  {
LABEL_124:
    v55[76] = self->_numPrimaryHAPSpeakerServiceAccessories;
    v66 = *((_BYTE *)v55 + 402);
    *((_WORD *)v55 + 200) |= 1u;
    *((_BYTE *)v55 + 402) = v66;
    v54 = *((_WORD *)&self->_has + 4);
    v53 = (uint64_t)self->_has;
  }
LABEL_125:
  if ((v54 & 0x200) != 0)
  {
    v55[85] = self->_numTriggerOwnedConfiguredScenes;
    v67 = *((_BYTE *)v55 + 402);
    *((_WORD *)v55 + 200) |= 0x200u;
    *((_BYTE *)v55 + 402) = v67;
    v54 = *((_WORD *)&self->_has + 4);
    v53 = (uint64_t)self->_has;
    if ((v53 & 0x4000000) == 0)
    {
LABEL_127:
      if ((v53 & 0x2000000) == 0)
        goto LABEL_128;
      goto LABEL_166;
    }
  }
  else if ((v53 & 0x4000000) == 0)
  {
    goto LABEL_127;
  }
  v55[38] = self->_numCameraAccessoriesRecordingEnabled;
  *((_QWORD *)v55 + 49) |= 0x4000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x2000000) == 0)
  {
LABEL_128:
    if ((v53 & 0x8000000) == 0)
      goto LABEL_129;
    goto LABEL_167;
  }
LABEL_166:
  v55[37] = self->_numCameraAccessoriesRecordingAudioEnabled;
  *((_QWORD *)v55 + 49) |= 0x2000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x8000000) == 0)
  {
LABEL_129:
    if ((v53 & 0x1000000) == 0)
      goto LABEL_130;
    goto LABEL_168;
  }
LABEL_167:
  v55[39] = self->_numCameraAccessoriesSmartBulletinNotificationEnabled;
  *((_QWORD *)v55 + 49) |= 0x8000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x1000000) == 0)
  {
LABEL_130:
    if ((v53 & 0x20000000) == 0)
      goto LABEL_131;
    goto LABEL_169;
  }
LABEL_168:
  v55[36] = self->_numCameraAccessoriesReachabilityNotificationEnabled;
  *((_QWORD *)v55 + 49) |= 0x1000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x20000000) == 0)
  {
LABEL_131:
    if ((v53 & 2) == 0)
      goto LABEL_132;
    goto LABEL_170;
  }
LABEL_169:
  v55[41] = self->_numCameraAccessoriesWithActivityZonesEnabled;
  *((_QWORD *)v55 + 49) |= 0x20000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 2) == 0)
  {
LABEL_132:
    if ((v53 & 0x200000000000) == 0)
      goto LABEL_133;
    goto LABEL_171;
  }
LABEL_170:
  v55[3] = self->_enabledResidentsDeviceCapabilities;
  *((_QWORD *)v55 + 49) |= 2uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x200000000000) == 0)
  {
LABEL_133:
    if ((v53 & 0x100000000000) == 0)
      goto LABEL_134;
    goto LABEL_172;
  }
LABEL_171:
  v55[57] = self->_numLightProfilesWithNaturalLightingSupported;
  *((_QWORD *)v55 + 49) |= 0x200000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x100000000000) == 0)
  {
LABEL_134:
    if ((v53 & 0x400000000000) == 0)
      goto LABEL_135;
    goto LABEL_173;
  }
LABEL_172:
  v55[56] = self->_numLightProfilesWithNaturalLightingEnabled;
  *((_QWORD *)v55 + 49) |= 0x100000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x400000000000) == 0)
  {
LABEL_135:
    if ((v53 & 0x10000000000000) == 0)
      goto LABEL_136;
    goto LABEL_174;
  }
LABEL_173:
  v55[58] = self->_numLightProfilesWithNaturalLightingUsed;
  *((_QWORD *)v55 + 49) |= 0x400000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x10000000000000) == 0)
  {
LABEL_136:
    if ((v53 & 0x4000000000000) == 0)
      goto LABEL_137;
    goto LABEL_175;
  }
LABEL_174:
  v55[64] = self->_numNoeBRs;
  *((_QWORD *)v55 + 49) |= 0x10000000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x4000000000000) == 0)
  {
LABEL_137:
    if ((v53 & 0x20000000000000) == 0)
      goto LABEL_138;
    goto LABEL_176;
  }
LABEL_175:
  v55[62] = self->_numNoeAccessories;
  *((_QWORD *)v55 + 49) |= 0x4000000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x20000000000000) == 0)
  {
LABEL_138:
    if ((v53 & 0x100000000000000) == 0)
      goto LABEL_139;
    goto LABEL_177;
  }
LABEL_176:
  v55[65] = self->_numNoeFullCap;
  *((_QWORD *)v55 + 49) |= 0x20000000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x100000000000000) == 0)
  {
LABEL_139:
    if ((v53 & 0x40000000000000) == 0)
      goto LABEL_140;
    goto LABEL_178;
  }
LABEL_177:
  v55[68] = self->_numNoeSleepCap;
  *((_QWORD *)v55 + 49) |= 0x100000000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x40000000000000) == 0)
  {
LABEL_140:
    if ((v53 & 0x80000000000000) == 0)
      goto LABEL_141;
    goto LABEL_179;
  }
LABEL_178:
  v55[66] = self->_numNoeMinCap;
  *((_QWORD *)v55 + 49) |= 0x40000000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x80000000000000) == 0)
  {
LABEL_141:
    if ((v53 & 0x8000000000000) == 0)
      goto LABEL_142;
    goto LABEL_180;
  }
LABEL_179:
  v55[67] = self->_numNoeRoutCap;
  *((_QWORD *)v55 + 49) |= 0x80000000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x8000000000000) == 0)
  {
LABEL_142:
    if ((v54 & 0x8000) == 0)
      goto LABEL_143;
    goto LABEL_181;
  }
LABEL_180:
  v55[63] = self->_numNoeBRCap;
  *((_QWORD *)v55 + 49) |= 0x8000000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v54 & 0x8000) == 0)
  {
LABEL_143:
    if ((v53 & 0x1000000000) == 0)
      goto LABEL_144;
    goto LABEL_182;
  }
LABEL_181:
  *((_BYTE *)v55 + 384) = self->_autoThirdPartyJetEnable;
  v68 = *((_BYTE *)v55 + 402);
  *((_WORD *)v55 + 200) |= 0x8000u;
  *((_BYTE *)v55 + 402) = v68;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x1000000000) == 0)
  {
LABEL_144:
    if ((v53 & 0x10000000000) == 0)
      goto LABEL_145;
    goto LABEL_183;
  }
LABEL_182:
  v55[48] = self->_numHAPBLEAccessoriesSupportJet;
  *((_QWORD *)v55 + 49) |= 0x1000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x10000000000) == 0)
  {
LABEL_145:
    if ((v53 & 0x20000000000) == 0)
      goto LABEL_146;
    goto LABEL_184;
  }
LABEL_183:
  v55[52] = self->_numHAPIPAccessoriesSupportJet;
  *((_QWORD *)v55 + 49) |= 0x10000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x20000000000) == 0)
  {
LABEL_146:
    if ((v53 & 8) == 0)
      goto LABEL_147;
    goto LABEL_185;
  }
LABEL_184:
  v55[53] = self->_numHAPNoeAccessoriesSupportJet;
  *((_QWORD *)v55 + 49) |= 0x20000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 8) == 0)
  {
LABEL_147:
    if ((v53 & 4) == 0)
      goto LABEL_148;
    goto LABEL_186;
  }
LABEL_185:
  v55[12] = self->_homeCreationCohortWeek;
  *((_QWORD *)v55 + 49) |= 8uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 4) == 0)
  {
LABEL_148:
    if ((v53 & 1) == 0)
      goto LABEL_149;
    goto LABEL_187;
  }
LABEL_186:
  v55[6] = self->_firstHAPAccessoryAddedCohortWeek;
  *((_QWORD *)v55 + 49) |= 4uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 1) == 0)
  {
LABEL_149:
    if ((v53 & 0x8000000000000000) == 0)
      goto LABEL_150;
    goto LABEL_188;
  }
LABEL_187:
  v55[2] = self->_currentMediaAccessoryFallbackMediaUserType;
  *((_QWORD *)v55 + 49) |= 1uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x8000000000000000) == 0)
  {
LABEL_150:
    if ((v53 & 0x4000000000000000) == 0)
      goto LABEL_151;
    goto LABEL_189;
  }
LABEL_188:
  v55[75] = self->_numPoeCount;
  *((_QWORD *)v55 + 49) |= 0x8000000000000000;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x4000000000000000) == 0)
  {
LABEL_151:
    if ((v53 & 0x1000000000000) == 0)
      goto LABEL_152;
    goto LABEL_190;
  }
LABEL_189:
  v55[74] = self->_numPoe2Count;
  *((_QWORD *)v55 + 49) |= 0x4000000000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x1000000000000) == 0)
  {
LABEL_152:
    if ((v53 & 0x2000000000000) == 0)
      goto LABEL_153;
    goto LABEL_191;
  }
LABEL_190:
  v55[60] = self->_numMoe1Accessories;
  *((_QWORD *)v55 + 49) |= 0x1000000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x2000000000000) == 0)
  {
LABEL_153:
    if ((v53 & 0x10) == 0)
      goto LABEL_154;
    goto LABEL_192;
  }
LABEL_191:
  v55[61] = self->_numMoe2Accessories;
  *((_QWORD *)v55 + 49) |= 0x2000000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x10) == 0)
  {
LABEL_154:
    if ((v53 & 0x80000000000) == 0)
      goto LABEL_155;
    goto LABEL_193;
  }
LABEL_192:
  v55[16] = self->_homepodSynchLatency;
  *((_QWORD *)v55 + 49) |= 0x10uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x80000000000) == 0)
  {
LABEL_155:
    if ((v53 & 0x100000) == 0)
      goto LABEL_156;
    goto LABEL_194;
  }
LABEL_193:
  v55[55] = self->_numHomePods;
  *((_QWORD *)v55 + 49) |= 0x80000000000uLL;
  v54 = *((_WORD *)&self->_has + 4);
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x100000) == 0)
  {
LABEL_156:
    if ((v54 & 0x2000) == 0)
      goto LABEL_157;
    goto LABEL_195;
  }
LABEL_194:
  v55[32] = self->_numBSPs;
  *((_QWORD *)v55 + 49) |= 0x100000uLL;
  v53 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x2000) == 0)
  {
LABEL_157:
    if ((v53 & 0x800000000000000) == 0)
      goto LABEL_158;
    goto LABEL_196;
  }
LABEL_195:
  v55[89] = self->_numWoLAccessories;
  v69 = *((_BYTE *)v55 + 402);
  *((_WORD *)v55 + 200) |= 0x2000u;
  *((_BYTE *)v55 + 402) = v69;
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x800000000000000) == 0)
  {
LABEL_158:
    if ((v53 & 0x1000000000000000) == 0)
      goto LABEL_159;
    goto LABEL_197;
  }
LABEL_196:
  v55[71] = self->_numOfParticipantsHaveAccepted;
  *((_QWORD *)v55 + 49) |= 0x800000000000000uLL;
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x1000000000000000) == 0)
  {
LABEL_159:
    if ((v53 & 0x2000000000000000) == 0)
      goto LABEL_160;
    goto LABEL_198;
  }
LABEL_197:
  v55[72] = self->_numOfParticipantsHaveCloudShareIDAndHaveAccepted;
  *((_QWORD *)v55 + 49) |= 0x1000000000000000uLL;
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x2000000000000000) == 0)
  {
LABEL_160:
    if ((v53 & 0x400000000000000) == 0)
      goto LABEL_161;
LABEL_199:
    v55[70] = self->_numOfNonAcceptedParticipantsWithKnownCapability;
    *((_QWORD *)v55 + 49) |= 0x400000000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x40000) == 0)
      goto LABEL_163;
    goto LABEL_162;
  }
LABEL_198:
  v55[73] = self->_numOfParticipantsHaveCloudShareIDButNotAccepted;
  *((_QWORD *)v55 + 49) |= 0x2000000000000000uLL;
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x400000000000000) != 0)
    goto LABEL_199;
LABEL_161:
  if ((v53 & 0x40000) != 0)
  {
LABEL_162:
    v55[30] = self->_numAppleTV4K2ndGenAccessories;
    *((_QWORD *)v55 + 49) |= 0x40000uLL;
  }
LABEL_163:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t has;
  int v8;
  char v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  $973D7089A3FD407A0279E2D4C7E02544 *p_has;
  uint64_t v17;
  int v18;
  char v19;
  int v20;
  char v21;
  int v22;
  char v23;
  int v24;
  char v25;
  int v26;
  char v27;
  int v28;
  char v29;
  int v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  $973D7089A3FD407A0279E2D4C7E02544 *v40;
  uint64_t v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  NSMutableArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t n;
  void *v59;
  NSMutableArray *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t ii;
  void *v65;
  uint64_t v66;
  __int16 v67;
  char v68;
  int v69;
  char v70;
  int v71;
  unsigned int v72;
  int v73;
  char v74;
  int v75;
  unsigned int v76;
  char v77;
  char v78;
  id v79;
  char v81;
  char v82;
  char v83;
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
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (uint64_t)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_numAccessories;
    *(_QWORD *)(v5 + 392) |= 0x40uLL;
    v8 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x10) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 320) = self->_numServices;
    v9 = *(_BYTE *)(v5 + 402);
    *(_WORD *)(v5 + 400) |= 0x10u;
    *(_BYTE *)(v5 + 402) = v9;
    v8 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (uint64_t)self->_has;
  }
LABEL_6:
  if ((v8 & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 348) = self->_numUsers;
    v19 = *(_BYTE *)(v5 + 402);
    *(_WORD *)(v5 + 400) |= 0x800u;
    *(_BYTE *)(v5 + 402) = v19;
    v8 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (uint64_t)self->_has;
    if ((has & 0x8000) == 0)
    {
LABEL_8:
      if ((v8 & 8) == 0)
        goto LABEL_9;
      goto LABEL_33;
    }
  }
  else if ((has & 0x8000) == 0)
  {
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 108) = self->_numAdmins;
  *(_QWORD *)(v5 + 392) |= 0x8000uLL;
  v20 = *((unsigned __int16 *)&self->_has + 4);
  v8 = v20 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v20 & 8) == 0)
  {
LABEL_9:
    if ((v8 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v5 + 316) = self->_numScenes;
  v21 = *(_BYTE *)(v5 + 402);
  *(_WORD *)(v5 + 400) |= 8u;
  *(_BYTE *)(v5 + 402) = v21;
  v22 = *((unsigned __int16 *)&self->_has + 4);
  v8 = v22 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v22 & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x400000000) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v5 + 344) = self->_numTriggers;
  v23 = *(_BYTE *)(v5 + 402);
  *(_WORD *)(v5 + 400) |= 0x400u;
  *(_BYTE *)(v5 + 402) = v23;
  v8 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_11:
    if ((v8 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 184) = self->_numEventTriggers;
  *(_QWORD *)(v5 + 392) |= 0x400000000uLL;
  v24 = *((unsigned __int16 *)&self->_has + 4);
  v8 = v24 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v24 & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v5 + 336) = self->_numTimerTriggers;
  v25 = *(_BYTE *)(v5 + 402);
  *(_WORD *)(v5 + 400) |= 0x100u;
  *(_BYTE *)(v5 + 402) = v25;
  v8 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((v8 & 4) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 104) = self->_numAccessoryServiceGroups;
  *(_QWORD *)(v5 + 392) |= 0x4000uLL;
  v26 = *((unsigned __int16 *)&self->_has + 4);
  v8 = v26 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v26 & 4) == 0)
  {
LABEL_14:
    if ((v8 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v5 + 312) = self->_numRooms;
  v27 = *(_BYTE *)(v5 + 402);
  *(_WORD *)(v5 + 400) |= 4u;
  *(_BYTE *)(v5 + 402) = v27;
  v28 = *((unsigned __int16 *)&self->_has + 4);
  v8 = v28 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v28 & 0x4000) == 0)
  {
LABEL_15:
    if ((v8 & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v5 + 360) = self->_numZones;
  v29 = *(_BYTE *)(v5 + 402);
  *(_WORD *)(v5 + 400) |= 0x4000u;
  *(_BYTE *)(v5 + 402) = v29;
  v8 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((v8 & 0x40000) == 0)
  {
LABEL_16:
    if ((v8 & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  *(_BYTE *)(v5 + 387) = self->_isResidentAvailable;
  v30 = *(unsigned __int16 *)(v5 + 400);
  v31 = (v30 | (*(unsigned __int8 *)(v5 + 402) << 16) | 0x40000u) >> 16;
  *(_WORD *)(v5 + 400) = v30;
  *(_BYTE *)(v5 + 402) = v31;
  has = (uint64_t)self->_has;
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x20000) == 0)
  {
LABEL_17:
    if ((has & 0x200000) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  *(_BYTE *)(v5 + 386) = self->_isPrimaryResident;
  v32 = *(unsigned __int16 *)(v5 + 400);
  v33 = (v32 | (*(unsigned __int8 *)(v5 + 402) << 16) | 0x20000u) >> 16;
  *(_WORD *)(v5 + 400) = v32;
  *(_BYTE *)(v5 + 402) = v33;
  has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_18:
    if ((has & 0x200000000000000) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 132) = self->_numBridgedAccessories;
  *(_QWORD *)(v5 + 392) |= 0x200000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000000000000) == 0)
  {
LABEL_19:
    if ((has & 0x40000000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_43:
  *(_DWORD *)(v5 + 276) = self->_numNotCertifiedAccessories;
  *(_QWORD *)(v5 + 392) |= 0x200000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
  {
LABEL_20:
    *(_DWORD *)(v5 + 168) = self->_numCertifiedAccessories;
    *(_QWORD *)(v5 + 392) |= 0x40000000uLL;
  }
LABEL_21:
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v10 = self->_eventTriggers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v105 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addEventTriggers:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
    }
    while (v12);
  }

  p_has = &self->_has;
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x800000000) != 0)
  {
    *(_DWORD *)(v6 + 188) = self->_numHAPAccessories;
    *(_QWORD *)(v6 + 392) |= 0x800000000uLL;
    v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v17 = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x20000) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
  v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v17 & 0x20000) != 0)
  {
LABEL_46:
    *(_DWORD *)(v6 + 116) = self->_numAppleMediaAccessories;
    *(_QWORD *)(v6 + 392) |= 0x20000uLL;
    v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v17 = (uint64_t)self->_has;
  }
LABEL_47:
  if ((v18 & 0x1000) != 0)
  {
    *(_DWORD *)(v6 + 352) = self->_numWholeHouseAudioAccessories;
    v68 = *(_BYTE *)(v6 + 402);
    *(_WORD *)(v6 + 400) |= 0x1000u;
    *(_BYTE *)(v6 + 402) = v68;
    v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v17 = (uint64_t)self->_has;
    if ((v17 & 0x10000) == 0)
    {
LABEL_49:
      if ((v17 & 0x80000) == 0)
        goto LABEL_50;
      goto LABEL_116;
    }
  }
  else if ((v17 & 0x10000) == 0)
  {
    goto LABEL_49;
  }
  *(_DWORD *)(v6 + 112) = self->_numAppleAudioAccessories;
  *(_QWORD *)(v6 + 392) |= 0x10000uLL;
  v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x80000) == 0)
  {
LABEL_50:
    if ((v17 & 0x800000) == 0)
      goto LABEL_51;
    goto LABEL_117;
  }
LABEL_116:
  *(_DWORD *)(v6 + 124) = self->_numAppleTVAccessories;
  *(_QWORD *)(v6 + 392) |= 0x80000uLL;
  v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x800000) == 0)
  {
LABEL_51:
    if ((v17 & 0x800000000000) == 0)
      goto LABEL_52;
    goto LABEL_118;
  }
LABEL_117:
  *(_DWORD *)(v6 + 140) = self->_numCameraAccessories;
  *(_QWORD *)(v6 + 392) |= 0x800000uLL;
  v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x800000000000) == 0)
  {
LABEL_52:
    if ((v18 & 0x40) == 0)
      goto LABEL_53;
    goto LABEL_119;
  }
LABEL_118:
  *(_DWORD *)(v6 + 236) = self->_numMediaSystems;
  *(_QWORD *)(v6 + 392) |= 0x800000000000uLL;
  v69 = *((unsigned __int16 *)&self->_has + 4);
  v18 = v69 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v17 = (uint64_t)self->_has;
  if ((v69 & 0x40) == 0)
  {
LABEL_53:
    if ((v17 & 0x100000000) == 0)
      goto LABEL_54;
    goto LABEL_120;
  }
LABEL_119:
  *(_DWORD *)(v6 + 328) = self->_numTargetControllers;
  v70 = *(_BYTE *)(v6 + 402);
  *(_WORD *)(v6 + 400) |= 0x40u;
  *(_BYTE *)(v6 + 402) = v70;
  v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x100000000) == 0)
  {
LABEL_54:
    if ((v17 & 0x400000) == 0)
      goto LABEL_55;
    goto LABEL_121;
  }
LABEL_120:
  *(_DWORD *)(v6 + 176) = self->_numCertifiedTargetControllers;
  *(_QWORD *)(v6 + 392) |= 0x100000000uLL;
  v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x400000) == 0)
  {
LABEL_55:
    if ((v17 & 0x80000000) == 0)
      goto LABEL_56;
    goto LABEL_122;
  }
LABEL_121:
  *(_DWORD *)(v6 + 136) = self->_numBridgedTargetControllers;
  *(_QWORD *)(v6 + 392) |= 0x400000uLL;
  v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x80000000) == 0)
  {
LABEL_56:
    if ((v17 & 0x200000000) == 0)
      goto LABEL_57;
    goto LABEL_123;
  }
LABEL_122:
  *(_DWORD *)(v6 + 172) = self->_numCertifiedBridgedTargetControllers;
  *(_QWORD *)(v6 + 392) |= 0x80000000uLL;
  v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x200000000) == 0)
  {
LABEL_57:
    if ((v18 & 0x10000) == 0)
      goto LABEL_58;
    goto LABEL_124;
  }
LABEL_123:
  *(_DWORD *)(v6 + 180) = self->_numConfiguredScenes;
  *(_QWORD *)(v6 + 392) |= 0x200000000uLL;
  v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v17 = (uint64_t)self->_has;
  if ((v18 & 0x10000) == 0)
  {
LABEL_58:
    if ((v18 & 2) == 0)
      goto LABEL_59;
    goto LABEL_125;
  }
LABEL_124:
  *(_BYTE *)(v6 + 385) = self->_isOwner;
  v71 = *(unsigned __int16 *)(v6 + 400);
  v72 = (v71 | (*(unsigned __int8 *)(v6 + 402) << 16) | 0x10000u) >> 16;
  *(_WORD *)(v6 + 400) = v71;
  *(_BYTE *)(v6 + 402) = v72;
  v73 = *((unsigned __int16 *)&self->_has + 4);
  v18 = v73 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v17 = (uint64_t)self->_has;
  if ((v73 & 2) == 0)
  {
LABEL_59:
    if ((v18 & 0x80000) == 0)
      goto LABEL_60;
    goto LABEL_126;
  }
LABEL_125:
  *(_DWORD *)(v6 + 308) = self->_numResidentsEnabled;
  v74 = *(_BYTE *)(v6 + 402);
  *(_WORD *)(v6 + 400) |= 2u;
  *(_BYTE *)(v6 + 402) = v74;
  v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v17 = (uint64_t)self->_has;
  if ((v18 & 0x80000) == 0)
  {
LABEL_60:
    if ((v18 & 0x80) == 0)
      goto LABEL_61;
    goto LABEL_127;
  }
LABEL_126:
  *(_BYTE *)(v6 + 388) = self->_primaryReportingDevice;
  v75 = *(unsigned __int16 *)(v6 + 400);
  v76 = (v75 | (*(unsigned __int8 *)(v6 + 402) << 16) | 0x80000u) >> 16;
  *(_WORD *)(v6 + 400) = v75;
  *(_BYTE *)(v6 + 402) = v76;
  LOBYTE(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
  {
LABEL_61:
    if ((v17 & 0x20) == 0)
      goto LABEL_62;
    goto LABEL_128;
  }
LABEL_127:
  *(_DWORD *)(v6 + 332) = self->_numTelevisionAccessories;
  v77 = *(_BYTE *)(v6 + 402);
  *(_WORD *)(v6 + 400) |= 0x80u;
  *(_BYTE *)(v6 + 402) = v77;
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x20) == 0)
  {
LABEL_62:
    if ((v17 & 0x2000) == 0)
      goto LABEL_63;
    goto LABEL_129;
  }
LABEL_128:
  *(_DWORD *)(v6 + 68) = self->_networkProtectionStatus;
  *(_QWORD *)(v6 + 392) |= 0x20uLL;
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x2000) == 0)
  {
LABEL_63:
    if ((v17 & 0x80) == 0)
      goto LABEL_64;
    goto LABEL_130;
  }
LABEL_129:
  *(_DWORD *)(v6 + 100) = self->_numAccessoriesWiFiPPSKCredential;
  *(_QWORD *)(v6 + 392) |= 0x2000uLL;
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x80) == 0)
  {
LABEL_64:
    if ((v17 & 0x200) == 0)
      goto LABEL_65;
    goto LABEL_131;
  }
LABEL_130:
  *(_DWORD *)(v6 + 76) = self->_numAccessoriesNetworkProtectionAutoFullAccess;
  *(_QWORD *)(v6 + 392) |= 0x80uLL;
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x200) == 0)
  {
LABEL_65:
    if ((v17 & 0x100) == 0)
      goto LABEL_66;
    goto LABEL_132;
  }
LABEL_131:
  *(_DWORD *)(v6 + 84) = self->_numAccessoriesNetworkProtectionAutoProtectedMainLAN;
  *(_QWORD *)(v6 + 392) |= 0x200uLL;
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x100) == 0)
  {
LABEL_66:
    if ((v17 & 0x400) == 0)
      goto LABEL_67;
    goto LABEL_133;
  }
LABEL_132:
  *(_DWORD *)(v6 + 80) = self->_numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN;
  *(_QWORD *)(v6 + 392) |= 0x100uLL;
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x400) == 0)
  {
LABEL_67:
    if ((v17 & 0x800) == 0)
      goto LABEL_68;
    goto LABEL_134;
  }
LABEL_133:
  *(_DWORD *)(v6 + 88) = self->_numAccessoriesNetworkProtectionFullAccess;
  *(_QWORD *)(v6 + 392) |= 0x400uLL;
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x800) == 0)
  {
LABEL_68:
    if ((v17 & 0x1000) == 0)
      goto LABEL_69;
    goto LABEL_135;
  }
LABEL_134:
  *(_DWORD *)(v6 + 92) = self->_numAccessoriesNetworkProtectionHomeKitOnly;
  *(_QWORD *)(v6 + 392) |= 0x800uLL;
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x1000) == 0)
  {
LABEL_69:
    if ((v18 & 0x20) == 0)
      goto LABEL_71;
    goto LABEL_70;
  }
LABEL_135:
  *(_DWORD *)(v6 + 96) = self->_numAccessoriesNetworkProtectionUnprotected;
  *(_QWORD *)(v6 + 392) |= 0x1000uLL;
  if ((*((_WORD *)&self->_has + 4) & 0x20) != 0)
  {
LABEL_70:
    *(_DWORD *)(v6 + 324) = self->_numShortcuts;
    *(_WORD *)(v6 + 400) |= 0x20u;
  }
LABEL_71:
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v34 = self->_homeKitMultiUserSettings;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v101;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v101 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addHomeKitMultiUserSettings:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
    }
    while (v36);
  }

  v40 = &self->_has;
  v41 = (uint64_t)self->_has;
  if ((v41 & 0x8000000000) != 0)
  {
    *(_DWORD *)(v6 + 204) = self->_numHAPIPAccessories;
    *(_QWORD *)(v6 + 392) |= 0x8000000000uLL;
    v41 = *(_QWORD *)v40;
    if ((*(_QWORD *)v40 & 0x2000000000) == 0)
    {
LABEL_80:
      if ((v41 & 0x4000000000) == 0)
        goto LABEL_81;
      goto LABEL_139;
    }
  }
  else if ((v41 & 0x2000000000) == 0)
  {
    goto LABEL_80;
  }
  *(_DWORD *)(v6 + 196) = self->_numHAPBTAccessories;
  *(_QWORD *)(v6 + 392) |= 0x2000000000uLL;
  v41 = (uint64_t)self->_has;
  if ((v41 & 0x4000000000) == 0)
  {
LABEL_81:
    if ((v41 & 0x10000000) == 0)
      goto LABEL_83;
    goto LABEL_82;
  }
LABEL_139:
  *(_DWORD *)(v6 + 200) = self->_numHAPBatteryServiceAccessories;
  *(_QWORD *)(v6 + 392) |= 0x4000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_82:
    *(_DWORD *)(v6 + 160) = self->_numCameraAccessoriesSupportRecording;
    *(_QWORD *)(v6 + 392) |= 0x10000000uLL;
  }
LABEL_83:
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v42 = self->_hapServicesLists;
  v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v97;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v97 != v45)
          objc_enumerationMutation(v42);
        v47 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addHapServicesList:", v47);

      }
      v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
    }
    while (v44);
  }

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v48 = self->_primaryHAPServicesLists;
  v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v93;
    do
    {
      for (m = 0; m != v50; ++m)
      {
        if (*(_QWORD *)v93 != v51)
          objc_enumerationMutation(v48);
        v53 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPrimaryHAPServicesList:", v53);

      }
      v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
    }
    while (v50);
  }

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v54 = self->_hapServicesListCertifieds;
  v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v88, v109, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v89;
    do
    {
      for (n = 0; n != v56; ++n)
      {
        if (*(_QWORD *)v89 != v57)
          objc_enumerationMutation(v54);
        v59 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addHapServicesListCertified:", v59);

      }
      v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v88, v109, 16);
    }
    while (v56);
  }

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v60 = self->_primaryHAPServicesListCertifieds;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v84, v108, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v85;
    do
    {
      for (ii = 0; ii != v62; ++ii)
      {
        if (*(_QWORD *)v85 != v63)
          objc_enumerationMutation(v60);
        v65 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * ii), "copyWithZone:", a3, (_QWORD)v84);
        objc_msgSend((id)v6, "addPrimaryHAPServicesListCertified:", v65);

      }
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v84, v108, 16);
    }
    while (v62);
  }

  v66 = (uint64_t)self->_has;
  if ((v66 & 0x40000000000) != 0)
  {
    *(_DWORD *)(v6 + 216) = self->_numHAPSpeakerServiceAccessories;
    *(_QWORD *)(v6 + 392) |= 0x40000000000uLL;
    v67 = *((_WORD *)&self->_has + 4);
    v66 = (uint64_t)self->_has;
    if ((v67 & 1) == 0)
      goto LABEL_143;
    goto LABEL_142;
  }
  v67 = *((_WORD *)&self->_has + 4);
  if ((v67 & 1) != 0)
  {
LABEL_142:
    *(_DWORD *)(v6 + 304) = self->_numPrimaryHAPSpeakerServiceAccessories;
    v78 = *(_BYTE *)(v6 + 402);
    *(_WORD *)(v6 + 400) |= 1u;
    *(_BYTE *)(v6 + 402) = v78;
    v67 = *((_WORD *)&self->_has + 4);
    v66 = (uint64_t)self->_has;
  }
LABEL_143:
  if ((v67 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 340) = self->_numTriggerOwnedConfiguredScenes;
    v81 = *(_BYTE *)(v6 + 402);
    *(_WORD *)(v6 + 400) |= 0x200u;
    *(_BYTE *)(v6 + 402) = v81;
    v67 = *((_WORD *)&self->_has + 4);
    v66 = (uint64_t)self->_has;
    if ((v66 & 0x4000000) == 0)
    {
LABEL_145:
      if ((v66 & 0x2000000) == 0)
        goto LABEL_146;
      goto LABEL_184;
    }
  }
  else if ((v66 & 0x4000000) == 0)
  {
    goto LABEL_145;
  }
  *(_DWORD *)(v6 + 152) = self->_numCameraAccessoriesRecordingEnabled;
  *(_QWORD *)(v6 + 392) |= 0x4000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x2000000) == 0)
  {
LABEL_146:
    if ((v66 & 0x8000000) == 0)
      goto LABEL_147;
    goto LABEL_185;
  }
LABEL_184:
  *(_DWORD *)(v6 + 148) = self->_numCameraAccessoriesRecordingAudioEnabled;
  *(_QWORD *)(v6 + 392) |= 0x2000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x8000000) == 0)
  {
LABEL_147:
    if ((v66 & 0x1000000) == 0)
      goto LABEL_148;
    goto LABEL_186;
  }
LABEL_185:
  *(_DWORD *)(v6 + 156) = self->_numCameraAccessoriesSmartBulletinNotificationEnabled;
  *(_QWORD *)(v6 + 392) |= 0x8000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x1000000) == 0)
  {
LABEL_148:
    if ((v66 & 0x20000000) == 0)
      goto LABEL_149;
    goto LABEL_187;
  }
LABEL_186:
  *(_DWORD *)(v6 + 144) = self->_numCameraAccessoriesReachabilityNotificationEnabled;
  *(_QWORD *)(v6 + 392) |= 0x1000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x20000000) == 0)
  {
LABEL_149:
    if ((v66 & 2) == 0)
      goto LABEL_150;
    goto LABEL_188;
  }
LABEL_187:
  *(_DWORD *)(v6 + 164) = self->_numCameraAccessoriesWithActivityZonesEnabled;
  *(_QWORD *)(v6 + 392) |= 0x20000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 2) == 0)
  {
LABEL_150:
    if ((v66 & 0x200000000000) == 0)
      goto LABEL_151;
    goto LABEL_189;
  }
LABEL_188:
  *(_DWORD *)(v6 + 12) = self->_enabledResidentsDeviceCapabilities;
  *(_QWORD *)(v6 + 392) |= 2uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x200000000000) == 0)
  {
LABEL_151:
    if ((v66 & 0x100000000000) == 0)
      goto LABEL_152;
    goto LABEL_190;
  }
LABEL_189:
  *(_DWORD *)(v6 + 228) = self->_numLightProfilesWithNaturalLightingSupported;
  *(_QWORD *)(v6 + 392) |= 0x200000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x100000000000) == 0)
  {
LABEL_152:
    if ((v66 & 0x400000000000) == 0)
      goto LABEL_153;
    goto LABEL_191;
  }
LABEL_190:
  *(_DWORD *)(v6 + 224) = self->_numLightProfilesWithNaturalLightingEnabled;
  *(_QWORD *)(v6 + 392) |= 0x100000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x400000000000) == 0)
  {
LABEL_153:
    if ((v66 & 0x10000000000000) == 0)
      goto LABEL_154;
    goto LABEL_192;
  }
LABEL_191:
  *(_DWORD *)(v6 + 232) = self->_numLightProfilesWithNaturalLightingUsed;
  *(_QWORD *)(v6 + 392) |= 0x400000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x10000000000000) == 0)
  {
LABEL_154:
    if ((v66 & 0x4000000000000) == 0)
      goto LABEL_155;
    goto LABEL_193;
  }
LABEL_192:
  *(_DWORD *)(v6 + 256) = self->_numNoeBRs;
  *(_QWORD *)(v6 + 392) |= 0x10000000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x4000000000000) == 0)
  {
LABEL_155:
    if ((v66 & 0x20000000000000) == 0)
      goto LABEL_156;
    goto LABEL_194;
  }
LABEL_193:
  *(_DWORD *)(v6 + 248) = self->_numNoeAccessories;
  *(_QWORD *)(v6 + 392) |= 0x4000000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x20000000000000) == 0)
  {
LABEL_156:
    if ((v66 & 0x100000000000000) == 0)
      goto LABEL_157;
    goto LABEL_195;
  }
LABEL_194:
  *(_DWORD *)(v6 + 260) = self->_numNoeFullCap;
  *(_QWORD *)(v6 + 392) |= 0x20000000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x100000000000000) == 0)
  {
LABEL_157:
    if ((v66 & 0x40000000000000) == 0)
      goto LABEL_158;
    goto LABEL_196;
  }
LABEL_195:
  *(_DWORD *)(v6 + 272) = self->_numNoeSleepCap;
  *(_QWORD *)(v6 + 392) |= 0x100000000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x40000000000000) == 0)
  {
LABEL_158:
    if ((v66 & 0x80000000000000) == 0)
      goto LABEL_159;
    goto LABEL_197;
  }
LABEL_196:
  *(_DWORD *)(v6 + 264) = self->_numNoeMinCap;
  *(_QWORD *)(v6 + 392) |= 0x40000000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x80000000000000) == 0)
  {
LABEL_159:
    if ((v66 & 0x8000000000000) == 0)
      goto LABEL_160;
    goto LABEL_198;
  }
LABEL_197:
  *(_DWORD *)(v6 + 268) = self->_numNoeRoutCap;
  *(_QWORD *)(v6 + 392) |= 0x80000000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x8000000000000) == 0)
  {
LABEL_160:
    if ((v67 & 0x8000) == 0)
      goto LABEL_161;
    goto LABEL_199;
  }
LABEL_198:
  *(_DWORD *)(v6 + 252) = self->_numNoeBRCap;
  *(_QWORD *)(v6 + 392) |= 0x8000000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v67 & 0x8000) == 0)
  {
LABEL_161:
    if ((v66 & 0x1000000000) == 0)
      goto LABEL_162;
    goto LABEL_200;
  }
LABEL_199:
  *(_BYTE *)(v6 + 384) = self->_autoThirdPartyJetEnable;
  v82 = *(_BYTE *)(v6 + 402);
  *(_WORD *)(v6 + 400) |= 0x8000u;
  *(_BYTE *)(v6 + 402) = v82;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x1000000000) == 0)
  {
LABEL_162:
    if ((v66 & 0x10000000000) == 0)
      goto LABEL_163;
    goto LABEL_201;
  }
LABEL_200:
  *(_DWORD *)(v6 + 192) = self->_numHAPBLEAccessoriesSupportJet;
  *(_QWORD *)(v6 + 392) |= 0x1000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x10000000000) == 0)
  {
LABEL_163:
    if ((v66 & 0x20000000000) == 0)
      goto LABEL_164;
    goto LABEL_202;
  }
LABEL_201:
  *(_DWORD *)(v6 + 208) = self->_numHAPIPAccessoriesSupportJet;
  *(_QWORD *)(v6 + 392) |= 0x10000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x20000000000) == 0)
  {
LABEL_164:
    if ((v66 & 8) == 0)
      goto LABEL_165;
    goto LABEL_203;
  }
LABEL_202:
  *(_DWORD *)(v6 + 212) = self->_numHAPNoeAccessoriesSupportJet;
  *(_QWORD *)(v6 + 392) |= 0x20000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 8) == 0)
  {
LABEL_165:
    if ((v66 & 4) == 0)
      goto LABEL_166;
    goto LABEL_204;
  }
LABEL_203:
  *(_DWORD *)(v6 + 48) = self->_homeCreationCohortWeek;
  *(_QWORD *)(v6 + 392) |= 8uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 4) == 0)
  {
LABEL_166:
    if ((v66 & 1) == 0)
      goto LABEL_167;
    goto LABEL_205;
  }
LABEL_204:
  *(_DWORD *)(v6 + 24) = self->_firstHAPAccessoryAddedCohortWeek;
  *(_QWORD *)(v6 + 392) |= 4uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 1) == 0)
  {
LABEL_167:
    if ((v66 & 0x8000000000000000) == 0)
      goto LABEL_168;
    goto LABEL_206;
  }
LABEL_205:
  *(_DWORD *)(v6 + 8) = self->_currentMediaAccessoryFallbackMediaUserType;
  *(_QWORD *)(v6 + 392) |= 1uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x8000000000000000) == 0)
  {
LABEL_168:
    if ((v66 & 0x4000000000000000) == 0)
      goto LABEL_169;
    goto LABEL_207;
  }
LABEL_206:
  *(_DWORD *)(v6 + 300) = self->_numPoeCount;
  *(_QWORD *)(v6 + 392) |= 0x8000000000000000;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x4000000000000000) == 0)
  {
LABEL_169:
    if ((v66 & 0x1000000000000) == 0)
      goto LABEL_170;
    goto LABEL_208;
  }
LABEL_207:
  *(_DWORD *)(v6 + 296) = self->_numPoe2Count;
  *(_QWORD *)(v6 + 392) |= 0x4000000000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x1000000000000) == 0)
  {
LABEL_170:
    if ((v66 & 0x2000000000000) == 0)
      goto LABEL_171;
    goto LABEL_209;
  }
LABEL_208:
  *(_DWORD *)(v6 + 240) = self->_numMoe1Accessories;
  *(_QWORD *)(v6 + 392) |= 0x1000000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x2000000000000) == 0)
  {
LABEL_171:
    if ((v66 & 0x10) == 0)
      goto LABEL_172;
    goto LABEL_210;
  }
LABEL_209:
  *(_DWORD *)(v6 + 244) = self->_numMoe2Accessories;
  *(_QWORD *)(v6 + 392) |= 0x2000000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x10) == 0)
  {
LABEL_172:
    if ((v66 & 0x80000000000) == 0)
      goto LABEL_173;
    goto LABEL_211;
  }
LABEL_210:
  *(_DWORD *)(v6 + 64) = self->_homepodSynchLatency;
  *(_QWORD *)(v6 + 392) |= 0x10uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x80000000000) == 0)
  {
LABEL_173:
    if ((v66 & 0x100000) == 0)
      goto LABEL_174;
    goto LABEL_212;
  }
LABEL_211:
  *(_DWORD *)(v6 + 220) = self->_numHomePods;
  *(_QWORD *)(v6 + 392) |= 0x80000000000uLL;
  v67 = *((_WORD *)&self->_has + 4);
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x100000) == 0)
  {
LABEL_174:
    if ((v67 & 0x2000) == 0)
      goto LABEL_175;
    goto LABEL_213;
  }
LABEL_212:
  *(_DWORD *)(v6 + 128) = self->_numBSPs;
  *(_QWORD *)(v6 + 392) |= 0x100000uLL;
  v66 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x2000) == 0)
  {
LABEL_175:
    if ((v66 & 0x800000000000000) == 0)
      goto LABEL_176;
    goto LABEL_214;
  }
LABEL_213:
  *(_DWORD *)(v6 + 356) = self->_numWoLAccessories;
  v83 = *(_BYTE *)(v6 + 402);
  *(_WORD *)(v6 + 400) |= 0x2000u;
  *(_BYTE *)(v6 + 402) = v83;
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x800000000000000) == 0)
  {
LABEL_176:
    if ((v66 & 0x1000000000000000) == 0)
      goto LABEL_177;
    goto LABEL_215;
  }
LABEL_214:
  *(_DWORD *)(v6 + 284) = self->_numOfParticipantsHaveAccepted;
  *(_QWORD *)(v6 + 392) |= 0x800000000000000uLL;
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x1000000000000000) == 0)
  {
LABEL_177:
    if ((v66 & 0x2000000000000000) == 0)
      goto LABEL_178;
    goto LABEL_216;
  }
LABEL_215:
  *(_DWORD *)(v6 + 288) = self->_numOfParticipantsHaveCloudShareIDAndHaveAccepted;
  *(_QWORD *)(v6 + 392) |= 0x1000000000000000uLL;
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x2000000000000000) == 0)
  {
LABEL_178:
    if ((v66 & 0x400000000000000) == 0)
      goto LABEL_179;
LABEL_217:
    *(_DWORD *)(v6 + 280) = self->_numOfNonAcceptedParticipantsWithKnownCapability;
    *(_QWORD *)(v6 + 392) |= 0x400000000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x40000) == 0)
      goto LABEL_181;
    goto LABEL_180;
  }
LABEL_216:
  *(_DWORD *)(v6 + 292) = self->_numOfParticipantsHaveCloudShareIDButNotAccepted;
  *(_QWORD *)(v6 + 392) |= 0x2000000000000000uLL;
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x400000000000000) != 0)
    goto LABEL_217;
LABEL_179:
  if ((v66 & 0x40000) != 0)
  {
LABEL_180:
    *(_DWORD *)(v6 + 120) = self->_numAppleTV4K2ndGenAccessories;
    *(_QWORD *)(v6 + 392) |= 0x40000uLL;
  }
LABEL_181:
  v79 = (id)v6;

  return v79;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  uint64_t has;
  uint64_t v6;
  int v7;
  int v8;
  NSMutableArray *eventTriggers;
  NSMutableArray *homeKitMultiUserSettings;
  NSMutableArray *hapServicesLists;
  NSMutableArray *primaryHAPServicesLists;
  NSMutableArray *hapServicesListCertifieds;
  NSMutableArray *primaryHAPServicesListCertifieds;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 v17;
  BOOL v18;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_451;
  has = (uint64_t)self->_has;
  v6 = *((_QWORD *)v4 + 49);
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_numAccessories != *((_DWORD *)v4 + 18))
      goto LABEL_451;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_451;
  }
  v7 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v8 = v4[200] | (*((unsigned __int8 *)v4 + 402) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x10) != 0)
  {
    if ((v4[200] & 0x10) == 0 || self->_numServices != *((_DWORD *)v4 + 80))
      goto LABEL_451;
  }
  else if ((v4[200] & 0x10) != 0)
  {
    goto LABEL_451;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x800) != 0)
  {
    if ((v4[200] & 0x800) == 0 || self->_numUsers != *((_DWORD *)v4 + 87))
      goto LABEL_451;
  }
  else if ((v4[200] & 0x800) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_numAdmins != *((_DWORD *)v4 + 27))
      goto LABEL_451;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_451;
  }
  if ((*((_WORD *)&self->_has + 4) & 8) != 0)
  {
    if ((v4[200] & 8) == 0 || self->_numScenes != *((_DWORD *)v4 + 79))
      goto LABEL_451;
  }
  else if ((v4[200] & 8) != 0)
  {
    goto LABEL_451;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
  {
    if ((v4[200] & 0x400) == 0 || self->_numTriggers != *((_DWORD *)v4 + 86))
      goto LABEL_451;
  }
  else if ((v4[200] & 0x400) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0 || self->_numEventTriggers != *((_DWORD *)v4 + 46))
      goto LABEL_451;
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_451;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
    if ((v4[200] & 0x100) == 0 || self->_numTimerTriggers != *((_DWORD *)v4 + 84))
      goto LABEL_451;
  }
  else if ((v4[200] & 0x100) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_numAccessoryServiceGroups != *((_DWORD *)v4 + 26))
      goto LABEL_451;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_451;
  }
  if ((*((_WORD *)&self->_has + 4) & 4) != 0)
  {
    if ((v4[200] & 4) == 0 || self->_numRooms != *((_DWORD *)v4 + 78))
      goto LABEL_451;
  }
  else if ((v4[200] & 4) != 0)
  {
    goto LABEL_451;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x4000) != 0)
  {
    if ((v4[200] & 0x4000) == 0 || self->_numZones != *((_DWORD *)v4 + 90))
      goto LABEL_451;
  }
  else if ((v4[200] & 0x4000) != 0)
  {
    goto LABEL_451;
  }
  if ((v7 & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0)
      goto LABEL_451;
    if (self->_isResidentAvailable)
    {
      if (!*((_BYTE *)v4 + 387))
        goto LABEL_451;
    }
    else if (*((_BYTE *)v4 + 387))
    {
      goto LABEL_451;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_451;
  }
  if ((v7 & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0)
      goto LABEL_451;
    if (self->_isPrimaryResident)
    {
      if (!*((_BYTE *)v4 + 386))
        goto LABEL_451;
    }
    else if (*((_BYTE *)v4 + 386))
    {
      goto LABEL_451;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_numBridgedAccessories != *((_DWORD *)v4 + 33))
      goto LABEL_451;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x200000000000000) != 0)
  {
    if ((v6 & 0x200000000000000) == 0 || self->_numNotCertifiedAccessories != *((_DWORD *)v4 + 69))
      goto LABEL_451;
  }
  else if ((v6 & 0x200000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0 || self->_numCertifiedAccessories != *((_DWORD *)v4 + 42))
      goto LABEL_451;
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_451;
  }
  eventTriggers = self->_eventTriggers;
  if ((unint64_t)eventTriggers | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](eventTriggers, "isEqual:"))
      goto LABEL_451;
    v7 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (uint64_t)self->_has;
    v8 = v4[200] | (*((unsigned __int8 *)v4 + 402) << 16);
    v6 = *((_QWORD *)v4 + 49);
  }
  if ((has & 0x800000000) != 0)
  {
    if ((v6 & 0x800000000) == 0 || self->_numHAPAccessories != *((_DWORD *)v4 + 47))
      goto LABEL_451;
  }
  else if ((v6 & 0x800000000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_numAppleMediaAccessories != *((_DWORD *)v4 + 29))
      goto LABEL_451;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_451;
  }
  if ((v7 & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0 || self->_numWholeHouseAudioAccessories != *((_DWORD *)v4 + 88))
      goto LABEL_451;
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_numAppleAudioAccessories != *((_DWORD *)v4 + 28))
      goto LABEL_451;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_numAppleTVAccessories != *((_DWORD *)v4 + 31))
      goto LABEL_451;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_numCameraAccessories != *((_DWORD *)v4 + 35))
      goto LABEL_451;
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x800000000000) != 0)
  {
    if ((v6 & 0x800000000000) == 0 || self->_numMediaSystems != *((_DWORD *)v4 + 59))
      goto LABEL_451;
  }
  else if ((v6 & 0x800000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v7 & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_numTargetControllers != *((_DWORD *)v4 + 82))
      goto LABEL_451;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x100000000) != 0)
  {
    if ((v6 & 0x100000000) == 0 || self->_numCertifiedTargetControllers != *((_DWORD *)v4 + 44))
      goto LABEL_451;
  }
  else if ((v6 & 0x100000000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_numBridgedTargetControllers != *((_DWORD *)v4 + 34))
      goto LABEL_451;
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0 || self->_numCertifiedBridgedTargetControllers != *((_DWORD *)v4 + 43))
      goto LABEL_451;
  }
  else if ((v6 & 0x80000000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x200000000) != 0)
  {
    if ((v6 & 0x200000000) == 0 || self->_numConfiguredScenes != *((_DWORD *)v4 + 45))
      goto LABEL_451;
  }
  else if ((v6 & 0x200000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v7 & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0)
      goto LABEL_451;
    if (self->_isOwner)
    {
      if (!*((_BYTE *)v4 + 385))
        goto LABEL_451;
    }
    else if (*((_BYTE *)v4 + 385))
    {
      goto LABEL_451;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_451;
  }
  if ((v7 & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_numResidentsEnabled != *((_DWORD *)v4 + 77))
      goto LABEL_451;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_451;
  }
  if ((v7 & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0)
      goto LABEL_451;
    if (self->_primaryReportingDevice)
    {
      if (!*((_BYTE *)v4 + 388))
        goto LABEL_451;
    }
    else if (*((_BYTE *)v4 + 388))
    {
      goto LABEL_451;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_451;
  }
  if ((v7 & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_numTelevisionAccessories != *((_DWORD *)v4 + 83))
      goto LABEL_451;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_networkProtectionStatus != *((_DWORD *)v4 + 17))
      goto LABEL_451;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_numAccessoriesWiFiPPSKCredential != *((_DWORD *)v4 + 25))
      goto LABEL_451;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_numAccessoriesNetworkProtectionAutoFullAccess != *((_DWORD *)v4 + 19))
      goto LABEL_451;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_numAccessoriesNetworkProtectionAutoProtectedMainLAN != *((_DWORD *)v4 + 21))
      goto LABEL_451;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN != *((_DWORD *)v4 + 20))
      goto LABEL_451;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_numAccessoriesNetworkProtectionFullAccess != *((_DWORD *)v4 + 22))
      goto LABEL_451;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_numAccessoriesNetworkProtectionHomeKitOnly != *((_DWORD *)v4 + 23))
      goto LABEL_451;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_numAccessoriesNetworkProtectionUnprotected != *((_DWORD *)v4 + 24))
      goto LABEL_451;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_451;
  }
  if ((v7 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_numShortcuts != *((_DWORD *)v4 + 81))
      goto LABEL_451;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_451;
  }
  homeKitMultiUserSettings = self->_homeKitMultiUserSettings;
  if ((unint64_t)homeKitMultiUserSettings | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](homeKitMultiUserSettings, "isEqual:"))
      goto LABEL_451;
    has = (uint64_t)self->_has;
    v6 = *((_QWORD *)v4 + 49);
  }
  if ((has & 0x8000000000) != 0)
  {
    if ((v6 & 0x8000000000) == 0 || self->_numHAPIPAccessories != *((_DWORD *)v4 + 51))
      goto LABEL_451;
  }
  else if ((v6 & 0x8000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x2000000000) != 0)
  {
    if ((v6 & 0x2000000000) == 0 || self->_numHAPBTAccessories != *((_DWORD *)v4 + 49))
      goto LABEL_451;
  }
  else if ((v6 & 0x2000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x4000000000) != 0)
  {
    if ((v6 & 0x4000000000) == 0 || self->_numHAPBatteryServiceAccessories != *((_DWORD *)v4 + 50))
      goto LABEL_451;
  }
  else if ((v6 & 0x4000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_numCameraAccessoriesSupportRecording != *((_DWORD *)v4 + 40))
      goto LABEL_451;
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_451;
  }
  hapServicesLists = self->_hapServicesLists;
  if ((unint64_t)hapServicesLists | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](hapServicesLists, "isEqual:"))
  {
    goto LABEL_451;
  }
  primaryHAPServicesLists = self->_primaryHAPServicesLists;
  if ((unint64_t)primaryHAPServicesLists | *((_QWORD *)v4 + 47))
  {
    if (!-[NSMutableArray isEqual:](primaryHAPServicesLists, "isEqual:"))
      goto LABEL_451;
  }
  hapServicesListCertifieds = self->_hapServicesListCertifieds;
  if ((unint64_t)hapServicesListCertifieds | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](hapServicesListCertifieds, "isEqual:"))
      goto LABEL_451;
  }
  primaryHAPServicesListCertifieds = self->_primaryHAPServicesListCertifieds;
  if ((unint64_t)primaryHAPServicesListCertifieds | *((_QWORD *)v4 + 46))
  {
    if (!-[NSMutableArray isEqual:](primaryHAPServicesListCertifieds, "isEqual:"))
      goto LABEL_451;
  }
  v15 = (uint64_t)self->_has;
  v16 = *((_QWORD *)v4 + 49);
  if ((v15 & 0x40000000000) != 0)
  {
    if ((v16 & 0x40000000000) == 0 || self->_numHAPSpeakerServiceAccessories != *((_DWORD *)v4 + 54))
      goto LABEL_451;
  }
  else if ((v16 & 0x40000000000) != 0)
  {
    goto LABEL_451;
  }
  v17 = v4[200];
  if ((*((_WORD *)&self->_has + 4) & 1) != 0)
  {
    if ((v17 & 1) == 0 || self->_numPrimaryHAPSpeakerServiceAccessories != *((_DWORD *)v4 + 76))
      goto LABEL_451;
  }
  else if ((v17 & 1) != 0)
  {
    goto LABEL_451;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
  {
    if ((v4[200] & 0x200) == 0 || self->_numTriggerOwnedConfiguredScenes != *((_DWORD *)v4 + 85))
      goto LABEL_451;
  }
  else if ((v4[200] & 0x200) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x4000000) != 0)
  {
    if ((v16 & 0x4000000) == 0 || self->_numCameraAccessoriesRecordingEnabled != *((_DWORD *)v4 + 38))
      goto LABEL_451;
  }
  else if ((v16 & 0x4000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x2000000) != 0)
  {
    if ((v16 & 0x2000000) == 0 || self->_numCameraAccessoriesRecordingAudioEnabled != *((_DWORD *)v4 + 37))
      goto LABEL_451;
  }
  else if ((v16 & 0x2000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x8000000) != 0)
  {
    if ((v16 & 0x8000000) == 0 || self->_numCameraAccessoriesSmartBulletinNotificationEnabled != *((_DWORD *)v4 + 39))
      goto LABEL_451;
  }
  else if ((v16 & 0x8000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x1000000) != 0)
  {
    if ((v16 & 0x1000000) == 0 || self->_numCameraAccessoriesReachabilityNotificationEnabled != *((_DWORD *)v4 + 36))
      goto LABEL_451;
  }
  else if ((v16 & 0x1000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x20000000) != 0)
  {
    if ((v16 & 0x20000000) == 0 || self->_numCameraAccessoriesWithActivityZonesEnabled != *((_DWORD *)v4 + 41))
      goto LABEL_451;
  }
  else if ((v16 & 0x20000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 2) != 0)
  {
    if ((v16 & 2) == 0 || self->_enabledResidentsDeviceCapabilities != *((_DWORD *)v4 + 3))
      goto LABEL_451;
  }
  else if ((v16 & 2) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x200000000000) != 0)
  {
    if ((v16 & 0x200000000000) == 0 || self->_numLightProfilesWithNaturalLightingSupported != *((_DWORD *)v4 + 57))
      goto LABEL_451;
  }
  else if ((v16 & 0x200000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x100000000000) != 0)
  {
    if ((v16 & 0x100000000000) == 0 || self->_numLightProfilesWithNaturalLightingEnabled != *((_DWORD *)v4 + 56))
      goto LABEL_451;
  }
  else if ((v16 & 0x100000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x400000000000) != 0)
  {
    if ((v16 & 0x400000000000) == 0 || self->_numLightProfilesWithNaturalLightingUsed != *((_DWORD *)v4 + 58))
      goto LABEL_451;
  }
  else if ((v16 & 0x400000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x10000000000000) != 0)
  {
    if ((v16 & 0x10000000000000) == 0 || self->_numNoeBRs != *((_DWORD *)v4 + 64))
      goto LABEL_451;
  }
  else if ((v16 & 0x10000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x4000000000000) != 0)
  {
    if ((v16 & 0x4000000000000) == 0 || self->_numNoeAccessories != *((_DWORD *)v4 + 62))
      goto LABEL_451;
  }
  else if ((v16 & 0x4000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x20000000000000) != 0)
  {
    if ((v16 & 0x20000000000000) == 0 || self->_numNoeFullCap != *((_DWORD *)v4 + 65))
      goto LABEL_451;
  }
  else if ((v16 & 0x20000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x100000000000000) != 0)
  {
    if ((v16 & 0x100000000000000) == 0 || self->_numNoeSleepCap != *((_DWORD *)v4 + 68))
      goto LABEL_451;
  }
  else if ((v16 & 0x100000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x40000000000000) != 0)
  {
    if ((v16 & 0x40000000000000) == 0 || self->_numNoeMinCap != *((_DWORD *)v4 + 66))
      goto LABEL_451;
  }
  else if ((v16 & 0x40000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x80000000000000) != 0)
  {
    if ((v16 & 0x80000000000000) == 0 || self->_numNoeRoutCap != *((_DWORD *)v4 + 67))
      goto LABEL_451;
  }
  else if ((v16 & 0x80000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x8000000000000) != 0)
  {
    if ((v16 & 0x8000000000000) == 0 || self->_numNoeBRCap != *((_DWORD *)v4 + 63))
      goto LABEL_451;
  }
  else if ((v16 & 0x8000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x8000) != 0)
  {
    if ((v4[200] & 0x8000) == 0)
      goto LABEL_451;
    if (self->_autoThirdPartyJetEnable)
    {
      if (!*((_BYTE *)v4 + 384))
        goto LABEL_451;
    }
    else if (*((_BYTE *)v4 + 384))
    {
      goto LABEL_451;
    }
  }
  else if ((v4[200] & 0x8000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x1000000000) != 0)
  {
    if ((v16 & 0x1000000000) == 0 || self->_numHAPBLEAccessoriesSupportJet != *((_DWORD *)v4 + 48))
      goto LABEL_451;
  }
  else if ((v16 & 0x1000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x10000000000) != 0)
  {
    if ((v16 & 0x10000000000) == 0 || self->_numHAPIPAccessoriesSupportJet != *((_DWORD *)v4 + 52))
      goto LABEL_451;
  }
  else if ((v16 & 0x10000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x20000000000) != 0)
  {
    if ((v16 & 0x20000000000) == 0 || self->_numHAPNoeAccessoriesSupportJet != *((_DWORD *)v4 + 53))
      goto LABEL_451;
  }
  else if ((v16 & 0x20000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 8) != 0)
  {
    if ((v16 & 8) == 0 || self->_homeCreationCohortWeek != *((_DWORD *)v4 + 12))
      goto LABEL_451;
  }
  else if ((v16 & 8) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 4) != 0)
  {
    if ((v16 & 4) == 0 || self->_firstHAPAccessoryAddedCohortWeek != *((_DWORD *)v4 + 6))
      goto LABEL_451;
  }
  else if ((v16 & 4) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 1) != 0)
  {
    if ((v16 & 1) == 0 || self->_currentMediaAccessoryFallbackMediaUserType != *((_DWORD *)v4 + 2))
      goto LABEL_451;
  }
  else if ((v16 & 1) != 0)
  {
    goto LABEL_451;
  }
  if (v15 < 0)
  {
    if ((v16 & 0x8000000000000000) == 0 || self->_numPoeCount != *((_DWORD *)v4 + 75))
      goto LABEL_451;
  }
  else if (v16 < 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x4000000000000000) != 0)
  {
    if ((v16 & 0x4000000000000000) == 0 || self->_numPoe2Count != *((_DWORD *)v4 + 74))
      goto LABEL_451;
  }
  else if ((v16 & 0x4000000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x1000000000000) != 0)
  {
    if ((v16 & 0x1000000000000) == 0 || self->_numMoe1Accessories != *((_DWORD *)v4 + 60))
      goto LABEL_451;
  }
  else if ((v16 & 0x1000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x2000000000000) != 0)
  {
    if ((v16 & 0x2000000000000) == 0 || self->_numMoe2Accessories != *((_DWORD *)v4 + 61))
      goto LABEL_451;
  }
  else if ((v16 & 0x2000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x10) != 0)
  {
    if ((v16 & 0x10) == 0 || self->_homepodSynchLatency != *((_DWORD *)v4 + 16))
      goto LABEL_451;
  }
  else if ((v16 & 0x10) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x80000000000) != 0)
  {
    if ((v16 & 0x80000000000) == 0 || self->_numHomePods != *((_DWORD *)v4 + 55))
      goto LABEL_451;
  }
  else if ((v16 & 0x80000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x100000) != 0)
  {
    if ((v16 & 0x100000) == 0 || self->_numBSPs != *((_DWORD *)v4 + 32))
      goto LABEL_451;
  }
  else if ((v16 & 0x100000) != 0)
  {
    goto LABEL_451;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x2000) != 0)
  {
    if ((v4[200] & 0x2000) == 0 || self->_numWoLAccessories != *((_DWORD *)v4 + 89))
      goto LABEL_451;
  }
  else if ((v4[200] & 0x2000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x800000000000000) != 0)
  {
    if ((v16 & 0x800000000000000) == 0 || self->_numOfParticipantsHaveAccepted != *((_DWORD *)v4 + 71))
      goto LABEL_451;
  }
  else if ((v16 & 0x800000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x1000000000000000) != 0)
  {
    if ((v16 & 0x1000000000000000) == 0
      || self->_numOfParticipantsHaveCloudShareIDAndHaveAccepted != *((_DWORD *)v4 + 72))
    {
      goto LABEL_451;
    }
  }
  else if ((v16 & 0x1000000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x2000000000000000) != 0)
  {
    if ((v16 & 0x2000000000000000) == 0
      || self->_numOfParticipantsHaveCloudShareIDButNotAccepted != *((_DWORD *)v4 + 73))
    {
      goto LABEL_451;
    }
  }
  else if ((v16 & 0x2000000000000000) != 0)
  {
    goto LABEL_451;
  }
  if ((v15 & 0x400000000000000) == 0)
  {
    if ((v16 & 0x400000000000000) == 0)
      goto LABEL_446;
LABEL_451:
    v18 = 0;
    goto LABEL_452;
  }
  if ((v16 & 0x400000000000000) == 0
    || self->_numOfNonAcceptedParticipantsWithKnownCapability != *((_DWORD *)v4 + 70))
  {
    goto LABEL_451;
  }
LABEL_446:
  if ((v15 & 0x40000) != 0)
  {
    if ((v16 & 0x40000) == 0 || self->_numAppleTV4K2ndGenAccessories != *((_DWORD *)v4 + 30))
      goto LABEL_451;
    v18 = 1;
  }
  else
  {
    v18 = (v16 & 0x40000) == 0;
  }
LABEL_452:

  return v18;
}

- (unint64_t)hash
{
  int v3;
  uint64_t has;
  int v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;

  v3 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  has = (uint64_t)self->_has;
  if ((has & 0x40) != 0)
  {
    v100 = 2654435761 * self->_numAccessories;
    if ((*((_WORD *)&self->_has + 4) & 0x10) != 0)
    {
LABEL_3:
      v99 = 2654435761 * self->_numServices;
      if ((*((_WORD *)&self->_has + 4) & 0x800) != 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else
  {
    v100 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x10) != 0)
      goto LABEL_3;
  }
  v99 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x800) != 0)
  {
LABEL_4:
    v98 = 2654435761 * self->_numUsers;
    if ((has & 0x8000) != 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  v98 = 0;
  if ((has & 0x8000) != 0)
  {
LABEL_5:
    v97 = 2654435761 * self->_numAdmins;
    if ((*((_WORD *)&self->_has + 4) & 8) != 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  v97 = 0;
  if ((*((_WORD *)&self->_has + 4) & 8) != 0)
  {
LABEL_6:
    v96 = 2654435761 * self->_numScenes;
    if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  v96 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
  {
LABEL_7:
    v95 = 2654435761 * self->_numTriggers;
    if ((has & 0x400000000) != 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  v95 = 0;
  if ((has & 0x400000000) != 0)
  {
LABEL_8:
    v94 = 2654435761 * self->_numEventTriggers;
    if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  v94 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_9:
    v93 = 2654435761 * self->_numTimerTriggers;
    if ((has & 0x4000) != 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  v93 = 0;
  if ((has & 0x4000) != 0)
  {
LABEL_10:
    v92 = 2654435761 * self->_numAccessoryServiceGroups;
    if ((*((_WORD *)&self->_has + 4) & 4) != 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  v92 = 0;
  if ((*((_WORD *)&self->_has + 4) & 4) != 0)
  {
LABEL_11:
    v91 = 2654435761 * self->_numRooms;
    if ((*((_WORD *)&self->_has + 4) & 0x4000) != 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  v91 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x4000) != 0)
  {
LABEL_12:
    v90 = 2654435761 * self->_numZones;
    if ((v3 & 0x40000) != 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  v90 = 0;
  if ((v3 & 0x40000) != 0)
  {
LABEL_13:
    v89 = 2654435761 * self->_isResidentAvailable;
    if ((v3 & 0x20000) != 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  v89 = 0;
  if ((v3 & 0x20000) != 0)
  {
LABEL_14:
    v88 = 2654435761 * self->_isPrimaryResident;
    if ((has & 0x200000) != 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  v88 = 0;
  if ((has & 0x200000) != 0)
  {
LABEL_15:
    v87 = 2654435761 * self->_numBridgedAccessories;
    if ((has & 0x200000000000000) != 0)
      goto LABEL_16;
LABEL_32:
    v86 = 0;
    if ((has & 0x40000000) != 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_31:
  v87 = 0;
  if ((has & 0x200000000000000) == 0)
    goto LABEL_32;
LABEL_16:
  v86 = 2654435761 * self->_numNotCertifiedAccessories;
  if ((has & 0x40000000) != 0)
  {
LABEL_17:
    v85 = 2654435761 * self->_numCertifiedAccessories;
    goto LABEL_34;
  }
LABEL_33:
  v85 = 0;
LABEL_34:
  v84 = -[NSMutableArray hash](self->_eventTriggers, "hash");
  v5 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v6 = (uint64_t)self->_has;
  if ((v6 & 0x800000000) != 0)
  {
    v83 = 2654435761 * self->_numHAPAccessories;
    if ((v6 & 0x20000) != 0)
    {
LABEL_36:
      v82 = 2654435761 * self->_numAppleMediaAccessories;
      if ((*((_WORD *)&self->_has + 4) & 0x1000) != 0)
        goto LABEL_37;
      goto LABEL_62;
    }
  }
  else
  {
    v83 = 0;
    if ((v6 & 0x20000) != 0)
      goto LABEL_36;
  }
  v82 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x1000) != 0)
  {
LABEL_37:
    v81 = 2654435761 * self->_numWholeHouseAudioAccessories;
    if ((v6 & 0x10000) != 0)
      goto LABEL_38;
    goto LABEL_63;
  }
LABEL_62:
  v81 = 0;
  if ((v6 & 0x10000) != 0)
  {
LABEL_38:
    v80 = 2654435761 * self->_numAppleAudioAccessories;
    if ((v6 & 0x80000) != 0)
      goto LABEL_39;
    goto LABEL_64;
  }
LABEL_63:
  v80 = 0;
  if ((v6 & 0x80000) != 0)
  {
LABEL_39:
    v79 = 2654435761 * self->_numAppleTVAccessories;
    if ((v6 & 0x800000) != 0)
      goto LABEL_40;
    goto LABEL_65;
  }
LABEL_64:
  v79 = 0;
  if ((v6 & 0x800000) != 0)
  {
LABEL_40:
    v78 = 2654435761 * self->_numCameraAccessories;
    if ((v6 & 0x800000000000) != 0)
      goto LABEL_41;
    goto LABEL_66;
  }
LABEL_65:
  v78 = 0;
  if ((v6 & 0x800000000000) != 0)
  {
LABEL_41:
    v77 = 2654435761 * self->_numMediaSystems;
    if ((*((_WORD *)&self->_has + 4) & 0x40) != 0)
      goto LABEL_42;
    goto LABEL_67;
  }
LABEL_66:
  v77 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x40) != 0)
  {
LABEL_42:
    v76 = 2654435761 * self->_numTargetControllers;
    if ((v6 & 0x100000000) != 0)
      goto LABEL_43;
    goto LABEL_68;
  }
LABEL_67:
  v76 = 0;
  if ((v6 & 0x100000000) != 0)
  {
LABEL_43:
    v75 = 2654435761 * self->_numCertifiedTargetControllers;
    if ((v6 & 0x400000) != 0)
      goto LABEL_44;
    goto LABEL_69;
  }
LABEL_68:
  v75 = 0;
  if ((v6 & 0x400000) != 0)
  {
LABEL_44:
    v74 = 2654435761 * self->_numBridgedTargetControllers;
    if ((v6 & 0x80000000) != 0)
      goto LABEL_45;
    goto LABEL_70;
  }
LABEL_69:
  v74 = 0;
  if ((v6 & 0x80000000) != 0)
  {
LABEL_45:
    v73 = 2654435761 * self->_numCertifiedBridgedTargetControllers;
    if ((v6 & 0x200000000) != 0)
      goto LABEL_46;
    goto LABEL_71;
  }
LABEL_70:
  v73 = 0;
  if ((v6 & 0x200000000) != 0)
  {
LABEL_46:
    v72 = 2654435761 * self->_numConfiguredScenes;
    if ((v5 & 0x10000) != 0)
      goto LABEL_47;
    goto LABEL_72;
  }
LABEL_71:
  v72 = 0;
  if ((v5 & 0x10000) != 0)
  {
LABEL_47:
    v71 = 2654435761 * self->_isOwner;
    if ((*((_WORD *)&self->_has + 4) & 2) != 0)
      goto LABEL_48;
    goto LABEL_73;
  }
LABEL_72:
  v71 = 0;
  if ((*((_WORD *)&self->_has + 4) & 2) != 0)
  {
LABEL_48:
    v70 = 2654435761 * self->_numResidentsEnabled;
    if ((v5 & 0x80000) != 0)
      goto LABEL_49;
    goto LABEL_74;
  }
LABEL_73:
  v70 = 0;
  if ((v5 & 0x80000) != 0)
  {
LABEL_49:
    v69 = 2654435761 * self->_primaryReportingDevice;
    if ((*((_WORD *)&self->_has + 4) & 0x80) != 0)
      goto LABEL_50;
    goto LABEL_75;
  }
LABEL_74:
  v69 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x80) != 0)
  {
LABEL_50:
    v68 = 2654435761 * self->_numTelevisionAccessories;
    if ((v6 & 0x20) != 0)
      goto LABEL_51;
    goto LABEL_76;
  }
LABEL_75:
  v68 = 0;
  if ((v6 & 0x20) != 0)
  {
LABEL_51:
    v67 = 2654435761 * self->_networkProtectionStatus;
    if ((v6 & 0x2000) != 0)
      goto LABEL_52;
    goto LABEL_77;
  }
LABEL_76:
  v67 = 0;
  if ((v6 & 0x2000) != 0)
  {
LABEL_52:
    v66 = 2654435761 * self->_numAccessoriesWiFiPPSKCredential;
    if ((v6 & 0x80) != 0)
      goto LABEL_53;
    goto LABEL_78;
  }
LABEL_77:
  v66 = 0;
  if ((v6 & 0x80) != 0)
  {
LABEL_53:
    v65 = 2654435761 * self->_numAccessoriesNetworkProtectionAutoFullAccess;
    if ((v6 & 0x200) != 0)
      goto LABEL_54;
    goto LABEL_79;
  }
LABEL_78:
  v65 = 0;
  if ((v6 & 0x200) != 0)
  {
LABEL_54:
    v64 = 2654435761 * self->_numAccessoriesNetworkProtectionAutoProtectedMainLAN;
    if ((v6 & 0x100) != 0)
      goto LABEL_55;
    goto LABEL_80;
  }
LABEL_79:
  v64 = 0;
  if ((v6 & 0x100) != 0)
  {
LABEL_55:
    v63 = 2654435761 * self->_numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN;
    if ((v6 & 0x400) != 0)
      goto LABEL_56;
    goto LABEL_81;
  }
LABEL_80:
  v63 = 0;
  if ((v6 & 0x400) != 0)
  {
LABEL_56:
    v62 = 2654435761 * self->_numAccessoriesNetworkProtectionFullAccess;
    if ((v6 & 0x800) != 0)
      goto LABEL_57;
    goto LABEL_82;
  }
LABEL_81:
  v62 = 0;
  if ((v6 & 0x800) != 0)
  {
LABEL_57:
    v61 = 2654435761 * self->_numAccessoriesNetworkProtectionHomeKitOnly;
    if ((v6 & 0x1000) != 0)
      goto LABEL_58;
LABEL_83:
    v60 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x20) != 0)
      goto LABEL_59;
    goto LABEL_84;
  }
LABEL_82:
  v61 = 0;
  if ((v6 & 0x1000) == 0)
    goto LABEL_83;
LABEL_58:
  v60 = 2654435761 * self->_numAccessoriesNetworkProtectionUnprotected;
  if ((*((_WORD *)&self->_has + 4) & 0x20) != 0)
  {
LABEL_59:
    v59 = 2654435761 * self->_numShortcuts;
    goto LABEL_85;
  }
LABEL_84:
  v59 = 0;
LABEL_85:
  v58 = -[NSMutableArray hash](self->_homeKitMultiUserSettings, "hash");
  v7 = (uint64_t)self->_has;
  if ((v7 & 0x8000000000) != 0)
  {
    v57 = 2654435761 * self->_numHAPIPAccessories;
    if ((v7 & 0x2000000000) != 0)
    {
LABEL_87:
      v56 = 2654435761 * self->_numHAPBTAccessories;
      if ((v7 & 0x4000000000) != 0)
        goto LABEL_88;
LABEL_92:
      v55 = 0;
      if ((v7 & 0x10000000) != 0)
        goto LABEL_89;
      goto LABEL_93;
    }
  }
  else
  {
    v57 = 0;
    if ((v7 & 0x2000000000) != 0)
      goto LABEL_87;
  }
  v56 = 0;
  if ((v7 & 0x4000000000) == 0)
    goto LABEL_92;
LABEL_88:
  v55 = 2654435761 * self->_numHAPBatteryServiceAccessories;
  if ((v7 & 0x10000000) != 0)
  {
LABEL_89:
    v54 = 2654435761 * self->_numCameraAccessoriesSupportRecording;
    goto LABEL_94;
  }
LABEL_93:
  v54 = 0;
LABEL_94:
  v53 = -[NSMutableArray hash](self->_hapServicesLists, "hash");
  v52 = -[NSMutableArray hash](self->_primaryHAPServicesLists, "hash");
  v51 = -[NSMutableArray hash](self->_hapServicesListCertifieds, "hash");
  v50 = -[NSMutableArray hash](self->_primaryHAPServicesListCertifieds, "hash");
  v8 = *((_WORD *)&self->_has + 4);
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x40000000000) != 0)
  {
    v49 = 2654435761 * self->_numHAPSpeakerServiceAccessories;
    if ((v8 & 1) != 0)
    {
LABEL_96:
      v48 = 2654435761 * self->_numPrimaryHAPSpeakerServiceAccessories;
      if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
        goto LABEL_97;
      goto LABEL_136;
    }
  }
  else
  {
    v49 = 0;
    if ((v8 & 1) != 0)
      goto LABEL_96;
  }
  v48 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
  {
LABEL_97:
    v47 = 2654435761 * self->_numTriggerOwnedConfiguredScenes;
    if ((v9 & 0x4000000) != 0)
      goto LABEL_98;
    goto LABEL_137;
  }
LABEL_136:
  v47 = 0;
  if ((v9 & 0x4000000) != 0)
  {
LABEL_98:
    v46 = 2654435761 * self->_numCameraAccessoriesRecordingEnabled;
    if ((v9 & 0x2000000) != 0)
      goto LABEL_99;
    goto LABEL_138;
  }
LABEL_137:
  v46 = 0;
  if ((v9 & 0x2000000) != 0)
  {
LABEL_99:
    v45 = 2654435761 * self->_numCameraAccessoriesRecordingAudioEnabled;
    if ((v9 & 0x8000000) != 0)
      goto LABEL_100;
    goto LABEL_139;
  }
LABEL_138:
  v45 = 0;
  if ((v9 & 0x8000000) != 0)
  {
LABEL_100:
    v44 = 2654435761 * self->_numCameraAccessoriesSmartBulletinNotificationEnabled;
    if ((v9 & 0x1000000) != 0)
      goto LABEL_101;
    goto LABEL_140;
  }
LABEL_139:
  v44 = 0;
  if ((v9 & 0x1000000) != 0)
  {
LABEL_101:
    v43 = 2654435761 * self->_numCameraAccessoriesReachabilityNotificationEnabled;
    if ((v9 & 0x20000000) != 0)
      goto LABEL_102;
    goto LABEL_141;
  }
LABEL_140:
  v43 = 0;
  if ((v9 & 0x20000000) != 0)
  {
LABEL_102:
    v42 = 2654435761 * self->_numCameraAccessoriesWithActivityZonesEnabled;
    if ((v9 & 2) != 0)
      goto LABEL_103;
    goto LABEL_142;
  }
LABEL_141:
  v42 = 0;
  if ((v9 & 2) != 0)
  {
LABEL_103:
    v41 = 2654435761 * self->_enabledResidentsDeviceCapabilities;
    if ((v9 & 0x200000000000) != 0)
      goto LABEL_104;
    goto LABEL_143;
  }
LABEL_142:
  v41 = 0;
  if ((v9 & 0x200000000000) != 0)
  {
LABEL_104:
    v40 = 2654435761 * self->_numLightProfilesWithNaturalLightingSupported;
    if ((v9 & 0x100000000000) != 0)
      goto LABEL_105;
    goto LABEL_144;
  }
LABEL_143:
  v40 = 0;
  if ((v9 & 0x100000000000) != 0)
  {
LABEL_105:
    v39 = 2654435761 * self->_numLightProfilesWithNaturalLightingEnabled;
    if ((v9 & 0x400000000000) != 0)
      goto LABEL_106;
    goto LABEL_145;
  }
LABEL_144:
  v39 = 0;
  if ((v9 & 0x400000000000) != 0)
  {
LABEL_106:
    v38 = 2654435761 * self->_numLightProfilesWithNaturalLightingUsed;
    if ((v9 & 0x10000000000000) != 0)
      goto LABEL_107;
    goto LABEL_146;
  }
LABEL_145:
  v38 = 0;
  if ((v9 & 0x10000000000000) != 0)
  {
LABEL_107:
    v37 = 2654435761 * self->_numNoeBRs;
    if ((v9 & 0x4000000000000) != 0)
      goto LABEL_108;
    goto LABEL_147;
  }
LABEL_146:
  v37 = 0;
  if ((v9 & 0x4000000000000) != 0)
  {
LABEL_108:
    v10 = 2654435761 * self->_numNoeAccessories;
    if ((v9 & 0x20000000000000) != 0)
      goto LABEL_109;
    goto LABEL_148;
  }
LABEL_147:
  v10 = 0;
  if ((v9 & 0x20000000000000) != 0)
  {
LABEL_109:
    v11 = 2654435761 * self->_numNoeFullCap;
    if ((v9 & 0x100000000000000) != 0)
      goto LABEL_110;
    goto LABEL_149;
  }
LABEL_148:
  v11 = 0;
  if ((v9 & 0x100000000000000) != 0)
  {
LABEL_110:
    v12 = 2654435761 * self->_numNoeSleepCap;
    if ((v9 & 0x40000000000000) != 0)
      goto LABEL_111;
    goto LABEL_150;
  }
LABEL_149:
  v12 = 0;
  if ((v9 & 0x40000000000000) != 0)
  {
LABEL_111:
    v13 = 2654435761 * self->_numNoeMinCap;
    if ((v9 & 0x80000000000000) != 0)
      goto LABEL_112;
    goto LABEL_151;
  }
LABEL_150:
  v13 = 0;
  if ((v9 & 0x80000000000000) != 0)
  {
LABEL_112:
    v14 = 2654435761 * self->_numNoeRoutCap;
    if ((v9 & 0x8000000000000) != 0)
      goto LABEL_113;
    goto LABEL_152;
  }
LABEL_151:
  v14 = 0;
  if ((v9 & 0x8000000000000) != 0)
  {
LABEL_113:
    v15 = 2654435761 * self->_numNoeBRCap;
    if ((*((_WORD *)&self->_has + 4) & 0x8000) != 0)
      goto LABEL_114;
    goto LABEL_153;
  }
LABEL_152:
  v15 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x8000) != 0)
  {
LABEL_114:
    v16 = 2654435761 * self->_autoThirdPartyJetEnable;
    if ((v9 & 0x1000000000) != 0)
      goto LABEL_115;
    goto LABEL_154;
  }
LABEL_153:
  v16 = 0;
  if ((v9 & 0x1000000000) != 0)
  {
LABEL_115:
    v17 = 2654435761 * self->_numHAPBLEAccessoriesSupportJet;
    if ((v9 & 0x10000000000) != 0)
      goto LABEL_116;
    goto LABEL_155;
  }
LABEL_154:
  v17 = 0;
  if ((v9 & 0x10000000000) != 0)
  {
LABEL_116:
    v18 = 2654435761 * self->_numHAPIPAccessoriesSupportJet;
    if ((v9 & 0x20000000000) != 0)
      goto LABEL_117;
    goto LABEL_156;
  }
LABEL_155:
  v18 = 0;
  if ((v9 & 0x20000000000) != 0)
  {
LABEL_117:
    v19 = 2654435761 * self->_numHAPNoeAccessoriesSupportJet;
    if ((v9 & 8) != 0)
      goto LABEL_118;
    goto LABEL_157;
  }
LABEL_156:
  v19 = 0;
  if ((v9 & 8) != 0)
  {
LABEL_118:
    v20 = 2654435761 * self->_homeCreationCohortWeek;
    if ((v9 & 4) != 0)
      goto LABEL_119;
    goto LABEL_158;
  }
LABEL_157:
  v20 = 0;
  if ((v9 & 4) != 0)
  {
LABEL_119:
    v21 = 2654435761 * self->_firstHAPAccessoryAddedCohortWeek;
    if ((v9 & 1) != 0)
      goto LABEL_120;
    goto LABEL_159;
  }
LABEL_158:
  v21 = 0;
  if ((v9 & 1) != 0)
  {
LABEL_120:
    v22 = 2654435761 * self->_currentMediaAccessoryFallbackMediaUserType;
    if (v9 < 0)
      goto LABEL_121;
    goto LABEL_160;
  }
LABEL_159:
  v22 = 0;
  if (v9 < 0)
  {
LABEL_121:
    v23 = 2654435761 * self->_numPoeCount;
    if ((v9 & 0x4000000000000000) != 0)
      goto LABEL_122;
    goto LABEL_161;
  }
LABEL_160:
  v23 = 0;
  if ((v9 & 0x4000000000000000) != 0)
  {
LABEL_122:
    v24 = 2654435761 * self->_numPoe2Count;
    if ((v9 & 0x1000000000000) != 0)
      goto LABEL_123;
    goto LABEL_162;
  }
LABEL_161:
  v24 = 0;
  if ((v9 & 0x1000000000000) != 0)
  {
LABEL_123:
    v25 = 2654435761 * self->_numMoe1Accessories;
    if ((v9 & 0x2000000000000) != 0)
      goto LABEL_124;
    goto LABEL_163;
  }
LABEL_162:
  v25 = 0;
  if ((v9 & 0x2000000000000) != 0)
  {
LABEL_124:
    v26 = 2654435761 * self->_numMoe2Accessories;
    if ((v9 & 0x10) != 0)
      goto LABEL_125;
    goto LABEL_164;
  }
LABEL_163:
  v26 = 0;
  if ((v9 & 0x10) != 0)
  {
LABEL_125:
    v27 = 2654435761 * self->_homepodSynchLatency;
    if ((v9 & 0x80000000000) != 0)
      goto LABEL_126;
    goto LABEL_165;
  }
LABEL_164:
  v27 = 0;
  if ((v9 & 0x80000000000) != 0)
  {
LABEL_126:
    v28 = 2654435761 * self->_numHomePods;
    if ((v9 & 0x100000) != 0)
      goto LABEL_127;
    goto LABEL_166;
  }
LABEL_165:
  v28 = 0;
  if ((v9 & 0x100000) != 0)
  {
LABEL_127:
    v29 = 2654435761 * self->_numBSPs;
    if ((*((_WORD *)&self->_has + 4) & 0x2000) != 0)
      goto LABEL_128;
    goto LABEL_167;
  }
LABEL_166:
  v29 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x2000) != 0)
  {
LABEL_128:
    v30 = 2654435761 * self->_numWoLAccessories;
    if ((v9 & 0x800000000000000) != 0)
      goto LABEL_129;
    goto LABEL_168;
  }
LABEL_167:
  v30 = 0;
  if ((v9 & 0x800000000000000) != 0)
  {
LABEL_129:
    v31 = 2654435761 * self->_numOfParticipantsHaveAccepted;
    if ((v9 & 0x1000000000000000) != 0)
      goto LABEL_130;
    goto LABEL_169;
  }
LABEL_168:
  v31 = 0;
  if ((v9 & 0x1000000000000000) != 0)
  {
LABEL_130:
    v32 = 2654435761 * self->_numOfParticipantsHaveCloudShareIDAndHaveAccepted;
    if ((v9 & 0x2000000000000000) != 0)
      goto LABEL_131;
    goto LABEL_170;
  }
LABEL_169:
  v32 = 0;
  if ((v9 & 0x2000000000000000) != 0)
  {
LABEL_131:
    v33 = 2654435761 * self->_numOfParticipantsHaveCloudShareIDButNotAccepted;
    if ((v9 & 0x400000000000000) != 0)
      goto LABEL_132;
LABEL_171:
    v34 = 0;
    if ((v9 & 0x40000) != 0)
      goto LABEL_133;
LABEL_172:
    v35 = 0;
    return v99 ^ v100 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v84 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35;
  }
LABEL_170:
  v33 = 0;
  if ((v9 & 0x400000000000000) == 0)
    goto LABEL_171;
LABEL_132:
  v34 = 2654435761 * self->_numOfNonAcceptedParticipantsWithKnownCapability;
  if ((v9 & 0x40000) == 0)
    goto LABEL_172;
LABEL_133:
  v35 = 2654435761 * self->_numAppleTV4K2ndGenAccessories;
  return v99 ^ v100 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v84 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35;
}

- (void)mergeFrom:(id)a3
{
  unsigned __int16 *v4;
  char *v5;
  uint64_t v6;
  int v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  char v17;
  int v18;
  char v19;
  int v20;
  char v21;
  int v22;
  char v23;
  int v24;
  char v25;
  int v26;
  char v27;
  int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t ii;
  uint64_t v59;
  __int16 v60;
  char v61;
  int v62;
  char v63;
  int v64;
  unsigned int v65;
  int v66;
  char v67;
  int v68;
  unsigned int v69;
  char v70;
  char v71;
  char v72;
  char v73;
  char v74;
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
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v4 = (unsigned __int16 *)a3;
  v5 = (char *)v4;
  v6 = *((_QWORD *)v4 + 49);
  if ((v6 & 0x40) != 0)
  {
    self->_numAccessories = *((_DWORD *)v4 + 18);
    *(_QWORD *)&self->_has |= 0x40uLL;
    v7 = v4[200] | (*((unsigned __int8 *)v4 + 402) << 16);
    v6 = *((_QWORD *)v4 + 49);
    if ((v4[200] & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v7 = v4[200] | (*((unsigned __int8 *)v4 + 402) << 16);
  if ((v4[200] & 0x10) != 0)
  {
LABEL_5:
    self->_numServices = *((_DWORD *)v4 + 80);
    v8 = *((_BYTE *)&self->_has + 10);
    *((_WORD *)&self->_has + 4) |= 0x10u;
    *((_BYTE *)&self->_has + 10) = v8;
    v7 = v4[200] | (*((unsigned __int8 *)v4 + 402) << 16);
    v6 = *((_QWORD *)v4 + 49);
  }
LABEL_6:
  if ((v7 & 0x800) != 0)
  {
    self->_numUsers = *((_DWORD *)v4 + 87);
    v17 = *((_BYTE *)&self->_has + 10);
    *((_WORD *)&self->_has + 4) |= 0x800u;
    *((_BYTE *)&self->_has + 10) = v17;
    v7 = v4[200] | (*((unsigned __int8 *)v4 + 402) << 16);
    v6 = *((_QWORD *)v4 + 49);
    if ((v6 & 0x8000) == 0)
    {
LABEL_8:
      if ((v7 & 8) == 0)
        goto LABEL_9;
      goto LABEL_33;
    }
  }
  else if ((v6 & 0x8000) == 0)
  {
    goto LABEL_8;
  }
  self->_numAdmins = *((_DWORD *)v4 + 27);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v18 = v4[200];
  v7 = v18 | (*((unsigned __int8 *)v4 + 402) << 16);
  v6 = *((_QWORD *)v4 + 49);
  if ((v18 & 8) == 0)
  {
LABEL_9:
    if ((v7 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  self->_numScenes = *((_DWORD *)v4 + 79);
  v19 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 8u;
  *((_BYTE *)&self->_has + 10) = v19;
  v20 = v4[200];
  v7 = v20 | (*((unsigned __int8 *)v4 + 402) << 16);
  v6 = *((_QWORD *)v4 + 49);
  if ((v20 & 0x400) == 0)
  {
LABEL_10:
    if ((v6 & 0x400000000) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  self->_numTriggers = *((_DWORD *)v4 + 86);
  v21 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x400u;
  *((_BYTE *)&self->_has + 10) = v21;
  v7 = v4[200] | (*((unsigned __int8 *)v4 + 402) << 16);
  v6 = *((_QWORD *)v4 + 49);
  if ((v6 & 0x400000000) == 0)
  {
LABEL_11:
    if ((v7 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  self->_numEventTriggers = *((_DWORD *)v4 + 46);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v22 = v4[200];
  v7 = v22 | (*((unsigned __int8 *)v4 + 402) << 16);
  v6 = *((_QWORD *)v4 + 49);
  if ((v22 & 0x100) == 0)
  {
LABEL_12:
    if ((v6 & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  self->_numTimerTriggers = *((_DWORD *)v4 + 84);
  v23 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x100u;
  *((_BYTE *)&self->_has + 10) = v23;
  v7 = v4[200] | (*((unsigned __int8 *)v4 + 402) << 16);
  v6 = *((_QWORD *)v4 + 49);
  if ((v6 & 0x4000) == 0)
  {
LABEL_13:
    if ((v7 & 4) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  self->_numAccessoryServiceGroups = *((_DWORD *)v4 + 26);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v24 = v4[200];
  v7 = v24 | (*((unsigned __int8 *)v4 + 402) << 16);
  v6 = *((_QWORD *)v4 + 49);
  if ((v24 & 4) == 0)
  {
LABEL_14:
    if ((v7 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  self->_numRooms = *((_DWORD *)v4 + 78);
  v25 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 4u;
  *((_BYTE *)&self->_has + 10) = v25;
  v26 = v4[200];
  v7 = v26 | (*((unsigned __int8 *)v4 + 402) << 16);
  v6 = *((_QWORD *)v4 + 49);
  if ((v26 & 0x4000) == 0)
  {
LABEL_15:
    if ((v7 & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  self->_numZones = *((_DWORD *)v4 + 90);
  v27 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x4000u;
  *((_BYTE *)&self->_has + 10) = v27;
  v7 = v4[200] | (*((unsigned __int8 *)v4 + 402) << 16);
  v6 = *((_QWORD *)v4 + 49);
  if ((v7 & 0x40000) == 0)
  {
LABEL_16:
    if ((v7 & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  self->_isResidentAvailable = *((_BYTE *)v4 + 387);
  v28 = *((unsigned __int16 *)&self->_has + 4);
  v29 = (v28 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x40000u) >> 16;
  *((_WORD *)&self->_has + 4) = v28;
  *((_BYTE *)&self->_has + 10) = v29;
  v6 = *((_QWORD *)v4 + 49);
  if (((v4[200] | (*((unsigned __int8 *)v4 + 402) << 16)) & 0x20000) == 0)
  {
LABEL_17:
    if ((v6 & 0x200000) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  self->_isPrimaryResident = *((_BYTE *)v4 + 386);
  v30 = *((unsigned __int16 *)&self->_has + 4);
  v31 = (v30 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x20000u) >> 16;
  *((_WORD *)&self->_has + 4) = v30;
  *((_BYTE *)&self->_has + 10) = v31;
  v6 = *((_QWORD *)v4 + 49);
  if ((v6 & 0x200000) == 0)
  {
LABEL_18:
    if ((v6 & 0x200000000000000) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  self->_numBridgedAccessories = *((_DWORD *)v4 + 33);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v6 = *((_QWORD *)v4 + 49);
  if ((v6 & 0x200000000000000) == 0)
  {
LABEL_19:
    if ((v6 & 0x40000000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_43:
  self->_numNotCertifiedAccessories = *((_DWORD *)v4 + 69);
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  if ((*((_QWORD *)v4 + 49) & 0x40000000) != 0)
  {
LABEL_20:
    self->_numCertifiedAccessories = *((_DWORD *)v4 + 42);
    *(_QWORD *)&self->_has |= 0x40000000uLL;
  }
LABEL_21:
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v9 = *((id *)v4 + 2);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v96 != v12)
          objc_enumerationMutation(v9);
        -[AWDHomeKitHomeConfiguration addEventTriggers:](self, "addEventTriggers:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
    }
    while (v11);
  }

  v14 = (uint64_t *)(v5 + 392);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x800000000) != 0)
  {
    self->_numHAPAccessories = *((_DWORD *)v5 + 47);
    *(_QWORD *)&self->_has |= 0x800000000uLL;
    v16 = *((unsigned __int16 *)v5 + 200) | (v5[402] << 16);
    v15 = *v14;
    if ((*v14 & 0x20000) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
  v16 = *((unsigned __int16 *)v5 + 200) | (v5[402] << 16);
  if ((v15 & 0x20000) != 0)
  {
LABEL_46:
    self->_numAppleMediaAccessories = *((_DWORD *)v5 + 29);
    *(_QWORD *)&self->_has |= 0x20000uLL;
    v16 = *((unsigned __int16 *)v5 + 200) | (v5[402] << 16);
    v15 = *((_QWORD *)v5 + 49);
  }
LABEL_47:
  if ((v16 & 0x1000) != 0)
  {
    self->_numWholeHouseAudioAccessories = *((_DWORD *)v5 + 88);
    v61 = *((_BYTE *)&self->_has + 10);
    *((_WORD *)&self->_has + 4) |= 0x1000u;
    *((_BYTE *)&self->_has + 10) = v61;
    v16 = *((unsigned __int16 *)v5 + 200) | (v5[402] << 16);
    v15 = *((_QWORD *)v5 + 49);
    if ((v15 & 0x10000) == 0)
    {
LABEL_49:
      if ((v15 & 0x80000) == 0)
        goto LABEL_50;
      goto LABEL_116;
    }
  }
  else if ((v15 & 0x10000) == 0)
  {
    goto LABEL_49;
  }
  self->_numAppleAudioAccessories = *((_DWORD *)v5 + 28);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v16 = *((unsigned __int16 *)v5 + 200) | (v5[402] << 16);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x80000) == 0)
  {
LABEL_50:
    if ((v15 & 0x800000) == 0)
      goto LABEL_51;
    goto LABEL_117;
  }
LABEL_116:
  self->_numAppleTVAccessories = *((_DWORD *)v5 + 31);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v16 = *((unsigned __int16 *)v5 + 200) | (v5[402] << 16);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x800000) == 0)
  {
LABEL_51:
    if ((v15 & 0x800000000000) == 0)
      goto LABEL_52;
    goto LABEL_118;
  }
LABEL_117:
  self->_numCameraAccessories = *((_DWORD *)v5 + 35);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v16 = *((unsigned __int16 *)v5 + 200) | (v5[402] << 16);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x800000000000) == 0)
  {
LABEL_52:
    if ((v16 & 0x40) == 0)
      goto LABEL_53;
    goto LABEL_119;
  }
LABEL_118:
  self->_numMediaSystems = *((_DWORD *)v5 + 59);
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  v62 = *((unsigned __int16 *)v5 + 200);
  v16 = v62 | (v5[402] << 16);
  v15 = *((_QWORD *)v5 + 49);
  if ((v62 & 0x40) == 0)
  {
LABEL_53:
    if ((v15 & 0x100000000) == 0)
      goto LABEL_54;
    goto LABEL_120;
  }
LABEL_119:
  self->_numTargetControllers = *((_DWORD *)v5 + 82);
  v63 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x40u;
  *((_BYTE *)&self->_has + 10) = v63;
  v16 = *((unsigned __int16 *)v5 + 200) | (v5[402] << 16);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x100000000) == 0)
  {
LABEL_54:
    if ((v15 & 0x400000) == 0)
      goto LABEL_55;
    goto LABEL_121;
  }
LABEL_120:
  self->_numCertifiedTargetControllers = *((_DWORD *)v5 + 44);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v16 = *((unsigned __int16 *)v5 + 200) | (v5[402] << 16);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x400000) == 0)
  {
LABEL_55:
    if ((v15 & 0x80000000) == 0)
      goto LABEL_56;
    goto LABEL_122;
  }
LABEL_121:
  self->_numBridgedTargetControllers = *((_DWORD *)v5 + 34);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v16 = *((unsigned __int16 *)v5 + 200) | (v5[402] << 16);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x80000000) == 0)
  {
LABEL_56:
    if ((v15 & 0x200000000) == 0)
      goto LABEL_57;
    goto LABEL_123;
  }
LABEL_122:
  self->_numCertifiedBridgedTargetControllers = *((_DWORD *)v5 + 43);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v16 = *((unsigned __int16 *)v5 + 200) | (v5[402] << 16);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x200000000) == 0)
  {
LABEL_57:
    if ((v16 & 0x10000) == 0)
      goto LABEL_58;
    goto LABEL_124;
  }
LABEL_123:
  self->_numConfiguredScenes = *((_DWORD *)v5 + 45);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v16 = *((unsigned __int16 *)v5 + 200) | (v5[402] << 16);
  v15 = *((_QWORD *)v5 + 49);
  if ((v16 & 0x10000) == 0)
  {
LABEL_58:
    if ((v16 & 2) == 0)
      goto LABEL_59;
    goto LABEL_125;
  }
LABEL_124:
  self->_isOwner = v5[385];
  v64 = *((unsigned __int16 *)&self->_has + 4);
  v65 = (v64 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x10000u) >> 16;
  *((_WORD *)&self->_has + 4) = v64;
  *((_BYTE *)&self->_has + 10) = v65;
  v66 = *((unsigned __int16 *)v5 + 200);
  v16 = v66 | (v5[402] << 16);
  v15 = *((_QWORD *)v5 + 49);
  if ((v66 & 2) == 0)
  {
LABEL_59:
    if ((v16 & 0x80000) == 0)
      goto LABEL_60;
    goto LABEL_126;
  }
LABEL_125:
  self->_numResidentsEnabled = *((_DWORD *)v5 + 77);
  v67 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 2u;
  *((_BYTE *)&self->_has + 10) = v67;
  v16 = *((unsigned __int16 *)v5 + 200) | (v5[402] << 16);
  v15 = *((_QWORD *)v5 + 49);
  if ((v16 & 0x80000) == 0)
  {
LABEL_60:
    if ((v16 & 0x80) == 0)
      goto LABEL_61;
    goto LABEL_127;
  }
LABEL_126:
  self->_primaryReportingDevice = v5[388];
  v68 = *((unsigned __int16 *)&self->_has + 4);
  v69 = (v68 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x80000u) >> 16;
  *((_WORD *)&self->_has + 4) = v68;
  *((_BYTE *)&self->_has + 10) = v69;
  LOBYTE(v16) = *((_WORD *)v5 + 200);
  v15 = *((_QWORD *)v5 + 49);
  if ((*((_WORD *)v5 + 200) & 0x80) == 0)
  {
LABEL_61:
    if ((v15 & 0x20) == 0)
      goto LABEL_62;
    goto LABEL_128;
  }
LABEL_127:
  self->_numTelevisionAccessories = *((_DWORD *)v5 + 83);
  v70 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x80u;
  *((_BYTE *)&self->_has + 10) = v70;
  LOWORD(v16) = *((_WORD *)v5 + 200);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x20) == 0)
  {
LABEL_62:
    if ((v15 & 0x2000) == 0)
      goto LABEL_63;
    goto LABEL_129;
  }
LABEL_128:
  self->_networkProtectionStatus = *((_DWORD *)v5 + 17);
  *(_QWORD *)&self->_has |= 0x20uLL;
  LOWORD(v16) = *((_WORD *)v5 + 200);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x2000) == 0)
  {
LABEL_63:
    if ((v15 & 0x80) == 0)
      goto LABEL_64;
    goto LABEL_130;
  }
LABEL_129:
  self->_numAccessoriesWiFiPPSKCredential = *((_DWORD *)v5 + 25);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  LOWORD(v16) = *((_WORD *)v5 + 200);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x80) == 0)
  {
LABEL_64:
    if ((v15 & 0x200) == 0)
      goto LABEL_65;
    goto LABEL_131;
  }
LABEL_130:
  self->_numAccessoriesNetworkProtectionAutoFullAccess = *((_DWORD *)v5 + 19);
  *(_QWORD *)&self->_has |= 0x80uLL;
  LOWORD(v16) = *((_WORD *)v5 + 200);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x200) == 0)
  {
LABEL_65:
    if ((v15 & 0x100) == 0)
      goto LABEL_66;
    goto LABEL_132;
  }
LABEL_131:
  self->_numAccessoriesNetworkProtectionAutoProtectedMainLAN = *((_DWORD *)v5 + 21);
  *(_QWORD *)&self->_has |= 0x200uLL;
  LOWORD(v16) = *((_WORD *)v5 + 200);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x100) == 0)
  {
LABEL_66:
    if ((v15 & 0x400) == 0)
      goto LABEL_67;
    goto LABEL_133;
  }
LABEL_132:
  self->_numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN = *((_DWORD *)v5 + 20);
  *(_QWORD *)&self->_has |= 0x100uLL;
  LOWORD(v16) = *((_WORD *)v5 + 200);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x400) == 0)
  {
LABEL_67:
    if ((v15 & 0x800) == 0)
      goto LABEL_68;
    goto LABEL_134;
  }
LABEL_133:
  self->_numAccessoriesNetworkProtectionFullAccess = *((_DWORD *)v5 + 22);
  *(_QWORD *)&self->_has |= 0x400uLL;
  LOWORD(v16) = *((_WORD *)v5 + 200);
  v15 = *((_QWORD *)v5 + 49);
  if ((v15 & 0x800) == 0)
  {
LABEL_68:
    if ((v15 & 0x1000) == 0)
      goto LABEL_69;
    goto LABEL_135;
  }
LABEL_134:
  self->_numAccessoriesNetworkProtectionHomeKitOnly = *((_DWORD *)v5 + 23);
  *(_QWORD *)&self->_has |= 0x800uLL;
  LOWORD(v16) = *((_WORD *)v5 + 200);
  if ((*((_QWORD *)v5 + 49) & 0x1000) == 0)
  {
LABEL_69:
    if ((v16 & 0x20) == 0)
      goto LABEL_71;
    goto LABEL_70;
  }
LABEL_135:
  self->_numAccessoriesNetworkProtectionUnprotected = *((_DWORD *)v5 + 24);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  if ((*((_WORD *)v5 + 200) & 0x20) != 0)
  {
LABEL_70:
    self->_numShortcuts = *((_DWORD *)v5 + 81);
    *((_WORD *)&self->_has + 4) |= 0x20u;
  }
LABEL_71:
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v32 = *((id *)v5 + 7);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v92;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v92 != v35)
          objc_enumerationMutation(v32);
        -[AWDHomeKitHomeConfiguration addHomeKitMultiUserSettings:](self, "addHomeKitMultiUserSettings:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * j));
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
    }
    while (v34);
  }

  v37 = (uint64_t *)(v5 + 392);
  v38 = *((_QWORD *)v5 + 49);
  if ((v38 & 0x8000000000) != 0)
  {
    self->_numHAPIPAccessories = *((_DWORD *)v5 + 51);
    *(_QWORD *)&self->_has |= 0x8000000000uLL;
    v38 = *v37;
    if ((*v37 & 0x2000000000) == 0)
    {
LABEL_80:
      if ((v38 & 0x4000000000) == 0)
        goto LABEL_81;
      goto LABEL_139;
    }
  }
  else if ((v38 & 0x2000000000) == 0)
  {
    goto LABEL_80;
  }
  self->_numHAPBTAccessories = *((_DWORD *)v5 + 49);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v38 = *((_QWORD *)v5 + 49);
  if ((v38 & 0x4000000000) == 0)
  {
LABEL_81:
    if ((v38 & 0x10000000) == 0)
      goto LABEL_83;
    goto LABEL_82;
  }
LABEL_139:
  self->_numHAPBatteryServiceAccessories = *((_DWORD *)v5 + 50);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  if ((*((_QWORD *)v5 + 49) & 0x10000000) != 0)
  {
LABEL_82:
    self->_numCameraAccessoriesSupportRecording = *((_DWORD *)v5 + 40);
    *(_QWORD *)&self->_has |= 0x10000000uLL;
  }
LABEL_83:
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v39 = *((id *)v5 + 5);
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v88;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v88 != v42)
          objc_enumerationMutation(v39);
        -[AWDHomeKitHomeConfiguration addHapServicesList:](self, "addHapServicesList:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * k));
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
    }
    while (v41);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v44 = *((id *)v5 + 47);
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v84;
    do
    {
      for (m = 0; m != v46; ++m)
      {
        if (*(_QWORD *)v84 != v47)
          objc_enumerationMutation(v44);
        -[AWDHomeKitHomeConfiguration addPrimaryHAPServicesList:](self, "addPrimaryHAPServicesList:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * m));
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
    }
    while (v46);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v49 = *((id *)v5 + 4);
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v79, v100, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v80;
    do
    {
      for (n = 0; n != v51; ++n)
      {
        if (*(_QWORD *)v80 != v52)
          objc_enumerationMutation(v49);
        -[AWDHomeKitHomeConfiguration addHapServicesListCertified:](self, "addHapServicesListCertified:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * n));
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v79, v100, 16);
    }
    while (v51);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v54 = *((id *)v5 + 46);
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v76;
    do
    {
      for (ii = 0; ii != v56; ++ii)
      {
        if (*(_QWORD *)v76 != v57)
          objc_enumerationMutation(v54);
        -[AWDHomeKitHomeConfiguration addPrimaryHAPServicesListCertified:](self, "addPrimaryHAPServicesListCertified:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * ii), (_QWORD)v75);
      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
    }
    while (v56);
  }

  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x40000000000) != 0)
  {
    self->_numHAPSpeakerServiceAccessories = *((_DWORD *)v5 + 54);
    *(_QWORD *)&self->_has |= 0x40000000000uLL;
    v60 = *((_WORD *)v5 + 200);
    v59 = *((_QWORD *)v5 + 49);
    if ((v60 & 1) == 0)
      goto LABEL_143;
    goto LABEL_142;
  }
  v60 = *((_WORD *)v5 + 200);
  if ((v60 & 1) != 0)
  {
LABEL_142:
    self->_numPrimaryHAPSpeakerServiceAccessories = *((_DWORD *)v5 + 76);
    v71 = *((_BYTE *)&self->_has + 10);
    *((_WORD *)&self->_has + 4) |= 1u;
    *((_BYTE *)&self->_has + 10) = v71;
    v60 = *((_WORD *)v5 + 200);
    v59 = *((_QWORD *)v5 + 49);
  }
LABEL_143:
  if ((v60 & 0x200) != 0)
  {
    self->_numTriggerOwnedConfiguredScenes = *((_DWORD *)v5 + 85);
    v72 = *((_BYTE *)&self->_has + 10);
    *((_WORD *)&self->_has + 4) |= 0x200u;
    *((_BYTE *)&self->_has + 10) = v72;
    v60 = *((_WORD *)v5 + 200);
    v59 = *((_QWORD *)v5 + 49);
    if ((v59 & 0x4000000) == 0)
    {
LABEL_145:
      if ((v59 & 0x2000000) == 0)
        goto LABEL_146;
      goto LABEL_184;
    }
  }
  else if ((v59 & 0x4000000) == 0)
  {
    goto LABEL_145;
  }
  self->_numCameraAccessoriesRecordingEnabled = *((_DWORD *)v5 + 38);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x2000000) == 0)
  {
LABEL_146:
    if ((v59 & 0x8000000) == 0)
      goto LABEL_147;
    goto LABEL_185;
  }
LABEL_184:
  self->_numCameraAccessoriesRecordingAudioEnabled = *((_DWORD *)v5 + 37);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x8000000) == 0)
  {
LABEL_147:
    if ((v59 & 0x1000000) == 0)
      goto LABEL_148;
    goto LABEL_186;
  }
LABEL_185:
  self->_numCameraAccessoriesSmartBulletinNotificationEnabled = *((_DWORD *)v5 + 39);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x1000000) == 0)
  {
LABEL_148:
    if ((v59 & 0x20000000) == 0)
      goto LABEL_149;
    goto LABEL_187;
  }
LABEL_186:
  self->_numCameraAccessoriesReachabilityNotificationEnabled = *((_DWORD *)v5 + 36);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x20000000) == 0)
  {
LABEL_149:
    if ((v59 & 2) == 0)
      goto LABEL_150;
    goto LABEL_188;
  }
LABEL_187:
  self->_numCameraAccessoriesWithActivityZonesEnabled = *((_DWORD *)v5 + 41);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 2) == 0)
  {
LABEL_150:
    if ((v59 & 0x200000000000) == 0)
      goto LABEL_151;
    goto LABEL_189;
  }
LABEL_188:
  self->_enabledResidentsDeviceCapabilities = *((_DWORD *)v5 + 3);
  *(_QWORD *)&self->_has |= 2uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x200000000000) == 0)
  {
LABEL_151:
    if ((v59 & 0x100000000000) == 0)
      goto LABEL_152;
    goto LABEL_190;
  }
LABEL_189:
  self->_numLightProfilesWithNaturalLightingSupported = *((_DWORD *)v5 + 57);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x100000000000) == 0)
  {
LABEL_152:
    if ((v59 & 0x400000000000) == 0)
      goto LABEL_153;
    goto LABEL_191;
  }
LABEL_190:
  self->_numLightProfilesWithNaturalLightingEnabled = *((_DWORD *)v5 + 56);
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x400000000000) == 0)
  {
LABEL_153:
    if ((v59 & 0x10000000000000) == 0)
      goto LABEL_154;
    goto LABEL_192;
  }
LABEL_191:
  self->_numLightProfilesWithNaturalLightingUsed = *((_DWORD *)v5 + 58);
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x10000000000000) == 0)
  {
LABEL_154:
    if ((v59 & 0x4000000000000) == 0)
      goto LABEL_155;
    goto LABEL_193;
  }
LABEL_192:
  self->_numNoeBRs = *((_DWORD *)v5 + 64);
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x4000000000000) == 0)
  {
LABEL_155:
    if ((v59 & 0x20000000000000) == 0)
      goto LABEL_156;
    goto LABEL_194;
  }
LABEL_193:
  self->_numNoeAccessories = *((_DWORD *)v5 + 62);
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x20000000000000) == 0)
  {
LABEL_156:
    if ((v59 & 0x100000000000000) == 0)
      goto LABEL_157;
    goto LABEL_195;
  }
LABEL_194:
  self->_numNoeFullCap = *((_DWORD *)v5 + 65);
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x100000000000000) == 0)
  {
LABEL_157:
    if ((v59 & 0x40000000000000) == 0)
      goto LABEL_158;
    goto LABEL_196;
  }
LABEL_195:
  self->_numNoeSleepCap = *((_DWORD *)v5 + 68);
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x40000000000000) == 0)
  {
LABEL_158:
    if ((v59 & 0x80000000000000) == 0)
      goto LABEL_159;
    goto LABEL_197;
  }
LABEL_196:
  self->_numNoeMinCap = *((_DWORD *)v5 + 66);
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x80000000000000) == 0)
  {
LABEL_159:
    if ((v59 & 0x8000000000000) == 0)
      goto LABEL_160;
    goto LABEL_198;
  }
LABEL_197:
  self->_numNoeRoutCap = *((_DWORD *)v5 + 67);
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x8000000000000) == 0)
  {
LABEL_160:
    if ((v60 & 0x8000) == 0)
      goto LABEL_161;
    goto LABEL_199;
  }
LABEL_198:
  self->_numNoeBRCap = *((_DWORD *)v5 + 63);
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v60 & 0x8000) == 0)
  {
LABEL_161:
    if ((v59 & 0x1000000000) == 0)
      goto LABEL_162;
    goto LABEL_200;
  }
LABEL_199:
  self->_autoThirdPartyJetEnable = v5[384];
  v73 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x8000u;
  *((_BYTE *)&self->_has + 10) = v73;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x1000000000) == 0)
  {
LABEL_162:
    if ((v59 & 0x10000000000) == 0)
      goto LABEL_163;
    goto LABEL_201;
  }
LABEL_200:
  self->_numHAPBLEAccessoriesSupportJet = *((_DWORD *)v5 + 48);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x10000000000) == 0)
  {
LABEL_163:
    if ((v59 & 0x20000000000) == 0)
      goto LABEL_164;
    goto LABEL_202;
  }
LABEL_201:
  self->_numHAPIPAccessoriesSupportJet = *((_DWORD *)v5 + 52);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x20000000000) == 0)
  {
LABEL_164:
    if ((v59 & 8) == 0)
      goto LABEL_165;
    goto LABEL_203;
  }
LABEL_202:
  self->_numHAPNoeAccessoriesSupportJet = *((_DWORD *)v5 + 53);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 8) == 0)
  {
LABEL_165:
    if ((v59 & 4) == 0)
      goto LABEL_166;
    goto LABEL_204;
  }
LABEL_203:
  self->_homeCreationCohortWeek = *((_DWORD *)v5 + 12);
  *(_QWORD *)&self->_has |= 8uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 4) == 0)
  {
LABEL_166:
    if ((v59 & 1) == 0)
      goto LABEL_167;
    goto LABEL_205;
  }
LABEL_204:
  self->_firstHAPAccessoryAddedCohortWeek = *((_DWORD *)v5 + 6);
  *(_QWORD *)&self->_has |= 4uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 1) == 0)
  {
LABEL_167:
    if ((v59 & 0x8000000000000000) == 0)
      goto LABEL_168;
    goto LABEL_206;
  }
LABEL_205:
  self->_currentMediaAccessoryFallbackMediaUserType = *((_DWORD *)v5 + 2);
  *(_QWORD *)&self->_has |= 1uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x8000000000000000) == 0)
  {
LABEL_168:
    if ((v59 & 0x4000000000000000) == 0)
      goto LABEL_169;
    goto LABEL_207;
  }
LABEL_206:
  self->_numPoeCount = *((_DWORD *)v5 + 75);
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x4000000000000000) == 0)
  {
LABEL_169:
    if ((v59 & 0x1000000000000) == 0)
      goto LABEL_170;
    goto LABEL_208;
  }
LABEL_207:
  self->_numPoe2Count = *((_DWORD *)v5 + 74);
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x1000000000000) == 0)
  {
LABEL_170:
    if ((v59 & 0x2000000000000) == 0)
      goto LABEL_171;
    goto LABEL_209;
  }
LABEL_208:
  self->_numMoe1Accessories = *((_DWORD *)v5 + 60);
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x2000000000000) == 0)
  {
LABEL_171:
    if ((v59 & 0x10) == 0)
      goto LABEL_172;
    goto LABEL_210;
  }
LABEL_209:
  self->_numMoe2Accessories = *((_DWORD *)v5 + 61);
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x10) == 0)
  {
LABEL_172:
    if ((v59 & 0x80000000000) == 0)
      goto LABEL_173;
    goto LABEL_211;
  }
LABEL_210:
  self->_homepodSynchLatency = *((_DWORD *)v5 + 16);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x80000000000) == 0)
  {
LABEL_173:
    if ((v59 & 0x100000) == 0)
      goto LABEL_174;
    goto LABEL_212;
  }
LABEL_211:
  self->_numHomePods = *((_DWORD *)v5 + 55);
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v60 = *((_WORD *)v5 + 200);
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x100000) == 0)
  {
LABEL_174:
    if ((v60 & 0x2000) == 0)
      goto LABEL_175;
    goto LABEL_213;
  }
LABEL_212:
  self->_numBSPs = *((_DWORD *)v5 + 32);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v59 = *((_QWORD *)v5 + 49);
  if ((*((_WORD *)v5 + 200) & 0x2000) == 0)
  {
LABEL_175:
    if ((v59 & 0x800000000000000) == 0)
      goto LABEL_176;
    goto LABEL_214;
  }
LABEL_213:
  self->_numWoLAccessories = *((_DWORD *)v5 + 89);
  v74 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x2000u;
  *((_BYTE *)&self->_has + 10) = v74;
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x800000000000000) == 0)
  {
LABEL_176:
    if ((v59 & 0x1000000000000000) == 0)
      goto LABEL_177;
    goto LABEL_215;
  }
LABEL_214:
  self->_numOfParticipantsHaveAccepted = *((_DWORD *)v5 + 71);
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x1000000000000000) == 0)
  {
LABEL_177:
    if ((v59 & 0x2000000000000000) == 0)
      goto LABEL_178;
    goto LABEL_216;
  }
LABEL_215:
  self->_numOfParticipantsHaveCloudShareIDAndHaveAccepted = *((_DWORD *)v5 + 72);
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x2000000000000000) == 0)
  {
LABEL_178:
    if ((v59 & 0x400000000000000) == 0)
      goto LABEL_179;
LABEL_217:
    self->_numOfNonAcceptedParticipantsWithKnownCapability = *((_DWORD *)v5 + 70);
    *(_QWORD *)&self->_has |= 0x400000000000000uLL;
    if ((*((_QWORD *)v5 + 49) & 0x40000) == 0)
      goto LABEL_181;
    goto LABEL_180;
  }
LABEL_216:
  self->_numOfParticipantsHaveCloudShareIDButNotAccepted = *((_DWORD *)v5 + 73);
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  v59 = *((_QWORD *)v5 + 49);
  if ((v59 & 0x400000000000000) != 0)
    goto LABEL_217;
LABEL_179:
  if ((v59 & 0x40000) != 0)
  {
LABEL_180:
    self->_numAppleTV4K2ndGenAccessories = *((_DWORD *)v5 + 30);
    *(_QWORD *)&self->_has |= 0x40000uLL;
  }
LABEL_181:

}

- (unsigned)numAccessories
{
  return self->_numAccessories;
}

- (unsigned)numServices
{
  return self->_numServices;
}

- (unsigned)numUsers
{
  return self->_numUsers;
}

- (unsigned)numAdmins
{
  return self->_numAdmins;
}

- (unsigned)numScenes
{
  return self->_numScenes;
}

- (unsigned)numTriggers
{
  return self->_numTriggers;
}

- (unsigned)numEventTriggers
{
  return self->_numEventTriggers;
}

- (unsigned)numTimerTriggers
{
  return self->_numTimerTriggers;
}

- (unsigned)numAccessoryServiceGroups
{
  return self->_numAccessoryServiceGroups;
}

- (unsigned)numRooms
{
  return self->_numRooms;
}

- (unsigned)numZones
{
  return self->_numZones;
}

- (BOOL)isResidentAvailable
{
  return self->_isResidentAvailable;
}

- (BOOL)isPrimaryResident
{
  return self->_isPrimaryResident;
}

- (unsigned)numBridgedAccessories
{
  return self->_numBridgedAccessories;
}

- (unsigned)numNotCertifiedAccessories
{
  return self->_numNotCertifiedAccessories;
}

- (unsigned)numCertifiedAccessories
{
  return self->_numCertifiedAccessories;
}

- (NSMutableArray)eventTriggers
{
  return self->_eventTriggers;
}

- (void)setEventTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_eventTriggers, a3);
}

- (unsigned)numHAPAccessories
{
  return self->_numHAPAccessories;
}

- (unsigned)numAppleMediaAccessories
{
  return self->_numAppleMediaAccessories;
}

- (unsigned)numWholeHouseAudioAccessories
{
  return self->_numWholeHouseAudioAccessories;
}

- (unsigned)numAppleAudioAccessories
{
  return self->_numAppleAudioAccessories;
}

- (unsigned)numAppleTVAccessories
{
  return self->_numAppleTVAccessories;
}

- (unsigned)numCameraAccessories
{
  return self->_numCameraAccessories;
}

- (unsigned)numMediaSystems
{
  return self->_numMediaSystems;
}

- (unsigned)numTargetControllers
{
  return self->_numTargetControllers;
}

- (unsigned)numCertifiedTargetControllers
{
  return self->_numCertifiedTargetControllers;
}

- (unsigned)numBridgedTargetControllers
{
  return self->_numBridgedTargetControllers;
}

- (unsigned)numCertifiedBridgedTargetControllers
{
  return self->_numCertifiedBridgedTargetControllers;
}

- (unsigned)numConfiguredScenes
{
  return self->_numConfiguredScenes;
}

- (BOOL)isOwner
{
  return self->_isOwner;
}

- (unsigned)numResidentsEnabled
{
  return self->_numResidentsEnabled;
}

- (BOOL)primaryReportingDevice
{
  return self->_primaryReportingDevice;
}

- (unsigned)numTelevisionAccessories
{
  return self->_numTelevisionAccessories;
}

- (unsigned)numAccessoriesWiFiPPSKCredential
{
  return self->_numAccessoriesWiFiPPSKCredential;
}

- (unsigned)numAccessoriesNetworkProtectionAutoFullAccess
{
  return self->_numAccessoriesNetworkProtectionAutoFullAccess;
}

- (unsigned)numAccessoriesNetworkProtectionAutoProtectedMainLAN
{
  return self->_numAccessoriesNetworkProtectionAutoProtectedMainLAN;
}

- (unsigned)numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN
{
  return self->_numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN;
}

- (unsigned)numAccessoriesNetworkProtectionFullAccess
{
  return self->_numAccessoriesNetworkProtectionFullAccess;
}

- (unsigned)numAccessoriesNetworkProtectionHomeKitOnly
{
  return self->_numAccessoriesNetworkProtectionHomeKitOnly;
}

- (unsigned)numAccessoriesNetworkProtectionUnprotected
{
  return self->_numAccessoriesNetworkProtectionUnprotected;
}

- (unsigned)numShortcuts
{
  return self->_numShortcuts;
}

- (NSMutableArray)homeKitMultiUserSettings
{
  return self->_homeKitMultiUserSettings;
}

- (void)setHomeKitMultiUserSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitMultiUserSettings, a3);
}

- (unsigned)numHAPIPAccessories
{
  return self->_numHAPIPAccessories;
}

- (unsigned)numHAPBTAccessories
{
  return self->_numHAPBTAccessories;
}

- (unsigned)numHAPBatteryServiceAccessories
{
  return self->_numHAPBatteryServiceAccessories;
}

- (unsigned)numCameraAccessoriesSupportRecording
{
  return self->_numCameraAccessoriesSupportRecording;
}

- (NSMutableArray)hapServicesLists
{
  return self->_hapServicesLists;
}

- (void)setHapServicesLists:(id)a3
{
  objc_storeStrong((id *)&self->_hapServicesLists, a3);
}

- (NSMutableArray)primaryHAPServicesLists
{
  return self->_primaryHAPServicesLists;
}

- (void)setPrimaryHAPServicesLists:(id)a3
{
  objc_storeStrong((id *)&self->_primaryHAPServicesLists, a3);
}

- (NSMutableArray)hapServicesListCertifieds
{
  return self->_hapServicesListCertifieds;
}

- (void)setHapServicesListCertifieds:(id)a3
{
  objc_storeStrong((id *)&self->_hapServicesListCertifieds, a3);
}

- (NSMutableArray)primaryHAPServicesListCertifieds
{
  return self->_primaryHAPServicesListCertifieds;
}

- (void)setPrimaryHAPServicesListCertifieds:(id)a3
{
  objc_storeStrong((id *)&self->_primaryHAPServicesListCertifieds, a3);
}

- (unsigned)numHAPSpeakerServiceAccessories
{
  return self->_numHAPSpeakerServiceAccessories;
}

- (unsigned)numPrimaryHAPSpeakerServiceAccessories
{
  return self->_numPrimaryHAPSpeakerServiceAccessories;
}

- (unsigned)numTriggerOwnedConfiguredScenes
{
  return self->_numTriggerOwnedConfiguredScenes;
}

- (unsigned)numCameraAccessoriesRecordingEnabled
{
  return self->_numCameraAccessoriesRecordingEnabled;
}

- (unsigned)numCameraAccessoriesRecordingAudioEnabled
{
  return self->_numCameraAccessoriesRecordingAudioEnabled;
}

- (unsigned)numCameraAccessoriesSmartBulletinNotificationEnabled
{
  return self->_numCameraAccessoriesSmartBulletinNotificationEnabled;
}

- (unsigned)numCameraAccessoriesReachabilityNotificationEnabled
{
  return self->_numCameraAccessoriesReachabilityNotificationEnabled;
}

- (unsigned)numCameraAccessoriesWithActivityZonesEnabled
{
  return self->_numCameraAccessoriesWithActivityZonesEnabled;
}

- (unsigned)enabledResidentsDeviceCapabilities
{
  return self->_enabledResidentsDeviceCapabilities;
}

- (unsigned)numLightProfilesWithNaturalLightingSupported
{
  return self->_numLightProfilesWithNaturalLightingSupported;
}

- (unsigned)numLightProfilesWithNaturalLightingEnabled
{
  return self->_numLightProfilesWithNaturalLightingEnabled;
}

- (unsigned)numLightProfilesWithNaturalLightingUsed
{
  return self->_numLightProfilesWithNaturalLightingUsed;
}

- (unsigned)numNoeBRs
{
  return self->_numNoeBRs;
}

- (unsigned)numNoeAccessories
{
  return self->_numNoeAccessories;
}

- (unsigned)numNoeFullCap
{
  return self->_numNoeFullCap;
}

- (unsigned)numNoeSleepCap
{
  return self->_numNoeSleepCap;
}

- (unsigned)numNoeMinCap
{
  return self->_numNoeMinCap;
}

- (unsigned)numNoeRoutCap
{
  return self->_numNoeRoutCap;
}

- (unsigned)numNoeBRCap
{
  return self->_numNoeBRCap;
}

- (BOOL)autoThirdPartyJetEnable
{
  return self->_autoThirdPartyJetEnable;
}

- (unsigned)numHAPBLEAccessoriesSupportJet
{
  return self->_numHAPBLEAccessoriesSupportJet;
}

- (unsigned)numHAPIPAccessoriesSupportJet
{
  return self->_numHAPIPAccessoriesSupportJet;
}

- (unsigned)numHAPNoeAccessoriesSupportJet
{
  return self->_numHAPNoeAccessoriesSupportJet;
}

- (int)homeCreationCohortWeek
{
  return self->_homeCreationCohortWeek;
}

- (int)firstHAPAccessoryAddedCohortWeek
{
  return self->_firstHAPAccessoryAddedCohortWeek;
}

- (int)numPoeCount
{
  return self->_numPoeCount;
}

- (int)numPoe2Count
{
  return self->_numPoe2Count;
}

- (unsigned)numMoe1Accessories
{
  return self->_numMoe1Accessories;
}

- (unsigned)numMoe2Accessories
{
  return self->_numMoe2Accessories;
}

- (unsigned)homepodSynchLatency
{
  return self->_homepodSynchLatency;
}

- (unsigned)numHomePods
{
  return self->_numHomePods;
}

- (unsigned)numBSPs
{
  return self->_numBSPs;
}

- (unsigned)numWoLAccessories
{
  return self->_numWoLAccessories;
}

- (unsigned)numOfParticipantsHaveAccepted
{
  return self->_numOfParticipantsHaveAccepted;
}

- (unsigned)numOfParticipantsHaveCloudShareIDAndHaveAccepted
{
  return self->_numOfParticipantsHaveCloudShareIDAndHaveAccepted;
}

- (unsigned)numOfParticipantsHaveCloudShareIDButNotAccepted
{
  return self->_numOfParticipantsHaveCloudShareIDButNotAccepted;
}

- (unsigned)numOfNonAcceptedParticipantsWithKnownCapability
{
  return self->_numOfNonAcceptedParticipantsWithKnownCapability;
}

- (unsigned)numAppleTV4K2ndGenAccessories
{
  return self->_numAppleTV4K2ndGenAccessories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryHAPServicesLists, 0);
  objc_storeStrong((id *)&self->_primaryHAPServicesListCertifieds, 0);
  objc_storeStrong((id *)&self->_homeKitMultiUserSettings, 0);
  objc_storeStrong((id *)&self->_hapServicesLists, 0);
  objc_storeStrong((id *)&self->_hapServicesListCertifieds, 0);
  objc_storeStrong((id *)&self->_eventTriggers, 0);
}

+ (Class)eventTriggersType
{
  return (Class)objc_opt_class();
}

+ (Class)homeKitMultiUserSettingsType
{
  return (Class)objc_opt_class();
}

+ (Class)hapServicesListType
{
  return (Class)objc_opt_class();
}

+ (Class)primaryHAPServicesListType
{
  return (Class)objc_opt_class();
}

+ (Class)hapServicesListCertifiedType
{
  return (Class)objc_opt_class();
}

+ (Class)primaryHAPServicesListCertifiedType
{
  return (Class)objc_opt_class();
}

@end
