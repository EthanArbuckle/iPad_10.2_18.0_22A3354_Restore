@implementation NSObject

uint64_t __76__NSObject_NSObject_KVOBlock__addOneShotKVOBlockForKeyPath_options_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removeKVOBlockForToken:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

@end
