@implementation _HKMedicalIDData(SOSContactManager)

- (uint64_t)consolidateSOSAndEmergencyContacts
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) != 3)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5300];
    v8 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
      return v8;
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_1D7813000, v9, OS_LOG_TYPE_DEFAULT, "Contacts access not authorized, skipping SOS contact consolidation", (uint8_t *)v11, 2u);
    return 0;
  }
  if (!getSOSUtilitiesClass() || (objc_msgSend(getSOSUtilitiesClass(), "isAllowedToMessageSOSContacts") & 1) != 0)
    return 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v2 = (void *)getSOSContactsManagerClass_softClass;
  v15 = getSOSContactsManagerClass_softClass;
  if (!getSOSContactsManagerClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getSOSContactsManagerClass_block_invoke;
    v11[3] = &unk_1E9C3FDF8;
    v11[4] = &v12;
    __getSOSContactsManagerClass_block_invoke((uint64_t)v11);
    v2 = (void *)v13[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v12, 8);
  v4 = objc_alloc_init(v3);
  if (!v4)
    return 0;
  v5 = v4;
  objc_msgSend(a1, "consolidatedSOSContactsWithSOSContactsManager:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(a1, "setEmergencyContacts:", v7);
  v8 = 1;
  objc_msgSend(getSOSUtilitiesClass(), "setAllowedToMessageSOSContacts:", 1);

  return v8;
}

@end
