@implementation VCPProtoLivePhotoKeyFrameFaceResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  void *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  VCPProtoLivePhotoKeyFrameFaceResult *v8;
  void *v9;
  NSRect v11;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("faceBounds"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("faceQuality"));
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
    v8 = objc_alloc_init(VCPProtoLivePhotoKeyFrameFaceResult);
    v11 = NSRectFromString(v4);
    +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPProtoLivePhotoKeyFrameFaceResult setFaceBounds:](v8, "setFaceBounds:", v9);

    objc_msgSend(v6, "floatValue");
    -[VCPProtoLivePhotoKeyFrameFaceResult setFaceQuality:](v8, "setFaceQuality:");
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
  _QWORD v10[2];
  _QWORD v11[2];
  const __CFString *v12;
  _QWORD v13[2];
  NSRect v14;

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = CFSTR("attributes");
  v10[0] = CFSTR("faceBounds");
  -[VCPProtoLivePhotoKeyFrameFaceResult faceBounds](self, "faceBounds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rectValue");
  NSStringFromRect(v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("faceQuality");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoKeyFrameFaceResult faceQuality](self, "faceQuality");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  v8.super_class = (Class)VCPProtoLivePhotoKeyFrameFaceResult;
  -[VCPProtoLivePhotoKeyFrameFaceResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoKeyFrameFaceResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  VCPProtoBounds *faceBounds;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  faceBounds = self->_faceBounds;
  if (faceBounds)
  {
    -[VCPProtoBounds dictionaryRepresentation](faceBounds, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("faceBounds"));

  }
  *(float *)&v4 = self->_faceQuality;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("faceQuality"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoKeyFrameFaceResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  VCPProtoBounds *faceBounds;
  float *v5;

  faceBounds = self->_faceBounds;
  v5 = (float *)a3;
  objc_msgSend(v5, "setFaceBounds:", faceBounds);
  v5[4] = self->_faceQuality;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoBounds copyWithZone:](self->_faceBounds, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(float *)(v5 + 16) = self->_faceQuality;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  VCPProtoBounds *faceBounds;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((faceBounds = self->_faceBounds, !((unint64_t)faceBounds | *((_QWORD *)v4 + 1)))
     || -[VCPProtoBounds isEqual:](faceBounds, "isEqual:"))
    && self->_faceQuality == *((float *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  float faceQuality;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  float v10;
  unint64_t v11;

  v3 = -[VCPProtoBounds hash](self->_faceBounds, "hash");
  faceQuality = self->_faceQuality;
  v5 = -faceQuality;
  if (faceQuality >= 0.0)
    v5 = self->_faceQuality;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  v9 = v8 + (unint64_t)v7;
  v10 = fabsf(v7);
  if (v7 <= 0.0)
    v9 = v8;
  v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0)
    v11 = v9;
  return v11 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoBounds *faceBounds;
  uint64_t v6;
  id v7;

  v4 = a3;
  faceBounds = self->_faceBounds;
  v6 = *((_QWORD *)v4 + 1);
  if (faceBounds)
  {
    if (v6)
    {
      v7 = v4;
      -[VCPProtoBounds mergeFrom:](faceBounds, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[VCPProtoLivePhotoKeyFrameFaceResult setFaceBounds:](self, "setFaceBounds:");
    goto LABEL_6;
  }
  self->_faceQuality = *((float *)v4 + 4);

}

- (VCPProtoBounds)faceBounds
{
  return self->_faceBounds;
}

- (void)setFaceBounds:(id)a3
{
  objc_storeStrong((id *)&self->_faceBounds, a3);
}

- (float)faceQuality
{
  return self->_faceQuality;
}

- (void)setFaceQuality:(float)a3
{
  self->_faceQuality = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceBounds, 0);
}

@end
