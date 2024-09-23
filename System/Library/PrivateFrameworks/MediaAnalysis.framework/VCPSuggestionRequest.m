@implementation VCPSuggestionRequest

- (VCPSuggestionRequest)initWithFaceClusterIds:(id)a3 clusterFlags:(id)a4 updateHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  VCPSuggestionRequest *v12;
  VCPSuggestionRequest *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *requestId;
  void *v18;
  id v19;
  void *v20;
  id updateHandler;
  VNCanceller *v22;
  VNCanceller *canceller;
  VCPSuggestionRequest *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") && (v11 = objc_msgSend(v8, "count"), v11 == objc_msgSend(v9, "count")))
  {
    v29.receiver = self;
    v29.super_class = (Class)VCPSuggestionRequest;
    v12 = -[VCPSuggestionRequest init](&v29, sel_init);
    v13 = v12;
    if (v12)
    {
      v12->_type = 1;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      requestId = v13->_requestId;
      v13->_requestId = (NSString *)v16;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __74__VCPSuggestionRequest_initWithFaceClusterIds_clusterFlags_updateHandler___block_invoke;
      v26[3] = &unk_1E6B15820;
      v27 = v9;
      v19 = v18;
      v28 = v19;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v26);
      objc_storeStrong((id *)&v13->_clusterFlagByClusterId, v18);
      v20 = _Block_copy(v10);
      updateHandler = v13->_updateHandler;
      v13->_updateHandler = v20;

      v22 = (VNCanceller *)objc_alloc_init(MEMORY[0x1E0CEDDB0]);
      canceller = v13->_canceller;
      v13->_canceller = v22;

    }
    self = v13;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

void __74__VCPSuggestionRequest_initWithFaceClusterIds_clusterFlags_updateHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

+ (id)requestWithFaceClusterIds:(id)a3 clusterFlags:(id)a4 updateHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFaceClusterIds:clusterFlags:updateHandler:", v8, v9, v10);

  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)requestId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)clusterFlagByClusterId
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)csns
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)cflags
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (id)updateHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (VNCanceller)canceller
{
  return (VNCanceller *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canceller, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_cflags, 0);
  objc_storeStrong((id *)&self->_csns, 0);
  objc_storeStrong((id *)&self->_clusterFlagByClusterId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

@end
