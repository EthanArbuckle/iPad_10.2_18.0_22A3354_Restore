@implementation JFXFaceTrackedEffectTransform

- (JFXFaceTrackedEffectTransform)initWithCameraProjection:(__n128)a3 cameraTransform:(__n128)a4 onFaceTransform:(__n128)a5 billboardTransform:(__n128)a6
{
  JFXFaceTrackedEffectTransform *v24;
  JFXFaceTrackedEffectTransform *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSDictionary *effectParametersForOnFaceTracking;
  uint64_t v36;
  NSDictionary *effectParametersForOnBillboardTracking;
  objc_super v47;
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[2];
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[6];

  v53[4] = *MEMORY[0x24BDAC8D0];
  v47.receiver = a1;
  v47.super_class = (Class)JFXFaceTrackedEffectTransform;
  v24 = -[JFXFaceTrackedEffectTransform init](&v47, sel_init);
  v25 = v24;
  if (v24)
  {
    *(__n128 *)v24->_anon_20 = a2;
    *(__n128 *)&v24->_anon_20[16] = a3;
    *(__n128 *)&v24->_anon_20[32] = a4;
    *(__n128 *)&v24->_anon_20[48] = a5;
    *(__n128 *)v24->_anon_60 = a6;
    *(__n128 *)&v24->_anon_60[16] = a7;
    *(__n128 *)&v24->_anon_60[32] = a8;
    *(__n128 *)&v24->_anon_60[48] = a9;
    *(_OWORD *)&v24[1].super.isa = a17;
    *(_OWORD *)&v24[1]._effectParametersForOnBillboardTracking = a18;
    *(_OWORD *)v24[1]._anon_20 = a19;
    *(_OWORD *)&v24[1]._anon_20[16] = a20;
    *(_OWORD *)v24->_anon_a0 = a21;
    *(_OWORD *)&v24->_anon_a0[16] = a22;
    *(_OWORD *)&v24->_anon_a0[32] = a23;
    *(_OWORD *)&v24->_anon_a0[48] = a24;
    objc_msgSend(MEMORY[0x24BE790A8], "matrixWithSIMDFloat4x4:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE790A8], "matrixWithSIMDFloat4x4:", a6.n128_f64[0], a7.n128_f64[0], a8.n128_f64[0], a9.n128_f64[0]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE790A8], "matrixWithSIMDFloat4x4:", *(double *)&a17, *(double *)&a18, *(double *)&a19, *(double *)&a20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE790A8], "matrixWithSIMDFloat4x4:", *(double *)&a21, *(double *)&a22, *(double *)&a23, *(double *)&a24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x24BE79590];
    v50[0] = *MEMORY[0x24BE79588];
    v30 = v50[0];
    v50[1] = v31;
    v53[0] = v26;
    v53[1] = v27;
    v33 = *MEMORY[0x24BE79578];
    v51 = *MEMORY[0x24BE796F0];
    v32 = v51;
    v52 = v33;
    v53[2] = v28;
    v53[3] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v50, 4);
    v34 = objc_claimAutoreleasedReturnValue();
    effectParametersForOnFaceTracking = v25->_effectParametersForOnFaceTracking;
    v25->_effectParametersForOnFaceTracking = (NSDictionary *)v34;

    v48[0] = v30;
    v48[1] = v31;
    v49[0] = v26;
    v49[1] = v27;
    v48[2] = v32;
    v48[3] = v33;
    v49[2] = v29;
    v49[3] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
    v36 = objc_claimAutoreleasedReturnValue();
    effectParametersForOnBillboardTracking = v25->_effectParametersForOnBillboardTracking;
    v25->_effectParametersForOnBillboardTracking = (NSDictionary *)v36;

  }
  return v25;
}

- (BOOL)isEqual:(id)a3 forTrackingType:(int64_t)a4
{
  JFXFaceTrackedEffectTransform *v6;
  JFXFaceTrackedEffectTransform *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  JFXFaceTrackedEffectTransform *v25;

  v6 = (JFXFaceTrackedEffectTransform *)a3;
  if (self == v6)
  {
    v10 = 1;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_18;
  }
  v7 = v6;
  if (a4 == 1)
  {
    -[JFXFaceTrackedEffectTransform effectParametersForOnFaceTracking](self, "effectParametersForOnFaceTracking");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXFaceTrackedEffectTransform effectParametersForOnFaceTracking](v7, "effectParametersForOnFaceTracking");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 2)
    {
      v8 = 0;
      v11 = 0;
      goto LABEL_11;
    }
    -[JFXFaceTrackedEffectTransform effectParametersForOnBillboardTracking](self, "effectParametersForOnBillboardTracking");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXFaceTrackedEffectTransform effectParametersForOnBillboardTracking](v7, "effectParametersForOnBillboardTracking");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;
LABEL_11:
  v12 = (void *)MEMORY[0x24BE790A8];
  v13 = *MEMORY[0x24BE79588];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE79588]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isMatrix:equivalentTo:", v14, v15))
  {
    v16 = (void *)MEMORY[0x24BE790A8];
    v17 = *MEMORY[0x24BE79590];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE79590]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isMatrix:equivalentTo:", v18, v19))
    {
      v20 = (void *)MEMORY[0x24BE790A8];
      v25 = v7;
      v21 = *MEMORY[0x24BE796F0];
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE796F0]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v20, "isMatrix:equivalentTo:", v22, v23);

      v7 = v25;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

LABEL_18:
  return v10;
}

- (void)transformForTrackingType:(uint64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      return (void *)objc_msgSend(result, "onFaceTransform");
    }
    else if (a3 == 2)
    {
      return (void *)objc_msgSend(result, "billboardTransform");
    }
  }
  return result;
}

- (id)effectParametersForTrackingType:(int64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[JFXFaceTrackedEffectTransform effectParametersForOnFaceTracking](self, "effectParametersForOnFaceTracking");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 2)
  {
    -[JFXFaceTrackedEffectTransform effectParametersForOnBillboardTracking](self, "effectParametersForOnBillboardTracking");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (__n128)cameraProjection
{
  return a1[2];
}

- (__n128)cameraTransform
{
  return a1[6];
}

- (__n128)billboardTransform
{
  return a1[10];
}

- (__n128)onFaceTransform
{
  return a1[14];
}

- (NSDictionary)effectParametersForOnFaceTracking
{
  return self->_effectParametersForOnFaceTracking;
}

- (NSDictionary)effectParametersForOnBillboardTracking
{
  return self->_effectParametersForOnBillboardTracking;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectParametersForOnBillboardTracking, 0);
  objc_storeStrong((id *)&self->_effectParametersForOnFaceTracking, 0);
}

@end
