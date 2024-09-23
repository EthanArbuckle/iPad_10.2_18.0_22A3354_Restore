@implementation AXEventPathInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)representationWithPathInfo:(id *)a3
{
  AXEventPathInfoRepresentation *v4;
  double v5;
  double v6;

  v4 = objc_alloc_init(AXEventPathInfoRepresentation);
  -[AXEventPathInfoRepresentation setPathIndex:](v4, "setPathIndex:", a3->var0);
  -[AXEventPathInfoRepresentation setPathIdentity:](v4, "setPathIdentity:", a3->var1);
  -[AXEventPathInfoRepresentation setPathProximity:](v4, "setPathProximity:", a3->var2);
  *(float *)&v5 = a3->var3;
  -[AXEventPathInfoRepresentation setPathPressure:](v4, "setPathPressure:", v5);
  *(float *)&v6 = a3->var4;
  -[AXEventPathInfoRepresentation setPathMajorRadius:](v4, "setPathMajorRadius:", v6);
  -[AXEventPathInfoRepresentation setPathLocation:](v4, "setPathLocation:", a3->var5.x, a3->var5.y);
  -[AXEventPathInfoRepresentation setPathWindowContextID:](v4, "setPathWindowContextID:", a3->var6);
  -[AXEventPathInfoRepresentation setPathWindow:](v4, "setPathWindow:", a3->var7);
  return v4;
}

- (void)writeToPathInfo:(id *)a3
{
  float v5;
  float v6;
  CGFloat v7;
  CGFloat v8;

  a3->var0 = -[AXEventPathInfoRepresentation pathIndex](self, "pathIndex");
  a3->var1 = -[AXEventPathInfoRepresentation pathIdentity](self, "pathIdentity");
  a3->var2 = -[AXEventPathInfoRepresentation pathProximity](self, "pathProximity");
  -[AXEventPathInfoRepresentation pathPressure](self, "pathPressure");
  a3->var3 = v5;
  -[AXEventPathInfoRepresentation pathMajorRadius](self, "pathMajorRadius");
  a3->var4 = v6;
  -[AXEventPathInfoRepresentation pathLocation](self, "pathLocation");
  a3->var5.x = v7;
  a3->var5.y = v8;
  a3->var6 = -[AXEventPathInfoRepresentation pathWindowContextID](self, "pathWindowContextID");
  a3->var7 = -[AXEventPathInfoRepresentation pathWindow](self, "pathWindow");
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXEventPathInfoRepresentation *v4;

  v4 = objc_alloc_init(AXEventPathInfoRepresentation);
  -[AXEventPathInfoRepresentation setPathIdentity:](v4, "setPathIdentity:", -[AXEventPathInfoRepresentation pathIdentity](self, "pathIdentity"));
  -[AXEventPathInfoRepresentation setPathIndex:](v4, "setPathIndex:", -[AXEventPathInfoRepresentation pathIndex](self, "pathIndex"));
  -[AXEventPathInfoRepresentation setPathProximity:](v4, "setPathProximity:", -[AXEventPathInfoRepresentation pathProximity](self, "pathProximity"));
  -[AXEventPathInfoRepresentation pathPressure](self, "pathPressure");
  -[AXEventPathInfoRepresentation setPathPressure:](v4, "setPathPressure:");
  -[AXEventPathInfoRepresentation pathMajorRadius](self, "pathMajorRadius");
  -[AXEventPathInfoRepresentation setPathMajorRadius:](v4, "setPathMajorRadius:");
  -[AXEventPathInfoRepresentation pathMajorRadiusTolerance](self, "pathMajorRadiusTolerance");
  -[AXEventPathInfoRepresentation setPathMajorRadiusTolerance:](v4, "setPathMajorRadiusTolerance:");
  -[AXEventPathInfoRepresentation pathLocation](self, "pathLocation");
  -[AXEventPathInfoRepresentation setPathLocation:](v4, "setPathLocation:");
  -[AXEventPathInfoRepresentation pathZValue](self, "pathZValue");
  -[AXEventPathInfoRepresentation setPathZValue:](v4, "setPathZValue:");
  -[AXEventPathInfoRepresentation setPathWindow:](v4, "setPathWindow:", -[AXEventPathInfoRepresentation pathWindow](self, "pathWindow"));
  -[AXEventPathInfoRepresentation setPathWindowContextID:](v4, "setPathWindowContextID:", -[AXEventPathInfoRepresentation pathWindowContextID](self, "pathWindowContextID"));
  -[AXEventPathInfoRepresentation pathTwist](self, "pathTwist");
  -[AXEventPathInfoRepresentation setPathTwist:](v4, "setPathTwist:");
  -[AXEventPathInfoRepresentation pathMinorRadius](self, "pathMinorRadius");
  -[AXEventPathInfoRepresentation setPathMinorRadius:](v4, "setPathMinorRadius:");
  -[AXEventPathInfoRepresentation pathQuality](self, "pathQuality");
  -[AXEventPathInfoRepresentation setPathQuality:](v4, "setPathQuality:");
  -[AXEventPathInfoRepresentation pathDensity](self, "pathDensity");
  -[AXEventPathInfoRepresentation setPathDensity:](v4, "setPathDensity:");
  -[AXEventPathInfoRepresentation setPathEventMask:](v4, "setPathEventMask:", -[AXEventPathInfoRepresentation pathEventMask](self, "pathEventMask"));
  -[AXEventPathInfoRepresentation orbValue](self, "orbValue");
  -[AXEventPathInfoRepresentation setOrbValue:](v4, "setOrbValue:");
  -[AXEventPathInfoRepresentation setTransducerType:](v4, "setTransducerType:", -[AXEventPathInfoRepresentation transducerType](self, "transducerType"));
  -[AXEventPathInfoRepresentation altitude](self, "altitude");
  -[AXEventPathInfoRepresentation setAltitude:](v4, "setAltitude:");
  -[AXEventPathInfoRepresentation azimuth](self, "azimuth");
  -[AXEventPathInfoRepresentation setAzimuth:](v4, "setAzimuth:");
  -[AXEventPathInfoRepresentation barrelPressure](self, "barrelPressure");
  -[AXEventPathInfoRepresentation setBarrelPressure:](v4, "setBarrelPressure:");
  -[AXEventPathInfoRepresentation setWillUpdateMask:](v4, "setWillUpdateMask:", -[AXEventPathInfoRepresentation willUpdateMask](self, "willUpdateMask"));
  -[AXEventPathInfoRepresentation setDidUpdateMask:](v4, "setDidUpdateMask:", -[AXEventPathInfoRepresentation didUpdateMask](self, "didUpdateMask"));
  return v4;
}

- (AXEventPathInfoRepresentation)initWithCoder:(id)a3
{
  id v4;
  AXEventPathInfoRepresentation *v5;
  float v6;
  float v7;
  float v8;
  id v9;
  const char *v10;
  id v11;
  const char *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AXEventPathInfoRepresentation;
  v5 = -[AXEventPathInfoRepresentation init](&v22, sel_init);
  if (v5)
  {
    v5->_pathIndex = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pathIndex"));
    v5->_pathIdentity = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pathIdentity"));
    v5->_pathProximity = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pathProximity"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("pathPressure"));
    v5->_pathPressure = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("pathMajorRadius"));
    v5->_pathMajorRadius = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("pathMajorRadiusTolerance"));
    v5->_pathMajorRadiusTolerance = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pathLocation"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "objCType");
    if (v10 && !strcmp(v10, "{CGPoint=dd}"))
      objc_msgSend(v9, "getValue:size:", &v5->_pathLocation, 16);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pathZValue"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "objCType");
    if (v12 && !strcmp(v12, "d"))
      objc_msgSend(v11, "getValue:size:", &v5->_pathZValue, 8);
    v5->_pathWindowContextID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pathWindowContextID"));
    v5->_pathWindow = (void *)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("pathWindow"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("pathTwist"));
    v5->_pathTwist = v13;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("pathMinorRadius"));
    v5->_pathMinorRadius = v14;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("pathQuality"));
    v5->_pathQuality = v15;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("pathDensity"));
    v5->_pathDensity = v16;
    v5->_pathEventMask = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pathEventMask"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("orbValue"));
    v5->_orbValue = v17;
    v5->_transducerType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transducerType"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("altitude"));
    v5->_altitude = v18;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("azimuth"));
    v5->_azimuth = v19;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("barrelPressure"));
    v5->_barrelPressure = v20;
    v5->_willUpdateMask = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("willUpdateMask"));
    v5->_didUpdateMask = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("didUpdateMask"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t pathIndex;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  pathIndex = self->_pathIndex;
  v18 = a3;
  objc_msgSend(v18, "encodeInt32:forKey:", pathIndex, CFSTR("pathIndex"));
  objc_msgSend(v18, "encodeInt32:forKey:", self->_pathIdentity, CFSTR("pathIdentity"));
  objc_msgSend(v18, "encodeInt32:forKey:", self->_pathProximity, CFSTR("pathProximity"));
  *(float *)&v5 = self->_pathPressure;
  objc_msgSend(v18, "encodeFloat:forKey:", CFSTR("pathPressure"), v5);
  *(float *)&v6 = self->_pathMajorRadius;
  objc_msgSend(v18, "encodeFloat:forKey:", CFSTR("pathMajorRadius"), v6);
  *(float *)&v7 = self->_pathMajorRadiusTolerance;
  objc_msgSend(v18, "encodeFloat:forKey:", CFSTR("pathMajorRadiusTolerance"), v7);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_pathLocation, "{CGPoint=dd}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v8, CFSTR("pathLocation"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_pathZValue, "d");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("pathZValue"));

  objc_msgSend(v18, "encodeInt32:forKey:", self->_pathWindowContextID, CFSTR("pathWindowContextID"));
  objc_msgSend(v18, "encodeInt64:forKey:", self->_pathWindow, CFSTR("pathWindow"));
  *(float *)&v10 = self->_pathTwist;
  objc_msgSend(v18, "encodeFloat:forKey:", CFSTR("pathTwist"), v10);
  *(float *)&v11 = self->_pathMinorRadius;
  objc_msgSend(v18, "encodeFloat:forKey:", CFSTR("pathMinorRadius"), v11);
  *(float *)&v12 = self->_pathQuality;
  objc_msgSend(v18, "encodeFloat:forKey:", CFSTR("pathQuality"), v12);
  *(float *)&v13 = self->_pathDensity;
  objc_msgSend(v18, "encodeFloat:forKey:", CFSTR("pathDensity"), v13);
  objc_msgSend(v18, "encodeInt32:forKey:", self->_pathEventMask, CFSTR("pathEventMask"));
  *(float *)&v14 = self->_orbValue;
  objc_msgSend(v18, "encodeFloat:forKey:", CFSTR("orbValue"), v14);
  objc_msgSend(v18, "encodeInteger:forKey:", self->_transducerType, CFSTR("transducerType"));
  *(float *)&v15 = self->_altitude;
  objc_msgSend(v18, "encodeFloat:forKey:", CFSTR("altitude"), v15);
  *(float *)&v16 = self->_azimuth;
  objc_msgSend(v18, "encodeFloat:forKey:", CFSTR("azimuth"), v16);
  *(float *)&v17 = self->_barrelPressure;
  objc_msgSend(v18, "encodeFloat:forKey:", CFSTR("barrelPressure"), v17);
  objc_msgSend(v18, "encodeInt32:forKey:", self->_willUpdateMask, CFSTR("willUpdateMask"));
  objc_msgSend(v18, "encodeInt32:forKey:", self->_didUpdateMask, CFSTR("didUpdateMask"));

}

- (id)accessibilityEventRepresentationTabularDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("      Path Index:        %i\n      Identity:          %i\n      Proximity:         %i\n      Pressure:          %f\n      Major Radius:      %f\n      Location:          x: %f y: %f z: %f\n      Window Context ID: %u\n      Window:            %p\n"), self->_pathIndex, self->_pathIdentity, self->_pathProximity, self->_pathPressure, self->_pathMajorRadius, *(_QWORD *)&self->_pathLocation.x, *(_QWORD *)&self->_pathLocation.y, *(_QWORD *)&self->_pathZValue, self->_pathWindowContextID, self->_pathWindow);
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXEventPathInfoRepresentation;
  -[AXEventPathInfoRepresentation description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - pathIndex %i, pathIdentity %i, pathProximity %i, pathPressure %f, pathMajorRadius %f, pathLocation.x %f, pathLocation.y %f, pathLocation.z %f, pathWindowContextID %u, pathWindow %p"), self->_pathIndex, self->_pathIdentity, self->_pathProximity, self->_pathPressure, self->_pathMajorRadius, *(_QWORD *)&self->_pathLocation.x, *(_QWORD *)&self->_pathLocation.y, *(_QWORD *)&self->_pathZValue, self->_pathWindowContextID, self->_pathWindow);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unsigned)pathIndex
{
  return self->_pathIndex;
}

- (void)setPathIndex:(unsigned __int8)a3
{
  self->_pathIndex = a3;
}

- (unsigned)pathIdentity
{
  return self->_pathIdentity;
}

- (void)setPathIdentity:(unsigned __int8)a3
{
  self->_pathIdentity = a3;
}

- (CGPoint)pathLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_pathLocation.x;
  y = self->_pathLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPathLocation:(CGPoint)a3
{
  self->_pathLocation = a3;
}

- (double)pathZValue
{
  return self->_pathZValue;
}

- (void)setPathZValue:(double)a3
{
  self->_pathZValue = a3;
}

- (unsigned)pathWindowContextID
{
  return self->_pathWindowContextID;
}

- (void)setPathWindowContextID:(unsigned int)a3
{
  self->_pathWindowContextID = a3;
}

- (unsigned)pathProximity
{
  return self->_pathProximity;
}

- (void)setPathProximity:(unsigned __int8)a3
{
  self->_pathProximity = a3;
}

- (float)pathPressure
{
  return self->_pathPressure;
}

- (void)setPathPressure:(float)a3
{
  self->_pathPressure = a3;
}

- (float)pathMajorRadius
{
  return self->_pathMajorRadius;
}

- (void)setPathMajorRadius:(float)a3
{
  self->_pathMajorRadius = a3;
}

- (float)pathMinorRadius
{
  return self->_pathMinorRadius;
}

- (void)setPathMinorRadius:(float)a3
{
  self->_pathMinorRadius = a3;
}

- (float)pathMajorRadiusTolerance
{
  return self->_pathMajorRadiusTolerance;
}

- (void)setPathMajorRadiusTolerance:(float)a3
{
  self->_pathMajorRadiusTolerance = a3;
}

- (float)pathTwist
{
  return self->_pathTwist;
}

- (void)setPathTwist:(float)a3
{
  self->_pathTwist = a3;
}

- (float)pathQuality
{
  return self->_pathQuality;
}

- (void)setPathQuality:(float)a3
{
  self->_pathQuality = a3;
}

- (float)pathDensity
{
  return self->_pathDensity;
}

- (void)setPathDensity:(float)a3
{
  self->_pathDensity = a3;
}

- (unsigned)pathEventMask
{
  return self->_pathEventMask;
}

- (void)setPathEventMask:(unsigned int)a3
{
  self->_pathEventMask = a3;
}

- (float)orbValue
{
  return self->_orbValue;
}

- (void)setOrbValue:(float)a3
{
  self->_orbValue = a3;
}

- (unsigned)transducerType
{
  return self->_transducerType;
}

- (void)setTransducerType:(unsigned int)a3
{
  self->_transducerType = a3;
}

- (float)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(float)a3
{
  self->_altitude = a3;
}

- (float)azimuth
{
  return self->_azimuth;
}

- (void)setAzimuth:(float)a3
{
  self->_azimuth = a3;
}

- (float)barrelPressure
{
  return self->_barrelPressure;
}

- (void)setBarrelPressure:(float)a3
{
  self->_barrelPressure = a3;
}

- (unsigned)willUpdateMask
{
  return self->_willUpdateMask;
}

- (void)setWillUpdateMask:(unsigned int)a3
{
  self->_willUpdateMask = a3;
}

- (unsigned)didUpdateMask
{
  return self->_didUpdateMask;
}

- (void)setDidUpdateMask:(unsigned int)a3
{
  self->_didUpdateMask = a3;
}

- (BOOL)shouldSetTouchFlag
{
  return self->_shouldSetTouchFlag;
}

- (void)setShouldSetTouchFlag:(BOOL)a3
{
  self->_shouldSetTouchFlag = a3;
}

- (void)pathWindow
{
  return self->_pathWindow;
}

- (void)setPathWindow:(void *)a3
{
  self->_pathWindow = a3;
}

@end
