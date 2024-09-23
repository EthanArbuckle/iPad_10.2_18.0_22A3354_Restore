@implementation NTKFaceCollectionStateCapture

- (NTKFaceCollectionStateCapture)initWithFaceCollection:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  NTKFaceCollectionStateCapture *v9;
  NTKFaceCollectionStateCapture *v10;
  id v12;
  id location;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKFaceCollectionStateCapture;
  v9 = -[NTKFaceCollectionStateCapture init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_faceCollection, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
    objc_initWeak(&location, v10);
    objc_copyWeak(&v12, &location);
    v10->_stateDumpHandler = os_state_add_handler();
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v10;
}

uint64_t __67__NTKFaceCollectionStateCapture_initWithFaceCollection_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_stateDump");

  return v2;
}

- (void)start
{
  NSObject *v3;
  NSString *identifier;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    v5 = 138412290;
    v6 = identifier;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKFaceCollectionStateCapture: did start for %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)dealloc
{
  NSObject *v3;
  NSString *identifier;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412290;
    v7 = identifier;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKFaceCollectionStateCapture: dealloc %@", buf, 0xCu);
  }

  if (self->_stateDumpHandler)
    os_state_remove_handler();
  v5.receiver = self;
  v5.super_class = (Class)NTKFaceCollectionStateCapture;
  -[NTKFaceCollectionStateCapture dealloc](&v5, sel_dealloc);
}

- (os_state_data_s)_stateDump
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  size_t v11;
  os_state_data_s *v12;
  id v14;
  id v15;

  objc_msgSend(CFSTR("NTKFaceCollection"), "stringByAppendingFormat:", CFSTR("-%@"), self->_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceCollectionStateCapture _faceCollectionDescription](self, "_faceCollectionDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\n%@}\n"), CFSTR("error: failed to serialize state dump\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v14);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v14;

    v5 = (void *)v9;
  }
  if (v5)
  {
    v11 = objc_msgSend(v5, "length");
    v12 = (os_state_data_s *)malloc_type_calloc(1uLL, v11 + 200, 0x4C08C03DuLL);
    v12->var0 = 1;
    v12->var1.var1 = v11;
    objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    __strlcpy_chk();
    memcpy(v12->var4, (const void *)objc_msgSend(objc_retainAutorelease(v5), "bytes"), v11);
  }
  else
  {
    v12 = (os_state_data_s *)malloc_type_calloc(1uLL, 0xC8uLL, 0x84CAB192uLL);
  }

  return v12;
}

- (id)_faceCollectionDescription
{
  void *v3;
  NTKFaceCollection *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  NTKFaceCollection *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v3 = (void *)objc_opt_new();
  if (-[NTKFaceCollection hasLoaded](self->_faceCollection, "hasLoaded"))
  {
    v4 = self->_faceCollection;
    v5 = -[NTKFaceCollection numberOfFaces](v4, "numberOfFaces");
    -[NTKFaceCollection selectedFace](v4, "selectedFace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__22;
    v39 = __Block_byref_object_dispose__22;
    v40 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__22;
    v33 = __Block_byref_object_dispose__22;
    v34 = 0;
    if (v5 >= 2)
    {
      v7 = -[NTKFaceCollection selectedFaceIndex](v4, "selectedFaceIndex");
      if (v7 == v5 - 1)
        v8 = -1;
      else
        v8 = v7 + 1;
      if (v7)
        v9 = v7 - 1;
      else
        v9 = -1;
      if (v7)
        v10 = v8;
      else
        v10 = 1;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __59__NTKFaceCollectionStateCapture__faceCollectionDescription__block_invoke;
      v22[3] = &unk_1E6BD2960;
      v23 = v4;
      v24 = &v35;
      v25 = &v29;
      v26 = v9;
      v27 = v10;
      v28 = -1;
      -[NTKFaceCollection enumerateFacesUsingBlock:](v23, "enumerateFacesUsingBlock:", v22);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Number of Faces: %u\n"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v11);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nSelected Face: %@\n"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v12);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nLeft On Deck Face: %@\n"), v36[5]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v13);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nRight On Deck Face: %@\n"), v30[5]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v14);

    +[NTKFastFaceSwitchingSettings sharedInstance](NTKFastFaceSwitchingSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "fastFaceSwitchingEnabled");

    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("\nFast Face Switching Enabled: %@\n"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v19);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error: face collection has not loaded\n"));
    v4 = (NTKFaceCollection *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v4);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\n%@}\n"), v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __59__NTKFaceCollectionStateCapture__faceCollectionDescription__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "indexOfFace:") == *(_QWORD *)(a1 + 56))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) || *(_QWORD *)(a1 + 64) == *(_QWORD *)(a1 + 72))
      *a3 = 1;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "indexOfFace:", v6) == *(_QWORD *)(a1 + 64))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) || *(_QWORD *)(a1 + 56) == *(_QWORD *)(a1 + 72))
      *a3 = 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_faceCollection, 0);
}

@end
