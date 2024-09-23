@implementation LBFProtoConverter

+ (id)createBitacoraExperimentIdentifiers:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;

  v3 = a3;
  v4 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers);
  objc_msgSend_objectForKey_(v3, v5, (uint64_t)CFSTR("trialTreatmentID"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTrialTreatmentID_(v4, v9, (uint64_t)v8, v10, v11);

  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend_objectForKey_(v3, v13, (uint64_t)CFSTR("trialDeploymentID"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend_initWithFormat_(v12, v17, (uint64_t)CFSTR("%@"), v18, v19, v16);
  objc_msgSend_setTrialDeploymentID_(v4, v21, (uint64_t)v20, v22, v23);

  objc_msgSend_objectForKey_(v3, v24, (uint64_t)CFSTR("trialExperimentID"), v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setTrialExperimentID_(v4, v28, (uint64_t)v27, v29, v30);
  return v4;
}

+ (id)createBitacoraBmltIdentifiers:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a3;
  v4 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers);
  objc_msgSend_objectForKey_(v3, v5, (uint64_t)CFSTR("trialTaskID"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTrialTaskID_(v4, v9, (uint64_t)v8, v10, v11);

  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend_objectForKey_(v3, v13, (uint64_t)CFSTR("trialDeploymentID"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend_initWithFormat_(v12, v17, (uint64_t)CFSTR("%@"), v18, v19, v16);
  objc_msgSend_setTrialDeploymentID_(v4, v21, (uint64_t)v20, v22, v23);

  return v4;
}

+ (id)createTrialIdentifiers:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *v29;

  v3 = a3;
  v4 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers);
  objc_msgSend_objectForKey_(v3, v5, (uint64_t)CFSTR("experimentIdentifiers"), v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_5:
    objc_msgSend_objectForKey_(v3, v8, (uint64_t)CFSTR("bmltIdentifiers"), v9, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_createBitacoraBmltIdentifiers_(LBFProtoConverter, v21, (uint64_t)v20, v22, v23);
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v28 = (void *)v24;
          objc_msgSend_setBmltIdentifiers_(v4, v25, v24, v26, v27);

          goto LABEL_9;
        }
        if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
          sub_240314E64();
      }
      else if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
      {
        sub_240314EC4();
      }
      v29 = 0;
      goto LABEL_20;
    }
LABEL_9:
    v29 = v4;
LABEL_20:

    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_createBitacoraExperimentIdentifiers_(LBFProtoConverter, v12, (uint64_t)v11, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v19 = (void *)v15;
      objc_msgSend_setExperimentIdentifiers_(v4, v16, v15, v17, v18);

      goto LABEL_5;
    }
    if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
      sub_240314E64();
  }
  else if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
  {
    sub_240314F24();
  }
  v29 = 0;
LABEL_21:

  return v29;
}

+ (id)createMLRuntimeTaskEvent:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;

  v3 = a3;
  v4 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOTaskEvent);
  objc_msgSend_valueForKey_(v3, v5, (uint64_t)CFSTR("succeeded"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (v8)
  {
    v14 = objc_msgSend_BOOLValue(v8, v9, v10, v11, v12);
    objc_msgSend_setSucceeded_(v4, v15, v14, v16, v17);
    objc_msgSend_valueForKey_(v3, v18, (uint64_t)CFSTR("errorDomain"), v19, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_setErrorDomain_(v4, v25, (uint64_t)v24, v26, v27);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
            sub_240315044();
          v28 = 0;
          goto LABEL_15;
        }
      }
    }
    objc_msgSend_valueForKey_(v3, v21, (uint64_t)CFSTR("errorCode"), v22, v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = objc_msgSend_intValue(v29, v30, v31, v32, v33);
        objc_msgSend_setErrorCode_(v4, v35, v34, v36, v37);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
            sub_240314FE4();
          v28 = 0;
          goto LABEL_14;
        }
      }
    }
    v28 = v4;
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
    sub_240314F84();
  v28 = 0;
LABEL_16:

  return v28;
}

+ (id)createMLRuntimeScheduleStatus:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOScheduleStatus *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  LIGHTHOUSE_BITACORA_PROTOScheduleStatus *v18;

  v3 = a3;
  v4 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOScheduleStatus);
  objc_msgSend_valueForKey_(v3, v5, (uint64_t)CFSTR("scheduled"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (v8)
  {
    v14 = objc_msgSend_BOOLValue(v8, v9, v10, v11, v12);
    objc_msgSend_setScheduled_(v4, v15, v14, v16, v17);
    v18 = v4;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
      sub_2403150A4();
    v18 = 0;
  }

  return v18;
}

+ (id)createMLRuntimeProto:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
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
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent *v72;

  v3 = a3;
  v4 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent);
  objc_msgSend_objectForKey_(v3, v5, (uint64_t)CFSTR("trialIdentifiers"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_createTrialIdentifiers_(LBFProtoConverter, v9, (uint64_t)v8, v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
        sub_240315104();
      v72 = 0;
      goto LABEL_38;
    }
    objc_msgSend_setTrialIdentifiers_(v4, v12, (uint64_t)v15, v13, v14);
    objc_msgSend_objectForKey_(v3, v16, (uint64_t)CFSTR("timestamp"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v19, v20, v21, v22, v23);
    objc_msgSend_setTimestamp_(v4, v24, v25, v26, v27);

    objc_msgSend_objectForKey_(v3, v28, (uint64_t)CFSTR("activityScheduled"), v29, v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
          sub_240315284();
        v72 = 0;
        goto LABEL_37;
      }
      objc_msgSend_createMLRuntimeScheduleStatus_(LBFProtoConverter, v35, (uint64_t)v34, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setActivityScheduleStatus_(v4, v39, (uint64_t)v38, v40, v41);

    }
    objc_msgSend_objectForKey_(v3, v31, (uint64_t)CFSTR("taskScheduled"), v32, v33);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
          sub_240315224();
        v72 = 0;
        goto LABEL_36;
      }
      objc_msgSend_createMLRuntimeTaskEvent_(LBFProtoConverter, v46, (uint64_t)v45, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTaskScheduled_(v4, v50, (uint64_t)v49, v51, v52);

    }
    objc_msgSend_objectForKey_(v3, v42, (uint64_t)CFSTR("taskFetched"), v43, v44);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
          sub_2403151C4();
        v72 = 0;
        goto LABEL_35;
      }
      objc_msgSend_createMLRuntimeTaskEvent_(LBFProtoConverter, v57, (uint64_t)v56, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTaskFetched_(v4, v61, (uint64_t)v60, v62, v63);

    }
    objc_msgSend_objectForKey_(v3, v53, (uint64_t)CFSTR("taskCompleted"), v54, v55);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
          sub_240315164();
        v72 = 0;
        goto LABEL_34;
      }
      objc_msgSend_createMLRuntimeTaskEvent_(LBFProtoConverter, v65, (uint64_t)v64, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTaskCompleted_(v4, v69, (uint64_t)v68, v70, v71);

    }
    v72 = v4;
LABEL_34:

LABEL_35:
LABEL_36:

LABEL_37:
LABEL_38:

    goto LABEL_39;
  }
  if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
    sub_2403152E4();
  v72 = 0;
LABEL_39:

  return v72;
}

+ (id)createMLRuntimeProtoData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend_createMLRuntimeProto_(LBFProtoConverter, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  if (a3)
  {
    objc_msgSend_data(v6, v7, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = LBFLogContextProtoConverter;
    if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
      sub_240315344(v13, v14, v15, v16, v17, v18, v19, v20);
    v12 = 0;
  }

  return v12;
}

+ (id)deserializeMLRuntimeProto:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = [LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent alloc];
  v8 = (void *)objc_msgSend_initWithData_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

+ (id)serializeMLRuntimeProtoToJson:(id)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id))MEMORY[0x24BEDD108])(_TtC27LighthouseBitacoraFramework20LBFProtoToJson_swift, sel_serializeBitacoraBitacoraMlruntimedEventToJsonWithProtoData_, a3);
}

+ (id)createLighthousePluginEventStatus:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOEventStatus *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  LIGHTHOUSE_BITACORA_PROTOEventStatus *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;

  v3 = a3;
  v4 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOEventStatus);
  objc_msgSend_valueForKey_(v3, v5, (uint64_t)CFSTR("succeeded"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (v8)
  {
    v14 = objc_msgSend_BOOLValue(v8, v9, v10, v11, v12);
    objc_msgSend_setSucceeded_(v4, v15, v14, v16, v17);
    objc_msgSend_valueForKey_(v3, v18, (uint64_t)CFSTR("errorDomain"), v19, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_setErrorDomain_(v4, v25, (uint64_t)v24, v26, v27);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
            sub_24031540C();
          v28 = 0;
          goto LABEL_15;
        }
      }
    }
    objc_msgSend_valueForKey_(v3, v21, (uint64_t)CFSTR("errorCode"), v22, v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = objc_msgSend_intValue(v29, v30, v31, v32, v33);
        objc_msgSend_setErrorCode_(v4, v35, v34, v36, v37);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
            sub_2403153AC();
          v28 = 0;
          goto LABEL_14;
        }
      }
    }
    v28 = v4;
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
    sub_240314F84();
  v28 = 0;
LABEL_16:

  return v28;
}

+ (id)createLighthousePluginProto:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerLighthousePluginEvent *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
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
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerLighthousePluginEvent *v61;

  v3 = a3;
  v4 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerLighthousePluginEvent);
  objc_msgSend_objectForKey_(v3, v5, (uint64_t)CFSTR("trialIdentifiers"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_createTrialIdentifiers_(LBFProtoConverter, v9, (uint64_t)v8, v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v61 = 0;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend_setTrialIdentifiers_(v4, v12, (uint64_t)v15, v13, v14);
    objc_msgSend_objectForKey_(v3, v16, (uint64_t)CFSTR("timestamp"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v19, v20, v21, v22, v23);
    objc_msgSend_setTimestamp_(v4, v24, v25, v26, v27);

    objc_msgSend_objectForKey_(v3, v28, (uint64_t)CFSTR("performTaskStatus"), v29, v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
          sub_24031552C();
        v61 = 0;
        goto LABEL_28;
      }
      objc_msgSend_createLighthousePluginEventStatus_(LBFProtoConverter, v35, (uint64_t)v34, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPerformTaskStatus_(v4, v39, (uint64_t)v38, v40, v41);

    }
    objc_msgSend_objectForKey_(v3, v31, (uint64_t)CFSTR("performTrialTaskStatus"), v32, v33);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
          sub_2403154CC();
        v61 = 0;
        goto LABEL_27;
      }
      objc_msgSend_createLighthousePluginEventStatus_(LBFProtoConverter, v46, (uint64_t)v45, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPerformTrialTaskStatus_(v4, v50, (uint64_t)v49, v51, v52);

    }
    objc_msgSend_objectForKey_(v3, v42, (uint64_t)CFSTR("stop"), v43, v44);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
          sub_24031546C();
        v61 = 0;
        goto LABEL_26;
      }
      objc_msgSend_createLighthousePluginEventStatus_(LBFProtoConverter, v54, (uint64_t)v53, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setStop_(v4, v58, (uint64_t)v57, v59, v60);

    }
    v61 = v4;
LABEL_26:

LABEL_27:
LABEL_28:

    goto LABEL_29;
  }
  if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
    sub_24031558C();
  v61 = 0;
LABEL_30:

  return v61;
}

+ (id)createLighthousePluginProtoData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend_createLighthousePluginProto_(LBFProtoConverter, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  if (a3)
  {
    objc_msgSend_data(v6, v7, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = LBFLogContextProtoConverter;
    if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
      sub_240315344(v13, v14, v15, v16, v17, v18, v19, v20);
    v12 = 0;
  }

  return v12;
}

+ (id)deserializeLighthousePluginProto:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerLighthousePluginEvent *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = [LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerLighthousePluginEvent alloc];
  v8 = (void *)objc_msgSend_initWithData_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

+ (id)serializeLighthousePluginProtoToJson:(id)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id))MEMORY[0x24BEDD108])(_TtC27LighthouseBitacoraFramework20LBFProtoToJson_swift, sel_serializeBitacoraLighthousePluginEventToJsonWithProtoData_, a3);
}

+ (id)createTrialdProto:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
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
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;

  v3 = a3;
  v4 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent);
  objc_msgSend_objectForKey_(v3, v5, (uint64_t)CFSTR("trialIdentifiers"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_createTrialIdentifiers_(LBFProtoConverter, v9, (uint64_t)v8, v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v48 = 0;
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend_setTrialIdentifiers_(v4, v12, (uint64_t)v15, v13, v14);
    objc_msgSend_objectForKey_(v3, v16, (uint64_t)CFSTR("timestamp"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v19, v20, v21, v22, v23);
    objc_msgSend_setTimestamp_(v4, v24, v25, v26, v27);

    objc_msgSend_objectForKey_(v3, v28, (uint64_t)CFSTR("eventType"), v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
          sub_2403156AC();
        v48 = 0;
        goto LABEL_30;
      }
      if (objc_msgSend_isEqualToString_(v31, v32, (uint64_t)CFSTR("allocation"), v33, v34))
        objc_msgSend_setEventType_(v4, v35, 1, v36, v37);
      if (objc_msgSend_isEqualToString_(v31, v35, (uint64_t)CFSTR("activation"), v36, v37))
        objc_msgSend_setEventType_(v4, v38, 2, v39, v40);
      if (objc_msgSend_isEqualToString_(v31, v38, (uint64_t)CFSTR("deactivation"), v39, v40))
        objc_msgSend_setEventType_(v4, v41, 3, v43, v44);
      if ((objc_msgSend_hasEventType(v4, v41, v42, v43, v44) & 1) == 0)
        objc_msgSend_setEventType_(v4, v45, 0, v46, v47);
    }
    else if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
    {
      sub_24031564C();
    }
    objc_msgSend_objectForKey_(v3, v45, (uint64_t)CFSTR("eventSucceeded"), v46, v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
          sub_2403155EC();
        v48 = 0;
        goto LABEL_29;
      }
      v54 = objc_msgSend_BOOLValue(v49, v50, v51, v52, v53);
      objc_msgSend_setEventSucceeded_(v4, v55, v54, v56, v57);
    }
    v48 = v4;
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
    sub_24031558C();
  v48 = 0;
LABEL_32:

  return v48;
}

+ (id)createTrialdProtoData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend_createTrialdProto_(LBFProtoConverter, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  if (a3)
  {
    objc_msgSend_data(v6, v7, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = LBFLogContextProtoConverter;
    if (os_log_type_enabled((os_log_t)LBFLogContextProtoConverter, OS_LOG_TYPE_ERROR))
      sub_240315344(v13, v14, v15, v16, v17, v18, v19, v20);
    v12 = 0;
  }

  return v12;
}

+ (id)deserializeTrialdProto:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = [LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent alloc];
  v8 = (void *)objc_msgSend_initWithData_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

+ (id)serializeTrialdProtoToJson:(id)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id))MEMORY[0x24BEDD108])(_TtC27LighthouseBitacoraFramework20LBFProtoToJson_swift, sel_serializeBitacoraTrialdEventToJsonWithProtoData_, a3);
}

+ (id)serializeBitacoraStateToJson:(id)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id))MEMORY[0x24BEDD108])(_TtC27LighthouseBitacoraFramework20LBFProtoToJson_swift, sel_serializeBitacoraStateToJsonWithProtoData_, a3);
}

@end
