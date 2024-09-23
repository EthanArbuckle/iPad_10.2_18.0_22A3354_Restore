@implementation DSDTOManager

+ (void)protectUserLocationOnWebDuringDTO
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2278DF000, log, OS_LOG_TYPE_ERROR, "DTO Location Protection: Does not respondToSelector disableLocationDisplayWithCompletion", v1, 2u);
}

void __49__DSDTOManager_protectUserLocationOnWebDuringDTO__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  v3 = DSLog_1;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)DSLog_1, OS_LOG_TYPE_ERROR))
      __49__DSDTOManager_protectUserLocationOnWebDuringDTO__block_invoke_cold_1((uint64_t)v2, v3);
  }
  else if (os_log_type_enabled((os_log_t)DSLog_1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2278DF000, v3, OS_LOG_TYPE_INFO, "DTO Location Protection: disableLocationDisplay succeeded", v4, 2u);
  }

}

+ (void)isRatchetActiveWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__DSDTOManager_isRatchetActiveWithCompletion___block_invoke;
  v6[3] = &unk_24EFF3A08;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "stateWithCompletion:", v6);

}

void __46__DSDTOManager_isRatchetActiveWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  if (objc_msgSend(v3, "rawValue"))
    v5 = objc_msgSend(v6, "rawValue") != 4;
  else
    v5 = 0;
  (*(void (**)(uint64_t, _BOOL8))(v4 + 16))(v4, v5);

}

void __49__DSDTOManager_protectUserLocationOnWebDuringDTO__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2278DF000, a2, OS_LOG_TYPE_ERROR, "DTO Location Protection: disableLocationDisplay failed with error - %@", (uint8_t *)&v2, 0xCu);
}

@end
