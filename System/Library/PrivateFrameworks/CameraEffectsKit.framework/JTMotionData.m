@implementation JTMotionData

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__JTMotionData_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, block);
  return (id)sharedInstance_sharedMotionData;
}

void __30__JTMotionData_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedMotionData;
  sharedInstance_sharedMotionData = (uint64_t)v1;

}

- (JTMotionData)init
{
  JTMotionData *v2;
  id v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JTMotionData;
  v2 = -[JTMotionData init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDC1400]);
    -[JTMotionData setMotionManager:](v2, "setMotionManager:", v3);
    objc_msgSend(v3, "setDeviceMotionUpdateInterval:", 0.0333333333);
    v4 = objc_alloc_init(MEMORY[0x24BDD1710]);
    objc_msgSend(v4, "setName:", CFSTR("motion queue"));
    -[JTMotionData setMotionQueue:](v2, "setMotionQueue:", v4);

  }
  return v2;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)getOrientation:(id)result
{
  if (result.var0 == 0.0 && result.var1 == 0.0 && result.var2 == 0.0 && result.var3 == 0.0)
  {
    *(_QWORD *)&result.var0 = getOrientation__previous_value_0;
    *(_QWORD *)&result.var1 = getOrientation__previous_value_1;
    *(_QWORD *)&result.var2 = getOrientation__previous_value_2;
    *(_QWORD *)&result.var3 = getOrientation__previous_value_3;
  }
  else
  {
    getOrientation__previous_value_0 = *(_QWORD *)&result.var0;
    getOrientation__previous_value_1 = *(_QWORD *)&result.var1;
    getOrientation__previous_value_2 = *(_QWORD *)&result.var2;
    getOrientation__previous_value_3 = *(_QWORD *)&result.var3;
  }
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)syntheticOrientation
{
  int v2;
  long double v3;
  float64x2_t v4;
  __double2 v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  double v16;
  double v17;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v2 = syntheticOrientation_i % 720;
  v3 = sin(((double)v2 / 719.0 + (double)v2 / 719.0) * 3.14159265);
  syntheticOrientation_i = v2 + 1;
  v5 = __sincos_stret(v3 * 1.57079633 * 0.5);
  v4.f64[0] = v5.__sinval;
  v6 = vmulq_n_f64((float64x2_t)xmmword_226AB71D0, v5.__sinval);
  *(_QWORD *)&v4.f64[0] = *(_OWORD *)&vmulq_f64(v4, (float64x2_t)0);
  v4.f64[1] = v5.__cosval;
  v7 = vnegq_f64(v6);
  v8 = (float64x2_t)vextq_s8((int8x16_t)v4, (int8x16_t)vnegq_f64(v4), 8uLL);
  v9 = (float64x2_t)vdupq_n_s64(0x3FE6839557CA3B94uLL);
  v10 = vmlaq_f64(vmulq_f64(v4, (float64x2_t)0), v9, v8);
  v11 = (float64x2_t)vdupq_n_s64(0x3FE6BD826298E569uLL);
  v12 = vmulq_f64(v4, v11);
  v13 = vmlaq_f64(vmulq_f64(v6, v11), (float64x2_t)0, (float64x2_t)vextq_s8((int8x16_t)v7, (int8x16_t)v6, 8uLL));
  v14 = vaddq_f64(vmlaq_f64(v12, (float64x2_t)0, v8), vmlaq_f64(vmulq_f64(v7, (float64x2_t)0), v9, (float64x2_t)vextq_s8((int8x16_t)v6, (int8x16_t)v7, 8uLL)));
  v15 = vaddq_f64(v13, v10);
  v16 = v15.f64[1];
  v17 = v14.f64[1];
  result.var2 = v14.f64[0];
  result.var0 = v15.f64[0];
  result.var3 = v17;
  result.var1 = v16;
  return result;
}

- (void)startMotion
{
  JTMotionData *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  CMAttitude *refAttitude;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v2 = self;
  objc_sync_enter(v2);
  v2->_started = 1;
  -[JTMotionData motionManager](v2, "motionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceMotion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attitude");
  v5 = objc_claimAutoreleasedReturnValue();
  refAttitude = v2->_refAttitude;
  v2->_refAttitude = (CMAttitude *)v5;

  -[JTMotionData motionManager](v2, "motionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[JTMotionData motionQueue](v2, "motionQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __27__JTMotionData_startMotion__block_invoke;
  v9[3] = &unk_24EE593A0;
  v9[4] = v2;
  objc_msgSend(v7, "startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:", 4, v8, v9);

  objc_sync_exit(v2);
}

void __27__JTMotionData_startMotion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float64x2_t v17;
  double v18;
  double v19;
  float64x2_t v20;
  double v21;
  int8x16_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  double v28;
  double v29;
  double v30;
  long double v31;
  double v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  __double2 v50;
  float64x2_t v51;
  __double2 v52;
  int8x16_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  int8x16_t v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  double v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  double v97;
  id v98;

  v98 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  objc_msgSend(v98, "attitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "quaternion");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "getOrientation:", v9, v11, v13, v15);
  v17.f64[0] = v16;
  v17.f64[1] = v18;
  v20.f64[0] = v19;
  v20.f64[1] = v21;
  v22 = (int8x16_t)vnegq_f64(v20);
  v23 = vmulq_f64(v17, (float64x2_t)xmmword_226AB7430);
  v87 = vmulq_f64(v20, (float64x2_t)0);
  v88 = vmulq_f64(v23, (float64x2_t)0);
  v90 = (float64x2_t)vextq_s8(v22, (int8x16_t)v20, 8uLL);
  v92 = (float64x2_t)vextq_s8((int8x16_t)v23, (int8x16_t)vnegq_f64(v23), 8uLL);
  v86 = (float64x2_t)vextq_s8((int8x16_t)v20, v22, 8uLL);
  v24 = vaddq_f64(v86, vmlaq_f64(v88, (float64x2_t)0, v92));
  v25 = vaddq_f64(v92, vmlaq_f64(v87, (float64x2_t)0, v90));
  v26 = vnegq_f64(v24);
  v27 = (float64x2_t)vextq_s8((int8x16_t)v25, (int8x16_t)vnegq_f64(v25), 8uLL);
  v95 = *(_QWORD *)&v19;
  v96 = v21;
  v97 = v18;
  v94 = *(_QWORD *)&v16;
  v83 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v25, v18), v27, v16), vmlaq_n_f64(vmulq_n_f64(v26, v21), (float64x2_t)vextq_s8((int8x16_t)v24, (int8x16_t)v26, 8uLL), v19));
  v84 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v24, v18), (float64x2_t)vextq_s8((int8x16_t)v26, (int8x16_t)v24, 8uLL), v16), vmlaq_n_f64(vmulq_n_f64(v25, v21), v27, v19));
  v28 = v83.f64[0] + vaddvq_f64(vmulq_f64(v84, (float64x2_t)0));
  if (v28 <= 1.0)
    v29 = v28;
  else
    v29 = 1.0;
  if (v28 >= -1.0)
    v30 = v29;
  else
    v30 = -1.0;
  v31 = acos(v30);
  v32 = 0.0;
  if (v31 > 0.00001)
  {
    v33 = vmulq_f64(v83, (float64x2_t)0);
    v34 = vmulq_f64(v84, (float64x2_t)xmmword_226AB71E0);
    v34.f64[0] = v33.f64[0] + vaddvq_f64(v34);
    v33.f64[0] = v33.f64[0] + vaddvq_f64(vmulq_f64(v84, (float64x2_t)xmmword_226AB71D0));
    v35 = vmulq_f64(v33, (float64x2_t)0);
    v36 = vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_226AB71D0, v33.f64[0]), (float64x2_t)xmmword_226AB71E0, v34.f64[0]);
    v37 = vmlaq_f64(v35, (float64x2_t)0, v34);
    v38 = vmulq_f64(v37, v37);
    v38.f64[0] = 1.0 / sqrt(v38.f64[0] + vaddvq_f64(vmulq_f64(v36, v36)));
    v85 = vmulq_n_f64(v36, v38.f64[0]);
    v82 = vmulq_f64(vmulq_f64(v37, v38), (float64x2_t)0);
    v39 = v82.f64[0] + vaddvq_f64(vmulq_f64(v85, (float64x2_t)xmmword_226AB71E0));
    if (v39 <= 1.0)
      v40 = v39;
    else
      v40 = 1.0;
    if (v39 >= -1.0)
      v41 = v40;
    else
      v41 = -1.0;
    v42 = acos(v41);
    if (v82.f64[0] + vaddvq_f64(vmulq_f64(v85, (float64x2_t)xmmword_226AB71D0)) < 0.0)
      v42 = 6.28318531 - v42;
    v32 = v42 + 1.57079633;
  }
  v43 = fmod(v32, 6.28318531);
  if (v32 < 0.0)
    v43 = v43 + 6.28318531;
  objc_msgSend(*(id *)(a1 + 32), "setYawRadians:", v43, *(_OWORD *)&v82);
  v44 = (float64x2_t)vdupq_lane_s64(v95, 0);
  v45 = (float64x2_t)vdupq_lane_s64(v94, 0);
  v46 = vmlaq_f64(vaddq_f64(v90, v87), (float64x2_t)0, v92);
  v47 = vmlaq_f64(vaddq_f64(v92, v88), (float64x2_t)0, v86);
  v48 = vnegq_f64(v47);
  v49 = (float64x2_t)vextq_s8((int8x16_t)v46, (int8x16_t)vnegq_f64(v46), 8uLL);
  v91 = vaddq_f64(vmlaq_f64(vmulq_n_f64(v47, v97), (float64x2_t)vextq_s8((int8x16_t)v48, (int8x16_t)v47, 8uLL), v45), vmlaq_f64(vmulq_n_f64(v46, v96), v49, v44));
  v93 = vaddq_f64(vmlaq_f64(vmulq_n_f64(v46, v97), v49, v45), vmlaq_f64(vmulq_n_f64(v48, v96), (float64x2_t)vextq_s8((int8x16_t)v47, (int8x16_t)v48, 8uLL), v44));
  v50 = __sincos_stret(v32 * 0.5);
  v89 = vmulq_n_f64((float64x2_t)0, v50.__sinval);
  v52 = __sincos_stret(v31 * 0.5);
  v51.f64[0] = v52.__sinval;
  v53.i64[0] = *(_OWORD *)&vmulq_f64(v51, (float64x2_t)0);
  v53.i64[1] = *(_QWORD *)&v52.__cosval;
  v54 = vmulq_n_f64((float64x2_t)xmmword_226AB71E0, v52.__sinval);
  v55 = vnegq_f64(v54);
  v56 = (float64x2_t)vextq_s8(v53, (int8x16_t)vnegq_f64((float64x2_t)v53), 8uLL);
  v57 = vmlaq_n_f64(vmulq_n_f64(v54, v50.__cosval), (float64x2_t)vextq_s8((int8x16_t)v55, (int8x16_t)v54, 8uLL), v50.__sinval);
  v58 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)v53, v50.__cosval), v56, v50.__sinval), vmlaq_n_f64(vmulq_laneq_f64(v55, v89, 1), (float64x2_t)vextq_s8((int8x16_t)v54, (int8x16_t)v55, 8uLL), v89.f64[0]));
  v59 = vaddq_f64(v57, vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)v53, v89, 1), v56, v89.f64[0]));
  v60 = (int8x16_t)vnegq_f64(v59);
  v61 = vmulq_f64(v58, (float64x2_t)xmmword_226AB7430);
  v62 = (float64x2_t)vextq_s8((int8x16_t)v59, v60, 8uLL);
  v63 = (float64x2_t)vextq_s8((int8x16_t)v61, (int8x16_t)vnegq_f64(v61), 8uLL);
  v64 = (float64x2_t)vextq_s8(v60, (int8x16_t)v59, 8uLL);
  v65 = vmulq_f64(v61, (float64x2_t)0);
  v66 = vmlaq_f64(vmlaq_f64(v59, (float64x2_t)0, v64), (float64x2_t)0, v63);
  v67 = vmlaq_f64(vmlaq_f64(v61, (float64x2_t)0, v63), (float64x2_t)0, v62);
  v68 = vnegq_f64(v67);
  v69 = (float64x2_t)vextq_s8((int8x16_t)v66, (int8x16_t)vnegq_f64(v66), 8uLL);
  v70 = vmulq_f64(v93, vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v66, v58, 1), v69, v58.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v68, v59, 1), (float64x2_t)vextq_s8((int8x16_t)v67, (int8x16_t)v68, 8uLL), v59.f64[0]))).f64[0]+ vaddvq_f64(vmulq_f64(v91, vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v67, v58, 1), (float64x2_t)vextq_s8((int8x16_t)v68, (int8x16_t)v67, 8uLL), v58.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v66, v59, 1), v69, v59.f64[0]))));
  v71 = vmlaq_f64(vaddq_f64(v64, vmulq_f64(v59, (float64x2_t)0)), (float64x2_t)0, v63);
  v72 = vmlaq_f64(vaddq_f64(v63, v65), (float64x2_t)0, v62);
  v73 = vnegq_f64(v72);
  v74 = (float64x2_t)vextq_s8((int8x16_t)v71, (int8x16_t)vnegq_f64(v71), 8uLL);
  v75 = vmulq_f64(v93, vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v71, v58, 1), v74, v58.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v73, v59, 1), (float64x2_t)vextq_s8((int8x16_t)v72, (int8x16_t)v73, 8uLL), v59.f64[0]))).f64[0]+ vaddvq_f64(vmulq_f64(v91, vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v72, v58, 1), (float64x2_t)vextq_s8((int8x16_t)v73, (int8x16_t)v72, 8uLL), v58.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v71, v59, 1), v74, v59.f64[0]))));
  v76 = 1.0;
  if (v75 <= 1.0)
    v76 = v75;
  if (v75 >= -1.0)
    v77 = v76;
  else
    v77 = -1.0;
  v78 = acos(v77);
  if (v70 <= 0.0)
    v79 = v78;
  else
    v79 = -v78;
  v80 = fmod(v79, 6.28318531);
  if (v79 < 0.0)
    v80 = v80 + 6.28318531;
  objc_msgSend(*(id *)(a1 + 32), "setRollRadians:", v80);
  v81 = fmod(v31, 6.28318531);
  if (v31 < 0.0)
    v81 = v81 + 6.28318531;
  objc_msgSend(*(id *)(a1 + 32), "setPitchRadians:", v81);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentAttitude:", *(double *)&v95, v96, *(double *)&v94, v97);
  objc_sync_exit(v6);

}

- (void)stopMotion
{
  JTMotionData *v2;
  void *v3;
  JTMotionData *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_started)
  {
    -[JTMotionData motionManager](obj, "motionManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopDeviceMotionUpdates");

    v2 = obj;
  }
  objc_sync_exit(v2);

}

- ($01BB1521EC52D44A8E7628F5261DCEC8)currentOrientation
{
  JTMotionData *v2;
  double x;
  double y;
  double z;
  double w;
  double v7;
  double v8;
  double v9;
  double v10;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v2 = self;
  objc_sync_enter(v2);
  x = v2->_currentAttitude.x;
  y = v2->_currentAttitude.y;
  z = v2->_currentAttitude.z;
  w = v2->_currentAttitude.w;
  objc_sync_exit(v2);

  v7 = x;
  v8 = y;
  v9 = z;
  v10 = w;
  result.var3 = v10;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (double)yawRadians
{
  JTMotionData *v2;
  double yawRadians;

  v2 = self;
  objc_sync_enter(v2);
  yawRadians = v2->_yawRadians;
  objc_sync_exit(v2);

  return yawRadians;
}

- (double)rollRadians
{
  JTMotionData *v2;
  double rollRadians;

  v2 = self;
  objc_sync_enter(v2);
  rollRadians = v2->_rollRadians;
  objc_sync_exit(v2);

  return rollRadians;
}

- (double)pitchRadians
{
  JTMotionData *v2;
  double pitchRadians;

  v2 = self;
  objc_sync_enter(v2);
  pitchRadians = v2->_pitchRadians;
  objc_sync_exit(v2);

  return pitchRadians;
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionManager, a3);
}

- (NSOperationQueue)motionQueue
{
  return self->_motionQueue;
}

- (void)setMotionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_motionQueue, a3);
}

- (CMAttitude)refAttitude
{
  return self->_refAttitude;
}

- (void)setRefAttitude:(id)a3
{
  objc_storeStrong((id *)&self->_refAttitude, a3);
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)currentAttitude
{
  double x;
  double y;
  double z;
  double w;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  x = self->_currentAttitude.x;
  y = self->_currentAttitude.y;
  z = self->_currentAttitude.z;
  w = self->_currentAttitude.w;
  result.var3 = w;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setCurrentAttitude:(id)a3
{
  self->_currentAttitude = ($BD458D890A0AD74B3ABF726E1329EF14)a3;
}

- (void)setYawRadians:(double)a3
{
  self->_yawRadians = a3;
}

- (void)setRollRadians:(double)a3
{
  self->_rollRadians = a3;
}

- (void)setPitchRadians:(double)a3
{
  self->_pitchRadians = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refAttitude, 0);
  objc_storeStrong((id *)&self->_motionQueue, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end
