@implementation MonoPoseEstimatorInput

- (MonoPoseEstimatorInput)initWithPose:(id)a3 poseStdDev:(id)a4 wristRotation:(id)a5 wristRotationStdDev:(id)a6 boneScale:(id)a7 boneScaleStdDev:(id)a8 uvdJoints:(id)a9 uvdJointsStdDev:(id)a10 latents:(id)a11 debug1:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  MonoPoseEstimatorInput *v26;
  MonoPoseEstimatorInput *v27;
  MonoPoseEstimatorInput *v28;
  id v31;
  objc_super v32;

  v17 = a3;
  v31 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v32.receiver = self;
  v32.super_class = (Class)MonoPoseEstimatorInput;
  v26 = -[MonoPoseEstimatorInput init](&v32, sel_init);
  v27 = v26;
  if (v26)
  {
    -[MonoPoseEstimatorInput setPose:](v26, "setPose:", v17);
    -[MonoPoseEstimatorInput setPoseStdDev:](v27, "setPoseStdDev:", v31);
    -[MonoPoseEstimatorInput setWristRotation:](v27, "setWristRotation:", v18);
    -[MonoPoseEstimatorInput setWristRotationStdDev:](v27, "setWristRotationStdDev:", v19);
    -[MonoPoseEstimatorInput setBoneScale:](v27, "setBoneScale:", v20);
    -[MonoPoseEstimatorInput setBoneScaleStdDev:](v27, "setBoneScaleStdDev:", v21);
    -[MonoPoseEstimatorInput setUvdJoints:](v27, "setUvdJoints:", v22);
    -[MonoPoseEstimatorInput setUvdJointsStdDev:](v27, "setUvdJointsStdDev:", v23);
    -[MonoPoseEstimatorInput setLatents:](v27, "setLatents:", v24);
    -[MonoPoseEstimatorInput setDebug1:](v27, "setDebug1:", v25);
    v28 = v27;
  }

  return v27;
}

- (NSData)pose
{
  return self->_pose;
}

- (void)setPose:(id)a3
{
  objc_storeStrong((id *)&self->_pose, a3);
}

- (NSData)poseStdDev
{
  return self->_poseStdDev;
}

- (void)setPoseStdDev:(id)a3
{
  objc_storeStrong((id *)&self->_poseStdDev, a3);
}

- (NSData)wristRotation
{
  return self->_wristRotation;
}

- (void)setWristRotation:(id)a3
{
  objc_storeStrong((id *)&self->_wristRotation, a3);
}

- (NSData)wristRotationStdDev
{
  return self->_wristRotationStdDev;
}

- (void)setWristRotationStdDev:(id)a3
{
  objc_storeStrong((id *)&self->_wristRotationStdDev, a3);
}

- (NSData)boneScale
{
  return self->_boneScale;
}

- (void)setBoneScale:(id)a3
{
  objc_storeStrong((id *)&self->_boneScale, a3);
}

- (NSData)boneScaleStdDev
{
  return self->_boneScaleStdDev;
}

- (void)setBoneScaleStdDev:(id)a3
{
  objc_storeStrong((id *)&self->_boneScaleStdDev, a3);
}

- (NSData)uvdJoints
{
  return self->_uvdJoints;
}

- (void)setUvdJoints:(id)a3
{
  objc_storeStrong((id *)&self->_uvdJoints, a3);
}

- (NSData)uvdJointsStdDev
{
  return self->_uvdJointsStdDev;
}

- (void)setUvdJointsStdDev:(id)a3
{
  objc_storeStrong((id *)&self->_uvdJointsStdDev, a3);
}

- (NSData)latents
{
  return self->_latents;
}

- (void)setLatents:(id)a3
{
  objc_storeStrong((id *)&self->_latents, a3);
}

- (NSData)debug1
{
  return self->_debug1;
}

- (void)setDebug1:(id)a3
{
  objc_storeStrong((id *)&self->_debug1, a3);
}

- (__n128)intrinsics
{
  return a1[6];
}

- (__n128)setIntrinsics:(__n128)a3
{
  result[6] = a2;
  result[7] = a3;
  result[8] = a4;
  return result;
}

- (__n128)localizer
{
  return a1[9];
}

- (__n128)setLocalizer:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debug1, 0);
  objc_storeStrong((id *)&self->_latents, 0);
  objc_storeStrong((id *)&self->_uvdJointsStdDev, 0);
  objc_storeStrong((id *)&self->_uvdJoints, 0);
  objc_storeStrong((id *)&self->_boneScaleStdDev, 0);
  objc_storeStrong((id *)&self->_boneScale, 0);
  objc_storeStrong((id *)&self->_wristRotationStdDev, 0);
  objc_storeStrong((id *)&self->_wristRotation, 0);
  objc_storeStrong((id *)&self->_poseStdDev, 0);
  objc_storeStrong((id *)&self->_pose, 0);
}

@end
