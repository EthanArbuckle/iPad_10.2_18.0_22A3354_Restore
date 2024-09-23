@implementation BCSDetectedCode

+ (id)detectedCodeWithMachineReadableObject:(id)a3
{
  AVMetadataMachineReadableCodeObject *v3;
  BCSDetectedCode *v4;
  AVMetadataMachineReadableCodeObject *mrcObject;

  v3 = (AVMetadataMachineReadableCodeObject *)a3;
  v4 = objc_alloc_init(BCSDetectedCode);
  mrcObject = v4->_mrcObject;
  v4->_mrcObject = v3;

  return v4;
}

+ (id)detectedCodeWithBarcodeObservation:(id)a3
{
  VNBarcodeObservation *v3;
  BCSDetectedCode *v4;
  VNBarcodeObservation *observation;

  v3 = (VNBarcodeObservation *)a3;
  v4 = objc_alloc_init(BCSDetectedCode);
  observation = v4->_observation;
  v4->_observation = v3;

  return v4;
}

- (void)parseCodeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  id v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;
  id v27;
  id location;
  os_activity_scope_state_s state;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE buf[24];
  void *v35;
  uint64_t *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _os_activity_create(&dword_21748C000, "parseCodeWithCompletion:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __43__BCSDetectedCode_parseCodeWithCompletion___block_invoke;
  v25 = &unk_24D787130;
  objc_copyWeak(&v27, &location);
  v7 = v4;
  v26 = v7;
  v8 = (void *)MEMORY[0x219A0C7F8](&v22);
  if (self->_mrcObject)
  {
    +[BCSQRCodeParser sharedParser](BCSQRCodeParser, "sharedParser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parseCodeFromMetadataMachineReadableCodeObject:completionHandler:", self->_mrcObject, v8);
  }
  else if (self->_observation)
  {
    v10 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[VNBarcodeObservation symbology](self->_observation, "symbology");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412547;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSDetectedCode: (%@) did receive VNObservation with symbology %{private}@", buf, 0x16u);

    }
    -[VNBarcodeObservation symbology](self->_observation, "symbology");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v14 = (id *)getVNBarcodeSymbologyAppClipCodeSymbolLoc_ptr;
    v33 = getVNBarcodeSymbologyAppClipCodeSymbolLoc_ptr;
    if (!getVNBarcodeSymbologyAppClipCodeSymbolLoc_ptr)
    {
      *(_QWORD *)buf = v6;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getVNBarcodeSymbologyAppClipCodeSymbolLoc_block_invoke;
      v35 = &unk_24D787158;
      v36 = &v30;
      __getVNBarcodeSymbologyAppClipCodeSymbolLoc_block_invoke((uint64_t)buf);
      v14 = (id *)v31[3];
    }
    _Block_object_dispose(&v30, 8);
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "VNBarcodeSymbology getVNBarcodeSymbologyAppClipCode(void)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("BCSDetectedCode.m"), 23, CFSTR("%s"), dlerror(), v22, v23, v24, v25);

      __break(1u);
    }
    v15 = *v14;
    v16 = objc_msgSend(v13, "isEqualToString:", v15);

    if (v16)
    {
      -[VNBarcodeObservation payloadDataValue](self->_observation, "payloadDataValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNBarcodeObservation appClipCodeMetadataValue](self->_observation, "appClipCodeMetadataValue");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v9 && v17)
      {
        +[BCSAppClipCodeURLDecoder sharedDecoder](BCSAppClipCodeURLDecoder, "sharedDecoder");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "parseEncodedURLData:version:completion:", v9, objc_msgSend(v18, "unsignedIntValue"), v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSDetectedCodeErrorDomain"), 1, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v19);
      }

    }
    else
    {
      +[BCSQRCodeParser sharedParser](BCSQRCodeParser, "sharedParser");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNBarcodeObservation payloadStringValue](self->_observation, "payloadStringValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "parseCodeFromString:completionHandler:", v18, v8);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSDetectedCodeErrorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);

}

void __43__BCSDetectedCode_parseCodeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v8 || v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v7 = v8;
      objc_msgSend(v7, "setDetectedCode:", WeakRetained);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

- (BOOL)isLikelyEqualToCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "mrcObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "mrcObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSDetectedCode mrcObject](self, "mrcObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "basicDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "_bcs_probablyContainsSameCodeInBasicDescriptor:", v8);
  }
  else
  {
    objc_msgSend(v4, "observation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "observation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "payloadStringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSDetectedCode observation](self, "observation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "payloadStringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v11);

  }
LABEL_6:

  return v9;
}

- (AVMetadataMachineReadableCodeObject)mrcObject
{
  return self->_mrcObject;
}

- (VNBarcodeObservation)observation
{
  return self->_observation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observation, 0);
  objc_storeStrong((id *)&self->_mrcObject, 0);
}

@end
