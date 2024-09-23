@implementation CalAssistantEventDelete

- (id)eventStore
{
  uint64_t v2;
  EKEventStore *eventStore;
  EKEventStore *v5;
  EKEventStore *v6;

  eventStore = self->_eventStore;
  if (!eventStore)
  {
    objc_msgSend__ca_eventStoreWithError_(MEMORY[0x24BDC74E8], a2, 0, v2);
    v5 = (EKEventStore *)objc_claimAutoreleasedReturnValue();
    v6 = self->_eventStore;
    self->_eventStore = v5;

    eventStore = self->_eventStore;
  }
  return eventStore;
}

- (void)setEventStore:(id)a3
{
  EKEventStore *v5;
  EKEventStore *v6;

  v5 = (EKEventStore *)a3;
  if (self->_eventStore != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_eventStore, a3);
    v5 = v6;
  }

}

- (void)performWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v4 = (void (**)(id, void *))a3;
  sub_22665D4E4();
  sub_22665D4E4();
  v5 = (void *)qword_25586B420;
  if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
    sub_226660DCC(v5);
  v6 = (void *)*MEMORY[0x24BE08FF0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_DEBUG))
    sub_226660D44(v6);
  objc_msgSend_identifier(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__validateEvent_(self, v11, (uint64_t)v10, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend__deleteEvent_(self, v13, (uint64_t)v10, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_dictionary(v16, v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v17);

}

- (id)_validateEvent:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    sub_22665D4E4();
    v9 = (void *)qword_25586B420;
    if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
      sub_226661008(v9);
    v10 = (void *)*MEMORY[0x24BE08FF0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_DEBUG))
      sub_226660F44(v10);
    v11 = CFSTR("Expected SACalendarEvent object.");
    goto LABEL_14;
  }
  objc_msgSend_identifier(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    sub_22665D4E4();
    v12 = (void *)qword_25586B420;
    if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
      sub_226660ECC(v12);
    v13 = (void *)*MEMORY[0x24BE08FF0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_DEBUG))
      sub_226660E44(v13);
    v11 = CFSTR("No Event ID was specified");
LABEL_14:
    v14 = objc_alloc(MEMORY[0x24BE811A8]);
    v8 = (void *)objc_msgSend_initWithReason_(v14, v15, (uint64_t)v11, v16);
    goto LABEL_15;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (id)_deleteEvent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  id v55;

  v4 = a3;
  objc_msgSend_identifier(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v9, (uint64_t)v8, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  objc_msgSend_eventStore(self, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__eventWithURI_checkValid_(v13, v14, (uint64_t)v8, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    sub_22665D4E4();
    v43 = (void *)qword_25586B420;
    if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
      sub_226661134(v43);
    v44 = (void *)*MEMORY[0x24BE08FF0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_DEBUG))
      sub_2266610AC(v44);
    v45 = objc_alloc(MEMORY[0x24BE811A8]);
    v48 = objc_msgSend_initWithReason_(v45, v46, (uint64_t)CFSTR("Event not found"), v47);
    goto LABEL_21;
  }
  if ((objc_msgSend_isEditable(v15, v16, v17, v18) & 1) == 0)
  {
    sub_22665D4E4();
    v49 = (void *)qword_25586B420;
    if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
      sub_2266613B8(v49);
    v50 = (void *)*MEMORY[0x24BE08FF0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_DEBUG))
      sub_226661330(v50);
    v51 = objc_alloc(MEMORY[0x24BE811A8]);
    v48 = objc_msgSend_initWithReason_(v51, v52, (uint64_t)CFSTR("Can't delete a read only event."), v53);
LABEL_21:
    v42 = (id)v48;
    goto LABEL_24;
  }
  objc_msgSend_includeRecurrences(v4, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_BOOLValue(v22, v23, v24, v25);

  objc_msgSend_eventStore(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  objc_msgSend_removeEvent_span_commit_error_(v30, v31, (uint64_t)v15, v26, 1, &v55);
  v32 = v55;

  if (v32)
  {
    sub_22665D4E4();
    v33 = (void *)qword_25586B420;
    if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
      sub_226661278(v33, (uint64_t)self, v32);
    v34 = (void *)*MEMORY[0x24BE08FF0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_DEBUG))
      sub_2266611AC(v34, (uint64_t)self, v32);
    v35 = objc_alloc(MEMORY[0x24BE811A8]);
    objc_msgSend_localizedDescription(v32, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (id)objc_msgSend_initWithReason_(v35, v40, (uint64_t)v39, v41);

  }
  else
  {
    v42 = objc_alloc_init(MEMORY[0x24BE81228]);
  }

LABEL_24:
  return v42;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end
