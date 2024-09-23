@implementation NTKTimelineDataSourceWrapper

- (NTKTimelineDataSourceWrapper)initWithDataSource:(id)a3
{
  id v5;
  NTKTimelineDataSourceWrapper *v6;
  NTKTimelineDataSourceWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKTimelineDataSourceWrapper;
  v6 = -[NTKTimelineDataSourceWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (void)tl_getCurrentTimelineEntryForIdentifiable:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  -[NTKTimelineDataSourceWrapper dataSource](self, "dataSource");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v13[5] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = (void *)v13[5];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__NTKTimelineDataSourceWrapper_tl_getCurrentTimelineEntryForIdentifiable_withHandler___block_invoke;
    v9[3] = &unk_1E6BCEBB0;
    v10 = v7;
    v11 = &v12;
    objc_msgSend(v8, "getCurrentTimelineEntryForComplication:withHandler:", v6, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }
  _Block_object_dispose(&v12, 8);

}

void __86__NTKTimelineDataSourceWrapper_tl_getCurrentTimelineEntryForIdentifiable_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)tl_getTimelineEntriesForIdentifiable:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5 withHandler:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD))a6;
  -[NTKTimelineDataSourceWrapper dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    objc_msgSend(v12, "getTimelineEntriesForComplication:afterDate:limit:withHandler:", v13, v10, a5, v11);
  else
    v11[2](v11, 0);

}

- (CLKComplicationDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
