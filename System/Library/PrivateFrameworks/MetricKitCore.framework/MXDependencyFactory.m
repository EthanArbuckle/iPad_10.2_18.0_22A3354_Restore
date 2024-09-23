@implementation MXDependencyFactory

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__MXDependencyFactory_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, block);
  return (id)shared_result;
}

void __29__MXDependencyFactory_shared__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)shared_result;
  shared_result = (uint64_t)v1;

}

- (MXDependencyFactory)init
{
  MXDependencyFactory *v2;
  MXDependencyFactory *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MXDependencyFactory;
  v2 = -[MXDependencyFactory init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MXDependencyFactory _initIvar](v2, "_initIvar");
  return v3;
}

- (void)_initIvar
{
  MXPayloadValidator *v3;
  MXPayloadValidator *payloadValidator;
  MXBundleUtil *v5;
  MXBundleUtilProtocol *bundleUtil;
  MXStorageUtil *v7;
  MXStorageUtilProtocol *storageUtil;
  MXDeliveryPathUtil *v9;
  MXDeliveryPathUtilProtocol *deliveryPathUtil;
  MXClientUtil *v11;
  MXClientUtilProtocol *clientUtil;
  MXDeliveryDataCacher *v13;
  MXDeliveryDataCacherProtocol *deliveryDataCacher;
  MXCleanUtil *v15;
  MXCleanUtil *cleanUtil;
  MXDateUtil *v17;
  MXDateUtil *dateUtil;
  MXSourcePathUtil *v19;
  MXSourcePathUtilProtocol *sourcePathUtil;
  MXSourceDataCacher *v21;
  MXSourceDataCacherProtocol *sourceDataCacher;
  MXMetricServices *v23;
  MXMetricServicesProtocol *metricServices;
  MXDiagnosticServices *v25;
  MXDiagnosticServicesProtocol *diagnosticServices;

  v3 = objc_alloc_init(MXPayloadValidator);
  payloadValidator = self->_payloadValidator;
  self->_payloadValidator = v3;

  v5 = objc_alloc_init(MXBundleUtil);
  bundleUtil = self->_bundleUtil;
  self->_bundleUtil = (MXBundleUtilProtocol *)v5;

  v7 = objc_alloc_init(MXStorageUtil);
  storageUtil = self->_storageUtil;
  self->_storageUtil = (MXStorageUtilProtocol *)v7;

  v9 = -[MXDeliveryPathUtil initWithStorageUtil:andBundleUtil:]([MXDeliveryPathUtil alloc], "initWithStorageUtil:andBundleUtil:", self->_storageUtil, self->_bundleUtil);
  deliveryPathUtil = self->_deliveryPathUtil;
  self->_deliveryPathUtil = (MXDeliveryPathUtilProtocol *)v9;

  v11 = objc_alloc_init(MXClientUtil);
  clientUtil = self->_clientUtil;
  self->_clientUtil = (MXClientUtilProtocol *)v11;

  v13 = -[MXDeliveryDataCacher initWithClientUtil:andDeliveryPathUtil:andStorageUtil:]([MXDeliveryDataCacher alloc], "initWithClientUtil:andDeliveryPathUtil:andStorageUtil:", self->_clientUtil, self->_deliveryPathUtil, self->_storageUtil);
  deliveryDataCacher = self->_deliveryDataCacher;
  self->_deliveryDataCacher = (MXDeliveryDataCacherProtocol *)v13;

  v15 = -[MXCleanUtil initWithClientUtil:andDeliveryPathUtil:]([MXCleanUtil alloc], "initWithClientUtil:andDeliveryPathUtil:", self->_clientUtil, self->_deliveryPathUtil);
  cleanUtil = self->_cleanUtil;
  self->_cleanUtil = v15;

  v17 = objc_alloc_init(MXDateUtil);
  dateUtil = self->_dateUtil;
  self->_dateUtil = v17;

  v19 = -[MXSourcePathUtil initWithDateUtil:andStorageUtil:]([MXSourcePathUtil alloc], "initWithDateUtil:andStorageUtil:", self->_dateUtil, self->_storageUtil);
  sourcePathUtil = self->_sourcePathUtil;
  self->_sourcePathUtil = (MXSourcePathUtilProtocol *)v19;

  v21 = -[MXSourceDataCacher initWithSourcePathUtil:andStorageUtil:andBundleUtil:]([MXSourceDataCacher alloc], "initWithSourcePathUtil:andStorageUtil:andBundleUtil:", self->_sourcePathUtil, self->_storageUtil, self->_bundleUtil);
  sourceDataCacher = self->_sourceDataCacher;
  self->_sourceDataCacher = (MXSourceDataCacherProtocol *)v21;

  v23 = -[MXMetricServices initWithClientUtil:andSourcePathUtil:]([MXMetricServices alloc], "initWithClientUtil:andSourcePathUtil:", self->_clientUtil, self->_sourcePathUtil);
  metricServices = self->_metricServices;
  self->_metricServices = (MXMetricServicesProtocol *)v23;

  v25 = -[MXDiagnosticServices initWithSourcePathUtil:andDateUtil:]([MXDiagnosticServices alloc], "initWithSourcePathUtil:andDateUtil:", self->_sourcePathUtil, self->_dateUtil);
  diagnosticServices = self->_diagnosticServices;
  self->_diagnosticServices = (MXDiagnosticServicesProtocol *)v25;

}

- (id)handlerForMXCoreWithDelegate:(id)a3
{
  id v4;
  MXCoreHandler *v5;

  v4 = a3;
  v5 = -[MXCoreHandler initWithClientUtil:andDeliveryDataCacher:andDeliveryPathUtil:andMetricServices:andDelegate:]([MXCoreHandler alloc], "initWithClientUtil:andDeliveryDataCacher:andDeliveryPathUtil:andMetricServices:andDelegate:", self->_clientUtil, self->_deliveryDataCacher, self->_deliveryPathUtil, self->_metricServices, v4);

  return v5;
}

- (id)handlerForMXSourceWithDelegate:(id)a3
{
  id v4;
  MXSourceHandler *v5;

  v4 = a3;
  v5 = -[MXSourceHandler initWithSourceDataCacher:andDeliveryDataCacher:andSourcePathUtil:andBundleUtil:andDiagnosticServices:andDelegate:]([MXSourceHandler alloc], "initWithSourceDataCacher:andDeliveryDataCacher:andSourcePathUtil:andBundleUtil:andDiagnosticServices:andDelegate:", self->_sourceDataCacher, self->_deliveryDataCacher, self->_sourcePathUtil, self->_bundleUtil, self->_diagnosticServices, v4);

  return v5;
}

- (MXBundleUtilProtocol)bundleUtil
{
  return (MXBundleUtilProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (MXDeliveryPathUtilProtocol)deliveryPathUtil
{
  return (MXDeliveryPathUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (MXDeliveryDataCacherProtocol)deliveryDataCacher
{
  return (MXDeliveryDataCacherProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (MXClientUtilProtocol)clientUtil
{
  return (MXClientUtilProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (MXCleanUtil)cleanUtil
{
  return (MXCleanUtil *)objc_getProperty(self, a2, 40, 1);
}

- (MXPayloadValidator)payloadValidator
{
  return (MXPayloadValidator *)objc_getProperty(self, a2, 48, 1);
}

- (MXStorageUtilProtocol)storageUtil
{
  return (MXStorageUtilProtocol *)objc_getProperty(self, a2, 56, 1);
}

- (MXDateUtil)dateUtil
{
  return (MXDateUtil *)objc_getProperty(self, a2, 64, 1);
}

- (MXSourcePathUtilProtocol)sourcePathUtil
{
  return (MXSourcePathUtilProtocol *)objc_getProperty(self, a2, 72, 1);
}

- (MXSourceDataCacherProtocol)sourceDataCacher
{
  return (MXSourceDataCacherProtocol *)objc_getProperty(self, a2, 80, 1);
}

- (MXMetricServicesProtocol)metricServices
{
  return (MXMetricServicesProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (MXDiagnosticServicesProtocol)diagnosticServices
{
  return (MXDiagnosticServicesProtocol *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticServices, 0);
  objc_storeStrong((id *)&self->_metricServices, 0);
  objc_storeStrong((id *)&self->_sourceDataCacher, 0);
  objc_storeStrong((id *)&self->_sourcePathUtil, 0);
  objc_storeStrong((id *)&self->_dateUtil, 0);
  objc_storeStrong((id *)&self->_storageUtil, 0);
  objc_storeStrong((id *)&self->_payloadValidator, 0);
  objc_storeStrong((id *)&self->_cleanUtil, 0);
  objc_storeStrong((id *)&self->_clientUtil, 0);
  objc_storeStrong((id *)&self->_deliveryDataCacher, 0);
  objc_storeStrong((id *)&self->_deliveryPathUtil, 0);
  objc_storeStrong((id *)&self->_bundleUtil, 0);
}

@end
