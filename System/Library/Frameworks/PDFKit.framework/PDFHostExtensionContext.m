@implementation PDFHostExtensionContext

- (void)setHostViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostViewController, a3);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[XPCExtensionInterface extensionInterface](XPCExtensionInterface, "extensionInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[XPCExtensionInterface hostInterface](XPCExtensionInterface, "hostInterface");
}

- (void)extensionToHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("function"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__PDFHostExtensionContext_extensionToHost___block_invoke;
    block[3] = &unk_24C25D110;
    block[4] = self;
    v8 = v6;
    v9 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __43__PDFHostExtensionContext_extensionToHost___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  float v4;
  double v5;
  void *v6;
  uint64_t v7;
  float v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  float v26;
  double v27;
  void *v28;
  float v29;
  double v30;
  void *v31;
  float v32;
  double v33;
  __n128 v34;
  __n128 v35;
  void *v36;
  uint64_t v37;
  void *v38;
  float v39;
  double v40;
  void *v41;
  float v42;
  double v43;
  void *v44;
  float v45;
  double v46;
  void *v47;
  float v48;
  double v49;
  void *v50;
  float v51;
  double v52;
  void *v53;
  float v54;
  double v55;
  __n128 v56;
  __n128 v57;
  void *v58;
  float v59;
  double v60;
  void *v61;
  float v62;
  double v63;
  void *v64;
  float v65;
  double v66;
  void *v67;
  float v68;
  double v69;
  __n128 v70;
  __n128 v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  float v84;
  double v85;
  void *v86;
  float v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  float v92;
  double v93;
  void *v94;
  float v95;
  double v96;
  double v97;
  void *v98;
  uint64_t v99;
  void *v100;
  float v101;
  double v102;
  void *v103;
  float v104;
  double v105;
  void *v106;
  float v107;
  double v108;
  void *v109;
  float v110;
  double v111;
  __n128 v112;
  __n128 v113;
  double v114;
  double v115;
  double v116;
  double v117;
  void *v118;
  float v119;
  double v120;
  void *v121;
  float v122;
  double v123;
  double v124;
  double v125;
  double v126;
  PDFPointerRegion *v127;
  void *v128;
  void *v129;
  float v130;
  double v131;
  void *v132;
  float v133;
  double v134;
  double v135;
  double v136;
  double v137;
  void *v138;
  float v139;
  double v140;
  void *v141;
  float v142;
  double v143;
  void *v144;
  float v145;
  double v146;
  void *v147;
  float v148;
  double v149;
  __n128 v150;
  __n128 v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  void *v163;
  float v164;
  double v165;
  void *v166;
  float v167;
  double v168;
  void *v169;
  float v170;
  double v171;
  void *v172;
  float v173;
  double v174;
  __n128 v175;
  __n128 v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  void *v184;
  void *v185;
  uint64_t v186;
  id v187;

  objc_msgSend(a1[4], "hostViewController");
  v187 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("setupDocumentViewSize")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("documentViewSize"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count") == 2)
    {
      objc_msgSend(v2, "objectAtIndex:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "floatValue");
      v5 = v4;
      objc_msgSend(v2, "objectAtIndex:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "floatValue");
      v9 = PDFSizeMake(v7, v5, v8);
      v11 = v10;

      objc_msgSend(v187, "setupDocumentViewSize:", v9, v11);
    }
    goto LABEL_4;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("updateDocumentViewSize")))
  {
    objc_msgSend(v187, "updateDocumentViewSize");
    goto LABEL_13;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("documentIsLocked")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("isLocked"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v187, "documentIsLocked:", v13);
    goto LABEL_13;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("updateDocumentIsLocked")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("isLocked"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v187, "updateDocumentIsLocked:", v15);
    goto LABEL_13;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("findStringUpdate")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("numFound"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");

    objc_msgSend(a1[6], "objectForKey:", CFSTR("done"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v187, "findStringUpdate:done:", v17, v19);
    goto LABEL_13;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("goToPage")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("pageIndex"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "integerValue");

    objc_msgSend(a1[6], "objectForKey:", CFSTR("pageFrame"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count") == 4)
    {
      objc_msgSend(v2, "objectAtIndex:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "floatValue");
      v24 = v23;

      objc_msgSend(v2, "objectAtIndex:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "floatValue");
      v27 = v26;

      objc_msgSend(v2, "objectAtIndex:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "floatValue");
      v30 = v29;

      objc_msgSend(v2, "objectAtIndex:", 3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "floatValue");
      v33 = v32;

      v34.n128_f64[0] = v24;
      v35.n128_f64[0] = v27;
      objc_msgSend(v187, "goToPageIndex:pageFrame:", v21, PDFRectMake(v34, v35, v30, v33));
    }
    goto LABEL_4;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("goToDestination")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("pageIndex"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "integerValue");

    objc_msgSend(a1[6], "objectForKey:", CFSTR("point"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count") == 2)
    {
      objc_msgSend(v2, "objectAtIndex:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "floatValue");
      v40 = v39;

      objc_msgSend(v2, "objectAtIndex:", 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "floatValue");
      v43 = v42;

      objc_msgSend(v187, "goToDestination:point:", v37, PDFPointMake(v40, v43));
    }
    goto LABEL_4;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("zoomToRect")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("visibleRect"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count") == 4)
    {
      objc_msgSend(v2, "objectAtIndex:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "floatValue");
      v46 = v45;

      objc_msgSend(v2, "objectAtIndex:", 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "floatValue");
      v49 = v48;

      objc_msgSend(v2, "objectAtIndex:", 2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "floatValue");
      v52 = v51;

      objc_msgSend(v2, "objectAtIndex:", 3);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "floatValue");
      v55 = v54;

      v56.n128_f64[0] = v46;
      v57.n128_f64[0] = v49;
      objc_msgSend(v187, "zoomToRect:", PDFRectMake(v56, v57, v52, v55));
    }
    goto LABEL_4;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("showSelectionRect")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("selectionRect"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count") == 4)
    {
      objc_msgSend(v2, "objectAtIndex:", 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "floatValue");
      v60 = v59;

      objc_msgSend(v2, "objectAtIndex:", 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "floatValue");
      v63 = v62;

      objc_msgSend(v2, "objectAtIndex:", 2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "floatValue");
      v66 = v65;

      objc_msgSend(v2, "objectAtIndex:", 3);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "floatValue");
      v69 = v68;

      v70.n128_f64[0] = v60;
      v71.n128_f64[0] = v63;
      objc_msgSend(v187, "showSelectionRect:", PDFRectMake(v70, v71, v66, v69));
    }
    goto LABEL_4;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("updateCurrentPageIndex")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("pageIndex"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "integerValue");

    objc_msgSend(v187, "updateCurrentPageIndex:", v73);
    goto LABEL_13;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("updatePageCount")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("pageCount"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "integerValue");

    objc_msgSend(v187, "updatePageCount:", v75);
    goto LABEL_13;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("setHasSelection")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("hasSelection"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "BOOLValue");

    objc_msgSend(v187, "setHasSelection:", v77);
    goto LABEL_13;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("setTextSelectionPoints")))
  {
    v78 = *MEMORY[0x24BDBEFB0];
    v79 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    objc_msgSend(a1[6], "objectForKey:", CFSTR("topLeftSelectionPoint"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v79;
    v82 = v78;
    if (objc_msgSend(v80, "count") == 2)
    {
      objc_msgSend(v80, "objectAtIndex:", 0);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "floatValue");
      v85 = v84;

      objc_msgSend(v80, "objectAtIndex:", 1);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "floatValue");
      v88 = v87;

      v82 = PDFPointMake(v85, v88);
      v81 = v89;
    }
    objc_msgSend(a1[6], "objectForKey:", CFSTR("bottomRightSelectionPoint"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v90, "count") == 2)
    {
      objc_msgSend(v90, "objectAtIndex:", 0);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "floatValue");
      v93 = v92;

      objc_msgSend(v90, "objectAtIndex:", 1);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "floatValue");
      v96 = v95;

      v78 = PDFPointMake(v93, v96);
      v79 = v97;
    }
    objc_msgSend(v187, "setTextSelectionPoints:right:", v82, v81, v78, v79);
    goto LABEL_38;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("showTextSelectionMenu")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("visible"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v98, "BOOLValue");

    objc_msgSend(a1[6], "objectForKey:", CFSTR("selectionRect"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count") == 4)
    {
      objc_msgSend(v2, "objectAtIndex:", 0);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "floatValue");
      v102 = v101;

      objc_msgSend(v2, "objectAtIndex:", 1);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "floatValue");
      v105 = v104;

      objc_msgSend(v2, "objectAtIndex:", 2);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "floatValue");
      v108 = v107;

      objc_msgSend(v2, "objectAtIndex:", 3);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "floatValue");
      v111 = v110;

      v112.n128_f64[0] = v102;
      v113.n128_f64[0] = v105;
      v114 = PDFRectMake(v112, v113, v108, v111);
    }
    else
    {
      v114 = *MEMORY[0x24BDBF090];
      v115 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v116 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v117 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
    objc_msgSend(v187, "showTextSelectionMenu:selectionRect:", v99, v114, v115, v116, v117);
    goto LABEL_4;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("didCopyString")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("plainString"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "didCopyString:", v2);
LABEL_4:

    goto LABEL_13;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("didCopyData")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("webArchiveData"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "didCopyData:", v2);
    goto LABEL_4;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("goToURL")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("location"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v80, "count") != 2)
      goto LABEL_39;
    objc_msgSend(v80, "objectAtIndex:", 0);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "floatValue");
    v120 = v119;

    objc_msgSend(v80, "objectAtIndex:", 1);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "floatValue");
    v123 = v122;

    v124 = PDFPointMake(v120, v123);
    v126 = v125;
    objc_msgSend(a1[6], "objectForKey:", CFSTR("urlString"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v90);
    v127 = (PDFPointerRegion *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "goToURL:atLocation:", v127, v124, v126);
    goto LABEL_64;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("didLongPressLink")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("location"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "objectForKey:", CFSTR("annotationRect"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v80, "count") == 2 && objc_msgSend(v128, "count") == 4)
    {
      objc_msgSend(v80, "objectAtIndex:", 0);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "floatValue");
      v131 = v130;

      objc_msgSend(v80, "objectAtIndex:", 1);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "floatValue");
      v134 = v133;

      v135 = PDFPointMake(v131, v134);
      v137 = v136;
      objc_msgSend(v128, "objectAtIndex:", 0);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "floatValue");
      v140 = v139;

      objc_msgSend(v128, "objectAtIndex:", 1);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "floatValue");
      v143 = v142;

      objc_msgSend(v128, "objectAtIndex:", 2);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "floatValue");
      v146 = v145;

      objc_msgSend(v128, "objectAtIndex:", 3);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "floatValue");
      v149 = v148;

      v150.n128_f64[0] = v140;
      v151.n128_f64[0] = v143;
      v152 = PDFRectMake(v150, v151, v146, v149);
      v154 = v153;
      v156 = v155;
      v158 = v157;
      objc_msgSend(a1[6], "objectForKey:", CFSTR("urlString"));
      v159 = (void *)objc_claimAutoreleasedReturnValue();

      v160 = a1[6];
      if (v159)
      {
        objc_msgSend(v160, "objectForKey:", CFSTR("urlString"));
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v161);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "didLongPressURL:atLocation:withAnnotationRect:", v162, v135, v137, v152, v154, v156, v158);

      }
      else
      {
        objc_msgSend(v160, "objectForKey:", CFSTR("pageIndex"));
        v184 = (void *)objc_claimAutoreleasedReturnValue();

        if (v184)
        {
          objc_msgSend(a1[6], "objectForKey:", CFSTR("pageIndex"));
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          v186 = objc_msgSend(v185, "integerValue");

          objc_msgSend(v187, "didLongPressPageIndex:atLocation:withAnnotationRect:", v186, v135, v137, v152, v154, v156, v158);
        }
      }
    }

    goto LABEL_39;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("pointerRegionForLocation")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("regionRect"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v80, "count") == 4)
    {
      objc_msgSend(v80, "objectAtIndex:", 0);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "floatValue");
      v165 = v164;

      objc_msgSend(v80, "objectAtIndex:", 1);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "floatValue");
      v168 = v167;

      objc_msgSend(v80, "objectAtIndex:", 2);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "floatValue");
      v171 = v170;

      objc_msgSend(v80, "objectAtIndex:", 3);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "floatValue");
      v174 = v173;

      v175.n128_f64[0] = v165;
      v176.n128_f64[0] = v168;
      v177 = PDFRectMake(v175, v176, v171, v174);
      v179 = v178;
      v181 = v180;
      v183 = v182;
    }
    else
    {
      v177 = *MEMORY[0x24BDBF090];
      v179 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v181 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v183 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
    objc_msgSend(a1[6], "objectForKey:", CFSTR("regionIdentifier"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = -[PDFPointerRegion initWithRect:identifier:]([PDFPointerRegion alloc], "initWithRect:identifier:", v90, v177, v179, v181, v183);
    objc_msgSend(v187, "completePointerInteractionRegionForRequest:", v127);
LABEL_64:

LABEL_38:
LABEL_39:

    goto LABEL_13;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("killExtensionProcess")))
    objc_msgSend(v187, "killExtensionProcess");
  else
    NSLog(CFSTR("Unsuported \"extensionToHost:\" function recieved: \"%@\"), a1[5]);
LABEL_13:

}

- (void)extensionSnapshotToHost:(id)a3 scale:(double)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  PDFHostExtensionContext *v10;
  double v11;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__PDFHostExtensionContext_extensionSnapshotToHost_scale___block_invoke;
  block[3] = &unk_24C25DEC8;
  v11 = a4;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __57__PDFHostExtensionContext_extensionSnapshotToHost_scale___block_invoke(uint64_t a1)
{
  uint64_t v2;
  CGImage *v3;
  void *v4;
  id v5;

  v2 = CGImageCreateFromIOSurface();
  if (v2)
  {
    v3 = (CGImage *)v2;
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", v2, 0, *(double *)(a1 + 48));
    CGImageRelease(v3);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "hostViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recievedSnapshotViewRect:", v5);

}

- (PDFHostViewController)hostViewController
{
  return (PDFHostViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostViewController);
}

@end
