@implementation ImageStore

+ (id)kitImageOfType:(int64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("UIPreferencesWhiteCheck.png");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    v4 = CFSTR("UIPreferencesBlueCheck.png");
  else
    v4 = v3;
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDF6AC8], sel_kitImageNamed_, v4);
}

+ (id)sharedImageStore
{
  id result;

  result = (id)qword_2550F4CD0;
  if (!qword_2550F4CD0)
  {
    result = objc_alloc_init((Class)objc_opt_class());
    qword_2550F4CD0 = (uint64_t)result;
  }
  return result;
}

+ (id)imageNamed:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;

  v4 = (void *)objc_opt_class();
  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = objc_opt_class();
  v8 = objc_msgSend_bundleForClass_(v5, v7, v6);
  return (id)objc_msgSend_imageNamed_inBundle_(v4, v9, (uint64_t)a3, v8);
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  id result;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;

  v6 = objc_msgSend_pathExtension(a3, a2, (uint64_t)a3);
  v9 = objc_msgSend_stringByDeletingPathExtension(a3, v7, v8);
  result = (id)objc_msgSend_imageNamed_inBundle_ofType_(ImageStore, v10, v9, a4, v6);
  if (!result)
  {
    if (sub_21A731D68(a3, v12, v13, v14, v15, v16, v17, v18))
    {
      result = (id)sub_21A731D4C();
      if (result)
        return (id)objc_msgSend_imageNamed_inBundle_ofType_(ImageStore, v19, v9, result, v6);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4 ofType:(id)a5
{
  return (id)objc_msgSend_imageNamed_inBundle_(MEMORY[0x24BDF6AC8], a2, (uint64_t)a3, a4, a5);
}

+ (id)imageNameForProductID:(unsigned int)a3 subProductID:(unsigned int)a4 deviceKind:(int)a5 small:(BOOL)a6 cropped:(BOOL)a7 threeDee:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v12 = *(_QWORD *)&a3;
  switch(sub_21A671298(*(uint64_t *)&a3))
  {
    case 3u:
      v14 = objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v13, (uint64_t)CFSTR("AirPortExtremeG"));
      goto LABEL_11;
    case 4u:
      v14 = objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v13, (uint64_t)CFSTR("AirPortExpress"));
      goto LABEL_11;
    case 5u:
      v14 = objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v13, (uint64_t)CFSTR("AirPortExtremeN"));
      goto LABEL_11;
    case 6u:
      v14 = objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v13, (uint64_t)CFSTR("TimeCapsule"));
      goto LABEL_11;
    case 7u:
    case 8u:
      v14 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD16A8], v13, (uint64_t)CFSTR("AirPort-%d"), 8);
      goto LABEL_11;
    case 0xAu:
      v14 = objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v13, (uint64_t)CFSTR("AirPortEx"));
      goto LABEL_11;
    default:
      if ((_DWORD)v12)
      {
        v14 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD16A8], v13, (uint64_t)CFSTR("%d"), v12);
LABEL_11:
        v15 = (void *)v14;
        goto LABEL_12;
      }
      if ((a5 - 3) >= 2)
      {
        if (a5 == 2)
          v14 = objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v13, (uint64_t)CFSTR("GenericAirPlay"));
        else
          v14 = objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v13, (uint64_t)CFSTR("GenericBase"));
        goto LABEL_11;
      }
      v15 = 0;
LABEL_12:
      if (v8)
        objc_msgSend_appendString_(v15, v13, (uint64_t)CFSTR("-3D"));
      else
        objc_msgSend_appendString_(v15, v13, (uint64_t)CFSTR("-2D"));
      if (v9)
      {
        if (v10)
          objc_msgSend_appendString_(v15, v16, (uint64_t)CFSTR("-cropped"));
        else
          objc_msgSend_appendString_(v15, v16, (uint64_t)CFSTR("-reflected"));
      }
      objc_msgSend_appendString_(v15, v16, (uint64_t)CFSTR(".png"));
      if (dword_2550EEB90 <= 800 && (dword_2550EEB90 != -1 || sub_21A69876C((uint64_t)&dword_2550EEB90, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550EEB90, (uint64_t)"+[ImageStore imageNameForProductID:subProductID:deviceKind:small:cropped:threeDee:]", 800, (uint64_t)"constructed image name '%@'\n", v17, v18, v19, v20, (uint64_t)v15);
      return v15;
  }
}

+ (id)imageForInformationalDiagram:(unsigned int)a3
{
  return (id)objc_msgSend_imageForInformationalDiagram_subProductID_deviceKind_audioImage_small_(ImageStore, a2, *(uint64_t *)&a3, 0, 1, 0, 0);
}

+ (id)imageForInformationalDiagram:(unsigned int)a3 subProductID:(unsigned int)a4 deviceKind:(int)a5 audioImage:(BOOL)a6 small:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v27;

  v7 = a7;
  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v11 = *(_QWORD *)&a3;
  v27 = 0;
  do
  {
    v12 = objc_msgSend_imageNameForInformationalDiagram_subProductID_deviceKind_audioImage_small_useDataCache_(ImageStore, a2, v11, v10, v9, v8, v7, &v27);
    if (v27)
    {
      v13 = sub_21A731D4C();
    }
    else
    {
      v14 = (void *)MEMORY[0x24BDD1488];
      v15 = objc_opt_class();
      v13 = objc_msgSend_bundleForClass_(v14, v16, v15);
    }
    v17 = v13;
    v18 = (void *)objc_opt_class();
    v20 = objc_msgSend_imageNamed_inBundle_(v18, v19, v12, v17);
    v25 = (void *)v20;
    if (!(_DWORD)v11)
      break;
    v11 = 0;
  }
  while (!v20);
  if (dword_2550EEB90 <= 800 && (dword_2550EEB90 != -1 || sub_21A69876C((uint64_t)&dword_2550EEB90, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EEB90, (uint64_t)"+[ImageStore imageForInformationalDiagram:subProductID:deviceKind:audioImage:small:]", 800, (uint64_t)"returning image %@\n", v21, v22, v23, v24, (uint64_t)v25);
  return v25;
}

+ (double)informationDiagramBaseImageCenterOffset:(unsigned int)a3 small:(BOOL)a4
{
  _BOOL4 v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;

  v4 = a4;
  if (a4)
    v5 = 0.539473712;
  else
    v5 = 0.545454562;
  switch(sub_21A671298(*(uint64_t *)&a3))
  {
    case 3u:
      v6 = !v4;
      v7 = 0.55799371;
      v8 = 0.552631557;
      goto LABEL_10;
    case 4u:
      v6 = !v4;
      v7 = 0.492163002;
      v8 = 0.491228074;
      goto LABEL_10;
    case 5u:
      v6 = !v4;
      v7 = 0.50470221;
      v8 = 0.495614022;
      goto LABEL_10;
    case 6u:
    case 0xAu:
      v6 = !v4;
      v7 = 0.470219433;
      v8 = 0.469298244;
      goto LABEL_10;
    case 7u:
    case 8u:
      v6 = !v4;
      v7 = 0.420062691;
      v8 = 0.412280709;
LABEL_10:
      if (v6)
        v5 = v7;
      else
        v5 = v8;
      break;
    default:
      return v5;
  }
  return v5;
}

+ (double)informationDiagramBaseImageRightEdgeInset:(unsigned int)a3 small:(BOOL)a4
{
  _BOOL4 v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;

  v4 = a4;
  if (a4)
    v5 = 16.0;
  else
    v5 = 23.0;
  switch(sub_21A671298(*(uint64_t *)&a3))
  {
    case 3u:
      v6 = !v4;
      v7 = 13.0;
      v8 = 9.0;
      goto LABEL_11;
    case 4u:
      v6 = !v4;
      v7 = 54.0;
      v8 = 38.5;
      goto LABEL_11;
    case 5u:
      v6 = !v4;
      v7 = 23.5;
      v8 = 16.5;
      goto LABEL_11;
    case 6u:
      v6 = !v4;
      v7 = 16.0;
      v8 = 11.5;
      goto LABEL_11;
    case 7u:
    case 8u:
      v6 = !v4;
      v7 = 72.5;
      v8 = 52.5;
      goto LABEL_11;
    case 0xAu:
      v6 = !v4;
      v7 = 48.0;
      v8 = 35.0;
LABEL_11:
      if (v6)
        v5 = v7;
      else
        v5 = v8;
      break;
    default:
      return v5;
  }
  return v5;
}

+ (id)imageForInformationalDiagramNamed:(id)a3 small:(BOOL)a4
{
  _BOOL4 v4;
  const char *v6;
  void *v7;

  v4 = a4;
  v7 = (void *)objc_opt_class();
  if (v4)
    a3 = (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("%@-Small"), a3);
  return (id)objc_msgSend_imageNamed_(v7, v6, (uint64_t)a3);
}

+ (id)imageNameForInformationalDiagram:(unsigned int)a3 subProductID:(unsigned int)a4 deviceKind:(int)a5 audioImage:(BOOL)a6 small:(BOOL)a7 useDataCache:(BOOL *)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v9 = a7;
  v10 = a6;
  v12 = *(_QWORD *)&a3;
  v13 = sub_21A671298(*(uint64_t *)&a3);
  if (a8)
    *a8 = 0;
  switch(v13)
  {
    case 3:
      v15 = objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v14, (uint64_t)CFSTR("AirPort-Extreme-G"));
      goto LABEL_19;
    case 4:
      v16 = (void *)MEMORY[0x24BDD16A8];
      v17 = CFSTR("AirPort-Express");
      v18 = CFSTR("AirPort-Express-Audio");
      goto LABEL_16;
    case 5:
      v15 = objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v14, (uint64_t)CFSTR("AirPort-Extreme"));
      goto LABEL_19;
    case 6:
      v15 = objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v14, (uint64_t)CFSTR("Time-Capsule"));
      goto LABEL_19;
    case 7:
    case 8:
      v15 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD16A8], v14, (uint64_t)CFSTR("AirPort-%d"), 8);
      goto LABEL_19;
    case 10:
      v16 = (void *)MEMORY[0x24BDD16A8];
      v17 = CFSTR("AirPortEx");
      v18 = CFSTR("AirPortEx-Audio");
LABEL_16:
      if (v10)
        v15 = objc_msgSend_stringWithString_(v16, v14, (uint64_t)v18);
      else
        v15 = objc_msgSend_stringWithString_(v16, v14, (uint64_t)v17);
      goto LABEL_19;
    default:
      if ((_DWORD)v12)
      {
        v19 = sub_21A731D4C();
        if (a8)
          *a8 = v19 != 0;
        if (v19)
        {
          v20 = v10
              ? objc_msgSend_stringWithFormat_(MEMORY[0x24BDD16A8], v14, (uint64_t)CFSTR("%d%s%s%s%s"), v12, "-", "Info", "-", "Audio"): objc_msgSend_stringWithFormat_(MEMORY[0x24BDD16A8], v14, (uint64_t)CFSTR("%d%s%s"), v12, "-", "Info");
          v21 = (void *)v20;
          if (v20)
            goto LABEL_20;
        }
      }
      if ((a5 - 2) >= 2)
      {
        if (a5 == 1)
          v15 = objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v14, (uint64_t)CFSTR("Unknown-Device"));
        else
          v15 = objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v14, (uint64_t)CFSTR("Generic-Router"));
      }
      else
      {
        v15 = objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v14, (uint64_t)CFSTR("Generic-AirPlay"));
      }
LABEL_19:
      v21 = (void *)v15;
LABEL_20:
      if (v9)
        objc_msgSend_appendString_(v21, v14, (uint64_t)CFSTR("-Small"));
      objc_msgSend_appendString_(v21, v14, (uint64_t)CFSTR(".png"));
      return v21;
  }
}

+ (id)insetImageForInformationalDiagram:(unsigned int)a3
{
  return (id)objc_msgSend_insetImageForInformationalDiagram_deviceKind_audioImage_small_(ImageStore, a2, *(uint64_t *)&a3, 1, 0, 0);
}

+ (id)insetImageForInformationalDiagram:(unsigned int)a3 deviceKind:(int)a4 audioImage:(BOOL)a5 small:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  unsigned int v14;
  const char *v15;
  int v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  const char *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a6;
  v7 = a5;
  v9 = *(_QWORD *)&a3;
  v10 = (void *)MEMORY[0x24BDD1488];
  v11 = objc_opt_class();
  v13 = objc_msgSend_bundleForClass_(v10, v12, v11);
  v14 = sub_21A671298(v9);
  v16 = sub_21A671268(v9);
  if (v14 > 0xA)
    goto LABEL_16;
  if (((1 << v14) & 0x1A0) != 0)
  {
    v17 = (void *)MEMORY[0x24BDD16A8];
LABEL_7:
    v20 = CFSTR("Inset-Regular-WAN");
    v21 = CFSTR("Inset-Regular-Ethernet");
    goto LABEL_8;
  }
  if (((1 << v14) & 0x410) != 0)
  {
    v17 = (void *)MEMORY[0x24BDD16A8];
    if (v7)
    {
LABEL_5:
      v18 = objc_msgSend_stringWithString_(v17, v15, (uint64_t)CFSTR("Inset-Regular-Audio"));
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if (v14 != 6)
  {
LABEL_16:
    v25 = sub_21A731D4C();
    if (v25)
    {
      v26 = v25;
      if (v7)
        v27 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD16A8], v15, (uint64_t)CFSTR("%d%s%s%s%s"), v9, "-", "Inset", "-", "Audio");
      else
        v27 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD16A8], v15, (uint64_t)CFSTR("%d%s%s"), v9, "-", "Inset");
      v22 = (void *)v27;
      v13 = v26;
      if (v6)
        goto LABEL_12;
      goto LABEL_13;
    }
    v17 = (void *)MEMORY[0x24BDD16A8];
    if ((a4 & 0xFFFFFFFE) == 2)
      goto LABEL_5;
    goto LABEL_7;
  }
  v17 = (void *)MEMORY[0x24BDD16A8];
  v20 = CFSTR("Inset-Time-Capsule-WAN");
  v21 = CFSTR("Inset-Time-Capsule-Ethernet");
LABEL_8:
  if (v16 == 1)
    v18 = objc_msgSend_stringWithString_(v17, v15, (uint64_t)v21);
  else
    v18 = objc_msgSend_stringWithString_(v17, v15, (uint64_t)v20);
LABEL_11:
  v22 = (void *)v18;
  if (v6)
LABEL_12:
    objc_msgSend_appendString_(v22, v19, (uint64_t)CFSTR("-Small"));
LABEL_13:
  NSLog(CFSTR("Inset image name is %@"), v22);
  return (id)objc_msgSend_imageNamed_inBundle_ofType_(ImageStore, v23, (uint64_t)v22, v13, CFSTR("png"));
}

+ (id)imageForBaseStationWithProductID:(unsigned int)a3 subProductID:(unsigned int)a4 deviceKind:(int)a5 small:(BOOL)a6 cropped:(BOOL)a7 threeDee:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a4;
  v13 = *(_QWORD *)&a3;
  do
  {
    v14 = objc_msgSend_imageNameForProductID_subProductID_deviceKind_small_cropped_threeDee_(ImageStore, a2, v13, v12, v11, v10, v9, v8);
    v15 = (void *)objc_opt_class();
    v16 = (void *)MEMORY[0x24BDD1488];
    v17 = objc_opt_class();
    v19 = objc_msgSend_bundleForClass_(v16, v18, v17);
    v21 = objc_msgSend_imageNamed_inBundle_(v15, v20, v14, v19);
    v26 = (void *)v21;
    if (!(_DWORD)v13)
      break;
    v13 = 0;
  }
  while (!v21);
  if (dword_2550EEB90 <= 800 && (dword_2550EEB90 != -1 || sub_21A69876C((uint64_t)&dword_2550EEB90, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EEB90, (uint64_t)"+[ImageStore imageForBaseStationWithProductID:subProductID:deviceKind:small:cropped:threeDee:]", 800, (uint64_t)"returning image %@\n", v22, v23, v24, v25, (uint64_t)v26);
  return v26;
}

+ (CGImage)cgImageFromImage:(id)a3 forContentsScale:(double)a4
{
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CGImage *v19;

  if (dword_2550EEB90 <= 800 && (dword_2550EEB90 != -1 || sub_21A69876C((uint64_t)&dword_2550EEB90, 0x320u)))
  {
    objc_msgSend_size(a3, a2, (uint64_t)a3);
    v6 = v5;
    objc_msgSend_size(a3, v7, v8);
    objc_msgSend_scale(a3, v9, v10);
    sub_21A698FDC((uint64_t)&dword_2550EEB90, (uint64_t)"+[ImageStore cgImageFromImage:forContentsScale:]", 800, (uint64_t)"image width = %.1f  height = %.1f  scale = %.1f\n", v11, v12, v13, v14, v6);
  }
  v19 = (CGImage *)objc_msgSend_CGImage(a3, a2, (uint64_t)a3);
  if (dword_2550EEB90 <= 800 && (dword_2550EEB90 != -1 || sub_21A69876C((uint64_t)&dword_2550EEB90, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EEB90, (uint64_t)"+[ImageStore cgImageFromImage:forContentsScale:]", 800, (uint64_t)"returning cgImage %@\n", v15, v16, v17, v18, (uint64_t)v19);
  return v19;
}

@end
