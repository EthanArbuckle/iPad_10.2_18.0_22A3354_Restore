@implementation SHCustomCatalogTrackerMatcher

- (SHCustomCatalogTrackerMatcher)initWithCustomCatalogConfiguration:(id)a3 container:(id)a4
{
  id v7;
  id v8;
  SHCustomCatalogTrackerMatcher *v9;
  SHCustomCatalogTrackerMatcher *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SHCustomCatalogTrackerMatcher;
  v9 = -[SHCustomCatalogTrackerMatcher init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_customCatalogConfiguration, a3);
    objc_storeStrong((id *)&v10->_container, a4);
    -[SHCustomCatalogTrackerMatcher container](v10, "container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "referenceSignatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 != 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Tracking only supports one reference signature"), 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v15);
    }
  }

  return v10;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  v7 = v6;
  +[SHCustomCatalogConfiguration minimumQuerySignatureDurationForTracking](SHCustomCatalogConfiguration, "minimumQuerySignatureDurationForTracking");
  v9 = v8;

  if (v7 >= v9)
  {
    -[SHCustomCatalogTrackerMatcher container](self, "container");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "referenceSignatures");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v26 = (id)objc_claimAutoreleasedReturnValue();

    -[SHCustomCatalogTrackerMatcher delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signature");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHCustomCatalogTrackerMatcher trackQuerySignature:inReferenceSignature:](self, "trackQuerySignature:inReferenceSignature:", v24, v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "matcher:didProduceResponse:", self, v25);

  }
  else
  {
    -[SHCustomCatalogTrackerMatcher delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x24BDD0BA0];
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "signature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "duration");
    v15 = v14;
    +[SHCustomCatalogConfiguration minimumQuerySignatureDurationForTracking](SHCustomCatalogConfiguration, "minimumQuerySignatureDurationForTracking");
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Signature cannot be tracked with duration of %.2f secs it must be at least %.2f secs in duration"), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHError errorWithCode:underlyingError:keyOverrides:](SHError, "errorWithCode:underlyingError:keyOverrides:", 202, 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHMatcherResponse errorResponseForSignature:error:](SHMatcherResponse, "errorResponseForSignature:error:", v11, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "matcher:didProduceResponse:", self, v20);

  }
}

- (id)trackQuerySignature:(id)a3 inReferenceSignature:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  MREResult *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "signature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHCustomCatalogTrackerMatcher customCatalogConfiguration](self, "customCatalogConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  +[SHContinuityTracker trackQuerySignature:inReferenceSignature:configuration:error:](SHContinuityTracker, "trackQuerySignature:inReferenceSignature:configuration:error:", v6, v8, v9, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;

  if (objc_msgSend(v10, "count"))
  {
    v12 = -[MREResult initWithTrackId:offset:timeSkew:freqSkew:score:]([MREResult alloc], "initWithTrackId:offset:timeSkew:freqSkew:score:", objc_msgSend(v7, "trackID"), &unk_24D9C5148, &unk_24D9C5148, &unk_24D9C5148, 0.0);
    v18[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHCustomCatalogTrackerMatcher matchFromMREResults:signature:signatureAlignments:](self, "matchFromMREResults:signature:signatureAlignments:", v13, v6, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHMatcherResponse matchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:](SHMatcherResponse, "matchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:", v14, 0.0, 0.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v11)
      +[SHMatcherResponse errorResponseForSignature:error:](SHMatcherResponse, "errorResponseForSignature:error:", v6, v11);
    else
      +[SHMatcherResponse noMatchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:signature:](SHMatcherResponse, "noMatchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:signature:", v6, 0.0, 0.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)matchFromMREResults:(id)a3 signature:(id)a4 signatureAlignments:(id)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SHMREMatch *v20;
  void *v21;
  SHMatch *v22;
  void *v23;
  SHMatch *v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v26 = a4;
  v27 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
        -[SHCustomCatalogTrackerMatcher container](self, "container", v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "referenceSignatureForTrackID:", objc_msgSend(v15, "trackID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          -[SHCustomCatalogTrackerMatcher container](self, "container");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "mediaItemsForReferenceSignature:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = -[SHMREMatch initWithResult:mediaItems:signatureAlignments:querySignature:]([SHMREMatch alloc], "initWithResult:mediaItems:signatureAlignments:querySignature:", v15, v19, v27, v26);
          -[SHMREMatch toMatchedMediaItems](v20, "toMatchedMediaItems");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v21);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  v22 = [SHMatch alloc];
  v23 = (void *)objc_msgSend(v9, "copy");
  v24 = -[SHMatch initWithMediaItems:forSignature:](v22, "initWithMediaItems:forSignature:", v23, v26);

  return v24;
}

- (SHMatcherDelegate)delegate
{
  return (SHMatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SHCustomCatalogConfiguration)customCatalogConfiguration
{
  return self->_customCatalogConfiguration;
}

- (SHCustomCatalogContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_customCatalogConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
