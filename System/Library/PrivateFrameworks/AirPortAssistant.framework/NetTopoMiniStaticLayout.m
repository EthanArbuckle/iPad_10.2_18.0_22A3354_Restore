@implementation NetTopoMiniStaticLayout

- (NetTopoMiniStaticLayout)initWithContainerLayer:(id)a3 andOptions:(int)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NetTopoMiniStaticLayout *v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NetTopoMiniStaticLayout;
  v10 = -[NetTopoMiniStaticLayout init](&v13, sel_init);
  if (v10)
  {
    if (dword_2550F4968 <= 800 && (dword_2550F4968 != -1 || sub_21A69876C((uint64_t)&dword_2550F4968, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4968, (uint64_t)"-[NetTopoMiniStaticLayout initWithContainerLayer:andOptions:]", 800, (uint64_t)"containerLayer = %@, options = %d\n", v6, v7, v8, v9, (uint64_t)a3);
    v10->_containerLayer = (CALayer *)a3;
    v10->_layoutOptions = a4;
    objc_msgSend_setMasksToBounds_(a3, v11, 1);
    v10->_topoDeviceLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v10->_connectionLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  }
  return v10;
}

- (void)destroyDeviceLayers
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  NSMutableArray *topoDeviceLayers;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const char *v13;
  NSMutableArray *connectionLayers;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_count(self->_topoDeviceLayers, a2, v2))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    topoDeviceLayers = self->_topoDeviceLayers;
    v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(topoDeviceLayers, v4, (uint64_t)&v25, v30, 16);
    if (v7)
    {
      v10 = v7;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(topoDeviceLayers);
          objc_msgSend_removeFromSuperlayer(*(void **)(*((_QWORD *)&v25 + 1) + 8 * i), v8, v9);
        }
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(topoDeviceLayers, v8, (uint64_t)&v25, v30, 16);
      }
      while (v10);
    }
    objc_msgSend_removeAllObjects(self->_topoDeviceLayers, v8, v9);
  }
  if (objc_msgSend_count(self->_connectionLayers, v4, v5))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    connectionLayers = self->_connectionLayers;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(connectionLayers, v13, (uint64_t)&v21, v29, 16);
    if (v15)
    {
      v18 = v15;
      v19 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(connectionLayers);
          objc_msgSend_removeFromSuperlayer(*(void **)(*((_QWORD *)&v21 + 1) + 8 * j), v16, v17);
        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(connectionLayers, v16, (uint64_t)&v21, v29, 16);
      }
      while (v18);
    }
    objc_msgSend_removeAllObjects(self->_connectionLayers, v16, v17);
  }
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_destroyDeviceLayers(self, a2, v2);

  v4.receiver = self;
  v4.super_class = (Class)NetTopoMiniStaticLayout;
  -[NetTopoMiniStaticLayout dealloc](&v4, sel_dealloc);
}

- (void)setContainerLayer:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v9;

  if (self->_containerLayer != a3)
  {
    if (dword_2550F4968 <= 800 && (dword_2550F4968 != -1 || sub_21A69876C((uint64_t)&dword_2550F4968, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4968, (uint64_t)"-[NetTopoMiniStaticLayout setContainerLayer:]", 800, (uint64_t)"containerLayer = %@\n", v3, v4, v5, v6, (uint64_t)a3);
    objc_msgSend_destroyDeviceLayers(self, a2, (uint64_t)a3);
    v9 = a3;

    self->_containerLayer = (CALayer *)a3;
  }
}

- (CALayer)containerLayer
{
  return self->_containerLayer;
}

- (void)setOwningView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v9;

  if (self->_owningView != a3)
  {
    if (dword_2550F4968 <= 800 && (dword_2550F4968 != -1 || sub_21A69876C((uint64_t)&dword_2550F4968, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4968, (uint64_t)"-[NetTopoMiniStaticLayout setOwningView:]", 800, (uint64_t)"owningView = %@\n", v3, v4, v5, v6, (uint64_t)a3);
    v9 = a3;

    self->_owningView = a3;
  }
}

- (id)owningView
{
  return self->_owningView;
}

- (CGImage)imageForDeviceSpec:(id)a3 wantSmall:(BOOL)a4 forContentsScale:(double)a5
{
  _BOOL4 v6;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  CGImage *v27;
  CGImageRef v28;
  CGImage *v29;

  v6 = a4;
  v9 = (void *)objc_msgSend_objectForKey_(a3, a2, (uint64_t)off_2550F49A8[0]);
  if (!objc_msgSend_isEqualToString_(v9, v10, (uint64_t)off_2550F49B0[0]))
    return 0;
  v13 = objc_msgSend_layoutOptions(self, v11, v12) & 1;
  v15 = (void *)objc_msgSend_objectForKey_(a3, v14, (uint64_t)off_2550F49B8[0]);
  v18 = objc_msgSend_unsignedIntegerValue(v15, v16, v17);
  v20 = (void *)objc_msgSend_objectForKey_(a3, v19, (uint64_t)off_2550F49C0[0]);
  v23 = objc_msgSend_unsignedIntegerValue(v20, v21, v22);
  v25 = objc_msgSend_imageForBaseStationWithProductID_subProductID_deviceKind_small_cropped_threeDee_(ImageStore, v24, v18, 0, v23, 0, v13, 0);
  v27 = (CGImage *)objc_msgSend_cgImageFromImage_forContentsScale_(ImageStore, v26, v25, a5);
  v28 = v27;
  if (v6)
  {
    v28 = sub_21A71CB38(v27, 75.0);
    v29 = v28;
  }
  return v28;
}

- (void)performLayout
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  const char *v9;
  uint64_t v10;
  char v11;
  double v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double Width;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  double v30;
  char v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  double v38;
  float v39;
  NSMutableArray *topoDeviceLayers;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  uint64_t i;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  double v52;
  double v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  float v60;
  float v61;
  const char *v62;
  uint64_t v63;
  NSMutableArray *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  float v69;
  double v70;
  uint64_t v71;
  double v72;
  uint64_t j;
  void *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  double v78;
  double v79;
  float v80;
  double v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  double v87;
  float v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  NSMutableArray *connectionLayers;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t k;
  void *v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  double v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  double v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  const char *v129;
  uint64_t v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;
  CGRect v155;

  v154 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4968 <= 800 && (dword_2550F4968 != -1 || sub_21A69876C((uint64_t)&dword_2550F4968, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4968, (uint64_t)"-[NetTopoMiniStaticLayout performLayout]", 800, (uint64_t)"self = %@\n", v3, v4, v5, v6, (uint64_t)self);
  v8 = objc_msgSend_layoutOptions(self, a2, v2);
  v11 = v8;
  if ((v8 & 2) != 0)
    v12 = 28.0;
  else
    v12 = 35.0;
  if ((v8 & 2) != 0)
    v13 = 66.6666667;
  else
    v13 = 100.0;
  if ((v8 & 2) != 0)
    v14 = 5.0;
  else
    v14 = 10.0;
  if ((objc_msgSend_layoutOptions(self, v9, v10) & 1) != 0)
  {
    v149 = 0u;
    v150 = 0u;
    v147 = 0u;
    v148 = 0u;
    topoDeviceLayers = self->_topoDeviceLayers;
    v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(topoDeviceLayers, v15, (uint64_t)&v147, v153, 16);
    if (v41)
    {
      v43 = v41;
      v44 = 0;
      v45 = *(_QWORD *)v148;
      v46 = dbl_21A73F430[(v11 & 2) == 0];
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v148 != v45)
            objc_enumerationMutation(topoDeviceLayers);
          v48 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * i);
          v49 = (void *)objc_msgSend_containerLayer(self, v17, v42);
          objc_msgSend_frame(v49, v50, v51);
          v53 = v52;
          v56 = (void *)objc_msgSend_containerLayer(self, v54, v55);
          objc_msgSend_bounds(v56, v57, v58);
          v60 = (v59 - v53) * 0.5;
          v61 = v46 * (double)(unint64_t)(v44 + i);
          objc_msgSend_setFrame_(v48, v62, v63, floorf(v60), floorf(v61), v53, v13);
        }
        v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(topoDeviceLayers, v17, (uint64_t)&v147, v153, 16);
        v44 += i;
      }
      while (v43);
    }
  }
  else if ((objc_msgSend_layoutOptions(self, v15, v16) & 1) == 0)
  {
    v19 = objc_msgSend_count(self->_topoDeviceLayers, v17, v18);
    v22 = (void *)objc_msgSend_containerLayer(self, v20, v21);
    objc_msgSend_bounds(v22, v23, v24);
    Width = CGRectGetWidth(v155);
    v30 = 0.0;
    if ((objc_msgSend_layoutOptions(self, v26, v27) & 8) == 0)
    {
      v31 = objc_msgSend_layoutOptions(self, v28, v29);
      v34 = (void *)objc_msgSend_containerLayer(self, v32, v33);
      objc_msgSend_bounds(v34, v35, v36);
      v38 = v37 - v13;
      if ((v31 & 4) != 0)
      {
        v30 = v38 + -7.0;
      }
      else
      {
        v39 = v38 * 0.5;
        v30 = floorf(v39);
      }
    }
    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    v64 = self->_topoDeviceLayers;
    v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v28, (uint64_t)&v143, v152, 16);
    if (v65)
    {
      v67 = v65;
      v68 = 0;
      v69 = (Width + -20.0 - (double)(unint64_t)(v19 - 1) * v14) / (double)(unint64_t)v19;
      v70 = floorf(v69);
      v71 = *(_QWORD *)v144;
      v72 = v14 + v70;
      do
      {
        for (j = 0; j != v67; ++j)
        {
          if (*(_QWORD *)v144 != v71)
            objc_enumerationMutation(v64);
          v74 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * j);
          v75 = (void *)objc_msgSend_containerLayer(self, v17, v66);
          objc_msgSend_bounds(v75, v76, v77);
          v79 = v78;
          v80 = v72 * (double)(unint64_t)(v68 + j);
          v81 = floorf(v80) + 10.0;
          v84 = (void *)objc_msgSend_containerLayer(self, v82, v83);
          objc_msgSend_bounds(v84, v85, v86);
          v88 = v87 - v79 - v30;
          objc_msgSend_setFrame_(v74, v89, v90, v81, floorf(v88), v70, v79);
          objc_msgSend_setLabelPinnedHeight_(v74, v91, v92, v12);
          objc_msgSend_setBoundsSizeConstraint_(v74, v93, v94, v70, v79);
        }
        v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v17, (uint64_t)&v143, v152, 16);
        v68 += j;
      }
      while (v67);
    }
  }
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  connectionLayers = self->_connectionLayers;
  v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(connectionLayers, v17, (uint64_t)&v139, v151, 16);
  if (v96)
  {
    v99 = v96;
    v100 = *(_QWORD *)v140;
    do
    {
      for (k = 0; k != v99; ++k)
      {
        if (*(_QWORD *)v140 != v100)
          objc_enumerationMutation(connectionLayers);
        v102 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * k);
        if ((objc_msgSend_layoutOptions(self, v97, v98) & 1) != 0)
        {
          objc_msgSend_setUpstreamDeviceSpatialRelationship_(v102, v103, 4);
          v121 = (void *)objc_msgSend_parent(v102, v119, v120);
          v109 = 0.0;
          v124 = 0.0;
          v111 = 0.0;
          if (v121)
          {
            objc_msgSend_getConnectionAttachmentLocations(v121, v122, v123);
            v111 = v137;
            v124 = v138;
          }
          v125 = (void *)objc_msgSend_childAtIndex_(v102, v122, 0);
          v115 = 0.0;
          if (v125)
          {
            objc_msgSend_getConnectionAttachmentLocations(v125, v126, v127);
            v115 = v135;
            v109 = v136;
          }
          v110 = v124;
          v116 = 2;
          objc_msgSend_setFrame_(v102, v126, v127, v111, v124, 24.0, v109 - v124);
        }
        else
        {
          objc_msgSend_setUpstreamDeviceSpatialRelationship_(v102, v103, 1);
          v106 = (void *)objc_msgSend_parent(v102, v104, v105);
          v109 = 0.0;
          v110 = 0.0;
          v111 = 0.0;
          if (v106)
          {
            objc_msgSend_getConnectionAttachmentLocations(v106, v107, v108);
            v111 = v133;
            v110 = v134;
          }
          v112 = (void *)objc_msgSend_childAtIndex_(v102, v107, 0);
          v115 = 0.0;
          if (v112)
          {
            objc_msgSend_getConnectionAttachmentLocations(v112, v113, v114);
            v115 = v131;
            v109 = v132;
          }
          v116 = 3;
          objc_msgSend_setFrame_(v102, v113, v114, v111, v110 + -12.0, v115 - v111, 24.0);
        }
        objc_msgSend_setUpstreamConnectionPoint_(v102, v117, v118, v111, v110);
        objc_msgSend_setUpstreamConnectionSide_(v102, v128, v116);
        objc_msgSend_setDownstreamConnectionPoint_(v102, v129, v130, v115, v109);
      }
      v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(connectionLayers, v97, (uint64_t)&v139, v151, 16);
    }
    while (v99);
  }
}

- (void)createLayoutForDevices:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NetTopoAirPortDeviceLayer *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  NetTopoDeviceConnectionLayer *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  id v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  const char *v76;
  const char *v77;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4968 <= 800 && (dword_2550F4968 != -1 || sub_21A69876C((uint64_t)&dword_2550F4968, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4968, (uint64_t)"-[NetTopoMiniStaticLayout createLayoutForDevices:]", 800, (uint64_t)"self = %@\n", v3, v4, v5, v6, (uint64_t)self);
  v8 = objc_msgSend_layoutOptions(self, a2, (uint64_t)a3);
  objc_msgSend_setTopoDevicesDescriptor_(self, v9, (uint64_t)a3);
  objc_msgSend_destroyDeviceLayers(self, v10, v11);
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v12, (uint64_t)&v80, v84, 16);
  if (v13)
  {
    v16 = v13;
    v17 = 0;
    v18 = (v8 >> 1) & 1;
    v79 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v81 != v79)
          objc_enumerationMutation(a3);
        v20 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        v21 = [NetTopoAirPortDeviceLayer alloc];
        v24 = objc_msgSend_owningView(self, v22, v23);
        v26 = (id)objc_msgSend_initWithUIStyle_andOwningView_(v21, v25, 1, v24);
        objc_msgSend_contentsScale(v26, v27, v28);
        v30 = objc_msgSend_imageForDeviceSpec_wantSmall_forContentsScale_(self, v29, (uint64_t)v20, v18);
        objc_msgSend_setObjectImage_(v26, v31, v30);
        objc_msgSend_setSmallSize_(v26, v32, v18);
        objc_msgSend_setSelectable_(v26, v33, 0);
        v35 = (void *)objc_msgSend_objectForKey_(v20, v34, (uint64_t)off_2550F49C8[0]);
        v37 = (void *)objc_msgSend_objectForKey_(v20, v36, (uint64_t)off_2550F49D0[0]);
        if (objc_msgSend_length(v35, v38, v39))
          objc_msgSend_setLabel_(v26, v40, (uint64_t)v35);
        if (objc_msgSend_length(v37, v40, v41))
        {
          if (objc_msgSend_length(v35, v42, v43))
            objc_msgSend_setSecondaryLabel_(v26, v44, (uint64_t)v37);
          else
            objc_msgSend_setLabel_(v26, v44, (uint64_t)v37);
        }
        v45 = (void *)objc_msgSend_containerLayer(self, v42, v43);
        objc_msgSend_addSublayer_(v45, v46, (uint64_t)v26);
        objc_msgSend_setNeedsDisplay(v26, v47, v48);
        objc_msgSend_addObject_(self->_topoDeviceLayers, v49, (uint64_t)v26);
        v51 = (void *)objc_msgSend_objectForKey_(v20, v50, (uint64_t)off_2550F49D8[0]);
        if (v51 && v17 + i)
        {
          v53 = v51;
          if ((objc_msgSend_isEqualToString_(v51, v52, (uint64_t)off_2550F49E8[0]) & 1) != 0)
          {
            v55 = 1;
          }
          else if (objc_msgSend_isEqualToString_(v53, v54, (uint64_t)off_2550F49F0))
          {
            v55 = 3;
          }
          else
          {
            v55 = 2;
          }
          v56 = [NetTopoDeviceConnectionLayer alloc];
          v59 = objc_msgSend_owningView(self, v57, v58);
          v61 = (id)objc_msgSend_initWithUIStyle_andOwningView_(v56, v60, 1, v59);
          objc_msgSend_setSmallSize_(v61, v62, v18);
          objc_msgSend_setSelectable_(v61, v63, 0);
          objc_msgSend_setConnectionMediumFallback_(v61, v64, v55);
          if (objc_msgSend_isEqualToString_(v53, v65, (uint64_t)off_2550F49F0))
            objc_msgSend_setConnectionStyle_(v61, v66, 5);
          else
            objc_msgSend_setConnectionStyle_(v61, v66, 1);
          v69 = (void *)objc_msgSend_containerLayer(self, v67, v68);
          objc_msgSend_addSublayer_(v69, v70, (uint64_t)v61);
          objc_msgSend_setNeedsDisplay(v61, v71, v72);
          v74 = objc_msgSend_objectAtIndex_(self->_topoDeviceLayers, v73, v17 + i - 1);
          objc_msgSend_setParent_(v61, v75, v74);
          objc_msgSend_addChild_(v61, v76, (uint64_t)v26);
          objc_msgSend_addObject_(self->_connectionLayers, v77, (uint64_t)v61);
        }
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v52, (uint64_t)&v80, v84, 16);
      v17 += i;
    }
    while (v16);
  }
  objc_msgSend_performLayout(self, v14, v15);
}

- (NSArray)topoDeviceLayers
{
  return &self->_topoDeviceLayers->super;
}

- (NSArray)topoDevicesDescriptor
{
  return self->_topoDevicesDescriptor;
}

- (void)setTopoDevicesDescriptor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (int)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(int)a3
{
  self->_layoutOptions = a3;
}

@end
