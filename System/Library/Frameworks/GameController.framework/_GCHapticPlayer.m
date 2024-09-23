@implementation _GCHapticPlayer

- (_GCHapticPlayer)initWithIdentifier:(unint64_t)a3 actuators:(id)a4 client:(id)a5
{
  id v8;
  id v9;
  _GCHapticPlayer *v10;
  uint64_t v11;
  NSArray *actuators;
  uint64_t v13;
  NSMutableArray *scheduledCommands;
  uint64_t v15;
  NSMutableArray *activeHapticEvents;
  uint64_t v17;
  NSMutableArray *eventsToRemove;
  uint64_t v19;
  NSMutableArray *intensityParamCurve;
  uint64_t v21;
  NSMutableArray *sharpnessParamCurve;
  uint64_t v23;
  NSNumber *identifier;
  objc_super v26;

  v8 = a4;
  v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_GCHapticPlayer;
  v10 = -[_GCHapticPlayer init](&v26, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    actuators = v10->_actuators;
    v10->_actuators = (NSArray *)v11;

    +[NSMutableArray array](&off_254DEBB20, "array");
    v13 = objc_claimAutoreleasedReturnValue();
    scheduledCommands = v10->_scheduledCommands;
    v10->_scheduledCommands = (NSMutableArray *)v13;

    +[NSMutableArray array](&off_254DEBB20, "array");
    v15 = objc_claimAutoreleasedReturnValue();
    activeHapticEvents = v10->_activeHapticEvents;
    v10->_activeHapticEvents = (NSMutableArray *)v15;

    +[NSMutableArray array](&off_254DEBB20, "array");
    v17 = objc_claimAutoreleasedReturnValue();
    eventsToRemove = v10->_eventsToRemove;
    v10->_eventsToRemove = (NSMutableArray *)v17;

    +[NSMutableArray array](&off_254DEBB20, "array");
    v19 = objc_claimAutoreleasedReturnValue();
    intensityParamCurve = v10->_intensityParamCurve;
    v10->_intensityParamCurve = (NSMutableArray *)v19;

    +[NSMutableArray array](&off_254DEBB20, "array");
    v21 = objc_claimAutoreleasedReturnValue();
    sharpnessParamCurve = v10->_sharpnessParamCurve;
    v10->_sharpnessParamCurve = (NSMutableArray *)v21;

    +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", a3);
    v23 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSNumber *)v23;

    objc_storeStrong((id *)&v10->_client, a5);
    v10->_retainedByClient = 1;
    v10->_initializationTime = (double)mach_absolute_time() * 0.0000000416666667;
    -[_GCHapticPlayer clearParameters](v10, "clearParameters");
  }

  return v10;
}

- (BOOL)transientsEnqueuedSinceLastQuery
{
  BOOL transientsEnqueuedSinceLastQuery;

  transientsEnqueuedSinceLastQuery = self->_transientsEnqueuedSinceLastQuery;
  self->_transientsEnqueuedSinceLastQuery = 0;
  return transientsEnqueuedSinceLastQuery;
}

- (void)processSliceForLogicalDevice:(id)a3 startTime:(double)a4 endTime:(double)a5
{
  id *v6;
  unint64_t i;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  NSMutableArray *v14;
  unint64_t v15;
  _GCHapticPlayer *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  __int128 v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  int v34;
  double v35;
  double v36;
  double v37;
  float v38;
  double v39;
  float v40;
  double v41;
  double v42;
  float v43;
  double v44;
  float v45;
  float v46;
  float v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  double v51;
  float v52;
  float v53;
  float v54;
  NSArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  double v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  float v65;
  __int128 v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  NSMutableArray *v72;
  NSMutableArray *obj;
  _GCHapticPlayer *v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  _BYTE v87[20];
  double v88;
  double v89[3];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v6 = (id *)a3;
  self->_continuousIntensity = 0.0;
  self->_continuousSharpness = 0.0;
  self->_activeEventThisSlice = 0;
  if (!-[NSMutableArray count](self->_activeHapticEvents, "count"))
    goto LABEL_71;
  v75 = self;
  +[NSMutableIndexSet indexSet](&off_254E08588, "indexSet");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = self->_intensityParamCurve;
  for (i = 0; ; ++i)
  {
    if (-[NSMutableArray count](v72, "count") <= i)
    {
      v11 = 0.0;
      v12 = 0.0;
      v9 = 0.0;
      v10 = 0.0;
      goto LABEL_10;
    }
    -[NSMutableArray objectAtIndexedSubscript:](v72, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getValue:", buf);
    v9 = *(double *)&v87[12];
    if (*(double *)&v87[12] < a4)
    {
      objc_msgSend(v69, "addIndex:", i);
      goto LABEL_7;
    }
    v10 = *(double *)&v87[4];
    if (*(double *)&v87[4] <= a5)
      break;
LABEL_7:

  }
  v75->_activeEventThisSlice = 1;
  v12 = v88;
  v11 = v89[0];

LABEL_10:
  -[NSMutableArray removeObjectsAtIndexes:](v72, "removeObjectsAtIndexes:", v69);
  +[NSMutableIndexSet indexSet](&off_254E08588, "indexSet");
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = v75->_sharpnessParamCurve;
  v15 = 0;
  v70 = (void *)v13;
  while (2)
  {
    v16 = v75;
    if (-[NSMutableArray count](v14, "count") <= v15)
    {
      v19 = 0.0;
      v18 = 0.0;
      v20 = 0.0;
      v21 = 0.0;
      goto LABEL_18;
    }
    -[NSMutableArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "getValue:", buf);
    v18 = *(double *)&v87[12];
    if (*(double *)&v87[12] < a4)
    {
      objc_msgSend(v70, "addIndex:", v15);
LABEL_15:

      ++v15;
      continue;
    }
    break;
  }
  v19 = *(double *)&v87[4];
  if (*(double *)&v87[4] > a5)
    goto LABEL_15;
  v20 = v88;
  v21 = v89[0];

  v16 = v75;
LABEL_18:
  -[NSMutableArray removeObjectsAtIndexes:](v14, "removeObjectsAtIndexes:", v70);
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v16->_activeHapticEvents;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
  if (!v22)
    goto LABEL_68;
  v76 = *(_QWORD *)v83;
  *(float *)&v23 = (a4 - v10) / (v9 - v10);
  v24 = v12 + *(float *)&v23 * (v11 - v12);
  *(float *)&v23 = (a4 - v19) / (v18 - v19);
  v25 = v20 + *(float *)&v23 * (v21 - v20);
  *(_QWORD *)&v23 = 138413058;
  v66 = v23;
  while (2)
  {
    v77 = v22;
    v26 = 0;
    while (2)
    {
      if (*(_QWORD *)v83 != v76)
        objc_enumerationMutation(obj);
      v27 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v26);
      if (objc_msgSend(v27, "type", v66) != 1)
      {
LABEL_29:
        v34 = 0;
        goto LABEL_30;
      }
      objc_msgSend(v6[10], "actuators");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "type") == 0;

      if (v30)
      {
        objc_msgSend(v27, "startTime");
        v16 = v75;
        if (v35 + 0.1 <= a5)
          objc_msgSend(v27, "setStopped:", 1);
        goto LABEL_29;
      }
      objc_msgSend(v6[10], "actuators");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "type") == 1;

      if (v33)
      {
        v34 = 1;
        v16 = v75;
        v75->_transientsEnqueuedSinceLastQuery = 1;
      }
      else
      {
        v34 = 0;
        v16 = v75;
      }
LABEL_30:
      if (objc_msgSend(v27, "stopped"))
      {
        -[NSMutableArray addObject:](v16->_eventsToRemove, "addObject:", v27);
      }
      else
      {
        objc_msgSend(v27, "sharpness");
        v37 = v36;
        objc_msgSend(v27, "intensity");
        v38 = v37;
        v40 = v39;
        if ((objc_msgSend(v27, "transientBeganAsContinuousEvent") & 1) == 0)
        {
          -[_GCHapticDynamicParameter value](v16->_intensityParameter, "value");
          v42 = v41;
          -[_GCHapticDynamicParameter value](v16->_sharpnessParameter, "value");
          v45 = v44 + v38;
          if (v10 <= 0.0)
          {
            v40 = v42 * v40;
          }
          else
          {
            v43 = v42 * v40;
            v46 = v24 * v43;
            v40 = v46;
          }
          if (v19 <= 0.0)
          {
            v38 = v45;
          }
          else
          {
            v47 = v25 + v45;
            v38 = v47;
          }
          if (objc_msgSend(v27, "type") == 1)
          {
            objc_msgSend(v6[10], "actuators");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "firstObject");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "type") == 0;

            if (v50)
            {
              objc_msgSend(v27, "setTransientBeganAsContinuousEvent:", 1);
              v16 = v75;
              objc_msgSend(v27, "setIntensity:", v40);
              objc_msgSend(v27, "setSharpness:", v38);
            }
            else
            {
              v16 = v75;
            }
          }
        }
        if (v34)
        {
          if (-[_GCHapticPlayer isMuted](v16, "isMuted"))
          {
            v51 = 0.0;
            objc_msgSend(v27, "setIntensity:", 0.0);
          }
          else
          {
            -[_GCHapticPlayer hapticStrength](v16, "hapticStrength");
            objc_msgSend(v27, "setIntensity:", (float)(v40 * v54));
            v51 = v38;
          }
          objc_msgSend(v27, "setSharpness:", v51);
          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          v55 = v16->_actuators;
          v56 = -[NSArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
          if (v56)
          {
            v57 = *(_QWORD *)v79;
            do
            {
              v58 = 0;
              do
              {
                if (*(_QWORD *)v79 != v57)
                  objc_enumerationMutation(v55);
                v59 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v58);
                if (gc_isInternalBuild())
                {
                  getGCHapticsLogger();
                  v60 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                  {
                    -[_GCHapticClientProxy identifier](v75->_client, "identifier");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    v67 = objc_msgSend(v59, "index");
                    objc_msgSend(v27, "intensity");
                    v62 = v61;
                    objc_msgSend(v27, "sharpness");
                    *(_DWORD *)buf = v66;
                    *(_QWORD *)v87 = v68;
                    *(_WORD *)&v87[8] = 2048;
                    *(_QWORD *)&v87[10] = v67;
                    *(_WORD *)&v87[18] = 2048;
                    v88 = v62;
                    LOWORD(v89[0]) = 2048;
                    *(_QWORD *)((char *)v89 + 2) = v63;
                    _os_log_debug_impl(&dword_215181000, v60, OS_LOG_TYPE_DEBUG, "%@ enqueue transient for motor %lu I=(%.3f) S=(%.3f)", buf, 0x2Au);

                  }
                }
                objc_msgSend(v6[9], "enqueueTransient:hapticMotor:", v27, 2 * objc_msgSend(v59, "index"));
                ++v58;
              }
              while (v56 != v58);
              v64 = -[NSArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
              v56 = v64;
            }
            while (v64);
          }

          v16 = v75;
          -[NSMutableArray addObject:](v75->_eventsToRemove, "addObject:", v27);
        }
        else
        {
          v16->_continuousSharpness = v38 + v16->_continuousSharpness;
          if (-[_GCHapticClientProxy shouldSquareContinuousIntensity](v16->_client, "shouldSquareContinuousIntensity"))
          {
            -[_GCHapticPlayer hapticStrength](v16, "hapticStrength");
            v53 = v16->_continuousIntensity + (float)((float)(v40 * v40) * v52);
          }
          else
          {
            -[_GCHapticPlayer hapticStrength](v16, "hapticStrength");
            v53 = v16->_continuousIntensity + (float)(v40 * v65);
          }
          v16->_continuousIntensity = v53;
        }
        v16->_activeEventThisSlice |= v40 > 0.0;
      }
      if (++v26 != v77)
        continue;
      break;
    }
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
    if (v22)
      continue;
    break;
  }
LABEL_68:

  if (v75->_activeEventThisSlice)
  {
    v75->_activeLifetime = a5 - a4 + v75->_activeLifetime;
    v75->_lastActiveTime = a5;
  }
  -[NSMutableArray removeObjectsInArray:](v75->_activeHapticEvents, "removeObjectsInArray:", v75->_eventsToRemove);
  -[NSMutableArray removeAllObjects](v75->_eventsToRemove, "removeAllObjects");

LABEL_71:
}

- (void)setMute:(BOOL)a3 forReason:(unint64_t)a4
{
  char *v4;
  int v5;
  int v6;

  v4 = (char *)self + 4 * a4;
  v5 = *((_DWORD *)v4 + 15);
  if (a3)
    v6 = v5 + 1;
  else
    v6 = v5 - 1;
  *((_DWORD *)v4 + 15) = (int)fmin((double)v6, 0.0);
  self->_dirtyMuteState = 1;
}

- (BOOL)isMutedForReason:(unint64_t)a3
{
  void *v7;

  if (a3 >= 5)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHapticPlayer.mm"), 225, CFSTR("Attempting to check if player is muted for invalid reason"));

  }
  return self->_muteReasons[a3] != 0;
}

- (float)hapticStrength
{
  float result;

  -[_GCHapticClientProxy hapticStrength](self->_client, "hapticStrength");
  return result;
}

- (BOOL)isMuted
{
  BOOL result;
  uint64_t v4;

  if (-[_GCHapticClientProxy isMuted](self->_client, "isMuted"))
    return 1;
  if (!self->_dirtyMuteState)
    return self->_muted;
  v4 = 0;
  self->_muted = 0;
  while (!self->_muteReasons[v4])
  {
    if (++v4 == 5)
      return 0;
  }
  result = 1;
  self->_muted = 1;
  return result;
}

- (float)continuousIntensity
{
  BOOL v3;
  float result;

  v3 = -[_GCHapticPlayer isMuted](self, "isMuted");
  result = 0.0;
  if (!v3)
    return self->_continuousIntensity;
  return result;
}

- (float)continuousSharpness
{
  BOOL v3;
  float result;

  v3 = -[_GCHapticPlayer isMuted](self, "isMuted");
  result = 0.0;
  if (!v3)
    return self->_continuousSharpness;
  return result;
}

- (BOOL)hasScheduledCommands
{
  return -[NSMutableArray count](self->_scheduledCommands, "count") != 0;
}

- (BOOL)hasProcessedActiveEventsAfterTime:(double)a3
{
  uint64_t v5;

  v5 = -[NSMutableArray count](self->_activeHapticEvents, "count");
  if (v5)
    LOBYTE(v5) = self->_lastActiveTime > a3;
  return v5;
}

- (BOOL)hasProcessedActiveEventsThisSlice
{
  uint64_t v3;

  v3 = -[NSMutableArray count](self->_activeHapticEvents, "count");
  if (v3)
    LOBYTE(v3) = self->_activeEventThisSlice;
  return v3;
}

- (BOOL)hasScheduledEventsByTime:(double)a3
{
  void *v5;
  double v6;
  BOOL v7;

  if (!-[NSMutableArray count](self->_scheduledCommands, "count"))
    return 0;
  -[NSMutableArray lastObject](self->_scheduledCommands, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "time");
  v7 = v6 <= a3;

  return v7;
}

- (BOOL)isActiveAtTime:(double)a3
{
  return a3 - self->_initializationTime < 0.200000003
      || -[_GCHapticPlayer hasProcessedActiveEventsThisSlice](self, "hasProcessedActiveEventsThisSlice")
      || -[_GCHapticPlayer hasScheduledCommands](self, "hasScheduledCommands")
      || self->_retainedByClient;
}

- (void)setRetainedByClient:(BOOL)a3
{
  void *v5;

  if (self->_retainedByClient && !a3)
  {
    +[_GCHapticServerManager sharedInstance](_GCHapticServerManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notifyPlayerNoLongerRetained:", self);

  }
  self->_retainedByClient = a3;
}

- (void)scheduleCommand:(const void *)a3
{
  _GCHapticSyntheticCommand *v5;

  v5 = -[_GCHapticSyntheticCommand initWithHapticCommand:]([_GCHapticSyntheticCommand alloc], "initWithHapticCommand:", a3);
  if (*((_WORD *)a3 + 1) == 1)
    -[_GCHapticClientProxy setComplete:](self->_client, "setComplete:", 0);
  -[NSMutableArray insertObject:atIndex:](self->_scheduledCommands, "insertObject:atIndex:", v5, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_scheduledCommands, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, -[NSMutableArray count](self->_scheduledCommands, "count"), 1024, &__block_literal_global_23));

}

- (void)clearParameters
{
  _GCHapticDynamicParameter *v3;
  _GCHapticDynamicParameter *intensityParameter;
  _GCHapticDynamicParameter *v5;
  _GCHapticDynamicParameter *sharpnessParameter;
  NSObject *v7;
  NSObject *v8;
  int v9;
  _GCHapticPlayer *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_INFO, "Clear parameters for %@", (uint8_t *)&v9, 0xCu);
    }

  }
  v3 = -[_GCHapticDynamicParameter initWithType:value:]([_GCHapticDynamicParameter alloc], "initWithType:value:", 5002, 1.0);
  intensityParameter = self->_intensityParameter;
  self->_intensityParameter = v3;

  v5 = -[_GCHapticDynamicParameter initWithType:value:]([_GCHapticDynamicParameter alloc], "initWithType:value:", 5003, 0.0);
  sharpnessParameter = self->_sharpnessParameter;
  self->_sharpnessParameter = v5;

  if (-[_GCHapticPlayer isMutedForReason:](self, "isMutedForReason:", 2))
  {
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = self;
        _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_INFO, "Unmuting %@ for reason GCHapticMuteReasonSetParameter", (uint8_t *)&v9, 0xCu);
      }

    }
    -[_GCHapticPlayer setMute:forReason:](self, "setMute:forReason:", 0, 2);
  }
}

- (void)handleCommand:(id)a3
{
  id v4;
  int v5;
  float v6;
  uint64_t v7;
  NSMutableArray *intensityParamCurve;
  void *v9;
  void *v10;
  _GCHapticEvent *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  id v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  int v24;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  float v36;
  uint64_t v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  NSMutableArray *sharpnessParamCurve;
  uint64_t v43;
  double v44;
  NSObject *v45;
  NSObject *v46;
  double v47;
  NSObject *v48;
  double v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  double v53;
  NSObject *v54;
  uint64_t v55;
  double v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  unsigned int v63;
  float v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *log;
  NSObject *loga;
  float v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  unsigned int v79[4];
  uint8_t buf[4];
  _BYTE v81[34];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ++self->_totalEventsProcessed;
  switch(objc_msgSend(v4, "type"))
  {
    case 1u:
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "time");
          v60 = v59;
          objc_msgSend(v4, "tokenAndParams");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218496;
          *(_QWORD *)v81 = v60;
          *(_WORD *)&v81[8] = 2048;
          *(_QWORD *)&v81[10] = objc_msgSend(v61, "token");
          *(_WORD *)&v81[18] = 2048;
          *(_QWORD *)&v81[20] = objc_msgSend(v4, "channelID");
          _os_log_debug_impl(&dword_215181000, v50, OS_LOG_TYPE_DEBUG, "StartEvent at %f token %lu (ch=%lu)", buf, 0x20u);

        }
      }
      v11 = -[_GCHapticEvent initWithSyntheticCommand:]([_GCHapticEvent alloc], "initWithSyntheticCommand:", v4);
      -[NSMutableArray addObject:](self->_activeHapticEvents, "addObject:", v11);
      if (-[_GCHapticEvent type](v11, "type") == 2)
      {
        v12 = 148;
      }
      else
      {
        if (-[_GCHapticEvent type](v11, "type") != 1)
          goto LABEL_89;
        v12 = 144;
      }
      ++*(_DWORD *)((char *)&self->super.isa + v12);
      goto LABEL_89;
    case 2u:
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "tokenAndParams");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v81 = objc_msgSend(v62, "token");
          *(_WORD *)&v81[8] = 2048;
          *(_QWORD *)&v81[10] = objc_msgSend(v4, "channelID");
          _os_log_debug_impl(&dword_215181000, v51, OS_LOG_TYPE_DEBUG, "Stop event token %lu (ch=%lu)", buf, 0x16u);

        }
      }
      v13 = 0;
      while (2)
      {
        if (-[NSMutableArray count](self->_activeHapticEvents, "count") > v13)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_activeHapticEvents, "objectAtIndexedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "identifier");
          objc_msgSend(v4, "tokenAndParams");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v15) = v15 == objc_msgSend(v16, "token");

          if (!(_DWORD)v15)
          {

            ++v13;
            continue;
          }
          objc_msgSend(v14, "setStopped:", 1);

        }
        break;
      }
      goto LABEL_4;
    case 3u:
      v5 = objc_msgSend(v4, "paramID");
      if (v5 == 2014)
      {
        if (gc_isInternalBuild())
        {
          getGCHapticsLogger();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            -[_GCHapticPlayer handleCommand:].cold.4((uint64_t)buf, objc_msgSend(v4, "channelID"), v57);

        }
        objc_msgSend(v4, "value");
        -[_GCHapticPlayer setMute:forReason:](self, "setMute:forReason:", v6 != 0.0, 2);
        goto LABEL_4;
      }
      v79[0] = 0;
      v70 = 0.0;
      objc_msgSend(v4, "value");
      clientParamToSynthParam(v5, v36, v79, &v70);
      if (v79[0] == 5002)
      {
        v37 = 32;
      }
      else
      {
        if (v79[0] != 5003)
          goto LABEL_92;
        v37 = 40;
      }
      objc_msgSend(*(id *)((char *)&self->super.isa + v37), "setValue:", v70);
LABEL_92:
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          v63 = v79[0];
          v64 = v70;
          objc_msgSend(v4, "time");
          v66 = v65;
          v67 = objc_msgSend(v4, "channelID");
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)v81 = v63;
          *(_WORD *)&v81[4] = 2048;
          *(double *)&v81[6] = v64;
          *(_WORD *)&v81[14] = 2048;
          *(_QWORD *)&v81[16] = v66;
          *(_WORD *)&v81[24] = 2048;
          *(_QWORD *)&v81[26] = v67;
          _os_log_debug_impl(&dword_215181000, v45, OS_LOG_TYPE_DEBUG, "CommandType::SetParam - type %d param with value %f at time %.3f on channel %lu", buf, 0x26u);
        }

      }
      goto LABEL_4;
    case 4u:
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "time");
          -[_GCHapticPlayer handleCommand:].cold.1((uint64_t)buf, v53);
        }

      }
      v24 = -[NSMutableArray count](self->_scheduledCommands, "count");
      if (v24 < 1)
      {
        v25 = 0;
      }
      else
      {
        v25 = 0;
        v26 = v24 + 1;
        do
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_scheduledCommands, "objectAtIndexedSubscript:", (v26 - 2));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v27;
          v28 = objc_msgSend(v27, "channelID");
          if (v28 == objc_msgSend(v4, "channelID"))
          {
            objc_msgSend(v25, "time");
            v30 = v29;
            objc_msgSend(v4, "time");
            if (v30 >= v31 && objc_msgSend(v25, "type") != 5)
              objc_msgSend(v25, "cancel");
          }
          --v26;
        }
        while (v26 > 1);
      }
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v38 = self->_activeHapticEvents;
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v76 != v40)
              objc_enumerationMutation(v38);
            objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "setStopped:", 1);
          }
          v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
        }
        while (v39);
      }

      goto LABEL_4;
    case 5u:
      if (!gc_isInternalBuild())
        goto LABEL_4;
      getGCHapticsLogger();
      v11 = (_GCHapticEvent *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "time");
        -[_GCHapticPlayer handleCommand:].cold.2((uint64_t)buf, v32);
      }
      goto LABEL_89;
    case 0xAu:
      ++self->_parameterCurvesProcessed;
      v7 = objc_msgSend(v4, "paramID");
      if (v7 == 2001)
      {
        sharpnessParamCurve = self->_sharpnessParamCurve;
        objc_msgSend(v4, "parameterCurve");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "curve");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](sharpnessParamCurve, "addObjectsFromArray:", v10);
      }
      else
      {
        if (v7 != 2000)
          goto LABEL_86;
        intensityParamCurve = self->_intensityParamCurve;
        objc_msgSend(v4, "parameterCurve");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "curve");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](intensityParamCurve, "addObjectsFromArray:", v10);
      }

LABEL_86:
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v11 = (_GCHapticEvent *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEBUG))
        {
          v43 = objc_msgSend(v4, "paramID");
          objc_msgSend(v4, "time");
          -[_GCHapticPlayer handleCommand:].cold.5((uint64_t)buf, v43, v44);
        }
LABEL_89:

      }
LABEL_4:

      return;
    case 0xCu:
      v17 = objc_msgSend(v4, "channelID");
      v18 = -[NSMutableArray count](self->_scheduledCommands, "count");
      if (v18 < 1)
      {
        v19 = 0;
        v20 = 0;
      }
      else
      {
        v19 = 0;
        v20 = 0;
        v21 = v18 + 1;
        do
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_scheduledCommands, "objectAtIndexedSubscript:", (v21 - 2));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = v22;
          if (objc_msgSend(v22, "channelID") == v17)
          {
            v23 = objc_msgSend(v22, "serverID");
            if (v23 <= objc_msgSend(v4, "serverID"))
            {
              if (objc_msgSend(v20, "type") == 2)
              {
                if (gc_isInternalBuild())
                {
                  getGCHapticsLogger();
                  log = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v81 = v20;
                    _os_log_debug_impl(&dword_215181000, log, OS_LOG_TYPE_DEBUG, "Executing stop event early: %@", buf, 0xCu);
                  }

                }
                if (!v19)
                  v19 = (id)objc_opt_new();
                objc_msgSend(v19, "addObject:", v20);
              }
              else
              {
                if (gc_isInternalBuild())
                {
                  getGCHapticsLogger();
                  loga = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(loga, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v81 = v20;
                    _os_log_debug_impl(&dword_215181000, loga, OS_LOG_TYPE_DEBUG, "Canceling: %@", buf, 0xCu);
                  }

                }
                objc_msgSend(v20, "cancel");
              }
            }
          }
          --v21;
        }
        while (v21 > 1);
        if (v19)
        {
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v19 = v19;
          v33 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
          if (v33)
          {
            v34 = *(_QWORD *)v72;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v72 != v34)
                  objc_enumerationMutation(v19);
                -[_GCHapticPlayer handleCommand:](self, "handleCommand:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j));
              }
              v33 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
            }
            while (v33);
          }

        }
      }
      -[_GCHapticPlayer clearParameters](self, "clearParameters");
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          v55 = objc_msgSend(v4, "channelID");
          objc_msgSend(v4, "time");
          -[_GCHapticPlayer handleCommand:].cold.3((uint64_t)buf, v55, v56);
        }

      }
      goto LABEL_4;
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "time");
          -[_GCHapticPlayer handleCommand:].cold.7((uint64_t)buf, v49);
        }

      }
      goto LABEL_3;
    case 0x1Eu:
LABEL_3:
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "time");
          -[_GCHapticPlayer handleCommand:].cold.6((uint64_t)v79, v47);
        }

      }
      goto LABEL_4;
    default:
      if (!gc_isInternalBuild())
        goto LABEL_4;
      getGCHapticsLogger();
      v11 = (_GCHapticEvent *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "time");
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)v81 = v58;
        *(_WORD *)&v81[8] = 1024;
        *(_DWORD *)&v81[10] = objc_msgSend(v4, "type");
        *(_WORD *)&v81[14] = 1024;
        *(_DWORD *)&v81[16] = objc_msgSend(v4, "channelID");
        _os_log_error_impl(&dword_215181000, &v11->super, OS_LOG_TYPE_ERROR, "ERROR: read unrecognized command from client: time: %.3f type: %u chanID: %d", buf, 0x18u);
      }
      goto LABEL_89;
  }
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@: channel=%@, scheduled=%lu, active=%lu>"), objc_opt_class(), self->_identifier, -[NSMutableArray count](self->_scheduledCommands, "count"), -[NSMutableArray count](self->_activeHapticEvents, "count"));
}

- (void)teardown
{
  -[NSMutableArray removeAllObjects](self->_scheduledCommands, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_activeHapticEvents, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_eventsToRemove, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_intensityParamCurve, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_sharpnessParamCurve, "removeAllObjects");
  self->_retainedByClient = 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  objc_super v16;

  +[GCAnalytics instance](GCAnalytics, "instance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCHapticPlayer bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[_GCHapticPlayer controllerProductCategory](self, "controllerProductCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = -[_GCHapticPlayer totalEventsProcessed](self, "totalEventsProcessed");
  v9 = -[_GCHapticPlayer transientEventsProcessed](self, "transientEventsProcessed");
  v10 = -[_GCHapticPlayer continuousEventsProcessed](self, "continuousEventsProcessed");
  v11 = -[_GCHapticPlayer parameterCurvesProcessed](self, "parameterCurvesProcessed");
  -[_GCHapticPlayer totalLifetimeInSeconds](self, "totalLifetimeInSeconds");
  v13 = v12;
  -[_GCHapticPlayer activeLifetimeInSeconds](self, "activeLifetimeInSeconds");
  LODWORD(v15) = (int)v13;
  HIDWORD(v15) = (int)v14;
  objc_msgSend(v3, "sendHapticsPlayerDestroyedEventForBundleID:productCategory:totalEventsProcessed:transientEventsProcessed:continuousEventsProcessed:parameterCurvesProcessed:sessionTotalDuration:sessionActiveDuration:", v5, v7, v8, v9, v10, v11, v15);

  v16.receiver = self;
  v16.super_class = (Class)_GCHapticPlayer;
  -[_GCHapticPlayer dealloc](&v16, sel_dealloc);
}

- (int)totalEventsProcessed
{
  return self->_totalEventsProcessed;
}

- (int)transientEventsProcessed
{
  return self->_transientEventsProcessed;
}

- (int)continuousEventsProcessed
{
  return self->_continuousEventsProcessed;
}

- (int)parameterCurvesProcessed
{
  return self->_parameterCurvesProcessed;
}

- (double)totalLifetimeInSeconds
{
  double result;

  result = 0.0;
  if (self->_initializationTime >= 0.0)
    return (double)mach_absolute_time() * 0.0000000416666667 - self->_initializationTime;
  return result;
}

- (double)activeLifetimeInSeconds
{
  return self->_activeLifetime;
}

- (id)bundleIdentifier
{
  return -[_GCHapticClientProxy bundleIdentifier](self->_client, "bundleIdentifier");
}

- (id)controllerProductCategory
{
  return -[_GCHapticClientProxy controllerProductCategory](self->_client, "controllerProductCategory");
}

- (NSArray)actuators
{
  return self->_actuators;
}

- (_GCHapticLogicalDevice)hapticLogicalDevice
{
  return (_GCHapticLogicalDevice *)objc_loadWeakRetained((id *)&self->_hapticLogicalDevice);
}

- (void)setHapticLogicalDevice:(id)a3
{
  objc_storeWeak((id *)&self->_hapticLogicalDevice, a3);
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (BOOL)isRetainedByClient
{
  return self->_retainedByClient;
}

- (void)setTotalEventsProcessed:(int)a3
{
  self->_totalEventsProcessed = a3;
}

- (void)setTransientEventsProcessed:(int)a3
{
  self->_transientEventsProcessed = a3;
}

- (void)setContinuousEventsProcessed:(int)a3
{
  self->_continuousEventsProcessed = a3;
}

- (void)setParameterCurvesProcessed:(int)a3
{
  self->_parameterCurvesProcessed = a3;
}

- (void)setTotalLifetimeInSeconds:(double)a3
{
  self->_totalLifetimeInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_hapticLogicalDevice);
  objc_storeStrong((id *)&self->_actuators, 0);
  objc_storeStrong((id *)&self->_sharpnessParamCurve, 0);
  objc_storeStrong((id *)&self->_intensityParamCurve, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_sharpnessParameter, 0);
  objc_storeStrong((id *)&self->_intensityParameter, 0);
  objc_storeStrong((id *)&self->_eventsToRemove, 0);
  objc_storeStrong((id *)&self->_activeHapticEvents, 0);
  objc_storeStrong((id *)&self->_scheduledCommands, 0);
}

- (void)handleCommand:(uint64_t)a1 .cold.1(uint64_t a1, double a2)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_5(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_0_19(&dword_215181000, v2, v3, "Clear events at time %.3f", v4);
}

- (void)handleCommand:(uint64_t)a1 .cold.2(uint64_t a1, double a2)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_5(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_0_19(&dword_215181000, v2, v3, "Final event at time %.3f", v4);
}

- (void)handleCommand:(double)a3 .cold.3(uint64_t a1, uint64_t a2, double a3)
{
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_1_18(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_2_17(&dword_215181000, v3, v4, "Reset channel %lu at time %.3f", v5);
}

- (void)handleCommand:(NSObject *)a3 .cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_19(&dword_215181000, a3, (uint64_t)a3, "CommandType::SetParam - mute channel %lu haptics", (uint8_t *)a1);
}

- (void)handleCommand:(double)a3 .cold.5(uint64_t a1, uint64_t a2, double a3)
{
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_1_18(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_2_17(&dword_215181000, v3, v4, "Add parameter curve of type %lu at time %.3f", v5);
}

- (void)handleCommand:(uint64_t)a1 .cold.6(uint64_t a1, double a2)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_5(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_0_19(&dword_215181000, v2, v3, "NoOp at time %.3f", v4);
}

- (void)handleCommand:(uint64_t)a1 .cold.7(uint64_t a1, double a2)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_5(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_0_19(&dword_215181000, v2, v3, "Unsupported command at time %.3f", v4);
}

@end
