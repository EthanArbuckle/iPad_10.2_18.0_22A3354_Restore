@implementation ARRemoteGeoTrackingTechnique

- (ARRemoteGeoTrackingTechnique)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARRemoteGeoTrackingTechnique;
  return -[ARRemoteTechnique initWithServiceName:](&v3, sel_initWithServiceName_, CFSTR("com.apple.arkit.service.geoTracking"));
}

- (ARRemoteGeoTrackingTechnique)initWithServerConnection:(id)a3
{
  id v4;
  ARRemoteGeoTrackingTechnique *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARRemoteGeoTrackingTechnique;
  v5 = -[ARRemoteTechnique initWithServerConnection:](&v9, sel_initWithServerConnection_, v4);
  if (v5)
  {
    ARRemoteTechniqueClientInterfaceWithProtocol((uint64_t)&unk_1EF0AB548);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedInterface:", v6);

    ARRemoteTechniqueServiceInterfaceWithProtocol((uint64_t)&unk_1EF0AB5A8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v7);

  }
  return v5;
}

- (BOOL)reconfigurableFrom:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (void)reconfigureFrom:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  id v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  ARRemoteGeoTrackingTechnique *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_ARLogTechnique_onceToken_21 != -1)
    dispatch_once(&_ARLogTechnique_onceToken_21, &__block_literal_global_123);
  v5 = (void *)_ARLogTechnique_logObj_21;
  if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_21, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reconfiguring existing remote geo tracking technique.", (uint8_t *)&v11, 0x16u);

  }
  v9 = v4;
  objc_msgSend(v9, "visualLocalizationCallInterval");
  -[ARRemoteGeoTrackingTechnique setVisualLocalizationCallInterval:](self, "setVisualLocalizationCallInterval:");
  objc_msgSend(v9, "posteriorVisualLocalizationCallInterval");
  -[ARRemoteGeoTrackingTechnique setPosteriorVisualLocalizationCallInterval:](self, "setPosteriorVisualLocalizationCallInterval:");
  objc_msgSend(v9, "visualLocalizationCallIntervalTimeThreshold");
  -[ARRemoteGeoTrackingTechnique setVisualLocalizationCallIntervalTimeThreshold:](self, "setVisualLocalizationCallIntervalTimeThreshold:");
  v10 = objc_msgSend(v9, "visualLocalizationUpdatesRequested");

  -[ARRemoteGeoTrackingTechnique setVisualLocalizationUpdatesRequested:](self, "setVisualLocalizationUpdatesRequested:", v10);
}

- (__n128)getLocationFromWorldPosition:(__n128 *)a3@<X8> error:(__n128)a4@<Q0>
{
  void *v7;
  void *v8;
  __n128 result;
  __n128 v10;
  __n128 v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  __n128 v19;
  uint64_t v20;
  __n128 *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a4;
  v20 = 0;
  v21 = (__n128 *)&v20;
  v22 = 0x4020000000;
  v23 = 0u;
  v24 = 0u;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v19, 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serviceProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__ARRemoteGeoTrackingTechnique_getLocationFromWorldPosition_error___block_invoke;
  v12[3] = &unk_1E6675E98;
  v12[4] = &v20;
  v12[5] = &v13;
  objc_msgSend(v8, "getLocationFromWorldPosition:reply:", v7, v12);

  if (a2)
    *a2 = objc_retainAutorelease((id)v14[5]);
  v10 = v21[3];
  v11 = v21[2];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v20, 8);
  result = v11;
  *a3 = v11;
  a3[1] = v10;
  return result;
}

void __67__ARRemoteGeoTrackingTechnique_getLocationFromWorldPosition_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _OWORD v10[2];

  v5 = a3;
  ARVector3dFromNSData(a2, v10);
  v6 = v10[1];
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v7 + 32) = v10[0];
  *(_OWORD *)(v7 + 48) = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

- (unint64_t)requiredSensorDataTypes
{
  return 79;
}

- (void)setVisualLocalizationCallInterval:(double)a3
{
  id v4;

  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisualLocalizationCallInterval:", a3);

}

- (double)visualLocalizationCallInterval
{
  void *v2;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__ARRemoteGeoTrackingTechnique_visualLocalizationCallInterval__block_invoke;
  v5[3] = &unk_1E66742F0;
  v5[4] = &v6;
  objc_msgSend(v2, "visualLocalizationCallIntervalWithReply:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__ARRemoteGeoTrackingTechnique_visualLocalizationCallInterval__block_invoke(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setPosteriorVisualLocalizationCallInterval:(double)a3
{
  id v4;

  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosteriorVisualLocalizationCallInterval:", a3);

}

- (double)posteriorVisualLocalizationCallInterval
{
  void *v2;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__ARRemoteGeoTrackingTechnique_posteriorVisualLocalizationCallInterval__block_invoke;
  v5[3] = &unk_1E66742F0;
  v5[4] = &v6;
  objc_msgSend(v2, "posteriorVisualLocalizationCallIntervalWithReply:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __71__ARRemoteGeoTrackingTechnique_posteriorVisualLocalizationCallInterval__block_invoke(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setVisualLocalizationCallIntervalTimeThreshold:(double)a3
{
  id v4;

  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisualLocalizationCallIntervalTimeThreshold:", a3);

}

- (double)visualLocalizationCallIntervalTimeThreshold
{
  void *v2;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__ARRemoteGeoTrackingTechnique_visualLocalizationCallIntervalTimeThreshold__block_invoke;
  v5[3] = &unk_1E66742F0;
  v5[4] = &v6;
  objc_msgSend(v2, "visualLocalizationCallIntervalTimeThresholdWithReply:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __75__ARRemoteGeoTrackingTechnique_visualLocalizationCallIntervalTimeThreshold__block_invoke(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setVisualLocalizationUpdatesRequested:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisualLocalizationUpdatesRequested:", v3);

}

- (BOOL)visualLocalizationUpdatesRequested
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__ARRemoteGeoTrackingTechnique_visualLocalizationUpdatesRequested__block_invoke;
  v4[3] = &unk_1E6674250;
  v4[4] = &v5;
  objc_msgSend(v2, "visualLocalizationUpdatesRequestedWithReply:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __66__ARRemoteGeoTrackingTechnique_visualLocalizationUpdatesRequested__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setSupportEnablementOptions:(unint64_t)a3
{
  id v4;

  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportEnablementOptions:", a3);

}

- (unint64_t)supportEnablementOptions
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__ARRemoteGeoTrackingTechnique_supportEnablementOptions__block_invoke;
  v5[3] = &unk_1E66742C8;
  v5[4] = &v6;
  objc_msgSend(v2, "supportEnablementOptionsWithReply:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__ARRemoteGeoTrackingTechnique_supportEnablementOptions__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end
