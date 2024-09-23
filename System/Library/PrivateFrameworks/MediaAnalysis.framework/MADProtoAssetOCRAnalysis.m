@implementation MADProtoAssetOCRAnalysis

- (BOOL)hasCharacterRecognitionData
{
  return self->_characterRecognitionData != 0;
}

- (BOOL)hasMachineReadableCodeData
{
  return self->_machineReadableCodeData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MADProtoAssetOCRAnalysis;
  -[MADProtoAssetOCRAnalysis description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoAssetOCRAnalysis dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *assetCloudIdentifier;
  void *v6;
  void *v7;
  void *v8;
  NSData *characterRecognitionData;
  NSData *machineReadableCodeData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if (assetCloudIdentifier)
    objc_msgSend(v3, "setObject:forKey:", assetCloudIdentifier, CFSTR("assetCloudIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_assetAdjustmentTimestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("assetAdjustmentTimestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_algorithmVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("algorithmVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_adjustmentVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("adjustmentVersion"));

  characterRecognitionData = self->_characterRecognitionData;
  if (characterRecognitionData)
    objc_msgSend(v4, "setObject:forKey:", characterRecognitionData, CFSTR("characterRecognitionData"));
  machineReadableCodeData = self->_machineReadableCodeData;
  if (machineReadableCodeData)
    objc_msgSend(v4, "setObject:forKey:", machineReadableCodeData, CFSTR("machineReadableCodeData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MADProtoAssetOCRAnalysisReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDoubleField();
  if (self->_characterRecognitionData)
    PBDataWriterWriteDataField();
  if (self->_machineReadableCodeData)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setAssetCloudIdentifier:", self->_assetCloudIdentifier);
  v4 = v5;
  *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_assetAdjustmentTimestamp;
  *((_DWORD *)v5 + 6) = self->_algorithmVersion;
  *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_adjustmentVersion;
  if (self->_characterRecognitionData)
  {
    objc_msgSend(v5, "setCharacterRecognitionData:");
    v4 = v5;
  }
  if (self->_machineReadableCodeData)
  {
    objc_msgSend(v5, "setMachineReadableCodeData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_assetCloudIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  *(double *)(v5 + 16) = self->_assetAdjustmentTimestamp;
  *(_DWORD *)(v5 + 24) = self->_algorithmVersion;
  *(double *)(v5 + 8) = self->_adjustmentVersion;
  v8 = -[NSData copyWithZone:](self->_characterRecognitionData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSData copyWithZone:](self->_machineReadableCodeData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *assetCloudIdentifier;
  NSData *characterRecognitionData;
  NSData *machineReadableCodeData;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((assetCloudIdentifier = self->_assetCloudIdentifier, !((unint64_t)assetCloudIdentifier | v4[4]))
     || -[NSString isEqual:](assetCloudIdentifier, "isEqual:"))
    && self->_assetAdjustmentTimestamp == *((double *)v4 + 2)
    && self->_algorithmVersion == *((_DWORD *)v4 + 6)
    && self->_adjustmentVersion == *((double *)v4 + 1)
    && ((characterRecognitionData = self->_characterRecognitionData,
         !((unint64_t)characterRecognitionData | v4[5]))
     || -[NSData isEqual:](characterRecognitionData, "isEqual:")))
  {
    machineReadableCodeData = self->_machineReadableCodeData;
    if ((unint64_t)machineReadableCodeData | v4[6])
      v8 = -[NSData isEqual:](machineReadableCodeData, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  double assetAdjustmentTimestamp;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t algorithmVersion;
  double adjustmentVersion;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  double v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = -[NSString hash](self->_assetCloudIdentifier, "hash");
  assetAdjustmentTimestamp = self->_assetAdjustmentTimestamp;
  v5 = -assetAdjustmentTimestamp;
  if (assetAdjustmentTimestamp >= 0.0)
    v5 = self->_assetAdjustmentTimestamp;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = fmod(v6, 1.84467441e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0)
    v12 = v11;
  else
    v12 = v10;
  algorithmVersion = self->_algorithmVersion;
  adjustmentVersion = self->_adjustmentVersion;
  v15 = -adjustmentVersion;
  if (adjustmentVersion >= 0.0)
    v15 = self->_adjustmentVersion;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  v19 = v18 + (unint64_t)v17;
  v20 = fabs(v17);
  if (v17 <= 0.0)
    v19 = v18;
  v21 = v18 - (unint64_t)v20;
  if (v17 >= 0.0)
    v21 = v19;
  v22 = v12 ^ v3 ^ (2654435761 * algorithmVersion) ^ v21;
  v23 = -[NSData hash](self->_characterRecognitionData, "hash");
  return v22 ^ v23 ^ -[NSData hash](self->_machineReadableCodeData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;

  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[MADProtoAssetOCRAnalysis setAssetCloudIdentifier:](self, "setAssetCloudIdentifier:");
  self->_assetAdjustmentTimestamp = *((double *)v4 + 2);
  self->_algorithmVersion = *((_DWORD *)v4 + 6);
  self->_adjustmentVersion = *((double *)v4 + 1);
  if (*((_QWORD *)v4 + 5))
    -[MADProtoAssetOCRAnalysis setCharacterRecognitionData:](self, "setCharacterRecognitionData:");
  if (*((_QWORD *)v4 + 6))
    -[MADProtoAssetOCRAnalysis setMachineReadableCodeData:](self, "setMachineReadableCodeData:");

}

- (NSString)assetCloudIdentifier
{
  return self->_assetCloudIdentifier;
}

- (void)setAssetCloudIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetCloudIdentifier, a3);
}

- (double)assetAdjustmentTimestamp
{
  return self->_assetAdjustmentTimestamp;
}

- (void)setAssetAdjustmentTimestamp:(double)a3
{
  self->_assetAdjustmentTimestamp = a3;
}

- (int)algorithmVersion
{
  return self->_algorithmVersion;
}

- (void)setAlgorithmVersion:(int)a3
{
  self->_algorithmVersion = a3;
}

- (double)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (void)setAdjustmentVersion:(double)a3
{
  self->_adjustmentVersion = a3;
}

- (NSData)characterRecognitionData
{
  return self->_characterRecognitionData;
}

- (void)setCharacterRecognitionData:(id)a3
{
  objc_storeStrong((id *)&self->_characterRecognitionData, a3);
}

- (NSData)machineReadableCodeData
{
  return self->_machineReadableCodeData;
}

- (void)setMachineReadableCodeData:(id)a3
{
  objc_storeStrong((id *)&self->_machineReadableCodeData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machineReadableCodeData, 0);
  objc_storeStrong((id *)&self->_characterRecognitionData, 0);
  objc_storeStrong((id *)&self->_assetCloudIdentifier, 0);
}

+ (id)protoFromPhotosAsset:(id)a3
{
  id v3;
  MADProtoAssetOCRAnalysis *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MADProtoAssetOCRAnalysis *v15;
  id v17;

  v3 = a3;
  v4 = objc_alloc_init(MADProtoAssetOCRAnalysis);
  objc_msgSend(v3, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v5, "mad_cloudIdentifierForLocalIdentifier:error:", v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  -[MADProtoAssetOCRAnalysis setAssetCloudIdentifier:](v4, "setAssetCloudIdentifier:", v7);

  -[MADProtoAssetOCRAnalysis assetCloudIdentifier](v4, "assetCloudIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "adjustmentTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    -[MADProtoAssetOCRAnalysis setAssetAdjustmentTimestamp:](v4, "setAssetAdjustmentTimestamp:");

    objc_msgSend(v3, "characterRecognitionProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADProtoAssetOCRAnalysis setAlgorithmVersion:](v4, "setAlgorithmVersion:", objc_msgSend(v11, "algorithmVersion"));
    objc_msgSend(v11, "adjustmentVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    -[MADProtoAssetOCRAnalysis setAdjustmentVersion:](v4, "setAdjustmentVersion:");

    objc_msgSend(v11, "characterRecognitionData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADProtoAssetOCRAnalysis setCharacterRecognitionData:](v4, "setCharacterRecognitionData:", v13);

    objc_msgSend(v11, "machineReadableCodeData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADProtoAssetOCRAnalysis setMachineReadableCodeData:](v4, "setMachineReadableCodeData:", v14);

    v15 = v4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[MADProtoAssetOCRAnalysis(Photos) protoFromPhotosAsset:].cold.1(v3, (uint64_t)v8);
    v15 = 0;
  }

  return v15;
}

- (void)persistToPhotosAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CD13A8], "changeRequestForAsset:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoAssetOCRAnalysis characterRecognitionData](self, "characterRecognitionData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoAssetOCRAnalysis machineReadableCodeData](self, "machineReadableCodeData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MADProtoAssetOCRAnalysis algorithmVersion](self, "algorithmVersion");
  v8 = (void *)MEMORY[0x1E0C99D68];
  -[MADProtoAssetOCRAnalysis adjustmentVersion](self, "adjustmentVersion");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCharacterRecognitionData:machineReadableCodeData:algorithmVersion:adjustmentVersion:", v5, v6, v7, v9);

  if (objc_msgSend(v10, "mad_isEligibleForComputeSync"))
    objc_msgSend(v4, "setAssetAnalysisStage:", objc_msgSend(v10, "mad_analysisStageAfterCompletingAnalysis:", 10));

}

@end
