@implementation HFCharacteristicValueSet

- (HFCharacteristicValueSet)init
{
  HFCharacteristicValueSet *v2;
  uint64_t v3;
  NSMutableSet *allCharacteristics;
  uint64_t v5;
  NSMutableDictionary *valuesByCharacteristicUUID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFCharacteristicValueSet;
  v2 = -[HFCharacteristicValueSet init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    allCharacteristics = v2->_allCharacteristics;
    v2->_allCharacteristics = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    valuesByCharacteristicUUID = v2->_valuesByCharacteristicUUID;
    v2->_valuesByCharacteristicUUID = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)valueForCharacteristic:(id)a3
{
  NSMutableDictionary *valuesByCharacteristicUUID;
  void *v4;
  void *v5;

  valuesByCharacteristicUUID = self->_valuesByCharacteristicUUID;
  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](valuesByCharacteristicUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setValue:(id)a3 forCharacteristic:(id)a4
{
  NSMutableSet *allCharacteristics;
  id v7;
  id v8;
  NSMutableDictionary *valuesByCharacteristicUUID;
  id v10;

  allCharacteristics = self->_allCharacteristics;
  v7 = a4;
  v8 = a3;
  -[NSMutableSet addObject:](allCharacteristics, "addObject:", v7);
  valuesByCharacteristicUUID = self->_valuesByCharacteristicUUID;
  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](valuesByCharacteristicUUID, "setObject:forKeyedSubscript:", v8, v10);
}

- (void)removeValueForCharacteristic:(id)a3
{
  NSMutableDictionary *valuesByCharacteristicUUID;
  void *v5;
  id v6;

  valuesByCharacteristicUUID = self->_valuesByCharacteristicUUID;
  v6 = a3;
  objc_msgSend(v6, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](valuesByCharacteristicUUID, "removeObjectForKey:", v5);

  -[NSMutableSet removeObject:](self->_allCharacteristics, "removeObject:", v6);
}

- (NSSet)allCharacteristics
{
  return &self->_allCharacteristics->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuesByCharacteristicUUID, 0);
  objc_storeStrong((id *)&self->_allCharacteristics, 0);
}

@end
