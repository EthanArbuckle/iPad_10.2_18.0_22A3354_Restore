@implementation MapsSuggestionsRealRoutineConnector

- (MapsSuggestionsRealRoutineConnector)init
{
  MapsSuggestionsRealRoutineConnector *v2;
  RTRoutineManager *v3;
  RTRoutineManager *routineManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsSuggestionsRealRoutineConnector;
  v2 = -[MapsSuggestionsRealRoutineConnector init](&v6, sel_init);
  if (v2)
  {
    v3 = (RTRoutineManager *)objc_alloc_init(MEMORY[0x1E0D18460]);
    routineManager = v2->_routineManager;
    v2->_routineManager = v3;

  }
  return v2;
}

- (void)fetchNextPLOIsFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  RTRoutineManager *routineManager;
  id v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  kdebug_trace();
  routineManager = self->_routineManager;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __101__MapsSuggestionsRealRoutineConnector_fetchNextPLOIsFromLocation_startDate_timeInterval_withHandler___block_invoke;
  v15[3] = &unk_1E4BCDE70;
  v16 = v10;
  v14 = v10;
  -[RTRoutineManager fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:](routineManager, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:", v12, v11, v15, a5);

}

void __101__MapsSuggestionsRealRoutineConnector_fetchNextPLOIsFromLocation_startDate_timeInterval_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchLocationsOfInterestOfType:(int64_t)a3 withHandler:(id)a4
{
  -[RTRoutineManager fetchLocationsOfInterestOfType:withHandler:](self->_routineManager, "fetchLocationsOfInterestOfType:withHandler:", a3, a4);
}

- (void)fetchLocationsOfInterestVisitedSinceDate:(id)a3 withHandler:(id)a4
{
  -[RTRoutineManager fetchLocationsOfInterestVisitedSinceDate:withHandler:](self->_routineManager, "fetchLocationsOfInterestVisitedSinceDate:withHandler:", a3, a4);
}

- (void)fetchLocationOfInterestWithIdentifier:(id)a3 withHandler:(id)a4
{
  -[RTRoutineManager fetchLocationOfInterestWithIdentifier:withHandler:](self->_routineManager, "fetchLocationOfInterestWithIdentifier:withHandler:", a3, a4);
}

- (void)fetchLocationOfInterestAtLocation:(id)a3 withHandler:(id)a4
{
  -[RTRoutineManager fetchLocationOfInterestAtLocation:withHandler:](self->_routineManager, "fetchLocationOfInterestAtLocation:withHandler:", a3, a4);
}

- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 withHandler:(id)a5
{
  -[RTRoutineManager fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:](self->_routineManager, "fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:", a4, a5, a3);
}

- (void)fetchRoutineModeFromLocation:(id)a3 withHandler:(id)a4
{
  -[RTRoutineManager fetchRoutineModeFromLocation:withHandler:](self->_routineManager, "fetchRoutineModeFromLocation:withHandler:", a3, a4);
}

- (void)fetchStoredVisitsWithOptions:(id)a3 handler:(id)a4
{
  -[RTRoutineManager fetchStoredVisitsWithOptions:handler:](self->_routineManager, "fetchStoredVisitsWithOptions:handler:", a3, a4);
}

- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 withHandler:(id)a5
{
  -[RTRoutineManager fetchPredictedExitDatesFromLocation:onDate:withHandler:](self->_routineManager, "fetchPredictedExitDatesFromLocation:onDate:withHandler:", a3, a4, a5);
}

- (void)startMonitoringVehicleEventsWithHandler:(id)a3
{
  -[RTRoutineManager startMonitoringVehicleEventsWithHandler:](self->_routineManager, "startMonitoringVehicleEventsWithHandler:", a3);
}

- (void)stopMonitoringVehicleEvents
{
  -[RTRoutineManager stopMonitoringVehicleEvents](self->_routineManager, "stopMonitoringVehicleEvents");
}

- (void)clearAllVehicleEventsWithHandler:(id)a3
{
  -[RTRoutineManager clearAllVehicleEventsWithHandler:](self->_routineManager, "clearAllVehicleEventsWithHandler:", a3);
}

- (void)removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  -[RTRoutineManager removeLocationOfInterestWithIdentifier:handler:](self->_routineManager, "removeLocationOfInterestWithIdentifier:handler:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
}

@end
