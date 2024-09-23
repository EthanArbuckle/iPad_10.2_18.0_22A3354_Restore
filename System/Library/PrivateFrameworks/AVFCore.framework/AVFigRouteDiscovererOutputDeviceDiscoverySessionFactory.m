@implementation AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory

- (id)outputDeviceDiscoverySessionOfClass:(Class)a3 withDeviceFeatures:(unint64_t)a4
{
  AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl *v6;
  int v7;
  AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl *v8;
  void *v9;
  _QWORD v11[5];
  int v12;

  v6 = 0;
  v7 = 0;
  switch(a4)
  {
    case 1uLL:
      v7 = 2;
      goto LABEL_8;
    case 2uLL:
      goto LABEL_8;
    case 3uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_9;
    case 4uLL:
      v7 = 1;
      goto LABEL_8;
    case 5uLL:
      v7 = 3;
      goto LABEL_8;
    case 8uLL:
      v7 = 5;
      goto LABEL_8;
    default:
      if (a4 != 0xFFFF)
        goto LABEL_9;
      v7 = 6;
LABEL_8:
      v8 = [AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl alloc];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __114__AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory_outputDeviceDiscoverySessionOfClass_withDeviceFeatures___block_invoke;
      v11[3] = &unk_1E30354B0;
      v11[4] = self;
      v12 = v7;
      v6 = -[AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl initWithFigRouteDiscovererCreator:](v8, "initWithFigRouteDiscovererCreator:", v11);
LABEL_9:
      v9 = (void *)objc_msgSend([a3 alloc], "initWithOutputDeviceDiscoverySessionImpl:", v6);

      return v9;
  }
}

uint64_t __114__AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory_outputDeviceDiscoverySessionOfClass_withDeviceFeatures___block_invoke(uint64_t a1)
{
  return AVFigRouteDiscovererFactoryCreateRouteDiscovererWithType((void *)objc_msgSend(*(id *)(a1 + 32), "routeDiscovererFactory"), *(_DWORD *)(a1 + 40));
}

- (AVFigRouteDiscovererFactory)routeDiscovererFactory
{
  return self->_routeDiscovererFactory;
}

- (AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory)init
{
  return -[AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory initWithRouteDiscovererFactory:](self, "initWithRouteDiscovererFactory:", AVFigRouteDiscovererFactoryGetCurrent());
}

- (AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory)initWithRouteDiscovererFactory:(id)a3
{
  AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory *v4;
  AVFigRouteDiscovererFactory *v5;
  AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory;
  v4 = -[AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory init](&v8, sel_init);
  if (v4 && (v5 = (AVFigRouteDiscovererFactory *)a3, (v4->_routeDiscovererFactory = v5) != 0))
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory;
  -[AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory dealloc](&v3, sel_dealloc);
}

@end
