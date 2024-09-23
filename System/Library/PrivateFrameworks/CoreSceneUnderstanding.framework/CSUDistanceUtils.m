@implementation CSUDistanceUtils

+ (void)computeCosineDistanceFromBuffer:(id)a3 FromArray:(id)a4 distanceComputed:(float *)a5 error:(id *)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  id *v19;
  float *v20;
  uint64_t v21;
  float *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  float *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  float *v30;
  uint64_t v31;
  int v32;

  v9 = a4;
  v29 = 0;
  v30 = (float *)&v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = (float *)&v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = (float *)&v21;
  v23 = 0x2020000000;
  v24 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_239FF8224;
  v14[3] = &unk_250B0E188;
  v19 = a6;
  v20 = a5;
  v10 = v9;
  v15 = v10;
  v16 = &v29;
  v17 = &v25;
  v18 = &v21;
  objc_msgSend_accessDataUsingBlock_(a3, v11, (uint64_t)v14, v12, v13);
  if (!a6 || !*a6)
    *a5 = 1.0 - (float)(v30[6] / (float)(sqrtf(v26[6]) * sqrtf(v22[6])));

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

}

+ (void)computeL1DistanceFromBuffer:(id)a3 FromArray:(id)a4 distanceComputed:(float *)a5 error:(id *)a6 withDistanceType:(int64_t)a7
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  id *v22;
  float *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  float *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  float *v34;
  uint64_t v35;
  int v36;

  v11 = a4;
  v33 = 0;
  v34 = (float *)&v33;
  v35 = 0x2020000000;
  v36 = -971227136;
  v29 = 0;
  v30 = (float *)&v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_239FF852C;
  v17[3] = &unk_250B0E1B0;
  v19 = &v25;
  v22 = a6;
  v23 = a5;
  v12 = v11;
  v18 = v12;
  v20 = &v29;
  v21 = &v33;
  v24 = a7;
  objc_msgSend_accessDataUsingBlock_(a3, v13, (uint64_t)v17, v14, v15);
  if (!a6 || !*a6)
  {
    if (a7 == 1)
      v16 = v30[6] / ((double)(unint64_t)v26[3] + 0.0001);
    else
      v16 = v34[6];
    *a5 = v16;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

}

@end
