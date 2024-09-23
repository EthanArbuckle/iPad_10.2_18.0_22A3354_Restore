@implementation BWPhotoManifest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWPhotoManifest)initWithDescriptors:(id)a3 captureRequestIdentifier:(id)a4
{
  BWPhotoManifest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWPhotoManifest;
  v6 = -[BWPhotoManifest init](&v8, sel_init);
  if (v6)
  {
    v6->_photoDescriptors = (NSArray *)objc_msgSend(a3, "copy");
    v6->_captureRequestIdentifier = (NSString *)objc_msgSend(a4, "copy");
    v6->_bufferPtrValueToPhotoDescriptorLock._os_unfair_lock_opaque = 0;
    v6->_bufferPtrValueToPhotoDescriptor = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPhotoManifest;
  -[BWPhotoManifest dealloc](&v3, sel_dealloc);
}

- (BWPhotoManifest)initWithCoder:(id)a3
{
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  return -[BWPhotoManifest initWithDescriptors:captureRequestIdentifier:](self, "initWithDescriptors:captureRequestIdentifier:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2)), CFSTR("photoDescriptors")), objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captureRequestIdentifier")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_photoDescriptors, CFSTR("photoDescriptors"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_captureRequestIdentifier, CFSTR("captureRequestIdentifier"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v11;
  int v12;
  NSString *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v15 = v5;
    v16 = v4;
    v17 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[BWPhotoManifest photoDescriptors](self, "photoDescriptors");
      if (v11 == (NSArray *)objc_msgSend(a3, "photoDescriptors")
        || (v12 = -[NSArray isEqual:](-[BWPhotoManifest photoDescriptors](self, "photoDescriptors"), "isEqual:", objc_msgSend(a3, "photoDescriptors"))) != 0)
      {
        v13 = -[BWPhotoManifest captureRequestIdentifier](self, "captureRequestIdentifier", v6, v15, v16, v17, v7, v8);
        if (v13 == (NSString *)objc_msgSend(a3, "captureRequestIdentifier")
          || (v12 = -[NSString isEqual:](-[BWPhotoManifest captureRequestIdentifier](self, "captureRequestIdentifier"), "isEqual:", objc_msgSend(a3, "captureRequestIdentifier"))) != 0)
        {
          LOBYTE(v12) = 1;
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_captureRequestIdentifier, "hash");
}

- (id)descriptorForIdentifier:(id)a3
{
  NSArray *photoDescriptors;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  photoDescriptors = self->_photoDescriptors;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](photoDescriptors, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(photoDescriptors);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "photoIdentifier"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](photoDescriptors, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)descriptorForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  os_unfair_lock_s *p_bufferPtrValueToPhotoDescriptorLock;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSArray *photoDescriptors;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  p_bufferPtrValueToPhotoDescriptorLock = &self->_bufferPtrValueToPhotoDescriptorLock;
  os_unfair_lock_lock(&self->_bufferPtrValueToPhotoDescriptorLock);
  v6 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_bufferPtrValueToPhotoDescriptor, "objectForKeyedSubscript:", v6);
  if (-[NSArray count](self->_photoDescriptors, "count") == 1)
  {
    v7 = -[NSArray objectAtIndexedSubscript:](self->_photoDescriptors, "objectAtIndexedSubscript:", 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bufferPtrValueToPhotoDescriptor, "setObject:forKeyedSubscript:", v7, v6);
  }
  else if (!v7)
  {
    v8 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
    v9 = (void *)-[NSArray mutableCopy](self->_photoDescriptors, "mutableCopy");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
LABEL_6:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v7 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * v13);
        if ((v8 & ~objc_msgSend(v7, "processingFlags")) == 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          if (v11)
            goto LABEL_6;
          goto LABEL_14;
        }
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bufferPtrValueToPhotoDescriptor, "setObject:forKeyedSubscript:", v7, v6);
      if (v7)
        goto LABEL_25;
    }
LABEL_14:
    v14 = (void *)-[NSMutableDictionary allValues](self->_bufferPtrValueToPhotoDescriptor, "allValues");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    photoDescriptors = self->_photoDescriptors;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](photoDescriptors, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(photoDescriptors);
          v7 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v14, "containsObject:", v7) & 1) == 0)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bufferPtrValueToPhotoDescriptor, "setObject:forKeyedSubscript:", v7, v6);
            goto LABEL_25;
          }
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](photoDescriptors, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        v7 = 0;
        if (v17)
          continue;
        break;
      }
    }
    else
    {
      v7 = 0;
    }
LABEL_25:

  }
  os_unfair_lock_unlock(p_bufferPtrValueToPhotoDescriptorLock);
  return v7;
}

- (void)cannotProcessDepthPhotos
{
  NSArray *photoDescriptors;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  BWPhotoDescriptor *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BWPhotoDescriptor *v13;
  id v15;
  _QWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  photoDescriptors = self->_photoDescriptors;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](photoDescriptors, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(photoDescriptors);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v7, "processingFlags") & 0x40) == 0)
        {
          LODWORD(v8) = objc_msgSend(v7, "processingFlags");
          if ((objc_msgSend(v7, "processingFlags") & 0x20) != 0)
            LODWORD(v8) = v8 & 0xFFFFFFDF;
          if ((objc_msgSend(v7, "processingFlags") & 0x10) != 0)
            v8 = v8 & 0xFFFFFFEF;
          else
            v8 = v8;
          v9 = [BWPhotoDescriptor alloc];
          v10 = objc_msgSend(v7, "photoIdentifier");
          v11 = objc_msgSend(v7, "time");
          v12 = objc_msgSend(v7, "timeZone");
          if (v7)
            objc_msgSend(v7, "presentationTimeStamp");
          else
            memset(v16, 0, sizeof(v16));
          v13 = -[BWPhotoDescriptor initWithPhotoIdentifier:processingFlags:time:timeZone:presentationTimeStamp:](v9, "initWithPhotoIdentifier:processingFlags:time:timeZone:presentationTimeStamp:", v10, v8, v11, v12, v16);
          objc_msgSend(v15, "addObject:", v13);

        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](photoDescriptors, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  self->_photoDescriptors = (NSArray *)objc_msgSend(v15, "copy");
}

- (id)description
{
  void *v3;
  NSArray *photoDescriptors;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p>:\n"), objc_opt_class(), self);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  photoDescriptors = self->_photoDescriptors;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](photoDescriptors, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(photoDescriptors);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](photoDescriptors, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (NSArray)photoDescriptors
{
  return self->_photoDescriptors;
}

- (NSString)captureRequestIdentifier
{
  return self->_captureRequestIdentifier;
}

@end
