@implementation CKDKeyEnvelopeContext

- (void)dealloc
{
  _OpaquePCSShareProtection *shareProtection;
  objc_super v4;

  shareProtection = self->_shareProtection;
  if (shareProtection)
  {
    CFRelease(shareProtection);
    self->_shareProtection = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDKeyEnvelopeContext;
  -[CKDKeyEnvelopeContext dealloc](&v4, sel_dealloc);
}

- (void)setShareProtection:(_OpaquePCSShareProtection *)a3
{
  _OpaquePCSShareProtection *shareProtection;

  shareProtection = self->_shareProtection;
  if (shareProtection != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      shareProtection = self->_shareProtection;
    }
    self->_shareProtection = a3;
    if (shareProtection)
      CFRelease(shareProtection);
  }
}

- (CKDKeyEnvelopeContext)envelopeContextWithIdentifier:(id)a3 error:(id *)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  void *v36;

  v8 = a3;
  if (v8)
  {
    objc_msgSend_mergeableValueID(self, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_key(v9, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v15;
    if (v9 && v12 && v15)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_zoneID(v12, v16, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneName(v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v12, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v9, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v19, v30, (uint64_t)CFSTR("%@-%@-%@-%@-%@"), v23, v26, v18, v29, v8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = v31;
      objc_msgSend_dataUsingEncoding_(v31, v33, 4);
      v34 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v34;
      if (a4 && !v34)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v35, *MEMORY[0x1E0C94B20], 1000, CFSTR("Mergeable delta envelope context generation failed, invalid context encoding"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v16, *MEMORY[0x1E0C94B20], 1017, CFSTR("Mergeable delta envelope context generation failed, invalid mergeable value ID"));
      v36 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = 0;
    }

  }
  else if (a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v6, *MEMORY[0x1E0C94B20], 1017, CFSTR("Mergeable delta envelope context generation failed, missing delta identifier"));
    v36 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }

  return (CKDKeyEnvelopeContext *)v36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  const void *v7;
  const char *v8;
  uint64_t v9;
  const void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v7 = (const void *)objc_msgSend_shareProtection(self, v5, v6);
  if (v7)
  {
    v10 = v7;
    CFRetain(v7);
    v4[2] = v10;
  }
  *((_BYTE *)v4 + 8) = objc_msgSend_encryptMergeableValueMetadata(self, v8, v9);
  objc_msgSend_mergeableValueID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_copy(v13, v14, v15);
  v17 = (void *)v4[3];
  v4[3] = v16;

  return v4;
}

- (_OpaquePCSShareProtection)shareProtection
{
  return self->_shareProtection;
}

- (BOOL)encryptMergeableValueMetadata
{
  return self->_encryptMergeableValueMetadata;
}

- (void)setEncryptMergeableValueMetadata:(BOOL)a3
{
  self->_encryptMergeableValueMetadata = a3;
}

- (CKMergeableValueID)mergeableValueID
{
  return self->_mergeableValueID;
}

- (void)setMergeableValueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CKDPCSManager)pcsManager
{
  return self->_pcsManager;
}

- (void)setPcsManager:(id)a3
{
  objc_storeStrong((id *)&self->_pcsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcsManager, 0);
  objc_storeStrong((id *)&self->_mergeableValueID, 0);
}

@end
