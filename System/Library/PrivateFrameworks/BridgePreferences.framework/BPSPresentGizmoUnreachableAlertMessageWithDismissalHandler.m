@implementation BPSPresentGizmoUnreachableAlertMessageWithDismissalHandler

uint64_t ___BPSPresentGizmoUnreachableAlertMessageWithDismissalHandler_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  bps_utility_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21147E000, v2, OS_LOG_TYPE_DEFAULT, "BPS presented 'transport became unreachable' alert- button pressed", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t ___BPSPresentGizmoUnreachableAlertMessageWithDismissalHandler_block_invoke_524(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  bps_utility_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21147E000, v2, OS_LOG_TYPE_DEFAULT, "Transition completed. Presenting 'transport became unreachable' alert", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

@end
