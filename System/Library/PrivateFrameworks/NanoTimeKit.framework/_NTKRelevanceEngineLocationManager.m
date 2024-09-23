@implementation _NTKRelevanceEngineLocationManager

- (_NTKRelevanceEngineLocationManager)initWithLocationManager:(id)a3
{
  id v5;
  _NTKRelevanceEngineLocationManager *v6;
  _NTKRelevanceEngineLocationManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_NTKRelevanceEngineLocationManager;
  v6 = -[_NTKRelevanceEngineLocationManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_locationManager, a3);

  return v7;
}

- (id)currentLocation
{
  return -[NTKLocationManager currentLocation](self->_locationManager, "currentLocation");
}

- (void)startLocationUpdatesWithHandler:(id)a3
{
  id v4;
  NTKLocationManager *locationManager;
  id v6;
  NSString *v7;
  NSString *token;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (self->_token)
    -[_NTKRelevanceEngineLocationManager stopLocationUpdates](self, "stopLocationUpdates");
  locationManager = self->_locationManager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70___NTKRelevanceEngineLocationManager_startLocationUpdatesWithHandler___block_invoke;
  v9[3] = &unk_1E6BCD7A0;
  v10 = v4;
  v6 = v4;
  -[NTKLocationManager startLocationUpdatesWithIdentifier:handler:](locationManager, "startLocationUpdatesWithIdentifier:handler:", CFSTR("NTKRelevanceEngineLocationManagerIdentifier"), v9);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  token = self->_token;
  self->_token = v7;

}

- (void)stopLocationUpdates
{
  NSString *token;

  if (self->_token)
  {
    -[NTKLocationManager stopLocationUpdatesForToken:](self->_locationManager, "stopLocationUpdatesForToken:");
    token = self->_token;
    self->_token = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
