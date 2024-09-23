@implementation SGHKHealthStore

- (SGHKHealthStore)init
{
  SGHKHealthStore *v2;
  void *v3;
  id v4;
  uint64_t v5;
  HKHealthStore *healthStore;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)SGHKHealthStore;
  v2 = -[SGHKHealthStore init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getHKHealthStoreClass_softClass;
    v13 = getHKHealthStoreClass_softClass;
    if (!getHKHealthStoreClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getHKHealthStoreClass_block_invoke;
      v9[3] = &unk_1E7DB7220;
      v9[4] = &v10;
      __getHKHealthStoreClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = objc_opt_new();
    healthStore = v2->_healthStore;
    v2->_healthStore = (HKHealthStore *)v5;

  }
  return v2;
}

- (id)dateOfBirthComponentsWithError:(id *)a3
{
  return -[HKHealthStore dateOfBirthComponentsWithError:](self->_healthStore, "dateOfBirthComponentsWithError:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
