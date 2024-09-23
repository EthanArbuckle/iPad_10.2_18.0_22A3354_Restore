@implementation MPCVocalAttenuationModelProviderImplementation

void __72__MPCVocalAttenuationModelProviderImplementation_prepareWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "state");
  objc_msgSend(*(id *)(a1 + 32), "loadingError");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);

}

- (int64_t)state
{
  return self->_state;
}

- (void)prepareWithCompletion:(id)a3
{
  void (**v4)(id, int64_t, void *);
  int64_t v5;
  NSObject *creationQueue;
  int64_t v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(id, int64_t, void *);

  v4 = (void (**)(id, int64_t, void *))a3;
  v5 = -[MPCVocalAttenuationModelProviderImplementation state](self, "state");
  switch(v5)
  {
    case 3:
      v7 = -[MPCVocalAttenuationModelProviderImplementation state](self, "state");
      -[MPCVocalAttenuationModelProviderImplementation loadingError](self, "loadingError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v7, v8);

      break;
    case 2:
      v4[2](v4, -[MPCVocalAttenuationModelProviderImplementation state](self, "state"), 0);
      break;
    case 0:
      -[MPCVocalAttenuationModelProviderImplementation setLoadingError:](self, "setLoadingError:", 0);
      -[MPCVocalAttenuationModelProviderImplementation setModel:](self, "setModel:", 0);
      creationQueue = self->_creationQueue;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __72__MPCVocalAttenuationModelProviderImplementation_prepareWithCompletion___block_invoke;
      v9[3] = &unk_24CAB9830;
      v9[4] = self;
      v10 = v4;
      dispatch_async(creationQueue, v9);

      break;
  }

}

void __72__MPCVocalAttenuationModelProviderImplementation_prepareWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_setupPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLoadingError:", v2);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__MPCVocalAttenuationModelProviderImplementation_prepareWithCompletion___block_invoke_2;
  v4[3] = &unk_24CAB9830;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

- (void)setLoadingError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSString)modelName
{
  MPCVocalAttenuationModel *model;

  model = self->_model;
  if (model)
    return model->_identifier;
  else
    return 0;
}

- (NSError)loadingError
{
  return self->_loadingError;
}

- (MPCVocalAttenuationModelProviderImplementation)init
{
  MPCVocalAttenuationModelProviderImplementation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *creationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPCVocalAttenuationModelProviderImplementation;
  v2 = -[MPCVocalAttenuationModelProviderImplementation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.VAModelProviderCreationQueue", 0);
    creationQueue = v2->_creationQueue;
    v2->_creationQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)_setupPaths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  MPCVocalAttenuationModel *v14;
  int v15;
  NSObject *v16;
  MPCVocalAttenuationModel *v17;
  char v18;
  NSObject *v19;
  MPCVocalAttenuationModel *v20;
  NSObject *v21;
  MPCVocalAttenuationModel *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  MPCVocalAttenuationModel *v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  MPCVocalAttenuationModel *v34;
  MPCVocalAttenuationModel *v35;
  id v36;
  MPCVocalAttenuationModel *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  MPCVocalAttenuationModel *v44;
  void *v45;
  void *v46;
  char v47;
  NSObject *v48;
  void *v49;
  MPCVocalAttenuationModel *v50;
  void *v51;
  void *v52;
  void *v53;
  MPCVocalAttenuationModel *v54;
  NSObject *v55;
  MPCVocalAttenuationModel *v56;
  NSObject *v57;
  MPCVocalAttenuationModel *v58;
  NSObject *v59;
  id v60;
  void *v61;
  int v62;
  NSObject *v63;
  MPCVocalAttenuationModel *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  unint64_t sampleRate;
  unint64_t blockSize;
  unint64_t lookaheadSize;
  double v85;
  MPCVocalAttenuationModel *model;
  NSObject *v87;
  MPCVocalAttenuationModel *v88;
  uint64_t v89;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  MPCVocalAttenuationModelProviderImplementation *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  uint8_t v103[128];
  uint8_t buf[4];
  MPCVocalAttenuationModel *v105;
  __int16 v106;
  NSObject *v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
  -[MPCVocalAttenuationModelProviderImplementation baseDirectoryURL](self, "baseDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCVocalAttenuationModelProviderImplementation purgeModelAtURL:](self, "purgeModelAtURL:", v4);
  -[MPCVocalAttenuationModelProviderImplementation baseModelDirectoryURL](self, "baseModelDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCVocalAttenuationModelProviderImplementation latestModelDirectoryAtURL:](self, "latestModelDirectoryAtURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCVocalAttenuationModelProviderImplementation remoteModelDirectoryURL](self, "remoteModelDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = self;
  -[MPCVocalAttenuationModelProviderImplementation bundleModelDirectoryURL](self, "bundleModelDirectoryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldUseSideLoadedVocalAttenuationModel");

  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldUseRemoteVocalAttenuationModel");

  if (v10 && v6)
  {
    objc_msgSend(v3, "addObject:", v6);
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "path");
      v14 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v105 = v14;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEBUG, "[AP] - MPCModelProvider - sideLoadedModelDirectory: %{public}@", buf, 0xCu);

    }
  }
  if (v7)
    v15 = v12;
  else
    v15 = 0;
  if (v15 == 1)
  {
    objc_msgSend(v3, "addObject:", v7);
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "path");
      v17 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v105 = v17;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEBUG, "[AP] - MPCModelProvider - remoteModelDirectoryURL: %{public}@", buf, 0xCu);

    }
  }
  if ((v12 & 1) != 0)
  {
    if (!v5)
      goto LABEL_23;
  }
  else
  {
    if (v5)
      v18 = v10;
    else
      v18 = 0;
    if ((v18 & 1) == 0)
      goto LABEL_23;
  }
  objc_msgSend(v3, "addObject:", v5);
  v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "path");
    v20 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v105 = v20;
    _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEBUG, "[AP] - MPCModelProvider - baseModelDirectoryURL: %{public}@", buf, 0xCu);

  }
LABEL_23:
  if (v8)
  {
    objc_msgSend(v3, "addObject:", v8);
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "path");
      v22 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v105 = v22;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEBUG, "[AP] - MPCModelProvider - bundleModelDirectoryURL: %{public}@", buf, 0xCu);

    }
  }
  if (objc_msgSend(v3, "count"))
  {
    v95 = v5;
    v96 = v8;
    v93 = v6;
    v94 = v7;
    v91 = v3;
    v92 = v4;
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v23 = v3;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v99;
LABEL_30:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v99 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v27);
        v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v28, "path");
          v30 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v105 = v30;
          _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_DEFAULT, "[AP] - MPCModelProvider - Validating model in: %{public}@", buf, 0xCu);

        }
        v31 = -[MPCVocalAttenuationModelProviderImplementation validateModelAtURL:](v97, "validateModelAtURL:", v28);
        v32 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v33 = v32;
        if (v31)
          break;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v28, "path");
          v34 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v105 = v34;
          _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_INFO, "[AP] - MPCModelProvider - Invalid model in: %{public}@:", buf, 0xCu);

        }
        if (v25 == ++v27)
        {
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
          if (v25)
            goto LABEL_30;
          goto LABEL_40;
        }
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v28, "path");
        v35 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v105 = v35;
        _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_DEFAULT, "[AP] - MPCModelProvider - Valid model found in: %{public}@:", buf, 0xCu);

      }
      v36 = v28;

      v4 = v92;
      v5 = v95;
      v8 = v96;
      if (v36)
      {
        if ((objc_msgSend(v36, "isEqual:", v96) & 1) != 0 || (objc_msgSend(v36, "isEqual:", v95) & 1) != 0)
        {
          v3 = v91;
        }
        else
        {
          v55 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          v3 = v91;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v95, "path");
            v56 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v105 = v56;
            _os_log_impl(&dword_210BD8000, v55, OS_LOG_TYPE_DEFAULT, "[AP] - MPCModelProvider - Purging models in %{public}@", buf, 0xCu);

          }
          -[MPCVocalAttenuationModelProviderImplementation purgeModelAtURL:](v97, "purgeModelAtURL:", v95);
          v57 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v36, "path");
            v58 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "path");
            v59 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v105 = v58;
            v106 = 2114;
            v107 = v59;
            _os_log_impl(&dword_210BD8000, v57, OS_LOG_TYPE_DEFAULT, "[AP] - MPCModelProvider - Moving new model: %{public}@ -> %{public}@", buf, 0x16u);

          }
          if (-[MPCVocalAttenuationModelProviderImplementation moveModelFromURL:toURL:](v97, "moveModelFromURL:toURL:", v36, v95))
          {
            v60 = v95;

            v36 = v60;
          }
          objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "shouldPurgeSideLoadedVocalAttenuationModels");

          if (v62)
          {
            v63 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v95, "path");
              v64 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v105 = v64;
              _os_log_impl(&dword_210BD8000, v63, OS_LOG_TYPE_DEFAULT, "[AP] - MPCModelProvider - Purging side-loaded directories in %{public}@", buf, 0xCu);

            }
            -[MPCVocalAttenuationModelProviderImplementation purgeSideLoadedModelDirectoriesAtURL:](v97, "purgeSideLoadedModelDirectoriesAtURL:", v95);
          }
        }
        v37 = (MPCVocalAttenuationModel *)v36;
        objc_msgSend((id)objc_opt_self(), "_filePathsForModelAtURL:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "count");
        v40 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v41 = v40;
        if (v39 == 3)
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v38, "valueForKey:", CFSTR("path"));
            v42 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v105 = v37;
            v106 = 2114;
            v107 = v42;
            _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_DEFAULT, "[AP] - MPCVAModel - Found model files urls at %{public}@: %{public}@", buf, 0x16u);

          }
          objc_msgSend(v38, "msv_filter:", &__block_literal_global_11700);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "firstObject");
          v44 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();

          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithContentsOfURL:", v44);
          -[MPCVocalAttenuationModel path](v44, "path");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "containsString:", CFSTR("/System/Library/PrivateFrameworks/MediaPlaybackCore.framework/"));

          if ((v47 & 1) != 0)
          {
            v41 = 0;
          }
          else
          {
            -[MPCVocalAttenuationModel path](v37, "path");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v65, CFSTR("ModelNetPathBase"));

            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("ModelNetPath"));
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "lastPathComponent");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v67, CFSTR("ModelNetPath"));

            v102 = 0;
            objc_msgSend(v45, "writeToURL:error:", v44, &v102);
            v41 = v102;
            if (v41)
            {
              v68 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v105 = v44;
                v106 = 2114;
                v107 = v41;
                _os_log_impl(&dword_210BD8000, v68, OS_LOG_TYPE_ERROR, "[AP] - MPCVAModel - Error writing plist to url %{public}@: %{public}@", buf, 0x16u);
              }

            }
          }
          v54 = objc_alloc_init(MPCVocalAttenuationModel);
          -[MPCVocalAttenuationModel path](v44, "path");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCVocalAttenuationModel setPlistPath:](v54, "setPlistPath:", v69);

          -[MPCVocalAttenuationModel setFiles:](v54, "setFiles:", v38);
          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("TaskID"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCVocalAttenuationModel setIdentifier:](v54, "setIdentifier:", v70);

          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("ModelNetPathBase"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCVocalAttenuationModel setBasePath:](v54, "setBasePath:", v71);

          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("BlockSize"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (v72)
          {
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("BlockSize"));
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCVocalAttenuationModel setBlockSize:](v54, "setBlockSize:", objc_msgSend(v73, "integerValue"));

          }
          else
          {
            -[MPCVocalAttenuationModel setBlockSize:](v54, "setBlockSize:", -1);
          }

          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("BatchSize"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (v74)
          {
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("BatchSize"));
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCVocalAttenuationModel setBatchSize:](v54, "setBatchSize:", objc_msgSend(v75, "integerValue"));

          }
          else
          {
            -[MPCVocalAttenuationModel setBatchSize:](v54, "setBatchSize:", 1);
          }

          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("SampleRate"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          if (v76)
          {
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("SampleRate"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCVocalAttenuationModel setSampleRate:](v54, "setSampleRate:", objc_msgSend(v77, "integerValue"));

          }
          else
          {
            -[MPCVocalAttenuationModel setSampleRate:](v54, "setSampleRate:", -1);
          }

          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("LookaheadSize"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          if (v78)
          {
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("LookaheadSize"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCVocalAttenuationModel setLookaheadSize:](v54, "setLookaheadSize:", objc_msgSend(v79, "integerValue"));

          }
          else
          {
            -[MPCVocalAttenuationModel setLookaheadSize:](v54, "setLookaheadSize:", -1);
          }

          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("TaskIteration"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          if (v80)
          {
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("TaskIteration"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCVocalAttenuationModel setTaskIteration:](v54, "setTaskIteration:", objc_msgSend(v81, "integerValue"));

          }
          else
          {
            -[MPCVocalAttenuationModel setTaskIteration:](v54, "setTaskIteration:", 1);
          }

          if (v54
            && (sampleRate = v54->_sampleRate) != 0
            && (blockSize = v54->_blockSize) != 0
            && (lookaheadSize = v54->_lookaheadSize) != 0)
          {
            v85 = (double)(lookaheadSize + blockSize) / (double)sampleRate;
          }
          else
          {
            v85 = 0.0;
          }
          -[MPCVocalAttenuationModel setProcessingDelay:](v54, "setProcessingDelay:", v85);

          v7 = v94;
          v5 = v95;
        }
        else
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v105 = v37;
            v106 = 2114;
            v107 = 0;
            _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_ERROR, "[AP] - MPCVAModel - Error retrieving model files urls at %{public}@: %{public}@", buf, 0x16u);
          }
          v54 = 0;
        }

        model = v97->_model;
        v97->_model = v54;

        v87 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          v88 = v97->_model;
          *(_DWORD *)buf = 138543362;
          v105 = v88;
          _os_log_impl(&dword_210BD8000, v87, OS_LOG_TYPE_DEFAULT, "[AP] - MPCModelProvider - Model %{public}@", buf, 0xCu);
        }

        v53 = 0;
        v89 = 2;
        if (!v97->_model)
          v89 = 3;
        v97->_state = v89;
        v8 = v96;
        goto LABEL_100;
      }
    }
    else
    {
LABEL_40:

      v4 = v92;
      v5 = v95;
      v8 = v96;
    }
    v97->_state = 3;
    v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v23, "valueForKey:", CFSTR("path"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "msv_compactDescription");
      v50 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v105 = v50;
      _os_log_impl(&dword_210BD8000, v48, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - No valid models found in %@", buf, 0xCu);

    }
    v51 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v23, "valueForKey:", CFSTR("path"));
    v37 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();
    -[MPCVocalAttenuationModel msv_compactDescription](v37, "msv_compactDescription");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCSuntoryError"), 102, CFSTR("No valid models found in %@"), v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v91;
LABEL_100:

    v6 = v93;
  }
  else
  {
    v97->_state = 3;
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCSuntoryError"), 101, CFSTR("No vocal attenuation model available"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v53;
}

- (void)purgeModelAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  int v17;
  BOOL v18;
  char v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  unsigned __int8 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 4, &v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v31;
  if (v6)
  {
    v7 = v6;
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v9;
      v35 = 2114;
      v36 = v7;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Error getting content of directory at URL %{public}@: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = v5;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v23 = v5;
      v24 = v3;
      v7 = 0;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v26 = 0;
          objc_msgSend(v14, "path", v23, v24);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v15, &v26);
          v17 = v26;

          if (v16)
            v18 = v17 == 0;
          else
            v18 = 0;
          if (v18)
          {

            v25 = 0;
            v19 = objc_msgSend(v4, "removeItemAtURL:error:", v14, &v25);
            v20 = v25;
            v7 = v20;
            if ((v19 & 1) == 0)
            {
              if (v20)
              {
                v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v14, "path");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v34 = v22;
                  v35 = 2114;
                  v36 = v7;
                  _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Error removing  file %{public}@: %{public}@", buf, 0x16u);

                }
              }
            }
          }
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
      v5 = v23;
      v3 = v24;
    }
    else
    {
      v7 = 0;
    }
  }

}

- (id)latestModelDirectoryAtURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[MPCVocalAttenuationModelProviderImplementation directoriesAtURL:](self, "directoriesAtURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
    {
      objc_msgSend(v3, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_26461);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)directoriesAtURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 4, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    objc_msgSend(v6, "msv_filter:", &__block_literal_global_22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)bundleModelDirectoryURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("czutbtg4y9"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)baseModelDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF48];
  MSVMobileHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v12[1] = CFSTR("Media/Espresso/Model");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPathComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, 0);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

  }
  return v5;
}

- (id)baseDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF48];
  MSVMobileHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v12[1] = CFSTR("Media/Espresso");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPathComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, 0);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

  }
  return v5;
}

- (id)remoteModelDirectoryURL
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shouldUseRemoteVocalAttenuationModel");

  return 0;
}

- (BOOL)validateModelAtURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  BOOL v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  NSObject *obj;
  uint64_t v39;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _QWORD v63[5];

  v63[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDBCCD0];
  v6 = *MEMORY[0x24BDBCC60];
  v63[0] = *MEMORY[0x24BDBCCD0];
  v63[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v4;
  v37 = v3;
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, v7, 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v53 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v51 = 0;
        objc_msgSend(v14, "getResourceValue:forKey:error:", &v51, v6, 0);
        v15 = v51;
        if ((objc_msgSend(v15, "BOOLValue") & 1) == 0)
        {
          v50 = 0;
          objc_msgSend(v14, "getResourceValue:forKey:error:", &v50, v5, 0);
          v16 = v50;
          if (objc_msgSend(v16, "hasPrefix:", CFSTR(".")))
            objc_msgSend(v9, "skipDescendants");
          else
            objc_msgSend(v41, "addObject:", v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v41, "count"))
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    -[MPCVocalAttenuationModelProviderImplementation modelFileExtensions](self, "modelFileExtensions");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
    if (!v18)
    {
      v30 = 1;
      goto LABEL_41;
    }
    v19 = v18;
    obj = v17;
    v39 = *(_QWORD *)v47;
LABEL_16:
    v20 = 0;
LABEL_17:
    if (*(_QWORD *)v47 != v39)
      objc_enumerationMutation(obj);
    v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v20);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v22 = v41;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v43;
LABEL_21:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v26);
        objc_msgSend(v27, "pathExtension");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "isEqualToString:", v28))
        {
          v29 = -[MPCVocalAttenuationModelProviderImplementation isValidModelFile:](self, "isValidModelFile:", v27);

          if (v29)
          {

            if (++v20 != v19)
              goto LABEL_17;
            v17 = obj;
            v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
            v30 = 1;
            if (v19)
              goto LABEL_16;
LABEL_41:
            v33 = v37;
            goto LABEL_42;
          }
        }
        else
        {

        }
        if (v24 == ++v26)
        {
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
          if (v24)
            goto LABEL_21;
          break;
        }
      }
    }

    v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v57 = v21;
      v58 = 2114;
      v59 = v22;
      _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Missing model file for extension %{public}@ - Files:%{public}@", buf, 0x16u);
    }

    v30 = 0;
    v32 = v36;
    v33 = v37;
    v17 = obj;
  }
  else
  {
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v30 = 0;
      goto LABEL_41;
    }
    v33 = v37;
    objc_msgSend(v37, "path");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v57 = v34;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - No model files in %{public}@", buf, 0xCu);

    v30 = 0;
LABEL_42:
    v32 = v36;
  }

  return v30;
}

- (BOOL)isValidModelFile:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[MPCVocalAttenuationModelProviderImplementation isValidPlistModelFile:](self, "isValidPlistModelFile:", v4)
    || -[MPCVocalAttenuationModelProviderImplementation isValidEspressoFile:](self, "isValidEspressoFile:", v4);

  return v5;
}

- (BOOL)isValidPlistModelFile:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsString:", CFSTR("nnet"));
  if ((v6 & 1) != 0
    || (objc_msgSend(v4, "lastPathComponent"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "containsString:", CFSTR("auxf"))))
  {
    objc_msgSend(v4, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("plist"));

    if ((v6 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
  }

LABEL_7:
  return v8;
}

- (BOOL)isValidEspressoFile:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("vi-nnet.mil")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("vi-nnet.weight.bin"));

  }
  return v5;
}

- (id)modelFileExtensions
{
  return &unk_24CB17500;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_creationQueue, 0);
}

- (NSString)plistPath
{
  MPCVocalAttenuationModel *model;

  model = self->_model;
  if (model)
    return model->_plistPath;
  else
    return 0;
}

- (NSString)basePath
{
  MPCVocalAttenuationModel *model;

  model = self->_model;
  if (model)
    return model->_basePath;
  else
    return 0;
}

- (void)purgeSideLoadedModelDirectoriesAtURL:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  __int128 v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[MPCVocalAttenuationModelProviderImplementation directoriesAtURL:](self, "directoriesAtURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v5)
  {
    v7 = v5;
    v24 = *(_QWORD *)v28;
    v23 = *MEMORY[0x24BDD0C78];
    v8 = *MEMORY[0x24BDD0CB0];
    *(_QWORD *)&v6 = 138543618;
    v21 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
        v35[0] = v23;
        v35[1] = v8;
        v36[0] = CFSTR("mobile");
        v36[1] = CFSTR("mobile");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2, v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        v13 = objc_msgSend(v4, "setAttributes:ofItemAtPath:error:", v11, v12, &v26);
        v14 = v26;

        if ((v13 & 1) == 0 && v14)
        {
          v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "path");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v32 = v16;
            v33 = 2114;
            v34 = v14;
            _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Error changing attributes for directory %{public}@: %{public}@", buf, 0x16u);

          }
        }
        v25 = v14;
        v17 = objc_msgSend(v4, "removeItemAtURL:error:", v10, &v25);
        v18 = v25;

        if ((v17 & 1) == 0 && v18)
        {
          v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "path");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v32 = v20;
            v33 = 2114;
            v34 = v18;
            _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Error removing  directory %{public}@: %{public}@", buf, 0x16u);

          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v7);
  }

}

- (BOOL)moveModelFromURL:(id)a3 toURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v30 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, 0, 4, &v36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v36;
  if (v9)
  {
    v10 = v9;
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v12;
      v39 = 2114;
      v40 = v10;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Error getting content of directory at URL %{public}@: %{public}@", buf, 0x16u);

    }
    v13 = 0;
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = v8;
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v14)
    {
      v15 = v14;
      v28 = v8;
      v29 = v6;
      v10 = 0;
      v16 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (-[MPCVocalAttenuationModelProviderImplementation isValidModelFile:](self, "isValidModelFile:", v18, v28, v29))
          {
            v19 = v18;
            v20 = (void *)MEMORY[0x24BDBCF48];
            objc_msgSend(v19, "lastPathComponent");
            v21 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "fileURLWithPath:relativeToURL:", v21, v30);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = 0;
            LOBYTE(v21) = objc_msgSend(v7, "moveItemAtURL:toURL:error:", v19, v22, &v31);
            v23 = v31;
            v10 = v23;
            if ((v21 & 1) == 0 && v23)
            {
              v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v19, "path");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "path");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v38 = v25;
                v39 = 2114;
                v40 = v26;
                v41 = 2114;
                v42 = v10;
                _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Error moving file %{public}@ -> %{public}@: %{public}@", buf, 0x20u);

              }
              v13 = 0;
              goto LABEL_20;
            }

          }
        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
        v13 = 1;
        if (v15)
          continue;
        break;
      }
LABEL_20:
      v8 = v28;
      v6 = v29;
    }
    else
    {
      v10 = 0;
      v13 = 1;
    }
  }

  return v13;
}

- (MPCVocalAttenuationModel)model
{
  return self->_model;
}

uint64_t __67__MPCVocalAttenuationModelProviderImplementation_directoriesAtURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasDirectoryPath");
}

uint64_t __76__MPCVocalAttenuationModelProviderImplementation_latestModelDirectoryAtURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v9;
  id v10;

  v10 = 0;
  v4 = *MEMORY[0x24BDBCBF0];
  v5 = a3;
  objc_msgSend(a2, "getResourceValue:forKey:error:", &v10, v4, 0);
  v9 = 0;
  v6 = v10;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v9, v4, 0);

  v7 = objc_msgSend(v6, "compare:", v9);
  return v7;
}

@end
