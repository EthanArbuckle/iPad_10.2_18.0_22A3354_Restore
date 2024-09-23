@implementation _IMPingStatisticsCollector

- (_IMPingStatisticsCollector)init
{
  _IMPingStatisticsCollector *v2;
  uint64_t i;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableString *stringToWriteToFile;
  IMPingStatistics *v10;
  IMPingStatistics *stats;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_IMPingStatisticsCollector;
  v2 = -[_IMPingStatisticsCollector init](&v13, sel_init);
  if (v2)
  {
    for (i = 8; i != 1288; i += 8)
    {
      v4 = *(Class *)((char *)&v2->super.isa + i);
      *(Class *)((char *)&v2->super.isa + i) = 0;

    }
    v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v8 = objc_msgSend_initWithString_(v5, v6, (uint64_t)&stru_1E2C46CC8, v7);
    stringToWriteToFile = v2->_stringToWriteToFile;
    v2->_stringToWriteToFile = (NSMutableString *)v8;

    v10 = objc_alloc_init(IMPingStatistics);
    stats = v2->_stats;
    v2->_stats = v10;

  }
  return v2;
}

- (void)addEchoPacket:(int)a3 packetTimestamp:(timeval)a4 error:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  _IMPingStatisticsCollector *v7;
  _IMPingPacketData *v8;
  const char *v9;
  void *v10;
  Class *v11;
  Class v12;
  id *v13;
  Class v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  timeval v36;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v36 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = [_IMPingPacketData alloc];
  v10 = (void *)objc_msgSend_initWithSequeneceNumber_timesent_error_(v8, v9, v6, (uint64_t)&v36, v5);
  v11 = &v7->super.isa + (int)v6 % 160;
  v14 = v11[1];
  v13 = (id *)(v11 + 1);
  v12 = v14;
  if (v14)
  {
    *v13 = 0;

  }
  objc_storeStrong(v13, v10);
  v17 = objc_msgSend__addTransmittedPacket_(v7->_stats, v15, (_DWORD)v5 == 0, v16);
  if ((_DWORD)v5)
  {
    v18 = (void *)MEMORY[0x19400E788](v17);
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("error (%d) sending sequence %d"), v20, v5, v6, v36.tv_sec, *(_QWORD *)&v36.tv_usec);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1906B3874();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v7->_stringToWriteToFile, v23, (uint64_t)v22, v24);
    objc_msgSend_appendString_(v7->_stringToWriteToFile, v25, (uint64_t)CFSTR(":"), v26);
    objc_msgSend_appendString_(v7->_stringToWriteToFile, v27, (uint64_t)v21, v28);
    objc_msgSend_appendString_(v7->_stringToWriteToFile, v29, (uint64_t)CFSTR("\n"), v30);
    if (_IMWillLog(CFSTR("IMPingTest")))
      _IMAlwaysLog(0, CFSTR("IMPingTest"), CFSTR("%@:%@"), v31, v32, v33, v34, v35, (char)v22);

    objc_autoreleasePoolPop(v18);
  }

  objc_sync_exit(v7);
}

- (void)dealloc
{
  uint64_t i;
  void *v4;
  objc_super v5;

  for (i = 8; i != 1288; i += 8)
  {
    v4 = *(Class *)((char *)&self->super.isa + i);
    *(Class *)((char *)&self->super.isa + i) = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)_IMPingStatisticsCollector;
  -[_IMPingStatisticsCollector dealloc](&v5, sel_dealloc);
}

- (timeval)timeSentForPacket:(int)a3
{
  _IMPingStatisticsCollector *v4;
  _IMPingPacketData *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __darwin_time_t v15;
  uint64_t v16;
  timeval result;

  v4 = self;
  objc_sync_enter(v4);
  v5 = v4->_timestampArray[a3 % 160];
  if (objc_msgSend_sequenceNumber(v5, v6, v7, v8) == a3)
  {
    v12 = objc_msgSend_timeSent(v5, v9, v10, v11);
    v14 = v13;
  }
  else
  {
    v14 = 0;
    v12 = 0;
  }
  objc_sync_exit(v4);

  v15 = v12;
  v16 = v14;
  result.tv_usec = v16;
  result.tv_sec = v15;
  return result;
}

- (void)addEchoReplyPacket:(int)a3
{
  uint64_t v3;
  _IMPingPacketData **timestampArray;
  int v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _IMPingPacketData *v9;
  NSMutableArray *v10;
  NSMutableArray *roundTriptimes;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  double v21;
  _IMPingPacketData *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  _IMPingStatisticsCollector *obj;

  v3 = *(_QWORD *)&a3;
  obj = self;
  objc_sync_enter(obj);
  timestampArray = obj->_timestampArray;
  v5 = (int)v3 % 160;
  v9 = obj->_timestampArray[(int)v3 % 160];
  if (obj->_roundTriptimes)
  {
    if (!v9)
      goto LABEL_10;
  }
  else
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    roundTriptimes = obj->_roundTriptimes;
    obj->_roundTriptimes = v10;

    if (!v9)
      goto LABEL_10;
  }
  if (objc_msgSend_sequenceNumber(v9, v6, v7, v8) == (_DWORD)v3)
  {
    objc_msgSend__returnPacketArrived(v9, v12, v13, v14);
    objc_msgSend_rtt(v9, v15, v16, v17);
    v21 = v20;
    if (v20 < 20.0)
    {
      objc_msgSend_addObject_(obj->_roundTriptimes, v18, (uint64_t)v9, v19);
      v22 = timestampArray[v5];
      timestampArray[v5] = 0;

      v23 = (void *)MEMORY[0x19400E788]();
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v24, (uint64_t)CFSTR("sequence %d rtt %f s"), v25, v3, *(_QWORD *)&v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1906B3874();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(obj->_stringToWriteToFile, v28, (uint64_t)v27, v29);
      objc_msgSend_appendString_(obj->_stringToWriteToFile, v30, (uint64_t)CFSTR(":"), v31);
      objc_msgSend_appendString_(obj->_stringToWriteToFile, v32, (uint64_t)v26, v33);
      objc_msgSend_appendString_(obj->_stringToWriteToFile, v34, (uint64_t)CFSTR("\n"), v35);
      if (_IMWillLog(CFSTR("IMPingTest")))
        _IMAlwaysLog(0, CFSTR("IMPingTest"), CFSTR("%@:%@"), v36, v37, v38, v39, v40, (char)v27);

      objc_autoreleasePoolPop(v23);
      objc_msgSend__addReceivedPacket_(obj->_stats, v41, v42, v43, v21);
    }
  }
LABEL_10:

  objc_sync_exit(obj);
}

- (void)timeoutOldSequenceNumbers:(double)a3
{
  uint64_t i;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _IMPingStatisticsCollector *obj;

  obj = self;
  objc_sync_enter(obj);
  for (i = 8; i != 1288; i += 8)
  {
    v5 = *(id *)((char *)&obj->super.isa + i);
    if ((objc_msgSend_timedOut(v5, v6, v7, v8) & 1) == 0)
    {
      objc_msgSend__markPacketAsTimedOut_(v5, v9, v10, v11, a3);
      if (!objc_msgSend_error(v5, v12, v13, v14))
      {
        if (objc_msgSend_timedOut(v5, v15, v16, v17))
        {
          v18 = (void *)MEMORY[0x19400E788]();
          v19 = (void *)MEMORY[0x1E0CB3940];
          v23 = objc_msgSend_sequenceNumber(v5, v20, v21, v22);
          v27 = objc_msgSend_error(v5, v24, v25, v26);
          objc_msgSend_stringWithFormat_(v19, v28, (uint64_t)CFSTR("sequence number %d timeout, error = %d"), v29, v23, v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1906B3874();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(obj->_stringToWriteToFile, v32, (uint64_t)v31, v33);
          objc_msgSend_appendString_(obj->_stringToWriteToFile, v34, (uint64_t)CFSTR(":"), v35);
          objc_msgSend_appendString_(obj->_stringToWriteToFile, v36, (uint64_t)v30, v37);
          objc_msgSend_appendString_(obj->_stringToWriteToFile, v38, (uint64_t)CFSTR("\n"), v39);
          if (_IMWillLog(CFSTR("IMPingTest")))
            _IMAlwaysLog(0, CFSTR("IMPingTest"), CFSTR("%@:%@"), v40, v41, v42, v43, v44, (char)v31);

          objc_autoreleasePoolPop(v18);
        }
      }
    }

  }
  objc_sync_exit(obj);

}

- (BOOL)logStatsToFile:(id)a3 error:(id *)a4
{
  id v6;
  _IMPingStatisticsCollector *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  NSMutableString *stringToWriteToFile;
  char v35;
  id v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v44;

  v6 = a3;
  v7 = self;
  v8 = objc_sync_enter(v7);
  v9 = (void *)MEMORY[0x19400E788](v8);
  v10 = (void *)MEMORY[0x19400E788]();
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_pingStats(v7, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v11, v16, (uint64_t)CFSTR("%@"), v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  sub_1906B3874();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v7->_stringToWriteToFile, v20, (uint64_t)v19, v21);
  objc_msgSend_appendString_(v7->_stringToWriteToFile, v22, (uint64_t)CFSTR(":"), v23);
  objc_msgSend_appendString_(v7->_stringToWriteToFile, v24, (uint64_t)v18, v25);
  objc_msgSend_appendString_(v7->_stringToWriteToFile, v26, (uint64_t)CFSTR("\n"), v27);
  if (_IMWillLog(CFSTR("IMPingTest")))
    _IMAlwaysLog(0, CFSTR("IMPingTest"), CFSTR("%@:%@"), v28, v29, v30, v31, v32, (char)v19);

  objc_autoreleasePoolPop(v10);
  if (!v6)
  {
    v36 = 0;
LABEL_9:
    v37 = 0;
    goto LABEL_10;
  }
  stringToWriteToFile = v7->_stringToWriteToFile;
  v44 = 0;
  v35 = objc_msgSend_writeToFile_atomically_encoding_error_(stringToWriteToFile, v33, (uint64_t)v6, 1, 4, &v44);
  v36 = v44;
  if ((v35 & 1) == 0)
  {
    if (_IMWillLog(CFSTR("IMPingTest")))
      _IMAlwaysLog(0, CFSTR("IMPingTest"), CFSTR("Failed to write string to path %@"), v38, v39, v40, v41, v42, (char)v6);
    goto LABEL_9;
  }
  v37 = 1;
LABEL_10:
  objc_autoreleasePoolPop(v9);
  objc_sync_exit(v7);

  if (a4 && v36)
    *a4 = objc_retainAutorelease(v36);

  return v37;
}

- (id)pingStats
{
  _IMPingStatisticsCollector *v2;
  IMPingStatistics *stats;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  IMPingStatistics *v9;
  uint64_t roundTriptimes;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;

  v2 = self;
  objc_sync_enter(v2);
  stats = v2->_stats;
  objc_msgSend__computeMedianTime_(v2, v4, (uint64_t)v2->_roundTriptimes, v5);
  objc_msgSend__setMedianRoundtripTime_(stats, v6, v7, v8);
  v9 = v2->_stats;
  roundTriptimes = (uint64_t)v2->_roundTriptimes;
  v14 = objc_msgSend_numPingsReceived(v9, v11, v12, v13);
  objc_msgSend_averageRoundtripTime(v2->_stats, v15, v16, v17);
  objc_msgSend__computeStandardDeviation_numPings_averageRTT_(v2, v18, roundTriptimes, v14);
  objc_msgSend__setStandardDeviationRoundtripTime_(v9, v19, v20, v21);
  objc_sync_exit(v2);

  return (id)objc_msgSend_copy(v2->_stats, v22, v23, v24);
}

- (id)pingStatsForLastNSeconds:(double)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  IMPingStatistics *v9;
  _IMPingStatisticsCollector *v10;
  NSMutableArray *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  _BOOL8 v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v8 = (void *)objc_msgSend_initWithCapacity_(v5, v6, (int)a3, v7);
  v9 = objc_alloc_init(IMPingStatistics);
  v10 = self;
  objc_sync_enter(v10);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v11 = v10->_roundTriptimes;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v58, (uint64_t)v62, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v59 != v17)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v20 = objc_msgSend_timeSent(v19, v13, v14, v15);
        objc_msgSend_rtt(v19, v21, v22, v23, v20, v21, (_QWORD)v58);
        if (v24 > 0.0 && sub_1906B313C((uint64_t)&v57) < a3)
        {
          v25 = objc_msgSend_error(v19, v13, v14, v15) == 0;
          objc_msgSend__addTransmittedPacket_(v9, v26, v25, v27);
          objc_msgSend_rtt(v19, v28, v29, v30);
          objc_msgSend__addReceivedPacket_(v9, v31, v32, v33);
          v37 = (void *)objc_msgSend_copy(v19, v34, v35, v36);
          objc_msgSend_addObject_(v8, v38, (uint64_t)v37, v39);

        }
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v58, (uint64_t)v62, 16);
    }
    while (v16);
  }

  v43 = objc_msgSend_numPingsReceived(v9, v40, v41, v42);
  objc_msgSend_averageRoundtripTime(v9, v44, v45, v46);
  objc_msgSend__computeStandardDeviation_numPings_averageRTT_(v10, v47, (uint64_t)v8, v43);
  objc_msgSend__setStandardDeviationRoundtripTime_(v9, v48, v49, v50);
  objc_msgSend__computeMedianTime_(v10, v51, (uint64_t)v8, v52);
  objc_msgSend__setMedianRoundtripTime_(v9, v53, v54, v55);
  objc_sync_exit(v10);

  return v9;
}

- (double)_computeMedianTime:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;

  v3 = a3;
  if (objc_msgSend_count(v3, v4, v5, v6))
  {
    objc_msgSend_sortUsingComparator_(v3, v7, (uint64_t)&unk_1E2C43008, v8);
    v12 = objc_msgSend_count(v3, v9, v10, v11);
    objc_msgSend_objectAtIndex_(v3, v13, v12 >> 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rtt(v15, v16, v17, v18);
    v20 = v19;

  }
  else
  {
    v20 = 0.0;
  }

  return v20;
}

- (double)_computeStandardDeviation:(id)a3 numPings:(int)a4 averageRTT:(double)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v9)
  {
    v13 = v9;
    v14 = *(_QWORD *)v24;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v7);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (!objc_msgSend_error(v17, v10, v11, v12))
        {
          objc_msgSend_rtt(v17, v10, v11, v12);
          v15 = v15 + (v18 - a5) * (v18 - a5);
        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 0.0;
  }
  if ((int)objc_msgSend_numPingsReceived(self->_stats, v10, v11, v12) >= 1)
    v15 = sqrt(v15 / (double)(int)objc_msgSend_numPingsReceived(self->_stats, v19, v20, v21));

  return v15;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_stringToWriteToFile, 0);
  objc_storeStrong((id *)&self->_roundTriptimes, 0);
  v3 = 1280;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
