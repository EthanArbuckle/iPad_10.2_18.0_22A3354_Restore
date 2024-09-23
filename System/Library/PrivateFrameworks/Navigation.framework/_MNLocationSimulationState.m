@implementation _MNLocationSimulationState

- (int64_t)type
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Must be implemented by subclasses.", v3, 2u);
  }
  return 0;
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Must be implemented by subclasses.", v4, 2u);
  }
  return 0;
}

- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  _MNLocationSimulationState_ProceedingToStartOfLeg *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_MNLocationSimulationState data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "simulationType") == 2)
  {

  }
  else
  {
    -[_MNLocationSimulationState data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "simulationType");

    if (v8 != 4)
      goto LABEL_16;
  }
  -[_MNLocationSimulationData lastLocation](self->_data, "lastLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinate");

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v5, "route", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "legs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    v15 = 1.79769313e308;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v16);
        objc_msgSend(v5, "route");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "pointAtRouteCoordinate:", objc_msgSend(v17, "startRouteCoordinate"));

        GEOCalculateDistance();
        if (v19 < v15)
        {
          v20 = v19;
          v21 = objc_msgSend(v17, "legIndex");
          -[_MNLocationSimulationState data](self, "data");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setCurrentLegIndex:", v21);

          v15 = v20;
        }
        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v13);
  }

  MNGetMNNavigationSimulationLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[_MNLocationSimulationState data](self, "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "currentLegIndex");
    *(_DWORD *)buf = 67109120;
    v33 = v25;
    _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_DEFAULT, "Proceeding to start of leg %d of new route.", buf, 8u);

  }
  -[_MNLocationSimulationState delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(_MNLocationSimulationState_ProceedingToStartOfLeg);
  objc_msgSend(v26, "changeState:", v27);

LABEL_16:
}

- (id)_locationWithCoordinate:(id)a3 course:(double)a4 speed:(double)a5
{
  double var2;
  double var1;
  double var0;
  void *v10;
  int v11;
  int v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  CFAbsoluteTime Current;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  -[_MNLocationSimulationState data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isChinaShifted"))
    v11 = 2;
  else
    v11 = 1;

  v13 = 1;
  v14 = var0;
  v15 = var1;
  v16 = 0x4014000000000000;
  v17 = var2;
  v18 = 0x3FF0000000000000;
  v19 = a5;
  v20 = 0;
  v21 = a4;
  v22 = 0x4024000000000000;
  Current = CFAbsoluteTimeGetCurrent();
  v24 = 0;
  v25 = 0x100000000;
  v26 = var0;
  v27 = var1;
  v28 = a4;
  v29 = 0;
  v30 = v11;
  v31 = v11;
  v33 = 0;
  v32 = 0;
  return -[MNLocation initWithClientLocation:]([MNLocation alloc], "initWithClientLocation:", &v13);
}

- (id)_followRouteStateWithStartRouteCoordinate:(id)a3
{
  void *v4;
  uint64_t v5;
  __objc2_class **v6;

  -[_MNLocationSimulationState data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "simulationType");

  v6 = &off_1E61CF398;
  if (v5 != 4)
    v6 = off_1E61CF390;
  return (id)objc_msgSend(objc_alloc(*v6), "initWithStartRouteCoordinate:", a3);
}

- ($1AB5FA073B851C12C2339EC22442E995)_projectedCoordinateOffRouteFrom:(id)a3 toCoordinate:(id)a4 overTimeDelta:(double)a5 outCourse:(double *)a6 outSpeed:(double *)a7
{
  double var0;
  double var2;
  double v9;
  double v10;
  double var1;
  double v12;
  double v13;
  double v17;
  double v18;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  $1AB5FA073B851C12C2339EC22442E995 result;

  var0 = a4.var0;
  var2 = a3.var2;
  v9 = -180.0;
  v10 = 1.79769313e308;
  if (a3.var1 < -180.0 || (var1 = a3.var1, v12 = a3.var0, a3.var1 > 180.0) || a3.var0 < -90.0)
  {
    v13 = -180.0;
    goto LABEL_16;
  }
  v36 = var2;
  v13 = -180.0;
  if (a3.var0 <= 90.0)
  {
    v17 = a4.var2;
    v18 = a4.var1;
    -[_MNLocationSimulationState data](self, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "speedOverride");
    v22 = v21;

    v23 = 5.0;
    if (v22 >= 0.0)
    {
      -[_MNLocationSimulationState data](self, "data");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "speedOverride");
      v23 = v25;

    }
    if (a7)
      *a7 = v23;
    v26 = v23 * a5;
    GEOCalculateDistance();
    if (v26 <= v27)
    {
      v28 = v26 / v27;
      v13 = v12 + (var0 - v12) * v28;
      v9 = var1 + (v18 - var1) * v28;
      if (a6)
      {
        GEOCalculateDistance();
        if (v29 >= 0.000001)
        {
          -[_MNLocationSimulationState _courseFromCoordinate:toCoordinate:](self, "_courseFromCoordinate:toCoordinate:", v12, var1, v36, var0, v18, v17);
          *(_QWORD *)a6 = v33;
          v10 = v36;
          goto LABEL_16;
        }
        -[_MNLocationSimulationState data](self, "data");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lastLocation");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "course");
        *(_QWORD *)a6 = v32;

      }
      v10 = v36;
    }
    else
    {
      v10 = v17;
      v9 = v18;
      v13 = var0;
    }
  }
LABEL_16:
  v34 = v13;
  v35 = v9;
  result.var2 = v10;
  result.var1 = v35;
  result.var0 = v34;
  return result;
}

- (double)_courseFromCoordinate:(id)a3 toCoordinate:(id)a4
{
  double result;

  GEOBearingFromCoordinateToCoordinate();
  for (; result < 0.0; result = result + 360.0)
    ;
  for (; result >= 360.0; result = result + -360.0)
    ;
  return result;
}

- (_MNLocationSimulationStateDelegate)delegate
{
  return (_MNLocationSimulationStateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_MNLocationSimulationData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
