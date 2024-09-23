@implementation CHStrokeGroupingVisualization

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)CHStrokeGroupingVisualization;
  -[CHStrokeGroupBasedVisualization dirtyRectForStrokeGroup:](&v3, sel_dirtyRectForStrokeGroup_, a3);
  return CGRectInset(v4, -1.5, -1.5);
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
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
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const CGPath *Mutable;
  const char *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  CGColor *v83;
  CGColorSpace *space;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  id obj;
  uint64_t v89;
  CHStrokeGroupingVisualization *v90;
  CGColor *color;
  void *v92;
  _QWORD v93[5];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  objc_super v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;
  CGRect v106;
  CGRect v107;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v105 = *MEMORY[0x1E0C80C00];
  v102.receiver = self;
  v102.super_class = (Class)CHStrokeGroupingVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v102, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  objc_msgSend_recognitionSession(self, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_latestStrokeProvider(v16, v17, v18, v19, v20, v21);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  v90 = self;
  objc_msgSend_resultDrawn(self, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupingResult(v27, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = v33;
  objc_msgSend_strokeGroups(v33, v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v39, v40, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayWithOptions_usingComparator_(v45, v46, 1, (uint64_t)&unk_1E77F1790, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  space = CGColorSpaceCreateDeviceRGB();
  color = CGColorCreate(space, dbl_1BE8D6758);
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = v49;
  v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v98, (uint64_t)v104, 16, v51);
  if (v52)
  {
    v58 = v52;
    v59 = *(_QWORD *)v99;
    v86 = *(_QWORD *)v99;
    do
    {
      v60 = 0;
      v87 = v58;
      do
      {
        if (*(_QWORD *)v99 != v59)
          objc_enumerationMutation(obj);
        v61 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v60);
        objc_msgSend_bounds(v61, v53, v54, v55, v56, v57, space);
        v107.origin.x = x;
        v107.origin.y = y;
        v107.size.width = width;
        v107.size.height = height;
        if (CGRectIntersectsRect(v106, v107))
        {
          v89 = v60;
          v96 = 0u;
          v97 = 0u;
          v94 = 0u;
          v95 = 0u;
          objc_msgSend_strokeIdentifiers(v61, v53, v54, v55, v56, v57);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v94, (uint64_t)v103, 16, v64);
          if (v65)
          {
            v66 = v65;
            v67 = *(_QWORD *)v95;
            do
            {
              for (i = 0; i != v66; ++i)
              {
                if (*(_QWORD *)v95 != v67)
                  objc_enumerationMutation(v62);
                v71 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * i);
                v72 = (void *)objc_opt_class();
                objc_msgSend_strokeForIdentifier_inStrokeProvider_(v72, v73, v71, (uint64_t)v92, v74, v75);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                if (v76)
                {
                  Mutable = CGPathCreateMutable();
                  v93[0] = MEMORY[0x1E0C809B0];
                  v93[1] = 3221225472;
                  v93[2] = sub_1BE712638;
                  v93[3] = &unk_1E77F4138;
                  v93[4] = Mutable;
                  objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(CHStrokeUtilities, v78, (uint64_t)v76, 1, 1, (uint64_t)v93);
                  CGContextSetStrokeColorWithColor(a4, color);
                  CGContextSetLineWidth(a4, 3.0);
                  CGContextAddPath(a4, Mutable);
                  CGContextStrokePath(a4);
                  CGContextSetLineWidth(a4, 1.5);
                  v83 = (CGColor *)objc_msgSend_newColorForStrokeInGroup_(v90, v79, (uint64_t)v61, v80, v81, v82);
                  CGContextSetStrokeColorWithColor(a4, v83);
                  CGContextAddPath(a4, Mutable);
                  CGContextStrokePath(a4);
                  CGColorRelease(v83);
                  CGPathRelease(Mutable);
                }

              }
              v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v69, (uint64_t)&v94, (uint64_t)v103, 16, v70);
            }
            while (v66);
          }

          v59 = v86;
          v58 = v87;
          v60 = v89;
        }
        ++v60;
      }
      while (v60 != v58);
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v98, (uint64_t)v104, 16, v57);
    }
    while (v58);
  }

  CGColorSpaceRelease(space);
  CGColorRelease(color);

}

- (CGColor)newColorForStrokeInGroup:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend_delegate(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_visualizationIndexForStrokeGroup_(v10, v11, (uint64_t)v4, v12, v13, v14);

  return (CGColor *)objc_msgSend_newColorForVisualizedItemAtIndex_(CHVisualizationManager, v16, v15, v17, v18, v19);
}

@end
