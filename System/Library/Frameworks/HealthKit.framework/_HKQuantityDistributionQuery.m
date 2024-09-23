@implementation _HKQuantityDistributionQuery

- (_HKQuantityDistributionQuery)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5 contextStyle:(int64_t)a6 predicate:(id)a7 anchorDate:(id)a8 intervalComponents:(id)a9 histogramAnchor:(id)a10 histogramBucketSize:(id)a11 options:(unint64_t)a12 completionHandler:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  id *v33;
  _HKQuantityDistributionQuery *v34;
  void *v35;
  id completionHandler;
  id obj;
  id obja;
  id v40;
  id v42;
  id v44;
  id v45;
  objc_super v46;
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  obj = a4;
  v18 = a4;
  v40 = a5;
  v19 = a5;
  v20 = a7;
  v42 = a8;
  v21 = a8;
  v45 = a9;
  v44 = a10;
  v22 = a11;
  v23 = a13;
  +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", v18, v19, 0);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v20)
  {
    v26 = (void *)MEMORY[0x1E0CB3528];
    v47[0] = v24;
    v47[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2, obj, v40);
    v27 = v21;
    v28 = v19;
    v29 = v18;
    v30 = v17;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "andPredicateWithSubpredicates:", v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v17 = v30;
    v18 = v29;
    v19 = v28;
    v21 = v27;
    v25 = (void *)v32;
  }
  v46.receiver = self;
  v46.super_class = (Class)_HKQuantityDistributionQuery;
  v33 = -[HKQuery _initWithObjectType:predicate:](&v46, sel__initWithObjectType_predicate_, v17, v25, obj);
  v34 = (_HKQuantityDistributionQuery *)v33;
  if (v33)
  {
    objc_storeStrong(v33 + 19, obja);
    objc_storeStrong((id *)&v34->_endDate, v40);
    v34->_contextStyle = a6;
    objc_storeStrong((id *)&v34->_anchorDate, v42);
    objc_storeStrong((id *)&v34->_intervalComponents, a9);
    objc_storeStrong((id *)&v34->_histogramAnchor, a10);
    objc_storeStrong((id *)&v34->_histogramBucketSize, a11);
    v35 = _Block_copy(v23);
    completionHandler = v34->_completionHandler;
    v34->_completionHandler = v35;

    v34->_options = a12;
  }

  return v34;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3D7678;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____HKQuantityDistributionQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverDistributionCollection_forQuery_, 0, 0);

}

- (void)queue_deliverError:(id)a3
{
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id completionHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKQuantityDistributionQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKQuantityDistributionQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setStartDate:", self->_startDate, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setEndDate:", self->_endDate);
  objc_msgSend(v4, "setContextStyle:", self->_contextStyle);
  objc_msgSend(v4, "setAnchorDate:", self->_anchorDate);
  objc_msgSend(v4, "setIntervalComponents:", self->_intervalComponents);
  objc_msgSend(v4, "setHistogramAnchor:", self->_histogramAnchor);
  objc_msgSend(v4, "setHistogramBucketSize:", self->_histogramBucketSize);
  objc_msgSend(v4, "setOptions:", self->_options);

}

- (void)client_deliverDistributionCollection:(id)a3 forQuery:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HKQuery queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78___HKQuantityDistributionQuery_client_deliverDistributionCollection_forQuery___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (int64_t)contextStyle
{
  return self->_contextStyle;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (HKQuantity)histogramAnchor
{
  return self->_histogramAnchor;
}

- (HKQuantity)histogramBucketSize
{
  return self->_histogramBucketSize;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_histogramBucketSize, 0);
  objc_storeStrong((id *)&self->_histogramAnchor, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
