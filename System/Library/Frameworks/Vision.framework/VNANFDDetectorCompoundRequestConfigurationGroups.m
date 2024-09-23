@implementation VNANFDDetectorCompoundRequestConfigurationGroups

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionOfInterestConfigurations, 0);
}

- (VNANFDDetectorCompoundRequestConfigurationGroups)init
{
  VNANFDDetectorCompoundRequestConfigurationGroups *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *regionOfInterestConfigurations;
  VNANFDDetectorCompoundRequestConfigurationGroups *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNANFDDetectorCompoundRequestConfigurationGroups;
  v2 = -[VNANFDDetectorCompoundRequestConfigurationGroups init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    regionOfInterestConfigurations = v2->_regionOfInterestConfigurations;
    v2->_regionOfInterestConfigurations = v3;

    v5 = v2;
  }

  return v2;
}

- (id)allConfigurations
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSMutableDictionary allValues](self->_regionOfInterestConfigurations, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

- (id)configurationForRequest:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  VNANFDDetectorCompoundRequestConfiguration *v8;
  void *v9;

  v4 = a3;
  v5 = +[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:](VNANFDDetectorCompoundRequest, "compoundRequestRevisionForRequest:", v4);
  objc_msgSend((id)objc_opt_class(), "createCompoundConfigurationHashKeyForRequest:compoundRequestRevision:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_regionOfInterestConfigurations, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = -[VNANFDDetectorCompoundRequestConfiguration initWithRequestClass:]([VNANFDDetectorCompoundRequestConfiguration alloc], "initWithRequestClass:", objc_opt_class());
    -[VNRequestConfiguration setResolvedRevision:](v8, "setResolvedRevision:", v5);
    v7 = v8;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_regionOfInterestConfigurations, "setObject:forKeyedSubscript:", v8, v6);
  }
  objc_msgSend(v7, "originalRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v4);

  return v7;
}

+ (id)createCompoundConfigurationHashKeyForRequest:(id)a3 compoundRequestRevision:(unint64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;

  objc_msgSend(a3, "regionOfInterest");
  v9 = v8;
  if (v8 == 0.0)
    v9 = 0.0;
  v10 = v5;
  if (v5 == 0.0)
    v10 = 0.0;
  v11 = *(_QWORD *)&v10 ^ __ROR8__(*(_QWORD *)&v9, 51);
  v12 = v6;
  if (v6 == 0.0)
    v12 = 0.0;
  v13 = *(_QWORD *)&v12 ^ __ROR8__(v11, 51);
  v14 = v7;
  if (v7 == 0.0)
    v14 = 0.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)&v14 ^ __ROR8__(v13, 51) ^ __ROR8__(a4, 51));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_regionOfInterestConfigurations, "count");
}

@end
