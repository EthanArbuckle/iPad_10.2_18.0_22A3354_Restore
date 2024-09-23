@implementation ARFrameContext

- (ARFrameContext)init
{
  ARFrameContext *v2;
  uint64_t v3;
  NSUUID *identifier;
  uint64_t v5;
  NSSet *collaborationData;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ARFrameContext;
  v2 = -[ARFrameContext init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    v5 = objc_opt_new();
    collaborationData = v2->_collaborationData;
    v2->_collaborationData = (NSSet *)v5;

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  ARFrameContext *v4;
  char v5;

  v4 = (ARFrameContext *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSUUID isEqual:](self->_identifier, "isEqual:", v4->_identifier);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARFrameContext)initWithCoder:(id)a3
{
  id v4;
  ARFrameContext *v5;
  void *v6;
  void *v7;
  NSUUID *v8;
  NSUUID *identifier;
  uint64_t v10;
  ARImageData *imageData;
  uint64_t v12;
  ARDeviceOrientationData *orientationData;
  uint64_t v14;
  ARLocationData *locationData;
  uint64_t v16;
  ARWorldMap *worldMap;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  NSMutableArray *anchorsToAdd;
  uint64_t v29;
  NSMutableArray *anchorsToRemove;
  uint64_t v31;
  NSMutableArray *anchorsToStopTracking;
  uint64_t v33;
  NSSet *collaborationData;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ARFrameContext;
  v5 = -[ARFrameContext init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (NSUUID *)objc_opt_new();
    identifier = v5->_identifier;
    v5->_identifier = v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("imageData"));
    v10 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (ARImageData *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("orientationData"));
    v12 = objc_claimAutoreleasedReturnValue();
    orientationData = v5->_orientationData;
    v5->_orientationData = (ARDeviceOrientationData *)v12;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("locationData"));
    v14 = objc_claimAutoreleasedReturnValue();
    locationData = v5->_locationData;
    v5->_locationData = (ARLocationData *)v14;

    v5->_worldAlignment = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("worldAlignment"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("worldMap"));
    v16 = objc_claimAutoreleasedReturnValue();
    worldMap = v5->_worldMap;
    v5->_worldMap = (ARWorldMap *)v16;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("frameDebugOptions"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_frameDebugOptions = objc_msgSend(v18, "unsignedIntegerValue");

    v5->_didRelocalize = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didRelocalize"));
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("relocalizationDeltaTransform"));
    *(_OWORD *)&v5[1].super.isa = v19;
    *(_OWORD *)&v5[1]._anchorsToAdd = v20;
    *(_OWORD *)&v5[1]._anchorsToStopTracking = v21;
    *(_OWORD *)&v5[1]._imageData = v22;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("sessionTransform"));
    *(_OWORD *)v5->_anon_70 = v23;
    *(_OWORD *)&v5->_anon_70[16] = v24;
    *(_OWORD *)&v5->_anon_70[32] = v25;
    *(_OWORD *)&v5->_anon_70[48] = v26;
    v5->_sessionTransformUpdated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sessionTransformUpdated"));
    v5->_sessionTransformReset = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sessionTransformReset"));
    v5->_sessionTransformShouldResumeCameraHeading = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sessionTransformShouldResumeCameraHeading"));
    v5->_sessionTransformShouldResumeCameraPosition = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sessionTransformShouldResumeCameraPosition"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("anchorsToAdd"));
    v27 = objc_claimAutoreleasedReturnValue();
    anchorsToAdd = v5->_anchorsToAdd;
    v5->_anchorsToAdd = (NSMutableArray *)v27;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("anchorsToRemove"));
    v29 = objc_claimAutoreleasedReturnValue();
    anchorsToRemove = v5->_anchorsToRemove;
    v5->_anchorsToRemove = (NSMutableArray *)v29;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("anchorsToStopTracking"));
    v31 = objc_claimAutoreleasedReturnValue();
    anchorsToStopTracking = v5->_anchorsToStopTracking;
    v5->_anchorsToStopTracking = (NSMutableArray *)v31;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("collaborationData"));
    v33 = objc_claimAutoreleasedReturnValue();
    collaborationData = v5->_collaborationData;
    v5->_collaborationData = (NSSet *)v33;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_imageData, CFSTR("imageData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_orientationData, CFSTR("orientationData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_locationData, CFSTR("locationData"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_worldAlignment, CFSTR("worldAlignment"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_worldMap, CFSTR("worldMap"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_frameDebugOptions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("frameDebugOptions"));

  objc_msgSend(v6, "encodeBool:forKey:", self->_didRelocalize, CFSTR("didRelocalize"));
  objc_msgSend(v6, "ar_encodeMatrix4x4:forKey:", CFSTR("relocalizationDeltaTransform"), *(double *)&self[1].super.isa, *(double *)&self[1]._anchorsToAdd, *(double *)&self[1]._anchorsToStopTracking, *(double *)&self[1]._imageData);
  objc_msgSend(v6, "ar_encodeMatrix4x4:forKey:", CFSTR("sessionTransform"), *(double *)self->_anon_70, *(double *)&self->_anon_70[16], *(double *)&self->_anon_70[32], *(double *)&self->_anon_70[48]);
  objc_msgSend(v6, "encodeBool:forKey:", self->_sessionTransformUpdated, CFSTR("sessionTransformUpdated"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_sessionTransformReset, CFSTR("sessionTransformReset"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_sessionTransformShouldResumeCameraHeading, CFSTR("sessionTransformShouldResumeCameraHeading"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_sessionTransformShouldResumeCameraPosition, CFSTR("sessionTransformShouldResumeCameraPosition"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_anchorsToAdd, CFSTR("anchorsToAdd"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_anchorsToRemove, CFSTR("anchorsToRemove"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_anchorsToStopTracking, CFSTR("anchorsToStopTracking"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_collaborationData, CFSTR("collaborationData"));

}

- (double)setSessionTransform:(__n128)a3
{
  double result;

  a1[7] = a2;
  a1[8] = a3;
  a1[9] = a4;
  a1[10] = a5;
  *(_QWORD *)&result = 0x100000001;
  a1[2].n128_u32[2] = 1;
  return result;
}

- (void)resetSessionTransform
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;

  v2 = MEMORY[0x1E0C83FF0];
  v3 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
  *(_OWORD *)self->_anon_70 = *MEMORY[0x1E0C83FF0];
  *(_OWORD *)&self->_anon_70[16] = v3;
  v4 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)&self->_anon_70[32] = *(_OWORD *)(v2 + 32);
  *(_OWORD *)&self->_anon_70[48] = v4;
  *(_DWORD *)&self->_sessionTransformUpdated = 257;
}

- (void)resumeSessionCameraPosition
{
  self->_sessionTransformShouldResumeCameraPosition = 1;
  self->_sessionTransformReset = 0;
}

- (void)resumeSessionCameraPositionAndHeading
{
  self->_sessionTransformShouldResumeCameraPosition = 1;
  *(_WORD *)&self->_sessionTransformReset = 256;
}

- (NSArray)anchorsToAdd
{
  return (NSArray *)self->_anchorsToAdd;
}

- (NSArray)anchorsToRemove
{
  return (NSArray *)self->_anchorsToRemove;
}

- (NSArray)anchorsToStopTracking
{
  return (NSArray *)self->_anchorsToStopTracking;
}

- (void)addAnchor:(id)a3
{
  id v4;
  NSMutableArray *anchorsToAdd;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  anchorsToAdd = self->_anchorsToAdd;
  v8 = v4;
  if (!anchorsToAdd)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_anchorsToAdd;
    self->_anchorsToAdd = v6;

    v4 = v8;
    anchorsToAdd = self->_anchorsToAdd;
  }
  -[NSMutableArray addObject:](anchorsToAdd, "addObject:", v4);

}

- (void)clearAddedAnchors
{
  -[NSMutableArray removeAllObjects](self->_anchorsToAdd, "removeAllObjects");
}

- (void)removeAnchor:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *anchorsToRemove;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!self->_anchorsToRemove)
  {
    v5 = (NSMutableArray *)objc_opt_new();
    anchorsToRemove = self->_anchorsToRemove;
    self->_anchorsToRemove = v5;

    v4 = v7;
  }
  -[NSMutableArray removeObject:](self->_anchorsToAdd, "removeObject:", v4);
  -[NSMutableArray addObject:](self->_anchorsToRemove, "addObject:", v7);

}

- (void)stopTrackingAnchors:(id)a3
{
  id v4;
  NSMutableArray *anchorsToStopTracking;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  anchorsToStopTracking = self->_anchorsToStopTracking;
  v8 = v4;
  if (!anchorsToStopTracking)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_anchorsToStopTracking;
    self->_anchorsToStopTracking = v6;

    v4 = v8;
    anchorsToStopTracking = self->_anchorsToStopTracking;
  }
  -[NSMutableArray addObjectsFromArray:](anchorsToStopTracking, "addObjectsFromArray:", v4);

}

- (void)setSessionTransformReset:(BOOL)a3
{
  self->_sessionTransformReset = a3;
}

- (void)setSessionTransformUpdated:(BOOL)a3
{
  self->_sessionTransformUpdated = a3;
}

- (void)setAnchorsToAdd:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *anchorsToAdd;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  anchorsToAdd = self->_anchorsToAdd;
  self->_anchorsToAdd = v4;

}

- (void)setAnchorsToRemove:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *anchorsToRemove;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  anchorsToRemove = self->_anchorsToRemove;
  self->_anchorsToRemove = v4;

}

- (void)setAnchorsToStopTracking:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *anchorsToStopTracking;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  anchorsToStopTracking = self->_anchorsToStopTracking;
  self->_anchorsToStopTracking = v4;

}

- (int64_t)cameraPosition
{
  void *v2;
  int64_t v3;

  -[ARFrameContext imageData](self, "imageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cameraPosition");

  return v3;
}

- (id)resultDataOfClass:(Class)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v8.receiver = self;
  v8.super_class = (Class)ARFrameContext;
  -[ARFrameContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("identifier: %@\n"), self->_identifier);
  -[ARFrameContext imageData](self, "imageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("imageData: %@\n"), v6);

  return (NSString *)v5;
}

- (ARImageData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (ARDeviceOrientationData)orientationData
{
  return self->_orientationData;
}

- (void)setOrientationData:(id)a3
{
  objc_storeStrong((id *)&self->_orientationData, a3);
}

- (ARLocationData)locationData
{
  return self->_locationData;
}

- (void)setLocationData:(id)a3
{
  objc_storeStrong((id *)&self->_locationData, a3);
}

- (int64_t)worldAlignment
{
  return self->_worldAlignment;
}

- (void)setWorldAlignment:(int64_t)a3
{
  self->_worldAlignment = a3;
}

- (ARWorldMap)worldMap
{
  return self->_worldMap;
}

- (void)setWorldMap:(id)a3
{
  objc_storeStrong((id *)&self->_worldMap, a3);
}

- (unint64_t)frameDebugOptions
{
  return self->_frameDebugOptions;
}

- (void)setFrameDebugOptions:(unint64_t)a3
{
  self->_frameDebugOptions = a3;
}

- (NSSet)collaborationData
{
  return self->_collaborationData;
}

- (void)setCollaborationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (__n128)sessionTransform
{
  return a1[7];
}

- (BOOL)sessionTransformUpdated
{
  return self->_sessionTransformUpdated;
}

- (BOOL)sessionTransformReset
{
  return self->_sessionTransformReset;
}

- (BOOL)sessionTransformShouldResumeCameraHeading
{
  return self->_sessionTransformShouldResumeCameraHeading;
}

- (BOOL)sessionTransformShouldResumeCameraPosition
{
  return self->_sessionTransformShouldResumeCameraPosition;
}

- (BOOL)didRelocalize
{
  return self->_didRelocalize;
}

- (void)setDidRelocalize:(BOOL)a3
{
  self->_didRelocalize = a3;
}

- (__n128)relocalizationDeltaTransform
{
  return a1[11];
}

- (__n128)setRelocalizationDeltaTransform:(__n128)a3
{
  result[11] = a2;
  result[12] = a3;
  result[13] = a4;
  result[14] = a5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationData, 0);
  objc_storeStrong((id *)&self->_worldMap, 0);
  objc_storeStrong((id *)&self->_locationData, 0);
  objc_storeStrong((id *)&self->_orientationData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_anchorsToStopTracking, 0);
  objc_storeStrong((id *)&self->_anchorsToRemove, 0);
  objc_storeStrong((id *)&self->_anchorsToAdd, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
