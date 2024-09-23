@implementation AWRemoteClient

- (BOOL)isStreamingClient
{
  return self->_continuousFaceDetectMode;
}

- (BOOL)activateMotionDetect
{
  return self->_activateMotionDetect;
}

- (BOOL)activateAttentionDetection
{
  return self->_activateAttentionDetection;
}

- (void)notifyHIDEvent:(__IOHIDEvent *)a3 mask:(unint64_t)a4 timestamp:(unint64_t)a5 senderID:(unint64_t)a6 displayUUID:(id)a7
{
  _OWORD v10[11];

  memset(v10, 0, sizeof(v10));
  if (-[AWRemoteClient _interestedInHIDEvent:mask:metadata:senderID:displayUUID:](self, "_interestedInHIDEvent:mask:metadata:senderID:displayUUID:", a3, a4, v10, a6, a7))
  {
    -[AWRemoteClient notifyEvent:timestamp:metadata:](self, "notifyEvent:timestamp:metadata:", a4, a5, v10);
  }
}

- (void)notifyEvent:(unint64_t)a3 timestamp:(unint64_t)a4 metadata:(id *)a5
{
  unint64_t v9;
  AWDigitizerButtonKeyboardAttentionEvent *v10;
  double v11;
  NSArray *v12;
  AWAttentionEvent *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  $F484E3E6FD0A2BE9213BA906CF92CD29 *v24;
  unint64_t var1;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _BOOL4 retroactiveTimeoutMode;
  double var0;
  NSObject *v31;
  unint64_t v32;
  double v33;
  AWAttentionLostEvent *v34;
  AWRemoteAttentionEvent *v35;
  double v36;
  AWFaceDetectAttentionEvent *v37;
  double v38;
  NSObject *v39;
  unint64_t v40;
  double v41;
  NSString *identifier;
  uint64_t v43;
  void *v44;
  double v45;
  $F484E3E6FD0A2BE9213BA906CF92CD29 *clientState;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  double v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = -[AWRemoteClient _activeEventMask](self, "_activeEventMask") & a3;
  switch(v9)
  {
    case 0uLL:
      return;
    case 1uLL:
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v12 = self->_attentionLostTimeoutsSec;
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      if (!v16)
        goto LABEL_79;
      v18 = v16;
      v19 = *(_QWORD *)v49;
      if (a4 == -1)
        v20 = INFINITY;
      else
        v20 = (double)a4 / 1000000000.0;
      *(_QWORD *)&v17 = 134218240;
      v47 = v17;
      break;
    case 2uLL:
    case 4uLL:
    case 8uLL:
      if (!a5)
        __assert_rtn("-[AWRemoteClient notifyEvent:timestamp:metadata:]", "RemoteClient.m", 606, "metadata != NULL");
      v10 = [AWDigitizerButtonKeyboardAttentionEvent alloc];
      if (a4 == -1)
        v11 = INFINITY;
      else
        v11 = (double)a4 / 1000000000.0;
      v15 = -[AWDigitizerButtonKeyboardAttentionEvent initWithTimestamp:tagIndex:eventMask:digitizerButtonKeyboardMetadata:](v10, "initWithTimestamp:tagIndex:eventMask:digitizerButtonKeyboardMetadata:", self->_tagIndex, v9, a5, v11);
      goto LABEL_60;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_11;
    default:
      if (v9 == 32)
      {
        if (!a5)
          __assert_rtn("-[AWRemoteClient notifyEvent:timestamp:metadata:]", "RemoteClient.m", 598, "metadata != NULL");
        v35 = [AWRemoteAttentionEvent alloc];
        if (a4 == -1)
          v36 = INFINITY;
        else
          v36 = (double)a4 / 1000000000.0;
        v15 = -[AWRemoteAttentionEvent initWithTimestamp:tagIndex:remoteMetadata:](v35, "initWithTimestamp:tagIndex:remoteMetadata:", self->_tagIndex, a5, v36);
      }
      else if (v9 == 128)
      {
        if (!a5)
          __assert_rtn("-[AWRemoteClient notifyEvent:timestamp:metadata:]", "RemoteClient.m", 590, "metadata != NULL");
        if (self->_nonSampledAttentionLostTimeoutEnable && self->_clientState->var11)
        {
          v12 = 0;
          goto LABEL_62;
        }
        v37 = [AWFaceDetectAttentionEvent alloc];
        if (a4 == -1)
          v38 = INFINITY;
        else
          v38 = (double)a4 / 1000000000.0;
        v15 = -[AWFaceDetectAttentionEvent initWithTimestamp:tagIndex:faceMetadata:](v37, "initWithTimestamp:tagIndex:faceMetadata:", self->_tagIndex, a5, v38);
      }
      else
      {
LABEL_11:
        v13 = [AWAttentionEvent alloc];
        if (a4 == -1)
          v14 = INFINITY;
        else
          v14 = (double)a4 / 1000000000.0;
        v15 = -[AWAttentionEvent initWithTimestamp:tagIndex:eventMask:](v13, "initWithTimestamp:tagIndex:eventMask:", self->_tagIndex, v9, v14);
      }
LABEL_60:
      v12 = (NSArray *)v15;
      if (v15 && !self->_clientState->var9)
      {
        -[AWRemoteClient deliverEvent:](self, "deliverEvent:", v15);
        goto LABEL_73;
      }
LABEL_62:
      if (currentLogLevel >= 7)
      {
        _AALog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = absTimeNS();
          if (v40 == -1)
            v41 = INFINITY;
          else
            v41 = (double)v40 / 1000000000.0;
          identifier = self->_identifier;
          getEventMaskDescription(v9);
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = (void *)v43;
          if (a4 == -1)
            v45 = INFINITY;
          else
            v45 = (double)a4 / 1000000000.0;
          *(_DWORD *)buf = 134218754;
          v53 = v41;
          v54 = 2112;
          v55 = *(double *)&identifier;
          v56 = 2112;
          v57 = v43;
          v58 = 2048;
          v59 = v45;
          _os_log_impl(&dword_1AF589000, v39, OS_LOG_TYPE_DEFAULT, "%13.5f: bump client %@ timestamp with %@ at %13.5f", buf, 0x2Au);

        }
      }
LABEL_73:
      if (self->_clientState->var7)
      {
        if (-[AWRemoteClient canDeliverPollingEvent](self, "canDeliverPollingEvent"))
        {
          -[AWRemoteClient deliverPollEventType:event:](self, "deliverPollEventType:event:", 2, v12);
          clientState = self->_clientState;
          clientState->var6 = 0;
          clientState->var7 = 0;
          self->_filteredPollingEventDelivered = 1;
        }
        else if (!self->_clientState->var8)
        {
          -[AWRemoteClient deliverPollEventType:event:](self, "deliverPollEventType:event:", 1, 0);
          self->_clientState->var8 = 1;
        }
      }
      -[AWRemoteClient updateEventTimesForMask:timestamp:](self, "updateEventTimesForMask:timestamp:", v9, a4);
LABEL_79:

      return;
  }
LABEL_20:
  v21 = 0;
  while (1)
  {
    if (*(_QWORD *)v49 != v19)
      objc_enumerationMutation(v12);
    objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v21), "doubleValue", v47, (_QWORD)v48);
    v23 = v22;
    v24 = self->_clientState;
    var1 = v24->var1;
    v26 = (unint64_t)(v22 * 1000000000.0);
    if (v22 > 1.84467441e19)
      v26 = -1;
    v27 = var1 + v26;
    if (var1 + v26 >= 0xFFFFFFFFFFFFFFFELL)
      v27 = -2;
    if (__CFADD__(var1, v26))
      v28 = -2;
    else
      v28 = v27;
    if (v28 > a4)
      goto LABEL_46;
    if (v24->var9)
    {
      v24->var9 = 0;
      +[AWSampleLogger client:attentionStateChange:](AWSampleLogger, "client:attentionStateChange:", self, 0);
      retroactiveTimeoutMode = self->_retroactiveTimeoutMode;
    }
    else
    {
      var0 = v24->var0;
      retroactiveTimeoutMode = self->_retroactiveTimeoutMode;
      if (var0 >= v23)
      {
        if (!self->_retroactiveTimeoutMode)
          goto LABEL_46;
LABEL_35:
        if (currentLogLevel >= 7)
        {
          _AALog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = absTimeNS();
            if (v32 == -1)
              v33 = INFINITY;
            else
              v33 = (double)v32 / 1000000000.0;
            *(_DWORD *)buf = v47;
            v53 = v33;
            v54 = 2048;
            v55 = v23;
            _os_log_impl(&dword_1AF589000, v31, OS_LOG_TYPE_DEFAULT, "%13.5f: Setting up retroactive timeout mode for %13.5f timeout value", buf, 0x16u);
          }

        }
        self->_retroactiveTimeoutMode = 0;
        goto LABEL_45;
      }
    }
    if (retroactiveTimeoutMode)
      goto LABEL_35;
LABEL_45:
    self->_clientState->var0 = v23;
    v34 = -[AWAttentionLostEvent initWithTimestamp:tagIndex:attentionLostTimeout:]([AWAttentionLostEvent alloc], "initWithTimestamp:tagIndex:attentionLostTimeout:", self->_tagIndex, v20, v23);
    -[AWRemoteClient deliverEvent:](self, "deliverEvent:", v34);

LABEL_46:
    if (v18 == ++v21)
    {
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      if (!v18)
        goto LABEL_79;
      goto LABEL_20;
    }
  }
}

- (BOOL)_interestedInHIDEvent:(__IOHIDEvent *)a3 mask:(unint64_t)a4 metadata:(id *)a5 senderID:(unint64_t)a6 displayUUID:(id)a7
{
  __CFString *v11;
  BOOL v12;
  unint64_t eventMask;
  NSSet *digitizerDisplayUUIDs;
  const __CFString *v15;

  v11 = (__CFString *)a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v12 = 1;
  if (a4 <= 8 && ((1 << a4) & 0x114) != 0)
  {
    eventMask = self->_eventMask;
    if ((eventMask & 8) != 0)
    {
      if (!-[NSSet count](self->_digitizerDisplayUUIDs, "count"))
        goto LABEL_17;
      digitizerDisplayUUIDs = self->_digitizerDisplayUUIDs;
      if (!v11)
        goto LABEL_15;
    }
    else
    {
      if ((eventMask & 2) == 0)
      {
        if ((eventMask & 4) != 0 && -[NSSet count](self->_keyboardDisplayUUIDs, "count"))
        {
          digitizerDisplayUUIDs = self->_keyboardDisplayUUIDs;
          if (v11)
          {
            if (!-[NSSet containsObject:](digitizerDisplayUUIDs, "containsObject:", v11))
              goto LABEL_18;
            goto LABEL_17;
          }
          goto LABEL_15;
        }
LABEL_17:
        a5->var1.var0 = a6;
        a5->var1.var1 = (int64_t)v11;
        goto LABEL_19;
      }
      if (!-[NSSet count](self->_buttonDisplayUUIDs, "count"))
        goto LABEL_17;
      digitizerDisplayUUIDs = self->_buttonDisplayUUIDs;
      if (!v11)
      {
LABEL_15:
        v15 = CFSTR("builtIn");
LABEL_16:
        if (!-[NSSet containsObject:](digitizerDisplayUUIDs, "containsObject:", v15))
        {
LABEL_18:
          v12 = 0;
          goto LABEL_19;
        }
        goto LABEL_17;
      }
    }
    v15 = v11;
    goto LABEL_16;
  }
LABEL_19:

  return v12;
}

- (unint64_t)nextAttentionLostTime:(BOOL *)a3
{
  NSObject *v5;
  unint64_t v6;
  double v7;
  $F484E3E6FD0A2BE9213BA906CF92CD29 *clientState;
  unint64_t var1;
  double v10;
  NSString *identifier;
  _BOOL4 var9;
  unint64_t var0;
  double v14;
  $F484E3E6FD0A2BE9213BA906CF92CD29 *v15;
  void *v16;
  double v17;
  unint64_t v18;
  unint64_t samplingInterval;
  unint64_t samplingDelay;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  double v31;
  $F484E3E6FD0A2BE9213BA906CF92CD29 *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  double v43;
  __int16 v44;
  NSString *v45;
  __int16 v46;
  _BOOL4 v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (currentLogLevel >= 7)
  {
    _AALog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = absTimeNS();
      if (v6 == -1)
        v7 = INFINITY;
      else
        v7 = (double)v6 / 1000000000.0;
      clientState = self->_clientState;
      var1 = clientState->var1;
      if (var1 == -1)
        v10 = INFINITY;
      else
        v10 = (double)var1 / 1000000000.0;
      identifier = self->_identifier;
      var9 = clientState->var9;
      var0 = (unint64_t)clientState->var0;
      if (var0 == -1)
        v14 = INFINITY;
      else
        v14 = (double)var0 / 1000000000.0;
      *(_DWORD *)buf = 134219010;
      v43 = v7;
      v44 = 2112;
      v45 = identifier;
      v46 = 1024;
      v47 = var9;
      v48 = 2048;
      v49 = v10;
      v50 = 2048;
      v51 = v14;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ lastState %d lastPos %13.5f lastNegTO %13.5f", buf, 0x30u);
    }

  }
  if (a3)
    *a3 = 0;
  v15 = self->_clientState;
  if (!v15->var1)
    return -1;
  if (!v15->var9 || !-[NSArray count](self->_attentionLostTimeoutsSec, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = self->_attentionLostTimeoutsSec;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "doubleValue", (_QWORD)v37);
          v32 = self->_clientState;
          if (v32->var0 < v31)
          {
            v33 = v32->var1;
            v34 = (unint64_t)(v31 * 1000000000.0);
            if (v31 > 1.84467441e19)
              v34 = -1;
            v35 = v33 + v34;
            if (v33 + v34 >= 0xFFFFFFFFFFFFFFFELL)
              v35 = -2;
            if (__CFADD__(v33, v34))
              v25 = -2;
            else
              v25 = v35;

            return v25;
          }
          if (self->_retroactiveTimeoutMode)
            -[AWRemoteClient notifyEvent:timestamp:metadata:](self, "notifyEvent:timestamp:metadata:", 1, absTimeNS(), 0);
        }
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v28)
          continue;
        break;
      }
    }

    return -1;
  }
  -[NSArray objectAtIndexedSubscript:](self->_attentionLostTimeoutsSec, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  if (v17 > 1.84467441e19)
    v18 = -1;
  else
    v18 = (unint64_t)(v17 * 1000000000.0);

  samplingInterval = self->_samplingInterval;
  if (samplingInterval)
  {
    if (a3)
    {
      samplingDelay = self->_samplingDelay;
      v21 = v18 >= samplingDelay;
      v22 = v18 - samplingDelay;
      if (v21)
        *a3 = v22 % samplingInterval == 0;
    }
  }
  v23 = self->_clientState->var1;
  v24 = v23 + v18;
  if (v23 + v18 >= 0xFFFFFFFFFFFFFFFELL)
    v24 = -2;
  if (__CFADD__(v23, v18))
    return -2;
  else
    return v24;
}

- (void)updateDeadlinesForTime:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t v8;
  double v9;
  double v10;
  unint64_t var7;
  double v12;
  double v13;
  NSString *identifier;
  int v15;
  char *AttentionSamplerStateDescription;
  unint64_t v17;
  double v18;
  AWRemoteClient *v19;
  uint64_t v20;
  int v21;
  $F484E3E6FD0A2BE9213BA906CF92CD29 *clientState;
  $F484E3E6FD0A2BE9213BA906CF92CD29 *v23;
  unint64_t var6;
  uint64_t v25;
  unint64_t v26;
  NSObject *v27;
  unint64_t v28;
  double v29;
  $F484E3E6FD0A2BE9213BA906CF92CD29 *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  unint64_t v45;
  NSObject *v46;
  unint64_t v47;
  double v48;
  NSString *v49;
  unint64_t v50;
  double v51;
  unint64_t v52;
  NSObject *v53;
  unint64_t v54;
  double v55;
  NSString *v56;
  double v57;
  NSObject *v58;
  unint64_t v59;
  double v60;
  NSString *v61;
  NSObject *v62;
  unint64_t v63;
  double v64;
  NSString *v65;
  unsigned __int8 v66;
  _BYTE buf[24];
  double v68;
  _BYTE v69[48];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  int v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[AWScheduler attentionSampler](self->_scheduler, "attentionSampler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  v6 = -[AWRemoteClient nextAttentionLostTime:](self, "nextAttentionLostTime:", &v66);
  if (currentLogLevel >= 7)
  {
    _AALog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = absTimeNS();
      if (v8 == -1)
        v9 = INFINITY;
      else
        v9 = (double)v8 / 1000000000.0;
      if (a3 == -1)
        v10 = INFINITY;
      else
        v10 = (double)a3 / 1000000000.0;
      var7 = self->_clientState->var7;
      if (var7 == -1)
        v12 = INFINITY;
      else
        v12 = (double)var7 / 1000000000.0;
      if (v6 == -1)
        v13 = INFINITY;
      else
        v13 = (double)v6 / 1000000000.0;
      identifier = self->_identifier;
      v15 = v66;
      AttentionSamplerStateDescription = getAttentionSamplerStateDescription(objc_msgSend(v5, "currentState"));
      v17 = objc_msgSend(v5, "lastPositiveDetectTime");
      if (v17 == -1)
        v18 = INFINITY;
      else
        v18 = (double)v17 / 1000000000.0;
      *(_DWORD *)buf = 134219778;
      *(double *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = identifier;
      *(_WORD *)&buf[22] = 2048;
      v68 = v10;
      *(_WORD *)v69 = 2048;
      *(double *)&v69[2] = v12;
      *(_WORD *)&v69[10] = 2048;
      *(double *)&v69[12] = v13;
      *(_WORD *)&v69[20] = 1024;
      *(_DWORD *)&v69[22] = v15;
      *(_WORD *)&v69[26] = 2080;
      *(_QWORD *)&v69[28] = AttentionSamplerStateDescription;
      *(_WORD *)&v69[36] = 2048;
      *(double *)&v69[38] = v18;
      _os_log_impl(&dword_1AF589000, v7, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ now %13.5f pollingDeadline %13.5f attentionLostTime %13.5f shouldSample %d samplerState %s lastPos %13.5f", buf, 0x4Eu);
    }

  }
  if (!self->_activateMotionDetect)
  {
    if (!self->_clientState->var10)
    {
      if (self->_continuousFaceDetectMode)
        goto LABEL_39;
      v21 = objc_msgSend(v5, "currentState");
      clientState = self->_clientState;
      if (v21 == 1)
      {
        clientState->var10 = 1;
        v19 = self;
        v20 = 1;
LABEL_37:
        -[AWRemoteClient deliverNotification:](v19, "deliverNotification:", v20);
        goto LABEL_39;
      }
      if (!clientState->var10)
        goto LABEL_39;
    }
    if (self->_continuousFaceDetectMode
      || objc_msgSend(v5, "currentState") != 3 && objc_msgSend(v5, "currentState") != 5)
    {
      goto LABEL_39;
    }
    self->_clientState->var10 = 0;
    v19 = self;
    v20 = 2;
    goto LABEL_37;
  }
  if (self->_clientState->var10)
  {
LABEL_22:
    if (-[AWScheduler canRunMotionDetect](self->_scheduler, "canRunMotionDetect")
      && (objc_msgSend(v5, "currentState") == 3 || objc_msgSend(v5, "currentState") == 5))
    {
      -[AWRemoteClient deliverNotification:](self, "deliverNotification:", 16);
      self->_clientState->var10 = 0;
    }
    goto LABEL_39;
  }
  if (-[AWScheduler canRunMotionDetect](self->_scheduler, "canRunMotionDetect"))
  {
    if (self->_clientState->var10)
      goto LABEL_22;
  }
  else
  {
    -[AWRemoteClient deliverNotification:](self, "deliverNotification:", 8);
    self->_clientState->var10 = 1;
  }
LABEL_39:
  v23 = self->_clientState;
  if (!v23->var7)
    goto LABEL_64;
  if (!v23->var8)
  {
    if (!-[AWRemoteClient _isSamplingClient](self, "_isSamplingClient"))
      goto LABEL_61;
    if (objc_msgSend(v5, "currentState") == 3 || objc_msgSend(v5, "currentState") == 4)
    {
      var6 = self->_clientState->var6;
      v25 = var6 + 2000000000;
      if (var6 + 2000000000 >= 0xFFFFFFFFFFFFFFFELL)
        v25 = -2;
      if (var6 < 0xFFFFFFFF88CA6C00)
        v26 = v25;
      else
        v26 = -2;
      if (v26 < a3)
      {
        if (currentLogLevel >= 6)
        {
          _AALog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = absTimeNS();
            if (v28 == -1)
              v29 = INFINITY;
            else
              v29 = (double)v28 / 1000000000.0;
            *(_DWORD *)buf = 134217984;
            *(double *)&buf[4] = v29;
            _os_log_impl(&dword_1AF589000, v27, OS_LOG_TYPE_DEFAULT, "%13.5f: timed out waiting for poll initialization; sending event now",
              buf,
              0xCu);
          }

        }
        goto LABEL_61;
      }
      if (-[AWRemoteClient shouldInitBeSent](self, "shouldInitBeSent"))
      {
LABEL_61:
        -[AWRemoteClient deliverPollEventType:event:](self, "deliverPollEventType:event:", 1, 0);
        self->_clientState->var8 = 1;
      }
    }
  }
  v30 = self->_clientState;
  if (v30->var7 <= a3)
  {
    v30->var6 = 0;
    v30->var7 = 0;
  }
LABEL_64:
  if (-[AWRemoteClient _isSamplingClient](self, "_isSamplingClient"))
  {
    if (objc_msgSend(v5, "currentState") == 5)
    {
      *(_QWORD *)buf = 0;
      buf[0] = objc_msgSend(v5, "lastFaceMetadataValid");
      objc_msgSend(v5, "lastPitch");
      *(_QWORD *)&buf[8] = v31;
      objc_msgSend(v5, "lastYaw");
      *(_QWORD *)&buf[16] = v32;
      objc_msgSend(v5, "lastRoll");
      v68 = v33;
      *(_QWORD *)v69 = objc_msgSend(v5, "lastOrientation");
      objc_msgSend(v5, "lastDistance");
      *(_QWORD *)&v69[8] = v34;
      *(_QWORD *)&v69[16] = objc_msgSend(v5, "lastFaceState");
      *(_QWORD *)&v69[24] = objc_msgSend(v5, "lastMetadataType");
      *(_OWORD *)&v69[32] = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      objc_msgSend(v5, "lastAttentionScore");
      v73 = v35;
      objc_msgSend(v5, "lastFaceDetectionScore");
      v74 = v36;
      v75 = objc_msgSend(v5, "lastPersonID");
      objc_msgSend(v5, "lastFaceBounds");
      v37 = 0;
      v76 = v38;
      v77 = v39;
      v78 = v40;
      v79 = v41;
      do
      {
        objc_msgSend(v5, "lastMotionData");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectAtIndexedSubscript:", v37);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "floatValue");
        *(_DWORD *)&v69[4 * v37 + 32] = v44;

        ++v37;
      }
      while (v37 != 16);
      -[AWRemoteClient notifyEvent:timestamp:metadata:](self, "notifyEvent:timestamp:metadata:", 128, objc_msgSend(v5, "lastPositiveDetectTime"), buf);
    }
    else if (!v66
           || objc_msgSend(v5, "currentState") == 3
           || objc_msgSend(v5, "currentState") == 4
           || self->_clientState->var10)
    {
      -[AWRemoteClient notifyEvent:timestamp:](self, "notifyEvent:timestamp:", 1, a3);
    }
    else if (v66 && v6 <= a3)
    {
      if (currentLogLevel >= 7)
      {
        _AALog();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          v63 = absTimeNS();
          if (v63 == -1)
            v64 = INFINITY;
          else
            v64 = (double)v63 / 1000000000.0;
          v65 = self->_identifier;
          *(_DWORD *)buf = 134218242;
          *(double *)&buf[4] = v64;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v65;
          _os_log_impl(&dword_1AF589000, v62, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ scheduling single shot", buf, 0x16u);
        }

      }
      objc_msgSend(v5, "updateSamplingDeadline:forClient:", 0, self);
    }
    v45 = self->_clientState->var7;
    if (v45)
    {
      if (currentLogLevel >= 7)
      {
        _AALog();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = absTimeNS();
          if (v47 == -1)
            v48 = INFINITY;
          else
            v48 = (double)v47 / 1000000000.0;
          v49 = self->_identifier;
          v50 = self->_clientState->var7;
          if (v50 == -1)
            v51 = INFINITY;
          else
            v51 = (double)v50 / 1000000000.0;
          *(_DWORD *)buf = 134218498;
          *(double *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v49;
          *(_WORD *)&buf[22] = 2048;
          v68 = v51;
          _os_log_impl(&dword_1AF589000, v46, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ scheduling poll with deadline %13.5f", buf, 0x20u);
        }

        v45 = self->_clientState->var7;
      }
      objc_msgSend(v5, "updateSamplingDeadline:forClient:", v45, self);
    }
  }
  else if (v6 <= a3)
  {
    -[AWRemoteClient notifyEvent:timestamp:](self, "notifyEvent:timestamp:", 1, a3);
  }
  v52 = -[AWRemoteClient nextSampleTime](self, "nextSampleTime");
  if (currentLogLevel >= 7)
  {
    _AALog();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = absTimeNS();
      if (v54 == -1)
        v55 = INFINITY;
      else
        v55 = (double)v54 / 1000000000.0;
      v56 = self->_identifier;
      if (v52 == -1)
        v57 = INFINITY;
      else
        v57 = (double)v52 / 1000000000.0;
      *(_DWORD *)buf = 134218498;
      *(double *)&buf[4] = v55;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v56;
      *(_WORD *)&buf[22] = 2048;
      v68 = v57;
      _os_log_impl(&dword_1AF589000, v53, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ nextSampleTime %13.5f", buf, 0x20u);
    }

  }
  if (v52 <= a3)
  {
    if (currentLogLevel >= 7)
    {
      _AALog();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = absTimeNS();
        if (v59 == -1)
          v60 = INFINITY;
        else
          v60 = (double)v59 / 1000000000.0;
        v61 = self->_identifier;
        *(_DWORD *)buf = 134218242;
        *(double *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v61;
        _os_log_impl(&dword_1AF589000, v58, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ scheduling single shot", buf, 0x16u);
      }

    }
    objc_msgSend(v5, "updateSamplingDeadline:forClient:", 0, self);
  }

}

- (unint64_t)nextTimerForTime:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  unint64_t v7;
  double v8;
  $F484E3E6FD0A2BE9213BA906CF92CD29 *clientState;
  unint64_t var6;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  unint64_t v17;
  double v18;
  NSString *identifier;
  NSString *v21;
  unint64_t v22;
  uint8_t buf[4];
  double v24;
  __int16 v25;
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[AWScheduler attentionSampler](self->_scheduler, "attentionSampler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AWRemoteClient _isSamplingClient](self, "_isSamplingClient")
    && objc_msgSend(v5, "currentState") == 2)
  {
    if (currentLogLevel >= 7)
    {
      _AALog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = absTimeNS();
        if (v7 == -1)
          v8 = INFINITY;
        else
          v8 = (double)v7 / 1000000000.0;
        identifier = self->_identifier;
        *(_DWORD *)buf = 134218242;
        v24 = v8;
        v25 = 2112;
        v26 = identifier;
        _os_log_impl(&dword_1AF589000, v6, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ doesn't need to be scheduled since the sampler is initializing", buf, 0x16u);
      }

    }
    v15 = -1;
  }
  else
  {
    v22 = -1;
    updateDeadline(&v22, -[AWRemoteClient nextAttentionLostTime:](self, "nextAttentionLostTime:", 0), self->_identifier, (uint64_t)"[self nextAttentionLostTime:NULL]", 1228);
    clientState = self->_clientState;
    if (clientState->var7)
    {
      if (!clientState->var8 && !clientState->var10)
      {
        var6 = clientState->var6;
        v11 = var6 + 2000000000;
        if (var6 + 2000000000 >= 0xFFFFFFFFFFFFFFFELL)
          v11 = -2;
        if (var6 < 0xFFFFFFFF88CA6C00)
          v12 = v11;
        else
          v12 = -2;
        updateDeadline(&v22, v12, self->_identifier, (uint64_t)"computeDeadline(_clientState->pollingStartTime, MAX_POLL_INITIALIZED_DELAY)", 1236);
      }
      if (-[AWRemoteClient _isSamplingClient](self, "_isSamplingClient"))
      {
        v13 = objc_msgSend(v5, "minimumAttentionSamplerErrorRetryTime");
        if (v13 > a3)
          updateDeadline(&v22, v13, self->_identifier, (uint64_t)"minErrorRetryTime", 1246);
      }
      updateDeadline(&v22, self->_clientState->var7, self->_identifier, (uint64_t)"_clientState->pollingDeadline", 1251);
    }
    if (-[AWRemoteClient _isSamplingClient](self, "_isSamplingClient"))
    {
      v14 = -[AWRemoteClient nextSampleTime](self, "nextSampleTime");
      if ((objc_msgSend(v5, "currentState") == 3
         || v14 <= a3
         || objc_msgSend(v5, "currentState") == 4)
        && !self->_sampleWhileAbsent
        && !self->_activateMotionDetect)
      {
        if (currentLogLevel >= 7)
        {
          _AALog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = absTimeNS();
            if (v17 == -1)
              v18 = INFINITY;
            else
              v18 = (double)v17 / 1000000000.0;
            v21 = self->_identifier;
            *(_DWORD *)buf = 134218242;
            v24 = v18;
            v25 = 2112;
            v26 = v21;
            _os_log_impl(&dword_1AF589000, v16, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ ignoring next sampling deadline since the sampler state is absent", buf, 0x16u);
          }

        }
      }
      else
      {
        updateDeadline(&v22, v14, self->_identifier, (uint64_t)"nextSampleTime", 1267);
      }
    }
    v15 = v22;
  }

  return v15;
}

- (BOOL)_isSamplingClient
{
  return (-[AWRemoteClient _activeEventMask](self, "_activeEventMask") >> 7) & 1;
}

- (unint64_t)_activeEventMask
{
  uint64_t v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = 56;
  if (!self->_clientState->var9)
    v3 = 64;
  return *(unint64_t *)((char *)&self->super.isa + v3);
}

- (unint64_t)nextSampleTime
{
  $F484E3E6FD0A2BE9213BA906CF92CD29 *clientState;
  unint64_t samplingInterval;
  unint64_t var2;
  unint64_t samplingDelay;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  unint64_t v11;
  double v12;
  NSString *identifier;
  double v15;
  int v16;
  double v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_activateMotionDetect)
  {
    clientState = self->_clientState;
    samplingInterval = self->_samplingInterval;
  }
  else
  {
    samplingInterval = self->_samplingInterval;
    if (!samplingInterval)
      return -1;
    clientState = self->_clientState;
    if (!clientState->var9 && !self->_sampleWhileAbsent)
      return -1;
  }
  var2 = clientState->var2;
  samplingDelay = self->_samplingDelay;
  v7 = var2 + samplingDelay;
  if (var2 + samplingDelay >= 0xFFFFFFFFFFFFFFFELL)
    v7 = -2;
  if (__CFADD__(var2, samplingDelay))
    v8 = -2;
  else
    v8 = v7;
  v9 = -[AWScheduler nextSamplingTimeForSamplingInterval:](self->_scheduler, "nextSamplingTimeForSamplingInterval:", samplingInterval);
  if (currentLogLevel >= 7)
  {
    _AALog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = absTimeNS();
      if (v11 == -1)
        v12 = INFINITY;
      else
        v12 = (double)v11 / 1000000000.0;
      identifier = self->_identifier;
      if (v9 == -1)
        v15 = INFINITY;
      else
        v15 = (double)v9 / 1000000000.0;
      v16 = 134218754;
      v17 = v12;
      v18 = 2112;
      v19 = identifier;
      v20 = 2048;
      v21 = (double)v8 / 1000000000.0;
      v22 = 2048;
      v23 = v15;
      _os_log_impl(&dword_1AF589000, v10, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ delayedTime %13.5f nextSampleTime %13.5f", (uint8_t *)&v16, 0x2Au);
    }

  }
  if (v8 <= v9)
    return v9;
  else
    return v8;
}

- (void)deliverEvent:(id)a3
{
  AWAttentionEvent *v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  NSString *identifier;
  AWAttentionEvent *lastEvent;
  AWAttentionEvent *v10;
  double v11;
  int v12;
  double v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  AWAttentionEvent *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (AWAttentionEvent *)a3;
  if (currentLogLevel >= 6)
  {
    _AALog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = absTimeNS();
      if (v6 == -1)
        v7 = INFINITY;
      else
        v7 = (double)v6 / 1000000000.0;
      identifier = self->_identifier;
      v12 = 134218498;
      v13 = v7;
      v14 = 2112;
      v15 = identifier;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: notify client %@ of %@", (uint8_t *)&v12, 0x20u);
    }

  }
  lastEvent = self->_lastEvent;
  self->_lastEvent = v4;
  v10 = v4;

  self->_clientState->var5 = -[AWAttentionEvent eventMask](v10, "eventMask");
  self->_clientState->var4 = -[AWAttentionEvent tagIndex](v10, "tagIndex");
  -[AWAttentionEvent timestamp](v10, "timestamp");
  self->_clientState->var3 = (unint64_t)v11;
  -[AWFrameworkClient notifyEvent:](self->_proxy, "notifyEvent:", v10);
  +[AWSampleLogger client:event:](AWSampleLogger, "client:event:", self, v10);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)updateEventTimesForMask:(unint64_t)a3 timestamp:(unint64_t)a4
{
  $F484E3E6FD0A2BE9213BA906CF92CD29 *clientState;
  unint64_t var1;
  NSObject *v9;
  unint64_t v10;
  double v11;
  double v12;
  void *v13;
  NSObject *nonSampledAttentionTimer;
  double nonSampledAttentionLostTimeout;
  int64_t v16;
  dispatch_time_t v17;
  int v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  clientState = self->_clientState;
  var1 = clientState->var1;
  if (var1 <= a4)
    var1 = a4;
  clientState->var1 = var1;
  if ((a3 & 0x80) == 0)
  {
    if (currentLogLevel >= 7)
    {
      _AALog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = absTimeNS();
        if (v10 == -1)
          v11 = INFINITY;
        else
          v11 = (double)v10 / 1000000000.0;
        if (a4 == -1)
          v12 = INFINITY;
        else
          v12 = (double)a4 / 1000000000.0;
        getEventMaskDescription(a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 134218498;
        v19 = v11;
        v20 = 2048;
        v21 = v12;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_1AF589000, v9, OS_LOG_TYPE_DEFAULT, "%13.5f: Last HID Event %13.5f, %@", (uint8_t *)&v18, 0x20u);

      }
      clientState = self->_clientState;
    }
    clientState->var11 = 0;
    if (clientState->var2 < a4)
    {
      clientState->var2 = a4;
      if (self->_nonSampledAttentionLostTimeoutEnable)
      {
        if (self->_nonSampledAttentionTimerResumed)
          dispatch_suspend((dispatch_object_t)self->_nonSampledAttentionTimer);
        nonSampledAttentionTimer = self->_nonSampledAttentionTimer;
        nonSampledAttentionLostTimeout = self->_nonSampledAttentionLostTimeout;
        if (nonSampledAttentionLostTimeout > 1.84467441e19)
          v16 = -1;
        else
          v16 = (unint64_t)(nonSampledAttentionLostTimeout * 1000000000.0);
        v17 = dispatch_time(0, v16);
        dispatch_source_set_timer(nonSampledAttentionTimer, v17, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
        dispatch_resume((dispatch_object_t)self->_nonSampledAttentionTimer);
        self->_nonSampledAttentionTimerResumed = 1;
        clientState = self->_clientState;
      }
    }
  }
  if (!clientState->var9 && !clientState->var11)
  {
    clientState->var9 = 1;
    +[AWSampleLogger client:attentionStateChange:](AWSampleLogger, "client:attentionStateChange:", self, 1);
  }
}

- (void)notifyEvent:(unint64_t)a3 timestamp:(unint64_t)a4
{
  -[AWRemoteClient notifyEvent:timestamp:metadata:](self, "notifyEvent:timestamp:metadata:", a3, a4, 0);
}

- (AWRemoteClient)initWithProxy:(id)a3 connection:(id)a4 clientConfig:(id)a5 clientIndex:(int)a6 clientId:(id)a7 scheduler:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  AWRemoteClient *v20;
  uint64_t v21;
  OS_dispatch_queue *queue;
  uint64_t v23;
  NSString *identifier;
  uint64_t v25;
  OS_os_transaction *transaction;
  AWRemoteClient *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unint64_t v33;
  double v34;
  id v35;
  id v36;
  objc_super v37;
  uint64_t v38;
  const __CFString *v39;
  uint8_t buf[4];
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v35 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v16, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v37.receiver = self;
    v37.super_class = (Class)AWRemoteClient;
    v20 = -[AWRemoteClient init](&v37, sel_init);
    if (v20)
    {
      awQueue(1);
      v21 = objc_claimAutoreleasedReturnValue();
      queue = v20->_queue;
      v20->_queue = (OS_dispatch_queue *)v21;

      objc_storeStrong((id *)&v20->_scheduler, a8);
      objc_storeStrong((id *)&v20->_proxy, a3);
      objc_msgSend(v16, "identifier");
      v23 = objc_claimAutoreleasedReturnValue();
      identifier = v20->_identifier;
      v20->_identifier = (NSString *)v23;

      objc_storeStrong((id *)&v20->_connection, a4);
      v20->_clientIndex = a6;
      objc_storeStrong((id *)&v20->_clientId, a7);
      -[NSString UTF8String](v20->_identifier, "UTF8String");
      v25 = os_transaction_create();
      transaction = v20->_transaction;
      v20->_transaction = (OS_os_transaction *)v25;

      -[AWRemoteClient initializeClientState](v20, "initializeClientState");
      if (!-[AWRemoteClient _setClientConfig:shouldReset:error:](v20, "_setClientConfig:shouldReset:error:", v16, a6 == -1, a9))
      {

        v20 = 0;
      }
    }
    self = v20;
    v27 = self;
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v33 = absTimeNS();
        if (v33 == -1)
          v34 = INFINITY;
        else
          v34 = (double)v33 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v41 = v34;
        _os_log_error_impl(&dword_1AF589000, v28, OS_LOG_TYPE_ERROR, "%13.5f: denying attempt to create client with nil identifier", buf, 0xCu);
      }

    }
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2FE0];
    v38 = *MEMORY[0x1E0CB2D50];
    v39 = CFSTR(" Not creating client with nil identifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 22, v31);
    *a9 = (id)objc_claimAutoreleasedReturnValue();

    v27 = 0;
  }

  return v27;
}

- (void)initializeClientState
{
  void *v3;
  NSXPCConnection *connection;
  uint64_t clientIndex;
  $F484E3E6FD0A2BE9213BA906CF92CD29 *v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  double v10;
  void *v11;
  NSXPCConnection *v12;
  int v13;
  unint64_t v14;
  double v15;
  NSObject *v16;
  unint64_t v17;
  double v18;
  NSString *v19;
  int v20;
  NSString *identifier;
  int v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  NSString *v26;
  $F484E3E6FD0A2BE9213BA906CF92CD29 *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  double v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_clientIndex != -1)
  {
LABEL_2:
    +[AWPersistentDataManager sharedManager](AWPersistentDataManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    connection = self->_connection;
    clientIndex = self->_clientIndex;
    v28 = 0;
    v6 = ($F484E3E6FD0A2BE9213BA906CF92CD29 *)objc_msgSend(v3, "clientStateWithConnection:index:error:", connection, clientIndex, &v28);
    v7 = v28;
    self->_clientState = v6;

    if (!v7 || currentLogLevel < 3)
    {
      if (!v7)
        goto LABEL_28;
      goto LABEL_27;
    }
    _AALog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v9 = absTimeNS();
    if (v9 == -1)
      v10 = INFINITY;
    else
      v10 = (double)v9 / 1000000000.0;
    identifier = self->_identifier;
    v22 = self->_clientIndex;
    *(_DWORD *)buf = 134218754;
    v31 = v10;
    v32 = 2112;
    v33 = identifier;
    v34 = 1024;
    LODWORD(v35[0]) = v22;
    WORD2(v35[0]) = 2112;
    *(_QWORD *)((char *)v35 + 6) = v7;
    v23 = "%13.5f: %@ failed to obtain persistent client state for index %d: %@";
    v24 = v8;
    v25 = 38;
    goto LABEL_25;
  }
  +[AWPersistentDataManager sharedManager](AWPersistentDataManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_connection;
  v29 = 0;
  v13 = objc_msgSend(v11, "openWithConnection:error:", v12, &v29);
  v7 = v29;
  self->_clientIndex = v13;

  if (!v7)
  {
    if (currentLogLevel >= 7)
    {
      _AALog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = absTimeNS();
        if (v17 == -1)
          v18 = INFINITY;
        else
          v18 = (double)v17 / 1000000000.0;
        v19 = self->_identifier;
        v20 = self->_clientIndex;
        *(_DWORD *)buf = 134218498;
        v31 = v18;
        v32 = 2112;
        v33 = v19;
        v34 = 1024;
        LODWORD(v35[0]) = v20;
        _os_log_impl(&dword_1AF589000, v16, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ obtained index %d for persistent data access", buf, 0x1Cu);
      }

    }
    goto LABEL_2;
  }
  if (currentLogLevel < 3)
    goto LABEL_27;
  _AALog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v14 = absTimeNS();
    if (v14 == -1)
      v15 = INFINITY;
    else
      v15 = (double)v14 / 1000000000.0;
    v26 = self->_identifier;
    *(_DWORD *)buf = 134218498;
    v31 = v15;
    v32 = 2112;
    v33 = v26;
    v34 = 2112;
    v35[0] = v7;
    v23 = "%13.5f: %@ failed to obtain index for persistent data access: %@";
    v24 = v8;
    v25 = 32;
LABEL_25:
    _os_log_error_impl(&dword_1AF589000, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
  }
LABEL_26:

LABEL_27:
  self->_clientIndex = -1;
  v27 = ($F484E3E6FD0A2BE9213BA906CF92CD29 *)malloc_type_calloc(1uLL, 0x48uLL, 0x100004052436E4DuLL);
  self->_clientState = v27;
  if (!v27)
    __assert_rtn("-[AWRemoteClient initializeClientState]", "RemoteClient.m", 159, "_clientState");
LABEL_28:

}

- (id)description
{
  objc_class *v3;
  unint64_t samplingInterval;
  double v5;
  unint64_t samplingDelay;
  double v7;
  _BOOL4 sampleWhileAbsent;
  _BOOL4 retroactiveTimeoutMode;
  _BOOL4 pollingFilter;
  _BOOL4 continuousFaceDetectMode;
  _BOOL4 unityStream;
  _BOOL4 activateEyeRelief;
  _BOOL4 activateAttentionDetection;
  _BOOL4 activateMotionDetect;
  unint64_t nonSampledAttentionLostTimeout;
  double v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  NSString *identifier;
  void *v38;
  void *v39;
  void *v40;

  v39 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  samplingInterval = self->_samplingInterval;
  if (samplingInterval == -1)
    v5 = INFINITY;
  else
    v5 = (double)samplingInterval / 1000000000.0;
  samplingDelay = self->_samplingDelay;
  if (samplingDelay == -1)
    v7 = INFINITY;
  else
    v7 = (double)samplingDelay / 1000000000.0;
  identifier = self->_identifier;
  sampleWhileAbsent = self->_sampleWhileAbsent;
  retroactiveTimeoutMode = self->_retroactiveTimeoutMode;
  pollingFilter = self->_pollingFilter;
  continuousFaceDetectMode = self->_continuousFaceDetectMode;
  unityStream = self->_unityStream;
  activateEyeRelief = self->_activateEyeRelief;
  activateAttentionDetection = self->_activateAttentionDetection;
  activateMotionDetect = self->_activateMotionDetect;
  -[NSArray componentsJoinedByString:](self->_attentionLostTimeoutsSec, "componentsJoinedByString:", CFSTR(", "));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  nonSampledAttentionLostTimeout = (unint64_t)self->_nonSampledAttentionLostTimeout;
  if (nonSampledAttentionLostTimeout == -1)
    v17 = INFINITY;
  else
    v17 = (double)nonSampledAttentionLostTimeout / 1000000000.0;
  if (self->_nonSampledAttentionLostTimeoutEnable)
    v18 = "true";
  else
    v18 = "false";
  if (activateMotionDetect)
    v19 = "true";
  else
    v19 = "false";
  v35 = v18;
  v36 = v19;
  if (activateAttentionDetection)
    v20 = "true";
  else
    v20 = "false";
  if (activateEyeRelief)
    v21 = "true";
  else
    v21 = "false";
  v33 = v21;
  v34 = v20;
  if (unityStream)
    v22 = "true";
  else
    v22 = "false";
  v32 = v22;
  if (continuousFaceDetectMode)
    v23 = "true";
  else
    v23 = "false";
  if (pollingFilter)
    v24 = "true";
  else
    v24 = "false";
  if (retroactiveTimeoutMode)
    v25 = "true";
  else
    v25 = "false";
  if (sampleWhileAbsent)
    v26 = "true";
  else
    v26 = "false";
  getNotificationMaskDescription(self->_notificationMask);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  getEventMaskDescription(self->_eventMask);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  getEventMaskDescription(self->_attentionLostEventMask);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringWithFormat:", CFSTR("<%@: %p> (identifier: %@ samplingInterval: %13.5f samplingDelay: %13.5f sampleWhileAbsent: %s retroactiveTimeoutMode: %s pollingFilter: %s continuousFaceDetectMode: %s unityStream: %s activateEyeRelief: %s activateAttentionDetection: %s activateMotionDetection: %s activatePersonDetection: %s attentionLostTimeouts: %@ nonSampledAttentionLostTimeoutEnabled %s nonSampledAttentionLostTimeout %13.5f notificationMask %@ mask %@ attentionLostEventMask %@ digitizerDisplayUUIDs %@ buttonDisplayUUIDs %@ keyboardDisplayUUIDs %@ tagIndex %llu)"), v40, self, identifier, *(_QWORD *)&v5, *(_QWORD *)&v7, v26, v25, v24, v23, v32, v33, v34, v36, "false", v38, v35,
    *(_QWORD *)&v17,
    v27,
    v28,
    v29,
    self->_digitizerDisplayUUIDs,
    self->_buttonDisplayUUIDs,
    self->_keyboardDisplayUUIDs,
    self->_tagIndex);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)connection
{
  return self->_connection;
}

- (void)invalidateWithHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSXPCConnection *connection;
  uint64_t clientIndex;
  char v8;
  id v9;
  NSObject *v10;
  $F484E3E6FD0A2BE9213BA906CF92CD29 *clientState;
  OS_os_transaction *transaction;
  NSObject *nonSampledAttentionTimer;
  unint64_t v14;
  double v15;
  NSString *identifier;
  int v17;
  id v18;
  uint8_t buf[4];
  double v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalid)
  {
    self->_invalid = 1;
    if (self->_clientIndex == -1)
    {
      clientState = self->_clientState;
      if (clientState)
      {
        free(clientState);
        self->_clientState = 0;
      }
    }
    else
    {
      +[AWPersistentDataManager sharedManager](AWPersistentDataManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      connection = self->_connection;
      clientIndex = self->_clientIndex;
      v18 = 0;
      v8 = objc_msgSend(v5, "closeWithConnection:index:error:", connection, clientIndex, &v18);
      v9 = v18;

      if ((v8 & 1) == 0 && currentLogLevel >= 3)
      {
        _AALog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v14 = absTimeNS();
          if (v14 == -1)
            v15 = INFINITY;
          else
            v15 = (double)v14 / 1000000000.0;
          identifier = self->_identifier;
          v17 = self->_clientIndex;
          *(_DWORD *)buf = 134218754;
          v20 = v15;
          v21 = 2112;
          v22 = identifier;
          v23 = 1024;
          v24 = v17;
          v25 = 2112;
          v26 = v9;
          _os_log_error_impl(&dword_1AF589000, v10, OS_LOG_TYPE_ERROR, "%13.5f: %@ failed to release persistent data index %d: %@", buf, 0x26u);
        }

      }
      self->_clientIndex = -1;
      self->_clientState = 0;

    }
    transaction = self->_transaction;
    if (transaction)
    {
      self->_transaction = 0;

    }
    nonSampledAttentionTimer = self->_nonSampledAttentionTimer;
    if (nonSampledAttentionTimer)
      dispatch_source_cancel(nonSampledAttentionTimer);
    if (v4)
      v4[2](v4);
  }

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__AWRemoteClient_invalidate__block_invoke;
  block[3] = &unk_1E5F8EC18;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)invalidateWithoutQueue
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__AWRemoteClient_invalidateWithoutQueue__block_invoke;
  v2[3] = &unk_1E5F8EC18;
  v2[4] = self;
  -[AWRemoteClient invalidateWithHandler:](self, "invalidateWithHandler:", v2);
}

- (BOOL)_setClientConfig:(id)a3 shouldReset:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v9;
  unint64_t *p_eventMask;
  unint64_t *p_attentionLostEventMask;
  NSSet *v12;
  NSSet *digitizerDisplayUUIDs;
  NSSet *v14;
  NSSet *keyboardDisplayUUIDs;
  NSSet *v16;
  NSSet *buttonDisplayUUIDs;
  double v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString **v26;
  uint64_t *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  BOOL v32;
  OS_dispatch_source *v34;
  OS_dispatch_source *nonSampledAttentionTimer;
  NSObject *v36;
  NSObject *v37;
  char v38;
  char v39;
  double v40;
  unint64_t v41;
  double v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NSArray *v48;
  NSArray *attentionLostTimeoutsSec;
  double v50;
  void *v51;
  NSArray *v52;
  NSArray *v53;
  void (**v54)(_QWORD, _QWORD);
  unint64_t v55;
  unint64_t v56;
  void *v57;
  NSSet *v58;
  NSSet *allowedHIDEventsForRemoteEvent;
  unint64_t v60;
  double v61;
  NSString *identifier;
  unint64_t v63;
  double v64;
  unint64_t v65;
  double v66;
  unint64_t v67;
  double v68;
  NSString *v69;
  unint64_t v70;
  double v71;
  NSString *v72;
  NSString *v73;
  _QWORD v74[5];
  _QWORD v75[5];
  _QWORD handler[5];
  void *v77;
  uint64_t v78;
  const __CFString *v79;
  uint64_t v80;
  const __CFString *v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  const __CFString *v85;
  uint8_t buf[4];
  double v87;
  __int16 v88;
  NSString *v89;
  __int16 v90;
  id v91;
  uint64_t v92;

  v6 = a4;
  v92 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_msgSend(v9, "validateWithError:", a5) & 1) == 0)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v60 = absTimeNS();
        if (v60 == -1)
          v61 = INFINITY;
        else
          v61 = (double)v60 / 1000000000.0;
        identifier = self->_identifier;
        *(_DWORD *)buf = 134218498;
        v87 = v61;
        v88 = 2112;
        v89 = identifier;
        v90 = 2112;
        v91 = v9;
        _os_log_error_impl(&dword_1AF589000, v21, OS_LOG_TYPE_ERROR, "%13.5f: client %@ attempting to set invalid config %@", buf, 0x20u);
      }

    }
    goto LABEL_38;
  }
  if (objc_msgSend(v9, "sampleWhileAbsent")
    && (connectionHasEntitlement(self->_connection, (uint64_t)CFSTR("com.apple.private.attentionawareness.samplewhileabsent")) & 1) == 0)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v63 = absTimeNS();
        if (v63 == -1)
          v64 = INFINITY;
        else
          v64 = (double)v63 / 1000000000.0;
        v69 = self->_identifier;
        *(_DWORD *)buf = 134218242;
        v87 = v64;
        v88 = 2112;
        v89 = v69;
        _os_log_error_impl(&dword_1AF589000, v22, OS_LOG_TYPE_ERROR, "%13.5f: client %@ not entitled to use sampleWhileAbsent", buf, 0x16u);
      }

    }
    if (!a5)
      goto LABEL_38;
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2FE0];
    v84 = *MEMORY[0x1E0CB2D50];
    v85 = CFSTR(" Client not entitled to use sampleWhileAbsent");
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = &v85;
    v27 = &v84;
    goto LABEL_37;
  }
  if (objc_msgSend(v9, "continuousFaceDetectMode")
    && (connectionHasEntitlement(self->_connection, (uint64_t)CFSTR("com.apple.private.attentionawareness.continuousFaceDetect")) & 1) == 0)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v65 = absTimeNS();
        if (v65 == -1)
          v66 = INFINITY;
        else
          v66 = (double)v65 / 1000000000.0;
        v72 = self->_identifier;
        *(_DWORD *)buf = 134218242;
        v87 = v66;
        v88 = 2112;
        v89 = v72;
        _os_log_error_impl(&dword_1AF589000, v28, OS_LOG_TYPE_ERROR, "%13.5f: client %@ not entitled to use continuousFaceDetectMode", buf, 0x16u);
      }

    }
    if (!a5)
      goto LABEL_38;
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2FE0];
    v82 = *MEMORY[0x1E0CB2D50];
    v83 = CFSTR(" Client not entitled to use continuousFaceDetectMode");
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = &v83;
    v27 = &v82;
    goto LABEL_37;
  }
  if (objc_msgSend(v9, "activateMotionDetect")
    && (connectionHasEntitlement(self->_connection, (uint64_t)CFSTR("com.apple.private.attentionawareness.motionDetect")) & 1) == 0)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v67 = absTimeNS();
        if (v67 == -1)
          v68 = INFINITY;
        else
          v68 = (double)v67 / 1000000000.0;
        v73 = self->_identifier;
        *(_DWORD *)buf = 134218242;
        v87 = v68;
        v88 = 2112;
        v89 = v73;
        _os_log_error_impl(&dword_1AF589000, v29, OS_LOG_TYPE_ERROR, "%13.5f: client %@ not entitled to use motionDetect", buf, 0x16u);
      }

    }
    if (!a5)
      goto LABEL_38;
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2FE0];
    v80 = *MEMORY[0x1E0CB2D50];
    v81 = CFSTR(" Client not entitled to use motionDetect");
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = &v81;
    v27 = &v80;
    goto LABEL_37;
  }
  if (objc_msgSend(v9, "activateMotionDetect") && (MGGetBoolAnswer() & 1) == 0)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v70 = absTimeNS();
        if (v70 == -1)
          v71 = INFINITY;
        else
          v71 = (double)v70 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v87 = v71;
        _os_log_error_impl(&dword_1AF589000, v30, OS_LOG_TYPE_ERROR, "%13.5f: Platform doesn't support motion detection capability", buf, 0xCu);
      }

    }
    if (!a5)
      goto LABEL_38;
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2FE0];
    v78 = *MEMORY[0x1E0CB2D50];
    v79 = CFSTR(" Platform doesn't support Motion detect");
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = &v79;
    v27 = &v78;
LABEL_37:
    objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 1, v31);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_38:
    v32 = 0;
    goto LABEL_39;
  }
  objc_storeStrong((id *)&self->_lastConfig, a3);
  self->_tagIndex = objc_msgSend(v9, "tagIndex");
  self->_notificationMask = objc_msgSend(v9, "notificationMask");
  self->_eventMask = objc_msgSend(v9, "eventMask");
  p_eventMask = &self->_eventMask;
  self->_attentionLostEventMask = objc_msgSend(v9, "attentionLostEventMask");
  p_attentionLostEventMask = &self->_attentionLostEventMask;
  self->_retroactiveTimeoutMode = objc_msgSend(v9, "retroactiveTimeoutMode");
  self->_pollingFilter = objc_msgSend(v9, "pollingFilter");
  self->_filteredPollingEventDelivered = 0;
  self->_continuousFaceDetectMode = objc_msgSend(v9, "continuousFaceDetectMode");
  self->_unityStream = objc_msgSend(v9, "unityStream");
  objc_msgSend(v9, "digitizerDisplayUUIDs");
  v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
  digitizerDisplayUUIDs = self->_digitizerDisplayUUIDs;
  self->_digitizerDisplayUUIDs = v12;

  objc_msgSend(v9, "keyboardDisplayUUIDs");
  v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
  keyboardDisplayUUIDs = self->_keyboardDisplayUUIDs;
  self->_keyboardDisplayUUIDs = v14;

  objc_msgSend(v9, "buttonDisplayUUIDs");
  v16 = (NSSet *)objc_claimAutoreleasedReturnValue();
  buttonDisplayUUIDs = self->_buttonDisplayUUIDs;
  self->_buttonDisplayUUIDs = v16;

  objc_msgSend(v9, "nonSampledAttentionLostTimeout");
  self->_nonSampledAttentionLostTimeout = v18;
  v19 = objc_msgSend(v9, "nonSampledAttentionLostTimeoutEnable");
  self->_nonSampledAttentionLostTimeoutEnable = v19;
  v20 = MEMORY[0x1E0C809B0];
  if (v19 && !self->_nonSampledAttentionTimer)
  {
    v34 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    nonSampledAttentionTimer = self->_nonSampledAttentionTimer;
    self->_nonSampledAttentionTimer = v34;

    v36 = self->_nonSampledAttentionTimer;
    handler[0] = v20;
    handler[1] = 3221225472;
    handler[2] = __53__AWRemoteClient__setClientConfig_shouldReset_error___block_invoke;
    handler[3] = &unk_1E5F8EC18;
    handler[4] = self;
    dispatch_source_set_event_handler(v36, handler);
    v37 = self->_nonSampledAttentionTimer;
    v75[0] = v20;
    v75[1] = 3221225472;
    v75[2] = __53__AWRemoteClient__setClientConfig_shouldReset_error___block_invoke_30;
    v75[3] = &unk_1E5F8EC18;
    v75[4] = self;
    dispatch_source_set_cancel_handler(v37, v75);
    goto LABEL_41;
  }
  if (self->_nonSampledAttentionTimerResumed)
  {
    dispatch_suspend((dispatch_object_t)self->_nonSampledAttentionTimer);
LABEL_41:
    self->_nonSampledAttentionTimerResumed = 0;
  }
  v38 = objc_msgSend(v9, "activateMotionDetect");
  self->_activateMotionDetect = v38;
  if (self->_continuousFaceDetectMode)
  {
    self->_activateAttentionDetection = objc_msgSend(v9, "activateAttentionDetection");
  }
  else
  {
    if ((self->_eventMask & 0x80) != 0)
      v39 = v38;
    else
      v39 = 1;
    self->_activateAttentionDetection = (v39 & 1) == 0;
  }
  self->_activateEyeRelief = objc_msgSend(v9, "activateEyeRelief");
  objc_msgSend(v9, "samplingInterval");
  v41 = (unint64_t)(v40 * 1000000000.0);
  if (v40 > 1.84467441e19)
    v41 = -1;
  self->_samplingInterval = v41;
  objc_msgSend(v9, "samplingDelay");
  v43 = (unint64_t)(v42 * 1000000000.0);
  if (v42 > 1.84467441e19)
    v43 = -1;
  self->_samplingDelay = v43;
  self->_sampleWhileAbsent = objc_msgSend(v9, "sampleWhileAbsent");
  objc_msgSend(v9, "attentionLostTimeouts");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "count");

  if (v45)
  {
    objc_msgSend(v9, "attentionLostTimeouts");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "allObjects");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "sortedArrayUsingSelector:", sel_compare_);
    v48 = (NSArray *)objc_claimAutoreleasedReturnValue();
    attentionLostTimeoutsSec = self->_attentionLostTimeoutsSec;
    self->_attentionLostTimeoutsSec = v48;

  }
  else
  {
    objc_msgSend(v9, "samplingInterval");
    if (v50 == 0.0)
    {
      v46 = self->_attentionLostTimeoutsSec;
      self->_attentionLostTimeoutsSec = 0;
    }
    else
    {
      v51 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v9, "samplingInterval");
      objc_msgSend(v51, "numberWithDouble:");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
      v52 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v53 = self->_attentionLostTimeoutsSec;
      self->_attentionLostTimeoutsSec = v52;

    }
  }

  v74[0] = v20;
  v74[1] = 3221225472;
  v74[2] = __53__AWRemoteClient__setClientConfig_shouldReset_error___block_invoke_2;
  v74[3] = &unk_1E5F8DFE0;
  v74[4] = self;
  v54 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5DF9110](v74);
  ((void (**)(_QWORD, unint64_t *))v54)[2](v54, &self->_eventMask);
  ((void (**)(_QWORD, unint64_t *))v54)[2](v54, &self->_attentionLostEventMask);
  if (self->_activateMotionDetect && (deviceSupportsPearl() & 1) == 0)
    self->_activateMotionDetect = 0;
  v55 = *p_eventMask;
  if ((*p_eventMask & 1) == 0)
  {
    v55 |= 1uLL;
    *p_eventMask = v55;
  }
  v56 = *p_attentionLostEventMask;
  if ((*p_attentionLostEventMask & 1) == 0)
  {
    v56 |= 1uLL;
    *p_attentionLostEventMask = v56;
  }
  if (((v56 | v55) & 0x80) == 0)
  {
    self->_sampleWhileAbsent = 0;
    self->_samplingInterval = 0;
    self->_samplingDelay = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v57, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v57);
    v58 = (NSSet *)objc_claimAutoreleasedReturnValue();
    allowedHIDEventsForRemoteEvent = self->_allowedHIDEventsForRemoteEvent;
    self->_allowedHIDEventsForRemoteEvent = v58;
  }
  else
  {
    allowedHIDEventsForRemoteEvent = self->_allowedHIDEventsForRemoteEvent;
    self->_allowedHIDEventsForRemoteEvent = 0;
  }

  if (v6)
    -[AWRemoteClient _resetAttentionLostTimer](self, "_resetAttentionLostTimer");

  v32 = 1;
LABEL_39:

  return v32;
}

- (void)reevaluateConfig
{
  void *v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  int v7;
  double v8;
  __int16 v9;
  AWRemoteClient *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[AWRemoteClient description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWRemoteClient _setClientConfig:shouldReset:error:](self, "_setClientConfig:shouldReset:error:", self->_lastConfig, 1, 0);
  if (currentLogLevel >= 6)
  {
    _AALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = absTimeNS();
      if (v5 == -1)
        v6 = INFINITY;
      else
        v6 = (double)v5 / 1000000000.0;
      v7 = 134218498;
      v8 = v6;
      v9 = 2112;
      v10 = self;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1AF589000, v4, OS_LOG_TYPE_DEFAULT, "%13.5f: reevaluated config %@, old config %@", (uint8_t *)&v7, 0x20u);
    }

  }
  -[AWScheduler armEvents](self->_scheduler, "armEvents");

}

- (void)setClientConfig:(id)a3 shouldReset:(BOOL)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *queue;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__560;
  v20 = __Block_byref_object_dispose__561;
  v21 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__AWRemoteClient_setClientConfig_shouldReset_reply___block_invoke;
  v12[3] = &unk_1E5F8E008;
  v12[4] = self;
  v11 = v8;
  v15 = a4;
  v13 = v11;
  v14 = &v16;
  dispatch_sync(queue, v12);
  v9[2](v9, v17[5]);

  _Block_object_dispose(&v16, 8);
}

- (void)deliverNotification:(unint64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  double v7;
  NSString *identifier;
  void *v9;
  int v10;
  double v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((self->_notificationMask & a3) != 0)
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = absTimeNS();
        if (v6 == -1)
          v7 = INFINITY;
        else
          v7 = (double)v6 / 1000000000.0;
        identifier = self->_identifier;
        getNotificationMaskDescription(a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 134218498;
        v11 = v7;
        v12 = 2112;
        v13 = identifier;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: notify client %@ of %@", (uint8_t *)&v10, 0x20u);

      }
    }
    -[AWFrameworkClient notify:](self->_proxy, "notify:", a3);
  }
}

- (void)deliverPollEventType:(unint64_t)a3 event:(id)a4
{
  id v6;
  NSObject *v7;
  unint64_t v8;
  double v9;
  NSString *identifier;
  char *v11;
  id v12;
  uint8_t buf[4];
  double v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (currentLogLevel >= 6)
  {
    _AALog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = absTimeNS();
      if (v8 == -1)
        v9 = INFINITY;
      else
        v9 = (double)v8 / 1000000000.0;
      identifier = self->_identifier;
      if (a3 - 1 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown AWAttentionPollEventType %llu"), a3);
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = (char *)objc_msgSend(v12, "UTF8String");

      }
      else
      {
        v11 = off_1E5F8E028[a3 - 1];
      }
      *(_DWORD *)buf = 134218754;
      v14 = v9;
      v15 = 2112;
      v16 = identifier;
      v17 = 2080;
      v18 = v11;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1AF589000, v7, OS_LOG_TYPE_DEFAULT, "%13.5f: notify polling client %@ of %s %@", buf, 0x2Au);
    }

  }
  -[AWFrameworkClient notifyPollEventType:event:](self->_proxy, "notifyPollEventType:event:", a3, v6);

}

- (BOOL)canDeliverPollingEvent
{
  if (self->_pollingFilter && -[AWScheduler isDeviceStationary](self->_scheduler, "isDeviceStationary"))
    return !-[AWScheduler isDeviceOnLockScreen](self->_scheduler, "isDeviceOnLockScreen");
  else
    return 1;
}

- (void)getLastEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AWRemoteClient_getLastEvent___block_invoke;
  block[3] = &unk_1E5F8EB38;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)_resetAttentionLostTimer
{
  unint64_t v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  NSString *identifier;
  double v8;
  int v9;
  double v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = absTimeNS();
  -[AWRemoteClient updateEventTimesForMask:timestamp:](self, "updateEventTimesForMask:timestamp:", 0, v3);
  if (currentLogLevel >= 6)
  {
    _AALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = absTimeNS();
      if (v5 == -1)
        v6 = INFINITY;
      else
        v6 = (double)v5 / 1000000000.0;
      identifier = self->_identifier;
      if (v3 == -1)
        v8 = INFINITY;
      else
        v8 = (double)v3 / 1000000000.0;
      v9 = 134218498;
      v10 = v6;
      v11 = 2112;
      v12 = identifier;
      v13 = 2048;
      v14 = v8;
      _os_log_impl(&dword_1AF589000, v4, OS_LOG_TYPE_DEFAULT, "%13.5f: reset attention lost timeout for %@ at %13.5f", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (void)resetAttentionLostTimerWithReply:(id)a3
{
  NSObject *queue;
  void (**v4)(id, _QWORD);
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AWRemoteClient_resetAttentionLostTimerWithReply___block_invoke;
  block[3] = &unk_1E5F8EC18;
  block[4] = self;
  v4 = (void (**)(id, _QWORD))a3;
  dispatch_sync(queue, block);
  v4[2](v4, 0);

}

- (void)pollWithTimeout:(unint64_t)a3 reply:(id)a4
{
  NSXPCConnection *connection;
  void (**v7)(id, _QWORD);
  NSObject *queue;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD block[6];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  v7 = (void (**)(id, _QWORD))a4;
  if (connectionHasEntitlement(connection, (uint64_t)CFSTR("com.apple.private.attentionawareness.poll")))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__AWRemoteClient_pollWithTimeout_reply___block_invoke;
    block[3] = &unk_1E5F8EB10;
    block[4] = self;
    block[5] = a3;
    dispatch_sync(queue, block);
    v7[2](v7, 0);

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2FE0];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = CFSTR(" Client not entitled to use pollWithTimeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v7)[2](v7, v12);

  }
}

- (BOOL)shouldInitBeSent
{
  void *v2;
  NSObject *v3;
  unint64_t v4;
  double v5;
  BOOL v6;
  int v8;
  double v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AWScheduler attentionSampler](self->_scheduler, "attentionSampler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (currentLogLevel >= 6)
  {
    _AALog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = absTimeNS();
      if (v4 == -1)
        v5 = INFINITY;
      else
        v5 = (double)v4 / 1000000000.0;
      v8 = 134218240;
      v9 = v5;
      v10 = 2048;
      v11 = objc_msgSend(v2, "samplingSuppressedMask");
      _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: Sampling suppression mask: %01llX", (uint8_t *)&v8, 0x16u);
    }

  }
  v6 = (objc_msgSend(v2, "samplingSuppressedMask") & 4) != 0
    || (objc_msgSend(v2, "samplingSuppressedMask") & 2) != 0
    || (objc_msgSend(v2, "samplingSuppressedMask") & 1) == 0;

  return v6;
}

- (BOOL)canOperationBeEndedForClient
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return !self->_clientState->var7 || self->_filteredPollingEventDelivered;
}

- (void)pingWithReply:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AWRemoteClient_pingWithReply___block_invoke;
  block[3] = &unk_1E5F8EB38;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)notifyClientOfStreamingEvent:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  double v9;
  unint64_t v10;
  double v11;
  NSObject *v12;
  unint64_t v13;
  double v14;
  id v15;
  unint64_t v16;
  double v17;
  NSString *identifier;
  const char *v19;
  NSString *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  NSString *v24;
  NSString *v25;
  _BYTE v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    switch(objc_msgSend(v4, "metadataType"))
    {
      case 0:
        if (currentLogLevel < 3)
          goto LABEL_27;
        _AALog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          goto LABEL_42;
        v6 = absTimeNS();
        if (v6 == -1)
          v7 = INFINITY;
        else
          v7 = (double)v6 / 1000000000.0;
        identifier = self->_identifier;
        *(_DWORD *)v26 = 134218242;
        *(double *)&v26[4] = v7;
        *(_WORD *)&v26[12] = 2112;
        *(_QWORD *)&v26[14] = identifier;
        v19 = "%13.5f: Unknown metadata type received, not passing it to client %@";
        goto LABEL_41;
      case 1:
        if (self->_activateAttentionDetection)
          break;
        if (currentLogLevel < 3)
          goto LABEL_27;
        _AALog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          goto LABEL_42;
        v8 = absTimeNS();
        if (v8 == -1)
          v9 = INFINITY;
        else
          v9 = (double)v8 / 1000000000.0;
        v24 = self->_identifier;
        *(_DWORD *)v26 = 134218242;
        *(double *)&v26[4] = v9;
        *(_WORD *)&v26[12] = 2112;
        *(_QWORD *)&v26[14] = v24;
        v19 = "%13.5f: AD metadata received, not passing it to client %@";
        goto LABEL_41;
      case 2:
        if (self->_activateEyeRelief)
          break;
        if (currentLogLevel < 3)
          goto LABEL_27;
        _AALog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          goto LABEL_42;
        v10 = absTimeNS();
        if (v10 == -1)
          v11 = INFINITY;
        else
          v11 = (double)v10 / 1000000000.0;
        v25 = self->_identifier;
        *(_DWORD *)v26 = 134218242;
        *(double *)&v26[4] = v11;
        *(_WORD *)&v26[12] = 2112;
        *(_QWORD *)&v26[14] = v25;
        v19 = "%13.5f: ER metadata received, not passing it to client %@";
LABEL_41:
        _os_log_error_impl(&dword_1AF589000, v5, OS_LOG_TYPE_ERROR, v19, v26, 0x16u);
LABEL_42:

        goto LABEL_27;
      case 3:
        if (currentLogLevel < 3)
          break;
        _AALog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          goto LABEL_23;
        v13 = absTimeNS();
        if (v13 == -1)
          v14 = INFINITY;
        else
          v14 = (double)v13 / 1000000000.0;
        v20 = self->_identifier;
        *(_DWORD *)v26 = 134218242;
        *(double *)&v26[4] = v14;
        *(_WORD *)&v26[12] = 2112;
        *(_QWORD *)&v26[14] = v20;
        v21 = "%13.5f: Invalid metadata type received, not passing it to client %@";
        v22 = v12;
        v23 = 22;
        goto LABEL_36;
      case 5:
        if (currentLogLevel < 3)
          break;
        _AALog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          goto LABEL_23;
        v16 = absTimeNS();
        if (v16 == -1)
          v17 = INFINITY;
        else
          v17 = (double)v16 / 1000000000.0;
        *(_DWORD *)v26 = 134217984;
        *(double *)&v26[4] = v17;
        v21 = "%13.5f: Combined metadata received, passing it up to client since we can't separate it";
        v22 = v12;
        v23 = 12;
LABEL_36:
        _os_log_error_impl(&dword_1AF589000, v22, OS_LOG_TYPE_ERROR, v21, v26, v23);
LABEL_23:

        break;
      default:
        break;
    }
  }
  if (self->_unityStream)
    v15 = -[AWScheduler cancelFaceDetectStream:withIdentifier:](self->_scheduler, "cancelFaceDetectStream:withIdentifier:", self, self->_clientId);
  -[AWFrameworkClient notifyStreamingEvent:](self->_proxy, "notifyStreamingEvent:", v4, *(_OWORD *)v26, *(_QWORD *)&v26[16], v27);
LABEL_27:

}

- (void)streamFaceDetectEventsWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *queue;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  double v13;
  NSString *identifier;
  _QWORD block[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  double v26;
  __int16 v27;
  NSString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__560;
  v21 = __Block_byref_object_dispose__561;
  v22 = 0;
  if (self->_activateAttentionDetection || self->_activateEyeRelief)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__AWRemoteClient_streamFaceDetectEventsWithReply___block_invoke_2;
    block[3] = &unk_1E5F8EAC0;
    block[4] = self;
    block[5] = &v17;
    dispatch_sync(queue, block);
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v12 = absTimeNS();
        if (v12 == -1)
          v13 = INFINITY;
        else
          v13 = (double)v12 / 1000000000.0;
        identifier = self->_identifier;
        *(_DWORD *)buf = 134218242;
        v26 = v13;
        v27 = 2112;
        v28 = identifier;
        _os_log_error_impl(&dword_1AF589000, v6, OS_LOG_TYPE_ERROR, "%13.5f: Client does not want any metadata, not starting a stream for client %@", buf, 0x16u);
      }

    }
    v7 = self->_queue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__AWRemoteClient_streamFaceDetectEventsWithReply___block_invoke;
    v16[3] = &unk_1E5F8EC18;
    v16[4] = self;
    dispatch_sync(v7, v16);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR(" No metadata selected");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v18[5];
    v18[5] = v10;

  }
  if (v4)
    v4[2](v4, v18[5]);
  _Block_object_dispose(&v17, 8);

}

- (void)cancelFaceDetectStreamWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *queue;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__560;
  v15 = __Block_byref_object_dispose__561;
  v16 = 0;
  if (self->_continuousFaceDetectMode)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__AWRemoteClient_cancelFaceDetectStreamWithReply___block_invoke;
    block[3] = &unk_1E5F8EAC0;
    block[4] = self;
    block[5] = &v11;
    dispatch_sync(queue, block);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR(" Client is not running in streaming mode");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 13, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v12[5];
    v12[5] = v8;

  }
  if (v4)
    v4[2](v4, v12[5]);
  _Block_object_dispose(&v11, 8);

}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (unint64_t)samplingInterval
{
  return self->_samplingInterval;
}

- (unint64_t)samplingDelay
{
  return self->_samplingDelay;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (int)clientIndex
{
  return self->_clientIndex;
}

- (NSUUID)clientId
{
  return self->_clientId;
}

- (unint64_t)streamingStartTime
{
  return self->_streamingStartTime;
}

- (void)setStreamingStartTime:(unint64_t)a3
{
  self->_streamingStartTime = a3;
}

- (double)streamingDuration
{
  return self->_streamingDuration;
}

- (void)setStreamingDuration:(double)a3
{
  self->_streamingDuration = a3;
}

- (BOOL)activateEyeRelief
{
  return self->_activateEyeRelief;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lastConfig, 0);
  objc_storeStrong((id *)&self->_lastEvent, 0);
  objc_storeStrong((id *)&self->_allowedHIDEventsForRemoteEvent, 0);
  objc_storeStrong((id *)&self->_nonSampledAttentionTimer, 0);
  objc_storeStrong((id *)&self->_attentionLostTimeoutsSec, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_buttonDisplayUUIDs, 0);
  objc_storeStrong((id *)&self->_keyboardDisplayUUIDs, 0);
  objc_storeStrong((id *)&self->_digitizerDisplayUUIDs, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __50__AWRemoteClient_cancelFaceDetectStreamWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cancelFaceDetectStream:withIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __50__AWRemoteClient_streamFaceDetectEventsWithReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeStreamingClientwithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
}

void __50__AWRemoteClient_streamFaceDetectEventsWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "streamFaceDetectEvents");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __32__AWRemoteClient_pingWithReply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  double v4;
  void *v5;
  int v7;
  double v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (currentLogLevel >= 7)
  {
    _AALog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = absTimeNS();
      if (v3 == -1)
        v4 = INFINITY;
      else
        v4 = (double)v3 / 1000000000.0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 134218242;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ is alive", (uint8_t *)&v7, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __40__AWRemoteClient_pollWithTimeout_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  double v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v18;
  double v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 40))
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = absTimeNS();
        if (v3 == -1)
          v4 = INFINITY;
        else
          v4 = (double)v3 / 1000000000.0;
        v8 = *(_QWORD *)(a1 + 40);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
        if (v8 == -1)
          v10 = INFINITY;
        else
          v10 = (double)v8 / 1000000000.0;
        v18 = 134218498;
        v19 = v4;
        v20 = 2112;
        v21 = v9;
        v22 = 2048;
        v23 = v10;
        _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: polling for client %@ with timeout %13.5f", (uint8_t *)&v18, 0x20u);
      }

    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) + 48) = absTimeNS();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    v13 = *(_QWORD *)(v12 + 48);
    v14 = v13 + v11;
    if ((unint64_t)(v13 + v11) >= 0xFFFFFFFFFFFFFFFELL)
      v14 = -2;
    if (__CFADD__(v13, v11))
      v15 = -2;
    else
      v15 = v14;
    *(_QWORD *)(v12 + 56) = v15;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) + 64) = 0;
  }
  else
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = absTimeNS();
        if (v6 == -1)
          v7 = INFINITY;
        else
          v7 = (double)v6 / 1000000000.0;
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
        v18 = 134218242;
        v19 = v7;
        v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: cancelling polling for client %@ with", (uint8_t *)&v18, 0x16u);
      }

    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) + 56) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) + 48) = 0;
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "armEvents");
}

uint64_t __51__AWRemoteClient_resetAttentionLostTimerWithReply___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_resetAttentionLostTimer");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "armEvents");
}

uint64_t __31__AWRemoteClient_getLastEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  AWFaceDetectAttentionEvent *v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 176))
  {
    v3 = *(_QWORD *)(v2 + 168);
    v4 = *(_QWORD *)(v3 + 24);
    v5 = *(_QWORD *)(v3 + 40);
    if (v4 | v5)
    {
      v6 = *(_QWORD *)(v3 + 32);
      switch(v5)
      {
        case 128:
          v7 = -[AWFaceDetectAttentionEvent initWithTimestamp:tagIndex:faceMetadata:]([AWFaceDetectAttentionEvent alloc], "initWithTimestamp:tagIndex:faceMetadata:", v6, 0, (double)v4);
          goto LABEL_12;
        case 32:
          v7 = -[AWRemoteAttentionEvent initWithTimestamp:tagIndex:remoteMetadata:]([AWRemoteAttentionEvent alloc], "initWithTimestamp:tagIndex:remoteMetadata:", v6, 0, (double)v4);
          goto LABEL_12;
        case 1:
          v7 = -[AWAttentionLostEvent initWithTimestamp:tagIndex:attentionLostTimeout:]([AWAttentionLostEvent alloc], "initWithTimestamp:tagIndex:attentionLostTimeout:", v6, (double)v4, *(double *)v3);
LABEL_12:
          v8 = *(_QWORD *)(a1 + 32);
          v9 = *(void **)(v8 + 176);
          *(_QWORD *)(v8 + 176) = v7;

          return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      if ((v5 & 0xFFF) != 0)
      {
        v7 = -[AWAttentionEvent initWithTimestamp:tagIndex:eventMask:]([AWAttentionEvent alloc], "initWithTimestamp:tagIndex:eventMask:", v6, v5, (double)v4);
        goto LABEL_12;
      }
    }
    v7 = 0;
    goto LABEL_12;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __52__AWRemoteClient_setClientConfig_shouldReset_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  double v8;
  uint64_t v9;
  id obj;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 56);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_setClientConfig:shouldReset:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (currentLogLevel >= 6)
  {
    _AALog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = absTimeNS();
      if (v7 == -1)
        v8 = INFINITY;
      else
        v8 = (double)v7 / 1000000000.0;
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1AF589000, v6, OS_LOG_TYPE_DEFAULT, "%13.5f: updated config %@", buf, 0x16u);
    }

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "armEvents");
}

void __53__AWRemoteClient__setClientConfig_shouldReset_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  AWAttentionLostEvent *v9;
  unint64_t v10;
  double v11;
  AWAttentionLostEvent *v12;
  int v13;
  double v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (currentLogLevel >= 6)
  {
    _AALog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = absTimeNS();
      if (v3 == -1)
        v4 = INFINITY;
      else
        v4 = (double)v3 / 1000000000.0;
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 200);
      v7 = *(_QWORD *)(v5 + 120);
      v13 = 134218498;
      v14 = v4;
      v15 = 2112;
      v16 = v6;
      v17 = 2048;
      v18 = v7;
      _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: Delivering nonSampledAttentionLost Event for client %@. Timeout value: %13.5f", (uint8_t *)&v13, 0x20u);
    }

  }
  v8 = *(void **)(a1 + 32);
  v9 = [AWAttentionLostEvent alloc];
  v10 = absTimeNS();
  if (v10 == -1)
    v11 = INFINITY;
  else
    v11 = (double)v10 / 1000000000.0;
  v12 = -[AWAttentionLostEvent initWithTimestamp:tagIndex:attentionLostTimeout:](v9, "initWithTimestamp:tagIndex:attentionLostTimeout:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v11, *(double *)(*(_QWORD *)(a1 + 32) + 120));
  objc_msgSend(v8, "deliverEvent:", v12);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) + 67) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) + 65) = 0;
}

void __53__AWRemoteClient__setClientConfig_shouldReset_error___block_invoke_30(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 136);
  *(_QWORD *)(v1 + 136) = 0;

}

void __53__AWRemoteClient__setClientConfig_shouldReset_error___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  char v5;
  char v6;
  void *v7;

  if (!a2)
    __assert_rtn("-[AWRemoteClient _setClientConfig:shouldReset:error:]_block_invoke_2", "RemoteClient.m", 386, "eventMask");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "attentionSampler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if ((*(_BYTE *)a2 & 0x80) != 0)
  {
    v7 = (void *)v3;
    v5 = deviceSupportsPearl();
    v4 = v7;
    if ((v5 & 1) == 0)
    {
      v6 = objc_msgSend(v7, "unitTestSampling");
      v4 = v7;
      if ((v6 & 1) == 0)
        *a2 &= ~0x80uLL;
    }
  }

}

uint64_t __40__AWRemoteClient_invalidateWithoutQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeInvalidClients");
}

uint64_t __28__AWRemoteClient_invalidate__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__AWRemoteClient_invalidate__block_invoke_2;
  v3[3] = &unk_1E5F8EC18;
  v3[4] = v1;
  return objc_msgSend(v1, "invalidateWithHandler:", v3);
}

uint64_t __28__AWRemoteClient_invalidate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeInvalidClients");
}

@end
