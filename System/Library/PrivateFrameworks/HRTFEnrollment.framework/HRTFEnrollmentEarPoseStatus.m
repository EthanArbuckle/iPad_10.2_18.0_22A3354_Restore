@implementation HRTFEnrollmentEarPoseStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HRTFEnrollmentEarPoseStatus)initWithLeftYawPose:(id)a3 rightYawPose:(id)a4 leftpitchPose:(id)a5 rightpitchPose:(id)a6 earSide:(unint64_t)a7 yawAngle:(double)a8 pitchAngle:(double)a9 earBoundingBox:(CGRect)a10 earCaptureStatus:(int)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v23;
  id v24;
  id v25;
  id v26;
  HRTFEnrollmentEarPoseStatus *v27;
  HRTFEnrollmentPoseStatus *v28;
  double v29;
  double v30;
  uint64_t v31;
  HRTFEnrollmentPoseStatus *leftStatus;
  HRTFEnrollmentPoseStatus *v33;
  double v34;
  double v35;
  uint64_t v36;
  HRTFEnrollmentPoseStatus *rightStatus;
  objc_super v39;

  height = a10.size.height;
  width = a10.size.width;
  y = a10.origin.y;
  x = a10.origin.x;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v39.receiver = self;
  v39.super_class = (Class)HRTFEnrollmentEarPoseStatus;
  v27 = -[HRTFEnrollmentEarPoseStatus init](&v39, sel_init);
  if (v27)
  {
    v28 = [HRTFEnrollmentPoseStatus alloc];
    if (a7)
      v29 = -100.0;
    else
      v29 = a8;
    if (a7)
      v30 = -100.0;
    else
      v30 = a9;
    v31 = -[HRTFEnrollmentPoseStatus initWithYawPose:pitchPose:isEarTracking:yawAngle:pitchAngle:](v28, "initWithYawPose:pitchPose:isEarTracking:yawAngle:pitchAngle:", v23, v25, a11 == 0, v29, v30);
    leftStatus = v27->_leftStatus;
    v27->_leftStatus = (HRTFEnrollmentPoseStatus *)v31;

    v33 = [HRTFEnrollmentPoseStatus alloc];
    if (a7 == 1)
      v34 = a8;
    else
      v34 = -100.0;
    if (a7 == 1)
      v35 = a9;
    else
      v35 = -100.0;
    v36 = -[HRTFEnrollmentPoseStatus initWithYawPose:pitchPose:isEarTracking:yawAngle:pitchAngle:](v33, "initWithYawPose:pitchPose:isEarTracking:yawAngle:pitchAngle:", v24, v26, a11 == 0, v34, v35);
    rightStatus = v27->_rightStatus;
    v27->_rightStatus = (HRTFEnrollmentPoseStatus *)v36;

    v27->_earBoundingBox.origin.x = x;
    v27->_earBoundingBox.origin.y = y;
    v27->_earBoundingBox.size.width = width;
    v27->_earBoundingBox.size.height = height;
    v27->_earCaptureStatus = a11;
  }

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  HRTFEnrollmentPoseStatus *leftStatus;
  id v5;

  leftStatus = self->_leftStatus;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", leftStatus, CFSTR("LeftEarStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rightStatus, CFSTR("RightEarStatus"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("EarBoundingBox.origin.x"), self->_earBoundingBox.origin.x);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("EarBoundingBox.origin.y"), self->_earBoundingBox.origin.y);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("EarBoundingBox.size.width"), self->_earBoundingBox.size.width);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("EarBoundingBox.size.height"), self->_earBoundingBox.size.height);
  objc_msgSend(v5, "encodeInt32:forKey:", self->_earCaptureStatus, CFSTR("EarCaptureStatusKey"));

}

- (HRTFEnrollmentEarPoseStatus)initWithCoder:(id)a3
{
  id v4;
  HRTFEnrollmentEarPoseStatus *v5;
  uint64_t v6;
  HRTFEnrollmentPoseStatus *leftStatus;
  uint64_t v8;
  HRTFEnrollmentPoseStatus *rightStatus;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  HRTFEnrollmentEarPoseStatus *v14;
  objc_super v16;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("LeftEarStatus"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("RightEarStatus"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("EarBoundingBox.origin.x"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("EarBoundingBox.origin.y"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("EarBoundingBox.size.width"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("EarBoundingBox.size.height"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("EarCaptureStatusKey")))
  {
    v16.receiver = self;
    v16.super_class = (Class)HRTFEnrollmentEarPoseStatus;
    v5 = -[HRTFEnrollmentEarPoseStatus init](&v16, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LeftEarStatus"));
      v6 = objc_claimAutoreleasedReturnValue();
      leftStatus = v5->_leftStatus;
      v5->_leftStatus = (HRTFEnrollmentPoseStatus *)v6;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RightEarStatus"));
      v8 = objc_claimAutoreleasedReturnValue();
      rightStatus = v5->_rightStatus;
      v5->_rightStatus = (HRTFEnrollmentPoseStatus *)v8;

      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("EarBoundingBox.origin.x"));
      v5->_earBoundingBox.origin.x = v10;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("EarBoundingBox.origin.y"));
      v5->_earBoundingBox.origin.y = v11;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("EarBoundingBox.size.width"));
      v5->_earBoundingBox.size.width = v12;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("EarBoundingBox.size.height"));
      v5->_earBoundingBox.size.height = v13;
      v5->_earCaptureStatus = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("EarCaptureStatusKey"));
    }
    self = v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (HRTFEnrollmentPoseStatus)leftStatus
{
  return (HRTFEnrollmentPoseStatus *)objc_getProperty(self, a2, 8, 1);
}

- (HRTFEnrollmentPoseStatus)rightStatus
{
  return (HRTFEnrollmentPoseStatus *)objc_getProperty(self, a2, 16, 1);
}

- (CGRect)earBoundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_earBoundingBox, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int)earCaptureStatus
{
  return self->_earCaptureStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightStatus, 0);
  objc_storeStrong((id *)&self->_leftStatus, 0);
}

@end
