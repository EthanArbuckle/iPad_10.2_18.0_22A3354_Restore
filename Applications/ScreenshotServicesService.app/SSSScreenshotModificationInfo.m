@implementation SSSScreenshotModificationInfo

- (id)initForScreenshotWithEnvironmentDescription:(id)a3
{
  SSEnvironmentDescription *v4;
  SSSScreenshotModificationInfo *v5;
  SSEnvironmentDescription *environmentDescription;
  SSEnvironmentDescription *v7;
  double v8;
  double v9;
  CGSize v10;
  CGPoint v11;
  NSArray *annotationNSDatas;
  uint64_t v13;
  NSArray *originalAnnotations;
  _OWORD v16[3];
  objc_super v17;

  v4 = (SSEnvironmentDescription *)a3;
  v17.receiver = self;
  v17.super_class = (Class)SSSScreenshotModificationInfo;
  v5 = -[SSSScreenshotModificationInfo init](&v17, "init");
  environmentDescription = v5->_environmentDescription;
  v5->_environmentDescription = v4;
  v7 = v4;

  -[SSEnvironmentDescription imagePointSize](v7, "imagePointSize");
  sub_100048FB0((uint64_t)v16, v8, v9);
  v11 = (CGPoint)v16[1];
  v10 = (CGSize)v16[2];
  v5->_cropInfo.totalSize = (CGSize)v16[0];
  v5->_cropInfo.currentRect.origin = v11;
  v5->_cropInfo.currentRect.size = v10;
  annotationNSDatas = v5->_annotationNSDatas;
  v5->_annotationNSDatas = (NSArray *)&__NSArray0__struct;

  v5->_vellumOpacity = 0.0;
  v13 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  originalAnnotations = v5->_originalAnnotations;
  v5->_originalAnnotations = (NSArray *)v13;

  v5->_paperKitChangeCounter = 0;
  return v5;
}

- (SSSCropInfo)cropInfo
{
  CGPoint size;

  size = (CGPoint)self->currentRect.size;
  retstr->totalSize = (CGSize)self->currentRect.origin;
  retstr->currentRect.origin = size;
  retstr->currentRect.size = self[1].totalSize;
  return self;
}

- (NSArray)annotations
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotModificationInfo annotationNSDatas](self, "annotationNSDatas"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_SSSScreenshotAnnotationController annotationsFromAnnotationData:](_SSSScreenshotAnnotationController, "annotationsFromAnnotationData:", v2));

  return (NSArray *)v3;
}

- (id)annotationNSDatas
{
  return self->_annotationNSDatas;
}

- (double)vellumOpacity
{
  return self->_vellumOpacity;
}

- (NSString)imageDescription
{
  return self->_imageDescription;
}

- (SSSScreenshotModificationInfo)initWithCoder:(id)a3
{
  return -[SSSScreenshotModificationInfo init](self, "init", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  id *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v21;
  char v22[48];

  v4 = a3;
  v6 = objc_opt_class(SSSScreenshotModificationInfo, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (id *)v4;
    v8 = v7;
    if (v7[12] != (id)self->_paperKitChangeCounter)
      goto LABEL_10;
    if (!objc_msgSend(v7[1], "isEqual:", self->_environmentDescription))
      goto LABEL_10;
    objc_msgSend(v8, "cropInfo");
    -[SSSScreenshotModificationInfo cropInfo](self, "cropInfo");
    if (!sub_100048FD0((uint64_t)v22, (uint64_t)&v21))
      goto LABEL_10;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "annotationNSDatas"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotModificationInfo annotationNSDatas](self, "annotationNSDatas"));
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_10;
    objc_msgSend(v8, "vellumOpacity");
    v13 = v12;
    -[SSSScreenshotModificationInfo vellumOpacity](self, "vellumOpacity");
    if (v13 == v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageDescription"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotModificationInfo imageDescription](self, "imageDescription"));
      if (v15 == v16)
      {
        v19 = 1;
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageDescription"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotModificationInfo imageDescription](self, "imageDescription"));
        v19 = objc_msgSend(v17, "isEqualToString:", v18);

      }
    }
    else
    {
LABEL_10:
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class(self, a2));
  objc_storeStrong(v4 + 1, self->_environmentDescription);
  -[SSSScreenshotModificationInfo cropInfo](self, "cropInfo");
  v6 = v19;
  v5 = v20;
  *((_OWORD *)v4 + 1) = v18;
  *((_OWORD *)v4 + 2) = v6;
  *((_OWORD *)v4 + 3) = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotModificationInfo annotationNSDatas](self, "annotationNSDatas"));
  v8 = objc_msgSend(v7, "copy");
  v9 = v4[8];
  v4[8] = v8;

  -[SSSScreenshotModificationInfo vellumOpacity](self, "vellumOpacity");
  v4[9] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotModificationInfo originalAnnotations](self, "originalAnnotations"));
  v12 = objc_msgSend(v11, "copy");
  v13 = v4[10];
  v4[10] = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotModificationInfo imageDescription](self, "imageDescription"));
  v15 = objc_msgSend(v14, "copy");
  v16 = v4[11];
  v4[11] = v15;

  v4[12] = (id)self->_paperKitChangeCounter;
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;

  v4 = -[SSSScreenshotModificationInfo initForScreenshotWithEnvironmentDescription:]([SSSScreenshotMutableModificationInfo alloc], "initForScreenshotWithEnvironmentDescription:", self->_environmentDescription);
  -[SSSScreenshotModificationInfo cropInfo](self, "cropInfo");
  objc_msgSend(v4, "setCropInfo:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotModificationInfo annotationNSDatas](self, "annotationNSDatas"));
  objc_msgSend(v4, "setAnnotationNSDatas:", v5);

  -[SSSScreenshotModificationInfo vellumOpacity](self, "vellumOpacity");
  objc_msgSend(v4, "setVellumOpacity:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotModificationInfo originalAnnotations](self, "originalAnnotations"));
  v7 = objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v4, "setOriginalAnnotations:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotModificationInfo imageDescription](self, "imageDescription"));
  v9 = objc_msgSend(v8, "copy");
  objc_msgSend(v4, "setImageDescription:", v9);

  objc_msgSend(v4, "setPaperKitChangeCounter:", -[SSSScreenshotModificationInfo paperKitChangeCounter](self, "paperKitChangeCounter"));
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  CGPoint origin;
  id v6;
  void *v7;
  void *v8;
  CGSize v10[3];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSSScreenshotModificationInfo;
  v3 = -[SSSScreenshotModificationInfo description](&v11, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  origin = self->_cropInfo.currentRect.origin;
  v10[0] = self->_cropInfo.totalSize;
  v10[1] = (CGSize)origin;
  v10[2] = self->_cropInfo.currentRect.size;
  v6 = sub_1000490C8(v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v4, v7));

  return v8;
}

- (NSArray)originalAnnotations
{
  return self->_originalAnnotations;
}

- (unint64_t)paperKitChangeCounter
{
  return self->_paperKitChangeCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDescription, 0);
  objc_storeStrong((id *)&self->_originalAnnotations, 0);
  objc_storeStrong((id *)&self->_annotationNSDatas, 0);
  objc_storeStrong((id *)&self->_environmentDescription, 0);
}

@end
