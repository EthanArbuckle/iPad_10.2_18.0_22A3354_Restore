@implementation CLSTemporalClusterReader

+ (BOOL)_isSupportedPortraitEventCategory:(unsigned __int8)a3
{
  return (a3 & 0xFFFFFFFB) == 8;
}

- (id)eventsBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;

  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0D70CB0]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__CLSTemporalClusterReader_eventsBetweenStartDate_endDate_error___block_invoke;
  v16[3] = &unk_1E84F8150;
  v16[4] = self;
  v13 = v11;
  v17 = v13;
  LODWORD(a5) = objc_msgSend(v12, "iterRankedTemporalClustersForStartDate:endDate:error:block:", v10, v9, a5, v16);

  if ((_DWORD)a5)
    v14 = v13;
  else
    v14 = 0;

  return v14;
}

void __65__CLSTemporalClusterReader_eventsBetweenStartDate_endDate_error___block_invoke(uint64_t a1, void *a2)
{
  CLSTemporalClusterEvent *v3;
  id v4;

  objc_msgSend(a2, "event");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4
    && objc_msgSend((id)objc_opt_class(), "_isSupportedPortraitEventCategory:", objc_msgSend(v4, "suggestedEventCategory")))
  {
    v3 = -[CLSTemporalClusterEvent initWithPortraitEvent:]([CLSTemporalClusterEvent alloc], "initWithPortraitEvent:", v4);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
}

@end
