@implementation ARQLInlineTouch

+ (id)touchToUUIDMapping
{
  if (touchToUUIDMapping_onceToken != -1)
    dispatch_once(&touchToUUIDMapping_onceToken, &__block_literal_global_17);
  return (id)touchToUUIDMapping__touchToUUIDMapping;
}

void __37__ARQLInlineTouch_touchToUUIDMapping__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)touchToUUIDMapping__touchToUUIDMapping;
  touchToUUIDMapping__touchToUUIDMapping = v0;

}

- (id)uuidForTouch:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  +[ARQLInlineTouch touchToUUIDMapping](ARQLInlineTouch, "touchToUUIDMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v5, v3);
  }
  v7 = v5;

  return v7;
}

+ (void)removeUIDForUITouch:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ARQLInlineTouch touchToUUIDMapping](ARQLInlineTouch, "touchToUUIDMapping");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v3);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARQLInlineTouch)initWithCoder:(id)a3
{
  id v4;
  ARQLInlineTouch *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  uint64_t v11;
  NSString *uid;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARQLInlineTouch;
  v5 = -[ARQLInlineTouch init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kTimestampKey"));
    v5->_timestamp = v6;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("kCGLocationKey"));
    v5->_cgLocation.x = v7;
    v5->_cgLocation.y = v8;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("kCGPreviousLocationKey"));
    v5->_cgPreviousLocation.x = v9;
    v5->_cgPreviousLocation.y = v10;
    v5->_phase = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kPhaseKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUidKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    uid = v5->_uid;
    v5->_uid = (NSString *)v11;

  }
  return v5;
}

- (ARQLInlineTouch)initWithUITouch:(id)a3
{
  id v4;
  ARQLInlineTouch *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  uint64_t v11;
  NSString *uid;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARQLInlineTouch;
  v5 = -[ARQLInlineTouch init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "timestamp");
    v5->_timestamp = v6;
    objc_msgSend(v4, "locationInView:", 0);
    v5->_cgLocation.x = v7;
    v5->_cgLocation.y = v8;
    objc_msgSend(v4, "previousLocationInView:", 0);
    v5->_cgPreviousLocation.x = v9;
    v5->_cgPreviousLocation.y = v10;
    v5->_phase = objc_msgSend(v4, "phase");
    -[ARQLInlineTouch uuidForTouch:](v5, "uuidForTouch:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    uid = v5->_uid;
    v5->_uid = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kTimestampKey"), timestamp);
  objc_msgSend(v5, "encodeCGPoint:forKey:", CFSTR("kCGLocationKey"), self->_cgLocation.x, self->_cgLocation.y);
  objc_msgSend(v5, "encodeCGPoint:forKey:", CFSTR("kCGPreviousLocationKey"), self->_cgPreviousLocation.x, self->_cgPreviousLocation.y);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_phase, CFSTR("kPhaseKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uid, CFSTR("kUidKey"));

}

- (id)description
{
  void *v3;
  NSString *uid;
  double timestamp;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  uid = self->_uid;
  timestamp = self->_timestamp;
  NSStringFromCGPoint(self->_cgLocation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_cgPreviousLocation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ARQLInlineTouch %@, %.11g, location: %@, previousLocation: %@"), uid, *(_QWORD *)&timestamp, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (CGPoint)cgLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_cgLocation.x;
  y = self->_cgLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCgLocation:(CGPoint)a3
{
  self->_cgLocation = a3;
}

- (CGPoint)cgPreviousLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_cgPreviousLocation.x;
  y = self->_cgPreviousLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCgPreviousLocation:(CGPoint)a3
{
  self->_cgPreviousLocation = a3;
}

- (int64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_phase = a3;
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
}

@end
