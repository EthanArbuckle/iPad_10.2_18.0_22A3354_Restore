@implementation NSFileMultipleAccessClaim

- (NSFileMultipleAccessClaim)initWithPurposeID:(id)a3 intents:(id)a4 claimer:(id)a5
{
  NSFileMultipleAccessClaim *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  _QWORD v17[5];
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = -[NSFileAccessClaim initWithClient:claimID:purposeID:](self, "initWithClient:claimID:purposeID:", 0, 0, a3);
  if (v7)
  {
    v7->super._claimerOrNil = (id)objc_msgSend(a5, "copy");
    v7->_readingURLs = (NSMutableArray *)objc_opt_new();
    v7->_writingURLs = (NSMutableArray *)objc_opt_new();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__NSFileMultipleAccessClaim_initWithPurposeID_intents_claimer___block_invoke;
    v17[3] = &unk_1E0F536E0;
    v17[4] = v7;
    objc_msgSend(a4, "enumerateObjectsUsingBlock:", v17);
    v7->_readingURLsDidChange = (BOOL *)malloc_type_calloc(1uLL, -[NSMutableArray count](v7->_readingURLs, "count"), 0x86B1FB7CuLL);
    v7->_writingURLsDidChange = (BOOL *)malloc_type_calloc(1uLL, -[NSMutableArray count](v7->_writingURLs, "count"), 0x9CC3D517uLL);
    v7->_readingOptions = (unint64_t *)malloc_type_calloc(8uLL, -[NSMutableArray count](v7->_readingURLs, "count"), 0xE52A541FuLL);
    v7->_writingOptions = (unint64_t *)malloc_type_calloc(8uLL, -[NSMutableArray count](v7->_writingURLs, "count"), 0xFB8761E0uLL);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(a4);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v14, "isRead"))
          {
            v15 = objc_msgSend(v14, "readingOptions");
            v7->_readingOptions[v10++] = ((_DWORD)v15 << 14) & 0x20000 | (unint64_t)v15;
          }
          else
          {
            v7->_writingOptions[v11++] = objc_msgSend(v14, "writingOptions");
          }
        }
        v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      }
      while (v9);
    }
  }
  return v7;
}

uint64_t __63__NSFileMultipleAccessClaim_initWithPurposeID_intents_claimer___block_invoke(uint64_t a1, void *a2)
{
  int v4;
  uint64_t v5;

  v4 = objc_msgSend(a2, "isRead");
  v5 = 29;
  if (v4)
    v5 = 28;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + OBJC_IVAR___NSFileReadingClaim__url[v5]), "addObject:", objc_msgSend(a2, "URL"));
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  free(self->_readingOptions);
  free(self->_writingOptions);
  free(self->_readingURLsDidChange);
  free(self->_writingURLsDidChange);

  v3.receiver = self;
  v3.super_class = (Class)NSFileMultipleAccessClaim;
  -[NSFileAccessClaim dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileAccessClaims should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", pairsForURLs(self->_readingURLs), CFSTR("NSReadingURLPairsKey"));
  objc_msgSend(a3, "encodeBytes:length:forKey:", self->_readingOptions, 8 * -[NSMutableArray count](self->_readingURLs, "count"), CFSTR("NSReadingOptionsKey"));
  objc_msgSend(a3, "encodeObject:forKey:", pairsForURLs(self->_writingURLs), CFSTR("NSWritingURLPairsKey"));
  objc_msgSend(a3, "encodeBytes:length:forKey:", self->_writingOptions, 8 * -[NSMutableArray count](self->_writingURLs, "count"), CFSTR("NSWritingOptionsKey"));
  v5.receiver = self;
  v5.super_class = (Class)NSFileMultipleAccessClaim;
  -[NSFileAccessClaim encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSFileMultipleAccessClaim)initWithCoder:(id)a3
{
  NSFileMultipleAccessClaim *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  const void *v10;
  unint64_t *v11;
  size_t v12;
  uint64_t v13;
  const void *v14;
  unint64_t *v15;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[7];
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)NSFileMultipleAccessClaim;
  v4 = -[NSFileAccessClaim initWithCoder:](&v22, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v17 = (void *)MEMORY[0x1E0C99DA0];
      v18 = *MEMORY[0x1E0C99768];
      v19 = CFSTR("NSFileAccessClaims should only ever be decoded by XPC");
      goto LABEL_16;
    }
    v5 = (void *)objc_msgSend(a3, "allowedClasses");
    v6 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v7 = objc_msgSend(v5, "setByAddingObjectsFromSet:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2)));
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __43__NSFileMultipleAccessClaim_initWithCoder___block_invoke;
    v21[3] = &unk_1E0F53708;
    v21[4] = a3;
    v21[5] = v7;
    v21[6] = v4;
    v4->_readingURLs = (NSMutableArray *)objc_msgSend(__43__NSFileMultipleAccessClaim_initWithCoder___block_invoke((uint64_t)v21, (uint64_t)CFSTR("NSReadingURLPairsKey")), "mutableCopy");
    v4->_writingURLs = (NSMutableArray *)objc_msgSend(__43__NSFileMultipleAccessClaim_initWithCoder___block_invoke((uint64_t)v21, (uint64_t)CFSTR("NSWritingURLPairsKey")), "mutableCopy");
    v8 = 8 * -[NSMutableArray count](v4->_readingURLs, "count");
    if (v8)
    {
      v20 = 0;
      v9 = objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("NSReadingOptionsKey"), &v20);
      if (v20 != v8)
      {

        v17 = (void *)MEMORY[0x1E0C99DA0];
        v18 = *MEMORY[0x1E0C99768];
        v19 = CFSTR("NSFileMultipleAccessClaim failed to properly decode NSReadingOptionsKey");
        goto LABEL_16;
      }
      v10 = (const void *)v9;
      v11 = (unint64_t *)malloc_type_malloc(v8, 0x37DD5F06uLL);
      v4->_readingOptions = v11;
      if (v11)
        memcpy(v11, v10, v8);
    }
    v12 = 8 * -[NSMutableArray count](v4->_writingURLs, "count");
    if (!v12)
    {
LABEL_11:
      v4->_readingURLsDidChange = (BOOL *)malloc_type_calloc(1uLL, -[NSMutableArray count](v4->_readingURLs, "count"), 0x1340D35CuLL);
      v4->_writingURLsDidChange = (BOOL *)malloc_type_calloc(1uLL, -[NSMutableArray count](v4->_writingURLs, "count"), 0x7DBBAF49uLL);
      return v4;
    }
    v20 = 0;
    v13 = objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("NSWritingOptionsKey"), &v20);
    if (v20 == v12)
    {
      v14 = (const void *)v13;
      v15 = (unint64_t *)malloc_type_malloc(v12, 0xFDBD5F55uLL);
      v4->_writingOptions = v15;
      if (v15)
        memcpy(v15, v14, v12);
      goto LABEL_11;
    }

    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99768];
    v19 = CFSTR("NSFileMultipleAccessClaim failed to properly decode NSWritingOptionsKey");
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v19, 0));
  }
  return v4;
}

void *__43__NSFileMultipleAccessClaim_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *v12;
  NSString *v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClasses:forKey:", *(_QWORD *)(a1 + 40), a2);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  if (v4)
  {
    if ((_NSIsNSArray() & 1) == 0)
    {
      v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSFileMultipleAccessClaim decoded the wrong class for key %@"), a2);
LABEL_13:
      v13 = v12;

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v13, 0));
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSFileMultipleAccessClaim decoded the wrong class for contents of %@"), a2);
            goto LABEL_13;
          }
          objc_msgSend(v5, "addObject:", objc_msgSend(v10, "URL"));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v7);
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4
{
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[6];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v11 = -[NSFileAccessClaim claimID](self, "claimID");
    _os_log_debug_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ blocked pending grantAccessClaim", buf, 0xCu);
  }
  -[NSFileAccessClaim block](self, "block");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke;
  v9[3] = &unk_1E0F50DE0;
  v9[4] = self;
  v9[5] = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_406;
  v8[3] = &unk_1E0F534B0;
  v8[4] = self;
  objc_msgSend((id)objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v9), "grantAccessClaim:withReply:", self, v8);
}

uint64_t __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "claimID");
    v10 = 138543618;
    v11 = (const __CFString *)v9;
    v12 = 2114;
    v13 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim message failed: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v5 = _NSFCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v10 = 138543618;
    v11 = CFSTR("grantAccessClaim");
    v12 = 2114;
    v13 = a2;
    _os_log_error_impl(&dword_1817D9000, v5, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    v6 = 208;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "count"))
    {
      v7 = 256;
    }
    else
    {
      v6 = 232;
      v7 = 512;
    }
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", _NSErrorWithFilePath(v7, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v6), "objectAtIndex:", 0)));
  }
  return objc_msgSend(*(id *)(a1 + 32), "unblock");
}

uint64_t __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_406(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v12 = _NSFCClaimsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_msgSend(*(id *)(a1 + 32), "claimID");
    *(_DWORD *)buf = 138543362;
    v21 = v14;
    _os_log_debug_impl(&dword_1817D9000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ received grantAccessClaim reply", buf, 0xCu);
    if (a6)
      goto LABEL_3;
  }
  else if (a6)
  {
LABEL_3:
    v13 = _NSFCClaimsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(*(id *)(a1 + 32), "claimID");
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2114;
      v23 = a6;
      _os_log_error_impl(&dword_1817D9000, v13, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim reply is an error: %{public}@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", a6);
    return objc_msgSend(*(id *)(a1 + 32), "unblock");
  }
  v15 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_407;
  v19[3] = &unk_1E0F53730;
  v19[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v19);
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_2;
  v18[3] = &unk_1E0F53730;
  v18[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v18);
  if (a4)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = objc_msgSend(a4, "copy");
  }
  objc_msgSend(*(id *)(a1 + 32), "setShouldEnableMaterializationDuringAccessorBlock:", a5);
  return objc_msgSend(*(id *)(a1 + 32), "unblock");
}

uint64_t __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_407(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "replaceObjectAtIndex:withObject:", a3, objc_msgSend(a2, "URL"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) + a3) = 1;
  }
  return result;
}

uint64_t __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "replaceObjectAtIndex:withObject:", a3, objc_msgSend(a2, "URL"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) + a3) = 1;
  }
  return result;
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  _BOOL4 v4;
  __CFArray *v7;
  NSMutableArray *readingURLs;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __CFArray *v15;
  NSMutableArray *writingURLs;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  NSMutableArray *readingLocations;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  NSMutableArray *writingLocations;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  uint64_t v33;
  void *v34;
  BOOL result;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  void *v48;
  _QWORD v49[5];
  _QWORD v50[5];
  CFArrayCallBacks callBacks;
  _BYTE v52[128];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;

  v4 = a4;
  v82 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&callBacks.version = xmmword_1E0F53A48;
  *(_OWORD *)&callBacks.release = *(_OWORD *)algn_1E0F53A58;
  callBacks.equal = (CFArrayEqualCallBack)0x182A98E6CLL;
  v7 = CFArrayCreateMutable(0, 0, &callBacks);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  readingURLs = self->_readingURLs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](readingURLs, "countByEnumeratingWithState:objects:count:", &v78, v77, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v79;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v79 != v11)
          objc_enumerationMutation(readingURLs);
        v13 = (void *)objc_msgSend(a3, "descendantForFileURL:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i));
        if (v13)
        {
          v14 = v13;
          if (v4 && !objc_msgSend(v13, "itemIsSubarbitrable"))
          {
            v34 = v14;
LABEL_46:
            objc_msgSend(v34, "removeSelfIfUseless");
            return 0;
          }
          -[__CFArray addObject:](v7, "addObject:", v14);
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](readingURLs, "countByEnumeratingWithState:objects:count:", &v78, v77, 16);
      if (v10)
        continue;
      break;
    }
  }
  *(_OWORD *)&callBacks.version = xmmword_1E0F53A48;
  *(_OWORD *)&callBacks.release = *(_OWORD *)algn_1E0F53A58;
  callBacks.equal = (CFArrayEqualCallBack)0x182A98E6CLL;
  v15 = CFArrayCreateMutable(0, 0, &callBacks);
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  writingURLs = self->_writingURLs;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](writingURLs, "countByEnumeratingWithState:objects:count:", &v73, v72, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v74;
    while (2)
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v74 != v19)
          objc_enumerationMutation(writingURLs);
        v21 = (void *)objc_msgSend(a3, "descendantForFileURL:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j));
        if (v21)
        {
          v22 = v21;
          if (v4 && !objc_msgSend(v21, "itemIsSubarbitrable"))
          {
            v34 = v22;
            goto LABEL_46;
          }
          -[__CFArray addObject:](v15, "addObject:", v22);
        }
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](writingURLs, "countByEnumeratingWithState:objects:count:", &v73, v72, 16);
      if (v18)
        continue;
      break;
    }
  }
  callBacks.version = 0;
  if (!-[NSFileAccessClaim canAccessLocations:forReading:error:](self, "canAccessLocations:forReading:error:", v7, 1, &callBacks)|| !-[NSFileAccessClaim canAccessLocations:forReading:error:](self, "canAccessLocations:forReading:error:", v15, 0, &callBacks))
  {
    -[NSFileAccessClaim setClaimerError:](self, "setClaimerError:", callBacks.version);
    return 1;
  }
  self->_readingLocations = (NSMutableArray *)v7;
  self->_writingLocations = (NSMutableArray *)v15;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  readingLocations = self->_readingLocations;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](readingLocations, "countByEnumeratingWithState:objects:count:", &v68, v67, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v69;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v69 != v26)
          objc_enumerationMutation(readingLocations);
        objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * k), "addAccessClaim:", self);
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](readingLocations, "countByEnumeratingWithState:objects:count:", &v68, v67, 16);
    }
    while (v25);
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  writingLocations = self->_writingLocations;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](writingLocations, "countByEnumeratingWithState:objects:count:", &v63, v62, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v64;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v64 != v31)
          objc_enumerationMutation(writingLocations);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * m), "addAccessClaim:", self);
      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](writingLocations, "countByEnumeratingWithState:objects:count:", &v63, v62, 16);
    }
    while (v30);
  }
  if (-[NSMutableArray count](self->_readingURLs, "count"))
  {
    v33 = 0;
    while ((self->_readingOptions[v33] & 2) == 0)
    {
      if (++v33 >= (unint64_t)-[NSMutableArray count](self->_readingURLs, "count"))
        goto LABEL_50;
    }
    self->_rootNode = (NSFileAccessNode *)a3;
  }
LABEL_50:
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v36 = self->_readingLocations;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
  v38 = MEMORY[0x1E0C809B0];
  if (v37)
  {
    v39 = v37;
    v40 = *(_QWORD *)v59;
    do
    {
      for (n = 0; n != v39; ++n)
      {
        if (*(_QWORD *)v59 != v40)
          objc_enumerationMutation(v36);
        v42 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * n);
        v50[0] = v38;
        v50[1] = 3221225472;
        v50[2] = __76__NSFileMultipleAccessClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
        v50[3] = &unk_1E0F534D8;
        v50[4] = self;
        objc_msgSend(v42, "forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:", self, v50);
      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
    }
    while (v39);
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v43 = self->_writingLocations;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
  if (!v44)
    return 1;
  v45 = v44;
  v46 = *(_QWORD *)v54;
  do
  {
    for (ii = 0; ii != v45; ++ii)
    {
      if (*(_QWORD *)v54 != v46)
        objc_enumerationMutation(v43);
      v48 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * ii);
      v49[0] = v38;
      v49[1] = 3221225472;
      v49[2] = __76__NSFileMultipleAccessClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2;
      v49[3] = &unk_1E0F534D8;
      v49[4] = self;
      objc_msgSend(v48, "forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:", self, v49);
    }
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
    result = 1;
  }
  while (v45);
  return result;
}

uint64_t __76__NSFileMultipleAccessClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "evaluateNewClaim:", *(_QWORD *)(a1 + 32));
}

uint64_t __76__NSFileMultipleAccessClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "evaluateNewClaim:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  NSMutableArray *writingLocations;
  char v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  writingLocations = self->_writingLocations;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__NSFileMultipleAccessClaim_isBlockedByReadingItemAtLocation_options___block_invoke;
  v7[3] = &unk_1E0F53758;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = &v8;
  v7[7] = a4;
  -[NSMutableArray enumerateObjectsUsingBlock:](writingLocations, "enumerateObjectsUsingBlock:", v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __70__NSFileMultipleAccessClaim_isBlockedByReadingItemAtLocation_options___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "canReadingItemAtLocation:options:safelyOverlapNewWriting:ofItemAtLocation:options:", a1[5], a1[7], 1, a2, *(_QWORD *)(*(_QWORD *)(a1[4] + 240) + 8 * a3));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  uint64_t v7;
  NSMutableArray *readingLocations;
  uint64_t v9;
  BOOL v10;
  NSMutableArray *writingLocations;
  _QWORD v13[9];
  _QWORD v14[9];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = objc_opt_class();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  readingLocations = self->_readingLocations;
  v18 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__NSFileMultipleAccessClaim_isBlockedByWritingItemAtLocation_options___block_invoke;
  v14[3] = &unk_1E0F53780;
  v14[4] = v7;
  v14[5] = self;
  v14[7] = &v15;
  v14[8] = a4;
  v14[6] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](readingLocations, "enumerateObjectsUsingBlock:", v14);
  if (*((_BYTE *)v16 + 24))
  {
    v10 = 1;
  }
  else
  {
    writingLocations = self->_writingLocations;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __70__NSFileMultipleAccessClaim_isBlockedByWritingItemAtLocation_options___block_invoke_2;
    v13[3] = &unk_1E0F53780;
    v13[4] = v7;
    v13[5] = self;
    v13[6] = a3;
    v13[7] = &v15;
    v13[8] = a4;
    -[NSMutableArray enumerateObjectsUsingBlock:](writingLocations, "enumerateObjectsUsingBlock:", v13);
    v10 = *((_BYTE *)v16 + 24) != 0;
  }
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __70__NSFileMultipleAccessClaim_isBlockedByWritingItemAtLocation_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canReadingItemAtLocation:options:safelyOverlapNewWriting:ofItemAtLocation:options:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216) + 8 * a3), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __70__NSFileMultipleAccessClaim_isBlockedByWritingItemAtLocation_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canNewWriteOfItemAtLocation:options:safelyOverlapExistingWriteOfItemAtLocation:options:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 240) + 8 * a3), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)granted
{
  uint64_t v3;
  NSObject *v4;
  NSMutableArray *readingLocations;
  unint64_t *readingOptions;
  NSMutableArray *writingLocations;
  unint64_t *writingOptions;
  uint64_t v9;
  NSXPCConnection *client;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_readingLocations || self->_writingLocations)
  {
    v3 = atomic_load(&_NSFCSubarbitrationCount);
    if (v3 < 1
      || (v14 = atomic_load(_NSFCDisableLogSuppression), (v14 & 1) != 0)
      || (v15 = atomic_load(&_NSFCSubarbitratedClaimCount), v15 <= 99))
    {
      v4 = _NSFCClaimsLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in server", buf, 0xCu);
      }
    }
    readingLocations = self->_readingLocations;
    readingOptions = self->_readingOptions;
    writingLocations = self->_writingLocations;
    writingOptions = self->_writingOptions;
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke;
    v18[3] = &unk_1E0F4F260;
    v18[4] = self;
    -[NSFileAccessClaim makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:](self, "makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:", readingLocations, readingOptions, writingLocations, writingOptions, v18);
    if (self->_writingLocations)
    {
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_8;
      v17[3] = &unk_1E0F4D2D8;
      v17[4] = self;
      -[NSFileAccessClaim whenRevokedPerformProcedure:](self, "whenRevokedPerformProcedure:", v17);
    }
  }
  else
  {
    client = self->super._client;
    v11 = _NSFCClaimsLog();
    v12 = v11;
    if (client)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v20 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_error_impl(&dword_1817D9000, v12, OS_LOG_TYPE_ERROR, "Claim %{public}@ can't be granted in daemon", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_1817D9000, v12, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in client", buf, 0xCu);
      }
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_readingURLs);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_409;
      v16[3] = &unk_1E0F536E0;
      v16[4] = self;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);
    }
  }
  -[NSFileAccessClaim unblockClaimerForReason:](self, "unblockClaimerForReason:", CFSTR("Initial blockage"));
}

void __36__NSFileMultipleAccessClaim_granted__block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 264);
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_2;
    v10[3] = &unk_1E0F537F8;
    v10[4] = v3;
    v10[5] = v8;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 256);
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_5;
    v9[3] = &unk_1E0F537F8;
    v9[4] = v6;
    v9[5] = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  }
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(_QWORD *)(v4[30] + 8 * a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_3;
  v7[3] = &unk_1E0F537D0;
  v8 = v3;
  v9 = a2;
  v10 = v5;
  return objc_msgSend(v4, "makePresentersOfItemAtLocation:orContainedItem:relinquishUsingProcedureGetter:", a2, (v5 & 0x13000B) != 0, v7);
}

id __36__NSFileMultipleAccessClaim_granted__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[10];

  v9[9] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldWritingWithOptions:causePresenterToRelinquish:", *(_QWORD *)(a1 + 56), a2))return 0;
  objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "reactorID"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_4;
  v9[3] = &unk_1E0F537A8;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v6;
  v9[7] = a3;
  v9[8] = v7;
  v9[6] = a2;
  return (id)objc_msgSend(v9, "copy");
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "relinquishToWritingClaimWithID:options:purposeID:subitemPath:resultHandler:", objc_msgSend(*(id *)(a1 + 32), "claimID"), *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "purposeIDOfClaimOnItemAtLocation:forMessagingPresenter:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)), *(_QWORD *)(a1 + 56), a2);
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(_QWORD *)(v4[27] + 8 * a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_6;
  v7[3] = &unk_1E0F53848;
  v9 = v5;
  v8 = v3;
  return objc_msgSend(v4, "makePresentersOfItemAtLocation:orContainedItem:relinquishUsingProcedureGetter:", a2, 0, v7);
}

id __36__NSFileMultipleAccessClaim_granted__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v5;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldReadingWithOptions:causePresenterToRelinquish:", *(_QWORD *)(a1 + 48), a2)|| (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(a2, "reactorID")) & 1) != 0)
  {
    return 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "reactorID"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_7;
  v6[3] = &unk_1E0F53820;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  v6[6] = *(_QWORD *)(a1 + 48);
  return (id)objc_msgSend(v6, "copy");
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "relinquishToReadingClaimWithID:options:purposeID:resultHandler:", objc_msgSend(*(id *)(a1 + 40), "claimID"), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "purposeID"), a2);
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 264);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_9;
  v4[3] = &unk_1E0F53870;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldInformProvidersAboutEndOfWriteWithOptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 8 * a3));
  if ((_DWORD)result)
    return objc_msgSend((id)objc_msgSend(a2, "itemProvider"), "observeEndOfWriteAtLocation:forAccessClaim:", a2, *(_QWORD *)(a1 + 32));
  return result;
}

_QWORD *__36__NSFileMultipleAccessClaim_granted__block_invoke_409(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  result = *(_QWORD **)(a1 + 32);
  if ((*(_QWORD *)(result[27] + 8 * a3) & 8) != 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_2_410;
    v4[3] = &unk_1E0F53898;
    v4[4] = result;
    v4[5] = a3;
    return (_QWORD *)objc_msgSend(result, "prepareItemForUploadingFromURL:thenContinue:", a2, v4);
  }
  return result;
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_2_410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) + *(_QWORD *)(a1 + 40)) = 1;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "replaceObjectAtIndex:withObject:");
  }
  else
  {
    v6 = _NSFCClaimsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "claimID");
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = a3;
      _os_log_error_impl(&dword_1817D9000, v6, OS_LOG_TYPE_ERROR, "Claim %{public}@ failed during preparing for uploading due to error: %@", (uint8_t *)&v8, 0x16u);
    }
    return objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", a3);
  }
}

- (void)resolveURLsThenMaybeContinueInvokingClaimer:(id)a3
{
  NSMutableArray *readingLocations;
  uint64_t v6;
  NSMutableArray *writingLocations;
  _QWORD v8[6];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  if (-[NSFileAccessClaim didWait](self, "didWait"))
  {
    readingLocations = self->_readingLocations;
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke;
    v11[3] = &unk_1E0F536E0;
    v11[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](readingLocations, "enumerateObjectsUsingBlock:", v11);
    writingLocations = self->_writingLocations;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_2;
    v10[3] = &unk_1E0F536E0;
    v10[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](writingLocations, "enumerateObjectsUsingBlock:", v10);
  }
  if (-[NSFileAccessClaim claimerError](self, "claimerError"))
  {
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
  }
  else
  {
    v8[5] = a3;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3;
    v9[3] = &unk_1E0F53578;
    v9[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_6;
    v8[3] = &unk_1E0F50148;
    v8[4] = self;
    __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3((uint64_t)v9, (uint64_t)v8);
  }
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "standardizedURL");
  if (result)
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "replaceObjectAtIndex:withObject:", a3, result);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) + a3) = 1;
  return result;
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "standardizedURL");
  if (result)
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "replaceObjectAtIndex:withObject:", a3, result);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) + a3) = 1;
  return result;
}

void __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v3 + 272))
    goto LABEL_3;
  v5 = (id)objc_msgSend(*(id *)(v3 + 208), "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_4;
  v6[3] = &unk_1E0F538E8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = &v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  if (!*((_BYTE *)v8 + 24))
LABEL_3:
    (*(void (**)(uint64_t))(a2 + 16))(a2);
  _Block_object_dispose(&v7, 8);
}

_QWORD *__73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *result;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  result = *(_QWORD **)(a1 + 32);
  if (result[35] == a3)
  {
    if ((*(_QWORD *)(result[27] + 8 * a3) & 2) != 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_5;
      v7[3] = &unk_1E0F538C0;
      v7[4] = result;
      v7[5] = a3;
      result = (_QWORD *)objc_msgSend(result, "checkIfSymbolicLinkAtURL:withResolutionCount:andIfSoThenReevaluateSelf:", a2, result + 36, v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        *a4 = 1;
      }
      else
      {
        ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288) = 0;
      }
    }
    else
    {
      result[35] = a3 + 1;
    }
  }
  return result;
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_5(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 40), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) + *(_QWORD *)(a1 + 40)) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "evaluateSelfWithRootNode:checkSubarbitrability:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272), 0);
}

void __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_6(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[8];
  _QWORD v18[8];
  _QWORD v19[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[6];
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 32);
  v3 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "count"));
  v4 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*v2 + 232), "count"));
  v5 = *v2;
  v6 = *(void **)(*v2 + 208);
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_7;
  v25[3] = &unk_1E0F537F8;
  v25[4] = v5;
  v25[5] = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v25);
  v8 = *v2;
  v9 = *(void **)(*v2 + 232);
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_8;
  v24[3] = &unk_1E0F537F8;
  v24[4] = v8;
  v24[5] = v4;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v24);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v10 = objc_msgSend(*(id *)(*v2 + 256), "count");
  v23 = objc_msgSend(*(id *)(*v2 + 264), "count") + v10;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_9;
  v19[3] = &unk_1E0F53910;
  v11 = *(_QWORD *)(a1 + 40);
  v19[6] = v11;
  v19[7] = &v20;
  v19[4] = v3;
  v19[5] = v4;
  if (v21[3])
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "purposeID");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 256);
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_10;
    v18[3] = &unk_1E0F53960;
    v18[4] = v13;
    v18[5] = v12;
    v18[6] = v3;
    v18[7] = v19;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v18);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 264);
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_12;
    v17[3] = &unk_1E0F53960;
    v17[4] = v15;
    v17[5] = v12;
    v17[6] = v4;
    v17[7] = v19;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v17);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, v3, v4);
  }
  _Block_object_dispose(&v20, 8);
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 40);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) + a3))
    a2 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  return objc_msgSend(v3, "addObject:", a2);
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 40);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) + a3))
    a2 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  return objc_msgSend(v3, "addObject:", a2);
}

_QWORD *__73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_9(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result[7] + 8);
  v2 = *(_QWORD *)(v1 + 24) - 1;
  *(_QWORD *)(v1 + 24) = v2;
  if (!v2)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(result[6] + 16))(result[6], result[4], result[5]);
  return result;
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(v4[27] + 8 * a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_11;
  v7[3] = &unk_1E0F53938;
  v9 = a3;
  v8 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(v4, "makeProviderOfItemAtLocation:provideOrAttachPhysicalURLIfNecessaryForPurposeID:readingOptions:thenContinue:", a2, v3, v5, v7);
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_11(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 48), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(v4[30] + 8 * a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_13;
  v7[3] = &unk_1E0F53938;
  v9 = a3;
  v8 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(v4, "makeProviderOfItemAtLocation:provideOrAttachPhysicalURLIfNecessaryForPurposeID:writingOptions:thenContinue:", a2, v3, v5, v7);
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_13(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 48), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)invokeClaimer
{
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__NSFileMultipleAccessClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_1E0F53988;
  v2[4] = self;
  -[NSFileMultipleAccessClaim resolveURLsThenMaybeContinueInvokingClaimer:](self, "resolveURLsThenMaybeContinueInvokingClaimer:", v2);
}

id __42__NSFileMultipleAccessClaim_invokeClaimer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v17;
  uint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  objc_super v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD **)(a1 + 32);
  if (v6[20])
  {
    v7 = atomic_load(&_NSFCSubarbitrationCount);
    if (v7 < 1
      || (v17 = atomic_load(_NSFCDisableLogSuppression), (v17 & 1) != 0)
      || (v18 = atomic_load(&_NSFCSubarbitratedClaimCount), v18 <= 99))
    {
      v8 = _NSFCClaimsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_msgSend(*(id *)(a1 + 32), "claimID");
        *(_DWORD *)buf = 138543362;
        v23 = v9;
        _os_log_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in client", buf, 0xCu);
      }
    }
    (*(void (**)(_QWORD, _QWORD, void *, void *, _QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160)
                                                                            + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), *(_QWORD *)(a1 + 32), a2, a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
    v6 = *(_QWORD **)(a1 + 32);
  }
  if (v6[21])
  {
    v10 = atomic_load(&_NSFCSubarbitrationCount);
    if (v10 < 1
      || (v19 = atomic_load(_NSFCDisableLogSuppression), (v19 & 1) != 0)
      || (v20 = atomic_load(&_NSFCSubarbitratedClaimCount), v20 <= 99))
    {
      v11 = _NSFCClaimsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(*(id *)(a1 + 32), "claimID");
        *(_DWORD *)buf = 138543362;
        v23 = v12;
        _os_log_impl(&dword_1817D9000, v11, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in server", buf, 0xCu);
      }
    }
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    v14 = pairsForURLs(a2);
    v15 = pairsForURLs(a3);
    (*(void (**)(uint64_t, void *, void *, _QWORD, uint64_t, uint64_t))(v13 + 16))(v13, v14, v15, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), objc_msgSend(*(id *)(a1 + 32), "shouldEnableMaterializationDuringAccessorBlock"), objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
    v6 = *(_QWORD **)(a1 + 32);
  }
  v21.receiver = v6;
  v21.super_class = (Class)NSFileMultipleAccessClaim;
  return objc_msgSendSuper2(&v21, sel_invokeClaimer);
}

- (void)devalueSelf
{
  NSMutableArray *readingLocations;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableArray *writingLocations;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  objc_super v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  readingLocations = self->_readingLocations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](readingLocations, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v46 != v7)
          objc_enumerationMutation(readingLocations);
        v9 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v28[0] = v5;
        v28[1] = 3221225472;
        v28[2] = __40__NSFileMultipleAccessClaim_devalueSelf__block_invoke;
        v28[3] = &unk_1E0F534D8;
        v28[4] = self;
        objc_msgSend(v9, "forEachRelevantAccessClaimPerformProcedure:", v28);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](readingLocations, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
    }
    while (v6);
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  writingLocations = self->_writingLocations;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](writingLocations, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(writingLocations);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        v27[0] = v5;
        v27[1] = 3221225472;
        v27[2] = __40__NSFileMultipleAccessClaim_devalueSelf__block_invoke_2;
        v27[3] = &unk_1E0F534D8;
        v27[4] = self;
        objc_msgSend(v15, "forEachRelevantAccessClaimPerformProcedure:", v27);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](writingLocations, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
    }
    while (v12);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = self->_readingLocations;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "removeAccessClaim:", self);
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    }
    while (v18);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = self->_writingLocations;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v31;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * m), "removeAccessClaim:", self);
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
    }
    while (v23);
  }

  self->_readingLocations = 0;
  self->_writingLocations = 0;
  v26.receiver = self;
  v26.super_class = (Class)NSFileMultipleAccessClaim;
  -[NSFileAccessClaim devalueSelf](&v26, sel_devalueSelf);
}

uint64_t __40__NSFileMultipleAccessClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "devalueOldClaim:", *(_QWORD *)(a1 + 32));
}

uint64_t __40__NSFileMultipleAccessClaim_devalueSelf__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "devalueOldClaim:", *(_QWORD *)(a1 + 32));
}

- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4
{
  NSMutableArray *writingLocations;
  uint64_t v8;
  void *v9;
  NSMutableArray *readingLocations;
  void *v11;
  _QWORD v12[7];
  _QWORD v13[7];
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  writingLocations = self->_writingLocations;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke;
  v15[3] = &unk_1E0F539B0;
  v15[4] = a3;
  v9 = (void *)-[NSMutableArray indexesOfObjectsPassingTest:](writingLocations, "indexesOfObjectsPassingTest:", v15);
  readingLocations = self->_readingLocations;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_2;
  v14[3] = &unk_1E0F539B0;
  v14[4] = a3;
  v11 = (void *)-[NSMutableArray indexesOfObjectsPassingTest:](readingLocations, "indexesOfObjectsPassingTest:", v14);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_3;
  v13[3] = &unk_1E0F539D8;
  v13[4] = a4;
  v13[5] = self;
  v13[6] = a3;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v13);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_4;
  v12[3] = &unk_1E0F539D8;
  v12[4] = a4;
  v12[5] = self;
  v12[6] = a3;
  objc_msgSend(v11, "enumerateIndexesUsingBlock:", v12);
}

BOOL __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

BOOL __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

uint64_t __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addAccessClaim:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "removeAccessClaim:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "replaceObjectAtIndex:withObject:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addAccessClaim:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "removeAccessClaim:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 256), "replaceObjectAtIndex:withObject:", a2, *(_QWORD *)(a1 + 32));
}

- (BOOL)blocksClaim:(id)a3
{
  NSMutableArray *readingLocations;
  uint64_t v6;
  BOOL v7;
  NSMutableArray *writingLocations;
  _QWORD v10[7];
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  readingLocations = self->_readingLocations;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__NSFileMultipleAccessClaim_blocksClaim___block_invoke;
  v11[3] = &unk_1E0F53A00;
  v11[4] = a3;
  v11[5] = self;
  v11[6] = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](readingLocations, "enumerateObjectsUsingBlock:", v11);
  if (*((_BYTE *)v13 + 24))
  {
    v7 = 1;
  }
  else
  {
    writingLocations = self->_writingLocations;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __41__NSFileMultipleAccessClaim_blocksClaim___block_invoke_2;
    v10[3] = &unk_1E0F53A00;
    v10[4] = a3;
    v10[5] = self;
    v10[6] = &v12;
    -[NSMutableArray enumerateObjectsUsingBlock:](writingLocations, "enumerateObjectsUsingBlock:", v10);
    v7 = *((_BYTE *)v13 + 24) != 0;
  }
  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __41__NSFileMultipleAccessClaim_blocksClaim___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isBlockedByReadingItemAtLocation:options:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216) + 8 * a3));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __41__NSFileMultipleAccessClaim_blocksClaim___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isBlockedByWritingItemAtLocation:options:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 240) + 8 * a3));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)shouldBeRevokedPriorToInvokingAccessor
{
  uint64_t v3;
  _BOOL8 v4;
  unint64_t *readingOptions;
  uint64_t v6;
  char v7;
  unint64_t v8;
  BOOL v10;

  v3 = -[NSMutableArray count](self->_readingURLs, "count");
  if (-[NSMutableArray count](self->_writingURLs, "count"))
  {
    LOBYTE(v4) = 0;
  }
  else if (v3)
  {
    readingOptions = self->_readingOptions;
    v6 = v3 - 1;
    do
    {
      v8 = *readingOptions++;
      v7 = v8;
      v4 = (v8 >> 3) & 1;
      v10 = v6-- != 0;
    }
    while ((v7 & 8) != 0 && v10);
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (id)allURLs
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = v3;
  if (self->_readingURLs)
    objc_msgSend(v3, "addObjectsFromArray:");
  if (self->_writingURLs)
    objc_msgSend(v4, "addObjectsFromArray:");
  return v4;
}

- (BOOL)shouldCancelInsteadOfWaiting
{
  unint64_t v3;
  unint64_t *readingOptions;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[NSMutableArray count](self->_readingURLs, "count");
  if (v3)
  {
    readingOptions = self->_readingOptions;
    if ((*((_BYTE *)readingOptions + 2) & 8) != 0)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v5 = 1;
      do
      {
        v6 = v5;
        if (v3 == v5)
          break;
        v7 = readingOptions[v5++];
      }
      while ((v7 & 0x80000) == 0);
      LOBYTE(v3) = v6 < v3;
    }
  }
  return v3;
}

- (void)protectFilesAgainstEviction
{
  NSMutableArray *readingURLs;
  uint64_t v4;
  NSMutableArray *writingURLs;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  readingURLs = self->_readingURLs;
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__NSFileMultipleAccessClaim_protectFilesAgainstEviction__block_invoke;
  v7[3] = &unk_1E0F53A28;
  v7[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](readingURLs, "enumerateObjectsUsingBlock:", v7);
  writingURLs = self->_writingURLs;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __56__NSFileMultipleAccessClaim_protectFilesAgainstEviction__block_invoke_2;
  v6[3] = &unk_1E0F53A28;
  v6[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](writingURLs, "enumerateObjectsUsingBlock:", v6);
}

uint64_t __56__NSFileMultipleAccessClaim_protectFilesAgainstEviction__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_protectIfNecessaryFileAtURL:withOptions:forReading:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) + 8 * a3), 1);
}

uint64_t __56__NSFileMultipleAccessClaim_protectFilesAgainstEviction__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_protectIfNecessaryFileAtURL:withOptions:forReading:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 8 * a3), 0);
}

@end
