@implementation NUHDRApplyGainMapFilter

+ (id)meteorPlusGainMapApplyKernel
{
  if (meteorPlusGainMapApplyKernel_once != -1)
    dispatch_once(&meteorPlusGainMapApplyKernel_once, &__block_literal_global_8816);
  return (id)meteorPlusGainMapApplyKernel_s_meteorPlusGainMapApplyKernel;
}

+ (id)flexRangeGainMapApplyKernel
{
  if (flexRangeGainMapApplyKernel_once != -1)
    dispatch_once(&flexRangeGainMapApplyKernel_once, &__block_literal_global_43);
  return (id)flexRangeGainMapApplyKernel_s_flexRangeGainMapApplyKernel;
}

+ (id)flexRangeGainMapApplyRGBKernel
{
  if (flexRangeGainMapApplyRGBKernel_once != -1)
    dispatch_once(&flexRangeGainMapApplyRGBKernel_once, &__block_literal_global_46);
  return (id)flexRangeGainMapApplyRGBKernel_s_flexRangeGainMapApplyRGBKernel;
}

void __57__NUHDRApplyGainMapFilter_flexRangeGainMapApplyRGBKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("vec3 s_pow(vec3 x, vec3 g) {  vec3 a = max(abs(x), 1e-6); \n  return sign(x) * pow(a, g); \n}kernel vec4 flx_gain_apply_rgb(__sample im, __sample gm, vec3 a, vec3 b, vec3 g, vec3 s, vec3 kx, vec3 ky) \n{ \n  vec3 gainLog2 = a * s_pow(gm.rgb, g) + b; \n  vec3 gainLin = exp2(s * gainLog2); \n  vec3 rgb = gainLin * (im.rgb + kx) - ky; \n  return vec4(rgb, 1.0); \n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)flexRangeGainMapApplyRGBKernel_s_flexRangeGainMapApplyRGBKernel;
  flexRangeGainMapApplyRGBKernel_s_flexRangeGainMapApplyRGBKernel = v0;

}

void __54__NUHDRApplyGainMapFilter_flexRangeGainMapApplyKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("float s_pow(float x, float g) {  float a = max(abs(x), 1e-6); \n  return sign(x) * pow(a, g); \n}kernel vec4 flx_gain_apply(__sample im, __sample gm, vec4 p, vec2 k) \n{ \n  float gainLog2 = p.x * s_pow(gm.r, p.y) + p.z; \n  float gainLin = exp2(p.w * gainLog2); \n  vec3 rgb = gainLin * (im.rgb + k.x) - k.y; \n  return vec4(rgb, 1.0); \n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)flexRangeGainMapApplyKernel_s_flexRangeGainMapApplyKernel;
  flexRangeGainMapApplyKernel_s_flexRangeGainMapApplyKernel = v0;

}

void __55__NUHDRApplyGainMapFilter_meteorPlusGainMapApplyKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 mpp_gain_apply(__sample im, __sample gm, float h) \n{ \n  float gain = 1.0 + (h - 1.0) * gm.r; \n  float3 rgb = gain * im.rgb; \n  return vec4(rgb, 1.0); \n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)meteorPlusGainMapApplyKernel_s_meteorPlusGainMapApplyKernel;
  meteorPlusGainMapApplyKernel_s_meteorPlusGainMapApplyKernel = v0;

}

- (id)outputImage
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  float v39;
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
  float v55;
  float v56;
  float v57;
  float v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  uint64_t v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  void *v111;
  float v112;
  uint64_t v113;
  void *v114;
  void *v115;
  float v116;
  void *v117;
  float v118;
  void *v119;
  void *v120;
  void *v121;
  CGAffineTransform v122;
  _QWORD v123[3];
  _QWORD v124[4];
  _QWORD v125[10];

  v125[8] = *MEMORY[0x1E0C80C00];
  -[NUHDRApplyGainMapFilter inputImage](self, "inputImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NUHDRApplyGainMapFilter inputGainMap](self, "inputGainMap");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    -[NUHDRApplyGainMapFilter inputHeadroom](self, "inputHeadroom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = fmaxf(v8, 1.0);

    -[NUHDRApplyGainMapFilter inputColorSpace](self, "inputColorSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "linearized");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      +[NUColorSpace displayP3LinearColorSpace](NUColorSpace, "displayP3LinearColorSpace");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    v15 = fminf(v9, 16.0);

    objc_msgSend(v3, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v14, "CGColorSpace"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "_imageByClampingAlpha");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "extent");
    v19 = v18;
    v21 = v20;
    objc_msgSend(v5, "extent");
    CGAffineTransformMakeScale(&v122, v19 / v22, v21 / v23);
    objc_msgSend(v5, "imageByApplyingTransform:", &v122);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUHDRApplyGainMapFilter flexRangeProperties](self, "flexRangeProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v120 = v5;
      v25 = log2f(v15);
      objc_msgSend(v24, "baseHeadroom");
      v27 = v26;
      objc_msgSend(v24, "alternateHeadroom");
      v29 = fminf(fmaxf((float)(v25 - v27) / (float)(v28 - v27), 0.0), 1.0);
      if (v25 <= v27)
        v30 = -v29;
      else
        v30 = v29;
      -[NUHDRApplyGainMapFilter flexRangeProperties](self, "flexRangeProperties");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "channelInfo");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v32;
      if (objc_msgSend(v32, "count") == 3)
      {
        v114 = v32;
        objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndexedSubscript:", 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndexedSubscript:", 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "gamma");
        v118 = v37;
        objc_msgSend(v35, "gamma");
        v116 = v38;
        objc_msgSend(v36, "gamma");
        v112 = v39;
        objc_msgSend(v34, "min");
        v41 = v40;
        objc_msgSend(v35, "min");
        v43 = v42;
        objc_msgSend(v36, "min");
        v45 = v44;
        objc_msgSend(v34, "max");
        v47 = v46;
        objc_msgSend(v35, "max");
        v110 = v30;
        v49 = v48;
        objc_msgSend(v36, "max");
        v51 = v50;
        objc_msgSend(v34, "baseOffset");
        v109 = v52;
        objc_msgSend(v35, "baseOffset");
        v107 = v53;
        objc_msgSend(v36, "baseOffset");
        v105 = v54;
        objc_msgSend(v34, "alternateOffset");
        v108 = v55;
        objc_msgSend(v35, "alternateOffset");
        v106 = v56;
        objc_msgSend(v36, "alternateOffset");
        v58 = v57;
        v115 = v24;
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:", (float)(v47 - v41), (float)(v49 - v43), (float)(v51 - v45));
        v59 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:", v41, v43, v45);
        v104 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:", (float)(1.0 / v118), (float)(1.0 / v116), (float)(1.0 / v112));
        v113 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:", v110, v110, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:", v109, v107, v105);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:", v108, v106, v58);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "flexRangeGainMapApplyRGBKernel");
        v117 = v14;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "extent");
        v64 = v63;
        v66 = v65;
        v68 = v67;
        v70 = v69;
        v125[0] = v17;
        v125[1] = v121;
        v119 = (void *)v59;
        v125[2] = v59;
        v71 = (void *)v104;
        v125[3] = v104;
        v125[4] = v113;
        v125[5] = v111;
        v125[6] = v60;
        v125[7] = v61;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 8);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "applyWithExtent:arguments:", v72, v64, v66, v68, v70);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = v114;
        v14 = v117;

        v24 = v115;
        v17 = (void *)v113;
      }
      else
      {
        objc_msgSend(v32, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "gamma");
        v84 = v83;
        objc_msgSend(v34, "min");
        v86 = v85;
        objc_msgSend(v34, "max");
        v88 = v87;
        objc_msgSend(v34, "baseOffset");
        v90 = v89;
        objc_msgSend(v34, "alternateOffset");
        v92 = v91;
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", (float)(v88 - v86), (float)(1.0 / v84), v86, v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", v90, v92);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "flexRangeGainMapApplyKernel");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "extent");
        v95 = v94;
        v97 = v96;
        v99 = v98;
        v101 = v100;
        v124[0] = v17;
        v124[1] = v121;
        v124[2] = v35;
        v124[3] = v36;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 4);
        v119 = v93;
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "applyWithExtent:arguments:", v95, v97, v99, v101);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v17 = v36;
      v5 = v120;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "meteorPlusGainMapApplyKernel");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "extent");
      v76 = v75;
      v78 = v77;
      v80 = v79;
      v82 = v81;
      v123[0] = v17;
      v123[1] = v121;
      *(float *)&v75 = v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v75);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v123[2] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v74;
      objc_msgSend(v74, "applyWithExtent:arguments:", v35, v76, v78, v80, v82);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v73, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v14, "CGColorSpace"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v102;
    v6 = v3;
  }

  return v6;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)inputGainMap
{
  return self->_inputGainMap;
}

- (void)setInputGainMap:(id)a3
{
  objc_storeStrong((id *)&self->_inputGainMap, a3);
}

- (NSNumber)inputHeadroom
{
  return self->_inputHeadroom;
}

- (void)setInputHeadroom:(id)a3
{
  objc_storeStrong((id *)&self->_inputHeadroom, a3);
}

- (NUColorSpace)inputColorSpace
{
  return self->_inputColorSpace;
}

- (void)setInputColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_inputColorSpace, a3);
}

- (NUFlexRangeProperties)flexRangeProperties
{
  return self->_flexRangeProperties;
}

- (void)setFlexRangeProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flexRangeProperties, 0);
  objc_storeStrong((id *)&self->_inputColorSpace, 0);
  objc_storeStrong((id *)&self->_inputHeadroom, 0);
  objc_storeStrong((id *)&self->_inputGainMap, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
