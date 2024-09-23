@implementation VCPProtoLivePhotoEffectsResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  VCPProtoLivePhotoEffectsResult *v10;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("loopSuggestionState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longExposureSuggestionState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("livePhotoEffectsRecipe"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(VCPProtoLivePhotoEffectsResult);
    -[VCPProtoLivePhotoEffectsResult setLoopSuggestionState:](v10, "setLoopSuggestionState:", v6);
    -[VCPProtoLivePhotoEffectsResult setLongExposureSuggestionState:](v10, "setLongExposureSuggestionState:", v8);
    if (v9)
      -[VCPProtoLivePhotoEffectsResult setRecipeBlob:](v10, "setRecipeBlob:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[VCPProtoLivePhotoEffectsResult loopSuggestionState](self, "loopSuggestionState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("loopSuggestionState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[VCPProtoLivePhotoEffectsResult longExposureSuggestionState](self, "longExposureSuggestionState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("longExposureSuggestionState"));

  -[VCPProtoLivePhotoEffectsResult recipeBlob](self, "recipeBlob");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[VCPProtoLivePhotoEffectsResult recipeBlob](self, "recipeBlob");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("livePhotoEffectsRecipe"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("attributes"));

  return v3;
}

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
  v8.super_class = (Class)VCPProtoLivePhotoEffectsResult;
  -[VCPProtoLivePhotoEffectsResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoEffectsResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSData *recipeBlob;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_loopSuggestionState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("loopSuggestionState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_longExposureSuggestionState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("longExposureSuggestionState"));

  recipeBlob = self->_recipeBlob;
  if (recipeBlob)
    objc_msgSend(v3, "setObject:forKey:", recipeBlob, CFSTR("recipeBlob"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoEffectsResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  if (self->_recipeBlob)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  NSData *recipeBlob;

  *((_QWORD *)a3 + 2) = self->_loopSuggestionState;
  *((_QWORD *)a3 + 1) = self->_longExposureSuggestionState;
  recipeBlob = self->_recipeBlob;
  if (recipeBlob)
    objc_msgSend(a3, "setRecipeBlob:", recipeBlob);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[2] = self->_loopSuggestionState;
  v5[1] = self->_longExposureSuggestionState;
  v6 = -[NSData copyWithZone:](self->_recipeBlob, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *recipeBlob;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_loopSuggestionState == v4[2]
    && self->_longExposureSuggestionState == v4[1])
  {
    recipeBlob = self->_recipeBlob;
    if ((unint64_t)recipeBlob | v4[3])
      v6 = -[NSData isEqual:](recipeBlob, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = (2654435761u * self->_longExposureSuggestionState) ^ (2654435761u * self->_loopSuggestionState);
  return v2 ^ -[NSData hash](self->_recipeBlob, "hash");
}

- (void)mergeFrom:(id)a3
{
  self->_loopSuggestionState = *((_QWORD *)a3 + 2);
  self->_longExposureSuggestionState = *((_QWORD *)a3 + 1);
  if (*((_QWORD *)a3 + 3))
    -[VCPProtoLivePhotoEffectsResult setRecipeBlob:](self, "setRecipeBlob:");
}

- (unint64_t)loopSuggestionState
{
  return self->_loopSuggestionState;
}

- (void)setLoopSuggestionState:(unint64_t)a3
{
  self->_loopSuggestionState = a3;
}

- (unint64_t)longExposureSuggestionState
{
  return self->_longExposureSuggestionState;
}

- (void)setLongExposureSuggestionState:(unint64_t)a3
{
  self->_longExposureSuggestionState = a3;
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

@end
