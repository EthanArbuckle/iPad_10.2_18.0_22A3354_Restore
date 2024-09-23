@implementation BuddyAspectFitLayerView

- (void)setFrame:(CGRect)a3
{
  objc_super v3;
  SEL v4;
  BuddyAspectFitLayerView *v5;
  CGRect v6;

  v6 = a3;
  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyAspectFitLayerView;
  -[BuddyAspectFitLayerView setFrame:](&v3, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[BuddyAspectFitLayerView setNeedsLayout](v5, "setNeedsLayout");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v3;
  SEL v4;
  BuddyAspectFitLayerView *v5;
  CGRect v6;

  v6 = a3;
  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyAspectFitLayerView;
  -[BuddyAspectFitLayerView setBounds:](&v3, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[BuddyAspectFitLayerView setNeedsLayout](v5, "setNeedsLayout");
}

- (void)setManagedLayer:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSArray *v7;
  id v8;
  char v9;
  NSArray *v10;
  id location[2];
  BuddyAspectFitLayerView *v12;
  id v13;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v12->_managedLayer, location[0]);
  objc_msgSend(location[0], "bounds");
  -[BuddyAspectFitLayerView setOriginalManagerLayerBounds:](v12, "setOriginalManagerLayerBounds:", v3, v4, v5, v6);
  v9 = 0;
  if (location[0])
  {
    v13 = location[0];
    v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1);
    v10 = v7;
    v9 = 1;
  }
  else
  {
    v7 = 0;
  }
  v8 = -[BuddyAspectFitLayerView layer](v12, "layer");
  objc_msgSend(v8, "setSublayers:", v7);

  if ((v9 & 1) != 0)
  -[BuddyAspectFitLayerView setNeedsLayout](v12, "setNeedsLayout");
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  CALayer *v2;
  CALayer *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  CALayer *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  CALayer *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  CALayer *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  CALayer *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  double v58;
  CALayer *v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  CALayer *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  CGFloat v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  CALayer *v76;
  _BYTE v77[128];
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  uint64_t v85;
  CATransform3D __src;
  __int128 v87;
  CGRect v88;
  CGRect rect;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  uint64_t v107;
  uint64_t v108;
  double v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  double v123;
  double v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  double v128;
  uint64_t v129;
  uint64_t v130;
  double v131;
  uint64_t v132;
  double v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  double v137;
  uint64_t v138;
  uint64_t v139;
  double v140;
  uint64_t v141;
  double v142;
  objc_super v143;
  SEL v144;
  BuddyAspectFitLayerView *v145;
  CGRect v146;
  CGRect v147;

  v145 = self;
  v144 = a2;
  v143.receiver = self;
  v143.super_class = (Class)BuddyAspectFitLayerView;
  -[BuddyAspectFitLayerView layoutSubviews](&v143, "layoutSubviews");
  v2 = -[BuddyAspectFitLayerView managedLayer](v145, "managedLayer");

  if (v2)
  {
    v3 = -[BuddyAspectFitLayerView managedLayer](v145, "managedLayer");
    -[CALayer bounds](v3, "bounds");
    v139 = v4;
    v138 = v5;
    v141 = v6;
    v140 = v7;
    v8 = v7;
    v9 = -[BuddyAspectFitLayerView managedLayer](v145, "managedLayer");
    -[CALayer bounds](v9, "bounds");
    v135 = v10;
    v134 = v11;
    v137 = v12;
    v136 = v13;
    v14 = v8 / v12;

    v142 = v14;
    -[BuddyAspectFitLayerView frame](v145, "frame");
    v130 = v15;
    v129 = v16;
    v132 = v17;
    v131 = v18;
    v19 = v18;
    -[BuddyAspectFitLayerView frame](v145, "frame");
    v126 = v20;
    v125 = v21;
    v128 = v22;
    v127 = v23;
    v133 = v19 / v22;
    v124 = 0.0;
    v123 = 0.0;
    if (v142 <= v19 / v22)
    {
      -[BuddyAspectFitLayerView frame](v145, "frame", v142);
      v104 = v44;
      v103 = v45;
      v106 = v46;
      v105 = v47;
      v124 = v46;
      v48 = -[BuddyAspectFitLayerView managedLayer](v145, "managedLayer");
      -[CALayer bounds](v48, "bounds");
      v100 = v49;
      v99 = v50;
      v102 = v51;
      v101 = v52;
      v53 = v52;
      -[BuddyAspectFitLayerView frame](v145, "frame");
      v96 = v54;
      v95 = v55;
      v98 = v56;
      v97 = v57;
      v58 = v53 * v56;
      v59 = -[BuddyAspectFitLayerView managedLayer](v145, "managedLayer");
      -[CALayer bounds](v59, "bounds");
      v92 = v60;
      v91 = v61;
      v94 = v62;
      v93 = v63;
      v123 = v58 / v62;

    }
    else
    {
      v24 = -[BuddyAspectFitLayerView managedLayer](v145, "managedLayer", v142);
      -[CALayer bounds](v24, "bounds");
      v120 = v25;
      v119 = v26;
      v122 = v27;
      v121 = v28;
      v29 = v27;
      -[BuddyAspectFitLayerView frame](v145, "frame");
      v116 = v30;
      v115 = v31;
      v118 = v32;
      v117 = v33;
      v34 = v29 * v33;
      v35 = -[BuddyAspectFitLayerView managedLayer](v145, "managedLayer");
      -[CALayer bounds](v35, "bounds");
      v112 = v36;
      v111 = v37;
      v114 = v38;
      v113 = v39;
      v124 = v34 / v39;

      -[BuddyAspectFitLayerView frame](v145, "frame");
      v108 = v40;
      v107 = v41;
      v110 = v42;
      v109 = v43;
      v123 = v43;
    }
    -[BuddyAspectFitLayerView bounds](v145, "bounds");
    rect = v146;
    CGRectGetMidX(v146);
    -[BuddyAspectFitLayerView bounds](v145, "bounds");
    v88 = v147;
    CGRectGetMidY(v147);
    sub_100198568();
    *(_QWORD *)&v90 = v64;
    *((_QWORD *)&v90 + 1) = v65;
    v66 = -[BuddyAspectFitLayerView managedLayer](v145, "managedLayer");
    v87 = v90;
    -[CALayer setPosition:](v66, "setPosition:", v90);

    -[BuddyAspectFitLayerView originalManagerLayerBounds](v145, "originalManagerLayerBounds");
    v83 = v67;
    v82 = v68;
    v85 = v69;
    v84 = v70;
    v71 = v123 / v70;
    -[BuddyAspectFitLayerView originalManagerLayerBounds](v145, "originalManagerLayerBounds");
    v79 = v72;
    v78 = v73;
    v81 = v74;
    v80 = v75;
    CATransform3DMakeScale(&__src, v71, v124 / v74, 1.0);
    v76 = -[BuddyAspectFitLayerView managedLayer](v145, "managedLayer");
    memcpy(v77, &__src, sizeof(v77));
    -[CALayer setTransform:](v76, "setTransform:", v77);

  }
}

- (CALayer)managedLayer
{
  return self->_managedLayer;
}

- (CGRect)originalManagerLayerBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  y = self->_originalManagerLayerBounds.origin.y;
  x = self->_originalManagerLayerBounds.origin.x;
  height = self->_originalManagerLayerBounds.size.height;
  width = self->_originalManagerLayerBounds.size.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginalManagerLayerBounds:(CGRect)a3
{
  self->_originalManagerLayerBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedLayer, 0);
}

@end
