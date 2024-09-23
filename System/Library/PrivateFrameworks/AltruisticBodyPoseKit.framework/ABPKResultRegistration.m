@implementation ABPKResultRegistration

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (uint64_t)joints2d
{
  return *(_QWORD *)(a1 + 16);
}

- (void)setJoints2d:(ABPKResultRegistration *)self
{
  uint64_t v2;

  *(_QWORD *)&self->_joints2d[7] = v2;
}

- (uint64_t)joints3dWrtBody
{
  return *(_QWORD *)(a1 + 24);
}

- (void)setJoints3dWrtBody:(ABPKResultRegistration *)self
{
  uint64_t v2;

  *(_QWORD *)&self->_joints3dWrtBody[7] = v2;
}

- (uint64_t)joints3dWrtCamera
{
  return *(_QWORD *)(a1 + 32);
}

- (void)setJoints3dWrtCamera:(ABPKResultRegistration *)self
{
  uint64_t v2;

  *(_QWORD *)&self->_joints3dWrtCamera[7] = v2;
}

- (__n128)intrinsics
{
  return a1[5];
}

- (__n128)setIntrinsics:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

- (__n128)distortion
{
  return a1[3];
}

- (void)setDistortion:(ABPKResultRegistration *)self
{
  __int128 v2;

  *(_OWORD *)&self->_distortion[7] = v2;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (__n128)cameraFromBodyPose
{
  return a1[8];
}

- (__n128)setCameraFromBodyPose:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

@end
