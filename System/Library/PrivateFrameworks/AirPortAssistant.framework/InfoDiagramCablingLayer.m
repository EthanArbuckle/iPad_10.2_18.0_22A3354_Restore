@implementation InfoDiagramCablingLayer

- (void)commonInit
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  CGColorRef v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  CGColorRef v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  CGColorRef v75;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  CGColorRef v90;
  const char *v91;
  const char *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  CGColorRef v105;
  const char *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  const char *v111;
  const char *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  CGColorRef v121;
  const char *v122;
  const char *v123;
  const char *v124;
  const char *v125;
  const char *v126;
  const char *v127;
  const char *v128;
  _QWORD v129[3];

  v129[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_setFrame_(self, a2, v2, 0.0, 0.0, 10.0, 10.0);
  v6 = objc_msgSend_layer(MEMORY[0x24BDE5758], v4, v5);
  objc_msgSend_setInternetOuterLineLayer_(self, v7, v6);
  objc_msgSend_frame(self, v8, v9);
  objc_msgSend_setFrame_(self->internetOuterLineLayer, v10, v11);
  v12 = sub_21A71CA30(1.0, 1.0, 1.0, 0.0);
  objc_msgSend_setBackgroundColor_(self->internetOuterLineLayer, v13, (uint64_t)v12);
  objc_msgSend_setName_(self->internetOuterLineLayer, v14, (uint64_t)CFSTR("Internet"));
  objc_msgSend_setDelegate_(self->internetOuterLineLayer, v15, (uint64_t)self);
  v16 = *MEMORY[0x24BDE5CE8];
  objc_msgSend_setLineCap_(self->internetOuterLineLayer, v17, *MEMORY[0x24BDE5CE8]);
  objc_msgSend_setFillColor_(self->internetOuterLineLayer, v18, 0);
  objc_msgSend_addSublayer_(self, v19, (uint64_t)self->internetOuterLineLayer);
  v22 = objc_msgSend_layer(MEMORY[0x24BDE5758], v20, v21);
  objc_msgSend_setInternetInnerLineLayer_(self, v23, v22);
  objc_msgSend_frame(self, v24, v25);
  objc_msgSend_setFrame_(self->internetInnerLineLayer, v26, v27);
  v28 = sub_21A71CA30(1.0, 1.0, 1.0, 0.0);
  objc_msgSend_setBackgroundColor_(self->internetInnerLineLayer, v29, (uint64_t)v28);
  objc_msgSend_setName_(self->internetInnerLineLayer, v30, (uint64_t)CFSTR("Internet"));
  objc_msgSend_setDelegate_(self->internetInnerLineLayer, v31, (uint64_t)self);
  objc_msgSend_setLineCap_(self->internetInnerLineLayer, v32, v16);
  objc_msgSend_setFillColor_(self->internetInnerLineLayer, v33, 0);
  objc_msgSend_addSublayer_(self, v34, (uint64_t)self->internetInnerLineLayer);
  v37 = objc_msgSend_layer(MEMORY[0x24BDE56B8], v35, v36);
  objc_msgSend_setInternetGradientLayer_(self, v38, v37);
  objc_msgSend_frame(self, v39, v40);
  objc_msgSend_setFrame_(self->internetGradientLayer, v41, v42);
  objc_msgSend_setName_(self->internetGradientLayer, v43, (uint64_t)CFSTR("Gradient"));
  v46 = (void *)objc_msgSend_colorWithWhite_alpha_(MEMORY[0x24BDF6950], v44, v45, 0.0, 0.0);
  v49 = objc_msgSend_CGColor(v46, v47, v48);
  v52 = (void *)objc_msgSend_colorWithWhite_alpha_(MEMORY[0x24BDF6950], v50, v51, 0.0, 1.0);
  v129[0] = v49;
  v129[1] = objc_msgSend_CGColor(v52, v53, v54);
  v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v55, (uint64_t)v129, 2);
  objc_msgSend_setColors_(self->internetGradientLayer, v57, v56);
  objc_msgSend_setStartPoint_(self->internetGradientLayer, v58, v59, 0.0, 0.5);
  objc_msgSend_setEndPoint_(self->internetGradientLayer, v60, v61, 0.5, 0.5);
  objc_msgSend_setLocations_(self->internetGradientLayer, v62, (uint64_t)&unk_24DD1DB08);
  objc_msgSend_frame(self, v63, v64);
  objc_msgSend_setBounds_(self->internetGradientLayer, v65, v66);
  v69 = objc_msgSend_layer(MEMORY[0x24BDE5758], v67, v68);
  objc_msgSend_setBroadbandToWANOuterLineLayer_(self, v70, v69);
  objc_msgSend_frame(self, v71, v72);
  objc_msgSend_setFrame_(self->broadbandToWANOuterLineLayer, v73, v74);
  v75 = sub_21A71CA30(1.0, 1.0, 1.0, 0.0);
  objc_msgSend_setBackgroundColor_(self->broadbandToWANOuterLineLayer, v76, (uint64_t)v75);
  objc_msgSend_setName_(self->broadbandToWANOuterLineLayer, v77, (uint64_t)CFSTR("BroadbandToWAN"));
  objc_msgSend_setDelegate_(self->broadbandToWANOuterLineLayer, v78, (uint64_t)self);
  objc_msgSend_setLineCap_(self->broadbandToWANOuterLineLayer, v79, v16);
  objc_msgSend_setFillColor_(self->broadbandToWANOuterLineLayer, v80, 0);
  objc_msgSend_addSublayer_(self, v81, (uint64_t)self->broadbandToWANOuterLineLayer);
  v84 = objc_msgSend_layer(MEMORY[0x24BDE5758], v82, v83);
  objc_msgSend_setBroadbandToWANInnerLineLayer_(self, v85, v84);
  objc_msgSend_frame(self, v86, v87);
  objc_msgSend_setFrame_(self->broadbandToWANInnerLineLayer, v88, v89);
  v90 = sub_21A71CA30(1.0, 1.0, 1.0, 0.0);
  objc_msgSend_setBackgroundColor_(self->broadbandToWANInnerLineLayer, v91, (uint64_t)v90);
  objc_msgSend_setName_(self->broadbandToWANInnerLineLayer, v92, (uint64_t)CFSTR("BroadbandToWAN"));
  objc_msgSend_setDelegate_(self->broadbandToWANInnerLineLayer, v93, (uint64_t)self);
  objc_msgSend_setLineCap_(self->broadbandToWANInnerLineLayer, v94, v16);
  objc_msgSend_setFillColor_(self->broadbandToWANInnerLineLayer, v95, 0);
  objc_msgSend_addSublayer_(self, v96, (uint64_t)self->broadbandToWANInnerLineLayer);
  v99 = objc_msgSend_layer(MEMORY[0x24BDE5758], v97, v98);
  objc_msgSend_setSwapArcLineLayer_(self, v100, v99);
  objc_msgSend_frame(self, v101, v102);
  objc_msgSend_setFrame_(self->swapArcLineLayer, v103, v104);
  v105 = sub_21A71CA30(1.0, 1.0, 1.0, 0.0);
  objc_msgSend_setBackgroundColor_(self->swapArcLineLayer, v106, (uint64_t)v105);
  objc_msgSend_setName_(self->swapArcLineLayer, v107, (uint64_t)CFSTR("SwapArcLine"));
  objc_msgSend_setDelegate_(self->swapArcLineLayer, v108, (uint64_t)self);
  v109 = *MEMORY[0x24BDE5CF0];
  objc_msgSend_setLineCap_(self->swapArcLineLayer, v110, *MEMORY[0x24BDE5CF0]);
  objc_msgSend_setFillColor_(self->swapArcLineLayer, v111, 0);
  objc_msgSend_addSublayer_(self, v112, (uint64_t)self->swapArcLineLayer);
  v115 = objc_msgSend_layer(MEMORY[0x24BDE5758], v113, v114);
  objc_msgSend_setSwapArcArrowLayer_(self, v116, v115);
  objc_msgSend_frame(self, v117, v118);
  objc_msgSend_setFrame_(self->swapArcArrowLayer, v119, v120);
  v121 = sub_21A71CA30(1.0, 1.0, 1.0, 0.0);
  objc_msgSend_setBackgroundColor_(self->swapArcArrowLayer, v122, (uint64_t)v121);
  objc_msgSend_setName_(self->swapArcArrowLayer, v123, (uint64_t)CFSTR("SwapArcArrow"));
  objc_msgSend_setDelegate_(self->swapArcArrowLayer, v124, (uint64_t)self);
  objc_msgSend_setLineCap_(self->swapArcArrowLayer, v125, v109);
  objc_msgSend_setLineJoin_(self->swapArcArrowLayer, v126, *MEMORY[0x24BDE5D00]);
  objc_msgSend_setFillColor_(self->swapArcArrowLayer, v127, 0);
  objc_msgSend_addSublayer_(self, v128, (uint64_t)self->swapArcArrowLayer);
}

- (id)initNoWANLinkFirstFrame
{
  InfoDiagramCablingLayer *v3;
  const char *v4;
  uint64_t v5;
  void **p_isa;
  CGColor *v7;
  const char *v8;
  const char *v9;
  CGColor *v10;
  const char *v11;
  const char *v12;
  objc_super v14;

  NSLog(CFSTR("%s"), a2, "-[InfoDiagramCablingLayer initNoWANLinkFirstFrame]");
  v14.receiver = self;
  v14.super_class = (Class)InfoDiagramCablingLayer;
  v3 = -[InfoDiagramCablingLayer init](&v14, sel_init);
  p_isa = (void **)&v3->super.super.isa;
  if (v3)
  {
    objc_msgSend_commonInit(v3, v4, v5);
    v7 = sub_21A71CA30(0.556862745, 0.556862745, 0.576470588, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[7], v8, (uint64_t)v7);
    objc_msgSend_setStrokeColor_(p_isa[10], v9, (uint64_t)v7);
    CGColorRelease(v7);
    v10 = sub_21A71CA30(1.0, 1.0, 1.0, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[6], v11, (uint64_t)v10);
    objc_msgSend_setStrokeColor_(p_isa[9], v12, (uint64_t)v10);
    CGColorRelease(v10);
  }
  return p_isa;
}

- (id)initNoWANLinkLastFrame
{
  InfoDiagramCablingLayer *v3;
  const char *v4;
  uint64_t v5;
  void **p_isa;
  CGColor *v7;
  const char *v8;
  CGColor *v9;
  const char *v10;
  CGColor *v11;
  const char *v12;
  CGColor *v13;
  const char *v14;
  CGColor *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  objc_super v20;

  NSLog(CFSTR("%s"), a2, "-[InfoDiagramCablingLayer initNoWANLinkLastFrame]");
  v20.receiver = self;
  v20.super_class = (Class)InfoDiagramCablingLayer;
  v3 = -[InfoDiagramCablingLayer init](&v20, sel_init);
  p_isa = (void **)&v3->super.super.isa;
  if (v3)
  {
    objc_msgSend_commonInit(v3, v4, v5);
    v7 = sub_21A71CA30(0.556862745, 0.556862745, 0.576470588, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[7], v8, (uint64_t)v7);
    CGColorRelease(v7);
    v9 = sub_21A71CA30(0.0, 0.501960784, 0.992156863, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[10], v10, (uint64_t)v9);
    CGColorRelease(v9);
    v11 = sub_21A71CA30(1.0, 1.0, 1.0, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[6], v12, (uint64_t)v11);
    CGColorRelease(v11);
    v13 = sub_21A71CA30(0.549019608, 0.77254902, 0.992156863, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[9], v14, (uint64_t)v13);
    CGColorRelease(v13);
    v15 = sub_21A71CA30(0.992156863, 0.223529412, 0.207843137, 1.0);
    objc_msgSend_setStrokeColor_(p_isa[11], v16, (uint64_t)v15);
    objc_msgSend_setStrokeColor_(p_isa[12], v17, (uint64_t)v15);
    objc_msgSend_setFillColor_(p_isa[12], v18, (uint64_t)v15);
    CGColorRelease(v15);
  }
  return p_isa;
}

- (void)setIsCompactWidth:(BOOL)a3
{
  CAShapeLayer *internetOuterLineLayer;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;

  internetOuterLineLayer = self->internetOuterLineLayer;
  if (a3)
    v6 = 4.0;
  else
    v6 = 5.0;
  if (a3)
    v7 = 2.0;
  else
    v7 = 3.0;
  objc_msgSend_setLineWidth_(internetOuterLineLayer, a2, a3, v6);
  objc_msgSend_setLineWidth_(self->internetInnerLineLayer, v8, v9, v7);
  objc_msgSend_setLineWidth_(self->broadbandToWANOuterLineLayer, v10, v11, v6);
  objc_msgSend_setLineWidth_(self->broadbandToWANInnerLineLayer, v12, v13, v7);
  objc_msgSend_setLineWidth_(self->swapArcLineLayer, v14, v15, v6);
  objc_msgSend_setLineWidth_(self->swapArcArrowLayer, v16, v17, 4.0);
  self->isCompactWidth = a3;
}

- (void)dealloc
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  objc_super v16;

  objc_msgSend_setDelegate_(self->internetInnerLineLayer, a2, 0);
  objc_msgSend_setInternetInnerLineLayer_(self, v3, 0);
  objc_msgSend_setDelegate_(self->internetOuterLineLayer, v4, 0);
  objc_msgSend_setInternetOuterLineLayer_(self, v5, 0);
  objc_msgSend_setDelegate_(self->internetGradientLayer, v6, 0);
  objc_msgSend_setInternetGradientLayer_(self, v7, 0);
  objc_msgSend_setDelegate_(self->broadbandToWANInnerLineLayer, v8, 0);
  objc_msgSend_setBroadbandToWANInnerLineLayer_(self, v9, 0);
  objc_msgSend_setDelegate_(self->broadbandToWANOuterLineLayer, v10, 0);
  objc_msgSend_setBroadbandToWANOuterLineLayer_(self, v11, 0);
  objc_msgSend_setDelegate_(self->swapArcLineLayer, v12, 0);
  objc_msgSend_setSwapArcLineLayer_(self, v13, 0);
  objc_msgSend_setDelegate_(self->swapArcArrowLayer, v14, 0);
  objc_msgSend_setSwapArcArrowLayer_(self, v15, 0);
  v16.receiver = self;
  v16.super_class = (Class)InfoDiagramCablingLayer;
  -[InfoDiagramCablingLayer dealloc](&v16, sel_dealloc);
}

- (void)layoutSublayers
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;

  objc_msgSend_bounds(self, a2, v2);
  NSLog(CFSTR("%s"), "-[InfoDiagramCablingLayer layoutSublayers]");
  objc_msgSend_frame(self->internetInnerLineLayer, v4, v5);
  objc_msgSend_createPathForSublayer_(self, v6, (uint64_t)self->internetInnerLineLayer);
  objc_msgSend_setNeedsDisplay(self->internetInnerLineLayer, v7, v8);
  objc_msgSend_frame(self->internetOuterLineLayer, v9, v10);
  objc_msgSend_createPathForSublayer_(self, v11, (uint64_t)self->internetOuterLineLayer);
  objc_msgSend_setNeedsDisplay(self->internetOuterLineLayer, v12, v13);
  objc_msgSend_frame(self->internetGradientLayer, v14, v15);
  objc_msgSend_frame(self->broadbandToWANInnerLineLayer, v16, v17);
  objc_msgSend_createPathForSublayer_(self, v18, (uint64_t)self->broadbandToWANInnerLineLayer);
  objc_msgSend_setNeedsDisplay(self->broadbandToWANInnerLineLayer, v19, v20);
  objc_msgSend_frame(self->broadbandToWANOuterLineLayer, v21, v22);
  objc_msgSend_createPathForSublayer_(self, v23, (uint64_t)self->broadbandToWANOuterLineLayer);
  objc_msgSend_setNeedsDisplay(self->broadbandToWANOuterLineLayer, v24, v25);
  if (self->swapCabling)
  {
    objc_msgSend_frame(self->swapArcLineLayer, v26, v27);
    objc_msgSend_createPathForSublayer_(self, v28, (uint64_t)self->swapArcLineLayer);
    objc_msgSend_frame(self->swapArcArrowLayer, v29, v30);
    objc_msgSend_createPathForSublayer_(self, v31, (uint64_t)self->swapArcArrowLayer);
    objc_msgSend_setNeedsDisplay(self->swapArcLineLayer, v32, v33);
    objc_msgSend_setNeedsDisplay(self->swapArcArrowLayer, v34, v35);
  }
}

- (void)createPathForSublayer:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CGPath *Mutable;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGPath *v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGPath *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  const char *v78;
  uint64_t v79;
  double v80;
  double v81;
  double v82;
  CGFloat v83;
  const char *v84;
  uint64_t v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  const char *v90;
  uint64_t v91;
  double v92;
  CGFloat v93;
  double v94;
  CGFloat v95;

  if (!objc_msgSend_path(a3, a2, (uint64_t)a3))
  {
    v7 = objc_msgSend_name(a3, v5, v6);
    NSLog(CFSTR("%s layer name is %@"), "-[InfoDiagramCablingLayer createPathForSublayer:]", v7);
    Mutable = CGPathCreateMutable();
    v11 = (void *)objc_msgSend_name(a3, v9, v10);
    if (objc_msgSend_isEqualToString_(v11, v12, (uint64_t)CFSTR("Internet")))
    {
      v15 = objc_msgSend_internetPoint(self->diagramAnchorPointDelegate, v13, v14);
      v19 = sub_21A69F768(v18, v15, v16, v17);
      v21 = v20;
      v24 = objc_msgSend_broadbandInPoint(self->diagramAnchorPointDelegate, v22, v23);
      v28 = sub_21A69F768(v27, v24, v25, v26);
      v30 = v29;
      CGPathMoveToPoint(Mutable, 0, v19, v21);
      CGPathAddLineToPoint(Mutable, 0, v28, v21);
      v31 = Mutable;
      v32 = v28;
      v33 = v30;
    }
    else
    {
      v34 = (void *)objc_msgSend_name(a3, v13, v14);
      if (!objc_msgSend_isEqualToString_(v34, v35, (uint64_t)CFSTR("BroadbandToWAN")))
      {
        if (self->swapCabling)
        {
          v63 = (void *)objc_msgSend_name(a3, v36, v37);
          if (objc_msgSend_isEqualToString_(v63, v64, (uint64_t)CFSTR("SwapArcArrow")))
          {
            objc_msgSend_swapArcLineEndPoint(self->diagramAnchorPointDelegate, v36, v65);
            v67 = v66;
            v69 = v68;
            v70 = CGPathCreateMutable();
            CGPathMoveToPoint(v70, 0, v67 + -3.0, v69 + -3.0);
            CGPathAddLineToPoint(v70, 0, v67 + 2.5, v69 + 4.0);
            CGPathAddLineToPoint(v70, 0, v67 + 5.5, v69 + -3.0);
            CGPathCloseSubpath(v70);
            CGPathAddPath(Mutable, 0, v70);
            CGPathRelease(v70);
          }
          else if (self->swapCabling)
          {
            v71 = (void *)objc_msgSend_name(a3, v36, v65);
            if (objc_msgSend_isEqualToString_(v71, v72, (uint64_t)CFSTR("SwapArcLine")))
            {
              objc_msgSend_swapArcLineStartPoint(self->diagramAnchorPointDelegate, v36, v73);
              v75 = v74;
              v77 = v76;
              objc_msgSend_swapArcLineEndPoint(self->diagramAnchorPointDelegate, v78, v79);
              v81 = v80;
              v83 = v82;
              objc_msgSend_swapArcControlPoint1(self->diagramAnchorPointDelegate, v84, v85);
              v87 = v86;
              v89 = v88;
              objc_msgSend_swapArcControlPoint2(self->diagramAnchorPointDelegate, v90, v91);
              v93 = v92;
              v95 = v94;
              if (v75 != v81 || v77 != v83)
              {
                CGPathMoveToPoint(Mutable, 0, v75, v77);
                CGPathAddCurveToPoint(Mutable, 0, v87, v89, v93, v95, v81 + 4.0, v83);
              }
            }
          }
        }
        goto LABEL_7;
      }
      v38 = objc_msgSend_internetPoint(self->diagramAnchorPointDelegate, v36, v37);
      v42 = sub_21A69F768(v41, v38, v39, v40);
      v44 = v43;
      v47 = objc_msgSend_broadbandOutPoint(self->diagramAnchorPointDelegate, v45, v46, v42);
      v51 = sub_21A69F768(v50, v47, v48, v49);
      v53 = v52;
      v56 = objc_msgSend_wanConnectedBaseWANPoint(self->diagramAnchorPointDelegate, v54, v55);
      v60 = sub_21A69F768(v59, v56, v57, v58);
      v62 = v61;
      CGPathMoveToPoint(Mutable, 0, v51, v53);
      CGPathAddLineToPoint(Mutable, 0, v51, v44);
      CGPathAddLineToPoint(Mutable, 0, v60, v44);
      v31 = Mutable;
      v32 = v60;
      v33 = v62;
    }
    CGPathAddLineToPoint(v31, 0, v32, v33);
LABEL_7:
    objc_msgSend_setPath_(a3, v36, (uint64_t)Mutable);
    CGPathRelease(Mutable);
  }
}

- (BOOL)swapCabling
{
  return self->swapCabling;
}

- (void)setSwapCabling:(BOOL)a3
{
  self->swapCabling = a3;
}

- (InfoDiagramCablingAnchorDelegate)diagramAnchorPointDelegate
{
  return self->diagramAnchorPointDelegate;
}

- (void)setDiagramAnchorPointDelegate:(id)a3
{
  self->diagramAnchorPointDelegate = (InfoDiagramCablingAnchorDelegate *)a3;
}

- (CAShapeLayer)internetOuterLineLayer
{
  return self->internetOuterLineLayer;
}

- (void)setInternetOuterLineLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (CAShapeLayer)internetInnerLineLayer
{
  return self->internetInnerLineLayer;
}

- (void)setInternetInnerLineLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (CAGradientLayer)internetGradientLayer
{
  return self->internetGradientLayer;
}

- (void)setInternetGradientLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (CAShapeLayer)broadbandToWANInnerLineLayer
{
  return self->broadbandToWANInnerLineLayer;
}

- (void)setBroadbandToWANInnerLineLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (CAShapeLayer)broadbandToWANOuterLineLayer
{
  return self->broadbandToWANOuterLineLayer;
}

- (void)setBroadbandToWANOuterLineLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CAShapeLayer)swapArcLineLayer
{
  return self->swapArcLineLayer;
}

- (void)setSwapArcLineLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CAShapeLayer)swapArcArrowLayer
{
  return self->swapArcArrowLayer;
}

- (void)setSwapArcArrowLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)isCompactWidth
{
  return self->isCompactWidth;
}

@end
