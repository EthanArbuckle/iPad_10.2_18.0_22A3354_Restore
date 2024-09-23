@implementation CHStrokePointsVisualization

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
  uint64_t i;
  void *v31;
  const CGPath *Mutable;
  const char *v33;
  const char *v34;
  CGColorSpace *space;
  void *v36;
  CGColor *color;
  _QWORD v38[6];
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;
  CGRect v47;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  color = CGColorCreate(DeviceRGB, dbl_1BE8D68B0);
  space = DeviceRGB;
  v12 = CGColorCreate(DeviceRGB, dbl_1BE8D68D0);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v36 = v10;
  objc_msgSend_orderedStrokes(v10, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v40, (uint64_t)v44, 16, v20);
  if (v21)
  {
    v27 = v21;
    v28 = *(_QWORD *)v41;
    v29 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v41 != v28)
          objc_enumerationMutation(v18);
        v31 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend_bounds(v31, v22, v23, v24, v25, v26, space);
        v47.origin.x = x;
        v47.origin.y = y;
        v47.size.width = width;
        v47.size.height = height;
        if (CGRectIntersectsRect(v46, v47))
        {
          Mutable = CGPathCreateMutable();
          v39[0] = v29;
          v39[1] = 3221225472;
          v39[2] = sub_1BE7297D0;
          v39[3] = &unk_1E77F4138;
          v39[4] = Mutable;
          objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(CHStrokeUtilities, v33, (uint64_t)v31, 1, 1, (uint64_t)v39);
          CGContextSetStrokeColorWithColor(a5, color);
          CGContextSetLineWidth(a5, 5.0);
          CGContextAddPath(a5, Mutable);
          CGContextStrokePath(a5);
          CGPathRelease(Mutable);
          CGContextSetFillColorWithColor(a5, v12);
          v38[0] = v29;
          v38[1] = 3221225472;
          v38[2] = sub_1BE72982C;
          v38[3] = &unk_1E77F44E8;
          v38[4] = 0x4000000000000000;
          v38[5] = a5;
          objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(CHStrokeUtilities, v34, (uint64_t)v31, 0, 1, (uint64_t)v38);
        }
      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, (uint64_t)&v40, (uint64_t)v44, 16, v26);
    }
    while (v27);
  }

  CGColorSpaceRelease(space);
  CGColorRelease(color);
  CGColorRelease(v12);

}

@end
