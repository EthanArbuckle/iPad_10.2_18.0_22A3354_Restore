@implementation VNFaceAnalyzerCompoundRequestConfiguration

- (void)setResolvedRevision:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNFaceAnalyzerCompoundRequestConfiguration;
  -[VNRequestConfiguration setResolvedRevision:](&v6, sel_setResolvedRevision_);
  +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", -[objc_class frameworkClass](-[VNRequestConfiguration requestClass](self, "requestClass"), "frameworkClass"), a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_detectorConfigurationOptions, "setObject:forKeyedSubscript:", v5, CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));

}

- (NSMutableArray)originalRequests
{
  return self->_originalRequests;
}

- (VNFaceAnalyzerCompoundRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNFaceAnalyzerCompoundRequestConfiguration *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *detectorConfigurationOptions;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *originalRequests;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VNFaceAnalyzerCompoundRequestConfiguration;
  v4 = -[VNRequestConfiguration initWithRequestClass:](&v11, sel_initWithRequestClass_);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    detectorConfigurationOptions = v4->_detectorConfigurationOptions;
    v4->_detectorConfigurationOptions = v5;

    +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", -[objc_class frameworkClass](a3, "frameworkClass"), -[objc_class defaultRevision](a3, "defaultRevision"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_detectorConfigurationOptions, "setObject:forKeyedSubscript:", v7, CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    originalRequests = v4->_originalRequests;
    v4->_originalRequests = v8;

    objc_storeStrong((id *)&v4->_detectorType, CFSTR("VNFaceAnalyzerMultiDetectorType"));
  }
  return v4;
}

- (NSString)detectorType
{
  return self->_detectorType;
}

- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary setValue:forKey:](self->_detectorConfigurationOptions, "setValue:forKey:", v6, v8);
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("VNDetectorOption_OriginatingRequestSpecifier")))
  {
    v7 = v6;
    -[VNFaceAnalyzerCompoundRequestConfiguration setResolvedRevision:](self, "setResolvedRevision:", objc_msgSend(v7, "requestRevision"));

  }
}

- (id)detectorConfigurationOptions
{
  return self->_detectorConfigurationOptions;
}

- (void)setDetectorType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setDetectorConfigurationOptions:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *detectorConfigurationOptions;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  detectorConfigurationOptions = self->_detectorConfigurationOptions;
  self->_detectorConfigurationOptions = v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)VNFaceAnalyzerCompoundRequestConfiguration;
    -[VNRequestConfiguration setResolvedRevision:](&v9, sel_setResolvedRevision_, objc_msgSend(v7, "requestRevision"));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorType, 0);
  objc_storeStrong((id *)&self->_originalRequests, 0);
  objc_storeStrong((id *)&self->_detectorConfigurationOptions, 0);
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VNFaceAnalyzerCompoundRequestConfiguration;
  v4 = -[VNRequestConfiguration copyWithZone:](&v12, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = -[NSMutableDictionary mutableCopy](self->_detectorConfigurationOptions, "mutableCopy");
    v6 = (void *)v4[12];
    v4[12] = v5;

    v7 = -[NSMutableArray mutableCopy](self->_originalRequests, "mutableCopy");
    v8 = (void *)v4[13];
    v4[13] = v7;

    v9 = -[NSString copy](self->_detectorType, "copy");
    v10 = (void *)v4[14];
    v4[14] = v9;

  }
  return v4;
}

@end
