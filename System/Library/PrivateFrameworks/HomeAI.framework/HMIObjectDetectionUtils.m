@implementation HMIObjectDetectionUtils

+ (void)nonMaximumSuppression:(id)a3 output:(id)a4 withThreshold:(double)a5 withMetric:(int64_t)a6
{
  void *v9;
  unint64_t v10;
  __CFBitVector *Mutable;
  __CFBitVector *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float *v20;
  float *v21;
  uint64_t i;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float v30;
  CFIndex v31;
  float *v32;
  unint64_t v33;
  double *v34;
  CFIndex v35;
  double *v36;
  float v37;
  float v38;
  float v39;
  void *v41;
  CFIndex v42;
  id v43;
  _QWORD *v44;
  void *v45;
  float *v46;

  v43 = a4;
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  Mutable = CFBitVectorCreateMutable(0, v10);
  CFBitVectorSetCount(Mutable, v10);
  CFBitVectorSetAllBits(Mutable, 1u);
  v12 = CFBitVectorCreateMutable(0, v10);
  CFBitVectorSetCount(v12, v10);
  v44 = malloc_type_malloc(32 * v10, 0x1000040E0EAB150uLL);
  if (v10)
  {
    v13 = 0;
    v14 = v44 + 2;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "boundingBox");
      *(v14 - 2) = v16;
      *(v14 - 1) = v17;
      *v14 = v18;
      v14[1] = v19;
      v14 += 4;

      ++v13;
    }
    while (v10 != v13);
  }
  if (a6 == 2)
  {
    v20 = (float *)malloc_type_malloc(4 * v10, 0x100004052888210uLL);
    v21 = (float *)malloc_type_malloc(4 * v10, 0x100004052888210uLL);
    if (v10)
    {
      for (i = 0; i != v10; ++i)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", i);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "confidence");
        *(float *)&v24 = v24;
        v20[i] = *(float *)&v24;

        objc_msgSend(v9, "objectAtIndexedSubscript:", i);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "boundingBox");
        v30 = HMICGRectArea(v26, v27, v28, v29);
        v21[i] = v30;

      }
      goto LABEL_10;
    }
  }
  else
  {
    v20 = 0;
    v21 = 0;
    if (v10)
    {
LABEL_10:
      v31 = 0;
      v45 = v9;
      v46 = v21;
      do
      {
        if (CFBitVectorGetBitAtIndex(Mutable, v31))
        {
          v32 = v20;
          CFBitVectorSetAllBits(v12, 0);
          v33 = v31 + 1;
          if (v31 + 1 < v10)
          {
            v34 = (double *)&v44[4 * v31];
            v35 = v31 + 1;
            v36 = (double *)&v44[4 * v31 + 7];
            while (!CFBitVectorGetBitAtIndex(Mutable, v35))
            {
LABEL_30:
              ++v35;
              v36 += 4;
              if (v10 == v35)
                goto LABEL_31;
            }
            if (a6 == 2)
            {
              HMICGRectIntersectionOverMinArea(*v34, v34[1], v34[2], v34[3], *(v36 - 3), *(v36 - 2), *(v36 - 1), *v36);
              v37 = v39;
              if (v39 > a5 && v32[v31] * 0.95 < v32[v35] && v46[v31] > v46[v35])
                CFBitVectorSetBitAtIndex(v12, v31, 1u);
            }
            else if (a6 == 1)
            {
              HMICGRectIntersectionOverMinArea(*v34, v34[1], v34[2], v34[3], *(v36 - 3), *(v36 - 2), *(v36 - 1), *v36);
LABEL_26:
              v37 = v38;
            }
            else
            {
              v37 = 0.0;
              if (!a6)
              {
                HMICGRectIntersectionOverUnion(*v34, v34[1], v34[2], v34[3], *(v36 - 3), *(v36 - 2), *(v36 - 1), *v36);
                goto LABEL_26;
              }
            }
            if (CFBitVectorGetBitAtIndex(v12, v31))
              goto LABEL_31;
            if (v37 > a5)
              CFBitVectorSetBitAtIndex(v12, v35, 1u);
            goto LABEL_30;
          }
LABEL_31:
          if (CFBitVectorGetBitAtIndex(v12, v31)
            || (objc_msgSend(v45, "objectAtIndexedSubscript:", v31),
                v41 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v43, "addObject:", v41),
                v41,
                v33 >= v10))
          {
            v20 = v32;
            v9 = v45;
            v21 = v46;
          }
          else
          {
            v42 = v33;
            v20 = v32;
            v9 = v45;
            v21 = v46;
            do
            {
              if (CFBitVectorGetBitAtIndex(v12, v42))
                CFBitVectorSetBitAtIndex(Mutable, v42, 0);
              ++v42;
            }
            while (v10 != v42);
          }
        }
        else
        {
          v33 = v31 + 1;
        }
        v31 = v33;
      }
      while (v33 != v10);
    }
  }
  CFRelease(Mutable);
  CFRelease(v12);
  free(v44);
  free(v20);
  free(v21);

}

BOOL __81__HMIObjectDetectionUtils_nonMaximumSuppression_output_withThreshold_withMetric___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "confidence");
  v6 = v5;
  objc_msgSend(v4, "confidence");
  v8 = v7;

  return v6 < v8;
}

+ (void)nmsMultiClass:(id)a3 output:(id)a4 nmsConfiguration:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v30 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v14, "labelIndex", v30));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v15);

        }
        objc_msgSend(v9, "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v14);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v11);
  }

  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = v9;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v8, "thresholdForLabel:", v25, v30);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v8, "metricForLabel:", v25);
        objc_msgSend(v20, "objectForKeyedSubscript:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "doubleValue");
        +[HMIObjectDetectionUtils nonMaximumSuppression:output:withThreshold:withMetric:](HMIObjectDetectionUtils, "nonMaximumSuppression:output:withThreshold:withMetric:", v28, v19, v27);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v22);
  }

  objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_93);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObjectsFromArray:", v29);

}

BOOL __65__HMIObjectDetectionUtils_nmsMultiClass_output_nmsConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "confidence");
  v6 = v5;
  objc_msgSend(v4, "confidence");
  v8 = v7;

  return v6 < v8;
}

+ (id)convertObjectDetections:(id)a3 cropRect:(CGRect)a4 originalImageSize:(CGSize)a5
{
  double height;
  double width;
  CGFloat v7;
  CGFloat v8;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGRect v20;

  height = a5.height;
  width = a5.width;
  v7 = a4.size.height;
  v8 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = v8;
  v20.size.height = v7;
  if (CGRectIsNull(v20))
  {
    v12 = v11;
  }
  else
  {
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, 1.0 / width, 1.0 / height);
    v17 = v19;
    CGAffineTransformTranslate(&v18, &v17, x, y);
    v19 = v18;
    v17 = v18;
    CGAffineTransformScale(&v18, &v17, v8, v7);
    v19 = v18;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __78__HMIObjectDetectionUtils_convertObjectDetections_cropRect_originalImageSize___block_invoke;
    v15[3] = &__block_descriptor_80_e28__16__0__HMIObjectDetection_8l;
    v16 = v18;
    objc_msgSend(v11, "na_map:", v15);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

HMIObjectDetection *__78__HMIObjectDetectionUtils_convertObjectDetections_cropRect_originalImageSize___block_invoke(_OWORD *a1, void *a2)
{
  id v3;
  HMIObjectDetection *v4;
  uint64_t v5;
  double v6;
  double v7;
  __int128 v8;
  double x;
  double y;
  double width;
  double height;
  void *v13;
  void *v14;
  HMIObjectDetection *v15;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;

  v3 = a2;
  v4 = [HMIObjectDetection alloc];
  v5 = objc_msgSend(v3, "labelIndex");
  objc_msgSend(v3, "confidence");
  v7 = v6;
  objc_msgSend(v3, "boundingBox");
  v8 = a1[3];
  *(_OWORD *)&v17.a = a1[2];
  *(_OWORD *)&v17.c = v8;
  *(_OWORD *)&v17.tx = a1[4];
  v19 = CGRectApplyAffineTransform(v18, &v17);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  objc_msgSend(v3, "yaw");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roll");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HMIObjectDetection initWithLabelIndex:confidence:boundingBox:yaw:roll:](v4, "initWithLabelIndex:confidence:boundingBox:yaw:roll:", v5, v13, v14, v7, x, y, width, height);
  return v15;
}

@end
