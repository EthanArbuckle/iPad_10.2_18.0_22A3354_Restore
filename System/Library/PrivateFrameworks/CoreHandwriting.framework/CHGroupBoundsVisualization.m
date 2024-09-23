@implementation CHGroupBoundsVisualization

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)CHGroupBoundsVisualization;
  -[CHStrokeGroupBasedVisualization dirtyRectForStrokeGroup:](&v3, sel_dirtyRectForStrokeGroup_, a3);
  return CGRectInset(v4, -2.0, -2.0);
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
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  CGColor *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  _BYTE v72[128];
  CGFloat lengths[2];
  uint64_t v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v74 = *MEMORY[0x1E0C80C00];
  v71.receiver = self;
  v71.super_class = (Class)CHGroupBoundsVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v71, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  objc_msgSend_resultDrawn(self, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupingResult(v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_strokeGroups(v22, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v28, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayWithOptions_usingComparator_(v34, v35, 1, (uint64_t)&unk_1E77F1A50, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  CGContextSetLineWidth(a4, 2.0);
  *(_OWORD *)lengths = xmmword_1BE8D5D10;
  CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v39 = v38;
  v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v67, (uint64_t)v72, 16, v41);
  if (v42)
  {
    v48 = v42;
    v49 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v68 != v49)
          objc_enumerationMutation(v39);
        v51 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend_bounds(v51, v43, v44, v45, v46, v47, (_QWORD)v67);
        v52 = v75.origin.x;
        v53 = v75.origin.y;
        v54 = v75.size.width;
        v55 = v75.size.height;
        v77.origin.x = x;
        v77.origin.y = y;
        v77.size.width = width;
        v77.size.height = height;
        if (CGRectIntersectsRect(v75, v77))
        {
          objc_msgSend_delegate(self, v43, v44, v45, v46, v47);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend_visualizationIndexForStrokeGroup_(v56, v57, (uint64_t)v51, v58, v59, v60);

          v66 = (CGColor *)objc_msgSend_newColorForVisualizedItemAtIndex_(CHVisualizationManager, v62, v61, v63, v64, v65);
          CGContextSetStrokeColorWithColor(a4, v66);
          CGColorRelease(v66);
          v76.origin.x = v52;
          v76.origin.y = v53;
          v76.size.width = v54;
          v76.size.height = v55;
          CGContextStrokeRect(a4, v76);
        }
      }
      v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v43, (uint64_t)&v67, (uint64_t)v72, 16, v47);
    }
    while (v48);
  }

}

@end
