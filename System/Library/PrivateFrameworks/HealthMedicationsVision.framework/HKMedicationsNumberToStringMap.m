@implementation HKMedicationsNumberToStringMap

- (HKMedicationsNumberToStringMap)init
{
  HKMedicationsNumberToStringMap *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMedicationsNumberToStringMap;
  v2 = -[HKMedicationsNumberToStringMap init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    storage = v2->_storage;
    v2->_storage = v3;

  }
  return v2;
}

- (id)stringForKey:(int64_t)a3
{
  NSMutableDictionary *storage;
  void *v4;
  void *v5;

  storage = self->_storage;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](storage, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setString:(id)a3 forKey:(int64_t)a4
{
  NSMutableDictionary *storage;
  void *v6;
  id v7;
  id v8;

  storage = self->_storage;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](storage, "setObject:forKeyedSubscript:", v7, v8);

}

- (int64_t)count
{
  return -[NSMutableDictionary count](self->_storage, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
