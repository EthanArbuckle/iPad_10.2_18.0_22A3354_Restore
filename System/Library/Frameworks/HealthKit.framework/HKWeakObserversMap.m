@implementation HKWeakObserversMap

void __52___HKWeakObserversMap_notifyObserversOfKey_handler___block_invoke(_QWORD *a1)
{
  int v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  objc_msgSend(*(id *)(a1[4] + 16), "objectsForKey:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "containsObject:", a1[6]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  if (v2)
    (*(void (**)(void))(a1[7] + 16))();

}

@end
