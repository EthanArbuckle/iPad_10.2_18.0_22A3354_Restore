@implementation RTAssistantVehicleEventCreate

- (RTRoutineManager)routineManager
{
  RTRoutineManager *routineManager;
  RTRoutineManager *v4;
  RTRoutineManager *v5;

  routineManager = self->_routineManager;
  if (!routineManager)
  {
    v4 = (RTRoutineManager *)objc_opt_new();
    v5 = self->_routineManager;
    self->_routineManager = v4;

    routineManager = self->_routineManager;
  }
  return routineManager;
}

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  CLLocationDegrees v19;
  void *v20;
  void *v21;
  CLLocationDegrees v22;
  CLLocationCoordinate2D v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;

  v4 = a3;
  -[SALocalSearchVehicleEventCreate location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SALocalSearchVehicleEventCreate location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latitude");
    v33 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
    -[SALocalSearchVehicleEventCreate location](self, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "longitude");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    if (objc_msgSend(MEMORY[0x24BE3CC28], "isLocationShiftRequiredForCoordinate:", v9, v13))
      v14 = 2;
    else
      v14 = 1;
    v15 = objc_alloc(MEMORY[0x24BDBFA80]);
    -[SALocalSearchVehicleEventCreate location](self, "location");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "latitude");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;
    -[SALocalSearchVehicleEventCreate location](self, "location");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "longitude");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = CLLocationCoordinate2DMake(v19, v22);
    -[SALocalSearchVehicleEventCreate location](self, "location");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "accuracy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v15, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v28, v14, v23.latitude, v23.longitude, 0.0, v27, -1.0);

    v4 = v33;
  }
  else
  {
    v29 = 0;
  }
  -[RTAssistantVehicleEventCreate routineManager](self, "routineManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SALocalSearchVehicleEventCreate notes](self, "notes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_22793CE64;
  v34[3] = &unk_24F00BE00;
  v35 = v4;
  v32 = v4;
  objc_msgSend(v30, "vehicleEventAtLocation:notes:handler:", v29, v31, v34);

}

- (void)setRoutineManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
}

@end
