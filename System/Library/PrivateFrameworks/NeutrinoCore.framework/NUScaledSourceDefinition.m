@implementation NUScaledSourceDefinition

- (id)sourceContainerNodeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  NUCIImageSourceDefinition *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NUScaledSourceContainerNode *v21;
  NSObject *v23;
  void *v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_6578();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v30;
        v43 = 2114;
        v44 = v34;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUScaledSourceDefinition(NodeProvider) sourceContainerNodeWithIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 470, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)"error != NULL");
  }
  v7 = v6;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc(MEMORY[0x1E0C9DDC8]);
  objc_msgSend(MEMORY[0x1E0C9DD80], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithColor:", v10);

  v12 = (double)-[NUScaledSourceDefinition fullSize](self, "fullSize");
  -[NUScaledSourceDefinition fullSize](self, "fullSize");
  objc_msgSend(v11, "imageByCroppingToRect:", 0.0, 0.0, v12, (double)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[NUCIImageSourceDefinition initWithCIImage:orientation:]([NUCIImageSourceDefinition alloc], "initWithCIImage:orientation:", v14, 1);
  v40 = 0;
  -[NUCIImageSourceDefinition generateSourceNodeWithIdentifier:error:](v15, "generateSourceNodeWithIdentifier:error:", v7, &v40);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v40;
  if (v16)
  {
    -[NUScaledSourceDefinition source](self, "source");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v18, "generateSourceNodeWithIdentifier:error:", v7, &v39);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v39;

    if (v19)
    {
      objc_msgSend(v8, "addObject:", v16);
      objc_msgSend(v8, "addObject:", v19);
      v21 = -[NUMultipleSourceContainerNode initWithSourceNodes:assetIdentifier:]([NUScaledSourceContainerNode alloc], "initWithSourceNodes:assetIdentifier:", v8, v7);
    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to generate source node"), v7, v20);
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to generate dummy full size source node"), v7, v17);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v17;
  }

  return v21;
}

- (NUScaledSourceDefinition)initWithSourceDefinition:(id)a3 sourceSize:(id)a4 fullSize:(id)a5
{
  int64_t var1;
  int64_t var0;
  int64_t v7;
  int64_t v8;
  NUSingleSourceDefinition *v10;
  NUScaledSourceDefinition *v11;
  NUSingleSourceDefinition *source;
  objc_super v14;

  var1 = a5.var1;
  var0 = a5.var0;
  v7 = a4.var1;
  v8 = a4.var0;
  v10 = (NUSingleSourceDefinition *)a3;
  v14.receiver = self;
  v14.super_class = (Class)NUScaledSourceDefinition;
  v11 = -[NUSingleSourceDefinition init](&v14, sel_init);
  source = v11->_source;
  v11->_source = v10;

  v11->_sourceSize.width = v8;
  v11->_sourceSize.height = v7;
  v11->_fullSize.width = var0;
  v11->_fullSize.height = var1;
  return v11;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  NUDefaultSourceDerivation *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v3 = objc_alloc_init(NUDefaultSourceDerivation);
  v4 = -[NUDefaultSourceDerivation scaleFromOriginalSize:derivativeSize:](v3, "scaleFromOriginalSize:derivativeSize:", self->_fullSize.width, self->_fullSize.height, self->_sourceSize.width, self->_sourceSize.height);
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (int64_t)mediaType
{
  return -[NUSourceDefinition mediaType](self->_source, "mediaType");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p fullSize:(%li,%li) sourceSize:(%li,%li) source:%@>"), objc_opt_class(), self, self->_fullSize.width, self->_fullSize.height, self->_sourceSize.width, self->_sourceSize.height, self->_source);
}

- (NUSingleSourceDefinition)source
{
  return (NUSingleSourceDefinition *)objc_getProperty(self, a2, 24, 1);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)sourceSize
{
  int64_t v2;
  int64_t v3;
  _QWORD v4[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  objc_copyStruct(v4, &self->_sourceSize, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)fullSize
{
  int64_t v2;
  int64_t v3;
  _QWORD v4[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  objc_copyStruct(v4, &self->_fullSize, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

@end
