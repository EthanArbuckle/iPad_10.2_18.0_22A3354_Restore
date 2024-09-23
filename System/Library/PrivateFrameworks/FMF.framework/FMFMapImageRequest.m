@implementation FMFMapImageRequest

- (FMFMapImageRequest)initWithLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 width:(double)a6 height:(double)a7 andCachingEnabled:(BOOL)a8
{
  return -[FMFMapImageRequest initWithLocation:isShifted:altitude:pitch:width:height:andCachingEnabled:](self, "initWithLocation:isShifted:altitude:pitch:width:height:andCachingEnabled:", a3, 0, a8, a4, a5, a6, a7);
}

- (FMFMapImageRequest)initWithLocation:(id)a3 isShifted:(BOOL)a4 altitude:(double)a5 pitch:(double)a6 width:(double)a7 height:(double)a8 andCachingEnabled:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v14;
  id v16;
  FMFMapImageRequest *v17;
  FMFMapImageRequest *v18;

  v9 = a9;
  v14 = a4;
  v16 = a3;
  v17 = -[FMFMapImageRequest init](self, "init");
  v18 = v17;
  if (v17)
  {
    -[FMFMapImageRequest setLocation:](v17, "setLocation:", v16);
    -[FMFMapImageRequest setIsShifted:](v18, "setIsShifted:", v14);
    -[FMFMapImageRequest setAltitude:](v18, "setAltitude:", a5);
    -[FMFMapImageRequest setPitch:](v18, "setPitch:", a6);
    -[FMFMapImageRequest setWidth:](v18, "setWidth:", a7);
    -[FMFMapImageRequest setHeight:](v18, "setHeight:", a8);
    -[FMFMapImageRequest setCachingEnabled:](v18, "setCachingEnabled:", v9);
    -[FMFMapImageRequest setRadius:](v18, "setRadius:", 0.0);
  }

  return v18;
}

- (FMFMapImageRequest)initWithLocation:(id)a3 radius:(double)a4 width:(double)a5 height:(double)a6 andCachingEnabled:(BOOL)a7
{
  return -[FMFMapImageRequest initWithLocation:isShifted:radius:width:height:andCachingEnabled:](self, "initWithLocation:isShifted:radius:width:height:andCachingEnabled:", a3, 0, a7, a4, a5, a6);
}

- (FMFMapImageRequest)initWithLocation:(id)a3 isShifted:(BOOL)a4 radius:(double)a5 width:(double)a6 height:(double)a7 andCachingEnabled:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v12;
  id v14;
  FMFMapImageRequest *v15;
  FMFMapImageRequest *v16;

  v8 = a8;
  v12 = a4;
  v14 = a3;
  v15 = -[FMFMapImageRequest init](self, "init");
  v16 = v15;
  if (v15)
  {
    -[FMFMapImageRequest setLocation:](v15, "setLocation:", v14);
    -[FMFMapImageRequest setIsShifted:](v16, "setIsShifted:", v12);
    -[FMFMapImageRequest setAltitude:](v16, "setAltitude:", 0.0);
    -[FMFMapImageRequest setPitch:](v16, "setPitch:", 0.0);
    -[FMFMapImageRequest setWidth:](v16, "setWidth:", a6);
    -[FMFMapImageRequest setHeight:](v16, "setHeight:", a7);
    -[FMFMapImageRequest setCachingEnabled:](v16, "setCachingEnabled:", v8);
    -[FMFMapImageRequest setRadius:](v16, "setRadius:", a5);
  }

  return v16;
}

- (FMFMapImageRequest)initWithCoder:(id)a3
{
  id v4;
  FMFMapImageRequest *v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v4 = a3;
  v5 = -[FMFMapImageRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
    v7 = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longtitude"));
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v7, v8);
    -[FMFMapImageRequest setLocation:](v5, "setLocation:", v9);

    -[FMFMapImageRequest setIsShifted:](v5, "setIsShifted:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isShifted")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("altitude"));
    -[FMFMapImageRequest setAltitude:](v5, "setAltitude:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pitch"));
    -[FMFMapImageRequest setPitch:](v5, "setPitch:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("width"));
    -[FMFMapImageRequest setWidth:](v5, "setWidth:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("height"));
    -[FMFMapImageRequest setHeight:](v5, "setHeight:");
    -[FMFMapImageRequest setCachingEnabled:](v5, "setCachingEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cachingEnabled")));
    -[FMFMapImageRequest setPriority:](v5, "setPriority:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priority")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("radius"));
    -[FMFMapImageRequest setRadius:](v5, "setRadius:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  id v7;

  v7 = a3;
  -[FMFMapImageRequest location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("latitude"));

  -[FMFMapImageRequest location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinate");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("longtitude"), v6);

  objc_msgSend(v7, "encodeBool:forKey:", -[FMFMapImageRequest isShifted](self, "isShifted"), CFSTR("isShifted"));
  -[FMFMapImageRequest altitude](self, "altitude");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("altitude"));
  -[FMFMapImageRequest pitch](self, "pitch");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("pitch"));
  -[FMFMapImageRequest width](self, "width");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("width"));
  -[FMFMapImageRequest height](self, "height");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("height"));
  objc_msgSend(v7, "encodeBool:forKey:", -[FMFMapImageRequest cachingEnabled](self, "cachingEnabled"), CFSTR("cachingEnabled"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[FMFMapImageRequest priority](self, "priority"), CFSTR("priority"));
  -[FMFMapImageRequest radius](self, "radius");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("radius"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)key
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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

  -[FMFMapImageRequest location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinate");
  v5 = round(v4 * 1000.0) / 1000.0;

  -[FMFMapImageRequest location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinate");
  v8 = round(v7 * 1000.0) / 1000.0;

  -[FMFMapImageRequest radius](self, "radius");
  v10 = round(v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[FMFMapImageRequest altitude](self, "altitude");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[FMFMapImageRequest pitch](self, "pitch");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[FMFMapImageRequest width](self, "width");
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[FMFMapImageRequest height](self, "height");
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringValue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("mapImage"), "stringByAppendingFormat:", CFSTR("%@%@%@%@%@%@%@"), v12, v14, v17, v20, v23, v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v29;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)isShifted
{
  return self->_isShifted;
}

- (void)setIsShifted:(BOOL)a3
{
  self->_isShifted = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (BOOL)cachingEnabled
{
  return self->_cachingEnabled;
}

- (void)setCachingEnabled:(BOOL)a3
{
  self->_cachingEnabled = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
