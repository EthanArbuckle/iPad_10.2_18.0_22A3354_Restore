@implementation CPLFaceCropChange

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

- (id)personScopedIdentifier
{
  void *v3;
  CPLScopedIdentifier *v4;
  void *v5;
  id v6;

  -[CPLFaceCropChange personIdentifier](self, "personIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [CPLScopedIdentifier alloc];
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v4, "initRelativeToScopedIdentifier:identifier:", v5, v3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setPersonScopedIdentifier:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(v21, "scopeIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopeIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v5 && v7)
  {
    v8 = objc_msgSend((id)v5, "isEqual:", v7);

    if ((v8 & 1) == 0)
      goto LABEL_4;
  }
  else
  {

    if (v5 | v7)
    {
LABEL_4:
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "scopeIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "scopeIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v23 = v10;
          v24 = 2112;
          v25 = v12;
          v26 = 2112;
          v27 = v13;
          _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Invalid call to %@ with mismatched scope: %@ vs. %@", buf, 0x20u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFaceCropChange.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scopeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "scopeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 45, CFSTR("Invalid call to %@ with mismatched scope: %@ vs. %@"), v16, v18, v19);

      abort();
    }
  }
  objc_msgSend(v21, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLFaceCropChange setPersonIdentifier:](self, "setPersonIdentifier:", v20);

}

- (BOOL)validateFullRecord
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLFaceCropChange;
  v3 = -[CPLRecordChange validateFullRecord](&v5, sel_validateFullRecord);
  if (v3)
  {
    if (self->_personIdentifier)
      LOBYTE(v3) = self->_faceCropType != 0;
    else
      LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)validateChangeWithError:(id *)a3
{
  _BOOL4 v5;
  const __CFString *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPLFaceCropChange;
  v5 = -[CPLRecordChange validateChangeWithError:](&v9, sel_validateChangeWithError_);
  if (v5)
  {
    if (!-[CPLRecordChange hasChangeType:](self, "hasChangeType:", 2))
    {
LABEL_5:
      LOBYTE(v5) = 1;
      return v5;
    }
    if (self->_personIdentifier)
    {
      if (self->_faceCropType)
        goto LABEL_5;
      if (a3)
      {
        v6 = CFSTR("%@ has no valid type");
        goto LABEL_10;
      }
    }
    else if (a3)
    {
      v6 = CFSTR("%@ has no person identifier");
LABEL_10:
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 18, v6, self);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v7;
      return v5;
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)propertiesDescription
{
  void *v3;
  NSString *personIdentifier;
  NSUInteger v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  personIdentifier = self->_personIdentifier;
  v5 = -[NSData length](self->_resourceData, "length");
  _CPLShortDescriptionForFaceCropType(self->_faceCropType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("person: %@ resource: %lub [%@]"), personIdentifier, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (void)setPersonIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSData)resourceData
{
  return self->_resourceData;
}

- (void)setResourceData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (int64_t)faceCropType
{
  return self->_faceCropType;
}

- (void)setFaceCropType:(int64_t)a3
{
  self->_faceCropType = a3;
}

- (NSString)rejectedPersonIdentifier
{
  return self->_rejectedPersonIdentifier;
}

- (void)setRejectedPersonIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectedPersonIdentifier, 0);
  objc_storeStrong((id *)&self->_resourceData, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
}

+ (BOOL)supportsDeletion
{
  return 1;
}

+ (BOOL)supportsDirectDeletion
{
  return 1;
}

@end
