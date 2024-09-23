@implementation SHCustomCatalogMatcher

- (SHCustomCatalogMatcher)initWithCustomCatalog:(id)a3
{
  id v5;
  SHCustomCatalogMatcher *v6;
  SHCustomCatalogMatcher *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SHCustomCatalogMatcher;
  v6 = -[SHCustomCatalogMatcher init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_customCatalog, a3);
    -[SHCustomCatalogMatcher customCatalog](v7, "customCatalog");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "customCatalogContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "referenceSignatures");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Custom catalogs must contain at least one signature"), 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v13);
    }
  }

  return v7;
}

- (int64_t)algorithmToMREAlgorithm:(int64_t)a3
{
  return a3 == 1;
}

- (int64_t)storeDensityToMREDensity:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 3;
  else
    return qword_218C5CFB8[a3 - 1];
}

- (MRE)mre
{
  MRE *mre;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MRE *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  MRE *v14;
  id v15;
  MRE *v16;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  mre = self->_mre;
  if (!mre)
  {
    -[SHCustomCatalogMatcher customCatalog](self, "customCatalog");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customCatalogContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "referenceSignatures");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHCustomCatalogMatcher MRESignaturesFromMatches:](self, "MRESignaturesFromMatches:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [MRE alloc];
    -[SHCustomCatalogMatcher customCatalog](self, "customCatalog");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SHCustomCatalogMatcher storeDensityToMREDensity:](self, "storeDensityToMREDensity:", objc_msgSend(v10, "density"));
    -[SHCustomCatalogMatcher customCatalog](self, "customCatalog");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v14 = -[MRE initWithSignatures:density:algorithm:error:](v8, "initWithSignatures:density:algorithm:error:", v7, v11, -[SHCustomCatalogMatcher algorithmToMREAlgorithm:](self, "algorithmToMREAlgorithm:", objc_msgSend(v13, "algorithm")), &v19);
    v15 = v19;
    v16 = self->_mre;
    self->_mre = v14;

    if (v15)
    {
      v20 = *MEMORY[0x24BDD1398];
      v21[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Could not initialize custom catalog"), objc_claimAutoreleasedReturnValue());
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v18);
    }

    mre = self->_mre;
  }
  return mre;
}

- (id)MRESignaturesFromMatches:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  MRESignature *v7;
  void *v8;
  void *v9;
  void *v10;
  MRESignature *v11;
  void *v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sh_log_object();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v14 = 134217984;
    v15 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_218BF1000, v5, OS_LOG_TYPE_DEBUG, "Initialising MRE with %lu tracks", (uint8_t *)&v14, 0xCu);
  }

  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      v7 = [MRESignature alloc];
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "signature");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[MRESignature initWithSignatureData:trackID:](v7, "initWithSignatureData:trackID:", v10, v6);

      objc_msgSend(v4, "addObject:", v11);
      ++v6;
    }
    while (objc_msgSend(v3, "count") > v6);
  }
  v12 = (void *)objc_msgSend(v4, "copy");

  return v12;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SHCustomCatalogMatcher delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHCustomCatalogMatcher matchSignature:](self, "matchSignature:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "matcher:didProduceResponse:", self, v6);

}

- (id)matchSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v4 = a3;
  -[SHCustomCatalogMatcher mre](self, "mre");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "search:error:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  -[SHCustomCatalogMatcher matcherResponseFrom:querySignature:error:](self, "matcherResponseFrom:querySignature:error:", v7, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)matcherResponseFrom:(id)a3 querySignature:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    -[SHCustomCatalogMatcher matchFromMREResults:signature:](self, "matchFromMREResults:signature:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHMatcherResponse matchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:](SHMatcherResponse, "matchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:", v11, 0.0, 0.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v10)
    {
      +[SHMatcherResponse errorResponseForSignature:error:](SHMatcherResponse, "errorResponseForSignature:error:", v9, v10);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "duration");
      v15 = v14;
      -[SHCustomCatalogMatcher customCatalog](self, "customCatalog");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "minimumQuerySignatureDuration");
      v18 = v15 + v17;

      -[SHCustomCatalogMatcher customCatalog](self, "customCatalog");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "maximumQuerySignatureDuration");
      v21 = v20;

      if (v18 >= v21)
        v18 = v21;
      objc_msgSend(v9, "duration");
      v23 = v22;
      -[SHCustomCatalogMatcher customCatalog](self, "customCatalog");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "maximumQuerySignatureDuration");
      if (v23 >= v25)
        v26 = 0.0;
      else
        v26 = v18;

      +[SHMatcherResponse noMatchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:signature:](SHMatcherResponse, "noMatchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:signature:", v9, 0.0, 0.0, v26);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v13;
  }

  return v12;
}

- (id)matchFromMREResults:(id)a3 signature:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SHMREMatch *v22;
  SHMREMatch *v23;
  void *v24;
  SHMatch *v25;
  void *v26;
  SHMatch *v27;
  void *v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v30 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
        -[SHCustomCatalogMatcher customCatalog](self, "customCatalog");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "customCatalogContainer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "referenceSignatureForTrackID:", objc_msgSend(v12, "trackID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "ID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v7, "containsObject:", v16);

          if ((v17 & 1) == 0)
          {
            objc_msgSend(v15, "ID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v18);

            -[SHCustomCatalogMatcher customCatalog](self, "customCatalog");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "customCatalogContainer");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "mediaItemsForReferenceSignature:", v15);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v22 = [SHMREMatch alloc];
            v23 = -[SHMREMatch initWithResult:mediaItems:signatureAlignments:querySignature:](v22, "initWithResult:mediaItems:signatureAlignments:querySignature:", v12, v21, MEMORY[0x24BDBD1A8], v30);
            -[SHMREMatch toMatchedMediaItems](v23, "toMatchedMediaItems");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObjectsFromArray:", v24);

          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v9);
  }

  v25 = [SHMatch alloc];
  v26 = (void *)objc_msgSend(v29, "copy");
  v27 = -[SHMatch initWithMediaItems:forSignature:](v25, "initWithMediaItems:forSignature:", v26, v30);

  return v27;
}

- (SHMatcherDelegate)delegate
{
  return (SHMatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SHCustomCatalog)customCatalog
{
  return self->_customCatalog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customCatalog, 0);
  objc_storeStrong((id *)&self->_mre, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
