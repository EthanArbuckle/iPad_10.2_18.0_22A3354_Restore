@implementation RTAssistantVehicleEventDelete

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
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[RTAssistantVehicleEventDelete routineManager](self, "routineManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22793DE40;
  v7[3] = &unk_24F00BF18;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "clearAllVehicleEventsWithHandler:", v7);

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
