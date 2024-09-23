@implementation CUICatalog

- (id)_private_resolvedRenditionKeyFromThemeRef:(void *)a3 withBaseKey:(id)a4 scaleFactor:(uint64_t)a5 deviceIdiom:(void *)a6 deviceSubtype:(uint64_t)a7 displayGamut:(uint64_t)a8 layoutDirection:(double)a9 sizeClassHorizontal:(uint64_t)a10 sizeClassVertical:(uint64_t)a11 memoryClass:(uint64_t)a12 graphicsClass:(void *)a13 graphicsFallBackOrder:(void *)a14 deviceSubtypeFallBackOrder:(uint64_t)a15 localizationIdentifier:(uint64_t)a16 adjustRenditionKeyWithBlock:
{
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  char v52;
  unint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  unsigned __int8 v60;
  id v61;
  unint64_t v62;
  void *v63;
  char v64;
  id v65;
  id v66;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  id v82;
  char *v83;
  uint64_t v84;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v93 = a5;
  if (!a1)
    return 0;
  v22 = a10;
  v90 = 0;
  v91 = 0;
  v73 = CUIMaxScaleForTargetPlatform((uint64_t)objc_msgSend(a1, "platform"));
  v23 = CUICurrentDeploymentVersionForTargetPlatform();
  v24 = (char *)objc_msgSend(a13, "count");
  v74 = (char *)objc_msgSend(a14, "count");
  objc_msgSend(+[CUIRuntimeStatistics sharedRuntimeStatistics](CUIRuntimeStatistics, "sharedRuntimeStatistics"), "incrementStaticsInitialLookup");
  v87 = a12;
  v83 = v24;
  if (a12 && !v24)
  {
    _CUILog(4, (uint64_t)"-[CUICatalog _resolvedRenditionKeyFromThemeRef:...] got passed a graphicsClass '%d' but No graphicsFallbacks ignoring the graphicsClass", v25, v26, v27, v28, v29, v30, a12);
    v87 = 0;
  }
  CUIValidateIdiomSubtypes((uint64_t)a4, &v93, v25, v26, v27, v28, v29, v30);
  v32 = 0;
  v84 = (uint64_t)a9;
  v78 = v93;
  v92 = v23;
  while (__memorySearchValues[v32] != a11)
  {
    if (++v32 == 9)
    {
      v32 = 0;
      break;
    }
  }
  v33 = (void *)_LookupStructuredThemeProvider(a2, v31);
  v34 = objc_msgSend(a3, "copy");
  objc_msgSend(v34, "setThemeMemoryClass:", __memorySearchValues[v32]);
  objc_msgSend(v34, "setThemeScale:", v84);
  objc_msgSend(v34, "setThemeIdiom:", a4);
  objc_msgSend(v34, "setThemeSubtype:", v78);
  objc_msgSend(v34, "setThemeDisplayGamut:", a6);
  objc_msgSend(v34, "setThemeDeploymentTarget:", v92);
  objc_msgSend(v34, "setThemeDirection:", a7);
  objc_msgSend(v34, "setThemeSizeClassHorizontal:", a8);
  objc_msgSend(v34, "setThemeSizeClassVertical:", a10);
  objc_msgSend(v34, "setThemeGraphicsClass:", v87);
  objc_msgSend(v34, "setThemeLocalization:", a15);
  if (a16)
    (*(void (**)(void))(a16 + 16))();
  v35 = objc_msgSend(v33, "copyLookupKeySignatureForKey:", objc_msgSend(v34, "keyList"));

  v36 = objc_msgSend(a1, "lookupCache");
  v37 = objc_msgSend(a1, "negativeCache");
  v38 = objc_msgSend(v36, "objectForKey:", v35);
  if (v38)
  {
    v39 = v38;

    return v39;
  }
  v72 = v36;
  if (objc_msgSend(v37, "objectForKey:", v35))
  {

    return 0;
  }
  v69 = v37;
  v71 = v35;
  v77 = objc_msgSend(v33, "renditionInfoForIdentifier:", (unsigned __int16)objc_msgSend(a3, "themeIdentifier"));
  if (!v77)
  {
    v43 = a7;
    v40 = v87;
    v41 = v78;
    v42 = a6;
    if (v32 < 0)
      goto LABEL_139;
    goto LABEL_48;
  }
  v40 = v87;
  v41 = v78;
  v42 = a6;
  if (v78 && !objc_msgSend(v77, "diverseContentPresentForAttribute:", 16))
    v41 = 0;
  if (a8 && !objc_msgSend(v77, "diverseContentPresentForAttribute:", 20))
    a8 = 0;
  if (a10 && !objc_msgSend(v77, "diverseContentPresentForAttribute:", 21))
    v22 = 0;
  if (a6 && !objc_msgSend(v77, "diverseContentPresentForAttribute:", 24))
    v42 = 0;
  if (v92)
  {
    if ((objc_msgSend(v77, "diverseContentPresentForAttribute:", 25) & 1) != 0)
    {
      if (!objc_msgSend(v77, "attributePresent:withValue:", 25, (unsigned __int16)v92))
      {
        --v92;
        objc_msgSend(v77, "decrementValue:forAttribute:", &v92, 25);
      }
    }
    else
    {
      v92 = 0;
    }
  }
  if (v32 && !objc_msgSend(v77, "diverseContentPresentForAttribute:", 22))
    v32 = 0;
  if (v87 && !objc_msgSend(v77, "diverseContentPresentForAttribute:", 23))
    v40 = 0;
  if (!a7)
  {
    v43 = 0;
    if (v32 < 0)
      goto LABEL_139;
    goto LABEL_48;
  }
  v44 = objc_msgSend(v77, "diverseContentPresentForAttribute:", 4);
  v43 = a7;
  if (!v44)
    v43 = 0;
  if ((v32 & 0x8000000000000000) == 0)
  {
LABEL_48:
    v79 = (void *)v41;
    v88 = v40;
    v45 = 0;
    v46 = v22 | a8;
    v47 = 4;
    if (v22 | a8)
      v48 = 1;
    else
      v48 = 4;
    v76 = v48;
    v86 = v43;
    if (v43 == 4)
      v47 = 5;
    v70 = v47;
    v68 = (uint64_t)a9;
    while (1)
    {
      v90 = 0x7FFFFFFFFFFFFFFFLL;
      v49 = v79;
      while (2)
      {
        v50 = v49;
        objc_msgSend(a3, "setThemeDeploymentTarget:", v92);
        v80 = __memorySearchValues[v32];
        objc_msgSend(a3, "setThemeMemoryClass:");
        v82 = v50;
        objc_msgSend(a3, "setThemeSubtype:", v50);
        objc_msgSend(a3, "setThemeGraphicsClass:", v88);
        objc_msgSend(a3, "setThemeScale:", v84);
        objc_msgSend(a3, "setThemeIdiom:", a4);
        objc_msgSend(a3, "setThemeDisplayGamut:", v42);
        objc_msgSend(a3, "setThemeDirection:", v86);
        objc_msgSend(a3, "setThemeSizeClassHorizontal:", a8);
        objc_msgSend(a3, "setThemeSizeClassVertical:", v22);
        objc_msgSend(a3, "setThemeLocalization:", a15);
        if (a16)
          (*(void (**)(void))(a16 + 16))();
        v91 = 0x7FFFFFFFFFFFFFFFLL;
        while (2)
        {
          if ((objc_msgSend(v33, "canGetRenditionWithKey:", objc_msgSend(a3, "keyList")) & 1) != 0)
          {
LABEL_59:
            v51 = v45;
LABEL_60:
            if (!a3)
            {
              v52 = 1;
              v45 = v51;
              goto LABEL_62;
            }
            v39 = objc_msgSend(a3, "copy");
            objc_msgSend(v72, "setObject:forKey:", v39, v71);

            v66 = v39;
            return v39;
          }
          v75 = -1;
          v55 = v76;
          while (1)
          {
            while (1)
            {
              while (1)
              {
                if (v55 == 3)
                {
                  objc_msgSend(a3, "setThemeSizeClassVertical:", 0);
                  objc_msgSend(a3, "setThemeSizeClassHorizontal:", 0);
LABEL_74:
                  v55 = 4;
                  goto LABEL_86;
                }
                if (v55 == 2)
                {
                  objc_msgSend(a3, "setThemeSizeClassVertical:", v22);
                  objc_msgSend(a3, "setThemeSizeClassHorizontal:", 0);
                  v55 = 3;
                  goto LABEL_86;
                }
                if (v55 != 1)
                  break;
                objc_msgSend(a3, "setThemeSizeClassVertical:", 0);
                objc_msgSend(a3, "setThemeSizeClassHorizontal:", a8);
                v55 = 2;
LABEL_86:
                if ((objc_msgSend(v33, "canGetRenditionWithKey:", objc_msgSend(a3, "keyList")) & 1) != 0)
                  goto LABEL_59;
              }
              if (a4 && objc_msgSend(a3, "themeIdiom") == a4)
              {
                objc_msgSend(a3, "setThemeIdiom:", 0);
                if (v46)
                {
                  objc_msgSend(a3, "setThemeSizeClassVertical:", v22);
                  objc_msgSend(a3, "setThemeSizeClassHorizontal:", a8);
                  v55 = 1;
                  goto LABEL_86;
                }
                goto LABEL_74;
              }
              if (v42 && objc_msgSend(a3, "themeDisplayGamut") == v42)
              {
                objc_msgSend(a3, "setThemeDisplayGamut:", 0);
                if (v46)
                {
                  objc_msgSend(a3, "setThemeSizeClassVertical:", v22);
                  objc_msgSend(a3, "setThemeSizeClassHorizontal:", a8);
                  v55 = 1;
                }
                else
                {
                  v55 = 4;
                }
                objc_msgSend(a3, "setThemeIdiom:", a4);
                goto LABEL_86;
              }
              if (!v86 || !objc_msgSend(a3, "themeDirection"))
                break;
              if ((v45 & 1) != 0)
                v56 = 0;
              else
                v56 = v70;
              objc_msgSend(a3, "setThemeDirection:", v56);
              if (v46)
              {
                objc_msgSend(a3, "setThemeSizeClassVertical:", v22);
                objc_msgSend(a3, "setThemeSizeClassHorizontal:", a8);
                v55 = 1;
              }
              else
              {
                v55 = 4;
              }
              objc_msgSend(a3, "setThemeIdiom:", a4);
              objc_msgSend(a3, "setThemeDisplayGamut:", v42);
              v45 = 1;
LABEL_103:
              if (objc_msgSend(v33, "canGetRenditionWithKey:", objc_msgSend(a3, "keyList")))
                goto LABEL_59;
            }
            if (v92 && objc_msgSend(a3, "themeDeploymentTarget"))
            {
              v89 = 0;
              v89 = (char *)objc_msgSend(a3, "themeDeploymentTarget");
              objc_msgSend(a3, "setThemeIdiom:", a4);
              objc_msgSend(a3, "setThemeDisplayGamut:", v42);
              objc_msgSend(a3, "setThemeDirection:", v86);
              if (v46)
              {
                objc_msgSend(a3, "setThemeSizeClassVertical:", v22);
                objc_msgSend(a3, "setThemeSizeClassHorizontal:", a8);
                v55 = 1;
              }
              else
              {
                v55 = 4;
              }
              --v89;
              objc_msgSend(v77, "decrementValue:forAttribute:", &v89, 25);
              objc_msgSend(a3, "setThemeDeploymentTarget:", v89);
              v45 = 0;
              goto LABEL_103;
            }
            objc_msgSend(a3, "setThemeIdiom:", a4);
            objc_msgSend(a3, "setThemeDisplayGamut:", v42);
            objc_msgSend(a3, "setThemeDirection:", v86);
            if (v46)
            {
              objc_msgSend(a3, "setThemeSizeClassVertical:", v22);
              objc_msgSend(a3, "setThemeSizeClassHorizontal:", a8);
              v55 = 1;
            }
            else
            {
              v55 = 4;
            }
            objc_msgSend(a3, "setThemeDeploymentTarget:", v92);
            v57 = v75 + v68;
            if (v75 < 0)
            {
              v58 = v57 < 1;
              if (v57 < 1)
                v57 = (uint64_t)a9;
              v59 = 1;
              if (!v58)
                v59 = -1;
              v75 = v59;
              goto LABEL_116;
            }
            if (v57 > v73)
              break;
LABEL_116:
            v68 = v57;
            objc_msgSend(a3, "setThemeScale:");
            v60 = objc_msgSend(v33, "canGetRenditionWithKey:", objc_msgSend(a3, "keyList"));
            v45 = 0;
            v51 = 0;
            if ((v60 & 1) != 0)
              goto LABEL_60;
          }
          v68 += v75;
          v52 = 0;
          v45 = 0;
LABEL_62:
          objc_msgSend(a3, "setThemeDeploymentTarget:", v92);
          objc_msgSend(a3, "setThemeMemoryClass:", v80);
          objc_msgSend(a3, "setThemeSubtype:", v82);
          objc_msgSend(a3, "setThemeGraphicsClass:", v88);
          objc_msgSend(a3, "setThemeScale:", v84);
          objc_msgSend(a3, "setThemeIdiom:", a4);
          objc_msgSend(a3, "setThemeDisplayGamut:", v42);
          objc_msgSend(a3, "setThemeDeploymentTarget:", v92);
          objc_msgSend(a3, "setThemeDirection:", v86);
          objc_msgSend(a3, "setThemeSizeClassHorizontal:", a8);
          objc_msgSend(a3, "setThemeSizeClassVertical:", v22);
          objc_msgSend(a3, "setThemeLocalization:", a15);
          if (a16)
            (*(void (**)(void))(a16 + 16))();
          if (v88)
          {
            if (v83)
            {
              if (v91 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v53 = 0;
                v91 = 0;
                v54 = a13;
                goto LABEL_122;
              }
              if (v91 < (unint64_t)(v83 - 1))
              {
                ++v91;
                v54 = a13;
                objc_msgSend(v77, "incrementIndex:inValues:forAttribute:", &v91, a13, 23);
                v53 = v91;
LABEL_122:
                v61 = objc_msgSend(objc_msgSend(v54, "objectAtIndex:", v53), "integerValue");
LABEL_123:
                objc_msgSend(a3, "setThemeGraphicsClass:", v61);
                continue;
              }
            }
            else if (objc_msgSend(a3, "themeGraphicsClass"))
            {
              v61 = 0;
              goto LABEL_123;
            }
          }
          break;
        }
        if (v79)
        {
          if (v74)
          {
            if (v90 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v62 = 0;
              v90 = 0;
              v63 = a14;
LABEL_132:
              v49 = objc_msgSend(objc_msgSend(v63, "objectAtIndex:", v62), "integerValue");
              continue;
            }
            if (v90 < (unint64_t)(v74 - 1))
            {
              ++v90;
              v63 = a14;
              objc_msgSend(v77, "incrementIndex:inValues:forAttribute:", &v90, a14, 16);
              v62 = v90;
              goto LABEL_132;
            }
          }
          else
          {
            v49 = 0;
            if (v82)
              continue;
          }
        }
        break;
      }
      v58 = v32-- <= 0;
      if (v58)
      {
        v64 = v52 ^ 1;
        if (!a3)
          v64 = 1;
        if ((v64 & 1) == 0)
        {
          v39 = objc_msgSend(a3, "copy");
          objc_msgSend(v72, "setObject:forKey:", v39, v71);
          v65 = v39;
          if (v39)
            goto LABEL_140;
        }
        break;
      }
    }
  }
LABEL_139:
  objc_msgSend(v69, "setObject:forKey:", v71, v71);
  v39 = 0;
LABEL_140:

  return v39;
}

id __162__CUICatalog__namedLookupWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceName_locale___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

id __68__CUICatalog_colorWithName_displayGamut_deviceIdiom_appearanceName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

id __173__CUICatalog__namedVectorImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceIdentifier_locale___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

id __237__CUICatalog__imageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_appearanceIdentifier_graphicsFallBackOrder_deviceSubtypeFallBackOrder_locale___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

id __150__CUICatalog__dataWithName_deviceIdiom_deviceSubtype_memoryClass_graphicsClass_appearanceIdentifier_graphicsFallBackOrder_deviceSubtypeFallBackOrder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

id __173__CUICatalog__namedVectorImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceIdentifier_locale___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

- (id)colorWithName:(id)a3 displayGamut:(int64_t)a4 deviceIdiom:(int64_t)a5
{
  return -[CUICatalog colorWithName:displayGamut:deviceIdiom:appearanceName:](self, "colorWithName:displayGamut:deviceIdiom:appearanceName:", a3, a4, a5, 0);
}

- (id)dataWithName:(id)a3 appearanceName:(id)a4
{
  uint64_t v6;

  v6 = 0;
  if (self && a4)
    v6 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "appearanceIdentifierForName:", a4);
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  return -[CUICatalog dataWithName:deviceIdiom:deviceSubtype:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:](self, "dataWithName:deviceIdiom:deviceSubtype:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:", a3, __getDeviceTraits___deviceIdiom, __getDeviceTraits___deviceSubtype, __getDeviceTraits___deviceMemoryClass, __getDeviceTraits___deviceGraphicsClass, v6, __getDeviceTraits___deviceGraphicsFallbackOrder, __getDeviceTraits___deviceSubtypeFallbackOrder);
}

- (id)dataWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 memoryClass:(unint64_t)a6 graphicsClass:(unint64_t)a7 appearanceIdentifier:(int64_t)a8 graphicsFallBackOrder:(id)a9 deviceSubtypeFallBackOrder:(id)a10
{
  unsigned int v17;
  id v18;

  v17 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace(726663173, 2, v17, 0, 0);
  v18 = -[CUICatalog _dataWithName:deviceIdiom:deviceSubtype:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:](self, "_dataWithName:deviceIdiom:deviceSubtype:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:", a3, a4, a5, a6, a7, a8, a9, a10);
  kdebug_trace(726663174, 2, 0, 0, 0);
  return v18;
}

- (id)_dataWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 memoryClass:(unint64_t)a6 graphicsClass:(unint64_t)a7 appearanceIdentifier:(int64_t)a8 graphicsFallBackOrder:(id)a9 deviceSubtypeFallBackOrder:(id)a10
{
  id v17;
  id result;
  unint64_t v19;
  CUINamedData *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _BYTE v23[9];

  v23[0] = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __150__CUICatalog__dataWithName_deviceIdiom_deviceSubtype_memoryClass_graphicsClass_appearanceIdentifier_graphicsFallBackOrder_deviceSubtypeFallBackOrder___block_invoke;
  v22[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v22[4] = a8;
  v17 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a4, a5, 0, 0, 0, 1.0, 0, a6, a7, a9, a10, 0, 0, v22);
  if (v17
    || (v21[1] = 3221225472,
        v21[2] = __150__CUICatalog__dataWithName_deviceIdiom_deviceSubtype_memoryClass_graphicsClass_appearanceIdentifier_graphicsFallBackOrder_deviceSubtypeFallBackOrder___block_invoke_2,
        v21[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l,
        v21[4] = a8,
        v21[0] = _NSConcreteStackBlock,
        result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a4, a5, 0, 0, 0, 0.0, 0, a6, a7, a9, a10, 0, 0, v21),
        (v17 = result) != 0))
  {
    v19 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", v17, v23);
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      v20 = -[CUINamedData initWithName:usingRenditionKey:fromTheme:]([CUINamedData alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v17, v19);
      -[CUINamedLookup setRepresentsOnDemandContent:](v20, "setRepresentsOnDemandContent:", v23[0]);
      return v20;
    }
  }
  return result;
}

- (id)namedVectorGlyphWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 layoutDirection:(int64_t)a6 glyphSize:(int64_t)a7 glyphWeight:(int64_t)a8 glyphPointSize:(double)a9 appearanceName:(id)a10
{
  return -[CUICatalog namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:locale:](self, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:locale:", a3, a5, a6, a7, a8, a10, a4, a9, 0);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, a5, a6, a7, a8, a9, a4, a10, a11, 0);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11 locale:(id)a12
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *v31;
  NSNumber *v37;

  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  v16 = 0;
  v17 = __getDeviceTraits___deviceIdiom;
  v18 = __getDeviceTraits___deviceSubtype;
  v19 = __getDeviceTraits___deviceMemoryClass;
  v20 = __getDeviceTraits___deviceGraphicsClass;
  v21 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  v22 = __getDeviceTraits___deviceSubtypeFallbackOrder;
  if (self && a11)
  {
    v23 = __getDeviceTraits___deviceMemoryClass;
    v24 = __getDeviceTraits___deviceGraphicsClass;
    v25 = __getDeviceTraits___deviceGraphicsFallbackOrder;
    v26 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "appearanceIdentifierForName:", a11);
    v21 = v25;
    v20 = v24;
    v19 = v23;
    v16 = v26;
  }
  if (v17 == a5 && v18 == a6)
    return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:", a3, a5, a6, a7, a8, a9, a4, a10, v19, v20, v16, v21, v22, a12);
  v28 = v21;
  v29 = v20;
  v30 = v19;
  if (a5 == 5)
  {
    v31 = (NSArray *)+[NSMutableArray array](NSMutableArray, "array");
    CUIWatchSubTypeFallbackOrder(a6, v31);
    -[NSArray addObject:](v31, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  }
  else
  {
    v37 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
    v31 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1);
  }
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:", a3, a5, a6, a7, a8, a9, a4, a10, v30, v29, v16, v28, v31, a12);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 appearanceIdentifier:(int64_t)a13 graphicsFallBackOrder:(id)a14 deviceSubtypeFallBackOrder:(id)a15 locale:(id)a16
{
  unsigned int v24;
  id v25;

  v24 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace(726663173, 1, v24, 0, 0);
  v25 = -[CUICatalog _imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:](self, "_imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:", a3, a5, a6, a7, a8, a9, a4, a10, a11, a12, a13, a14, a15, a16);
  kdebug_trace(726663174, 1, 0, 0, 0);
  return v25;
}

- (id)_imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 appearanceIdentifier:(int64_t)a13 graphicsFallBackOrder:(id)a14 deviceSubtypeFallBackOrder:(id)a15 locale:(id)a16
{
  id result;
  id v21;
  unint64_t v22;
  CUINamedImage *v23;
  _QWORD v28[5];
  _BYTE v29[9];

  v29[0] = 0;
  _CUILog(3, (uint64_t)"-[CUICatalog _imageWithName:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d sizeClassHorizontal:%d sizeClassVertical:%d memoryClass:%d graphicsClass:%d appearanceIdentifier:%d graphicsFallBackOrder:%@ deviceSubtypeFallBackOrder:%@ locale:%@]", (uint64_t)a3, a5, a6, a7, a8, a9, (uint64_t)a3);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __237__CUICatalog__imageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_appearanceIdentifier_graphicsFallBackOrder_deviceSubtypeFallBackOrder_locale___block_invoke;
  v28[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v28[4] = a13;
  result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a5, a6, a7, a8, a9, a4, a10, a11, a12, a14, a15, a16, sel__baseImageKeyForName_, v28,
             a11,
             a12,
             a13,
             a14,
             a15,
             a16);
  if (result)
  {
    v21 = result;
    if (objc_msgSend(result, "themePart") == (id)220)
      return 0;
    v22 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", v21, v29);
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      v23 = -[CUINamedImage initWithName:usingRenditionKey:fromTheme:]([CUINamedImage alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v21, v22);
      -[CUINamedLookup setRepresentsOnDemandContent:](v23, "setRepresentsOnDemandContent:", v29[0]);
      return v23;
    }
  }
  return result;
}

- (unint64_t)storageRef
{
  return self->_storageRef;
}

- (void)setStorageRef:(unint64_t)a3
{
  self->_storageRef = a3;
}

- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11 locale:(id)a12
{
  uint64_t v19;
  unsigned int v20;
  id v21;

  v19 = 0;
  if (self && a11)
    v19 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "appearanceIdentifierForName:", a11);
  v20 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace(726663173, 4, v20, 0, 0);
  v21 = -[CUICatalog _namedVectorImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceIdentifier:locale:](self, "_namedVectorImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceIdentifier:locale:", a3, a5, a6, a7, a8, a9, a4, a10, v19, a12);
  kdebug_trace(726663174, 4, 0, 0, 0);
  return v21;
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 layoutDirection:(int64_t)a6 locale:(id)a7 adjustRenditionKeyWithBlock:(id)a8
{
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *v27;
  id v28;
  id v29;
  unint64_t v30;
  CUINamedImage *v31;
  CUINamedImage *v32;
  unsigned __int8 v34;
  NSNumber *v35;

  v34 = 0;
  v15 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace(726663173, 1, v15, 0, 0);
  _CUILog(3, (uint64_t)"-[CUICatalog imageWithName:%@ scaleFactor:%f deviceIdiom:%d locale:%@]", v16, v17, v18, v19, v20, v21, (uint64_t)a3);
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  v22 = __getDeviceTraits___deviceDisplayGamut;
  v23 = __getDeviceTraits___deviceMemoryClass;
  v24 = __getDeviceTraits___deviceGraphicsClass;
  v25 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  if (__getDeviceTraits___deviceIdiom == a5)
  {
    v26 = __getDeviceTraits___deviceSubtype;
    v27 = (NSArray *)__getDeviceTraits___deviceSubtypeFallbackOrder;
  }
  else
  {
    v35 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
    v27 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1);
    v26 = 0;
  }
  v28 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a5, v26, v22, a6, 0, a4, 0, v23, v24, v25, v27, a7, sel__baseImageKeyForName_, a8);
  if (v28)
  {
    v29 = v28;
    if (objc_msgSend(v28, "themePart") == (id)220
      || (v30 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", v29, &v34), v30 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v31 = 0;
    }
    else
    {
      v32 = -[CUINamedImage initWithName:usingRenditionKey:fromTheme:]([CUINamedImage alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v29, v30);
      -[CUINamedLookup setRepresentsOnDemandContent:](v32, "setRepresentsOnDemandContent:", v34);
      v31 = v32;
    }
  }
  else
  {
    v31 = 0;
  }
  kdebug_trace(726663174, 1, 0, 0, 0);
  return v31;
}

- (id)colorWithName:(id)a3 displayGamut:(int64_t)a4 deviceIdiom:(int64_t)a5 appearanceName:(id)a6
{
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  CUINamedColor *v30;
  CUINamedColor *v31;
  CUINamedColor *v32;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[5];
  unsigned __int8 v37;
  NSNumber *v38;

  v11 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace(726663173, 16, v11, 0, 0);
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  v18 = __getDeviceTraits___deviceIdiom;
  v19 = __getDeviceTraits___deviceSubtype;
  v34 = __getDeviceTraits___deviceGraphicsClass;
  v35 = __getDeviceTraits___deviceMemoryClass;
  v20 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  v21 = (NSArray *)__getDeviceTraits___deviceSubtypeFallbackOrder;
  _CUILog(3, (uint64_t)"-[CUICatalog colorWithName:%@ displayGamut:%d deviceIdiom:%d appearanceName:%@]", v12, v13, v14, v15, v16, v17, (uint64_t)a3);
  v23 = 0;
  v37 = 0;
  if (self && a6)
    v23 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v22), "appearanceIdentifierForName:", a6);
  if (v18 != a5)
  {
    v38 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
    v21 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1);
    v19 = 0;
  }
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = __68__CUICatalog_colorWithName_displayGamut_deviceIdiom_appearanceName___block_invoke;
  v36[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v36[4] = v23;
  v24 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a5, v19, a4, 0, 0, 1.0, 0, v35, v34, v20, v21, 0, sel__baseColorKeyForName_, v36);
  if (v24)
  {
    v25 = v24;
    v26 = -[CUICatalog localObjectCache](self, "localObjectCache");
    v27 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", v25, &v37);
    v29 = objc_msgSend((id)_LookupStructuredThemeProvider(v27, v28), "copyLookupKeySignatureForKey:", objc_msgSend(v25, "keyList"));
    v30 = (CUINamedColor *)objc_msgSend(v26, "objectForKey:", v29);
    v31 = v30;
    if (colorWithName_displayGamut_deviceIdiom_appearanceName____onceToken == -1)
    {
      if (!v30)
        goto LABEL_15;
    }
    else
    {
      dispatch_once(&colorWithName_displayGamut_deviceIdiom_appearanceName____onceToken, &__block_literal_global_107);
      if (!v31)
        goto LABEL_15;
    }
    if ((objc_opt_isKindOfClass(v31, colorWithName_displayGamut_deviceIdiom_appearanceName____colorClass) & 1) != 0)
    {
      v32 = v31;
LABEL_16:

      goto LABEL_17;
    }
LABEL_15:
    v31 = -[CUINamedColor initWithName:usingRenditionKey:fromTheme:]([CUINamedColor alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v25, v27);
    -[CUINamedLookup setRepresentsOnDemandContent:](v31, "setRepresentsOnDemandContent:", v37);
    objc_msgSend(v26, "setObject:forKey:", v31, v29);
    goto LABEL_16;
  }
  v31 = 0;
LABEL_17:
  kdebug_trace(726663174, 16, 0, 0, 0);
  return v31;
}

- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11 locale:(id)a12
{
  unsigned int v20;
  id v21;

  v20 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace(726663173, 8, v20, 0, 0);
  v21 = -[CUICatalog _namedLookupWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "_namedLookupWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, a5, a6, a7, a8, a9, a4, a10, a11, a12);
  kdebug_trace(726663174, 8, 0, 0, 0);
  return v21;
}

- (id)_namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11 locale:(id)a12
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v45;
  CUINamedImage *v46;
  id v47;
  uint64_t v48;
  __objc2_class **v49;
  id v50;
  CUINamedImage *v51;
  NSArray *v52;
  _QWORD v55[15];
  _QWORD v56[5];
  unsigned __int8 v57;
  NSNumber *v58;

  v57 = 0;
  _CUILog(3, (uint64_t)"-[CUICatalog _namedLookupWithName:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d sizeClassHorizontal:%d sizeClassVertical:%d appearanceName:%@]", (uint64_t)a3, a5, a6, a7, a8, a9, (uint64_t)a3);
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  v19 = __getDeviceTraits___deviceMemoryClass;
  v20 = __getDeviceTraits___deviceGraphicsClass;
  v21 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  if (__getDeviceTraits___deviceIdiom == a5)
  {
    v52 = (NSArray *)__getDeviceTraits___deviceSubtypeFallbackOrder;
  }
  else
  {
    v58 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
    v52 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1);
    _CUILog(3, (uint64_t)"-[CUICatalog _namedLookupWithName]: '%@' using deviceSubtype=%lu and universal subtype fallback instead [%s:%d]", v22, v23, v24, v25, v26, v27, (uint64_t)a3);
  }
  v28 = 0;
  if (self)
  {
    if (a11)
      v28 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v18), "appearanceIdentifierForName:", a11);
  }
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = __162__CUICatalog__namedLookupWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceName_locale___block_invoke;
  v56[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v56[4] = v28;
  v29 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a5, a6, a7, a8, a9, a4, a10, v19, v20, v21, v52, a12, 0, v56,
          a11);
  if (!v29)
    goto LABEL_12;
  v36 = v29;
  v37 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", v29, &v57);
  if (v37 == 0x7FFFFFFFFFFFFFFFLL)
  {
    _CUILog(4, (uint64_t)"CoreUI: -[CUICatalog _namedLookupWithName]: Cannot find themeRef while resolving key for name '%@' with subtype %u. [%s:%d]", v38, v39, v40, v41, v42, v43, (uint64_t)a3);
LABEL_12:
    _CUILog(3, (uint64_t)"CoreUI: -[CUICatalog _namedLookupWithName]: Cannot resolve key for name '%@' with subtype %u. [%s:%d]", v30, v31, v32, v33, v34, v35, (uint64_t)a3);
    return 0;
  }
  v45 = v37;
  v46 = -[CUINamedImage initWithName:usingRenditionKey:fromTheme:]([CUINamedImage alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v36, v37);
  v47 = -[CUIThemeRendition type](-[CUINamedLookup _rendition](v46, "_rendition"), "type");
  if (v47 == (id)1002)
  {
    v49 = OBJC_CLASS___CUINamedLayerStack_ptr;
    goto LABEL_17;
  }
  if (v47 == (id)1018)
  {
    v49 = OBJC_CLASS___CUINamedSolidLayerStack_ptr;
LABEL_17:
    v50 = objc_alloc((Class)objc_opt_class(*v49, v48));
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = __162__CUICatalog__namedLookupWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceName_locale___block_invoke_3;
    v55[3] = &unk_1E41B8E28;
    *(double *)&v55[8] = a4;
    v55[9] = a5;
    v55[10] = a6;
    v55[11] = a7;
    v55[12] = a8;
    v55[13] = a9;
    v55[14] = a10;
    v55[4] = self;
    v55[5] = v52;
    v55[6] = a12;
    v55[7] = v45;
    v51 = (CUINamedImage *)objc_msgSend(v50, "initWithName:usingRenditionKey:fromTheme:resolvingWithBlock:", a3, v36, v45, v55);

    v46 = v51;
  }
  -[CUINamedLookup setRepresentsOnDemandContent:](v46, "setRepresentsOnDemandContent:", v57);
  return v46;
}

- (id)namedVectorGlyphWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 layoutDirection:(int64_t)a6 glyphSize:(int64_t)a7 glyphWeight:(int64_t)a8 glyphPointSize:(double)a9 appearanceName:(id)a10 locale:(id)a11
{
  return -[CUICatalog namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphContinuousSize:glyphContinuousWeight:glyphPointSize:appearanceName:locale:](self, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphContinuousSize:glyphContinuousWeight:glyphPointSize:appearanceName:locale:", a3, a5, a6, a10, a11, a4, *(double *)off_1E41B8F40[a7], *(double *)off_1E41B8EF0[a8], a9);
}

- (id)_resolvedRenditionKeyForName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 graphicsFallBackOrder:(id)a13 deviceSubtypeFallBackOrder:(id)a14 locale:(id)a15 withBaseKeySelector:(SEL)a16 adjustRenditionKeyWithBlock:(id)a17
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;

  _CUILog(3, (uint64_t)"-[CUICatalog _resolvedRenditionKeyForName:%@ scaleFactor:%f idiom:%d subtype:%u displayGamut:%d layoutDirection:%d sizeClassHorizontal:%d sizeClassVertical:%d memoryClass:%lu graphicsClass:%lu] [%s:%d]", (uint64_t)a3, a5, a6, a7, a8, a9, (uint64_t)a3);
  if (!a3 || !objc_msgSend(a3, "length"))
  {
    v38 = (uint64_t)a3;
    v29 = "CUICatalog: Invalid asset name supplied: '%@'";
    goto LABEL_7;
  }
  if (!a5 && a6)
  {
    v38 = a6;
    v29 = "CUICatalog: Invalid Request: requesting subtype %d without specifying idiom for asset named: '%@'";
LABEL_7:
    _CUILog(4, (uint64_t)v29, v23, v24, v25, v26, v27, v28, v38);
    return 0;
  }
  if (a16)
    v31 = -[CUICatalog performSelector:withObject:](self, "performSelector:withObject:", a16, a3);
  else
    v31 = -[CUICatalog _baseKeyForName:](self, "_baseKeyForName:", a3);
  if (!v31)
  {
    _CUILog(3, (uint64_t)"-[CUICatalog _resolvedRenditionKeyForName:] Cannot resolve base key for bogus name '%@'.", v32, 0, v33, v34, v35, v36, (uint64_t)a3);
    return 0;
  }
  v37 = 0.0;
  if (a4 > 0.0)
    v37 = a4;
  return -[CUICatalog _resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:", self->_storageRef, v31, a5, a6, a7, a8, v37);
}

- (id)_resolvedRenditionKeyFromThemeRef:(unint64_t)a3 withBaseKey:(id)a4 scaleFactor:(double)a5 deviceIdiom:(int64_t)a6 deviceSubtype:(unint64_t)a7 displayGamut:(int64_t)a8 layoutDirection:(int64_t)a9 sizeClassHorizontal:(int64_t)a10 sizeClassVertical:(int64_t)a11 memoryClass:(unint64_t)a12 graphicsClass:(unint64_t)a13 graphicsFallBackOrder:(id)a14 deviceSubtypeFallBackOrder:(id)a15 locale:(id)a16 adjustRenditionKeyWithBlock:(id)a17
{
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id preferredLocalization;
  id result;
  void *v36;

  v25 = (void *)_LookupStructuredThemeProvider(a3, a2);
  v26 = objc_msgSend(objc_msgSend(v25, "themeStore"), "renditionInfoForIdentifier:", (unsigned __int16)objc_msgSend(a4, "themeIdentifier"));
  v27 = objc_msgSend(a16, "languageCode");
  v36 = v26;
  if (!a16 || !v27)
  {
    preferredLocalization = (id)self->_preferredLocalization;
    if (a16 && !v27)
      _CUILog(4, (uint64_t)"CoreUI: passed in NSLocale %p has a language code of NULL assuming localization identifier %d", 0, v28, v29, v30, v31, v32, (uint64_t)a16);
LABEL_8:
    if ((objc_opt_respondsToSelector(v25, sel_localizationWorkaroundForKeyList_withLocale_) & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v33 = +[NSLocale mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:](NSLocale, "mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:", self->_assetCatalogLocalizations, +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v27), 1, 0);
  if (v33)
  {
    preferredLocalization = objc_msgSend(v25, "localizationIdentifierForName:", v33);
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector(v25, sel_localizationWorkaroundForKeyList_withLocale_) & 1) == 0)
    return -[CUICatalog _private_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:localizationIdentifier:adjustRenditionKeyWithBlock:](self, a3, a4, (id)a6, a7, (void *)a8, a9, a10, a5, a11, a12, a13, a14, a15, 0, (uint64_t)a17);
  preferredLocalization = 0;
LABEL_12:
  if ((objc_msgSend(v25, "localizationWorkaroundForKeyList:withLocale:", objc_msgSend(a4, "keyList"), a16) & 1) != 0)return -[CUICatalog _private_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:localizationIdentifier:adjustRenditionKeyWithBlock:](self, a3, a4, (id)a6, a7, (void *)a8, a9, a10, a5, a11, a12, a13, a14, a15,
             0,
             (uint64_t)a17);
LABEL_13:
  if (!(_DWORD)preferredLocalization)
    return -[CUICatalog _private_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:localizationIdentifier:adjustRenditionKeyWithBlock:](self, a3, a4, (id)a6, a7, (void *)a8, a9, a10, a5, a11, a12, a13, a14, a15, 0, (uint64_t)a17);
  if ((objc_msgSend(v36, "attributePresent:withValue:", 13, preferredLocalization) & 0x80000000) != 0)
    return -[CUICatalog _private_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:localizationIdentifier:adjustRenditionKeyWithBlock:](self, a3, a4, (id)a6, a7, (void *)a8, a9, a10, a5, a11, a12, a13, a14, a15, 0, (uint64_t)a17);
  result = -[CUICatalog _private_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:localizationIdentifier:adjustRenditionKeyWithBlock:](self, a3, a4, (id)a6, a7, (void *)a8, a9, a10, a5, a11, a12, a13, a14, a15, preferredLocalization, (uint64_t)a17);
  if (!result)
    return -[CUICatalog _private_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:localizationIdentifier:adjustRenditionKeyWithBlock:](self, a3, a4, (id)a6, a7, (void *)a8, a9, a10, a5, a11, a12, a13, a14, a15, 0, (uint64_t)a17);
  return result;
}

- (id)_baseVectorGlyphForName:(id)a3
{
  id result;
  CUIRenditionKey *v4;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
    -[CUIRenditionKey setThemeElement:](v4, "setThemeElement:", 85);
    -[CUIRenditionKey setThemePart:](v4, "setThemePart:", 59);
    return v4;
  }
  return result;
}

- (id)_themeStore
{
  return (id)_LookupStructuredThemeProvider(self->_storageRef, a2);
}

- (id)appearanceNames
{
  void *v2;
  id v3;
  id result;

  v2 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  v3 = objc_msgSend(v2, "appearances");
  if (!v3)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", objc_msgSend(v2, "defaultAppearanceName"));
  result = objc_msgSend(v3, "allKeys");
  if (!result)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", objc_msgSend(v2, "defaultAppearanceName"));
  return result;
}

- (id)_baseKeyForName:(id)a3
{
  id result;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
    return -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
  return result;
}

- (id)_namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceIdentifier:(int64_t)a11 locale:(id)a12
{
  id v18;
  NSArray *v21;
  id result;
  id v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  id v31;
  unsigned int v32;
  __objc2_class **v33;
  unint64_t v34;
  id v35;
  unsigned int v36;
  __objc2_class *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int v55;
  uint64_t v56;
  int64_t v57;
  int64_t v58;
  _QWORD v59[5];
  _QWORD v60[5];
  unsigned __int8 v61;
  NSNumber *v62;

  v18 = a3;
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  v61 = 0;
  if (__getDeviceTraits___deviceIdiom == a5 && __getDeviceTraits___deviceSubtype == a6)
  {
    v21 = (NSArray *)__getDeviceTraits___deviceSubtypeFallbackOrder;
  }
  else
  {
    v62 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
    v21 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v62, 1);
  }
  _CUILog(3, (uint64_t)"-[CUICatalog _namedVectorImageWithName:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d sizeClassHorizontal:%d sizeClassVertical:%d appearanceIdentifier:%d +subtypefallback;%@]",
    (uint64_t)a3,
    a5,
    a6,
    a7,
    a8,
    a9,
    (uint64_t)v18);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = __173__CUICatalog__namedVectorImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceIdentifier_locale___block_invoke;
  v60[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v60[4] = a11;
  v58 = a8;
  result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", v18, a5, a6, a7, a8, a9, a4, a10, 0, 0, 0, v21, a12, 0, v60,
             a11,
             v21);
  if (result)
  {
    v23 = result;
    v57 = a7;
    v24 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", result, &v61);
    if (v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v29 = v24;
      v56 = (uint64_t)v18;
      v30 = (void *)_LookupStructuredThemeProvider(self->_storageRef, v25);
      v55 = objc_msgSend(v30, "distilledInCoreUIVersion");
      v31 = objc_msgSend(v30, "renditionWithKey:", objc_msgSend(v23, "keyList"));
      if (a4 == 0.0)
      {
        v32 = objc_msgSend(v31, "pixelFormat");
        if (v32 == 1398163232)
        {
          v33 = OBJC_CLASS___CUINamedVectorSVGImage_ptr;
        }
        else
        {
          if (v32 != 1346651680)
            goto LABEL_30;
          v33 = OBJC_CLASS___CUINamedVectorPDFImage_ptr;
        }
        v44 = objc_alloc(*v33);
        v45 = (id)v56;
        v46 = v23;
        v47 = v29;
LABEL_28:
        v48 = objc_msgSend(v44, "initWithName:usingRenditionKey:fromTheme:", v45, v46, v47);
LABEL_31:
        objc_msgSend(v48, "setRepresentsOnDemandContent:", v61);
        return v48;
      }
      v18 = (id)v56;
      if (v55 >= 0x1E5 && (objc_msgSend(v31, "preservedVectorRepresentation") & 1) == 0)
      {
        _CUILog(3, (uint64_t)"-[CUICatalog _namedVectorImageWithName:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d sizeClassHorizontal:%d sizeClassVertical:%d appearanceIdentifier:%d] stopped]", v38, v39, v40, v41, v42, v43, v56);
        return 0;
      }
    }
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = __173__CUICatalog__namedVectorImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceIdentifier_locale___block_invoke_2;
    v59[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
    v59[4] = a11;
    result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", v18, a5, a6, v57, v58, a9, a4, a10, 0, 0, 0, v21, a12, sel__baseVectorRenditionKey_, v59);
    if (!result)
      return result;
    v26 = result;
    v27 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", result, &v61);
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    v34 = v27;
    v35 = objc_msgSend((id)_LookupStructuredThemeProvider(v27, v28), "renditionWithKey:", objc_msgSend(v26, "keyList"));
    v36 = objc_msgSend(v35, "pixelFormat");
    if (v36 == 1346651680)
    {
      v37 = CUINamedVectorPDFImage;
      goto LABEL_27;
    }
    if (v36 == 1398163232)
    {
      v37 = CUINamedVectorSVGImage;
LABEL_27:
      v44 = [v37 alloc];
      v45 = v18;
      v46 = v26;
      v47 = v34;
      goto LABEL_28;
    }
    objc_msgSend(v35, "pixelFormat");
    _CUILog(4, (uint64_t)"CoreUI: namedVectorImage '%@' has unknown pixelformat '%d'", v49, v50, v51, v52, v53, v54, (uint64_t)v18);
LABEL_30:
    v48 = 0;
    goto LABEL_31;
  }
  return result;
}

- (unint64_t)_storageRefForRendition:(id)a3 representsODRContent:(BOOL *)a4
{
  id v6;
  id v7;
  NSMapTable *storageMapTable;
  __int128 v9;
  void *v10;
  const void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSMapTableValueCallBacks valueCallBacks;
  NSMapTableKeyCallBacks keyCallBacks;
  uint64_t v48;

  *a4 = 0;
  if (!a3)
    return self->_storageRef;
  v48 = 0;
  v6 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "renditionWithKey:", objc_msgSend(a3, "keyList"));
  if (objc_msgSend(v6, "type") != (id)1001)
    return self->_storageRef;
  *a4 = 1;
  v7 = objc_msgSend(v6, "assetPackIdentifier");
  storageMapTable = self->_storageMapTable;
  if (!storageMapTable)
  {
    v9 = *(_OWORD *)&NSObjectMapKeyCallBacks.retain;
    *(_OWORD *)&keyCallBacks.hash = *(_OWORD *)&NSObjectMapKeyCallBacks.hash;
    *(_OWORD *)&keyCallBacks.retain = v9;
    *(_OWORD *)&keyCallBacks.describe = *(_OWORD *)&NSObjectMapKeyCallBacks.describe;
    valueCallBacks = NSIntegerMapValueCallBacks;
    storageMapTable = NSCreateMapTable(&keyCallBacks, &valueCallBacks, 2uLL);
    self->_storageMapTable = storageMapTable;
  }
  v10 = NSMapGet(storageMapTable, v7);
  if (!v10)
  {
    if ((objc_msgSend(v7, "hasPrefix:", CFSTR("/")) & 1) != 0
      || objc_msgSend(v7, "hasPrefix:", CFSTR("./")))
    {
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("./")))
      {
        v11 = +[CUIThemeFacet themeWithContentsOfURL:error:](CUIThemeFacet, "themeWithContentsOfURL:error:", -[NSBundle URLForResource:withExtension:](self->_bundle, "URLForResource:withExtension:", objc_msgSend(objc_msgSend(v7, "substringFromIndex:", 2), "stringByDeletingPathExtension"), CFSTR("car")), &v48);
        if (!v11)
          goto LABEL_15;
      }
      else
      {
        v19 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", v7, 0);
        v11 = +[CUIThemeFacet themeWithContentsOfURL:error:](CUIThemeFacet, "themeWithContentsOfURL:error:", v19, &v48);

        if (!v11)
        {
LABEL_15:
          _CUILog(4, (uint64_t)"CoreUI: can't open asset pack '%@' contents of asset pack will be ignored error:'%@'", v13, v14, v15, v16, v17, v18, (uint64_t)v7);
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
    else
    {
      v20 = +[NSBundleResourceRequest _assetPackBundleForBundle:withAssetPackID:](NSBundleResourceRequest, "_assetPackBundleForBundle:withAssetPackID:", self->_bundle, v7);
      if (!v20)
      {
        if (self->_bundle)
        {
          _CUILog(4, (uint64_t)"CoreUI: can't locate asset pack '%@' for bundle '%@' contents of asset pack will be ignored", v21, v22, v23, v24, v25, v26, (uint64_t)v7);
        }
        else
        {
          objc_msgSend(objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "themeStore"), "path");
          _CUILog(4, (uint64_t)"CoreUI: can't locate asset pack '%@' because CUICatalog was initialized with a path of '%@' instead of a bundle contents of asset pack will be ignored", v40, v41, v42, v43, v44, v45, (uint64_t)v7);
        }
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      v27 = objc_msgSend(v20, "URLForResource:withExtension:", self->_assetStoreName, CFSTR("car"));
      if (!v27)
      {
        _CUILog(4, (uint64_t)"CoreUI: can't locate '%@.car' in asset pack '%@' for bundle '%@' contents of asset pack will be ignored", v28, v29, v30, v31, v32, v33, (uint64_t)self->_assetStoreName);
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      v11 = +[CUIThemeFacet themeWithContentsOfURL:error:](CUIThemeFacet, "themeWithContentsOfURL:error:", v27, &v48);
      if (!v11)
      {
        _CUILog(4, (uint64_t)"CoreUI: can't open asset pack '%@' for bundle '%@' contents of asset pack will be ignored error:'%@'", v34, v35, v36, v37, v38, v39, (uint64_t)v7);
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    NSMapInsert(self->_storageMapTable, v7, v11);
    return (unint64_t)v11;
  }
  return (unint64_t)v10;
}

- (id)_baseColorKeyForName:(id)a3
{
  id result;
  CUIRenditionKey *v4;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
    -[CUIRenditionKey setThemeElement:](v4, "setThemeElement:", 85);
    -[CUIRenditionKey setThemePart:](v4, "setThemePart:", 217);
    return v4;
  }
  return result;
}

- (id)_baseImageKeyForName:(id)a3
{
  id result;
  CUIRenditionKey *v4;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
    -[CUIRenditionKey setThemeElement:](v4, "setThemeElement:", 85);
    -[CUIRenditionKey setThemePart:](v4, "setThemePart:", 181);
    return v4;
  }
  return result;
}

- (id)_baseVectorRenditionKey:(id)a3
{
  id result;
  CUIRenditionKey *v4;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
    -[CUIRenditionKey setThemeElement:](v4, "setThemeElement:", 85);
    -[CUIRenditionKey setThemePart:](v4, "setThemePart:", 42);
    return v4;
  }
  return result;
}

- (id)localObjectCache
{
  void *v3;
  id result;

  v3 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  result = self->_localObjectCache;
  if (!result)
  {
    self->_localObjectCache = (NSCache *)objc_alloc_init((Class)NSCache);
    -[NSCache setName:](self->_localObjectCache, "setName:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.coreui-cuicache %@"), objc_msgSend(objc_msgSend(v3, "themeStore"), "path")));
    -[NSCache setEvictsObjectsWithDiscardedContent:](self->_localObjectCache, "setEvictsObjectsWithDiscardedContent:", 0);
    -[NSCache setCountLimit:](self->_localObjectCache, "setCountLimit:", 100);
    -[NSCache setMinimumObjectCount:](self->_localObjectCache, "setMinimumObjectCount:", 15);
    return self->_localObjectCache;
  }
  return result;
}

- (CUICatalog)initWithName:(id)a3 fromBundle:(id)a4 error:(id *)a5
{
  CUICatalog *v8;
  unint64_t v9;
  NSNotificationCenter *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CUICatalog;
  v8 = -[CUICatalog init](&v12, sel_init);
  if (v8)
  {
    if (!a4)
      a4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v9 = +[CUIThemeFacet themeNamed:forBundleIdentifier:error:](CUIThemeFacet, "themeNamed:forBundleIdentifier:error:", a3, objc_msgSend(a4, "bundleIdentifier"), a5);
    v8->_storageRef = v9;
    if (v9)
    {
      *((_DWORD *)v8 + 21) &= 0xF0000000;
      v8->_bundle = (NSBundle *)a4;
      v8->_assetStoreName = (NSString *)objc_msgSend(a3, "copy");
      -[CUICatalog lookupCache](v8, "lookupCache");
      -[CUICatalog negativeCache](v8, "negativeCache");
      -[CUICatalog localObjectCache](v8, "localObjectCache");
      -[CUICatalog _setPreferredLocalization:](v8, "_setPreferredLocalization:", 0);
      v10 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
      -[NSNotificationCenter addObserver:selector:name:object:](v10, "addObserver:selector:name:object:", v8, sel__resourceUnPinnedNotification_, _NSBundleResourceRequestAssetPackUnpinnedNotification, a4);
    }
    else
    {
      v8->_storageRef = 0x7FFFFFFFFFFFFFFFLL;

      return 0;
    }
  }
  return v8;
}

- (id)lookupCache
{
  void *v3;
  id result;

  v3 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  result = self->_lookupCache;
  if (!result)
  {
    self->_lookupCache = (NSCache *)objc_alloc_init((Class)NSCache);
    -[NSCache setName:](self->_lookupCache, "setName:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.coreui-cache %@"), objc_msgSend(objc_msgSend(v3, "themeStore"), "path")));
    -[NSCache setEvictsObjectsWithDiscardedContent:](self->_lookupCache, "setEvictsObjectsWithDiscardedContent:", 0);
    -[NSCache setCountLimit:](self->_lookupCache, "setCountLimit:", 500);
    -[NSCache setMinimumObjectCount:](self->_lookupCache, "setMinimumObjectCount:", 75);
    return self->_lookupCache;
  }
  return result;
}

- (id)negativeCache
{
  void *v3;
  id result;

  v3 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  result = self->_negativeCache;
  if (!result)
  {
    self->_negativeCache = (NSCache *)objc_alloc_init((Class)NSCache);
    -[NSCache setName:](self->_negativeCache, "setName:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.coreui-negativecache %@"), objc_msgSend(objc_msgSend(v3, "themeStore"), "path")));
    -[NSCache setEvictsObjectsWithDiscardedContent:](self->_negativeCache, "setEvictsObjectsWithDiscardedContent:", 0);
    -[NSCache setCountLimit:](self->_negativeCache, "setCountLimit:", 100);
    -[NSCache setMinimumObjectCount:](self->_negativeCache, "setMinimumObjectCount:", 15);
    return self->_negativeCache;
  }
  return result;
}

- (void)_setPreferredLocalization:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;

  v5 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  v6 = v5;
  if (a3)
  {
    self->_preferredLocalization = (unsigned __int16)objc_msgSend(v5, "localizationIdentifierForName:", a3);
LABEL_3:
    _CUILog(3, (uint64_t)"-[CUICatalog _setPreferredLocalization:] set it to '%@'", v7, v8, v9, v10, v11, v12, (uint64_t)a3);
    return;
  }
  v13 = objc_msgSend(v5, "localizations");

  self->_assetCatalogLocalizations = (NSArray *)objc_msgSend(v13, "allKeys");
  v14 = -[NSBundle preferredLocalizations](+[NSBundle mainBundle](NSBundle, "mainBundle"), "preferredLocalizations");
  v15 = -[NSArray firstObject](+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", self->_assetCatalogLocalizations, 0), "firstObject");
  v16 = +[NSLocale mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:](NSLocale, "mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:", self->_assetCatalogLocalizations, v14, 1, 0);
  if (v16)
  {
    a3 = v16;
    v23 = objc_msgSend(+[NSLocale baseLanguageFromLanguage:](NSLocale, "baseLanguageFromLanguage:", v15), "isEqualToString:", +[NSLocale baseLanguageFromLanguage:](NSLocale, "baseLanguageFromLanguage:", v16));
    self->_preferredLocalization = (unsigned __int16)objc_msgSend(v6, "localizationIdentifierForName:", a3);
    if (v23)
      goto LABEL_3;
    _CUILog(3, (uint64_t)"-[CUICatalog _setPreferredLocalization:] set it to *'%@'", v7, v8, v9, v10, v11, v12, (uint64_t)a3);
  }
  else
  {
    self->_preferredLocalization = 0;
    _CUILog(3, (uint64_t)"-[CUICatalog _setPreferredLocalization:] set it to unlocalized/base", v17, v18, v19, v20, v21, v22, v24);
  }
}

- (id)dataWithName:(id)a3
{
  return -[CUICatalog dataWithName:appearanceName:](self, "dataWithName:appearanceName:", a3, 0);
}

uint64_t __68__CUICatalog_colorWithName_displayGamut_deviceIdiom_appearanceName___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_opt_class(CUINamedColor, a2);
  colorWithName_displayGamut_deviceIdiom_appearanceName____colorClass = result;
  return result;
}

CUICatalog *__40__CUICatalog_defaultUICatalogForBundle___block_invoke_5(uint64_t a1)
{
  CUICatalog *result;
  uint64_t v3;

  result = (CUICatalog *)objc_msgSend((id)__catalogCache_0, "objectForKey:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    result = -[CUICatalog initWithName:fromBundle:error:]([CUICatalog alloc], "initWithName:fromBundle:error:", CFSTR("Assets"), *(_QWORD *)(a1 + 32), 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v3)
      return (CUICatalog *)objc_msgSend((id)__catalogCache_0, "setObject:forKey:", v3, *(_QWORD *)(a1 + 32));
  }
  return result;
}

+ (id)defaultUICatalogForBundle:(id)a3
{
  NSBundle *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v3 = (NSBundle *)a3;
  if (a3 || (v3 = +[NSBundle mainBundle](NSBundle, "mainBundle")) != 0)
  {
    if (__onceToken_1 != -1)
      dispatch_once(&__onceToken_1, &__block_literal_global_20);
    v6 = 0;
    v7 = &v6;
    v8 = 0x3052000000;
    v9 = __Block_byref_object_copy__3;
    v10 = __Block_byref_object_dispose__3;
    v11 = 0;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __40__CUICatalog_defaultUICatalogForBundle___block_invoke_5;
    v5[3] = &unk_1E41B8C78;
    v5[4] = v3;
    v5[5] = &v6;
    dispatch_sync((dispatch_queue_t)__cacheQueue, v5);
    v3 = (NSBundle *)(id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  return v3;
}

id __40__CUICatalog_defaultUICatalogForBundle___block_invoke()
{
  id result;

  __cacheQueue = (uint64_t)dispatch_queue_create("com.apple.CoreUI.UICatalog-cache", 0);
  result = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 0);
  __catalogCache_0 = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  NSNotificationCenter *v3;
  objc_super v4;

  if ((*((_BYTE *)self + 82) & 1) == 0 && self->_storageRef != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter removeObserver:name:object:](v3, "removeObserver:name:object:", self, _NSBundleResourceRequestAssetPackUnpinnedNotification, self->_bundle);
  }
  -[CUICatalog clearCachedImageResources](self, "clearCachedImageResources");

  if ((*((_BYTE *)self + 82) & 1) != 0)
    +[CUIThemeFacet themeUnregisterThemeRef:](CUIThemeFacet, "themeUnregisterThemeRef:", self->_storageRef);

  v4.receiver = self;
  v4.super_class = (Class)CUICatalog;
  -[CUICatalog dealloc](&v4, sel_dealloc);
}

- (void)clearCachedImageResources
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (self->_storageRef != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = -[CUICatalog _themeStore](self, "_themeStore");
    _CUILog(3, (uint64_t)"-[CUICatalog clearCachedImageResources] on themestore '%@'", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
    objc_msgSend(v3, "clearRenditionCache");
    -[NSCache removeAllObjects](self->_lookupCache, "removeAllObjects");
    -[NSCache removeAllObjects](self->_negativeCache, "removeAllObjects");
  }
}

+ (BOOL)isValidLCRWithBytes:(const void *)a3 length:(unint64_t)a4
{
  return +[CUICommonAssetStorage isValidAssetStorageWithBytes:length:](CUICommonAssetStorage, "isValidAssetStorageWithBytes:length:", a3, a4);
}

+ (BOOL)isValidAssetStorageWithURL:(id)a3
{
  return +[CUICommonAssetStorage isValidAssetStorageWithURL:](CUICommonAssetStorage, "isValidAssetStorageWithURL:", a3);
}

+ (id)bestMatchUsingObjects:(id)a3 getAttributeValueUsing:(id)a4 scaleFactor:(double)a5 deviceIdiom:(int64_t)a6 deviceSubtype:(unint64_t)a7 displayGamut:(int64_t)a8 deploymentTarget:(int64_t)a9 layoutDirection:(int64_t)a10 sizeClassHorizontal:(int64_t)a11 sizeClassVertical:(int64_t)a12 memoryClass:(int64_t)a13 graphicsFeatureSetClass:(int64_t)a14 graphicsFallBackOrder:(id)a15 deviceSubtypeFallBackOrder:(id)a16
{
  return objc_msgSend(a1, "bestMatchUsingObjects:getAttributeValueUsing:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:deploymentTarget:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsFeatureSetClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:platform:", a3, a4, a6, a7, a8, a9, a5, a10, a11, a12, a13, a14, a15, a16, CUICurrentPlatform());
}

+ (id)bestMatchUsingObjects:(id)a3 getAttributeValueUsing:(id)a4 scaleFactor:(double)a5 deviceIdiom:(int64_t)a6 deviceSubtype:(unint64_t)a7 displayGamut:(int64_t)a8 deploymentTarget:(int64_t)a9 layoutDirection:(int64_t)a10 sizeClassHorizontal:(int64_t)a11 sizeClassVertical:(int64_t)a12 memoryClass:(int64_t)a13 graphicsFeatureSetClass:(int64_t)a14 graphicsFallBackOrder:(id)a15 deviceSubtypeFallBackOrder:(id)a16 platform:(int64_t)a17
{
  unsigned int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  id v29;
  int64_t v30;
  int64_t v31;
  int64_t v32;
  unint64_t v33;
  id v34;
  BOOL v35;
  char v36;
  int64_t v37;
  int64_t v38;
  int64_t v39;
  int64_t v40;
  int64_t v41;
  double v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  int64_t v49;
  double v50;
  int64_t v51;
  int64_t v52;
  _BOOL4 v53;
  unint64_t v54;
  id v55;
  char *v58;
  unint64_t v59;
  char *v60;
  char *v61;
  unint64_t v62;
  int64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char v69;
  uint64_t v71;
  int64_t v72;
  uint64_t v74;
  uint64_t v75;
  int64_t v77;
  int64_t v78;
  int64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];

  v21 = CUIMaxScaleForTargetPlatform(a17);
  v22 = (char *)objc_msgSend(a15, "count");
  v23 = (char *)objc_msgSend(a16, "count");
  v24 = 0;
  v25 = 0;
  do
  {
    if (__memorySearchValues[v24] == a13)
      v25 = v24;
    ++v24;
  }
  while (v24 != 9);
  if ((v25 & 0x8000000000000000) == 0)
  {
    v74 = v25;
    v61 = v23;
    v72 = a8;
    v26 = 4;
    if (__PAIR128__(a12, a11) == 0)
      v27 = 4;
    else
      v27 = 1;
    v71 = v27;
    v28 = (double)v21;
    if (a10 == 4)
      v26 = 5;
    v66 = v26;
    v67 = (unint64_t)v22;
    v60 = v22 - 1;
    v58 = v23 - 1;
    while (1)
    {
      v59 = 0x7FFFFFFFFFFFFFFFLL;
      v29 = (id)a7;
      while (2)
      {
        v30 = a14;
        v31 = v72;
        v32 = a6;
        v33 = v67;
LABEL_14:
        v34 = v29;
        v63 = v30;
        if (v30)
          v35 = v33 == 0;
        else
          v35 = 1;
        v36 = v35;
        v64 = v36;
        v62 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
LABEL_21:
          v69 = 0;
          v65 = -1;
          v37 = a9;
          v79 = a10;
          v39 = a12;
          v38 = a11;
          v40 = v31;
          v41 = v32;
          v42 = a5;
LABEL_22:
          v43 = v71;
          while (1)
          {
            while (1)
            {
              while (1)
              {
                while (1)
                {
                  do
                  {
                    v75 = v43;
                    v77 = v39;
                    v78 = v38;
                    v82 = 0u;
                    v83 = 0u;
                    v80 = 0u;
                    v81 = 0u;
                    v44 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v80, v84, 16, v58);
                    if (v44)
                    {
                      v45 = v44;
                      v46 = *(_QWORD *)v81;
LABEL_25:
                      v47 = 0;
                      while (1)
                      {
                        if (*(_QWORD *)v81 != v46)
                          objc_enumerationMutation(a3);
                        v48 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v47);
                        if (v42 == (double)(*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v48, 12)
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v48, 15) == v41
                          && (id)(*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v48, 16) == v34
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v48, 24) == v40
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v48, 25) == v37
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v48, 4) == v79
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v48, 20) == v78
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v48, 21) == v77
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v48, 23) == a14
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v48, 22) == __memorySearchValues[v74])
                        {
                          return v48;
                        }
                        if (v45 == (id)++v47)
                        {
                          v45 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
                          if (v45)
                            goto LABEL_25;
                          break;
                        }
                      }
                    }
                    v38 = 0;
                    if (v75 == 1)
                    {
                      v49 = a11;
                      v43 = 2;
                      goto LABEL_45;
                    }
                    v39 = a12;
                    v43 = 3;
                  }
                  while (v75 == 2);
                  if (v75 != 3)
                    break;
                  v38 = 0;
                  v39 = 0;
                  v43 = 4;
                }
                v32 = a6;
                if (!a6 || v41 != a6)
                  break;
                v41 = 0;
                v39 = a12;
                v38 = a11;
                v43 = 1;
                if (__PAIR128__(a12, a11) == 0)
                {
                  v38 = v77;
                  v49 = v78;
                  v43 = 4;
                  goto LABEL_45;
                }
              }
              v31 = v72;
              if (v72 && v40 == v72)
              {
                v40 = 0;
                v38 = a11;
                if (__PAIR128__(a12, a11) == 0)
                  v38 = v78;
                v39 = a12;
                if (__PAIR128__(a12, a11) == 0)
                  v39 = v77;
                goto LABEL_76;
              }
              if (a10 && v79)
              {
                v51 = v66;
                if ((v69 & 1) != 0)
                  v51 = 0;
                v79 = v51;
                v38 = a11;
                if (__PAIR128__(a12, a11) == 0)
                  v38 = v78;
                v39 = a12;
                if (__PAIR128__(a12, a11) == 0)
                  v39 = v77;
                v69 = 1;
                goto LABEL_75;
              }
              if (a9 && v37)
              {
                v69 = 0;
                --v37;
                v79 = a10;
                v39 = a12;
                v38 = a11;
LABEL_75:
                v40 = v72;
LABEL_76:
                v41 = a6;
                goto LABEL_22;
              }
              v50 = v42 + (double)v65;
              if ((v65 & 0x8000000000000000) == 0)
                break;
              v69 = 0;
              v79 = a10;
              v39 = a12;
              v38 = a11;
              v40 = v72;
              v41 = a6;
              v42 = a5;
              v65 = 1;
              v37 = a9;
              v43 = v71;
              if (v50 > 0.0)
              {
                v65 = -1;
                v37 = a9;
                v41 = a6;
                v79 = a10;
                v38 = a12;
                v49 = a11;
                v40 = v72;
                goto LABEL_61;
              }
            }
            if (v50 > v28)
              break;
            v69 = 0;
            v37 = a9;
            v79 = a10;
            v38 = a12;
            v49 = a11;
            v40 = v72;
            v41 = a6;
LABEL_61:
            v42 = v50;
            v43 = v71;
LABEL_45:
            v39 = v38;
            v38 = v49;
          }
          if ((v64 & 1) == 0)
          {
            v33 = v67;
            if (v62 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v54 = 0;
            }
            else
            {
              if (v62 >= (unint64_t)v60)
              {
                a14 = v63;
                v32 = a6;
                break;
              }
              v54 = v62 + 1;
            }
            v62 = v54;
            a14 = (int64_t)objc_msgSend(objc_msgSend(a15, "objectAtIndex:"), "integerValue");
            v32 = a6;
            goto LABEL_21;
          }
          v33 = v67;
          v52 = a14 | v67;
          a14 = 0;
          v53 = v52 == 0;
        }
        while (v63 && !v53);
        if (!a7)
          goto LABEL_96;
        if (v61)
        {
          if (v59 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v59 = 0;
            v55 = objc_msgSend(a16, "objectAtIndex:", 0);
          }
          else
          {
            if (v59 >= (unint64_t)v58)
              goto LABEL_96;
            v55 = objc_msgSend(a16, "objectAtIndex:", ++v59);
          }
          v29 = objc_msgSend(v55, "integerValue");
          continue;
        }
        break;
      }
      v29 = 0;
      v30 = a14;
      if (v34)
        goto LABEL_14;
LABEL_96:
      v48 = 0;
      if (v74-- <= 0)
        return v48;
    }
  }
  return 0;
}

+ (id)bestMatchUsingImages:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6
{
  return objc_msgSend((id)objc_opt_class(a1, a2), "bestMatchUsingImages:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:", a3, a5, a6, 0, 0, 0, a4, 0);
}

+ (id)bestMatchUsingImages:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8
{
  return objc_msgSend((id)objc_opt_class(a1, a2), "bestMatchUsingImages:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:", a3, a5, a6, 0, 0, 0, a4, 0);
}

+ (id)bestMatchUsingImages:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 displayGamut:(unint64_t)a6 deviceSubtype:(unint64_t)a7 sizeClassHorizontal:(int64_t)a8 sizeClassVertical:(int64_t)a9
{
  return objc_msgSend((id)objc_opt_class(a1, a2), "bestMatchUsingImages:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:", a3, a5, a7, a6, 0, 0, a4, 0);
}

+ (id)bestMatchUsingImages:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(unint64_t)a7 layoutDirection:(unint64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10
{
  id v18;

  v18 = +[NSMutableArray array](NSMutableArray, "array");
  if (a5 == 5)
    CUIWatchSubTypeFallbackOrder(a6, v18);
  objc_msgSend(v18, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  return objc_msgSend(a1, "bestMatchUsingObjects:getAttributeValueUsing:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:deploymentTarget:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsFeatureSetClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:", a3, &__block_literal_global_12_0, a5, a6, a7, 0, a4, a8, a9, a10, 0, 0, 0, v18);
}

id __140__CUICatalog_bestMatchUsingImages_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  id result;
  double v6;

  result = 0;
  switch(a3)
  {
    case 12:
      objc_msgSend(a2, "scale", v3, v4);
      result = (id)(uint64_t)v6;
      break;
    case 15:
      result = objc_msgSend(a2, "idiom");
      break;
    case 16:
      result = objc_msgSend(a2, "subtype");
      break;
    case 20:
      result = objc_msgSend(a2, "sizeClassHorizontal");
      break;
    case 21:
      result = objc_msgSend(a2, "sizeClassVertical");
      break;
    case 22:
      result = objc_msgSend(a2, "memoryClass");
      break;
    case 23:
      result = objc_msgSend(a2, "graphicsClass");
      break;
    case 24:
      result = objc_msgSend(a2, "displayGamut");
      break;
    default:
      return result;
  }
  return result;
}

- (CUICatalog)initWithName:(id)a3 fromBundle:(id)a4
{
  return -[CUICatalog initWithName:fromBundle:error:](self, "initWithName:fromBundle:error:", a3, a4, 0);
}

- (int64_t)platform
{
  return (int64_t)objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "deploymentPlatform");
}

- (id)_nameForLocalizationIdentifier:(int64_t)a3
{
  return objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "nameForLocalizationIdentifier:", (unsigned __int16)a3);
}

- (CUICatalog)initWithURL:(id)a3 error:(id *)a4
{
  CUICatalog *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CUICatalog;
  v6 = -[CUICatalog init](&v9, sel_init);
  if (v6)
  {
    if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a4)
      && (*((_BYTE *)v6 + 82) |= 1u,
          v6->_assetStoreName = (NSString *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "URLByDeletingPathExtension"), "lastPathComponent"), "copy"), v7 = +[CUIThemeFacet themeWithContentsOfURL:error:](CUIThemeFacet, "themeWithContentsOfURL:error:", a3, a4), (v6->_storageRef = v7) != 0))
    {
      -[CUICatalog lookupCache](v6, "lookupCache");
      -[CUICatalog negativeCache](v6, "negativeCache");
      -[CUICatalog localObjectCache](v6, "localObjectCache");
      -[CUICatalog _setPreferredLocalization:](v6, "_setPreferredLocalization:", 0);
    }
    else
    {
      v6->_storageRef = 0x7FFFFFFFFFFFFFFFLL;

      return 0;
    }
  }
  return v6;
}

- (CUICatalog)initWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  CUICatalog *v8;
  CUICatalog *v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CUICatalog;
  v8 = -[CUICatalog init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    *((_BYTE *)v8 + 82) |= 1u;
    v10 = +[CUIThemeFacet themeWithBytes:length:error:](CUIThemeFacet, "themeWithBytes:length:error:", a3, a4, a5);
    v9->_storageRef = v10;
    if (v10)
    {
      -[CUICatalog lookupCache](v9, "lookupCache");
      -[CUICatalog negativeCache](v9, "negativeCache");
      -[CUICatalog localObjectCache](v9, "localObjectCache");
      -[CUICatalog _setPreferredLocalization:](v9, "_setPreferredLocalization:", 0);
    }
    else
    {
      v9->_storageRef = 0x7FFFFFFFFFFFFFFFLL;

      return 0;
    }
  }
  return v9;
}

- (void)_resourceUnPinnedNotification:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (self->_storageMapTable)
  {
    v5 = objc_msgSend(a3, "userInfo");
    v6 = objc_msgSend(v5, "objectForKey:", _NSBundleResourceRequestAssetPackNotificationAssetPackIDKey);
    v7 = NSMapGet(self->_storageMapTable, v6);
    if (v7)
    {
      v8 = (uint64_t)v7;
      objc_msgSend(objc_msgSend(a3, "object"), "bundleIdentifier");
      _CUILog(3, (uint64_t)"CoreUI: -[CUICatalog _resourceUnPinnedNotification:] for themeRef '%d' (for bundle identifier '%@' and asset pack identifier '%@').", v9, v10, v11, v12, v13, v14, v8);
      +[CUIThemeFacet themeUnregisterThemeRef:](CUIThemeFacet, "themeUnregisterThemeRef:", v8);
    }
    else
    {
      v15 = objc_msgSend(objc_msgSend(a3, "object"), "bundleIdentifier");
      _CUILog(3, (uint64_t)"CoreUI: -[CUICatalog _resourceUnPinnedNotification:] did not find themeRef for for bundle identifier '%@' and asset pack identifier '%@'.", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    }
    NSMapRemove(self->_storageMapTable, v6);
  }
}

- (id)_recognitionImageWithName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id result;
  id v18;
  unint64_t v19;
  CUINamedRecognitionImage *v20;
  unsigned __int8 v21;

  v21 = 0;
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  v10 = __getDeviceTraits___deviceIdiom;
  v11 = __getDeviceTraits___deviceSubtype;
  v12 = __getDeviceTraits___deviceDisplayGamut;
  v13 = __getDeviceTraits___deviceMemoryClass;
  v14 = __getDeviceTraits___deviceGraphicsClass;
  v15 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  v16 = __getDeviceTraits___deviceSubtypeFallbackOrder;
  _CUILog(3, (uint64_t)"-[CUICatalog _recognitionImageWithName:%@]", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)a3);
  result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, v10, v11, v12, 0, 0, 1.0, 0, v13, v14, v15, v16, 0, 0, 0);
  if (result)
  {
    v18 = result;
    if (objc_msgSend(result, "themePart") == (id)220)
      return 0;
    v19 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", v18, &v21);
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      v20 = -[CUINamedRecognitionImage initWithName:usingRenditionKey:fromTheme:]([CUINamedRecognitionImage alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v18, v19);
      -[CUINamedLookup setRepresentsOnDemandContent:](v20, "setRepresentsOnDemandContent:", v21);
      return v20;
    }
  }
  return result;
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:", a3, 0, 0, a4);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 locale:(id)a5
{
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, __getDeviceTraits___deviceIdiom, __getDeviceTraits___deviceSubtype, __getDeviceTraits___deviceDisplayGamut, 0, 0, a4, 0, 0, a5);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 appearanceName:(id)a5
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:appearanceName:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:appearanceName:", a3, 0, 0, a5, a4);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, 0, 0, a5, a6, 0, a4, 0, 0, 0);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6 appearanceName:(id)a7
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, 0, 0, a5, a6, 0, a4, 0, a7, 0);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6 appearanceName:(id)a7 locale:(id)a8
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, 0, 0, a5, a6, 0, a4, 0, a7, a8);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:appearanceName:](self, "imageWithName:scaleFactor:deviceIdiom:appearanceName:", a3, a5, 0, a4);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 appearanceName:(id)a6
{
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:appearanceName:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:appearanceName:", a3, a5, __getDeviceTraits___deviceSubtype, a6, a4);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:", a3, a5, a6, 0, 0, a4);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 appearanceName:(id)a7
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:appearanceName:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:appearanceName:", a3, a5, a6, 0, 0, a7, a4);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8
{
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:", a3, a5, a6, __getDeviceTraits___deviceDisplayGamut, 0, a7, a4, a8);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8 appearanceName:(id)a9
{
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:", a3, a5, a6, __getDeviceTraits___deviceDisplayGamut, 0, a7, a4, a8, a9);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, a5, a6, a7, a8, a9, a4, a10, 0, 0);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(int64_t)a11 graphicsClass:(int64_t)a12
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, a5, a6, a7, a8, a9, a4);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 graphicsFallBackOrder:(id)a13 deviceSubtypeFallBackOrder:(id)a14
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:", a3, a5, a6, a7, a8, a9, a4, a10, a11, a12, 0, a13, a14, 0);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 appearanceIdentifier:(int64_t)a13 graphicsFallBackOrder:(id)a14 deviceSubtypeFallBackOrder:(id)a15
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:", a3, a5, a6, a7, a8, a9, a4, a10, a11, a12, a13, a14, a15, 0);
}

- (id)iconImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 desiredSize:(CGSize)a11
{
  return -[CUICatalog iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:](self, "iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:", a3, a5, a6, a7, a8, a9, a4, a11.width, a11.height, a10, 0);
}

- (id)iconImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 desiredSize:(CGSize)a11 appearanceName:(id)a12
{
  CGFloat height;
  double width;
  uint64_t v21;
  uint64_t v22;
  NSArray *v24;
  id v25;
  id v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  id v31;
  CUINamedMultisizeImageSet *v32;
  id v33;
  id v34;
  void *v35;
  NSMutableArray *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  id v41;
  id v42;
  id v43;
  CUINamedMultisizeImageSet *v44;
  double v45;
  double v46;
  id v47;
  char *v48;
  char *v49;
  int64_t v50;
  int64_t v51;
  int64_t v52;
  unsigned int v53;
  char *v54;
  unsigned int v55;
  id v56;
  double v57;
  double v58;
  unsigned int v59;
  int64_t v60;
  int64_t v61;
  unsigned int v62;
  id v63;
  id v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
  id v74;
  unint64_t storageRef;
  id v76;
  id v77;
  CUICatalog *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  CUINamedMultisizeImage *v85;
  int64_t v87;
  CUINamedMultisizeImageSet *v88;
  CUINamedMultisizeImageSet *v89;
  CUINamedMultisizeImageSet *v90;
  int64_t v91;
  unint64_t v92;
  void *v93;
  unint64_t v94;
  NSArray *obj;
  int64_t v96;
  uint64_t v97;
  CUICatalog *v98;
  _QWORD v100[6];
  _QWORD v101[5];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[5];
  _QWORD v107[5];
  unsigned __int8 v108;
  _BYTE v109[128];
  NSNumber *v110;

  height = a11.height;
  width = a11.width;
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  v97 = 0;
  v21 = __getDeviceTraits___deviceIdiom;
  v22 = __getDeviceTraits___deviceSubtype;
  obj = (NSArray *)__getDeviceTraits___deviceSubtypeFallbackOrder;
  if (self && a12)
    v97 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "appearanceIdentifierForName:", a12);
  if (v21 != a5 || v22 != a6)
  {
    if (a5 == 5)
    {
      v24 = (NSArray *)+[NSMutableArray array](NSMutableArray, "array");
      CUIWatchSubTypeFallbackOrder(a6, v24);
      obj = v24;
      -[NSArray addObject:](v24, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    }
    else
    {
      v110 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
      obj = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v110, 1);
    }
  }
  _CUILog(3, (uint64_t)"-[CUICatalog iconImageWithName:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d sizeClassHorizontal:%d sizeClassVertical:%d desiredSize:%fx%f appearanceName:%@]", (uint64_t)a3, a5, a6, a7, a8, a9, (uint64_t)a3);
  v25 = objc_alloc_init((Class)NSMutableSet);
  v26 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a5, a6, 0, 0, 0, 1.0, 0, 0, 0, 0, obj, 0, sel__baseMultisizeImageSetKeyForName_, 0,
          *(_QWORD *)&width,
          *(_QWORD *)&height,
          a12);
  if (!v26)
    goto LABEL_60;
  v27 = v26;
  v108 = 0;
  v28 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", v26, &v108);
  if (v28 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_60;
  v29 = v28;
  objc_msgSend(v25, "addObject:", v27);
  v90 = -[CUINamedMultisizeImageSet initWithName:usingRenditionKey:fromTheme:]([CUINamedMultisizeImageSet alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v27, v29);
  if (!v90)
    goto LABEL_60;
  v96 = a5;
  v98 = self;
  v93 = v27;
  if (objc_msgSend(v27, "themeSubtype"))
  {
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke;
    v107[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
    v107[4] = v97;
    v30 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a5, 0, 0, 0, 0, 1.0, 0, 0, 0, 0, obj, 0, sel__baseMultisizeImageSetKeyForName_, v107);
    if (v30 && (objc_msgSend(v25, "containsObject:", v30) & 1) == 0)
    {
      objc_msgSend(v25, "addObject:", v30);
      v89 = -[CUINamedMultisizeImageSet initWithName:usingRenditionKey:fromTheme:]([CUINamedMultisizeImageSet alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v30, v29);
    }
    else
    {
      v89 = 0;
    }
  }
  else
  {
    v89 = 0;
    v30 = 0;
  }
  v87 = a9;
  v31 = objc_msgSend(v93, "themeIdiom");
  v32 = 0;
  v91 = a7;
  if (v30 && v31)
  {
    if (objc_msgSend(v30, "themeIdiom")
      && (v106[0] = _NSConcreteStackBlock,
          v106[1] = 3221225472,
          v106[2] = __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_2,
          v106[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l,
          v106[4] = v97,
          (v33 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, 0, 0, 0, 0, 0, 1.0, 0, 0, 0, 0, 0, 0, sel__baseMultisizeImageSetKeyForName_, v106)) != 0)
      && (v34 = v33, (objc_msgSend(v25, "containsObject:", v33) & 1) == 0))
    {
      objc_msgSend(v25, "addObject:", v34);
      v32 = -[CUINamedMultisizeImageSet initWithName:usingRenditionKey:fromTheme:]([CUINamedMultisizeImageSet alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v34, v29);
    }
    else
    {
      v32 = 0;
    }
  }
  v94 = v29;
  v35 = v25;
  v92 = a6;
  v36 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[CUINamedMultisizeImageSet sizeIndexes](v90, "sizeIndexes"));
  -[NSMutableArray addObjectsFromArray:](v36, "addObjectsFromArray:", -[CUINamedMultisizeImageSet sizeIndexes](v89, "sizeIndexes"));
  v88 = v32;
  -[NSMutableArray addObjectsFromArray:](v36, "addObjectsFromArray:", -[CUINamedMultisizeImageSet sizeIndexes](v32, "sizeIndexes"));
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v37 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(_QWORD *)v103 != v39)
          objc_enumerationMutation(obj);
        v41 = objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)i), "integerValue");
        v101[0] = _NSConcreteStackBlock;
        v101[1] = 3221225472;
        v101[2] = __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_3;
        v101[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
        v101[4] = v97;
        v42 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](v98, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a5, v41, 0, 0, 0, 1.0, 0, 0, 0, 0, 0, 0, sel__baseMultisizeImageSetKeyForName_, v101);
        if (v42)
        {
          v43 = v42;
          if ((objc_msgSend(v35, "containsObject:", v42) & 1) == 0)
          {
            objc_msgSend(v35, "addObject:", v43);
            v44 = -[CUINamedMultisizeImageSet initWithName:usingRenditionKey:fromTheme:]([CUINamedMultisizeImageSet alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v43, v94);
            -[NSMutableArray addObjectsFromArray:](v36, "addObjectsFromArray:", -[CUINamedMultisizeImageSet sizeIndexes](v44, "sizeIndexes"));

          }
        }
      }
      v38 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
    }
    while (v38);
  }
  v45 = CGSizeZero.width;
  v46 = CGSizeZero.height;
  v47 = -[NSMutableArray sortedArrayUsingComparator:](v36, "sortedArrayUsingComparator:", &__block_literal_global_41);
  v48 = (char *)objc_msgSend(v47, "count");
  if (v48)
  {
    v49 = v48;
    v51 = a8;
    v50 = v87;
    v52 = v91;
    while (1)
    {
      width = (double)width;
      v53 = objc_msgSend(objc_msgSend(v47, "objectAtIndex:", v49 - 1), "index");
      v54 = 0;
      v55 = -1;
      while (1)
      {
        v56 = objc_msgSend(v47, "objectAtIndex:", v54);
        objc_msgSend(v56, "size");
        v58 = v57;
        if (v57 >= width)
          break;
        ++v54;
        ++v55;
        if (v49 == v54)
        {
          v54 = v49;
          goto LABEL_51;
        }
      }
      v59 = objc_msgSend(v56, "index");
      v53 = v59;
      if (v54)
      {
        v60 = v51;
        v61 = v50;
        v62 = v59;
        v63 = objc_msgSend(v47, "objectAtIndex:", v54);
        while ((v55 & 0x80000000) == 0)
        {
          v64 = objc_msgSend(v47, "objectAtIndex:", v55);
          objc_msgSend(v64, "size");
          v66 = v65;
          objc_msgSend(v63, "size");
          if (v66 == v67)
          {
            objc_msgSend(v64, "size");
            v69 = v68;
            objc_msgSend(v63, "size");
            --v55;
            if (v69 == v70)
              continue;
          }
          objc_msgSend(v64, "size");
          v45 = v71;
          v46 = v72;
          break;
        }
        v53 = v62;
        v50 = v61;
        v51 = v60;
        v52 = v91;
      }
LABEL_51:
      v73 = v53;
      v74 = objc_msgSend(v93, "copy");
      objc_msgSend(v74, "setThemePart:", 220);
      storageRef = v98->_storageRef;
      v100[0] = _NSConcreteStackBlock;
      v100[1] = 3221225472;
      v100[2] = __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_5;
      v100[3] = &__block_descriptor_48_e25_v16__0__CUIRenditionKey_8l;
      v100[4] = v73;
      v100[5] = v97;
      v76 = -[CUICatalog _resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:](v98, "_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:", storageRef, v74, v96, v92, v52, v51, a4, v50, a10, 0, 0, 0, obj, 0, v100);

      if (v58 < width || v76 || (unint64_t)v49 < 2)
        break;
      v77 = objc_msgSend(v47, "mutableCopy");
      objc_msgSend(v77, "removeObjectAtIndex:", v54);
      v47 = v77;
      v49 = (char *)objc_msgSend(v47, "count");
      v78 = v98;
      if (!v49)
        goto LABEL_57;
    }
  }
  else
  {
    v78 = v98;
LABEL_57:
    objc_msgSend(objc_msgSend(-[CUICatalog _themeStore](v78, "_themeStore"), "themeStore"), "path");
    _CUILog(4, (uint64_t)"CoreUI: icon image with name '%@' has no sizes indexes at '%@'", v79, v80, v81, v82, v83, v84, (uint64_t)a3);
    v76 = 0;
  }

  v25 = v35;
  if (v76)
  {
    v85 = -[CUINamedImage initWithName:usingRenditionKey:fromTheme:]([CUINamedMultisizeImage alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v76, v94);
    -[CUINamedLookup setRepresentsOnDemandContent:](v85, "setRepresentsOnDemandContent:", v108);
    -[CUINamedMultisizeImage setNextSizeSmaller:](v85, "setNextSizeSmaller:", v45, v46);
  }
  else
  {
LABEL_60:
    v85 = 0;
  }

  return v85;
}

id __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

id __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

id __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

uint64_t __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v13;
  id v14;
  id v15;
  id v16;

  objc_msgSend(a2, "size");
  v6 = v5;
  objc_msgSend(a2, "size");
  v8 = v6 * v7;
  objc_msgSend(a3, "size");
  v10 = v9;
  objc_msgSend(a3, "size");
  if (v8 < v10 * v11)
    return -1;
  if (v8 > v10 * v11)
    return 1;
  v13 = objc_msgSend(a2, "subtype");
  if (v13 < objc_msgSend(a3, "subtype"))
    return 1;
  v14 = objc_msgSend(a2, "subtype");
  if (v14 > objc_msgSend(a3, "subtype"))
    return -1;
  v15 = objc_msgSend(a2, "idiom");
  if ((uint64_t)v15 < (uint64_t)objc_msgSend(a3, "idiom"))
    return 1;
  v16 = objc_msgSend(a2, "idiom");
  if ((uint64_t)v16 <= (uint64_t)objc_msgSend(a3, "idiom"))
    return 0;
  else
    return -1;
}

id __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_5(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setThemeDimension2:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 40));
}

- (BOOL)imageExistsWithName:(id)a3
{
  return objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3) != 0;
}

id __150__CUICatalog__dataWithName_deviceIdiom_deviceSubtype_memoryClass_graphicsClass_appearanceIdentifier_graphicsFallBackOrder_deviceSubtypeFallBackOrder___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

- (id)dataWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 memoryClass:(unint64_t)a6 graphicsClass:(unint64_t)a7 graphicsFallBackOrder:(id)a8 deviceSubtypeFallBackOrder:(id)a9
{
  return -[CUICatalog dataWithName:deviceIdiom:deviceSubtype:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:](self, "dataWithName:deviceIdiom:deviceSubtype:memoryClass:graphicsClass:appearanceIdentifier:graphicsFallBackOrder:deviceSubtypeFallBackOrder:", a3, a4, a5, a6, a7, 0, a8, a9);
}

- (id)textStyleWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 displayGamut:(int64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8
{
  return -[CUICatalog textStyleWithName:deviceIdiom:deviceSubtype:displayGamut:sizeClassHorizontal:sizeClassVertical:appearanceName:](self, "textStyleWithName:deviceIdiom:deviceSubtype:displayGamut:sizeClassHorizontal:sizeClassVertical:appearanceName:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)textStyleWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 displayGamut:(int64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8 appearanceName:(id)a9
{
  uint64_t v16;
  id result;
  id v18;
  unint64_t v19;
  char v20;
  _QWORD v21[5];

  v16 = 0;
  if (self && a9)
    v16 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "appearanceIdentifierForName:", a9);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __124__CUICatalog_textStyleWithName_deviceIdiom_deviceSubtype_displayGamut_sizeClassHorizontal_sizeClassVertical_appearanceName___block_invoke;
  v21[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v21[4] = v16;
  result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a4, a5, a6, 0, a7, 1.0, a8, 0, 0, 0, 0, 0, 0, v21);
  if (result)
  {
    v18 = result;
    v20 = 0;
    v19 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", result, &v20);
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return -[CUITextStyle initWithName:usingRenditionKey:fromTheme:]([CUITextStyle alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v18, v19);
  }
  return result;
}

id __124__CUICatalog_textStyleWithName_deviceIdiom_deviceSubtype_displayGamut_sizeClassHorizontal_sizeClassVertical_appearanceName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

- (id)textStyleWithName:(id)a3 displayGamut:(int64_t)a4
{
  return -[CUICatalog textStyleWithName:displayGamut:appearanceName:](self, "textStyleWithName:displayGamut:appearanceName:", a3, a4, 0);
}

- (id)textStyleWithName:(id)a3 displayGamut:(int64_t)a4 appearanceName:(id)a5
{
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  return -[CUICatalog textStyleWithName:deviceIdiom:deviceSubtype:displayGamut:sizeClassHorizontal:sizeClassVertical:](self, "textStyleWithName:deviceIdiom:deviceSubtype:displayGamut:sizeClassHorizontal:sizeClassVertical:", a3, __getDeviceTraits___deviceIdiom, __getDeviceTraits___deviceSubtype, a4, 0, 0);
}

- (id)_namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 displayGamut:(int64_t)a6 deviceSubtype:(unint64_t)a7 memoryClass:(unint64_t)a8 graphicsClass:(unint64_t)a9 graphicsFallBackOrder:(id)a10 deviceSubtypeFallBackOrder:(id)a11
{
  id v17;
  id result;
  id v19;
  unint64_t v20;
  CUINamedImageAtlas *v21;
  unsigned __int8 v23;

  v23 = 0;
  v17 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a5, a7, a6, 0, 0, a4, 0, a8, a9, a10, a11, 0, sel__baseAtlasKeyForName_, 0);
  if (v17
    || (result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a5, a7, a6, 0, 0, 0.0, 0, a8, a9, a10, a11, 0, sel__baseAtlasKeyForName_, 0),
        (v17 = result) != 0))
  {
    v19 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, 0, 0, 0, 0, 0, 1.0, 0, 0, 0, 0, 0, 0, sel__baseAtlasContentsKeyForName_, 0);
    v20 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", v17, &v23);
    result = 0;
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = -[CUINamedImageAtlas initWithName:usingRenditionKey:withContents:contentsFromCatalog:fromTheme:withSourceThemeRef:]([CUINamedImageAtlas alloc], "initWithName:usingRenditionKey:withContents:contentsFromCatalog:fromTheme:withSourceThemeRef:", a3, v17, v19, self, v20, -[CUICatalog _themeRef](self, "_themeRef"));
      -[CUINamedLookup setRepresentsOnDemandContent:](v21, "setRepresentsOnDemandContent:", v23);
      return v21;
    }
  }
  return result;
}

- (id)namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 displayGamut:(int64_t)a6 deviceSubtype:(unint64_t)a7 memoryClass:(unint64_t)a8 graphicsClass:(unint64_t)a9 graphicsFallBackOrder:(id)a10 deviceSubtypeFallBackOrder:(id)a11
{
  unsigned int v19;
  id v20;

  v19 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace(726663173, 3, v19, 0, 0);
  v20 = -[CUICatalog _namedImageAtlasWithName:scaleFactor:deviceIdiom:displayGamut:deviceSubtype:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:](self, "_namedImageAtlasWithName:scaleFactor:deviceIdiom:displayGamut:deviceSubtype:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:", a3, a5, a6, a7, a8, a9, a4, a10, a11);
  kdebug_trace(726663174, 3, 0, 0, 0);
  return v20;
}

- (id)namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4
{
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  return -[CUICatalog namedImageAtlasWithName:scaleFactor:deviceIdiom:displayGamut:deviceSubtype:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:](self, "namedImageAtlasWithName:scaleFactor:deviceIdiom:displayGamut:deviceSubtype:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:", a3, __getDeviceTraits___deviceIdiom, __getDeviceTraits___deviceDisplayGamut, __getDeviceTraits___deviceSubtype, __getDeviceTraits___deviceMemoryClass, __getDeviceTraits___deviceGraphicsClass, a4, __getDeviceTraits___deviceGraphicsFallbackOrder, __getDeviceTraits___deviceSubtypeFallbackOrder);
}

- (id)namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5
{
  uint64_t v9;

  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  if (__getDeviceTraits___deviceIdiom == a5)
    v9 = __getDeviceTraits___deviceSubtype;
  else
    v9 = 0;
  return -[CUICatalog namedImageAtlasWithName:scaleFactor:deviceIdiom:displayGamut:deviceSubtype:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:](self, "namedImageAtlasWithName:scaleFactor:deviceIdiom:displayGamut:deviceSubtype:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:", a3, a5, __getDeviceTraits___deviceDisplayGamut, v9, __getDeviceTraits___deviceMemoryClass, __getDeviceTraits___deviceGraphicsClass, a4, __getDeviceTraits___deviceGraphicsFallbackOrder, __getDeviceTraits___deviceSubtypeFallbackOrder);
}

- (id)namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(unint64_t)a5
{
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  return -[CUICatalog namedImageAtlasWithName:scaleFactor:deviceIdiom:displayGamut:deviceSubtype:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:](self, "namedImageAtlasWithName:scaleFactor:deviceIdiom:displayGamut:deviceSubtype:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:", a3, __getDeviceTraits___deviceIdiom, a5, __getDeviceTraits___deviceSubtype, __getDeviceTraits___deviceMemoryClass, __getDeviceTraits___deviceGraphicsClass, a4, __getDeviceTraits___deviceGraphicsFallbackOrder, __getDeviceTraits___deviceSubtypeFallbackOrder);
}

- (id)parentNamedImageAtlasForImageNamed:(id)a3 scaleFactor:(double)a4 displayGamut:(unint64_t)a5
{
  id result;
  id v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  unsigned int v15;
  id v16;
  char v17;

  v17 = 0;
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, __getDeviceTraits___deviceIdiom, __getDeviceTraits___deviceSubtype, a5, 0, 0, a4, 0, __getDeviceTraits___deviceMemoryClass, __getDeviceTraits___deviceGraphicsClass, __getDeviceTraits___deviceGraphicsFallbackOrder, __getDeviceTraits___deviceSubtypeFallbackOrder, 0, 0, 0);
  if (result)
  {
    v10 = result;
    v11 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", result, &v17);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    v13 = (void *)_LookupStructuredThemeProvider(v11, v12);
    v14 = objc_msgSend(v13, "renditionWithKey:usingKeySignature:", objc_msgSend(v10, "keyList"), 0);
    v15 = objc_msgSend(v14, "isInternalLink");
    result = 0;
    if (v15)
    {
      v16 = objc_msgSend(v14, "linkingToRendition");
      if (objc_msgSend(v16, "themeElement") != (id)9 || objc_msgSend(v16, "themePart") != (id)181)
        return 0;
      return objc_msgSend(v13, "renditionNameForKeyList:", objc_msgSend(v16, "keyList"));
    }
  }
  return result;
}

- (id)parentNamedImageAtlastForImageNamed:(id)a3 scaleFactor:(double)a4
{
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  return -[CUICatalog parentNamedImageAtlasForImageNamed:scaleFactor:displayGamut:](self, "parentNamedImageAtlasForImageNamed:scaleFactor:displayGamut:", a3, __getDeviceTraits___deviceDisplayGamut, a4);
}

- (void)preloadNamedAtlasWithScaleFactor:(double)a3 andNames:(id)a4 completionHandler:(id)a5
{
  NSObject *global_queue;
  _QWORD v10[8];

  global_queue = dispatch_get_global_queue(17, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __74__CUICatalog_preloadNamedAtlasWithScaleFactor_andNames_completionHandler___block_invoke;
  v10[3] = &unk_1E41B8D40;
  v10[4] = a4;
  v10[5] = self;
  *(double *)&v10[7] = a3;
  v10[6] = a5;
  dispatch_async(global_queue, v10);
}

void __74__CUICatalog_preloadNamedAtlasWithScaleFactor_andNames_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  NSDictionary *v4;
  __CFArray *v5;
  void *i;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  CUINamedImageAtlas *v12;
  const __CFArray *v13;
  CFIndex Count;
  CFIndex v15;
  CFIndex j;
  CGImage *ValueAtIndex;
  uint64_t ImageProvider;
  uint64_t v19;
  double Width;
  size_t Height;
  const void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  unsigned __int8 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CFArrayCallBacks callBacks;
  const __CFString *v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;
  uint64_t v45;

  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  v2 = __getDeviceTraits___deviceIdiom;
  v32 = __getDeviceTraits___deviceDisplayGamut;
  v33 = __getDeviceTraits___deviceSubtype;
  v30 = __getDeviceTraits___deviceGraphicsClass;
  v31 = __getDeviceTraits___deviceMemoryClass;
  v28 = __getDeviceTraits___deviceSubtypeFallbackOrder;
  v29 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v25 = objc_alloc_init((Class)NSMutableArray);
  callBacks.version = 0;
  callBacks.retain = (CFArrayRetainCallBack)__blockSetRetain;
  callBacks.copyDescription = 0;
  callBacks.equal = 0;
  callBacks.release = (CFArrayReleaseCallBack)__blockSetRelease;
  v44 = kCGImageBlockFormatRequest;
  v45 = kCGImageBlockFormatBGRx8;
  v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &callBacks);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = *(id *)(a1 + 32);
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v34)
  {
    v27 = *(_QWORD *)v37;
    v23 = v2;
    v24 = v3;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v8 = objc_msgSend(*(id *)(a1 + 40), "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", v7, v2, v33, v32, 0, 0, *(double *)(a1 + 56), 0, v31, v30, v29, v28, 0, sel__baseAtlasKeyForName_, 0);
        if (v8
          && (v9 = v8,
              v35 = 0,
              v10 = objc_msgSend(*(id *)(a1 + 40), "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", v7, 0, 0, 0, 0, 0, 1.0, 0, 0, 0, 0, 0, 0, sel__baseAtlasContentsKeyForName_, 0),
              v11 = objc_msgSend(*(id *)(a1 + 40), "_storageRefForRendition:representsODRContent:", v9, &v35),
              v11 != (id)0x7FFFFFFFFFFFFFFFLL))
        {
          v12 = -[CUINamedImageAtlas initWithName:usingRenditionKey:withContents:contentsFromCatalog:fromTheme:withSourceThemeRef:]([CUINamedImageAtlas alloc], "initWithName:usingRenditionKey:withContents:contentsFromCatalog:fromTheme:withSourceThemeRef:", v7, v9, v10, *(_QWORD *)(a1 + 40), v11, objc_msgSend(*(id *)(a1 + 40), "_themeRef"));
          -[CUINamedLookup setRepresentsOnDemandContent:](v12, "setRepresentsOnDemandContent:", v35);
          v13 = -[CUINamedImageAtlas images](v12, "images");
          Count = CFArrayGetCount(v13);
          if (Count >= 1)
          {
            v15 = Count;
            for (j = 0; j != v15; ++j)
            {
              ValueAtIndex = (CGImage *)CFArrayGetValueAtIndex(v13, j);
              ImageProvider = CGImageGetImageProvider();
              if (ImageProvider)
              {
                v19 = ImageProvider;
                Width = (double)CGImageGetWidth(ValueAtIndex);
                Height = CGImageGetHeight(ValueAtIndex);
                v22 = (const void *)CGImageProviderCopyImageBlockSetWithOptions(v19, v4, 0.0, 0.0, Width, (double)Height, Width, (double)Height);
                CFArrayAppendValue(v5, v22);
                CGImageBlockSetRelease(v22);
              }
            }
          }
          objc_msgSend(v25, "addObject:", v12);

          v2 = v23;
          v3 = v24;
        }
        else
        {
          objc_msgSend(v3, "addObject:", v7);
        }
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v34);
  }
  if (objc_msgSend(v3, "count"))
  {
    v41 = CFSTR("missing keys");
    v42 = v3;
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AssetCatalog"), 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  CFAutorelease(v5);

}

- (id)namedVectorGlyphWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 glyphSize:(int64_t)a6 glyphWeight:(int64_t)a7 glyphPointSize:(double)a8 appearanceName:(id)a9
{
  return -[CUICatalog namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:](self, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:", a3, a5, 5, a6, a7, a9, a4, a8);
}

- (void)_resolveInterpolationSourceRenditionKeysUltralight:(id *)a3 regular:(id *)a4 black:(id *)a5 forName:(id)a6 scaleFactor:(double)a7 deviceIdiom:(int64_t)a8 deviceSubtype:(unint64_t)a9 displayGamut:(int64_t)a10 layoutDirection:(int64_t)a11 sizeClassHorizontal:(int64_t)a12 sizeClassVertical:(int64_t)a13 memoryClass:(unint64_t)a14 graphicsClass:(unint64_t)a15 graphicsFallBackOrder:(id)a16 deviceSubtypeFallBackOrder:(id)a17 appearanceIdentifier:(int64_t)a18 locale:(id)a19
{
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[6];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __295__CUICatalog__resolveInterpolationSourceRenditionKeysUltralight_regular_black_forName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_graphicsFallBackOrder_deviceSubtypeFallBackOrder_appearanceIdentifier_locale___block_invoke;
  v29[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v29[4] = a18;
  *a3 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a6, a8, a9, a13, a14, a15, a16, a17, a19, sel__baseVectorGlyphForName_, v29);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __295__CUICatalog__resolveInterpolationSourceRenditionKeysUltralight_regular_black_forName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_graphicsFallBackOrder_deviceSubtypeFallBackOrder_appearanceIdentifier_locale___block_invoke_2;
  v28[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v28[4] = a18;
  *a4 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a6, a8, a9, a10, a11, a12, a7, a13, a14, a15, a16, a17, a19, sel__baseVectorGlyphForName_, v28);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __295__CUICatalog__resolveInterpolationSourceRenditionKeysUltralight_regular_black_forName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_graphicsFallBackOrder_deviceSubtypeFallBackOrder_appearanceIdentifier_locale___block_invoke_3;
  v27[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v27[4] = a18;
  *a5 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a6, a8, a9, a10, a11, a12, a7, a13, a14, a15, a16, a17, a19, sel__baseVectorGlyphForName_, v27);
}

id __295__CUICatalog__resolveInterpolationSourceRenditionKeysUltralight_regular_black_forName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_graphicsFallBackOrder_deviceSubtypeFallBackOrder_appearanceIdentifier_locale___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
  objc_msgSend(a2, "setThemeGlyphSize:", 1);
  return objc_msgSend(a2, "setThemeGlyphWeight:", 1);
}

id __295__CUICatalog__resolveInterpolationSourceRenditionKeysUltralight_regular_black_forName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_graphicsFallBackOrder_deviceSubtypeFallBackOrder_appearanceIdentifier_locale___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
  objc_msgSend(a2, "setThemeGlyphSize:", 1);
  return objc_msgSend(a2, "setThemeGlyphWeight:", 4);
}

id __295__CUICatalog__resolveInterpolationSourceRenditionKeysUltralight_regular_black_forName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_graphicsFallBackOrder_deviceSubtypeFallBackOrder_appearanceIdentifier_locale___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
  objc_msgSend(a2, "setThemeGlyphSize:", 1);
  return objc_msgSend(a2, "setThemeGlyphWeight:", 9);
}

- (void)finalizeNamedVectorGlyphLookupWithResult:(id)a3 name:(id)a4 glyphContinuousSize:(double)a5 glyphContinuousWeight:(double)a6 pointSize:(double)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 v17;
  unsigned __int16 v18;

  if (!a3 && objc_msgSend(a4, "length") == (id)2)
  {
    objc_msgSend(a4, "getCharacters:", &v17);
    if ((v17 & 0xFC00) == 0xD800
      && (v18 & 0xFC00) == 0xDC00
      && ((v18 + (v17 << 10) - 56613888) & 0xFFFF0000) == 0x100000)
    {
      _CUILog(4, (uint64_t)"CoreUI: Symbol asset lookup attempted with invalid name '%@'. Argument contains Unicode codepoint copied from SF Symbols app. Please use full symbol name instead!", v11, v12, v13, v14, v15, v16, (uint64_t)a4);
    }
  }
  kdebug_trace(726663174, 20, (unint64_t)a7, (unint64_t)a5, (unint64_t)a6);
}

- (id)namedVectorGlyphWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 layoutDirection:(int64_t)a6 glyphContinuousSize:(double)a7 glyphContinuousWeight:(double)a8 glyphPointSize:(double)a9 appearanceName:(id)a10 locale:(id)a11
{
  uint64_t v11;
  id v17;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CUINamedVectorGlyph *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  char v43;
  char **p_type;
  id v45;
  unint64_t v46;
  CUINamedVectorGlyph *v47;
  CUINamedVectorGlyph *v48;
  id v49;
  unint64_t v50;
  CUINamedVectorGlyph *v51;
  id v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[7];
  unsigned __int8 v66;
  NSNumber *v67;

  v17 = a3;
  v53 = a11;
  _CUILog(3, (uint64_t)"-[CUICatalog namedVectorGlyphWithName:%@ scaleFactor:%f deviceIdiom:%d layoutDirection:%d glyphSize:%f glyphWeight:%f glyphPointSize:%f appearanceName:%@ locale:%@]", (uint64_t)a3, a5, a6, (uint64_t)a10, (uint64_t)a11, v11, (uint64_t)a3);
  v19 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", v17), 17);
  kdebug_trace(726663173, 20, v19, (unint64_t)a7, (unint64_t)a8);
  v21 = (void *)_LookupStructuredThemeProvider(self->_storageRef, v20);
  v22 = -[CUICatalog _baseVectorGlyphForName:](self, "_baseVectorGlyphForName:", v17);
  if (v22)
  {
    v23 = v22;
  }
  else if ((objc_opt_respondsToSelector(v21, sel_aliasForName_) & 1) != 0
         && (v24 = objc_msgSend(v21, "aliasForName:", v17)) != 0)
  {
    v25 = v24;
    v23 = -[CUICatalog _baseVectorGlyphForName:](self, "_baseVectorGlyphForName:", v24);
    v17 = v25;
  }
  else
  {
    v23 = 0;
  }
  v27 = objc_msgSend(objc_msgSend(v21, "themeStore"), "renditionInfoForIdentifier:", (unsigned __int16)objc_msgSend(v23, "themeIdentifier"));
  if (a10)
    v58 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v26), "appearanceIdentifierForName:", a10);
  else
    v58 = 0;
  v66 = 0;
  if (a4 <= 0.0 || a9 <= 0.0)
  {
    objc_msgSend(objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "themeStore"), "path");
    _CUILog(4, (uint64_t)"CoreUI: -[CUICatalog namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:] '%@' called with scaleFactor == %f glyphPointSize == %f at '%@'", v31, v32, v33, v34, v35, v36, (uint64_t)v17);
    -[CUICatalog finalizeNamedVectorGlyphLookupWithResult:name:glyphContinuousSize:glyphContinuousWeight:pointSize:](self, "finalizeNamedVectorGlyphLookupWithResult:name:glyphContinuousSize:glyphContinuousWeight:pointSize:", 0, v17, a7, a8, a9);
    return 0;
  }
  else
  {
    if (__getDeviceTraits___getDeviceTraits_once != -1)
      dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
    v56 = __getDeviceTraits___deviceMemoryClass;
    v57 = __getDeviceTraits___deviceDisplayGamut;
    v55 = __getDeviceTraits___deviceGraphicsClass;
    v28 = __getDeviceTraits___deviceGraphicsFallbackOrder;
    if (__getDeviceTraits___deviceIdiom == a5)
    {
      v29 = __getDeviceTraits___deviceSubtype;
      v30 = (NSArray *)__getDeviceTraits___deviceSubtypeFallbackOrder;
    }
    else
    {
      v67 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
      v30 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v67, 1);
      v29 = 0;
    }
    v38 = 0;
    while (*(double *)&kCoreThemeContinuousGlyphSizes[v38] != a7)
    {
      if (++v38 == 3)
      {
        v39 = 0;
        goto LABEL_23;
      }
    }
    v39 = kCoreThemeDiscreteGlyphSizes[v38];
LABEL_23:
    v40 = 0;
    while (kCoreThemeContinuousGlyphWeights[v40] != a8)
    {
      if (++v40 == 9)
      {
        v41 = 0;
        goto LABEL_28;
      }
    }
    v41 = kCoreThemeDiscreteGlyphWeights[v40];
LABEL_28:
    if (v41)
      v42 = v39 == 0;
    else
      v42 = 1;
    v43 = !v42;
    p_type = &stru_1E41D7FF0.type;
LABEL_35:
    v54 = p_type[197];
    while (1)
    {
      if ((v43 & 1) != 0)
      {
        if (objc_msgSend(v27, "containsVectorGlyphWithWeight:size:", v41, v39))
        {
          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472;
          v65[2] = __158__CUICatalog_namedVectorGlyphWithName_scaleFactor_deviceIdiom_layoutDirection_glyphContinuousSize_glyphContinuousWeight_glyphPointSize_appearanceName_locale___block_invoke;
          v65[3] = &__block_descriptor_56_e25_v16__0__CUIRenditionKey_8l;
          v65[4] = v58;
          v65[5] = v39;
          v65[6] = v41;
          v45 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", v17, a5, v29, v57, a6, 0, a4, 0, v56, v55, v28, v30, a11, v54, v65,
                  v53);
          if (v45)
            break;
        }
      }
      if (objc_msgSend(v27, "containsVectorGlyphInterpolationSources"))
      {
        v46 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", 0, &v66);
        v63 = 0;
        v64 = 0;
        v62 = 0;
        -[CUICatalog _resolveInterpolationSourceRenditionKeysUltralight:regular:black:forName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:appearanceIdentifier:locale:](self, "_resolveInterpolationSourceRenditionKeysUltralight:regular:black:forName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:appearanceIdentifier:locale:", &v64, &v63, &v62, v17, a5, v29, a4, v57, a6, 0, 0, v56, v55, v28, v30,
          v58,
          a11);
        if (v64)
        {
          if (v63)
          {
            if (v62)
            {
              v47 = [CUINamedVectorGlyph alloc];
              v48 = -[CUINamedVectorGlyph initWithName:scaleFactor:deviceIdiom:pointSize:continuousWeight:continuousSize:interpolatedFromRegular:ultralight:black:fromCatalog:themeRef:locale:](v47, "initWithName:scaleFactor:deviceIdiom:pointSize:continuousWeight:continuousSize:interpolatedFromRegular:ultralight:black:fromCatalog:themeRef:locale:", v17, a5, v63, v64, v62, self, a4, a9, a8, a7, v46, a11);
              if (v48)
                goto LABEL_52;
            }
          }
        }
        if ((v43 & 1) == 0)
        {
          v39 = _snapToDiscreteSizeForSize(a7);
          v41 = _snapToDiscreteWeightForWeight(a8);
          v43 = 1;
          p_type = (char **)(&stru_1E41D7FF0 + 16);
          goto LABEL_35;
        }
      }
      v42 = v41 == 4;
      v41 = 4;
      if (v42)
        goto LABEL_50;
    }
    v49 = v45;
    v50 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", v45, &v66);
    if (v50 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_50:
      v37 = 0;
      goto LABEL_53;
    }
    v48 = -[CUINamedVectorGlyph initWithName:scaleFactor:deviceIdiom:pointSize:fromCatalog:usingRenditionKey:themeRef:locale:]([CUINamedVectorGlyph alloc], "initWithName:scaleFactor:deviceIdiom:pointSize:fromCatalog:usingRenditionKey:themeRef:locale:", v17, a5, self, v49, v50, a11, a4, a9);
LABEL_52:
    v37 = v48;
    -[CUINamedVectorGlyph setRepresentsOnDemandContent:](v48, "setRepresentsOnDemandContent:", v66);
    v51 = v37;
LABEL_53:
    -[CUICatalog finalizeNamedVectorGlyphLookupWithResult:name:glyphContinuousSize:glyphContinuousWeight:pointSize:](self, "finalizeNamedVectorGlyphLookupWithResult:name:glyphContinuousSize:glyphContinuousWeight:pointSize:", v37, v17, a7, a8, a9);
  }
  return v37;
}

id __158__CUICatalog_namedVectorGlyphWithName_scaleFactor_deviceIdiom_layoutDirection_glyphContinuousSize_glyphContinuousWeight_glyphPointSize_appearanceName_locale___block_invoke(_QWORD *a1, void *a2)
{
  objc_msgSend(a2, "setThemeAppearance:", a1[4]);
  objc_msgSend(a2, "setThemeGlyphSize:", a1[5]);
  return objc_msgSend(a2, "setThemeGlyphWeight:", a1[6]);
}

- (id)allImageNames
{
  return objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "allImageNames");
}

- (id)imagesWithName:(id)a3
{
  return objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "imagesWithName:", a3);
}

- (BOOL)containsLookupForName:(id)a3
{
  id v6;
  id v7;
  BOOL v8;

  if ((objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "containsLookupForName:", a3) & 1) != 0)
    return 1;
  v6 = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "mappedAliases");
  v7 = objc_msgSend(v6, "indexOfObject:", a3);
  if (v6)
    v8 = v7 == (id)0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = 1;
  return !v8;
}

- (void)enumerateNamedLookupsUsingBlock:(id)a3
{
  void *v5;
  _QWORD v6[8];

  v5 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  if ((objc_opt_respondsToSelector(v5, sel_themeStore) & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __46__CUICatalog_enumerateNamedLookupsUsingBlock___block_invoke;
    v6[3] = &unk_1E41B8DB0;
    v6[4] = v5;
    v6[6] = self;
    v6[7] = a3;
    objc_msgSend(objc_msgSend(v5, "themeStore"), "enumerateKeysAndObjectsUsingBlock:", v6);
  }
}

void __46__CUICatalog_enumerateNamedLookupsUsingBlock___block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  CUIThemeRendition *v5;
  CUIRenditionKey *v6;
  id v7;
  id v8;
  __objc2_class *v9;
  CUINamedLayerStack *v10;
  CUINamedLayerStack *v11;
  CUINamedLayerStack *v12;
  uint64_t v13;
  uint64_t v14;
  void ***v15;
  uint64_t v16;
  void **v17;
  uint64_t v18;
  id (*v19)(uint64_t, uint64_t);
  void *v20;
  uint64_t v21;
  unsigned __int16 *v22;
  void **v23;
  uint64_t v24;
  id (*v25)(uint64_t, uint64_t);
  void *v26;
  uint64_t v27;
  unsigned __int16 *v28;

  v5 = -[CUIThemeRendition initWithCSIData:forKey:version:]([CUIThemeRendition alloc], "initWithCSIData:forKey:version:", a3, a2, objc_msgSend(*(id *)(a1 + 32), "distilledInCoreUIVersion"));
  v6 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", a2);
  v7 = objc_msgSend(*(id *)(a1 + 40), "renditionNameForKeyList:", a2);
  if (!objc_msgSend(v7, "length"))
    v7 = -[CUIThemeRendition name](v5, "name");
  v8 = -[CUIThemeRendition type](v5, "type");
  switch((unint64_t)v8)
  {
    case 0x3E8uLL:
      if (-[CUIThemeRendition unslicedImage](v5, "unslicedImage"))
        goto LABEL_7;
      goto LABEL_13;
    case 0x3E9uLL:
    case 0x3EBuLL:
    case 0x3EDuLL:
    case 0x3EEuLL:
    case 0x3EFuLL:
    case 0x3F0uLL:
    case 0x3F4uLL:
    case 0x3F8uLL:
      goto LABEL_11;
    case 0x3EAuLL:
      v12 = [CUINamedLayerStack alloc];
      v13 = *(_QWORD *)(a1 + 48);
      v14 = *(_QWORD *)(v13 + 8);
      v23 = _NSConcreteStackBlock;
      v24 = 3221225472;
      v25 = __46__CUICatalog_enumerateNamedLookupsUsingBlock___block_invoke_2;
      v26 = &unk_1E41B8D88;
      v27 = v13;
      v28 = a2;
      v15 = &v23;
      goto LABEL_25;
    case 0x3ECuLL:
      if (!CUIRenditionKeyValueForAttribute(a2, 17))
        goto LABEL_7;
      v9 = CUINamedImageAtlas;
      goto LABEL_8;
    case 0x3F1uLL:
      v9 = CUINamedColor;
      goto LABEL_8;
    case 0x3F2uLL:
      v9 = CUINamedMultisizeImageSet;
      goto LABEL_8;
    case 0x3F3uLL:
      v9 = CUINamedModel;
      goto LABEL_8;
    case 0x3F5uLL:
      v9 = CUINamedRecognitionGroup;
      goto LABEL_8;
    case 0x3F6uLL:
      v9 = CUINamedRecognitionObject;
      goto LABEL_8;
    case 0x3F7uLL:
      v9 = CUITextStyle;
      goto LABEL_8;
    case 0x3F9uLL:
      v9 = CUINamedVectorGlyph;
      goto LABEL_8;
    case 0x3FAuLL:
      v12 = [CUINamedSolidLayerStack alloc];
      v16 = *(_QWORD *)(a1 + 48);
      v14 = *(_QWORD *)(v16 + 8);
      v17 = _NSConcreteStackBlock;
      v18 = 3221225472;
      v19 = __46__CUICatalog_enumerateNamedLookupsUsingBlock___block_invoke_3;
      v20 = &unk_1E41B8D88;
      v21 = v16;
      v22 = a2;
      v15 = &v17;
LABEL_25:
      v10 = -[CUINamedLayerStack initWithName:usingRenditionKey:fromTheme:resolvingWithBlock:](v12, "initWithName:usingRenditionKey:fromTheme:resolvingWithBlock:", v7, v6, v14, v15, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
      goto LABEL_9;
    default:
      if ((unint64_t)v8 >= 6)
      {
        if (v8 != (id)9)
          goto LABEL_11;
LABEL_13:
        v9 = CUINamedData;
      }
      else
      {
LABEL_7:
        v9 = CUINamedImage;
      }
LABEL_8:
      v10 = (CUINamedLayerStack *)objc_msgSend([v9 alloc], "initWithName:usingRenditionKey:fromTheme:", v7, v6, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));
LABEL_9:
      v11 = v10;
      if (v10)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      }
LABEL_11:

      return;
  }
}

id __46__CUICatalog_enumerateNamedLookupsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[1];
  v6 = (double)CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 12);
  v7 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 15);
  v8 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 16);
  v9 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 24);
  v10 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 4);
  v11 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 20);
  return objc_msgSend(v4, "_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:", v5, a2, v7, v8, v9, v10, v6, v11, CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 21), 0, 0, 0, 0, 0, 0);
}

id __46__CUICatalog_enumerateNamedLookupsUsingBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[1];
  v6 = (double)CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 12);
  v7 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 15);
  v8 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 16);
  v9 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 24);
  v10 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 4);
  v11 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 20);
  return objc_msgSend(v4, "_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:", v5, a2, v7, v8, v9, v10, v6, v11, CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 21), 0, 0, 0, 0, 0, 0);
}

- (CGPDFDocument)pdfDocumentWithName:(id)a3
{
  return -[CUICatalog pdfDocumentWithName:appearanceName:](self, "pdfDocumentWithName:appearanceName:", a3, 0);
}

- (CGPDFDocument)pdfDocumentWithName:(id)a3 appearanceName:(id)a4
{
  uint64_t v6;
  CGPDFDocument *result;
  CGPDFDocument *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  _QWORD v16[5];
  char v17;

  v6 = 0;
  v17 = 0;
  if (self && a4)
    v6 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "appearanceIdentifierForName:", a4);
  v16[1] = 3221225472;
  v16[2] = __49__CUICatalog_pdfDocumentWithName_appearanceName___block_invoke;
  v16[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v16[4] = v6;
  v16[0] = _NSConcreteStackBlock;
  result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, 0, 0, 0, 0, 0, 0.0, 0, 0, 0, 0, 0, 0, 0, v16);
  if (result)
  {
    v8 = result;
    v9 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", result, &v17);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = -[CUICatalog namedVectorImageWithName:scaleFactor:displayGamut:layoutDirection:](self, "namedVectorImageWithName:scaleFactor:displayGamut:layoutDirection:", a3, 1, 0, (double)CUIMaxScaleForTargetPlatform(-[CUICatalog platform](self, "platform")));
      v13 = objc_opt_class(CUINamedVectorPDFImage, v12);
      isKindOfClass = objc_opt_isKindOfClass(v11, v13);
      result = 0;
      if ((isKindOfClass & 1) == 0)
        return result;
    }
    else
    {
      v15 = (void *)_LookupStructuredThemeProvider(v9, v10);
      if ((uint64_t)-[CGPDFDocument themeScale](v8, "themeScale") >= 2
        && (objc_msgSend(v15, "canGetRenditionWithKey:", -[CGPDFDocument keyList](v8, "keyList")) & 1) == 0)
      {
        -[CGPDFDocument setThemeScale:](v8, "setThemeScale:", 0);
      }
      v11 = objc_msgSend(v15, "renditionWithKey:", -[CGPDFDocument keyList](v8, "keyList"));
      if (objc_msgSend(v11, "pixelFormat") != 1346651680)
        return 0;
    }
    return (CGPDFDocument *)objc_msgSend(v11, "pdfDocument");
  }
  return result;
}

id __49__CUICatalog_pdfDocumentWithName_appearanceName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6
{
  return -[CUICatalog namedVectorImageWithName:scaleFactor:displayGamut:layoutDirection:appearanceName:](self, "namedVectorImageWithName:scaleFactor:displayGamut:layoutDirection:appearanceName:", a3, a5, a6, 0, a4);
}

- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6 appearanceName:(id)a7
{
  return -[CUICatalog namedVectorImageWithName:scaleFactor:displayGamut:layoutDirection:appearanceName:locale:](self, "namedVectorImageWithName:scaleFactor:displayGamut:layoutDirection:appearanceName:locale:", a3, a5, a6, a7, 0, a4);
}

- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6 appearanceName:(id)a7 locale:(id)a8
{
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  return -[CUICatalog namedVectorImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "namedVectorImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, __getDeviceTraits___deviceIdiom, __getDeviceTraits___deviceSubtype, a5, a6, 0, a4, 0, a7, a8);
}

- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10
{
  return -[CUICatalog namedVectorImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "namedVectorImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, a5, a6, a7, a8, a9, a4, a10, 0, 0);
}

- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11
{
  return -[CUICatalog namedVectorImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "namedVectorImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, a5, a6, a7, a8, a9, a4, a10, a11, 0);
}

- (id)layerStackWithName:(id)a3
{
  return -[CUICatalog layerStackWithName:scaleFactor:deviceIdiom:](self, "layerStackWithName:scaleFactor:deviceIdiom:", a3, 0, 1.0);
}

- (id)layerStackWithName:(id)a3 scaleFactor:(double)a4
{
  return -[CUICatalog layerStackWithName:scaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:](self, "layerStackWithName:scaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:", a3, 0, 0, 0, 0, a4);
}

- (id)layerStackWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5
{
  return -[CUICatalog layerStackWithName:scaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:](self, "layerStackWithName:scaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:", a3, a5, 0, 0, 0, a4);
}

- (id)_baseStackKeyForName:(id)a3
{
  id result;
  CUIRenditionKey *v4;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
    -[CUIRenditionKey setThemeElement:](v4, "setThemeElement:", 85);
    -[CUIRenditionKey setThemePart:](v4, "setThemePart:", 181);
    return v4;
  }
  return result;
}

- (id)_layerStackWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8
{
  uint64_t v15;
  id result;
  id v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  CUINamedLayerStack *v21;
  _QWORD *v22;
  CUINamedLayerStack *v23;
  _QWORD v24[12];
  _QWORD v25[12];
  _BYTE v26[9];

  v26[0] = 0;
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  v15 = __getDeviceTraits___deviceDisplayGamut;
  result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a5, a6, __getDeviceTraits___deviceDisplayGamut, 0, a7, a4, a8, 0, 0, 0, 0, 0, sel__baseStackKeyForName_, 0);
  if (result)
  {
    v17 = result;
    v18 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", result, v26);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      v20 = v18;
      if (objc_msgSend(objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v19), "renditionWithKey:", objc_msgSend(v17, "keyList")), "type") == (id)1002)
      {
        v21 = [CUINamedLayerStack alloc];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = __110__CUICatalog__layerStackWithName_scaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke;
        v25[3] = &unk_1E41B8DD8;
        v25[4] = self;
        v25[5] = v20;
        *(double *)&v25[6] = a4;
        v25[7] = a5;
        v25[8] = a6;
        v25[9] = v15;
        v25[10] = a7;
        v25[11] = a8;
        v22 = v25;
      }
      else
      {
        v21 = [CUINamedSolidLayerStack alloc];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = __110__CUICatalog__layerStackWithName_scaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke_2;
        v24[3] = &unk_1E41B8DD8;
        v24[4] = self;
        v24[5] = v20;
        *(double *)&v24[6] = a4;
        v24[7] = a5;
        v24[8] = a6;
        v24[9] = v15;
        v24[10] = a7;
        v24[11] = a8;
        v22 = v24;
      }
      v23 = -[CUINamedLayerStack initWithName:usingRenditionKey:fromTheme:resolvingWithBlock:](v21, "initWithName:usingRenditionKey:fromTheme:resolvingWithBlock:", a3, v17, v20, v22);
      -[CUINamedLookup setRepresentsOnDemandContent:](v23, "setRepresentsOnDemandContent:", v26[0]);
      return v23;
    }
  }
  return result;
}

id __110__CUICatalog__layerStackWithName_scaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 0, *(double *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), 0, 0, 0, 0, 0, 0);
}

id __110__CUICatalog__layerStackWithName_scaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 0, *(double *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), 0, 0, 0, 0, 0, 0);
}

- (id)layerStackWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8
{
  unsigned int v15;
  id v16;

  v15 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace(726663173, 5, v15, 0, 0);
  v16 = -[CUICatalog _layerStackWithName:scaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:](self, "_layerStackWithName:scaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:", a3, a5, a6, a7, a8, a4);
  kdebug_trace(726663174, 5, 0, 0, 0);
  return v16;
}

- (id)_defaultLayerStackWithScaleFactor:(double)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 sizeClassHorizontal:(int64_t)a6 sizeClassVertical:(int64_t)a7
{
  int v13;
  id v14;
  _BOOL8 v15;
  id result;
  id v17;
  unint64_t v18;
  CUINamedLayerStack *v19;
  _QWORD v20[12];
  unsigned __int8 v21;

  v21 = 0;
  v13 = *((_BYTE *)self + 82) & 6;
  if ((*((_BYTE *)self + 82) & 6) == 0)
  {
    v14 = objc_msgSend(objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "themeStore"), "keyFormat");
    if (CUIRenditionKeyHasIdentifier((uint64_t)v14, 24))
      v13 = 4;
    else
      v13 = 2;
    *((_BYTE *)self + 82) = *((_BYTE *)self + 82) & 0xF9 | v13;
  }
  v15 = v13 == 4;
  result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", CFSTR("IGNORED_VALUE"), a4, a5, v15, 0, a6, a3, a7, 0, 0, 0, 0, 0, sel__defaultAssetRenditionKey_, 0);
  if (result)
  {
    v17 = result;
    v18 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", result, &v21);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __112__CUICatalog__defaultLayerStackWithScaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke;
      v20[3] = &unk_1E41B8DD8;
      v20[4] = self;
      v20[5] = v18;
      *(double *)&v20[6] = a3;
      v20[7] = a4;
      v20[8] = a5;
      v20[9] = v15;
      v20[10] = a6;
      v20[11] = a7;
      v19 = -[CUINamedLayerStack initWithName:usingRenditionKey:fromTheme:resolvingWithBlock:]([CUINamedLayerStack alloc], "initWithName:usingRenditionKey:fromTheme:resolvingWithBlock:", 0, v17, v18, v20);
      -[CUINamedLookup setRepresentsOnDemandContent:](v19, "setRepresentsOnDemandContent:", v21);
      return v19;
    }
  }
  return result;
}

id __112__CUICatalog__defaultLayerStackWithScaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 0, *(double *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), 0, 0, 0, 0, 0, 0);
  else
    return 0;
}

- (id)defaultLayerStackWithScaleFactor:(double)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 sizeClassHorizontal:(int64_t)a6 sizeClassVertical:(int64_t)a7
{
  id v13;

  kdebug_trace(726663173, 6, 0, 0, 0);
  v13 = -[CUICatalog _defaultLayerStackWithScaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:](self, "_defaultLayerStackWithScaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:", a4, a5, a6, a7, a3);
  kdebug_trace(726663174, 6, 0, 0, 0);
  return v13;
}

- (id)_defaultNamedAssetWithScaleFactor:(double)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 sizeClassHorizontal:(int64_t)a6 sizeClassVertical:(int64_t)a7
{
  id result;
  id v14;
  unint64_t v15;
  unint64_t v16;
  CUINamedLookup *v17;
  CUIThemeRendition *v18;
  id v19;
  uint64_t v20;
  id v21;
  __objc2_class **v22;
  id v23;
  CUINamedImage *v24;
  CUINamedImage *v25;
  _QWORD v26[11];
  unsigned __int8 v27;
  NSNumber *v28;

  v27 = 0;
  v28 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
  result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", CFSTR("IGNORED_VALUE"), a4, a5, 0, 0, a6, a3, a7, 0, 0, 0, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1), 0, sel__defaultAssetRenditionKey_, 0);
  if (result)
  {
    v14 = result;
    v15 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", result, &v27);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    v16 = v15;
    v17 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:]([CUINamedLookup alloc], "initWithName:usingRenditionKey:fromTheme:", 0, v14, v15);
    v18 = -[CUINamedLookup _rendition](v17, "_rendition");
    v19 = -[CUIThemeRendition type](v18, "type");
    v21 = -[CUIThemeRendition name](v18, "name");
    if (v19 == (id)1002)
    {
      v22 = OBJC_CLASS___CUINamedLayerStack_ptr;
    }
    else
    {
      if (v19 != (id)1018)
      {
        v24 = -[CUINamedImage initWithName:usingRenditionKey:fromTheme:]([CUINamedImage alloc], "initWithName:usingRenditionKey:fromTheme:", v21, v14, v16);
        goto LABEL_10;
      }
      v22 = OBJC_CLASS___CUINamedSolidLayerStack_ptr;
    }
    v23 = objc_alloc((Class)objc_opt_class(*v22, v20));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __112__CUICatalog__defaultNamedAssetWithScaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke;
    v26[3] = &unk_1E41B8E00;
    v26[4] = self;
    v26[5] = v16;
    *(double *)&v26[6] = a3;
    v26[7] = a4;
    v26[8] = a5;
    v26[9] = a6;
    v26[10] = a7;
    v24 = (CUINamedImage *)objc_msgSend(v23, "initWithName:usingRenditionKey:fromTheme:resolvingWithBlock:", v21, v14, v16, v26);
LABEL_10:
    v25 = v24;

    -[CUINamedLookup setRepresentsOnDemandContent:](v25, "setRepresentsOnDemandContent:", v27);
    return v25;
  }
  return result;
}

id __112__CUICatalog__defaultNamedAssetWithScaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, 0, *(double *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), 0, 0, 0, 0, 0, 0);
}

- (id)defaultNamedAssetWithScaleFactor:(double)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 sizeClassHorizontal:(int64_t)a6 sizeClassVertical:(int64_t)a7
{
  id v13;

  kdebug_trace(726663173, 7, 0, 0, 0);
  v13 = -[CUICatalog _defaultNamedAssetWithScaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:](self, "_defaultNamedAssetWithScaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:", a4, a5, a6, a7, a3);
  kdebug_trace(726663174, 7, 0, 0, 0);
  return v13;
}

- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8
{
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  return -[CUICatalog namedLookupWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:](self, "namedLookupWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:", a3, a5, a6, __getDeviceTraits___deviceDisplayGamut, 0, a7, a4, a8);
}

id __162__CUICatalog__namedLookupWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceName_locale___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:", *(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(double *)(a1 + 64), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), 0, 0, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10
{
  return -[CUICatalog namedLookupWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "namedLookupWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, a5, a6, a7, a8, a9, a4, a10, 0, 0);
}

- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11
{
  return -[CUICatalog namedLookupWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "namedLookupWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, a5, a6, a7, a8, a9, a4, a10, a11, 0);
}

- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4
{
  return -[CUICatalog namedLookupWithName:scaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:](self, "namedLookupWithName:scaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:", a3, 0, 0, 0, 0, a4);
}

- (id)_baseTextureKeyForName:(id)a3
{
  id result;
  CUIRenditionKey *v4;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
    -[CUIRenditionKey setThemeElement:](v4, "setThemeElement:", 41);
    -[CUIRenditionKey setThemePart:](v4, "setThemePart:", 0);
    return v4;
  }
  return result;
}

- (id)_namedTextureWithName:(id)a3 scaleFactor:(double)a4 appearanceName:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v13;
  uint64_t v14;
  id result;
  id v16;
  unint64_t v17;
  CUINamedTexture *v18;
  _QWORD v19[5];
  unsigned __int8 v20;

  v20 = 0;
  _CUILog(3, (uint64_t)"-[CUICatalog _namedTextureWithName:%@ scaleFactor:%f appearanceName:%@]", (uint64_t)a3, (uint64_t)a5, v5, v6, v7, v8, (uint64_t)a3);
  v14 = 0;
  if (self && a5)
    v14 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v13), "appearanceIdentifierForName:", a5);
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  v19[1] = 3221225472;
  v19[2] = __63__CUICatalog__namedTextureWithName_scaleFactor_appearanceName___block_invoke;
  v19[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v19[4] = v14;
  v19[0] = _NSConcreteStackBlock;
  result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, __getDeviceTraits___deviceIdiom, __getDeviceTraits___deviceSubtype, __getDeviceTraits___deviceDisplayGamut, 0, 0, a4, 0, __getDeviceTraits___deviceMemoryClass, __getDeviceTraits___deviceGraphicsClass, __getDeviceTraits___deviceGraphicsFallbackOrder, __getDeviceTraits___deviceSubtypeFallbackOrder, 0, sel__baseTextureKeyForName_, v19);
  if (result)
  {
    v16 = result;
    v17 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", result, &v20);
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      v18 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:]([CUINamedTexture alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v16, v17);
      -[CUINamedLookup setRepresentsOnDemandContent:](v18, "setRepresentsOnDemandContent:", v20);
      return v18;
    }
  }
  return result;
}

id __63__CUICatalog__namedTextureWithName_scaleFactor_appearanceName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

- (id)namedTextureWithName:(id)a3 scaleFactor:(double)a4 appearanceName:(id)a5
{
  unsigned int v9;
  id v10;

  v9 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace(726663173, 9, v9, 0, 0);
  v10 = -[CUICatalog _namedTextureWithName:scaleFactor:appearanceName:](self, "_namedTextureWithName:scaleFactor:appearanceName:", a3, a5, a4);
  kdebug_trace(726663174, 9, 0, 0, 0);
  return v10;
}

- (id)namedTextureWithName:(id)a3 scaleFactor:(double)a4
{
  return -[CUICatalog namedTextureWithName:scaleFactor:appearanceName:](self, "namedTextureWithName:scaleFactor:appearanceName:", a3, 0, a4);
}

- (id)_namedTextureWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 appearanceName:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v14;
  uint64_t v15;
  id result;
  id v17;
  unint64_t v18;
  CUINamedTexture *v19;
  _QWORD v20[5];
  unsigned __int8 v21;

  v21 = 0;
  _CUILog(3, (uint64_t)"-[CUICatalog _namedTextureWithName:%@ scaleFactor:%f displayGamut:%d appearanceName:%@]", (uint64_t)a3, a5, (uint64_t)a6, v6, v7, v8, (uint64_t)a3);
  v15 = 0;
  if (self && a6)
    v15 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v14), "appearanceIdentifierForName:", a6);
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  v20[1] = 3221225472;
  v20[2] = __76__CUICatalog__namedTextureWithName_scaleFactor_displayGamut_appearanceName___block_invoke;
  v20[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v20[4] = v15;
  v20[0] = _NSConcreteStackBlock;
  result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, __getDeviceTraits___deviceIdiom, __getDeviceTraits___deviceSubtype, a5, 0, 0, a4, 0, __getDeviceTraits___deviceMemoryClass, __getDeviceTraits___deviceGraphicsClass, __getDeviceTraits___deviceGraphicsFallbackOrder, __getDeviceTraits___deviceSubtypeFallbackOrder, 0, sel__baseTextureKeyForName_, v20);
  if (result)
  {
    v17 = result;
    v18 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", result, &v21);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      v19 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:]([CUINamedTexture alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v17, v18);
      -[CUINamedLookup setRepresentsOnDemandContent:](v19, "setRepresentsOnDemandContent:", v21);
      return v19;
    }
  }
  return result;
}

id __76__CUICatalog__namedTextureWithName_scaleFactor_displayGamut_appearanceName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", *(_QWORD *)(a1 + 32));
}

- (id)namedTextureWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 appearanceName:(id)a6
{
  unsigned int v11;
  id v12;

  v11 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace(726663173, 9, v11, 0, 0);
  v12 = -[CUICatalog _namedTextureWithName:scaleFactor:displayGamut:appearanceName:](self, "_namedTextureWithName:scaleFactor:displayGamut:appearanceName:", a3, a5, a6, a4);
  kdebug_trace(726663174, 9, 0, 0, 0);
  return v12;
}

- (id)namedTextureWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5
{
  return -[CUICatalog namedTextureWithName:scaleFactor:displayGamut:appearanceName:](self, "namedTextureWithName:scaleFactor:displayGamut:appearanceName:", a3, a5, 0, a4);
}

- (id)iconImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(unint64_t)a5 layoutDirection:(int64_t)a6 desiredSize:(CGSize)a7
{
  return -[CUICatalog iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:](self, "iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:", a3, 0, 0, a5, a6, 0, a4, a7.width, a7.height, 0, 0);
}

- (id)iconImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(unint64_t)a5 layoutDirection:(int64_t)a6 desiredSize:(CGSize)a7 appearanceName:(id)a8
{
  return -[CUICatalog iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:](self, "iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:", a3, 0, 0, a5, a6, 0, a4, a7.width, a7.height, 0, a8);
}

- (id)colorWithName:(id)a3 displayGamut:(int64_t)a4 appearanceName:(id)a5
{
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  return -[CUICatalog colorWithName:displayGamut:deviceIdiom:appearanceName:](self, "colorWithName:displayGamut:deviceIdiom:appearanceName:", a3, a4, __getDeviceTraits___deviceIdiom, a5);
}

- (id)colorWithName:(id)a3 displayGamut:(int64_t)a4
{
  return -[CUICatalog colorWithName:displayGamut:appearanceName:](self, "colorWithName:displayGamut:appearanceName:", a3, a4, 0);
}

+ (CGColor)newColorByAdjustingLightnessOfColor:(CGColor *)a3 darker:(BOOL)a4
{
  return +[CUIShapeEffectStack newColorByAdjustingLightnessOfColor:darker:](CUIShapeEffectStack, "newColorByAdjustingLightnessOfColor:darker:", a3, a4);
}

- (id)_baseModelForKeyForName:(id)a3
{
  id result;
  CUIRenditionKey *v4;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
    -[CUIRenditionKey setThemeElement:](v4, "setThemeElement:", 164);
    -[CUIRenditionKey setThemePart:](v4, "setThemePart:", 60);
    return v4;
  }
  return result;
}

- (id)_modelWithName:(id)a3
{
  id result;
  id v6;
  unint64_t v7;
  CUINamedModel *v8;
  char v9;

  v9 = 0;
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, __getDeviceTraits___deviceIdiom, __getDeviceTraits___deviceSubtype, __getDeviceTraits___deviceDisplayGamut, 0, 0, 1.0, 0, __getDeviceTraits___deviceMemoryClass, __getDeviceTraits___deviceGraphicsClass, __getDeviceTraits___deviceGraphicsFallbackOrder, __getDeviceTraits___deviceSubtypeFallbackOrder, 0, sel__baseModelForKeyForName_, 0);
  if (result)
  {
    v6 = result;
    v7 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", result, &v9);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = -[CUINamedModel initWithName:usingRenditionKey:fromTheme:]([CUINamedModel alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v6, v7);
    return v8;
  }
  return result;
}

- (id)modelWithName:(id)a3
{
  unsigned int v5;
  id v6;

  v5 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace(726663173, 17, v5, 0, 0);
  v6 = -[CUICatalog _modelWithName:](self, "_modelWithName:", a3);
  kdebug_trace(726663174, 17, 0, 0, 0);
  return v6;
}

- (id)_baseRecognitionGroupImageSetKeyForName:(id)a3
{
  id result;
  CUIRenditionKey *v4;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
    -[CUIRenditionKey setThemeElement:](v4, "setThemeElement:", 85);
    -[CUIRenditionKey setThemePart:](v4, "setThemePart:", 206);
    return v4;
  }
  return result;
}

- (id)namedRecognitionGroupWithName:(id)a3
{
  unsigned int v5;
  id v6;
  id v7;
  unint64_t v8;
  CUINamedRecognitionGroup *v9;
  char v11;

  v11 = 0;
  v5 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace(726663173, 18, v5, 0, 0);
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  v6 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, __getDeviceTraits___deviceIdiom, __getDeviceTraits___deviceSubtype, __getDeviceTraits___deviceDisplayGamut, 0, 0, 1.0, 0, __getDeviceTraits___deviceMemoryClass, __getDeviceTraits___deviceGraphicsClass, __getDeviceTraits___deviceGraphicsFallbackOrder, __getDeviceTraits___deviceSubtypeFallbackOrder, 0, sel__baseRecognitionGroupImageSetKeyForName_, 0);
  if (v6)
  {
    v7 = v6;
    v8 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", v6, &v11);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    else
      v9 = -[CUINamedRecognitionGroup initWithName:contentsFromCatalog:usingRenditionKey:fromTheme:]([CUINamedRecognitionGroup alloc], "initWithName:contentsFromCatalog:usingRenditionKey:fromTheme:", a3, self, v7, v8);
    kdebug_trace(726663174, 18, 0, 0, 0);
    return v9;
  }
  else
  {
    kdebug_trace(726663174, 18, 0, 0, 0);
    return 0;
  }
}

- (id)_baseRecognitionObjectKeyForName:(id)a3
{
  id result;
  CUIRenditionKey *v4;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
    -[CUIRenditionKey setThemeElement:](v4, "setThemeElement:", 85);
    -[CUIRenditionKey setThemePart:](v4, "setThemePart:", 207);
    return v4;
  }
  return result;
}

- (id)_recognitionObjectWithName:(id)a3
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  unint64_t v21;
  CUINamedRecognitionObject *v22;
  char v24;

  v24 = 0;
  v5 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace(726663173, 19, v5, 0, 0);
  if (__getDeviceTraits___getDeviceTraits_once != -1)
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_464);
  v12 = __getDeviceTraits___deviceIdiom;
  v13 = __getDeviceTraits___deviceSubtype;
  v14 = __getDeviceTraits___deviceDisplayGamut;
  v15 = __getDeviceTraits___deviceMemoryClass;
  v16 = __getDeviceTraits___deviceGraphicsClass;
  v17 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  v18 = __getDeviceTraits___deviceSubtypeFallbackOrder;
  _CUILog(3, (uint64_t)"-[CUICatalog _recognitionObjectWithName:%@]", v6, v7, v8, v9, v10, v11, (uint64_t)a3);
  v19 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, v12, v13, v14, 0, 0, 1.0, 0, v15, v16, v17, v18, 0, sel__baseRecognitionObjectKeyForName_, 0);
  if (v19)
  {
    v20 = v19;
    v21 = -[CUICatalog _storageRefForRendition:representsODRContent:](self, "_storageRefForRendition:representsODRContent:", v19, &v24);
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      v22 = 0;
    else
      v22 = -[CUINamedRecognitionObject initWithName:usingRenditionKey:fromTheme:]([CUINamedRecognitionObject alloc], "initWithName:usingRenditionKey:fromTheme:", a3, v20, v21);
    kdebug_trace(726663174, 19, 0, 0, 0);
    return v22;
  }
  else
  {
    kdebug_trace(726663174, 19, 0, 0, 0);
    return 0;
  }
}

- (unint64_t)_themeRef
{
  return self->_storageRef;
}

- (id)_baseAtlasKeyForName:(id)a3
{
  id result;
  CUIRenditionKey *v4;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
    -[CUIRenditionKey setThemeElement:](v4, "setThemeElement:", 9);
    -[CUIRenditionKey setThemePart:](v4, "setThemePart:", 181);
    return v4;
  }
  return result;
}

- (id)_baseAtlasContentsKeyForName:(id)a3
{
  id result;
  CUIRenditionKey *v4;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
    -[CUIRenditionKey setThemeElement:](v4, "setThemeElement:", 9);
    -[CUIRenditionKey setThemePart:](v4, "setThemePart:", 127);
    return v4;
  }
  return result;
}

- (id)_defaultAssetRenditionKey:(id)a3
{
  __int128 v4;

  v4 = xmmword_19EC75AE0;
  return -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", &v4);
}

- (id)_baseMultisizeImageSetKeyForName:(id)a3
{
  id result;
  CUIRenditionKey *v4;

  result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", result);
    -[CUIRenditionKey setThemeElement:](v4, "setThemeElement:", 85);
    -[CUIRenditionKey setThemePart:](v4, "setThemePart:", 218);
    return v4;
  }
  return result;
}

- (id)_nameForAppearanceIdentifier:(int64_t)a3
{
  return objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "nameForAppearanceIdentifier:", (unsigned __int16)a3);
}

- (id)newShapeEffectPresetWithRenditionKey:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v11;
  id v12;
  id v13;

  if (!a3)
    return 0;
  v5 = -[CUICatalog _themeStore](self, "_themeStore");
  v6 = objc_msgSend(a3, "keyList");
  v7 = objc_msgSend(v5, "copyLookupKeySignatureForKey:", v6);
  v8 = -[CUICatalog localObjectCache](self, "localObjectCache");
  v9 = objc_msgSend(v8, "objectForKey:", v7);
  if (!v9)
  {
    v9 = objc_msgSend(v5, "renditionWithKey:", v6);
    if (v9)
    {
      v11 = v9;
      if (objc_msgSend(v9, "type") == (id)7)
      {
        v13 = objc_msgSend(v11, "effectPreset");
        objc_msgSend(v8, "setObject:forKey:", v13, v7);
        v9 = v13;
      }
      else
      {
        v9 = 0;
      }
    }
  }
  v12 = v9;

  return v12;
}

- (BOOL)canGetShapeEffectRenditionWithKey:(id)a3
{
  if (a3)
    return objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "canGetRenditionWithKey:", objc_msgSend(a3, "keyList"));
  else
    return 0;
}

- (id)renditionKeyForShapeEffectPresetWithStyleID:(unint64_t)a3 state:(int64_t)a4 presentationState:(int64_t)a5 value:(int64_t)a6 resolution:(unint64_t)a7 dimension1:(unint64_t)a8
{
  __int16 v8;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = a8;
  if (a6 == 1)
    v13 = 1;
  else
    v13 = 2 * (a6 == 2);
  if (a3 == 4
    && (unint64_t)(a6 - 1) <= 1
    && objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "distilledInCoreUIVersion") < 0x1F2)
  {
    v13 = 0;
  }
  if ((unint64_t)(a4 - 1) > 4)
    v14 = 0;
  else
    v14 = qword_19EC75AB8[a4 - 1];
  if (a5 == 1)
    v15 = 1;
  else
    v15 = 2 * (a5 == 2);
  return CUICreateRenditionKeyWithShapeEffectState(a3, v14, v15, v13, a7, v8);
}

- (id)renditionKeyForShapeEffectPresetWithStylePresetName:(id)a3 state:(int64_t)a4 presentationState:(int64_t)a5 value:(int64_t)a6 resolution:(unint64_t)a7 dimension1:(unint64_t)a8 appearance:(int64_t)a9
{
  id v16;
  unsigned __int16 *v17;
  unsigned __int16 *v18;
  CUIRenditionKey *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  int v28;
  int v29;
  int v30;
  CUIRenditionKey *v31;
  _OWORD v33[5];
  uint64_t v34;

  v16 = -[CUICatalog _themeStore](self, "_themeStore");
  v17 = (unsigned __int16 *)objc_msgSend(v16, "renditionKeyForName:", a3);
  if (!v17)
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown style preset name '%@'"), a3), 0));
  v18 = v17;
  v19 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", v17);
  if (objc_msgSend(v16, "authoredWithSchemaVersion") >= 2)
  {
    if (a7 == 1)
      v20 = 179;
    else
      v20 = 178;
    -[CUIRenditionKey setThemePart:](v19, "setThemePart:", v20);
  }
  -[CUIRenditionKey setThemeState:](v19, "setThemeState:", a4);
  -[CUIRenditionKey setThemePresentationState:](v19, "setThemePresentationState:", a5);
  -[CUIRenditionKey setThemeValue:](v19, "setThemeValue:", a6);
  -[CUIRenditionKey setThemeDimension1:](v19, "setThemeDimension1:", a8);
  -[CUIRenditionKey setThemeAppearance:](v19, "setThemeAppearance:", a9);
  if (a7 == 144)
    v21 = 2;
  else
    v21 = 1;
  -[CUIRenditionKey setThemeScale:](v19, "setThemeScale:", v21);
  v22 = -[CUICatalog canGetShapeEffectRenditionWithKey:](self, "canGetShapeEffectRenditionWithKey:", v19);
  if (a7 == 1 && (v22 & 1) == 0)
    -[CUIRenditionKey setThemePart:](v19, "setThemePart:", 178);
  v23 = -[CUICatalog canGetShapeEffectRenditionWithKey:](self, "canGetShapeEffectRenditionWithKey:", v19);
  if (a4 && (v23 & 1) == 0)
    -[CUIRenditionKey setThemeState:](v19, "setThemeState:", 0);
  v24 = -[CUICatalog canGetShapeEffectRenditionWithKey:](self, "canGetShapeEffectRenditionWithKey:", v19);
  if (a5 && (v24 & 1) == 0)
    -[CUIRenditionKey setThemePresentationState:](v19, "setThemePresentationState:", 0);
  v25 = -[CUICatalog canGetShapeEffectRenditionWithKey:](self, "canGetShapeEffectRenditionWithKey:", v19);
  if (a6 && (v25 & 1) == 0)
    -[CUIRenditionKey setThemeValue:](v19, "setThemeValue:", 0);
  v26 = -[CUICatalog canGetShapeEffectRenditionWithKey:](self, "canGetShapeEffectRenditionWithKey:", v19);
  if (a8 && (v26 & 1) == 0)
    -[CUIRenditionKey setThemeDimension1:](v19, "setThemeDimension1:", 0);
  v27 = -[CUICatalog canGetShapeEffectRenditionWithKey:](self, "canGetShapeEffectRenditionWithKey:", v19);
  if (a9 && (v27 & 1) == 0)
    -[CUIRenditionKey setThemeAppearance:](v19, "setThemeAppearance:", 0);
  if (!-[CUICatalog canGetShapeEffectRenditionWithKey:](self, "canGetShapeEffectRenditionWithKey:", v19))
  {
    v34 = 0;
    memset(v33, 0, sizeof(v33));
    v28 = CUIRenditionKeyValueForAttribute(v18, 1);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v33, 1, v28, 0x16u);
    v29 = CUIRenditionKeyValueForAttribute(v18, 2);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v33, 2, v29, 0x16u);
    v30 = CUIRenditionKeyValueForAttribute(v18, 17);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v33, 17, v30, 0x16u);
    v31 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", v33);

    v19 = v31;
  }
  return v19;
}

- (BOOL)_effectStyle:(unint64_t *)a3 state:(int64_t *)a4 presentationState:(int64_t *)a5 value:(int64_t *)a6 resolution:(unint64_t *)a7 dimension1:(unint64_t *)a8 appearance:(int64_t *)a9 fromStyleConfiguration:(id)a10
{
  id v16;
  unint64_t v17;
  int64_t v18;
  unsigned int v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  int64_t v23;

  if (a10)
  {
    *a4 = (int64_t)objc_msgSend(a10, "state");
    *a5 = 0;
    v16 = objc_msgSend(a10, "value");
  }
  else
  {
    v16 = 0;
    *a4 = 0;
    *a5 = 0;
  }
  *a6 = (int64_t)v16;
  *a3 = 5;
  *a8 = (unint64_t)objc_msgSend(a10, "dimension1");
  if (*a6 == 1)
  {
    v17 = *a3;
    if (*a3)
      goto LABEL_9;
    if (objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "authoredWithSchemaVersion") <= 4)
      *a6 = 0;
  }
  v17 = *a3;
LABEL_9:
  v18 = *a6;
  if (v17 == 4)
  {
    if (v18 != 2)
      goto LABEL_15;
    v17 = 0;
    goto LABEL_14;
  }
  if (v18 == 2 && v17 == 1)
LABEL_14:
    *a6 = v17;
LABEL_15:
  v19 = objc_msgSend(a10, "useSimplifiedEffect");
  v20 = 72;
  if (v19)
    v20 = 1;
  *a7 = v20;
  if (objc_msgSend(a10, "appearanceName"))
  {
    v21 = objc_msgSend(a10, "appearanceName");
    v23 = 0;
    if (self && v21)
      v23 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v22), "appearanceIdentifierForName:", v21);
  }
  else
  {
    v23 = 0;
  }
  *a9 = v23;
  return 1;
}

- (id)renditionKeyForShapeEffectPresetForStylePresetName:(id)a3 styleConfiguration:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v11 = 0;
  v9 = 0;
  v10 = 0;
  v7 = 0;
  v8 = 0;
  -[CUICatalog _effectStyle:state:presentationState:value:resolution:dimension1:appearance:fromStyleConfiguration:](self, "_effectStyle:state:presentationState:value:resolution:dimension1:appearance:fromStyleConfiguration:", &v10, &v13, &v12, &v11, &v9, &v8, &v7, a4);
  if (a3)
    return -[CUICatalog renditionKeyForShapeEffectPresetWithStylePresetName:state:presentationState:value:resolution:dimension1:appearance:](self, "renditionKeyForShapeEffectPresetWithStylePresetName:state:presentationState:value:resolution:dimension1:appearance:", a3, v13, v12, v11, v9, v8, v7);
  else
    return -[CUICatalog renditionKeyForShapeEffectPresetWithStyleID:state:presentationState:value:resolution:dimension1:](self, "renditionKeyForShapeEffectPresetWithStyleID:state:presentationState:value:resolution:dimension1:", v10, v13, v12, v11, v9, v8);
}

- (id)newShapeEffectPresetForStylePresetName:(id)a3 styleConfiguration:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;

  _CUILog(3, (uint64_t)"-[CUICatalog newShapeEffectPresetForStylePresetName:%@ styleConfiguration:%@]", (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)a3);
  result = -[CUICatalog renditionKeyForShapeEffectPresetForStylePresetName:styleConfiguration:](self, "renditionKeyForShapeEffectPresetForStylePresetName:styleConfiguration:", a3, a4);
  if (result)
    return -[CUICatalog newShapeEffectPresetWithRenditionKey:](self, "newShapeEffectPresetWithRenditionKey:", result);
  return result;
}

- (id)newTextEffectStackForStylePresetName:(id)a3 styleConfiguration:(id)a4 foregroundColor:(CGColor *)a5
{
  id v7;
  void *v8;
  CUITextEffectStack *v9;
  double v10;
  double v11;

  v7 = -[CUICatalog newShapeEffectPresetForStylePresetName:styleConfiguration:](self, "newShapeEffectPresetForStylePresetName:styleConfiguration:", a3);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = -[CUITextEffectStack initWithEffectPreset:]([CUITextEffectStack alloc], "initWithEffectPreset:", v7);

  if (v9)
  {
    objc_msgSend(a4, "effectScale");
    if (v10 > 0.0)
    {
      objc_msgSend(a4, "effectScale");
      -[CUIShapeEffectStack scaleEffectParametersBy:](v9, "scaleEffectParametersBy:");
    }
    if (a5)
    {
      if ((objc_msgSend(a4, "shouldIgnoreForegroundColor") & 1) == 0)
        -[CUIShapeEffectStack applyCustomForegroundColor:tintEffectColors:](v9, "applyCustomForegroundColor:tintEffectColors:", a5, objc_msgSend(a4, "foregroundColorShouldTintEffects"));
      objc_msgSend(a4, "brightnessMultiplier");
      if (v11 > 0.0)
      {
        objc_msgSend(a4, "brightnessMultiplier");
        -[CUIShapeEffectStack scaleBrightnessOfEffectColorsByAmount:onlyTintableColors:](v9, "scaleBrightnessOfEffectColorsByAmount:onlyTintableColors:", 0);
      }
      if ((unint64_t)objc_msgSend(a4, "colorTemperature") >= 0x3E8
        && (unint64_t)objc_msgSend(a4, "colorTemperature") <= 0x9C40)
      {
        -[CUIShapeEffectStack adjustEffectColorsToTemperature:onlyTintableColors:](v9, "adjustEffectColorsToTemperature:onlyTintableColors:", objc_msgSend(a4, "colorTemperature"), 0);
      }
      if (objc_msgSend(a4, "shouldRespectOutputBlending"))
        -[CUIShapeEffectStack updateOutputBlendingWithInteriorFillHeuristic](v9, "updateOutputBlendingWithInteriorFillHeuristic");
    }
  }
  return v9;
}

- (id)newShapeEffectStackForStylePresetName:(id)a3 styleConfiguration:(id)a4 foregroundColor:(CGColor *)a5
{
  id v7;
  CUIShapeEffectStack *v8;
  double v9;

  v7 = -[CUICatalog newShapeEffectPresetForStylePresetName:styleConfiguration:](self, "newShapeEffectPresetForStylePresetName:styleConfiguration:", a3);
  v8 = -[CUIShapeEffectStack initWithEffectPreset:]([CUIShapeEffectStack alloc], "initWithEffectPreset:", v7);

  objc_msgSend(a4, "effectScale");
  if (v9 > 0.0)
  {
    objc_msgSend(a4, "effectScale");
    -[CUIShapeEffectStack scaleEffectParametersBy:](v8, "scaleEffectParametersBy:");
  }
  if (a5 && (objc_msgSend(a4, "shouldIgnoreForegroundColor") & 1) == 0)
    -[CUIShapeEffectStack applyCustomForegroundColor:tintEffectColors:](v8, "applyCustomForegroundColor:tintEffectColors:", a5, objc_msgSend(a4, "foregroundColorShouldTintEffects"));
  return v8;
}

- (BOOL)drawGlyphs:(const unsigned __int16 *)a3 atPositions:(const CGPoint *)a4 inContext:(CGContext *)a5 withFont:(__CTFont *)a6 count:(unint64_t)a7 stylePresetName:(id)a8 styleConfiguration:(id)a9 foregroundColor:(CGColor *)a10
{
  CUIStyleEffectConfiguration *v17;
  CUIStyleEffectConfiguration *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  BOOL v29;
  CGRect *v30;
  CGFloat x;
  double y;
  CGFloat width;
  CGFloat height;
  uint64_t v36;
  uint64_t v37;
  CGFloat *p_width;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double *p_x;
  CUICatalog *v51;
  id v52;
  const CGPoint *v53;
  uint64_t v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  char v57;
  CGRect v58;
  CGRect v59;
  CGRect BoundingRectsForGlyphs;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  NSRect v65;
  CGRect ClipBoundingBox;

  kdebug_trace(726663181, 1, 0, 0, 0);
  if (!a7)
    goto LABEL_11;
  if (a9)
    v17 = (CUIStyleEffectConfiguration *)objc_msgSend(a9, "copy");
  else
    v17 = objc_alloc_init(CUIStyleEffectConfiguration);
  v18 = v17;
  -[CUIStyleEffectConfiguration setUseSimplifiedEffect:](v17, "setUseSimplifiedEffect:", objc_msgSend(a9, "useSimplifiedEffect"));
  -[CUIStyleEffectConfiguration setUseSimplifiedEffect:](v18, "setUseSimplifiedEffect:", _CUIDebugUseSimplifiedTextEffects() & -[CUIStyleEffectConfiguration useSimplifiedEffect](v18, "useSimplifiedEffect"));
  if (!-[CUIStyleEffectConfiguration useSimplifiedEffect](v18, "useSimplifiedEffect"))
  {
    if (a7 < 0x81)
    {
      v30 = (CGRect *)&v57;
    }
    else
    {
      v30 = (CGRect *)malloc_type_calloc(a7, 0x20uLL, 0x1000040E0EAB150uLL);
      if (!v30)
        goto LABEL_21;
    }
    BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(a6, kCTFontOrientationDefault, a3, v30, a7);
    x = BoundingRectsForGlyphs.origin.x;
    y = BoundingRectsForGlyphs.origin.y;
    width = BoundingRectsForGlyphs.size.width;
    height = BoundingRectsForGlyphs.size.height;
    if (CGRectGetHeight(BoundingRectsForGlyphs) != 0.0)
    {
      v61.origin.x = x;
      v61.origin.y = y;
      v61.size.width = width;
      v61.size.height = height;
      if (CGRectGetWidth(v61) != 0.0)
      {
        v51 = self;
        v52 = a8;
        v53 = a4;
        v54 = 0;
        v36 = 0;
        v37 = 0;
        p_width = &v30->size.width;
        v39 = 0.0;
        v40 = 0.0;
        v41 = 0.0;
        v42 = 0.0;
        do
        {
          v43 = *(p_width - 2);
          v62.origin.y = *(p_width - 1);
          v44 = *p_width;
          v62.size.height = p_width[1];
          v62.origin.x = v43;
          v62.size.width = *p_width;
          if (CGRectIsNull(v62))
            goto LABEL_30;
          if (v43 + a4->x < v42 + v40)
          {
            v36 = v37;
            v42 = a4->x;
            v40 = v43;
          }
          v45 = v43 + v44;
          if (v43 + v44 + a4->x <= v41 + v39)
          {
LABEL_30:
            v45 = v39;
          }
          else
          {
            v54 = v37;
            v41 = a4->x;
          }
          ++v37;
          ++a4;
          p_width += 4;
          v39 = v45;
        }
        while (a7 != v37);
        memset(&v56, 0, sizeof(v56));
        CGContextGetTextMatrix(&v56, a5);
        a4 = v53;
        v46 = v30[v54].size.width + v30[v54].origin.x;
        if (v46 <= 0.0)
          v46 = -0.0;
        v47 = v56.c * 0.0 + v56.a * (v41 - v42) + v46;
        v48 = v30[v36].origin.x;
        if (v48 >= 0.0)
          v49 = 0.0;
        else
          v49 = -v48;
        v63.size.width = v49 + v47;
        p_x = &v53[v36].x;
        v63.origin.x = *p_x - v49;
        v63.origin.y = y + p_x[1];
        v55 = v56;
        v63.size.height = height;
        v64 = CGRectApplyAffineTransform(v63, &v55);
        v65 = NSIntegralRectWithOptions(v64, 0xF00uLL);
        v19 = v65.origin.x;
        v20 = v65.origin.y;
        v21 = v65.size.width;
        v22 = v65.size.height;
        if (a7 >= 0x81)
          free(v30);
        self = v51;
        a8 = v52;
        goto LABEL_7;
      }
    }
    if (a7 >= 0x81)
      free(v30);
LABEL_21:

    kdebug_trace(726663182, 1, 0, 0, 0);
    return 1;
  }
  v19 = CGRectInfinite.origin.x;
  v20 = CGRectInfinite.origin.y;
  v21 = CGRectInfinite.size.width;
  v22 = CGRectInfinite.size.height;
LABEL_7:
  ClipBoundingBox = CGContextGetClipBoundingBox(a5);
  v58.origin.x = v19;
  v58.origin.y = v20;
  v58.size.width = v21;
  v58.size.height = v22;
  v59 = CGRectIntersection(v58, ClipBoundingBox);
  if (v59.size.height == 0.0 || (v23 = v59.size.width, v59.size.width == 0.0))
  {

    v29 = 1;
    kdebug_trace(726663182, 1, 0, 0, 0);
    return v29;
  }
  v24 = v59.origin.x;
  v25 = v59.origin.y;
  v26 = v59.size.height;
  v27 = _CUIEffectiveScaleForContext(a5);
  v28 = -[CUICatalog newTextEffectStackForStylePresetName:styleConfiguration:foregroundColor:](self, "newTextEffectStackForStylePresetName:styleConfiguration:foregroundColor:", a8, v18, a10);

  if (!v28)
  {
    kdebug_trace(726663182, 1, 0, 0, 0);
    return 0;
  }
  objc_msgSend(v28, "drawGlyphs:inContext:usingFont:atPositions:count:lineHeight:inBounds:atScale:", a3, a5, a6, a4, a7, 0.0, v24, v25, v23, v26, v27);

LABEL_11:
  v29 = 1;
  kdebug_trace(726663182, 1, 0, 0, 0);
  return v29;
}

- (BOOL)_doStyledQuartzDrawingInContext:(CGContext *)a3 inBounds:(CGRect)a4 stylePresetName:(id)a5 styleConfiguration:(id)a6 drawingHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CUIStyleEffectConfiguration *v21;
  CUIStyleEffectConfiguration *v22;
  id v23;
  CGRect v25;
  CGRect v26;
  CGRect ClipBoundingBox;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  ClipBoundingBox = CGContextGetClipBoundingBox(a3);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v26 = CGRectIntersection(v25, ClipBoundingBox);
  v16 = v26.origin.x;
  v17 = v26.origin.y;
  v18 = v26.size.width;
  v19 = v26.size.height;
  if (v26.size.height == 0.0 && v26.size.width == 0.0)
    return 1;
  v20 = _CUIEffectiveScaleForContext(a3);
  if (a6)
    v21 = (CUIStyleEffectConfiguration *)objc_msgSend(a6, "copy");
  else
    v21 = objc_alloc_init(CUIStyleEffectConfiguration);
  v22 = v21;
  -[CUIStyleEffectConfiguration setUseSimplifiedEffect:](v21, "setUseSimplifiedEffect:", objc_msgSend(a6, "useSimplifiedEffect"));
  -[CUIStyleEffectConfiguration setUseSimplifiedEffect:](v22, "setUseSimplifiedEffect:", _CUIDebugUseSimplifiedTextEffects() & -[CUIStyleEffectConfiguration useSimplifiedEffect](v22, "useSimplifiedEffect"));
  v23 = -[CUICatalog newTextEffectStackForStylePresetName:styleConfiguration:foregroundColor:](self, "newTextEffectStackForStylePresetName:styleConfiguration:foregroundColor:", a5, v22, CGContextGetFillColorAsColor(a3));

  if (v23)
  {
    objc_msgSend(v23, "drawUsingQuartz:inContext:inBounds:atScale:", a7, a3, v16, v17, v18, v19, v20);

    return 1;
  }
  return 0;
}

- (BOOL)strokeStyledPath:(CGPath *)a3 inContext:(CGContext *)a4 stylePresetName:(id)a5 styleConfiguration:(id)a6
{
  if (!a4)
    return 0;
  if (a3)
  {
    CGContextBeginPath(a4);
    CGContextAddPath(a4, a3);
  }
  CGContextReplacePathWithStrokedPath(a4);
  return -[CUICatalog fillStyledPath:inContext:stylePresetName:styleConfiguration:](self, "fillStyledPath:inContext:stylePresetName:styleConfiguration:", 0, a4, a5, a6);
}

- (BOOL)fillStyledPath:(CGPath *)a3 inContext:(CGContext *)a4 stylePresetName:(id)a5 styleConfiguration:(id)a6
{
  const CGPath *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL v16;
  _QWORD v18[6];
  CGRect BoundingBox;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  if (a4)
  {
    if (a3)
    {
      CGContextBeginPath(a4);
      CGContextAddPath(a4, a3);
    }
    v11 = CGContextCopyPath(a4);
    BoundingBox = CGPathGetBoundingBox(v11);
    if (v11)
    {
      x = BoundingBox.origin.x;
      y = BoundingBox.origin.y;
      width = BoundingBox.size.width;
      height = BoundingBox.size.height;
      if (!CGRectIsEmpty(BoundingBox))
      {
        v20.origin.x = x;
        v20.origin.y = y;
        v20.size.width = width;
        v20.size.height = height;
        v21 = CGContextConvertRectToDeviceSpace(a4, v20);
        v22 = CGRectIntegral(v21);
        v23 = CGContextConvertRectToUserSpace(a4, v22);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = __74__CUICatalog_fillStyledPath_inContext_stylePresetName_styleConfiguration___block_invoke;
        v18[3] = &__block_descriptor_48_e20_v16__0__CGContext__8l;
        v18[4] = v11;
        v18[5] = a4;
        v16 = -[CUICatalog _doStyledQuartzDrawingInContext:inBounds:stylePresetName:styleConfiguration:drawingHandler:](self, "_doStyledQuartzDrawingInContext:inBounds:stylePresetName:styleConfiguration:drawingHandler:", a4, a5, a6, v18, v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
        CGPathRelease(v11);
        return v16;
      }
    }
    CGPathRelease(v11);
  }
  return 0;
}

void __74__CUICatalog_fillStyledPath_inContext_stylePresetName_styleConfiguration___block_invoke(uint64_t a1, CGContextRef c)
{
  const CGPath *v4;

  v4 = CGContextCopyPath(c);
  if (*(const CGPath **)(a1 + 32) != v4)
  {
    CGContextBeginPath(*(CGContextRef *)(a1 + 40));
    CGContextAddPath(c, *(CGPathRef *)(a1 + 32));
  }
  CGContextFillPath(c);
  CGPathRelease(v4);
}

- (BOOL)fillStyledRect:(CGRect)a3 inContext:(CGContext *)a4 stylePresetName:(id)a5 styleConfiguration:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v15;

  if (!a4)
    return 0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
    return 0;
  CGContextBeginPath(a4);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  CGContextAddRect(a4, v15);
  return -[CUICatalog fillStyledPath:inContext:stylePresetName:styleConfiguration:](self, "fillStyledPath:inContext:stylePresetName:styleConfiguration:", 0, a4, a5, a6);
}

- (BOOL)hasStylePresetWithName:(id)a3 styleConfiguration:(id)a4
{
  id v6;
  _WORD *v7;
  unsigned __int16 v9[44];

  if (a3)
  {
    v6 = -[CUICatalog _themeStore](self, "_themeStore", a3, a4);
    v7 = objc_msgSend(v6, "renditionKeyForName:", a3);
    if (v7)
    {
      CUIRenditionKeyCopy(v9, v7, 0x16u);
      CUIRenditionKeySetValueForAttribute(v9, 12, 1, 0x16u);
      LOBYTE(v7) = objc_msgSend(objc_msgSend(v6, "renditionWithKey:", v9), "type") == (id)7;
    }
  }
  else
  {
    v7 = -[CUICatalog renditionKeyForShapeEffectPresetForStylePresetName:styleConfiguration:](self, "renditionKeyForShapeEffectPresetForStylePresetName:styleConfiguration:", 0, a4);
    if (v7)
      LOBYTE(v7) = -[CUICatalog canGetShapeEffectRenditionWithKey:](self, "canGetShapeEffectRenditionWithKey:", v7);
  }
  return (char)v7;
}

- (BOOL)hasStylePresetWithName:(id)a3
{
  return -[CUICatalog hasStylePresetWithName:styleConfiguration:](self, "hasStylePresetWithName:styleConfiguration:", a3, 0);
}

- (CGColor)equivalentForegroundColorForStylePresetWithName:(id)a3 styleConfiguration:(id)a4
{
  id v7;
  CGColor *v8;

  v7 = objc_msgSend(a4, "foregroundColorShouldTintEffects");
  objc_msgSend(a4, "setForegroundColorShouldTintEffects:", 0);
  v8 = -[CUICatalog equivalentForegroundColorForStylePresetWithName:styleConfiguration:baseForegroundColor:](self, "equivalentForegroundColorForStylePresetWithName:styleConfiguration:baseForegroundColor:", a3, a4, 0);
  objc_msgSend(a4, "setForegroundColorShouldTintEffects:", v7);
  return v8;
}

- (CGColor)equivalentForegroundColorForStylePresetWithName:(id)a3 styleConfiguration:(id)a4 baseForegroundColor:(CGColor *)a5
{
  id v9;
  void *v10;
  id v11;

  if (objc_msgSend(a4, "useSimplifiedEffect"))
    v9 = -[CUICatalog newTextEffectStackForStylePresetName:styleConfiguration:foregroundColor:](self, "newTextEffectStackForStylePresetName:styleConfiguration:foregroundColor:", a3, a4, a5);
  else
    v9 = -[CUICatalog newShapeEffectStackForStylePresetName:styleConfiguration:foregroundColor:](self, "newShapeEffectStackForStylePresetName:styleConfiguration:foregroundColor:", a3, a4, a5);
  v10 = v9;
  if ((objc_msgSend(v9, "expressableByColorFillCheckingOutputBlending:", objc_msgSend(a4, "shouldRespectOutputBlending")) & 1) != 0)
  {
    v11 = objc_msgSend(v10, "newColorByProcessingColor:", 0);

    if (v11)
      return (CGColor *)CFAutorelease(v11);
  }
  else
  {

  }
  return 0;
}

- (int)blendModeForStylePresetWithName:(id)a3 styleConfiguration:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *i;
  unsigned int v10;
  unsigned int v11;

  v4 = -[CUICatalog newShapeEffectPresetForStylePresetName:styleConfiguration:](self, "newShapeEffectPresetForStylePresetName:styleConfiguration:", a3, a4);
  if (v4)
  {
    v5 = v4;
    v6 = 1852797549;
    v7 = (char *)objc_msgSend(v4, "effectCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        v10 = objc_msgSend(v5, "effectTypeAtIndex:", i);
        v11 = v10;
        if (v10 == 1198678372 || v10 == 1131375730)
          v6 = (uint64_t)objc_msgSend(v5, "valueForParameter:inEffectAtIndex:", 7, i);
        if (v11 == 1131375730)
          break;
        if (v11 == 1198678372)
          break;
      }
    }

    LODWORD(v4) = +[CUIShapeEffectPreset cgBlendModeFromCUIEffectBlendMode:](CUIShapeEffectPreset, "cgBlendModeFromCUIEffectBlendMode:", v6);
  }
  return (int)v4;
}

- (void)_vibrantColorMatrixBrightnessSaturationForColor:(CGColor *)a3 saturation:(double *)a4 brightness:(double *)a5
{
  id v9;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  const CGFloat *Components;
  NSArray *v14;
  double v15;
  double v16;
  double v17;
  char *v18;
  double v19;
  char *v20;
  char *v21;
  int v22;
  char *v23;
  id v24;
  signed int v25;
  signed int v26;
  double v27;
  unsigned __int16 v28;
  id v29;
  unsigned int v30;
  unsigned __int16 v31;
  unsigned __int16 v32;
  double v33;
  double v34;
  double v35;
  _QWORD v36[6];

  if (!self->_vibrantColorMatrixTints)
  {
    if (_vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness__onceToken[0] != -1)
      dispatch_once(_vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness__onceToken, &__block_literal_global_148);
    v9 = objc_alloc((Class)NSMutableDictionary);
    v10 = (NSDictionary *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend((id)_vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness__colorNamesTintNames, "count"));
    v12 = _LookupStructuredThemeProvider(self->_storageRef, v11);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __84__CUICatalog__vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness___block_invoke_2;
    v36[3] = &unk_1E41B8EB0;
    v36[4] = v12;
    v36[5] = v10;
    objc_msgSend((id)_vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness__colorNamesTintNames, "enumerateKeysAndObjectsUsingBlock:", v36);
    self->_vibrantColorMatrixTints = v10;
  }
  Components = CGColorGetComponents(a3);
  v34 = 0.0;
  v35 = 0.0;
  v33 = 0.0;
  v14 = -[NSArray sortedArrayUsingSelector:](-[NSDictionary allKeys](self->_vibrantColorMatrixTints, "allKeys", _CUIRGBToHSB(&v35, &v34, &v33, *Components, Components[1], Components[2])), "sortedArrayUsingSelector:", sel_compare_);
  v16 = v34;
  v15 = v35;
  v17 = v33;
  v18 = -[NSArray count](v14, "count");
  v19 = 1.0;
  if (!v18)
  {
LABEL_10:
    v27 = 1.0;
    if (!a5)
      goto LABEL_12;
    goto LABEL_11;
  }
  v20 = v18;
  v21 = 0;
  v22 = ((int)(v16 * 255.0) << 8) | ((int)(v15 * 360.0) << 16) | (int)(v17 * 255.0);
  v23 = v18 - 1;
  while (1)
  {
    v24 = -[NSArray objectAtIndex:](v14, "objectAtIndex:", v21);
    v25 = objc_msgSend(v24, "intValue");
    v26 = v25;
    if (v23 == v21 || v25 > v22)
      break;
    if (v20 == ++v21)
      goto LABEL_10;
  }
  v28 = (unsigned __int16)objc_msgSend(-[NSDictionary objectForKey:](self->_vibrantColorMatrixTints, "objectForKey:", v24), "intValue");
  if (v21)
  {
    v29 = -[NSArray objectAtIndex:](v14, "objectAtIndex:", v21 - 1);
    v30 = objc_msgSend(v29, "intValue");
    v31 = (unsigned __int16)objc_msgSend(-[NSDictionary objectForKey:](self->_vibrantColorMatrixTints, "objectForKey:", v29), "intValue");
  }
  else
  {
    v31 = 0;
    v30 = 0x7FFFFFFF;
  }
  if (v26 - v22 <= (int)(v22 - v30))
    v32 = v28;
  else
    v32 = v31;
  if (!v21)
    v32 = v28;
  v19 = (double)HIBYTE(v32) / 255.0 + (double)HIBYTE(v32) / 255.0;
  v27 = (double)v32 / 255.0 + (double)v32 / 255.0;
  if (a5)
LABEL_11:
    *a5 = v27;
LABEL_12:
  if (a4)
    *a4 = v19;
}

id __84__CUICatalog__vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness___block_invoke()
{
  id result;

  result = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", CFSTR("privateVibrantMatrixTintRedColor"), CFSTR("systemRedColor"), CFSTR("privateVibrantMatrixTintOrangeColor"), CFSTR("systemOrangeColor"), CFSTR("privateVibrantMatrixTintYellowColor"), CFSTR("systemYellowColor"), CFSTR("privateVibrantMatrixTintGreenColor"), CFSTR("systemGreenColor"), CFSTR("privateVibrantMatrixTintTealColor"), CFSTR("systemTealColor"), CFSTR("privateVibrantMatrixTintBlueColor"), CFSTR("systemBlueColor"), CFSTR("privateVibrantMatrixTintIndigoColor"), CFSTR("systemIndigoColor"), CFSTR("privateVibrantMatrixTintPurpleColor"), CFSTR("systemPurpleColor"), CFSTR("privateVibrantMatrixTintPinkColor"),
             CFSTR("systemPinkColor"),
             CFSTR("privateVibrantMatrixTintBrownColor"),
             CFSTR("systemBrownColor"),
             0);
  _vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness__colorNamesTintNames = (uint64_t)result;
  return result;
}

id __84__CUICatalog__vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5;
  id result;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;

  v17 = 0;
  v16 = 0;
  v15 = 0;
  v14 = 0;
  v5 = objc_msgSend(*(id *)(a1 + 32), "getPhysicalColor:withName:", &v16, a2);
  result = objc_msgSend(*(id *)(a1 + 32), "getPhysicalColor:withName:", &v14, a3);
  if (v5)
    v7 = (_DWORD)result == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v12 = 0.0;
    v13 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    _CUIRGBToHSB(&v13, &v12, &v11, (double)BYTE2(v17) / 255.0, (double)BYTE1(v17) / 255.0, (double)v17 / 255.0);
    _CUIRGBToHSB(&v10, &v9, &v8, (double)BYTE2(v15) / 255.0, (double)BYTE1(v15) / 255.0, (double)v15 / 255.0);
    return objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ((int)(v9 * 255.0) << 8) | ((int)(v10 * 360.0) << 16) | (int)(v8 * 255.0)), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ((int)(v12 * 255.0) << 8) | ((int)(v13 * 360.0) << 16) | (int)(v11 * 255.0)));
  }
  return result;
}

- (id)compositingFilterForStylePresetWithName:(id)a3 styleConfiguration:(id)a4
{
  return -[CUICatalog compositingFilterForStylePresetWithName:styleConfiguration:foregroundColor:](self, "compositingFilterForStylePresetWithName:styleConfiguration:foregroundColor:", a3, a4, 0);
}

- (id)compositingFilterForStylePresetWithName:(id)a3 styleConfiguration:(id)a4 foregroundColor:(CGColor *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  unsigned __int8 v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  double v20;
  double v21;
  CGColorSpace *SRGB;
  CGColorRef CopyByMatchingToColorSpace;
  CGColor *v24;
  CGColor *v26;
  _OWORD v27[7];
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v8 = -[CUICatalog newShapeEffectPresetForStylePresetName:styleConfiguration:](self, "newShapeEffectPresetForStylePresetName:styleConfiguration:", a3);
  v9 = v8;
  if (v8)
  {
    v26 = a5;
    v10 = 1852797549;
    v11 = (char *)objc_msgSend(v8, "effectCount");
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      LOBYTE(v14) = 0;
      LOBYTE(v15) = 0;
      v16 = 0;
      do
      {
        v17 = objc_msgSend(v9, "effectTypeAtIndex:", v13);
        v18 = v17;
        if (v17 == 1198678372 || v17 == 1131375730)
        {
          v10 = (uint64_t)objc_msgSend(v9, "valueForParameter:inEffectAtIndex:", 7, v13);
          v19 = (unint64_t)objc_msgSend(v9, "valueForParameter:inEffectAtIndex:", 0, v13);
          v16 = v19;
          v15 = v19 >> 8;
          v14 = v19 >> 16;
        }
        if (v18 == 1131375730)
          break;
        if (v18 == 1198678372)
          break;
        ++v13;
      }
      while (v12 != v13);
    }
    else
    {
      v16 = 0;
      LOBYTE(v15) = 0;
      LOBYTE(v14) = 0;
    }

    v9 = +[CUIShapeEffectPreset caFilterFromCUIEffectBlendMode:](CUIShapeEffectPreset, "caFilterFromCUIEffectBlendMode:", v10);
    if (v9 && ((_DWORD)v10 == 1986229103 || (_DWORD)v10 == 1986227573))
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v29 = 0u;
      if (v26 && objc_msgSend(a4, "foregroundColorShouldTintEffects"))
      {
        v20 = (double)(v15 + v16 + v14) / 255.0 / 3.0;
        v21 = v20 + v20;
        SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
        if (CGColorGetColorSpace(v26) == SRGB)
          CopyByMatchingToColorSpace = CGColorRetain(v26);
        else
          CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(SRGB, kCGRenderingIntentDefault, v26, 0);
        v24 = CopyByMatchingToColorSpace;
        *(_QWORD *)&v27[0] = 0;
        v28 = 0.0;
        -[CUICatalog _vibrantColorMatrixBrightnessSaturationForColor:saturation:brightness:](self, "_vibrantColorMatrixBrightnessSaturationForColor:saturation:brightness:", CopyByMatchingToColorSpace, v27, &v28);
        v28 = v21 * v28;
        +[CUIShapeEffectPreset vibrantColorMatrixOptionsWithColor:saturation:brightness:](CUIShapeEffectPreset, "vibrantColorMatrixOptionsWithColor:saturation:brightness:", v24, *(double *)v27);
        CGColorRelease(v24);
      }
      else
      {
        +[CUIShapeEffectPreset monochromeVibrantColorMatrixOptions](CUIShapeEffectPreset, "monochromeVibrantColorMatrixOptions");
      }
      v27[4] = v33;
      v27[5] = v34;
      v27[6] = v35;
      v27[0] = v29;
      v27[1] = v30;
      v27[2] = v31;
      v27[3] = v32;
      +[CUIShapeEffectPreset configureVibrantColorMatrixFilter:withOptions:](CUIShapeEffectPreset, "configureVibrantColorMatrixFilter:withOptions:", v9, v27);
    }
  }
  return v9;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)styledInsetsForStylePresetName:(id)a3 styleConfiguration:(id)a4 foregroundColor:(CGColor *)a5 scale:(double)a6
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v7 = -[CUICatalog newShapeEffectStackForStylePresetName:styleConfiguration:foregroundColor:](self, "newShapeEffectStackForStylePresetName:styleConfiguration:foregroundColor:", a3, a4, a5);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "effectInsetsWithScale:", a6);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
  else
  {
    v16 = 0.0;
    v14 = 0.0;
    v12 = 0.0;
    v10 = 0.0;
  }
  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (id)imageByStylingImage:(CGImage *)a3 stylePresetName:(id)a4 styleConfiguration:(id)a5 foregroundColor:(CGColor *)a6 scale:(double)a7
{
  id v9;
  uint64_t v10;
  void *v11;
  CGImage *v12;
  CGImage *v13;
  CUIImage *v14;

  v9 = -[CUICatalog newShapeEffectStackForStylePresetName:styleConfiguration:foregroundColor:](self, "newShapeEffectStackForStylePresetName:styleConfiguration:foregroundColor:", a4, a5, a6);
  if (!v9)
    return 0;
  v11 = v9;
  v12 = (CGImage *)objc_msgSend(v9, "newFlattenedImageFromShapeCGImage:withScale:ciContext:", a3, objc_msgSend((id)objc_opt_class(v9, v10), "sharedCIContext"), a7);
  if (v12)
  {
    v13 = v12;
    v14 = +[CUIImage imageWithCGImage:](CUIImage, "imageWithCGImage:", v12);
    CGImageRelease(v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)debugDescription
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, %@>"), NSStringFromClass(v3), self, objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "debugDescription"));
}

@end
