@implementation IDSServerMaterialExchangeController

- (IDSServerMaterialExchangeController)initWithDelegate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  IDSServerMaterialExchangeController *v7;
  double v8;
  NSObject *v9;
  NSString *sessionID;
  NSMutableSet *v11;
  NSMutableSet *currentlySentMaterials;
  IDSServerMaterialExchangeController *v13;
  uint8_t v15[16];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IDSServerMaterialExchangeController;
  v7 = -[IDSServerMaterialExchangeController init](&v16, sel_init);
  if (v7)
  {
    objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v5, v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "ServerMaterialExchangeController initialized", v15, 2u);
    }

    v7->_needsUpdate = 0;
    objc_storeWeak((id *)&v7->_delegate, v4);
    sessionID = v7->_sessionID;
    v7->_sessionID = 0;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    currentlySentMaterials = v7->_currentlySentMaterials;
    v7->_currentlySentMaterials = v11;

    v7->_lock._os_unfair_lock_opaque = 0;
    v13 = v7;
  }

  return v7;
}

- (id)currentlySentMaterials
{
  return self->_currentlySentMaterials;
}

- (id)desiredMaterials
{
  return self->_desiredMaterials;
}

- (void)setDesiredMaterialsForSession:(id)a3 materials:(id)a4 signer:(id)a5
{
  id v8;
  id v9;
  NSSet *v10;
  const char *v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  const char *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  double v27;
  id v28;
  __CFString *v29;
  const char *v30;
  double v31;
  const char *v32;
  uint64_t v33;
  double v34;
  NSObject *v35;
  NSString *sessionID;
  const char *v37;
  uint64_t v38;
  double v39;
  NSMutableSet *v40;
  NSMutableSet *currentlySentMaterials;
  NSSet *desiredMaterials;
  NSSet *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  id signDataBlock;
  const char *v49;
  uint64_t v50;
  double v51;
  id obj;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  NSString *v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v8 = a3;
  v9 = a4;
  v53 = a5;
  os_unfair_lock_lock(&self->_lock);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v10 = (NSSet *)v9;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v54, v12, v62, 16);
  if (v13)
  {
    v17 = v13;
    v18 = *(_QWORD *)v55;
    v19 = &stru_1E3C2E4E8;
    do
    {
      v20 = 0;
      v21 = v19;
      do
      {
        if (*(_QWORD *)v55 != v18)
          objc_enumerationMutation(v10);
        v22 = objc_msgSend_type(*(void **)(*((_QWORD *)&v54 + 1) + 8 * v20), v14, v15, v16);
        objc_msgSend_stringByAppendingFormat_(v21, v23, (uint64_t)CFSTR(" <%d>"), v24, v22, obj);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v20;
        v21 = v19;
      }
      while (v17 != v20);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v14, (uint64_t)&v54, v16, v62, 16);
    }
    while (v17);
  }
  else
  {
    v19 = &stru_1E3C2E4E8;
  }

  objc_msgSend_count(v10, v25, v26, v27);
  v28 = v8;
  v29 = v19;
  cut_dispatch_log_queue();
  if ((objc_msgSend_isEqual_(v28, v30, (uint64_t)self->_sessionID, v31) & 1) == 0)
  {
    objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      sessionID = self->_sessionID;
      *(_DWORD *)buf = 138412546;
      v59 = sessionID;
      v60 = 2112;
      v61 = v28;
      _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "setDesiredMaterialsForSession: session ID was %@; now %@",
        buf,
        0x16u);
    }

    objc_msgSend_set(MEMORY[0x1E0C99E20], v37, v38, v39);
    v40 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    currentlySentMaterials = self->_currentlySentMaterials;
    self->_currentlySentMaterials = v40;

    objc_storeStrong((id *)&self->_sessionID, obj);
  }
  desiredMaterials = self->_desiredMaterials;
  self->_desiredMaterials = v10;
  v43 = v10;

  v47 = (void *)objc_msgSend_copy(v53, v44, v45, v46);
  signDataBlock = self->_signDataBlock;
  self->_signDataBlock = v47;

  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend_setNeedsUpdate(self, v49, v50, v51);

}

- (void)setNeedsUpdate
{
  os_unfair_lock_s *p_lock;
  _BOOL4 needsUpdate;
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  _QWORD v11[5];
  uint8_t buf[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  needsUpdate = self->_needsUpdate;
  objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (needsUpdate)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "setNeedsUpdate: update cycle already scheduled", buf, 2u);
    }

  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "setNeedsUpdate: scheduling new update cycle", buf, 2u);
    }

    v10 = MEMORY[0x1E0C809B0];
    self->_needsUpdate = 1;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = sub_19BAE3A40;
    v11[3] = &unk_1E3C1F258;
    v11[4] = self;
    IDSTransportThreadAddBlock(v11);
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)buildMaterialInfoForDesiredMaterialData:(id)a3 materialType:(int)a4 materialID:(id)a5 sessionID:(id)a6 requireSign:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  double v17;
  NSObject *v18;
  const __CFString *v19;
  int v20;
  const char *v21;
  uint64_t v22;
  double v23;
  NSObject *v24;
  const char *v25;
  int v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  int v32;
  id v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v7 = a7;
  v10 = *(_QWORD *)&a4;
  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 1024;
    v19 = CFSTR("NO");
    v32 = 138413314;
    v33 = v13;
    if (v7)
      v19 = CFSTR("YES");
    v35 = v10;
    v36 = 2112;
    v37 = v14;
    v38 = 2112;
    v39 = v19;
    v40 = 2112;
    v41 = v12;
    _os_log_impl(&dword_19B949000, v18, OS_LOG_TYPE_DEFAULT, "buildMaterialInfoForDesiredMaterialData: materialID: %@ type: %d, sessionID %@, requireSign: %@, data: %@", (uint8_t *)&v32, 0x30u);
  }

  v20 = IMGetDomainBoolForKey();
  if ((_DWORD)v10 == 12 && v20)
  {
    objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      v25 = "buildMaterialInfoForDesiredMaterialData: AVC datablob, dont build the material, return";
LABEL_13:
      _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v32, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v26 = IMGetDomainBoolForKey();
  if ((_DWORD)v10 == 13 && v26)
  {
    objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v27, v28, v29);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      v25 = "buildMaterialInfoForDesiredMaterialData: MKM, dont build the material, return";
      goto LABEL_13;
    }
LABEL_14:

    v30 = 0;
    goto LABEL_19;
  }
  if (v7)
    objc_msgSend__buildMaterialInfoForDesiredMaterialDataRequireSignature_materialType_materialID_sessionID_(self, v27, (uint64_t)v12, v29, v10, v13, v14);
  else
    objc_msgSend__buildMaterialInfoForDesiredMaterialDataNoSignature_materialType_materialID_sessionID_(self, v27, (uint64_t)v12, v29, v10, v13, v14);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v30;
}

- (id)_buildMaterialInfoForDesiredMaterialDataNoSignature:(id)a3 materialType:(int)a4 materialID:(id)a5 sessionID:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  double v14;
  NSObject *v15;
  IDSQRProtoMaterialInfo *v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v8 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412802;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "_buildMaterialInfoForDesiredMaterialDataNoSignature: materialID: %@, sessionID %@, materialData: %@", (uint8_t *)&v24, 0x20u);
  }

  v16 = objc_alloc_init(IDSQRProtoMaterialInfo);
  objc_msgSend_setMaterialId_(v16, v17, (uint64_t)v10, v18);
  objc_msgSend_setMaterialContent_(v16, v19, (uint64_t)v9, v20);
  objc_msgSend_setMaterialType_(v16, v21, v8, v22);

  return v16;
}

- (id)_buildMaterialInfoForDesiredMaterialDataRequireSignature:(id)a3 materialType:(int)a4 materialID:(id)a5 sessionID:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  double v15;
  NSObject *v16;
  os_unfair_lock_s *p_lock;
  void (**v18)(void *, NSObject *, id *);
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  const char *v24;
  double v25;
  NSObject *v26;
  const char *v27;
  double v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  IDSQRProtoMaterialInfo *v35;
  const char *v36;
  double v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  NSObject *v42;
  void *v43;
  const char *v44;
  double v45;
  id v47;
  _QWORD v48[3];
  _QWORD v49[3];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  int v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v8 = *(_QWORD *)&a4;
  v58 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v13, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v51 = v11;
    v52 = 2112;
    v53 = v12;
    v54 = 1024;
    v55 = v8;
    v56 = 2112;
    v57 = v10;
    _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "_buildMaterialInfoForDesiredMaterialDataRequireSignature: materialID: %@ sessionID %@, type: %d, materialData: %@", buf, 0x26u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v18 = (void (**)(void *, NSObject *, id *))_Block_copy(self->_signDataBlock);
  os_unfair_lock_unlock(p_lock);
  if (v18)
  {
    v22 = (void *)MEMORY[0x1E0C99DF0];
    objc_msgSend_dataUsingEncoding_(v12, v19, 4, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithData_(v22, v24, (uint64_t)v23, v25);
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_appendData_(v26, v27, (uint64_t)v10, v28);
    v47 = 0;
    v18[2](v18, v26, &v47);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v47;
    v34 = v30;
    if (!v29 || v30)
    {
      objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v31, v32, v33);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        sub_19BAFA7D8((uint64_t)v34, v42);
      v35 = 0;
    }
    else
    {
      v35 = objc_alloc_init(IDSQRProtoMaterialInfo);
      objc_msgSend_setMaterialId_(v35, v36, (uint64_t)v11, v37);
      objc_msgSend_setMaterialType_(v35, v38, v8, v39);
      v48[0] = CFSTR("payload");
      v48[1] = CFSTR("sessionID");
      v49[0] = v10;
      v49[1] = v12;
      v48[2] = CFSTR("signature");
      v49[2] = v29;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v40, (uint64_t)v49, v41, v48, 3);
      v42 = objc_claimAutoreleasedReturnValue();
      JWEncodeDictionary();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setMaterialContent_(v35, v44, (uint64_t)v43, v45);

    }
  }
  else
  {
    objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v19, v20, v21);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_19BAFA798(v26);
    v35 = 0;
  }

  return v35;
}

- (id)materialProtosForDesiredMaterials:(id)a3 failures:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  double v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  IDSServerMaterialExchangeController *v21;
  id v22;
  id v23;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_19BAE4194;
  v19[3] = &unk_1E3C22318;
  v11 = v10;
  v20 = v11;
  v21 = self;
  v22 = v6;
  v12 = v9;
  v23 = v12;
  v13 = v6;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v14, (uint64_t)v19, v15);

  v16 = v11;
  cut_dispatch_log_queue();
  v17 = v12;

  return v17;
}

- (id)pendingMaterials
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_desiredMaterials(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_mutableCopy(v7, v8, v9, v10);

  objc_msgSend_currentlySentMaterials(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_copy(v15, v16, v17, v18);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend_minusSet_(v11, v20, (uint64_t)v19, v21);

  return v11;
}

- (void)update
{
  uint64_t v2;
  double v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  const char *v41;
  uint64_t v42;
  double v43;
  const char *v44;
  uint64_t v45;
  double v46;
  NSObject *v47;
  const char *v48;
  double v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  const char *v54;
  uint64_t v55;
  double v56;
  NSObject *v57;
  id WeakRetained;
  const char *v59;
  double v60;
  int v61;
  const char *v62;
  double v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  uint8_t buf[16];

  self->_needsUpdate = 0;
  objc_msgSend_ServerMaterialExchange(IDSFoundationLog, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "update: comparing desired and server materials", buf, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_desiredMaterials(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_mutableCopy(v9, v10, v11, v12);

  objc_msgSend_currentlySentMaterials(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend_copy(v17, v18, v19, v20);

  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend_pendingMaterials(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v13, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v21;
  objc_msgSend_description(v21, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v25, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v29;
  v67 = v38;
  v39 = v33;
  v40 = v37;
  cut_dispatch_log_queue();
  if (objc_msgSend_count(v25, v41, v42, v43))
  {
    v65 = v13;
    objc_msgSend_set(MEMORY[0x1E0C99E20], v44, v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_materialProtosForDesiredMaterials_failures_(self, v48, (uint64_t)v25, v49, v47);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v38;
    if (objc_msgSend_count(v50, v51, v52, v53))
    {
      objc_msgSend_description(v50, v54, v55, v56);
      v57 = (id)objc_claimAutoreleasedReturnValue();
      cut_dispatch_log_queue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v61 = objc_msgSend_qrMaterialExchangePutMaterial_(WeakRetained, v59, (uint64_t)v50, v60);

      if (v61)
      {
        objc_msgSend_minusSet_(v65, v62, (uint64_t)v47, v63);
        os_unfair_lock_lock(&self->_lock);
        objc_storeStrong((id *)&self->_currentlySentMaterials, v65);
        os_unfair_lock_unlock(&self->_lock);
      }

      v21 = v66;
    }
    else
    {
      objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v54, v55, v56);
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v57, OS_LOG_TYPE_DEFAULT, "update: no materials to send", buf, 2u);
      }
    }

    v38 = v64;
    v13 = v65;
  }
  else
  {
    objc_msgSend_ServerMaterialExchange(IDSFoundationLog, v44, v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v47, OS_LOG_TYPE_DEFAULT, "update: nothing to send", buf, 2u);
    }
  }

}

- (void)invalidateMaterialsInSet:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  double v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_minusSet_(self->_currentlySentMaterials, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)invalidateMaterialsInArray:(id)a3
{
  double v3;
  const char *v5;
  double v6;
  id v7;

  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], a2, (uint64_t)a3, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidateMaterialsInSet_(self, v5, (uint64_t)v7, v6);

}

- (void)markMaterialsInSetAsSent:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  double v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_unionSet_(self->_currentlySentMaterials, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)markMaterialsInArrayAsSent:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  double v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_addObjectsFromArray_(self->_currentlySentMaterials, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
}

- (IDSServerMaterialExchangeDelegate)delegate
{
  return (IDSServerMaterialExchangeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_signDataBlock, 0);
  objc_storeStrong((id *)&self->_desiredMaterials, 0);
  objc_storeStrong((id *)&self->_currentlySentMaterials, 0);
}

@end
