@implementation CHStrokeGroupClassificationVisualization

- (int64_t)layeringPriority
{
  return 0;
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  CGColorSpace *DeviceRGB;
  CGColor *v11;
  CGColorRef v12;
  CGColorRef v13;
  CGFloat MidY;
  CGFloat v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  id v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  id v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  void *v168;
  const void *v169;
  void *v170;
  void *v171;
  const void *v172;
  void *v173;
  void *v174;
  CGColorRef v175;
  CGColorRef v176;
  CGColorRef v177;
  CGColorRef v178;
  CGColorRef v179;
  CGColorRef color;
  char v182;
  objc_super v183;
  uint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  void *v187;
  void *v188;
  void *v189[3];
  __int128 v190;
  uint64_t v191;
  uint64_t v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = self;
  v192 = *MEMORY[0x1E0C80C00];
  v183.receiver = self;
  v183.super_class = (Class)CHStrokeGroupClassificationVisualization;
  -[CHStrokeGroupingVisualization drawVisualizationInRect:context:viewBounds:](&v183, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v11 = CGColorCreate(DeviceRGB, dbl_1BE8DF578);
  v12 = CGColorCreate(DeviceRGB, dbl_1BE8DF598);
  v13 = CGColorCreate(DeviceRGB, dbl_1BE8DF5B8);
  color = CGColorCreate(DeviceRGB, dbl_1BE8DF5D8);
  v179 = CGColorCreate(DeviceRGB, dbl_1BE8DF5F8);
  v178 = CGColorCreate(DeviceRGB, dbl_1BE8DF618);
  v176 = CGColorCreate(DeviceRGB, dbl_1BE8DF638);
  v175 = CGColorCreate(DeviceRGB, dbl_1BE8DF658);
  v177 = CGColorCreate(DeviceRGB, dbl_1BE8DF678);
  v193.size.width = 432.0;
  v193.origin.x = 6.0;
  v193.origin.y = 8.0;
  v193.size.height = 18.0;
  v199.origin.x = x;
  v199.origin.y = y;
  v199.size.width = width;
  v199.size.height = height;
  if (CGRectIntersectsRect(v193, v199))
  {
    CGContextSetFillColorWithColor(a4, v11);
    v194.size.width = 432.0;
    v194.origin.x = 6.0;
    v194.origin.y = 8.0;
    v194.size.height = 18.0;
    CGContextFillRect(a4, v194);
    v195.size.width = 432.0;
    v195.origin.x = 6.0;
    v195.origin.y = 8.0;
    v195.size.height = 18.0;
    MidY = CGRectGetMidY(v195);
    CGContextTranslateCTM(a4, 0.0, MidY);
    CGContextScaleCTM(a4, 1.0, -1.0);
    v196.size.width = 432.0;
    v196.origin.x = 6.0;
    v196.origin.y = 8.0;
    v196.size.height = 18.0;
    v15 = CGRectGetMidY(v196);
    CGContextTranslateCTM(a4, 0.0, -v15);
    v184 = 0;
    v185 = &v184;
    v186 = 0x2020000000;
    v16 = &qword_1EF568000;
    v17 = off_1EF5682B0;
    v187 = off_1EF5682B0;
    if (off_1EF5682B0)
      goto LABEL_8;
    v189[0] = 0;
    if (qword_1EF5682B8)
    {
      v17 = (void *)qword_1EF5682B8;
    }
    else
    {
      v190 = xmmword_1E77F5458;
      v191 = 0;
      qword_1EF5682B8 = _sl_dlopen();
      v18 = v189[0];
      v17 = (void *)qword_1EF5682B8;
      if (!qword_1EF5682B8)
      {
        v18 = (void *)abort_report_np();
        goto LABEL_48;
      }
      if (v189[0])
        goto LABEL_49;
    }
    while (1)
    {
      v17 = dlsym(v17, "CTFontCreateWithName");
      v185[3] = (uint64_t)v17;
      v16[86] = (uint64_t)v17;
LABEL_8:
      _Block_object_dispose(&v184, 8);
      if (v17)
      {
        v17 = (void *)((uint64_t (*)(const __CFString *, _QWORD, double))v17)(CFSTR("Helvetica-Bold"), 0, 12.0);
        v182 = 0;
        LODWORD(v189[0]) = 0;
        v189[1] = (void *)1;
        v189[2] = &v182;
        v184 = 0;
        v185 = &v184;
        v186 = 0x2020000000;
        v16 = (uint64_t *)off_1EF5682C0;
        v187 = off_1EF5682C0;
        if (!off_1EF5682C0)
        {
          v188 = 0;
          if (qword_1EF5682B8)
          {
            v16 = (uint64_t *)qword_1EF5682B8;
          }
          else
          {
            v190 = xmmword_1E77F5458;
            v191 = 0;
            qword_1EF5682B8 = _sl_dlopen();
            v16 = (uint64_t *)qword_1EF5682B8;
            if (!qword_1EF5682B8)
              goto LABEL_47;
            if (v188)
              free(v188);
          }
          v16 = (uint64_t *)dlsym(v16, "CTParagraphStyleCreate");
          v185[3] = (uint64_t)v16;
          off_1EF5682C0 = v16;
        }
        _Block_object_dispose(&v184, 8);
        if (v16)
        {
          v16 = (uint64_t *)((uint64_t (*)(void **, uint64_t))v16)(v189, 1);
          v19 = objc_alloc(MEMORY[0x1E0CB3498]);
          v24 = (id)objc_msgSend_initWithString_(v19, v20, (uint64_t)CFSTR("   "), v21, v22, v23);
          v25 = objc_alloc(MEMORY[0x1E0CB3778]);
          v31 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v26, v27, v28, v29, v30);
          v34 = objc_msgSend_localizedStringForKey_value_table_(v31, v32, (uint64_t)CFSTR("Stroke group classification: "), (uint64_t)&stru_1E77F6F28, 0, v33);
          v35 = sub_1BE7DE354(v9, v34, v12, (uint64_t *)v17, (uint64_t)v16);
          v40 = (id)objc_msgSend_initWithAttributedString_(v25, v36, (uint64_t)v35, v37, v38, v39);
          objc_msgSend_appendAttributedString_(v40, v41, (uint64_t)v24, v42, v43, v44);
          v50 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v45, v46, v47, v48, v49);
          v53 = objc_msgSend_localizedStringForKey_value_table_(v50, v51, (uint64_t)CFSTR("text"), (uint64_t)&stru_1E77F6F28, 0, v52);
          v54 = sub_1BE7DE354(v9, v53, color, (uint64_t *)v17, (uint64_t)v16);
          objc_msgSend_appendAttributedString_(v40, v55, (uint64_t)v54, v56, v57, v58);
          objc_msgSend_appendAttributedString_(v40, v59, (uint64_t)v24, v60, v61, v62);
          v68 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v63, v64, v65, v66, v67);
          v71 = objc_msgSend_localizedStringForKey_value_table_(v68, v69, (uint64_t)CFSTR("math"), (uint64_t)&stru_1E77F6F28, 0, v70);
          v72 = sub_1BE7DE354(v9, v71, v179, (uint64_t *)v17, (uint64_t)v16);
          objc_msgSend_appendAttributedString_(v40, v73, (uint64_t)v72, v74, v75, v76);
          objc_msgSend_appendAttributedString_(v40, v77, (uint64_t)v24, v78, v79, v80);
          v86 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v81, v82, v83, v84, v85);
          v89 = objc_msgSend_localizedStringForKey_value_table_(v86, v87, (uint64_t)CFSTR("clutter"), (uint64_t)&stru_1E77F6F28, 0, v88);
          v90 = sub_1BE7DE354(v9, v89, v177, (uint64_t *)v17, (uint64_t)v16);
          objc_msgSend_appendAttributedString_(v40, v91, (uint64_t)v90, v92, v93, v94);
          objc_msgSend_appendAttributedString_(v40, v95, (uint64_t)v24, v96, v97, v98);
          v104 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v99, v100, v101, v102, v103);
          v107 = objc_msgSend_localizedStringForKey_value_table_(v104, v105, (uint64_t)CFSTR("doodle"), (uint64_t)&stru_1E77F6F28, 0, v106);
          v108 = sub_1BE7DE354(v9, v107, v178, (uint64_t *)v17, (uint64_t)v16);
          objc_msgSend_appendAttributedString_(v40, v109, (uint64_t)v108, v110, v111, v112);
          objc_msgSend_appendAttributedString_(v40, v113, (uint64_t)v24, v114, v115, v116);
          v122 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v117, v118, v119, v120, v121);
          v125 = objc_msgSend_localizedStringForKey_value_table_(v122, v123, (uint64_t)CFSTR("line"), (uint64_t)&stru_1E77F6F28, 0, v124);
          v126 = sub_1BE7DE354(v9, v125, v176, (uint64_t *)v17, (uint64_t)v16);
          objc_msgSend_appendAttributedString_(v40, v127, (uint64_t)v126, v128, v129, v130);
          objc_msgSend_appendAttributedString_(v40, v131, (uint64_t)v24, v132, v133, v134);
          v140 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v135, v136, v137, v138, v139);
          v143 = objc_msgSend_localizedStringForKey_value_table_(v140, v141, (uint64_t)CFSTR("container"), (uint64_t)&stru_1E77F6F28, 0, v142);
          v144 = sub_1BE7DE354(v9, v143, v175, (uint64_t *)v17, (uint64_t)v16);
          objc_msgSend_appendAttributedString_(v40, v145, (uint64_t)v144, v146, v147, v148);
          objc_msgSend_appendAttributedString_(v40, v149, (uint64_t)v24, v150, v151, v152);
          v158 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v153, v154, v155, v156, v157);
          v161 = objc_msgSend_localizedStringForKey_value_table_(v158, v159, (uint64_t)CFSTR("unknown"), (uint64_t)&stru_1E77F6F28, 0, v160);
          v162 = sub_1BE7DE354(v9, v161, v13, (uint64_t *)v17, (uint64_t)v16);
          objc_msgSend_appendAttributedString_(v40, v163, (uint64_t)v162, v164, v165, v166);
          v197.size.width = 432.0;
          v197.origin.x = 6.0;
          v197.origin.y = 8.0;
          v197.size.height = 18.0;
          v198 = CGRectInset(v197, 4.0, 1.0);
          v9 = CGPathCreateWithRect(v198, 0);
          v184 = 0;
          v185 = &v184;
          v186 = 0x2020000000;
          v167 = off_1EF5682C8;
          v187 = off_1EF5682C8;
          if (!off_1EF5682C8)
          {
            v188 = 0;
            if (qword_1EF5682B8)
            {
              v168 = (void *)qword_1EF5682B8;
            }
            else
            {
              v190 = xmmword_1E77F5458;
              v191 = 0;
              qword_1EF5682B8 = _sl_dlopen();
              v168 = (void *)qword_1EF5682B8;
              if (!qword_1EF5682B8)
                goto LABEL_47;
              if (v188)
                free(v188);
            }
            v167 = dlsym(v168, "CTFramesetterCreateWithAttributedString");
            v185[3] = (uint64_t)v167;
            off_1EF5682C8 = v167;
          }
          _Block_object_dispose(&v184, 8);
          if (v167)
          {
            v169 = (const void *)((uint64_t (*)(id))v167)(v40);
            v184 = 0;
            v185 = &v184;
            v186 = 0x2020000000;
            v170 = off_1EF5682D0;
            v187 = off_1EF5682D0;
            if (!off_1EF5682D0)
            {
              v188 = 0;
              if (qword_1EF5682B8)
              {
                v171 = (void *)qword_1EF5682B8;
              }
              else
              {
                v190 = xmmword_1E77F5458;
                v191 = 0;
                qword_1EF5682B8 = _sl_dlopen();
                v171 = (void *)qword_1EF5682B8;
                if (!qword_1EF5682B8)
                  goto LABEL_47;
                if (v188)
                  free(v188);
              }
              v170 = dlsym(v171, "CTFramesetterCreateFrame");
              v185[3] = (uint64_t)v170;
              off_1EF5682D0 = v170;
            }
            _Block_object_dispose(&v184, 8);
            if (v170)
            {
              v172 = (const void *)((uint64_t (*)(const void *, _QWORD, _QWORD, void *, _QWORD))v170)(v169, 0, 0, v9, 0);
              v184 = 0;
              v185 = &v184;
              v186 = 0x2020000000;
              v173 = off_1EF5682D8;
              v187 = off_1EF5682D8;
              if (!off_1EF5682D8)
              {
                v188 = 0;
                if (qword_1EF5682B8)
                {
                  v174 = (void *)qword_1EF5682B8;
                }
                else
                {
                  v190 = xmmword_1E77F5458;
                  v191 = 0;
                  qword_1EF5682B8 = _sl_dlopen();
                  v174 = (void *)qword_1EF5682B8;
                  if (!qword_1EF5682B8)
                  {
LABEL_47:
                    v18 = (void *)abort_report_np();
                    goto LABEL_48;
                  }
                  if (v188)
                    free(v188);
                }
                v173 = dlsym(v174, "CTFrameDraw");
                v185[3] = (uint64_t)v173;
                off_1EF5682D8 = v173;
              }
              _Block_object_dispose(&v184, 8);
              if (v173)
              {
                ((void (*)(const void *, CGContext *))v173)(v172, a4);
                CFRelease(v172);
                CFRelease(v169);
                CFRelease(v16);
                CFRelease(v17);
                CGPathRelease((CGPathRef)v9);
                break;
              }
            }
          }
        }
      }
      dlerror();
      v18 = (void *)abort_report_np();
LABEL_48:
      __break(1u);
LABEL_49:
      free(v18);
    }
  }
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(v11);
  CGColorRelease(v12);
  CGColorRelease(v13);
  CGColorRelease(color);
  CGColorRelease(v179);
  CGColorRelease(v178);
  CGColorRelease(v176);
  CGColorRelease(v175);
  CGColorRelease(v177);
}

- (CGColor)newColorForStrokeInGroup:(id)a3
{
  CGColorSpace *DeviceRGB;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  CGColor *v11;

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v10 = objc_msgSend_classification(a3, v5, v6, v7, v8, v9);
  if (v10 > 8)
  {
    CGColorSpaceRelease(DeviceRGB);
    return 0;
  }
  else
  {
    v11 = CGColorCreate(DeviceRGB, (const CGFloat *)off_1E77F5470[v10]);
    CGColorSpaceRelease(DeviceRGB);
    return v11;
  }
}

@end
