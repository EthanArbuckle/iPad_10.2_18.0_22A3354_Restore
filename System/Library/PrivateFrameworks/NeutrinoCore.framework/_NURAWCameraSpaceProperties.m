@implementation _NURAWCameraSpaceProperties

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_NURAWCameraSpaceProperties xyzToCamera1](self, "xyzToCamera1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NURAWCameraSpaceProperties xyzToCamera2](self, "xyzToCamera2");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NURAWCameraSpaceProperties whiteValue](self, "whiteValue");
  v8 = v7;
  -[_NURAWCameraSpaceProperties whiteFactor](self, "whiteFactor");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> xyzToCamera1=%@ xyzToCamera2=%@ whiteValue=%f whiteFactor=%f"), v4, self, v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)xyzToCamera1
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXyzToCamera1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)xyzToCamera2
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXyzToCamera2:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (double)whiteValue
{
  return self->_whiteValue;
}

- (void)setWhiteValue:(double)a3
{
  self->_whiteValue = a3;
}

- (double)whiteFactor
{
  return self->_whiteFactor;
}

- (void)setWhiteFactor:(double)a3
{
  self->_whiteFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xyzToCamera2, 0);
  objc_storeStrong((id *)&self->_xyzToCamera1, 0);
}

@end
