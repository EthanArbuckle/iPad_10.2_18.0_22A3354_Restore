@implementation HMIVideoAnalyzerFrameResult

- (HMIVideoAnalyzerFrameResult)initWithFrame:(id)a3 events:(id)a4
{
  return -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](self, "initWithFrame:events:regionOfInterest:", a3, a4, 0.0, 0.0, 1.0, 1.0);
}

- (HMIVideoAnalyzerFrameResult)initWithFrame:(id)a3 events:(id)a4 regionOfInterest:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  void *v14;
  HMIVideoAnalyzerFrameResult *v15;
  HMIVideoAnalyzerFrameResult *v16;
  HMIVideoAnalyzerFrameResult *v18;
  SEL v19;
  objc_super v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3;
  v13 = a4;
  if (v12)
  {
    v14 = v13;
    v20.receiver = self;
    v20.super_class = (Class)HMIVideoAnalyzerFrameResult;
    v15 = -[HMIVideoAnalyzerFrameResult init](&v20, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_frame, a3);
      objc_storeStrong((id *)&v16->_events, a4);
      v16->_regionOfInterest.origin.x = x;
      v16->_regionOfInterest.origin.y = y;
      v16->_regionOfInterest.size.width = width;
      v16->_regionOfInterest.size.height = height;
    }

    return v16;
  }
  else
  {
    v18 = (HMIVideoAnalyzerFrameResult *)_HMFPreconditionFailure();
    return (HMIVideoAnalyzerFrameResult *)-[HMIVideoAnalyzerFrameResult redactedCopy](v18, v19);
  }
}

- (id)redactedCopy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc((Class)objc_opt_class());
  -[HMIVideoAnalyzerFrameResult frame](self, "frame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redactedCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerFrameResult events](self, "events");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerFrameResult regionOfInterest](self, "regionOfInterest");
  v7 = (void *)objc_msgSend(v3, "initWithFrame:events:regionOfInterest:", v5, v6);

  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  NSRect v15;

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerFrameResult frame](self, "frame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Frame"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerFrameResult events](self, "events", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Events"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerFrameResult regionOfInterest](self, "regionOfInterest");
  NSStringFromRect(v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Region of Interest"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)maxConfidenceEventForEventClass:(Class)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  -[HMIVideoAnalyzerFrameResult events](self, "events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__HMIVideoAnalyzerFrameResult_maxConfidenceEventForEventClass___block_invoke;
  v10[3] = &__block_descriptor_40_e31_B16__0__HMIVideoAnalyzerEvent_8lu32l8;
  v10[4] = a3;
  objc_msgSend(v4, "na_filter:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __63__HMIVideoAnalyzerFrameResult_maxConfidenceEventForEventClass___block_invoke_2;
  v9[3] = &unk_24DBEA4C8;
  v9[4] = &v11;
  objc_msgSend(v6, "na_each:", v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

uint64_t __63__HMIVideoAnalyzerFrameResult_maxConfidenceEventForEventClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __63__HMIVideoAnalyzerFrameResult_maxConfidenceEventForEventClass___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v14 = v4;
  if (!v7)
    goto LABEL_4;
  objc_msgSend(v4, "confidence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v10 = v9;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "confidence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v13 = v12;

  if (v10 > v13)
  {
    v6 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
LABEL_4:
    objc_storeStrong(v6, a2);
  }

}

- (id)maxConfidenceEvents
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[HMIVideoAnalyzerEvent eventClasses](HMIVideoAnalyzerEvent, "eventClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__HMIVideoAnalyzerFrameResult_maxConfidenceEvents__block_invoke;
  v6[3] = &unk_24DBEA4F0;
  v6[4] = self;
  objc_msgSend(v3, "na_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __50__HMIVideoAnalyzerFrameResult_maxConfidenceEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "maxConfidenceEventForEventClass:", a2);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_frame;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE presentationTimeStamp](result, "presentationTimeStamp");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

+ (id)combineFrameResults:(id)a3 withResults:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMIVideoAnalyzerFrameResult *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  HMIVideoAnalyzerFrameResult *v29;
  void *v30;
  CMTime v32;
  CMTime time1;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  objc_msgSend(a3, "arrayByAddingObjectsFromArray:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v7 = 0;
    v8 = 1;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7, v32.value, *(_QWORD *)&v32.timescale, v32.epoch, time1.value, *(_QWORD *)&time1.timescale, time1.epoch);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9)
      {
        objc_msgSend(v9, "time");
        if (!v11)
          goto LABEL_7;
      }
      else
      {
        memset(&time1, 0, sizeof(time1));
        if (!v10)
        {
LABEL_7:
          memset(&v32, 0, sizeof(v32));
          goto LABEL_8;
        }
      }
      objc_msgSend(v11, "time");
LABEL_8:
      if (CMTimeCompare(&time1, &v32))
      {
        v7 = v8;
      }
      else
      {
        v12 = [HMIVideoAnalyzerFrameResult alloc];
        objc_msgSend(v9, "frame");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "events");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "events");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setByAddingObjectsFromSet:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "regionOfInterest");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        objc_msgSend(v11, "regionOfInterest");
        v36.origin.x = v25;
        v36.origin.y = v26;
        v36.size.width = v27;
        v36.size.height = v28;
        v34.origin.x = v18;
        v34.origin.y = v20;
        v34.size.width = v22;
        v34.size.height = v24;
        v35 = CGRectUnion(v34, v36);
        v29 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v12, "initWithFrame:events:regionOfInterest:", v13, v16, v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);

        objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v7, v29);
        objc_msgSend(v6, "removeObjectAtIndex:", v8);

      }
      v8 = v7 + 1;
    }
    while (v7 + 1 < (unint64_t)objc_msgSend(v6, "count"));
  }
  v30 = (void *)objc_msgSend(v6, "copy", v32.value, *(_QWORD *)&v32.timescale, v32.epoch);

  return v30;
}

BOOL __63__HMIVideoAnalyzerFrameResult_combineFrameResults_withResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  CMTime v9;
  CMTime time1;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (!v4)
  {
    memset(&time1, 0, sizeof(time1));
    if (v5)
      goto LABEL_3;
LABEL_5:
    memset(&v9, 0, sizeof(v9));
    goto LABEL_6;
  }
  objc_msgSend(v4, "time");
  if (!v6)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v6, "time");
LABEL_6:
  v7 = CMTimeCompare(&time1, &v9) > 0;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoAnalyzerFrameResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  HMIVideoAnalyzerFrameResult *v22;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_frame);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF20];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_events);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_regionOfInterest);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeRectForKey:", v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](self, "initWithFrame:events:regionOfInterest:", v7, v12, v15, v17, v19, v21);
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v4 = a3;
  -[HMIVideoAnalyzerFrameResult frame](self, "frame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_frame);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[HMIVideoAnalyzerFrameResult events](self, "events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_events);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[HMIVideoAnalyzerFrameResult regionOfInterest](self, "regionOfInterest");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  NSStringFromSelector(sel_regionOfInterest);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeRect:forKey:", v17, v10, v12, v14, v16);

}

- (HMIVideoFrame)frame
{
  return (HMIVideoFrame *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)events
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (CGRect)regionOfInterest
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_regionOfInterest, 32, 1, 0);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_frame, 0);
}

@end
