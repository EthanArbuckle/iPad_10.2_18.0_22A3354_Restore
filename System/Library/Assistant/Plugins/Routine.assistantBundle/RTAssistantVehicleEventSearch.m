@implementation RTAssistantVehicleEventSearch

- (OS_dispatch_queue)queue
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;

  queue = self->_queue;
  if (!queue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coreroutine.assistant", 0);
    v5 = self->_queue;
    self->_queue = v4;

    queue = self->_queue;
  }
  return queue;
}

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

- (GEOLocationShifter)locationShifter
{
  GEOLocationShifter *locationShifter;
  GEOLocationShifter *v4;
  GEOLocationShifter *v5;

  locationShifter = self->_locationShifter;
  if (!locationShifter)
  {
    v4 = (GEOLocationShifter *)objc_opt_new();
    v5 = self->_locationShifter;
    self->_locationShifter = v4;

    locationShifter = self->_locationShifter;
  }
  return locationShifter;
}

- (void)performWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  sub_22793DEC4(qword_255903520);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22793B000, v5, OS_LOG_TYPE_INFO, "Received vehicle event search command.", buf, 2u);
  }

  -[RTAssistantVehicleEventSearch routineManager](self, "routineManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_22793D318;
  v8[3] = &unk_24F00BEF0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "fetchLastVehicleEventsWithHandler:", v8);

}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setRoutineManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineManager, a3);
}

- (void)setLocationShifter:(id)a3
{
  objc_storeStrong((id *)&self->_locationShifter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
