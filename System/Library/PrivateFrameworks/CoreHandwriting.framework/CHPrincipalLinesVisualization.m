@implementation CHPrincipalLinesVisualization

- (int64_t)layeringPriority
{
  return 2;
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
  CGColorSpace *DeviceRGB;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[6];
  objc_super v68;
  CGFloat lengths[3];
  uint64_t v70;
  CGRect v71;
  CGRect v72;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v70 = *MEMORY[0x1E0C80C00];
  v68.receiver = self;
  v68.super_class = (Class)CHPrincipalLinesVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v68, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  objc_msgSend_resultDrawn(self, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_autoRefineResult(v17, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = MEMORY[0x1E0C809B0];
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = sub_1BE7669C0;
  v67[3] = &unk_1E77F4B20;
  v67[4] = DeviceRGB;
  v67[5] = a4;
  v30 = (void *)MEMORY[0x1C3B81A84](v67);
  if (v23)
  {
    objc_msgSend_strokeGroup(v23, v25, v26, v27, v28, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dirtyRectForStrokeGroup_(self, v32, (uint64_t)v31, v33, v34, v35);
    v72.origin.x = x;
    v72.origin.y = y;
    v72.size.width = width;
    v72.size.height = height;
    if (CGRectIntersectsRect(v71, v72))
    {
      CGContextSaveGState(a4);
      *(_OWORD *)lengths = xmmword_1BE8D5D10;
      CGContextSetLineWidth(a4, 2.0);
      CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
      CGContextSetAlpha(a4, 0.8);
      objc_msgSend_textResult(v23, v36, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *MEMORY[0x1E0C9D538];
      v43 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
      v48[0] = v24;
      v48[1] = 3221225472;
      v48[2] = sub_1BE766AF4;
      v48[3] = &unk_1E77F4B48;
      v49 = v23;
      v51 = v42;
      v52 = v43;
      v53 = v42;
      v54 = v43;
      v55 = v42;
      v56 = v43;
      v57 = v42;
      v58 = v43;
      v59 = v42;
      v60 = v43;
      v61 = v42;
      v62 = v43;
      v63 = v42;
      v64 = v43;
      v65 = v42;
      v66 = v43;
      v50 = v30;
      objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v41, v44, (uint64_t)v48, v45, v46, v47);

      CGContextRestoreGState(a4);
    }

  }
  CGColorSpaceRelease(DeviceRGB);

}

@end
