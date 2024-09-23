@implementation XRMobileAgentItinerary

+ (id)inlineStop
{
  return (id)qword_25583C928;
}

- (void)_visitNextStop:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int nextMovementType;
  XRMobileAgentStop *v11;
  NSString *v12;
  XRMobileAgentStop *nextStop;
  XRMobileAgentStop *nextStopTicket;
  XRMobileAgentStop *currentStop;
  XRMobileAgentStop *finalDestination;
  id finalDestinationTicket;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSString *nextMode;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  void *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = (uint64_t)v4;
  self->_updated = 0;
  nextMovementType = self->_nextMovementType;
  if ((nextMovementType - 1) >= 2)
  {
    if (!nextMovementType)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_2263701E4((void *)v9, v40, v41, v42, v43);
      nextMode = self->_nextMode;
      self->_nextMode = (NSString *)CFSTR("Failed");

      self->_nextMovementType = 3;
      goto LABEL_15;
    }
    if (nextMovementType != 3)
      goto LABEL_15;
    objc_msgSend_setMode_(v4, v5, (uint64_t)self->_nextMode, v7, v8);
    v11 = self->_finalDestination;
    objc_storeStrong((id *)(v9 + 8), self->_finalDestinationTicket);
    *(_QWORD *)(v9 + 16) = 3;
    v12 = self->_nextMode;
    self->_nextMode = 0;

    nextStop = self->_nextStop;
    self->_nextStop = 0;

    nextStopTicket = self->_nextStopTicket;
    self->_nextStopTicket = 0;

    currentStop = self->_currentStop;
    self->_currentStop = 0;

    finalDestination = self->_finalDestination;
    self->_finalDestination = 0;

    finalDestinationTicket = self->_finalDestinationTicket;
    self->_finalDestinationTicket = 0;

    if (!v11)
    {
LABEL_15:
      if (*(_DWORD *)(v9 + 16) != 3)
        sub_2263700E4();
      objc_msgSend_goodbye((void *)v9, v5, v6, v7, v8);
      goto LABEL_21;
    }
    goto LABEL_8;
  }
  if (self->_nextStop)
  {
    objc_msgSend_setMode_(v4, v5, (uint64_t)self->_nextMode, v7, v8);
    v11 = self->_nextStop;
    objc_storeStrong((id *)(v9 + 8), self->_nextStopTicket);
    *(_DWORD *)(v9 + 20) = self->_nextQoS;
    *(_DWORD *)(v9 + 16) = self->_nextMovementType;
    objc_storeStrong((id *)&self->_currentStop, self->_nextStop);
    self->_nextMovementType = 0;
    if (!v11)
      goto LABEL_15;
LABEL_8:
    v18 = (id)qword_25583C538;
    v19 = os_signpost_id_make_with_pointer((os_log_t)qword_25583C538, (const void *)v9);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      if (os_signpost_enabled(v18))
      {
        objc_msgSend_agentDiagnosticsName((void *)v9, v21, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend_agentStopDiagnosticsTypeCode(v11, v26, v27, v28, v29);
        objc_msgSend_mode((void *)v9, v31, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = *(_DWORD *)(v9 + 16);
        v52 = 138413058;
        v53 = v25;
        v54 = 1024;
        v55 = v30;
        v56 = 2112;
        v57 = v35;
        v58 = 1024;
        v59 = v36;
        _os_signpost_emit_with_name_impl(&dword_22634C000, v18, OS_SIGNPOST_EVENT, v20, "Mobile Agent Moved", "Agent %@ received by %d for mode %@ movement type %d", (uint8_t *)&v52, 0x22u);

      }
    }

    objc_msgSend_receiveMobileAgent_(v11, v37, v9, v38, v39);
    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    sub_226370134((void *)v9, (uint64_t)self, v46, v47, v48);
  objc_msgSend_finishedWithMode_(self, v45, (uint64_t)CFSTR("Failed"), v47, v48);
  if (self->_nextMovementType != 3)
    sub_22637010C();
  objc_msgSend__visitNextStop_(self, v49, v9, v50, v51);
LABEL_21:

}

- (void)finishedWithMode:(id)a3
{
  NSString *v4;
  XRMobileAgentStop *nextStop;
  XRMobileAgentStop *nextStopTicket;
  NSString *nextMode;

  v4 = (NSString *)a3;
  nextStop = self->_nextStop;
  self->_nextStop = 0;

  nextStopTicket = self->_nextStopTicket;
  self->_nextStopTicket = 0;

  nextMode = self->_nextMode;
  self->_nextMode = v4;

  self->_nextMovementType = 3;
  self->_updated = 1;
}

- (void)revisit
{
  self->_nextMovementType = 2;
  self->_updated = 1;
}

- (void)setNextStop:(id)a3 mode:(id)a4 ticket:(id)a5 desiredQoS:(unsigned int)a6
{
  XRMobileAgentStop *v10;
  NSString *v11;
  XRMobileAgentStop *v12;
  XRMobileAgentStop *nextStop;
  XRMobileAgentStop *v14;
  XRMobileAgentStop *nextStopTicket;
  XRMobileAgentStop *v16;
  NSString *nextMode;
  unsigned int nextMovementType;

  v10 = (XRMobileAgentStop *)a3;
  v11 = (NSString *)a4;
  v12 = (XRMobileAgentStop *)a5;
  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    sub_226370278((uint64_t)self);
  nextStop = self->_nextStop;
  self->_nextStop = v10;
  v14 = v10;

  nextStopTicket = self->_nextStopTicket;
  self->_nextStopTicket = v12;
  v16 = v12;

  nextMode = self->_nextMode;
  self->_nextMode = v11;

  self->_nextQoS = a6;
  nextMovementType = self->_nextMovementType;
  if (nextMovementType <= 3 && nextMovementType != 1)
    self->_nextMovementType = 1;
  self->_updated = 1;
}

- (void)setNextStop:(id)a3 mode:(id)a4 ticket:(id)a5
{
  objc_msgSend_setNextStop_mode_ticket_desiredQoS_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 25);
}

- (void)setNextStop:(id)a3 mode:(id)a4
{
  objc_msgSend_setNextStop_mode_ticket_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (int)_nextMovementType
{
  return self->_nextMovementType;
}

- (XRMobileAgentStop)currentStop
{
  return self->_currentStop;
}

- (BOOL)updated
{
  return self->_updated;
}

- (XRMobileAgentStop)finalDestination
{
  return self->_finalDestination;
}

- (void)setFinalDestination:(id)a3
{
  objc_storeStrong((id *)&self->_finalDestination, a3);
}

- (id)finalDestinationTicket
{
  return self->_finalDestinationTicket;
}

- (void)setFinalDestinationTicket:(id)a3
{
  objc_storeStrong(&self->_finalDestinationTicket, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finalDestinationTicket, 0);
  objc_storeStrong((id *)&self->_nextMode, 0);
  objc_storeStrong((id *)&self->_nextStopTicket, 0);
  objc_storeStrong((id *)&self->_finalDestination, 0);
  objc_storeStrong((id *)&self->_currentStop, 0);
  objc_storeStrong((id *)&self->_nextStop, 0);
}

@end
