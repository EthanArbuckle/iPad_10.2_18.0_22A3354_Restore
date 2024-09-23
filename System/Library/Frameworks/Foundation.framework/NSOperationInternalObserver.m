@implementation NSOperationInternalObserver

void __111____NSOperationInternalObserver__observeValueForKeyPath_ofObject_changeKind_oldValue_newValue_indexes_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 224));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 48);
  v4 = v3 < 1;
  v5 = v3 - 1;
  if (!v4)
    *(_QWORD *)(v2 + 48) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 224));
}

void __111____NSOperationInternalObserver__observeValueForKeyPath_ofObject_changeKind_oldValue_newValue_indexes_context___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
