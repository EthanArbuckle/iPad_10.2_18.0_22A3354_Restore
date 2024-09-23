@implementation CalAssistantGetDefaultCalendar

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
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  id v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  id v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;

  v4 = (void (**)(id, void *))a3;
  sub_22665D4E4();
  objc_msgSend_eventStore(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_acquireDefaultCalendarForNewEvents(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_source(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_externalID(v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_title(v16, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_sourceType(v16, v25, v26, v27) != 0;
  v29 = objc_alloc_init(MEMORY[0x24BE81188]);
  objc_msgSend_setAccountIdentifier_(v29, v30, (uint64_t)v20, v31);
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v32, v28, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemote_(v29, v35, (uint64_t)v34, v36);

  objc_msgSend_setStrict_(v29, v37, 0, v38);
  objc_msgSend_setAccountName_(v29, v39, (uint64_t)v24, v40);
  v41 = objc_alloc(MEMORY[0x24BE81160]);
  v48 = (id)objc_msgSend_initWithAceCalendarSource_(v41, v42, (uint64_t)v29, v43);
  objc_msgSend_dictionary(v48, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v47);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end
