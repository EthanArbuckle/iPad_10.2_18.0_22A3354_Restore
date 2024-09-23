@implementation CAFDimensionManager

- (CAFDimensionManager)initWithCar:(id)a3
{
  id v4;
  CAFDimensionManager *v5;
  uint64_t v6;
  NSLocale *locale;
  uint64_t v8;
  CARObserverHashTable *observers;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAFDimensionManager;
  v5 = -[CAFDimensionManager init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE15228]), "initWithProtocol:", &unk_25682B9D8);
    observers = v5->_observers;
    v5->_observers = (CARObserverHashTable *)v8;

    objc_storeWeak((id *)&v5->_car, v4);
    objc_initWeak(&location, v5);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BDBCA70];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __35__CAFDimensionManager_initWithCar___block_invoke;
    v15[3] = &unk_2508FD2A8;
    objc_copyWeak(&v16, &location);
    v13 = (id)objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v12, 0, v11, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __35__CAFDimensionManager_initWithCar___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentLocaleChanged");

}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFDimensionManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFDimensionManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (unint64_t)measurementSystem
{
  void *v2;
  unint64_t v3;

  -[CAFDimensionManager locale](self, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesMetricSystem") ^ 1;

  return v3;
}

- (NSUnitTemperature)unitTemperature
{
  void *v2;
  void *v3;
  char v4;

  -[CAFDimensionManager locale](self, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCB48]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDBCB50]);

  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x24BDD1950], "celsius");
  else
    objc_msgSend(MEMORY[0x24BDD1950], "fahrenheit");
  return (NSUnitTemperature *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSUnitPressure)tirePressureUnit
{
  if (-[CAFDimensionManager measurementSystem](self, "measurementSystem"))
    objc_msgSend(MEMORY[0x24BDD1940], "poundsForcePerSquareInch");
  else
    objc_msgSend(MEMORY[0x24BDD1940], "kilopascals");
  return (NSUnitPressure *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSUnitSpeed)vehicleSpeedUnit
{
  if (-[CAFDimensionManager measurementSystem](self, "measurementSystem"))
    objc_msgSend(MEMORY[0x24BDD1948], "milesPerHour");
  else
    objc_msgSend(MEMORY[0x24BDD1948], "kilometersPerHour");
  return (NSUnitSpeed *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSUnitLength)vehicleRangeUnit
{
  if (-[CAFDimensionManager measurementSystem](self, "measurementSystem"))
    objc_msgSend(MEMORY[0x24BDD1928], "miles");
  else
    objc_msgSend(MEMORY[0x24BDD1928], "kilometers");
  return (NSUnitLength *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSUnitFuelEfficiency)vehicleFuelEfficiencyUnit
{
  if (-[CAFDimensionManager measurementSystem](self, "measurementSystem"))
    objc_msgSend(MEMORY[0x24BDD1910], "milesPerGallon");
  else
    objc_msgSend(MEMORY[0x24BDD1910], "litersPer100Kilometers");
  return (NSUnitFuelEfficiency *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSUnitPower)vehicleChargePowerUnit
{
  return (NSUnitPower *)objc_msgSend(MEMORY[0x24BDD1938], "kilowatts");
}

- (void)invalidate
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_237717000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ time to invalidate", (uint8_t *)&v2, 0xCu);
}

- (void)currentLocaleChanged
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[CAFDimensionManager locale](self, "locale");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFDimensionManager setLocale:](self, "setLocale:", v3);
  v4 = objc_msgSend(v22, "usesMetricSystem");
  v5 = v4 ^ objc_msgSend(v3, "usesMetricSystem");
  if (v5 == 1)
  {
    -[CAFDimensionManager observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dimensionManager:didUpdateMeasurementSystem:", self, -[CAFDimensionManager measurementSystem](self, "measurementSystem"));

    -[CAFDimensionManager observers](self, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFDimensionManager tirePressureUnit](self, "tirePressureUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dimensionManager:didUpdateTirePressureUnit:", self, v8);

    -[CAFDimensionManager observers](self, "observers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFDimensionManager vehicleSpeedUnit](self, "vehicleSpeedUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dimensionManager:didUpdateVehicleSpeedUnit:", self, v10);

    -[CAFDimensionManager observers](self, "observers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFDimensionManager vehicleRangeUnit](self, "vehicleRangeUnit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dimensionManager:didUpdateVehicleRangeUnit:", self, v12);

    -[CAFDimensionManager observers](self, "observers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFDimensionManager vehicleFuelEfficiencyUnit](self, "vehicleFuelEfficiencyUnit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dimensionManager:didUpdateVehicleFuelEfficiencyUnit:", self, v14);

  }
  v15 = *MEMORY[0x24BDBCB48];
  objc_msgSend(v22, "objectForKey:", *MEMORY[0x24BDBCB48]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x24BDBCB50];
  v18 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDBCB50]);

  objc_msgSend(v3, "objectForKey:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v19, "isEqualToString:", v17);

  if (v18 != (_DWORD)v16)
  {
    -[CAFDimensionManager observers](self, "observers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFDimensionManager unitTemperature](self, "unitTemperature");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dimensionManager:didUpdateTemperatureUnit:", self, v21);

LABEL_7:
    goto LABEL_8;
  }
  if ((v5 & 1) == 0)
  {
    -[CAFDimensionManager observers](self, "observers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dimensionManager:didUpdateLocale:", self, self->_locale);
    goto LABEL_7;
  }
LABEL_8:

}

- (id)observableCache
{
  return self->_observableCache;
}

- (void)setObservableCache:(id)a3
{
  objc_storeStrong(&self->_observableCache, a3);
}

- (CAFCar)car
{
  return (CAFCar *)objc_loadWeakRetained((id *)&self->_car);
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_destroyWeak((id *)&self->_car);
  objc_storeStrong(&self->_observableCache, 0);
}

@end
