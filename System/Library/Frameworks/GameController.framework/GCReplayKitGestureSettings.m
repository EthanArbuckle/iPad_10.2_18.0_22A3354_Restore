@implementation GCReplayKitGestureSettings

- (GCReplayKitGestureSettings)init
{
  GCReplayKitGestureSettings *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCReplayKitGestureSettings;
  result = -[GCReplayKitGestureSettings init](&v3, sel_init);
  if (result)
  {
    result->_doublePressGesture = -1;
    result->_longPressGesture = -1;
    result->_singlePressGesture = -1;
  }
  return result;
}

- (int64_t)gestureModeForGestureType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return -1;
  else
    return *(int64_t *)((char *)&self->super.isa + qword_21526CC68[a3]);
}

- (void)setGestureMode:(int64_t)a3 forGestureType:(int64_t)a4
{
  if ((unint64_t)a4 <= 2)
    *(Class *)((char *)&self->super.isa + qword_21526CC68[a4]) = (Class)a3;
}

- (int64_t)gestureTypeForGestureMode:(int64_t)a3
{
  if (self->_singlePressGesture == a3)
    return 0;
  if (self->_doublePressGesture == a3)
    return 2;
  if (self->_longPressGesture == a3)
    return 1;
  return -1;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<GCReplayKitGestureSettings single=%ld double=%ld long=%ld (%@)"), self->_singlePressGesture, self->_doublePressGesture, self->_longPressGesture, self->_controllerElementMappingKey);
}

- (NSString)controllerElementMappingKey
{
  return self->_controllerElementMappingKey;
}

- (void)setControllerElementMappingKey:(id)a3
{
  objc_storeStrong((id *)&self->_controllerElementMappingKey, a3);
}

- (int64_t)singlePressGesture
{
  return self->_singlePressGesture;
}

- (void)setSinglePressGesture:(int64_t)a3
{
  self->_singlePressGesture = a3;
}

- (int64_t)doublePressGesture
{
  return self->_doublePressGesture;
}

- (void)setDoublePressGesture:(int64_t)a3
{
  self->_doublePressGesture = a3;
}

- (int64_t)longPressGesture
{
  return self->_longPressGesture;
}

- (void)setLongPressGesture:(int64_t)a3
{
  self->_longPressGesture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerElementMappingKey, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCReplayKitGestureSettings)initWithCoder:(id)a3
{
  id v4;
  GCReplayKitGestureSettings *v5;
  uint64_t v6;
  NSString *controllerElementMappingKey;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCReplayKitGestureSettings;
  v5 = -[GCReplayKitGestureSettings init](&v9, sel_init);
  if (v5)
  {
    v5->_singlePressGesture = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_singlePressGesture"));
    v5->_doublePressGesture = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_doublePressGesture"));
    v5->_longPressGesture = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_longPressGesture"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_controllerElementMappingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    controllerElementMappingKey = v5->_controllerElementMappingKey;
    v5->_controllerElementMappingKey = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t singlePressGesture;
  id v5;

  singlePressGesture = self->_singlePressGesture;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", singlePressGesture, CFSTR("_singlePressGesture"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_doublePressGesture, CFSTR("_doublePressGesture"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_longPressGesture, CFSTR("_longPressGesture"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_controllerElementMappingKey, CFSTR("_controllerElementMappingKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  GCReplayKitGestureSettings *v4;
  uint64_t v5;
  NSString *controllerElementMappingKey;

  v4 = -[GCReplayKitGestureSettings init](+[GCReplayKitGestureSettings allocWithZone:](GCReplayKitGestureSettings, "allocWithZone:", a3), "init");
  v4->_singlePressGesture = self->_singlePressGesture;
  v4->_doublePressGesture = self->_doublePressGesture;
  v4->_longPressGesture = self->_longPressGesture;
  v5 = -[NSString copy](self->_controllerElementMappingKey, "copy");
  controllerElementMappingKey = v4->_controllerElementMappingKey;
  v4->_controllerElementMappingKey = (NSString *)v5;

  return v4;
}

@end
