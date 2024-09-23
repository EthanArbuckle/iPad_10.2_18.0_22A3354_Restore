@implementation VNHumanBody3DOutput

- (__n128)initWithSkeleton:(__n128)a3 intrinsics:(__n128)a4 inputSize:(double)a5
{
  id v12;
  VNHumanBody3DOutput *v13;
  __n128 *v14;
  __n128 *v15;
  objc_super v20;

  v12 = a8;
  v20.receiver = a1;
  v20.super_class = (Class)VNHumanBody3DOutput;
  v13 = -[VNHumanBody3DOutput init](&v20, sel_init);
  v14 = (__n128 *)v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_liftedSkeleton, a8);
    v14[2] = a2;
    v14[3] = a3;
    v14[4] = a4;
    v14[1].n128_f64[0] = a5;
    v14[1].n128_f64[1] = a6;
    v15 = v14;
  }

  return v14;
}

- (ABPKSkeleton)liftedSkeleton
{
  return self->_liftedSkeleton;
}

- (__n128)cameraIntrinsics
{
  return a1[2];
}

- (CGSize)inputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_inputSize.width;
  height = self->_inputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftedSkeleton, 0);
}

@end
