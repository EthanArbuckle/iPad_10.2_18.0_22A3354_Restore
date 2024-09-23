@implementation HDMaintenanceWorkCoordinatorProtectedDatabaseOperation

void __65___HDMaintenanceWorkCoordinatorProtectedDatabaseOperation_cancel__block_invoke(uint64_t a1)
{
  -[HDMaintenanceOperation finish](*(_QWORD *)(a1 + 32));
}

void __63___HDMaintenanceWorkCoordinatorProtectedDatabaseOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  *(_QWORD *)(v2 + 96) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = 0;

  -[HDMaintenanceOperation finish](*(_QWORD *)(a1 + 32));
}

uint64_t __63___HDMaintenanceWorkCoordinatorProtectedDatabaseOperation_main__block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 16))();
  return 1;
}

@end
