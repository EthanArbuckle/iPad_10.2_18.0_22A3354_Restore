@implementation HAP2AccessoryServerCoordinatorThread

+ (id)new
{
  HAP2AccessoryServerDiscoveryBonjourLegacy *v3;
  HAP2AccessoryServerPairingFactoryHAP *v4;
  HAP2AccessoryServerTransportFactoryThread *v5;
  HAP2AccessoryServerSecureTransportFactoryThread *v6;
  HAP2AccessoryServerEncodingFactoryThread *v7;
  HAP2AccessoryServerControllerFactory *v8;
  void *v9;

  v3 = -[HAP2AccessoryServerDiscoveryBonjourLegacy initWithLocalDomainAndServiceType:]([HAP2AccessoryServerDiscoveryBonjourLegacy alloc], "initWithLocalDomainAndServiceType:", CFSTR("_hap._udp"));
  v4 = objc_alloc_init(HAP2AccessoryServerPairingFactoryHAP);
  v5 = objc_alloc_init(HAP2AccessoryServerTransportFactoryThread);
  v6 = objc_alloc_init(HAP2AccessoryServerSecureTransportFactoryThread);
  v7 = objc_alloc_init(HAP2AccessoryServerEncodingFactoryThread);
  v8 = objc_alloc_init(HAP2AccessoryServerControllerFactory);
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDiscovery:pairingFactory:transportFactory:secureTransportFactory:encodingFactory:controllerFactory:", v3, v4, v5, v6, v7, v8);

  return v9;
}

@end
