@implementation RTRoutineManagerExportedObject

- (RTRoutineManagerExportedObject)initWithRoutineManager:(id)a3
{
  id v4;
  RTRoutineManagerExportedObject *v5;
  RTRoutineManagerExportedObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RTRoutineManagerExportedObject;
  v5 = -[RTRoutineManagerExportedObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_routineManager, v4);

  return v6;
}

- (void)onVisit:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[RTRoutineManagerExportedObject routineManager](self, "routineManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onVisit:withError:", v7, v6);

}

- (void)onLeechedVisit:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[RTRoutineManagerExportedObject routineManager](self, "routineManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onLeechedVisit:withError:", v7, v6);

}

- (void)onLeechedLowConfidenceVisit:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[RTRoutineManagerExportedObject routineManager](self, "routineManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onLeechedLowConfidenceVisit:withError:", v7, v6);

}

- (void)onPlaceInferences:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[RTRoutineManagerExportedObject routineManager](self, "routineManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onPlaceInferences:error:", v7, v6);

}

- (void)onScenarioTrigger:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[RTRoutineManagerExportedObject routineManager](self, "routineManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onScenarioTrigger:withError:", v7, v6);

}

- (void)onVehicleEvents:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[RTRoutineManagerExportedObject routineManager](self, "routineManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onVehicleEvents:error:", v7, v6);

}

- (void)onDensityUpdate:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[RTRoutineManagerExportedObject routineManager](self, "routineManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onDensityUpdate:error:", v7, v6);

}

- (RTRoutineManager)routineManager
{
  return (RTRoutineManager *)objc_loadWeakRetained((id *)&self->_routineManager);
}

- (void)setRoutineManager:(id)a3
{
  objc_storeWeak((id *)&self->_routineManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_routineManager);
}

@end
