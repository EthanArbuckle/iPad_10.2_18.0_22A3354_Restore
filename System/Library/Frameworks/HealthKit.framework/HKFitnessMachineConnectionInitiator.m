@implementation HKFitnessMachineConnectionInitiator

void __60___HKFitnessMachineConnectionInitiator_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "registerClientIfNeeded");

}

uint64_t __62___HKFitnessMachineConnectionInitiator_registerClientIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_registerConnectionInitiatorClient:", *(_QWORD *)(a1 + 32));
}

uint64_t __98___HKFitnessMachineConnectionInitiator_permitConnectionForFitnessMachineSessionUUID_activityType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_permitConnectionForFitnessMachineSessionUUID:activityType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __85___HKFitnessMachineConnectionInitiator_forbidConnectionForFitnessMachineSessionUUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_forbidConnectionForFitnessMachineSessionUUID:", *(_QWORD *)(a1 + 32));
}

void __63___HKFitnessMachineConnectionInitiator__fetchProxyWithHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectionInitiator:failedWithError:", *(_QWORD *)(a1 + 32), v4);

}

uint64_t __75___HKFitnessMachineConnectionInitiator__simulateTapWithFitnessMachineType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_simulateTapWithFitnessMachineType:", *(_QWORD *)(a1 + 32));
}

uint64_t __55___HKFitnessMachineConnectionInitiator__simulateAccept__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_simulateAccept");
}

@end
