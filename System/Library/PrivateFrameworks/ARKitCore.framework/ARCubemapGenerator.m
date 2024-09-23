@implementation ARCubemapGenerator

- (ARCubemapGenerator)init
{
  ARCubemapGenerator *v2;
  uint64_t v3;
  ARGPUCubemapProjector *cubemapProjector;
  uint64_t v5;
  ARGPUWarper *gpuWarper;
  uint64_t v7;
  ARGPUCubemapConverter *cubemapConverter;
  uint64_t v9;
  ARGPUCubemapHistogram *cubemapHistogram;
  uint64_t v11;
  OS_dispatch_queue *cubemapQueue;
  ARCubemapGenerator *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ARCubemapGenerator;
  v2 = -[ARCubemapGenerator init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cubemapProjector = v2->_cubemapProjector;
    v2->_cubemapProjector = (ARGPUCubemapProjector *)v3;

    v5 = objc_opt_new();
    gpuWarper = v2->_gpuWarper;
    v2->_gpuWarper = (ARGPUWarper *)v5;

    v7 = objc_opt_new();
    cubemapConverter = v2->_cubemapConverter;
    v2->_cubemapConverter = (ARGPUCubemapConverter *)v7;

    v9 = objc_opt_new();
    cubemapHistogram = v2->_cubemapHistogram;
    v2->_cubemapHistogram = (ARGPUCubemapHistogram *)v9;

    if (!v2->_cubemapProjector || !v2->_gpuWarper)
    {
      v13 = 0;
      goto LABEL_7;
    }
    ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.environmentTexturing.cubeMap");
    v11 = objc_claimAutoreleasedReturnValue();
    cubemapQueue = v2->_cubemapQueue;
    v2->_cubemapQueue = (OS_dispatch_queue *)v11;

  }
  v13 = v2;
LABEL_7:

  return v13;
}

- (void)cubemapWithTransform:(__n128)a3 extent:(__n128)a4 lastHistogram:(__n128)a5 fromMeshes:(__n128)a6 cameraImage:(uint64_t)a7 cameraTransform:(const void *)a8 cameraIntrinsics:(void *)a9 cameraExposure:(__CVBuffer *)a10 cameraExposureOffset:(void *)a11 completionHandler:(uint64_t)a12
{
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  _QWORD block[4];
  __n128 v37;
  __n128 v38;
  __n128 v39;
  __n128 v40;
  __n128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint64_t v50;
  id v51;
  __CVBuffer *v52;
  uint64_t v53;
  int v54;
  _BYTE v55[1028];

  v26 = a9;
  v27 = a11;
  CVPixelBufferRetain(a10);
  v28 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __174__ARCubemapGenerator_cubemapWithTransform_extent_lastHistogram_fromMeshes_cameraImage_cameraTransform_cameraIntrinsics_cameraExposure_cameraExposureOffset_completionHandler___block_invoke;
  block[3] = &unk_1E6674750;
  v49 = v26;
  v50 = a1;
  v37 = a2;
  v38 = a3;
  v39 = a4;
  v40 = a5;
  v52 = a10;
  v54 = a22;
  v41 = a6;
  v42 = a18;
  v43 = a19;
  v44 = a20;
  v45 = a14;
  v46 = a15;
  v47 = a16;
  v48 = a17;
  memcpy(v55, a8, sizeof(v55));
  v51 = v27;
  v53 = a21;
  v29 = v27;
  v30 = v26;
  dispatch_async(v28, block);

}

void __174__ARCubemapGenerator_cubemapWithTransform_extent_lastHistogram_fromMeshes_cameraImage_cameraTransform_cameraIntrinsics_cameraExposure_cameraExposureOffset_completionHandler___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  int32x4_t v9;
  float32x4_t v10;
  __int128 v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  size_t Width;
  size_t Height;
  float32x2_t v32;
  float v33;
  float v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  uint64_t v38;
  int v39;
  double v40;
  float v41;
  float32x4_t v42;
  void *v43;
  void *v44;
  float v45;
  uint64_t v46;
  double v47;
  __n128 v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[1028];
  _BYTE v71[1028];
  _BYTE v72[1028];
  _BYTE __dst[1028];
  _BYTE v74[1028];
  float v75[260];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[1028];
  _OWORD v85[12];
  _QWORD *v86[3];
  id v87;
  _OWORD v88[12];
  _QWORD *v89[3];
  id v90;
  uint64_t v91;

  v0 = MEMORY[0x1E0C80A78]();
  v91 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)(v0 + 224));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARGPUCubemapProjector createCubemap:](ARGPUCubemapProjector, "createCubemap:", 256);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();
  objc_msgSend(*(id *)(*(_QWORD *)(v0 + 232) + 8), "projectToCube:transformWorldFromCube:meshes:blend:", v2, v1, 0, *(double *)(v0 + 32), *(double *)(v0 + 48), *(double *)(v0 + 64), *(double *)(v0 + 80));
  kdebug_trace();
  memset(v75, 0, 512);
  v3 = *(void **)(*(_QWORD *)(v0 + 232) + 24);
  if (v3)
  {
    objc_msgSend(v3, "colorHistogramForCubemap:", v2);
    if (v75[0] >= 0.083333)
      goto LABEL_15;
  }
  else
  {
    bzero(v75, 0x404uLL);
  }
  memset(&v84[200], 0, 24);
  *(_QWORD *)&v84[192] = &v84[200];
  ARCreateTexture(512);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)&v84[216];
  *(_QWORD *)&v84[216] = v4;

  v6 = 0;
  v7 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
  v8 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
  v10 = *(float32x4_t *)(v0 + 80);
  v9 = *(int32x4_t *)(v0 + 96);
  LODWORD(v11) = 0;
  DWORD1(v11) = vmuls_lane_f32(-0.5, *(float32x2_t *)v9.i8, 1);
  DWORD2(v11) = 0;
  HIDWORD(v11) = 1.0;
  v12 = *(float32x4_t *)(v0 + 32);
  v13 = *(float32x4_t *)(v0 + 48);
  v14 = *(float32x4_t *)(v0 + 64);
  v76 = *MEMORY[0x1E0C83FF0];
  v77 = v7;
  v78 = v8;
  v79 = v11;
  do
  {
    *(__int128 *)((char *)&v80 + v6) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v12, COERCE_FLOAT(*(__int128 *)((char *)&v76 + v6))), v13, *(float32x2_t *)((char *)&v76 + v6), 1), v14, *(float32x4_t *)((char *)&v76 + v6), 2), v10, *(float32x4_t *)((char *)&v76 + v6), 3);
    v6 += 16;
  }
  while (v6 != 64);
  *(_OWORD *)&v84[32] = v80;
  *(_OWORD *)&v84[48] = v81;
  *(_OWORD *)&v84[64] = v82;
  *(_OWORD *)&v84[80] = v83;
  v15 = (int32x4_t)vextq_s8((int8x16_t)v9, (int8x16_t)v9, 8uLL);
  *(int32x2_t *)v9.i8 = vzip1_s32(*(int32x2_t *)v9.i8, *(int32x2_t *)v15.i8);
  *(float32x2_t *)v15.i8 = vmul_f32(*(float32x2_t *)v9.i8, (float32x2_t)0x3F0000003F000000);
  v16 = vzip1q_s32(v15, v9);
  v16.i32[1] = 0;
  *(int32x4_t *)&v84[96] = v16;
  *(float32x2_t *)v9.i8 = vmul_f32(*(float32x2_t *)v9.i8, (float32x2_t)0xBF000000BF000000);
  v17 = vzip1q_s32(v9, v9);
  v17.i32[1] = 0;
  *(int32x4_t *)&v84[112] = v17;
  v18 = *(void **)(*(_QWORD *)(v0 + 232) + 32);
  v19 = *(_QWORD *)(v0 + 248);
  v20 = *(_DWORD *)(v0 + 264);
  v64 = *(_OWORD *)(v0 + 128);
  v67 = *(_OWORD *)(v0 + 112);
  v60 = *(_OWORD *)(v0 + 160);
  v61 = *(_OWORD *)(v0 + 144);
  v56 = *(_OWORD *)(v0 + 192);
  v58 = *(_OWORD *)(v0 + 176);
  v54 = *(_OWORD *)(v0 + 208);
  v88[7] = v17;
  v88[6] = v16;
  v88[5] = v83;
  v88[4] = v82;
  v88[3] = v81;
  v88[2] = v80;
  v88[1] = *(_OWORD *)&v84[16];
  v88[0] = *(_OWORD *)v84;
  v88[11] = *(_OWORD *)&v84[176];
  v88[10] = *(_OWORD *)&v84[160];
  v88[9] = *(_OWORD *)&v84[144];
  v88[8] = *(_OWORD *)&v84[128];
  std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v89, (uint64_t)&v84[192]);
  v90 = *(id *)&v84[216];
  LODWORD(v21) = v20;
  objc_msgSend(v18, "warpCameraImage:withExposureOffset:withCameraIntrinsics:withCameraTransform:toPlane:withLoadAction:synchronous:", v19, v88, 2, 1, v21, *(double *)&v67, *(double *)&v64, *(double *)&v61, *(double *)&v60, *(double *)&v58, *(double *)&v56, *(double *)&v54);

  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v89, v89[1]);
  convertToMesh((const ARTexturedPlane *)v84);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v22);

  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v84[192], *(_QWORD **)&v84[200]);
  memset(&v84[200], 0, 24);
  *(_QWORD *)&v84[192] = &v84[200];
  ARCreateTexture(512);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(void **)&v84[216];
  *(_QWORD *)&v84[216] = v23;

  v25 = 0;
  v26 = *(float32x4_t *)(v0 + 160);
  v27 = *(float32x4_t *)(v0 + 176);
  v28 = *(float32x4_t *)(v0 + 192);
  v29 = *(float32x4_t *)(v0 + 208);
  v76 = xmmword_1B3BDFDC0;
  v77 = xmmword_1B3BDFF70;
  v78 = xmmword_1B3BE00E0;
  v79 = xmmword_1B3C081B0;
  do
  {
    *(__int128 *)((char *)&v80 + v25) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v26, COERCE_FLOAT(*(__int128 *)((char *)&v76 + v25))), v27, *(float32x2_t *)((char *)&v76 + v25), 1), v28, *(float32x4_t *)((char *)&v76 + v25), 2), v29, *(float32x4_t *)((char *)&v76 + v25), 3);
    v25 += 16;
  }
  while (v25 != 64);
  *(_OWORD *)&v84[32] = v80;
  *(_OWORD *)&v84[48] = v81;
  *(_OWORD *)&v84[64] = v82;
  *(_OWORD *)&v84[80] = v83;
  Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(v0 + 248));
  Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(v0 + 248));
  v32 = ARCameraFieldOfViewFromIntrinsics(COERCE_FLOAT(*(_OWORD *)(v0 + 112)), *(double *)(v0 + 128), *(double *)(v0 + 144), (double)Width, (double)Height);
  v33 = fmaxf(v32.f32[0], v32.f32[1]);
  v34 = tanf(v33 * 0.5);
  DWORD1(v35) = 0;
  HIDWORD(v35) = 0;
  DWORD1(v36) = 0;
  HIDWORD(v36) = 0;
  *(float *)&v36 = v34 * 100.0;
  *((float *)&v36 + 2) = v34 * 100.0;
  *(_OWORD *)&v84[96] = v36;
  *(float *)&v35 = v34 * -100.0;
  *((float *)&v35 + 2) = v34 * -100.0;
  *(_OWORD *)&v84[112] = v35;
  v37 = *(void **)(*(_QWORD *)(v0 + 232) + 32);
  v38 = *(_QWORD *)(v0 + 248);
  v39 = *(_DWORD *)(v0 + 264);
  v65 = *(_OWORD *)(v0 + 128);
  v68 = *(_OWORD *)(v0 + 112);
  v59 = *(_OWORD *)(v0 + 160);
  v62 = *(_OWORD *)(v0 + 144);
  v55 = *(_OWORD *)(v0 + 192);
  v57 = *(_OWORD *)(v0 + 176);
  v53 = *(_OWORD *)(v0 + 208);
  v85[0] = *(_OWORD *)v84;
  v85[1] = *(_OWORD *)&v84[16];
  v85[3] = *(_OWORD *)&v84[48];
  v85[2] = *(_OWORD *)&v84[32];
  v85[7] = v35;
  v85[6] = v36;
  v85[5] = *(_OWORD *)&v84[80];
  v85[4] = *(_OWORD *)&v84[64];
  v85[11] = *(_OWORD *)&v84[176];
  v85[10] = *(_OWORD *)&v84[160];
  v85[9] = *(_OWORD *)&v84[144];
  v85[8] = *(_OWORD *)&v84[128];
  std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v86, (uint64_t)&v84[192]);
  v87 = *(id *)&v84[216];
  LODWORD(v40) = v39;
  objc_msgSend(v37, "warpCameraImage:withExposureOffset:withCameraIntrinsics:withCameraTransform:toPlane:withLoadAction:synchronous:", v38, v85, 2, 1, v40, *(double *)&v68, *(double *)&v65, *(double *)&v62, *(double *)&v59, *(double *)&v57, *(double *)&v55, *(double *)&v53);

  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v86, v86[1]);
  v41 = 2.6464 / v34;
  if (v33 >= 2.419)
    v41 = 1.0;
  *(float32x4_t *)&v84[96] = vmulq_n_f32(*(float32x4_t *)&v84[96], v41);
  *(float32x4_t *)&v84[112] = vmulq_n_f32(*(float32x4_t *)&v84[112], v41);
  v42 = vaddq_f32(*(float32x4_t *)(v0 + 80), *(float32x4_t *)&v84[80]);
  v42.i32[3] = *(_DWORD *)&v84[92];
  *(float32x4_t *)&v84[80] = v42;
  convertToMesh((const ARTexturedPlane *)v84);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v43);

  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v84[192], *(_QWORD **)&v84[200]);
  kdebug_trace();
  objc_msgSend(*(id *)(*(_QWORD *)(v0 + 232) + 8), "projectToCube:transformWorldFromCube:meshes:blend:", v2, v1, 0, *(double *)(v0 + 32), *(double *)(v0 + 48), *(double *)(v0 + 64), *(double *)(v0 + 80));
  kdebug_trace();
  v44 = *(void **)(*(_QWORD *)(v0 + 232) + 24);
  if (v44)
    objc_msgSend(v44, "colorHistogramForCubemap:", v2);
  else
    bzero(v84, 0x404uLL);
  memcpy(v75, v84, 0x404uLL);
LABEL_15:
  CVPixelBufferRelease(*(CVPixelBufferRef *)(v0 + 248));
  v45 = *(float *)(v0 + 268);
  if (v45 > 0.0)
  {
    if (v75[0] < (float)(v45 * 0.9))
    {
      v46 = *(_QWORD *)(v0 + 240);
      memcpy(v74, v75, sizeof(v74));
      (*(void (**)(uint64_t, _QWORD, _BYTE *))(v46 + 16))(v46, 0, v74);
LABEL_21:
      v50 = v2;
      goto LABEL_22;
    }
    memcpy(__dst, v75, sizeof(__dst));
    memcpy(v72, (const void *)(v0 + 268), sizeof(v72));
    if (AREarthMoversDistance((uint64_t)__dst, (uint64_t)v72, v47, v48) <= 0.15)
    {
      v52 = *(_QWORD *)(v0 + 240);
      memcpy(v71, v75, sizeof(v71));
      (*(void (**)(uint64_t, _QWORD, _BYTE *))(v52 + 16))(v52, 0, v71);
      goto LABEL_21;
    }
  }
  v66 = *(_OWORD *)(v0 + 48);
  v69 = *(_OWORD *)(v0 + 32);
  v63 = *(_OWORD *)(v0 + 64);
  +[ARCubemapCompletion sharedInstance](ARCubemapCompletion, "sharedInstance", v53, v55, v57, v59);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "completeCubemap:cameraExposure:rotationWorldFromCube:", v2, *(double *)(v0 + 256), *(double *)&v69, *(double *)&v66, *(double *)&v63);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  kdebug_trace();
  objc_msgSend(*(id *)(*(_QWORD *)(v0 + 232) + 8), "projectToCube:transformWorldFromCube:meshes:blend:", v50, v1, 1, *(double *)(v0 + 32), *(double *)(v0 + 48), *(double *)(v0 + 64), *(double *)(v0 + 80));
  kdebug_trace();
  v51 = *(_QWORD *)(v0 + 240);
  memcpy(v70, v75, sizeof(v70));
  (*(void (**)(uint64_t, void *, _BYTE *))(v51 + 16))(v51, v50, v70);
LABEL_22:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cubemapQueue, 0);
  objc_storeStrong((id *)&self->_gpuWarper, 0);
  objc_storeStrong((id *)&self->_cubemapHistogram, 0);
  objc_storeStrong((id *)&self->_cubemapConverter, 0);
  objc_storeStrong((id *)&self->_cubemapProjector, 0);
}

@end
