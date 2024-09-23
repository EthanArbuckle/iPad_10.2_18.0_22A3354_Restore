@implementation GDMicroLocationVisitUtility

- (GDMicroLocationVisitUtility)initWithMicroLocationVisitStream:(id)a3
{
  id v5;
  GDMicroLocationVisitUtility *v6;
  GDMicroLocationVisitUtility *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDMicroLocationVisitUtility;
  v6 = -[GDMicroLocationVisitUtility init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_microLocationVisitStream, a3);

  return v7;
}

- (id)lastMicroLocationVisitEventPriorTo:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  id v17;
  void *v18;
  GDMicroLocationVisitEvent *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  id isEnter;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v4 = a3;
  objc_msgSend__rawMicroLocationVisitEventPublisherFrom_to_reversed_(self, v5, (uint64_t)v4, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v10 = (void *)objc_msgSend_initWithUUIDBytes_(v7, v8, (uint64_t)&unk_1C10DC641, v9);
  objc_msgSend_UUIDString(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_1C1069E54;
  v48 = sub_1C1069E64;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_1C1069E54;
  v42 = sub_1C1069E64;
  v43 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1C106A0FC;
  v34[3] = &unk_1E7A49A00;
  v15 = v14;
  v35 = v15;
  v36 = &v44;
  v37 = &v38;
  v17 = (id)objc_msgSend_sinkWithCompletion_shouldContinue_(v6, v16, (uint64_t)&unk_1E7A499D8, (uint64_t)v34);
  v18 = (void *)v45[5];
  if (v39[5])
  {
    if (v18)
    {
      v19 = [GDMicroLocationVisitEvent alloc];
      objc_msgSend_date((void *)v39[5], v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_microLocationIdentifier((void *)v45[5], v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_probability((void *)v45[5], v28, v29, v30);
      isEnter = (id)objc_msgSend_initWithDate_microLocationIdentifier_probability_isEnter_(v19, v31, (uint64_t)v23, (uint64_t)v27, 0);

    }
    else
    {
      isEnter = 0;
    }
  }
  else
  {
    isEnter = v18;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return isEnter;
}

- (id)microLocationVisitEventPublisherFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  id (*v29)(uint64_t, uint64_t, void *);
  void *v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;

  v6 = a3;
  v7 = a4;
  objc_msgSend__rawMicroLocationVisitEventPublisherFrom_to_reversed_(self, v8, (uint64_t)v6, (uint64_t)v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v13 = (void *)objc_msgSend_initWithUUIDBytes_(v10, v11, (uint64_t)&unk_1C10DC641, v12);
  objc_msgSend_UUIDString(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_1C1069E54;
  v33[4] = sub_1C1069E64;
  v34 = 0;
  objc_msgSend_tupleWithFirst_second_(MEMORY[0x1E0D81638], v18, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = sub_1C1069E6C;
  v30 = &unk_1E7A49A28;
  v32 = v33;
  v20 = v17;
  v31 = v20;
  objc_msgSend_scanWithInitial_nextPartialResult_(v9, v21, (uint64_t)v19, (uint64_t)&v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_flatMapWithTransform_(v22, v23, (uint64_t)&unk_1E7A49A68, v24, v27, v28, v29, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v33, 8);
  return v25;
}

- (id)_rawMicroLocationVisitEventPublisherFrom:(id)a3 to:(id)a4 reversed:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  void *started;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[6];

  v5 = a5;
  v9 = (objc_class *)MEMORY[0x1E0D026F0];
  v10 = a4;
  v11 = a3;
  v12 = [v9 alloc];
  started = (void *)objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(v12, v13, (uint64_t)v11, (uint64_t)v10, 0, 0, v5);

  objc_msgSend_publisherWithOptions_(self->_microLocationVisitStream, v15, (uint64_t)started, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filterWithIsIncluded_(v17, v18, (uint64_t)&unk_1E7A49AA8, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1C1069CB8;
  v25[3] = &unk_1E7A49AD0;
  v25[4] = self;
  v25[5] = a2;
  objc_msgSend_mapWithTransform_(v20, v21, (uint64_t)v25, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microLocationVisitStream, 0);
}

@end
