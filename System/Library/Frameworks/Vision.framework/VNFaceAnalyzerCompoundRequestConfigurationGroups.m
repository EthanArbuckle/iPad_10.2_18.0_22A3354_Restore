@implementation VNFaceAnalyzerCompoundRequestConfigurationGroups

- (id)configurationForRequest:(id)a3 withObservationGroup:(id)a4 compoundRequestRevision:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  VNFaceAnalyzerCompoundRequestConfiguration *v23;
  void *v24;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "detectionLevel");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = objc_msgSend(v8, "forceFaceprintCreation");
  else
    v11 = 0;
  objc_opt_class();
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", objc_opt_isKindOfClass() & 1, CFSTR("Request object must be of type VNImageBasedRequest"));
  objc_msgSend(v8, "regionOfInterest");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (v9 && objc_msgSend(v9, "count"))
  {
    v20 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v9, "description");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@:%u:%u:%lu"), v21, v10, v11, a5);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_observationGroupConfigurations, "objectForKeyedSubscript:", v22);
    v23 = (VNFaceAnalyzerCompoundRequestConfiguration *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v23 = -[VNFaceAnalyzerCompoundRequestConfiguration initWithRequestClass:]([VNFaceAnalyzerCompoundRequestConfiguration alloc], "initWithRequestClass:", objc_opt_class());
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observationGroupConfigurations, "setObject:forKeyedSubscript:", v23, v22);
    }
  }
  else
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%f,%f,%f,%f:%u:%u:%lu"), v13, v15, v17, v19, v10, v11, a5);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_generalConfigurations, "objectForKeyedSubscript:", v22);
    v23 = (VNFaceAnalyzerCompoundRequestConfiguration *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v23 = -[VNFaceAnalyzerCompoundRequestConfiguration initWithRequestClass:]([VNFaceAnalyzerCompoundRequestConfiguration alloc], "initWithRequestClass:", objc_opt_class());
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_generalConfigurations, "setObject:forKeyedSubscript:", v23, v22);
    }
  }

  -[VNFaceAnalyzerCompoundRequestConfiguration originalRequests](v23, "originalRequests");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v8);

  return v23;
}

- (VNFaceAnalyzerCompoundRequestConfigurationGroups)init
{
  VNFaceAnalyzerCompoundRequestConfigurationGroups *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *generalConfigurations;
  NSMutableDictionary *v5;
  NSMutableDictionary *observationGroupConfigurations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNFaceAnalyzerCompoundRequestConfigurationGroups;
  v2 = -[VNFaceAnalyzerCompoundRequestConfigurationGroups init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    generalConfigurations = v2->_generalConfigurations;
    v2->_generalConfigurations = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observationGroupConfigurations = v2->_observationGroupConfigurations;
    v2->_observationGroupConfigurations = v5;

  }
  return v2;
}

- (id)allConfigurations
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSMutableDictionary allValues](self->_generalConfigurations, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[NSMutableDictionary allValues](self->_observationGroupConfigurations, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationGroupConfigurations, 0);
  objc_storeStrong((id *)&self->_generalConfigurations, 0);
}

- (unint64_t)count
{
  uint64_t v3;

  v3 = -[NSMutableDictionary count](self->_generalConfigurations, "count");
  return -[NSMutableDictionary count](self->_observationGroupConfigurations, "count") + v3;
}

@end
