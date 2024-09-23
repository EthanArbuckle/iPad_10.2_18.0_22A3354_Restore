@implementation NetTopoAirPortDeviceLayer

- (void)initNetTopoAirPortDeviceLayerCommonWithStyle:(int)a3 andOwningView:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (dword_2550F49F8 <= 800 && (dword_2550F49F8 != -1 || sub_21A69876C((uint64_t)&dword_2550F49F8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F49F8, (uint64_t)"-[NetTopoAirPortDeviceLayer initNetTopoAirPortDeviceLayerCommonWithStyle:andOwningView:]", 800, (uint64_t)"%@\n", v4, v5, v6, v7, (uint64_t)self);
}

- (NetTopoAirPortDeviceLayer)initWithUIStyle:(int)a3 andOwningView:(id)a4
{
  uint64_t v5;
  NetTopoAirPortDeviceLayer *v6;
  const char *v7;
  NetTopoAirPortDeviceLayer *v8;
  objc_super v10;

  v5 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)NetTopoAirPortDeviceLayer;
  v6 = -[NetTopoObjectLayer initWithUIStyle:andOwningView:](&v10, sel_initWithUIStyle_andOwningView_);
  v8 = v6;
  if (v6)
    objc_msgSend_initNetTopoAirPortDeviceLayerCommonWithStyle_andOwningView_(v6, v7, v5, a4);
  return v8;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  if (dword_2550F49F8 <= 800 && (dword_2550F49F8 != -1 || sub_21A69876C((uint64_t)&dword_2550F49F8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F49F8, (uint64_t)"-[NetTopoAirPortDeviceLayer dealloc]", 800, (uint64_t)"%@\n", v2, v3, v4, v5, (uint64_t)self);
  v7.receiver = self;
  v7.super_class = (Class)NetTopoAirPortDeviceLayer;
  -[NetTopoObjectLayer dealloc](&v7, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_class *v10;
  const char *Name;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;

  v4 = (void *)objc_msgSend_associatedNode(self, a2, v2);
  v7 = (void *)objc_msgSend_info(v4, v5, v6);
  v9 = (void *)objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v8, (uint64_t)&stru_24DD08368);
  v10 = (objc_class *)objc_opt_class();
  Name = class_getName(v10);
  v14 = objc_msgSend_retainCount(self, v12, v13);
  v16 = objc_msgSend_objectForKey_(v7, v15, (uint64_t)CFSTR("name"));
  v19 = objc_msgSend_row(self, v17, v18);
  v22 = objc_msgSend_column(self, v20, v21);
  objc_msgSend_appendFormat_(v9, v23, (uint64_t)CFSTR("<%s: %p retains %d> ('%@' row=%d col=%d)"), Name, self, v14, v16, v19, v22);
  return v9;
}

- (id)debugDescription
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;

  v4 = (void *)objc_msgSend_description(self, a2, v2);
  if (objc_msgSend_parent(self, v5, v6))
  {
    v9 = objc_msgSend_parent(self, v7, v8);
    objc_msgSend_appendFormat_(v4, v10, (uint64_t)CFSTR(" connected upstream through %@"), v9);
    v13 = (void *)objc_msgSend_parent(self, v11, v12);
    if (objc_msgSend_parent(v13, v14, v15))
    {
      v18 = (void *)objc_msgSend_parent(self, v16, v17);
      v21 = objc_msgSend_parent(v18, v19, v20);
      objc_msgSend_appendFormat_(v4, v22, (uint64_t)CFSTR(" to device %@\n"), v21);
    }
  }
  return v4;
}

- (void)layoutSublayers
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NetTopoAirPortDeviceLayer;
  -[NetTopoObjectLayer layoutSublayers](&v2, sel_layoutSublayers);
}

- (void)pickCorrectImagesForContentsScale:(double)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  objc_super v39;

  if (!self->super._topoStyle)
  {
    v6 = (void *)objc_msgSend_associatedNode(self, a2, v3);
    v9 = (const __CFString *)objc_msgSend_info(v6, v7, v8);
    v17 = sub_21A68E368(v9, v10, v11, v12, v13, v14, v15, v16);
    v25 = sub_21A68F15C(v9, v18, v19, v20, v21, v22, v23, v24);
    v33 = sub_21A68E344((uint64_t)v9, v26, v27, v28, v29, v30, v31, v32);
    v35 = objc_msgSend_imageForBaseStationWithProductID_subProductID_deviceKind_small_cropped_threeDee_(ImageStore, v34, (uint64_t)v17, v25, v33, 0, 1, 1);
    v37 = objc_msgSend_cgImageFromImage_forContentsScale_(ImageStore, v36, v35, a3);
    objc_msgSend_setObjectImage_(self, v38, v37);
  }
  v39.receiver = self;
  v39.super_class = (Class)NetTopoAirPortDeviceLayer;
  -[NetTopoObjectLayer pickCorrectImagesForContentsScale:](&v39, sel_pickCorrectImagesForContentsScale_, a3);
}

- (void)setAssociatedNode:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  unsigned int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  const __CFString *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;

  if (self->super._associatedNode != a3)
  {
    v5 = a3;

    self->super._associatedNode = a3;
  }
  if (a3)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = (void *)objc_msgSend_info(a3, a2, (uint64_t)a3);
    v9 = objc_msgSend_objectForKey_(v7, v8, (uint64_t)CFSTR("name"));
    v11 = objc_msgSend_stringWithFormat_(v6, v10, (uint64_t)CFSTR("%@"), v9);
    objc_msgSend_setLabel_(self, v12, v11);
    if (objc_msgSend_configReadStatus(a3, v13, v14) != 1)
    {
      v17 = (void *)objc_msgSend_info(a3, v15, v16);
      v19 = (void *)objc_msgSend_objectForKey_(v17, v18, (uint64_t)CFSTR("syAP"));
      v22 = objc_msgSend_integerValue(v19, v20, v21);
      v25 = objc_msgSend_info(a3, v23, v24);
      v33 = sub_21A68E344(v25, v26, v27, v28, v29, v30, v31, v32);
      v34 = sub_21A690D80(v22, v33, 0);
      objc_msgSend_setSecondaryLabel_(self, v35, (uint64_t)v34);
    }
    objc_msgSend_contentsScale(self, v15, v16);
    objc_msgSend_pickCorrectImagesForContentsScale_(self, v36, v37);
  }
  objc_msgSend_setNeedsLayout(self, a2, (uint64_t)a3);
}

- ($E32549A47AE6FE03C4AA404FAEB37148)getConnectionAttachmentLocations
{
  uint64_t v3;
  objc_super v6;

  objc_msgSend_layoutSublayers(self, a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)NetTopoAirPortDeviceLayer;
  return ($E32549A47AE6FE03C4AA404FAEB37148 *)-[$E32549A47AE6FE03C4AA404FAEB37148 getConnectionAttachmentLocations](&v6, sel_getConnectionAttachmentLocations);
}

@end
