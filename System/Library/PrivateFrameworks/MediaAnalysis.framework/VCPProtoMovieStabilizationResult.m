@implementation VCPProtoMovieStabilizationResult

- (BOOL)hasRecipeBlob
{
  return self->_recipeBlob != 0;
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
  v8.super_class = (Class)VCPProtoMovieStabilizationResult;
  -[VCPProtoMovieStabilizationResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieStabilizationResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  NSData *recipeBlob;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_analysisConfidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("analysisConfidence"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_gyroStabilization);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("gyroStabilization"));

  recipeBlob = self->_recipeBlob;
  if (recipeBlob)
    objc_msgSend(v3, "setObject:forKey:", recipeBlob, CFSTR("recipeBlob"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieStabilizationResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteBOOLField();
  if (self->_recipeBlob)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  NSData *recipeBlob;

  *((_DWORD *)a3 + 2) = LODWORD(self->_analysisConfidence);
  *((_BYTE *)a3 + 24) = self->_gyroStabilization;
  recipeBlob = self->_recipeBlob;
  if (recipeBlob)
    objc_msgSend(a3, "setRecipeBlob:", recipeBlob);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(float *)(v5 + 8) = self->_analysisConfidence;
  *(_BYTE *)(v5 + 24) = self->_gyroStabilization;
  v6 = -[NSData copyWithZone:](self->_recipeBlob, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *recipeBlob;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || self->_analysisConfidence != *((float *)v4 + 2))
  {
    goto LABEL_8;
  }
  if (self->_gyroStabilization)
  {
    if (*((_BYTE *)v4 + 24))
      goto LABEL_5;
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if (*((_BYTE *)v4 + 24))
    goto LABEL_8;
LABEL_5:
  recipeBlob = self->_recipeBlob;
  if ((unint64_t)recipeBlob | *((_QWORD *)v4 + 2))
    v6 = -[NSData isEqual:](recipeBlob, "isEqual:");
  else
    v6 = 1;
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  float analysisConfidence;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _BOOL4 gyroStabilization;
  unint64_t v12;

  analysisConfidence = self->_analysisConfidence;
  v4 = -analysisConfidence;
  if (analysisConfidence >= 0.0)
    v4 = self->_analysisConfidence;
  v5 = floorf(v4 + 0.5);
  v6 = (float)(v4 - v5) * 1.8447e19;
  v7 = fmodf(v5, 1.8447e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0)
    v12 = v10;
  else
    v12 = v9;
  gyroStabilization = self->_gyroStabilization;
  return (2654435761 * gyroStabilization) ^ v12 ^ -[NSData hash](self->_recipeBlob, "hash");
}

- (void)mergeFrom:(id)a3
{
  self->_analysisConfidence = *((float *)a3 + 2);
  self->_gyroStabilization = *((_BYTE *)a3 + 24);
  if (*((_QWORD *)a3 + 2))
    -[VCPProtoMovieStabilizationResult setRecipeBlob:](self, "setRecipeBlob:");
}

- (float)analysisConfidence
{
  return self->_analysisConfidence;
}

- (void)setAnalysisConfidence:(float)a3
{
  self->_analysisConfidence = a3;
}

- (BOOL)gyroStabilization
{
  return self->_gyroStabilization;
}

- (void)setGyroStabilization:(BOOL)a3
{
  self->_gyroStabilization = a3;
}

- (NSData)recipeBlob
{
  return self->_recipeBlob;
}

- (void)setRecipeBlob:(id)a3
{
  objc_storeStrong((id *)&self->_recipeBlob, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipeBlob, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  VCPProtoMovieStabilizationResult *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("analysisConfidence"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gyroStabilization"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_alloc_init(VCPProtoMovieStabilizationResult);
    objc_msgSend(v4, "floatValue");
    -[VCPProtoMovieStabilizationResult setAnalysisConfidence:](v8, "setAnalysisConfidence:");
    -[VCPProtoMovieStabilizationResult setGyroStabilization:](v8, "setGyroStabilization:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stabilizationRecipe"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      -[VCPProtoMovieStabilizationResult setRecipeBlob:](v8, "setRecipeBlob:", v9);

  }
  return v8;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoMovieStabilizationResult analysisConfidence](self, "analysisConfidence");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("analysisConfidence"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VCPProtoMovieStabilizationResult gyroStabilization](self, "gyroStabilization"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("gyroStabilization"));

  if (-[VCPProtoMovieStabilizationResult hasRecipeBlob](self, "hasRecipeBlob"))
  {
    -[VCPProtoMovieStabilizationResult recipeBlob](self, "recipeBlob");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("stabilizationRecipe"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("attributes"));

  return v3;
}

@end
