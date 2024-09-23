@implementation _FEFocusMapSnapshotDebugInfo

- (_FEFocusMapSnapshotDebugInfo)initWithSnapshot:(id)a3 focusMapSearchInfo:(id)a4
{
  id v8;
  id v9;
  _FEFocusMapSnapshotDebugInfo *v10;
  _FEFocusMapSnapshotDebugInfo *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshotDebugInfo.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot"));

  }
  v14.receiver = self;
  v14.super_class = (Class)_FEFocusMapSnapshotDebugInfo;
  v10 = -[_FEFocusMapSnapshotDebugInfo init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_snapshot, a3);
    objc_storeWeak((id *)&v11->_focusMapSearchInfo, v9);
  }

  return v11;
}

- (UIImage)image
{
  UIImage *image;
  UIImage *v4;
  UIImage *v5;

  image = self->_image;
  if (!image)
  {
    -[_FEFocusMapSnapshotDebugInfo _drawImage](self, "_drawImage");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_image;
    self->_image = v4;

    image = self->_image;
  }
  return image;
}

- (CGPoint)imageAnchorPoint
{
  id v3;
  double x;
  double y;
  CGPoint result;

  v3 = -[_FEFocusMapSnapshotDebugInfo image](self, "image");
  x = self->_imageAnchorPoint.x;
  y = self->_imageAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)_rectContainingAllFocusRegions
{
  void *v2;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  v25 = *MEMORY[0x24BDAC8D0];
  -[_FEFocusMapSnapshotDebugInfo snapshot](self, "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v2, "regions", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v2, "snapshotFrameForRegion:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11));
        v29.origin.x = v12;
        v29.origin.y = v13;
        v29.size.width = v14;
        v29.size.height = v15;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectUnion(v26, v29);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_drawImage
{
  return 0;
}

+ (id)_summaryImageForDebugInfoArray:(id)a3 forFocusMovementWithInfo:(id)a4 scaleFactor:(double)a5
{
  return 0;
}

- (_FEFocusMapSnapshot)snapshot
{
  return self->_snapshot;
}

- (_FEFocusMapSearchInfo)focusMapSearchInfo
{
  return (_FEFocusMapSearchInfo *)objc_loadWeakRetained((id *)&self->_focusMapSearchInfo);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusMapSearchInfo);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
