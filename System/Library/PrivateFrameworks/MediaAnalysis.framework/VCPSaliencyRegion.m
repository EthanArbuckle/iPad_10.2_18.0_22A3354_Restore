@implementation VCPSaliencyRegion

- (VCPSaliencyRegion)initWith:(CGRect)a3 confidence:(float)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  VCPSaliencyRegion *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)VCPSaliencyRegion;
  result = -[VCPSaliencyRegion init](&v10, sel_init);
  if (result)
  {
    result->_bound.origin.x = x;
    result->_bound.origin.y = y;
    result->_bound.size.width = width;
    result->_bound.size.height = height;
    result->_confidence = a4;
  }
  return result;
}

- (VCPSaliencyRegion)initWithPlistRepresentation:(id)a3
{
  id v4;
  NSString *v5;
  uint64_t v6;
  double v7;
  void *v8;
  double x;
  double y;
  double width;
  double height;
  int v13;
  VCPSaliencyRegion *v14;
  NSRect v16;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bound"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidence"));
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v6;
  if (!v5)
  {
    x = 0.0;
    y = 0.0;
    width = 0.0;
    height = 0.0;
    if (v6)
      goto LABEL_3;
LABEL_5:
    LODWORD(v7) = 0;
    goto LABEL_6;
  }
  v16 = NSRectFromString(v5);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v8, "floatValue");
  LODWORD(v7) = v13;
LABEL_6:
  v14 = -[VCPSaliencyRegion initWith:confidence:](self, "initWith:confidence:", x, y, width, height, v7);

  return v14;
}

- (id)plistRepresentation
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  NSStringFromRect(self->_bound);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_confidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("bound");
  v8[1] = CFSTR("confidence");
  v9[0] = v3;
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)attachSalientRegions:(id)a3 toPixelBuffer:(__CVBuffer *)a4
{
  id v5;

  objc_msgSend(a3, "valueForKey:", CFSTR("plistRepresentation"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CVBufferSetAttachment(a4, CFSTR("SalientRegions"), v5, kCVAttachmentMode_ShouldNotPropagate);

}

+ (id)salientRegionsFromPixelBuffer:(__CVBuffer *)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  VCPSaliencyRegion *v10;
  VCPSaliencyRegion *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  CVBufferGetAttachment(a3, CFSTR("SalientRegions"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [VCPSaliencyRegion alloc];
        v11 = -[VCPSaliencyRegion initWithPlistRepresentation:](v10, "initWithPlistRepresentation:", v9, (_QWORD)v13);
        objc_msgSend(v4, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v4;
}

- (CGRect)bound
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_bound, 32, 1, 0);
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

- (void)setBound:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_bound, &v3, 32, 1, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end
