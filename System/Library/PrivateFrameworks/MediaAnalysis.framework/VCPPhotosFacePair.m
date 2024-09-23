@implementation VCPPhotosFacePair

- (VCPPhotosFacePair)initWithFace:(id)a3 andFace:(id)a4 distance:(double)a5
{
  id v9;
  id v10;
  VCPPhotosFacePair *v11;
  VCPPhotosFacePair *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VCPPhotosFacePair;
  v11 = -[VCPPhotosFacePair init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_face1, a3);
    objc_storeStrong((id *)&v12->_face2, a4);
    v12->_distance = a5;
  }

  return v12;
}

+ (id)pairWithFace:(id)a3 andFace:(id)a4 distance:(double)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFace:andFace:distance:", v8, v7, a5);

  return v9;
}

- (VCPPhotosFace)face1
{
  return self->_face1;
}

- (VCPPhotosFace)face2
{
  return self->_face2;
}

- (double)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_face2, 0);
  objc_storeStrong((id *)&self->_face1, 0);
}

@end
