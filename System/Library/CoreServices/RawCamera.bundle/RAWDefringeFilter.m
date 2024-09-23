@implementation RAWDefringeFilter

- (id)outputImage
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  float v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  float v48;
  float v49;
  double v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  CIImage *inputImage;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double x;
  double y;
  double width;
  double height;
  NSNumber *inputWidth;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  CIImage *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  void *v101;
  CIImage *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  CGFloat v124;
  RAWDefringeFilter *v125;
  const char *v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  double v132;
  double v133;
  double v134;
  double v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  void *v145;
  CIImage *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  double v151;
  double v152;
  double v153;
  double v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  double v169;
  double v170;
  double v171;
  CGFloat v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  int v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  double v192;
  double v193;
  double v194;
  double v195;
  const char *v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  void *v202;
  void (**v203)(_QWORD);
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  RAWDefringeFilter *exception_object;
  _QWORD v220[4];
  int v221;
  _QWORD v222[4];
  float v223;
  _QWORD v224[5];
  _QWORD v225[5];
  uint8_t buf[8];
  _QWORD v227[3];
  _QWORD v228[2];
  _QWORD v229[4];
  _QWORD v230[2];
  _QWORD v231[3];
  _QWORD v232[5];
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;

  v232[3] = *MEMORY[0x1E0C80C00];
  if (self->inputImage)
  {
    sub_1D52EB19C();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWDefringeFilter", (const char *)&unk_1D548AF1A, buf, 2u);
    }
    exception_object = self;

    v225[0] = MEMORY[0x1E0C809B0];
    v225[1] = 3221225472;
    v225[2] = sub_1D53F3AF8;
    v225[3] = &unk_1E996F870;
    v225[4] = self;
    v203 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v225);
    objc_msgSend_kernelWithName_(DeFringeKernels, v5, (uint64_t)CFSTR("deFringeNlimited"), v6, v7);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(DeFringeKernels, v8, (uint64_t)CFSTR("deFringeAxial"), v9, v10);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(FringeDirectionsKernels, v11, (uint64_t)CFSTR("boostAndGamma"), v12, v13);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(FringeDirectionsKernels, v14, (uint64_t)CFSTR("fringeDirections1_7"), v15, v16);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(FringeDirectionsKernels, v17, (uint64_t)CFSTR("fringeDirections2_7"), v18, v19);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(FringeDirectionsKernels, v20, (uint64_t)CFSTR("fringeDisplacementLimited"), v21, v22);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(FringeDirectionsKernels, v23, (uint64_t)CFSTR("filterDisplacements"), v24, v25);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(FringeDirectionsKernels, v26, (uint64_t)CFSTR("displace"), v27, v28);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(FringeEdgesKernels, v29, (uint64_t)CFSTR("fringeEdges"), v30, v31);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(FringeEdgesKernels, v32, (uint64_t)CFSTR("fringeEdgeThicken"), v33, v34);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(self->inputWidth, v35, v36, v37, v38);
    v40 = v39;
    objc_msgSend_floatValue(self->inputAxialWidth, v41, v42, v43, v44);
    v49 = v48;
    if (v48 > v40)
      v40 = v48;
    v50 = v40;
    if (v40 >= 4.5)
    {
      if (v50 >= 5.207)
      {
        if (v50 >= 5.707)
        {
          if (v50 >= 6.118)
          {
            if (v50 >= 6.532)
            {
              if (v50 >= 6.914)
              {
                if (v50 >= 7.082)
                {
                  if (v50 >= 7.384)
                  {
                    if (v50 >= 7.803)
                    {
                      if (v50 >= 8.062)
                      {
                        if (v50 >= 8.183)
                        {
                          if (v50 >= 8.357)
                          {
                            if (v50 >= 8.736)
                              v51 = 14;
                            else
                              v51 = 13;
                          }
                          else
                          {
                            v51 = 12;
                          }
                        }
                        else
                        {
                          v51 = 11;
                        }
                      }
                      else
                      {
                        v51 = 10;
                      }
                    }
                    else
                    {
                      v51 = 9;
                    }
                  }
                  else
                  {
                    v51 = 8;
                  }
                }
                else
                {
                  v51 = 7;
                }
              }
              else
              {
                v51 = 6;
              }
            }
            else
            {
              v51 = 5;
            }
          }
          else
          {
            v51 = 4;
          }
        }
        else
        {
          v51 = 3;
        }
      }
      else
      {
        v51 = 2;
      }
    }
    else
    {
      v51 = 1;
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v45, (uint64_t)CFSTR("thickenDirections%02d"), v46, v47, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelWithName_(FringeDirectionsKernels, v53, (uint64_t)v52, v54, v55);
    v206 = (void *)objc_claimAutoreleasedReturnValue();

    inputImage = self->inputImage;
    objc_msgSend_extent(inputImage, v57, v58, v59, v60);
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v61, (uint64_t)v214, (uint64_t)inputImage, (uint64_t)&unk_1E999C8B8, 0, self->inputColorSpace);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_extent(v62, v63, v64, v65, v66);
    v234 = CGRectInset(v233, -3.0, -3.0);
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v67, (uint64_t)v213, (uint64_t)v62, (uint64_t)&unk_1E999C8D8, 0, self->inputColorSpace, v234.origin.x, v234.origin.y, v234.size.width, v234.size.height);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_extent(v62, v69, v70, v71, v72);
    v236 = CGRectInset(v235, -3.0, -3.0);
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v73, (uint64_t)v212, (uint64_t)v62, (uint64_t)&unk_1E999C8F8, 0, self->inputColorSpace, v236.origin.x, v236.origin.y, v236.size.width, v236.size.height);
    v74 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_extent(v68, v75, v76, v77, v78);
    v238 = CGRectInset(v237, -4.0, -4.0);
    x = v238.origin.x;
    y = v238.origin.y;
    width = v238.size.width;
    height = v238.size.height;
    inputWidth = self->inputWidth;
    v232[0] = v74;
    v232[1] = inputWidth;
    v232[2] = &unk_1E99D1390;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v84, (uint64_t)v232, 3, v85);
    v217 = v62;
    v218 = (void *)v74;
    v202 = v68;
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v87, (uint64_t)v211, (uint64_t)v68, (uint64_t)&unk_1E999C918, x, y, width, height);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v88, v89, v90, v91, v92);
    v240 = CGRectInset(v239, -1.0, -1.0);
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v93, (uint64_t)v210, (uint64_t)v88, (uint64_t)&unk_1E999C938, 0, exception_object->inputColorSpace, v240.origin.x, v240.origin.y, v240.size.width, v240.size.height);
    v215 = (void *)objc_claimAutoreleasedReturnValue();

    v94 = exception_object->inputImage;
    v95 = v68;
    objc_msgSend_extent(v94, v96, v97, v98, v99);
    v242 = CGRectInset(v241, -1.0, -1.0);
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v100, (uint64_t)v209, (uint64_t)v94, (uint64_t)&unk_1E999C958, 0, exception_object->inputColorSpace, v242.origin.x, v242.origin.y, v242.size.width, v242.size.height);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = exception_object->inputImage;
    objc_msgSend_extent(v102, v103, v104, v105, v106);
    v108 = v107;
    v110 = v109;
    v112 = v111;
    v114 = v113;
    v231[0] = v101;
    v231[1] = v95;
    v231[2] = v215;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v115, (uint64_t)v231, 3, v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v101;
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v119, (uint64_t)v208, (uint64_t)v102, (uint64_t)&unk_1E999C978, v117, exception_object->inputColorSpace, v108, v110, v112, v114);
    v205 = (void *)objc_claimAutoreleasedReturnValue();

    v124 = -5.0;
    if (v50 < 8.736)
    {
      v124 = -4.0;
      if (v50 < 7.803)
      {
        v124 = -3.0;
        if (v50 < 6.914)
        {
          v124 = -2.0;
          if (v50 < 5.707)
          {
            v124 = 0.0;
            if (v40 >= 4.5)
              v124 = -1.0;
          }
        }
      }
    }
    objc_msgSend_extent(v202, v120, v121, v122, v123);
    v125 = exception_object;
    v244 = CGRectInset(v243, v124, v124);
    v224[0] = MEMORY[0x1E0C809B0];
    v224[1] = 3221225472;
    v224[2] = sub_1D53F3BC0;
    v224[3] = &unk_1E999C998;
    *(CGFloat *)&v224[4] = v124;
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(v125, v126, (uint64_t)v206, (uint64_t)v202, (uint64_t)v224, 0, v125->inputColorSpace, v244.origin.x, v244.origin.y, v244.size.width, v244.size.height);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_extent(v101, v128, v129, v130, v131);
    v246 = CGRectInset(v245, -5.0, -5.0);
    v132 = v246.origin.x;
    v133 = v246.origin.y;
    v134 = v246.size.width;
    v135 = v246.size.height;
    v230[0] = v127;
    *(float *)&v246.origin.x = v40 + -2.0;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v136, v137, v138, v139, v246.origin.x);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v230[1] = v140;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v141, (uint64_t)v230, 2, v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(v125, v144, (uint64_t)v216, (uint64_t)v118, (uint64_t)&unk_1E999C9B8, v143, v125->inputColorSpace, v132, v133, v134, v135);
    v145 = (void *)objc_claimAutoreleasedReturnValue();

    v146 = exception_object->inputImage;
    objc_msgSend_extent(v146, v147, v148, v149, v150);
    v248 = CGRectInset(v247, (float)-v40, (float)-v40);
    v151 = v248.origin.x;
    v152 = v248.origin.y;
    v153 = v248.size.width;
    v154 = v248.size.height;
    v222[0] = MEMORY[0x1E0C809B0];
    v222[1] = 3221225472;
    v222[2] = sub_1D53F3BF0;
    v222[3] = &unk_1E9971F30;
    v223 = v40;
    v229[0] = v145;
    v229[1] = v127;
    v229[2] = v205;
    *(float *)&v248.origin.x = v40;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v155, v156, v157, v158, v248.origin.x);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v229[3] = v159;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v160, (uint64_t)v229, 4, v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v163, (uint64_t)v207, (uint64_t)v146, (uint64_t)v222, v162, exception_object->inputColorSpace, v151, v152, v153, v154);
    v164 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49 <= 0.0)
    {
      v182 = v145;
    }
    else
    {
      objc_msgSend_extent(v118, v165, v166, v167, v168);
      v250 = CGRectInset(v249, -5.0, -5.0);
      v169 = v250.origin.x;
      v170 = v250.origin.y;
      v171 = v250.size.width;
      v172 = v250.size.height;
      v228[0] = v127;
      *(float *)&v250.origin.x = v49 + -2.0;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v173, v174, v175, v176, v250.origin.x);
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      v228[1] = v177;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v178, (uint64_t)v228, 2, v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v181, (uint64_t)v216, (uint64_t)v118, (uint64_t)&unk_1E999C9D8, v180, exception_object->inputColorSpace, v169, v170, v171, v172);
      v182 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_floatValue(exception_object->inputAxialWidth, v183, v184, v185, v186);
      LODWORD(v172) = v187;
      objc_msgSend_extent(v164, v188, v189, v190, v191);
      v252 = CGRectInset(v251, (float)-*(float *)&v172, (float)-*(float *)&v172);
      v192 = v252.origin.x;
      v193 = v252.origin.y;
      v194 = v252.size.width;
      v195 = v252.size.height;
      v220[0] = MEMORY[0x1E0C809B0];
      v220[1] = 3221225472;
      v220[2] = sub_1D53F3C44;
      v220[3] = &unk_1E9971F30;
      v221 = LODWORD(v172);
      v227[0] = v182;
      v227[1] = v127;
      v227[2] = exception_object->inputAxialWidth;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v196, (uint64_t)v227, 3, v197);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v199, (uint64_t)v204, (uint64_t)v164, (uint64_t)v220, v198, exception_object->inputColorSpace, v192, v193, v194, v195);
      v200 = objc_claimAutoreleasedReturnValue();

      v164 = (void *)v200;
    }

    v203[2](v203);
  }
  else
  {
    v164 = 0;
  }
  return v164;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputAxialWidth, 0);
  objc_storeStrong((id *)&self->inputWidth, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
