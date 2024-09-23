@implementation PKInputPointUtility

+ (unint64_t)activeInputPropertiesFromTouchProperties:(int64_t)a3
{
  return a3 & 0x10 | (4 * (a3 & 1)) | ((unint64_t)a3 >> 1) & 3;
}

+ ($78FB54F4A6B442EA15B736438C71FAD1)drawingInputPoint:(SEL)a3 view:(CGPoint)a4 touch:(id)a5 predicted:(id)a6 activeInputProperties:(BOOL)a7
{
  char v8;
  CGFloat y;
  CGFloat x;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int64_t v28;
  NSObject *v29;
  double v30;
  NSObject *v31;
  void *v32;
  void *v33;
  double v34;
  unint64_t v35;
  $78FB54F4A6B442EA15B736438C71FAD1 *result;
  uint8_t v37[16];
  uint8_t v38[16];
  uint8_t buf[16];

  v8 = a8;
  y = a4.y;
  x = a4.x;
  v15 = a5;
  v16 = a6;
  objc_msgSend(v16, "PK_rollAngle");
  v18 = v17;
  objc_msgSend(v16, "maximumPossibleForce");
  v19 = -1.0;
  if (v20 > 0.0)
  {
    objc_msgSend(v16, "force");
    if (fabs(v21) == INFINITY)
    {
      v23 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE213000, v23, OS_LOG_TYPE_ERROR, "Got non-finite force from UITouch", buf, 2u);
      }

      objc_msgSend(v16, "maximumPossibleForce");
      v19 = v24 * 0.5;
    }
    else
    {
      objc_msgSend(v16, "force");
      v19 = v22;
    }
  }
  if (objc_msgSend(v16, "type") == 2)
  {
    v25 = 0.0;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v16, "azimuthAngleInView:", v15);
      if (fabs(v26) == INFINITY)
      {
        v29 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v38 = 0;
          _os_log_error_impl(&dword_1BE213000, v29, OS_LOG_TYPE_ERROR, "Got non-finite azimuthAngle from UITouch", v38, 2u);
        }

      }
      else
      {
        v25 = v26 + -3.14159265;
      }
    }
    v27 = 0.785398163;
    if ((v8 & 2) != 0)
    {
      objc_msgSend(v16, "altitudeAngle");
      if (fabs(v30) == INFINITY)
      {
        v31 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v37 = 0;
          _os_log_error_impl(&dword_1BE213000, v31, OS_LOG_TYPE_ERROR, "Got non-finite altitudeAngle from UITouch", v37, 2u);
        }

      }
      else
      {
        v27 = 1.57079633 - v30;
      }
    }
    objc_msgSend(v16, "estimationUpdateIndex");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v16, "estimationUpdateIndex");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v33, "integerValue");

    }
    else
    {
      v28 = -1;
    }
  }
  else
  {
    v27 = 0.0;
    v28 = -1;
    v25 = 0.0;
  }
  *(_OWORD *)&retstr->var11 = 0u;
  *(_OWORD *)&retstr->var13 = 0u;
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  retstr->var0.var0.x = x;
  retstr->var0.var0.y = y;
  retstr->var1 = v19;
  retstr->var2 = v25;
  retstr->var3 = v27;
  retstr->var5 = 0.0;
  retstr->var6 = 0.0;
  retstr->var4 = 0.0;
  objc_msgSend(v16, "timestamp");
  retstr->var7 = v34;
  retstr->var8 = a7;
  retstr->var9 = v28;
  retstr->var10 = 0.0;
  if ((objc_msgSend(v16, "estimatedProperties") & 2) != 0)
    LOBYTE(v35) = 1;
  else
    v35 = ((unint64_t)objc_msgSend(v16, "estimatedProperties") >> 2) & 1;
  retstr->var11 = v35;
  retstr->var12 = v18;
  retstr->var13 = objc_msgSend(a2, "activeInputPropertiesFromTouchProperties:", objc_msgSend(v16, "estimatedProperties"));
  retstr->var14 = objc_msgSend(a2, "activeInputPropertiesFromTouchProperties:", objc_msgSend(v16, "estimatedPropertiesExpectingUpdates"));

  return result;
}

@end
