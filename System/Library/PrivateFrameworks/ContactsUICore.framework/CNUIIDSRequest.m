@implementation CNUIIDSRequest

id __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 64), "shouldRetryRefreshingIDSStatusOfDesinationsGivenResult:", v3))
    objc_msgSend(*(id *)(a1 + 64), "afterDelayRetryRefreshingStatusOfDestinations:forService:queryControllerWrapper:scheduler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  else
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isStatusOfAnyDestinationUnknown:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13820] + 16))() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "_cn_any:", &__block_literal_global_5);

  }
  return v4;
}

_CNUIIDSHandleAvailability *__69__CNUIIDSRequest_resultsForIDSControllerResult_handlesByDestination___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _CNUIIDSHandleAvailability *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 48), "isDestinationAvailable:givenStatusesByDestination:", v4, *(_QWORD *)(a1 + 40));

  v7 = -[_CNUIIDSHandleAvailability initWithHandle:available:]([_CNUIIDSHandleAvailability alloc], "initWithHandle:available:", v5, v6);
  return v7;
}

+ (BOOL)isDestinationAvailable:(id)a3 givenStatusesByDestination:(id)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue") == 1;
  else
    v6 = 0;

  return v6;
}

void __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke_3;
  v6[3] = &unk_1EA602FA8;
  v11 = *(_QWORD *)(a1 + 64);
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

+ (id)refreshStatusOfDestinations:(id)a3 forService:(id)a4 queryControllerWrapper:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0D13B68];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "immediateScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "refreshStatusOfDestinations:forService:queryControllerWrapper:delay:scheduler:", v11, v10, v9, v12, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)refreshStatusOfDestinations:(id)a3 forService:(id)a4 queryControllerWrapper:(id)a5 delay:(double)a6 scheduler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __96__CNUIIDSRequest_refreshStatusOfDestinations_forService_queryControllerWrapper_delay_scheduler___block_invoke;
  v26[3] = &unk_1EA602FA8;
  v27 = v14;
  v28 = v12;
  v30 = v16;
  v31 = a1;
  v29 = v13;
  v17 = v16;
  v18 = v13;
  v19 = v12;
  v20 = v14;
  v21 = MEMORY[0x1DF0D6388](v26);
  v22 = (void *)v21;
  if (a6 <= 0.0)
    (*(void (**)(uint64_t))(v21 + 16))(v21);
  else
    v23 = (id)objc_msgSend(v15, "afterDelay:performBlock:", v21, a6);
  objc_msgSend(v17, "future");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

void __96__CNUIIDSRequest_refreshStatusOfDestinations_forService_queryControllerWrapper_delay_scheduler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 64), "IDSResponseQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __96__CNUIIDSRequest_refreshStatusOfDestinations_forService_queryControllerWrapper_delay_scheduler___block_invoke_2;
  v13 = &unk_1EA603020;
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v14 = v6;
  v17 = v7;
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  LOBYTE(v2) = objc_msgSend(v2, "refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:", v3, v4, CFSTR("com.apple.contacts.ContactsUICore"), v5, &v10);

  if ((v2 & 1) == 0)
  {
    v8 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "errorRefreshingHandles:forService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v10, v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithError:", v9);

  }
}

+ (id)validateHandles:(id)a3 forService:(int64_t)a4 scheduler:(id)a5 queryControllerWrapper:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v10 = a5;
  v11 = a6;
  v12 = a3;
  objc_msgSend(a1, "IDSServiceForService:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  objc_msgSend(a1, "validHandlesFromHandles:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "_cn_indexBy:", &__block_literal_global_0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "errorRefreshingHandles:forService:", v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(a1, "refreshStatusOfDestinations:forService:queryControllerWrapper:", v16, v13, v11);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke;
    v38[3] = &unk_1EA602F80;
    v43 = a1;
    v19 = v16;
    v39 = v19;
    v40 = v13;
    v41 = v11;
    v28 = v11;
    v20 = v10;
    v21 = v10;
    v42 = v21;
    objc_msgSend(v29, "flatMap:", v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v18;
    v32[1] = 3221225472;
    v32[2] = __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke_2;
    v32[3] = &unk_1EA602FD0;
    v33 = v21;
    v37 = a1;
    v34 = v19;
    v23 = v14;
    v35 = v23;
    v36 = v17;
    objc_msgSend(v22, "addSuccessBlock:", v32);
    v30[0] = v18;
    v30[1] = 3221225472;
    v30[2] = __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke_4;
    v30[3] = &unk_1EA602FF8;
    v24 = v23;
    v31 = v24;
    objc_msgSend(v22, "addFailureBlock:", v30);
    v25 = v24;
    v10 = v20;
    v11 = v28;
    objc_msgSend(v25, "future");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v14, "finishWithError:", v17);
    objc_msgSend(v14, "future");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

+ (id)validHandlesFromHandles:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "_cn_filter:", &__block_literal_global_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "count");
  if (v5 != objc_msgSend(v4, "count"))
    objc_msgSend(v3, "_cn_each:", &__block_literal_global_27);

  return v4;
}

+ (id)errorRefreshingHandles:(id)a3 forService:(id)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (a3)
  {
    objc_msgSend(a3, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_map:", &__block_literal_global_0);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("No handles provided");
  }
  v11[0] = CFSTR("handles");
  v11[1] = CFSTR("service");
  v12[0] = v7;
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactsUIError errorWithCode:userInfo:](CNContactsUIError, "errorWithCode:userInfo:", 205, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)IDSServiceForService:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
  {
    ((void (*)(id, SEL))*off_1EA6030A0[a3])(a1, a2);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)IDSResponseQueue
{
  if (IDSResponseQueue_cn_once_token_1 != -1)
    dispatch_once(&IDSResponseQueue_cn_once_token_1, &__block_literal_global_8);
  return (id)IDSResponseQueue_cn_once_object_1;
}

void __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend((id)objc_opt_class(), "resultsForIDSControllerResult:handlesByDestination:", a1[4], a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)a1[6];
  v4 = (id)v2;
  if (v2)
    objc_msgSend(v3, "finishWithResult:", v2);
  else
    objc_msgSend(v3, "finishWithError:", a1[7]);

}

+ (id)resultsForIDSControllerResult:(id)a3 handlesByDestination:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__CNUIIDSRequest_resultsForIDSControllerResult_handlesByDestination___block_invoke;
  v13[3] = &unk_1EA602F58;
  v15 = v6;
  v16 = a1;
  v14 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "_cn_map:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __96__CNUIIDSRequest_refreshStatusOfDestinations_forService_queryControllerWrapper_delay_scheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "errorRefreshingHandles:forService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithError:", v3);

  }
}

void __34__CNUIIDSRequest_IDSResponseQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.contacts.ContactsUICore.IDSResponseQueue", 0);
  v1 = (void *)IDSResponseQueue_cn_once_object_1;
  IDSResponseQueue_cn_once_object_1 = (uint64_t)v0;

}

BOOL __50__CNUIIDSRequest_isStatusOfAnyDestinationUnknown___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "integerValue") == 0;
}

uint64_t __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

+ (id)afterDelayRetryRefreshingStatusOfDestinations:(id)a3 forService:(id)a4 queryControllerWrapper:(id)a5 scheduler:(id)a6
{
  return (id)objc_msgSend(a1, "refreshStatusOfDestinations:forService:queryControllerWrapper:delay:scheduler:", a3, a4, a5, a6, 2.5);
}

void __42__CNUIIDSRequest_validHandlesFromHandles___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "_cnui_IDSIDRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __42__CNUIIDSRequest_validHandlesFromHandles___block_invoke_cold_1((uint64_t)v2, v4);

  }
}

void __42__CNUIIDSRequest_validHandlesFromHandles___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DD140000, a2, OS_LOG_TYPE_DEBUG, "No IDS representation for handle %@", (uint8_t *)&v2, 0xCu);
}

@end
