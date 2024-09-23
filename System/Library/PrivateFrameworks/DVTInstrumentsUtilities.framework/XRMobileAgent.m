@implementation XRMobileAgent

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  os_log_t v15;
  void *v16;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)qword_25583C928;
    qword_25583C928 = v2;

    v4 = objc_opt_new();
    v5 = (void *)qword_25583C930;
    qword_25583C930 = v4;

    objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_BOOLForKey_(v10, v11, (uint64_t)CFSTR("XREnableInternalSignposts"), v12, v13);

    if (v14)
    {
      v15 = os_log_create("com.apple.dt.utilities", "Mobile Agent");
      v16 = (void *)qword_25583C538;
      qword_25583C538 = (uint64_t)v15;

    }
  }
}

- (void)activateAtStop:(id)a3 activationTicket:(id)a4 activationQoS:(unsigned int)a5 finalDestination:(id)a6 finalTicket:(id)a7
{
  uint64_t v9;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  XRMobileAgentItinerary *v20;
  XRMobileAgentItinerary *itinerary;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  id v35;

  v9 = *(_QWORD *)&a5;
  v35 = a3;
  v13 = a4;
  v14 = a6;
  v19 = a7;
  if (!v35)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v15, v16, v17, v18);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v33, v34, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("XRMobileAgent.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activationStop != nil"));

  }
  if (self->_itinerary)
    sub_22636FFE8();
  v20 = (XRMobileAgentItinerary *)objc_opt_new();
  itinerary = self->_itinerary;
  self->_itinerary = v20;

  objc_msgSend_setFinalDestination_(self->_itinerary, v22, (uint64_t)v14, v23, v24);
  objc_msgSend_setFinalDestinationTicket_(self->_itinerary, v25, (uint64_t)v19, v26, v27);
  objc_msgSend_setNextStop_mode_ticket_desiredQoS_(self->_itinerary, v28, (uint64_t)v35, (uint64_t)CFSTR("Activating"), (uint64_t)v13, v9);
  objc_msgSend_goodbye(self, v29, v30, v31, v32);

}

- (void)activateAtStop:(id)a3 activationTicket:(id)a4 finalDestination:(id)a5 finalTicket:(id)a6
{
  MEMORY[0x24BEDD108](self, sel_activateAtStop_activationTicket_activationQoS_finalDestination_finalTicket_, a3, a4, 25);
}

- (void)activateWithFinalDestination:(id)a3 ticket:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_activateAtStop_activationTicket_activationQoS_finalDestination_finalTicket_, qword_25583C928, 0, 25);
}

- (void)__park
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  NSString *mode;
  id ticket;
  XRMobileAgentItinerary *itinerary;
  int v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (id)qword_25583C538;
  v4 = os_signpost_id_make_with_pointer((os_log_t)qword_25583C538, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      mode = self->_mode;
      v9 = 138412290;
      v10 = mode;
      _os_signpost_emit_with_name_impl(&dword_22634C000, v3, OS_SIGNPOST_EVENT, v5, "Mobile Agent Parked", "Parked in mode %@", (uint8_t *)&v9, 0xCu);
    }
  }

  ticket = self->_ticket;
  self->_ticket = 0;

  itinerary = self->_itinerary;
  self->_itinerary = 0;

  self->_movementType = 0;
}

- (void)executeStopOnItinerary:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  id v13;

  v13 = a3;
  objc_msgSend_mode(self, v4, v5, v6, v7);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  if (v8 != CFSTR("Activating") && (v8 == CFSTR("Failed") || v8 == CFSTR("Finished")))
    objc_msgSend_finishedWithMode_(v13, v9, (uint64_t)v8, v10, v11);

}

- (BOOL)holdsItinerary:(id)a3
{
  return self->_itinerary == a3;
}

- (NSString)agentDiagnosticsName
{
  return (NSString *)CFSTR("Mobile Agent");
}

- (unsigned)desiredQoS
{
  return self->_desiredQoS;
}

- (OS_os_log)loggingHandle
{
  return (OS_os_log *)(id)qword_25583C538;
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_storeStrong((id *)&self->_mode, a3);
}

- (int)movementType
{
  return self->_movementType;
}

- (XRMobileAgentItinerary)itinerary
{
  return self->_itinerary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_itinerary, 0);
  objc_storeStrong(&self->_ticket, 0);
}

- (id)ticket
{
  return self->_ticket;
}

- (void)hello
{
  void *v3;
  int movementType;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSString *mode;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  __int16 v35;
  NSString *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x22769655C](self, a2);
  movementType = self->_movementType;
  if ((movementType - 1) >= 2)
  {
    if (!movementType)
      abort();
  }
  else
  {
    v5 = (id)qword_25583C538;
    v6 = os_signpost_id_make_with_pointer((os_log_t)qword_25583C538, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        objc_msgSend_agentDiagnosticsName(self, v8, v9, v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        mode = self->_mode;
        v14 = self->_movementType;
        v33 = 138412802;
        v34 = v12;
        v35 = 2112;
        v36 = mode;
        v37 = 1024;
        v38 = v14;
        _os_signpost_emit_with_name_impl(&dword_22634C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Mobile Agent Exec", "Agent %@ executing mode %@.  Movement type is %d", (uint8_t *)&v33, 0x1Cu);

      }
    }

    objc_msgSend_executeStopOnItinerary_(self, v15, (uint64_t)self->_itinerary, v16, v17);
    v18 = (id)qword_25583C538;
    v19 = os_signpost_id_make_with_pointer((os_log_t)qword_25583C538, self);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      if (os_signpost_enabled(v18))
      {
        v25 = objc_msgSend_nextMovementType(self, v21, v22, v23, v24);
        v33 = 67109120;
        LODWORD(v34) = v25;
        _os_signpost_emit_with_name_impl(&dword_22634C000, v18, OS_SIGNPOST_INTERVAL_END, v20, "Mobile Agent Exec", "Finished with next movement type %d", (uint8_t *)&v33, 8u);
      }
    }

    if ((objc_msgSend_updated(self->_itinerary, v26, v27, v28, v29) & 1) == 0
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      sub_226370010(self, (const char *)&self->_itinerary, v30, v31, v32);
    }
  }
  objc_autoreleasePoolPop(v3);
}

- (void)goodbye
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (self->_movementType == 3)
  {
    objc_msgSend_deactivated(self, a2, v2, v3, v4);
    MEMORY[0x24BEDD108](self, sel___park, v6, v7, v8);
  }
  else
  {
    objc_msgSend__visitNextStop_(self->_itinerary, a2, (uint64_t)self, v3, v4);
  }
}

- (int)nextMovementType
{
  return ((uint64_t (*)(XRMobileAgentItinerary *, char *))MEMORY[0x24BEDD108])(self->_itinerary, sel__nextMovementType);
}

- (id)activateUsingCompletionOperationAtStop:(id)a3 activationTicket:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v9 = (void *)objc_opt_new();
  if (v7)
    objc_msgSend_activateAtStop_activationTicket_finalDestination_finalTicket_(self, v8, (uint64_t)v7, (uint64_t)v6, qword_25583C930, v9);
  else
    objc_msgSend_activateAtStop_activationTicket_finalDestination_finalTicket_(self, v8, qword_25583C928, (uint64_t)v6, qword_25583C930, v9);

  return v9;
}

@end
