@implementation SHHapticSpatialOffset

- (SHHapticSpatialOffset)initWithTimestamp:(double)a3 offset:(double)a4
{
  SHHapticSpatialOffset *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SHHapticSpatialOffset;
  result = -[SHHapticSpatialOffset init](&v7, sel_init);
  if (result)
  {
    result->_timestamp = a3;
    result->_offset = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHHapticSpatialOffset)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SHHapticSpatialOffsetTimestampKey"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SHHapticSpatialOffsetKey"));
  v8 = v7;

  return -[SHHapticSpatialOffset initWithTimestamp:offset:](self, "initWithTimestamp:offset:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[SHHapticSpatialOffset timestamp](self, "timestamp");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("SHHapticSpatialOffsetTimestampKey"));
  -[SHHapticSpatialOffset offset](self, "offset");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("SHHapticSpatialOffsetKey"));

}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)offset
{
  return self->_offset;
}

@end
