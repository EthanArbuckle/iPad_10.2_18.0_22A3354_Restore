@implementation VCPVideoFaceDetector

+ (id)faceDetectorWithTransform:(CGAffineTransform *)a3 withExistingFaceprints:(id)a4 tracking:(BOOL)a5 faceDominated:(BOOL)a6 cancel:(id)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v10;
  VCPVideoFullFaceDetector *v11;
  __int128 v12;
  uint64_t v13;
  VCPVideoLightFaceDetector *v14;
  __int128 v15;
  void *v16;
  _OWORD v18[3];
  _OWORD v19[3];

  v7 = a6;
  v8 = a5;
  v10 = a4;
  if (v8)
  {
    v11 = [VCPVideoFullFaceDetector alloc];
    v12 = *(_OWORD *)&a3->c;
    v19[0] = *(_OWORD *)&a3->a;
    v19[1] = v12;
    v19[2] = *(_OWORD *)&a3->tx;
    v13 = -[VCPVideoFullFaceDetector initWithTransform:withExistingFaceprints:](v11, "initWithTransform:withExistingFaceprints:", v19, v10);
  }
  else
  {
    v14 = [VCPVideoLightFaceDetector alloc];
    v15 = *(_OWORD *)&a3->c;
    v18[0] = *(_OWORD *)&a3->a;
    v18[1] = v15;
    v18[2] = *(_OWORD *)&a3->tx;
    v13 = -[VCPVideoLightFaceDetector initWithTransform:faceDominated:](v14, "initWithTransform:faceDominated:", v18, v7);
  }
  v16 = (void *)v13;

  return v16;
}

- (id)results
{
  return self->_results;
}

- (id)faceRanges
{
  return 0;
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7
{
  return -4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_activeFaces, 0);
}

@end
