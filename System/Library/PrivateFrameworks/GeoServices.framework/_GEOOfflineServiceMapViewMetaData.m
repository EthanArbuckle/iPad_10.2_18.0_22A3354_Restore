@implementation _GEOOfflineServiceMapViewMetaData

- (_GEOOfflineServiceMapViewMetaData)init
{
  _GEOOfflineServiceMapViewMetaData *v2;
  _GEOOfflineServiceMapViewMetaData *v3;
  _GEOOfflineServiceMapViewMetaData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GEOOfflineServiceMapViewMetaData;
  v2 = -[_GEOOfflineServiceMapViewMetaData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->priority = 2.22507386e-308;
    v2->state = 0;
    v2->_viewPort.center = ($AB5116BA7E623E054F959CECB034F4E7)kGEOCoordinateRegionInvalid_0;
    v2->_viewPort.span = ($2AEA816EAF9616B0E64737FB4BB06332)unk_189CD4170;
    v2->_lastUpdated = 2.22507386e-308;
    v4 = v2;
  }

  return v3;
}

@end
