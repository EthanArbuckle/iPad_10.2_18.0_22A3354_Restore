@implementation VNMutablePersonsModel

- (VNMutablePersonsModel)initWithConfiguration:(id)a3
{
  id v4;
  VNPersonsModelData *v5;
  VNMutablePersonsModel *v6;
  VNMutablePersonsModel *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[VNPersonsModelData initWithConfiguration:]([VNPersonsModelData alloc], "initWithConfiguration:", v4);
  v9.receiver = self;
  v9.super_class = (Class)VNMutablePersonsModel;
  v6 = -[VNPersonsModel initWithConfiguration:dataSource:](&v9, sel_initWithConfiguration_dataSource_, v4, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modelData, v5);
    -[VNPersonsModelData setDelegate:](v5, "setDelegate:", v7);
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VNMutablePersonsModel;
  -[VNPersonsModel description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3578];
  if (self)
  {
    -[VNPersonsModelData lastModificationDate](self->_modelData, "lastModificationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v4, "localizedStringFromDate:dateStyle:timeStyle:", v5, 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" modified on %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->super._faceModel_DO_NOT_ACCESS_DIRECTLY)
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(" <dirty>"));
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  return (NSString *)v7;
}

- (id)upToDateFaceModelWithCanceller:(id)a3 error:(id *)a4
{
  id v6;
  VNPersonsModelFaceModel *faceModel_DO_NOT_ACCESS_DIRECTLY;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  VNPersonsModelFaceModel *v19;
  VNPersonsModelFaceModel *v20;
  VNPersonsModelFaceModel *v21;

  v6 = a3;
  faceModel_DO_NOT_ACCESS_DIRECTLY = self->super._faceModel_DO_NOT_ACCESS_DIRECTLY;
  if (!faceModel_DO_NOT_ACCESS_DIRECTLY)
  {
    -[VNPersonsModel configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNPersonsModelFaceModelDataSummarization summarizationOfDataFromProvider:](VNPersonsModelFaceModelDataSummarization, "summarizationOfDataFromProvider:", self->_modelData);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "UTF8String");
    objc_msgSend(v8, "description");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "UTF8String");
    VNValidatedLog(1, (uint64_t)CFSTR("Vision building %s with configuration %s"), v13, v14, v15, v16, v17, v18, v11);

    +[VNPersonsModelFaceModel modelBuiltFromConfiguration:dataProvider:canceller:error:](VNPersonsModelFaceModel, "modelBuiltFromConfiguration:dataProvider:canceller:error:", v8, self->_modelData, v6, a4);
    v19 = (VNPersonsModelFaceModel *)objc_claimAutoreleasedReturnValue();
    v20 = self->super._faceModel_DO_NOT_ACCESS_DIRECTLY;
    self->super._faceModel_DO_NOT_ACCESS_DIRECTLY = v19;

    faceModel_DO_NOT_ACCESS_DIRECTLY = self->super._faceModel_DO_NOT_ACCESS_DIRECTLY;
  }
  v21 = faceModel_DO_NOT_ACCESS_DIRECTLY;

  return v21;
}

- (BOOL)writeVersion1ToOutputStream:(id)a3 options:(id)a4 md5Context:(CC_MD5state_st *)a5 error:(id *)a6
{
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  void *v32;
  id v33;
  BOOL v34;
  id *v36;
  unint64_t v37;
  VNMutablePersonsModel *v38;
  id v39;
  void *context;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  CC_MD5_CTX *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  int v62;
  int v63;
  id v64[2];

  v9 = a3;
  v46 = a5;
  if (VNPersonsModelIOWriteTagToOutputStream(1886217324, v9, a5, a6)
    && VNPersonsModelIOWriteTagToOutputStream(1, v9, a5, a6)
    && -[VNMutablePersonsModel _writeVersion1ConfigurationToOutputStream:md5Context:error:](self, v9, a5, a6)&& -[VNMutablePersonsModel _writeVersion1InformationToOutputStream:md5Context:error:]((uint64_t)self, v9, a5, a6))
  {
    v10 = -[VNPersonsModelData faceModelPersonsCount](self->_modelData, "faceModelPersonsCount");
    v36 = a6;
    if (v10)
    {
      v11 = 0;
      v12 = 0;
      v38 = self;
      v37 = v10;
      v39 = v9;
      while (1)
      {
        v13 = MEMORY[0x1A1B0B060]();
        v42 = v12;
        v14 = -[VNPersonsModelData faceModelNumberOfFaceObservationsForPersonAtIndex:](self->_modelData, "faceModelNumberOfFaceObservationsForPersonAtIndex:", v11);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
        if (v14)
        {
          for (i = 0; i != v14; ++i)
          {
            -[VNPersonsModelData faceModelFaceObservationAtIndex:forPersonAtIndex:](self->_modelData, "faceModelFaceObservationAtIndex:forPersonAtIndex:", i, v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v17);

          }
        }
        context = (void *)v13;
        -[VNPersonsModelData faceModelUniqueIdentifierOfPersonAtIndex:](self->_modelData, "faceModelUniqueIdentifierOfPersonAtIndex:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v12;
        v19 = v18;
        v20 = v15;
        v45 = v9;
        v21 = (void *)MEMORY[0x1A1B0B060]();
        v64[0] = 0;
        v41 = v19;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, v64);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v64[0];
        objc_autoreleasePoolPop(v21);
        if (v22)
        {
          v43 = v22;
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 0x4000);
          v63 = objc_msgSend(v43, "length");
          objc_msgSend(v23, "appendBytes:length:", &v63, 4);
          objc_msgSend(v23, "appendData:", v43);
          v24 = objc_msgSend(v23, "length");
          v25 = objc_msgSend(v20, "count");
          if (v25)
          {
            v26 = 0;
            v27 = 20;
            while (1)
            {
              objc_msgSend(v23, "setLength:", v24);
              if (v27 + v26 > v25)
                v27 = v25 - v26;
              v62 = v27;
              objc_msgSend(v23, "appendBytes:length:", &v62, 4);
              v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v26, v27);
              v56 = 0;
              v57 = &v56;
              v58 = 0x3032000000;
              v59 = __Block_byref_object_copy__5036;
              v60 = __Block_byref_object_dispose__5037;
              v61 = 0;
              v52 = 0;
              v53 = &v52;
              v54 = 0x2020000000;
              v55 = 1;
              v48[0] = MEMORY[0x1E0C809B0];
              v48[1] = 3221225472;
              v48[2] = ___ZL39_writeVersion1PersonAndFaceObservationsPU44objcproto9NSCopying8NSObject14NSSecureCoding11objc_objectP7NSArrayIP17VNFaceObservationEP14NSOutputStreamP14CC_MD5state_stPU15__autoreleasingP7NSError_block_invoke;
              v48[3] = &unk_1E4543E10;
              v50 = &v56;
              v51 = &v52;
              v29 = v23;
              v49 = v29;
              objc_msgSend(v20, "enumerateObjectsAtIndexes:options:usingBlock:", v28, 0, v48);
              if (!*((_BYTE *)v53 + 24))
                break;
              v30 = VNPersonsModelIOWriteTaggedDataToOutputStream(1227572778, v29, v45, v46, &v47);

              _Block_object_dispose(&v52, 8);
              _Block_object_dispose(&v56, 8);

              v26 += v27;
              if (v26 < v25)
                v31 = v30;
              else
                v31 = 0;
              if ((v31 & 1) == 0)
                goto LABEL_24;
            }
            v47 = objc_retainAutorelease((id)v57[5]);

            _Block_object_dispose(&v52, 8);
            _Block_object_dispose(&v56, 8);

            v30 = 0;
          }
          else
          {
            v30 = 1;
          }
LABEL_24:

          v22 = v43;
          v32 = v44;
        }
        else
        {
          v32 = v44;
          v30 = 0;
          v47 = objc_retainAutorelease(v44);
        }

        v33 = v47;
        objc_autoreleasePoolPop(context);
        if ((v30 & 1) == 0)
          break;
        ++v11;
        v12 = v33;
        self = v38;
        v9 = v39;
        if (v11 == v37)
          goto LABEL_31;
      }
      if (v36)
      {
        v33 = objc_retainAutorelease(v33);
        v34 = 0;
        *v36 = v33;
      }
      else
      {
        v34 = 0;
      }
      v9 = v39;
    }
    else
    {
      v33 = 0;
LABEL_31:
      v34 = VNPersonsModelIOWriteTagToOutputStream(1886217324, v9, v46, v36);
    }

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (BOOL)writeReadOnlyVersion1ToOutputStream:(id)a3 options:(id)a4 md5Context:(CC_MD5state_st *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  BOOL v11;
  unsigned int v13;

  v9 = a3;
  if (self)
  {
    -[VNMutablePersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", 0, a6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10
       && (v13 = 0,
           (objc_msgSend((id)objc_opt_class(), "getStoredRepresentationTag:forModelVersion:error:", &v13, 1, a6) & 1) != 0)
       && VNPersonsModelIOWriteTagToOutputStream(1886220911, v9, a5, a6)
       && VNPersonsModelIOWriteTagToOutputStream(1, v9, a5, a6)
       && -[VNMutablePersonsModel _writeVersion1InformationToOutputStream:md5Context:error:]((uint64_t)self, v9, a5, a6)&& -[VNMutablePersonsModel _writeVersion1ConfigurationToOutputStream:md5Context:error:](self, v9, a5, a6)&& VNPersonsModelIOWriteTaggedObjectToOutputStream(v13, (uint64_t)v10, v9, a5, a6)&& VNPersonsModelIOWriteTagToOutputStream(1886220911, v9, a5, a6);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_getModelWritingImplementation:(void *)a3 selector:(SEL *)a4 version:(unint64_t *)a5 forOptions:(id)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  _QWORD v18[8];
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v10 = a6;
  v11 = objc_msgSend(v10, "version");
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v11);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "supportedWriteVersions");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  v14 = objc_msgSend(v10, "readOnly");
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__VNMutablePersonsModel__getModelWritingImplementation_selector_version_forOptions___block_invoke;
  v18[3] = &unk_1E4548268;
  v18[6] = a3;
  v18[7] = a4;
  v19 = v14;
  v18[4] = self;
  v18[5] = &v20;
  objc_msgSend(v13, "enumerateIndexesWithOptions:usingBlock:", 2, v18);
  v15 = v21[3];
  if (v15)
    *a5 = v15;
  v16 = v15 != 0;
  _Block_object_dispose(&v20, 8);

  return v16;
}

- (BOOL)writeToStream:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  CC_MD5_CTX c;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(VNMutablePersonsModel *, uint64_t, id, id, CC_MD5_CTX *, id *);
  unsigned __int8 md[16];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v17 = 0;
  v18 = 0;
  v16 = 0;
  if (!-[VNMutablePersonsModel _getModelWritingImplementation:selector:version:forOptions:](self, "_getModelWritingImplementation:selector:version:forOptions:", &v18, &v17, &v16, v9))
  {
    if (a5)
    {
      VNPersonsModelErrorForUnacceptableModelVersion(v16);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  CC_MD5_Init(&c);
  if ((v18(self, v17, v8, v9, &c, a5) & 1) == 0)
    goto LABEL_9;
  CC_MD5_Final(md, &c);
  v10 = v8;
  v11 = objc_msgSend(v10, "write:maxLength:", md, 16);
  v12 = v11 == 16;
  if (v11 != 16 && a5)
  {
    objc_msgSend(v10, "streamError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    VNPersonsModelErrorWithLocalizedDescriptionAndUnderlyingError(1, CFSTR("failed to write to data stream"), v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:

  return v12;
}

- (id)dataWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToMemory");
  if ((-[VNMutablePersonsModel _writeToUnopenedStream:options:error:](self, v7, v6, (uint64_t)a4) & 1) != 0)
  {
    objc_msgSend(v7, "propertyForKey:", *MEMORY[0x1E0C99868]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("failed to obtain the data"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)writeToURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initWithURL:append:", v8, 0);
  LOBYTE(a5) = -[VNMutablePersonsModel _writeToUnopenedStream:options:error:](self, v10, v9, (uint64_t)a5);

  return (char)a5;
}

- (BOOL)addFaceObservations:(id)a3 toPersonWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  return -[VNPersonsModelData addFaceObservations:toPersonWithUniqueIdentifier:error:](self->_modelData, "addFaceObservations:toPersonWithUniqueIdentifier:error:", a3, a4, a5);
}

- (BOOL)removeFaceObservations:(id)a3 fromPersonWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  return -[VNPersonsModelData removeFaceObservations:fromPersonWithUniqueIdentifier:error:](self->_modelData, "removeFaceObservations:fromPersonWithUniqueIdentifier:error:", a3, a4, a5);
}

- (BOOL)removeAllFaceObservationsFromPersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  return -[VNPersonsModelData removeAllFaceObservationsFromPersonWithUniqueIdentifier:error:](self->_modelData, "removeAllFaceObservationsFromPersonWithUniqueIdentifier:error:", a3, a4);
}

- (BOOL)removePersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  return -[VNPersonsModelData removePersonWithUniqueIdentifier:error:](self->_modelData, "removePersonWithUniqueIdentifier:error:", a3, a4);
}

- (void)personsModelDataWasModified:(id)a3
{
  VNPersonsModelFaceModel *faceModel_DO_NOT_ACCESS_DIRECTLY;
  id v5;

  v5 = a3;
  -[VNPersonsModel updateInternalConfigurationWithModelFaceprintRequestRevision:error:](self, "updateInternalConfigurationWithModelFaceprintRequestRevision:error:", objc_msgSend(v5, "faceprintRequestRevision"), 0);
  if (self)
  {
    faceModel_DO_NOT_ACCESS_DIRECTLY = self->super._faceModel_DO_NOT_ACCESS_DIRECTLY;
    self->super._faceModel_DO_NOT_ACCESS_DIRECTLY = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelData, 0);
}

- (uint64_t)_writeToUnopenedStream:(void *)a3 options:(uint64_t)a4 error:
{
  id v7;
  id v8;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(v7, "open");
    LOBYTE(a1) = objc_msgSend(a1, "writeToStream:options:error:", v7, v8, a4);
    objc_msgSend(v7, "close");
  }

  return a1 & 1;
}

void __84__VNMutablePersonsModel__getModelWritingImplementation_selector_version_forOptions___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  IMP *v6;
  const char **v7;
  int v8;
  id v9;
  const __CFString *v10;
  const char *v11;
  objc_class *v12;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSString *v15;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(IMP **)(a1 + 48);
    v7 = *(const char ***)(a1 + 56);
    v8 = *(unsigned __int8 *)(a1 + 64);
    *v6 = 0;
    *v7 = 0;
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    v10 = CFSTR("writeReadOnlyVersion");
    if (!v8)
      v10 = CFSTR("writeVersion");
    v15 = (NSString *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@%lu%@"), v10, a2, CFSTR("ToOutputStream:options:md5Context:error:"));
    v11 = NSSelectorFromString(v15);
    *v7 = v11;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (v12 = (objc_class *)objc_opt_class(), (InstanceMethod = class_getInstanceMethod(v12, v11)) != 0)
      && (Implementation = method_getImplementation(InstanceMethod)) != 0)
    {
      *v6 = Implementation;

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
      *a3 = 1;
    }
    else
    {

    }
  }
}

- (_QWORD)_writeVersion1InformationToOutputStream:(CC_MD5_CTX *)a3 md5Context:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  _QWORD *v9;

  v7 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 40), "lastModificationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = VNPersonsModelIOWriteTaggedObjectToOutputStream(1819111268, (uint64_t)v8, v7, a3, a4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_QWORD)_writeVersion1ConfigurationToOutputStream:(CC_MD5_CTX *)a3 md5Context:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  int v12;
  int v13;

  v7 = a2;
  if (a1)
  {
    objc_msgSend(a1, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "maximumIdentities");
    if ((VNPersonsModelIOWriteTaggedBufferToOutputStream(1835104329, &v12, 4u, v7, a3, (uint64_t)a4) & 1) != 0
      && (v13 = objc_msgSend(v8, "maximumTrainingFaceprintsPerIdentity"),
          VNPersonsModelIOWriteTaggedBufferToOutputStream(1833250633, &v13, 4u, v7, a3, (uint64_t)a4)))
    {
      objc_msgSend(v8, "resolvedAlgorithmAndReturnError:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = VNPersonsModelIOWriteTaggedObjectToOutputStream(1634494319, (uint64_t)v9, v7, a3, a4);
      else
        v10 = 0;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_version1ModelWithObjects:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = v6;
  objc_msgSend(a1, "configurationFromLoadedObjects:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:", v7);
    if (v8)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E459C688);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v9, "keyEnumerator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v10);
            v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v9, "objectForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v14) = objc_msgSend(v8, "addFaceObservations:toPersonWithUniqueIdentifier:error:", v15, v14, a4);

            if (!(_DWORD)v14)
            {

              v16 = 0;
              goto LABEL_14;
            }
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v11)
            continue;
          break;
        }
      }

      v16 = v8;
LABEL_14:

    }
    else if (a4)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)supportedWriteVersions
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VNMutablePersonsModel_supportedWriteVersions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNMutablePersonsModel supportedWriteVersions]::onceToken != -1)
    dispatch_once(&+[VNMutablePersonsModel supportedWriteVersions]::onceToken, block);
  return (id)+[VNMutablePersonsModel supportedWriteVersions]::ourSupportedWriteVersions;
}

+ (id)newModelFromVersion:(unint64_t)a3 objects:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v8 = a4;
  if (a3 == 1)
  {
    objc_msgSend(a1, "_version1ModelWithObjects:error:", v8, a5);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___VNMutablePersonsModel;
    v9 = (uint64_t)objc_msgSendSuper2(&v12, sel_newModelFromVersion_objects_error_, a3, v8, a5);
  }
  v10 = (void *)v9;

  return v10;
}

void __47__VNMutablePersonsModel_supportedWriteVersions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(*(id *)(a1 + 32), "versionNumbersEncodedInClass:withMethodNamePrefix:suffix:", objc_opt_class(), CFSTR("writeVersion"), CFSTR("ToOutputStream:options:md5Context:error:"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addIndexes:", v2);

  objc_msgSend(*(id *)(a1 + 32), "versionNumbersEncodedInClass:withMethodNamePrefix:suffix:", objc_opt_class(), CFSTR("writeVersion"), CFSTR("ToOutputStream:options:md5Context:error:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addIndexes:", v3);

  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)+[VNMutablePersonsModel supportedWriteVersions]::ourSupportedWriteVersions;
  +[VNMutablePersonsModel supportedWriteVersions]::ourSupportedWriteVersions = v4;

}

@end
