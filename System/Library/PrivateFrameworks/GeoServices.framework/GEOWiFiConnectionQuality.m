@implementation GEOWiFiConnectionQuality

- (GEOWiFiConnectionQuality)init
{
  GEOWiFiConnectionQuality *v2;
  GEOWiFiConnectionQuality *v3;
  GEOWiFiConnectionQuality *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiConnectionQuality;
  v2 = -[GEOWiFiConnectionQuality init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiConnectionQuality)initWithData:(id)a3
{
  GEOWiFiConnectionQuality *v3;
  GEOWiFiConnectionQuality *v4;
  GEOWiFiConnectionQuality *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiConnectionQuality;
  v3 = -[GEOWiFiConnectionQuality initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOWiFiConnectionQuality;
  -[GEOWiFiConnectionQuality dealloc](&v3, sel_dealloc);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x80000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasTimestamp
{
  return (*(_QWORD *)&self->_flags >> 19) & 1;
}

- (void)_readUniqueID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_BYTE *)(a1 + 480) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUniqueID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (BOOL)hasUniqueID
{
  -[GEOWiFiConnectionQuality _readUniqueID]((uint64_t)self);
  return self->_uniqueID != 0;
}

- (NSString)uniqueID
{
  -[GEOWiFiConnectionQuality _readUniqueID]((uint64_t)self);
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  *((_BYTE *)&self->_flags + 8) |= 0xCu;
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (unint64_t)overAllStay
{
  return self->_overAllStay;
}

- (void)setOverAllStay:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x400uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_overAllStay = a3;
}

- (void)setHasOverAllStay:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 1024;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasOverAllStay
{
  return (*(_QWORD *)&self->_flags >> 10) & 1;
}

- (unint64_t)faultyStay
{
  return self->_faultyStay;
}

- (void)setFaultyStay:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x40uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_faultyStay = a3;
}

- (void)setHasFaultyStay:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 64;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasFaultyStay
{
  return (*(_QWORD *)&self->_flags >> 6) & 1;
}

- (unint64_t)lowLQMStay
{
  return self->_lowLQMStay;
}

- (void)setLowLQMStay:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x80uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_lowLQMStay = a3;
}

- (void)setHasLowLQMStay:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 128;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasLowLQMStay
{
  return (*(_QWORD *)&self->_flags >> 7) & 1;
}

- (unint64_t)lowqStay
{
  return self->_lowqStay;
}

- (void)setLowqStay:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x100uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_lowqStay = a3;
}

- (void)setHasLowqStay:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 256;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasLowqStay
{
  return (*(_QWORD *)&self->_flags >> 8) & 1;
}

- (unint64_t)lqmTranCount
{
  return self->_lqmTranCount;
}

- (void)setLqmTranCount:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x200uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_lqmTranCount = a3;
}

- (void)setHasLqmTranCount:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 512;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasLqmTranCount
{
  return (*(_QWORD *)&self->_flags >> 9) & 1;
}

- (unint64_t)successfulConnections
{
  return self->_successfulConnections;
}

- (void)setSuccessfulConnections:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_successfulConnections = a3;
}

- (void)setHasSuccessfulConnections:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x20000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasSuccessfulConnections
{
  return (*(_QWORD *)&self->_flags >> 17) & 1;
}

- (unint64_t)failedConnections
{
  return self->_failedConnections;
}

- (void)setFailedConnections:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x20uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_failedConnections = a3;
}

- (void)setHasFailedConnections:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 32;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasFailedConnections
{
  return (*(_QWORD *)&self->_flags >> 5) & 1;
}

- (unint64_t)packetsIn
{
  return self->_packetsIn;
}

- (void)setPacketsIn:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x800uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_packetsIn = a3;
}

- (void)setHasPacketsIn:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 2048;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasPacketsIn
{
  return (*(_QWORD *)&self->_flags >> 11) & 1;
}

- (unint64_t)packetsOut
{
  return self->_packetsOut;
}

- (void)setPacketsOut:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_packetsOut = a3;
}

- (void)setHasPacketsOut:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 4096;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasPacketsOut
{
  return (*(_QWORD *)&self->_flags >> 12) & 1;
}

- (unint64_t)bytesInTotal
{
  return self->_bytesInTotal;
}

- (void)setBytesInTotal:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 2uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_bytesInTotal = a3;
}

- (void)setHasBytesInTotal:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 2;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasBytesInTotal
{
  return (*(_QWORD *)&self->_flags >> 1) & 1;
}

- (unint64_t)bytesOutTotal
{
  return self->_bytesOutTotal;
}

- (void)setBytesOutTotal:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 8uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_bytesOutTotal = a3;
}

- (void)setHasBytesOutTotal:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 8;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasBytesOutTotal
{
  return (*(_QWORD *)&self->_flags >> 3) & 1;
}

- (unint64_t)bytesInActive
{
  return self->_bytesInActive;
}

- (void)setBytesInActive:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 1uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_bytesInActive = a3;
}

- (void)setHasBytesInActive:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((_BYTE *)&self->_flags + 8) = v3;
}

- (BOOL)hasBytesInActive
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unint64_t)bytesOutActive
{
  return self->_bytesOutActive;
}

- (void)setBytesOutActive:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 4uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_bytesOutActive = a3;
}

- (void)setHasBytesOutActive:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 4;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasBytesOutActive
{
  return (*(_QWORD *)&self->_flags >> 2) & 1;
}

- (unint64_t)reTxBytes
{
  return self->_reTxBytes;
}

- (void)setReTxBytes:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_reTxBytes = a3;
}

- (void)setHasReTxBytes:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x2000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasReTxBytes
{
  return (*(_QWORD *)&self->_flags >> 13) & 1;
}

- (unint64_t)dataStalls
{
  return self->_dataStalls;
}

- (void)setDataStalls:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x10uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_dataStalls = a3;
}

- (void)setHasDataStalls:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 16;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasDataStalls
{
  return (*(_QWORD *)&self->_flags >> 4) & 1;
}

- (unint64_t)receivedDupes
{
  return self->_receivedDupes;
}

- (void)setReceivedDupes:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_receivedDupes = a3;
}

- (void)setHasReceivedDupes:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x4000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasReceivedDupes
{
  return (*(_QWORD *)&self->_flags >> 14) & 1;
}

- (unint64_t)rxOutOfOrderBytes
{
  return self->_rxOutOfOrderBytes;
}

- (void)setRxOutOfOrderBytes:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_rxOutOfOrderBytes = a3;
}

- (void)setHasRxOutOfOrderBytes:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x10000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRxOutOfOrderBytes
{
  return (*(_QWORD *)&self->_flags >> 16) & 1;
}

- (float)roundTripTimeMin
{
  return self->_roundTripTimeMin;
}

- (void)setRoundTripTimeMin:(float)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_roundTripTimeMin = a3;
}

- (void)setHasRoundTripTimeMin:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x2000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRoundTripTimeMin
{
  return (*(_QWORD *)&self->_flags >> 37) & 1;
}

- (float)roundTripTimeAvg
{
  return self->_roundTripTimeAvg;
}

- (void)setRoundTripTimeAvg:(float)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_roundTripTimeAvg = a3;
}

- (void)setHasRoundTripTimeAvg:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x800000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRoundTripTimeAvg
{
  return (*(_QWORD *)&self->_flags >> 35) & 1;
}

- (float)roundTripTimeVar
{
  return self->_roundTripTimeVar;
}

- (void)setRoundTripTimeVar:(float)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_roundTripTimeVar = a3;
}

- (void)setHasRoundTripTimeVar:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x8000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRoundTripTimeVar
{
  return (*(_QWORD *)&self->_flags >> 39) & 1;
}

- (float)roundTripTimeMinActive
{
  return self->_roundTripTimeMinActive;
}

- (void)setRoundTripTimeMinActive:(float)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_roundTripTimeMinActive = a3;
}

- (void)setHasRoundTripTimeMinActive:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x1000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRoundTripTimeMinActive
{
  return (*(_QWORD *)&self->_flags >> 36) & 1;
}

- (float)roundTripTimeAvgActive
{
  return self->_roundTripTimeAvgActive;
}

- (void)setRoundTripTimeAvgActive:(float)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_roundTripTimeAvgActive = a3;
}

- (void)setHasRoundTripTimeAvgActive:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x400000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRoundTripTimeAvgActive
{
  return (*(_QWORD *)&self->_flags >> 34) & 1;
}

- (float)roundTripTimeVarActive
{
  return self->_roundTripTimeVarActive;
}

- (void)setRoundTripTimeVarActive:(float)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_roundTripTimeVarActive = a3;
}

- (void)setHasRoundTripTimeVarActive:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x4000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRoundTripTimeVarActive
{
  return (*(_QWORD *)&self->_flags >> 38) & 1;
}

- (BOOL)hotspot20
{
  return self->_hotspot20;
}

- (void)setHotspot20:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_hotspot20 = a3;
}

- (void)setHasHotspot20:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x800000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFF7FFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasHotspot20
{
  return (*(_QWORD *)&self->_flags >> 47) & 1;
}

- (unsigned)band
{
  return self->_band;
}

- (void)setBand:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x800000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasBand
{
  return (*(_QWORD *)&self->_flags >> 23) & 1;
}

- (unsigned)channel
{
  return self->_channel;
}

- (void)setChannel:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x8000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasChannel
{
  return (*(_QWORD *)&self->_flags >> 27) & 1;
}

- (unsigned)channelWidth
{
  return self->_channelWidth;
}

- (void)setChannelWidth:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_channelWidth = a3;
}

- (void)setHasChannelWidth:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x4000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasChannelWidth
{
  return (*(_QWORD *)&self->_flags >> 26) & 1;
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x10000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRssi
{
  return (*(_QWORD *)&self->_flags >> 40) & 1;
}

- (int)snr
{
  return self->_snr;
}

- (void)setSnr:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_snr = a3;
}

- (void)setHasSnr:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x20000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasSnr
{
  return (*(_QWORD *)&self->_flags >> 41) & 1;
}

- (int)cca
{
  return self->_cca;
}

- (void)setCca:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_cca = a3;
}

- (void)setHasCca:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x2000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasCca
{
  return (*(_QWORD *)&self->_flags >> 25) & 1;
}

- (unsigned)phyMode
{
  return self->_phyMode;
}

- (void)setPhyMode:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_phyMode = a3;
}

- (void)setHasPhyMode:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x200000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasPhyMode
{
  return (*(_QWORD *)&self->_flags >> 33) & 1;
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (void)setTimeOfDay:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_timeOfDay = a3;
}

- (void)setHasTimeOfDay:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x40000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasTimeOfDay
{
  return (*(_QWORD *)&self->_flags >> 18) & 1;
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_QWORD *)(a1 + 472) & 0x2000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags_9);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (BOOL)hasLocation
{
  -[GEOWiFiConnectionQuality _readLocation]((uint64_t)self);
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOWiFiConnectionQuality _readLocation]((uint64_t)self);
  return self->_location;
}

- (void)setLocation:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x2000000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_location, a3);
}

- (unsigned)wasCaptiveFlag
{
  return self->_wasCaptiveFlag;
}

- (void)setWasCaptiveFlag:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x400000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_wasCaptiveFlag = a3;
}

- (void)setHasWasCaptiveFlag:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x400000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFBFFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasWasCaptiveFlag
{
  return (*(_QWORD *)&self->_flags >> 46) & 1;
}

- (int)networkType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x100000000) != 0)
    return self->_networkType;
  else
    return 0;
}

- (void)setNetworkType:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_networkType = a3;
}

- (void)setHasNetworkType:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x100000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasNetworkType
{
  return HIDWORD(*(_QWORD *)&self->_flags) & 1;
}

- (id)networkTypeAsString:(int)a3
{
  if (a3 < 0x11)
    return off_1E1C122E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNetworkType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVATE_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHARGEABLE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONAL_DEVICE_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMERGENCY_SERVICE_ONLY_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_1")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_2")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_3")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_4")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_5")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_6")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_7")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_8")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEST_OR_EXPERIMENTAL_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WILDCARD_NETWORK_TYPE")))
  {
    v4 = 16;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readTraits
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_QWORD *)(a1 + 472) & 0x40000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTraits_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (unint64_t)traitsCount
{
  -[GEOWiFiConnectionQuality _readTraits]((uint64_t)self);
  return self->_traits.count;
}

- (int)traits
{
  -[GEOWiFiConnectionQuality _readTraits]((uint64_t)self);
  return self->_traits.list;
}

- (void)clearTraits
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  PBRepeatedInt32Clear();
}

- (void)addTraits:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $D78CFDED11D8BA562E7494422B5D96BB *p_flags;

  -[GEOWiFiConnectionQuality _readTraits]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 8u;
}

- (int)traitsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_traits;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOWiFiConnectionQuality _readTraits]((uint64_t)self);
  p_traits = &self->_traits;
  count = self->_traits.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_traits->list[a3];
}

- (void)setTraits:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  PBRepeatedInt32Set();
}

- (id)traitsAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C12068[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTraits:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CONNECTION_TRAIT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOVING_CONNECTION_TRAIT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OMNI_PRESENT_CONNECTION_TRAIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IS_SECURED_TRAIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TCP_GOOD_CONNECTION_TRAIT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LONG_TERM_NETWORK_CONNECTION_TRAIT")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)captiveDetermination
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x1000000) != 0)
    return self->_captiveDetermination;
  else
    return 0;
}

- (void)setCaptiveDetermination:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_captiveDetermination = a3;
}

- (void)setHasCaptiveDetermination:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x1000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasCaptiveDetermination
{
  return (*(_QWORD *)&self->_flags >> 24) & 1;
}

- (id)captiveDeterminationAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C12098[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCaptiveDetermination:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CAPTIVE_DETERMINATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_CAPTIVE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IS_CAPTIVE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)associationLength
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x200000) != 0)
    return self->_associationLength;
  else
    return 0;
}

- (void)setAssociationLength:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_associationLength = a3;
}

- (void)setHasAssociationLength:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x200000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasAssociationLength
{
  return (*(_QWORD *)&self->_flags >> 21) & 1;
}

- (id)associationLengthAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C120B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAssociationLength:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ASSOCIATION_TIME_BUCKET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_BUCKET_LT_ONE_MIN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_BUCKET_LT_FIVE_MIN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_BUCKET_LT_TWENTY_MIN")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_BUCKET_LT_ONE_HOUR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_BUCKET_GT_ONE_HOUR")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readAuthTraits
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_QWORD *)(a1 + 472) & 0x10000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAuthTraits_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (unint64_t)authTraitsCount
{
  -[GEOWiFiConnectionQuality _readAuthTraits]((uint64_t)self);
  return self->_authTraits.count;
}

- (int)authTraits
{
  -[GEOWiFiConnectionQuality _readAuthTraits]((uint64_t)self);
  return self->_authTraits.list;
}

- (void)clearAuthTraits
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  PBRepeatedInt32Clear();
}

- (void)addAuthTraits:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $D78CFDED11D8BA562E7494422B5D96BB *p_flags;

  -[GEOWiFiConnectionQuality _readAuthTraits]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 8u;
}

- (int)authTraitsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_authTraits;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOWiFiConnectionQuality _readAuthTraits]((uint64_t)self);
  p_authTraits = &self->_authTraits;
  count = self->_authTraits.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_authTraits->list[a3];
}

- (void)setAuthTraits:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  PBRepeatedInt32Set();
}

- (id)authTraitsAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C120E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAuthTraits:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_AUTH_TRAIT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WPA")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EAP")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)networkOrigin
{
  os_unfair_lock_s *p_readerLock;
  int flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (int)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags < 0)
    return self->_networkOrigin;
  else
    return 0;
}

- (void)setNetworkOrigin:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_networkOrigin = a3;
}

- (void)setHasNetworkOrigin:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x80000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasNetworkOrigin
{
  return (*(_QWORD *)&self->_flags >> 31) & 1;
}

- (id)networkOriginAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C12108[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNetworkOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ORIGINATOR_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CARRIER")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (float)topDLRate
{
  return self->_topDLRate;
}

- (void)setTopDLRate:(float)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_topDLRate = a3;
}

- (void)setHasTopDLRate:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x100000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFEFFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasTopDLRate
{
  return (*(_QWORD *)&self->_flags >> 44) & 1;
}

- (BOOL)lowInternetUL
{
  return self->_lowInternetUL;
}

- (void)setLowInternetUL:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_lowInternetUL = a3;
}

- (void)setHasLowInternetUL:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x8000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFF7FFFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasLowInternetUL
{
  return (*(_QWORD *)&self->_flags >> 51) & 1;
}

- (BOOL)lowInternetDL
{
  return self->_lowInternetDL;
}

- (void)setLowInternetDL:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_lowInternetDL = a3;
}

- (void)setHasLowInternetDL:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x4000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFBFFFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasLowInternetDL
{
  return (*(_QWORD *)&self->_flags >> 50) & 1;
}

- (BOOL)isKnownGood
{
  return self->_isKnownGood;
}

- (void)setIsKnownGood:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_isKnownGood = a3;
}

- (void)setHasIsKnownGood:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x2000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFDFFFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasIsKnownGood
{
  return (*(_QWORD *)&self->_flags >> 49) & 1;
}

- (BOOL)isEdgeBSS
{
  return self->_isEdgeBSS;
}

- (void)setIsEdgeBSS:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_isEdgeBSS = a3;
}

- (void)setHasIsEdgeBSS:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x1000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFEFFFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasIsEdgeBSS
{
  return HIWORD(*(_QWORD *)&self->_flags) & 1;
}

- (int)associationReason
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x400000) != 0)
    return self->_associationReason;
  else
    return 0;
}

- (void)setAssociationReason:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_associationReason = a3;
}

- (void)setHasAssociationReason:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x400000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasAssociationReason
{
  return (*(_QWORD *)&self->_flags >> 22) & 1;
}

- (id)associationReasonAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C12128[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAssociationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ASSOCIATION_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOMATIC")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ROAM")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)disassociationReason
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20000000) != 0)
    return self->_disassociationReason;
  else
    return 0;
}

- (void)setDisassociationReason:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_disassociationReason = a3;
}

- (void)setHasDisassociationReason:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x20000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasDisassociationReason
{
  return (*(_QWORD *)&self->_flags >> 29) & 1;
}

- (id)disassociationReasonAsString:(int)a3
{
  if (a3 < 0x1B)
    return off_1E1C12148[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDisassociationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_DISASSOCIATION_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEAUTH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BEACON_LOSS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERNAL_ERROR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PWR_SAVE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USR_PWROFF")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIGGER_DISC")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEMP_DISABLE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_DISC")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SET_NETWORK")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DECRYPTION_FAILURE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIMARY_INT_FAILURE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PPM_RESTRICTION")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MIS_ENABLED")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USR_PREFERENCE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MISC_REASON")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EAP_RESTART")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_FORCED")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EAP_FAILURE")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NET_TRANSITION")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTO_UNLOCK")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAPTIVE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_NOTIFICATION")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("P2P_BSS_STEERING")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTO_HS")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTO_HS_TRANSITION")) & 1) != 0)
  {
    v4 = 25;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ROAM_FOR_PERF")))
  {
    v4 = 26;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readEssMembers
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_QWORD *)(a1 + 472) & 0x100000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEssMembers_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (NSMutableArray)essMembers
{
  -[GEOWiFiConnectionQuality _readEssMembers]((uint64_t)self);
  return self->_essMembers;
}

- (void)setEssMembers:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *essMembers;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  essMembers = self->_essMembers;
  self->_essMembers = v4;

}

- (void)clearEssMembers
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  -[NSMutableArray removeAllObjects](self->_essMembers, "removeAllObjects");
}

- (void)addEssMembers:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOWiFiConnectionQuality _readEssMembers]((uint64_t)self);
  -[GEOWiFiConnectionQuality _addNoFlagsEssMembers:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOWiFiConnectionQuality *)((char *)self + 472);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x100000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 8u;
}

- (void)_addNoFlagsEssMembers:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 136);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = v5;

      v4 = *(void **)(a1 + 136);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)essMembersCount
{
  -[GEOWiFiConnectionQuality _readEssMembers]((uint64_t)self);
  return -[NSMutableArray count](self->_essMembers, "count");
}

- (id)essMembersAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readEssMembers]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_essMembers, "objectAtIndex:", a3);
}

+ (Class)essMembersType
{
  return (Class)objc_opt_class();
}

- (void)_readNearbyBSSs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_QWORD *)(a1 + 472) & 0x4000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNearbyBSSs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (NSMutableArray)nearbyBSSs
{
  -[GEOWiFiConnectionQuality _readNearbyBSSs]((uint64_t)self);
  return self->_nearbyBSSs;
}

- (void)setNearbyBSSs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *nearbyBSSs;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  nearbyBSSs = self->_nearbyBSSs;
  self->_nearbyBSSs = v4;

}

- (void)clearNearbyBSSs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  -[NSMutableArray removeAllObjects](self->_nearbyBSSs, "removeAllObjects");
}

- (void)addNearbyBSS:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOWiFiConnectionQuality _readNearbyBSSs]((uint64_t)self);
  -[GEOWiFiConnectionQuality _addNoFlagsNearbyBSS:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOWiFiConnectionQuality *)((char *)self + 472);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x4000000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 8u;
}

- (void)_addNoFlagsNearbyBSS:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 224);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 224);
      *(_QWORD *)(a1 + 224) = v5;

      v4 = *(void **)(a1 + 224);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)nearbyBSSsCount
{
  -[GEOWiFiConnectionQuality _readNearbyBSSs]((uint64_t)self);
  return -[NSMutableArray count](self->_nearbyBSSs, "count");
}

- (id)nearbyBSSAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readNearbyBSSs]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_nearbyBSSs, "objectAtIndex:", a3);
}

+ (Class)nearbyBSSType
{
  return (Class)objc_opt_class();
}

- (void)_readFeedbacks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_QWORD *)(a1 + 472) & 0x200000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeedbacks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (NSMutableArray)feedbacks
{
  -[GEOWiFiConnectionQuality _readFeedbacks]((uint64_t)self);
  return self->_feedbacks;
}

- (void)setFeedbacks:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *feedbacks;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  feedbacks = self->_feedbacks;
  self->_feedbacks = v4;

}

- (void)clearFeedbacks
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  -[NSMutableArray removeAllObjects](self->_feedbacks, "removeAllObjects");
}

- (void)addFeedback:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOWiFiConnectionQuality _readFeedbacks]((uint64_t)self);
  -[GEOWiFiConnectionQuality _addNoFlagsFeedback:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOWiFiConnectionQuality *)((char *)self + 472);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x200000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 8u;
}

- (void)_addNoFlagsFeedback:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 160);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 160);
      *(_QWORD *)(a1 + 160) = v5;

      v4 = *(void **)(a1 + 160);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)feedbacksCount
{
  -[GEOWiFiConnectionQuality _readFeedbacks]((uint64_t)self);
  return -[NSMutableArray count](self->_feedbacks, "count");
}

- (id)feedbackAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readFeedbacks]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_feedbacks, "objectAtIndex:", a3);
}

+ (Class)feedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_QWORD *)(a1 + 472) & 0x800000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdentifier_tags_8);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (BOOL)hasIdentifier
{
  -[GEOWiFiConnectionQuality _readIdentifier]((uint64_t)self);
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOWiFiConnectionQuality _readIdentifier]((uint64_t)self);
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)_readRoamStates
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_BYTE *)(a1 + 480) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoamStates_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (NSMutableArray)roamStates
{
  -[GEOWiFiConnectionQuality _readRoamStates]((uint64_t)self);
  return self->_roamStates;
}

- (void)setRoamStates:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *roamStates;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  roamStates = self->_roamStates;
  self->_roamStates = v4;

}

- (void)clearRoamStates
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  -[NSMutableArray removeAllObjects](self->_roamStates, "removeAllObjects");
}

- (void)addRoamStates:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOWiFiConnectionQuality _readRoamStates]((uint64_t)self);
  -[GEOWiFiConnectionQuality _addNoFlagsRoamStates:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOWiFiConnectionQuality *)((char *)self + 472);
  LOBYTE(self->_reader) |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 8u;
}

- (void)_addNoFlagsRoamStates:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 288);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 288);
      *(_QWORD *)(a1 + 288) = v5;

      v4 = *(void **)(a1 + 288);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)roamStatesCount
{
  -[GEOWiFiConnectionQuality _readRoamStates]((uint64_t)self);
  return -[NSMutableArray count](self->_roamStates, "count");
}

- (id)roamStatesAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readRoamStates]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_roamStates, "objectAtIndex:", a3);
}

+ (Class)roamStatesType
{
  return (Class)objc_opt_class();
}

- (void)_readSpeedTests
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_BYTE *)(a1 + 480) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpeedTests_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (NSMutableArray)speedTests
{
  -[GEOWiFiConnectionQuality _readSpeedTests]((uint64_t)self);
  return self->_speedTests;
}

- (void)setSpeedTests:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *speedTests;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  speedTests = self->_speedTests;
  self->_speedTests = v4;

}

- (void)clearSpeedTests
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  -[NSMutableArray removeAllObjects](self->_speedTests, "removeAllObjects");
}

- (void)addSpeedTest:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOWiFiConnectionQuality _readSpeedTests]((uint64_t)self);
  -[GEOWiFiConnectionQuality _addNoFlagsSpeedTest:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOWiFiConnectionQuality *)((char *)self + 472);
  LOBYTE(self->_reader) |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 8u;
}

- (void)_addNoFlagsSpeedTest:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 304);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 304);
      *(_QWORD *)(a1 + 304) = v5;

      v4 = *(void **)(a1 + 304);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)speedTestsCount
{
  -[GEOWiFiConnectionQuality _readSpeedTests]((uint64_t)self);
  return -[NSMutableArray count](self->_speedTests, "count");
}

- (id)speedTestAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readSpeedTests]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_speedTests, "objectAtIndex:", a3);
}

+ (Class)speedTestType
{
  return (Class)objc_opt_class();
}

- (unsigned)sslConnectionCount
{
  return self->_sslConnectionCount;
}

- (void)setSslConnectionCount:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_sslConnectionCount = a3;
}

- (void)setHasSslConnectionCount:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x40000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFBFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasSslConnectionCount
{
  return (*(_QWORD *)&self->_flags >> 42) & 1;
}

- (unsigned)sslErrorCount
{
  return self->_sslErrorCount;
}

- (void)setSslErrorCount:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_sslErrorCount = a3;
}

- (void)setHasSslErrorCount:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x80000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFF7FFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasSslErrorCount
{
  return (*(_QWORD *)&self->_flags >> 43) & 1;
}

- (int)apMode
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x100000) != 0)
    return self->_apMode;
  else
    return 0;
}

- (void)setApMode:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_apMode = a3;
}

- (void)setHasApMode:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x100000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasApMode
{
  return (*(_QWORD *)&self->_flags >> 20) & 1;
}

- (id)apModeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C12220[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsApMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_AP_MODE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IBSS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INFRA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ANY")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)clientAssociationSubreason
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10000000) != 0)
    return self->_clientAssociationSubreason;
  else
    return 0;
}

- (void)setClientAssociationSubreason:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_clientAssociationSubreason = a3;
}

- (void)setHasClientAssociationSubreason:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x10000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasClientAssociationSubreason
{
  return (*(_QWORD *)&self->_flags >> 28) & 1;
}

- (id)clientAssociationSubreasonAsString:(int)a3
{
  if (a3 < 9)
    return off_1E1C12240[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsClientAssociationSubreason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_SUBREASON_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SETTINGS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SETUP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTROL_CENTER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECOMMENDATION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QR")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATJ")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLICATION")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WALLET")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x200000000000) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x200000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFDFFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasType
{
  return (*(_QWORD *)&self->_flags >> 45) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C12288[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_HARVEST_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LABEL")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readLabel
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_QWORD *)(a1 + 472) & 0x1000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabel_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (BOOL)hasLabel
{
  -[GEOWiFiConnectionQuality _readLabel]((uint64_t)self);
  return self->_label != 0;
}

- (GEOWiFiHarvestLabel)label
{
  -[GEOWiFiConnectionQuality _readLabel]((uint64_t)self);
  return self->_label;
}

- (void)setLabel:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x1000000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)_readPasspointInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_QWORD *)(a1 + 472) & 0x8000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPasspointInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (BOOL)hasPasspointInfo
{
  -[GEOWiFiConnectionQuality _readPasspointInfo]((uint64_t)self);
  return self->_passpointInfo != 0;
}

- (GEOWiFiPasspointInfo)passpointInfo
{
  -[GEOWiFiConnectionQuality _readPasspointInfo]((uint64_t)self);
  return self->_passpointInfo;
}

- (void)setPasspointInfo:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_passpointInfo, a3);
}

- (void)_readHotspotHelperProviders
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_QWORD *)(a1 + 472) & 0x400000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHotspotHelperProviders_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (NSMutableArray)hotspotHelperProviders
{
  -[GEOWiFiConnectionQuality _readHotspotHelperProviders]((uint64_t)self);
  return self->_hotspotHelperProviders;
}

- (void)setHotspotHelperProviders:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *hotspotHelperProviders;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  hotspotHelperProviders = self->_hotspotHelperProviders;
  self->_hotspotHelperProviders = v4;

}

- (void)clearHotspotHelperProviders
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  -[NSMutableArray removeAllObjects](self->_hotspotHelperProviders, "removeAllObjects");
}

- (void)addHotspotHelperProvider:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOWiFiConnectionQuality _readHotspotHelperProviders]((uint64_t)self);
  -[GEOWiFiConnectionQuality _addNoFlagsHotspotHelperProvider:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOWiFiConnectionQuality *)((char *)self + 472);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 8u;
}

- (void)_addNoFlagsHotspotHelperProvider:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 168);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v5;

      v4 = *(void **)(a1 + 168);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)hotspotHelperProvidersCount
{
  -[GEOWiFiConnectionQuality _readHotspotHelperProviders]((uint64_t)self);
  return -[NSMutableArray count](self->_hotspotHelperProviders, "count");
}

- (id)hotspotHelperProviderAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readHotspotHelperProviders]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_hotspotHelperProviders, "objectAtIndex:", a3);
}

+ (Class)hotspotHelperProviderType
{
  return (Class)objc_opt_class();
}

- (void)_readNameAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_QWORD *)(a1 + 472) & 0x20000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNameAttributes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (unint64_t)nameAttributesCount
{
  -[GEOWiFiConnectionQuality _readNameAttributes]((uint64_t)self);
  return self->_nameAttributes.count;
}

- (int)nameAttributes
{
  -[GEOWiFiConnectionQuality _readNameAttributes]((uint64_t)self);
  return self->_nameAttributes.list;
}

- (void)clearNameAttributes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  PBRepeatedInt32Clear();
}

- (void)addNameAttributes:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $D78CFDED11D8BA562E7494422B5D96BB *p_flags;

  -[GEOWiFiConnectionQuality _readNameAttributes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 8u;
}

- (int)nameAttributesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_nameAttributes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOWiFiConnectionQuality _readNameAttributes]((uint64_t)self);
  p_nameAttributes = &self->_nameAttributes;
  count = self->_nameAttributes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_nameAttributes->list[a3];
}

- (void)setNameAttributes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 8u;
  PBRepeatedInt32Set();
}

- (id)nameAttributesAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C122A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNameAttributes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INDICATES_NOT_PUBLIC")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INDICATES_PUBLIC")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)dohAvailability
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40000000) != 0)
    return self->_dohAvailability;
  else
    return 0;
}

- (void)setDohAvailability:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_dohAvailability = a3;
}

- (void)setHasDohAvailability:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x40000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasDohAvailability
{
  return (*(_QWORD *)&self->_flags >> 30) & 1;
}

- (id)dohAvailabilityAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C122B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDohAvailability:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_DNS_AVAILABILITY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOH_PERMITTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DOH_BLOCKED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readBeaconInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(_QWORD *)(a1 + 472) & 0x80000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBeaconInfo_tags_189);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (BOOL)hasBeaconInfo
{
  -[GEOWiFiConnectionQuality _readBeaconInfo]((uint64_t)self);
  return self->_beaconInfo != 0;
}

- (GEOWiFiBeaconInfo)beaconInfo
{
  -[GEOWiFiConnectionQuality _readBeaconInfo]((uint64_t)self);
  return self->_beaconInfo;
}

- (void)setBeaconInfo:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x80000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_beaconInfo, a3);
}

- (double)responsivenessScore
{
  return self->_responsivenessScore;
}

- (void)setResponsivenessScore:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 8;
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_responsivenessScore = a3;
}

- (void)setHasResponsivenessScore:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x8000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasResponsivenessScore
{
  return (*(_QWORD *)&self->_flags >> 15) & 1;
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
  v8.super_class = (Class)GEOWiFiConnectionQuality;
  -[GEOWiFiConnectionQuality description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiConnectionQuality _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  double v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  __CFString *v49;
  void *v50;
  _QWORD *v51;
  unint64_t v52;
  uint64_t v53;
  __CFString *v54;
  uint64_t v55;
  uint64_t v56;
  __CFString *v57;
  uint64_t v58;
  __CFString *v59;
  void *v60;
  _QWORD *v61;
  unint64_t v62;
  uint64_t v63;
  __CFString *v64;
  uint64_t v65;
  uint64_t v66;
  __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  __CFString *v74;
  uint64_t v75;
  __CFString *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i;
  void *v83;
  id v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t j;
  void *v91;
  id v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t k;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t m;
  void *v108;
  id v109;
  void *v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t n;
  void *v116;
  id v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  __CFString *v122;
  uint64_t v123;
  __CFString *v124;
  uint64_t v125;
  __CFString *v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  void *v134;
  _QWORD *v135;
  unint64_t v136;
  uint64_t v137;
  __CFString *v138;
  uint64_t v139;
  __CFString *v140;
  void *v141;
  void *v142;
  id v143;
  void *v144;
  id v145;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
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
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0x1E0CB3000uLL;
  if ((*(_QWORD *)(a1 + 472) & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 328));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("timestamp"));

  }
  objc_msgSend((id)a1, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("uniqueID"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 232));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("overAllStay"));

    v9 = *(_QWORD *)(a1 + 472);
    if ((v9 & 0x40) == 0)
    {
LABEL_8:
      if ((v9 & 0x80) == 0)
        goto LABEL_9;
      goto LABEL_44;
    }
  }
  else if ((v9 & 0x40) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 152));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("faultyStay"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x80) == 0)
  {
LABEL_9:
    if ((v9 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 200));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("lowLQMStay"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x100) == 0)
  {
LABEL_10:
    if ((v9 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 208));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("lowqStay"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x200) == 0)
  {
LABEL_11:
    if ((v9 & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 216));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("lqmTranCount"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x20000) == 0)
  {
LABEL_12:
    if ((v9 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 312));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("successfulConnections"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x20) == 0)
  {
LABEL_13:
    if ((v9 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 144));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("failedConnections"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x800) == 0)
  {
LABEL_14:
    if ((v9 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 240));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("packetsIn"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x1000) == 0)
  {
LABEL_15:
    if ((v9 & 2) == 0)
      goto LABEL_16;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 248));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("packetsOut"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 2) == 0)
  {
LABEL_16:
    if ((v9 & 8) == 0)
      goto LABEL_17;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 104));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("bytesInTotal"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 8) == 0)
  {
LABEL_17:
    if ((v9 & 1) == 0)
      goto LABEL_18;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 120));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("bytesOutTotal"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 1) == 0)
  {
LABEL_18:
    if ((v9 & 4) == 0)
      goto LABEL_19;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 96));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("bytesInActive"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 4) == 0)
  {
LABEL_19:
    if ((v9 & 0x2000) == 0)
      goto LABEL_20;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 112));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("bytesOutActive"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x2000) == 0)
  {
LABEL_20:
    if ((v9 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 264));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("reTxBytes"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x10) == 0)
  {
LABEL_21:
    if ((v9 & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 128));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("dataStalls"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x4000) == 0)
  {
LABEL_22:
    if ((v9 & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 272));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("receivedDupes"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x10000) == 0)
  {
LABEL_23:
    if ((v9 & 0x2000000000) == 0)
      goto LABEL_24;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 296));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("rxOutOfOrderBytes"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x2000000000) == 0)
  {
LABEL_24:
    if ((v9 & 0x800000000) == 0)
      goto LABEL_25;
    goto LABEL_60;
  }
LABEL_59:
  LODWORD(v8) = *(_DWORD *)(a1 + 424);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("roundTripTimeMin"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x800000000) == 0)
  {
LABEL_25:
    if ((v9 & 0x8000000000) == 0)
      goto LABEL_26;
    goto LABEL_61;
  }
LABEL_60:
  LODWORD(v8) = *(_DWORD *)(a1 + 416);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("roundTripTimeAvg"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x8000000000) == 0)
  {
LABEL_26:
    if ((v9 & 0x1000000000) == 0)
      goto LABEL_27;
    goto LABEL_62;
  }
LABEL_61:
  LODWORD(v8) = *(_DWORD *)(a1 + 432);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("roundTripTimeVar"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x1000000000) == 0)
  {
LABEL_27:
    if ((v9 & 0x400000000) == 0)
      goto LABEL_28;
    goto LABEL_63;
  }
LABEL_62:
  LODWORD(v8) = *(_DWORD *)(a1 + 420);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("roundTripTimeMinActive"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x400000000) == 0)
  {
LABEL_28:
    if ((v9 & 0x4000000000) == 0)
      goto LABEL_29;
    goto LABEL_64;
  }
LABEL_63:
  LODWORD(v8) = *(_DWORD *)(a1 + 412);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("roundTripTimeAvgActive"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x4000000000) == 0)
  {
LABEL_29:
    if ((v9 & 0x800000000000) == 0)
      goto LABEL_30;
    goto LABEL_65;
  }
LABEL_64:
  LODWORD(v8) = *(_DWORD *)(a1 + 428);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("roundTripTimeVarActive"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x800000000000) == 0)
  {
LABEL_30:
    if ((v9 & 0x800000) == 0)
      goto LABEL_31;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 464));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("hotspot20"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x800000) == 0)
  {
LABEL_31:
    if ((v9 & 0x8000000) == 0)
      goto LABEL_32;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 368));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("band"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x8000000) == 0)
  {
LABEL_32:
    if ((v9 & 0x4000000) == 0)
      goto LABEL_33;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 384));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("channel"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x4000000) == 0)
  {
LABEL_33:
    if ((v9 & 0x10000000000) == 0)
      goto LABEL_34;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 380));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("channelWidth"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x10000000000) == 0)
  {
LABEL_34:
    if ((v9 & 0x20000000000) == 0)
      goto LABEL_35;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 436));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("rssi"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x20000000000) == 0)
  {
LABEL_35:
    if ((v9 & 0x2000000) == 0)
      goto LABEL_36;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 440));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("snr"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x2000000) == 0)
  {
LABEL_36:
    if ((v9 & 0x200000000) == 0)
      goto LABEL_37;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 376));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("cca"));

  v9 = *(_QWORD *)(a1 + 472);
  if ((v9 & 0x200000000) == 0)
  {
LABEL_37:
    if ((v9 & 0x40000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 408));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("phyMode"));

  if ((*(_QWORD *)(a1 + 472) & 0x40000) != 0)
  {
LABEL_38:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 320));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("timeOfDay"));

  }
LABEL_39:
  objc_msgSend((id)a1, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v44 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("location"));
  }

  v46 = *(_QWORD *)(a1 + 472);
  if ((v46 & 0x400000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 460));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("wasCaptiveFlag"));

    v46 = *(_QWORD *)(a1 + 472);
  }
  if ((v46 & 0x100000000) != 0)
  {
    v48 = *(int *)(a1 + 404);
    if (v48 >= 0x11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 404));
      v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = off_1E1C122E8[v48];
    }
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("networkType"));

  }
  if (*(_QWORD *)(a1 + 72))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (_QWORD *)(a1 + 64);
    if (*(_QWORD *)(a1 + 72))
    {
      v52 = 0;
      do
      {
        v53 = *(int *)(*v51 + 4 * v52);
        if (v53 >= 6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v53);
          v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v54 = off_1E1C12068[v53];
        }
        objc_msgSend(v50, "addObject:", v54);

        ++v52;
        v51 = (_QWORD *)(a1 + 64);
      }
      while (v52 < *(_QWORD *)(a1 + 72));
    }
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("traits"));

    v5 = 0x1E0CB3000;
  }
  v55 = *(_QWORD *)(a1 + 472);
  if ((v55 & 0x1000000) != 0)
  {
    v56 = *(int *)(a1 + 372);
    if (v56 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 372));
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = off_1E1C12098[v56];
    }
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("captiveDetermination"));

    v55 = *(_QWORD *)(a1 + 472);
  }
  if ((v55 & 0x200000) != 0)
  {
    v58 = *(int *)(a1 + 360);
    if (v58 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 360));
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = off_1E1C120B0[v58];
    }
    objc_msgSend(v4, "setObject:forKey:", v59, CFSTR("associationLength"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v62 = 0;
      do
      {
        v63 = *(int *)(*v61 + 4 * v62);
        if (v63 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v63);
          v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v64 = off_1E1C120E0[v63];
        }
        objc_msgSend(v60, "addObject:", v64);

        ++v62;
        v61 = (_QWORD *)(a1 + 16);
      }
      while (v62 < *(_QWORD *)(a1 + 24));
    }
    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("authTraits"));

    v5 = 0x1E0CB3000uLL;
  }
  v65 = *(_QWORD *)(a1 + 472);
  if ((v65 & 0x80000000) != 0)
  {
    v66 = *(int *)(a1 + 400);
    if (v66 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 400));
      v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v67 = off_1E1C12108[v66];
    }
    objc_msgSend(v4, "setObject:forKey:", v67, CFSTR("networkOrigin"));

    v65 = *(_QWORD *)(a1 + 472);
    if ((v65 & 0x100000000000) == 0)
    {
LABEL_111:
      if ((v65 & 0x8000000000000) == 0)
        goto LABEL_112;
      goto LABEL_123;
    }
  }
  else if ((v65 & 0x100000000000) == 0)
  {
    goto LABEL_111;
  }
  LODWORD(v45) = *(_DWORD *)(a1 + 452);
  objc_msgSend(*(id *)(v5 + 2024), "numberWithFloat:", v45);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("topDLRate"));

  v65 = *(_QWORD *)(a1 + 472);
  if ((v65 & 0x8000000000000) == 0)
  {
LABEL_112:
    if ((v65 & 0x4000000000000) == 0)
      goto LABEL_113;
    goto LABEL_124;
  }
LABEL_123:
  objc_msgSend(*(id *)(v5 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 468));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v69, CFSTR("lowInternetUL"));

  v65 = *(_QWORD *)(a1 + 472);
  if ((v65 & 0x4000000000000) == 0)
  {
LABEL_113:
    if ((v65 & 0x2000000000000) == 0)
      goto LABEL_114;
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(*(id *)(v5 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 467));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v70, CFSTR("lowInternetDL"));

  v65 = *(_QWORD *)(a1 + 472);
  if ((v65 & 0x2000000000000) == 0)
  {
LABEL_114:
    if ((v65 & 0x1000000000000) == 0)
      goto LABEL_115;
    goto LABEL_126;
  }
LABEL_125:
  objc_msgSend(*(id *)(v5 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 466));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("isKnownGood"));

  v65 = *(_QWORD *)(a1 + 472);
  if ((v65 & 0x1000000000000) == 0)
  {
LABEL_115:
    if ((v65 & 0x400000) == 0)
      goto LABEL_116;
    goto LABEL_127;
  }
LABEL_126:
  objc_msgSend(*(id *)(v5 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 465));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v72, CFSTR("isEdgeBSS"));

  v65 = *(_QWORD *)(a1 + 472);
  if ((v65 & 0x400000) == 0)
  {
LABEL_116:
    if ((v65 & 0x20000000) == 0)
      goto LABEL_135;
    goto LABEL_131;
  }
LABEL_127:
  v73 = *(int *)(a1 + 364);
  if (v73 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 364));
    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v74 = off_1E1C12128[v73];
  }
  objc_msgSend(v4, "setObject:forKey:", v74, CFSTR("associationReason"));

  if ((*(_QWORD *)(a1 + 472) & 0x20000000) != 0)
  {
LABEL_131:
    v75 = *(int *)(a1 + 392);
    if (v75 >= 0x1B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 392));
      v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v76 = off_1E1C12148[v75];
    }
    objc_msgSend(v4, "setObject:forKey:", v76, CFSTR("disassociationReason"));

  }
LABEL_135:
  if (objc_msgSend(*(id *)(a1 + 136), "count"))
  {
    v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    v163 = 0u;
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    v78 = *(id *)(a1 + 136);
    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v163, v171, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v164;
      do
      {
        for (i = 0; i != v80; ++i)
        {
          if (*(_QWORD *)v164 != v81)
            objc_enumerationMutation(v78);
          v83 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v83, "jsonRepresentation");
          else
            objc_msgSend(v83, "dictionaryRepresentation");
          v84 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v77, "addObject:", v84);
        }
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v163, v171, 16);
      }
      while (v80);
    }

    objc_msgSend(v4, "setObject:forKey:", v77, CFSTR("essMembers"));
  }
  if (objc_msgSend(*(id *)(a1 + 224), "count"))
  {
    v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 224), "count"));
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v86 = *(id *)(a1 + 224);
    v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v159, v170, 16);
    if (v87)
    {
      v88 = v87;
      v89 = *(_QWORD *)v160;
      do
      {
        for (j = 0; j != v88; ++j)
        {
          if (*(_QWORD *)v160 != v89)
            objc_enumerationMutation(v86);
          v91 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v91, "jsonRepresentation");
          else
            objc_msgSend(v91, "dictionaryRepresentation");
          v92 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v85, "addObject:", v92);
        }
        v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v159, v170, 16);
      }
      while (v88);
    }

    objc_msgSend(v4, "setObject:forKey:", v85, CFSTR("nearbyBSS"));
  }
  if (objc_msgSend(*(id *)(a1 + 160), "count"))
  {
    v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v94 = *(id *)(a1 + 160);
    v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v155, v169, 16);
    if (v95)
    {
      v96 = v95;
      v97 = *(_QWORD *)v156;
      do
      {
        for (k = 0; k != v96; ++k)
        {
          if (*(_QWORD *)v156 != v97)
            objc_enumerationMutation(v94);
          v99 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v99, "jsonRepresentation");
          else
            objc_msgSend(v99, "dictionaryRepresentation");
          v100 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v93, "addObject:", v100);
        }
        v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v155, v169, 16);
      }
      while (v96);
    }

    objc_msgSend(v4, "setObject:forKey:", v93, CFSTR("feedback"));
  }
  objc_msgSend((id)a1, "identifier");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (v101)
    objc_msgSend(v4, "setObject:forKey:", v101, CFSTR("identifier"));

  if (objc_msgSend(*(id *)(a1 + 288), "count"))
  {
    v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 288), "count"));
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    v154 = 0u;
    v103 = *(id *)(a1 + 288);
    v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v151, v168, 16);
    if (v104)
    {
      v105 = v104;
      v106 = *(_QWORD *)v152;
      do
      {
        for (m = 0; m != v105; ++m)
        {
          if (*(_QWORD *)v152 != v106)
            objc_enumerationMutation(v103);
          v108 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v108, "jsonRepresentation");
          else
            objc_msgSend(v108, "dictionaryRepresentation");
          v109 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v102, "addObject:", v109);
        }
        v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v151, v168, 16);
      }
      while (v105);
    }

    objc_msgSend(v4, "setObject:forKey:", v102, CFSTR("roamStates"));
  }
  if (objc_msgSend(*(id *)(a1 + 304), "count"))
  {
    v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 304), "count"));
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v111 = *(id *)(a1 + 304);
    v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v147, v167, 16);
    if (v112)
    {
      v113 = v112;
      v114 = *(_QWORD *)v148;
      do
      {
        for (n = 0; n != v113; ++n)
        {
          if (*(_QWORD *)v148 != v114)
            objc_enumerationMutation(v111);
          v116 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v116, "jsonRepresentation");
          else
            objc_msgSend(v116, "dictionaryRepresentation");
          v117 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v110, "addObject:", v117);
        }
        v113 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v147, v167, 16);
      }
      while (v113);
    }

    objc_msgSend(v4, "setObject:forKey:", v110, CFSTR("speedTest"));
  }
  v118 = *(_QWORD *)(a1 + 472);
  if ((v118 & 0x40000000000) != 0)
  {
    objc_msgSend(*(id *)(v5 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 444));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v119, CFSTR("sslConnectionCount"));

    v118 = *(_QWORD *)(a1 + 472);
    if ((v118 & 0x80000000000) == 0)
    {
LABEL_199:
      if ((v118 & 0x100000) == 0)
        goto LABEL_200;
      goto LABEL_205;
    }
  }
  else if ((v118 & 0x80000000000) == 0)
  {
    goto LABEL_199;
  }
  objc_msgSend(*(id *)(v5 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 448));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v120, CFSTR("sslErrorCount"));

  v118 = *(_QWORD *)(a1 + 472);
  if ((v118 & 0x100000) == 0)
  {
LABEL_200:
    if ((v118 & 0x10000000) == 0)
      goto LABEL_201;
LABEL_209:
    v123 = *(int *)(a1 + 388);
    if (v123 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 388));
      v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v124 = off_1E1C12240[v123];
    }
    objc_msgSend(v4, "setObject:forKey:", v124, CFSTR("clientAssociationSubreason"));

    if ((*(_QWORD *)(a1 + 472) & 0x200000000000) == 0)
      goto LABEL_217;
    goto LABEL_213;
  }
LABEL_205:
  v121 = *(int *)(a1 + 356);
  if (v121 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 356));
    v122 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v122 = off_1E1C12220[v121];
  }
  objc_msgSend(v4, "setObject:forKey:", v122, CFSTR("apMode"));

  v118 = *(_QWORD *)(a1 + 472);
  if ((v118 & 0x10000000) != 0)
    goto LABEL_209;
LABEL_201:
  if ((v118 & 0x200000000000) != 0)
  {
LABEL_213:
    v125 = *(int *)(a1 + 456);
    if (v125 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 456));
      v126 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v126 = off_1E1C12288[v125];
    }
    objc_msgSend(v4, "setObject:forKey:", v126, CFSTR("type"));

  }
LABEL_217:
  objc_msgSend((id)a1, "label");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v127;
  if (v127)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v127, "jsonRepresentation");
    else
      objc_msgSend(v127, "dictionaryRepresentation");
    v129 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v129, CFSTR("label"));
  }

  objc_msgSend((id)a1, "passpointInfo");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v130;
  if (v130)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v130, "jsonRepresentation");
    else
      objc_msgSend(v130, "dictionaryRepresentation");
    v132 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v132, CFSTR("passpointInfo"));
  }

  if (*(_QWORD *)(a1 + 168))
  {
    objc_msgSend((id)a1, "hotspotHelperProviders");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v133, CFSTR("hotspotHelperProvider"));

  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = (_QWORD *)(a1 + 40);
    if (*(_QWORD *)(a1 + 48))
    {
      v136 = 0;
      do
      {
        v137 = *(int *)(*v135 + 4 * v136);
        if (v137 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v137);
          v138 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v138 = off_1E1C122A0[v137];
        }
        objc_msgSend(v134, "addObject:", v138);

        ++v136;
        v135 = (_QWORD *)(a1 + 40);
      }
      while (v136 < *(_QWORD *)(a1 + 48));
    }
    objc_msgSend(v4, "setObject:forKey:", v134, CFSTR("nameAttributes"));

    v5 = 0x1E0CB3000uLL;
  }
  if ((*(_QWORD *)(a1 + 472) & 0x40000000) != 0)
  {
    v139 = *(int *)(a1 + 396);
    if (v139 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 396));
      v140 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v140 = off_1E1C122B8[v139];
    }
    objc_msgSend(v4, "setObject:forKey:", v140, CFSTR("dohAvailability"));

  }
  objc_msgSend((id)a1, "beaconInfo");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v141;
  if (v141)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v141, "jsonRepresentation");
    else
      objc_msgSend(v141, "dictionaryRepresentation");
    v143 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v143, CFSTR("beaconInfo"));
  }

  if ((*(_QWORD *)(a1 + 472) & 0x8000) != 0)
  {
    objc_msgSend(*(id *)(v5 + 2024), "numberWithDouble:", *(double *)(a1 + 280));
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v144, CFSTR("responsivenessScore"));

  }
  v145 = v4;

  return v145;
}

- (id)jsonRepresentation
{
  return -[GEOWiFiConnectionQuality _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiConnectionQuality)initWithDictionary:(id)a3
{
  return (GEOWiFiConnectionQuality *)-[GEOWiFiConnectionQuality _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(char)a3 isJSON:
{
  id v4;
  id v5;
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
  void *v40;
  void *v41;
  GEOLocation *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  void *v84;
  id v85;
  uint64_t v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t j;
  uint64_t v93;
  GEOWiFiAP *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t k;
  uint64_t v103;
  GEOWiFiAP *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t m;
  uint64_t v113;
  GEOWiFiQualityFeedback *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t n;
  uint64_t v125;
  GEOWiFiConnectionRoamState *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t ii;
  uint64_t v135;
  GEOWiFiConnectionSpeedTest *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  uint64_t v143;
  void *v144;
  id v145;
  uint64_t v146;
  void *v147;
  id v148;
  uint64_t v149;
  void *v150;
  GEOWiFiHarvestLabel *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  GEOWiFiPasspointInfo *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t jj;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t kk;
  void *v172;
  id v173;
  uint64_t v174;
  void *v175;
  id v176;
  uint64_t v177;
  void *v178;
  GEOWiFiBeaconInfo *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v184;
  void *v185;
  id v186;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];
  uint64_t v233;

  v233 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (!a1)
    goto LABEL_488;
  v5 = (id)objc_msgSend(a1, "init");

  if (!v5)
  {
    a1 = 0;
    goto LABEL_488;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setTimestamp:", objc_msgSend(v6, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v5, "setUniqueID:", v8);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("overAllStay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setOverAllStay:", objc_msgSend(v9, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faultyStay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setFaultyStay:", objc_msgSend(v10, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lowLQMStay"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setLowLQMStay:", objc_msgSend(v11, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lowqStay"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setLowqStay:", objc_msgSend(v12, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lqmTranCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setLqmTranCount:", objc_msgSend(v13, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("successfulConnections"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setSuccessfulConnections:", objc_msgSend(v14, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failedConnections"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setFailedConnections:", objc_msgSend(v15, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("packetsIn"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setPacketsIn:", objc_msgSend(v16, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("packetsOut"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setPacketsOut:", objc_msgSend(v17, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesInTotal"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setBytesInTotal:", objc_msgSend(v18, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesOutTotal"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setBytesOutTotal:", objc_msgSend(v19, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesInActive"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setBytesInActive:", objc_msgSend(v20, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesOutActive"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setBytesOutActive:", objc_msgSend(v21, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reTxBytes"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setReTxBytes:", objc_msgSend(v22, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataStalls"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setDataStalls:", objc_msgSend(v23, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("receivedDupes"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setReceivedDupes:", objc_msgSend(v24, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rxOutOfOrderBytes"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setRxOutOfOrderBytes:", objc_msgSend(v25, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("roundTripTimeMin"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v26, "floatValue");
    objc_msgSend(v5, "setRoundTripTimeMin:");
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("roundTripTimeAvg"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v27, "floatValue");
    objc_msgSend(v5, "setRoundTripTimeAvg:");
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("roundTripTimeVar"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v28, "floatValue");
    objc_msgSend(v5, "setRoundTripTimeVar:");
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("roundTripTimeMinActive"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v29, "floatValue");
    objc_msgSend(v5, "setRoundTripTimeMinActive:");
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("roundTripTimeAvgActive"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v30, "floatValue");
    objc_msgSend(v5, "setRoundTripTimeAvgActive:");
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("roundTripTimeVarActive"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v31, "floatValue");
    objc_msgSend(v5, "setRoundTripTimeVarActive:");
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hotspot20"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setHotspot20:", objc_msgSend(v32, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("band"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setBand:", objc_msgSend(v33, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setChannel:", objc_msgSend(v34, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channelWidth"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setChannelWidth:", objc_msgSend(v35, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rssi"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setRssi:", objc_msgSend(v36, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("snr"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setSnr:", objc_msgSend(v37, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cca"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setCca:", objc_msgSend(v38, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phyMode"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setPhyMode:", objc_msgSend(v39, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeOfDay"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setTimeOfDay:", objc_msgSend(v40, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v43 = -[GEOLocation initWithJSON:](v42, "initWithJSON:", v41);
    else
      v43 = -[GEOLocation initWithDictionary:](v42, "initWithDictionary:", v41);
    v44 = (void *)v43;
    objc_msgSend(v5, "setLocation:", v43);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasCaptiveFlag"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setWasCaptiveFlag:", objc_msgSend(v45, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("networkType"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v186 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = v46;
    if ((objc_msgSend(v47, "isEqualToString:", CFSTR("UNKNOWN_NETWORK_TYPE")) & 1) != 0)
    {
      v48 = 0;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("PRIVATE_NETWORK_TYPE")) & 1) != 0)
    {
      v48 = 1;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE")) & 1) != 0)
    {
      v48 = 2;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("CHARGEABLE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
    {
      v48 = 3;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("FREE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
    {
      v48 = 4;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("PERSONAL_DEVICE_NETWORK_TYPE")) & 1) != 0)
    {
      v48 = 5;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("EMERGENCY_SERVICE_ONLY_NETWORK_TYPE")) & 1) != 0)
    {
      v48 = 6;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_1")) & 1) != 0)
    {
      v48 = 7;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_2")) & 1) != 0)
    {
      v48 = 8;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_3")) & 1) != 0)
    {
      v48 = 9;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_4")) & 1) != 0)
    {
      v48 = 10;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_5")) & 1) != 0)
    {
      v48 = 11;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_6")) & 1) != 0)
    {
      v48 = 12;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_7")) & 1) != 0)
    {
      v48 = 13;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_8")) & 1) != 0)
    {
      v48 = 14;
    }
    else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("TEST_OR_EXPERIMENTAL_NETWORK_TYPE")) & 1) != 0)
    {
      v48 = 15;
    }
    else if (objc_msgSend(v47, "isEqualToString:", CFSTR("WILDCARD_NETWORK_TYPE")))
    {
      v48 = 16;
    }
    else
    {
      v48 = 0;
    }

    goto LABEL_118;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = objc_msgSend(v46, "intValue");
LABEL_118:
    objc_msgSend(v5, "setNetworkType:", v48);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("traits"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_146;
  v222 = 0u;
  v223 = 0u;
  v220 = 0u;
  v221 = 0u;
  v184 = v49;
  v50 = v49;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v220, v232, 16);
  if (!v51)
    goto LABEL_145;
  v52 = v51;
  v53 = *(_QWORD *)v221;
  do
  {
    for (i = 0; i != v52; ++i)
    {
      if (*(_QWORD *)v221 != v53)
        objc_enumerationMutation(v50);
      v55 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v56 = v55;
        if ((objc_msgSend(v56, "isEqualToString:", CFSTR("UNKNOWN_CONNECTION_TRAIT")) & 1) != 0)
        {
          v57 = 0;
        }
        else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("MOVING_CONNECTION_TRAIT")) & 1) != 0)
        {
          v57 = 1;
        }
        else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("OMNI_PRESENT_CONNECTION_TRAIT")) & 1) != 0)
        {
          v57 = 2;
        }
        else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("IS_SECURED_TRAIT")) & 1) != 0)
        {
          v57 = 3;
        }
        else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("TCP_GOOD_CONNECTION_TRAIT")) & 1) != 0)
        {
          v57 = 4;
        }
        else if (objc_msgSend(v56, "isEqualToString:", CFSTR("LONG_TERM_NETWORK_CONNECTION_TRAIT")))
        {
          v57 = 5;
        }
        else
        {
          v57 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        v57 = objc_msgSend(v55, "intValue");
      }
      objc_msgSend(v5, "addTraits:", v57);
    }
    v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v220, v232, 16);
  }
  while (v52);
LABEL_145:

  v49 = v184;
  v4 = v186;
LABEL_146:

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("captiveDetermination"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v59 = v58;
    if ((objc_msgSend(v59, "isEqualToString:", CFSTR("UNKNOWN_CAPTIVE_DETERMINATION")) & 1) != 0)
    {
      v60 = 0;
    }
    else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("NOT_CAPTIVE")) & 1) != 0)
    {
      v60 = 1;
    }
    else if (objc_msgSend(v59, "isEqualToString:", CFSTR("IS_CAPTIVE")))
    {
      v60 = 2;
    }
    else
    {
      v60 = 0;
    }

LABEL_157:
    objc_msgSend(v5, "setCaptiveDetermination:", v60);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v60 = objc_msgSend(v58, "intValue");
      goto LABEL_157;
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("associationLength"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = v61;
    if ((objc_msgSend(v62, "isEqualToString:", CFSTR("UNKNOWN_ASSOCIATION_TIME_BUCKET")) & 1) != 0)
    {
      v63 = 0;
    }
    else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("TIME_BUCKET_LT_ONE_MIN")) & 1) != 0)
    {
      v63 = 1;
    }
    else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("TIME_BUCKET_LT_FIVE_MIN")) & 1) != 0)
    {
      v63 = 2;
    }
    else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("TIME_BUCKET_LT_TWENTY_MIN")) & 1) != 0)
    {
      v63 = 3;
    }
    else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("TIME_BUCKET_LT_ONE_HOUR")) & 1) != 0)
    {
      v63 = 4;
    }
    else if (objc_msgSend(v62, "isEqualToString:", CFSTR("TIME_BUCKET_GT_ONE_HOUR")))
    {
      v63 = 5;
    }
    else
    {
      v63 = 0;
    }

LABEL_175:
    objc_msgSend(v5, "setAssociationLength:", v63);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = objc_msgSend(v61, "intValue");
      goto LABEL_175;
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authTraits"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_201;
  v218 = 0u;
  v219 = 0u;
  v216 = 0u;
  v217 = 0u;
  v65 = v64;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v216, v231, 16);
  if (!v66)
    goto LABEL_200;
  v67 = v66;
  v68 = *(_QWORD *)v217;
  while (2)
  {
    v69 = 0;
    while (2)
    {
      if (*(_QWORD *)v217 != v68)
        objc_enumerationMutation(v65);
      v70 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * v69);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v71 = v70;
        if ((objc_msgSend(v71, "isEqualToString:", CFSTR("UNKNOWN_AUTH_TRAIT")) & 1) != 0)
        {
          v72 = 0;
        }
        else if ((objc_msgSend(v71, "isEqualToString:", CFSTR("OPEN")) & 1) != 0)
        {
          v72 = 1;
        }
        else if ((objc_msgSend(v71, "isEqualToString:", CFSTR("WEP")) & 1) != 0)
        {
          v72 = 2;
        }
        else if ((objc_msgSend(v71, "isEqualToString:", CFSTR("WPA")) & 1) != 0)
        {
          v72 = 3;
        }
        else if (objc_msgSend(v71, "isEqualToString:", CFSTR("EAP")))
        {
          v72 = 4;
        }
        else
        {
          v72 = 0;
        }

LABEL_197:
        objc_msgSend(v5, "addAuthTraits:", v72);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v72 = objc_msgSend(v70, "intValue");
          goto LABEL_197;
        }
      }
      if (v67 != ++v69)
        continue;
      break;
    }
    v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v216, v231, 16);
    if (v67)
      continue;
    break;
  }
LABEL_200:

  v4 = v186;
LABEL_201:

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("networkOrigin"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v74 = v73;
    if ((objc_msgSend(v74, "isEqualToString:", CFSTR("UNKNOWN_ORIGINATOR_TYPE")) & 1) != 0)
    {
      v75 = 0;
    }
    else if ((objc_msgSend(v74, "isEqualToString:", CFSTR("USER")) & 1) != 0)
    {
      v75 = 1;
    }
    else if ((objc_msgSend(v74, "isEqualToString:", CFSTR("APP")) & 1) != 0)
    {
      v75 = 2;
    }
    else if (objc_msgSend(v74, "isEqualToString:", CFSTR("CARRIER")))
    {
      v75 = 3;
    }
    else
    {
      v75 = 0;
    }

LABEL_214:
    objc_msgSend(v5, "setNetworkOrigin:", v75);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v75 = objc_msgSend(v73, "intValue");
      goto LABEL_214;
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topDLRate"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v76, "floatValue");
    objc_msgSend(v5, "setTopDLRate:");
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lowInternetUL"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setLowInternetUL:", objc_msgSend(v77, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lowInternetDL"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setLowInternetDL:", objc_msgSend(v78, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isKnownGood"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIsKnownGood:", objc_msgSend(v79, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEdgeBSS"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIsEdgeBSS:", objc_msgSend(v80, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("associationReason"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v82 = v81;
    if ((objc_msgSend(v82, "isEqualToString:", CFSTR("UNKNOWN_ASSOCIATION_TYPE")) & 1) != 0)
    {
      v83 = 0;
    }
    else if ((objc_msgSend(v82, "isEqualToString:", CFSTR("AUTOMATIC")) & 1) != 0)
    {
      v83 = 1;
    }
    else if ((objc_msgSend(v82, "isEqualToString:", CFSTR("CLIENT")) & 1) != 0)
    {
      v83 = 2;
    }
    else if (objc_msgSend(v82, "isEqualToString:", CFSTR("ROAM")))
    {
      v83 = 3;
    }
    else
    {
      v83 = 0;
    }

LABEL_238:
    objc_msgSend(v5, "setAssociationReason:", v83);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v83 = objc_msgSend(v81, "intValue");
      goto LABEL_238;
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disassociationReason"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v85 = v84;
    if ((objc_msgSend(v85, "isEqualToString:", CFSTR("UNKNOWN_DISASSOCIATION_TYPE")) & 1) != 0)
    {
      v86 = 0;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("DEAUTH")) & 1) != 0)
    {
      v86 = 1;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("BEACON_LOSS")) & 1) != 0)
    {
      v86 = 2;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("INTERNAL_ERROR")) & 1) != 0)
    {
      v86 = 3;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("PWR_SAVE")) & 1) != 0)
    {
      v86 = 4;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("USR_PWROFF")) & 1) != 0)
    {
      v86 = 5;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("TRIGGER_DISC")) & 1) != 0)
    {
      v86 = 6;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("TEMP_DISABLE")) & 1) != 0)
    {
      v86 = 7;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("CLIENT_DISC")) & 1) != 0)
    {
      v86 = 8;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("SET_NETWORK")) & 1) != 0)
    {
      v86 = 9;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("DECRYPTION_FAILURE")) & 1) != 0)
    {
      v86 = 10;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("PRIMARY_INT_FAILURE")) & 1) != 0)
    {
      v86 = 11;
    }
    else
    {
      if ((objc_msgSend(v85, "isEqualToString:", CFSTR("PPM_RESTRICTION")) & 1) != 0)
      {
        v86 = 12;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("MIS_ENABLED")) & 1) != 0)
      {
        v86 = 13;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("USR_PREFERENCE")) & 1) != 0)
      {
        v86 = 14;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("MISC_REASON")) & 1) != 0)
      {
        v86 = 15;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("EAP_RESTART")) & 1) != 0)
      {
        v86 = 16;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("USER_FORCED")) & 1) != 0)
      {
        v86 = 17;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("EAP_FAILURE")) & 1) != 0)
      {
        v86 = 18;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("NET_TRANSITION")) & 1) != 0)
      {
        v86 = 19;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("AUTO_UNLOCK")) & 1) != 0)
      {
        v86 = 20;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("CAPTIVE")) & 1) != 0)
      {
        v86 = 21;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("USER_NOTIFICATION")) & 1) != 0)
      {
        v86 = 22;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("P2P_BSS_STEERING")) & 1) != 0)
      {
        v86 = 23;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("AUTO_HS")) & 1) != 0)
      {
        v86 = 24;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("AUTO_HS_TRANSITION")) & 1) != 0)
      {
        v86 = 25;
      }
      else if (objc_msgSend(v85, "isEqualToString:", CFSTR("ROAM_FOR_PERF")))
      {
        v86 = 26;
      }
      else
      {
        v86 = 0;
      }
      v4 = v186;
    }

LABEL_299:
    objc_msgSend(v5, "setDisassociationReason:", v86);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v86 = objc_msgSend(v84, "intValue");
      goto LABEL_299;
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("essMembers"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v214 = 0u;
    v215 = 0u;
    v212 = 0u;
    v213 = 0u;
    v88 = v87;
    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v212, v230, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v213;
      do
      {
        for (j = 0; j != v90; ++j)
        {
          if (*(_QWORD *)v213 != v91)
            objc_enumerationMutation(v88);
          v93 = *(_QWORD *)(*((_QWORD *)&v212 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v94 = [GEOWiFiAP alloc];
            if ((a3 & 1) != 0)
              v95 = -[GEOWiFiAP initWithJSON:](v94, "initWithJSON:", v93);
            else
              v95 = -[GEOWiFiAP initWithDictionary:](v94, "initWithDictionary:", v93);
            v96 = (void *)v95;
            objc_msgSend(v5, "addEssMembers:", v95);

          }
        }
        v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v212, v230, 16);
      }
      while (v90);
    }

    v4 = v186;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nearbyBSS"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v210 = 0u;
    v211 = 0u;
    v208 = 0u;
    v209 = 0u;
    v98 = v97;
    v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v208, v229, 16);
    if (v99)
    {
      v100 = v99;
      v101 = *(_QWORD *)v209;
      do
      {
        for (k = 0; k != v100; ++k)
        {
          if (*(_QWORD *)v209 != v101)
            objc_enumerationMutation(v98);
          v103 = *(_QWORD *)(*((_QWORD *)&v208 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v104 = [GEOWiFiAP alloc];
            if ((a3 & 1) != 0)
              v105 = -[GEOWiFiAP initWithJSON:](v104, "initWithJSON:", v103);
            else
              v105 = -[GEOWiFiAP initWithDictionary:](v104, "initWithDictionary:", v103);
            v106 = (void *)v105;
            objc_msgSend(v5, "addNearbyBSS:", v105);

          }
        }
        v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v208, v229, 16);
      }
      while (v100);
    }

    v4 = v186;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feedback"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v206 = 0u;
    v207 = 0u;
    v204 = 0u;
    v205 = 0u;
    v108 = v107;
    v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v204, v228, 16);
    if (v109)
    {
      v110 = v109;
      v111 = *(_QWORD *)v205;
      do
      {
        for (m = 0; m != v110; ++m)
        {
          if (*(_QWORD *)v205 != v111)
            objc_enumerationMutation(v108);
          v113 = *(_QWORD *)(*((_QWORD *)&v204 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v114 = [GEOWiFiQualityFeedback alloc];
            if ((a3 & 1) != 0)
              v115 = -[GEOWiFiQualityFeedback initWithJSON:](v114, "initWithJSON:", v113);
            else
              v115 = -[GEOWiFiQualityFeedback initWithDictionary:](v114, "initWithDictionary:", v113);
            v116 = (void *)v115;
            objc_msgSend(v5, "addFeedback:", v115);

          }
        }
        v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v204, v228, 16);
      }
      while (v110);
    }

    v4 = v186;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v118 = (void *)objc_msgSend(v117, "copy");
    objc_msgSend(v5, "setIdentifier:", v118);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("roamStates"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v202 = 0u;
    v203 = 0u;
    v200 = 0u;
    v201 = 0u;
    v120 = v119;
    v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v200, v227, 16);
    if (v121)
    {
      v122 = v121;
      v123 = *(_QWORD *)v201;
      do
      {
        for (n = 0; n != v122; ++n)
        {
          if (*(_QWORD *)v201 != v123)
            objc_enumerationMutation(v120);
          v125 = *(_QWORD *)(*((_QWORD *)&v200 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v126 = [GEOWiFiConnectionRoamState alloc];
            if ((a3 & 1) != 0)
              v127 = -[GEOWiFiConnectionRoamState initWithJSON:](v126, "initWithJSON:", v125);
            else
              v127 = -[GEOWiFiConnectionRoamState initWithDictionary:](v126, "initWithDictionary:", v125);
            v128 = (void *)v127;
            objc_msgSend(v5, "addRoamStates:", v127);

          }
        }
        v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v200, v227, 16);
      }
      while (v122);
    }

    v4 = v186;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speedTest"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v198 = 0u;
    v199 = 0u;
    v196 = 0u;
    v197 = 0u;
    v130 = v129;
    v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v196, v226, 16);
    if (v131)
    {
      v132 = v131;
      v133 = *(_QWORD *)v197;
      do
      {
        for (ii = 0; ii != v132; ++ii)
        {
          if (*(_QWORD *)v197 != v133)
            objc_enumerationMutation(v130);
          v135 = *(_QWORD *)(*((_QWORD *)&v196 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v136 = [GEOWiFiConnectionSpeedTest alloc];
            if ((a3 & 1) != 0)
              v137 = -[GEOWiFiConnectionSpeedTest initWithJSON:](v136, "initWithJSON:", v135);
            else
              v137 = -[GEOWiFiConnectionSpeedTest initWithDictionary:](v136, "initWithDictionary:", v135);
            v138 = (void *)v137;
            objc_msgSend(v5, "addSpeedTest:", v137);

          }
        }
        v132 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v196, v226, 16);
      }
      while (v132);
    }

    v4 = v186;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sslConnectionCount"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setSslConnectionCount:", objc_msgSend(v139, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sslErrorCount"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setSslErrorCount:", objc_msgSend(v140, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("apMode"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v142 = v141;
    if ((objc_msgSend(v142, "isEqualToString:", CFSTR("UNKNOWN_AP_MODE")) & 1) != 0)
    {
      v143 = 0;
    }
    else if ((objc_msgSend(v142, "isEqualToString:", CFSTR("IBSS")) & 1) != 0)
    {
      v143 = 1;
    }
    else if ((objc_msgSend(v142, "isEqualToString:", CFSTR("INFRA")) & 1) != 0)
    {
      v143 = 2;
    }
    else if (objc_msgSend(v142, "isEqualToString:", CFSTR("ANY")))
    {
      v143 = 3;
    }
    else
    {
      v143 = 0;
    }

LABEL_389:
    objc_msgSend(v5, "setApMode:", v143);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v143 = objc_msgSend(v141, "intValue");
      goto LABEL_389;
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientAssociationSubreason"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v145 = v144;
    if ((objc_msgSend(v145, "isEqualToString:", CFSTR("UNKNOWN_SUBREASON_TYPE")) & 1) != 0)
    {
      v146 = 0;
    }
    else if ((objc_msgSend(v145, "isEqualToString:", CFSTR("SETTINGS")) & 1) != 0)
    {
      v146 = 1;
    }
    else if ((objc_msgSend(v145, "isEqualToString:", CFSTR("SETUP")) & 1) != 0)
    {
      v146 = 2;
    }
    else if ((objc_msgSend(v145, "isEqualToString:", CFSTR("CONTROL_CENTER")) & 1) != 0)
    {
      v146 = 3;
    }
    else if ((objc_msgSend(v145, "isEqualToString:", CFSTR("RECOMMENDATION")) & 1) != 0)
    {
      v146 = 4;
    }
    else if ((objc_msgSend(v145, "isEqualToString:", CFSTR("QR")) & 1) != 0)
    {
      v146 = 5;
    }
    else if ((objc_msgSend(v145, "isEqualToString:", CFSTR("ATJ")) & 1) != 0)
    {
      v146 = 6;
    }
    else if ((objc_msgSend(v145, "isEqualToString:", CFSTR("APPLICATION")) & 1) != 0)
    {
      v146 = 7;
    }
    else if (objc_msgSend(v145, "isEqualToString:", CFSTR("WALLET")))
    {
      v146 = 8;
    }
    else
    {
      v146 = 0;
    }

LABEL_413:
    objc_msgSend(v5, "setClientAssociationSubreason:", v146);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v146 = objc_msgSend(v144, "intValue");
      goto LABEL_413;
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v148 = v147;
    if ((objc_msgSend(v148, "isEqualToString:", CFSTR("UNKNOWN_HARVEST_TYPE")) & 1) != 0)
    {
      v149 = 0;
    }
    else if ((objc_msgSend(v148, "isEqualToString:", CFSTR("CONNECTION")) & 1) != 0)
    {
      v149 = 1;
    }
    else if (objc_msgSend(v148, "isEqualToString:", CFSTR("LABEL")))
    {
      v149 = 2;
    }
    else
    {
      v149 = 0;
    }

LABEL_425:
    objc_msgSend(v5, "setType:", v149);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v149 = objc_msgSend(v147, "intValue");
      goto LABEL_425;
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v151 = [GEOWiFiHarvestLabel alloc];
    if ((a3 & 1) != 0)
      v152 = -[GEOWiFiHarvestLabel initWithJSON:](v151, "initWithJSON:", v150);
    else
      v152 = -[GEOWiFiHarvestLabel initWithDictionary:](v151, "initWithDictionary:", v150);
    v153 = (void *)v152;
    objc_msgSend(v5, "setLabel:", v152);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("passpointInfo"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v155 = [GEOWiFiPasspointInfo alloc];
    if ((a3 & 1) != 0)
      v156 = -[GEOWiFiPasspointInfo initWithJSON:](v155, "initWithJSON:", v154);
    else
      v156 = -[GEOWiFiPasspointInfo initWithDictionary:](v155, "initWithDictionary:", v154);
    v157 = (void *)v156;
    objc_msgSend(v5, "setPasspointInfo:", v156);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hotspotHelperProvider"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v194 = 0u;
    v195 = 0u;
    v192 = 0u;
    v193 = 0u;
    v159 = v158;
    v160 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v192, v225, 16);
    if (v160)
    {
      v161 = v160;
      v162 = *(_QWORD *)v193;
      do
      {
        for (jj = 0; jj != v161; ++jj)
        {
          if (*(_QWORD *)v193 != v162)
            objc_enumerationMutation(v159);
          v164 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * jj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v165 = (void *)objc_msgSend(v164, "copy");
            objc_msgSend(v5, "addHotspotHelperProvider:", v165);

          }
        }
        v161 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v192, v225, 16);
      }
      while (v161);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nameAttributes"));
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v190 = 0u;
    v191 = 0u;
    v188 = 0u;
    v189 = 0u;
    v185 = v166;
    v167 = v166;
    v168 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v188, v224, 16);
    if (!v168)
      goto LABEL_467;
    v169 = v168;
    v170 = *(_QWORD *)v189;
    while (1)
    {
      for (kk = 0; kk != v169; ++kk)
      {
        if (*(_QWORD *)v189 != v170)
          objc_enumerationMutation(v167);
        v172 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * kk);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v173 = v172;
          if ((objc_msgSend(v173, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
          {
            v174 = 0;
          }
          else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("INDICATES_NOT_PUBLIC")) & 1) != 0)
          {
            v174 = 1;
          }
          else if (objc_msgSend(v173, "isEqualToString:", CFSTR("INDICATES_PUBLIC")))
          {
            v174 = 2;
          }
          else
          {
            v174 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v174 = objc_msgSend(v172, "intValue");
        }
        objc_msgSend(v5, "addNameAttributes:", v174);
      }
      v169 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v188, v224, 16);
      if (!v169)
      {
LABEL_467:

        v166 = v185;
        v4 = v186;
        break;
      }
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dohAvailability"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v176 = v175;
    if ((objc_msgSend(v176, "isEqualToString:", CFSTR("UNKNOWN_DNS_AVAILABILITY")) & 1) != 0)
    {
      v177 = 0;
    }
    else if ((objc_msgSend(v176, "isEqualToString:", CFSTR("DOH_PERMITTED")) & 1) != 0)
    {
      v177 = 1;
    }
    else if (objc_msgSend(v176, "isEqualToString:", CFSTR("DOH_BLOCKED")))
    {
      v177 = 2;
    }
    else
    {
      v177 = 0;
    }

LABEL_479:
    objc_msgSend(v5, "setDohAvailability:", v177);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v177 = objc_msgSend(v175, "intValue");
      goto LABEL_479;
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("beaconInfo"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v179 = [GEOWiFiBeaconInfo alloc];
    if ((a3 & 1) != 0)
      v180 = -[GEOWiFiBeaconInfo initWithJSON:](v179, "initWithJSON:", v178);
    else
      v180 = -[GEOWiFiBeaconInfo initWithDictionary:](v179, "initWithDictionary:", v178);
    v181 = (void *)v180;
    objc_msgSend(v5, "setBeaconInfo:", v180);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responsivenessScore"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v182, "doubleValue");
    objc_msgSend(v5, "setResponsivenessScore:");
  }

  a1 = v5;
LABEL_488:

  return a1;
}

- (GEOWiFiConnectionQuality)initWithJSON:(id)a3
{
  return (GEOWiFiConnectionQuality *)-[GEOWiFiConnectionQuality _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_322;
    else
      v8 = (int *)&readAll__nonRecursiveTag_323;
    GEOWiFiConnectionQualityReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOWiFiConnectionQualityCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiConnectionQualityIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiConnectionQualityReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $D78CFDED11D8BA562E7494422B5D96BB *p_flags;
  uint64_t flags;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  $D78CFDED11D8BA562E7494422B5D96BB *v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t n;
  uint64_t v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t ii;
  unint64_t v39;
  PBDataReader *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
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
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOWiFiConnectionQualityIsDirty((uint64_t)self))
  {
    v40 = self->_reader;
    objc_sync_enter(v40);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v41);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v40);
    goto LABEL_173;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOWiFiConnectionQuality readAll:](self, "readAll:", 0);
  if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  p_flags = &self->_flags;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x400) != 0)
  {
    PBDataWriterWriteUint64Field();
    flags = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x40) == 0)
    {
LABEL_9:
      if ((flags & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_134;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_11:
    if ((flags & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_12:
    if ((flags & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x20000) == 0)
  {
LABEL_13:
    if ((flags & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_14:
    if ((flags & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_15:
    if ((flags & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_16:
    if ((flags & 2) == 0)
      goto LABEL_17;
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_17:
    if ((flags & 8) == 0)
      goto LABEL_18;
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_18:
    if ((flags & 1) == 0)
      goto LABEL_19;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_19:
    if ((flags & 4) == 0)
      goto LABEL_20;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_20:
    if ((flags & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x2000) == 0)
  {
LABEL_21:
    if ((flags & 0x10) == 0)
      goto LABEL_22;
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_22:
    if ((flags & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000) == 0)
  {
LABEL_23:
    if ((flags & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x10000) == 0)
  {
LABEL_24:
    if ((flags & 0x2000000000) == 0)
      goto LABEL_25;
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x2000000000) == 0)
  {
LABEL_25:
    if ((flags & 0x800000000) == 0)
      goto LABEL_26;
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteFloatField();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x800000000) == 0)
  {
LABEL_26:
    if ((flags & 0x8000000000) == 0)
      goto LABEL_27;
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteFloatField();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000000) == 0)
  {
LABEL_27:
    if ((flags & 0x1000000000) == 0)
      goto LABEL_28;
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteFloatField();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000) == 0)
  {
LABEL_28:
    if ((flags & 0x400000000) == 0)
      goto LABEL_29;
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteFloatField();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x400000000) == 0)
  {
LABEL_29:
    if ((flags & 0x4000000000) == 0)
      goto LABEL_30;
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteFloatField();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000000) == 0)
  {
LABEL_30:
    if ((flags & 0x800000000000) == 0)
      goto LABEL_31;
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteFloatField();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x800000000000) == 0)
  {
LABEL_31:
    if ((flags & 0x800000) == 0)
      goto LABEL_32;
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteBOOLField();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x800000) == 0)
  {
LABEL_32:
    if ((flags & 0x8000000) == 0)
      goto LABEL_33;
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteUint32Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000) == 0)
  {
LABEL_33:
    if ((flags & 0x4000000) == 0)
      goto LABEL_34;
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteUint32Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000) == 0)
  {
LABEL_34:
    if ((flags & 0x10000000000) == 0)
      goto LABEL_35;
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteUint32Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x10000000000) == 0)
  {
LABEL_35:
    if ((flags & 0x20000000000) == 0)
      goto LABEL_36;
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteInt32Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x20000000000) == 0)
  {
LABEL_36:
    if ((flags & 0x2000000) == 0)
      goto LABEL_37;
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteInt32Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x2000000) == 0)
  {
LABEL_37:
    if ((flags & 0x200000000) == 0)
      goto LABEL_38;
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteInt32Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x200000000) == 0)
  {
LABEL_38:
    if ((flags & 0x40000) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_162:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_flags & 0x40000) != 0)
LABEL_39:
    PBDataWriterWriteUint64Field();
LABEL_40:
  if (self->_location)
    PBDataWriterWriteSubmessage();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x400000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v8 = (uint64_t)self->_flags;
  }
  if ((v8 & 0x100000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_traits.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_traits.count);
  }
  v10 = (uint64_t)self->_flags;
  if ((v10 & 0x1000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v10 = (uint64_t)self->_flags;
  }
  if ((v10 & 0x200000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_authTraits.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_authTraits.count);
  }
  v12 = &self->_flags;
  v13 = (uint64_t)self->_flags;
  if ((v13 & 0x80000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v13 = *(_QWORD *)v12;
    if ((*(_QWORD *)v12 & 0x100000000000) == 0)
    {
LABEL_58:
      if ((v13 & 0x8000000000000) == 0)
        goto LABEL_59;
      goto LABEL_166;
    }
  }
  else if ((v13 & 0x100000000000) == 0)
  {
    goto LABEL_58;
  }
  PBDataWriterWriteFloatField();
  v13 = (uint64_t)self->_flags;
  if ((v13 & 0x8000000000000) == 0)
  {
LABEL_59:
    if ((v13 & 0x4000000000000) == 0)
      goto LABEL_60;
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteBOOLField();
  v13 = (uint64_t)self->_flags;
  if ((v13 & 0x4000000000000) == 0)
  {
LABEL_60:
    if ((v13 & 0x2000000000000) == 0)
      goto LABEL_61;
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteBOOLField();
  v13 = (uint64_t)self->_flags;
  if ((v13 & 0x2000000000000) == 0)
  {
LABEL_61:
    if ((v13 & 0x1000000000000) == 0)
      goto LABEL_62;
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteBOOLField();
  v13 = (uint64_t)self->_flags;
  if ((v13 & 0x1000000000000) == 0)
  {
LABEL_62:
    if ((v13 & 0x400000) == 0)
      goto LABEL_63;
LABEL_170:
    PBDataWriterWriteInt32Field();
    if ((*(_QWORD *)&self->_flags & 0x20000000) == 0)
      goto LABEL_65;
    goto LABEL_64;
  }
LABEL_169:
  PBDataWriterWriteBOOLField();
  v13 = (uint64_t)self->_flags;
  if ((v13 & 0x400000) != 0)
    goto LABEL_170;
LABEL_63:
  if ((v13 & 0x20000000) != 0)
LABEL_64:
    PBDataWriterWriteInt32Field();
LABEL_65:
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v14 = self->_essMembers;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v63 != v16)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    }
    while (v15);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v18 = self->_nearbyBSSs;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v59 != v20)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    }
    while (v19);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v22 = self->_feedbacks;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v55;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v55 != v24)
          objc_enumerationMutation(v22);
        PBDataWriterWriteSubmessage();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
    }
    while (v23);
  }

  if (self->_identifier)
    PBDataWriterWriteStringField();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v26 = self->_roamStates;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v51;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v51 != v28)
          objc_enumerationMutation(v26);
        PBDataWriterWriteSubmessage();
      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
    }
    while (v27);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v30 = self->_speedTests;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v46, v67, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v47;
    do
    {
      for (n = 0; n != v31; ++n)
      {
        if (*(_QWORD *)v47 != v32)
          objc_enumerationMutation(v30);
        PBDataWriterWriteSubmessage();
      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v46, v67, 16);
    }
    while (v31);
  }

  v34 = (uint64_t)self->_flags;
  if ((v34 & 0x40000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v34 = (uint64_t)self->_flags;
  }
  if ((v34 & 0x80000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v34 = (uint64_t)self->_flags;
  }
  if ((v34 & 0x100000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v34 = (uint64_t)self->_flags;
  }
  if ((v34 & 0x10000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v34 = (uint64_t)self->_flags;
  }
  if ((v34 & 0x200000000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_label)
    PBDataWriterWriteSubmessage();
  if (self->_passpointInfo)
    PBDataWriterWriteSubmessage();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v35 = self->_hotspotHelperProviders;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v66, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v43;
    do
    {
      for (ii = 0; ii != v36; ++ii)
      {
        if (*(_QWORD *)v43 != v37)
          objc_enumerationMutation(v35);
        PBDataWriterWriteStringField();
      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v66, 16);
    }
    while (v36);
  }

  if (self->_nameAttributes.count)
  {
    v39 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v39;
    }
    while (v39 < self->_nameAttributes.count);
  }
  if ((*(_QWORD *)&self->_flags & 0x40000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_beaconInfo)
    PBDataWriterWriteSubmessage();
  if ((*(_QWORD *)&self->_flags & 0x8000) != 0)
    PBDataWriterWriteDoubleField();
LABEL_173:

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOWiFiConnectionQualityClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOWiFiConnectionQuality _readLocation]((uint64_t)self);
  return -[GEOLocation hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  $D78CFDED11D8BA562E7494422B5D96BB *p_flags;
  uint64_t flags;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t j;
  $D78CFDED11D8BA562E7494422B5D96BB *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t k;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t m;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t n;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t ii;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t jj;
  void *v36;
  $D78CFDED11D8BA562E7494422B5D96BB *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t kk;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t mm;
  id *v46;
  id *v47;

  v47 = (id *)a3;
  -[GEOWiFiConnectionQuality readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v47 + 1, self->_reader);
  *((_DWORD *)v47 + 86) = self->_readerMarkPos;
  *((_DWORD *)v47 + 87) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v47;
  if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
  {
    v47[41] = (id)self->_timestamp;
    v47[59] = (id)((unint64_t)v47[59] | 0x80000);
  }
  if (self->_uniqueID)
  {
    objc_msgSend(v47, "setUniqueID:");
    v4 = v47;
  }
  p_flags = &self->_flags;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x400) != 0)
  {
    v4[29] = (id)self->_overAllStay;
    v4[59] = (id)((unint64_t)v4[59] | 0x400);
    flags = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x40) == 0)
    {
LABEL_7:
      if ((flags & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_114;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_7;
  }
  v4[19] = (id)self->_faultyStay;
  v4[59] = (id)((unint64_t)v4[59] | 0x40);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_115;
  }
LABEL_114:
  v4[25] = (id)self->_lowLQMStay;
  v4[59] = (id)((unint64_t)v4[59] | 0x80);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_9:
    if ((flags & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_116;
  }
LABEL_115:
  v4[26] = (id)self->_lowqStay;
  v4[59] = (id)((unint64_t)v4[59] | 0x100);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_10:
    if ((flags & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_117;
  }
LABEL_116:
  v4[27] = (id)self->_lqmTranCount;
  v4[59] = (id)((unint64_t)v4[59] | 0x200);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x20000) == 0)
  {
LABEL_11:
    if ((flags & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_118;
  }
LABEL_117:
  v4[39] = (id)self->_successfulConnections;
  v4[59] = (id)((unint64_t)v4[59] | 0x20000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_119;
  }
LABEL_118:
  v4[18] = (id)self->_failedConnections;
  v4[59] = (id)((unint64_t)v4[59] | 0x20);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_120;
  }
LABEL_119:
  v4[30] = (id)self->_packetsIn;
  v4[59] = (id)((unint64_t)v4[59] | 0x800);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_14:
    if ((flags & 2) == 0)
      goto LABEL_15;
    goto LABEL_121;
  }
LABEL_120:
  v4[31] = (id)self->_packetsOut;
  v4[59] = (id)((unint64_t)v4[59] | 0x1000);
  flags = (uint64_t)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_15:
    if ((flags & 8) == 0)
      goto LABEL_16;
    goto LABEL_122;
  }
LABEL_121:
  v4[13] = (id)self->_bytesInTotal;
  v4[59] = (id)((unint64_t)v4[59] | 2);
  flags = (uint64_t)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_16:
    if ((flags & 1) == 0)
      goto LABEL_17;
    goto LABEL_123;
  }
LABEL_122:
  v4[15] = (id)self->_bytesOutTotal;
  v4[59] = (id)((unint64_t)v4[59] | 8);
  flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_17:
    if ((flags & 4) == 0)
      goto LABEL_18;
    goto LABEL_124;
  }
LABEL_123:
  v4[12] = (id)self->_bytesInActive;
  v4[59] = (id)((unint64_t)v4[59] | 1);
  flags = (uint64_t)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_18:
    if ((flags & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_125;
  }
LABEL_124:
  v4[14] = (id)self->_bytesOutActive;
  v4[59] = (id)((unint64_t)v4[59] | 4);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x2000) == 0)
  {
LABEL_19:
    if ((flags & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_126;
  }
LABEL_125:
  v4[33] = (id)self->_reTxBytes;
  v4[59] = (id)((unint64_t)v4[59] | 0x2000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_20:
    if ((flags & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_127;
  }
LABEL_126:
  v4[16] = (id)self->_dataStalls;
  v4[59] = (id)((unint64_t)v4[59] | 0x10);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000) == 0)
  {
LABEL_21:
    if ((flags & 0x10000) == 0)
      goto LABEL_22;
    goto LABEL_128;
  }
LABEL_127:
  v4[34] = (id)self->_receivedDupes;
  v4[59] = (id)((unint64_t)v4[59] | 0x4000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x10000) == 0)
  {
LABEL_22:
    if ((flags & 0x2000000000) == 0)
      goto LABEL_23;
    goto LABEL_129;
  }
LABEL_128:
  v4[37] = (id)self->_rxOutOfOrderBytes;
  v4[59] = (id)((unint64_t)v4[59] | 0x10000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x2000000000) == 0)
  {
LABEL_23:
    if ((flags & 0x800000000) == 0)
      goto LABEL_24;
    goto LABEL_130;
  }
LABEL_129:
  *((_DWORD *)v4 + 106) = LODWORD(self->_roundTripTimeMin);
  v4[59] = (id)((unint64_t)v4[59] | 0x2000000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x800000000) == 0)
  {
LABEL_24:
    if ((flags & 0x8000000000) == 0)
      goto LABEL_25;
    goto LABEL_131;
  }
LABEL_130:
  *((_DWORD *)v4 + 104) = LODWORD(self->_roundTripTimeAvg);
  v4[59] = (id)((unint64_t)v4[59] | 0x800000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000000) == 0)
  {
LABEL_25:
    if ((flags & 0x1000000000) == 0)
      goto LABEL_26;
    goto LABEL_132;
  }
LABEL_131:
  *((_DWORD *)v4 + 108) = LODWORD(self->_roundTripTimeVar);
  v4[59] = (id)((unint64_t)v4[59] | 0x8000000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000) == 0)
  {
LABEL_26:
    if ((flags & 0x400000000) == 0)
      goto LABEL_27;
    goto LABEL_133;
  }
LABEL_132:
  *((_DWORD *)v4 + 105) = LODWORD(self->_roundTripTimeMinActive);
  v4[59] = (id)((unint64_t)v4[59] | 0x1000000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x400000000) == 0)
  {
LABEL_27:
    if ((flags & 0x4000000000) == 0)
      goto LABEL_28;
    goto LABEL_134;
  }
LABEL_133:
  *((_DWORD *)v4 + 103) = LODWORD(self->_roundTripTimeAvgActive);
  v4[59] = (id)((unint64_t)v4[59] | 0x400000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000000) == 0)
  {
LABEL_28:
    if ((flags & 0x800000000000) == 0)
      goto LABEL_29;
    goto LABEL_135;
  }
LABEL_134:
  *((_DWORD *)v4 + 107) = LODWORD(self->_roundTripTimeVarActive);
  v4[59] = (id)((unint64_t)v4[59] | 0x4000000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x800000000000) == 0)
  {
LABEL_29:
    if ((flags & 0x800000) == 0)
      goto LABEL_30;
    goto LABEL_136;
  }
LABEL_135:
  *((_BYTE *)v4 + 464) = self->_hotspot20;
  v4[59] = (id)((unint64_t)v4[59] | 0x800000000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x800000) == 0)
  {
LABEL_30:
    if ((flags & 0x8000000) == 0)
      goto LABEL_31;
    goto LABEL_137;
  }
LABEL_136:
  *((_DWORD *)v4 + 92) = self->_band;
  v4[59] = (id)((unint64_t)v4[59] | 0x800000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000) == 0)
  {
LABEL_31:
    if ((flags & 0x4000000) == 0)
      goto LABEL_32;
    goto LABEL_138;
  }
LABEL_137:
  *((_DWORD *)v4 + 96) = self->_channel;
  v4[59] = (id)((unint64_t)v4[59] | 0x8000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000) == 0)
  {
LABEL_32:
    if ((flags & 0x10000000000) == 0)
      goto LABEL_33;
    goto LABEL_139;
  }
LABEL_138:
  *((_DWORD *)v4 + 95) = self->_channelWidth;
  v4[59] = (id)((unint64_t)v4[59] | 0x4000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x10000000000) == 0)
  {
LABEL_33:
    if ((flags & 0x20000000000) == 0)
      goto LABEL_34;
    goto LABEL_140;
  }
LABEL_139:
  *((_DWORD *)v4 + 109) = self->_rssi;
  v4[59] = (id)((unint64_t)v4[59] | 0x10000000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x20000000000) == 0)
  {
LABEL_34:
    if ((flags & 0x2000000) == 0)
      goto LABEL_35;
    goto LABEL_141;
  }
LABEL_140:
  *((_DWORD *)v4 + 110) = self->_snr;
  v4[59] = (id)((unint64_t)v4[59] | 0x20000000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x2000000) == 0)
  {
LABEL_35:
    if ((flags & 0x200000000) == 0)
      goto LABEL_36;
    goto LABEL_142;
  }
LABEL_141:
  *((_DWORD *)v4 + 94) = self->_cca;
  v4[59] = (id)((unint64_t)v4[59] | 0x2000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x200000000) == 0)
  {
LABEL_36:
    if ((flags & 0x40000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_142:
  *((_DWORD *)v4 + 102) = self->_phyMode;
  v4[59] = (id)((unint64_t)v4[59] | 0x200000000);
  if ((*(_QWORD *)&self->_flags & 0x40000) != 0)
  {
LABEL_37:
    v4[40] = (id)self->_timeOfDay;
    v4[59] = (id)((unint64_t)v4[59] | 0x40000);
  }
LABEL_38:
  if (self->_location)
  {
    objc_msgSend(v47, "setLocation:");
    v4 = v47;
  }
  v7 = (uint64_t)self->_flags;
  if ((v7 & 0x400000000000) != 0)
  {
    *((_DWORD *)v4 + 115) = self->_wasCaptiveFlag;
    v4[59] = (id)((unint64_t)v4[59] | 0x400000000000);
    v7 = (uint64_t)self->_flags;
  }
  if ((v7 & 0x100000000) != 0)
  {
    *((_DWORD *)v4 + 101) = self->_networkType;
    v4[59] = (id)((unint64_t)v4[59] | 0x100000000);
  }
  if (-[GEOWiFiConnectionQuality traitsCount](self, "traitsCount"))
  {
    objc_msgSend(v47, "clearTraits");
    v8 = -[GEOWiFiConnectionQuality traitsCount](self, "traitsCount");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
        objc_msgSend(v47, "addTraits:", -[GEOWiFiConnectionQuality traitsAtIndex:](self, "traitsAtIndex:", i));
    }
  }
  v11 = (uint64_t)self->_flags;
  if ((v11 & 0x1000000) != 0)
  {
    *((_DWORD *)v47 + 93) = self->_captiveDetermination;
    v47[59] = (id)((unint64_t)v47[59] | 0x1000000);
    v11 = (uint64_t)self->_flags;
  }
  if ((v11 & 0x200000) != 0)
  {
    *((_DWORD *)v47 + 90) = self->_associationLength;
    v47[59] = (id)((unint64_t)v47[59] | 0x200000);
  }
  if (-[GEOWiFiConnectionQuality authTraitsCount](self, "authTraitsCount"))
  {
    objc_msgSend(v47, "clearAuthTraits");
    v12 = -[GEOWiFiConnectionQuality authTraitsCount](self, "authTraitsCount");
    if (v12)
    {
      v13 = v12;
      for (j = 0; j != v13; ++j)
        objc_msgSend(v47, "addAuthTraits:", -[GEOWiFiConnectionQuality authTraitsAtIndex:](self, "authTraitsAtIndex:", j));
    }
  }
  v15 = &self->_flags;
  v16 = (uint64_t)self->_flags;
  if ((v16 & 0x80000000) != 0)
  {
    *((_DWORD *)v47 + 100) = self->_networkOrigin;
    v47[59] = (id)((unint64_t)v47[59] | 0x80000000);
    v16 = *(_QWORD *)v15;
    if ((*(_QWORD *)v15 & 0x100000000000) == 0)
    {
LABEL_58:
      if ((v16 & 0x8000000000000) == 0)
        goto LABEL_59;
      goto LABEL_146;
    }
  }
  else if ((v16 & 0x100000000000) == 0)
  {
    goto LABEL_58;
  }
  *((_DWORD *)v47 + 113) = LODWORD(self->_topDLRate);
  v47[59] = (id)((unint64_t)v47[59] | 0x100000000000);
  v16 = (uint64_t)self->_flags;
  if ((v16 & 0x8000000000000) == 0)
  {
LABEL_59:
    if ((v16 & 0x4000000000000) == 0)
      goto LABEL_60;
    goto LABEL_147;
  }
LABEL_146:
  *((_BYTE *)v47 + 468) = self->_lowInternetUL;
  v47[59] = (id)((unint64_t)v47[59] | 0x8000000000000);
  v16 = (uint64_t)self->_flags;
  if ((v16 & 0x4000000000000) == 0)
  {
LABEL_60:
    if ((v16 & 0x2000000000000) == 0)
      goto LABEL_61;
    goto LABEL_148;
  }
LABEL_147:
  *((_BYTE *)v47 + 467) = self->_lowInternetDL;
  v47[59] = (id)((unint64_t)v47[59] | 0x4000000000000);
  v16 = (uint64_t)self->_flags;
  if ((v16 & 0x2000000000000) == 0)
  {
LABEL_61:
    if ((v16 & 0x1000000000000) == 0)
      goto LABEL_62;
    goto LABEL_149;
  }
LABEL_148:
  *((_BYTE *)v47 + 466) = self->_isKnownGood;
  v47[59] = (id)((unint64_t)v47[59] | 0x2000000000000);
  v16 = (uint64_t)self->_flags;
  if ((v16 & 0x1000000000000) == 0)
  {
LABEL_62:
    if ((v16 & 0x400000) == 0)
      goto LABEL_63;
LABEL_150:
    *((_DWORD *)v47 + 91) = self->_associationReason;
    v47[59] = (id)((unint64_t)v47[59] | 0x400000);
    if ((*(_QWORD *)&self->_flags & 0x20000000) == 0)
      goto LABEL_65;
    goto LABEL_64;
  }
LABEL_149:
  *((_BYTE *)v47 + 465) = self->_isEdgeBSS;
  v47[59] = (id)((unint64_t)v47[59] | 0x1000000000000);
  v16 = (uint64_t)self->_flags;
  if ((v16 & 0x400000) != 0)
    goto LABEL_150;
LABEL_63:
  if ((v16 & 0x20000000) != 0)
  {
LABEL_64:
    *((_DWORD *)v47 + 98) = self->_disassociationReason;
    v47[59] = (id)((unint64_t)v47[59] | 0x20000000);
  }
LABEL_65:
  if (-[GEOWiFiConnectionQuality essMembersCount](self, "essMembersCount"))
  {
    objc_msgSend(v47, "clearEssMembers");
    v17 = -[GEOWiFiConnectionQuality essMembersCount](self, "essMembersCount");
    if (v17)
    {
      v18 = v17;
      for (k = 0; k != v18; ++k)
      {
        -[GEOWiFiConnectionQuality essMembersAtIndex:](self, "essMembersAtIndex:", k);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addEssMembers:", v20);

      }
    }
  }
  if (-[GEOWiFiConnectionQuality nearbyBSSsCount](self, "nearbyBSSsCount"))
  {
    objc_msgSend(v47, "clearNearbyBSSs");
    v21 = -[GEOWiFiConnectionQuality nearbyBSSsCount](self, "nearbyBSSsCount");
    if (v21)
    {
      v22 = v21;
      for (m = 0; m != v22; ++m)
      {
        -[GEOWiFiConnectionQuality nearbyBSSAtIndex:](self, "nearbyBSSAtIndex:", m);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addNearbyBSS:", v24);

      }
    }
  }
  if (-[GEOWiFiConnectionQuality feedbacksCount](self, "feedbacksCount"))
  {
    objc_msgSend(v47, "clearFeedbacks");
    v25 = -[GEOWiFiConnectionQuality feedbacksCount](self, "feedbacksCount");
    if (v25)
    {
      v26 = v25;
      for (n = 0; n != v26; ++n)
      {
        -[GEOWiFiConnectionQuality feedbackAtIndex:](self, "feedbackAtIndex:", n);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addFeedback:", v28);

      }
    }
  }
  if (self->_identifier)
    objc_msgSend(v47, "setIdentifier:");
  if (-[GEOWiFiConnectionQuality roamStatesCount](self, "roamStatesCount"))
  {
    objc_msgSend(v47, "clearRoamStates");
    v29 = -[GEOWiFiConnectionQuality roamStatesCount](self, "roamStatesCount");
    if (v29)
    {
      v30 = v29;
      for (ii = 0; ii != v30; ++ii)
      {
        -[GEOWiFiConnectionQuality roamStatesAtIndex:](self, "roamStatesAtIndex:", ii);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addRoamStates:", v32);

      }
    }
  }
  if (-[GEOWiFiConnectionQuality speedTestsCount](self, "speedTestsCount"))
  {
    objc_msgSend(v47, "clearSpeedTests");
    v33 = -[GEOWiFiConnectionQuality speedTestsCount](self, "speedTestsCount");
    if (v33)
    {
      v34 = v33;
      for (jj = 0; jj != v34; ++jj)
      {
        -[GEOWiFiConnectionQuality speedTestAtIndex:](self, "speedTestAtIndex:", jj);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addSpeedTest:", v36);

      }
    }
  }
  v37 = &self->_flags;
  v38 = (uint64_t)self->_flags;
  if ((v38 & 0x40000000000) != 0)
  {
    *((_DWORD *)v47 + 111) = self->_sslConnectionCount;
    v47[59] = (id)((unint64_t)v47[59] | 0x40000000000);
    v38 = *(_QWORD *)v37;
    if ((*(_QWORD *)v37 & 0x80000000000) == 0)
    {
LABEL_89:
      if ((v38 & 0x100000) == 0)
        goto LABEL_90;
      goto LABEL_154;
    }
  }
  else if ((v38 & 0x80000000000) == 0)
  {
    goto LABEL_89;
  }
  *((_DWORD *)v47 + 112) = self->_sslErrorCount;
  v47[59] = (id)((unint64_t)v47[59] | 0x80000000000);
  v38 = (uint64_t)self->_flags;
  if ((v38 & 0x100000) == 0)
  {
LABEL_90:
    if ((v38 & 0x10000000) == 0)
      goto LABEL_91;
    goto LABEL_155;
  }
LABEL_154:
  *((_DWORD *)v47 + 89) = self->_apMode;
  v47[59] = (id)((unint64_t)v47[59] | 0x100000);
  v38 = (uint64_t)self->_flags;
  if ((v38 & 0x10000000) == 0)
  {
LABEL_91:
    if ((v38 & 0x200000000000) == 0)
      goto LABEL_93;
    goto LABEL_92;
  }
LABEL_155:
  *((_DWORD *)v47 + 97) = self->_clientAssociationSubreason;
  v47[59] = (id)((unint64_t)v47[59] | 0x10000000);
  if ((*(_QWORD *)&self->_flags & 0x200000000000) != 0)
  {
LABEL_92:
    *((_DWORD *)v47 + 114) = self->_type;
    v47[59] = (id)((unint64_t)v47[59] | 0x200000000000);
  }
LABEL_93:
  if (self->_label)
    objc_msgSend(v47, "setLabel:");
  if (self->_passpointInfo)
    objc_msgSend(v47, "setPasspointInfo:");
  if (-[GEOWiFiConnectionQuality hotspotHelperProvidersCount](self, "hotspotHelperProvidersCount"))
  {
    objc_msgSend(v47, "clearHotspotHelperProviders");
    v39 = -[GEOWiFiConnectionQuality hotspotHelperProvidersCount](self, "hotspotHelperProvidersCount");
    if (v39)
    {
      v40 = v39;
      for (kk = 0; kk != v40; ++kk)
      {
        -[GEOWiFiConnectionQuality hotspotHelperProviderAtIndex:](self, "hotspotHelperProviderAtIndex:", kk);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addHotspotHelperProvider:", v42);

      }
    }
  }
  if (-[GEOWiFiConnectionQuality nameAttributesCount](self, "nameAttributesCount"))
  {
    objc_msgSend(v47, "clearNameAttributes");
    v43 = -[GEOWiFiConnectionQuality nameAttributesCount](self, "nameAttributesCount");
    if (v43)
    {
      v44 = v43;
      for (mm = 0; mm != v44; ++mm)
        objc_msgSend(v47, "addNameAttributes:", -[GEOWiFiConnectionQuality nameAttributesAtIndex:](self, "nameAttributesAtIndex:", mm));
    }
  }
  v46 = v47;
  if ((*(_QWORD *)&self->_flags & 0x40000000) != 0)
  {
    *((_DWORD *)v47 + 99) = self->_dohAvailability;
    v47[59] = (id)((unint64_t)v47[59] | 0x40000000);
  }
  if (self->_beaconInfo)
  {
    objc_msgSend(v47, "setBeaconInfo:");
    v46 = v47;
  }
  if ((*(_QWORD *)&self->_flags & 0x8000) != 0)
  {
    v46[35] = *(id *)&self->_responsivenessScore;
    v46[59] = (id)((unint64_t)v46[59] | 0x8000);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  $D78CFDED11D8BA562E7494422B5D96BB *p_flags;
  uint64_t flags;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  $D78CFDED11D8BA562E7494422B5D96BB *v17;
  uint64_t v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  uint64_t v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  void *v45;
  $D78CFDED11D8BA562E7494422B5D96BB *v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t ii;
  void *v56;
  id v57;
  void *v58;
  id v59;
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
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 8) & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOWiFiConnectionQualityReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_110;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOWiFiConnectionQuality readAll:](self, "readAll:", 0);
  if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
  {
    *(_QWORD *)(v5 + 328) = self->_timestamp;
    *(_QWORD *)(v5 + 472) |= 0x80000uLL;
  }
  v9 = -[NSString copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v9;

  p_flags = &self->_flags;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x400) != 0)
  {
    *(_QWORD *)(v5 + 232) = self->_overAllStay;
    *(_QWORD *)(v5 + 472) |= 0x400uLL;
    flags = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x40) == 0)
    {
LABEL_9:
      if ((flags & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_113;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *(_QWORD *)(v5 + 152) = self->_faultyStay;
  *(_QWORD *)(v5 + 472) |= 0x40uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_114;
  }
LABEL_113:
  *(_QWORD *)(v5 + 200) = self->_lowLQMStay;
  *(_QWORD *)(v5 + 472) |= 0x80uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_11:
    if ((flags & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_115;
  }
LABEL_114:
  *(_QWORD *)(v5 + 208) = self->_lowqStay;
  *(_QWORD *)(v5 + 472) |= 0x100uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_12:
    if ((flags & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_116;
  }
LABEL_115:
  *(_QWORD *)(v5 + 216) = self->_lqmTranCount;
  *(_QWORD *)(v5 + 472) |= 0x200uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x20000) == 0)
  {
LABEL_13:
    if ((flags & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_117;
  }
LABEL_116:
  *(_QWORD *)(v5 + 312) = self->_successfulConnections;
  *(_QWORD *)(v5 + 472) |= 0x20000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_14:
    if ((flags & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_118;
  }
LABEL_117:
  *(_QWORD *)(v5 + 144) = self->_failedConnections;
  *(_QWORD *)(v5 + 472) |= 0x20uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_15:
    if ((flags & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_119;
  }
LABEL_118:
  *(_QWORD *)(v5 + 240) = self->_packetsIn;
  *(_QWORD *)(v5 + 472) |= 0x800uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_16:
    if ((flags & 2) == 0)
      goto LABEL_17;
    goto LABEL_120;
  }
LABEL_119:
  *(_QWORD *)(v5 + 248) = self->_packetsOut;
  *(_QWORD *)(v5 + 472) |= 0x1000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_17:
    if ((flags & 8) == 0)
      goto LABEL_18;
    goto LABEL_121;
  }
LABEL_120:
  *(_QWORD *)(v5 + 104) = self->_bytesInTotal;
  *(_QWORD *)(v5 + 472) |= 2uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_18:
    if ((flags & 1) == 0)
      goto LABEL_19;
    goto LABEL_122;
  }
LABEL_121:
  *(_QWORD *)(v5 + 120) = self->_bytesOutTotal;
  *(_QWORD *)(v5 + 472) |= 8uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_19:
    if ((flags & 4) == 0)
      goto LABEL_20;
    goto LABEL_123;
  }
LABEL_122:
  *(_QWORD *)(v5 + 96) = self->_bytesInActive;
  *(_QWORD *)(v5 + 472) |= 1uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_20:
    if ((flags & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_124;
  }
LABEL_123:
  *(_QWORD *)(v5 + 112) = self->_bytesOutActive;
  *(_QWORD *)(v5 + 472) |= 4uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x2000) == 0)
  {
LABEL_21:
    if ((flags & 0x10) == 0)
      goto LABEL_22;
    goto LABEL_125;
  }
LABEL_124:
  *(_QWORD *)(v5 + 264) = self->_reTxBytes;
  *(_QWORD *)(v5 + 472) |= 0x2000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_22:
    if ((flags & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_126;
  }
LABEL_125:
  *(_QWORD *)(v5 + 128) = self->_dataStalls;
  *(_QWORD *)(v5 + 472) |= 0x10uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000) == 0)
  {
LABEL_23:
    if ((flags & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_127;
  }
LABEL_126:
  *(_QWORD *)(v5 + 272) = self->_receivedDupes;
  *(_QWORD *)(v5 + 472) |= 0x4000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x10000) == 0)
  {
LABEL_24:
    if ((flags & 0x2000000000) == 0)
      goto LABEL_25;
    goto LABEL_128;
  }
LABEL_127:
  *(_QWORD *)(v5 + 296) = self->_rxOutOfOrderBytes;
  *(_QWORD *)(v5 + 472) |= 0x10000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x2000000000) == 0)
  {
LABEL_25:
    if ((flags & 0x800000000) == 0)
      goto LABEL_26;
    goto LABEL_129;
  }
LABEL_128:
  *(float *)(v5 + 424) = self->_roundTripTimeMin;
  *(_QWORD *)(v5 + 472) |= 0x2000000000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x800000000) == 0)
  {
LABEL_26:
    if ((flags & 0x8000000000) == 0)
      goto LABEL_27;
    goto LABEL_130;
  }
LABEL_129:
  *(float *)(v5 + 416) = self->_roundTripTimeAvg;
  *(_QWORD *)(v5 + 472) |= 0x800000000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000000) == 0)
  {
LABEL_27:
    if ((flags & 0x1000000000) == 0)
      goto LABEL_28;
    goto LABEL_131;
  }
LABEL_130:
  *(float *)(v5 + 432) = self->_roundTripTimeVar;
  *(_QWORD *)(v5 + 472) |= 0x8000000000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000) == 0)
  {
LABEL_28:
    if ((flags & 0x400000000) == 0)
      goto LABEL_29;
    goto LABEL_132;
  }
LABEL_131:
  *(float *)(v5 + 420) = self->_roundTripTimeMinActive;
  *(_QWORD *)(v5 + 472) |= 0x1000000000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x400000000) == 0)
  {
LABEL_29:
    if ((flags & 0x4000000000) == 0)
      goto LABEL_30;
    goto LABEL_133;
  }
LABEL_132:
  *(float *)(v5 + 412) = self->_roundTripTimeAvgActive;
  *(_QWORD *)(v5 + 472) |= 0x400000000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000000) == 0)
  {
LABEL_30:
    if ((flags & 0x800000000000) == 0)
      goto LABEL_31;
    goto LABEL_134;
  }
LABEL_133:
  *(float *)(v5 + 428) = self->_roundTripTimeVarActive;
  *(_QWORD *)(v5 + 472) |= 0x4000000000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x800000000000) == 0)
  {
LABEL_31:
    if ((flags & 0x800000) == 0)
      goto LABEL_32;
    goto LABEL_135;
  }
LABEL_134:
  *(_BYTE *)(v5 + 464) = self->_hotspot20;
  *(_QWORD *)(v5 + 472) |= 0x800000000000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x800000) == 0)
  {
LABEL_32:
    if ((flags & 0x8000000) == 0)
      goto LABEL_33;
    goto LABEL_136;
  }
LABEL_135:
  *(_DWORD *)(v5 + 368) = self->_band;
  *(_QWORD *)(v5 + 472) |= 0x800000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000) == 0)
  {
LABEL_33:
    if ((flags & 0x4000000) == 0)
      goto LABEL_34;
    goto LABEL_137;
  }
LABEL_136:
  *(_DWORD *)(v5 + 384) = self->_channel;
  *(_QWORD *)(v5 + 472) |= 0x8000000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000) == 0)
  {
LABEL_34:
    if ((flags & 0x10000000000) == 0)
      goto LABEL_35;
    goto LABEL_138;
  }
LABEL_137:
  *(_DWORD *)(v5 + 380) = self->_channelWidth;
  *(_QWORD *)(v5 + 472) |= 0x4000000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x10000000000) == 0)
  {
LABEL_35:
    if ((flags & 0x20000000000) == 0)
      goto LABEL_36;
    goto LABEL_139;
  }
LABEL_138:
  *(_DWORD *)(v5 + 436) = self->_rssi;
  *(_QWORD *)(v5 + 472) |= 0x10000000000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x20000000000) == 0)
  {
LABEL_36:
    if ((flags & 0x2000000) == 0)
      goto LABEL_37;
    goto LABEL_140;
  }
LABEL_139:
  *(_DWORD *)(v5 + 440) = self->_snr;
  *(_QWORD *)(v5 + 472) |= 0x20000000000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x2000000) == 0)
  {
LABEL_37:
    if ((flags & 0x200000000) == 0)
      goto LABEL_38;
    goto LABEL_141;
  }
LABEL_140:
  *(_DWORD *)(v5 + 376) = self->_cca;
  *(_QWORD *)(v5 + 472) |= 0x2000000uLL;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x200000000) == 0)
  {
LABEL_38:
    if ((flags & 0x40000) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_141:
  *(_DWORD *)(v5 + 408) = self->_phyMode;
  *(_QWORD *)(v5 + 472) |= 0x200000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x40000) != 0)
  {
LABEL_39:
    *(_QWORD *)(v5 + 320) = self->_timeOfDay;
    *(_QWORD *)(v5 + 472) |= 0x40000uLL;
  }
LABEL_40:
  v13 = -[GEOLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v13;

  v15 = (uint64_t)self->_flags;
  if ((v15 & 0x400000000000) != 0)
  {
    *(_DWORD *)(v5 + 460) = self->_wasCaptiveFlag;
    *(_QWORD *)(v5 + 472) |= 0x400000000000uLL;
    v15 = (uint64_t)self->_flags;
  }
  if ((v15 & 0x100000000) != 0)
  {
    *(_DWORD *)(v5 + 404) = self->_networkType;
    *(_QWORD *)(v5 + 472) |= 0x100000000uLL;
  }
  PBRepeatedInt32Copy();
  v16 = (uint64_t)self->_flags;
  if ((v16 & 0x1000000) != 0)
  {
    *(_DWORD *)(v5 + 372) = self->_captiveDetermination;
    *(_QWORD *)(v5 + 472) |= 0x1000000uLL;
    v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x200000) != 0)
  {
    *(_DWORD *)(v5 + 360) = self->_associationLength;
    *(_QWORD *)(v5 + 472) |= 0x200000uLL;
  }
  PBRepeatedInt32Copy();
  v17 = &self->_flags;
  v18 = (uint64_t)self->_flags;
  if ((v18 & 0x80000000) != 0)
  {
    *(_DWORD *)(v5 + 400) = self->_networkOrigin;
    *(_QWORD *)(v5 + 472) |= 0x80000000uLL;
    v18 = *(_QWORD *)v17;
    if ((*(_QWORD *)v17 & 0x100000000000) == 0)
    {
LABEL_50:
      if ((v18 & 0x8000000000000) == 0)
        goto LABEL_51;
      goto LABEL_145;
    }
  }
  else if ((v18 & 0x100000000000) == 0)
  {
    goto LABEL_50;
  }
  *(float *)(v5 + 452) = self->_topDLRate;
  *(_QWORD *)(v5 + 472) |= 0x100000000000uLL;
  v18 = (uint64_t)self->_flags;
  if ((v18 & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((v18 & 0x4000000000000) == 0)
      goto LABEL_52;
    goto LABEL_146;
  }
LABEL_145:
  *(_BYTE *)(v5 + 468) = self->_lowInternetUL;
  *(_QWORD *)(v5 + 472) |= 0x8000000000000uLL;
  v18 = (uint64_t)self->_flags;
  if ((v18 & 0x4000000000000) == 0)
  {
LABEL_52:
    if ((v18 & 0x2000000000000) == 0)
      goto LABEL_53;
    goto LABEL_147;
  }
LABEL_146:
  *(_BYTE *)(v5 + 467) = self->_lowInternetDL;
  *(_QWORD *)(v5 + 472) |= 0x4000000000000uLL;
  v18 = (uint64_t)self->_flags;
  if ((v18 & 0x2000000000000) == 0)
  {
LABEL_53:
    if ((v18 & 0x1000000000000) == 0)
      goto LABEL_54;
    goto LABEL_148;
  }
LABEL_147:
  *(_BYTE *)(v5 + 466) = self->_isKnownGood;
  *(_QWORD *)(v5 + 472) |= 0x2000000000000uLL;
  v18 = (uint64_t)self->_flags;
  if ((v18 & 0x1000000000000) == 0)
  {
LABEL_54:
    if ((v18 & 0x400000) == 0)
      goto LABEL_55;
    goto LABEL_149;
  }
LABEL_148:
  *(_BYTE *)(v5 + 465) = self->_isEdgeBSS;
  *(_QWORD *)(v5 + 472) |= 0x1000000000000uLL;
  v18 = (uint64_t)self->_flags;
  if ((v18 & 0x400000) == 0)
  {
LABEL_55:
    if ((v18 & 0x20000000) == 0)
      goto LABEL_57;
    goto LABEL_56;
  }
LABEL_149:
  *(_DWORD *)(v5 + 364) = self->_associationReason;
  *(_QWORD *)(v5 + 472) |= 0x400000uLL;
  if ((*(_QWORD *)&self->_flags & 0x20000000) != 0)
  {
LABEL_56:
    *(_DWORD *)(v5 + 392) = self->_disassociationReason;
    *(_QWORD *)(v5 + 472) |= 0x20000000uLL;
  }
LABEL_57:
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v19 = self->_essMembers;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v82 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEssMembers:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
    }
    while (v20);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v24 = self->_nearbyBSSs;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v78;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v78 != v26)
          objc_enumerationMutation(v24);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNearbyBSS:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    }
    while (v25);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v29 = self->_feedbacks;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v74;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v74 != v31)
          objc_enumerationMutation(v29);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addFeedback:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
    }
    while (v30);
  }

  v34 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v34;

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v36 = self->_roamStates;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v70;
    do
    {
      for (m = 0; m != v37; ++m)
      {
        if (*(_QWORD *)v70 != v38)
          objc_enumerationMutation(v36);
        v40 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRoamStates:", v40);

      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
    }
    while (v37);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v41 = self->_speedTests;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v66;
    do
    {
      for (n = 0; n != v42; ++n)
      {
        if (*(_QWORD *)v66 != v43)
          objc_enumerationMutation(v41);
        v45 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSpeedTest:", v45);

      }
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
    }
    while (v42);
  }

  v46 = &self->_flags;
  v47 = (uint64_t)self->_flags;
  if ((v47 & 0x40000000000) != 0)
  {
    *(_DWORD *)(v5 + 444) = self->_sslConnectionCount;
    *(_QWORD *)(v5 + 472) |= 0x40000000000uLL;
    v47 = *(_QWORD *)v46;
    if ((*(_QWORD *)v46 & 0x80000000000) == 0)
    {
LABEL_94:
      if ((v47 & 0x100000) == 0)
        goto LABEL_95;
      goto LABEL_153;
    }
  }
  else if ((v47 & 0x80000000000) == 0)
  {
    goto LABEL_94;
  }
  *(_DWORD *)(v5 + 448) = self->_sslErrorCount;
  *(_QWORD *)(v5 + 472) |= 0x80000000000uLL;
  v47 = (uint64_t)self->_flags;
  if ((v47 & 0x100000) == 0)
  {
LABEL_95:
    if ((v47 & 0x10000000) == 0)
      goto LABEL_96;
LABEL_154:
    *(_DWORD *)(v5 + 388) = self->_clientAssociationSubreason;
    *(_QWORD *)(v5 + 472) |= 0x10000000uLL;
    if ((*(_QWORD *)&self->_flags & 0x200000000000) == 0)
      goto LABEL_98;
    goto LABEL_97;
  }
LABEL_153:
  *(_DWORD *)(v5 + 356) = self->_apMode;
  *(_QWORD *)(v5 + 472) |= 0x100000uLL;
  v47 = (uint64_t)self->_flags;
  if ((v47 & 0x10000000) != 0)
    goto LABEL_154;
LABEL_96:
  if ((v47 & 0x200000000000) != 0)
  {
LABEL_97:
    *(_DWORD *)(v5 + 456) = self->_type;
    *(_QWORD *)(v5 + 472) |= 0x200000000000uLL;
  }
LABEL_98:
  v48 = -[GEOWiFiHarvestLabel copyWithZone:](self->_label, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v48;

  v50 = -[GEOWiFiPasspointInfo copyWithZone:](self->_passpointInfo, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v50;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v52 = self->_hotspotHelperProviders;
  v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v61, v85, 16);
  if (v53)
  {
    v54 = *(_QWORD *)v62;
    do
    {
      for (ii = 0; ii != v53; ++ii)
      {
        if (*(_QWORD *)v62 != v54)
          objc_enumerationMutation(v52);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * ii), "copyWithZone:", a3, (_QWORD)v61);
        objc_msgSend((id)v5, "addHotspotHelperProvider:", v56);

      }
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v61, v85, 16);
    }
    while (v53);
  }

  PBRepeatedInt32Copy();
  if ((*(_QWORD *)&self->_flags & 0x40000000) != 0)
  {
    *(_DWORD *)(v5 + 396) = self->_dohAvailability;
    *(_QWORD *)(v5 + 472) |= 0x40000000uLL;
  }
  v57 = -[GEOWiFiBeaconInfo copyWithZone:](self->_beaconInfo, "copyWithZone:", a3, (_QWORD)v61);
  v58 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v57;

  if ((*(_QWORD *)&self->_flags & 0x8000) != 0)
  {
    *(double *)(v5 + 280) = self->_responsivenessScore;
    *(_QWORD *)(v5 + 472) |= 0x8000uLL;
  }
  v59 = (id)v5;
LABEL_110:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t flags;
  uint64_t v6;
  NSString *uniqueID;
  GEOLocation *location;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *essMembers;
  NSMutableArray *nearbyBSSs;
  NSMutableArray *feedbacks;
  NSString *identifier;
  NSMutableArray *roamStates;
  NSMutableArray *speedTests;
  uint64_t v19;
  uint64_t v20;
  GEOWiFiHarvestLabel *label;
  GEOWiFiPasspointInfo *passpointInfo;
  NSMutableArray *hotspotHelperProviders;
  uint64_t v24;
  uint64_t v25;
  GEOWiFiBeaconInfo *beaconInfo;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_307;
  -[GEOWiFiConnectionQuality readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (uint64_t)self->_flags;
  v6 = *((_QWORD *)v4 + 59);
  if ((flags & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_timestamp != *((_QWORD *)v4 + 41))
      goto LABEL_307;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_307;
  }
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((_QWORD *)v4 + 42))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:"))
      goto LABEL_307;
    flags = (uint64_t)self->_flags;
    v6 = *((_QWORD *)v4 + 59);
  }
  if ((flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_overAllStay != *((_QWORD *)v4 + 29))
      goto LABEL_307;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_faultyStay != *((_QWORD *)v4 + 19))
      goto LABEL_307;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_lowLQMStay != *((_QWORD *)v4 + 25))
      goto LABEL_307;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_lowqStay != *((_QWORD *)v4 + 26))
      goto LABEL_307;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_lqmTranCount != *((_QWORD *)v4 + 27))
      goto LABEL_307;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_successfulConnections != *((_QWORD *)v4 + 39))
      goto LABEL_307;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_failedConnections != *((_QWORD *)v4 + 18))
      goto LABEL_307;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_packetsIn != *((_QWORD *)v4 + 30))
      goto LABEL_307;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_packetsOut != *((_QWORD *)v4 + 31))
      goto LABEL_307;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bytesInTotal != *((_QWORD *)v4 + 13))
      goto LABEL_307;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_bytesOutTotal != *((_QWORD *)v4 + 15))
      goto LABEL_307;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_bytesInActive != *((_QWORD *)v4 + 12))
      goto LABEL_307;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bytesOutActive != *((_QWORD *)v4 + 14))
      goto LABEL_307;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_reTxBytes != *((_QWORD *)v4 + 33))
      goto LABEL_307;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dataStalls != *((_QWORD *)v4 + 16))
      goto LABEL_307;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_receivedDupes != *((_QWORD *)v4 + 34))
      goto LABEL_307;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_rxOutOfOrderBytes != *((_QWORD *)v4 + 37))
      goto LABEL_307;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x2000000000) != 0)
  {
    if ((v6 & 0x2000000000) == 0 || self->_roundTripTimeMin != *((float *)v4 + 106))
      goto LABEL_307;
  }
  else if ((v6 & 0x2000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x800000000) != 0)
  {
    if ((v6 & 0x800000000) == 0 || self->_roundTripTimeAvg != *((float *)v4 + 104))
      goto LABEL_307;
  }
  else if ((v6 & 0x800000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x8000000000) != 0)
  {
    if ((v6 & 0x8000000000) == 0 || self->_roundTripTimeVar != *((float *)v4 + 108))
      goto LABEL_307;
  }
  else if ((v6 & 0x8000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x1000000000) != 0)
  {
    if ((v6 & 0x1000000000) == 0 || self->_roundTripTimeMinActive != *((float *)v4 + 105))
      goto LABEL_307;
  }
  else if ((v6 & 0x1000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0 || self->_roundTripTimeAvgActive != *((float *)v4 + 103))
      goto LABEL_307;
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x4000000000) != 0)
  {
    if ((v6 & 0x4000000000) == 0 || self->_roundTripTimeVarActive != *((float *)v4 + 107))
      goto LABEL_307;
  }
  else if ((v6 & 0x4000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x800000000000) != 0)
  {
    if ((v6 & 0x800000000000) == 0)
      goto LABEL_307;
    if (self->_hotspot20)
    {
      if (!*((_BYTE *)v4 + 464))
        goto LABEL_307;
    }
    else if (*((_BYTE *)v4 + 464))
    {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x800000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_band != *((_DWORD *)v4 + 92))
      goto LABEL_307;
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_channel != *((_DWORD *)v4 + 96))
      goto LABEL_307;
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_channelWidth != *((_DWORD *)v4 + 95))
      goto LABEL_307;
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x10000000000) != 0)
  {
    if ((v6 & 0x10000000000) == 0 || self->_rssi != *((_DWORD *)v4 + 109))
      goto LABEL_307;
  }
  else if ((v6 & 0x10000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x20000000000) != 0)
  {
    if ((v6 & 0x20000000000) == 0 || self->_snr != *((_DWORD *)v4 + 110))
      goto LABEL_307;
  }
  else if ((v6 & 0x20000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_cca != *((_DWORD *)v4 + 94))
      goto LABEL_307;
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x200000000) != 0)
  {
    if ((v6 & 0x200000000) == 0 || self->_phyMode != *((_DWORD *)v4 + 102))
      goto LABEL_307;
  }
  else if ((v6 & 0x200000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_timeOfDay != *((_QWORD *)v4 + 40))
      goto LABEL_307;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_307;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 24))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:"))
      goto LABEL_307;
    flags = (uint64_t)self->_flags;
    v6 = *((_QWORD *)v4 + 59);
  }
  if ((flags & 0x400000000000) != 0)
  {
    if ((v6 & 0x400000000000) == 0 || self->_wasCaptiveFlag != *((_DWORD *)v4 + 115))
      goto LABEL_307;
  }
  else if ((v6 & 0x400000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x100000000) != 0)
  {
    if ((v6 & 0x100000000) == 0 || self->_networkType != *((_DWORD *)v4 + 101))
      goto LABEL_307;
  }
  else if ((v6 & 0x100000000) != 0)
  {
    goto LABEL_307;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_307;
  v9 = (uint64_t)self->_flags;
  v10 = *((_QWORD *)v4 + 59);
  if ((v9 & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_captiveDetermination != *((_DWORD *)v4 + 93))
      goto LABEL_307;
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v9 & 0x200000) != 0)
  {
    if ((v10 & 0x200000) == 0 || self->_associationLength != *((_DWORD *)v4 + 90))
      goto LABEL_307;
  }
  else if ((v10 & 0x200000) != 0)
  {
    goto LABEL_307;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_307;
  v11 = (uint64_t)self->_flags;
  v12 = *((_QWORD *)v4 + 59);
  if ((v11 & 0x80000000) != 0)
  {
    if ((v12 & 0x80000000) == 0 || self->_networkOrigin != *((_DWORD *)v4 + 100))
      goto LABEL_307;
  }
  else if ((v12 & 0x80000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x100000000000) != 0)
  {
    if ((v12 & 0x100000000000) == 0 || self->_topDLRate != *((float *)v4 + 113))
      goto LABEL_307;
  }
  else if ((v12 & 0x100000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x8000000000000) != 0)
  {
    if ((v12 & 0x8000000000000) == 0)
      goto LABEL_307;
    if (self->_lowInternetUL)
    {
      if (!*((_BYTE *)v4 + 468))
        goto LABEL_307;
    }
    else if (*((_BYTE *)v4 + 468))
    {
      goto LABEL_307;
    }
  }
  else if ((v12 & 0x8000000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x4000000000000) != 0)
  {
    if ((v12 & 0x4000000000000) == 0)
      goto LABEL_307;
    if (self->_lowInternetDL)
    {
      if (!*((_BYTE *)v4 + 467))
        goto LABEL_307;
    }
    else if (*((_BYTE *)v4 + 467))
    {
      goto LABEL_307;
    }
  }
  else if ((v12 & 0x4000000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x2000000000000) != 0)
  {
    if ((v12 & 0x2000000000000) == 0)
      goto LABEL_307;
    if (self->_isKnownGood)
    {
      if (!*((_BYTE *)v4 + 466))
        goto LABEL_307;
    }
    else if (*((_BYTE *)v4 + 466))
    {
      goto LABEL_307;
    }
  }
  else if ((v12 & 0x2000000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x1000000000000) != 0)
  {
    if ((v12 & 0x1000000000000) == 0)
      goto LABEL_307;
    if (self->_isEdgeBSS)
    {
      if (!*((_BYTE *)v4 + 465))
        goto LABEL_307;
    }
    else if (*((_BYTE *)v4 + 465))
    {
      goto LABEL_307;
    }
  }
  else if ((v12 & 0x1000000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x400000) != 0)
  {
    if ((v12 & 0x400000) == 0 || self->_associationReason != *((_DWORD *)v4 + 91))
      goto LABEL_307;
  }
  else if ((v12 & 0x400000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x20000000) != 0)
  {
    if ((v12 & 0x20000000) == 0 || self->_disassociationReason != *((_DWORD *)v4 + 98))
      goto LABEL_307;
  }
  else if ((v12 & 0x20000000) != 0)
  {
    goto LABEL_307;
  }
  essMembers = self->_essMembers;
  if ((unint64_t)essMembers | *((_QWORD *)v4 + 17)
    && !-[NSMutableArray isEqual:](essMembers, "isEqual:"))
  {
    goto LABEL_307;
  }
  nearbyBSSs = self->_nearbyBSSs;
  if ((unint64_t)nearbyBSSs | *((_QWORD *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](nearbyBSSs, "isEqual:"))
      goto LABEL_307;
  }
  feedbacks = self->_feedbacks;
  if ((unint64_t)feedbacks | *((_QWORD *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](feedbacks, "isEqual:"))
      goto LABEL_307;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_307;
  }
  roamStates = self->_roamStates;
  if ((unint64_t)roamStates | *((_QWORD *)v4 + 36))
  {
    if (!-[NSMutableArray isEqual:](roamStates, "isEqual:"))
      goto LABEL_307;
  }
  speedTests = self->_speedTests;
  if ((unint64_t)speedTests | *((_QWORD *)v4 + 38))
  {
    if (!-[NSMutableArray isEqual:](speedTests, "isEqual:"))
      goto LABEL_307;
  }
  v19 = (uint64_t)self->_flags;
  v20 = *((_QWORD *)v4 + 59);
  if ((v19 & 0x40000000000) != 0)
  {
    if ((v20 & 0x40000000000) == 0 || self->_sslConnectionCount != *((_DWORD *)v4 + 111))
      goto LABEL_307;
  }
  else if ((v20 & 0x40000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v19 & 0x80000000000) != 0)
  {
    if ((v20 & 0x80000000000) == 0 || self->_sslErrorCount != *((_DWORD *)v4 + 112))
      goto LABEL_307;
  }
  else if ((v20 & 0x80000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v19 & 0x100000) != 0)
  {
    if ((v20 & 0x100000) == 0 || self->_apMode != *((_DWORD *)v4 + 89))
      goto LABEL_307;
  }
  else if ((v20 & 0x100000) != 0)
  {
    goto LABEL_307;
  }
  if ((v19 & 0x10000000) != 0)
  {
    if ((v20 & 0x10000000) == 0 || self->_clientAssociationSubreason != *((_DWORD *)v4 + 97))
      goto LABEL_307;
  }
  else if ((v20 & 0x10000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v19 & 0x200000000000) != 0)
  {
    if ((v20 & 0x200000000000) == 0 || self->_type != *((_DWORD *)v4 + 114))
      goto LABEL_307;
  }
  else if ((v20 & 0x200000000000) != 0)
  {
    goto LABEL_307;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 23) && !-[GEOWiFiHarvestLabel isEqual:](label, "isEqual:"))
    goto LABEL_307;
  passpointInfo = self->_passpointInfo;
  if ((unint64_t)passpointInfo | *((_QWORD *)v4 + 32))
  {
    if (!-[GEOWiFiPasspointInfo isEqual:](passpointInfo, "isEqual:"))
      goto LABEL_307;
  }
  hotspotHelperProviders = self->_hotspotHelperProviders;
  if ((unint64_t)hotspotHelperProviders | *((_QWORD *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](hotspotHelperProviders, "isEqual:"))
      goto LABEL_307;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_307;
  v24 = (uint64_t)self->_flags;
  v25 = *((_QWORD *)v4 + 59);
  if ((v24 & 0x40000000) != 0)
  {
    if ((v25 & 0x40000000) == 0 || self->_dohAvailability != *((_DWORD *)v4 + 99))
      goto LABEL_307;
  }
  else if ((v25 & 0x40000000) != 0)
  {
    goto LABEL_307;
  }
  beaconInfo = self->_beaconInfo;
  if (!((unint64_t)beaconInfo | *((_QWORD *)v4 + 11)))
    goto LABEL_302;
  if (!-[GEOWiFiBeaconInfo isEqual:](beaconInfo, "isEqual:"))
  {
LABEL_307:
    v27 = 0;
    goto LABEL_308;
  }
  v24 = (uint64_t)self->_flags;
  v25 = *((_QWORD *)v4 + 59);
LABEL_302:
  if ((v24 & 0x8000) != 0)
  {
    if ((v25 & 0x8000) == 0 || self->_responsivenessScore != *((double *)v4 + 35))
      goto LABEL_307;
    v27 = 1;
  }
  else
  {
    v27 = (v25 & 0x8000) == 0;
  }
LABEL_308:

  return v27;
}

- (unint64_t)hash
{
  uint64_t flags;
  float roundTripTimeMin;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  float roundTripTimeAvg;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float roundTripTimeVar;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  float roundTripTimeMinActive;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  float roundTripTimeAvgActive;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  float roundTripTimeVarActive;
  double v31;
  long double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  float topDLRate;
  double v38;
  long double v39;
  double v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  double responsivenessScore;
  double v49;
  long double v50;
  double v51;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSUInteger v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  NSUInteger v111;
  unint64_t v112;

  -[GEOWiFiConnectionQuality readAll:](self, "readAll:", 1);
  if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
    v112 = 2654435761u * self->_timestamp;
  else
    v112 = 0;
  v111 = -[NSString hash](self->_uniqueID, "hash");
  flags = (uint64_t)self->_flags;
  if ((flags & 0x400) != 0)
  {
    v110 = 2654435761u * self->_overAllStay;
    if ((flags & 0x40) != 0)
    {
LABEL_6:
      v109 = 2654435761u * self->_faultyStay;
      if ((flags & 0x80) != 0)
        goto LABEL_7;
      goto LABEL_28;
    }
  }
  else
  {
    v110 = 0;
    if ((flags & 0x40) != 0)
      goto LABEL_6;
  }
  v109 = 0;
  if ((flags & 0x80) != 0)
  {
LABEL_7:
    v108 = 2654435761u * self->_lowLQMStay;
    if ((flags & 0x100) != 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  v108 = 0;
  if ((flags & 0x100) != 0)
  {
LABEL_8:
    v107 = 2654435761u * self->_lowqStay;
    if ((flags & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  v107 = 0;
  if ((flags & 0x200) != 0)
  {
LABEL_9:
    v106 = 2654435761u * self->_lqmTranCount;
    if ((flags & 0x20000) != 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  v106 = 0;
  if ((flags & 0x20000) != 0)
  {
LABEL_10:
    v105 = 2654435761u * self->_successfulConnections;
    if ((flags & 0x20) != 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  v105 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_11:
    v104 = 2654435761u * self->_failedConnections;
    if ((flags & 0x800) != 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  v104 = 0;
  if ((flags & 0x800) != 0)
  {
LABEL_12:
    v103 = 2654435761u * self->_packetsIn;
    if ((flags & 0x1000) != 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  v103 = 0;
  if ((flags & 0x1000) != 0)
  {
LABEL_13:
    v102 = 2654435761u * self->_packetsOut;
    if ((flags & 2) != 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  v102 = 0;
  if ((flags & 2) != 0)
  {
LABEL_14:
    v101 = 2654435761u * self->_bytesInTotal;
    if ((flags & 8) != 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  v101 = 0;
  if ((flags & 8) != 0)
  {
LABEL_15:
    v100 = 2654435761u * self->_bytesOutTotal;
    if ((flags & 1) != 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  v100 = 0;
  if ((flags & 1) != 0)
  {
LABEL_16:
    v99 = 2654435761u * self->_bytesInActive;
    if ((flags & 4) != 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  v99 = 0;
  if ((flags & 4) != 0)
  {
LABEL_17:
    v98 = 2654435761u * self->_bytesOutActive;
    if ((flags & 0x2000) != 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  v98 = 0;
  if ((flags & 0x2000) != 0)
  {
LABEL_18:
    v97 = 2654435761u * self->_reTxBytes;
    if ((flags & 0x10) != 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  v97 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_19:
    v96 = 2654435761u * self->_dataStalls;
    if ((flags & 0x4000) != 0)
      goto LABEL_20;
    goto LABEL_41;
  }
LABEL_40:
  v96 = 0;
  if ((flags & 0x4000) != 0)
  {
LABEL_20:
    v95 = 2654435761u * self->_receivedDupes;
    if ((flags & 0x10000) != 0)
      goto LABEL_21;
LABEL_42:
    v94 = 0;
    if ((flags & 0x2000000000) != 0)
      goto LABEL_22;
LABEL_43:
    v8 = 0;
    goto LABEL_46;
  }
LABEL_41:
  v95 = 0;
  if ((flags & 0x10000) == 0)
    goto LABEL_42;
LABEL_21:
  v94 = 2654435761u * self->_rxOutOfOrderBytes;
  if ((flags & 0x2000000000) == 0)
    goto LABEL_43;
LABEL_22:
  roundTripTimeMin = self->_roundTripTimeMin;
  v5 = roundTripTimeMin;
  if (roundTripTimeMin < 0.0)
    v5 = -roundTripTimeMin;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_46:
  if ((flags & 0x800000000) != 0)
  {
    roundTripTimeAvg = self->_roundTripTimeAvg;
    v11 = roundTripTimeAvg;
    if (roundTripTimeAvg < 0.0)
      v11 = -roundTripTimeAvg;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((flags & 0x8000000000) != 0)
  {
    roundTripTimeVar = self->_roundTripTimeVar;
    v16 = roundTripTimeVar;
    if (roundTripTimeVar < 0.0)
      v16 = -roundTripTimeVar;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((flags & 0x1000000000) != 0)
  {
    roundTripTimeMinActive = self->_roundTripTimeMinActive;
    v21 = roundTripTimeMinActive;
    if (roundTripTimeMinActive < 0.0)
      v21 = -roundTripTimeMinActive;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((flags & 0x400000000) != 0)
  {
    roundTripTimeAvgActive = self->_roundTripTimeAvgActive;
    v26 = roundTripTimeAvgActive;
    if (roundTripTimeAvgActive < 0.0)
      v26 = -roundTripTimeAvgActive;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((flags & 0x4000000000) != 0)
  {
    roundTripTimeVarActive = self->_roundTripTimeVarActive;
    v31 = roundTripTimeVarActive;
    if (roundTripTimeVarActive < 0.0)
      v31 = -roundTripTimeVarActive;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((flags & 0x800000000000) != 0)
  {
    v91 = 2654435761 * self->_hotspot20;
    if ((flags & 0x800000) != 0)
    {
LABEL_88:
      v90 = 2654435761 * self->_band;
      if ((flags & 0x8000000) != 0)
        goto LABEL_89;
      goto LABEL_97;
    }
  }
  else
  {
    v91 = 0;
    if ((flags & 0x800000) != 0)
      goto LABEL_88;
  }
  v90 = 0;
  if ((flags & 0x8000000) != 0)
  {
LABEL_89:
    v89 = 2654435761 * self->_channel;
    if ((flags & 0x4000000) != 0)
      goto LABEL_90;
    goto LABEL_98;
  }
LABEL_97:
  v89 = 0;
  if ((flags & 0x4000000) != 0)
  {
LABEL_90:
    v88 = 2654435761 * self->_channelWidth;
    if ((flags & 0x10000000000) != 0)
      goto LABEL_91;
    goto LABEL_99;
  }
LABEL_98:
  v88 = 0;
  if ((flags & 0x10000000000) != 0)
  {
LABEL_91:
    v87 = 2654435761 * self->_rssi;
    if ((flags & 0x20000000000) != 0)
      goto LABEL_92;
    goto LABEL_100;
  }
LABEL_99:
  v87 = 0;
  if ((flags & 0x20000000000) != 0)
  {
LABEL_92:
    v86 = 2654435761 * self->_snr;
    if ((flags & 0x2000000) != 0)
      goto LABEL_93;
LABEL_101:
    v85 = 0;
    if ((flags & 0x200000000) != 0)
      goto LABEL_94;
    goto LABEL_102;
  }
LABEL_100:
  v86 = 0;
  if ((flags & 0x2000000) == 0)
    goto LABEL_101;
LABEL_93:
  v85 = 2654435761 * self->_cca;
  if ((flags & 0x200000000) != 0)
  {
LABEL_94:
    v84 = 2654435761 * self->_phyMode;
    goto LABEL_103;
  }
LABEL_102:
  v84 = 0;
LABEL_103:
  v92 = v29;
  if ((flags & 0x40000) != 0)
    v83 = 2654435761u * self->_timeOfDay;
  else
    v83 = 0;
  v82 = -[GEOLocation hash](self->_location, "hash");
  v34 = (uint64_t)self->_flags;
  if ((v34 & 0x400000000000) != 0)
  {
    v81 = 2654435761 * self->_wasCaptiveFlag;
    if ((v34 & 0x100000000) != 0)
      goto LABEL_108;
  }
  else
  {
    v81 = 0;
    if ((v34 & 0x100000000) != 0)
    {
LABEL_108:
      v80 = 2654435761 * self->_networkType;
      goto LABEL_111;
    }
  }
  v80 = 0;
LABEL_111:
  v79 = PBRepeatedInt32Hash();
  v35 = (uint64_t)self->_flags;
  if ((v35 & 0x1000000) != 0)
  {
    v78 = 2654435761 * self->_captiveDetermination;
    if ((v35 & 0x200000) != 0)
      goto LABEL_113;
  }
  else
  {
    v78 = 0;
    if ((v35 & 0x200000) != 0)
    {
LABEL_113:
      v77 = 2654435761 * self->_associationLength;
      goto LABEL_116;
    }
  }
  v77 = 0;
LABEL_116:
  v76 = PBRepeatedInt32Hash();
  v36 = (uint64_t)self->_flags;
  if ((v36 & 0x80000000) != 0)
  {
    v75 = 2654435761 * self->_networkOrigin;
    if ((v36 & 0x100000000000) != 0)
      goto LABEL_118;
LABEL_123:
    v41 = 0;
    goto LABEL_126;
  }
  v75 = 0;
  if ((v36 & 0x100000000000) == 0)
    goto LABEL_123;
LABEL_118:
  topDLRate = self->_topDLRate;
  v38 = topDLRate;
  if (topDLRate < 0.0)
    v38 = -topDLRate;
  v39 = floor(v38 + 0.5);
  v40 = (v38 - v39) * 1.84467441e19;
  v41 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
  if (v40 >= 0.0)
  {
    if (v40 > 0.0)
      v41 += (unint64_t)v40;
  }
  else
  {
    v41 -= (unint64_t)fabs(v40);
  }
LABEL_126:
  if ((v36 & 0x8000000000000) != 0)
  {
    v73 = 2654435761 * self->_lowInternetUL;
    if ((v36 & 0x4000000000000) != 0)
    {
LABEL_128:
      v72 = 2654435761 * self->_lowInternetDL;
      if ((v36 & 0x2000000000000) != 0)
        goto LABEL_129;
      goto LABEL_134;
    }
  }
  else
  {
    v73 = 0;
    if ((v36 & 0x4000000000000) != 0)
      goto LABEL_128;
  }
  v72 = 0;
  if ((v36 & 0x2000000000000) != 0)
  {
LABEL_129:
    v71 = 2654435761 * self->_isKnownGood;
    if ((v36 & 0x1000000000000) != 0)
      goto LABEL_130;
LABEL_135:
    v70 = 0;
    if ((v36 & 0x400000) != 0)
      goto LABEL_131;
    goto LABEL_136;
  }
LABEL_134:
  v71 = 0;
  if ((v36 & 0x1000000000000) == 0)
    goto LABEL_135;
LABEL_130:
  v70 = 2654435761 * self->_isEdgeBSS;
  if ((v36 & 0x400000) != 0)
  {
LABEL_131:
    v69 = 2654435761 * self->_associationReason;
    goto LABEL_137;
  }
LABEL_136:
  v69 = 0;
LABEL_137:
  v74 = v41;
  if ((v36 & 0x20000000) != 0)
    v68 = 2654435761 * self->_disassociationReason;
  else
    v68 = 0;
  v67 = -[NSMutableArray hash](self->_essMembers, "hash");
  v66 = -[NSMutableArray hash](self->_nearbyBSSs, "hash");
  v65 = -[NSMutableArray hash](self->_feedbacks, "hash");
  v64 = -[NSString hash](self->_identifier, "hash");
  v63 = -[NSMutableArray hash](self->_roamStates, "hash");
  v62 = -[NSMutableArray hash](self->_speedTests, "hash");
  v42 = (uint64_t)self->_flags;
  if ((v42 & 0x40000000000) != 0)
  {
    v61 = 2654435761 * self->_sslConnectionCount;
    if ((v42 & 0x80000000000) != 0)
    {
LABEL_142:
      v60 = 2654435761 * self->_sslErrorCount;
      if ((v42 & 0x100000) != 0)
        goto LABEL_143;
LABEL_147:
      v59 = 0;
      if ((v42 & 0x10000000) != 0)
        goto LABEL_144;
      goto LABEL_148;
    }
  }
  else
  {
    v61 = 0;
    if ((v42 & 0x80000000000) != 0)
      goto LABEL_142;
  }
  v60 = 0;
  if ((v42 & 0x100000) == 0)
    goto LABEL_147;
LABEL_143:
  v59 = 2654435761 * self->_apMode;
  if ((v42 & 0x10000000) != 0)
  {
LABEL_144:
    v58 = 2654435761 * self->_clientAssociationSubreason;
    goto LABEL_149;
  }
LABEL_148:
  v58 = 0;
LABEL_149:
  v93 = v24;
  v43 = v19;
  if ((v42 & 0x200000000000) != 0)
    v57 = 2654435761 * self->_type;
  else
    v57 = 0;
  v56 = -[GEOWiFiHarvestLabel hash](self->_label, "hash");
  v55 = -[GEOWiFiPasspointInfo hash](self->_passpointInfo, "hash");
  v53 = -[NSMutableArray hash](self->_hotspotHelperProviders, "hash");
  v44 = PBRepeatedInt32Hash();
  if ((*(_QWORD *)&self->_flags & 0x40000000) != 0)
    v45 = 2654435761 * self->_dohAvailability;
  else
    v45 = 0;
  v46 = -[GEOWiFiBeaconInfo hash](self->_beaconInfo, "hash", v53);
  if ((*(_QWORD *)&self->_flags & 0x8000) != 0)
  {
    responsivenessScore = self->_responsivenessScore;
    v49 = -responsivenessScore;
    if (responsivenessScore >= 0.0)
      v49 = self->_responsivenessScore;
    v50 = floor(v49 + 0.5);
    v51 = (v49 - v50) * 1.84467441e19;
    v47 = 2654435761u * (unint64_t)fmod(v50, 1.84467441e19);
    if (v51 >= 0.0)
    {
      if (v51 > 0.0)
        v47 += (unint64_t)v51;
    }
    else
    {
      v47 -= (unint64_t)fabs(v51);
    }
  }
  else
  {
    v47 = 0;
  }
  return v111 ^ v112 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v8 ^ v9 ^ v14 ^ v43 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v44 ^ v45 ^ v46 ^ v47;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  GEOLocation *location;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t n;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t ii;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t jj;
  uint64_t *v44;
  uint64_t v45;
  GEOWiFiHarvestLabel *label;
  uint64_t v47;
  GEOWiFiPasspointInfo *passpointInfo;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t kk;
  uint64_t v55;
  uint64_t v56;
  uint64_t mm;
  GEOWiFiBeaconInfo *beaconInfo;
  uint64_t v59;
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
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_QWORD *)v4 + 59) & 0x80000) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 41);
    *(_QWORD *)&self->_flags |= 0x80000uLL;
  }
  if (*((_QWORD *)v4 + 42))
    -[GEOWiFiConnectionQuality setUniqueID:](self, "setUniqueID:");
  v5 = (uint64_t *)(v4 + 472);
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x400) != 0)
  {
    self->_overAllStay = *((_QWORD *)v4 + 29);
    *(_QWORD *)&self->_flags |= 0x400uLL;
    v6 = *v5;
    if ((*v5 & 0x40) == 0)
    {
LABEL_7:
      if ((v6 & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_43;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_7;
  }
  self->_faultyStay = *((_QWORD *)v4 + 19);
  *(_QWORD *)&self->_flags |= 0x40uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x80) == 0)
  {
LABEL_8:
    if ((v6 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  self->_lowLQMStay = *((_QWORD *)v4 + 25);
  *(_QWORD *)&self->_flags |= 0x80uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x100) == 0)
  {
LABEL_9:
    if ((v6 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  self->_lowqStay = *((_QWORD *)v4 + 26);
  *(_QWORD *)&self->_flags |= 0x100uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x200) == 0)
  {
LABEL_10:
    if ((v6 & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  self->_lqmTranCount = *((_QWORD *)v4 + 27);
  *(_QWORD *)&self->_flags |= 0x200uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x20000) == 0)
  {
LABEL_11:
    if ((v6 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  self->_successfulConnections = *((_QWORD *)v4 + 39);
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x20) == 0)
  {
LABEL_12:
    if ((v6 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_48;
  }
LABEL_47:
  self->_failedConnections = *((_QWORD *)v4 + 18);
  *(_QWORD *)&self->_flags |= 0x20uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x800) == 0)
  {
LABEL_13:
    if ((v6 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_48:
  self->_packetsIn = *((_QWORD *)v4 + 30);
  *(_QWORD *)&self->_flags |= 0x800uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x1000) == 0)
  {
LABEL_14:
    if ((v6 & 2) == 0)
      goto LABEL_15;
    goto LABEL_50;
  }
LABEL_49:
  self->_packetsOut = *((_QWORD *)v4 + 31);
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 2) == 0)
  {
LABEL_15:
    if ((v6 & 8) == 0)
      goto LABEL_16;
    goto LABEL_51;
  }
LABEL_50:
  self->_bytesInTotal = *((_QWORD *)v4 + 13);
  *(_QWORD *)&self->_flags |= 2uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 8) == 0)
  {
LABEL_16:
    if ((v6 & 1) == 0)
      goto LABEL_17;
    goto LABEL_52;
  }
LABEL_51:
  self->_bytesOutTotal = *((_QWORD *)v4 + 15);
  *(_QWORD *)&self->_flags |= 8uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 1) == 0)
  {
LABEL_17:
    if ((v6 & 4) == 0)
      goto LABEL_18;
    goto LABEL_53;
  }
LABEL_52:
  self->_bytesInActive = *((_QWORD *)v4 + 12);
  *(_QWORD *)&self->_flags |= 1uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 4) == 0)
  {
LABEL_18:
    if ((v6 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_54;
  }
LABEL_53:
  self->_bytesOutActive = *((_QWORD *)v4 + 14);
  *(_QWORD *)&self->_flags |= 4uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x2000) == 0)
  {
LABEL_19:
    if ((v6 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_55;
  }
LABEL_54:
  self->_reTxBytes = *((_QWORD *)v4 + 33);
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x10) == 0)
  {
LABEL_20:
    if ((v6 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_56;
  }
LABEL_55:
  self->_dataStalls = *((_QWORD *)v4 + 16);
  *(_QWORD *)&self->_flags |= 0x10uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x4000) == 0)
  {
LABEL_21:
    if ((v6 & 0x10000) == 0)
      goto LABEL_22;
    goto LABEL_57;
  }
LABEL_56:
  self->_receivedDupes = *((_QWORD *)v4 + 34);
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x10000) == 0)
  {
LABEL_22:
    if ((v6 & 0x2000000000) == 0)
      goto LABEL_23;
    goto LABEL_58;
  }
LABEL_57:
  self->_rxOutOfOrderBytes = *((_QWORD *)v4 + 37);
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x2000000000) == 0)
  {
LABEL_23:
    if ((v6 & 0x800000000) == 0)
      goto LABEL_24;
    goto LABEL_59;
  }
LABEL_58:
  self->_roundTripTimeMin = *((float *)v4 + 106);
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x800000000) == 0)
  {
LABEL_24:
    if ((v6 & 0x8000000000) == 0)
      goto LABEL_25;
    goto LABEL_60;
  }
LABEL_59:
  self->_roundTripTimeAvg = *((float *)v4 + 104);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x8000000000) == 0)
  {
LABEL_25:
    if ((v6 & 0x1000000000) == 0)
      goto LABEL_26;
    goto LABEL_61;
  }
LABEL_60:
  self->_roundTripTimeVar = *((float *)v4 + 108);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x1000000000) == 0)
  {
LABEL_26:
    if ((v6 & 0x400000000) == 0)
      goto LABEL_27;
    goto LABEL_62;
  }
LABEL_61:
  self->_roundTripTimeMinActive = *((float *)v4 + 105);
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x400000000) == 0)
  {
LABEL_27:
    if ((v6 & 0x4000000000) == 0)
      goto LABEL_28;
    goto LABEL_63;
  }
LABEL_62:
  self->_roundTripTimeAvgActive = *((float *)v4 + 103);
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x4000000000) == 0)
  {
LABEL_28:
    if ((v6 & 0x800000000000) == 0)
      goto LABEL_29;
    goto LABEL_64;
  }
LABEL_63:
  self->_roundTripTimeVarActive = *((float *)v4 + 107);
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x800000000000) == 0)
  {
LABEL_29:
    if ((v6 & 0x800000) == 0)
      goto LABEL_30;
    goto LABEL_65;
  }
LABEL_64:
  self->_hotspot20 = v4[464];
  *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x800000) == 0)
  {
LABEL_30:
    if ((v6 & 0x8000000) == 0)
      goto LABEL_31;
    goto LABEL_66;
  }
LABEL_65:
  self->_band = *((_DWORD *)v4 + 92);
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_31:
    if ((v6 & 0x4000000) == 0)
      goto LABEL_32;
    goto LABEL_67;
  }
LABEL_66:
  self->_channel = *((_DWORD *)v4 + 96);
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_32:
    if ((v6 & 0x10000000000) == 0)
      goto LABEL_33;
    goto LABEL_68;
  }
LABEL_67:
  self->_channelWidth = *((_DWORD *)v4 + 95);
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x10000000000) == 0)
  {
LABEL_33:
    if ((v6 & 0x20000000000) == 0)
      goto LABEL_34;
    goto LABEL_69;
  }
LABEL_68:
  self->_rssi = *((_DWORD *)v4 + 109);
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x20000000000) == 0)
  {
LABEL_34:
    if ((v6 & 0x2000000) == 0)
      goto LABEL_35;
    goto LABEL_70;
  }
LABEL_69:
  self->_snr = *((_DWORD *)v4 + 110);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x200000000) == 0)
      goto LABEL_36;
    goto LABEL_71;
  }
LABEL_70:
  self->_cca = *((_DWORD *)v4 + 94);
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  v6 = *((_QWORD *)v4 + 59);
  if ((v6 & 0x200000000) == 0)
  {
LABEL_36:
    if ((v6 & 0x40000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_71:
  self->_phyMode = *((_DWORD *)v4 + 102);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  if ((*((_QWORD *)v4 + 59) & 0x40000) != 0)
  {
LABEL_37:
    self->_timeOfDay = *((_QWORD *)v4 + 40);
    *(_QWORD *)&self->_flags |= 0x40000uLL;
  }
LABEL_38:
  location = self->_location;
  v8 = *((_QWORD *)v4 + 24);
  if (location)
  {
    if (v8)
      -[GEOLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEOWiFiConnectionQuality setLocation:](self, "setLocation:");
  }
  v9 = *((_QWORD *)v4 + 59);
  if ((v9 & 0x400000000000) != 0)
  {
    self->_wasCaptiveFlag = *((_DWORD *)v4 + 115);
    *(_QWORD *)&self->_flags |= 0x400000000000uLL;
    v9 = *((_QWORD *)v4 + 59);
  }
  if ((v9 & 0x100000000) != 0)
  {
    self->_networkType = *((_DWORD *)v4 + 101);
    *(_QWORD *)&self->_flags |= 0x100000000uLL;
  }
  v10 = objc_msgSend(v4, "traitsCount");
  if (v10)
  {
    v11 = v10;
    for (i = 0; i != v11; ++i)
      -[GEOWiFiConnectionQuality addTraits:](self, "addTraits:", objc_msgSend(v4, "traitsAtIndex:", i));
  }
  v13 = *((_QWORD *)v4 + 59);
  if ((v13 & 0x1000000) != 0)
  {
    self->_captiveDetermination = *((_DWORD *)v4 + 93);
    *(_QWORD *)&self->_flags |= 0x1000000uLL;
    v13 = *((_QWORD *)v4 + 59);
  }
  if ((v13 & 0x200000) != 0)
  {
    self->_associationLength = *((_DWORD *)v4 + 90);
    *(_QWORD *)&self->_flags |= 0x200000uLL;
  }
  v14 = objc_msgSend(v4, "authTraitsCount");
  if (v14)
  {
    v15 = v14;
    for (j = 0; j != v15; ++j)
      -[GEOWiFiConnectionQuality addAuthTraits:](self, "addAuthTraits:", objc_msgSend(v4, "authTraitsAtIndex:", j));
  }
  v17 = (uint64_t *)(v4 + 472);
  v18 = *((_QWORD *)v4 + 59);
  if ((v18 & 0x80000000) != 0)
  {
    self->_networkOrigin = *((_DWORD *)v4 + 100);
    *(_QWORD *)&self->_flags |= 0x80000000uLL;
    v18 = *v17;
    if ((*v17 & 0x100000000000) == 0)
    {
LABEL_91:
      if ((v18 & 0x8000000000000) == 0)
        goto LABEL_92;
      goto LABEL_146;
    }
  }
  else if ((v18 & 0x100000000000) == 0)
  {
    goto LABEL_91;
  }
  self->_topDLRate = *((float *)v4 + 113);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  v18 = *((_QWORD *)v4 + 59);
  if ((v18 & 0x8000000000000) == 0)
  {
LABEL_92:
    if ((v18 & 0x4000000000000) == 0)
      goto LABEL_93;
    goto LABEL_147;
  }
LABEL_146:
  self->_lowInternetUL = v4[468];
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  v18 = *((_QWORD *)v4 + 59);
  if ((v18 & 0x4000000000000) == 0)
  {
LABEL_93:
    if ((v18 & 0x2000000000000) == 0)
      goto LABEL_94;
    goto LABEL_148;
  }
LABEL_147:
  self->_lowInternetDL = v4[467];
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  v18 = *((_QWORD *)v4 + 59);
  if ((v18 & 0x2000000000000) == 0)
  {
LABEL_94:
    if ((v18 & 0x1000000000000) == 0)
      goto LABEL_95;
    goto LABEL_149;
  }
LABEL_148:
  self->_isKnownGood = v4[466];
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  v18 = *((_QWORD *)v4 + 59);
  if ((v18 & 0x1000000000000) == 0)
  {
LABEL_95:
    if ((v18 & 0x400000) == 0)
      goto LABEL_96;
    goto LABEL_150;
  }
LABEL_149:
  self->_isEdgeBSS = v4[465];
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  v18 = *((_QWORD *)v4 + 59);
  if ((v18 & 0x400000) == 0)
  {
LABEL_96:
    if ((v18 & 0x20000000) == 0)
      goto LABEL_98;
    goto LABEL_97;
  }
LABEL_150:
  self->_associationReason = *((_DWORD *)v4 + 91);
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  if ((*((_QWORD *)v4 + 59) & 0x20000000) != 0)
  {
LABEL_97:
    self->_disassociationReason = *((_DWORD *)v4 + 98);
    *(_QWORD *)&self->_flags |= 0x20000000uLL;
  }
LABEL_98:
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v19 = *((id *)v4 + 17);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v81;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v81 != v22)
          objc_enumerationMutation(v19);
        -[GEOWiFiConnectionQuality addEssMembers:](self, "addEssMembers:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * k));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
    }
    while (v21);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v24 = *((id *)v4 + 28);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v77;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v77 != v27)
          objc_enumerationMutation(v24);
        -[GEOWiFiConnectionQuality addNearbyBSS:](self, "addNearbyBSS:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * m));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
    }
    while (v26);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v29 = *((id *)v4 + 20);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v73;
    do
    {
      for (n = 0; n != v31; ++n)
      {
        if (*(_QWORD *)v73 != v32)
          objc_enumerationMutation(v29);
        -[GEOWiFiConnectionQuality addFeedback:](self, "addFeedback:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * n));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    }
    while (v31);
  }

  if (*((_QWORD *)v4 + 22))
    -[GEOWiFiConnectionQuality setIdentifier:](self, "setIdentifier:");
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v34 = *((id *)v4 + 36);
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v69;
    do
    {
      for (ii = 0; ii != v36; ++ii)
      {
        if (*(_QWORD *)v69 != v37)
          objc_enumerationMutation(v34);
        -[GEOWiFiConnectionQuality addRoamStates:](self, "addRoamStates:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * ii));
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    }
    while (v36);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v39 = *((id *)v4 + 38);
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v65;
    do
    {
      for (jj = 0; jj != v41; ++jj)
      {
        if (*(_QWORD *)v65 != v42)
          objc_enumerationMutation(v39);
        -[GEOWiFiConnectionQuality addSpeedTest:](self, "addSpeedTest:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * jj));
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
    }
    while (v41);
  }

  v44 = (uint64_t *)(v4 + 472);
  v45 = *((_QWORD *)v4 + 59);
  if ((v45 & 0x40000000000) != 0)
  {
    self->_sslConnectionCount = *((_DWORD *)v4 + 111);
    *(_QWORD *)&self->_flags |= 0x40000000000uLL;
    v45 = *v44;
    if ((*v44 & 0x80000000000) == 0)
    {
LABEL_137:
      if ((v45 & 0x100000) == 0)
        goto LABEL_138;
      goto LABEL_154;
    }
  }
  else if ((v45 & 0x80000000000) == 0)
  {
    goto LABEL_137;
  }
  self->_sslErrorCount = *((_DWORD *)v4 + 112);
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  v45 = *((_QWORD *)v4 + 59);
  if ((v45 & 0x100000) == 0)
  {
LABEL_138:
    if ((v45 & 0x10000000) == 0)
      goto LABEL_139;
    goto LABEL_155;
  }
LABEL_154:
  self->_apMode = *((_DWORD *)v4 + 89);
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  v45 = *((_QWORD *)v4 + 59);
  if ((v45 & 0x10000000) == 0)
  {
LABEL_139:
    if ((v45 & 0x200000000000) == 0)
      goto LABEL_141;
    goto LABEL_140;
  }
LABEL_155:
  self->_clientAssociationSubreason = *((_DWORD *)v4 + 97);
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  if ((*((_QWORD *)v4 + 59) & 0x200000000000) != 0)
  {
LABEL_140:
    self->_type = *((_DWORD *)v4 + 114);
    *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  }
LABEL_141:
  label = self->_label;
  v47 = *((_QWORD *)v4 + 23);
  if (label)
  {
    if (v47)
      -[GEOWiFiHarvestLabel mergeFrom:](label, "mergeFrom:");
  }
  else if (v47)
  {
    -[GEOWiFiConnectionQuality setLabel:](self, "setLabel:");
  }
  passpointInfo = self->_passpointInfo;
  v49 = *((_QWORD *)v4 + 32);
  if (passpointInfo)
  {
    if (v49)
      -[GEOWiFiPasspointInfo mergeFrom:](passpointInfo, "mergeFrom:");
  }
  else if (v49)
  {
    -[GEOWiFiConnectionQuality setPasspointInfo:](self, "setPasspointInfo:");
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v50 = *((id *)v4 + 21);
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v61;
    do
    {
      for (kk = 0; kk != v52; ++kk)
      {
        if (*(_QWORD *)v61 != v53)
          objc_enumerationMutation(v50);
        -[GEOWiFiConnectionQuality addHotspotHelperProvider:](self, "addHotspotHelperProvider:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * kk), (_QWORD)v60);
      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
    }
    while (v52);
  }

  v55 = objc_msgSend(v4, "nameAttributesCount");
  if (v55)
  {
    v56 = v55;
    for (mm = 0; mm != v56; ++mm)
      -[GEOWiFiConnectionQuality addNameAttributes:](self, "addNameAttributes:", objc_msgSend(v4, "nameAttributesAtIndex:", mm, (_QWORD)v60));
  }
  if ((*((_QWORD *)v4 + 59) & 0x40000000) != 0)
  {
    self->_dohAvailability = *((_DWORD *)v4 + 99);
    *(_QWORD *)&self->_flags |= 0x40000000uLL;
  }
  beaconInfo = self->_beaconInfo;
  v59 = *((_QWORD *)v4 + 11);
  if (beaconInfo)
  {
    if (v59)
      -[GEOWiFiBeaconInfo mergeFrom:](beaconInfo, "mergeFrom:");
  }
  else if (v59)
  {
    -[GEOWiFiConnectionQuality setBeaconInfo:](self, "setBeaconInfo:");
  }
  if ((*((_QWORD *)v4 + 59) & 0x8000) != 0)
  {
    self->_responsivenessScore = *((double *)v4 + 35);
    *(_QWORD *)&self->_flags |= 0x8000uLL;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_speedTests, 0);
  objc_storeStrong((id *)&self->_roamStates, 0);
  objc_storeStrong((id *)&self->_passpointInfo, 0);
  objc_storeStrong((id *)&self->_nearbyBSSs, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hotspotHelperProviders, 0);
  objc_storeStrong((id *)&self->_feedbacks, 0);
  objc_storeStrong((id *)&self->_essMembers, 0);
  objc_storeStrong((id *)&self->_beaconInfo, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
