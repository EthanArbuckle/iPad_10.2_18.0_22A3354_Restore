@implementation CRAlignmentLayer

+ (id)layer
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (CRAlignmentLayer)init
{
  CRAlignmentLayer *v2;
  CRAlignmentLayer *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  double MidX;
  void *v47;
  double v48;
  double v49;
  void *v50;
  int v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double MinX;
  void *v65;
  double MaxY;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  CATransform3D v87;
  CATransform3D v88;
  CATransform3D v89;
  CATransform3D v90;
  CATransform3D v91;
  CATransform3D v92;
  objc_super v93;
  _QWORD v94[2];
  _QWORD v95[5];
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v95[2] = *MEMORY[0x24BDAC8D0];
  v93.receiver = self;
  v93.super_class = (Class)CRAlignmentLayer;
  v2 = -[CRAlignmentLayer init](&v93, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CRAlignmentLayer setBounds:](v2, "setBounds:", 0.0, 0.0, 85.6, 54.0);
    -[CRAlignmentLayer setFrame:](v3, "setFrame:", 0.0, 0.0, 85.6, 54.0);
    -[CRAlignmentLayer setHidden:](v3, "setHidden:", 0);
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer setMaskLayer:](v3, "setMaskLayer:", v4);

    -[CRAlignmentLayer maskLayer](v3, "maskLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = 1050253722;
    objc_msgSend(v5, "setOpacity:", v6);

    +[CRColor blackColor](CRColor, "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");
    -[CRAlignmentLayer maskLayer](v3, "maskLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFillColor:", v8);

    -[CRAlignmentLayer maskLayer](v3, "maskLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFillRule:", CFSTR("even-odd"));

    -[CRAlignmentLayer maskLayer](v3, "maskLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer addSublayer:](v3, "addSublayer:", v11);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer setOutlineLayer:](v3, "setOutlineLayer:", v12);

    +[CRColor clearColor](CRColor, "clearColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "CGColor");
    -[CRAlignmentLayer outlineLayer](v3, "outlineLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFillColor:", v14);

    +[CRColor whiteColor](CRColor, "whiteColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "CGColor");
    -[CRAlignmentLayer outlineLayer](v3, "outlineLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setStrokeColor:", v17);

    -[CRAlignmentLayer outlineLayer](v3, "outlineLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLineWidth:", 1.0);

    -[CRAlignmentLayer outlineLayer](v3, "outlineLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer addSublayer:](v3, "addSublayer:", v20);

    v21 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(MEMORY[0x24BDF6A70], "labelFontSize");
    objc_msgSend(v21, "systemFontOfSize:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scale");
    v25 = v24;

    v26 = *MEMORY[0x24BDF65F8];
    v95[0] = v22;
    v27 = *MEMORY[0x24BDF6600];
    v94[0] = v26;
    v94[1] = v27;
    +[CRColor whiteColor](CRColor, "whiteColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v95, v94, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_alloc(MEMORY[0x24BDD1688]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreRecognition"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Position Card in this Frame"), &stru_24C599708, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v30, "initWithString:attributes:", v32, v29);

    objc_msgSend(MEMORY[0x24BDE57C0], "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer setInstructionLayer:](v3, "setInstructionLayer:", v34);

    -[CRAlignmentLayer instructionLayer](v3, "instructionLayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setWrapped:", 1);

    -[CRAlignmentLayer instructionLayer](v3, "instructionLayer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAlignmentMode:", CFSTR("center"));

    -[CRAlignmentLayer instructionLayer](v3, "instructionLayer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setString:", v33);

    -[CRAlignmentLayer instructionLayer](v3, "instructionLayer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setContentsScale:", v25);

    -[CRAlignmentLayer instructionLayer](v3, "instructionLayer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer addSublayer:](v3, "addSublayer:", v39);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer setInfoLayer:](v3, "setInfoLayer:", v40);

    -[CRAlignmentLayer infoLayer](v3, "infoLayer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setBounds:", 0.0, 0.0, 85.6, 54.0);

    -[CRAlignmentLayer infoLayer](v3, "infoLayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v43) = 0;
    objc_msgSend(v42, "setOpacity:", v43);

    -[CRAlignmentLayer infoLayer](v3, "infoLayer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer addSublayer:](v3, "addSublayer:", v44);

    -[CRAlignmentLayer infoLayer](v3, "infoLayer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bounds");
    MidX = CGRectGetMidX(v96);
    -[CRAlignmentLayer infoLayer](v3, "infoLayer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bounds");
    -[CRAlignmentLayer setCardNumberHorizontalDefaultPos:](v3, "setCardNumberHorizontalDefaultPos:", MidX, CGRectGetMidY(v97) + 6.0);

    v48 = v25 * 4.0;
    v49 = v25 * 4.0 * 85.6;
    -[CRAlignmentLayer setCardNumberHorizontalDefaultBounds:](v3, "setCardNumberHorizontalDefaultBounds:", 0.0, 0.0, v49, ceil(v48 * 6.0));
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer setCardNumberLayers:](v3, "setCardNumberLayers:", v50);

    v51 = 4;
    v52 = 1.0 / v48;
    do
    {
      objc_msgSend(MEMORY[0x24BDE57C0], "layer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRAlignmentLayer cardNumberHorizontalDefaultBounds](v3, "cardNumberHorizontalDefaultBounds");
      objc_msgSend(v53, "setBounds:");
      -[CRAlignmentLayer cardNumberHorizontalDefaultPos](v3, "cardNumberHorizontalDefaultPos");
      objc_msgSend(v53, "setPosition:");
      CATransform3DMakeScale(&v92, 1.0 / v48, 1.0 / v48, 1.0);
      v91 = v92;
      objc_msgSend(v53, "setTransform:", &v91);
      objc_msgSend(v53, "setFont:", CFSTR("Spendcardium-Regular"));
      objc_msgSend(v53, "setFontSize:", v48 * 6.0);
      -[CRAlignmentLayer infoLayer](v3, "infoLayer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "addSublayer:", v53);

      -[CRAlignmentLayer cardNumberLayers](v3, "cardNumberLayers");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addObject:", v53);

      --v51;
    }
    while (v51);
    objc_msgSend(MEMORY[0x24BDE57C0], "layer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer setCardholderNameLayer:](v3, "setCardholderNameLayer:", v56);

    -[CRAlignmentLayer cardholderNameLayer](v3, "cardholderNameLayer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v48 * 4.25;
    v59 = ceil(v48 * 4.25);
    objc_msgSend(v57, "setBounds:", 0.0, 0.0, v49, v59);

    CATransform3DMakeScale(&v90, v52, v52, 1.0);
    -[CRAlignmentLayer cardholderNameLayer](v3, "cardholderNameLayer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v90;
    objc_msgSend(v60, "setTransform:", &v89);

    -[CRAlignmentLayer cardholderNameLayer](v3, "cardholderNameLayer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setFont:", CFSTR("Menlo-Bold"));

    -[CRAlignmentLayer cardholderNameLayer](v3, "cardholderNameLayer");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setFontSize:", v58);

    -[CRAlignmentLayer infoLayer](v3, "infoLayer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bounds");
    MinX = CGRectGetMinX(v98);
    -[CRAlignmentLayer infoLayer](v3, "infoLayer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "bounds");
    MaxY = CGRectGetMaxY(v99);
    -[CRAlignmentLayer cardholderNameLayer](v3, "cardholderNameLayer");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setPosition:", MinX + 8.56, MaxY + -2.7);

    -[CRAlignmentLayer cardholderNameLayer](v3, "cardholderNameLayer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setAlignmentMode:", CFSTR("left"));

    -[CRAlignmentLayer cardholderNameLayer](v3, "cardholderNameLayer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setAnchorPoint:", 0.0, 1.0);

    -[CRAlignmentLayer infoLayer](v3, "infoLayer");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer cardholderNameLayer](v3, "cardholderNameLayer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addSublayer:", v71);

    objc_msgSend(MEMORY[0x24BDE57C0], "layer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer setExpirationDateLayer:](v3, "setExpirationDateLayer:", v72);

    -[CRAlignmentLayer expirationDateLayer](v3, "expirationDateLayer");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setBounds:", 0.0, 0.0, v49, v59);

    -[CRAlignmentLayer infoLayer](v3, "infoLayer");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "bounds");
    v75 = CGRectGetMidX(v100);
    -[CRAlignmentLayer infoLayer](v3, "infoLayer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "bounds");
    v77 = CGRectGetMaxY(v101);
    -[CRAlignmentLayer expirationDateLayer](v3, "expirationDateLayer");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setPosition:", v75 + 8.56, v77 + -10.8);

    CATransform3DMakeScale(&v88, v52, v52, 1.0);
    -[CRAlignmentLayer expirationDateLayer](v3, "expirationDateLayer");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v88;
    objc_msgSend(v79, "setTransform:", &v87);

    -[CRAlignmentLayer expirationDateLayer](v3, "expirationDateLayer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setFont:", CFSTR("Menlo-Bold"));

    -[CRAlignmentLayer expirationDateLayer](v3, "expirationDateLayer");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setFontSize:", v58);

    -[CRAlignmentLayer expirationDateLayer](v3, "expirationDateLayer");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setAlignmentMode:", CFSTR("left"));

    -[CRAlignmentLayer expirationDateLayer](v3, "expirationDateLayer");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setAnchorPoint:", 0.0, 1.0);

    -[CRAlignmentLayer infoLayer](v3, "infoLayer");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer expirationDateLayer](v3, "expirationDateLayer");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "addSublayer:", v85);

  }
  return v3;
}

- (void)layoutSublayers
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  double v8;
  double v9;
  double height;
  void *v11;
  char isKindOfClass;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  CGFloat MinX;
  CGFloat v25;
  CGFloat Width;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  void *v36;
  void *v37;
  uint64_t v38;
  double v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  BOOL v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  int v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  id v65;
  const CGPath *v66;
  double MidX;
  CGFloat v68;
  double MidY;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGPath *Mutable;
  const CGPath *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  double v109;
  void *v110;
  double v111;
  void *v112;
  void *v113;
  double v114;
  void *v115;
  double v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  CGFloat rect;
  CATransform3D v130;
  CATransform3D v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;

  -[CRAlignmentLayer bounds](self, "bounds");
  x = v3;
  y = v5;
  v8 = v7;
  height = v9;
  -[CRAlignmentLayer delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRAlignmentLayer delegate](self, "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = 0.0;
      v16 = 0.0;
      do
      {
        objc_msgSend(v14, "topLayoutGuide");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "length");
        v19 = v18;

        objc_msgSend(v14, "bottomLayoutGuide");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "length");
        v22 = v21;

        objc_msgSend(v14, "parentViewController");
        v23 = objc_claimAutoreleasedReturnValue();
        v15 = fmax(v15, v19);
        v16 = fmax(v16, v22);

        v14 = (void *)v23;
      }
      while (v23);
    }
    else
    {
      v16 = 0.0;
      v15 = 0.0;
    }
    -[CRAlignmentLayer bounds](self, "bounds");
    MinX = CGRectGetMinX(v132);
    -[CRAlignmentLayer bounds](self, "bounds");
    v25 = v15 + CGRectGetMinY(v133);
    -[CRAlignmentLayer bounds](self, "bounds");
    Width = CGRectGetWidth(v134);
    -[CRAlignmentLayer bounds](self, "bounds");
    v136.size.height = CGRectGetHeight(v135) - v15 - v16;
    v136.origin.x = MinX;
    v136.origin.y = v25;
    v136.size.width = Width;
    v137 = CGRectInset(v136, 16.0, 16.0);
    x = v137.origin.x;
    y = v137.origin.y;
    v8 = v137.size.width;
    height = v137.size.height;
  }
  -[CRAlignmentLayer instructionLayer](self, "instructionLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "string");
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v28, "boundingRectWithSize:options:context:", 3, 0, v8, height);
  rect = v29;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  -[CRAlignmentLayer instructionLayer](self, "instructionLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v28) = objc_msgSend(v36, "isHidden");

  if ((v28 & 1) == 0)
  {
    v138.origin.x = v31;
    v138.origin.y = v33;
    v138.size.width = v35;
    v138.size.height = rect;
    height = height - (CGRectGetHeight(v138) + 8.0);
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "userInterfaceIdiom");

  v125 = v33;
  v126 = v31;
  v124 = v35;
  if (!v38)
  {
    deviceModel();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("iPhone13,4"));

    if (v60)
      v39 = 0.800000012;
    else
      v39 = 1.0;
    goto LABEL_18;
  }
  v39 = 1.0;
  if (v38 != 1)
  {
LABEL_18:
    v144.origin.x = x;
    v144.origin.y = y;
    v144.size.width = v8;
    v144.size.height = height;
    v55 = v39 * CGRectGetWidth(v144);
    v145.origin.x = x;
    v145.origin.y = y;
    v145.size.width = v8;
    v145.size.height = height;
    v58 = v39 * CGRectGetHeight(v145);
    v146.origin.x = x;
    v146.origin.y = y;
    v146.size.width = v8;
    v146.size.height = height;
    v56 = CGRectGetMidX(v146) - v55 * 0.5;
    v147.origin.x = x;
    v147.origin.y = y;
    v147.size.width = v8;
    v147.size.height = height;
    v57 = CGRectGetMidY(v147) - v58 * 0.5;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bounds");
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  -[CRAlignmentLayer bounds](self, "bounds");
  v165.origin.x = v49;
  v165.origin.y = v50;
  v165.size.width = v51;
  v165.size.height = v52;
  v139.origin.x = v42;
  v139.origin.y = v44;
  v139.size.width = v46;
  v139.size.height = v48;
  v53 = CGRectEqualToRect(v139, v165);

  if (!v53)
  {
    v39 = 0.800000012;
    goto LABEL_18;
  }
  v140.origin.x = x;
  v140.origin.y = y;
  v140.size.width = v8;
  v140.size.height = height;
  v54 = CGRectGetWidth(v140) * 0.600000024;
  v141.origin.x = x;
  v141.origin.y = y;
  v141.size.width = v8;
  v141.size.height = height;
  v55 = fmax(v54, CGRectGetHeight(v141) * 0.600000024);
  v142.origin.x = x;
  v142.origin.y = y;
  v142.size.width = v8;
  v142.size.height = height;
  v56 = CGRectGetMidX(v142) - v55 * 0.5;
  v143.origin.x = x;
  v143.origin.y = y;
  v143.size.width = v8;
  v143.size.height = height;
  v57 = CGRectGetMidY(v143) - v55 * 0.5;
  v58 = v55;
LABEL_19:
  v148.origin.x = v56;
  v148.origin.y = v57;
  v148.size.width = v55;
  v148.size.height = v58;
  v61 = CGRectGetWidth(v148) / 85.6;
  v127 = v57;
  v128 = v56;
  v149.origin.x = v56;
  v149.origin.y = v57;
  v149.size.width = v55;
  v149.size.height = v58;
  v62 = fmin(v61, CGRectGetHeight(v149) / 54.0);
  v63 = v62 * 85.6;
  v64 = v62 * 54.0;
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v62 * 85.6, v62 * 54.0, v62 * 4.0);
  v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v66 = CGPathRetain((CGPathRef)objc_msgSend(v65, "CGPath"));

  v150.origin.x = 0.0;
  v150.origin.y = 0.0;
  v150.size.width = v63;
  v150.size.height = v64;
  MidX = CGRectGetMidX(v150);
  -[CRAlignmentLayer bounds](self, "bounds");
  v68 = MidX - CGRectGetWidth(v151);
  v152.origin.x = 0.0;
  v152.origin.y = 0.0;
  v152.size.width = v63;
  v152.size.height = v64;
  MidY = CGRectGetMidY(v152);
  -[CRAlignmentLayer bounds](self, "bounds");
  v70 = MidY - CGRectGetHeight(v153);
  -[CRAlignmentLayer bounds](self, "bounds");
  v71 = CGRectGetWidth(v154);
  v72 = v71 + v71;
  -[CRAlignmentLayer bounds](self, "bounds");
  v73 = CGRectGetHeight(v155);
  v74 = v73 + v73;
  Mutable = CGPathCreateMutable();
  v156.origin.x = v68;
  v156.origin.y = v70;
  v156.size.width = v72;
  v156.size.height = v74;
  v76 = CGPathCreateWithRect(v156, 0);
  CGPathAddPath(Mutable, 0, v76);
  CGPathAddPath(Mutable, 0, v66);
  -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setBounds:", 0.0, 0.0, v63, v64);

  v157.origin.x = v128;
  v157.origin.y = v127;
  v157.size.width = v55;
  v157.size.height = v58;
  v78 = CGRectGetMidX(v157);
  v158.origin.x = v128;
  v158.origin.y = v127;
  v158.size.width = v55;
  v158.size.height = v58;
  v79 = CGRectGetMidY(v158);
  -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setPosition:", v78, v79);

  -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setPath:", v66);

  CGPathRelease(v66);
  -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "bounds");
  v84 = v83;
  v86 = v85;
  v88 = v87;
  v90 = v89;
  -[CRAlignmentLayer maskLayer](self, "maskLayer");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setBounds:", v84, v86, v88, v90);

  -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "position");
  v94 = v93;
  v96 = v95;
  -[CRAlignmentLayer maskLayer](self, "maskLayer");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setPosition:", v94, v96);

  -[CRAlignmentLayer maskLayer](self, "maskLayer");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setPath:", Mutable);

  CGPathRelease(Mutable);
  CGPathRelease(v76);
  v159.origin.x = v128;
  v159.origin.y = v127;
  v159.size.width = v55;
  v159.size.height = v58;
  v99 = CGRectGetWidth(v159);
  v160.origin.y = v125;
  v160.origin.x = v126;
  v160.size.width = v124;
  v160.size.height = rect;
  v100 = ceil(CGRectGetHeight(v160));
  -[CRAlignmentLayer instructionLayer](self, "instructionLayer");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setBounds:", 0.0, 0.0, v99, v100);

  -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "position");
  v104 = v103;
  -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "position");
  v107 = v106;
  -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "bounds");
  v109 = CGRectGetHeight(v161);
  -[CRAlignmentLayer instructionLayer](self, "instructionLayer");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "bounds");
  v111 = CGRectGetHeight(v162);
  -[CRAlignmentLayer instructionLayer](self, "instructionLayer");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setPosition:", v104, v107 + v109 * 0.5 + 8.0 + v111 * 0.5);

  -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "bounds");
  v114 = CGRectGetWidth(v163);
  -[CRAlignmentLayer infoLayer](self, "infoLayer");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "bounds");
  v116 = CGRectGetWidth(v164);

  -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "position");
  v119 = v118;
  v121 = v120;
  -[CRAlignmentLayer infoLayer](self, "infoLayer");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setPosition:", v119, v121);

  CATransform3DMakeScale(&v131, v114 / v116, v114 / v116, 1.0);
  -[CRAlignmentLayer infoLayer](self, "infoLayer");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v131;
  objc_msgSend(v123, "setTransform:", &v130);

}

- (void)resetLayer
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v6++), "setString:", 0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  -[CRAlignmentLayer cardholderNameLayer](self, "cardholderNameLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setString:", 0);

  -[CRAlignmentLayer expirationDateLayer](self, "expirationDateLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setString:", 0);

  -[CRAlignmentLayer instructionLayer](self, "instructionLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1.0;
  objc_msgSend(v9, "setOpacity:", v10);

  -[CRAlignmentLayer infoLayer](self, "infoLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 0;
  objc_msgSend(v11, "setOpacity:", v12);

}

- (CGRect)alignmentRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAlignmentLayer convertRect:fromLayer:](self, "convertRect:fromLayer:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGPoint)pointOnInfoLayerForPointOnCard:(CGPoint)a3
{
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double MinX;
  void *v12;
  CGFloat MaxY;
  float v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;
  CGRect v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  if (a3.x != *MEMORY[0x24BDBEFB0] || a3.y != *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    -[CRAlignmentLayer infoLayer](self, "infoLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;

    -[CRAlignmentLayer infoLayer](self, "infoLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    MinX = CGRectGetMinX(v19);
    -[CRAlignmentLayer infoLayer](self, "infoLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    MaxY = CGRectGetMaxY(v20);
    v14 = v9 / 85.6;
    v15 = v14;
    x = MinX + x * v15;
    y = MaxY - y * v15;

  }
  v16 = x;
  v17 = y;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)makeTextLayer:(id)a3 matchWidthOfText:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDF6A70];
  v7 = objc_msgSend(v16, "font");
  objc_msgSend(v16, "fontSize");
  objc_msgSend(v6, "fontWithName:size:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v8, *MEMORY[0x24BDF65F8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeWithAttributes:", v9);
  v11 = v10;

  objc_msgSend(v16, "bounds");
  v13 = v12;
  objc_msgSend(v16, "bounds");
  v15 = v14;
  objc_msgSend(v16, "bounds");
  objc_msgSend(v16, "setBounds:", v13, v15, v11);

}

- (void)animateFoundCodeParts:(id)a3 codePartPositions:(id)a4 codeFrameIndex:(unint64_t)a5 cardHolder:(id)a6 cardholderPosition:(CGPoint)a7 cardholderFrameIndex:(unint64_t)a8 expDate:(id)a9 expdatePosition:(CGPoint)a10 expDateFrameIndex:(unint64_t)a11 completionBlock:(id)a12
{
  id v12;
  double x;
  double v16;
  double v17;
  id v21;
  NSString *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  double v47;
  NSPoint v48;
  void *v49;
  void *v50;
  float v51;
  float v52;
  unint64_t v53;
  double v54;
  unint64_t v55;
  NSString *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  double *v68;
  double v69;
  double v70;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  unint64_t j;
  void *v93;
  unint64_t v94;
  void *v95;
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
  double v106;
  double v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double width;
  double v120;
  double height;
  unint64_t v122;
  double v123;
  unint64_t k;
  void *v125;
  BOOL v126;
  void *v127;
  void *v128;
  CGFloat v129;
  CGFloat v130;
  CGFloat v131;
  CGFloat v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  unint64_t m;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  double v145;
  double v146;
  unint64_t v147;
  double v148;
  double v149;
  double v150;
  void *v151;
  void *v152;
  double v153;
  double v154;
  double v155;
  unint64_t n;
  void *v157;
  BOOL v158;
  void *v159;
  void *v160;
  id v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  double v169;
  void *v170;
  double v171;
  void *v172;
  void *v173;
  const CGPath *v174;
  void *v175;
  void *v176;
  double v177;
  id v178;
  id v179;
  void *v180;
  void *v182;
  id v183;
  void *v184;
  id v185;
  double y;
  void *v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  _BYTE v192[128];
  uint64_t v193;
  CGRect v194;
  CGRect v195;
  CGRect BoundingBox;
  CGRect v197;

  y = a10.y;
  x = a10.x;
  v16 = a7.y;
  v17 = a7.x;
  v193 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v185 = a4;
  v183 = a6;
  v179 = a9;
  v178 = a12;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("disableActions"));
  if (objc_msgSend(v185, "count") == 1)
  {
    objc_msgSend(v185, "objectAtIndex:", 0);
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSPointFromString(v22);

    -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAlignmentMode:", CFSTR("center"));

    -[CRAlignmentLayer cardNumberHorizontalDefaultBounds](self, "cardNumberHorizontalDefaultBounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setBounds:", v26, v28, v30, v32);

    -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAnchorPoint:", 0.5, 0.5);

    -[CRAlignmentLayer cardNumberHorizontalDefaultPos](self, "cardNumberHorizontalDefaultPos");
    -[CRAlignmentLayer pointOnInfoLayerForPointOnCard:](self, "pointOnInfoLayerForPointOnCard:");
    v38 = v37;
    v40 = v39;
    -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setPosition:", v38, v40);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v185, "count"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = 0u;
    v191 = 0u;
    v188 = 0u;
    v189 = 0u;
    v12 = v185;
    v44 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v188, v192, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v189;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v189 != v45)
            objc_enumerationMutation(v12);
          v48 = NSPointFromString((NSString *)*(_QWORD *)(*((_QWORD *)&v188 + 1) + 8 * i));
          HIDWORD(v47) = HIDWORD(v48.x);
          *(float *)&v47 = v48.x;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v47, v48.y);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v49);

        }
        v44 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v188, v192, 16);
      }
      while (v44);
    }

    objc_msgSend(v43, "sortUsingComparator:", &__block_literal_global);
    objc_msgSend(v43, "objectAtIndex:", (unint64_t)objc_msgSend(v43, "count") >> 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "floatValue");
    v52 = v51;

    v53 = 0;
    v54 = v52;
    while (1)
    {
      v55 = objc_msgSend(v12, "count");
      if (v53 > 3 || v53 >= v55)
        break;
      objc_msgSend(v12, "objectAtIndex:", v53);
      v56 = (NSString *)objc_claimAutoreleasedReturnValue();
      v57 = NSPointFromString(v56).y;

      -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectAtIndexedSubscript:", v53);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setAlignmentMode:", CFSTR("left"));

      -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectAtIndexedSubscript:", v53);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setAnchorPoint:", 0.0, 1.0);

      -[CRAlignmentLayer pointOnInfoLayerForPointOnCard:](self, "pointOnInfoLayerForPointOnCard:", v54, v57);
      v63 = v62;
      v65 = v64;
      -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "objectAtIndexedSubscript:", v53);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setPosition:", v63, v65);

      ++v53;
    }

  }
  v68 = (double *)MEMORY[0x24BDBEFB0];
  v69 = *MEMORY[0x24BDBEFB0];
  v70 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (v17 != *MEMORY[0x24BDBEFB0] || v16 != v70)
  {
    -[CRAlignmentLayer pointOnInfoLayerForPointOnCard:](self, "pointOnInfoLayerForPointOnCard:", v17, v16);
    v73 = v72;
    v75 = v74;
    -[CRAlignmentLayer cardholderNameLayer](self, "cardholderNameLayer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setPosition:", v73, v75);

    v69 = *v68;
    v70 = v68[1];
  }
  if (x != v69 || y != v70)
  {
    -[CRAlignmentLayer pointOnInfoLayerForPointOnCard:](self, "pointOnInfoLayerForPointOnCard:", x, y);
    v79 = v78;
    v81 = v80;
    -[CRAlignmentLayer expirationDateLayer](self, "expirationDateLayer");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setPosition:", v79, v81);

  }
  -[CRAlignmentLayer infoLayer](self, "infoLayer");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "bounds");
  v85 = v84;
  -[CRAlignmentLayer infoLayer](self, "infoLayer");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "bounds");
  v88 = v87;

  if ((unint64_t)objc_msgSend(v185, "count") >= 2)
  {
    -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "subarrayWithRange:", 0, objc_msgSend(v185, "count"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (void *)objc_msgSend(v90, "mutableCopy");

    objc_msgSend(v91, "sortUsingComparator:", &__block_literal_global_40);
    for (j = 1; j < objc_msgSend(v91, "count"); j = v94 + 2)
    {
      objc_msgSend(v91, "objectAtIndex:", j);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = j - 1;
      objc_msgSend(v91, "objectAtIndex:", j - 1);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "frame");
      v97 = v96;
      objc_msgSend(v95, "frame");
      v99 = v98;
      objc_msgSend(v93, "frame");
      v101 = v97 + v99 - v100;
      if (v101 > 0.0)
      {
        objc_msgSend(v93, "frame");
        v103 = v102;
        objc_msgSend(v93, "frame");
        v105 = v104;
        objc_msgSend(v93, "frame");
        v107 = v106;
        objc_msgSend(v93, "frame");
        objc_msgSend(v93, "setFrame:", v103, v101 + v105, v107);
      }

    }
  }
  v108 = objc_alloc(MEMORY[0x24BDE57C0]);
  -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "objectAtIndex:", 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = (void *)objc_msgSend(v108, "initWithLayer:", v110);

  -[CRAlignmentLayer infoLayer](self, "infoLayer");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addSublayer:", v187);

  -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "objectAtIndex:", 0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "frame");
  v115 = v114;
  v117 = v116;
  width = v118;
  height = v120;

  v122 = a11;
  v123 = v88 + -1.0;
  for (k = 1; k < objc_msgSend(v21, "count"); ++k)
  {
    -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = k < objc_msgSend(v125, "count");

    if (!v126)
      break;
    -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "objectAtIndex:", k);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "frame");
    v197.origin.x = v129;
    v197.origin.y = v130;
    v197.size.width = v131;
    v197.size.height = v132;
    v194.origin.x = v115;
    v194.origin.y = v117;
    v194.size.width = width;
    v194.size.height = height;
    v195 = CGRectUnion(v194, v197);
    v115 = v195.origin.x;
    v117 = v195.origin.y;
    width = v195.size.width;
    height = v195.size.height;

  }
  objc_msgSend(v187, "setFrame:", v115, v117, width, height);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v187);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "arrayWithObject:", v134);
  v180 = (void *)objc_claimAutoreleasedReturnValue();

  if (a8 != -1)
  {
    -[CRAlignmentLayer cardholderNameLayer](self, "cardholderNameLayer");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "addObject:", v135);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a8);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "addObject:", v136);

  }
  if (a11 != -1)
  {
    -[CRAlignmentLayer expirationDateLayer](self, "expirationDateLayer");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "addObject:", v137);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a11);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "addObject:", v138);

  }
  for (m = 0; m < objc_msgSend(v21, "count"); ++m)
  {
    -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = m < objc_msgSend(v140, "count");

    if ((v122 & 1) == 0)
      break;
    -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "objectAtIndexedSubscript:", m);
    v122 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndex:", m);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer makeTextLayer:matchWidthOfText:](self, "makeTextLayer:matchWidthOfText:", v122, v142);

  }
  -[CRAlignmentLayer cardholderNameLayer](self, "cardholderNameLayer");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAlignmentLayer makeTextLayer:matchWidthOfText:](self, "makeTextLayer:matchWidthOfText:", v143, v183);

  objc_msgSend(v179, "stringByReplacingOccurrencesOfString:withString:", CFSTR("0"), CFSTR("O"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAlignmentLayer expirationDateLayer](self, "expirationDateLayer");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAlignmentLayer makeTextLayer:matchWidthOfText:](self, "makeTextLayer:matchWidthOfText:", v144, v182);

  sortOverlappingCALayers(v184, v180, 0.0, 1.0, v85, v123);
  keepAllLayersWithinHorizontalBounds(v184, 0.0, 1.0, v85);
  objc_msgSend(v187, "frame");
  v146 = v145;
  objc_msgSend(v187, "frame");
  v147 = 0;
  v148 = v146 - v115;
  v150 = v149 - v117;
  while (v147 < objc_msgSend(v21, "count"))
  {
    -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = v147 < objc_msgSend(v151, "count");

    if ((v122 & 1) == 0)
      break;
    -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
    v122 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v122, "objectAtIndexedSubscript:", v147);
    v152 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v152, "position");
    v154 = v153;
    objc_msgSend(v152, "position");
    objc_msgSend(v152, "setPosition:", v148 + v154, v150 + v155);

    ++v147;
  }
  objc_msgSend(v187, "removeFromSuperlayer");
  objc_msgSend(MEMORY[0x24BDE57D8], "setValue:forKey:", MEMORY[0x24BDBD1C0], CFSTR("disableActions"));
  for (n = 0; n < objc_msgSend(v21, "count"); ++n)
  {
    -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = n < objc_msgSend(v157, "count");

    if (!v158)
      break;
    objc_msgSend(v21, "objectAtIndexedSubscript:", n);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    if (v159)
    {
      v160 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v21, "objectAtIndexedSubscript:", n);
      v122 = objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v160, "_newZStringWithString:", v122);
      v161 = v12;
    }
    else
    {
      v161 = 0;
    }
    -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "objectAtIndexedSubscript:", n);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "setString:", v161);

    if (v159)
    {

    }
  }
  if (v183)
    v164 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:");
  else
    v164 = 0;
  -[CRAlignmentLayer cardholderNameLayer](self, "cardholderNameLayer");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "setString:", v164);

  if (v183)
  if (v182)
    v166 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:");
  else
    v166 = 0;
  -[CRAlignmentLayer expirationDateLayer](self, "expirationDateLayer");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "setString:", v166);

  if (v182)
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  -[CRAlignmentLayer instructionLayer](self, "instructionLayer");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v169) = 0;
  objc_msgSend(v168, "setOpacity:", v169);

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v170 = (void *)MEMORY[0x24BDE57D8];
  LODWORD(v171) = 0.5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "setValue:forKey:", v172, CFSTR("animationDuration"));

  -[CRAlignmentLayer maskLayer](self, "maskLayer");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(v173, "path"));
  v174 = CGPathCreateWithRect(BoundingBox, 0);

  -[CRAlignmentLayer maskLayer](self, "maskLayer");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "setPath:", v174);

  CGPathRelease(v174);
  -[CRAlignmentLayer infoLayer](self, "infoLayer");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v177) = 1.0;
  objc_msgSend(v176, "setOpacity:", v177);

  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v178);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

uint64_t __184__CRAlignmentLayer_animateFoundCodeParts_codePartPositions_codeFrameIndex_cardHolder_cardholderPosition_cardholderFrameIndex_expDate_expdatePosition_expDateFrameIndex_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __184__CRAlignmentLayer_animateFoundCodeParts_codePartPositions_codeFrameIndex_cardHolder_cardholderPosition_cardholderFrameIndex_expDate_expdatePosition_expDateFrameIndex_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "position");
  v7 = v6;
  objc_msgSend(v5, "position");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "position");
    v11 = v10;
    objc_msgSend(v5, "position");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void)animateFoundCardRect:(id)a3
{
  uint64_t v4;
  double *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  BOOL v40;
  CGFloat v41;
  CGFloat v42;
  uint64_t v43;
  CGFloat v44;
  CGFloat v45;
  void *v47;
  float v48;
  float v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  id v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  CGPoint v71;
  CGPoint v72;
  CGPoint v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v70 = *MEMORY[0x24BDAC8D0];
  v61 = a3;
  if (v61)
  {
    v4 = 0;
    v5 = &v63;
    do
    {
      objc_msgSend(v61, "objectAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "CGPointValue");
      *((_QWORD *)v5 - 1) = v7;
      *(_QWORD *)v5 = v8;

      ++v4;
      v5 += 2;
    }
    while (v4 != 4);
    v9 = v62;
    v10 = v63;
    v12 = v64;
    v11 = v65;
    v13 = v66;
    v14 = v67;
    v15 = v68;
    v16 = v69;
    if ((sqrt((v62 - v64) * (v62 - v64) + (v63 - v65) * (v63 - v65))
        + sqrt((v66 - v68) * (v66 - v68) + (v67 - v69) * (v67 - v69)))
       * 0.5 <= (sqrt((v64 - v66) * (v64 - v66) + (v65 - v67) * (v65 - v67))
               + sqrt((v68 - v62) * (v68 - v62) + (v69 - v63) * (v69 - v63)))
              * 0.5)
    {
      v17 = v66 + v68;
      v18 = v67 + v69;
      v19 = v64;
      v20 = v65;
    }
    else
    {
      v17 = v64 + v66;
      v18 = v65 + v67;
      v19 = v68;
      v20 = v69;
    }
    v21 = (v63 + v20) * 0.5;
    v22 = (v62 + v19) * 0.5;
    v23 = v18 * 0.5;
    v24 = v17 * 0.5;
    if (v24 == v22)
      v25 = dbl_20CDD3A30[v23 > v21];
    else
      v25 = atan((v23 - v21) / (v24 - v22));
    -[CRAlignmentLayer outlineLayer](self, "outlineLayer", *(_QWORD *)&v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v13;
    v54 = v12;
    v55 = v11;
    v57 = v10;
    v59 = v9;
    objc_msgSend(v26, "bounds");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAlignmentLayer convertRect:fromLayer:](self, "convertRect:fromLayer:", v35, v28, v30, v32, v34);
    v75 = CGRectInset(v74, -16.0, -16.0);
    x = v75.origin.x;
    y = v75.origin.y;
    width = v75.size.width;
    height = v75.size.height;

    v76.origin.x = x;
    v76.origin.y = y;
    v76.size.width = width;
    v76.size.height = height;
    v71.x = (v59 + v54 + v53 + v15) * 0.25;
    v71.y = (v57 + v55 + v14 + v16) * 0.25;
    v40 = CGRectContainsPoint(v76, v71);
    v77.origin.x = x;
    v77.origin.y = y;
    v77.size.width = width;
    v77.size.height = height;
    v78 = CGRectInset(v77, width * 0.2, height * 0.2);
    v58 = v78.origin.y;
    v60 = v78.origin.x;
    v41 = v78.size.width;
    v42 = v78.size.height;
    v43 = 0;
    v56 = v52 * 180.0 / 3.14159265;
    do
    {
      v44 = *(double *)((char *)&v62 + v43);
      v45 = *(double *)((char *)&v62 + v43 + 8);
      v79.origin.x = x;
      v79.origin.y = y;
      v79.size.width = width;
      v79.size.height = height;
      v72.x = v44;
      v72.y = v45;
      if (!CGRectContainsPoint(v79, v72)
        || (v80.origin.y = v58,
            v80.origin.x = v60,
            v80.size.width = v41,
            v80.size.height = v42,
            v73.x = v44,
            v73.y = v45,
            CGRectContainsPoint(v80, v73)))
      {
        v40 = 0;
      }
      v43 += 16;
    }
    while (v43 != 64);
    if (v40 && v56 >= -15.0 && v56 <= 15.0)
    {
      -[CRAlignmentLayer instructionLayer](self, "instructionLayer", 15.0, v56);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "opacity");
      v49 = v48;

      if (v49 != 0.0)
      {
        -[CRAlignmentLayer instructionLayer](self, "instructionLayer");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v51) = 0;
        objc_msgSend(v50, "setOpacity:", v51);

      }
    }
  }

}

- (void)propogateMaskColor:(id)a3 outlineColor:(id)a4 placementTextColor:(id)a5 capturedTextColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  double v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v29 = a5;
  v12 = a6;
  v34 = 0.0;
  objc_msgSend(v10, "getWhite:alpha:", 0, &v34);
  -[CRAlignmentLayer maskLayer](self, "maskLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v14) = HIDWORD(v34);
  *(float *)&v14 = v34;
  objc_msgSend(v13, "setOpacity:", v14);

  -[CRAlignmentLayer maskLayer](self, "maskLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorWithAlphaComponent:", 1.0);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "setFillColor:", objc_msgSend(v16, "CGColor"));

  -[CRAlignmentLayer outlineLayer](self, "outlineLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorWithAlphaComponent:", 1.0);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "setStrokeColor:", objc_msgSend(v18, "CGColor"));

  -[CRAlignmentLayer instructionLayer](self, "instructionLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_retainAutorelease(v29);
  objc_msgSend(v19, "setForegroundColor:", objc_msgSend(v20, "CGColor"));

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[CRAlignmentLayer cardNumberLayers](self, "cardNumberLayers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v31;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v24++), "setForegroundColor:", objc_msgSend(objc_retainAutorelease(v12), "CGColor"));
      }
      while (v22 != v24);
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v22);
  }

  -[CRAlignmentLayer cardholderNameLayer](self, "cardholderNameLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_retainAutorelease(v12);
  objc_msgSend(v25, "setForegroundColor:", objc_msgSend(v26, "CGColor"));

  -[CRAlignmentLayer expirationDateLayer](self, "expirationDateLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_retainAutorelease(v26);
  objc_msgSend(v27, "setForegroundColor:", objc_msgSend(v28, "CGColor"));

}

- (CATextLayer)instructionLayer
{
  return (CATextLayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInstructionLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CAShapeLayer)maskLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMaskLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CAShapeLayer)outlineLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutlineLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CALayer)infoLayer
{
  return (CALayer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInfoLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableArray)cardNumberLayers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCardNumberLayers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CGPoint)cardNumberHorizontalDefaultPos
{
  double x;
  double y;
  CGPoint result;

  x = self->_cardNumberHorizontalDefaultPos.x;
  y = self->_cardNumberHorizontalDefaultPos.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCardNumberHorizontalDefaultPos:(CGPoint)a3
{
  self->_cardNumberHorizontalDefaultPos = a3;
}

- (CGRect)cardNumberHorizontalDefaultBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cardNumberHorizontalDefaultBounds.origin.x;
  y = self->_cardNumberHorizontalDefaultBounds.origin.y;
  width = self->_cardNumberHorizontalDefaultBounds.size.width;
  height = self->_cardNumberHorizontalDefaultBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCardNumberHorizontalDefaultBounds:(CGRect)a3
{
  self->_cardNumberHorizontalDefaultBounds = a3;
}

- (CATextLayer)cardholderNameLayer
{
  return (CATextLayer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCardholderNameLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CATextLayer)expirationDateLayer
{
  return (CATextLayer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExpirationDateLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDateLayer, 0);
  objc_storeStrong((id *)&self->_cardholderNameLayer, 0);
  objc_storeStrong((id *)&self->_cardNumberLayers, 0);
  objc_storeStrong((id *)&self->_infoLayer, 0);
  objc_storeStrong((id *)&self->_outlineLayer, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_instructionLayer, 0);
}

@end
