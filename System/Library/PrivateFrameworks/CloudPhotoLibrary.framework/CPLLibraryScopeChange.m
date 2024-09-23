@implementation CPLLibraryScopeChange

- (id)rewindAnchorsPerSharingScopes
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  CPLLibraryScopeChange *v10;
  __int16 v11;
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[CPLLibraryScopeChange rewindAnchorsPerSharingScopesData](self, "rewindAnchorsPerSharingScopesData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v8);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_14:

        goto LABEL_15;
      }
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v10 = self;
          v11 = 2112;
          v12 = v4;
          _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Invalid rewindAnchorsPerSharingScopesData for %@: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      if (_CPLSilentLogging)
      {
LABEL_13:
        v4 = 0;
        goto LABEL_14;
      }
      __CPLGenericOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v10 = self;
        v11 = 2112;
        v12 = v5;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Failed to deserialize rewindAnchorsPerSharingScopesData for %@: %@", buf, 0x16u);
      }
    }

    goto LABEL_13;
  }
  v4 = 0;
LABEL_15:

  return v4;
}

- (void)setRewindAnchorsPerSharingScopes:(id)a3
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (!v6)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v13 = v5;
          v14 = 2112;
          v15 = v7;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Failed to serialize %@ to NSData *rewindAnchorsPerSharingScopesData: %@", buf, 0x16u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopeChange.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v10, 360, CFSTR("Failed to serialize %@ to NSData *rewindAnchorsPerSharingScopesData: %@"), v5, v7);

      abort();
    }
    -[CPLLibraryScopeChange setRewindAnchorsPerSharingScopesData:](self, "setRewindAnchorsPerSharingScopesData:", v6);

  }
  else
  {
    -[CPLLibraryScopeChange setRewindAnchorsPerSharingScopesData:](self, "setRewindAnchorsPerSharingScopesData:", 0);
  }

}

- (BOOL)hasProblematicFormerSharedScope
{
  void *v2;
  BOOL v3;

  -[CPLLibraryScopeChange problematicFormerSharedScopeIdentifier](self, "problematicFormerSharedScopeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSData)rewindAnchorsPerSharingScopesData
{
  return self->_rewindAnchorsPerSharingScopesData;
}

- (void)setRewindAnchorsPerSharingScopesData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)problematicFormerSharedScopeIdentifier
{
  return self->_problematicFormerSharedScopeIdentifier;
}

- (void)setProblematicFormerSharedScopeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problematicFormerSharedScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_rewindAnchorsPerSharingScopesData, 0);
}

@end
