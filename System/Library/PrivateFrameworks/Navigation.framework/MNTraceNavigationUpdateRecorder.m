@implementation MNTraceNavigationUpdateRecorder

- (MNTraceNavigationUpdateRecorder)initWithTraceRecorder:(id)a3
{
  id v5;
  MNTraceNavigationUpdateRecorder *v6;
  MNTraceNavigationUpdateRecorder *v7;
  objc_super v9;

  v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)MNTraceNavigationUpdateRecorder,
        v6 = -[MNTraceNavigationUpdateRecorder init](&v9, sel_init),
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_traceRecorder, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_recordRouteChangeWithRouteInfo:(id)a3 reason:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  MNTraceRecorder *traceRecorder;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  MNTraceRecorder *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v6 = a3;
  v23 = v6;
  if (a4 == 12)
  {
    objc_msgSend(v6, "route");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeInitializerData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    traceRecorder = self->_traceRecorder;
    objc_msgSend(v8, "directionsRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "directionsResponse");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "waypoints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTraceRecorder timeSinceRecordingBegan](self->_traceRecorder, "timeSinceRecordingBegan");
    v14 = v13;
    -[MNTraceRecorder timeSinceRecordingBegan](self->_traceRecorder, "timeSinceRecordingBegan");
    -[MNTraceRecorder recordDirectionsRequest:response:error:waypoints:selectedRouteIndex:requestTimestamp:responseTimestamp:](traceRecorder, "recordDirectionsRequest:response:error:waypoints:selectedRouteIndex:requestTimestamp:responseTimestamp:", v10, v11, 0, v12, 0, v14, v15);

    v6 = v23;
  }
  v16 = self->_traceRecorder;
  objc_msgSend(v6, "route");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "indexInResponse");
  objc_msgSend(v23, "route");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "directionsResponseID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "route");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "etauResponseID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTraceRecorder recordRouteChangeWithIndex:directionsResponseID:etauResponseID:rerouteReason:](v16, "recordRouteChangeWithIndex:directionsResponseID:etauResponseID:rerouteReason:", v18, v20, v22, a4);

}

- (void)navigationSession:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  -[MNTraceRecorder recordDepartWaypoint:legIndex:departureReason:](self->_traceRecorder, "recordDepartWaypoint:legIndex:departureReason:", a4, a5, a6);
}

- (void)navigationSession:(id)a3 didReroute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  -[MNTraceNavigationUpdateRecorder _recordRouteChangeWithRouteInfo:reason:](self, "_recordRouteChangeWithRouteInfo:reason:", a4, a7, a5, a6);
}

- (void)navigationSession:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 rerouteReason:(unint64_t)a6
{
  -[MNTraceNavigationUpdateRecorder _recordRouteChangeWithRouteInfo:reason:](self, "_recordRouteChangeWithRouteInfo:reason:", a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceRecorder, 0);
}

@end
