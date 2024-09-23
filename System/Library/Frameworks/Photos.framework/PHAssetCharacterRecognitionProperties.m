@implementation PHAssetCharacterRecognitionProperties

- (PHAssetCharacterRecognitionProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetCharacterRecognitionProperties *v10;
  PHAssetCharacterRecognitionProperties *v11;
  uint64_t v12;
  NSData *characterRecognitionData;
  uint64_t v14;
  NSData *machineReadableCodeData;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  NSData *v19;
  uint64_t v20;
  NSData *v21;
  void *v22;
  uint64_t v23;
  NSDate *adjustmentVersion;
  objc_super v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PHAssetCharacterRecognitionProperties;
  v10 = -[PHAssetCharacterRecognitionProperties init](&v26, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mediaAnalysisAttributes.characterRecognitionAttributes.characterRecognitionData"));
      v12 = objc_claimAutoreleasedReturnValue();
      characterRecognitionData = v11->_characterRecognitionData;
      v11->_characterRecognitionData = (NSData *)v12;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mediaAnalysisAttributes.characterRecognitionAttributes.machineReadableCodeData"));
      v14 = objc_claimAutoreleasedReturnValue();
      machineReadableCodeData = v11->_machineReadableCodeData;
      v11->_machineReadableCodeData = (NSData *)v14;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mediaAnalysisAttributes.characterRecognitionAttributes.algorithmVersion"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_algorithmVersion = objc_msgSend(v16, "integerValue");

      v17 = CFSTR("mediaAnalysisAttributes.characterRecognitionAttributes.adjustmentVersion");
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("characterRecognitionAttributes.characterRecognitionData"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v11->_characterRecognitionData;
      v11->_characterRecognitionData = (NSData *)v18;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("characterRecognitionAttributes.machineReadableCodeData"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v11->_machineReadableCodeData;
      v11->_machineReadableCodeData = (NSData *)v20;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("characterRecognitionAttributes.algorithmVersion"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_algorithmVersion = objc_msgSend(v22, "integerValue");

      v17 = CFSTR("characterRecognitionAttributes.adjustmentVersion");
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", v17);
    v23 = objc_claimAutoreleasedReturnValue();
    adjustmentVersion = v11->_adjustmentVersion;
    v11->_adjustmentVersion = (NSDate *)v23;

  }
  return v11;
}

- (NSData)characterRecognitionData
{
  return self->_characterRecognitionData;
}

- (NSData)machineReadableCodeData
{
  return self->_machineReadableCodeData;
}

- (int64_t)algorithmVersion
{
  return self->_algorithmVersion;
}

- (NSDate)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentVersion, 0);
  objc_storeStrong((id *)&self->_machineReadableCodeData, 0);
  objc_storeStrong((id *)&self->_characterRecognitionData, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetCharacterRecognitionProperties");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_61;
}

+ (id)entityName
{
  return CFSTR("MediaAnalysisAssetAttributes");
}

+ (id)keyPathFromPrimaryObject
{
  return CFSTR("mediaAnalysisAttributes");
}

void __58__PHAssetCharacterRecognitionProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("characterRecognitionAttributes.characterRecognitionData");
  v3[1] = CFSTR("characterRecognitionAttributes.machineReadableCodeData");
  v3[2] = CFSTR("characterRecognitionAttributes.algorithmVersion");
  v3[3] = CFSTR("characterRecognitionAttributes.adjustmentVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_61;
  propertiesToFetch_pl_once_object_61 = v1;

}

@end
