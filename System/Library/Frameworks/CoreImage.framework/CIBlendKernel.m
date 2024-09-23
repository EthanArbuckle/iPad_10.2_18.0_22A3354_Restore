@implementation CIBlendKernel

+ (CIBlendKernel)componentAdd
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_add);
}

+ (CIBlendKernel)componentMultiply
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_multiply);
}

+ (CIBlendKernel)componentMin
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_min);
}

+ (CIBlendKernel)componentMax
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_max);
}

+ (CIBlendKernel)clear
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_clear);
}

+ (CIBlendKernel)source
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_src);
}

+ (CIBlendKernel)destination
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_dst);
}

+ (CIBlendKernel)sourceOver
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_srcOver);
}

+ (CIBlendKernel)destinationOver
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_dstOver);
}

+ (CIBlendKernel)sourceIn
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_srcIn);
}

+ (CIBlendKernel)destinationIn
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_dstIn);
}

+ (CIBlendKernel)sourceOut
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_srcOut);
}

+ (CIBlendKernel)destinationOut
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_dstOut);
}

+ (CIBlendKernel)sourceAtop
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_srcAtop);
}

+ (CIBlendKernel)destinationAtop
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_dstAtop);
}

+ (CIBlendKernel)exclusiveOr
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_exclusiveOr);
}

+ (CIBlendKernel)multiply
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_multiplyBlendMode);
}

+ (CIBlendKernel)screen
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_screenBlendMode);
}

+ (CIBlendKernel)overlay
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_overlayBlendMode);
}

+ (CIBlendKernel)darken
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_darkenBlendMode);
}

+ (CIBlendKernel)lighten
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_lightenBlendMode);
}

+ (CIBlendKernel)colorDodge
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_colorDodgeBlendMode);
}

+ (CIBlendKernel)colorBurn
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_colorBurnBlendMode);
}

+ (CIBlendKernel)hardLight
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_hardLightBlendMode);
}

+ (CIBlendKernel)softLight
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_softLightBlendMode);
}

+ (CIBlendKernel)difference
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_differenceBlendMode);
}

+ (CIBlendKernel)exclusion
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_exclusionBlendMode);
}

+ (CIBlendKernel)hue
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_hueBlendMode);
}

+ (CIBlendKernel)saturation
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_saturationBlendMode);
}

+ (CIBlendKernel)color
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_colorBlendMode);
}

+ (CIBlendKernel)luminosity
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_luminosityBlendMode);
}

+ (CIBlendKernel)subtract
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_subtractBlendMode);
}

+ (CIBlendKernel)divide
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_divideBlendMode);
}

+ (CIBlendKernel)linearBurn
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_linearBurnBlendMode);
}

+ (CIBlendKernel)linearDodge
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_linearDodgeBlendMode);
}

+ (CIBlendKernel)vividLight
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_vividLightBlendMode);
}

+ (CIBlendKernel)linearLight
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_linearLightBlendMode);
}

+ (CIBlendKernel)pinLight
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_pinLightBlendMode);
}

+ (CIBlendKernel)hardMix
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_hardMixBlendMode);
}

+ (CIBlendKernel)darkerColor
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_darkerColorBlendMode);
}

+ (CIBlendKernel)lighterColor
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_lighterColorBlendMode);
}

+ (id)plusDarker
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_plusDarker);
}

+ (id)plusLighter
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_plusLighter);
}

+ (CIBlendKernel)kernelWithString:(NSString *)string
{
  NSObject *v5;
  CIBlendKernel *v6;
  NSString *v7;
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543362;
    v14 = objc_msgSend(a1, "description");
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString\", "%{public}@", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __34__CIBlendKernel_kernelWithString___block_invoke;
  v11 = &unk_1E2EC3CC8;
  v12 = a1;
  if (check_cikl_string(string, "+[CIBlendKernel kernelWithString:]"))
  {
    v6 = -[CIBlendKernel initWithString:]([CIBlendKernel alloc], "initWithString:", string);
    if (v6)
    {
      v7 = (NSString *)objc_msgSend((id)objc_opt_class(), "description");
      CoreAnalytics(v7, CFSTR("kernelWithString"), 1);
    }
  }
  else
  {
    v6 = 0;
  }
  v10((uint64_t)v9);
  return v6;
}

void __34__CIBlendKernel_kernelWithString___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "description");
    v4 = 138543362;
    v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString\", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (CIBlendKernel)initWithString:(id)a3
{
  if (check_cikl_string((NSString *)a3, "-[CIBlendKernel initWithString:]"))
    return -[CIBlendKernel initWithString:extentType:](self, "initWithString:extentType:", a3, 0);

  return 0;
}

+ (id)cachedKernelWithString:(id)a3 extentType:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v4 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    v20 = objc_msgSend(a1, "description");
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"cachedKernelWithString:extentType\", "%{public}@", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v16 = __51__CIBlendKernel_cachedKernelWithString_extentType___block_invoke;
  v17 = &unk_1E2EC3CC8;
  v18 = a1;
  v8 = (void *)objc_msgSend(a1, "cache");
  objc_sync_enter(v8);
  v9 = (void *)objc_msgSend(v8, "objectForKey:", a3);
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v10 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithString:extentType:", a3, v4);
    v12 = (uint64_t)v10;
    if (!v10)
      v12 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    objc_msgSend(v8, "setObject:forKey:", v12, a3);
  }
  objc_sync_exit(v8);
  if (v10 == (id)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
    v13 = 0;
  else
    v13 = v10;
  v16((uint64_t)v15);
  return v13;
}

void __51__CIBlendKernel_cachedKernelWithString_extentType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "description");
    v4 = 138543362;
    v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"cachedKernelWithString:extentType\", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (CIBlendKernel)kernelWithInternalRepresentation:(const void *)a3
{
  if ((*(unsigned int (**)(const void *, SEL))(*(_QWORD *)a3 + 16))(a3, a2) == 62)
    return (CIBlendKernel *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithInternalRepresentation:", a3);
  else
    return 0;
}

+ (CIBlendKernel)kernelWithString:(id)a3 extentType:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  CIBlendKernel *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)&a4;
  v13 = *MEMORY[0x1E0C80C00];
  v7 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    v12 = objc_msgSend(a1, "description");
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString:extentType\", "%{public}@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[3] = &unk_1E2EC3CC8;
  v10[4] = a1;
  v8 = -[CIBlendKernel initWithString:extentType:]([CIBlendKernel alloc], "initWithString:extentType:", a3, v4);
  __45__CIBlendKernel_kernelWithString_extentType___block_invoke((uint64_t)v10);
  return v8;
}

void __45__CIBlendKernel_kernelWithString_extentType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "description");
    v4 = 138543362;
    v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString:extentType\", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (CIBlendKernel)initWithString:(id)a3 extentType:(int)a4
{
  uint64_t v4;
  CIBlendKernel *v7;
  CIBlendKernel *v8;
  id v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  if (!check_cikl_string((NSString *)a3, "-[CIBlendKernel initWithString:extentType:]"))
  {

    return 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)CIBlendKernel;
  v7 = -[CIColorKernel initWithString:](&v11, sel_initWithString_, a3);
  v8 = v7;
  if (v7)
  {
    v9 = -[CIKernel parameters](v7, "parameters");
    if (objc_msgSend(v9, "count") == 2
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "valueForKey:", CFSTR("CIAttributeClass")), "isEqual:", CFSTR("CISampler"))&& objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 1), "valueForKey:", CFSTR("CIAttributeClass")), "isEqual:", CFSTR("CISampler")))
    {
      (*(void (**)(void *, uint64_t))(*(_QWORD *)v8->super.super._priv + 80))(v8->super.super._priv, v4);
      return v8;
    }

    return 0;
  }
  return v8;
}

- (BOOL)getBlendBehaviorBit:(int)a3
{
  _DWORD *priv;

  priv = self->super.super._priv;
  return priv && (priv[43] & a3) != 0;
}

- (void)setBlendBehaviorBit:(int)a3 value:(BOOL)a4
{
  void *priv;

  priv = self->super.super._priv;
  if (priv)
    (*(void (**)(void *, _QWORD, BOOL))(*(_QWORD *)priv + 88))(priv, *(_QWORD *)&a3, a4);
}

- (BOOL)isBackIfForeIsClear
{
  return -[CIBlendKernel getBlendBehaviorBit:](self, "getBlendBehaviorBit:", 1);
}

- (BOOL)isForeIfBackIsClear
{
  return -[CIBlendKernel getBlendBehaviorBit:](self, "getBlendBehaviorBit:", 2);
}

- (BOOL)isClearIfForeIsClear
{
  return -[CIBlendKernel getBlendBehaviorBit:](self, "getBlendBehaviorBit:", 4);
}

- (BOOL)isClearIfBackIsClear
{
  return -[CIBlendKernel getBlendBehaviorBit:](self, "getBlendBehaviorBit:", 8);
}

- (void)setIsBackIfForeIsClear:(BOOL)a3
{
  -[CIBlendKernel setBlendBehaviorBit:value:](self, "setBlendBehaviorBit:value:", 1, a3);
}

- (void)setIsForeIfBackIsClear:(BOOL)a3
{
  -[CIBlendKernel setBlendBehaviorBit:value:](self, "setBlendBehaviorBit:value:", 2, a3);
}

- (void)setIsClearIfForeIsClear:(BOOL)a3
{
  -[CIBlendKernel setBlendBehaviorBit:value:](self, "setBlendBehaviorBit:value:", 4, a3);
}

- (void)setIsClearIfBackIsClear:(BOOL)a3
{
  -[CIBlendKernel setBlendBehaviorBit:value:](self, "setBlendBehaviorBit:value:", 8, a3);
}

- (CIImage)applyWithForeground:(CIImage *)foreground background:(CIImage *)background
{
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double x;
  double v17;
  double y;
  double v19;
  double width;
  double v21;
  double height;
  int v24;
  _QWORD v25[3];
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v25[2] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](foreground, "extent");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CIImage extent](background, "extent");
  x = v15;
  y = v17;
  width = v19;
  height = v21;
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  if (CGRectIsEmpty(v26) && -[CIBlendKernel isBackIfForeIsClear](self, "isBackIfForeIsClear"))
    return background;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  if (!CGRectIsEmpty(v27) || !-[CIBlendKernel isForeIfBackIsClear](self, "isForeIfBackIsClear"))
  {
    v28.origin.x = v8;
    v28.origin.y = v10;
    v28.size.width = v12;
    v28.size.height = v14;
    if (CGRectIsEmpty(v28) && -[CIBlendKernel isClearIfForeIsClear](self, "isClearIfForeIsClear"))
      return +[CIImage emptyImage](CIImage, "emptyImage");
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    if (CGRectIsEmpty(v29))
    {
      if (-[CIBlendKernel isClearIfBackIsClear](self, "isClearIfBackIsClear"))
        return +[CIImage emptyImage](CIImage, "emptyImage");
    }
    v24 = *((_DWORD *)self->super.super._priv + 42);
    if (v24 == 3)
      goto LABEL_18;
    if (v24 == 1)
    {
      v32.origin.x = v8;
      v32.origin.y = v10;
      v32.size.width = v12;
      v32.size.height = v14;
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      v31 = CGRectIntersection(v32, v34);
    }
    else
    {
      if (v24)
      {
        x = v8;
        y = v10;
        width = v12;
        height = v14;
        goto LABEL_18;
      }
      v30.origin.x = v8;
      v30.origin.y = v10;
      v30.size.width = v12;
      v30.size.height = v14;
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      v31 = CGRectUnion(v30, v33);
    }
    x = v31.origin.x;
    y = v31.origin.y;
    width = v31.size.width;
    height = v31.size.height;
LABEL_18:
    v25[0] = foreground;
    v25[1] = background;
    return -[CIColorKernel applyWithExtent:arguments:](self, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2), x, y, width, height);
  }
  return foreground;
}

- (CIImage)applyWithForeground:(CIImage *)foreground background:(CIImage *)background colorSpace:(CGColorSpaceRef)colorSpace
{
  if (colorSpace)
    return -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:](-[CIBlendKernel applyWithForeground:background:](self, "applyWithForeground:background:", -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](foreground, "imageByColorMatchingWorkingSpaceToColorSpace:", colorSpace), -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](background, "imageByColorMatchingWorkingSpaceToColorSpace:", colorSpace)), "imageByColorMatchingColorSpaceToWorkingSpace:", colorSpace);
  else
    return -[CIBlendKernel applyWithForeground:background:](self, "applyWithForeground:background:", foreground, background);
}

@end
