@implementation GDGeoHashVisitUtility

- (GDGeoHashVisitUtility)initWithGeoHashStream:(id)a3
{
  id v5;
  GDGeoHashVisitUtility *v6;
  GDGeoHashVisitUtility *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDGeoHashVisitUtility;
  v6 = -[GDGeoHashVisitUtility init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_geoHashStream, a3);

  return v7;
}

- (id)lastGeoHashVisitEventAt:(id)a3 level:(int64_t)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  id v10;
  GDGeoHashVisitEvent *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *isEnter_level;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  objc_msgSend__rawGeoHashVisitEventPublisherFrom_to_maxEvents_lastN_reversed_level_(self, v7, (uint64_t)v6, 0, 1, 0, 1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1C1066F8C;
  v28 = sub_1C1066F9C;
  v29 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1C10671E0;
  v23[3] = &unk_1E7A49758;
  v23[4] = &v24;
  v10 = (id)objc_msgSend_sinkWithCompletion_shouldContinue_(v8, v9, (uint64_t)&unk_1E7A49730, (uint64_t)v23);
  if (v25[5])
  {
    v11 = [GDGeoHashVisitEvent alloc];
    objc_msgSend_date((void *)v25[5], v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_geoHash((void *)v25[5], v16, v17, v18);
    isEnter_level = (void *)objc_msgSend_initWithDate_geoHash_isEnter_level_(v11, v20, (uint64_t)v15, v19, 1, a4);

  }
  else
  {
    isEnter_level = 0;
  }
  _Block_object_dispose(&v24, 8);

  return isEnter_level;
}

- (id)geoHashVisitEventPublisherFrom:(id)a3 to:(id)a4 level:(int64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[6];
  _QWORD v22[5];
  id v23;

  v8 = a3;
  v9 = a4;
  objc_msgSend__rawGeoHashVisitEventPublisherFrom_to_reversed_level_(self, v10, (uint64_t)v8, (uint64_t)v9, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_1C1066F8C;
  v22[4] = sub_1C1066F9C;
  v23 = 0;
  objc_msgSend_lastGeoHashVisitEventAt_level_(self, v12, (uint64_t)v8, a5);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tupleWithFirst_second_(MEMORY[0x1E0D81638], v13, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1C1066FA4;
  v21[3] = &unk_1E7A49780;
  v21[4] = v22;
  v21[5] = a5;
  objc_msgSend_scanWithInitial_nextPartialResult_(v11, v15, (uint64_t)v14, (uint64_t)v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_flatMapWithTransform_(v16, v17, (uint64_t)&unk_1E7A497A0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v22, 8);
  return v19;
}

- (id)_rawGeoHashVisitEventPublisherFrom:(id)a3 to:(id)a4 reversed:(BOOL)a5 level:(int64_t)a6
{
  return (id)objc_msgSend__rawGeoHashVisitEventPublisherFrom_to_maxEvents_lastN_reversed_level_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, a5, a6);
}

- (id)_rawGeoHashVisitEventPublisherFrom:(id)a3 to:(id)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 reversed:(BOOL)a7 level:(int64_t)a8
{
  _BOOL8 v9;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  void *started;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[5];

  v9 = a7;
  v14 = (objc_class *)MEMORY[0x1E0D026F0];
  v15 = a4;
  v16 = a3;
  v17 = [v14 alloc];
  started = (void *)objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(v17, v18, (uint64_t)v16, (uint64_t)v15, a5, a6, v9);

  objc_msgSend_publisherWithOptions_(self->_geoHashStream, v20, (uint64_t)started, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filterWithIsIncluded_(v22, v23, (uint64_t)&unk_1E7A497C0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1C1066DEC;
  v30[3] = &unk_1E7A497E0;
  v30[4] = a8;
  objc_msgSend_mapWithTransform_(v25, v26, (uint64_t)v30, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoHashStream, 0);
}

@end
