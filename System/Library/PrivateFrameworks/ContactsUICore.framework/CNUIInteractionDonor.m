@implementation CNUIInteractionDonor

+ (OS_os_log)log
{
  if (log_cn_once_token_1_3 != -1)
    dispatch_once(&log_cn_once_token_1_3, &__block_literal_global_46);
  return (OS_os_log *)(id)log_cn_once_object_1_3;
}

void __27__CNUIInteractionDonor_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("contactsui", "activity");
  v1 = (void *)log_cn_once_object_1_3;
  log_cn_once_object_1_3 = (uint64_t)v0;

}

- (void)donateInteraction:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__CNUIInteractionDonor_donateInteraction___block_invoke;
  v3[3] = &unk_1EA602FF8;
  v3[4] = self;
  objc_msgSend(a3, "donateInteractionWithCompletion:", v3);
}

void __42__CNUIInteractionDonor_donateInteraction___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42__CNUIInteractionDonor_donateInteraction___block_invoke_cold_1((uint64_t)v2, v3);

  }
}

void __42__CNUIInteractionDonor_donateInteraction___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DD140000, a2, OS_LOG_TYPE_ERROR, "error donating interaction: %@", (uint8_t *)&v2, 0xCu);
}

@end
