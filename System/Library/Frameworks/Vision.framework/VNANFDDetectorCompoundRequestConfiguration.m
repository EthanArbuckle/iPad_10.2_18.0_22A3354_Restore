@implementation VNANFDDetectorCompoundRequestConfiguration

- (NSString)detectorType
{
  return self->_detectorType;
}

- (void)setDetectorType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setDetectorConfigurationOptions:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *detectorConfigurationOptions;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = (NSDictionary *)objc_msgSend(v4, "mutableCopy");
  detectorConfigurationOptions = self->_detectorConfigurationOptions;
  self->_detectorConfigurationOptions = v5;

  objc_msgSend(v4, "objectForKey:", CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && objc_msgSend(v7, "specifiesRequestClass:", -[VNRequestConfiguration requestClass](self, "requestClass")))
  {
    v8.receiver = self;
    v8.super_class = (Class)VNANFDDetectorCompoundRequestConfiguration;
    -[VNRequestConfiguration setResolvedRevision:](&v8, sel_setResolvedRevision_, objc_msgSend(v7, "requestRevision"));
  }

}

- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4
{
  -[NSDictionary setValue:forKey:](self->_detectorConfigurationOptions, "setValue:forKey:", a4, a3);
}

- (NSMutableArray)originalRequests
{
  return self->_originalRequests;
}

- (VNANFDDetectorCompoundRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNANFDDetectorCompoundRequestConfiguration *v3;
  NSDictionary *v4;
  NSDictionary *detectorConfigurationOptions;
  NSMutableArray *v6;
  NSMutableArray *originalRequests;
  VNANFDDetectorCompoundRequestConfiguration *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VNANFDDetectorCompoundRequestConfiguration;
  v3 = -[VNRequestConfiguration initWithRequestClass:](&v10, sel_initWithRequestClass_, a3);
  if (v3)
  {
    v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    detectorConfigurationOptions = v3->_detectorConfigurationOptions;
    v3->_detectorConfigurationOptions = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    originalRequests = v3->_originalRequests;
    v3->_originalRequests = v6;

    objc_storeStrong((id *)&v3->_detectorType, CFSTR("VNANFDMultiDetectorType"));
    v8 = v3;
  }

  return v3;
}

- (NSDictionary)detectorConfigurationOptions
{
  return self->_detectorConfigurationOptions;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VNANFDDetectorCompoundRequestConfiguration;
  v4 = -[VNRequestConfiguration copyWithZone:](&v13, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = -[NSDictionary mutableCopy](self->_detectorConfigurationOptions, "mutableCopy");
    v6 = (void *)v4[12];
    v4[12] = v5;

    v7 = -[NSMutableArray mutableCopy](self->_originalRequests, "mutableCopy");
    v8 = (void *)v4[13];
    v4[13] = v7;

    v9 = -[NSString copy](self->_detectorType, "copy");
    v10 = (void *)v4[14];
    v4[14] = v9;

    v11 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorType, 0);
  objc_storeStrong((id *)&self->_originalRequests, 0);
  objc_storeStrong((id *)&self->_detectorConfigurationOptions, 0);
}

@end
