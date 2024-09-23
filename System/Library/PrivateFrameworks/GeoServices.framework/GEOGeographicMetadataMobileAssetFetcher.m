@implementation GEOGeographicMetadataMobileAssetFetcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (id)initForType:(unint64_t)a3 parameters:(id)a4
{
  id v6;
  GEOGeographicMetadataMobileAssetFetcher *v7;
  GEOGeographicMetadataMobileAssetFetcher *v8;
  uint64_t v9;
  NSDictionary *parameters;
  GEOGeographicMetadataMobileAssetFetcher *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOGeographicMetadataMobileAssetFetcher;
  v7 = -[GEOGeographicMetadataMobileAssetFetcher init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    parameters = v8->_parameters;
    v8->_parameters = (NSDictionary *)v9;

    v11 = v8;
  }

  return v8;
}

- (void)fetchMetadataForLocation:(id)a3 responseQueue:(id)a4 block:(id)a5
{
  id v6;
  void *v7;
  unint64_t type;
  NSDictionary *parameters;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a5;
  +[GEOMobileAssetResourceManager sharedManager](GEOMobileAssetResourceManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  parameters = self->_parameters;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__GEOGeographicMetadataMobileAssetFetcher_fetchMetadataForLocation_responseQueue_block___block_invoke;
  v11[3] = &unk_1E1C150F8;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v7, "fetchResourceOfType:extraParameters:options:result:", type, parameters, 0, v11);

}

void __88__GEOGeographicMetadataMobileAssetFetcher_fetchMetadataForLocation_responseQueue_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = &unk_1E1E815C8;
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)reportCorrupt:(id)a3
{
  id v4;

  +[GEOMobileAssetResourceManager sharedManager](GEOMobileAssetResourceManager, "sharedManager", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifyResourceIsCorrupt:", self->_result);

}

@end
