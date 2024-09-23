@implementation _WKGeolocationPosition

+ (id)positionWithLocation:(id)a3
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  const void *v9;
  CFTypeRef v10;
  _OWORD v12[7];

  if (!a3)
    return 0;
  MEMORY[0x19AEB2694](v12, a3);
  v3 = API::Object::newObject(0x80uLL, 68);
  *(_QWORD *)v3 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v3);
  *(_QWORD *)v3 = &off_1E34CB3F8;
  v5 = v12[5];
  v4 = v12[6];
  *(_OWORD *)(v3 + 80) = v12[4];
  *(_OWORD *)(v3 + 96) = v5;
  *(_OWORD *)(v3 + 112) = v4;
  v7 = v12[2];
  v6 = v12[3];
  v8 = v12[1];
  *(_OWORD *)(v3 + 16) = v12[0];
  *(_OWORD *)(v3 + 32) = v8;
  *(_OWORD *)(v3 + 48) = v7;
  *(_OWORD *)(v3 + 64) = v6;
  v9 = *(const void **)(v3 + 8);
  if (v9)
    CFRetain(*(CFTypeRef *)(v3 + 8));
  v10 = (id)CFMakeCollectable(v9);
  CFRelease(*(CFTypeRef *)(v3 + 8));
  return (id)v10;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::WebGeolocationPosition> *))self->_geolocationPosition.data.__lx)(&self->_geolocationPosition);
    v4.receiver = self;
    v4.super_class = (Class)_WKGeolocationPosition;
    -[_WKGeolocationPosition dealloc](&v4, sel_dealloc);
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_geolocationPosition;
}

@end
