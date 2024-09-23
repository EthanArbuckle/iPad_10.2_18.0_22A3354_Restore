@implementation DDScannerObject

- (id)scanString:(uint64_t)a3 range:(uint64_t)a4 query:(_QWORD *)a5 configuration:(void *)a6 completionBlock:(void *)a7
{
  __CFString *v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFArray *v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  CFArrayRef v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t *v48;
  BOOL v49;
  _QWORD aBlock[4];
  id v51;
  id v52;
  BOOL v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v13 = a2;
  v14 = a6;
  v15 = a7;
  if (!a1)
  {
    v39 = 0;
    goto LABEL_26;
  }
  v16 = objc_msgSend(v14, "remoteScannerEnabled");
  if (!a5 && v16)
  {
    v43 = a3;
    v44 = a4;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE411798);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_scanString_range_configuration_withReply_, 0, 1);

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.internal.DataDetectorsRemoteScanner"));
    objc_storeStrong((id *)(a1 + 32), v21);
    objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectInterface:", v17);
    objc_msgSend(*(id *)(a1 + 32), "resume");
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy_;
    v58 = __Block_byref_object_dispose_;
    v22 = MEMORY[0x1E0C809B0];
    v59 = (id)MEMORY[0x1E0C9AA60];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__DDScannerObject_scanString_range_query_configuration_completionBlock___block_invoke;
    aBlock[3] = &unk_1E3C94AB8;
    v53 = v15 != 0;
    v23 = v15;
    v52 = v23;
    v24 = v21;
    v51 = v24;
    v25 = _Block_copy(aBlock);
    v26 = *(void **)(a1 + 32);
    if (v15)
      objc_msgSend(v26, "remoteObjectProxyWithErrorHandler:", v25);
    else
      objc_msgSend(v26, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v22;
    v45[1] = 3221225472;
    v45[2] = __72__DDScannerObject_scanString_range_query_configuration_completionBlock___block_invoke_2;
    v45[3] = &unk_1E3C94AE0;
    v49 = v15 != 0;
    v47 = v23;
    v48 = &v54;
    v38 = v24;
    v46 = v38;
    objc_msgSend(v37, "scanString:range:configuration:withReply:", v13, v43, v44, v14, v45);
    v39 = (id)v55[5];

    _Block_object_dispose(&v54, 8);
    goto LABEL_26;
  }
  DDScannerSetOptions(*(_QWORD *)(a1 + 8), objc_msgSend(v14, "scannerOptions"));
  v27 = *(_QWORD *)(a1 + 8);
  objc_msgSend(v14, "timeout");
  *(_QWORD *)(v27 + 224) = v28;
  v29 = *(_QWORD *)(a1 + 8);
  objc_msgSend(v14, "mockMLResults");
  v30 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  DDScannerSetMockMLResults(v29, v30);

  v31 = *(_QWORD **)(a1 + 8);
  objc_msgSend(v14, "supportedMLResults");
  v32 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  DDScannerSetMLSupportedTypes(v31, v32);

  v33 = *(_QWORD *)(a1 + 8);
  v34 = objc_msgSend(v14, "qos");
  if (DDScannerSetQOS_onceToken != -1)
    dispatch_once(&DDScannerSetQOS_onceToken, &__block_literal_global_196);
  if (!DDScannerSetQOS_inWebProcess)
    *(_DWORD *)(v33 + 248) = v34;
  v35 = *(_QWORD *)(a1 + 8);
  *(_DWORD *)(v35 + 252) = objc_msgSend(v14, "script");
  v36 = *(_QWORD *)(a1 + 8);
  if (v13)
  {
    if (!DDScannerScanStringWithRangeAndContextOffset(v36, v13, a3, a4, 0))
    {
LABEL_20:
      v39 = (id)MEMORY[0x1E0C9AA60];
      if (v15)
        (*((void (**)(id, _QWORD))v15 + 2))(v15, MEMORY[0x1E0C9AA60]);
      goto LABEL_26;
    }
  }
  else if (!DDScannerScanQuery(v36, a5))
  {
    goto LABEL_20;
  }
  v40 = DDScannerCopyResultsWithOptions(*(_QWORD *)(a1 + 8), objc_msgSend(v14, "resultsOptions"));
  if (!v40)
    goto LABEL_20;
  v39 = v40;
  if (objc_msgSend(v14, "noObjC"))
  {
    if (v15)
      (*((void (**)(id, id))v15 + 2))(v15, v39);
  }
  else
  {
    +[DDScannerResult resultsFromCoreResults:](DDScannerResult, "resultsFromCoreResults:", v39);
    v41 = objc_claimAutoreleasedReturnValue();
    CFRelease(v39);
    if (v15)
      (*((void (**)(id, uint64_t))v15 + 2))(v15, v41);
    v39 = (id)v41;
  }
LABEL_26:

  return v39;
}

- (void)dealloc
{
  __DDScanner *scanner;
  objc_super v4;

  scanner = self->_scanner;
  if (scanner)
    CFRelease(scanner);
  v4.receiver = self;
  v4.super_class = (Class)DDScannerObject;
  -[DDScannerObject dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

uint64_t __72__DDScannerObject_scanString_range_query_configuration_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  DDError(CFSTR("error getting remote handler: %@"), a2);
  if (*(_BYTE *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __72__DDScannerObject_scanString_range_query_configuration_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (*(_BYTE *)(a1 + 56))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

@end
