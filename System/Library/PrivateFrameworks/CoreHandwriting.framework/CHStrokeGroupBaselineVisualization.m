@implementation CHStrokeGroupBaselineVisualization

- (int64_t)layeringPriority
{
  return 0;
}

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  CGRect v8;
  CGRect result;

  objc_msgSend_bounds(a3, a2, (uint64_t)a3, v3, v4, v5);
  result = CGRectInset(v8, -22.0, -22.0);
  v6 = result.size.height + 13.0;
  v7 = result.size.width + 7.0;
  result.size.height = v6;
  result.size.width = v7;
  return result;
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CHStrokeGroupBaselineVisualization *v10;
  CGColorSpace *DeviceRGB;
  CGColor *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const CGPath *v98;
  void *v99;
  id v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  CGColor *v130;
  CGColor *color;
  CGColorSpace *space;
  uint64_t v133;
  void *v134;
  CHStrokeGroupBaselineVisualization *v135;
  _QWORD v136[4];
  id v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  objc_super v142;
  void *v143;
  CGFloat lengths[2];
  _BYTE v145[128];
  uint64_t v146;
  CGRect v147;
  CGRect v148;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = self;
  v146 = *MEMORY[0x1E0C80C00];
  v142.receiver = self;
  v142.super_class = (Class)CHStrokeGroupBaselineVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v142, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v12 = CGColorCreate(DeviceRGB, dbl_1BE8D5CC8);
  space = DeviceRGB;
  v130 = CGColorCreate(DeviceRGB, dbl_1BE8D5CE8);
  CGContextSetStrokeColorWithColor(a4, v12);
  color = v12;
  CGContextSetFillColorWithColor(a4, v12);
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  objc_msgSend_resultDrawn(v10, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupingResult(v18, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v24, v25, 1, 1, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v138, (uint64_t)v145, 16, v30);
  if (v31)
  {
    v36 = v31;
    v37 = *(_QWORD *)v139;
    v134 = v28;
    v135 = v10;
    v133 = *(_QWORD *)v139;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v139 != v37)
          objc_enumerationMutation(v28);
        v99 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
        objc_msgSend_dirtyRectForStrokeGroup_(v10, v32, (uint64_t)v99, v33, v34, v35);
        v148.origin.x = x;
        v148.origin.y = y;
        v148.size.width = width;
        v148.size.height = height;
        if (CGRectIntersectsRect(v147, v148))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v100 = v99;
            CGContextSaveGState(a4);
            *(_OWORD *)lengths = xmmword_1BE8D5D10;
            CGContextSetLineWidth(a4, 2.0);
            CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
            CGContextSetAlpha(a4, 0.8);
            objc_msgSend_resultDrawn(v10, v101, v102, v103, v104, v105);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = objc_msgSend_uniqueIdentifier(v100, v107, v108, v109, v110, v111);
            objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v106, v113, v112, v114, v115, v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recognitionResultsByLocale(v117, v118, v119, v120, v121, v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            v129 = objc_msgSend_count(v123, v124, v125, v126, v127, v128);

            if (v129)
            {
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v79, v80, v81, v82, v83);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_resultDrawn(v10, v40, v41, v42, v43, v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend_uniqueIdentifier(v100, v46, v47, v48, v49, v50);
              objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v45, v52, v51, v53, v54, v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recognitionResultsByLocale(v56, v57, v58, v59, v60, v61);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_allValues(v62, v63, v64, v65, v66, v67);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v68, v69, 0, v70, v71, v72);
              v73 = (void *)objc_claimAutoreleasedReturnValue();

              v136[0] = MEMORY[0x1E0C809B0];
              v136[1] = 3221225472;
              v136[2] = sub_1BE699DE0;
              v136[3] = &unk_1E77F2D78;
              v74 = v39;
              v137 = v74;
              objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v73, v75, (uint64_t)v136, v76, v77, v78);

            }
            else
            {
              v74 = 0;
            }
            objc_msgSend_strokeIdentifiers(v100, v79, v80, v81, v82, v83);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_allObjects(v84, v85, v86, v87, v88, v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v143 = v90;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v91, (uint64_t)&v143, 1, v92, v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = (const CGPath *)objc_msgSend_newEstimatedBaselineForStrokesWithTokens_tokenStrokeIdentifiers_(v100, v95, (uint64_t)v74, (uint64_t)v94, v96, v97);

            CGContextAddPath(a4, v98);
            CGContextStrokePath(a4);
            CGPathRelease(v98);

            CGContextRestoreGState(a4);
            v28 = v134;
            v10 = v135;
            v37 = v133;
          }
        }
      }
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v32, (uint64_t)&v138, (uint64_t)v145, 16, v35);
    }
    while (v36);
  }

  CGColorRelease(color);
  CGColorRelease(v130);
  CGColorSpaceRelease(space);
}

@end
