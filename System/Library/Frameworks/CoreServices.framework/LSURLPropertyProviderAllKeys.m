@implementation LSURLPropertyProviderAllKeys

void ___LSURLPropertyProviderAllKeys_block_invoke()
{
  _QWORD *v0;
  void *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id i;

  if (getPropertyTable(void)::onceToken != -1)
    dispatch_once(&getPropertyTable(void)::onceToken, &__block_literal_global_12_0);
  v0 = (_QWORD *)LaunchServices::URLPropertyProvider::propertyTable;
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v0[1] - *v0) >> 3));
  v2 = (_QWORD *)*v0;
  v3 = (_QWORD *)v0[1];
  for (i = v1; v2 != v3; v1 = i)
  {
    objc_msgSend(v1, "addObject:", *v2);
    v2 += 7;
  }
  v4 = objc_msgSend(v1, "copy");
  v5 = (void *)_LSURLPropertyProviderAllKeys::result;
  _LSURLPropertyProviderAllKeys::result = v4;

}

@end
