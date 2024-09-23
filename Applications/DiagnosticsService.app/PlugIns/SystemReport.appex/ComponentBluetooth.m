@implementation ComponentBluetooth

- (BOOL)isPresent
{
  return findDeviceWithName("bluetooth") || findDeviceWithName("marconi-bt");
}

- (void)populateAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ComponentBluetooth bluetoothAddress](self, "bluetoothAddress"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("bluetoothAddress"));

}

- (id)bluetoothAddress
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MGCopyAnswer(CFSTR("BluetoothAddress"), 0);
  v3 = stringOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

@end
