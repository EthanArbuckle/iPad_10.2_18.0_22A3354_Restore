@implementation PHASERoomSimulationView

- (PHASERoomSimulationView)initWithEngine:(id)a3
{
  id v4;
  PHASERoomSimulationView *v5;
  objc_super v7;

  v4 = a3;
  if (!v4)
    __assert_rtn("-[PHASERoomSimulationView initWithEngine:]", "PHASERoomSimulationView.mm", 318, "engine");
  v7.receiver = self;
  v7.super_class = (Class)PHASERoomSimulationView;
  v5 = -[PHASERoomSimulationView init](&v7, sel_init);
  objc_storeWeak((id *)&v5->_engine, v4);

  return v5;
}

- (void)beginTrackingRayTraceIntersections:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[3];
  _QWORD *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "geoEntityHandle");
  v9 = _Block_copy(v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v11 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v12 = objc_msgSend(v6, "geoEntityHandle");
  v15[0] = &off_24D57F800;
  v15[1] = v8;
  v15[2] = _Block_copy(v9);
  v16 = v15;
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v11 + 408))(v11, v12, v15);
  v13 = v16;
  if (v16 == v15)
  {
    v14 = 4;
    v13 = v15;
    goto LABEL_5;
  }
  if (v16)
  {
    v14 = 5;
LABEL_5:
    (*(void (**)(void))(*v13 + 8 * v14))();
  }

}

- (void)endTrackingRayTraceIntersections:(id)a3
{
  id v4;
  id v5;
  PHASEEngine **p_engine;
  id WeakRetained;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
    __assert_rtn("-[PHASERoomSimulationView endTrackingRayTraceIntersections:]", "PHASERoomSimulationView.mm", 342, "listener");
  objc_msgSend(v4, "engine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine))
    __assert_rtn("-[PHASERoomSimulationView endTrackingRayTraceIntersections:]", "PHASERoomSimulationView.mm", 343, "listener.engine == _engine");

  WeakRetained = objc_loadWeakRetained((id *)p_engine);
  v8 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v8 + 416))(v8, objc_msgSend(v9, "geoEntityHandle"));

}

- (void)beginTrackingEnergyHistogram:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[3];
  _QWORD *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "geoEntityHandle");
  v9 = _Block_copy(v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v11 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v12 = objc_msgSend(v6, "geoEntityHandle");
  v15[0] = &off_24D57F848;
  v15[1] = v8;
  v15[2] = _Block_copy(v9);
  v16 = v15;
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v11 + 432))(v11, v12, v15);
  v13 = v16;
  if (v16 == v15)
  {
    v14 = 4;
    v13 = v15;
    goto LABEL_5;
  }
  if (v16)
  {
    v14 = 5;
LABEL_5:
    (*(void (**)(void))(*v13 + 8 * v14))();
  }

}

- (void)endTrackingEnergyHistogram:(id)a3
{
  id v4;
  id v5;
  PHASEEngine **p_engine;
  id WeakRetained;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
    __assert_rtn("-[PHASERoomSimulationView endTrackingEnergyHistogram:]", "PHASERoomSimulationView.mm", 365, "listener");
  objc_msgSend(v4, "engine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine))
    __assert_rtn("-[PHASERoomSimulationView endTrackingEnergyHistogram:]", "PHASERoomSimulationView.mm", 366, "listener.engine == _engine");

  WeakRetained = objc_loadWeakRetained((id *)p_engine);
  v8 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v8 + 440))(v8, objc_msgSend(v9, "geoEntityHandle"));

}

- (void)beginTrackingImageSourceLocations:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[3];
  _QWORD *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "geoEntityHandle");
  v9 = _Block_copy(v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v11 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v12 = objc_msgSend(v6, "geoEntityHandle");
  v15[0] = &off_24D57F890;
  v15[1] = v8;
  v15[2] = _Block_copy(v9);
  v16 = v15;
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v11 + 456))(v11, v12, v15);
  v13 = v16;
  if (v16 == v15)
  {
    v14 = 4;
    v13 = v15;
    goto LABEL_5;
  }
  if (v16)
  {
    v14 = 5;
LABEL_5:
    (*(void (**)(void))(*v13 + 8 * v14))();
  }

}

- (void)endTrackingImageSourceLocations:(id)a3
{
  id v4;
  id v5;
  PHASEEngine **p_engine;
  id WeakRetained;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
    __assert_rtn("-[PHASERoomSimulationView endTrackingImageSourceLocations:]", "PHASERoomSimulationView.mm", 388, "source");
  objc_msgSend(v4, "engine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine))
    __assert_rtn("-[PHASERoomSimulationView endTrackingImageSourceLocations:]", "PHASERoomSimulationView.mm", 389, "source.engine == _engine");

  WeakRetained = objc_loadWeakRetained((id *)p_engine);
  v8 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v8 + 464))(v8, objc_msgSend(v9, "geoEntityHandle"));

}

- (void)beginTrackingListenerEarlyResponseMetadata:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[3];
  _QWORD *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "geoEntityHandle");
  v9 = _Block_copy(v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v11 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v12 = objc_msgSend(v6, "geoEntityHandle");
  v15[0] = &off_24D57F8D8;
  v15[1] = v8;
  v15[2] = _Block_copy(v9);
  v16 = v15;
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v11 + 480))(v11, v12, v15);
  v13 = v16;
  if (v16 == v15)
  {
    v14 = 4;
    v13 = v15;
    goto LABEL_5;
  }
  if (v16)
  {
    v14 = 5;
LABEL_5:
    (*(void (**)(void))(*v13 + 8 * v14))();
  }

}

- (void)endTrackingListenerEarlyResponseMetadata:(id)a3
{
  id v4;
  id v5;
  PHASEEngine **p_engine;
  id WeakRetained;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
    __assert_rtn("-[PHASERoomSimulationView endTrackingListenerEarlyResponseMetadata:]", "PHASERoomSimulationView.mm", 411, "entity");
  objc_msgSend(v4, "engine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine))
    __assert_rtn("-[PHASERoomSimulationView endTrackingListenerEarlyResponseMetadata:]", "PHASERoomSimulationView.mm", 412, "entity.engine == _engine");

  WeakRetained = objc_loadWeakRetained((id *)p_engine);
  v8 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v8 + 488))(v8, objc_msgSend(v9, "geoEntityHandle"));

}

- (void)beginTrackingListenerLateReverbMetadata:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[3];
  _QWORD *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "geoEntityHandle");
  v9 = _Block_copy(v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v11 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v12 = objc_msgSend(v6, "geoEntityHandle");
  v15[0] = &off_24D57F920;
  v15[1] = v8;
  v15[2] = _Block_copy(v9);
  v16 = v15;
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v11 + 504))(v11, v12, v15);
  v13 = v16;
  if (v16 == v15)
  {
    v14 = 4;
    v13 = v15;
    goto LABEL_5;
  }
  if (v16)
  {
    v14 = 5;
LABEL_5:
    (*(void (**)(void))(*v13 + 8 * v14))();
  }

}

- (void)endTrackingListenerLateReverbMetadata:(id)a3
{
  id v4;
  id v5;
  PHASEEngine **p_engine;
  id WeakRetained;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
    __assert_rtn("-[PHASERoomSimulationView endTrackingListenerLateReverbMetadata:]", "PHASERoomSimulationView.mm", 434, "entity");
  objc_msgSend(v4, "engine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine))
    __assert_rtn("-[PHASERoomSimulationView endTrackingListenerLateReverbMetadata:]", "PHASERoomSimulationView.mm", 435, "entity.engine == _engine");

  WeakRetained = objc_loadWeakRetained((id *)p_engine);
  v8 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v8 + 512))(v8, objc_msgSend(v9, "geoEntityHandle"));

}

- (void)beginTrackingRoomData:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[3];
  _QWORD *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = _Block_copy(a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v9 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v10 = objc_msgSend(v6, "geoEntityHandle");
  v11 = v6;
  v14[0] = &off_24D57F968;
  v14[1] = v11;
  v14[2] = _Block_copy(v7);
  v15 = v14;
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v9 + 528))(v9, v10, v14);
  v12 = v15;
  if (v15 == v14)
  {
    v13 = 4;
    v12 = v14;
    goto LABEL_5;
  }
  if (v15)
  {
    v13 = 5;
LABEL_5:
    (*(void (**)(void))(*v12 + 8 * v13))();
  }

}

- (void)endTrackingRoomData:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (!v6)
    __assert_rtn("-[PHASERoomSimulationView endTrackingRoomData:]", "PHASERoomSimulationView.mm", 455, "nullptr != entity");
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v5 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 536))(v5, objc_msgSend(v6, "geoEntityHandle"));

}

- (void)setTailcorrectionEnabled:(unint64_t)a3
{
  RuntimeDebugParameters *p_runtimeDebugParameters;
  id WeakRetained;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[3];
  uint64_t v8;

  self->_runtimeDebugParameters.mTailcorrectionEnabled = a3 != 0;
  p_runtimeDebugParameters = &self->_runtimeDebugParameters;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v5 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v6 = *(_OWORD *)&p_runtimeDebugParameters->mLateReverbRayTraceComputeTimeLimit;
  v7[0] = *(_OWORD *)&p_runtimeDebugParameters->mTailcorrectionEnabled;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&p_runtimeDebugParameters->mRayTraceIntersectionHandleCounter;
  v8 = *(_QWORD *)&p_runtimeDebugParameters->mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v5 + 544))(v5, v7);

}

- (void)setImageSourceOrder:(unint64_t)a3
{
  id WeakRetained;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[3];
  uint64_t v8;

  self->_runtimeDebugParameters.mImageSourceOrder = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v5 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v7[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  v8 = *(_QWORD *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v5 + 544))(v5, v7);

}

- (void)setEarlyReflectionsRayTraceComputeTimeLimit:(float)a3
{
  id WeakRetained;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[3];
  uint64_t v8;

  self->_runtimeDebugParameters.mEarlyReflectionsRayTraceComputeTimeLimit = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v5 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v7[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  v8 = *(_QWORD *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v5 + 544))(v5, v7);

}

- (void)setLateReverbRayTraceComputeTimeLimit:(float)a3
{
  id WeakRetained;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[3];
  uint64_t v8;

  self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v5 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v7[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  v8 = *(_QWORD *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v5 + 544))(v5, v7);

}

- (void)setEarlyScatteringEnabled:(unint64_t)a3
{
  id WeakRetained;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[3];
  uint64_t v8;

  self->_runtimeDebugParameters.mEarlyScatteringEnabled = a3 != 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v5 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v7[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  v8 = *(_QWORD *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v5 + 544))(v5, v7);

}

- (void)setEarlyReflectionsAggregationCoef:(float)a3
{
  id WeakRetained;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[3];
  uint64_t v8;

  self->_runtimeDebugParameters.mEarlyReflectionsAggregationCoef = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v5 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v7[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  v8 = *(_QWORD *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v5 + 544))(v5, v7);

}

- (void)setEarlyScatteringAggregationCoef:(float)a3
{
  id WeakRetained;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[3];
  uint64_t v8;

  self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v5 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v7[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  v8 = *(_QWORD *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v5 + 544))(v5, v7);

}

- (void)setLateReverbAggregationCoef:(float)a3
{
  id WeakRetained;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[3];
  uint64_t v8;

  self->_runtimeDebugParameters.mLateReverbAggregationCoef = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v5 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v7[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  v8 = *(_QWORD *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v5 + 544))(v5, v7);

}

- (void)setRayTraceIntersectionHandleCountLimit:(unint64_t)a3
{
  id WeakRetained;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[3];
  uint64_t v8;

  self->_runtimeDebugParameters.mRayTraceIntersectionHandleCountLimit = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v5 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v7[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  v8 = *(_QWORD *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v5 + 544))(v5, v7);

}

- (PHASEEngine)engine
{
  return (PHASEEngine *)objc_loadWeakRetained((id *)&self->_engine);
}

- (void)setEngine:(id)a3
{
  objc_storeWeak((id *)&self->_engine, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 1;
  *((_QWORD *)self + 2) = 2;
  *((_QWORD *)self + 3) = 0x3C03126F3C23D70ALL;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_BYTE *)self + 48) = 0;
  *(int32x2_t *)((char *)self + 52) = vdup_n_s32(0x3F51EB85u);
  *((_DWORD *)self + 15) = 1049918178;
  return self;
}

- (uint64_t)beginTrackingRayTraceIntersections:callback:
{

  return a1;
}

- (void)beginTrackingRayTraceIntersections:callback:
{
  uint64_t v2;
  PHASERoomSimulationDataSet *v4;

  v2 = *a2;
  if (!*a2)
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 329, "nullptr != inView");
  if (*(_QWORD *)(a1 + 8) != *(_QWORD *)(v2 + 16))
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 330, "handle == inView->mListener");
  v4 = -[PHASERoomSimulationDataSet initWithRoomSimulationDebugView:]([PHASERoomSimulationDataSet alloc], "initWithRoomSimulationDebugView:", v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();

}

- (_QWORD)beginTrackingRayTraceIntersections:callback:
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;

  v2 = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(const void **)(a1 + 16);
  *v2 = &off_24D57F800;
  v2[1] = v4;
  v2[2] = _Block_copy(v3);
  return v2;
}

- (uint64_t)beginTrackingEnergyHistogram:callback:
{

  return a1;
}

- (void)beginTrackingEnergyHistogram:callback:
{
  uint64_t v2;
  PHASERoomSimulationDataSet *v4;

  v2 = *a2;
  if (!*a2)
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 352, "nullptr != inView");
  if (*(_QWORD *)(a1 + 8) != *(_QWORD *)(v2 + 16))
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 353, "handle == inView->mListener");
  v4 = -[PHASERoomSimulationDataSet initWithRoomSimulationDebugView:]([PHASERoomSimulationDataSet alloc], "initWithRoomSimulationDebugView:", v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();

}

- (_QWORD)beginTrackingEnergyHistogram:callback:
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;

  v2 = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(const void **)(a1 + 16);
  *v2 = &off_24D57F848;
  v2[1] = v4;
  v2[2] = _Block_copy(v3);
  return v2;
}

- (uint64_t)beginTrackingImageSourceLocations:callback:
{

  return a1;
}

- (void)beginTrackingImageSourceLocations:callback:
{
  uint64_t v2;
  PHASERoomSimulationDataSet *v4;

  v2 = *a2;
  if (!*a2)
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 375, "nullptr != inView");
  if (*(_QWORD *)(a1 + 8) != *(_QWORD *)(v2 + 8))
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 376, "handle == inView->mSource");
  v4 = -[PHASERoomSimulationDataSet initWithRoomSimulationDebugView:]([PHASERoomSimulationDataSet alloc], "initWithRoomSimulationDebugView:", v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();

}

- (_QWORD)beginTrackingImageSourceLocations:callback:
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;

  v2 = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(const void **)(a1 + 16);
  *v2 = &off_24D57F890;
  v2[1] = v4;
  v2[2] = _Block_copy(v3);
  return v2;
}

- (uint64_t)beginTrackingListenerEarlyResponseMetadata:callback:
{

  return a1;
}

- (void)beginTrackingListenerEarlyResponseMetadata:callback:
{
  uint64_t v2;
  PHASERoomSimulationDataSet *v4;

  v2 = *a2;
  if (!*a2)
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 398, "nullptr != inView");
  if (*(_QWORD *)(a1 + 8) != *(_QWORD *)(v2 + 16))
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 399, "handle == inView->mListener");
  v4 = -[PHASERoomSimulationDataSet initWithRoomSimulationDebugView:]([PHASERoomSimulationDataSet alloc], "initWithRoomSimulationDebugView:", v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();

}

- (_QWORD)beginTrackingListenerEarlyResponseMetadata:callback:
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;

  v2 = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(const void **)(a1 + 16);
  *v2 = &off_24D57F8D8;
  v2[1] = v4;
  v2[2] = _Block_copy(v3);
  return v2;
}

- (uint64_t)beginTrackingListenerLateReverbMetadata:callback:
{

  return a1;
}

- (void)beginTrackingListenerLateReverbMetadata:callback:
{
  uint64_t v2;
  PHASERoomSimulationDataSet *v4;

  v2 = *a2;
  if (!*a2)
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 421, "nullptr != inView");
  if (*(_QWORD *)(a1 + 8) != *(_QWORD *)(v2 + 16))
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 422, "handle == inView->mListener");
  v4 = -[PHASERoomSimulationDataSet initWithRoomSimulationDebugView:]([PHASERoomSimulationDataSet alloc], "initWithRoomSimulationDebugView:", v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();

}

- (_QWORD)beginTrackingListenerLateReverbMetadata:callback:
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;

  v2 = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(const void **)(a1 + 16);
  *v2 = &off_24D57F920;
  v2[1] = v4;
  v2[2] = _Block_copy(v3);
  return v2;
}

- (uint64_t)beginTrackingRoomData:callback:
{

  return a1;
}

- (void)beginTrackingRoomData:callback:
{
  PHASERoomSimulationDataSet *v3;

  if (!*a2)
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 443, "nullptr != inView");
  if (!*(_QWORD *)(a1 + 8))
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 444, "nullptr != entity");
  v3 = -[PHASERoomSimulationDataSet initWithRoomSimulationDebugView:]([PHASERoomSimulationDataSet alloc], "initWithRoomSimulationDebugView:", *a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();

}

- (_QWORD)beginTrackingRoomData:callback:
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  *v2 = &off_24D57F968;
  v2[1] = *(id *)(a1 + 8);
  v2[2] = _Block_copy(*(const void **)(a1 + 16));
  return v2;
}

@end
