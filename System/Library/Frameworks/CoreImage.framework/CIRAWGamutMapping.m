@implementation CIRAWGamutMapping

- (id)outputImage
{
  CIImage *inputImage;
  NSDictionary *inputRAWDictionary;
  id v5;
  int v6;
  id v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  CIColorKernel *v26;
  uint64_t v27;
  id v28;
  int v29;
  id v30;
  float v31;
  float v32;
  id v33;
  float v34;
  float v35;
  id v36;
  float v37;
  id v38;
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
  double v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  double v66;
  float v67;
  float v68;
  float v69;
  float v70;
  double v71;
  double v72;
  float v73;
  float v74;
  float v75;
  double v76;
  double v77;
  double v78;
  float v79;
  float v80;
  double v81;
  double v82;
  float v83;
  float v84;
  float v85;
  double v86;
  float v87;
  float v88;
  float v89;
  float v90;
  double v91;
  float v92;
  float v93;
  float v94;
  CIVector *v95;
  CIVector *v96;
  CIVector *v97;
  CIVector *v98;
  CIVector *v99;
  double v100;
  uint64_t v101;
  CIColorKernel *v102;
  uint64_t v103;
  CIImage *v104;
  uint64_t v105;
  CIRAWGamutMapping *v106;
  CIColorKernel *v107;
  CIColorKernel *v108;
  uint64_t v109;
  id v110;
  CIKernel *v111;
  double v112;
  double v113;
  double v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  _QWORD v127[4];
  _QWORD v128[6];
  _QWORD v129[6];
  _QWORD v130[6];
  _QWORD v131[5];

  v131[3] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  inputRAWDictionary = self->inputRAWDictionary;
  if (!inputRAWDictionary)
    return inputImage;
  v5 = -[NSDictionary valueForKey:](inputRAWDictionary, "valueForKey:", CFSTR("version"));
  if (v5)
    v6 = objc_msgSend(v5, "intValue");
  else
    v6 = 9999;
  v8 = -[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("mc00"));
  if (v8)
  {
    objc_msgSend(v8, "floatValue");
    v125 = v9;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("mc01")), "floatValue");
    v11 = v10;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("mc02")), "floatValue");
    v13 = v12;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("mc10")), "floatValue");
    v15 = v14;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("mc11")), "floatValue");
    v17 = v16;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("mc12")), "floatValue");
    v19 = v18;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("mc20")), "floatValue");
    v21 = v20;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("mc21")), "floatValue");
    v23 = v22;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("mc22")), "floatValue");
    v25 = v24;
    v26 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_convertUsingColorMatrix);
    v131[0] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v125, v15, v21);
    v131[1] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v11, v17, v23);
    v131[2] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v13, v19, v25);
    v27 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 3);
    if (GetLinearAdobeRGB(void)::onceToken != -1)
      dispatch_once(&GetLinearAdobeRGB(void)::onceToken, &__block_literal_global_61);
    inputImage = -[CIFilter apply:image:arguments:inoutSpace:](self, "apply:image:arguments:inoutSpace:", v26, inputImage, v27, GetLinearAdobeRGB(void)::space);
  }
  v28 = -[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("bknd"));
  if (v28)
  {
    v29 = objc_msgSend(v28, "intValue");
  }
  else
  {
    NSLog(CFSTR("CIRAWGamutMapping: key %@ was not found in the RAW dictionary\n"), CFSTR("bknd"));
    v29 = 0;
  }
  v30 = -[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("btpnt"));
  if (v30)
  {
    objc_msgSend(v30, "floatValue");
    v32 = v31;
  }
  else
  {
    NSLog(CFSTR("CIRAWGamutMapping: key %@ was not found in the RAW dictionary\n"), CFSTR("btpnt"));
    v32 = 0.25;
  }
  v33 = -[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("btwid"));
  if (v33)
  {
    objc_msgSend(v33, "floatValue");
    v35 = v34;
  }
  else
  {
    NSLog(CFSTR("CIRAWGamutMapping: key %@ was not found in the RAW dictionary\n"), CFSTR("btwid"));
    v35 = 0.25;
  }
  v36 = -[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("blamt"));
  if (v36)
  {
    objc_msgSend(v36, "floatValue");
  }
  else
  {
    NSLog(CFSTR("CIRAWGamutMapping: key %@ was not found in the RAW dictionary\n"), CFSTR("blamt"));
    v37 = 1.0;
  }
  v117 = v37;
  v38 = -[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("bamt"));
  v115 = v35;
  v116 = v32;
  if (v38)
  {
    objc_msgSend(v38, "floatValue");
    v40 = v39;
  }
  else
  {
    NSLog(CFSTR("CIRAWGamutMapping: key %@ was not found in the RAW dictionary\n"), CFSTR("bamt"));
    v40 = 1.0;
  }
  objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("otrcS0")), "floatValue");
  v42 = v41;
  objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("otrcS1")), "floatValue");
  v44 = v43;
  objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("otrcS2")), "floatValue");
  v46 = v45;
  objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("otrcS3")), "floatValue");
  v48 = v47;
  objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("otrcS4")), "floatValue");
  v50 = v49;
  objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("otrcY1")), "floatValue");
  v52 = v51;
  objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("otrcY2")), "floatValue");
  v54 = v53;
  objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", CFSTR("otrcY3")), "floatValue");
  v55 = 1.0 - v40;
  v56 = v55 + (float)(v40 * v42);
  v57 = v55 + (float)(v40 * v44);
  v58 = v55 + (float)(v40 * v46);
  v59 = (float)(v40 * v52) + v55 * 0.1;
  v60 = v55 + (float)(v40 * v48);
  v61 = v55 + (float)(v40 * v50);
  v62 = (float)(v40 * v54) + v55 * 0.2;
  v64 = (float)(v40 * v63) + v55 * 0.5;
  v65 = v56 * 0.1 / v59;
  v66 = v57 * 0.1;
  v67 = v66 / v59 + v65 + -2.0;
  v68 = v59 * 1000.0 * v67;
  v69 = v59 * 100.0 * (float)(1.0 - (float)(v65 + v67));
  v124 = v69;
  v126 = v68;
  v70 = v59 * 10.0 * v65;
  v71 = (float)(v62 - v59);
  *(float *)&v66 = v66 / v71;
  v72 = v58;
  v73 = v72 * 0.1 / v71 + *(float *)&v66 + -2.0;
  v74 = 1.0 - (float)(*(float *)&v66 + v73);
  v122 = (float)((float)(v62 - v59) * v73) * 1000.0;
  v123 = v70;
  v75 = (v74 * 100.0 + v73 * -300.0) * v71;
  *(float *)&v71 = (v74 * -20.0 + v73 * 30.0 + *(float *)&v66 * 10.0) * v71;
  v120 = *(float *)&v71;
  v121 = v75;
  v119 = v59 + (float)((float)(v62 - v59) * (float)((float)(v74 - v73) - *(float *)&v66));
  v76 = (float)(v64 - v62);
  *(float *)&v72 = v72 * 0.3 / v76;
  v77 = v60;
  v78 = *(float *)&v72;
  v79 = v77 * 0.3 / v76 + *(float *)&v72 + -2.0;
  v80 = (float)((float)(v64 - v62) * v79) * 1000.0 / 27.0;
  v118 = v80;
  v81 = (float)-v79;
  v82 = (float)(1.0 - (float)(*(float *)&v72 + v79));
  v83 = (v81 * 200.0 / 9.0 + v82 * 100.0 / 9.0) * v76;
  v84 = (v78 * 10.0 / 3.0 + v79 * 40.0 / 9.0 - v82 * 40.0 / 9.0) * v76;
  v85 = v62 + v76 * (v81 * 8.0 / 27.0 + v82 * 4.0 / 9.0 - (v78 + v78) / 3.0);
  v86 = v64;
  v87 = v77 * 0.5 / (1.0 - v86);
  v88 = v61 * 0.5 / (1.0 - v86) + v87 + -2.0;
  v89 = 1.0 - (float)(v87 + v88);
  v90 = (1.0 - v86) * v88 * 8.0;
  v91 = v89 * 4.0;
  v92 = (1.0 - v86) * (v91 + v88 * -12.0);
  v93 = (1.0 - v86) * (v87 * 2.0 - (v91 - v88 * 6.0));
  v94 = v86 + (1.0 - v86) * (float)((float)(v89 - v88) - v87);
  v95 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:");
  v96 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v126, v124, v123, 0.0);
  v97 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v122, v121, v120, v119);
  v98 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v118, v83, v84, v85);
  v99 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v90, v92, v93, v94);
  *(float *)&v100 = v61;
  v101 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v100);
  if (!v6)
  {
    v102 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_localBoost);
    v130[0] = v95;
    v130[1] = v96;
    v130[2] = v97;
    v130[3] = v98;
    v130[4] = v99;
    v130[5] = v101;
    v103 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 6);
    if (GetLinearAdobeRGB(void)::onceToken == -1)
    {
LABEL_31:
      v104 = inputImage;
      v105 = GetLinearAdobeRGB(void)::space;
      v106 = self;
      v107 = v102;
      return -[CIFilter apply:image:arguments:inoutSpace:](v106, "apply:image:arguments:inoutSpace:", v107, v104, v103, v105);
    }
LABEL_39:
    dispatch_once(&GetLinearAdobeRGB(void)::onceToken, &__block_literal_global_61);
    goto LABEL_31;
  }
  if (v29 == 1)
  {
    v108 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_boostRGBLNoGamma);
    v128[0] = v95;
    v128[1] = v96;
    v128[2] = v97;
    v128[3] = v98;
    v128[4] = v99;
    v128[5] = v101;
    v109 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 6);
    if (GetLinearAdobeRGB(void)::onceToken != -1)
      dispatch_once(&GetLinearAdobeRGB(void)::onceToken, &__block_literal_global_61);
    v110 = -[CIFilter apply:image:arguments:inSpace:](self, "apply:image:arguments:inSpace:", v108, inputImage, v109, GetLinearAdobeRGB(void)::space);
    v111 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_boostHybrid);
    v127[0] = v110;
    *(float *)&v112 = v116;
    v127[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v112);
    *(float *)&v113 = v115;
    v127[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v113);
    *(float *)&v114 = v117;
    v127[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v114);
    v103 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 4);
    if (GetLinearAdobeRGB(void)::onceToken != -1)
      dispatch_once(&GetLinearAdobeRGB(void)::onceToken, &__block_literal_global_61);
    v105 = GetLinearAdobeRGB(void)::space;
    v106 = self;
    v107 = (CIColorKernel *)v111;
    v104 = inputImage;
    return -[CIFilter apply:image:arguments:inoutSpace:](v106, "apply:image:arguments:inoutSpace:", v107, v104, v103, v105);
  }
  if (!v29)
  {
    v102 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_boostRGB);
    v129[0] = v95;
    v129[1] = v96;
    v129[2] = v97;
    v129[3] = v98;
    v129[4] = v99;
    v129[5] = v101;
    v103 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 6);
    if (GetLinearAdobeRGB(void)::onceToken == -1)
      goto LABEL_31;
    goto LABEL_39;
  }
  return 0;
}

@end
