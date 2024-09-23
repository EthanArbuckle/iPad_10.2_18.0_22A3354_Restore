@implementation CKMediaObjectManager

Class __28__CKMediaObjectManager_init__block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

- (CKMediaObjectManager)init
{
  CKMediaObjectManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  NSString *v21;
  Class v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  void *v40;
  CKMediaObjectManager *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  id v56;
  objc_super v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _QWORD v60[16];

  v60[14] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)CKMediaObjectManager;
  v2 = -[CKMediaObjectManager init](&v57, sel_init);
  if (v2)
  {
    v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKMediaObjectManager setTransfers:](v2, "setTransfers:");
    v3 = (void *)MEMORY[0x1E0C99DE8];
    v60[0] = objc_opt_class();
    v60[1] = objc_opt_class();
    v60[2] = objc_opt_class();
    v60[3] = objc_opt_class();
    v60[4] = objc_opt_class();
    v60[5] = objc_opt_class();
    v60[6] = objc_opt_class();
    v60[7] = objc_opt_class();
    v60[8] = objc_opt_class();
    v60[9] = objc_opt_class();
    v60[10] = objc_opt_class();
    v60[11] = objc_opt_class();
    v60[12] = objc_opt_class();
    v60[13] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKPassPreviewMediaObject isSupported](CKPassPreviewMediaObject, "isSupported");
    objc_msgSend(v5, "insertObject:atIndex:", objc_opt_class(), 0);
    objc_msgSend(v5, "insertObject:atIndex:", objc_opt_class(), 0);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("kCKMediaObjectManagerDefaultsClasses"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "__imArrayByApplyingBlock:", &__block_literal_global_236);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildVersion");
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", CFSTR("kCKMediaObjectManagerDefaultsOSVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)v10;
    v44 = v8;
    v42 = v11;
    if (objc_msgSend(v8, "isEqual:", v5) && (objc_msgSend(v11, "isEqualToString:", v10) & 1) != 0)
    {
      v12 = v5;
      -[CKMediaObjectManager setClasses:](v2, "setClasses:", v8);
      objc_msgSend(v6, "objectForKey:", CFSTR("kCKMediaObjectManagerDefaultsUTITypes"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v13, "mutableCopy");

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      objc_msgSend(v14, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v47 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(v14, "objectForKey:", v20);
            v21 = (NSString *)objc_claimAutoreleasedReturnValue();
            v22 = NSClassFromString(v21);
            if (v22)
              objc_msgSend(v14, "setObject:forKey:", v22, v20);
            else
              objc_msgSend(v14, "removeObjectForKey:", v20);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        }
        while (v17);
      }

      objc_msgSend(v6, "objectForKey:", CFSTR("kCKMediaObjectManagerDefaultsDynTypes"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (id)objc_msgSend(v23, "mutableCopy");

      -[CKMediaObjectManager setUTITypes:](v2, "setUTITypes:", v14);
      -[CKMediaObjectManager setDynTypes:](v2, "setDynTypes:", v24);
      v25 = v43;
    }
    else
    {
      -[CKMediaObjectManager setClasses:](v2, "setClasses:", v5, CFSTR("kCKMediaObjectManagerDefaultsOSVersion"));
      v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __28__CKMediaObjectManager_init__block_invoke_2;
      v54[3] = &unk_1E2759B18;
      v14 = v26;
      v55 = v14;
      v24 = v27;
      v56 = v24;
      v40 = v5;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v54);
      -[CKMediaObjectManager setUTITypes:](v2, "setUTITypes:", v14);
      v41 = v2;
      -[CKMediaObjectManager setDynTypes:](v2, "setDynTypes:", v24);
      v28 = (void *)objc_msgSend(v14, "mutableCopy");
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      objc_msgSend(v28, "allKeys");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v51 != v32)
              objc_enumerationMutation(v29);
            v34 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
            NSStringFromClass((Class)(id)objc_msgSend(v28, "objectForKey:", v34));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKey:", v35, v34);

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        }
        while (v31);
      }

      v12 = v40;
      objc_msgSend(v40, "__imArrayByApplyingBlock:", &__block_literal_global_58_1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v28, CFSTR("kCKMediaObjectManagerDefaultsUTITypes"));
      objc_msgSend(v6, "setObject:forKey:", v24, CFSTR("kCKMediaObjectManagerDefaultsDynTypes"));
      v25 = v43;
      objc_msgSend(v6, "setObject:forKey:", v43, v39);
      objc_msgSend(v6, "setObject:forKey:", v36, CFSTR("kCKMediaObjectManagerDefaultsClasses"));

      v2 = v41;
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v2, sel_transferRemoved_, CFSTR("CKFileTransferRemovedNotification"), 0);

  }
  return v2;
}

- (void)setUTITypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setTransfers:(id)a3
{
  objc_storeStrong((id *)&self->_transfers, a3);
}

- (void)setDynTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)mediaObjectWithTransferGUID:(id)a3 imMessage:(id)a4
{
  return -[CKMediaObjectManager mediaObjectWithTransferGUID:imMessage:chatContext:](self, "mediaObjectWithTransferGUID:imMessage:chatContext:", a3, a4, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_once_4 != -1)
    dispatch_once(&sharedInstance_once_4, &__block_literal_global_62_2);
  return (id)sharedInstance_sMediaObjectManager;
}

- (void)transferRemoved:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CKMediaObjectManager transfers](self, "transfers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v4);

  }
}

- (id)mediaObjectWithTransferGUID:(id)a3 imMessage:(id)a4 chatContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v34 = a5;
  -[CKMediaObjectManager transfers](self, "transfers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[CKMediaObjectManager transferWithTransferGUID:imMessage:](self, "transferWithTransferGUID:imMessage:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (objc_msgSend(v8, "length"))
      {
        -[CKMediaObjectManager transfers](self, "transfers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v11, v8);

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transferForGUID:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "filename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isSticker");
    v16 = v13;
  }
  else
  {
    objc_msgSend(v11, "filename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "isSticker");
    v16 = v11;
  }
  v18 = objc_msgSend(v16, "isAdaptiveImageGlyph");
  v19 = -[CKMediaObjectManager classForFilename:](self, "classForFilename:", v14);
  if ((v18 & 1) != 0
    || (v20 = v19, v15)
    && ((-[objc_class isEqual:](v19, "isEqual:", objc_opt_class()) & 1) != 0
     || objc_msgSend(v20, "isEqual:", objc_opt_class())))
  {
    v20 = (void *)objc_opt_class();
  }
  if (objc_msgSend(v20, "isEqual:", objc_opt_class()))
  {
    if ((objc_msgSend(v11, "fileIsAnimated") & 1) == 0)
    {
      -[CKMediaObjectManager UTITypeForFilename:](self, "UTITypeForFilename:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqualToString:", v22);

      if (v23)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "UTI type was possibly animated, but it wasn't actually multi-frame.", buf, 2u);
          }

        }
        v20 = (void *)objc_opt_class();
      }
    }
  }
  objc_msgSend(v9, "__ck_context");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  if ((objc_msgSend(v9, "isFromMe") & 1) == 0)
    objc_msgSend(v26, "setSpam:", objc_msgSend(v34, "isSpam"));
  objc_msgSend(v26, "setChatContext:", v34);
  objc_msgSend(v9, "__ck_service");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setServiceName:", v28);

  v29 = (void *)objc_msgSend(objc_alloc((Class)v20), "initWithTransfer:context:forceInlinePreview:", v11, v26, 0);
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(46);
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "guid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v29;
      v37 = 2112;
      v38 = v31;
      _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_DEBUG, "Create mediaObject %@ for transfer %@.", buf, 0x16u);

    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    objc_msgSend(v11, "guid");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    _CKLog();

  }
  return v29;
}

- (NSMutableDictionary)transfers
{
  return self->_transfers;
}

- (id)transferWithTransferGUID:(id)a3 imMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc(-[CKMediaObjectManager transferClass](self, "transferClass")), "initWithTransferGUID:imMessage:", v7, v6);

  return v8;
}

- (Class)transferClass
{
  return (Class)objc_opt_class();
}

- (Class)classForFilename:(id)a3
{
  void *v4;
  objc_class *v5;

  -[CKMediaObjectManager UTITypeForFilename:](self, "UTITypeForFilename:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKMediaObjectManager classForUTIType:](self, "classForUTIType:", v4);

  return v5;
}

- (Class)classForUTIType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_class *v7;

  v4 = a3;
  -[CKMediaObjectManager UTITypes](self, "UTITypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "objectForKey:", v4);

  if (!v6)
    v6 = (id)objc_opt_class();
  v7 = (objc_class *)v6;

  return v7;
}

- (NSDictionary)UTITypes
{
  return self->_UTITypes;
}

- (id)UTITypeForFilename:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    IMAttachmentFileNameAndExtension();
    v5 = 0;
    -[CKMediaObjectManager UTITypeForExtension:](self, "UTITypeForExtension:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)UTITypeForExtension:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  id PreferredIdentifierForTag;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "lowercaseString");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObjectManager dynTypes](self, "dynTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    PreferredIdentifierForTag = (id)objc_claimAutoreleasedReturnValue();

    if (!PreferredIdentifierForTag)
    {
      IMLookUpExtensionInCache();
      PreferredIdentifierForTag = (id)objc_claimAutoreleasedReturnValue();
      if (!PreferredIdentifierForTag)
        PreferredIdentifierForTag = (id)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], v5, 0);
    }

  }
  else
  {
    PreferredIdentifierForTag = (id)*MEMORY[0x1E0CA5B18];
  }

  return PreferredIdentifierForTag;
}

- (NSDictionary)dynTypes
{
  return self->_dynTypes;
}

void __38__CKMediaObjectManager_sharedInstance__block_invoke()
{
  CKMediaObjectManager *v0;
  void *v1;

  v0 = objc_alloc_init(CKMediaObjectManager);
  v1 = (void *)sharedInstance_sMediaObjectManager;
  sharedInstance_sMediaObjectManager = (uint64_t)v0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKMediaObjectManager;
  -[CKMediaObjectManager dealloc](&v4, sel_dealloc);
}

void __28__CKMediaObjectManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  void *v8;

  objc_msgSend(a2, "UTITypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__CKMediaObjectManager_init__block_invoke_3;
  v5[3] = &unk_1E2759AF0;
  v6 = *(id *)(a1 + 32);
  v8 = a2;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __28__CKMediaObjectManager_init__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Can't register UTIType %@ for class %@. It is already registered for %@. Please file a bug."), v13, v4, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 48), v13);
  }
  v6 = objc_msgSend(v13, "hasPrefix:", CFSTR("dyn."));
  v7 = v13;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredFilenameExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Can't register extension %@ for UTIType %@. It is already registered for %@. Please file a bug."), v10, v13, v12);

    }
    if (v10)
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v13, v10);
    else
      NSLog(CFSTR("Can't register nil extension for UTIType %@."), v13);

    v7 = v13;
  }

}

NSString *__28__CKMediaObjectManager_init__block_invoke_4(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

- (id)allUTITypes
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKMediaObjectManager UTITypes](self, "UTITypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = *MEMORY[0x1E0CA5B00];
  v11[0] = *MEMORY[0x1E0CA5B18];
  v11[1] = v6;
  v7 = *MEMORY[0x1E0CA5B78];
  v11[2] = *MEMORY[0x1E0CA5C40];
  v11[3] = v7;
  v8 = *MEMORY[0x1E0CA5C88];
  v11[4] = *MEMORY[0x1E0CA5C90];
  v11[5] = v8;
  v11[6] = CFSTR("com.apple.messages.maputi");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  return v3;
}

- (id)mediaObjectWithData:(id)a3 UTIType:(id)a4 filename:(id)a5 transcoderUserInfo:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  id v13;
  void *v14;
  const char *v15;
  void *v16;
  objc_class *v17;
  __CFString *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = a5;
  v13 = a6;
  if (v12)
  {
    objc_msgSend(v12, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CKSafeFilename(v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = -[CKMediaObjectManager classForUTIType:](self, "classForUTIType:", v11);
    v18 = (__CFString *)UTTypeCopyPreferredTagWithClass(v11, (CFStringRef)*MEMORY[0x1E0CA5A88]);
    -[objc_class fallbackFilenamePrefix](v17, "fallbackFilenamePrefix");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CKAttachmentFallbackFilename(v19, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(46);
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v16;
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_DEBUG, "No filename. Generated filename: %@.", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v32 = v16;
      _CKLog();
    }

  }
  if (-[CKMediaObjectManager _attachmentDataTooLargeToSend:utiType:](self, "_attachmentDataTooLargeToSend:utiType:", v10, v11, v32))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("CKTransferFileTooLargeNotification"), 0, 0);

LABEL_13:
    v22 = 0;
    goto LABEL_23;
  }
  if (!objc_msgSend(v10, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(46);
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v16;
        v37 = 2112;
        v38 = v11;
        _os_log_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_INFO, "No data for media %@ of type %@", buf, 0x16u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
      _CKLogExternal();
    goto LABEL_13;
  }
  CKAttachmentTmpFileURL(v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(46);
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v23;
      _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_DEBUG, "Write media data to %@ for transfer.", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v33 = v23;
    _CKLog();
  }
  -[CKMediaObjectManager fileManager](self, "fileManager", v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URLByDeletingLastPathComponent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v26, 1, 0, 0);

  CKFreeSpaceWriteDataToURL(v10, v23, 1);
  LOBYTE(v34) = IMIsImageURLAScreenshot();
  -[CKMediaObjectManager transferWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:](self, "transferWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", v23, v13, 0, 0, 0, 0, v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "guid");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObjectManager transfers](self, "transfers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKey:", v27, v28);

  -[CKMediaObjectManager mediaObjectWithTransferGUID:imMessage:](self, "mediaObjectWithTransferGUID:imMessage:", v28, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  return v22;
}

- (id)mediaObjectWithFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  return -[CKMediaObjectManager mediaObjectWithFileURL:filename:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:](self, "mediaObjectWithFileURL:filename:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:", a3, a4, a5, 0, 0, 0, v6);
}

- (id)mediaObjectWithFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 attributionInfo:(id)a6 adaptiveImageGlyphContentIdentifier:(id)a7 adaptiveImageGlyphContentDescription:(id)a8 hideAttachment:(BOOL)a9
{
  uint64_t v10;

  LOWORD(v10) = a9;
  return -[CKMediaObjectManager mediaObjectWithFileURL:filename:fileIsResolved:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:](self, "mediaObjectWithFileURL:filename:fileIsResolved:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", a3, a4, 0, a5, a6, a7, a8, v10);
}

- (id)mediaObjectWithFileURL:(id)a3 filename:(id)a4 fileIsResolved:(BOOL)a5 transcoderUserInfo:(id)a6 attributionInfo:(id)a7 adaptiveImageGlyphContentIdentifier:(id)a8 adaptiveImageGlyphContentDescription:(id)a9 hideAttachment:(BOOL)a10 isScreenshot:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v46 = a6;
  v47 = a7;
  v19 = a8;
  v20 = a9;
  if (v17)
  {
    -[CKMediaObjectManager fileManager](self, "fileManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v18, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CKSafeFilename(v22, v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v24;
    }
    else
    {
      objc_msgSend(v17, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastPathComponent");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(46);
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v18;
          _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_DEBUG, "No filename given, extracting the filename %@ from fileURL.", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        v43 = v18;
        _CKLog();
      }
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(46);
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v17, "URLByResolvingSymlinksInPath");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v49 = v17;
        v50 = 2112;
        v51 = v30;
        _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_DEBUG, "Resolving %@ to %@.", buf, 0x16u);

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      objc_msgSend(v17, "URLByResolvingSymlinksInPath");
      v43 = v17;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      _CKLog();

    }
    if (!a5)
    {
      objc_msgSend(v17, "URLByResolvingSymlinksInPath");
      v31 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v31;
    }
    objc_msgSend(v17, "path", v43, v45);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v21, "fileExistsAtPath:", v32);

    if (v33)
    {
      CKAttachmentTmpFileURL(v18);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "path");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v21, "fileExistsAtPath:", v35);

      if ((v36 & 1) == 0)
      {
        objc_msgSend(v34, "URLByDeletingLastPathComponent");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v37, 1, 0, 0);

        if (a5)
          -[CKMediaObjectManager _copyResolvedFileURL:toURL:](self, "_copyResolvedFileURL:toURL:", v17, v34);
        else
          objc_msgSend(v21, "copyItemAtURL:toURL:error:", v17, v34, 0);
      }
      LOBYTE(v44) = IMIsImageURLAScreenshot();
      -[CKMediaObjectManager transferWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:](self, "transferWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", v34, v46, v47, v19, v20, a10, v44);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "guid");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMediaObjectManager transfers](self, "transfers");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKey:", v39, v40);

      -[CKMediaObjectManager mediaObjectWithTransferGUID:imMessage:](self, "mediaObjectWithTransferGUID:imMessage:", v40, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(46);
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v17;
          _os_log_impl(&dword_18DFCD000, v38, OS_LOG_TYPE_INFO, "No file for media at %@", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
        _CKLogExternal();
      v26 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(46);
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_DEBUG, "fileURL is NIL can't create media object", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
    v26 = 0;
  }

  return v26;
}

- (void)_copyResolvedFileURL:(id)a3 toURL:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;

  v5 = a4;
  objc_msgSend(a3, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");

  objc_msgSend(v5, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v8);
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");

  v11 = open(v7, 0x20000000);
  if (v11 == -1)
  {
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectManager _copyResolvedFileURL:toURL:].cold.1();

  }
  else
  {
    v12 = v11;
    v13 = open(v10, 514, 384);
    if (v13 == -1)
    {
      IMLogHandleForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CKMediaObjectManager _copyResolvedFileURL:toURL:].cold.2();

    }
    else
    {
      v14 = v13;
      v15 = fcopyfile(v12, v13, 0, 0xC0008u);
      if (v15 < 0)
      {
        v16 = v15;
        IMLogHandleForCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[CKMediaObjectManager _copyResolvedFileURL:toURL:].cold.3(v16, v17);

      }
      close(v14);
    }
    close(v12);
  }
}

- (id)mediaObjectWithSticker:(id)a3 stickerUserInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  const char *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  int v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  __CFDictionary *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  id v85;
  uint64_t v86;
  NSObject *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  NSObject *v97;
  id v98;
  NSObject *v99;
  NSObject *v100;
  int v101;
  void *v102;
  void *v103;
  void *v104;
  CFMutableDictionaryRef theDict;
  void *value;
  void *v107;
  id v108;
  id v109;
  uint8_t buf[4];
  id v111;
  __int16 v112;
  void *v113;
  __int16 v114;
  NSObject *v115;
  __int16 v116;
  CFMutableDictionaryRef v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if ((objc_msgSend(v6, "prepareToSend") & 1) != 0)
    {
      objc_msgSend(v6, "stickerGUID");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stickerPackGUID");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (const void *)*MEMORY[0x1E0D392F0];
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D392F0]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recipe");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "__imHexString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "ballonBundleID");
      value = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8 || !-[NSObject length](v8, "length"))
      {
        IMLogHandleForCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.2(v6);
        v14 = 0;
        v16 = v12;
        v17 = value;
        goto LABEL_63;
      }
      v101 = objc_msgSend(v107, "isEqualToString:", CFSTR("com.apple.private.watchEmoji"));
      if (v7)
        v13 = objc_msgSend(v7, "mutableCopy");
      else
        v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = v13;
      v16 = v12;
      v18 = objc_msgSend(v6, "stickerEffectType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E0D392E8], v19);

      v20 = v107;
      if (v20)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E0D39310], v20);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.16();
      }

      if (v10)
        CFDictionarySetValue((CFMutableDictionaryRef)v15, v9, v10);
      if (value)
        CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E0D392E0], value);
      v103 = v10;
      if (v12)
        CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E0D39320], v12);
      objc_msgSend(v6, "representations");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21
        && (v22 = (void *)v21,
            objc_msgSend(v6, "fileURL"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            v23,
            v22,
            !v23))
      {
        objc_msgSend(v6, "representations");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "firstObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v45, "data");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "length");

        theDict = (CFMutableDictionaryRef)v45;
        if (v47)
        {
          objc_msgSend(v45, "data");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          IMSharedHelperMD5OfData();
          v49 = objc_claimAutoreleasedReturnValue();

          if (v49 && -[NSObject length](v49, "length"))
          {
            if (-[NSObject length](v8, "length"))
            {
              v97 = v49;
              CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E0D39300], v49);
              v50 = (void *)MEMORY[0x1E0CEC3F8];
              objc_msgSend(v45, "type");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "typeWithIdentifier:", v51);
              v52 = objc_claimAutoreleasedReturnValue();

              CKSafeFilename(v8, v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = (void *)v52;
              objc_msgSend(v54, "stringByAppendingPathExtensionForType:", v52);
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              v56 = v55;
              CKAttachmentTmpFileURL(v56);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = v56;

              objc_msgSend(v57, "path");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "stringByDeletingLastPathComponent");
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              IMSharedHelperEnsureDirectoryExistsAtPath();
              -[__CFDictionary data](theDict, "data");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v109 = 0;
              v95 = v57;
              LODWORD(v57) = objc_msgSend(v60, "writeToURL:options:error:", v57, 0x40000000, &v109);
              v61 = v109;

              if (!(_DWORD)v57 || v61)
              {
                IMLogHandleForCategory();
                v73 = objc_claimAutoreleasedReturnValue();
                v10 = v103;
                v43 = v95;
                if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                  -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.15();

                v14 = 0;
                v8 = v99;
                goto LABEL_114;
              }

              v10 = v103;
              v8 = v99;
LABEL_74:
              if (v101)
              {
                theDict = (CFMutableDictionaryRef)objc_msgSend(v7, "mutableCopy");
LABEL_90:
                v8 = v8;
                if (v8)
                {
                  CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E0D392F8], v8);
                }
                else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.7();
                }

                if (!theDict)
                  theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                objc_msgSend(v6, "accessibilityLabel");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                if (v74)
                  CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E0D37F10], v74);

                objc_msgSend(v6, "adaptiveImageGlyphContentIdentifier");
                v75 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "adaptiveImageGlyphContentDescription");
                v76 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "animatedImageCacheURLFromExtension");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v97 = v75;
                v102 = (void *)v76;
                -[CKMediaObjectManager transferWithStickerFileURL:transferUserInfo:attributionInfo:animatedImageCacheURL:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:](self, "transferWithStickerFileURL:transferUserInfo:attributionInfo:animatedImageCacheURL:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:", v95, v15, theDict, v77, v75, v76);
                v78 = (void *)objc_claimAutoreleasedReturnValue();

                v104 = v78;
                if (v78)
                {
                  objc_msgSend(v78, "guid");
                  v79 = objc_claimAutoreleasedReturnValue();
                  -[CKMediaObjectManager transfers](self, "transfers");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v80, "setObject:forKey:", v78, v79);

                  -[CKMediaObjectManager mediaObjectWithTransferGUID:imMessage:](self, "mediaObjectWithTransferGUID:imMessage:", v79, 0);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v14)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v14, "setSticker:", v6);
                    }
                    else
                    {
                      IMLogHandleForCategory();
                      v83 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                        -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.6(v6);

                    }
                    objc_msgSend(v6, "cachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly");
                    v82 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v14, "setAdaptiveImageGlyph:", v82);
                    IMLogHandleForCategory();
                    v84 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v111 = v6;
                      _os_log_impl(&dword_18DFCD000, v84, OS_LOG_TYPE_INFO, "Create media object for sticker: %@ OK", buf, 0xCu);
                    }

                    v85 = v14;
                    v43 = v95;
                  }
                  else
                  {
                    IMLogHandleForCategory();
                    v82 = objc_claimAutoreleasedReturnValue();
                    v43 = v95;
                    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
                      -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.5();
                  }

                  v81 = v79;
                }
                else
                {
                  IMLogHandleForCategory();
                  v81 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v6, "description");
                    v89 = v81;
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    v111 = v90;
                    v112 = 2112;
                    v43 = v95;
                    v113 = v95;
                    v114 = 2112;
                    v115 = v15;
                    v116 = 2112;
                    v117 = theDict;
                    _os_log_error_impl(&dword_18DFCD000, v89, OS_LOG_TYPE_ERROR, "Failed to create file transfer for sticker: %@, tempFileURL: %@, transfer user info: %@, attribution info: %@", buf, 0x2Au);

                    v81 = v89;
                    v14 = 0;
                  }
                  else
                  {
                    v14 = 0;
                    v43 = v95;
                  }
                }

LABEL_114:
                v17 = value;
                v42 = v97;
                goto LABEL_61;
              }
              v100 = v8;
              objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "balloonPluginForBundleID:", v20);
              v67 = (void *)objc_claimAutoreleasedReturnValue();

              if (v67)
              {
                objc_msgSend(v67, "attributionInfo");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = (__CFDictionary *)objc_msgSend(v68, "mutableCopy");

                objc_msgSend(v6, "attributionInfo");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                v71 = v70;
                theDict = v69;
                if (v69)
                {

                  if (v71)
                  {
LABEL_89:

                    v8 = v100;
                    goto LABEL_90;
                  }
                  v72 = -[__CFDictionary copy](v69, "copy");
                  objc_msgSend(v6, "setAttributionInfo:", v72);
LABEL_88:

                  goto LABEL_89;
                }
                v86 = objc_msgSend(v70, "mutableCopy");

                theDict = (CFMutableDictionaryRef)v86;
                if (v86)
                  goto LABEL_89;
                IMLogHandleForCategory();
                v72 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                  -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.9();
              }
              else
              {
                IMLogHandleForCategory();
                v72 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                  -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.8();
              }
              theDict = 0;
              goto LABEL_88;
            }
            v62 = v49;
            IMLogHandleForCategory();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.14(v6);
          }
          else
          {
            v62 = v49;
            IMLogHandleForCategory();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.13();
          }
          v10 = v103;
          goto LABEL_56;
        }
        IMLogHandleForCategory();
        v42 = objc_claimAutoreleasedReturnValue();
        v10 = v103;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.12(v6);
        v43 = 0;
        v14 = 0;
      }
      else
      {
        v98 = v20;
        objc_msgSend(v6, "fileURL");
        v24 = objc_claimAutoreleasedReturnValue();
        theDict = (CFMutableDictionaryRef)v24;
        if (v24)
        {
          v25 = (void *)v24;
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "path");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v26, "fileExistsAtPath:", v27);

          if ((v28 & 1) != 0)
          {
            objc_msgSend(v25, "path");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            IMSharedHelperMD5HashOfFileAtPath();
            v30 = objc_claimAutoreleasedReturnValue();

            v10 = v103;
            if (v30 && -[NSObject length](v30, "length"))
            {
              v96 = v30;
              -[__CFDictionary path](theDict, "path");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "lastPathComponent");
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32)
              {
                CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E0D39300], v30);
                CKSafeFilename(v32, v33);
                v34 = objc_claimAutoreleasedReturnValue();

                v93 = v34;
                CKAttachmentTmpFileURL(v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "path");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "stringByDeletingLastPathComponent");
                v37 = objc_claimAutoreleasedReturnValue();

                v91 = (void *)v37;
                IMSharedHelperEnsureDirectoryExistsAtPath();
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "fileURL");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v108 = 0;
                v95 = v35;
                LODWORD(v36) = objc_msgSend(v38, "copyItemAtURL:toURL:error:", v39, v35, &v108);
                v40 = v108;

                v92 = v40;
                if (!(_DWORD)v36 || v40)
                {
                  IMLogHandleForCategory();
                  v65 = objc_claimAutoreleasedReturnValue();
                  v10 = v103;
                  v16 = v12;
                  v20 = v98;
                  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v6, "fileURL");
                    v87 = v65;
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v111 = v88;
                    v112 = 2112;
                    v113 = v95;
                    v114 = 2112;
                    v115 = v92;
                    _os_log_error_impl(&dword_18DFCD000, v87, OS_LOG_TYPE_ERROR, "Could not copy sticker from %@ to %@ error %@", buf, 0x20u);

                    v65 = v87;
                  }

                  v41 = 1;
                }
                else
                {
                  v41 = 0;
                  v10 = v103;
                  v16 = v12;
                  v20 = v98;
                }

              }
              else
              {
                IMLogHandleForCategory();
                v10 = v103;
                v93 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.10(v6);
                v95 = 0;
                v41 = 1;
                v16 = v12;
                v20 = v98;
              }

              if (v41)
              {
                v14 = 0;
                v17 = value;
                v43 = v95;
                goto LABEL_62;
              }
              goto LABEL_74;
            }
            v62 = v30;
            IMLogHandleForCategory();
            v63 = objc_claimAutoreleasedReturnValue();
            v16 = v12;
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.4();
LABEL_56:

            v14 = 0;
            v17 = value;
            v42 = v62;
            v43 = 0;
LABEL_61:

LABEL_62:
LABEL_63:

            goto LABEL_64;
          }
          IMLogHandleForCategory();
          v42 = objc_claimAutoreleasedReturnValue();
          v10 = v103;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.11();
          v43 = 0;
          v14 = 0;
          v16 = v12;
        }
        else
        {
          IMLogHandleForCategory();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.3(v6);
          v43 = 0;
          v14 = 0;
          v10 = v103;
        }
      }
      v17 = value;
      goto LABEL_61;
    }
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.17(v6);
  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.1(v8);
  }
  v14 = 0;
LABEL_64:

  return v14;
}

- (id)transferWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc(-[CKMediaObjectManager transferClass](self, "transferClass")), "initWithFileURL:transcoderUserInfo:attributionInfo:hideAttachment:", v12, v11, v10, v6);

  return v13;
}

- (id)transferWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 adaptiveImageGlyphContentIdentifier:(id)a6 adaptiveImageGlyphContentDescription:(id)a7 hideAttachment:(BOOL)a8 isScreenshot:(BOOL)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;

  v9 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  LOBYTE(v22) = a9;
  v20 = (void *)objc_msgSend(objc_alloc(-[CKMediaObjectManager transferClass](self, "transferClass")), "initWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", v19, v18, v17, v16, v15, v9, v22);

  return v20;
}

- (id)transferWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6 isScreenshot:(BOOL)a7 stickerEffectType:(unint64_t)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v20;

  v9 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isStickersAppEnabled");

  if (v17)
  {
    LOBYTE(v20) = a7;
    v18 = (void *)objc_msgSend(objc_alloc(-[CKMediaObjectManager transferClass](self, "transferClass")), "initWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", v13, v14, v15, 0, 0, v9, v20);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)transferWithStickerFileURL:(id)a3 transferUserInfo:(id)a4 attributionInfo:(id)a5 animatedImageCacheURL:(id)a6 adaptiveImageGlyphContentIdentifier:(id)a7 adaptiveImageGlyphContentDescription:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc(-[CKMediaObjectManager transferClass](self, "transferClass")), "initWithStickerFileURL:transferUserInfo:attributionInfo:animatedImageCacheURL:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:", v19, v18, v17, v16, v15, v14);

  return v20;
}

- (id)fileManager
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
}

- (BOOL)_attachmentDataTooLargeToSend:(id)a3 utiType:(id)a4
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (IMUTITypeIsSupportedForTranscodeOnSend() & 1) == 0 && (unint64_t)objc_msgSend(v4, "length") > 0x6400000;

  return v5;
}

- (NSArray)classes
{
  return self->_classes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynTypes, 0);
  objc_storeStrong((id *)&self->_UTITypes, 0);
  objc_storeStrong((id *)&self->_classes, 0);
  objc_storeStrong((id *)&self->_transfers, 0);
}

- (void)_copyResolvedFileURL:toURL:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_8_2(&dword_18DFCD000, v0, v1, "Failed to open dest attachment path, errno: %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_copyResolvedFileURL:toURL:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_8_2(&dword_18DFCD000, v0, v1, "Failed to open resolved attachment path, errno: %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_copyResolvedFileURL:(int)a1 toURL:(NSObject *)a2 .cold.3(int a1, NSObject *a2)
{
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a1;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Failed to copy resolved file attachment to local store. Result %d errno %d", (uint8_t *)v5, 0xEu);
  OUTLINED_FUNCTION_1_0();
}

- (void)mediaObjectWithSticker:(os_log_t)log stickerUserInfo:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "can't send a nil sticker!", v1, 2u);
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_18DFCD000, v2, v3, "can't send a sticker with a nil stickerGUID: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_18DFCD000, v2, v3, "can't send a sticker with a nil fileURL: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.4()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  OUTLINED_FUNCTION_9_1();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v0, v5, "generating hash of sticker file at path %@ failed for sticker: %@", v6);

  OUTLINED_FUNCTION_13();
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[14];
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_9_1();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  v6 = v1;
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v0, v4, "Failed to create media object for sticker: %@, transfer guid: %@", v5);

  OUTLINED_FUNCTION_13();
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_18DFCD000, v2, v3, "Expected to get back a CKImageMediaObject subclass for sticker %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.7()
{
  uint64_t v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_3();
  v2 = "transferUserInfo";
  OUTLINED_FUNCTION_8(&dword_18DFCD000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1);
  OUTLINED_FUNCTION_2();
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, v0, v1, "unable to find plugin for %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, v0, v1, "unable to find attribution info for %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.10(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_18DFCD000, v2, v3, "sticker has no fileName: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.11()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  OUTLINED_FUNCTION_9_1();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v0, v5, "backing file does not exist on disk at path: %@ for sticker: %@", v6);

  OUTLINED_FUNCTION_13();
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.12(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_18DFCD000, v2, v3, "sticker representation data is empty for sticker: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.13()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  OUTLINED_FUNCTION_9_1();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v0, v5, "generating hash of sticker representation of type %@ failed for sticker: %@", v6);

  OUTLINED_FUNCTION_13();
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.14(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_18DFCD000, v2, v3, "Missing stickerGUID sticker: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.15()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_1();
  v3 = v0;
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v1, (uint64_t)v1, "Could not write sticker representation to %@ error %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.16()
{
  uint64_t v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_3();
  v2 = "transferUserInfo";
  OUTLINED_FUNCTION_8(&dword_18DFCD000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1);
  OUTLINED_FUNCTION_2();
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.17(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_18DFCD000, v2, v3, "Failed to prepare sticker to be sent: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
