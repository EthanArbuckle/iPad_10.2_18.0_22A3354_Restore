@implementation MADVIMachineReadableCodeDetectionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIMachineReadableCodeDetectionResult)initWithObservations:(id)a3
{
  id v5;
  MADVIMachineReadableCodeDetectionResult *v6;
  MADVIMachineReadableCodeDetectionResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADVIMachineReadableCodeDetectionResult;
  v6 = -[MADResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_observations, a3);

  return v7;
}

- (MADVIMachineReadableCodeDetectionResult)initWithCoder:(id)a3
{
  id v4;
  MADVIMachineReadableCodeDetectionResult *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *observations;
  objc_super v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADVIMachineReadableCodeDetectionResult;
  v5 = -[MADResult initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = objc_opt_class();
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v7 = (void *)getVNBarcodeObservationClass_softClass;
    v19 = getVNBarcodeObservationClass_softClass;
    if (!getVNBarcodeObservationClass_softClass)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __getVNBarcodeObservationClass_block_invoke;
      v15[3] = &unk_1E97E2300;
      v15[4] = &v16;
      __getVNBarcodeObservationClass_block_invoke((uint64_t)v15);
      v7 = (void *)v17[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v16, 8);
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("Observations"));
    v11 = objc_claimAutoreleasedReturnValue();
    observations = v5->_observations;
    v5->_observations = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVIMachineReadableCodeDetectionResult;
  v4 = a3;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_observations, CFSTR("Observations"), v5.receiver, v5.super_class);

}

- (unint64_t)executionNanoseconds
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADVIMachineReadableCodeDetectionResult;
  return -[MADResult executionNanoseconds](&v3, sel_executionNanoseconds);
}

- (double)executionTimeInterval
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADVIMachineReadableCodeDetectionResult;
  -[MADResult executionTimeInterval](&v3, sel_executionTimeInterval);
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("observations: %@>"), self->_observations);
  return v3;
}

- (NSArray)resultItems
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  MADVIMachineReadableCodeDetectionResultItem *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  MADVIMachineReadableCodeDetectionResultItem *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = self->_observations;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
        v10 = [MADVIMachineReadableCodeDetectionResultItem alloc];
        objc_msgSend(v9, "topLeft", (_QWORD)v32);
        v12 = v11;
        v14 = v13;
        objc_msgSend(v9, "topRight");
        v16 = v15;
        v18 = v17;
        objc_msgSend(v9, "bottomLeft");
        v20 = v19;
        v22 = v21;
        objc_msgSend(v9, "bottomRight");
        v24 = v23;
        v26 = v25;
        objc_msgSend(v9, "symbology");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "payloadStringValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "barcodeDescriptor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[MADVIMachineReadableCodeDetectionResultItem initWithTopLeft:topRight:bottomLeft:bottomRight:symbology:payload:andDescriptor:](v10, "initWithTopLeft:topRight:bottomLeft:bottomRight:symbology:payload:andDescriptor:", v27, v28, v29, v12, v14, v16, v18, v20, v22, v24, v26);
        objc_msgSend(v3, "addObject:", v30);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)observations
{
  return self->_observations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observations, 0);
}

@end
