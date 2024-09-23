@implementation _MKURLBuilder

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 label:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForCoordinate:label:", a4, a3.latitude, a3.longitude);
}

- (id)initForSearch:(id)a3
{
  id v4;
  _MKURLBuilder *v5;
  uint64_t v6;
  GEOMapURLBuilder *realBuilder;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKURLBuilder;
  v5 = -[_MKURLBuilder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27228]), "initForSearch:", v4);
    realBuilder = v5->_realBuilder;
    v5->_realBuilder = (GEOMapURLBuilder *)v6;

  }
  return v5;
}

- (void)setNear:(CLLocationCoordinate2D)a3
{
  -[GEOMapURLBuilder setNear:](self->_realBuilder, "setNear:", a3.latitude, a3.longitude);
}

- (void)setSearchLocation:(CLLocationCoordinate2D)a3 span:(id)a4
{
  -[GEOMapURLBuilder setSearchLocation:span:](self->_realBuilder, "setSearchLocation:span:", a3.latitude, a3.longitude, a4.var0, a4.var1);
}

- (void)setSearchLocation:(CLLocationCoordinate2D)a3 zoomLevel:(double)a4
{
  -[GEOMapURLBuilder setSearchLocation:zoomLevel:](self->_realBuilder, "setSearchLocation:zoomLevel:", a3.latitude, a3.longitude, a4);
}

+ (id)URLForSearch:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForSearch:", a3);
}

+ (id)URLForSearch:(id)a3 near:(CLLocationCoordinate2D)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForSearch:near:", a3, a4.latitude, a4.longitude);
}

+ (id)URLForSearch:(id)a3 at:(CLLocationCoordinate2D)a4 span:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForSearch:at:span:", a3, a4.latitude, a4.longitude, a5.var0, a5.var1);
}

+ (id)URLForSearch:(id)a3 at:(CLLocationCoordinate2D)a4 zoomLevel:(double)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForSearch:at:zoomLevel:", a3, a4.latitude, a4.longitude, a5);
}

- (id)initForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5
{
  double longitude;
  double latitude;
  id v9;
  id v10;
  _MKURLBuilder *v11;
  uint64_t v12;
  GEOMapURLBuilder *realBuilder;
  objc_super v15;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MKURLBuilder;
  v11 = -[_MKURLBuilder init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27228]), "initForCoordinate:address:label:", v9, v10, latitude, longitude);
    realBuilder = v11->_realBuilder;
    v11->_realBuilder = (GEOMapURLBuilder *)v12;

  }
  return v11;
}

- (id)initForCoordinate:(CLLocationCoordinate2D)a3 label:(id)a4
{
  double longitude;
  double latitude;
  id v7;
  _MKURLBuilder *v8;
  uint64_t v9;
  GEOMapURLBuilder *realBuilder;
  objc_super v12;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MKURLBuilder;
  v8 = -[_MKURLBuilder init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27228]), "initForCoordinate:label:", v7, latitude, longitude);
    realBuilder = v8->_realBuilder;
    v8->_realBuilder = (GEOMapURLBuilder *)v9;

  }
  return v8;
}

- (id)initForAddress:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  _MKURLBuilder *v8;
  uint64_t v9;
  GEOMapURLBuilder *realBuilder;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MKURLBuilder;
  v8 = -[_MKURLBuilder init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27228]), "initForAddress:label:", v6, v7);
    realBuilder = v8->_realBuilder;
    v8->_realBuilder = (GEOMapURLBuilder *)v9;

  }
  return v8;
}

+ (id)URLForAddress:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForAddress:", a3);
}

- (void)setDisplayRegion:(id *)a3
{
  -[GEOMapURLBuilder setDisplayRegion:](self->_realBuilder, "setDisplayRegion:", a3);
}

+ (id)URLForAddress:(id)a3 label:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForAddress:label:", a3, a4);
}

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForCoordinate:", a3.latitude, a3.longitude);
}

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForCoordinate:address:label:", a4, a5, a3.latitude, a3.longitude);
}

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5 useWebPlaceCard:(BOOL)a6
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:", a4, a5, 0, a6, a3.latitude, a3.longitude);
}

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:", a4, a5, a6, 0, a3.latitude, a3.longitude);
}

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6 useWebPlaceCard:(BOOL)a7
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:", a4, a5, a6, a7, a3.latitude, a3.longitude);
}

+ (id)URLForCoordinate:(CLLocationCoordinate2D)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6 useWebPlaceCard:(BOOL)a7 muninViewState:(id)a8
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:muninViewState:", a4, a5, a6, a7, a8, a3.latitude, a3.longitude);
}

- (id)initForDirectionsTo:(id)a3
{
  id v4;
  _MKURLBuilder *v5;
  uint64_t v6;
  GEOMapURLBuilder *realBuilder;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKURLBuilder;
  v5 = -[_MKURLBuilder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27228]), "initForDirectionsTo:", v4);
    realBuilder = v5->_realBuilder;
    v5->_realBuilder = (GEOMapURLBuilder *)v6;

  }
  return v5;
}

- (id)initForDirectionsToAddresses:(id)a3
{
  id v4;
  _MKURLBuilder *v5;
  uint64_t v6;
  GEOMapURLBuilder *realBuilder;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKURLBuilder;
  v5 = -[_MKURLBuilder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27228]), "initForDirectionsToAddresses:", v4);
    realBuilder = v5->_realBuilder;
    v5->_realBuilder = (GEOMapURLBuilder *)v6;

  }
  return v5;
}

- (void)setStartAddress:(id)a3
{
  -[GEOMapURLBuilder setStartAddress:](self->_realBuilder, "setStartAddress:", a3);
}

- (void)setTransportType:(unint64_t)a3
{
  GEOMapURLBuilder *realBuilder;
  uint64_t v4;

  realBuilder = self->_realBuilder;
  if (a3 - 1 > 7)
    v4 = 4;
  else
    v4 = dword_18B2AEF38[a3 - 1];
  -[GEOMapURLBuilder setTransportType:](realBuilder, "setTransportType:", v4);
}

- (void)setDestinationMUID:(unint64_t)a3 provider:(int)a4
{
  -[GEOMapURLBuilder setDestinationMUID:provider:](self->_realBuilder, "setDestinationMUID:provider:", a3, *(_QWORD *)&a4);
}

- (void)setDestinationLabel:(id)a3
{
  -[GEOMapURLBuilder setDestinationLabel:](self->_realBuilder, "setDestinationLabel:", a3);
}

+ (id)URLForDirectionsFrom:(id)a3 to:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForDirectionsFrom:to:", a3, a4);
}

+ (id)URLForDirectionsFrom:(id)a3 toDestinations:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForDirectionsFrom:toDestinations:", a3, a4);
}

+ (id)URLForDirectionsFrom:(id)a3 to:(id)a4 transport:(unint64_t)a5
{
  uint64_t v5;

  if (a5 - 1 > 7)
    v5 = 4;
  else
    v5 = dword_18B2AEF38[a5 - 1];
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForDirectionsFrom:to:transport:", a3, a4, v5);
}

+ (id)URLForDirectionsFrom:(id)a3 toDestinations:(id)a4 transport:(unint64_t)a5
{
  uint64_t v5;

  if (a5 - 1 > 7)
    v5 = 4;
  else
    v5 = dword_18B2AEF38[a5 - 1];
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForDirectionsFrom:toDestinations:transport:", a3, a4, v5);
}

+ (id)URLForDirectionsFromHereTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForDirectionsFromHereTo:", a3);
}

+ (id)URLForDirectionsFromHereToDestinations:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForDirectionsFromHereToDestinations:", a3);
}

+ (id)URLForDirectionsFromHereTo:(id)a3 transport:(unint64_t)a4
{
  uint64_t v4;

  if (a4 - 1 > 7)
    v4 = 4;
  else
    v4 = dword_18B2AEF38[a4 - 1];
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForDirectionsFromHereTo:transport:", a3, v4);
}

+ (id)URLForDirectionsFromHereToDestinations:(id)a3 transport:(unint64_t)a4
{
  uint64_t v4;

  if (a4 - 1 > 7)
    v4 = 4;
  else
    v4 = dword_18B2AEF38[a4 - 1];
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForDirectionsFromHereToDestinations:transport:", a3, v4);
}

+ (id)URLForDirectionsFromHereTo:(id)a3 label:(id)a4 muid:(unint64_t)a5 provider:(int)a6 transport:(unint64_t)a7
{
  uint64_t v7;

  if (a7 - 1 > 7)
    v7 = 4;
  else
    v7 = dword_18B2AEF38[a7 - 1];
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForDirectionsFromHereTo:label:muid:provider:transport:", a3, a4, a5, *(_QWORD *)&a6, v7);
}

- (id)initForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5
{
  uint64_t v5;
  id v8;
  _MKURLBuilder *v9;
  uint64_t v10;
  GEOMapURLBuilder *realBuilder;
  objc_super v13;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MKURLBuilder;
  v9 = -[_MKURLBuilder init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27228]), "initForInternalBusiness:id:provider:", v8, a4, v5);
    realBuilder = v9->_realBuilder;
    v9->_realBuilder = (GEOMapURLBuilder *)v10;

  }
  return v9;
}

- (id)initForExternalBusiness:(id)a3 id:(id)a4 ofContentProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  _MKURLBuilder *v11;
  uint64_t v12;
  GEOMapURLBuilder *realBuilder;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MKURLBuilder;
  v11 = -[_MKURLBuilder init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27228]), "initForExternalBusiness:id:ofContentProvider:", v8, v9, v10);
    realBuilder = v11->_realBuilder;
    v11->_realBuilder = (GEOMapURLBuilder *)v12;

  }
  return v11;
}

- (void)setBusinessCoordinate:(CLLocationCoordinate2D)a3
{
  -[GEOMapURLBuilder setBusinessCoordinate:](self->_realBuilder, "setBusinessCoordinate:", a3.latitude, a3.longitude);
}

- (void)setBusinessAddress:(id)a3
{
  -[GEOMapURLBuilder setBusinessAddress:](self->_realBuilder, "setBusinessAddress:", a3);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForInternalBusiness:id:provider:", a3, a4, *(_QWORD *)&a5);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForInternalBusiness:id:provider:coordinate:address:", a3, a4, *(_QWORD *)&a5, a7, a6.latitude, a6.longitude);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 extraStorage:(id)a8
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:", a3, a4, *(_QWORD *)&a5, a7, a8, 0, a6.latitude, a6.longitude);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:", a3, a4, *(_QWORD *)&a5, a7, a8, a9, a6.latitude, a6.longitude);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9 muninViewState:(id)a10
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:muninViewState:", a3, a4, *(_QWORD *)&a5, a7, a8, a9, a6.latitude, a6.longitude);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9 enrichmentInfo:(id)a10
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:enrichmentInfo:", a3, a4, *(_QWORD *)&a5, a7, a8, a9, a6.latitude, a6.longitude);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 useWebPlaceCard:(BOOL)a8
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:", a3, a4, *(_QWORD *)&a5, a7, 0, a8, a6.latitude, a6.longitude);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(CLLocationCoordinate2D)a6 address:(id)a7 useWebPlaceCard:(BOOL)a8 mapItemData:(id)a9
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:", a3, a4, *(_QWORD *)&a5, a7, 0, a8, a6.latitude, a6.longitude);
}

+ (id)URLForExternalBusiness:(id)a3 id:(id)a4 ofContentProvider:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForExternalBusiness:id:ofContentProvider:", a3, a4, a5);
}

+ (id)URLForCollectionStorage:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D27228], "URLForCollectionStorage:", a3);
}

- (id)build
{
  return (id)-[GEOMapURLBuilder build](self->_realBuilder, "build");
}

- (id)buildForWeb
{
  return (id)-[GEOMapURLBuilder buildForWeb](self->_realBuilder, "buildForWeb");
}

- (void)setMapType:(unint64_t)a3
{
  GEOMapURLBuilder *realBuilder;
  uint64_t v4;
  unsigned int v5;

  realBuilder = self->_realBuilder;
  switch(a3)
  {
    case 1uLL:
    case 3uLL:
      v4 = 1;
      break;
    case 2uLL:
    case 4uLL:
      v4 = 2;
      break;
    default:
      if (a3 == 108)
        v5 = 4;
      else
        v5 = 0;
      if (a3 == 104)
        v4 = 3;
      else
        v4 = v5;
      break;
  }
  -[GEOMapURLBuilder setMapType:](realBuilder, "setMapType:", v4);
}

- (void)setContentProvider:(id)a3
{
  -[GEOMapURLBuilder setContentProvider:](self->_realBuilder, "setContentProvider:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realBuilder, 0);
}

@end
