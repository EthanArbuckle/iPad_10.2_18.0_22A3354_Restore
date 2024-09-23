@implementation NSCloudKitMirroringRequestOptions

- (NSCloudKitMirroringRequestOptions)init
{
  NSCloudKitMirroringRequestOptions *v2;
  NSCloudKitMirroringRequestOptions *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSCloudKitMirroringRequestOptions;
  v2 = -[NSCloudKitMirroringRequestOptions init](&v5, sel_init);
  v3 = v2;
  if (v2)
    v2->_operationConfiguration = (CKOperationConfiguration *)-[NSCloudKitMirroringRequestOptions createDefaultOperationConfiguration](v2, "createDefaultOperationConfiguration");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->_operationConfiguration = 0;
  self->_vouchers = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringRequestOptions;
  -[NSCloudKitMirroringRequestOptions dealloc](&v3, sel_dealloc);
}

- (id)copy
{
  _QWORD *v3;

  v3 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v3, "setOperationConfiguration:", self->_operationConfiguration);
  v3[2] = self->_vouchers;
  return v3;
}

- (id)createDefaultOperationConfiguration
{
  id v2;

  v2 = objc_alloc_init((Class)getCloudKitCKOperationConfigurationClass[0]());
  objc_msgSend(v2, "setQualityOfService:", 17);
  return v2;
}

- (void)setOperationConfiguration:(id)a3
{
  CKOperationConfiguration *operationConfiguration;
  CKOperationConfiguration *v6;

  operationConfiguration = self->_operationConfiguration;
  if (operationConfiguration != a3)
  {

    self->_operationConfiguration = 0;
  }
  if (a3)
    v6 = (CKOperationConfiguration *)a3;
  else
    v6 = -[NSCloudKitMirroringRequestOptions createDefaultOperationConfiguration](self, "createDefaultOperationConfiguration");
  self->_operationConfiguration = v6;
}

- (uint64_t)applyToOperation:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    if (objc_msgSend(*(id *)(result + 16), "lastObject"))
      v4 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "lastObject"), "operationConfiguration");
    else
      v4 = *(_QWORD *)(v3 + 8);
    return objc_msgSend(a2, "setConfiguration:", v4);
  }
  return result;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  -[CKOperationConfiguration setAllowsCellularAccess:](self->_operationConfiguration, "setAllowsCellularAccess:", a3);
}

- (BOOL)allowsCellularAccess
{
  return -[CKOperationConfiguration allowsCellularAccess](self->_operationConfiguration, "allowsCellularAccess");
}

- (int64_t)qualityOfService
{
  return -[CKOperationConfiguration qualityOfService](self->_operationConfiguration, "qualityOfService");
}

- (CKOperationConfiguration)operationConfiguration
{
  return self->_operationConfiguration;
}

- (NSArray)vouchers
{
  return self->_vouchers;
}

- (void)setVouchers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
