@implementation CXScreenShareAttributes

- (id)customDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXScreenShareAttributes frameRate](self, "frameRate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" frameRate=%@"), v4);

  -[CXScreenShareAttributes displayID](self, "displayID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" displayID=%@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(" windowed=%d"), -[CXScreenShareAttributes isWindowed](self, "isWindowed"));
  -[CXScreenShareAttributes windowUUID](self, "windowUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" windowUUID=a%@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(" deviceFamily=%ld"), -[CXScreenShareAttributes deviceFamily](self, "deviceFamily"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" deviceHomeButtonType=%ld"), -[CXScreenShareAttributes deviceHomeButtonType](self, "deviceHomeButtonType"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" style=%ld"), -[CXScreenShareAttributes style](self, "style"));
  -[CXScreenShareAttributes displayScale](self, "displayScale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" displayScale=%@"), v7);

  -[CXScreenShareAttributes cornerRadius](self, "cornerRadius");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" cornerRadius=%@"), v8);

  -[CXScreenShareAttributes scaleFactor](self, "scaleFactor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" scaleFactor=%@"), v9);

  -[CXScreenShareAttributes originalResolution](self, "originalResolution");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" originalResolution=%@"), v10);

  -[CXScreenShareAttributes systemRootLayerScale](self, "systemRootLayerScale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" systemRootLayerScale=%@"), v11);

  -[CXScreenShareAttributes systemRootLayerTransform](self, "systemRootLayerTransform");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" systemRootLayerTransform=%@"), v12);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CXScreenShareAttributes displayID](self, "displayID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayID:", v5);

  -[CXScreenShareAttributes frameRate](self, "frameRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrameRate:", v6);

  objc_msgSend(v4, "setWindowed:", -[CXScreenShareAttributes isWindowed](self, "isWindowed"));
  -[CXScreenShareAttributes windowUUID](self, "windowUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWindowUUID:", v7);

  objc_msgSend(v4, "setDeviceFamily:", -[CXScreenShareAttributes deviceFamily](self, "deviceFamily"));
  objc_msgSend(v4, "setDeviceHomeButtonType:", -[CXScreenShareAttributes deviceHomeButtonType](self, "deviceHomeButtonType"));
  objc_msgSend(v4, "setStyle:", -[CXScreenShareAttributes style](self, "style"));
  -[CXScreenShareAttributes displayScale](self, "displayScale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayScale:", v8);

  -[CXScreenShareAttributes cornerRadius](self, "cornerRadius");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v9);

  -[CXScreenShareAttributes scaleFactor](self, "scaleFactor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScaleFactor:", v10);

  -[CXScreenShareAttributes originalResolution](self, "originalResolution");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOriginalResolution:", v11);

  -[CXScreenShareAttributes systemRootLayerScale](self, "systemRootLayerScale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSystemRootLayerScale:", v12);

  -[CXScreenShareAttributes systemRootLayerTransform](self, "systemRootLayerTransform");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSystemRootLayerTransform:", v13);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXScreenShareAttributes)initWithCoder:(id)a3
{
  id v4;
  CXScreenShareAttributes *v5;
  void *v6;
  uint64_t v7;
  NSNumber *frameRate;
  void *v9;
  uint64_t v10;
  NSNumber *displayID;
  void *v12;
  void *v13;
  uint64_t v14;
  NSUUID *windowUUID;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSNumber *displayScale;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSNumber *cornerRadius;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSNumber *scaleFactor;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSValue *originalResolution;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSNumber *systemRootLayerScale;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSValue *systemRootLayerTransform;

  v4 = a3;
  v5 = -[CXScreenShareAttributes init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_frameRate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    frameRate = v5->_frameRate;
    v5->_frameRate = (NSNumber *)v7;

    NSStringFromSelector(sel_displayID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    displayID = v5->_displayID;
    v5->_displayID = (NSNumber *)v10;

    NSStringFromSelector(sel_isWindowed);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_windowed = objc_msgSend(v4, "decodeBoolForKey:", v12);

    NSStringFromSelector(sel_windowUUID);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    windowUUID = v5->_windowUUID;
    v5->_windowUUID = (NSUUID *)v14;

    NSStringFromSelector(sel_deviceFamily);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceFamily = objc_msgSend(v4, "decodeIntegerForKey:", v16);

    NSStringFromSelector(sel_deviceHomeButtonType);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceHomeButtonType = objc_msgSend(v4, "decodeIntegerForKey:", v17);

    NSStringFromSelector(sel_style);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", v18);

    v19 = objc_opt_class();
    NSStringFromSelector(sel_displayScale);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    displayScale = v5->_displayScale;
    v5->_displayScale = (NSNumber *)v21;

    v23 = objc_opt_class();
    NSStringFromSelector(sel_cornerRadius);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    cornerRadius = v5->_cornerRadius;
    v5->_cornerRadius = (NSNumber *)v25;

    v27 = objc_opt_class();
    NSStringFromSelector(sel_scaleFactor);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    scaleFactor = v5->_scaleFactor;
    v5->_scaleFactor = (NSNumber *)v29;

    v31 = objc_opt_class();
    NSStringFromSelector(sel_originalResolution);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    originalResolution = v5->_originalResolution;
    v5->_originalResolution = (NSValue *)v33;

    v35 = objc_opt_class();
    NSStringFromSelector(sel_systemRootLayerScale);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    systemRootLayerScale = v5->_systemRootLayerScale;
    v5->_systemRootLayerScale = (NSNumber *)v37;

    v39 = objc_opt_class();
    NSStringFromSelector(sel_systemRootLayerTransform);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v39, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    systemRootLayerTransform = v5->_systemRootLayerTransform;
    v5->_systemRootLayerTransform = (NSValue *)v41;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v4 = a3;
  -[CXScreenShareAttributes frameRate](self, "frameRate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_frameRate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXScreenShareAttributes displayID](self, "displayID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_displayID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[CXScreenShareAttributes isWindowed](self, "isWindowed");
  NSStringFromSelector(sel_isWindowed);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

  -[CXScreenShareAttributes windowUUID](self, "windowUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_windowUUID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[CXScreenShareAttributes deviceFamily](self, "deviceFamily");
  NSStringFromSelector(sel_deviceFamily);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v13, v14);

  v15 = -[CXScreenShareAttributes deviceHomeButtonType](self, "deviceHomeButtonType");
  NSStringFromSelector(sel_deviceHomeButtonType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v15, v16);

  v17 = -[CXScreenShareAttributes style](self, "style");
  NSStringFromSelector(sel_style);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v17, v18);

  -[CXScreenShareAttributes displayScale](self, "displayScale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_displayScale);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v20);

  -[CXScreenShareAttributes cornerRadius](self, "cornerRadius");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_cornerRadius);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, v22);

  -[CXScreenShareAttributes scaleFactor](self, "scaleFactor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_scaleFactor);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, v24);

  -[CXScreenShareAttributes originalResolution](self, "originalResolution");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_originalResolution);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v26);

  -[CXScreenShareAttributes systemRootLayerScale](self, "systemRootLayerScale");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_systemRootLayerScale);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, v28);

  -[CXScreenShareAttributes systemRootLayerTransform](self, "systemRootLayerTransform");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_systemRootLayerTransform);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, v29);

}

- (NSNumber)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(id)a3
{
  objc_storeStrong((id *)&self->_frameRate, a3);
}

- (NSNumber)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
  objc_storeStrong((id *)&self->_displayID, a3);
}

- (BOOL)isWindowed
{
  return self->_windowed;
}

- (void)setWindowed:(BOOL)a3
{
  self->_windowed = a3;
}

- (NSUUID)windowUUID
{
  return self->_windowUUID;
}

- (void)setWindowUUID:(id)a3
{
  objc_storeStrong((id *)&self->_windowUUID, a3);
}

- (int64_t)deviceFamily
{
  return self->_deviceFamily;
}

- (void)setDeviceFamily:(int64_t)a3
{
  self->_deviceFamily = a3;
}

- (int64_t)deviceHomeButtonType
{
  return self->_deviceHomeButtonType;
}

- (void)setDeviceHomeButtonType:(int64_t)a3
{
  self->_deviceHomeButtonType = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSNumber)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(id)a3
{
  objc_storeStrong((id *)&self->_displayScale, a3);
}

- (NSNumber)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(id)a3
{
  objc_storeStrong((id *)&self->_cornerRadius, a3);
}

- (NSNumber)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(id)a3
{
  objc_storeStrong((id *)&self->_scaleFactor, a3);
}

- (NSNumber)systemRootLayerScale
{
  return self->_systemRootLayerScale;
}

- (void)setSystemRootLayerScale:(id)a3
{
  objc_storeStrong((id *)&self->_systemRootLayerScale, a3);
}

- (NSValue)systemRootLayerTransform
{
  return self->_systemRootLayerTransform;
}

- (void)setSystemRootLayerTransform:(id)a3
{
  objc_storeStrong((id *)&self->_systemRootLayerTransform, a3);
}

- (NSValue)originalResolution
{
  return self->_originalResolution;
}

- (void)setOriginalResolution:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalResolution, 0);
  objc_storeStrong((id *)&self->_systemRootLayerTransform, 0);
  objc_storeStrong((id *)&self->_systemRootLayerScale, 0);
  objc_storeStrong((id *)&self->_scaleFactor, 0);
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_displayScale, 0);
  objc_storeStrong((id *)&self->_windowUUID, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_frameRate, 0);
}

@end
