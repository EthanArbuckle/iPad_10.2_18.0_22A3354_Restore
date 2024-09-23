@implementation VCPProtoImageHumanPoseResult

- (void)clearKeypoints
{
  -[NSMutableArray removeAllObjects](self->_keypoints, "removeAllObjects");
}

- (void)addKeypoints:(id)a3
{
  id v4;
  NSMutableArray *keypoints;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  keypoints = self->_keypoints;
  v8 = v4;
  if (!keypoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_keypoints;
    self->_keypoints = v6;

    v4 = v8;
    keypoints = self->_keypoints;
  }
  -[NSMutableArray addObject:](keypoints, "addObject:", v4);

}

- (unint64_t)keypointsCount
{
  return -[NSMutableArray count](self->_keypoints, "count");
}

- (id)keypointsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_keypoints, "objectAtIndex:", a3);
}

+ (Class)keypointsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)VCPProtoImageHumanPoseResult;
  -[VCPProtoImageHumanPoseResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoImageHumanPoseResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  VCPProtoBounds *bounds;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_confidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("confidence"));

  bounds = self->_bounds;
  if (bounds)
  {
    -[VCPProtoBounds dictionaryRepresentation](bounds, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("bounds"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_flags);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("flags"));

  if (-[NSMutableArray count](self->_keypoints, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_keypoints, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_keypoints;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("keypoints"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageHumanPoseResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_keypoints;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _DWORD *v8;

  v8 = a3;
  v8[4] = LODWORD(self->_confidence);
  objc_msgSend(v8, "setBounds:", self->_bounds);
  v8[5] = self->_flags;
  if (-[VCPProtoImageHumanPoseResult keypointsCount](self, "keypointsCount"))
  {
    objc_msgSend(v8, "clearKeypoints");
    v4 = -[VCPProtoImageHumanPoseResult keypointsCount](self, "keypointsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[VCPProtoImageHumanPoseResult keypointsAtIndex:](self, "keypointsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addKeypoints:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(float *)(v5 + 16) = self->_confidence;
  v6 = -[VCPProtoBounds copyWithZone:](self->_bounds, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_DWORD *)(v5 + 20) = self->_flags;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_keypoints;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v5, "addKeypoints:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoBounds *bounds;
  NSMutableArray *keypoints;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_confidence == *((float *)v4 + 4)
    && ((bounds = self->_bounds, !((unint64_t)bounds | v4[1])) || -[VCPProtoBounds isEqual:](bounds, "isEqual:"))
    && self->_flags == *((_DWORD *)v4 + 5))
  {
    keypoints = self->_keypoints;
    if ((unint64_t)keypoints | v4[3])
      v7 = -[NSMutableArray isEqual:](keypoints, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  float confidence;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  confidence = self->_confidence;
  v4 = -confidence;
  if (confidence >= 0.0)
    v4 = self->_confidence;
  v5 = floorf(v4 + 0.5);
  v6 = (float)(v4 - v5) * 1.8447e19;
  v7 = fmodf(v5, 1.8447e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  v12 = -[VCPProtoBounds hash](self->_bounds, "hash");
  v13 = v11 ^ (2654435761 * self->_flags);
  return v12 ^ -[NSMutableArray hash](self->_keypoints, "hash") ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoBounds *bounds;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_confidence = *((float *)v4 + 4);
  bounds = self->_bounds;
  v6 = *((_QWORD *)v4 + 1);
  if (bounds)
  {
    if (v6)
      -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
  }
  else if (v6)
  {
    -[VCPProtoImageHumanPoseResult setBounds:](self, "setBounds:");
  }
  self->_flags = *((_DWORD *)v4 + 5);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *((id *)v4 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[VCPProtoImageHumanPoseResult addKeypoints:](self, "addKeypoints:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
  objc_storeStrong((id *)&self->_bounds, a3);
}

- (int)flags
{
  return self->_flags;
}

- (void)setFlags:(int)a3
{
  self->_flags = a3;
}

- (NSMutableArray)keypoints
{
  return self->_keypoints;
}

- (void)setKeypoints:(id)a3
{
  objc_storeStrong((id *)&self->_keypoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keypoints, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  BOOL v9;
  uint64_t v11;
  VCPProtoImageHumanPoseResult *v12;
  void *v13;
  NSRect v15;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("flags"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("humanConfidence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("humanBounds"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (NSString *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9 || v4 == 0)
  {
    v12 = 0;
  }
  else
  {
    v11 = objc_msgSend(v4, "unsignedIntegerValue");
    v12 = objc_alloc_init(VCPProtoImageHumanPoseResult);
    objc_msgSend(v6, "floatValue");
    -[VCPProtoImageHumanPoseResult setConfidence:](v12, "setConfidence:");
    v15 = NSRectFromString(v8);
    +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPProtoImageHumanPoseResult setBounds:](v12, "setBounds:", v13);

    -[VCPProtoImageHumanPoseResult setFlags:](v12, "setFlags:", v11);
  }

  return v12;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];
  NSRect v15;

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("attributes");
  v11[0] = CFSTR("humanConfidence");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoImageHumanPoseResult confidence](self, "confidence");
  objc_msgSend(v3, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("humanBounds");
  -[VCPProtoImageHumanPoseResult bounds](self, "bounds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rectValue");
  NSStringFromRect(v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v13[1] = CFSTR("flags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoImageHumanPoseResult flags](self, "flags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
