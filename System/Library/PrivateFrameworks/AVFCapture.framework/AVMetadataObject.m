@implementation AVMetadataObject

- (AVMetadataObjectType)type
{
  return -[AVMetadataObjectInternal type](self->_objectInternal, "type");
}

- (AVMetadataObject)initWithType:(id)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  AVMetadataObject *v19;
  AVMetadataObjectInternal *v20;
  AVMetadataObjectInternal *objectInternal;
  AVMetadataObjectInternal *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  AVMetadataObjectInternal *v27;
  uint64_t v28;
  AVMetadataObjectInternal *v29;
  __int128 v31;
  int64_t v32;
  __int128 v33;
  int64_t var3;
  objc_super v35;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v35.receiver = self;
  v35.super_class = (Class)AVMetadataObject;
  v19 = -[AVMetadataObject init](&v35, sel_init);
  if (v19)
  {
    objc_opt_class();
    AVRequireConcreteObject();
    v20 = objc_alloc_init(AVMetadataObjectInternal);
    v19->_objectInternal = v20;
    if (v20)
    {
      -[AVMetadataObjectInternal setType:](v20, "setType:", a3);
      objectInternal = v19->_objectInternal;
      v33 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      -[AVMetadataObjectInternal setTime:](objectInternal, "setTime:", &v33);
      v22 = v19->_objectInternal;
      v31 = *(_OWORD *)&a5->var0;
      v32 = a5->var3;
      -[AVMetadataObjectInternal setDuration:](v22, "setDuration:", &v31);
      -[AVMetadataObjectInternal setBounds:](v19->_objectInternal, "setBounds:", x, y, width, height);
      -[AVMetadataObjectInternal setOriginalMetadataObject:](v19->_objectInternal, "setOriginalMetadataObject:", a8);
      -[AVMetadataObjectInternal setInput:](v19->_objectInternal, "setInput:", a9);
      if (a7)
      {
        v23 = (void *)objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E0D04F50]);
        if (v23)
          -[AVMetadataObjectInternal setGroupID:](v19->_objectInternal, "setGroupID:", objc_msgSend(v23, "integerValue"));
        v24 = (void *)objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F58]);
        if (v24)
        {
          if (objc_msgSend(v24, "BOOLValue"))
            v25 = 2;
          else
            v25 = 1;
          -[AVMetadataObjectInternal setSyntheticFocusMode:](v19->_objectInternal, "setSyntheticFocusMode:", -[AVMetadataObjectInternal syntheticFocusMode](v19->_objectInternal, "syntheticFocusMode") | v25);
        }
        v26 = (void *)objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F50]);
        if (!v26 || !objc_msgSend(v26, "BOOLValue"))
          goto LABEL_18;
        v27 = v19->_objectInternal;
        v28 = -[AVMetadataObjectInternal syntheticFocusMode](v27, "syntheticFocusMode") | 4;
        v29 = v27;
      }
      else
      {
        if (!a8)
        {
LABEL_18:
          -[AVMetadataObjectInternal setDetectionSource:](v19->_objectInternal, "setDetectionSource:", objc_msgSend(a8, "detectionSource"));
          return v19;
        }
        -[AVMetadataObjectInternal setGroupID:](v19->_objectInternal, "setGroupID:", objc_msgSend(a8, "groupID"));
        v28 = objc_msgSend(a8, "syntheticFocusMode");
        v29 = v19->_objectInternal;
      }
      -[AVMetadataObjectInternal setSyntheticFocusMode:](v29, "setSyntheticFocusMode:", v28);
      goto LABEL_18;
    }

    return 0;
  }
  return v19;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetadataObject;
  -[AVMetadataObject dealloc](&v3, sel_dealloc);
}

- (AVMetadataObject)init
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v5 = *MEMORY[0x1E0CA2E18];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v3 = v5;
  v4 = v6;
  return -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", 0, &v5, &v3, 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

+ (id)derivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  _BOOL8 v7;
  id v10;
  __int128 v11;
  _OWORD v13[3];

  v7 = a5;
  v10 = objc_alloc((Class)objc_opt_class());
  v11 = *(_OWORD *)&a4->c;
  v13[0] = *(_OWORD *)&a4->a;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&a4->tx;
  return (id)objc_msgSend(v10, "initDerivedMetadataObjectFromMetadataObject:withTransform:isVideoMirrored:rollAdjustment:", a3, v13, v7, a6);
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  objc_opt_class();
  AVRequestConcreteImplementation();
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  int64_t v18;
  int64_t v19;
  CMTime v21;
  CMTime v22;
  CMTime time2;
  CMTime time1;
  CGRect v25;
  CGRect v26;

  if (self)
  {
    -[AVMetadataObject time](self, "time");
    if (a3)
    {
LABEL_3:
      objc_msgSend(a3, "time");
      goto LABEL_6;
    }
  }
  else
  {
    memset(&time1, 0, sizeof(time1));
    if (a3)
      goto LABEL_3;
  }
  memset(&time2, 0, sizeof(time2));
LABEL_6:
  if (CMTimeCompare(&time1, &time2))
  {
LABEL_13:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (self)
  {
    -[AVMetadataObject duration](self, "duration");
    if (a3)
    {
LABEL_9:
      objc_msgSend(a3, "duration");
      goto LABEL_12;
    }
  }
  else
  {
    memset(&v22, 0, sizeof(v22));
    if (a3)
      goto LABEL_9;
  }
  memset(&v21, 0, sizeof(v21));
LABEL_12:
  if (CMTimeCompare(&v22, &v21))
    goto LABEL_13;
  -[AVMetadataObject bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(a3, "bounds");
  v26.origin.x = v14;
  v26.origin.y = v15;
  v26.size.width = v16;
  v26.size.height = v17;
  v25.origin.x = v7;
  v25.origin.y = v9;
  v25.size.width = v11;
  v25.size.height = v13;
  v5 = CGRectEqualToRect(v25, v26);
  if (v5)
  {
    v5 = -[NSString isEqualToString:](-[AVMetadataObject type](self, "type"), "isEqualToString:", objc_msgSend(a3, "type"));
    if (v5)
    {
      if (-[AVMetadataObject groupID](self, "groupID") != -1 && objc_msgSend(a3, "groupID") != -1)
      {
        v18 = -[AVMetadataObject groupID](self, "groupID");
        if (v18 != objc_msgSend(a3, "groupID"))
          goto LABEL_13;
      }
      v19 = -[AVMetadataObject detectionSource](self, "detectionSource", v21.value, *(_QWORD *)&v21.timescale, v21.epoch, v22.value, *(_QWORD *)&v22.timescale, v22.epoch, time2.value, *(_QWORD *)&time2.timescale, time2.epoch, time1.value, *(_QWORD *)&time1.timescale, time1.epoch);
      LOBYTE(v5) = v19 == objc_msgSend(a3, "detectionSource");
    }
  }
  return v5;
}

- (CMTime)time
{
  CMTime *result;

  result = (CMTime *)self->_objectInternal;
  if (result)
    return (CMTime *)-[CMTime time](result, "time");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (CMTime)duration
{
  CMTime *result;

  result = (CMTime *)self->_objectInternal;
  if (result)
    return (CMTime *)-[CMTime duration](result, "duration");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[AVMetadataObjectInternal bounds](self->_objectInternal, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)input
{
  return -[AVMetadataObjectInternal input](self->_objectInternal, "input");
}

- (int64_t)groupID
{
  return -[AVMetadataObjectInternal groupID](self->_objectInternal, "groupID");
}

- (unint64_t)syntheticFocusMode
{
  return -[AVMetadataObjectInternal syntheticFocusMode](self->_objectInternal, "syntheticFocusMode");
}

- (id)originalMetadataObject
{
  id result;

  result = -[AVMetadataObjectInternal originalMetadataObject](self->_objectInternal, "originalMetadataObject");
  if (!result)
    return self;
  return result;
}

- (int64_t)detectionSource
{
  return -[AVMetadataObjectInternal detectionSource](self->_objectInternal, "detectionSource");
}

- (void)setDetectionSource:(int64_t)a3
{
  -[AVMetadataObjectInternal setDetectionSource:](self->_objectInternal, "setDetectionSource:", a3);
}

@end
