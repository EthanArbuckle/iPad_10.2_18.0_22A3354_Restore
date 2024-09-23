@implementation ANST3DPoseEstimate

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANST3DPoseEstimate)init
{
  ANST3DPoseEstimate *result;

  result = (ANST3DPoseEstimate *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANST3DPoseEstimate)initWithYaw:(int64_t)a3 roll:(int64_t)a4 refinedYaw:(int64_t)a5 refinedRoll:(int64_t)a6 refinedPitch:(int64_t)a7
{
  ANST3DPoseEstimate *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ANST3DPoseEstimate;
  result = -[ANST3DPoseEstimate init](&v13, sel_init);
  result->_yaw = a3;
  result->_roll = a4;
  result->_refinedYaw = a5;
  result->_refinedRoll = a6;
  result->_refinedPitch = a7;
  return result;
}

- (ANST3DPoseEstimate)initWithCoder:(id)a3
{
  id v4;
  ANST3DPoseEstimate *v5;
  ANST3DPoseEstimate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ANST3DPoseEstimate;
  v5 = -[ANST3DPoseEstimate init](&v8, sel_init);
  if (sub_2358E124C(v4, &v5->_yaw, "yaw")
    && sub_2358E124C(v4, &v5->_roll, sel_roll)
    && sub_2358E124C(v4, &v5->_refinedYaw, sel_refinedYaw)
    && sub_2358E124C(v4, &v5->_refinedRoll, sel_refinedRoll)
    && sub_2358E124C(v4, &v5->_refinedPitch, sel_refinedPitch))
  {
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t yaw;
  id v5;

  yaw = self->_yaw;
  v5 = a3;
  sub_2358E1360(v5, yaw, "yaw");
  sub_2358E1360(v5, self->_roll, sel_roll);
  sub_2358E1360(v5, self->_refinedYaw, sel_refinedYaw);
  sub_2358E1360(v5, self->_refinedRoll, sel_refinedRoll);
  sub_2358E1360(v5, self->_refinedPitch, sel_refinedPitch);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend_appendFormat_(v3, v4, (uint64_t)CFSTR("<ANST3DPoseEstimate %p> {\n"), self);
  objc_msgSend_appendFormat_(v3, v5, (uint64_t)CFSTR("    yaw          %ld\n"), self->_yaw);
  objc_msgSend_appendFormat_(v3, v6, (uint64_t)CFSTR("    roll         %ld\n"), self->_roll);
  objc_msgSend_appendFormat_(v3, v7, (uint64_t)CFSTR("    refinedYaw   %ld\n"), self->_refinedYaw);
  objc_msgSend_appendFormat_(v3, v8, (uint64_t)CFSTR("    refinedRoll  %ld\n"), self->_refinedRoll);
  objc_msgSend_appendFormat_(v3, v9, (uint64_t)CFSTR("    refinedPitch %ld\n"), self->_refinedPitch);
  objc_msgSend_appendString_(v3, v10, (uint64_t)CFSTR("}"));
  v13 = (void *)objc_msgSend_copy(v3, v11, v12);

  return v13;
}

- (int64_t)yaw
{
  return self->_yaw;
}

- (int64_t)roll
{
  return self->_roll;
}

- (int64_t)refinedYaw
{
  return self->_refinedYaw;
}

- (int64_t)refinedRoll
{
  return self->_refinedRoll;
}

- (int64_t)refinedPitch
{
  return self->_refinedPitch;
}

@end
