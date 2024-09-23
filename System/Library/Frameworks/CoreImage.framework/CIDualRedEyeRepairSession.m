@implementation CIDualRedEyeRepairSession

+ (id)_contextRGBAh
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("working_format");
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
  return +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", CFSTR("CIDualRedEyeRepairRGBAh"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
}

- (CIDualRedEyeRepairSession)init
{
  CIDualRedEyeRepairSession *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CIDualRedEyeRepairSession;
  v2 = -[CIDualRedEyeRepairSession init](&v4, sel_init);
  if (v2)
    -[CIDualRedEyeRepairSession setTuning:](v2, "setTuning:", -[CIDualRedEyeRepairTuning initWithTuning:]([CIDualRedEyeRepairTuning alloc], "initWithTuning:", 0));
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CIDualRedEyeRepairSession cleanupState](self, "cleanupState");
  v3.receiver = self;
  v3.super_class = (Class)CIDualRedEyeRepairSession;
  -[CIDualRedEyeRepairSession dealloc](&v3, sel_dealloc);
}

- (void)cleanupState
{
  -[CIDualRedEyeRepairSession setTimestamp:](self, "setTimestamp:", 0);
  -[CIDualRedEyeRepairSession setObservations:](self, "setObservations:", 0);
  -[CIDualRedEyeRepairSession setDestination:](self, "setDestination:", 0);
  -[CIDualRedEyeRepairSession setPrimaryImage:](self, "setPrimaryImage:", 0);
  -[CIDualRedEyeRepairSession setSecondaryImage:](self, "setSecondaryImage:", 0);
  -[CIDualRedEyeRepairSession setMetadata:](self, "setMetadata:", 0);
  -[CIDualRedEyeRepairSession setImageProperties:](self, "setImageProperties:", 0);
  -[CIDualRedEyeRepairSession setFaces:](self, "setFaces:", 0);
  self->_primary = 0;
  self->_secondary = 0;
}

- (BOOL)prewarm
{
  int v3;
  CIImage *v4;
  CIImage *v5;
  CIImage *v6;
  CIImage *v7;
  CIImage *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _UNKNOWN **v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  CIFilter *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  unint64_t v24;
  unint64_t v25;
  CIVector *v26;
  CIVector *v27;
  double v28;
  double v29;
  double v30;
  CIVector *v31;
  CIVector *v32;
  CGFloat v33;
  CIVector *v34;
  double v35;
  double v36;
  double v37;
  CIVector *v38;
  double v39;
  double v40;
  double v41;
  CIVector *v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CIVector *v50;
  id v51;
  double v52;
  uint64_t v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  CGFloat v68;
  double x;
  double y;
  double width;
  double height;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  CIDualRedEyeRepairSession *v95;
  uint64_t v96;
  uint64_t v97;
  CIFilter *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  CIRenderDestination *v102;
  CIImage *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  _QWORD v113[2];
  _QWORD v114[2];
  _BYTE v115[128];
  _QWORD v116[2];
  _QWORD v117[2];
  _BYTE v118[128];
  uint64_t v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;

  v119 = *MEMORY[0x1E0C80C00];
  if (-[CIContext loadArchive:](-[CIDualRedEyeRepairSession context](self, "context"), "loadArchive:", CFSTR("redeye_repair_archive")))
  {
LABEL_2:
    LOBYTE(v3) = 1;
    return v3;
  }
  v4 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor redColor](CIColor, "redColor"));
  v5 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor greenColor](CIColor, "greenColor"));
  v6 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor blueColor](CIColor, "blueColor"));
  v7 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor cyanColor](CIColor, "cyanColor"));
  v8 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor magentaColor](CIColor, "magentaColor"));
  v103 = -[CIImage imageByCroppingToRect:](v4, "imageByCroppingToRect:", 0.0, 0.0, 4224.0, 3024.0);
  v9 = -[CIImage imageByCroppingToRect:](v5, "imageByCroppingToRect:", 0.0, 0.0, 4224.0, 3024.0);
  v101 = -[CIImage imageByCroppingToRect:](v6, "imageByCroppingToRect:", 0.0, 0.0, 4224.0, 3024.0);
  v100 = -[CIImage imageByCroppingToRect:](v7, "imageByCroppingToRect:", 0.0, 0.0, 4224.0, 3024.0);
  v99 = -[CIImage imageByCroppingToRect:](v8, "imageByCroppingToRect:", 0.0, 0.0, 4224.0, 3024.0);
  v102 = -[CIRenderDestination initWithWidth:height:pixelFormat:commandBuffer:mtlTextureProvider:]([CIRenderDestination alloc], "initWithWidth:height:pixelFormat:commandBuffer:mtlTextureProvider:", 4224, 3024, 70, 0, &__block_literal_global_22);
  if (v102)
  {
    v112 = 0;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v10 = objc_msgSend(&unk_1E2F1DC30, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
    if (v10)
    {
      v11 = v10;
      v12 = &off_1E2EB6000;
      v13 = *(_QWORD *)v109;
      v95 = self;
      v91 = *(_QWORD *)v109;
      v92 = v9;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v109 != v13)
            objc_enumerationMutation(&unk_1E2F1DC30);
          v94 = v14;
          v15 = (id)objc_msgSend(objc_alloc((Class)v12[64]), "initWithTuning:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * v14), "intValue"));
          v16 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIRedEyeRaw"));
          -[CIFilter setValuesForKeysWithDictionary:](v16, "setValuesForKeysWithDictionary:", objc_msgSend(v15, "repairTuning"));
          v116[0] = CFSTR("inputPrimary");
          v116[1] = CFSTR("inputSecondary");
          v117[0] = v103;
          v117[1] = v9;
          -[CIFilter setValuesForKeysWithDictionary:](v16, "setValuesForKeysWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 2));
          v98 = v16;
          -[CIFilter setValue:forKey:](v16, "setValue:forKey:", objc_msgSend((id)objc_msgSend(v15, "sessionTuning"), "objectForKeyedSubscript:", CFSTR("kUseFaceSegmentationMask")), CFSTR("inputUseFaceSegmentationMask"));
          v106 = 0u;
          v107 = 0u;
          v104 = 0u;
          v105 = 0u;
          v97 = objc_msgSend(&unk_1E2F1DC48, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
          if (v97)
          {
            v96 = *(_QWORD *)v105;
            v93 = v11;
LABEL_12:
            v17 = 0;
            while (1)
            {
              if (*(_QWORD *)v105 != v96)
                objc_enumerationMutation(&unk_1E2F1DC48);
              v18 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v17);
              -[CIImage extent](v103, "extent");
              v20 = v19;
              -[CIImage extent](v103, "extent");
              v22 = v21;
              objc_msgSend(v18, "floatValue");
              v24 = (unint64_t)v23;
              v25 = (unint64_t)(float)((float)(unint64_t)v23 * 0.7);
              *(float *)&v22 = (double)(unint64_t)v22 * 0.6;
              v26 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.0, 0.0);
              v27 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 1.0);
              v28 = (double)(unint64_t)v20;
              v29 = (double)v24 * 0.5;
              v30 = *(float *)&v22;
              v31 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", -(v29 - v28 * 0.5) - (double)v24, v30);
              v32 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v29 + v28 * 0.5, v30);
              v33 = (double)v25;
              v34 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (double)v24, (double)v25);
              -[CIVector X](v31, "X");
              v36 = v35 + v29;
              -[CIVector Y](v31, "Y");
              v38 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v36, v37 + (double)v25 * 0.5);
              -[CIVector X](v32, "X");
              v40 = v39 + v29;
              -[CIVector Y](v32, "Y");
              v42 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v40, v41 + (double)v25 * 0.5);
              -[CIVector X](v31, "X");
              v44 = v43;
              -[CIVector Y](v31, "Y");
              v46 = v45;
              -[CIVector X](v32, "X");
              v48 = v47;
              -[CIVector Y](v32, "Y");
              v124.origin.y = v49;
              v120.origin.x = v44;
              v120.origin.y = v46;
              v120.size.width = (double)v24;
              v120.size.height = v33;
              v124.origin.x = v48;
              v124.size.width = (double)v24;
              v124.size.height = v33;
              v121 = CGRectUnion(v120, v124);
              v50 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v121.origin.x, v121.origin.y, v121.size.width, v121.size.height);
              v51 = (id)objc_opt_new();
              objc_msgSend(v51, "setImageOrientation:", 0);
              objc_msgSend(v51, "setSegmentationSkin:", v101);
              objc_msgSend(v51, "setSegmentationSclera:", v99);
              objc_msgSend(v51, "setSegmentationIris:", v100);
              objc_msgSend(v51, "setFaceRect:", v50);
              LODWORD(v52) = 0;
              objc_msgSend(v51, "setFaceOrientation:", v52);
              v114[0] = v26;
              v114[1] = v27;
              objc_msgSend(v51, "setUvLeft:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 2));
              v113[0] = v26;
              v113[1] = v27;
              objc_msgSend(v51, "setUvRight:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 2));
              objc_msgSend(v51, "setRoiRenderOriginLeft:", v31);
              objc_msgSend(v51, "setRoiRenderOriginRight:", v32);
              objc_msgSend(v51, "setRoiRenderSize:", v34);
              objc_msgSend(v51, "setPupilLeft:", v38);
              objc_msgSend(v51, "setPupilRight:", v42);
              -[CIDualRedEyeRepairSession customizeRepairFilter:forFace:](v95, "customizeRepairFilter:forFace:", v98, v51);
              v53 = -[CIFilter outputImage](v98, "outputImage");
              objc_msgSend((id)objc_msgSend(v51, "roiRenderOriginLeft"), "X");
              v55 = v54;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderOriginLeft"), "Y");
              v57 = v56;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderSize"), "X");
              v59 = v58;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderSize"), "Y");
              v61 = v60;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderOriginRight"), "X");
              v63 = v62;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderOriginRight"), "Y");
              v65 = v64;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderSize"), "X");
              v67 = v66;
              objc_msgSend((id)objc_msgSend(v51, "roiRenderSize"), "Y");
              v125.size.height = v68;
              v122.origin.x = v55;
              v122.origin.y = v57;
              v122.size.width = v59;
              v122.size.height = v61;
              v125.origin.x = v63;
              v125.origin.y = v65;
              v125.size.width = v67;
              v123 = CGRectUnion(v122, v125);
              x = v123.origin.x;
              y = v123.origin.y;
              width = v123.size.width;
              height = v123.size.height;
              if (!-[CIDualRedEyeRepairSession context](v95, "context"))
              {
                v3 = CI_LOG_DUALRED();
                if (v3)
                {
                  v81 = ci_logger_api();
                  v3 = os_log_type_enabled(v81, OS_LOG_TYPE_ERROR);
                  if (v3)
                  {
                    -[CIDualRedEyeRepairSession prewarm].cold.2(v81, v82, v83, v84, v85, v86, v87, v88);
                    goto LABEL_31;
                  }
                }
                return v3;
              }
              -[CIContext prepareRender:fromRect:toDestination:atPoint:error:](-[CIDualRedEyeRepairSession context](v95, "context"), "prepareRender:fromRect:toDestination:atPoint:error:", v53, v102, &v112, x, y, width, height, x, y);
              if (v112)
                break;
              if (v97 == ++v17)
              {
                v9 = v92;
                v11 = v93;
                v12 = &off_1E2EB6000;
                v13 = v91;
                v97 = objc_msgSend(&unk_1E2F1DC48, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
                if (v97)
                  goto LABEL_12;
                goto LABEL_19;
              }
            }
            v3 = CI_LOG_DUALRED();
            if (v3)
            {
              v89 = ci_logger_api();
              v3 = os_log_type_enabled(v89, OS_LOG_TYPE_ERROR);
              if (v3)
              {
                -[CIDualRedEyeRepairSession prewarm].cold.3();
                goto LABEL_31;
              }
            }
            return v3;
          }
LABEL_19:
          v14 = v94 + 1;
        }
        while (v94 + 1 != v11);
        v11 = objc_msgSend(&unk_1E2F1DC30, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
        if (v11)
          continue;
        break;
      }
    }

    goto LABEL_2;
  }
  v3 = CI_LOG_DUALRED();
  if (v3)
  {
    v73 = ci_logger_api();
    v3 = os_log_type_enabled(v73, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[CIDualRedEyeRepairSession prewarm].cold.1(v73, v74, v75, v76, v77, v78, v79, v80);
LABEL_31:
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

void __36__CIDualRedEyeRepairSession_prewarm__block_invoke()
{
  __assert_rtn("-[CIDualRedEyeRepairSession prewarm]_block_invoke", "CIDualRedEyeRepair.m", 255, "false");
}

- (BOOL)prepareRepair
{
  if (!-[CIDualRedEyeRepairSession context](self, "context"))
    -[CIDualRedEyeRepairSession setContext:](self, "setContext:", +[CIDualRedEyeRepairSession _contextRGBAh](CIDualRedEyeRepairSession, "_contextRGBAh"));
  return 1;
}

- (BOOL)prepareRepairWithTuningParametersByPortType:(id)a3
{
  -[CIDualRedEyeRepairSession setTuningParametersByPortType:](self, "setTuningParametersByPortType:", a3);
  return -[CIDualRedEyeRepairSession prepareRepair](self, "prepareRepair");
}

- (BOOL)renderUsingPixelBuffers
{
  return self->_primary || self->_secondary || self->_output != 0;
}

- (BOOL)renderUsingProvidedCommandQueue
{
  return -[CIDualRedEyeRepairSession commandQueue](self, "commandQueue")
      || -[CIDualRedEyeRepairSession primaryTexture](self, "primaryTexture")
      || -[CIDualRedEyeRepairSession secondaryTexture](self, "secondaryTexture")
      || -[CIDualRedEyeRepairSession outputTexture](self, "outputTexture") != 0;
}

- (void)dumpInputs
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136447234;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_15_0(&dword_1921E4000, v0, v1, "%{public}s pixelformat of primary image is %c%c%c%c", (uint8_t *)v2);
  OUTLINED_FUNCTION_8();
}

- (BOOL)validateRenderState
{
  _BOOL4 v3;
  _BOOL4 v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = -[CIDualRedEyeRepairSession renderUsingPixelBuffers](self, "renderUsingPixelBuffers");
  v4 = -[CIDualRedEyeRepairSession renderUsingProvidedCommandQueue](self, "renderUsingProvidedCommandQueue");
  if (v4 && v3)
  {
    v5 = CI_LOG_DUALRED();
    if (v5)
    {
      v6 = ci_logger_api();
      v5 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        -[CIDualRedEyeRepairSession validateRenderState].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_12:
        LOBYTE(v5) = 0;
      }
    }
  }
  else if (v4 || v3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = CI_LOG_DUALRED();
    if (v5)
    {
      v14 = ci_logger_api();
      v5 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        -[CIDualRedEyeRepairSession validateRenderState].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);
        goto LABEL_12;
      }
    }
  }
  return v5;
}

- (int)validateSetPrimary
{
  __CVBuffer *primary;
  _BOOL4 v4;
  double Width;
  double Height;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  char v10;
  float v11;
  float v12;
  float v13;
  char v14;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  if (!-[CIDualRedEyeRepairSession validateRenderState](self, "validateRenderState"))
    return 3;
  primary = self->_primary;
  v4 = -[CIDualRedEyeRepairSession renderUsingProvidedCommandQueue](self, "renderUsingProvidedCommandQueue");
  if (primary && !self->_primary)
  {
    if (CI_LOG_DUALRED())
    {
      v16 = ci_logger_api();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession validateSetPrimary].cold.6(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    return 3;
  }
  if (!v4)
  {
    Width = *MEMORY[0x1E0C9D820];
    Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (!primary)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (!-[CIDualRedEyeRepairSession primaryTexture](self, "primaryTexture"))
  {
    if (CI_LOG_DUALRED())
    {
      v32 = ci_logger_api();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession validateSetPrimary].cold.1(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    return 3;
  }
  Width = (double)(unint64_t)-[MTLTexture width](-[CIDualRedEyeRepairSession primaryTexture](self, "primaryTexture"), "width");
  Height = (double)(unint64_t)-[MTLTexture height](-[CIDualRedEyeRepairSession primaryTexture](self, "primaryTexture"), "height");
  if (primary)
  {
LABEL_9:
    Width = (double)CVPixelBufferGetWidth(self->_primary);
    Height = (double)CVPixelBufferGetHeight(self->_primary);
  }
LABEL_10:
  if (Width > Height)
    Height = Width;
  v7 = (unint64_t)Height;
  if ((unint64_t)Height < (int)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", CFSTR("kMinPrimaryDimension")), "intValue"))
  {
    if (CI_LOG_DUALRED())
    {
      v8 = ci_logger_api();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession validateSetPrimary].cold.2(v7, v8, v9);
    }
    return 3;
  }
  if (!-[CIDualRedEyeRepairSession observations](self, "observations")
    || !-[NSArray count](-[CIDualRedEyeRepairSession observations](self, "observations"), "count"))
  {
    if (CI_LOG_DUALRED())
    {
      v24 = ci_logger_api();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession validateSetPrimary].cold.3(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    return 3;
  }
  if (!-[CIDualRedEyeRepairSession metadata](self, "metadata"))
  {
    if (CI_LOG_DUALRED())
    {
      v40 = ci_logger_api();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession validateSetPrimary].cold.4(v40, v41, v42, v43, v44, v45, v46, v47);
    }
    return 3;
  }
  v10 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairSession metadata](self, "metadata"), "objectForKeyedSubscript:", CFSTR("WouldAutoFlashTurnOn")), "BOOLValue");
  if (-[NSDictionary objectForKey:](-[CIDualRedEyeRepairSession metadata](self, "metadata"), "objectForKey:", CFSTR("NormalizedSNR")))
  {
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairSession metadata](self, "metadata"), "objectForKeyedSubscript:", CFSTR("NormalizedSNR")), "floatValue");
    v12 = v11;
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", CFSTR("kAutoFlashOverrideSNRThreshold")), "floatValue");
    if (v12 <= v13)
      v14 = 1;
    else
      v14 = v10;
    if ((v14 & 1) != 0)
      return 0;
  }
  else if ((v10 & 1) != 0)
  {
    return 0;
  }
  if (CI_LOG_DUALRED())
  {
    v48 = ci_logger_api();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession validateSetPrimary].cold.5(v48, v49, v50, v51, v52, v53, v54, v55);
  }
  return 2;
}

- (int)validateRepair
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  if (!-[CIDualRedEyeRepairSession validateRenderState](self, "validateRenderState"))
    return 3;
  if (-[CIDualRedEyeRepairSession faces](self, "faces")
    && -[NSArray count](-[CIDualRedEyeRepairSession faces](self, "faces"), "count"))
  {
    v3 = -[CIDualRedEyeRepairSession renderUsingPixelBuffers](self, "renderUsingPixelBuffers");
    if (!-[CIDualRedEyeRepairSession renderUsingProvidedCommandQueue](self, "renderUsingProvidedCommandQueue")
      || -[CIDualRedEyeRepairSession primaryTexture](self, "primaryTexture")
      && -[CIDualRedEyeRepairSession secondaryTexture](self, "secondaryTexture")
      && -[CIDualRedEyeRepairSession outputTexture](self, "outputTexture"))
    {
      if (!v3 || self->_primary && self->_secondary)
      {
        if (-[CIDualRedEyeRepairSession context](self, "context"))
          return 0;
        if (CI_LOG_DUALRED())
        {
          v30 = ci_logger_api();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[CIDualRedEyeRepairSession validateRepair].cold.5(v30, v31, v32, v33, v34, v35, v36, v37);
        }
      }
      else
      {
        if (CI_LOG_DUALRED())
        {
          v21 = ci_logger_api();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[CIDualRedEyeRepairSession validateRepair].cold.4();
        }
        if (!self->_primary)
        {
          if (self->_secondary)
          {
            if (CI_LOG_DUALRED())
            {
              v22 = ci_logger_api();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                -[CIDualRedEyeRepairSession validateRepair].cold.3(v22, v23, v24, v25, v26, v27, v28, v29);
            }
          }
        }
      }
    }
    else if (CI_LOG_DUALRED())
    {
      v13 = ci_logger_api();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession validateRepair].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    return 3;
  }
  if (CI_LOG_DUALRED())
  {
    v5 = ci_logger_api();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession validateRepair].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  return 1;
}

- (id)redEyeFaceFromObservation:(id)a3 exifOrientation:(int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CIVector *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  int v55;
  int v56;
  NSObject *v57;
  float v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  float v69;
  NSObject *v70;
  float v71;
  NSObject *v72;
  float v73;
  NSObject *v74;
  float v75;
  float v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  float v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  CGFloat v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  int v126;
  char v127;
  int v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  CGFloat v141;
  double v142;
  CGFloat v143;
  double v144;
  CGFloat v145;
  void *v146;
  NSObject *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  void *v156;
  uint64_t v157;
  int v158;
  NSObject *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  CGFloat v171;
  CGFloat v172;
  CGFloat v173;
  CGFloat v174;
  double v175;
  CGFloat v176;
  double v177;
  CGFloat v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  NSObject *v185;
  CIVector *v186;
  CIVector *v187;
  CIVector *v188;
  NSObject *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  float v197;
  _UNKNOWN **v198;
  NSObject *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  NSObject *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  double x;
  double y;
  double width;
  double height;
  float v219;
  uint64_t v220;
  uint64_t v221;
  float v222;
  NSObject *v223;
  uint64_t v224;
  NSObject *v225;
  float v226;
  double v227;
  double v228;
  double v229;
  NSObject *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  NSObject *v238;
  float v239;
  NSObject *v240;
  uint64_t v241;
  uint64_t v242;
  double rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  double v251;
  double v252;
  double v253;
  double v254;
  double v255;
  double v256;
  uint64_t v257;
  void *v258;
  uint64_t v259;
  int v260;
  uint64_t v261;
  void *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  CGFloat v269;
  CGFloat v270;
  CGFloat v271;
  CGFloat v272;
  CGFloat r2;
  int v274;
  float v275;
  float v276;
  double v277;
  double v278;
  double v279;
  double v280;
  double v281;
  double v282;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v285;
  CGAffineTransform v286;
  float v287[2];
  uint8_t buf[32];
  _BYTE v289[20];
  uint64_t v290;
  CGRect v291;
  CGRect v292;
  CGRect v293;
  CGRect v294;
  CGRect v295;
  CGRect v296;
  CGRect v297;
  CGRect v298;
  CGRect v299;
  CGRect v300;

  v4 = *(_QWORD *)&a4;
  v290 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "landmarks");
  if (!v7)
  {
    if (CI_LOG_DUALRED())
    {
      v29 = ci_logger_api();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);
    }
    return 0;
  }
  v8 = v7;
  if (!objc_msgSend(v7, "leftEye") || !objc_msgSend(v8, "rightEye"))
  {
    if (CI_LOG_DUALRED())
    {
      v21 = ci_logger_api();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    return 0;
  }
  objc_msgSend(a3, "boundingBox");
  CIVNRectInOrientedImage(-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), v9, v10, v11, v12);
  v292 = CGRectIntegral(v291);
  v13 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v292.origin.x, v292.origin.y, v292.size.width, v292.size.height);
  v14 = CIVNLandmarkInOrientedImage((void *)objc_msgSend(v8, "leftEye"), -[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"));
  v15 = CIVNLandmarkInOrientedImage((void *)objc_msgSend(v8, "rightEye"), -[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"));
  if (CI_LOG_DUALRED())
  {
    if (CI_LOG_DUALRED())
    {
      v16 = ci_logger_api();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.22();
    }
    if (CI_LOG_DUALRED())
    {
      v17 = ci_logger_api();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.21();
    }
    if (CI_LOG_DUALRED())
    {
      v18 = ci_logger_api();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.20(self, v18);
    }
  }
  if (objc_msgSend(v14, "count") == 8)
  {
    v19 = axesForEyePointsV2(v14);
    v20 = axesForEyePointsV2(v15);
  }
  else
  {
    if (objc_msgSend(v14, "count") != 6)
    {
      if (CI_LOG_DUALRED())
      {
        v68 = ci_logger_api();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.19(v14, v68);
      }
      return 0;
    }
    v19 = axesForEyePointsV3(v14);
    v20 = axesForEyePointsV3(v15);
  }
  v39 = v20;
  if (!v19 || !v20)
  {
    if (CI_LOG_DUALRED())
    {
      v60 = ci_logger_api();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.18(v60, v61, v62, v63, v64, v65, v66, v67);
    }
    return 0;
  }
  objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", 1), "_norm");
  v41 = v40;
  objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", 0), "_norm");
  v43 = v41 / v42;
  objc_msgSend((id)objc_msgSend(v39, "objectAtIndexedSubscript:", 1), "_norm");
  v45 = v44;
  objc_msgSend((id)objc_msgSend(v39, "objectAtIndexedSubscript:", 0), "_norm");
  v47 = v45 / v46;
  if (v43 >= v47)
    v48 = v47;
  else
    v48 = v43;
  v49 = areaForAxes((void *)objc_msgSend(v19, "objectAtIndexedSubscript:", 0), (void *)objc_msgSend(v19, "objectAtIndexedSubscript:", 1));
  v50 = areaForAxes((void *)objc_msgSend(v39, "objectAtIndexedSubscript:", 0), (void *)objc_msgSend(v39, "objectAtIndexedSubscript:", 1));
  if (v49 <= v50)
    v49 = v50;
  objc_msgSend(v8, "confidence");
  v52 = v51;
  objc_msgSend(a3, "faceJunkinessIndex");
  v54 = v53;
  objc_msgSend(a3, "faceOrientationIndex");
  v56 = v55;
  if (CI_LOG_DUALRED())
  {
    v57 = ci_logger_api();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136447234;
      *(_QWORD *)&buf[4] = "-[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v52;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = v54;
      *(_WORD *)v289 = 2048;
      *(double *)&v289[2] = v48;
      *(_WORD *)&v289[10] = 2048;
      *(double *)&v289[12] = v49;
      _os_log_error_impl(&dword_1921E4000, v57, OS_LOG_TYPE_ERROR, "%{public}s Confidence=%.3f | junk=%.3f | Anisotropy=%.3f | area=%.0f", buf, 0x34u);
    }
  }
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", CFSTR("kMinLandmarkConfidenceThreshold")), "floatValue");
  if (v52 >= v58)
  {
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", CFSTR("kMaxFaceJunkinessThreshold")), "floatValue");
    if (v54 <= v69)
    {
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", CFSTR("kMinIsotropy")), "floatValue");
      if (v48 >= v71)
      {
        objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", CFSTR("kMinLandmarkArea")), "floatValue");
        if (v49 >= v73)
        {
          v274 = v56;
          v275 = v54;
          v276 = v49;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", CFSTR("kSessionTuningOutsetROILong")), "floatValue");
          v287[0] = v75;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", CFSTR("kSessionTuningOutsetROIShort")), "floatValue");
          v287[1] = v76;
          repairROIforEyePoints(v14, v19, v287);
          v78 = v77;
          v80 = v79;
          v82 = v81;
          v84 = v83;
          repairROIforEyePoints(v15, v39, v287);
          v277 = v88;
          v279 = v87;
          v89 = v85;
          v90 = v86;
          if (v82 <= v85)
            v91 = v85;
          else
            v91 = v82;
          if (v84 <= v86)
            v92 = v86;
          else
            v92 = v84;
          v93 = expandFromCenter(v78, v80, v82, v84, v91, v92);
          v281 = v94;
          v282 = v93;
          v96 = v95;
          v98 = v97;
          v99 = expandFromCenter(v279, v277, v89, v90, v91, v92);
          v101 = v100;
          v103 = v102;
          v105 = v104;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", CFSTR("kRegionOutset")), "floatValue");
          v107 = (float)(v106 + 1.0);
          if (v96 <= v103)
            v108 = v103;
          else
            v108 = v96;
          v109 = v108 * v107;
          if (v98 <= v105)
            v110 = v105;
          else
            v110 = v98;
          v111 = v110 * v107;
          v269 = v96;
          v271 = v98;
          v112 = expandFromCenter(v282, v281, v96, v98, v109, v110 * v107);
          v278 = v113;
          v280 = v112;
          v115 = v114;
          v117 = v116;
          v272 = v99;
          r2 = v101;
          v270 = v103;
          v118 = v103;
          v119 = v105;
          v120 = expandFromCenter(v99, v101, v118, v105, v109, v111);
          if (v115 != v123 || v117 != v122)
          {
            if (CI_LOG_DUALRED())
            {
              v147 = ci_logger_api();
              if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
                -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.17(v147, v148, v149, v150, v151, v152, v153, v154);
            }
            return 0;
          }
          v124 = v120;
          v125 = v121;
          v126 = objc_msgSend(-[NSDictionary objectForKey:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKey:", CFSTR("kForceFaceSegmentationPupils")), "BOOLValue");
          v127 = objc_msgSend(-[NSDictionary objectForKey:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKey:", CFSTR("kUseFaceSegmentationMask")), "BOOLValue");
          v128 = objc_msgSend(-[NSDictionary objectForKey:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKey:", CFSTR("kUseFaceSegmentation")), "BOOLValue");
          if ((v126 & 1) != 0 || (v127 & 1) != 0 || v128)
          {
            if (!objc_msgSend(a3, "faceSegments"))
            {
              if (CI_LOG_DUALRED())
              {
                v207 = ci_logger_api();
                if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
                  -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.7(v207, v208, v209, v210, v211, v212, v213, v214);
              }
              return 0;
            }
            v155 = probabilitiesForSegment((void *)objc_msgSend(a3, "faceSegments"), 482, v4);
            if (!v155)
            {
              if (CI_LOG_DUALRED())
              {
                v230 = ci_logger_api();
                if (os_log_type_enabled(v230, OS_LOG_TYPE_ERROR))
                  -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.8(v230, v231, v232, v233, v234, v235, v236, v237);
              }
              return 0;
            }
            v156 = v155;
            v157 = objc_msgSend(v155, "count");
            v158 = CI_LOG_DUALRED();
            if (v157 != 5)
            {
              if (v158)
              {
                v238 = ci_logger_api();
                if (os_log_type_enabled(v238, OS_LOG_TYPE_ERROR))
                  -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.16(v156, v238);
              }
              return 0;
            }
            v260 = v126;
            v252 = v125;
            v255 = v117;
            if (v158)
            {
              v159 = ci_logger_api();
              if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
                -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.15(v159, v160, v161, v162, v163, v164, v165, v166);
            }
            v262 = (void *)objc_msgSend(v156, "objectAtIndexedSubscript:", 0);
            v268 = (void *)objc_msgSend(v156, "objectAtIndexedSubscript:", 1);
            v167 = (void *)objc_msgSend(v156, "objectAtIndexedSubscript:", 2);
            v168 = (void *)objc_msgSend(v156, "objectAtIndexedSubscript:", 3);
            v169 = (void *)objc_msgSend(v156, "objectAtIndexedSubscript:", 4);
            v265 = (uint64_t)v167;
            v258 = (void *)RRmaximumRh(v268, v167);
            v248 = v169;
            v250 = v168;
            v170 = (void *)RRmaximumRh(v168, v169);
            objc_msgSend((id)objc_msgSend(a3, "faceSegments"), "boundingBox");
            CIVNRectInOrientedImage(-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), v171, v172, v173, v174);
            v176 = v175;
            v178 = v177;
            v180 = v179;
            v182 = v181;
            objc_msgSend(v262, "extent");
            if (vabdd_f64(256.0, v183) > 0.00001 || (objc_msgSend(v262, "extent"), vabdd_f64(256.0, v184) > 0.00001))
            {
              if (CI_LOG_DUALRED())
              {
                v185 = ci_logger_api();
                if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
                  -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.9(v262, v185);
              }
              return 0;
            }
            *(_OWORD *)v289 = 0u;
            memset(buf, 0, sizeof(buf));
            CGAffineTransformMakeScale((CGAffineTransform *)buf, v180 * 0.00390625, v182 * 0.00390625);
            memset(&v286, 0, sizeof(v286));
            CGAffineTransformMakeTranslation(&v286, v176, v178);
            *(_OWORD *)&t1.a = *(_OWORD *)buf;
            *(_OWORD *)&t1.c = *(_OWORD *)&buf[16];
            *(_OWORD *)&t1.tx = *(_OWORD *)v289;
            memset(&v285, 0, sizeof(v285));
            t2 = v286;
            CGAffineTransformConcat(&v285, &t1, &t2);
            t1 = v285;
            v129 = objc_msgSend(v262, "imageByApplyingTransform:", &t1);
            t1 = v285;
            v130 = objc_msgSend(v258, "imageByApplyingTransform:", &t1);
            t1 = v285;
            v131 = objc_msgSend(v170, "imageByApplyingTransform:", &t1);
            v125 = v252;
            v117 = v255;
            v133 = v265;
            v132 = (uint64_t)v268;
            v126 = v260;
            v135 = v248;
            v134 = v250;
          }
          else
          {
            v129 = 0;
            v130 = 0;
            v131 = 0;
            v132 = 0;
            v133 = 0;
            v134 = 0;
            v135 = 0;
          }
          v259 = v130;
          v261 = v129;
          v257 = v131;
          if (v126)
          {
            v263 = v133;
            v266 = v132;
            v247 = v135;
            v249 = v134;
            v136 = constellationRectInSegmentationRect(-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), (void *)objc_msgSend(v8, "rightEye"), (void *)objc_msgSend(a3, "faceSegments"), 0x100uLL);
            rect_16 = v138;
            rect_24 = v137;
            rect_8 = v139;
            rect = constellationRectInSegmentationRect(-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), (void *)objc_msgSend(v8, "leftEye"), (void *)objc_msgSend(a3, "faceSegments"), 0x100uLL);
            v251 = v125;
            v141 = v140;
            v143 = v142;
            v145 = v144;
            v293.origin.x = v136;
            v293.size.width = rect_16;
            v293.origin.y = rect_24;
            v293.size.height = rect_8;
            v294 = CGRectInset(v293, -12.8000002, -12.8000002);
            CGRectIntegral(v294);
            v295.origin.x = rect;
            v295.origin.y = v141;
            v295.size.width = v143;
            v295.size.height = v145;
            v296 = CGRectInset(v295, -12.8000002, -12.8000002);
            CGRectIntegral(v296);
            v125 = v251;
            v146 = (void *)semanticPupils(-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), a3, v4, v249, v247, v266, v263);
            v267 = objc_msgSend(v146, "objectAtIndexedSubscript:", 0);
            v264 = objc_msgSend(v146, "objectAtIndexedSubscript:", 1);
          }
          else
          {
            v264 = 0;
            v267 = 0;
          }
          v186 = orientedPupilFromLandmarks(-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage", *(_QWORD *)&rect), v8, 0);
          v187 = orientedPupilFromLandmarks(-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), v8, 1);
          if ((v126 & 1) == 0)
          {
            v188 = v187;
            if (CI_LOG_DUALRED())
            {
              v189 = ci_logger_api();
              if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
                -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.14(v189, v190, v191, v192, v193, v194, v195, v196);
            }
            v264 = (uint64_t)v188;
            v267 = (uint64_t)v186;
          }
          objc_msgSend(-[NSDictionary objectForKey:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKey:", CFSTR("kMinLaplacianVariance")), "floatValue");
          if (v197 <= 0.0001
            || -[CIDualRedEyeRepairSession renderUsingProvidedCommandQueue](self, "renderUsingProvidedCommandQueue"))
          {
            v198 = &off_1E2EB6000;
            if (CI_LOG_DUALRED())
            {
              v199 = ci_logger_api();
              if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR))
                -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.10(v199, v200, v201, v202, v203, v204, v205, v206);
            }
          }
          else
          {
            v253 = v125;
            v254 = v124;
            v256 = v117;
            v297.origin.y = v281;
            v297.origin.x = v282;
            v297.size.width = v269;
            v300.size.width = v270;
            v297.size.height = v271;
            v300.origin.x = v272;
            v300.origin.y = r2;
            v300.size.height = v119;
            v298 = CGRectUnion(v297, v300);
            v299 = CGRectIntegral(v298);
            x = v299.origin.x;
            y = v299.origin.y;
            width = v299.size.width;
            height = v299.size.height;
            CFAbsoluteTimeGetCurrent();
            LODWORD(v219) = focusStatsForRegion(x, y, width, height, (uint64_t)self->_primary, -[CIDualRedEyeRepairSession context](self, "context"), -[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"));
            v221 = v220;
            v222 = v219;
            CFAbsoluteTimeGetCurrent();
            v198 = &off_1E2EB6000;
            if (CI_LOG_DUALRED())
            {
              v223 = ci_logger_api();
              if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
                -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.13(v221, v223, v224, v222);
            }
            v124 = v254;
            v117 = v256;
            v125 = v253;
            if (CI_LOG_DUALRED())
            {
              v225 = ci_logger_api();
              if (os_log_type_enabled(v225, OS_LOG_TYPE_ERROR))
                -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.12();
            }
            objc_msgSend(-[NSDictionary objectForKey:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKey:", CFSTR("kMinLaplacianVariance")), "floatValue");
            if (v226 > v222)
            {
              v239 = v226;
              if (CI_LOG_DUALRED())
              {
                v240 = ci_logger_api();
                if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR))
                  -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.11(v240, v222, v239, v241, v242);
              }
              return 0;
            }
          }
          v37 = (id)objc_opt_new();
          objc_msgSend(v37, "setImageOrientation:", v4);
          objc_msgSend(v37, "setLandmarks:", v8);
          objc_msgSend(v37, "setObservation:", a3);
          objc_msgSend(v37, "setSegmentationSkin:", v261);
          objc_msgSend(v37, "setSegmentationSclera:", v259);
          objc_msgSend(v37, "setSegmentationIris:", v257);
          objc_msgSend(v37, "setFaceRect:", v13);
          *(float *)&v227 = v275;
          objc_msgSend(v37, "setJunkiness:", v227);
          LODWORD(v228) = v274;
          objc_msgSend(v37, "setFaceOrientation:", v228);
          *(float *)&v229 = v276;
          objc_msgSend(v37, "setAreaMax:", v229);
          objc_msgSend(v37, "setUvLeft:", v19);
          objc_msgSend(v37, "setUvRight:", v39);
          objc_msgSend(v37, "setRoiRenderOriginLeft:", objc_msgSend(v198[86], "vectorWithCGPoint:", v280, v278));
          objc_msgSend(v37, "setRoiRenderOriginRight:", objc_msgSend(v198[86], "vectorWithCGPoint:", v124, v125));
          objc_msgSend(v37, "setRoiRenderSize:", objc_msgSend(v198[86], "vectorWithX:Y:", v115, v117));
          objc_msgSend(v37, "setPupilLeft:", v267);
          objc_msgSend(v37, "setPupilRight:", v264);
          return v37;
        }
        if (CI_LOG_DUALRED())
        {
          v74 = ci_logger_api();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.6(v49);
        }
      }
      else if (CI_LOG_DUALRED())
      {
        v72 = ci_logger_api();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.5(v48);
      }
    }
    else if (CI_LOG_DUALRED())
    {
      v70 = ci_logger_api();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.4(v54);
    }
  }
  else if (CI_LOG_DUALRED())
  {
    v59 = ci_logger_api();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:].cold.3(v52);
  }
  return 0;
}

- (void)customizeRepairFilter:(id)a3 forFace:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  _QWORD v13[10];
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("inputOriginLeft");
  objc_msgSend((id)objc_msgSend(a4, "roiRenderOriginLeft"), "X");
  v7 = v6;
  objc_msgSend((id)objc_msgSend(a4, "roiRenderOriginLeft"), "Y");
  v14[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v7, v8);
  v13[1] = CFSTR("inputOriginRight");
  objc_msgSend((id)objc_msgSend(a4, "roiRenderOriginRight"), "X");
  v10 = v9;
  objc_msgSend((id)objc_msgSend(a4, "roiRenderOriginRight"), "Y");
  v14[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v10, v11);
  v13[2] = CFSTR("inputSize");
  v14[2] = objc_msgSend(a4, "roiRenderSize");
  v13[3] = CFSTR("inputOrientationHint");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a4, "faceOrientation");
  v14[3] = objc_msgSend(v12, "numberWithFloat:");
  v13[4] = CFSTR("inputAxisLongLeft");
  v14[4] = objc_msgSend((id)objc_msgSend(a4, "uvLeft"), "objectAtIndexedSubscript:", 0);
  v13[5] = CFSTR("inputAxisLongRight");
  v14[5] = objc_msgSend((id)objc_msgSend(a4, "uvRight"), "objectAtIndexedSubscript:", 0);
  v13[6] = CFSTR("inputAxisShortLeft");
  v14[6] = objc_msgSend((id)objc_msgSend(a4, "uvLeft"), "objectAtIndexedSubscript:", 1);
  v13[7] = CFSTR("inputAxisShortRight");
  v14[7] = objc_msgSend((id)objc_msgSend(a4, "uvRight"), "objectAtIndexedSubscript:", 1);
  v13[8] = CFSTR("inputPupilCenterLeft");
  v14[8] = objc_msgSend(a4, "pupilLeft");
  v13[9] = CFSTR("inputPupilCenterRight");
  v14[9] = objc_msgSend(a4, "pupilRight");
  objc_msgSend(a3, "setValuesForKeysWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 10));
  if (objc_msgSend(a4, "segmentationSkin"))
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(a4, "segmentationSkin"), CFSTR("inputSkinMask"));
  if (objc_msgSend(a4, "segmentationSclera"))
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(a4, "segmentationSclera"), CFSTR("inputScleraMask"));
  if (objc_msgSend(a4, "segmentationSkin"))
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(a4, "segmentationIris"), CFSTR("inputIrisMask"));
}

- (BOOL)repairFace:(id)a3 filter:(id)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  int v29;
  double Current;
  CIRenderTask *v31;
  int v32;
  NSObject *v33;
  CIRenderTask *v34;
  NSObject *v35;
  NSObject *v36;
  CIRenderTask *v37;
  CIRenderInfo *v38;
  CIRenderTask *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  CGFloat height;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  _BYTE buf[12];
  __int16 v56;
  CGFloat v57;
  __int16 v58;
  CGFloat v59;
  __int16 v60;
  CGFloat v61;
  __int16 v62;
  CGFloat v63;
  uint64_t v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a3, "roiRenderOriginLeft"), "X");
  v8 = v7;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderOriginLeft"), "Y");
  v10 = v9;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderSize"), "X");
  v12 = v11;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderSize"), "Y");
  v14 = v13;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderOriginRight"), "X");
  v16 = v15;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderOriginRight"), "Y");
  v18 = v17;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderSize"), "X");
  v20 = v19;
  objc_msgSend((id)objc_msgSend(a3, "roiRenderSize"), "Y");
  v69.size.height = v21;
  v65.origin.x = v8;
  v65.origin.y = v10;
  v65.size.width = v12;
  v65.size.height = v14;
  v51 = v18;
  v53 = v16;
  v69.origin.x = v16;
  v69.origin.y = v18;
  height = v69.size.height;
  v49 = v20;
  v69.size.width = v20;
  v66 = CGRectIntersection(v65, v69);
  x = v66.origin.x;
  y = v66.origin.y;
  width = v66.size.width;
  v25 = v66.size.height;
  if (CI_LOG_DUALRED())
  {
    v26 = ci_logger_api();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136447234;
      *(_QWORD *)&buf[4] = "-[CIDualRedEyeRepairSession repairFace:filter:]";
      v56 = 2048;
      v57 = x;
      v58 = 2048;
      v59 = y;
      v60 = 2048;
      v61 = width;
      v62 = 2048;
      v63 = v25;
      _os_log_error_impl(&dword_1921E4000, v26, OS_LOG_TYPE_ERROR, "%{public}s Intersection: %f,%f,%f,%f", buf, 0x34u);
    }
  }
  -[CIDualRedEyeRepairSession customizeRepairFilter:forFace:](self, "customizeRepairFilter:forFace:", a4, a3, *(_QWORD *)&height, *(_QWORD *)&v49, *(_QWORD *)&v51, *(_QWORD *)&v53);
  CFAbsoluteTimeGetCurrent();
  v27 = (void *)objc_msgSend(a4, "outputImage");
  if (CI_LOG_DUALRED())
  {
    v28 = ci_logger_api();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession repairFace:filter:].cold.9();
  }
  *(_QWORD *)buf = 0;
  v29 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", CFSTR("kRenderFullRect")), "BOOLValue");
  Current = CFAbsoluteTimeGetCurrent();
  if (v29)
  {
    v67.origin.x = v8;
    v67.origin.y = v10;
    v67.size.width = v12;
    v67.size.height = v14;
    v70.origin.y = v52;
    v70.origin.x = v54;
    v70.size.height = v48;
    v70.size.width = v50;
    v68 = CGRectUnion(v67, v70);
    v31 = -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self->context, "startTaskToRender:fromRect:toDestination:atPoint:error:", objc_msgSend(v27, "imageByCompositingOverImage:", -[CIImage imageByInsertingIntermediate:](-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), "imageByInsertingIntermediate:", 0)), -[CIDualRedEyeRepairSession destination](self, "destination"), buf, v68.origin.x, v68.origin.y, v68.size.width, v68.size.height, v68.origin.x, v68.origin.y);
    if (*(_QWORD *)buf)
    {
      v32 = CI_LOG_DUALRED();
      if (v32)
      {
        v33 = ci_logger_api();
        v32 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
        if (v32)
        {
          -[CIDualRedEyeRepairSession repairFace:filter:].cold.4();
LABEL_38:
          LOBYTE(v32) = 0;
          return v32;
        }
      }
      return v32;
    }
    v37 = v31;
    if (-[CIDualRedEyeRepairSession renderUsingProvidedCommandQueue](self, "renderUsingProvidedCommandQueue"))
    {
      -[MTLCommandBuffer commit](-[CIDualRedEyeRepairSession commandBuffer](self, "commandBuffer"), "commit");
      v38 = 0;
    }
    else
    {
      v38 = -[CIRenderTask waitUntilCompletedAndReturnError:](v37, "waitUntilCompletedAndReturnError:", buf);
    }
    v40 = *(_QWORD *)buf;
    v32 = CI_LOG_DUALRED();
    if (v40)
    {
      if (v32)
      {
        v41 = ci_logger_api();
        v32 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
        if (v32)
        {
          -[CIDualRedEyeRepairSession repairFace:filter:].cold.3();
          goto LABEL_38;
        }
      }
      return v32;
    }
    if (v32)
    {
      v44 = ci_logger_api();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        -[CIDualRedEyeRepairSession repairFace:filter:].cold.2();
        if (v38)
          goto LABEL_42;
        goto LABEL_45;
      }
    }
LABEL_41:
    if (v38)
    {
LABEL_42:
      if (CI_LOG_DUALRED())
      {
        v45 = ci_logger_api();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[CIDualRedEyeRepairSession repairFace:filter:].cold.1(v38, v45);
      }
    }
LABEL_45:
    LOBYTE(v32) = 1;
    return v32;
  }
  v34 = -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self->context, "startTaskToRender:fromRect:toDestination:atPoint:error:", v27, -[CIDualRedEyeRepairSession destination](self, "destination", Current), buf, v8, v10, v12, v14, v8, v10);
  if (!-[CIDualRedEyeRepairSession renderUsingProvidedCommandQueue](self, "renderUsingProvidedCommandQueue"))
    -[CIRenderTask waitUntilCompletedAndReturnError:](v34, "waitUntilCompletedAndReturnError:", buf);
  if (CI_LOG_DUALRED())
  {
    v35 = ci_logger_api();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession repairFace:filter:].cold.8();
  }
  if (!*(_QWORD *)buf)
  {
    v39 = -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self->context, "startTaskToRender:fromRect:toDestination:atPoint:error:", v27, -[CIDualRedEyeRepairSession destination](self, "destination"), buf, v54, v52, v50, v48, v54, v52);
    if (-[CIDualRedEyeRepairSession renderUsingProvidedCommandQueue](self, "renderUsingProvidedCommandQueue"))
    {
      -[MTLCommandBuffer commit](-[CIDualRedEyeRepairSession commandBuffer](self, "commandBuffer"), "commit");
      v38 = 0;
    }
    else
    {
      v38 = -[CIRenderTask waitUntilCompletedAndReturnError:](v39, "waitUntilCompletedAndReturnError:", buf);
    }
    if (CI_LOG_DUALRED())
    {
      v42 = ci_logger_api();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession repairFace:filter:].cold.6();
    }
    if (*(_QWORD *)buf)
    {
      v32 = CI_LOG_DUALRED();
      if (v32)
      {
        v43 = ci_logger_api();
        v32 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
        if (v32)
        {
          -[CIDualRedEyeRepairSession repairFace:filter:].cold.5();
          goto LABEL_38;
        }
      }
      return v32;
    }
    goto LABEL_41;
  }
  v32 = CI_LOG_DUALRED();
  if (v32)
  {
    v36 = ci_logger_api();
    v32 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      -[CIDualRedEyeRepairSession repairFace:filter:].cold.7();
      goto LABEL_38;
    }
  }
  return v32;
}

- (BOOL)setPrimary:(__CVBuffer *)a3 observations:(id)a4 metadata:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  CIImage *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  unint64_t v30;
  int *v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int *v67;
  _QWORD v68[2];
  void (*v69)(uint64_t);
  void *v70;
  uint64_t *v71;
  CIDualRedEyeRepairSession *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  int v76;
  uint8_t v77[4];
  int v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  _BYTE v82[28];
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const __CFString *v89;
  uint64_t v90;
  _DWORD v91[8];
  _DWORD v92[8];
  _BYTE v93[24];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  CFAbsoluteTimeGetCurrent();
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v76 = 0;
  v76 = 2 * objc_msgSend(a4, "count");
  v9 = ci_signpost_log_dualredeye();
  if ((unint64_t)&self->super.isa + 1 >= 2)
  {
    v10 = v9;
    if (os_signpost_enabled(v9))
    {
      v11 = *((_DWORD *)v74 + 6);
      *(_DWORD *)buf = 67109120;
      LODWORD(v80) = v11;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v10, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "setPrimary", "eyeCount:%d", buf, 8u);
    }
  }
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v69 = __62__CIDualRedEyeRepairSession_setPrimary_observations_metadata___block_invoke;
  v70 = &unk_1E2EC36F0;
  v71 = &v73;
  v72 = self;
  if (CI_LOG_DUALRED())
  {
    v12 = ci_logger_api();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.9(objc_msgSend(a4, "count"), (uint64_t)v93, v12);
  }
  if (CI_LOG_DUALRED())
  {
    v13 = ci_logger_api();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.8();
  }
  -[CIDualRedEyeRepairSession cleanupState](self, "cleanupState");
  -[CIDualRedEyeRepairSession setTimestamp:](self, "setTimestamp:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
  -[CIDualRedEyeRepairSession setMetadata:](self, "setMetadata:", a5);
  -[CIDualRedEyeRepairSession setObservations:](self, "setObservations:", a4);
  self->_primary = a3;
  -[CIDualRedEyeRepairTuning setTuningParametersByPortType:withCameraMetadata:](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "setTuningParametersByPortType:withCameraMetadata:", -[CIDualRedEyeRepairSession tuningParametersByPortType](self, "tuningParametersByPortType"), a5);
  if (CI_LOG_DUALRED())
  {
    v14 = ci_logger_api();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.7((uint64_t)-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), v92);
  }
  if (CI_LOG_DUALRED())
  {
    v15 = ci_logger_api();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.6((uint64_t)-[CIDualRedEyeRepairTuning repairTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "repairTuning"), v91);
  }
  -[CIDualRedEyeRepairSession setImageProperties:](self, "setImageProperties:", 0);
  if (a5 && objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ExifOrientation")))
  {
    v16 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ExifOrientation"));
    v88 = v16;
    v89 = CFSTR("CIImageProperties");
    v87 = *MEMORY[0x1E0CBCFF0];
    v90 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
    -[CIDualRedEyeRepairSession setImageProperties:](self, "setImageProperties:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1));
  }
  else
  {
    v16 = &unk_1E2F1B770;
  }
  if (-[CIDualRedEyeRepairSession renderUsingProvidedCommandQueue](self, "renderUsingProvidedCommandQueue"))
  {
    v17 = +[CIImage imageWithMTLTexture:options:](CIImage, "imageWithMTLTexture:options:", -[CIDualRedEyeRepairSession secondaryTexture](self, "secondaryTexture"), -[CIDualRedEyeRepairSession imageProperties](self, "imageProperties"));
  }
  else
  {
    if (!-[CIDualRedEyeRepairSession renderUsingPixelBuffers](self, "renderUsingPixelBuffers"))
      goto LABEL_25;
    v17 = +[CIImage imageWithCVPixelBuffer:options:](CIImage, "imageWithCVPixelBuffer:options:", self->_primary, -[CIDualRedEyeRepairSession imageProperties](self, "imageProperties"));
  }
  -[CIDualRedEyeRepairSession setPrimaryImage:](self, "setPrimaryImage:", v17);
LABEL_25:
  if (CI_LOG_DUALRED())
  {
    -[CIDualRedEyeRepairSession dumpInputs](self, "dumpInputs");
    if (-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"))
    {
      v18 = -[CIImage properties](-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), "properties")
          ? -[NSDictionary objectForKey:](-[CIImage properties](-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), "properties"), "objectForKey:", CFSTR("Orientation")): &unk_1E2F1B770;
      if (CI_LOG_DUALRED())
      {
        v19 = ci_logger_api();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v62 = objc_msgSend(v18, "intValue");
          -[CIImage extent](-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), "extent");
          v64 = v63;
          -[CIImage extent](-[CIDualRedEyeRepairSession primaryImage](self, "primaryImage"), "extent");
          *(_DWORD *)buf = 136446978;
          v80 = "-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]";
          v81 = 1024;
          *(_DWORD *)v82 = v62;
          *(_WORD *)&v82[4] = 2048;
          *(_QWORD *)&v82[6] = v64;
          *(_WORD *)&v82[14] = 2048;
          *(_QWORD *)&v82[16] = v65;
          _os_log_error_impl(&dword_1921E4000, v19, OS_LOG_TYPE_ERROR, "%{public}s Landmarks computed from orientation %d and size %f, %f", buf, 0x26u);
        }
      }
    }
  }
  if (-[CIDualRedEyeRepairSession validateSetPrimary](self, "validateSetPrimary"))
  {
    if (CI_LOG_DUALRED())
    {
      v20 = ci_logger_api();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.5(v20, v21, v22, v23, v24, v25, v26, v27);
    }
LABEL_37:
    -[CIDualRedEyeRepairSession cleanupState](self, "cleanupState");
    v28 = 0;
    goto LABEL_64;
  }
  v29 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = 0;
  v31 = &v78;
  while (objc_msgSend(a4, "count") > v30)
  {
    if (CI_LOG_DUALRED())
    {
      v32 = ci_logger_api();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v37 = objc_msgSend(a4, "count");
        *(_DWORD *)buf = 136446722;
        v80 = "-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]";
        v81 = 1024;
        *(_DWORD *)v82 = v30 + 1;
        *(_WORD *)&v82[4] = 1024;
        *(_DWORD *)&v82[6] = v37;
        _os_log_error_impl(&dword_1921E4000, v32, OS_LOG_TYPE_ERROR, "%{public}s Processing face observation %d / %d", buf, 0x18u);
      }
    }
    v33 = objc_msgSend(a4, "objectAtIndexedSubscript:", v30);
    if ((int)CI_LOG_DUALRED() >= 2)
      -[CIDualRedEyeRepairSession dumpObservation:index:](self, "dumpObservation:index:", v33, v30);
    v34 = -[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:](self, "redEyeFaceFromObservation:exifOrientation:", v33, objc_msgSend(v16, "intValue"));
    if (v34)
    {
      if (CI_LOG_DUALRED())
      {
        v35 = ci_logger_api();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v67 = v31;
          v66 = objc_msgSend(v34, "roiRenderSize");
          v38 = objc_msgSend(v34, "roiRenderOriginLeft");
          v39 = objc_msgSend(v34, "uvLeft");
          v40 = objc_msgSend(v34, "roiRenderOriginRight");
          v41 = objc_msgSend(v34, "uvRight");
          *(_DWORD *)buf = 136447490;
          v80 = "-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]";
          v81 = 2112;
          *(_QWORD *)v82 = v66;
          *(_WORD *)&v82[8] = 2112;
          *(_QWORD *)&v82[10] = v38;
          *(_WORD *)&v82[18] = 2112;
          *(_QWORD *)&v82[20] = v39;
          v83 = 2112;
          v84 = v40;
          v85 = 2112;
          v86 = v41;
          _os_log_error_impl(&dword_1921E4000, v35, OS_LOG_TYPE_ERROR, "%{public}s Good face: size %@ | left %@ axes %@ | right %@ axes %@ ", buf, 0x3Eu);
          v31 = v67;
        }
      }
      objc_msgSend(v29, "addObject:", v34);
    }
    else if (CI_LOG_DUALRED())
    {
      v36 = ci_logger_api();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.1(v77, v31, v36);
    }
    ++v30;
  }
  if (!objc_msgSend(v29, "count"))
  {
    if (CI_LOG_DUALRED())
    {
      v54 = ci_logger_api();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.2(v54, v55, v56, v57, v58, v59, v60, v61);
    }
    goto LABEL_37;
  }
  v42 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", CFSTR("kMaxFaceCount")), "unsignedIntegerValue");
  if (objc_msgSend(v29, "count") > v42)
  {
    objc_msgSend(v29, "sortUsingComparator:", &__block_literal_global_213);
    v29 = (void *)objc_msgSend(v29, "subarrayWithRange:", 0, v42);
  }
  -[CIDualRedEyeRepairSession setFaces:](self, "setFaces:", v29);
  CFAbsoluteTimeGetCurrent();
  if (CI_LOG_DUALRED())
  {
    v43 = ci_logger_api();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.4();
  }
  if (CI_LOG_DUALRED())
  {
    v44 = ci_logger_api();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession setPrimary:observations:metadata:].cold.3(v44, v45, v46, v47, v48, v49, v50, v51);
  }
  v52 = -[NSArray count](-[CIDualRedEyeRepairSession faces](self, "faces"), "count");
  *((_DWORD *)v74 + 6) = 2 * v52;
  v28 = 1;
LABEL_64:
  v69((uint64_t)v68);
  _Block_object_dispose(&v73, 8);
  return v28;
}

void __62__CIDualRedEyeRepairSession_setPrimary_observations_metadata___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = ci_signpost_log_dualredeye();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v2;
    if (os_signpost_enabled(v2))
    {
      v5 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v4, OS_SIGNPOST_INTERVAL_END, v3, "setPrimary", "eyeCount:%d", (uint8_t *)v6, 8u);
    }
  }
}

uint64_t __62__CIDualRedEyeRepairSession_setPrimary_observations_metadata___block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "areaMax");
  v5 = objc_msgSend(v4, "numberWithFloat:");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "areaMax");
  return objc_msgSend((id)objc_msgSend(v6, "numberWithFloat:"), "compare:", v5);
}

- (BOOL)repairPrimaryWithSecondary:(__CVBuffer *)a3
{
  return -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:](self, "_repairPrimaryWithSecondary:to:", a3, self->_primary);
}

- (BOOL)_repairPrimaryWithSecondary:(__CVBuffer *)a3 to:(__CVBuffer *)a4
{
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double Current;
  CIFilter *v42;
  CIImage *v43;
  NSUInteger v44;
  __int128 v45;
  NSUInteger v46;
  NSUInteger v47;
  NSObject *v48;
  NSObject *v49;
  BOOL v50;
  NSObject *v51;
  NSObject *v52;
  int v53;
  NSObject *v54;
  double v55;
  NSObject *v56;
  BOOL v57;
  __int128 v59;
  void *context;
  _QWORD v61[2];
  void (*v62)(uint64_t);
  void *v63;
  CIDualRedEyeRepairSession *v64;
  int v65;
  _QWORD v66[2];
  void (*v67)(uint64_t);
  void *v68;
  CIDualRedEyeRepairSession *v69;
  int v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  int v76;
  uint8_t v77[4];
  uint64_t v78;
  _QWORD v79[2];
  _QWORD v80[2];
  int v81[8];
  int v82[8];
  int v83[8];
  int v84[8];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v7 = -[NSArray count](-[CIDualRedEyeRepairSession faces](self, "faces"), "count");
  v8 = ci_signpost_log_dualredeye();
  if ((unint64_t)&self->super.isa + 1 >= 2)
  {
    v54 = v8;
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v72) = v7;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v54, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "repairPrimaryWithSecondary", "eyeCount:%d", buf, 8u);
    }
  }
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v67 = __60__CIDualRedEyeRepairSession__repairPrimaryWithSecondary_to___block_invoke;
  v68 = &__block_descriptor_44_e5_v8__0l;
  v69 = self;
  v70 = v7;
  if (CI_LOG_DUALRED())
  {
    v9 = ci_logger_api();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:].cold.8(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  if (CI_LOG_DUALRED())
  {
    v17 = ci_logger_api();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:].cold.7((uint64_t)-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), v84);
  }
  if (CI_LOG_DUALRED())
  {
    v18 = ci_logger_api();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:].cold.6((uint64_t)-[CIDualRedEyeRepairTuning repairTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "repairTuning"), v83);
  }
  if (!-[CIDualRedEyeRepairSession context](self, "context")
    || -[CIContext workingFormat](-[CIDualRedEyeRepairSession context](self, "context"), "workingFormat") != 2056)
  {
    if (CI_LOG_DUALRED())
    {
      v19 = ci_logger_api();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:].cold.5(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    -[CIDualRedEyeRepairSession setContext:](self, "setContext:", +[CIDualRedEyeRepairSession _contextRGBAh](CIDualRedEyeRepairSession, "_contextRGBAh"));
  }
  if (-[CIDualRedEyeRepairSession renderUsingPixelBuffers](self, "renderUsingPixelBuffers"))
  {
    -[CIDualRedEyeRepairSession setDestination:](self, "setDestination:", -[CIRenderDestination initWithPixelBuffer:]([CIRenderDestination alloc], "initWithPixelBuffer:", a4));
    self->_secondary = a3;
    self->_output = a4;
    -[CIDualRedEyeRepairSession setSecondaryImage:](self, "setSecondaryImage:", +[CIImage imageWithCVPixelBuffer:options:](CIImage, "imageWithCVPixelBuffer:options:", a3, -[CIDualRedEyeRepairSession imageProperties](self, "imageProperties")));
  }
  if (-[CIDualRedEyeRepairSession renderUsingProvidedCommandQueue](self, "renderUsingProvidedCommandQueue"))
    -[CIDualRedEyeRepairSession setSecondaryImage:](self, "setSecondaryImage:", +[CIImage imageWithMTLTexture:options:](CIImage, "imageWithMTLTexture:options:", -[CIDualRedEyeRepairSession secondaryTexture](self, "secondaryTexture"), -[CIDualRedEyeRepairSession imageProperties](self, "imageProperties")));
  if (CI_LOG_DUALRED())
  {
    v27 = ci_logger_api();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      -[CIImage extent](self->primaryImage, "extent");
      v29 = v28;
      v31 = v30;
      v33 = v32;
      -[CIImage extent](self->primaryImage, "extent");
      -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:].cold.4(v82, v29, v31, v33);
    }
  }
  if (CI_LOG_DUALRED())
  {
    v34 = ci_logger_api();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      -[CIImage extent](self->secondaryImage, "extent");
      v36 = v35;
      v38 = v37;
      v40 = v39;
      -[CIImage extent](self->secondaryImage, "extent");
      -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:].cold.3(v81, v36, v38, v40);
    }
  }
  if ((int)CI_LOG_DUALRED() >= 2)
    -[CIDualRedEyeRepairSession dumpSecondary](self, "dumpSecondary");
  if (-[CIDualRedEyeRepairSession validateRepair](self, "validateRepair"))
  {
    -[CIDualRedEyeRepairSession cleanupState](self, "cleanupState");
  }
  else
  {
    context = (void *)MEMORY[0x194026220]();
    Current = CFAbsoluteTimeGetCurrent();
    v42 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIRedEyeRaw"));
    -[CIFilter setValuesForKeysWithDictionary:](v42, "setValuesForKeysWithDictionary:", -[CIDualRedEyeRepairTuning repairTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "repairTuning"));
    v79[0] = CFSTR("inputPrimary");
    v43 = -[CIDualRedEyeRepairSession primaryImage](self, "primaryImage");
    v79[1] = CFSTR("inputSecondary");
    v80[0] = v43;
    v80[1] = -[CIDualRedEyeRepairSession secondaryImage](self, "secondaryImage");
    -[CIFilter setValuesForKeysWithDictionary:](v42, "setValuesForKeysWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2));
    -[CIFilter setValue:forKey:](v42, "setValue:forKey:", -[NSDictionary objectForKeyedSubscript:](-[CIDualRedEyeRepairTuning sessionTuning](-[CIDualRedEyeRepairSession tuning](self, "tuning"), "sessionTuning"), "objectForKeyedSubscript:", CFSTR("kUseFaceSegmentationMask")), CFSTR("inputUseFaceSegmentationMask"));
    v44 = 0;
    *(_QWORD *)&v45 = 136446722;
    v59 = v45;
    while (1)
    {
      v46 = v44;
      v47 = -[NSArray count](-[CIDualRedEyeRepairSession faces](self, "faces", v59), "count");
      if (v47 <= v46)
        break;
      v48 = ci_signpost_log_dualredeye();
      if ((unint64_t)&self->super.isa + 1 >= 2)
      {
        v52 = v48;
        if (os_signpost_enabled(v48))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v72) = v46;
          _os_signpost_emit_with_name_impl(&dword_1921E4000, v52, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "repairFace", "face:%d", buf, 8u);
        }
      }
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v62 = __60__CIDualRedEyeRepairSession__repairPrimaryWithSecondary_to___block_invoke_215;
      v63 = &__block_descriptor_44_e5_v8__0l;
      v64 = self;
      v65 = v46;
      if (CI_LOG_DUALRED())
      {
        v49 = ci_logger_api();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v53 = -[NSArray count](-[CIDualRedEyeRepairSession faces](self, "faces"), "count");
          *(_DWORD *)buf = v59;
          v72 = "-[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:]";
          v73 = 1024;
          v74 = v46 + 1;
          v75 = 1024;
          v76 = v53;
          _os_log_error_impl(&dword_1921E4000, v49, OS_LOG_TYPE_ERROR, "%{public}s Repair %d/%d", buf, 0x18u);
        }
      }
      if (-[CIDualRedEyeRepairSession renderUsingProvidedCommandQueue](self, "renderUsingProvidedCommandQueue"))
      {
        -[CIDualRedEyeRepairSession setCommandBuffer:](self, "setCommandBuffer:", -[MTLCommandQueue commandBuffer](-[CIDualRedEyeRepairSession commandQueue](self, "commandQueue"), "commandBuffer"));
        -[CIDualRedEyeRepairSession setDestination:](self, "setDestination:", -[CIRenderDestination initWithMTLTexture:commandBuffer:]([CIRenderDestination alloc], "initWithMTLTexture:commandBuffer:", -[CIDualRedEyeRepairSession outputTexture](self, "outputTexture"), -[CIDualRedEyeRepairSession commandBuffer](self, "commandBuffer")));
      }
      v50 = -[CIDualRedEyeRepairSession repairFace:filter:](self, "repairFace:filter:", -[NSArray objectAtIndexedSubscript:](-[CIDualRedEyeRepairSession faces](self, "faces"), "objectAtIndexedSubscript:", v46), v42);
      if (!v50)
      {
        if (CI_LOG_DUALRED())
        {
          v51 = ci_logger_api();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:].cold.1(v77, &v78, v51);
        }
        -[CIDualRedEyeRepairSession cleanupState](self, "cleanupState");
      }
      v62((uint64_t)v61);
      v44 = v46 + 1;
      if (!v50)
        goto LABEL_55;
    }
    v55 = CFAbsoluteTimeGetCurrent();
    if (CI_LOG_DUALRED())
    {
      v56 = ci_logger_api();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:].cold.2(-[NSArray count](-[CIDualRedEyeRepairSession faces](self, "faces"), "count"), (uint64_t)buf, v56, (v55 - Current) * 1000.0);
    }
    if ((int)CI_LOG_DUALRED() >= 2)
      dump(+[CIImage imageWithCVPixelBuffer:options:](CIImage, "imageWithCVPixelBuffer:options:", self->_primary, -[CIDualRedEyeRepairSession imageProperties](self, "imageProperties")), (uint64_t)CFSTR("-repair"), +[CIDualRedEyeRepairSession _contextRGBAh](CIDualRedEyeRepairSession, "_contextRGBAh"), (uint64_t)-[CIDualRedEyeRepairSession timestamp](self, "timestamp"));
LABEL_55:
    objc_autoreleasePoolPop(context);
    if (v47 <= v46)
    {
      -[CIDualRedEyeRepairSession cleanupState](self, "cleanupState");
      v57 = 1;
      goto LABEL_57;
    }
  }
  v57 = 0;
LABEL_57:
  v67((uint64_t)v66);
  return v57;
}

void __60__CIDualRedEyeRepairSession__repairPrimaryWithSecondary_to___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = ci_signpost_log_dualredeye();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v2;
    if (os_signpost_enabled(v2))
    {
      v5 = *(_DWORD *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v4, OS_SIGNPOST_INTERVAL_END, v3, "repairPrimaryWithSecondary", "eyeCount:%d", (uint8_t *)v6, 8u);
    }
  }
}

void __60__CIDualRedEyeRepairSession__repairPrimaryWithSecondary_to___block_invoke_215(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = ci_signpost_log_dualredeye();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v2;
    if (os_signpost_enabled(v2))
    {
      v5 = *(_DWORD *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v4, OS_SIGNPOST_INTERVAL_END, v3, "repairFace", "face:%d", (uint8_t *)v6, 8u);
    }
  }
}

- (void)dumpSecondary
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136447234;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_15_0(&dword_1921E4000, v0, v1, "%{public}s pixelformat of secondary image is %c%c%c%c", (uint8_t *)v2);
  OUTLINED_FUNCTION_8();
}

- (void)dumpObservation:(id)a3 index:(int)a4
{
  uint64_t v4;
  void *v6;
  NSObject *v7;
  uint64_t v8;

  v4 = *(_QWORD *)&a4;
  v8 = 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v8);
  if (v8)
  {
    if (CI_LOG_DUALRED())
    {
      v7 = ci_logger_api();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CIDualRedEyeRepairSession dumpObservation:index:].cold.1();
    }
  }
  else
  {
    objc_msgSend(v6, "writeToFile:atomically:", dumpfilepathWithTag(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%d"), CFSTR("-observation"), v4), (uint64_t)CFSTR(".archive"), (uint64_t)-[CIDualRedEyeRepairSession timestamp](self, "timestamp")), 0);
  }
}

- (CIContext)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSArray)observations
{
  return self->observations;
}

- (void)setObservations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (CIRenderDestination)destination
{
  return self->destination;
}

- (void)setDestination:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (CIImage)primaryImage
{
  return self->primaryImage;
}

- (void)setPrimaryImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (CIImage)secondaryImage
{
  return self->secondaryImage;
}

- (void)setSecondaryImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSDictionary)metadata
{
  return self->metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSDictionary)imageProperties
{
  return self->imageProperties;
}

- (void)setImageProperties:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSArray)faces
{
  return self->faces;
}

- (void)setFaces:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIDualRedEyeRepairTuning)tuning
{
  return self->tuning;
}

- (void)setTuning:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSDate)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSDictionary)tuningParametersByPortType
{
  return self->tuningParametersByPortType;
}

- (void)setTuningParametersByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (MTLCommandQueue)commandQueue
{
  return self->commandQueue;
}

- (void)setCommandQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (MTLTexture)primaryTexture
{
  return self->primaryTexture;
}

- (void)setPrimaryTexture:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (MTLTexture)secondaryTexture
{
  return self->secondaryTexture;
}

- (void)setSecondaryTexture:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (MTLTexture)outputTexture
{
  return self->outputTexture;
}

- (void)setOutputTexture:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (MTLCommandBuffer)commandBuffer
{
  return self->commandBuffer;
}

- (void)setCommandBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (void)prewarm
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  v2[0] = 136446466;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Prewarming failed: prepareRender failed with error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)validateRenderState
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s fail: should provide either a command queue and Metal texture, or a primary pixel buffer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)validateSetPrimary
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s fail: nil primary", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)validateRepair
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s fail: no CIContext available", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s skip: no landmarks for this face observation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s skip: missing eye landmarks for this face observation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(float)a1 exifOrientation:.cold.3(float a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00], a1);
  v3[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v1, v2, "%{public}s skip: confidence too low (%f)", (uint8_t *)v3);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(float)a1 exifOrientation:.cold.4(float a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00], a1);
  v3[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v1, v2, "%{public}s skip: junkiness too high (%f)", (uint8_t *)v3);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(float)a1 exifOrientation:.cold.5(float a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00], a1);
  v3[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v1, v2, "%{public}s skip: eye isotropy too large (%f)", (uint8_t *)v3);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(float)a1 exifOrientation:.cold.6(float a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00], a1);
  v3[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v1, v2, "%{public}s skip: eye constellation area too small (%f)", (uint8_t *)v3);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s ERROR: VNObservation does not have face segments but its use was requested.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Probabilities for face segments returned nil. Skipping this face.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(void *)a1 exifOrientation:(NSObject *)a2 .cold.9(void *a1, NSObject *a2)
{
  double v4;
  int v5;
  double v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "extent");
  v5 = (int)v4;
  objc_msgSend(a1, "extent");
  v8 = 136447234;
  v9 = "-[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]";
  v10 = 1024;
  v11 = 256;
  v12 = 1024;
  v13 = v5;
  v14 = 1024;
  v15 = 256;
  v16 = 1024;
  v17 = (int)v6;
  OUTLINED_FUNCTION_15_0(&dword_1921E4000, a2, v7, "%{public}s Unexpected size for face probabilities: %d != %d, %d != %d", (uint8_t *)&v8);
  OUTLINED_FUNCTION_12_0();
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Skipping focus check", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(float)a3 exifOrientation:(uint64_t)a4 .cold.11(NSObject *a1, float a2, float a3, uint64_t a4, uint64_t a5)
{
  int v5;
  const char *v6;
  __int16 v7;
  double v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = 136446722;
  v6 = "-[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]";
  v7 = 2048;
  v8 = a2;
  v9 = 2048;
  v10 = a3;
  OUTLINED_FUNCTION_7_0(&dword_1921E4000, a1, a5, "%{public}s skip: face out of focus: %.3f > %.3f", (uint8_t *)&v5);
  OUTLINED_FUNCTION_8();
}

- (void)redEyeFaceFromObservation:exifOrientation:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Time spent computing focus stats: %.3fms\n", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(float)a4 .cold.13(uint64_t a1, NSObject *a2, uint64_t a3, float a4)
{
  int v4;
  const char *v5;
  __int16 v6;
  double v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = 136446722;
  v5 = "-[CIDualRedEyeRepairSession redEyeFaceFromObservation:exifOrientation:]";
  v6 = 2048;
  v7 = a4;
  v8 = 2048;
  v9 = a1;
  OUTLINED_FUNCTION_7_0(&dword_1921E4000, a2, a3, "%{public}s Focus variance = %.3f, count = %ld\n", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8();
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Inferring pupils from eye constellation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Inferring pupils from face segmentation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(void *)a1 exifOrientation:(NSObject *)a2 .cold.16(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  v4[0] = 136446466;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_16(&dword_1921E4000, a2, v3, "%{public}s Probabilities for face segments returned not enough features (%d but expected 5). Skipping this face.", (uint8_t *)v4);
  OUTLINED_FUNCTION_8();
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s skip: left and right eyes should have exactly the same size", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(uint64_t)a3 exifOrientation:(uint64_t)a4 .cold.18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s skip: unable to compute eye short and long axes", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:(void *)a1 exifOrientation:(NSObject *)a2 .cold.19(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  v4[0] = 136446466;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_16(&dword_1921E4000, a2, v3, "%{public}s skip: unexpected constellation size: %d != (6 or 8)", (uint8_t *)v4);
  OUTLINED_FUNCTION_8();
}

- (void)redEyeFaceFromObservation:(void *)a1 exifOrientation:(NSObject *)a2 .cold.20(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a1, "primaryImage"), "properties");
  v4[0] = 136446466;
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, a2, v3, "%{public}s Properties for primaryImage %@", (uint8_t *)v4);
  OUTLINED_FUNCTION_8();
}

- (void)redEyeFaceFromObservation:exifOrientation:.cold.21()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Right Eye landmarks %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)redEyeFaceFromObservation:exifOrientation:.cold.22()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Left  Eye landmarks %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)repairFace:(void *)a1 filter:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "kernelExecutionTime");
  v4[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, a2, v3, "%{public}s Kernel execution took %.3fms", (uint8_t *)v4);
  OUTLINED_FUNCTION_8();
}

- (void)repairFace:filter:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_18();
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s startTaskToRender (composite) took %.3fms", (uint8_t *)v2);
  OUTLINED_FUNCTION_8_1();
}

- (void)repairFace:filter:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  v2[0] = 136446466;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Error in waitUntilCompletedAndReturnError: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)repairFace:filter:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  v2[0] = 136446466;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Error in startTaskToRender: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)repairFace:filter:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  v2[0] = 136446466;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Error in startTaskToRender (right): %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)repairFace:filter:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_18();
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s startTaskToRender (right) took %.3fms", (uint8_t *)v2);
  OUTLINED_FUNCTION_8_1();
}

- (void)repairFace:filter:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  v2[0] = 136446466;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Error in startTaskToRender (left): %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)repairFace:filter:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_18();
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s startTaskToRender (left) took %.3fms", (uint8_t *)v2);
  OUTLINED_FUNCTION_8_1();
}

- (void)repairFace:filter:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_18();
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Output image took %.3fms", (uint8_t *)v2);
  OUTLINED_FUNCTION_8_1();
}

- (void)setPrimary:(uint8_t *)a1 observations:(_QWORD *)a2 metadata:(NSObject *)a3 .cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]";
  OUTLINED_FUNCTION_1_4(&dword_1921E4000, a3, (uint64_t)a3, "%{public}s Bad face, skipping", a1);
}

- (void)setPrimary:(uint64_t)a3 observations:(uint64_t)a4 metadata:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s fail: no good landmarks found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)setPrimary:(uint64_t)a3 observations:(uint64_t)a4 metadata:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s setPrimary returning successfully", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)setPrimary:observations:metadata:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Total time spent during setPrimary: %.3fms", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)setPrimary:(uint64_t)a3 observations:(uint64_t)a4 metadata:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Failed to validate inputs during set primary", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)setPrimary:(uint64_t)a1 observations:(_DWORD *)a2 metadata:.cold.6(uint64_t a1, _DWORD *a2)
{
  NSObject *v2;
  uint8_t *v3;

  *a2 = 136446466;
  OUTLINED_FUNCTION_9_1(a1, (uint64_t)a2, (uint64_t)"-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]");
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v2, (uint64_t)v2, "%{public}s setPrimary repair tuning:\n%@", v3);
}

- (void)setPrimary:(uint64_t)a1 observations:(_DWORD *)a2 metadata:.cold.7(uint64_t a1, _DWORD *a2)
{
  NSObject *v2;
  uint8_t *v3;

  *a2 = 136446466;
  OUTLINED_FUNCTION_9_1(a1, (uint64_t)a2, (uint64_t)"-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]");
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v2, (uint64_t)v2, "%{public}s setPrimary session tuning:\n%@", v3);
}

- (void)setPrimary:observations:metadata:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s setPrimary metadata:\n%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)setPrimary:(int)a1 observations:(uint64_t)a2 metadata:(NSObject *)a3 .cold.9(int a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136446466;
  *(_QWORD *)(a2 + 4) = "-[CIDualRedEyeRepairSession setPrimary:observations:metadata:]";
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_16(&dword_1921E4000, a3, (uint64_t)a3, "%{public}s setPrimary %d observations", (uint8_t *)a2);
}

- (void)_repairPrimaryWithSecondary:(NSObject *)a3 to:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "-[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:]";
  OUTLINED_FUNCTION_1_4(&dword_1921E4000, a3, (uint64_t)a3, "%{public}s Error while repairing face", a1);
}

- (void)_repairPrimaryWithSecondary:(NSObject *)a3 to:(double)a4 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3, double a4)
{
  *(_DWORD *)a2 = 136446722;
  *(_QWORD *)(a2 + 4) = "-[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:]";
  *(_WORD *)(a2 + 12) = 2048;
  *(double *)(a2 + 14) = a4;
  *(_WORD *)(a2 + 22) = 2048;
  *(double *)(a2 + 24) = a4 / (double)(unint64_t)(2 * a1);
  OUTLINED_FUNCTION_7_0(&dword_1921E4000, a3, (uint64_t)a3, "%{public}s Total time spent during repair: %.3fms = %.3fms/eye", (uint8_t *)a2);
}

- (void)_repairPrimaryWithSecondary:(double)a3 to:(double)a4 .cold.3(_DWORD *a1, double a2, double a3, double a4)
{
  NSObject *v4;
  uint64_t v5;
  uint8_t *v6;

  *a1 = 136446722;
  OUTLINED_FUNCTION_14_0((uint64_t)a1, (int)a4);
  OUTLINED_FUNCTION_19(&dword_1921E4000, v4, v5, "%{public}s CVPixelBuffer size (secondary) = %d, %d", v6);
}

- (void)_repairPrimaryWithSecondary:(double)a3 to:(double)a4 .cold.4(_DWORD *a1, double a2, double a3, double a4)
{
  NSObject *v4;
  uint64_t v5;
  uint8_t *v6;

  *a1 = 136446722;
  OUTLINED_FUNCTION_14_0((uint64_t)a1, (int)a4);
  OUTLINED_FUNCTION_19(&dword_1921E4000, v4, v5, "%{public}s CVPixelBuffer size (primary) = %d, %d", v6);
}

- (void)_repairPrimaryWithSecondary:(uint64_t)a3 to:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Forcing working format to RGBAh", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_repairPrimaryWithSecondary:(uint64_t)a1 to:(_DWORD *)a2 .cold.6(uint64_t a1, _DWORD *a2)
{
  NSObject *v2;
  uint8_t *v3;

  *a2 = 136446466;
  OUTLINED_FUNCTION_9_1(a1, (uint64_t)a2, (uint64_t)"-[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:]");
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v2, (uint64_t)v2, "%{public}s repairPrimary repair tuning:\n%@", v3);
}

- (void)_repairPrimaryWithSecondary:(uint64_t)a1 to:(_DWORD *)a2 .cold.7(uint64_t a1, _DWORD *a2)
{
  NSObject *v2;
  uint8_t *v3;

  *a2 = 136446466;
  OUTLINED_FUNCTION_9_1(a1, (uint64_t)a2, (uint64_t)"-[CIDualRedEyeRepairSession _repairPrimaryWithSecondary:to:]");
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v2, (uint64_t)v2, "%{public}s repairPrimary session tuning:\n%@", v3);
}

- (void)_repairPrimaryWithSecondary:(uint64_t)a3 to:(uint64_t)a4 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s repairPrimaryWithSecondary called", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)dumpObservation:index:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  v2[0] = 136446466;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Failed to archive the observations: %@\n", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

@end
