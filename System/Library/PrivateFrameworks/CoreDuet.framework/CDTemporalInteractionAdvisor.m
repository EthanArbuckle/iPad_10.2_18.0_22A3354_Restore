@implementation CDTemporalInteractionAdvisor

void __47___CDTemporalInteractionAdvisor_initWithStore___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateConsumerModel");

}

void __55___CDTemporalInteractionAdvisor_setConsumerToModelMap___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

@end
