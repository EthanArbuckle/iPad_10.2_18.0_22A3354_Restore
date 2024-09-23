@implementation BWStillImageProcessingSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWStillImageProcessingSettings)initWithPhotoManifest:(id)a3 processIntelligentDistortionCorrection:(BOOL)a4
{
  BWStillImageProcessingSettings *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)BWStillImageProcessingSettings;
  v6 = -[BWStillImageProcessingSettings init](&v18, sel_init);
  if (v6)
  {
    v6->_photoManifest = (BWPhotoManifest *)a3;
    v6->_processIntelligentDistortionCorrection = a4;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = (void *)objc_msgSend(a3, "photoDescriptors", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "processingFlags");
        v6->_provideDemosaicedRaw = BYTE2(v12) & 1;
        if ((v12 & 0x10000) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v9)
            goto LABEL_4;
          return v6;
        }
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessingSettings;
  -[BWStillImageProcessingSettings dealloc](&v3, sel_dealloc);
}

- (BWStillImageProcessingSettings)initWithCoder:(id)a3
{
  return -[BWStillImageProcessingSettings initWithPhotoManifest:processIntelligentDistortionCorrection:](self, "initWithPhotoManifest:processIntelligentDistortionCorrection:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoManifest")), objc_msgSend(a3, "decodeBoolForKey:", CFSTR("processIntelligentDistortionCorrection")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_photoManifest, CFSTR("photoManifest"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_processIntelligentDistortionCorrection, CFSTR("processIntelligentDistortionCorrection"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BWPhotoManifest *v11;
  int v12;
  int v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v16 = v5;
    v17 = v4;
    v18 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_6:
      LOBYTE(v12) = 0;
      return v12;
    }
    v11 = -[BWStillImageProcessingSettings photoManifest](self, "photoManifest");
    if (v11 == (BWPhotoManifest *)objc_msgSend(a3, "photoManifest")
      || (v12 = -[BWPhotoManifest isEqual:](-[BWStillImageProcessingSettings photoManifest](self, "photoManifest"), "isEqual:", objc_msgSend(a3, "photoManifest"))) != 0)
    {
      v13 = -[BWStillImageProcessingSettings processIntelligentDistortionCorrection](self, "processIntelligentDistortionCorrection", v6, v16, v17, v18, v7, v8);
      if (v13 != objc_msgSend(a3, "processIntelligentDistortionCorrection"))
        goto LABEL_6;
      v14 = -[BWStillImageProcessingSettings provideDemosaicedRaw](self, "provideDemosaicedRaw");
      LOBYTE(v12) = v14 ^ objc_msgSend(a3, "provideDemosaicedRaw") ^ 1;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  return -[BWPhotoManifest hash](self->_photoManifest, "hash") ^ self->_processIntelligentDistortionCorrection ^ (unint64_t)self->_provideDemosaicedRaw;
}

- (int)expectedClientImageCount
{
  return -[NSArray count](-[BWPhotoManifest photoDescriptors](self->_photoManifest, "photoDescriptors"), "count");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: idc: %d, demRaw: %d, clientImageCount: %d, manifest: %@"), objc_opt_class(), self, -[BWStillImageProcessingSettings processIntelligentDistortionCorrection](self, "processIntelligentDistortionCorrection"), -[BWStillImageProcessingSettings provideDemosaicedRaw](self, "provideDemosaicedRaw"), -[BWStillImageProcessingSettings expectedClientImageCount](self, "expectedClientImageCount"), -[BWStillImageProcessingSettings photoManifest](self, "photoManifest"));
}

- (BWPhotoManifest)photoManifest
{
  return self->_photoManifest;
}

- (BOOL)processIntelligentDistortionCorrection
{
  return self->_processIntelligentDistortionCorrection;
}

- (BOOL)provideDemosaicedRaw
{
  return self->_provideDemosaicedRaw;
}

@end
