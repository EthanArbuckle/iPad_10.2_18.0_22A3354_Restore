@implementation AVMetadataTextRegionObject

+ (id)textRegionObjectWithDictionary:(id)a3 input:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initTextRegionObjectWithDictionary:input:", a3, a4);
}

- (id)initTextRegionObjectWithDictionary:(id)a3 input:(id)a4
{
  CGSize v7;
  AVMetadataTextRegionObject *v8;
  float v9;
  float v10;
  __int128 v12;
  uint64_t v13;
  CMTime v14;
  objc_super v15;
  CGRect rect;
  CMTime v17;

  memset(&v17, 0, sizeof(v17));
  CMTimeMakeFromDictionary(&v17, (CFDictionaryRef)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D051B0]));
  v7 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  rect.size = v7;
  CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05198]), &rect);
  v15.receiver = self;
  v15.super_class = (Class)AVMetadataTextRegionObject;
  v14 = v17;
  v12 = *MEMORY[0x1E0CA2E18];
  v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v8 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v15, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, CFSTR("textRegion"), &v14, &v12, 0, 0, a4, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  if (v8)
  {
    v8->_regionID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D051A8]), "integerValue");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D051A0]), "floatValue");
    v8->_confidence = v9;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05188]), "floatValue");
    v8->_angularOffset = v10;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05190]), &v8->_angularOffsetBounds);
  }
  return v8;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  CGSize v9;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  AVMetadataTextRegionObject *v15;
  uint64_t v16;
  float v17;
  float v18;
  __int128 v19;
  objc_super v21;
  _QWORD v22[3];
  _QWORD v23[3];
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;

  v9 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v25.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v25.size = v9;
  objc_msgSend(a3, "bounds");
  v10 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v24.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v24.c = v10;
  *(_OWORD *)&v24.tx = *(_OWORD *)&a4->tx;
  if (AVMetadataObjectAdjustBaseClassProperties((uint64_t)&v24, &v25, v11, v12, v13, v14))
  {
    if (a3)
    {
      objc_msgSend(a3, "time");
      objc_msgSend(a3, "duration");
    }
    else
    {
      memset(v23, 0, sizeof(v23));
      memset(v22, 0, sizeof(v22));
    }
    v16 = objc_msgSend(a3, "input");
    v21.receiver = self;
    v21.super_class = (Class)AVMetadataTextRegionObject;
    v15 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v21, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, CFSTR("textRegion"), v23, v22, 0, a3, v16, *(_OWORD *)&v25.origin, *(_OWORD *)&v25.size);
    if (v15)
    {
      v15->_regionID = objc_msgSend(a3, "regionID");
      objc_msgSend(a3, "confidence");
      v15->_confidence = v17;
      objc_msgSend(a3, "angularOffset");
      v15->_angularOffset = v18;
      objc_msgSend(a3, "angularOffsetBounds");
      v19 = *(_OWORD *)&a4->c;
      *(_OWORD *)&v24.a = *(_OWORD *)&a4->a;
      *(_OWORD *)&v24.c = v19;
      *(_OWORD *)&v24.tx = *(_OWORD *)&a4->tx;
      v15->_angularOffsetBounds = CGRectApplyAffineTransform(v26, &v24);
    }
  }
  else
  {

    return 0;
  }
  return v15;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVMetadataTextRegionObject;
  -[AVMetadataObject dealloc](&v2, sel_dealloc);
}

- (int64_t)regionID
{
  return self->_regionID;
}

- (float)confidence
{
  return self->_confidence;
}

- (float)angularOffset
{
  return self->_angularOffset;
}

- (CGRect)angularOffsetBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_angularOffsetBounds, 32, 1, 0);
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

@end
