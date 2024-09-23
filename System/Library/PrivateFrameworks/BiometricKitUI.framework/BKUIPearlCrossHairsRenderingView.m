@implementation BKUIPearlCrossHairsRenderingView

- (BKUIPearlCrossHairsRenderingView)initWithFrame:(CGRect)a3 device:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  BKUIPearlCrossHairsRenderingView *v10;
  dispatch_semaphore_t v11;
  OS_dispatch_semaphore *inFlightSemaphore;
  uint64_t v13;
  MTLCommandQueue *commandQueue;
  id v15;
  double v21;
  double v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  BKUIPearlCrossHairsManager *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v42;
  id v43;
  double v44;
  void *v45;
  id v46;
  double v47;
  void *v48;
  id v49;
  double v50;
  void *v51;
  id v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  void *v76;
  uint64_t v78;
  float32x4_t v79;
  double v80;
  float32x4_t v81;
  double v82;
  void *v83;
  float32x4_t v84;
  double v85;
  __int128 v86;
  float32x4_t v87;
  double v88;
  objc_super v89;
  _OWORD v90[4];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _OWORD v95[6];
  _OWORD v96[6];
  _OWORD v97[6];
  _OWORD v98[6];
  _OWORD v99[6];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  int v107;
  uint64_t v108;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v108 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v89.receiver = self;
  v89.super_class = (Class)BKUIPearlCrossHairsRenderingView;
  v10 = -[MTKView initWithFrame:device:](&v89, sel_initWithFrame_device_, v9, x, y, width, height);
  if (v10)
  {
    v11 = dispatch_semaphore_create(3);
    inFlightSemaphore = v10->_inFlightSemaphore;
    v10->_inFlightSemaphore = (OS_dispatch_semaphore *)v11;

    v10->_time = CACurrentMediaTime();
    v13 = objc_msgSend(v9, "newCommandQueue");
    commandQueue = v10->_commandQueue;
    v10->_commandQueue = (MTLCommandQueue *)v13;

    -[MTLCommandQueue setLabel:](v10->_commandQueue, "setLabel:", CFSTR("Crosshairs Command Queue"));
    v107 = 0;
    v106 = 0;
    v15 = objc_alloc(MEMORY[0x1E0D02878]);
    __asm { FMOV            V0.4S, #1.0 }
    v100 = _Q0;
    v21 = *(double *)&_Q0;
    v86 = _Q0;
    v101 = 0uLL;
    LODWORD(_Q0) = 2.5;
    LODWORD(v22) = 1126247083;
    v23 = (void *)objc_msgSend(v15, "initWithStrokeWeight:radius:scale:rotation:translation:", &v100, *(double *)&_Q0, v22, v21, 0.0);
    v24 = objc_alloc(MEMORY[0x1E0D02878]);
    v100 = v86;
    v101 = 0uLL;
    LODWORD(v25) = 1112014848;
    LODWORD(v26) = 4.0;
    v27 = objc_msgSend(v24, "initWithStrokeWeight:radius:scale:rotation:translation:", &v100, v26, v25);
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02860]), "initWithDefaultPath:", v23);
    -[BKUIPearlCrossHairsRenderingView setCrosshairsPathCollection:](v10, "setCrosshairsPathCollection:", v28);

    -[BKUIPearlCrossHairsRenderingView crosshairsPathCollection](v10, "crosshairsPathCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = (void *)v27;
    objc_msgSend(v29, "setPath:forKey:", v27, CFSTR("small"));

    v10->_pathBlendDest = 0.0;
    v10->_pathBlend = 0.0;
    v30 = objc_alloc_init(BKUIPearlCrossHairsManager);
    -[BKUIPearlCrossHairsRenderingView setCrosshairsInstanceManager:](v10, "setCrosshairsInstanceManager:", v30);

    -[BKUIPearlCrossHairsRenderingView crosshairsPathCollection](v10, "crosshairsPathCollection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "defaultPath");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "clearInstances");

    -[BKUIPearlCrossHairsRenderingView crosshairsPathCollection](v10, "crosshairsPathCollection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "defaultPath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCrossHairsRenderingView crosshairsInstanceManager](v10, "crosshairsInstanceManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "instanceData");
    -[BKUIPearlCrossHairsRenderingView crosshairsInstanceManager](v10, "crosshairsInstanceManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "springInstances");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "appendInstances:count:", v36, objc_msgSend(v38, "count"));

    v39 = objc_alloc(MEMORY[0x1E0D02870]);
    -[BKUIPearlCrossHairsRenderingView crosshairsPathCollection](v10, "crosshairsPathCollection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    __asm { FMOV            V9.2S, #1.0 }
    v42 = (void *)objc_msgSend(v39, "initWithCollection:device:viewRatio:", v40, v9, _D9);
    -[BKUIPearlCrossHairsRenderingView setCrosshairsData:](v10, "setCrosshairsData:", v42);

    v100 = 0u;
    v101 = 0u;
    v102 = xmmword_1DB2DF8E0;
    v103 = xmmword_1DB2DF8E0;
    v104 = xmmword_1DB2DF8F0;
    v105 = xmmword_1DB2DF8F0;
    memset(v99, 0, 32);
    v99[2] = xmmword_1DB2DF900;
    v99[3] = xmmword_1DB2DF900;
    v99[4] = xmmword_1DB2DF910;
    v99[5] = xmmword_1DB2DF910;
    memset(v98, 0, 32);
    v98[2] = xmmword_1DB2DF910;
    v98[3] = xmmword_1DB2DF910;
    v98[4] = xmmword_1DB2DF920;
    v98[5] = xmmword_1DB2DF920;
    memset(v97, 0, 32);
    v97[2] = xmmword_1DB2DF910;
    v97[3] = xmmword_1DB2DF910;
    v97[4] = xmmword_1DB2DF930;
    v97[5] = xmmword_1DB2DF930;
    v96[0] = xmmword_1DB2DF380;
    v96[1] = xmmword_1DB2DF380;
    v96[2] = xmmword_1DB2DF380;
    v96[3] = xmmword_1DB2DF380;
    v96[4] = xmmword_1DB2DF380;
    v96[5] = xmmword_1DB2DF380;
    v95[0] = xmmword_1DB2DF940;
    v95[1] = xmmword_1DB2DF940;
    v95[2] = xmmword_1DB2DF940;
    v95[3] = xmmword_1DB2DF940;
    v95[4] = xmmword_1DB2DF940;
    v95[5] = xmmword_1DB2DF940;
    v43 = objc_alloc(MEMORY[0x1E0D02868]);
    v91 = v86;
    v92 = 0uLL;
    LODWORD(v44) = 4.0;
    v45 = (void *)objc_msgSend(v43, "initWithPoints:colors:count:strokeWeight:pattern:rotation:scale:translation:", &v100, v96, 6, 0, &v91, v44);
    v46 = objc_alloc(MEMORY[0x1E0D02868]);
    v91 = v86;
    LODWORD(v92) = 0;
    *(_QWORD *)((char *)&v92 + 4) = v106;
    HIDWORD(v92) = v107;
    LODWORD(v47) = 4.0;
    v48 = (void *)objc_msgSend(v46, "initWithPoints:colors:count:strokeWeight:pattern:rotation:scale:translation:", v99, v95, 6, 0, &v91, v47);
    v49 = objc_alloc(MEMORY[0x1E0D02868]);
    v91 = v86;
    LODWORD(v92) = 0;
    *(_QWORD *)((char *)&v92 + 4) = v106;
    HIDWORD(v92) = v107;
    LODWORD(v50) = 4.0;
    v51 = (void *)objc_msgSend(v49, "initWithPoints:colors:count:strokeWeight:pattern:rotation:scale:translation:", v98, v95, 6, 0, &v91, v50);
    v52 = objc_alloc(MEMORY[0x1E0D02868]);
    v91 = v86;
    LODWORD(v92) = 0;
    *(_QWORD *)((char *)&v92 + 4) = v106;
    HIDWORD(v92) = v107;
    LODWORD(v53) = 4.0;
    v54 = (void *)objc_msgSend(v52, "initWithPoints:colors:count:strokeWeight:pattern:rotation:scale:translation:", v97, v95, 6, 0, &v91, v53);
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02860]), "initWithDefaultPath:", v54);
    -[BKUIPearlCrossHairsRenderingView setCheckMarkPathCollection:](v10, "setCheckMarkPathCollection:", v55);

    -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](v10, "checkMarkPathCollection");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setPath:forKey:", v51, CFSTR("half1"));

    -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](v10, "checkMarkPathCollection");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setPath:forKey:", v48, CFSTR("half0"));

    -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](v10, "checkMarkPathCollection");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setPath:forKey:", v45, CFSTR("none"));

    v59 = objc_alloc(MEMORY[0x1E0D02870]);
    -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](v10, "checkMarkPathCollection");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v59, "initWithCollection:device:viewRatio:", v60, v9, _D9);
    -[BKUIPearlCrossHairsRenderingView setCheckMarkData:](v10, "setCheckMarkData:", v61);

    v62 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[BKUIPearlCrossHairsRenderingView checkMarkData](v10, "checkMarkData");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCrossHairsRenderingView crosshairsData](v10, "crosshairsData");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(v62, "initWithObjects:", v63, v64, 0);

    v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02880]), "initWithMTKView:dataCollection:", v10, v65);
    -[BKUIPearlCrossHairsRenderingView setRenderer:](v10, "setRenderer:", v66);

    matrix_ortho();
    v84 = v68;
    v87 = v67;
    v79 = v70;
    v81 = v69;
    LODWORD(v78) = 0;
    matrix_look_at();
    v71 = 0;
    v90[0] = v72;
    v90[1] = v73;
    v90[2] = v74;
    v90[3] = v75;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    do
    {
      *(__int128 *)((char *)&v91 + v71 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v87, COERCE_FLOAT(v90[v71])), v84, *(float32x2_t *)&v90[v71], 1), v81, (float32x4_t)v90[v71], 2), v79, (float32x4_t)v90[v71], 3);
      ++v71;
    }
    while (v71 != 4);
    v85 = *(double *)&v93;
    v88 = *(double *)&v94;
    v80 = *(double *)&v91;
    v82 = *(double *)&v92;
    -[BKUIPearlCrossHairsRenderingView renderer](v10, "renderer", v78);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setProjectionMatrix:", v80, v82, v85, v88);

  }
  return v10;
}

- (void)setGrayscale:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[BKUIPearlCrossHairsRenderingView crosshairsInstanceManager](self, "crosshairsInstanceManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGrayscale:", v3);

}

- (BOOL)grayscale
{
  void *v2;
  char v3;

  -[BKUIPearlCrossHairsRenderingView crosshairsInstanceManager](self, "crosshairsInstanceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "grayscale");

  return v3;
}

- (void)setSampleCount:(unint64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlCrossHairsRenderingView;
  -[MTKView setSampleCount:](&v5, sel_setSampleCount_, a3);
  -[BKUIPearlCrossHairsRenderingView renderer](self, "renderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createPipelineStates");

}

- (void)setAxis:(BOOL)a3 animated:
{
  __int128 v3;
  _BOOL4 v4;
  void *v6;
  __int128 v7;
  id v8;

  v4 = a3;
  *(_OWORD *)self->_axis = v3;
  -[BKUIPearlCrossHairsRenderingView crosshairsInstanceManager](self, "crosshairsInstanceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)self->_axis;
  v8 = v6;
  if (v4)
    objc_msgSend(v6, "setTarget:", *(double *)&v7);
  else
    objc_msgSend(v6, "setValue:", *(double *)&v7);

}

- (void)setState:(unint64_t)a3
{
  void *v5;
  float v6;

  if (a3 == 1)
  {
    -[BKUIPearlCrossHairsRenderingView crosshairsInstanceManager](self, "crosshairsInstanceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSpringsStates:", 1);
    v6 = 1.0;
    goto LABEL_5;
  }
  if (!a3)
  {
    -[BKUIPearlCrossHairsRenderingView crosshairsInstanceManager](self, "crosshairsInstanceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSpringsStates:", 0);
    v6 = 0.0;
LABEL_5:

    self->_pathBlendDest = v6;
  }
  self->_state = a3;
}

- (unint64_t)getState
{
  return self->_state;
}

- (void)drawRect:(CGRect)a3
{
  NSObject *inFlightSemaphore;
  dispatch_time_t v5;
  void *v6;
  float pathBlend;
  float pathBlendDest;
  float v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  float v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  _QWORD v49[5];
  OS_dispatch_semaphore *v50;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)BKUIPearlCrossHairsRenderingView;
  -[BKUIPearlCrossHairsRenderingView drawRect:](&v51, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  inFlightSemaphore = self->_inFlightSemaphore;
  v5 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(inFlightSemaphore, v5))
    return;
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLabel:", CFSTR("Crosshairs Command Buffer"));
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy_;
  v49[4] = __Block_byref_object_dispose_;
  v50 = self->_inFlightSemaphore;
  v48[1] = 3221225472;
  v48[2] = __45__BKUIPearlCrossHairsRenderingView_drawRect___block_invoke;
  v48[3] = &unk_1EA280720;
  v48[4] = v49;
  v47 = v6;
  v48[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v6, "addCompletedHandler:", v48);
  pathBlend = self->_pathBlend;
  pathBlendDest = self->_pathBlendDest;
  v9 = pathBlend
     + (float)(pathBlendDest - pathBlend)
     * (6.0
      / (double)-[MTKView preferredFramesPerSecond](self, "preferredFramesPerSecond"));
  self->_pathBlend = v9;
  -[BKUIPearlCrossHairsRenderingView crosshairsInstanceManager](self, "crosshairsInstanceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTarget:", *(double *)self->_axis);

  -[BKUIPearlCrossHairsRenderingView crosshairsInstanceManager](self, "crosshairsInstanceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "update:", CACurrentMediaTime() - self->_time);

  self->_time = CACurrentMediaTime();
  -[BKUIPearlCrossHairsRenderingView crosshairsData](self, "crosshairsData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCrossHairsRenderingView crosshairsInstanceManager](self, "crosshairsInstanceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "instanceData");
  -[BKUIPearlCrossHairsRenderingView crosshairsInstanceManager](self, "crosshairsInstanceManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "springInstances");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateInstanceBufferWithData:count:", v14, objc_msgSend(v16, "count"));

  -[BKUIPearlCrossHairsRenderingView crosshairsData](self, "crosshairsData");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCrossHairsRenderingView crosshairsPathCollection](self, "crosshairsPathCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCrossHairsRenderingView crosshairsPathCollection](self, "crosshairsPathCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "defaultPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCrossHairsRenderingView crosshairsPathCollection](self, "crosshairsPathCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "paths");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("small"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v23 = self->_pathBlend;
  v24 = objc_msgSend(v17, "blendPath:withPath:byAmount:", v19, v22, v23);
  -[BKUIPearlCrossHairsRenderingView crosshairsPathCollection](self, "crosshairsPathCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "defaultPath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "updateControlPointBufferWithData:count:", v24, objc_msgSend(v26, "controlPointsCount"));

  v27 = self->_pathBlend * self->_pathBlend;
  if (v27 >= 0.3)
  {
    if (v27 >= 0.35)
    {
      -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](self, "checkMarkPathCollection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](self, "checkMarkPathCollection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "paths");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("half1"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](self, "checkMarkPathCollection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "defaultPath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v37 = fminf(fmaxf((float)(v27 + -0.35) / 0.65, 0.0), 1.0);
      objc_msgSend(v28, "blendPath:withPath:byAmount:", v31, v33, v37);
      goto LABEL_8;
    }
    -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](self, "checkMarkPathCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](self, "checkMarkPathCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "paths");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("half0"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](self, "checkMarkPathCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "paths");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("half1"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v36 = fminf(fmaxf((float)(v27 + -0.3) / 0.05, 0.0), 1.0);
    objc_msgSend(v28, "blendPath:withPath:byAmount:", v31, v34, v36);
  }
  else
  {
    -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](self, "checkMarkPathCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](self, "checkMarkPathCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "paths");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("none"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](self, "checkMarkPathCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "paths");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("half0"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v35 = fminf(fmaxf(v27 / 0.3, 0.0), 1.0);
    objc_msgSend(v28, "blendPath:withPath:byAmount:", v31, v34, v35);
  }

LABEL_8:
  -[BKUIPearlCrossHairsRenderingView checkMarkData](self, "checkMarkData");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](self, "checkMarkPathCollection");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "controlPointState");
  -[BKUIPearlCrossHairsRenderingView checkMarkPathCollection](self, "checkMarkPathCollection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "defaultPath");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "updateControlPointBufferWithData:count:", v40, objc_msgSend(v42, "controlPointsCount"));

  -[MTKView currentRenderPassDescriptor](self, "currentRenderPassDescriptor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    -[BKUIPearlCrossHairsRenderingView renderer](self, "renderer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "renderWithCommandBuffer:", v47);

    -[MTKView currentDrawable](self, "currentDrawable");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "presentDrawable:", v45);

  }
  objc_msgSend(v47, "commit");

  _Block_object_dispose(v49, 8);
}

intptr_t __45__BKUIPearlCrossHairsRenderingView_drawRect___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (unint64_t)state
{
  return self->_state;
}

- (double)axis
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 1088), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setAxis:(BKUIPearlCrossHairsRenderingView *)self
{
  __int128 v2;
  __int128 v3;

  v3 = v2;
  objc_copyStruct(self->_axis, &v3, 16, 1, 0);
}

- (MTLSAnimatablePathCollection)crosshairsPathCollection
{
  return (MTLSAnimatablePathCollection *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setCrosshairsPathCollection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (BKUIPearlCrossHairsManager)crosshairsInstanceManager
{
  return (BKUIPearlCrossHairsManager *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setCrosshairsInstanceManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (MTLSPathBufferData)crosshairsData
{
  return (MTLSPathBufferData *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setCrosshairsData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (MTLSAnimatablePathCollection)checkMarkPathCollection
{
  return (MTLSAnimatablePathCollection *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setCheckMarkPathCollection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (MTLSPathBufferData)checkMarkData
{
  return (MTLSPathBufferData *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setCheckMarkData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (MTLSplineRenderer)renderer
{
  return (MTLSplineRenderer *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setRenderer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_checkMarkData, 0);
  objc_storeStrong((id *)&self->_checkMarkPathCollection, 0);
  objc_storeStrong((id *)&self->_crosshairsData, 0);
  objc_storeStrong((id *)&self->_crosshairsInstanceManager, 0);
  objc_storeStrong((id *)&self->_crosshairsPathCollection, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_inFlightSemaphore, 0);
}

@end
