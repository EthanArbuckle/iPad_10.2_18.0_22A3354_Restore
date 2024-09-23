@implementation NSFileSubarbitrationClaim

- (NSFileSubarbitrationClaim)initWithReadingURLs:(id)a3 options:(unint64_t)a4 writingURLs:(id)a5 options:(unint64_t)a6 claimer:(id)a7
{
  NSFileSubarbitrationClaim *v12;

  v12 = -[NSFileAccessClaim initWithClient:claimID:purposeID:](self, "initWithClient:claimID:purposeID:", 0, 0, 0);
  if (v12)
  {
    v12->_readingURLs = (NSArray *)objc_msgSend(a3, "copy");
    v12->_readingOptions = a4;
    v12->_writingURLs = (NSArray *)objc_msgSend(a5, "copy");
    v12->_writingOptions = a6;
    v12->super._claimerOrNil = (id)objc_msgSend(a7, "copy");
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileSubarbitrationClaim;
  -[NSFileAccessClaim dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileAccessClaims should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", self->_readingURLs, CFSTR("NSReadingURLsKey"));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_readingOptions), CFSTR("NSReadingOptionsKey"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_writingURLs, CFSTR("NSWritingURLsKey"));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_writingOptions), CFSTR("NSWritingOptionsKey"));
  v5.receiver = self;
  v5.super_class = (Class)NSFileSubarbitrationClaim;
  -[NSFileAccessClaim encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSFileSubarbitrationClaim)initWithCoder:(id)a3
{
  NSFileSubarbitrationClaim *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[7];
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSFileSubarbitrationClaim;
  v4 = -[NSFileAccessClaim initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileAccessClaims should only ever be decoded by XPC"), 0));
    }
    v5 = (void *)objc_msgSend(a3, "allowedClasses");
    v6 = (void *)MEMORY[0x1E0C99E60];
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v7 = objc_msgSend(v5, "setByAddingObjectsFromSet:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2)));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__NSFileSubarbitrationClaim_initWithCoder___block_invoke;
    v9[3] = &unk_1E0F54D10;
    v9[4] = a3;
    v9[5] = v7;
    v9[6] = v4;
    v4->_readingURLs = (NSArray *)objc_msgSend(__43__NSFileSubarbitrationClaim_initWithCoder___block_invoke((uint64_t)v9, (uint64_t)CFSTR("NSReadingURLsKey")), "mutableCopy");
    v4->_writingURLs = (NSArray *)objc_msgSend(__43__NSFileSubarbitrationClaim_initWithCoder___block_invoke((uint64_t)v9, (uint64_t)CFSTR("NSWritingURLsKey")), "mutableCopy");
    v4->_readingOptions = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSReadingOptionsKey")), "unsignedIntegerValue");
    v4->_writingOptions = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSWritingOptionsKey")), "unsignedIntegerValue");
    v4->_forwardedClaimIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4->_readRelinquishmentsByPresenterID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_writeRelinquishmentsByPresenterID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v4;
}

void *__43__NSFileSubarbitrationClaim_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v10;
  NSString *v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClasses:forKey:", *(_QWORD *)(a1 + 40), a2);
  if (v4)
  {
    if ((_NSIsNSArray() & 1) == 0)
    {
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSFileSubarbitrationClaim decoded the wrong class for key %@"), a2);
LABEL_13:
      v11 = v10;

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v11, 0));
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSFileSubarbitrationClaim decoded the wrong class for contents of %@"), a2);
            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v6);
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)descriptionWithIndenting:(id)a3
{
  id result;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSFileSubarbitrationClaim;
  result = -[NSFileAccessClaim descriptionWithIndenting:](&v6, sel_descriptionWithIndenting_);
  if (self->_nullified)
    return (id)objc_msgSend(result, "stringByAppendingFormat:", CFSTR("\n%@    (nullified)"), a3);
  return result;
}

- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4
{
  -[NSFileSubarbitrationClaim forwardUsingConnection:withServer:crashHandler:](self, "forwardUsingConnection:withServer:crashHandler:", a3, 0, a4);
}

- (void)forwardUsingConnection:(id)a3 withServer:(id)a4 crashHandler:(id)a5
{
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[6];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = _NSFCClaimsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v13 = -[NSFileAccessClaim claimID](self, "claimID");
    _os_log_debug_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEBUG, "Subarbitration claim %{public}@ blocked pending grantAccessClaim", buf, 0xCu);
  }
  -[NSFileAccessClaim block](self, "block");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__NSFileSubarbitrationClaim_forwardUsingConnection_withServer_crashHandler___block_invoke;
  v11[3] = &unk_1E0F50DE0;
  v11[4] = self;
  v11[5] = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__NSFileSubarbitrationClaim_forwardUsingConnection_withServer_crashHandler___block_invoke_35;
  v10[3] = &unk_1E0F4E178;
  v10[4] = self;
  objc_msgSend((id)objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v11), "grantSubarbitrationClaim:withServer:reply:", self, objc_msgSend(a4, "endpoint"), v10);
}

uint64_t __76__NSFileSubarbitrationClaim_forwardUsingConnection_withServer_crashHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "claimID");
    v8 = 138543618;
    v9 = (const __CFString *)v7;
    v10 = 2114;
    v11 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim message failed: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  v5 = _NSFCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543618;
    v9 = CFSTR("grantSubarbitrationClaim");
    v10 = 2114;
    v11 = a2;
    _os_log_error_impl(&dword_1817D9000, v5, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 255, 0));
  return objc_msgSend(*(id *)(a1 + 32), "unblock");
}

uint64_t __76__NSFileSubarbitrationClaim_forwardUsingConnection_withServer_crashHandler___block_invoke_35(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "claimID");
    v7 = 138543362;
    v8 = v6;
    _os_log_debug_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ received grantAccessClaim reply", (uint8_t *)&v7, 0xCu);
    if (!a2)
      return objc_msgSend(*(id *)(a1 + 32), "unblock");
    goto LABEL_3;
  }
  if (a2)
LABEL_3:
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "unblock");
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  BOOL v4;
  id v6;
  NSArray *readingURLs;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  NSArray *writingURLs;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  void *v31;
  NSArray *readingLocations;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  void *v36;
  NSArray *writingLocations;
  uint64_t v38;
  uint64_t v39;
  uint64_t jj;
  void *v41;
  BOOL v43;
  id v44;
  NSArray *obj;
  NSArray *obja;
  NSArray *objb;
  _QWORD v49[6];
  _QWORD v50[6];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[6];
  _QWORD v57[5];
  _QWORD v58[7];
  _QWORD v59[3];
  char v60;
  _BYTE v61[128];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;

  v4 = a4;
  v96 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    readingURLs = self->_readingURLs;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](readingURLs, "countByEnumeratingWithState:objects:count:", &v92, v91, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v93;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v93 != v9)
            objc_enumerationMutation(readingURLs);
          v11 = (void *)objc_msgSend(a3, "descendantForFileURL:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i));
          if (v11)
          {
            objc_msgSend(v6, "addObject:", v11);
            objc_msgSend(v11, "addAccessClaim:", self);
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](readingURLs, "countByEnumeratingWithState:objects:count:", &v92, v91, 16);
      }
      while (v8);
    }
    self->_readingLocations = (NSArray *)objc_msgSend(v6, "copy");

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    writingURLs = self->_writingURLs;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](writingURLs, "countByEnumeratingWithState:objects:count:", &v87, v86, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v88 != v15)
            objc_enumerationMutation(writingURLs);
          v17 = (void *)objc_msgSend(a3, "descendantForFileURL:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * j));
          if (v17)
          {
            objc_msgSend(v12, "addObject:", v17);
            objc_msgSend(v17, "addAccessClaim:", self);
          }
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](writingURLs, "countByEnumeratingWithState:objects:count:", &v87, v86, 16);
      }
      while (v14);
    }
    self->_writingLocations = (NSArray *)objc_msgSend(v12, "copy");

    v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v43 = v4;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    v60 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
    v58[3] = &unk_1E0F54D60;
    v58[4] = v18;
    v58[5] = self;
    v58[6] = v59;
    v44 = v18;
    if ((self->_writingOptions & 9) != 0)
    {
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      obj = self->_writingLocations;
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v82, v81, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v83;
        do
        {
          for (k = 0; k != v20; ++k)
          {
            if (*(_QWORD *)v83 != v21)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * k);
            v57[0] = v19;
            v57[1] = 3221225472;
            v57[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_41;
            v57[3] = &unk_1E0F53360;
            v57[4] = v58;
            objc_msgSend(v23, "forEachPresenterOfItemOrContainedItemPerformProcedure:", v57);
            v56[0] = v19;
            v56[1] = 3221225472;
            v56[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_3;
            v56[3] = &unk_1E0F53338;
            v56[4] = v23;
            v56[5] = v58;
            objc_msgSend(v23, "forEachPresenterOfContainingFilePackagePerformProcedure:", v56);
          }
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v82, v81, 16);
        }
        while (v20);
      }
    }
    if ((self->_readingOptions & 1) == 0)
    {
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      obja = self->_readingLocations;
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v78;
        do
        {
          for (m = 0; m != v24; ++m)
          {
            if (*(_QWORD *)v78 != v25)
              objc_enumerationMutation(obja);
            v27 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * m);
            v55[0] = v19;
            v55[1] = 3221225472;
            v55[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_5;
            v55[3] = &unk_1E0F53360;
            v55[4] = v58;
            objc_msgSend(v27, "forEachPresenterOfItemOrContainedItemPerformProcedure:", v55);
            v54[0] = v19;
            v54[1] = 3221225472;
            v54[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_7;
            v54[3] = &unk_1E0F54DD8;
            v54[4] = v58;
            objc_msgSend(v27, "forEachPresenterOfContainingFilePackagePerformProcedure:", v54);
          }
          v24 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
        }
        while (v24);
      }
    }
    if ((self->_writingOptions & 4) != 0)
    {
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      objb = self->_writingLocations;
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v73;
        do
        {
          for (n = 0; n != v28; ++n)
          {
            if (*(_QWORD *)v73 != v29)
              objc_enumerationMutation(objb);
            v31 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * n);
            v53[0] = v19;
            v53[1] = 3221225472;
            v53[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_9;
            v53[3] = &unk_1E0F53360;
            v53[4] = v58;
            objc_msgSend(v31, "forEachPresenterOfItemOrContainedItemPerformProcedure:", v53);
            v52[0] = v19;
            v52[1] = 3221225472;
            v52[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_11;
            v52[3] = &unk_1E0F54DD8;
            v52[4] = v58;
            objc_msgSend(v31, "forEachPresenterOfContainingFilePackagePerformProcedure:", v52);
          }
          v28 = -[NSArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
        }
        while (v28);
      }
    }

    self->_rootNode = (NSFileAccessNode *)a3;
    v51[0] = v19;
    v51[1] = 3221225472;
    v51[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_13;
    v51[3] = &unk_1E0F54E00;
    v51[4] = self;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    readingLocations = self->_readingLocations;
    v33 = -[NSArray countByEnumeratingWithState:objects:count:](readingLocations, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v68;
      do
      {
        for (ii = 0; ii != v33; ++ii)
        {
          if (*(_QWORD *)v68 != v34)
            objc_enumerationMutation(readingLocations);
          v36 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * ii);
          v50[0] = v19;
          v50[1] = 3221225472;
          v50[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_52;
          v50[3] = &unk_1E0F54BD0;
          v50[4] = self;
          v50[5] = v51;
          objc_msgSend(v36, "forEachRelevantAccessClaimPerformProcedure:", v50);
        }
        v33 = -[NSArray countByEnumeratingWithState:objects:count:](readingLocations, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
      }
      while (v33);
    }
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    writingLocations = self->_writingLocations;
    v38 = -[NSArray countByEnumeratingWithState:objects:count:](writingLocations, "countByEnumeratingWithState:objects:count:", &v62, v61, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v63;
      do
      {
        for (jj = 0; jj != v38; ++jj)
        {
          if (*(_QWORD *)v63 != v39)
            objc_enumerationMutation(writingLocations);
          v41 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * jj);
          v49[0] = v19;
          v49[1] = 3221225472;
          v49[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2_54;
          v49[3] = &unk_1E0F54BD0;
          v49[4] = self;
          v49[5] = v51;
          objc_msgSend(v41, "forEachRelevantAccessClaimPerformProcedure:", v49);
        }
        v38 = -[NSArray countByEnumeratingWithState:objects:count:](writingLocations, "countByEnumeratingWithState:objects:count:", &v62, v61, 16);
      }
      while (v38);
    }
    _Block_object_dispose(v59, 8);
    v4 = v43;
  }
  return !v4;
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t result;
  NSObject *v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[9];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a2, "reactorID");
  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7);
  if ((result & 1) == 0)
  {
    v9 = _NSFCClaimsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(*(id *)(a1 + 40), "claimID");
      *(_DWORD *)buf = 138543874;
      v16 = v10;
      v17 = 2114;
      v18 = a3;
      v19 = 2114;
      v20 = v7;
      _os_log_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEFAULT, "Subarbitration claimer %{public}@ is waiting for %{public}@ response from presenter: %{public}@", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Waiting for %@ response from presenter: %@"), a3, v7);
    objc_msgSend(*(id *)(a1 + 40), "blockClaimerForReason:", v11);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_39;
    v14[3] = &unk_1E0F54D38;
    v14[4] = v7;
    v14[5] = a3;
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v14[7] = v11;
    v14[8] = v13;
    v14[6] = v12;
    return (*(uint64_t (**)(uint64_t, _QWORD *))(a4 + 16))(a4, v14);
  }
  return result;
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_39(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = objc_msgSend(*(id *)(a1 + 48), "claimID");
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ has sent a %@ response, unblocking subarbitration claimer: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  if (a2 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "setClaimerError:", a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  return objc_msgSend(*(id *)(a1 + 48), "unblockClaimerForReason:", *(_QWORD *)(a1 + 56));
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_41(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2;
  v8[3] = &unk_1E0F54D88;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *, _QWORD *, uint64_t, uint64_t))(v6 + 16))(v6, a2, CFSTR("Accommodate Deletion"), v8, a5, a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "accommodateDeletionWithSubitemPath:completionHandler:", 0, a2);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "pathFromAncestor:");
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_4;
  v7[3] = &unk_1E0F54DB0;
  v7[4] = a2;
  v7[5] = v4;
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *, _QWORD *))(v5 + 16))(v5, a2, CFSTR("Accommodate Deletion"), v7);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "accommodateDeletionWithSubitemPath:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_6;
  v8[3] = &unk_1E0F54D88;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *, _QWORD *, uint64_t, uint64_t))(v6 + 16))(v6, a2, CFSTR("Save Changes"), v8, a5, a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveChangesWithCompletionHandler:", a2);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_8;
  v8[3] = &unk_1E0F54D88;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *, _QWORD *, uint64_t, uint64_t))(v6 + 16))(v6, a2, CFSTR("Save Changes"), v8, a5, a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveChangesWithCompletionHandler:", a2);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_10;
  v8[3] = &unk_1E0F54D88;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *, _QWORD *, uint64_t, uint64_t))(v6 + 16))(v6, a2, CFSTR("Save Changes"), v8, a5, a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveChangesWithCompletionHandler:", a2);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_12;
  v8[3] = &unk_1E0F54D88;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *, _QWORD *, uint64_t, uint64_t))(v6 + 16))(v6, a2, CFSTR("Save Changes"), v8, a5, a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveChangesWithCompletionHandler:", a2);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_13(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "count") == 1
    && (objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend(a3, "purposeID"), "isEqualToString:", CFSTR("com.apple.desktopservices.copyengine")))
  {
    v5 = _NSFCClaimsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "claimID");
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = objc_msgSend(a3, "claimID");
      v7 = "Nullified subarbitration claim %{public}@ to work around a deadlock with claim: %{public}@";
LABEL_11:
      _os_log_impl(&dword_1817D9000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x16u);
      return 1;
    }
    return 1;
  }
  if (*(void **)(a1 + 32) != a3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = _NSFCClaimsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "claimID");
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = objc_msgSend(a3, "claimID");
      v7 = "Nullified subarbitration claim %{public}@ to because of a blocking subarbitration claim: %{public}@";
      goto LABEL_11;
    }
    return 1;
  }
  return 0;
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = *(_QWORD *)(a1 + 32);
  if (!(_DWORD)result)
    return objc_msgSend(a2, "evaluateNewClaim:", v5);
  *(_BYTE *)(v5 + 296) = 1;
  return result;
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2_54(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = *(_QWORD *)(a1 + 32);
  if (!(_DWORD)result)
    return objc_msgSend(a2, "evaluateNewClaim:", v5);
  *(_BYTE *)(v5 + 296) = 1;
  return result;
}

- (void)evaluateNewClaim:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3 != self && !-[NSFileSubarbitrationClaim nullified](self, "nullified"))
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = _NSFCClaimsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543618;
        v12 = objc_msgSend(a3, "claimID");
        v13 = 2114;
        v14 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_1817D9000, v5, OS_LOG_TYPE_DEFAULT, "New subarbitration claim %{public}@ is blocked by subarbitration claim %{public}@", (uint8_t *)&v11, 0x16u);
      }
      v6 = self;
      v7 = a3;
LABEL_15:
      objc_msgSend(v6, "addPendingClaim:", v7);
      return;
    }
    if (!-[NSFileAccessClaim isGranted](self, "isGranted"))
    {
      v10 = _NSFCClaimsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543618;
        v12 = objc_msgSend(a3, "claimID");
        v13 = 2114;
        v14 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ is blocked by subarbitration claim %{public}@", (uint8_t *)&v11, 0x16u);
      }
      v6 = a3;
      v7 = self;
      goto LABEL_15;
    }
    v8 = objc_msgSend(a3, "claimID");
    if ((-[NSMutableSet containsObject:](self->_forwardedClaimIDs, "containsObject:", v8) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_forwardedClaimIDs, "addObject:", v8);
      v9 = _NSFCClaimsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543618;
        v12 = objc_msgSend(a3, "claimID");
        v13 = 2114;
        v14 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEFAULT, "Forwarding claim %{public}@ to subarbiter for claim %{public}@ for evaluation there", (uint8_t *)&v11, 0x16u);
      }
      objc_msgSend(a3, "forwardUsingConnection:crashHandler:", self->_subarbiterConnection, &__block_literal_global_79);
    }
  }
}

uint64_t __46__NSFileSubarbitrationClaim_evaluateNewClaim___block_invoke()
{
  return 0;
}

- (void)devalueOldClaim:(id)a3
{
  uint64_t v4;

  if (a3 != self)
  {
    v4 = objc_msgSend(a3, "claimID");
    if (-[NSMutableSet containsObject:](self->_forwardedClaimIDs, "containsObject:", v4))
    {
      objc_msgSend(-[NSXPCConnection remoteObjectProxy](self->_subarbiterConnection, "remoteObjectProxy"), "revokeAccessClaimForID:", v4);
      -[NSMutableSet removeObject:](self->_forwardedClaimIDs, "removeObject:", v4);
    }
  }
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 1;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 1;
}

- (void)granted
{
  NSFileAccessNode *rootNode;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  NSArray *readingLocations;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _QWORD v11[6];
  _QWORD v12[5];
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 buf;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  rootNode = self->_rootNode;
  v4 = _NSFCClaimsLog();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (rootNode)
  {
    if (v5)
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = -[NSFileAccessClaim claimID](self, "claimID");
      _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Subarbitration claim %{public}@ granted in server", (uint8_t *)&buf, 0xCu);
    }
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke;
    v12[3] = &unk_1E0F4D2D8;
    v12[4] = self;
    if ((self->_readingOptions & 0x20000) != 0)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v19 = 0x2020000000;
      v20 = 0;
      v20 = -[NSArray count](self->_readingLocations, "count");
      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24))
      {
        v11[0] = v6;
        v11[1] = 3221225472;
        v11[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke_2;
        v11[3] = &unk_1E0F54E70;
        v11[4] = v12;
        v11[5] = &buf;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        readingLocations = self->_readingLocations;
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](readingLocations, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v15;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v15 != v9)
                objc_enumerationMutation(readingLocations);
              -[NSFileAccessClaim makeProviderOfItemAtLocation:provideIfNecessaryWithOptions:thenContinue:](self, "makeProviderOfItemAtLocation:provideIfNecessaryWithOptions:thenContinue:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), self->_readingOptions, v11);
            }
            v8 = -[NSArray countByEnumeratingWithState:objects:count:](readingLocations, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
          }
          while (v8);
        }
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      __36__NSFileSubarbitrationClaim_granted__block_invoke((uint64_t)v12);
    }
  }
  else
  {
    if (v5)
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = -[NSFileAccessClaim claimID](self, "claimID");
      _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Subarbitration claim %{public}@ granted in client", (uint8_t *)&buf, 0xCu);
    }
    -[NSFileAccessClaim unblockClaimerForReason:](self, "unblockClaimerForReason:", 0x1E0F76530);
  }
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  id v27;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 296))
  {
    v3 = _NSFCClaimsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "claimID");
      *(_DWORD *)buf = 138543362;
      v33 = v4;
      _os_log_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEFAULT, "Subarbitration claim %{public}@ was nullified", buf, 0xCu);
    }
    return objc_msgSend(*(id *)(a1 + 32), "unblockClaimerForReason:", 0x1E0F76530);
  }
  else
  {
    v6 = *(void **)(v2 + 264);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke_56;
    v31[3] = &unk_1E0F54E28;
    v31[4] = v2;
    objc_msgSend(v6, "forEachReactorToItemOrContainedItemPerformProcedure:", v31);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v9 + 208))
    {
      objc_msgSend(v7, "addObjectsFromArray:");
      v9 = *(_QWORD *)(a1 + 32);
    }
    if (*(_QWORD *)(v9 + 224))
    {
      objc_msgSend(v8, "addObjectsFromArray:");
      v9 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)objc_msgSend(*(id *)(v9 + 240), "remoteObjectProxy"), "prepareToArbitrateForURLs:", v8);

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "pendingClaims");
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v38;
      *(_QWORD *)&v13 = 138543618;
      v26 = v13;
      v27 = v10;
      v28 = v11;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ((objc_msgSend(v17, "isRevoked") & 1) == 0)
            {
              v18 = objc_msgSend(v17, "claimID");
              if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "containsObject:", v18) & 1) == 0)
              {
                v19 = _NSFCClaimsLog();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  v20 = objc_msgSend(v17, "claimID");
                  v21 = objc_msgSend(*(id *)(a1 + 32), "claimID");
                  *(_DWORD *)buf = v26;
                  v33 = v20;
                  v10 = v27;
                  v34 = 2114;
                  v35 = v21;
                  _os_log_impl(&dword_1817D9000, v19, OS_LOG_TYPE_DEFAULT, "Forwarding pending claim %{public}@ to subarbiter for claim %{public}@ for evaluation there", buf, 0x16u);
                }
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "addObject:", v18, v26, v27);
                objc_msgSend(v17, "forwardUsingConnection:crashHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240), &__block_literal_global_59);
                v11 = v28;
              }
            }
            objc_msgSend(v10, "addObject:", v17, v26, v27);
          }
        }
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
      }
      while (v14);
    }
    objc_msgSend(*(id *)(a1 + 32), "removePendingClaims:", v10, v26, v27);

    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(v22 + 240);
    v24 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke_60;
    v30[3] = &unk_1E0F4E178;
    v30[4] = v22;
    v25 = (void *)objc_msgSend(v23, "remoteObjectProxyWithErrorHandler:", v30);
    v29[0] = v24;
    v29[1] = 3221225472;
    v29[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke_63;
    v29[3] = &unk_1E0F4D2D8;
    v29[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(v25, "startArbitratingWithReply:", v29);
  }
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_56(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "forwardUsingProxy:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "remoteObjectProxy"));
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_58()
{
  NSObject *v0;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = _NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1817D9000, v0, OS_LOG_TYPE_ERROR, "A process invoked -[NSFileCoordinator prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:error:byAccessor:] but stopped listening. Letting other process' file access claims proceed.", v2, 2u);
  }
  return 0;
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_60(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543618;
    v7 = CFSTR("startArbitrating");
    v8 = 2114;
    v9 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "unblockClaimerForReason:", 0x1E0F76530);
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_63(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unblockClaimerForReason:", 0x1E0F76530);
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v2 = *(_QWORD *)(v1 + 24) - 1;
  *(_QWORD *)(v1 + 24) = v2;
  if (!v2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)invokeClaimer
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->super._claimerOrNil)
  {
    v3 = _NSFCClaimsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v8 = -[NSFileAccessClaim claimID](self, "claimID");
      _os_log_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEFAULT, "Subarbitration claim %{public}@ invoked in client", buf, 0xCu);
    }
    (*((void (**)(id, NSFileSubarbitrationClaim *, id))self->super._claimerOrNil + 2))(self->super._claimerOrNil, self, -[NSFileAccessClaim claimerError](self, "claimerError"));

    self->super._claimerOrNil = 0;
  }
  if (self->super._serverClaimerOrNil)
  {
    v4 = _NSFCClaimsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[NSFileAccessClaim claimID](self, "claimID");
      *(_DWORD *)buf = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Subarbitration claim %{public}@ invoked in server", buf, 0xCu);
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, id))self->super._serverClaimerOrNil + 2))(self->super._serverClaimerOrNil, 0, 0, 0, 0, -[NSFileAccessClaim claimerError](self, "claimerError"));

    self->super._serverClaimerOrNil = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NSFileSubarbitrationClaim;
  -[NSFileAccessClaim invokeClaimer](&v6, sel_invokeClaimer);
}

- (void)revoked
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_readRelinquishmentsByPresenterID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_69);

  self->_readRelinquishmentsByPresenterID = 0;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_writeRelinquishmentsByPresenterID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_70);

  self->_writeRelinquishmentsByPresenterID = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSFileSubarbitrationClaim;
  -[NSFileAccessClaim revoked](&v3, sel_revoked);
}

uint64_t __36__NSFileSubarbitrationClaim_revoked__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "removeAllBlockingAccessClaimIDs");
}

uint64_t __36__NSFileSubarbitrationClaim_revoked__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "removeAllBlockingAccessClaimIDs");
}

- (void)devalueSelf
{
  NSArray *readingLocations;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSArray *writingLocations;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  objc_super v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  readingLocations = self->_readingLocations;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](readingLocations, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(readingLocations);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "removeAccessClaim:", self);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](readingLocations, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    }
    while (v5);
  }

  self->_readingLocations = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  writingLocations = self->_writingLocations;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](writingLocations, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(writingLocations);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "removeAccessClaim:", self);
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](writingLocations, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v10);
  }

  self->_writingLocations = 0;
  v13.receiver = self;
  v13.super_class = (Class)NSFileSubarbitrationClaim;
  -[NSFileAccessClaim devalueSelf](&v13, sel_devalueSelf);
}

- (id)relinquishmentForWrite:(BOOL)a3 toPresenterForID:(id)a4
{
  uint64_t v5;
  id *v6;
  NSFilePresenterRelinquishment *v7;
  NSFilePresenterRelinquishment *v8;

  if (a3)
    v5 = 288;
  else
    v5 = 280;
  v6 = (id *)((char *)&self->super.super.isa + v5);
  v7 = (NSFilePresenterRelinquishment *)objc_msgSend(*(id *)((char *)&self->super.super.isa + v5), "objectForKey:", a4);
  if (!v7)
  {
    v7 = objc_alloc_init(NSFilePresenterRelinquishment);
    objc_msgSend(*v6, "setObject:forKey:", v7, a4);
    v8 = v7;
  }
  return v7;
}

- (void)forwardRelinquishmentForWritingClaim:(BOOL)a3 withID:(id)a4 options:(unint64_t)a5 purposeID:(id)a6 subitemURL:(id)a7 toPresenter:(id)a8 usingReplySender:(id)a9
{
  id v15;
  _QWORD v16[6];
  _QWORD v17[11];
  BOOL v18;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v15 = -[NSFileSubarbitrationClaim relinquishmentForWrite:toPresenterForID:](self, "relinquishmentForWrite:toPresenterForID:", a3, objc_msgSend(a8, "reactorID"));
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3052000000;
  v19[3] = __Block_byref_object_copy__29;
  v19[4] = __Block_byref_object_dispose__29;
  v19[5] = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke;
  v17[3] = &unk_1E0F54F00;
  v18 = a3;
  v17[4] = a8;
  v17[5] = a4;
  v17[6] = a6;
  v17[7] = a7;
  v17[9] = v19;
  v17[10] = a5;
  v17[8] = v15;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke_3;
  v16[3] = &unk_1E0F54F28;
  v16[4] = a9;
  v16[5] = v19;
  objc_msgSend(v15, "performRelinquishmentToAccessClaimIfNecessary:usingBlock:withReply:", a4, v17, v16);
  _Block_object_dispose(v19, 8);
}

uint64_t __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 88);
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke_2;
  v11[3] = &unk_1E0F54ED8;
  v7 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v11[5] = a2;
  v11[6] = v9;
  v11[4] = v7;
  return objc_msgSend(v4, "forwardRelinquishmentForWritingClaim:withID:purposeID:subitemURL:options:completionHandler:", v2, v3, v5, v6, v8, v11);
}

uint64_t __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke_2(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setReacquirer:", a4);
  if (a2)
    v7 = a3;
  else
    v7 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v7;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
}

- (void)forwardReacquisitionForWritingClaim:(BOOL)a3 withID:(id)a4 toPresenterForID:(id)a5 usingReplySender:(id)a6
{
  id v8;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8 = -[NSFileSubarbitrationClaim relinquishmentForWrite:toPresenterForID:](self, "relinquishmentForWrite:toPresenterForID:", a3, a5);
  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __106__NSFileSubarbitrationClaim_forwardReacquisitionForWritingClaim_withID_toPresenterForID_usingReplySender___block_invoke;
    v9[3] = &unk_1E0F4E870;
    v9[4] = a6;
    objc_msgSend(v8, "removeBlockingAccessClaimID:thenContinue:", a4, v9);
  }
  else if (a6)
  {
    (*((void (**)(id))a6 + 2))(a6);
  }
}

uint64_t __106__NSFileSubarbitrationClaim_forwardReacquisitionForWritingClaim_withID_toPresenterForID_usingReplySender___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSXPCConnection)subarbiterConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSubarbiterConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (BOOL)nullified
{
  return self->_nullified;
}

@end
