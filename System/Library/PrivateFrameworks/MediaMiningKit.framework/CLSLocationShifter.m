@implementation CLSLocationShifter

- (CLSLocationShifter)init
{
  CLSLocationShifter *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *locationShiftQueue;
  GEOLocationShifter *v7;
  GEOLocationShifter *locationShifter;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLSLocationShifter;
  v2 = -[CLSLocationShifter init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("Shifter queue", v4);
    locationShiftQueue = v2->_locationShiftQueue;
    v2->_locationShiftQueue = (OS_dispatch_queue *)v5;

    v7 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x1E0D27178]);
    locationShifter = v2->_locationShifter;
    v2->_locationShifter = v7;

  }
  return v2;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)shiftedCoordinateForOriginalCoordinate:(id)a3
{
  double var1;
  double var0;
  CLSLocationShifter *v6;
  dispatch_semaphore_t v7;
  GEOLocationShifter *locationShifter;
  uint64_t v9;
  NSObject *v10;
  double v11;
  double v12;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  double v16;
  double v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[2];
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  var1 = a3.var1;
  var0 = a3.var0;
  if (objc_msgSend(MEMORY[0x1E0D27178], "isLocationShiftRequiredForCoordinate:"))
  {
    v6 = self;
    objc_sync_enter(v6);
    v21 = 0;
    v22 = (double *)&v21;
    v23 = 0x3010000000;
    v25[0] = 0;
    v25[1] = 0;
    v24 = &unk_1CABF4247;
    if ((-[GEOLocationShifter shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:](v6->_locationShifter, "shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:", v25, 0, var0, var1, 0.0) & 1) == 0)
    {
      v7 = dispatch_semaphore_create(0);
      locationShifter = v6->_locationShifter;
      v9 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __61__CLSLocationShifter_shiftedCoordinateForOriginalCoordinate___block_invoke;
      v18[3] = &unk_1E84F80E8;
      v20 = &v21;
      v19 = v7;
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __61__CLSLocationShifter_shiftedCoordinateForOriginalCoordinate___block_invoke_2;
      v13[3] = &unk_1E84F8110;
      v15 = &v21;
      v16 = var0;
      v17 = var1;
      v10 = v19;
      v14 = v10;
      -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](locationShifter, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v18, 0, v13, v6->_locationShiftQueue, var0, var1, 0.0);
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

    }
    var0 = v22[4];
    var1 = v22[5];
    _Block_object_dispose(&v21, 8);
    objc_sync_exit(v6);

  }
  v11 = var0;
  v12 = var1;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (OS_dispatch_queue)locationShiftQueue
{
  return self->_locationShiftQueue;
}

- (GEOLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_locationShiftQueue, 0);
}

intptr_t __61__CLSLocationShifter_shiftedCoordinateForOriginalCoordinate___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(double *)(v3 + 32) = a2;
  *(double *)(v3 + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __61__CLSLocationShifter_shiftedCoordinateForOriginalCoordinate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_error_impl(&dword_1CAB79000, v5, OS_LOG_TYPE_ERROR, "Shifted location error:%@", (uint8_t *)&v6, 0xCu);
  }

  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = *(_OWORD *)(a1 + 48);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)sharedLocationShifter
{
  if (sharedLocationShifter_onceToken != -1)
    dispatch_once(&sharedLocationShifter_onceToken, &__block_literal_global_2097);
  return (id)sharedLocationShifter_sharedLocationShifter;
}

+ (BOOL)isLocationShiftRequiredForCoordinate:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D27178], "isLocationShiftRequiredForCoordinate:", a3.var0, a3.var1);
}

void __43__CLSLocationShifter_sharedLocationShifter__block_invoke()
{
  CLSLocationShifter *v0;
  void *v1;

  v0 = objc_alloc_init(CLSLocationShifter);
  v1 = (void *)sharedLocationShifter_sharedLocationShifter;
  sharedLocationShifter_sharedLocationShifter = (uint64_t)v0;

}

@end
