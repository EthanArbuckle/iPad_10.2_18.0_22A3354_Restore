@implementation CNUIUserActionDialRequestOpener

void __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "callCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "errorOnlyCompletionHandlerAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchAppForDialRequest:completion:", v2, v3);

}

id __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "errorForUnableToOpenDialRequest:withUnderlyingError:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13A68], "futureWithError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke_3_cold_1((uint64_t)v2, v3);

}

void __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DD140000, a2, OS_LOG_TYPE_DEBUG, "Failed to open dialRequest: %@", (uint8_t *)&v2, 0xCu);
}

@end
