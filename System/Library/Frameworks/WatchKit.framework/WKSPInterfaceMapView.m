@implementation WKSPInterfaceMapView

- (void)setCurrentLocation
{
  -[WKSPInterfaceObject _sendValueChanged:](self, "_sendValueChanged:", 0);
}

- (void)setEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKSPInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("enabled"));

}

@end
