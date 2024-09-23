@implementation _NTKCompanionFaceRenderingTask

- (_NTKCompanionFaceRenderingTask)initWithFace:(id)a3 detailMode:(int64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  _NTKCompanionFaceRenderingTask *v11;
  _NTKCompanionFaceRenderingTask *v12;
  uint64_t v13;
  id completionHandler;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_NTKCompanionFaceRenderingTask;
  v11 = -[_NTKCompanionFaceRenderingTask init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_face, a3);
    v12->_detailMode = a4;
    v13 = objc_msgSend(v10, "copy");
    completionHandler = v12->_completionHandler;
    v12->_completionHandler = (id)v13;

  }
  return v12;
}

- (BOOL)isMemberOfBatch
{
  return +[NTKFaceView numberOfDetailModesForFaceStyle:](NTKFaceView, "numberOfDetailModesForFaceStyle:", -[NTKFace faceStyle](self->_face, "faceStyle")) > 0;
}

- (NTKFace)face
{
  return self->_face;
}

- (int64_t)detailMode
{
  return self->_detailMode;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end
