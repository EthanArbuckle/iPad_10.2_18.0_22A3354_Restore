@implementation GEOResourceInfo

- (BOOL)validateResourceAtPath:(id)a3 useExtendedAttrs:(BOOL)a4 log:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  int v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  __CFString *v19;
  void *v20;
  char v21;
  BOOL v22;
  NSObject *v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  __CFString *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v6 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = -[GEOResourceInfo validationMethod](self, "validationMethod");
  if (v10 == 1)
  {
    +[GEOSignedResource validateResourceAtPath:](GEOSignedResource, "validateResourceAtPath:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
LABEL_18:
      v22 = 1;
      goto LABEL_28;
    }
  }
  else
  {
    if (v10)
      goto LABEL_18;
    -[GEOResourceInfo checksum](self, "checksum");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_18;
    if (v6)
    {
      v12 = (__CFString *)v8;
      v13 = v9;
      GEOGetSHA1FromExtendedAttributes(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
      {
        v15 = v14;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          v30 = v12;
          _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_DEBUG, "Checksum not found in extended attributes for '%{private}@'. Calculating instead...", buf, 0xCu);
        }
        GEOCalculateSHA1ForFile(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = 0;
        v18 = GEOSetSHA1OnExtendedAttribute(v12, v17, &v28);
        v19 = (__CFString *)v28;
        if (!v18 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v19;
          _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Failed to write checksum into extended attributes: %{public}@", buf, 0xCu);
        }
        v15 = v17;

      }
    }
    else
    {
      GEOCalculateSHA1ForFile(v8);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[GEOResourceInfo checksum](self, "checksum");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToData:", v15);

    if ((v21 & 1) != 0)
      goto LABEL_18;
    v16 = 0;
  }
  v23 = v9;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = -[GEOResourceInfo validationMethod](self, "validationMethod");
    if ((_DWORD)v24)
    {
      if ((_DWORD)v24 == 1)
      {
        v25 = CFSTR("CMS");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v24);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v25 = CFSTR("SHA1");
    }
    -[GEOResourceInfo name](self, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v25;
    v31 = 2114;
    v32 = v26;
    v33 = 2112;
    v34 = v16;
    _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "Incorrect %{public}@ for cached resource %{public}@: %@", buf, 0x20u);

  }
  v22 = 0;
LABEL_28:

  return v22;
}

- (int)validationMethod
{
  int result;

  result = -[GEOResource hasValidationMethod](self->_resource, "hasValidationMethod");
  if (result)
    return -[GEOResource validationMethod](self->_resource, "validationMethod");
  return result;
}

- (BOOL)shouldCheckForUpdateForResourceAtPath:(id)a3 useExtendedAttrs:(BOOL)a4 forceUpdateCheck:(BOOL)a5 log:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  int v12;
  BOOL v13;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double Double;
  NSObject *v26;
  void *v27;
  double v28;
  NSString **p_eTag;
  NSString *eTag;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v8 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = -[GEOResource updateMethod](self->_resource, "updateMethod");
  v13 = v12 == 1;
  if (v12 == 1 && v8)
  {
    GEOGetETagFromExtendedAttributes(v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
    {
      if (!a5)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        v17 = *MEMORY[0x1E0C998D8];
        v32 = 0;
        v18 = objc_msgSend(v16, "getResourceValue:forKey:error:", &v33, v17, &v32);
        v19 = v33;
        v20 = v32;
        if ((v18 & 1) != 0)
        {
          objc_msgSend(v19, "timeIntervalSinceNow");
          v22 = v21;
          objc_msgSend(v19, "timeIntervalSinceNow");
          if (v22 >= 0.0)
            v24 = v23;
          else
            v24 = -v23;
          if (-[GEOResource hasTimeToLiveSeconds](self->_resource, "hasTimeToLiveSeconds"))
            Double = (double)-[GEOResource timeToLiveSeconds](self->_resource, "timeToLiveSeconds");
          else
            Double = GEOConfigGetDouble(GeoServicesConfig_DefaultResourceTTL, (uint64_t)off_1EDF4DE28);
          v28 = fmax(Double, 3600.0);

          if (v24 <= v28)
          {
            v13 = 0;
            goto LABEL_21;
          }
        }
        else
        {
          v26 = v11;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            -[GEOResourceInfo name](self, "name");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v35 = v27;
            v36 = 2112;
            v37 = v20;
            _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_ERROR, "Unable to read modification time for resource %{public}@: %@", buf, 0x16u);

          }
        }
      }
      eTag = self->_eTag;
      p_eTag = &self->_eTag;
      if (!eTag)
        objc_storeStrong((id *)p_eTag, v15);
    }
    v13 = 1;
LABEL_21:

  }
  return v13;
}

- (GEOResource)resource
{
  return self->_resource;
}

- (NSString)name
{
  return -[GEOResource filename](self->_resource, "filename");
}

- (NSArray)equivalentResources
{
  return self->_equivalentResources;
}

- (NSData)checksum
{
  return -[GEOResource checksum](self->_resource, "checksum");
}

- (GEOResourceInfo)initWithResource:(id)a3
{
  id v5;
  GEOResourceInfo *v6;
  GEOResourceInfo *v7;
  GEOResourceInfo *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOResourceInfo;
  v6 = -[GEOResourceInfo init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resource, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eTag, 0);
  objc_storeStrong((id *)&self->_equivalentResources, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

- (int)type
{
  return -[GEOResource resourceType](self->_resource, "resourceType");
}

- (BOOL)validateResource:(id)a3 log:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  __CFString *v18;
  BOOL v19;
  void *v20;
  uint8_t buf[4];
  __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[GEOResourceInfo validationMethod](self, "validationMethod");
  if (v8 == 1)
  {
    -[GEOResourceInfo name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[GEOSignedResource typeForResourceByFileName:](GEOSignedResource, "typeForResourceByFileName:", v14);

    +[GEOSignedResource validateResource:withData:](GEOSignedResource, "validateResource:withData:", v15, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_7;
LABEL_11:
    v19 = 1;
    goto LABEL_16;
  }
  if (v8)
    goto LABEL_11;
  -[GEOResourceInfo checksum](self, "checksum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_11;
  objc_msgSend(v6, "_geo_SHA1Hash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResourceInfo checksum](self, "checksum");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToData:", v11);

  if ((v12 & 1) != 0)
    goto LABEL_11;
  v13 = 0;
LABEL_7:
  v16 = v7;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = -[GEOResourceInfo validationMethod](self, "validationMethod");
    if ((_DWORD)v17)
    {
      if ((_DWORD)v17 == 1)
      {
        v18 = CFSTR("CMS");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v18 = CFSTR("SHA1");
    }
    -[GEOResourceInfo name](self, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v18;
    v24 = 2114;
    v25 = v20;
    v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "Incorrect %{public}@ for cached resource %{public}@: %@", buf, 0x20u);

  }
  v19 = 0;
LABEL_16:

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOResource filename](self->_resource, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResource checksum](self->_resource, "checksum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_geo_hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setEquivalentResources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)eTag
{
  return self->_eTag;
}

- (void)setETag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
