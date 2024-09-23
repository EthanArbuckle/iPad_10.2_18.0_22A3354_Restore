@implementation ATXAVRoutingSessionHelper

- (ATXAVRoutingSessionHelper)init
{
  double v2;

  LODWORD(v2) = 0;
  return -[ATXAVRoutingSessionHelper initWithAcceptThreshold:avRoutingSessionManager:](self, "initWithAcceptThreshold:avRoutingSessionManager:", 0, v2);
}

- (ATXAVRoutingSessionHelper)initWithAcceptThreshold:(float)a3 avRoutingSessionManager:(id)a4
{
  id v6;
  ATXAVRoutingSessionHelper *v7;
  ATXAVRoutingSessionHelper *v8;
  AVRoutingSessionManager *v9;
  AVRoutingSessionManager *avRoutingSessionManager;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXAVRoutingSessionHelper;
  v7 = -[ATXAVRoutingSessionHelper init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_threshold = a3;
    if (v6)
    {
      v9 = (AVRoutingSessionManager *)v6;
    }
    else
    {
      objc_msgSend(ATXAVFoundationRoutingSessionManager(), "longFormVideoRoutingSessionManager");
      v9 = (AVRoutingSessionManager *)objc_claimAutoreleasedReturnValue();
    }
    avRoutingSessionManager = v8->_avRoutingSessionManager;
    v8->_avRoutingSessionManager = v9;

  }
  return v8;
}

- (ATXAVRouteInfo)predictedRouteInfo
{
  ATXAVRouteInfo *internalPredictedRouteInfo;
  float threshold;
  uint64_t v5;
  double v6;
  ATXAVRouteInfo *v7;
  ATXAVRouteInfo *v8;

  internalPredictedRouteInfo = self->_internalPredictedRouteInfo;
  if (!internalPredictedRouteInfo)
  {
    threshold = self->_threshold;
    v5 = -[AVRoutingSessionManager prefersLikelyDestinationsOverCurrentRoutingSession](self->_avRoutingSessionManager, "prefersLikelyDestinationsOverCurrentRoutingSession");
    *(float *)&v6 = threshold;
    -[ATXAVRoutingSessionHelper _predictedRouteInfoWithAcceptThreshold:prefersLikelyDestinationsOverCurrentRoutingSession:](self, "_predictedRouteInfoWithAcceptThreshold:prefersLikelyDestinationsOverCurrentRoutingSession:", v5, v6);
    v7 = (ATXAVRouteInfo *)objc_claimAutoreleasedReturnValue();
    v8 = self->_internalPredictedRouteInfo;
    self->_internalPredictedRouteInfo = v7;

    internalPredictedRouteInfo = self->_internalPredictedRouteInfo;
  }
  return internalPredictedRouteInfo;
}

- (float)acceptThreshod
{
  return self->_threshold;
}

- (id)_predictedRouteInfoWithAcceptThreshold:(float)a3 prefersLikelyDestinationsOverCurrentRoutingSession:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;

  v4 = a4;
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ATXAVRoutingSessionHelper _predictedRouteInfoWithAcceptThreshold:prefersLikelyDestinationsOverCurrentRoutingSession:].cold.1(v4, v7);

  if (v4)
  {
    *(float *)&v8 = a3;
    -[ATXAVRoutingSessionHelper _predictedRouteWithAcceptThreshold:](self, "_predictedRouteWithAcceptThreshold:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[ATXAVRoutingSessionHelper _selectedOrPendingRoute](self, "_selectedOrPendingRoute");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = (void *)v10;
    }
  }
  else
  {
    -[ATXAVRoutingSessionHelper _selectedOrPendingRoute](self, "_selectedOrPendingRoute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      *(float *)&v11 = a3;
      -[ATXAVRoutingSessionHelper _predictedRouteWithAcceptThreshold:](self, "_predictedRouteWithAcceptThreshold:", v11);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  -[ATXAVRoutingSessionHelper _atxAVRouteInfoWithRoute:](self, "_atxAVRouteInfoWithRoute:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_predictedRouteWithAcceptThreshold:(float)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;

  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ATXAVRoutingSessionHelper _predictedRouteWithAcceptThreshold:].cold.1(v5, a3, v6, v7);

  -[AVRoutingSessionManager allLikelyDestinations](self->_avRoutingSessionManager, "allLikelyDestinations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = a3;
  -[ATXAVRoutingSessionHelper _filterTopRouteFromRoutes:withAcceptThreshold:](self, "_filterTopRouteFromRoutes:withAcceptThreshold:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_selectedOrPendingRoute
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  -[AVRoutingSessionManager currentRoutingSession](self->_avRoutingSessionManager, "currentRoutingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "destination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[ATXAVRoutingSessionHelper _selectedOrPendingRoute].cold.1(v3, v5);

      objc_msgSend(v3, "destination");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_filterTopRouteFromRoutes:(id)a3 withAcceptThreshold:(float)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  float v9;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "probability");
    v8 = 0;
    if (v9 > a4)
      v8 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_atxAVRouteInfoWithRoute:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  ATXAVRouteInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "outputDeviceDescriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ATXAVFoundationOutputDevice();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      v8 = 0;
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deviceID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_11;
        v8 = 0;
        if (!objc_msgSend(v10, "length") || !v12)
          goto LABEL_12;
        if (objc_msgSend(v12, "length"))
          v8 = -[ATXAVRouteInfo initWithDeviceName:deviceID:isExternalRoute:]([ATXAVRouteInfo alloc], "initWithDeviceName:deviceID:isExternalRoute:", v10, v12, objc_msgSend(v4, "providesExternalVideoPlayback"));
        else
LABEL_11:
          v8 = 0;
LABEL_12:

      }
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_14;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalPredictedRouteInfo, 0);
  objc_storeStrong((id *)&self->_avRoutingSessionManager, 0);
}

- (void)_predictedRouteInfoWithAcceptThreshold:(char)a1 prefersLikelyDestinationsOverCurrentRoutingSession:(NSObject *)a2 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_DEBUG, "Prefer predicted route over current seesion route: %{BOOL}d", (uint8_t *)v2, 8u);
}

- (void)_predictedRouteWithAcceptThreshold:(uint64_t)a3 .cold.1(NSObject *a1, float a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = a2;
  OUTLINED_FUNCTION_0_16(&dword_1A49EF000, a1, a4, "Find predicted route with accept threshold: %fd", (uint8_t *)&v4);
}

- (void)_selectedOrPendingRoute
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputDeviceDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_16(&dword_1A49EF000, a2, v5, "Found selected / pending route: %@", (uint8_t *)&v6);

}

@end
