@implementation BKSExternalDefaults

- (BKSLockdownDefaults)lockdownDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BKSExternalDefaults_lockdownDefaults__block_invoke;
  block[3] = &unk_1E1EA15A8;
  block[4] = self;
  if (lockdownDefaults___once != -1)
    dispatch_once(&lockdownDefaults___once, block);
  return self->_lazy_lockdownDefaults;
}

- (BKSIAPDefaults)iapDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__BKSExternalDefaults_iapDefaults__block_invoke;
  block[3] = &unk_1E1EA15A8;
  block[4] = self;
  if (iapDefaults___once != -1)
    dispatch_once(&iapDefaults___once, block);
  return self->_lazy_iapDefaults;
}

- (BKSPersistentConnectionDefaults)persistentConnectionDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__BKSExternalDefaults_persistentConnectionDefaults__block_invoke;
  block[3] = &unk_1E1EA15A8;
  block[4] = self;
  if (persistentConnectionDefaults___once != -1)
    dispatch_once(&persistentConnectionDefaults___once, block);
  return self->_lazy_persistentConnectionDefaults;
}

- (BKSSpringBoardDefaults)springBoardDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__BKSExternalDefaults_springBoardDefaults__block_invoke;
  block[3] = &unk_1E1EA15A8;
  block[4] = self;
  if (springBoardDefaults___once != -1)
    dispatch_once(&springBoardDefaults___once, block);
  return self->_lazy_springBoardDefaults;
}

- (BKSKeyboardDefaults)keyboardDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BKSExternalDefaults_keyboardDefaults__block_invoke;
  block[3] = &unk_1E1EA15A8;
  block[4] = self;
  if (keyboardDefaults___once != -1)
    dispatch_once(&keyboardDefaults___once, block);
  return self->_lazy_keyboardDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazy_keyboardDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_springBoardDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_persistentConnectionDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_iapDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_lockdownDefaults, 0);
}

void __39__BKSExternalDefaults_keyboardDefaults__block_invoke(uint64_t a1)
{
  BKSKeyboardDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(BKSKeyboardDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __42__BKSExternalDefaults_springBoardDefaults__block_invoke(uint64_t a1)
{
  BKSSpringBoardDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(BKSSpringBoardDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

void __51__BKSExternalDefaults_persistentConnectionDefaults__block_invoke(uint64_t a1)
{
  BKSPersistentConnectionDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(BKSPersistentConnectionDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

void __34__BKSExternalDefaults_iapDefaults__block_invoke(uint64_t a1)
{
  BKSIAPDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(BKSIAPDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

void __39__BKSExternalDefaults_lockdownDefaults__block_invoke(uint64_t a1)
{
  BKSLockdownDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(BKSLockdownDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

@end
