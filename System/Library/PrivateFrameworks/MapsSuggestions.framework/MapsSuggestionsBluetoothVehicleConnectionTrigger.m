@implementation MapsSuggestionsBluetoothVehicleConnectionTrigger

- (id)initFireOnConnect:(BOOL)a3 disconnect:(BOOL)a4 exit:(BOOL)a5
{
  id result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsBluetoothVehicleConnectionTrigger;
  result = -[MapsSuggestionsBaseTrigger initWithName:](&v9, sel_initWithName_, CFSTR("MapsSuggestionsBluetoothVehicleConnectionTrigger"));
  if (result)
  {
    *((_BYTE *)result + 32) = a5;
    *((_BYTE *)result + 33) = a3;
    *((_BYTE *)result + 34) = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[MapsSuggestionsBluetoothVehicleConnectionTrigger didRemoveLastObserver](self, "didRemoveLastObserver");
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsBluetoothVehicleConnectionTrigger;
  -[MapsSuggestionsBluetoothVehicleConnectionTrigger dealloc](&v3, sel_dealloc);
}

- (void)didRemoveLastObserver
{
  MapsSuggestionsDarwinNotificationTrigger *btDisconnectTrigger;
  MapsSuggestionsDarwinNotificationTrigger *btConnectTrigger;
  MapsSuggestionsDarwinNotificationTrigger *btExitTrigger;

  btDisconnectTrigger = self->_btDisconnectTrigger;
  self->_btDisconnectTrigger = 0;

  btConnectTrigger = self->_btConnectTrigger;
  self->_btConnectTrigger = 0;

  btExitTrigger = self->_btExitTrigger;
  self->_btExitTrigger = 0;

}

- (void)didAddFirstObserver
{
  MapsSuggestionsDarwinNotificationTrigger *v3;
  MapsSuggestionsDarwinNotificationTrigger *btDisconnectTrigger;
  MapsSuggestionsDarwinNotificationTrigger *v5;
  MapsSuggestionsDarwinNotificationTrigger *btConnectTrigger;
  MapsSuggestionsDarwinNotificationTrigger *v7;
  MapsSuggestionsDarwinNotificationTrigger *btExitTrigger;

  if (self->_onDisconnect)
  {
    v3 = -[MapsSuggestionsDarwinNotificationTrigger initWithNotificationName:]([MapsSuggestionsDarwinNotificationTrigger alloc], "initWithNotificationName:", "com.apple.locationd.vehicle.disconnected");
    btDisconnectTrigger = self->_btDisconnectTrigger;
    self->_btDisconnectTrigger = v3;

    -[MapsSuggestionsBaseTrigger registerObserver:](self->_btDisconnectTrigger, "registerObserver:", self);
  }
  if (self->_onConnect)
  {
    v5 = -[MapsSuggestionsDarwinNotificationTrigger initWithNotificationName:]([MapsSuggestionsDarwinNotificationTrigger alloc], "initWithNotificationName:", "com.apple.locationd.vehicle.connected");
    btConnectTrigger = self->_btConnectTrigger;
    self->_btConnectTrigger = v5;

    -[MapsSuggestionsBaseTrigger registerObserver:](self->_btConnectTrigger, "registerObserver:", self);
  }
  if (self->_onExit)
  {
    v7 = -[MapsSuggestionsDarwinNotificationTrigger initWithNotificationName:]([MapsSuggestionsDarwinNotificationTrigger alloc], "initWithNotificationName:", "com.apple.locationd.vehicle.exit");
    btExitTrigger = self->_btExitTrigger;
    self->_btExitTrigger = v7;

    -[MapsSuggestionsBaseTrigger registerObserver:](self->_btExitTrigger, "registerObserver:", self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btConnectTrigger, 0);
  objc_storeStrong((id *)&self->_btExitTrigger, 0);
  objc_storeStrong((id *)&self->_btDisconnectTrigger, 0);
}

@end
