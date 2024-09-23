@implementation CBSpatialMeasurement

- (CBSpatialMeasurement)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CBSpatialMeasurement *v13;
  int v14;
  id v15;
  int v16;
  int v17;
  CBSpatialMeasurement *v18;
  const char *v20;
  uint64_t v21;

  v6 = a3;
  v13 = -[CBSpatialMeasurement init](self, "init");
  if (!v13)
  {
    if (a4)
    {
      v20 = "init failed";
LABEL_25:
      CBErrorF(-6756, (uint64_t)v20, v7, v8, v9, v10, v11, v12, v21);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_26:
    v18 = 0;
    goto LABEL_19;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (a4)
    {
      v20 = "XPC non-dict";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (!CUXPCDecodeDouble() || !CUXPCDecodeDouble())
    goto LABEL_26;
  v14 = CUXPCDecodeNSError();
  v15 = 0;
  if (!v14)
    goto LABEL_20;
  objc_storeStrong((id *)&v13->_error, 0);
  v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v13->_flags = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_20;
  }
  if (!CUXPCDecodeDouble()
    || !CUXPCDecodeDouble()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeDouble()
    || !CUXPCDecodeDouble())
  {
    goto LABEL_20;
  }
  v17 = CUXPCDecodeUInt64RangedEx();
  if (v17 != 6)
  {
    if (v17 != 5)
      goto LABEL_17;
LABEL_20:
    v18 = 0;
    goto LABEL_18;
  }
  v13->_timestampTicks = 0;
LABEL_17:
  v18 = v13;
LABEL_18:

LABEL_19:
  return v18;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  void *v5;
  double distanceMeters;
  double distanceError;
  uint64_t flags;
  double horizontalAngle;
  double horizontalError;
  NSString *identifier;
  const char *v12;
  double verticalAngle;
  double verticalError;
  uint64_t timestampTicks;
  void *v16;
  xpc_object_t xdict;

  v4 = a3;
  v5 = v4;
  distanceMeters = self->_distanceMeters;
  if (distanceMeters != 0.0)
    xpc_dictionary_set_double(v4, "dM", distanceMeters);
  distanceError = self->_distanceError;
  if (distanceError != 0.0)
    xpc_dictionary_set_double(v5, "dE", distanceError);
  if (self->_error)
    CUXPCEncodeNSError();
  flags = self->_flags;
  if ((_DWORD)flags)
    xpc_dictionary_set_uint64(v5, "flgs", flags);
  horizontalAngle = self->_horizontalAngle;
  if (horizontalAngle != 0.0)
    xpc_dictionary_set_double(v5, "hA", horizontalAngle);
  horizontalError = self->_horizontalError;
  if (horizontalError != 0.0)
    xpc_dictionary_set_double(v5, "hE", horizontalError);
  identifier = self->_identifier;
  xdict = v5;
  v12 = -[NSString UTF8String](objc_retainAutorelease(identifier), "UTF8String");
  if (v12)
    xpc_dictionary_set_string(xdict, "id", v12);

  verticalAngle = self->_verticalAngle;
  if (verticalAngle != 0.0)
    xpc_dictionary_set_double(xdict, "vA", verticalAngle);
  verticalError = self->_verticalError;
  if (verticalError != 0.0)
    xpc_dictionary_set_double(xdict, "vE", verticalError);
  timestampTicks = self->_timestampTicks;
  v16 = xdict;
  if (timestampTicks)
  {
    xpc_dictionary_set_uint64(xdict, "ts", timestampTicks);
    v16 = xdict;
  }

}

- (id)description
{
  id v3;
  id v4;
  NSError *error;
  NSError *v6;
  id v7;
  void *v9;
  void *v10;

  NSAppendPrintF_safe();
  v3 = 0;
  if (self->_flags)
  {
    CUPrintFlags32();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v4 = v3;

    v3 = v4;
  }
  error = self->_error;
  if (error)
  {
    v6 = error;
    CUPrintNSError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v7 = v3;

    v3 = v7;
  }
  return v3;
}

- (double)distanceMeters
{
  return self->_distanceMeters;
}

- (void)setDistanceMeters:(double)a3
{
  self->_distanceMeters = a3;
}

- (double)distanceError
{
  return self->_distanceError;
}

- (void)setDistanceError:(double)a3
{
  self->_distanceError = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (double)horizontalAngle
{
  return self->_horizontalAngle;
}

- (void)setHorizontalAngle:(double)a3
{
  self->_horizontalAngle = a3;
}

- (double)horizontalError
{
  return self->_horizontalError;
}

- (void)setHorizontalError:(double)a3
{
  self->_horizontalError = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)verticalAngle
{
  return self->_verticalAngle;
}

- (void)setVerticalAngle:(double)a3
{
  self->_verticalAngle = a3;
}

- (double)verticalError
{
  return self->_verticalError;
}

- (void)setVerticalError:(double)a3
{
  self->_verticalError = a3;
}

- (unint64_t)timestampTicks
{
  return self->_timestampTicks;
}

- (void)setTimestampTicks:(unint64_t)a3
{
  self->_timestampTicks = a3;
}

- (double)ptsScore
{
  return self->_ptsScore;
}

- (void)setPtsScore:(double)a3
{
  self->_ptsScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
