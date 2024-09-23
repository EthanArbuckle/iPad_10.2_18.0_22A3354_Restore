@implementation MKGradientPolylineRenderer

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_canProvideVectorGeometry
{
  unsigned int v3;
  void *v4;
  unint64_t v5;
  void *v6;
  char v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKGradientPolylineRenderer;
  v3 = -[MKPolylineRenderer _canProvideVectorGeometry](&v9, sel__canProvideVectorGeometry);
  if (v3)
  {
    -[MKGradientPolylineRenderer colors](self, "colors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 <= 0x10)
    {
      -[MKOverlayRenderer overlay](self, "overlay");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_isSelfIntersecting");

      LOBYTE(v3) = v7 ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_updateVectorGeometry:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKGradientPolylineRenderer;
  -[MKPolylineRenderer _updateVectorGeometry:](&v15, sel__updateVectorGeometry_, v4);
  if (-[NSArray count](self->_locations, "count") <= 0x10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_locations, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_colors;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          v10 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9));
          objc_msgSend(v5, "addObject:", objc_msgSend(v10, "CGColor", (_QWORD)v11));
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "setColorStopColors:locations:", v5, self->_locations);
  }

}

- (void)_updateColorStops
{
  MKGradientPolylineRenderer *v2;
  id *p_colors;
  id *p_externallySetColors;
  id *p_externallySetLocations;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  NSArray *v17;
  NSArray *locations;
  unint64_t v19;
  id *v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  NSArray *v36;
  unint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void **v41;
  _BOOL4 v42;
  id *p_isa;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v2 = self;
  v56 = *MEMORY[0x1E0C80C00];
  p_colors = (id *)&self->_colors;
  if (-[NSArray count](self->_colors, "count"))
    v42 = 0;
  else
    v42 = -[NSArray count](v2->_externallySetColors, "count") != 0;
  p_externallySetColors = (id *)&v2->_externallySetColors;
  p_isa = (id *)&v2->super.super.super.super.isa;
  if (!-[NSArray count](v2->_externallySetColors, "count"))
  {
    v16 = *p_colors;
    v17 = (NSArray *)MEMORY[0x1E0C9AA60];
    *p_colors = (id)MEMORY[0x1E0C9AA60];

    locations = v2->_locations;
    v2->_locations = v17;
LABEL_36:

    goto LABEL_39;
  }
  p_externallySetLocations = (id *)&v2->_externallySetLocations;
  if (!-[NSArray count](v2->_externallySetLocations, "count"))
  {
    objc_storeStrong(p_colors, *p_externallySetColors);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*p_colors, "count"));
    v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v36, "addObject:", &unk_1E2158758);
    for (i = 1; i < objc_msgSend(*p_colors, "count"); ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)i / (double)(unint64_t)(objc_msgSend(*p_colors, "count") - 1));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v36, "addObject:", v38);

    }
    locations = v2->_locations;
    v2->_locations = v36;
    goto LABEL_36;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v6 = *p_externallySetLocations;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v51;
    v9 = -1.0;
    while (2)
    {
      v10 = 0;
      v11 = v9;
      do
      {
        if (*(_QWORD *)v51 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v10), "doubleValue");
        v9 = v12;
        if (v12 < v11)
        {

          v19 = objc_msgSend(*p_externallySetColors, "count");
          if (v19 >= objc_msgSend(*p_externallySetLocations, "count"))
            v20 = p_externallySetLocations;
          else
            v20 = p_externallySetColors;
          v21 = objc_msgSend(*v20, "count", p_colors);
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v21);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            for (j = 0; j != v21; ++j)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", j);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v23);

            }
          }
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __47__MKGradientPolylineRenderer__updateColorStops__block_invoke;
          v49[3] = &unk_1E20D9518;
          v49[4] = p_isa;
          objc_msgSend(v44, "sortUsingComparator:", v49);
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v26 = v44;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          if (v27)
          {
            v28 = *(_QWORD *)v46;
            do
            {
              for (k = 0; k != v27; ++k)
              {
                if (*(_QWORD *)v46 != v28)
                  objc_enumerationMutation(v26);
                v30 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * k), "unsignedIntegerValue");
                objc_msgSend(*p_externallySetLocations, "objectAtIndexedSubscript:", v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "addObject:", v31);

                objc_msgSend(*p_externallySetColors, "objectAtIndexedSubscript:", v30);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "addObject:", v32);

              }
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
            }
            while (v27);
          }

          v33 = p_isa[31];
          p_isa[31] = v24;
          v34 = v24;

          v35 = *v41;
          *v41 = v25;

          goto LABEL_38;
        }
        ++v10;
        v11 = v12;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v7)
        continue;
      break;
    }
  }

  v13 = objc_msgSend(*p_externallySetColors, "count");
  if (v13 >= objc_msgSend(*p_externallySetLocations, "count"))
  {
    objc_storeStrong(p_isa + 31, *p_externallySetLocations);
  }
  else
  {
    objc_msgSend(*p_externallySetLocations, "subarrayWithRange:", 0, objc_msgSend(*p_externallySetColors, "count"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = p_isa[31];
    p_isa[31] = (id)v14;

  }
  objc_storeStrong(p_colors, *p_externallySetColors);
LABEL_38:
  v2 = (MKGradientPolylineRenderer *)p_isa;
LABEL_39:
  -[MKPolylineRenderer _setNeedsVectorGeometryUpdate](v2, "_setNeedsVectorGeometryUpdate");
  objc_msgSend(p_isa, "_renderer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v42)
    objc_msgSend(v39, "setNeedsDisplayForReason:", 1);
  else
    objc_msgSend(v39, "setNeedsDisplayForReason:", 2);

}

uint64_t __47__MKGradientPolylineRenderer__updateColorStops__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  v7 = objc_msgSend(v5, "unsignedIntegerValue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "objectAtIndexedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "objectAtIndexedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKGradientPolylineRenderer)initWithCoder:(id)a3
{
  id v4;
  MKGradientPolylineRenderer *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKGradientPolylineRenderer;
  v5 = -[MKPolylineRenderer initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MKGradientPolylineRendererColors"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("MKGradientPolylineRendererLocations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKGradientPolylineRenderer setColors:atLocations:](v5, "setColors:atLocations:", v9, v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_externallySetColors, CFSTR("MKGradientPolylineRendererColors"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_externallySetLocations, CFSTR("MKGradientPolylineRendererLocations"));
  v5.receiver = self;
  v5.super_class = (Class)MKGradientPolylineRenderer;
  -[MKPolylineRenderer encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);

}

- (NSArray)locations
{
  MKGradientPolylineRenderer *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_externallySetLocations;
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)colors
{
  MKGradientPolylineRenderer *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_externallySetColors;
  objc_sync_exit(v2);

  return v3;
}

- (void)setColors:(NSArray *)colors atLocations:(NSArray *)locations
{
  NSArray *v6;
  uint64_t v7;
  MKGradientPolylineRenderer *v8;
  uint64_t v9;
  NSArray *externallySetColors;
  uint64_t v11;
  NSArray *externallySetLocations;
  void *v13;
  void *v14;
  id v15;
  NSArray *v16;

  v16 = colors;
  v6 = locations;
  if (-[NSArray count](v6, "count"))
  {
    v7 = -[NSArray count](v6, "count");
    if (v7 != -[NSArray count](v16, "count"))
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("locations.count (%llu) must either == colors.count (%llu), or locations must be empty"), -[NSArray count](v6, "count"), -[NSArray count](v16, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v15);
    }
  }
  v8 = self;
  objc_sync_enter(v8);
  -[MKGradientPolylineRenderer willChangeValueForKey:](v8, "willChangeValueForKey:", CFSTR("colors"));
  -[MKGradientPolylineRenderer willChangeValueForKey:](v8, "willChangeValueForKey:", CFSTR("locations"));
  v9 = -[NSArray copy](v16, "copy");
  externallySetColors = v8->_externallySetColors;
  v8->_externallySetColors = (NSArray *)v9;

  v11 = -[NSArray copy](v6, "copy");
  externallySetLocations = v8->_externallySetLocations;
  v8->_externallySetLocations = (NSArray *)v11;

  -[MKGradientPolylineRenderer _updateColorStops](v8, "_updateColorStops");
  -[MKGradientPolylineRenderer didChangeValueForKey:](v8, "didChangeValueForKey:", CFSTR("colors"));
  -[MKGradientPolylineRenderer didChangeValueForKey:](v8, "didChangeValueForKey:", CFSTR("locations"));
  objc_sync_exit(v8);

}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1;
  double var0;
  double v8;
  double v9;
  MKGradientPolylineRenderer *v10;
  NSArray *v11;
  id v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGLineCap v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  const CGPath *DashedClipPath;
  void *v36;
  double v37;
  double *p_y;
  double v39;
  double x;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  CGGradient *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  double v52;
  MKMapPoint *v53;
  double v54;
  double v55;
  double v56;
  double v58;
  double v60;
  double *p_x;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  int v71;
  CGPath *Mutable;
  CGLineCap v73;
  CGLineCap v74;
  _BOOL4 v76;
  _BOOL4 v78;
  double *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  long double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  NSArray *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  void *v96;
  float v97;
  float v98;
  double v99;
  id v100;
  CGContext *v101;
  NSArray *v102;
  void *v103;
  CGFloat *v104;
  unint64_t v105;
  void *v106;
  double v107;
  double v108;
  void *v109;
  double v110;
  double v111;
  CGFloat *v112;
  BOOL v113;
  double v114;
  unint64_t v115;
  void *v116;
  double v117;
  double v118;
  void *v119;
  double v120;
  id v121;
  CGColor *v122;
  int v123;
  double v124;
  NSArray *v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  CGGradientDrawingOptions v143;
  uint64_t v144;
  void *v145;
  MKGradientPolylineRenderer *v146;
  void *v147;
  double v148;
  double v149;
  const CGPath *path;
  double v151;
  CGColorSpace *space;
  double v153;
  long double v154;
  double v155;
  double v156;
  char v157;
  CGLineCap v158;
  double v159;
  double v160;
  double v161;
  double v162;
  NSArray *v163;
  NSArray *v164;
  unint64_t v165;
  double v166;
  double v167;
  double y;
  uint64_t ya;
  double v170;
  CGContextRef c;
  double v172;
  double v173;
  unint64_t v175;
  CGLineJoin join;
  MKMapPoint *v177;
  double v178;
  double v179;
  double v180;
  const CGPath *CopyByStrokingPath;
  double v182;
  double v183;
  CGFloat v184;
  NSArray *v185;
  unint64_t v186;
  int v187;
  double v188;
  objc_super v189;
  CGPoint v190;
  MKMapPoint v191;
  MKMapPoint v192;
  MKMapPoint v193;
  MKMapPoint v194;
  CGPoint v195;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v8 = a3.var0.var1;
  v9 = a3.var0.var0;
  v10 = self;
  objc_sync_enter(v10);
  v11 = v10->_locations;
  v163 = v10->_colors;
  objc_sync_exit(v10);

  v164 = v11;
  if (!-[NSArray count](v11, "count"))
  {
    v189.receiver = v10;
    v189.super_class = (Class)MKGradientPolylineRenderer;
    -[MKPolylineRenderer drawMapRect:zoomScale:inContext:](&v189, sel_drawMapRect_zoomScale_inContext_, a5, v9, v8, var0, var1, a4);
    goto LABEL_128;
  }
  -[MKOverlayRenderer overlay](v10, "overlay");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v177 = (MKMapPoint *)objc_msgSend(v12, "points");

  -[MKOverlayRenderer overlay](v10, "overlay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "pointCount");

  if (v14 >= 2)
  {
    CGContextSaveGState(a5);
    -[MKOverlayRenderer contentScaleFactor](v10, "contentScaleFactor");
    v16 = v15;
    -[MKOverlayPathRenderer lineWidth](v10, "lineWidth");
    v18 = v17;
    join = -[MKOverlayPathRenderer lineJoin](v10, "lineJoin");
    v19 = -[MKOverlayPathRenderer lineCap](v10, "lineCap");
    -[MKOverlayPathRenderer miterLimit](v10, "miterLimit");
    if (v20 <= 0.0)
      v21 = 10.0;
    else
      v21 = v20;
    if (v18 <= 0.0)
    {
      v22 = vcvtmd_s64_f64(log2(a4) + 0.5);
      if (v22 >= -21)
        v23 = (v22 & (v22 >> 63)) + 21;
      else
        v23 = 0;
      v18 = __const_MKRoadWidthAtZoomScale_kLineWidthForZoomLevel[v23];
    }
    -[MKOverlayPathRenderer lineDashPattern](v10, "lineDashPattern");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKOverlayPathRenderer lineDashPhase](v10, "lineDashPhase");
    v26 = v25;
    -[MKOverlayRenderer _originMapPoint](v10, "_originMapPoint");
    v179 = v28;
    v180 = v27;
    -[MKPolylineRenderer strokeStart](v10, "strokeStart");
    v30 = v29;
    -[MKPolylineRenderer strokeEnd](v10, "strokeEnd");
    v32 = v31;
    v159 = v16 * (v18 / a4);
    CGContextSetLineWidth(a5, v159);
    CGContextSetLineJoin(a5, join);
    v156 = v16 * (v21 / a4);
    CGContextSetMiterLimit(a5, v156);
    CGContextSetBlendMode(a5, kCGBlendModeCopy);
    v158 = v19;
    if (v30 > 0.0 || v32 < 1.0)
    {
      -[MKOverlayRenderer overlay](v10, "overlay");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "_mapPointsLength");
      v193.y = v179;
      v193.x = v180;
      path = _createClipPath(v177, v14, v159, v19, join, v156, v193, a4, v30, v32, v34);

      if (objc_msgSend(v24, "count"))
      {
        DashedClipPath = _createDashedClipPath(&v177->x, v14, v19, join, v24, v159, v156, v180, v179, a4, v26, v16);
        CGContextAddPath(a5, DashedClipPath);
        CGContextClip(a5);
        CGPathRelease(DashedClipPath);
      }
    }
    else
    {
      if (objc_msgSend(v24, "count"))
      {
        path = _createDashedClipPath(&v177->x, v14, v19, join, v24, v159, v156, v180, v179, a4, v26, v16);
        CGContextAddPath(a5, path);
        goto LABEL_20;
      }
      -[MKOverlayRenderer overlay](v10, "overlay");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "_mapPointsLength");
      v194.y = v179;
      v194.x = v180;
      path = _createClipPath(v177, v14, v159, v19, join, v156, v194, a4, v30, v32, v37);

    }
    CGContextAddPath(a5, path);
LABEL_20:
    CGContextClip(a5);
    CGContextSaveGState(a5);
    space = CGColorSpaceCreateDeviceRGB();
    v178 = v32;
    v172 = v30;
    v146 = v10;
    v147 = v24;
    v175 = v14 - 1;
    x = v177->x;
    v39 = v177->y;
    p_y = &v177[1].y;
    v41 = 1;
    v42 = 0.0;
    do
    {
      v43 = *(p_y - 1);
      v44 = *p_y;
      ++v41;
      v42 = v42 + sqrt((v43 - x) * (v43 - x) + 0.0 + (*p_y - v39) * (*p_y - v39));
      p_y += 2;
      v39 = v44;
      x = v43;
    }
    while (v14 != v41);
    v165 = v14;
    v187 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v157 = 0;
    v49 = *MEMORY[0x1E0C9D538];
    v48 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v155 = v159 * 0.5;
    v50 = 0x7FFFFFFFFFFFFFFFLL;
    v51 = 0.0;
    c = a5;
    while (1)
    {
      v52 = v51 / v42;
      if (v51 / v42 >= v178)
      {
LABEL_124:
        CGContextRestoreGState(a5);
        -[MKOverlayPathRenderer strokeColor](v146, "strokeColor");
        v144 = objc_claimAutoreleasedReturnValue();
        v145 = (void *)v144;
        if ((_BYTE)v187 && v144)
        {
          CGContextSaveGState(a5);
          CGContextSetBlendMode(a5, kCGBlendModeDestinationOver);
          CGContextSetFillColorWithColor(a5, (CGColorRef)objc_msgSend(objc_retainAutorelease(v145), "CGColor"));
          CGContextAddPath(a5, path);
          CGContextFillPath(a5);
          CGContextRestoreGState(a5);
        }
        CGContextRestoreGState(a5);
        CGGradientRelease(v45);
        CGPathRelease(path);
        CGColorSpaceRelease(space);

        goto LABEL_128;
      }
      v53 = &v177[v47];
      v54 = v53->x;
      v191.x = v180;
      v183 = v53->x - v180;
      v191.y = v179;
      v170 = v53->y;
      v182 = v170 - v179;
      v188 = 0.0;
      v55 = v51;
      v186 = _nextSimplifiedPointIndex(v177, v165, v47, a4, v191, &v188);
      v173 = v55;
      v51 = v55 + v188;
      v56 = (v55 + v188) / v42;
      if (v178 >= v52 && v172 <= v56)
        break;
LABEL_123:
      v48 = v170 - v179;
      v49 = v183;
      v47 = v186;
      if (v186 >= v175)
        goto LABEL_124;
    }
    v58 = 0.0;
    if (v52 < v172 && v56 > v172)
      v58 = (v172 - v52) / (v56 - v52);
    v162 = v54;
    v60 = 1.0;
    if (v52 < v178 && v56 > v178)
      v60 = (v178 - v52) / (v56 - v52);
    p_x = &v177[v186].x;
    v63 = p_x[1];
    v64 = *p_x - v180;
    v65 = v63 - v179;
    if (v58 > 0.0 || (v166 = v63 - v179, v167 = *p_x - v180, v184 = v183, y = v170 - v179, v60 < 1.0))
    {
      v66 = v65 - v182;
      v67 = v183 + (v64 - v183) * v58;
      v68 = v182 + (v65 - v182) * v58;
      if (v58 <= 0.0)
        v67 = v183;
      v184 = v67;
      if (v58 <= 0.0)
        v69 = v170 - v179;
      else
        v69 = v68;
      y = v69;
      if (v60 >= 1.0)
      {
        v166 = v63 - v179;
        v167 = *p_x - v180;
      }
      else
      {
        v166 = v63 - v179 - v66 * (1.0 - v60);
        v167 = v64 - (v64 - v183) * (1.0 - v60);
      }
      v65 = v63 - v179;
    }
    v160 = p_x[1];
    v161 = *p_x;
    if (join == kCGLineJoinRound || !v47 && v175 <= v186)
    {
      if (v175 == v186 || v47 == 0)
        v71 = v158;
      else
        v71 = 1;
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, v184, y);
      CGPathAddLineToPoint(Mutable, 0, v167, v166);
      if (fabs(v58) >= 0.00000011920929)
        v73 = kCGLineCapButt;
      else
        v73 = v71;
      if (fabs(v60 + -1.0) >= 0.00000011920929)
        v74 = kCGLineCapButt;
      else
        v74 = v71;
      CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(Mutable, v73, v74, join, v159, v156);
      CGPathRelease(Mutable);
LABEL_96:
      CGContextSaveGState(a5);
      if (join != kCGLineJoinRound)
        CGContextSetShouldAntialias(a5, 0);
      CGContextAddPath(a5, CopyByStrokingPath);
      v91 = v164;
      v92 = -[NSArray count](v91, "count");
      v93 = 0;
      v94 = 0;
      v95 = 0;
      while (v95 < -[NSArray count](v91, "count"))
      {
        -[NSArray objectAtIndexedSubscript:](v91, "objectAtIndexedSubscript:", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "floatValue");
        v98 = v97;

        v99 = v98;
        if (v52 >= v99)
        {
          v92 = v93 + -[NSArray count](v91, "count");
          v94 = v95;
        }
        ++v95;
        --v93;
        if (v56 < v99)
        {
          v92 = v95 - v94;
          break;
        }
      }

      ya = v92;
      if (v92 == 1)
      {
        -[NSArray objectAtIndexedSubscript:](v163, "objectAtIndexedSubscript:", v94);
        v100 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v101 = c;
        CGContextSetFillColorWithColor(c, (CGColorRef)objc_msgSend(v100, "CGColor"));
        CGContextFillPath(c);

      }
      else
      {
        CGContextClip(c);
        if (!v45 || v94 != v50 || v92 != v46)
        {
          CGGradientRelease(v45);
          v102 = v91;
          v185 = v163;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v92);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = (CGFloat *)malloc_type_malloc(8 * v92, 0x100004000313F17uLL);
          v105 = v92 + v94 - 1;
          -[NSArray objectAtIndexedSubscript:](v102, "objectAtIndexedSubscript:", v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "cgFloatValue");
          v108 = v107;
          -[NSArray objectAtIndexedSubscript:](v102, "objectAtIndexedSubscript:", v94);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "cgFloatValue");
          v111 = v110;
          v112 = v104;

          if (v94 <= v105)
          {
            v113 = 0;
            v114 = v108 - v111;
            v115 = v94;
            do
            {
              -[NSArray objectAtIndexedSubscript:](v102, "objectAtIndexedSubscript:", v115);
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "cgFloatValue");
              v118 = v117;
              -[NSArray objectAtIndexedSubscript:](v102, "objectAtIndexedSubscript:", v94);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "cgFloatValue");
              v112[objc_msgSend(v103, "count")] = (v118 - v120) / v114;

              -[NSArray objectAtIndexedSubscript:](v185, "objectAtIndexedSubscript:", v115);
              v121 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v122 = (CGColor *)objc_msgSend(v121, "CGColor");

              objc_msgSend(v103, "addObject:", v122);
              if ((_BYTE)v187 == 0 && !v113)
                v113 = CGColorGetAlpha(v122) < 1.0;
              ++v115;
            }
            while (v115 <= v105);
          }
          else
          {
            v113 = 0;
          }
          v45 = CGGradientCreateWithColors(space, (CFArrayRef)v103, v112);
          free(v112);
          v123 = v187;
          if (!(_BYTE)v187)
            v123 = v113;
          v187 = v123;

          v46 = ya;
          v50 = v94;
        }
        v124 = v188;
        v125 = v91;
        -[NSArray objectAtIndexedSubscript:](v125, "objectAtIndexedSubscript:", v94);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "cgFloatValue");
        v101 = c;
        v128 = v127;

        -[NSArray objectAtIndexedSubscript:](v125, "objectAtIndexedSubscript:", ya + v94 - 1);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "cgFloatValue");
        v130 = v124 * (v52 - v128) / (v56 - v52);
        v132 = v124 * (v131 - v56) / (v56 - v52);

        v133 = 1.0 / sqrt((v161 - v162) * (v161 - v162) + 0.0 + (v160 - v170) * (v160 - v170));
        v134 = (v161 - v162) * v133;
        v135 = (v160 - v170) * v133;
        v136 = v161 + v134 * v132;
        v137 = v160 + v135 * v132;
        v138 = v170 - v135 * v130;
        v139 = v162 - v134 * v130 - v180;
        v140 = v138 - v179;
        v141 = v136 - v180;
        v142 = v137 - v179;

        if (((join == kCGLineJoinRound) & v157) != 0)
          v143 = 2;
        else
          v143 = 3;
        v190.x = v139;
        v190.y = v140;
        v195.x = v141;
        v195.y = v142;
        CGContextDrawLinearGradient(c, v45, v190, v195, v143);
        v157 = 1;
      }
      CGContextRestoreGState(v101);
      CGPathRelease(CopyByStrokingPath);
      v51 = v173 + v188;
      a5 = c;
      goto LABEL_123;
    }
    v76 = fabs(v58) < 0.00000011920929 && v47 != 0;
    v78 = fabs(v60 + -1.0) < 0.00000011920929 && v175 > v186;
    v153 = v65;
    if (v78)
    {
      v192.x = v180;
      v192.y = v179;
      v79 = &v177[_nextSimplifiedPointIndex(v177, v165, v186, a4, v192, 0)].x;
      v149 = *v79 - v180;
      v80 = v79[1] - v179;
    }
    else
    {
      v149 = *MEMORY[0x1E0C9D538];
      v80 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    v148 = v80;
    CopyByStrokingPath = CGPathCreateMutable();
    v81 = 1.0 / sqrt((v64 - v183) * (v64 - v183) + 0.0 + (v153 - v182) * (v153 - v182));
    v82 = (v64 - v183) * v81;
    v83 = (v153 - v182) * v81;
    v151 = -v83;
    v154 = v83;
    if (v76)
    {
      v84 = 1.0;
      v85 = 1.0 / sqrt((v183 - v49) * (v183 - v49) + 0.0 + (v182 - v48) * (v182 - v48));
      v86 = (v183 - v49) * v85;
      v87 = v82;
      _addMiterJoin(CopyByStrokingPath, 1, v184, y, v86, (v182 - v48) * v85, v82, v83, v155);
      goto LABEL_88;
    }
    v84 = 1.0;
    if ((v158 - 1) >= 2)
    {
      v87 = (v64 - v183) * v81;
      if (v158)
        goto LABEL_88;
      v88 = v184;
      v89 = y;
      CGPathMoveToPoint(CopyByStrokingPath, 0, v184 + v83 * v155, y - v82 * v155);
    }
    else
    {
      v88 = v184 - v82 * v159;
      v89 = y + v151 * v159;
      v87 = (v64 - v183) * v81;
      CGPathMoveToPoint(CopyByStrokingPath, 0, v88 + v83 * v155, v89 - v82 * v155);
    }
    CGPathAddLineToPoint(CopyByStrokingPath, 0, v88 + v151 * v155, v89 + v87 * v155);
LABEL_88:
    if (v78)
    {
      v90 = v84 / sqrt((v149 - v64) * (v149 - v64) + 0.0 + (v148 - v153) * (v148 - v153));
      _addMiterJoin(CopyByStrokingPath, 0, v167, v166, v87, v154, (v149 - v64) * v90, (v148 - v153) * v90, v155);
LABEL_95:
      CGPathAddLineToPoint(CopyByStrokingPath, 0, v184 + v154 * v155, y - v87 * v155);
      CGPathCloseSubpath(CopyByStrokingPath);
      goto LABEL_96;
    }
    if ((v158 - 1) >= 2)
    {
      if (v158)
        goto LABEL_95;
      CGPathAddLineToPoint(CopyByStrokingPath, 0, v167 + v151 * v155, v166 + v87 * v155);
    }
    else
    {
      v167 = v167 + v87 * v159;
      v166 = v166 + v154 * v159;
      CGPathAddLineToPoint(CopyByStrokingPath, 0, v167 + v151 * v155, v166 + v87 * v155);
    }
    CGPathAddLineToPoint(CopyByStrokingPath, 0, v167 + v154 * v155, v166 - v87 * v155);
    goto LABEL_95;
  }
LABEL_128:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externallySetLocations, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_externallySetColors, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
