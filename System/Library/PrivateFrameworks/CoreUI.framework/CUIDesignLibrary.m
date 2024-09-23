@implementation CUIDesignLibrary

+ (id)colorWithTraits:(CUIDesignColorTraits *)a3 error:(id *)a4
{
  return objc_msgSend(a1, "colorWithName:designSystem:palette:colorScheme:contrast:styling:displayGamut:hierarchyLevel:error:", a3->var0, a3->var1, a3->var2, a3->var3, a3->var4, a3->var5, a3->var6, 0, a4);
}

+ (id)colorWithName:(int64_t)a3 designSystem:(int64_t)a4 palette:(int64_t)a5 colorScheme:(int64_t)a6 contrast:(int64_t)a7 styling:(int64_t)a8 displayGamut:(int64_t)a9 error:(id *)a10
{
  return objc_msgSend(a1, "colorWithName:designSystem:palette:colorScheme:contrast:styling:displayGamut:hierarchyLevel:error:", a3, a4, a5, a6, a7, a8, a9, 0, a10);
}

+ (CUIDesignColorTraits2)designColorTraitsWithName:(SEL)a3 designSystem:(int64_t)a4 palette:(int64_t)a5 colorScheme:(int64_t)a6 contrast:(int64_t)a7 styling:(int64_t)a8 displayGamut:(int64_t)a9 hierarchyLevel:(int64_t)a10
{
  retstr->var0 = 1;
  retstr->var1 = a4;
  retstr->var2 = a5;
  retstr->var3 = a6;
  retstr->var4 = a7;
  retstr->var5 = a8;
  retstr->var6 = a9;
  retstr->var7 = a10;
  retstr->var8 = a11;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var11 = 0u;
  return result;
}

+ (id)colorWithTraits2:(CUIDesignColorTraits2 *)a3 error:(id *)a4
{
  return objc_msgSend(a1, "colorWithName:designSystem:palette:colorScheme:contrast:styling:displayGamut:hierarchyLevel:error:", a3->var1, a3->var2, a3->var3, a3->var4, a3->var5, a3->var6, a3->var7, a3->var8, a4);
}

+ (id)colorWithName:(int64_t)a3 designSystem:(int64_t)a4 palette:(int64_t)a5 colorScheme:(int64_t)a6 contrast:(int64_t)a7 styling:(int64_t)a8 displayGamut:(int64_t)a9 hierarchyLevel:(int64_t)a10 error:(id *)a11
{
  id result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;

  kdebug_trace(726663173, 23, a3, a4, a5);
  result = +[CUIDesignLibraryCompositeCatalog compositeCatalogForDesignSystem:colorScheme:contrast:styling:error:](CUIDesignLibraryCompositeCatalog, "compositeCatalogForDesignSystem:colorScheme:contrast:styling:error:", a4, a6, a7, a8, a11);
  if (result)
  {
    v24 = result;
    _CUILog(3, (uint64_t)"-[CUIDesignLibrary colorWithName:%d designSystem:%d palette:%d colorScheme:%d contrast:%d styling:%d displayGamut:%d error:]", v18, v19, v20, v21, v22, v23, a3);
    v25 = objc_msgSend(v24, "colorWithName:palette:displayGamut:hierarchyLevel:error:", a3, a5, a9, a10, a11);
    kdebug_trace(726663174, 23, a6, a7, a8);
    return v25;
  }
  return result;
}

@end
