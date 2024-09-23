@implementation HKMedicationsNumberToNumberMap

- (HKMedicationsNumberToNumberMap)init
{
  HKMedicationsNumberToNumberMap *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMedicationsNumberToNumberMap;
  v2 = -[HKMedicationsNumberToNumberMap init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    storage = v2->_storage;
    v2->_storage = v3;

  }
  return v2;
}

- (int64_t)integerForKey:(int64_t)a3
{
  NSMutableDictionary *storage;
  void *v4;
  void *v5;
  int64_t v6;

  storage = self->_storage;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](storage, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (void)setInteger:(int64_t)a3 forKey:(int64_t)a4
{
  NSMutableDictionary *storage;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  storage = self->_storage;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](storage, "setObject:forKeyedSubscript:", v8, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
