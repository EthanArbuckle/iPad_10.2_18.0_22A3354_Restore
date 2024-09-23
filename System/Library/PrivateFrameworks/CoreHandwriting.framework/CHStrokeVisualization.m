@implementation CHStrokeVisualization

- (void)recognitionSessionDidUpdateRecognitionResult
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CHStrokeProvider *strokeProviderDrawn;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v12;
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
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;

  v95 = *MEMORY[0x1E0C80C00];
  if (!self
    || (strokeProviderDrawn = self->__strokeProviderDrawn,
        self->__strokeProviderDrawn = 0,
        strokeProviderDrawn,
        !strokeProviderDrawn))
  {
    objc_msgSend_delegate(self, a2, v2, v3, v4, v5);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_visualizationNeedsDisplay_(v76, v81, (uint64_t)self, v82, v83, v84);
    goto LABEL_20;
  }
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  objc_msgSend_recognitionSession(self, a2, v2, v3, v4, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastRecognitionResult(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupingResult(v18, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  objc_msgSend_createdStrokeGroups(v24, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v89, (uint64_t)v94, 16, v32);
  if (v33)
  {
    v39 = v33;
    v40 = *(_QWORD *)v90;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v90 != v40)
          objc_enumerationMutation(v30);
        objc_msgSend_bounds(*(void **)(*((_QWORD *)&v89 + 1) + 8 * v41), v34, v35, v36, v37, v38);
        v103.origin.x = v42;
        v103.origin.y = v43;
        v103.size.width = v44;
        v103.size.height = v45;
        v96.origin.x = x;
        v96.origin.y = y;
        v96.size.width = width;
        v96.size.height = height;
        v97 = CGRectUnion(v96, v103);
        x = v97.origin.x;
        y = v97.origin.y;
        width = v97.size.width;
        height = v97.size.height;
        ++v41;
      }
      while (v39 != v41);
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v34, (uint64_t)&v89, (uint64_t)v94, 16, v38);
    }
    while (v39);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend_deletedStrokeGroups(v24, v46, v47, v48, v49, v50, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v85, (uint64_t)v93, 16, v53);
  if (v54)
  {
    v60 = v54;
    v61 = *(_QWORD *)v86;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v86 != v61)
          objc_enumerationMutation(v51);
        objc_msgSend_bounds(*(void **)(*((_QWORD *)&v85 + 1) + 8 * v62), v55, v56, v57, v58, v59);
        v104.origin.x = v63;
        v104.origin.y = v64;
        v104.size.width = v65;
        v104.size.height = v66;
        v98.origin.x = x;
        v98.origin.y = y;
        v98.size.width = width;
        v98.size.height = height;
        v99 = CGRectUnion(v98, v104);
        x = v99.origin.x;
        y = v99.origin.y;
        width = v99.size.width;
        height = v99.size.height;
        ++v62;
      }
      while (v60 != v62);
      v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v55, (uint64_t)&v85, (uint64_t)v93, 16, v59);
    }
    while (v60);
  }

  v100.origin.x = x;
  v100.origin.y = y;
  v100.size.width = width;
  v100.size.height = height;
  v101 = CGRectInset(v100, -1.0, -1.0);
  v67 = v101.origin.x;
  v68 = v101.origin.y;
  v69 = v101.size.width;
  v70 = v101.size.height;

  v102.origin.x = v67;
  v102.origin.y = v68;
  v102.size.width = v69;
  v102.size.height = v70;
  if (!CGRectIsEmpty(v102))
  {
    objc_msgSend_delegate(self, v71, v72, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_visualization_needsDisplayInRect_(v76, v77, (uint64_t)self, v78, v79, v80, v67, v68, v69, v70);
LABEL_20:

  }
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  const char *v11;
  CHStrokeProvider *strokeProviderDrawn;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)CHStrokeVisualization;
  -[CHVisualization drawVisualizationInRect:context:viewBounds:](&v27, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  if (self)
  {
    strokeProviderDrawn = self->__strokeProviderDrawn;
    if (strokeProviderDrawn)
      goto LABEL_5;
  }
  objc_msgSend_recognitionSession(self, v11, (uint64_t)strokeProviderDrawn, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_latestStrokeProvider(v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (self)
  {
    objc_storeStrong((id *)&self->__strokeProviderDrawn, v22);

    strokeProviderDrawn = self->__strokeProviderDrawn;
LABEL_5:
    objc_msgSend_drawStrokesFromStrokeProvider_inRect_context_(self, v11, (uint64_t)strokeProviderDrawn, (uint64_t)a4, v14, v15, x, y, width, height);
    return;
  }

  objc_msgSend_drawStrokesFromStrokeProvider_inRect_context_(0, v24, 0, (uint64_t)a4, v25, v26, x, y, width, height);
}

- (void)drawStrokesFromStrokeProvider:(id)a3 inRect:(CGRect)a4 context:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  CGFloat lengths[2];
  CGFloat components[2];
  __int128 v41;
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)components = xmmword_1BE8DFF08;
  v41 = unk_1BE8DFF18;
  v12 = CGColorCreate(DeviceRGB, components);
  CGContextSetStrokeColorWithColor(a5, v12);
  CGColorRelease(v12);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetLineWidth(a5, 1.0);
  *(_OWORD *)lengths = xmmword_1BE8D5D10;
  CGContextSetLineDash(a5, 0.0, lengths, 2uLL);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend_orderedStrokes(v10, v13, v14, v15, v16, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v34, (uint64_t)v38, 16, v20);
  if (v21)
  {
    v27 = v21;
    v28 = *(_QWORD *)v35;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v18);
        objc_msgSend_bounds(*(void **)(*((_QWORD *)&v34 + 1) + 8 * v29), v22, v23, v24, v25, v26);
        v30 = v43.origin.x;
        v31 = v43.origin.y;
        v32 = v43.size.width;
        v33 = v43.size.height;
        v45.origin.x = x;
        v45.origin.y = y;
        v45.size.width = width;
        v45.size.height = height;
        if (CGRectIntersectsRect(v43, v45))
        {
          v44.origin.x = v30;
          v44.origin.y = v31;
          v44.size.width = v32;
          v44.size.height = v33;
          CGContextStrokeRect(a5, v44);
        }
        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, (uint64_t)&v34, (uint64_t)v38, 16, v26);
    }
    while (v27);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__strokeProviderDrawn, 0);
}

@end
