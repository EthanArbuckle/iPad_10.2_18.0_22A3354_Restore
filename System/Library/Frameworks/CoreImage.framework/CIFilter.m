@implementation CIFilter

+ (CIFilter)filterWithName:(NSString *)name
{
  return (CIFilter *)objc_msgSend(a1, "filterWithName:setDefaults:", name, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void *__64__CIFilter_CIFilterRegistryPrivate__filterWithName_setDefaults___block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)registeredFilterConstructors;
  if (registeredFilterConstructors)
  {
    result = (void *)objc_msgSend((id)registeredFilterConstructors, "valueForKey:", *(_QWORD *)(a1 + 32));
    if (result)
    {
      result = (void *)objc_msgSend(result, "objectForKey:", kCIConstructorKey);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    }
  }
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("__inputVersion")))
    return self->_priv[0];
  v6.receiver = self;
  v6.super_class = (Class)CIFilter;
  return -[CIFilter valueForUndefinedKey:](&v6, sel_valueForUndefinedKey_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  CGColorSpace *v10;
  CGColorSpace *v11;
  CFTypeID v12;
  CFTypeID TypeID;
  id v14;
  void *v15;
  const __CFString *v16;
  id v17;
  void *v18;
  CFDataRef v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  double v38[3];
  _BYTE v39[128];
  _QWORD v40[10];
  _QWORD v41[7];
  _QWORD v42[20];

  v42[18] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v4 = -[CIFilter inputKeys](self, "inputKeys");
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v10 = (CGColorSpace *)-[CIFilter valueForKey:](self, "valueForKey:", v9);
          if (v10)
          {
            v11 = v10;
            v12 = CFGetTypeID(v10);
            TypeID = CGColorSpaceGetTypeID();
            v14 = objc_alloc(MEMORY[0x1E0CB3940]);
            if (v12 == TypeID)
            {
              v15 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("CICS_%@"), v9);
              v16 = CFSTR("cs_deviceGray");
              switch(CGColorSpaceGetType())
              {
                case 0u:
                  goto LABEL_19;
                case 1u:
                  v16 = CFSTR("cs_deviceRGB");
                  goto LABEL_19;
                case 2u:
                  v16 = CFSTR("cs_deviceCMYK");
                  goto LABEL_19;
                case 3u:
                  *(_QWORD *)&v33 = 0;
                  v31 = 0u;
                  v32 = 0u;
                  v30 = 0u;
                  CGColorSpaceGetCalibratedGrayData();
                  v41[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v30);
                  v41[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v30 + 1));
                  v41[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v31);
                  v41[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v31 + 1));
                  v41[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v32);
                  v41[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v32 + 1));
                  v41[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v33);
                  v20 = (void *)MEMORY[0x1E0C99D20];
                  v21 = v41;
                  v22 = 7;
                  goto LABEL_18;
                case 4u:
                  v37 = 0u;
                  *(_OWORD *)v38 = 0u;
                  v35 = 0u;
                  v36 = 0u;
                  v33 = 0u;
                  v34 = 0u;
                  v31 = 0u;
                  v32 = 0u;
                  v30 = 0u;
                  CGColorSpaceGetCalibratedRGBData();
                  v42[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v30);
                  v42[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v30 + 1));
                  v42[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v31);
                  v42[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v31 + 1));
                  v42[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v32);
                  v42[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v32 + 1));
                  v42[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v33);
                  v42[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v33 + 1));
                  v42[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v34);
                  v42[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v34 + 1));
                  v42[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v35);
                  v42[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v35 + 1));
                  v42[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v36);
                  v42[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v36 + 1));
                  v42[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v37);
                  v42[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v37 + 1));
                  v42[16] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38[0]);
                  v42[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38[1]);
                  v20 = (void *)MEMORY[0x1E0C99D20];
                  v21 = v42;
                  v22 = 18;
                  goto LABEL_18;
                case 5u:
                  v34 = 0u;
                  v35 = 0u;
                  v32 = 0u;
                  v33 = 0u;
                  v30 = 0u;
                  v31 = 0u;
                  CGColorSpaceGetLabData();
                  v40[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v30);
                  v40[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v30 + 1));
                  v40[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v31);
                  v40[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v31 + 1));
                  v40[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v32);
                  v40[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v32 + 1));
                  v40[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v33);
                  v40[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v33 + 1));
                  v40[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v34);
                  v40[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v34 + 1));
                  v20 = (void *)MEMORY[0x1E0C99D20];
                  v21 = v40;
                  v22 = 10;
LABEL_18:
                  v16 = (const __CFString *)objc_msgSend(v20, "arrayWithObjects:count:", v21, v22);
                  if (v16)
                    goto LABEL_19;
                  goto LABEL_21;
                default:
                  v19 = CGColorSpaceCopyICCData(v11);
                  if (!v19)
                    goto LABEL_21;
                  v16 = (const __CFString *)v19;
                  CFAutorelease(v19);
LABEL_19:
                  v17 = a3;
                  v18 = (void *)v16;
                  break;
              }
            }
            else
            {
              v15 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("CI_%@"), v9);
              v17 = a3;
              v18 = v11;
            }
            objc_msgSend(v17, "encodeObject:forKey:", v18, v15);
LABEL_21:

          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
      }
      while (v6);
    }
    if (-[CIFilter userInfo](self, "userInfo") && -[CIFilter encodeWithCoder:]::onceToken != -1)
      dispatch_once(&-[CIFilter encodeWithCoder:]::onceToken, &__block_literal_global_28);
    v23 = self->_priv[4];
    if (v23)
      objc_msgSend(a3, "encodeObject:forKey:", v23, CFSTR("CIName"));
    v24 = -[CIFilter valueForKey:](self, "valueForKey:", CFSTR("__inputVersion"));
    if (v24)
      objc_msgSend(a3, "encodeObject:forKey:", v24, CFSTR("CIVersion"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CIRequiresKeyedArchiver"), CFSTR("CoreImage requires keyed archiving."));
  }
}

+ (CIFilter)filterWithName:(id)a3 setDefaults:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  SEL v7;
  uint64_t v8;
  CIFilter *v9;
  objc_class *v10;
  objc_class *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v4 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  v19 = 0;
  v6 = filterRegistryIsolationQueue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__CIFilter_CIFilterRegistryPrivate__filterWithName_setDefaults___block_invoke;
  v13[3] = &unk_1E2EC3D38;
  v13[4] = a3;
  v13[5] = &v14;
  dispatch_sync(v6, v13);
  if (v15[5])
  {
    v7 = NSSelectorFromString(CFSTR("filterWithName:"));
    v8 = objc_msgSend((id)v15[5], "methodForSelector:", v7);
    if (v8 != +[CIFilter methodForSelector:](CIFilter, "methodForSelector:", v7))
    {
      v9 = (CIFilter *)objc_msgSend((id)v15[5], "filterWithName:", a3);
      if (!v9)
        goto LABEL_15;
      goto LABEL_11;
    }
  }
  v10 = NSClassFromString((NSString *)a3);
  if (v10)
  {
    if (-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()))
    {
      v9 = (CIFilter *)objc_alloc_init(v10);
      if (v9)
      {
LABEL_11:
        if (!v4)
          goto LABEL_15;
        goto LABEL_14;
      }
    }
  }
  if (classNameIsSystemFilter((NSString *)a3))
  {
    v11 = NSClassFromString((NSString *)a3);
    if (v11)
    {
      v9 = (CIFilter *)objc_alloc_init(v11);
      goto LABEL_11;
    }
  }
  v9 = 0;
  if (v4)
LABEL_14:
    -[CIFilter setDefaults](v9, "setDefaults");
LABEL_15:
  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  void *v7;
  objc_super v8;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("__inputVersion")))
  {
    v7 = self->_priv[0];
    if (v7)

    self->_priv[0] = (void *)objc_msgSend(a3, "copy");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CIFilter;
    -[CIFilter setValue:forUndefinedKey:](&v8, sel_setValue_forUndefinedKey_, a3, a4);
  }
}

- (void)dealloc
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  SEL v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v3 = +[CIFilterClassInfo classInfoForClass:](CIFilterClassInfo, "classInfoForClass:", objc_opt_class());
  v4 = (void *)objc_msgSend(v3, "inputKeys");
  v5 = (void *)objc_msgSend(v3, "inputClasses");
  v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  v7 = NSSelectorFromString(CFSTR("dealloc"));
  v8 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", v7);
  v9 = +[CIFilter instanceMethodForSelector:](CIFilter, "instanceMethodForSelector:", v7);
  if (objc_msgSend(v4, "count"))
  {
    v10 = 0;
    do
    {
      v11 = objc_msgSend(v4, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
      if (objc_msgSend(v12, "length") && (objc_msgSend(v12, "isEqualToString:", CFSTR("__WrappedNSNumber")) & 1) == 0)
        -[CIFilter _crashed_when_dealloc_called_setValue_nil_forKey_probably_because_the_subclass_already_released_it:className:overridesDealloc:](self, "_crashed_when_dealloc_called_setValue_nil_forKey_probably_because_the_subclass_already_released_it:className:overridesDealloc:", v11, v6, v8 != v9);
      ++v10;
    }
    while (v10 < objc_msgSend(v4, "count"));
  }

  v13.receiver = self;
  v13.super_class = (Class)CIFilter;
  -[CIFilter dealloc](&v13, sel_dealloc);
}

- (void)_crashed_when_dealloc_called_setValue_nil_forKey_probably_because_the_subclass_already_released_it:(id)a3 className:(const char *)a4 overridesDealloc:(BOOL)a5
{
  _BOOL4 v5;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  char __str[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v5 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  *(_OWORD *)__str = 0u;
  v14 = 0u;
  v9 = (const char *)objc_msgSend(a3, "UTF8String");
  v10 = "";
  if (v5)
    v10 = " (e.g. in its dealloc method)";
  v11 = snprintf(__str, 0x200uLL, "Crashed in [CIFilter dealloc] releasing the value of %s for %s.\nIf a CIFilter subclass releases an ivar%s, it must be set to nil afterwards.\n", v9, a4, v10);
  qword_1ECF86DA0 = (uint64_t)__str;
  v12 = (void *)MEMORY[0x194026220](v11);
  -[CIFilter setValue:forKey:](self, "setValue:forKey:", 0, a3);
  objc_autoreleasePoolPop(v12);
  qword_1ECF86DA0 = 0;
}

- (void)setDefaults
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = +[CIFilterClassDefaults classDefaultsForClass:](CIFilterClassDefaults, "classDefaultsForClass:", objc_opt_class());
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[CIFilter inputKeys](self, "inputKeys", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v10 = objc_msgSend(v3, "objectForKey:", v9);
        if (v10)
          -[CIFilter setValue:forKey:](self, "setValue:forKey:", v10, v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
}

- (NSArray)inputKeys
{
  return (NSArray *)objc_msgSend(+[CIFilterClassInfo classInfoForClass:](CIFilterClassInfo, "classInfoForClass:", objc_opt_class()), "inputKeys");
}

- (id)userInfo
{
  return self->_priv[3];
}

- (CIFilter)initWithCoder:(id)a3
{
  CIFilter *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CIFilter *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  CGColorSpaceRef DeviceGray;
  void *v26;
  uint64_t v27;
  CGFloat v28;
  uint64_t v29;
  uint64_t v30;
  CGFloat v31;
  uint64_t v32;
  uint64_t v33;
  CGFloat v34;
  CGFloat v35;
  uint64_t v36;
  uint64_t v37;
  CGFloat v38;
  uint64_t v39;
  uint64_t v40;
  CGFloat v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CGFloat v45;
  uint64_t v46;
  uint64_t v47;
  CGFloat v48;
  uint64_t v49;
  uint64_t v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  CGColorSpace *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
  CIFilter *v69;
  uint64_t v70;
  uint64_t v71;
  id obja;
  NSArray *obj;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  CGFloat whitePoint;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  CGFloat gamma[3];
  CGFloat v89;
  uint64_t v90;
  uint64_t v91;
  CGFloat blackPoint;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    return 0;
  }
  v5 = -[CIFilter init](self, "init");
  if (!v5)
    return 0;
  v69 = v5;
  obja = (id)MEMORY[0x1E0C99E60];
  v70 = objc_opt_class();
  v68 = objc_opt_class();
  v67 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v71 = objc_msgSend(obja, "setWithObjects:", v70, v68, v67, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v17 = v69;
  obj = -[CIFilter inputKeys](v69, "inputKeys");
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
  if (!v18)
    goto LABEL_34;
  v19 = v18;
  v20 = *(_QWORD *)v75;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v75 != v20)
        objc_enumerationMutation(obj);
      v22 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v21);
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CICS_%@"), v22);
      v24 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v16, v23);

      if (v24)
      {
        if (objc_msgSend(CFSTR("cs_deviceGray"), "isEqual:", v24))
        {
          DeviceGray = CGColorSpaceCreateDeviceGray();
LABEL_27:
          v63 = DeviceGray;
          if (DeviceGray)
            -[CIFilter setValue:forKey:](v69, "setValue:forKey:", DeviceGray, v22);
        }
        else
        {
          if (objc_msgSend(CFSTR("cs_deviceRGB"), "isEqual:", v24))
          {
            DeviceGray = CGColorSpaceCreateDeviceRGB();
            goto LABEL_27;
          }
          if (objc_msgSend(CFSTR("cs_deviceCMYK"), "isEqual:", v24))
          {
            DeviceGray = CGColorSpaceCreateDeviceCMYK();
            goto LABEL_27;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v24, "count") == 7)
            {
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 0), "doubleValue");
              whitePoint = v28;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 1), "doubleValue");
              v80 = v29;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 2), "doubleValue");
              v81 = v30;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 3), "doubleValue");
              blackPoint = v31;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 4), "doubleValue");
              v93 = v32;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 5), "doubleValue");
              v94 = v33;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 6), "doubleValue");
              DeviceGray = CGColorSpaceCreateCalibratedGray(&whitePoint, &blackPoint, v34);
              goto LABEL_27;
            }
            if (objc_msgSend(v24, "count") == 10)
            {
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 0), "doubleValue");
              blackPoint = v35;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 1), "doubleValue");
              v93 = v36;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 2), "doubleValue");
              v94 = v37;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 3), "doubleValue");
              v89 = v38;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 4), "doubleValue");
              v90 = v39;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 5), "doubleValue");
              v91 = v40;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 6), "doubleValue");
              whitePoint = v41;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 7), "doubleValue");
              v80 = v42;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 8), "doubleValue");
              v81 = v43;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 9), "doubleValue");
              v82 = v44;
              DeviceGray = CGColorSpaceCreateLab(&blackPoint, &v89, &whitePoint);
              goto LABEL_27;
            }
            if (objc_msgSend(v24, "count") == 18)
            {
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 0), "doubleValue");
              blackPoint = v45;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 1), "doubleValue");
              v93 = v46;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 2), "doubleValue");
              v94 = v47;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 3), "doubleValue");
              v89 = v48;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 4), "doubleValue");
              v90 = v49;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 5), "doubleValue");
              v91 = v50;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 6), "doubleValue");
              gamma[0] = v51;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 7), "doubleValue");
              gamma[1] = v52;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 8), "doubleValue");
              gamma[2] = v53;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 9), "doubleValue");
              whitePoint = v54;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 10), "doubleValue");
              v80 = v55;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 11), "doubleValue");
              v81 = v56;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 12), "doubleValue");
              v82 = v57;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 13), "doubleValue");
              v83 = v58;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 14), "doubleValue");
              v84 = v59;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 15), "doubleValue");
              v85 = v60;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 16), "doubleValue");
              v86 = v61;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 17), "doubleValue");
              v87 = v62;
              DeviceGray = CGColorSpaceCreateCalibratedRGB(&blackPoint, &v89, gamma, &whitePoint);
              goto LABEL_27;
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            DeviceGray = (CGColorSpaceRef)MEMORY[0x194024A50](v24);
            goto LABEL_27;
          }
          v63 = 0;
        }
        CGColorSpaceRelease(v63);
        goto LABEL_30;
      }
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CI_%@"), v22);
      v27 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v71, v26);
      if (v27)
        -[CIFilter setValue:forKey:](v69, "setValue:forKey:", v27, v22);

LABEL_30:
      ++v21;
    }
    while (v19 != v21);
    v64 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
    v19 = v64;
  }
  while (v64);
LABEL_34:
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("CIUserInfo"))
    && -[CIFilter initWithCoder:]::onceToken != -1)
  {
    dispatch_once(&-[CIFilter initWithCoder:]::onceToken, &__block_literal_global_46);
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("CIName")))
    v69->_priv[4] = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CIName"));
  v65 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CIVersion"));
  if (v65)
    -[CIFilter setValue:forKey:](v69, "setValue:forKey:", v65, CFSTR("__inputVersion"));
  return v17;
}

+ (CIFilter)filterWithName:(NSString *)name withInputParameters:(NSDictionary *)params
{
  void *v6;
  CIFilter *v7;
  CIFilter *v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  CIFilter *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x194026220](a1, a2);
  v7 = +[CIFilter filterWithName:setDefaults:](CIFilter, "filterWithName:setDefaults:", name, 1);
  if (v7)
  {
    v8 = v7;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](params, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(params);
          -[CIFilter setValue:forKey:](v8, "setValue:forKey:", -[NSDictionary objectForKey:](params, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12)), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](params, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
    v13 = v8;
    objc_autoreleasePoolPop(v6);
    return v8;
  }
  else
  {
    objc_autoreleasePoolPop(v6);
    return 0;
  }
}

- (NSString)name
{
  objc_class *v3;

  if (self->_priv[4])
    return (NSString *)self->_priv[4];
  v3 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v3);
}

- (id)prewarmingString
{
  void *v3;
  objc_class *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  CFTypeID v13;
  CFDataRef XMPData;
  CFDataRef v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CFTypeID TypeID;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[3];
  _QWORD v33[3];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", NSStringFromClass(v4), CFSTR("FILTERNAME"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = -[CIFilter inputKeys](self, "inputKeys");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (!v6)
    goto LABEL_21;
  v7 = v6;
  v8 = *(_QWORD *)v29;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
      v11 = (void *)-[CIFilter valueForKey:](self, "valueForKey:", v10);
      if (v11)
      {
        v12 = v11;
        v13 = CFGetTypeID(v11);
        if (!v13 || v13 != CGImageMetadataGetTypeID())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32[0] = CFSTR("type");
            v33[0] = objc_msgSend((id)objc_opt_class(), "description");
            v32[1] = CFSTR("extent");
            objc_msgSend(v12, "extent");
            v33[1] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
            v32[2] = CFSTR("description");
            v33[2] = objc_msgSend(v12, "description");
            v16 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
            goto LABEL_15;
          }
          AVCameraCalibrationDataClass();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = AVCameraCalibrationDataDictionary(v12);
LABEL_15:
            v17 = (void *)v16;
            v18 = v3;
          }
          else
          {
            TypeID = CGColorSpaceGetTypeID();
            if (TypeID == CFGetTypeID(v12))
            {
              v23 = ci_logger_filter();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                -[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmingString].cold.3();
              return 0;
            }
            v18 = v3;
            v17 = v12;
          }
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v10);
          continue;
        }
        XMPData = CGImageMetadataCreateXMPData((CGImageMetadataRef)v12, 0);
        if (!XMPData)
        {
          v22 = ci_logger_filter();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmingString].cold.4();
          return 0;
        }
        v15 = XMPData;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", XMPData, v10);
        CFRelease(v15);
      }
    }
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
      continue;
    break;
  }
LABEL_21:
  v27 = 0;
  v20 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v3), 0, &v27);
  if (v27)
  {
    v21 = ci_logger_filter();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmingString].cold.2();
    return 0;
  }
  v24 = (void *)objc_msgSend(v20, "compressedDataUsingAlgorithm:error:", 2, &v27);
  if (!v27)
    return (id)objc_msgSend(v24, "base64EncodedStringWithOptions:", 1);
  v25 = ci_logger_filter();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmingString].cold.1();
  return 0;
}

+ (id)prewarmedFilterFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  CIFilter *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const __CFData *v29;
  CGImageMetadataRef v30;
  CGImageMetadataRef v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v3 = a3;
  v60 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", a3, 1);
    if (!v4)
      return 0;
    v5 = v4;
    v54 = 0;
    v6 = objc_msgSend(v4, "decompressedDataUsingAlgorithm:error:", 2, &v54);

    if (v54)
    {
      v7 = ci_logger_filter();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:].cold.7();
      return 0;
    }
    v48 = (void *)MEMORY[0x1E0C99E60];
    v47 = objc_opt_self();
    v46 = objc_opt_self();
    v45 = objc_opt_self();
    v9 = objc_opt_self();
    v10 = objc_opt_self();
    v11 = objc_opt_self();
    v12 = objc_opt_self();
    v13 = objc_opt_self();
    v14 = objc_opt_self();
    v15 = objc_opt_self();
    v16 = objc_opt_self();
    v17 = objc_opt_self();
    v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v48, "setWithObjects:", v47, v46, v45, v9, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_self(), 0),
                    v6,
                    0);
    if (!v18)
    {
      v40 = ci_logger_filter();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        +[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:].cold.1();
      return 0;
    }
    v19 = v18;
    v20 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("FILTERNAME"));
    if (!v20)
    {
      v41 = ci_logger_filter();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        +[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:].cold.2();
      return 0;
    }
    v21 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", v20);
    if (!v21)
    {
      v42 = ci_logger_filter();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        +[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:].cold.3();
      return 0;
    }
    v3 = v21;
    v22 = -[CIFilter inputKeys](v21, "inputKeys");
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v51;
      while (2)
      {
        v26 = 0;
        v49 = v24;
        do
        {
          if (*(_QWORD *)v51 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v26);
          v28 = objc_msgSend(v19, "objectForKey:", v27);
          if (v28)
          {
            v29 = (const __CFData *)v28;
            if (objc_msgSend(v27, "isEqualToString:", CFSTR("inputAuxDataMetadata"))
              && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v30 = CGImageMetadataCreateFromXMPData(v29);
              if (!v30)
              {
                v43 = ci_logger_filter();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                  +[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:].cold.4();
                return 0;
              }
              v31 = v30;
              objc_msgSend(v3, "setValue:forKey:", v30, CFSTR("inputAuxDataMetadata"));
              CFRelease(v31);
            }
            else if (objc_msgSend(v27, "isEqualToString:", CFSTR("inputCalibrationData"))
                   && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v32 = AVFDepthCameraCalibrationDataInitWithDictionary((uint64_t)v29);
              if (!v32)
              {
                v44 = ci_logger_filter();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  +[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:].cold.5();
                return 0;
              }
              v33 = (void *)v32;
              objc_msgSend(v3, "setValue:forKey:", v32, CFSTR("inputCalibrationData"));

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if ((objc_msgSend((id)-[__CFData objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", CFSTR("type")), "isEqualToString:", objc_msgSend((id)objc_opt_class(), "description")) & 1) == 0)+[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:].cold.6();
                objc_msgSend((id)-[__CFData objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", CFSTR("extent")), "CGRectValue");
                objc_msgSend(v3, "setValue:forKey:", -[CIImage imageByInsertingIntermediate:](-[CIImage imageByCroppingToRect:](+[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor whiteColor](CIColor, "whiteColor")), "imageByCroppingToRect:", v36, v37, v38, v39), "imageByInsertingIntermediate:", 0), v27);
                v24 = v49;
              }
              else
              {
                objc_msgSend(v3, "setValue:forKey:", v29, v27);
              }
            }
          }
          else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("inputShape")) & 1) == 0)
          {
            v34 = ci_logger_filter();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v35 = objc_msgSend((id)objc_opt_class(), "description");
              *(_DWORD *)buf = 138543618;
              v56 = v35;
              v57 = 2114;
              v58 = v27;
              _os_log_error_impl(&dword_1921E4000, v34, OS_LOG_TYPE_ERROR, "%{public}@: Unable to find value in dictionary for key %{public}@", buf, 0x16u);
            }
          }
          ++v26;
        }
        while (v24 != v26);
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v24)
          continue;
        break;
      }
    }
  }
  return v3;
}

- (BOOL)verifyPrewarmedFilter:(id)a3
{
  objc_class *v5;
  NSString *v6;
  objc_class *v7;
  _BOOL4 v8;
  uint64_t v9;
  int32x4_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  float v28;
  float v29;
  float v30;
  void *v31;
  void *v32;
  uint64_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  const char *v53;
  float v54;
  const char *v55;
  float v56;
  const char *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint32x4_t v71;
  uint32x4_t v72;
  void *v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  uint64_t v80;
  double *v81;
  double *v82;
  unint64_t v83;
  CFTypeID TypeID;
  CFDataRef XMPData;
  CFDataRef v86;
  uint64_t v87;
  NSObject *v88;
  CFTypeID v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  const char *v97;
  uint64_t v98;
  double v99;
  double v100;
  NSObject *v101;
  uint32_t v102;
  NSObject *v103;
  uint64_t v104;
  float v105;
  float v106;
  float v107;
  uint64_t v108;
  uint64_t v109;
  double v110;
  NSObject *v111;
  NSObject *v112;
  NSObject *v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  NSObject *v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  uint64_t v121;
  objc_class *v122;
  NSString *v123;
  NSObject *v124;
  uint64_t v125;
  objc_class *v126;
  NSString *v127;
  NSObject *v128;
  uint64_t v129;
  objc_class *v130;
  NSString *v131;
  int32x4_t v133;
  SEL v134;
  float32x4_t v135;
  float32x4_t v136;
  float32x4_t v137;
  float32x4_t v138;
  float32x4_t v139;
  float32x4_t v140;
  float32x4_t v141;
  float32x4_t v142;
  double v143;
  double v144;
  float32x4_t v145;
  float32x4_t v146;
  float32x4_t v147;
  float32x4_t v148;
  float32x4_t v149;
  float32x4_t v150;
  float32x4_t v151;
  id v152;
  NSArray *obj;
  uint64_t v154;
  _QWORD block[8];
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  uint8_t buf[4];
  uint64_t v161;
  _BYTE v162[24];
  double v163;
  __int16 v164;
  double v165;
  __int16 v166;
  double v167;
  _BYTE v168[128];
  uint64_t v169;
  CGRect v170;
  CGRect v171;

  v169 = *MEMORY[0x1E0C80C00];
  obj = -[CIFilter inputKeys](self, "inputKeys");
  if (!a3)
    goto LABEL_88;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = (objc_class *)objc_opt_class();
  v8 = -[NSString isEqualToString:](v6, "isEqualToString:", NSStringFromClass(v7));
  if (!v8)
    return v8;
  v152 = a3;
  v134 = NSSelectorFromString(CFSTR("isEqualTo:"));
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v156, v168, 16);
  if (!v9)
  {
    LOBYTE(v8) = 1;
    return v8;
  }
  v154 = *(_QWORD *)v157;
  v10 = vdupq_n_s32(0x38D1B717u);
  v151 = (float32x4_t)v10;
  v10.i64[0] = 138543362;
  v133 = v10;
LABEL_5:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v157 != v154)
      objc_enumerationMutation(obj);
    v12 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * v11);
    v13 = (void *)-[CIFilter valueForKey:](self, "valueForKey:", v12, *(_OWORD *)&v133);
    if (!v13)
      goto LABEL_27;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v152, "valueForKey:", v12);
      objc_msgSend(v13, "extent");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      objc_msgSend(v14, "extent");
      v171.origin.x = v23;
      v171.origin.y = v24;
      v171.size.width = v25;
      v171.size.height = v26;
      v170.origin.x = v16;
      v170.origin.y = v18;
      v170.size.width = v20;
      v170.size.height = v22;
      if (!CGRectEqualToRect(v170, v171))
        -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.1();
      goto LABEL_27;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)objc_msgSend(v152, "valueForKey:", v12);
      objc_msgSend(v13, "floatValue");
      v29 = v28;
      objc_msgSend(v27, "floatValue");
      if (v29 != v30)
      {
        v103 = ci_logger_filter();
        v8 = os_log_type_enabled(v103, OS_LOG_TYPE_ERROR);
        if (!v8)
          return v8;
        v104 = objc_msgSend((id)objc_opt_class(), "description");
        objc_msgSend(v13, "floatValue");
        v106 = v105;
        objc_msgSend(v27, "floatValue");
        *(_DWORD *)v162 = 138544130;
        *(_QWORD *)&v162[4] = v104;
        *(_WORD *)&v162[12] = 2114;
        *(_QWORD *)&v162[14] = v12;
        *(_WORD *)&v162[22] = 2048;
        v163 = v106;
        v164 = 2048;
        v165 = v107;
        v97 = "%{public}@: Values for %{public}@ are not identical %g != %g";
        goto LABEL_70;
      }
      goto LABEL_27;
    }
    AVCameraCalibrationDataClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v73 = (void *)objc_msgSend(v152, "valueForKey:", v12);
      v74 = objc_msgSend(v13, "count");
      if (v74 != objc_msgSend(v73, "count"))
      {
        v103 = ci_logger_filter();
        v8 = os_log_type_enabled(v103, OS_LOG_TYPE_ERROR);
        if (!v8)
          return v8;
        v108 = objc_msgSend((id)objc_opt_class(), "description");
        *(double *)&v109 = COERCE_DOUBLE(objc_msgSend(v13, "count"));
        v110 = COERCE_DOUBLE(objc_msgSend(v73, "count"));
        *(_DWORD *)v162 = 138544130;
        *(_QWORD *)&v162[4] = v108;
        *(_WORD *)&v162[12] = 2114;
        *(_QWORD *)&v162[14] = v12;
        *(_WORD *)&v162[22] = 2048;
        v163 = *(double *)&v109;
        v164 = 2048;
        v165 = v110;
        v97 = "%{public}@: vectors don't have the same # of components for key %{public}@ (%zu != %zu)";
        goto LABEL_70;
      }
      if (objc_msgSend(v13, "count"))
      {
        v75 = 0.0;
        while (1)
        {
          objc_msgSend(v13, "valueAtIndex:", *(_QWORD *)&v75);
          v77 = v76;
          objc_msgSend(v73, "valueAtIndex:", *(_QWORD *)&v75);
          if (vabdd_f64(v77, v78) > 0.0000999999975)
            break;
          if (++*(_QWORD *)&v75 >= (unint64_t)objc_msgSend(v13, "count"))
            goto LABEL_27;
        }
        v92 = ci_logger_filter();
        v8 = os_log_type_enabled(v92, OS_LOG_TYPE_ERROR);
        if (!v8)
          return v8;
        v93 = objc_msgSend((id)objc_opt_class(), "description");
        objc_msgSend(v13, "valueAtIndex:", *(_QWORD *)&v75);
        v95 = v94;
        objc_msgSend(v73, "valueAtIndex:", *(_QWORD *)&v75);
        *(_DWORD *)v162 = 138544386;
        *(_QWORD *)&v162[4] = v93;
        *(_WORD *)&v162[12] = 2114;
        *(_QWORD *)&v162[14] = v12;
        *(_WORD *)&v162[22] = 2048;
        v163 = v75;
        v164 = 2048;
        v165 = v95;
        v166 = 2048;
        v167 = v96;
        v97 = "%{public}@: Values for vector (%{public}@) at index %lu are not equal %g != %g";
LABEL_67:
        v101 = v92;
        v102 = 52;
        goto LABEL_71;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v79 = (void *)objc_msgSend(v152, "valueForKey:", v12);
        v80 = objc_msgSend(v13, "numberOfComponents");
        if (v80 != objc_msgSend(v13, "numberOfComponents"))
        {
          v103 = ci_logger_filter();
          v8 = os_log_type_enabled(v103, OS_LOG_TYPE_ERROR);
          if (!v8)
            return v8;
          v118 = objc_msgSend((id)objc_opt_class(), "description");
          *(double *)&v119 = COERCE_DOUBLE(objc_msgSend(v13, "numberOfComponents"));
          v120 = COERCE_DOUBLE(objc_msgSend(v79, "numberOfComponents"));
          *(_DWORD *)v162 = 138544130;
          *(_QWORD *)&v162[4] = v118;
          *(_WORD *)&v162[12] = 2114;
          *(_QWORD *)&v162[14] = v12;
          *(_WORD *)&v162[22] = 2048;
          v163 = *(double *)&v119;
          v164 = 2048;
          v165 = v120;
          v97 = "%{public}@: colors don't have the same # of components for key %{public}@ (%zu != %zu)";
LABEL_70:
          v101 = v103;
          v102 = 42;
          goto LABEL_71;
        }
        v81 = (double *)objc_msgSend(v13, "components");
        v82 = (double *)objc_msgSend(v79, "components");
        if (objc_msgSend(v13, "numberOfComponents"))
        {
          *(double *)&v83 = 0.0;
          while (vabdd_f64(*v81, *v82) <= 0.0000999999975)
          {
            ++v83;
            ++v82;
            ++v81;
            if (v83 >= objc_msgSend(v13, "numberOfComponents"))
              goto LABEL_27;
          }
          v92 = ci_logger_filter();
          v8 = os_log_type_enabled(v92, OS_LOG_TYPE_ERROR);
          if (!v8)
            return v8;
          v98 = objc_msgSend((id)objc_opt_class(), "description");
          v99 = *v81;
          v100 = *v82;
          *(_DWORD *)v162 = 138544386;
          *(_QWORD *)&v162[4] = v98;
          *(_WORD *)&v162[12] = 2114;
          *(_QWORD *)&v162[14] = v12;
          *(_WORD *)&v162[22] = 2048;
          v163 = *(double *)&v83;
          v164 = 2048;
          v165 = v99;
          v166 = 2048;
          v167 = v100;
          v97 = "%{public}@: Values for color (%{public}@) at index %lu are not equal %g != %g";
          goto LABEL_67;
        }
      }
      else
      {
        TypeID = CGImageMetadataGetTypeID();
        if (TypeID == CFGetTypeID(v13))
        {
          XMPData = CGImageMetadataCreateXMPData((CGImageMetadataRef)v13, 0);
          v86 = CGImageMetadataCreateXMPData((CGImageMetadataRef)objc_msgSend(v152, "valueForKey:", v12), 0);
          if ((-[__CFData isEqualToData:](XMPData, "isEqualToData:", v86) & 1) == 0)
          {
            v87 = objc_msgSend(v152, "valueForKey:", v12);
            *(_QWORD *)v162 = 0;
            *(_QWORD *)&v162[8] = v162;
            *(_QWORD *)&v162[16] = 0x2020000000;
            LOBYTE(v163) = 1;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __61__CIFilter_SDOFOnlyPrewarmingPrivate__verifyPrewarmedFilter___block_invoke;
            block[3] = &unk_1E2EC3950;
            block[6] = v162;
            block[7] = v87;
            block[4] = v13;
            block[5] = self;
            CGImageMetadataEnumerateTagsUsingBlock((CGImageMetadataRef)v13, 0, 0, block);
            if (!*(_BYTE *)(*(_QWORD *)&v162[8] + 24))
            {
              v88 = ci_logger_filter();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
              {
                v91 = objc_msgSend((id)objc_opt_class(), "description");
                *(_DWORD *)buf = v133.i32[0];
                v161 = v91;
                _os_log_error_impl(&dword_1921E4000, v88, OS_LOG_TYPE_ERROR, "%{public}@: XMP Image metadata may differ", buf, 0xCu);
              }
            }
            _Block_object_dispose(v162, 8);
          }
          if (XMPData)
            CFRelease(XMPData);
          if (v86)
            CFRelease(v86);
          goto LABEL_27;
        }
        v89 = CGColorSpaceGetTypeID();
        if (v89 == CFGetTypeID(v13))
        {
          objc_msgSend(v152, "valueForKey:", v12);
          if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
          {
            v124 = ci_logger_filter();
            v8 = os_log_type_enabled(v124, OS_LOG_TYPE_ERROR);
            if (!v8)
              return v8;
            -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.10();
LABEL_88:
            LOBYTE(v8) = 0;
            return v8;
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v128 = ci_logger_filter();
            v8 = os_log_type_enabled(v128, OS_LOG_TYPE_ERROR);
            if (!v8)
              return v8;
            v121 = objc_msgSend((id)objc_opt_class(), "description");
            v122 = (objc_class *)objc_opt_class();
            *(double *)&v123 = COERCE_DOUBLE(NSStringFromClass(v122));
            *(_DWORD *)v162 = 138543874;
            *(_QWORD *)&v162[4] = v121;
            *(_WORD *)&v162[12] = 2114;
            *(_QWORD *)&v162[14] = v12;
            *(_WORD *)&v162[22] = 2114;
            v163 = *(double *)&v123;
            v97 = "%{public}@: don't know how to check for equality of contents for key %{public}@ (%{public}@) is nil.";
            goto LABEL_100;
          }
          v90 = objc_msgSend(v152, "valueForKey:", v12);
          if (!v90)
          {
            v128 = ci_logger_filter();
            v8 = os_log_type_enabled(v128, OS_LOG_TYPE_ERROR);
            if (!v8)
              return v8;
            v125 = objc_msgSend((id)objc_opt_class(), "description");
            v126 = (objc_class *)objc_opt_class();
            *(double *)&v127 = COERCE_DOUBLE(NSStringFromClass(v126));
            *(_DWORD *)v162 = 138543874;
            *(_QWORD *)&v162[4] = v125;
            *(_WORD *)&v162[12] = 2114;
            *(_QWORD *)&v162[14] = v12;
            *(_WORD *)&v162[22] = 2114;
            v163 = *(double *)&v127;
            v97 = "%{public}@: object for key %{public}@ (%{public}@) is nil.";
            goto LABEL_100;
          }
          if (!objc_msgSend(v13, "performSelector:withObject:", v134, v90))
          {
            v128 = ci_logger_filter();
            v8 = os_log_type_enabled(v128, OS_LOG_TYPE_ERROR);
            if (!v8)
              return v8;
            v129 = objc_msgSend((id)objc_opt_class(), "description");
            v130 = (objc_class *)objc_opt_class();
            *(double *)&v131 = COERCE_DOUBLE(NSStringFromClass(v130));
            *(_DWORD *)v162 = 138543874;
            *(_QWORD *)&v162[4] = v129;
            *(_WORD *)&v162[12] = 2114;
            *(_QWORD *)&v162[14] = v12;
            *(_WORD *)&v162[22] = 2114;
            v163 = *(double *)&v131;
            v97 = "%{public}@: value for key %{public}@ (%{public}@) differs.";
LABEL_100:
            v101 = v128;
            v102 = 32;
LABEL_71:
            _os_log_error_impl(&dword_1921E4000, v101, OS_LOG_TYPE_ERROR, v97, v162, v102);
            goto LABEL_88;
          }
        }
      }
    }
LABEL_27:
    if (++v11 == v9)
    {
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v156, v168, 16);
      LOBYTE(v8) = 1;
      if (v9)
        goto LABEL_5;
      return v8;
    }
  }
  v31 = (void *)objc_msgSend(v152, "valueForKey:", v12);
  v32 = (void *)AVCameraCalibrationDataDictionary(v13);
  v33 = AVCameraCalibrationDataDictionary(v31);
  if ((objc_msgSend(v32, "isEqualToDictionary:", v33) & 1) != 0)
    goto LABEL_26;
  *(double *)v34.i64 = AVCameraCalibrationDataIntrinsicMatrix(v13);
  v148 = v34;
  v149 = v35;
  v150 = v36;
  *(double *)v37.i64 = AVCameraCalibrationDataIntrinsicMatrix(v31);
  v145 = v37;
  v146 = v38;
  v147 = v39;
  v40 = AVCameraCalibrationDataIntrinsicMatrixReferenceDimensions(v13);
  v143 = v41;
  v144 = v40;
  v42 = AVCameraCalibrationDataIntrinsicMatrixReferenceDimensions(v31);
  v44 = v43;
  *(double *)v45.i64 = AVCameraCalibrationDataExtrinsicMatrix(v13);
  v139 = v45;
  v140 = v46;
  v141 = v47;
  v142 = v48;
  *(double *)v49.i64 = AVCameraCalibrationDataExtrinsicMatrix(v31);
  v135 = v49;
  v136 = v50;
  v137 = v51;
  v138 = v52;
  v54 = AVCameraCalibrationDataPixelSize(v13, v53);
  v56 = AVCameraCalibrationDataPixelSize(v31, v55);
  v58 = AVCameraCalibrationDataLensDistortionLookupTable(v13, v57);
  v60 = AVCameraCalibrationDataLensDistortionLookupTable(v31, v59);
  v62 = AVCameraCalibrationDataInverseLensDistortionLookupTable(v13, v61);
  v64 = AVCameraCalibrationDataInverseLensDistortionLookupTable(v31, v63);
  v65 = AVCameraCalibrationDataIntrinsicLensDistortionCenter(v13);
  v67 = v66;
  v68 = AVCameraCalibrationDataIntrinsicLensDistortionCenter(v13);
  v70 = v69;
  v71 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v151, vabdq_f32(v148, v145)), (int8x16_t)vcgeq_f32(v151, vabdq_f32(v149, v146))), (int8x16_t)vcgeq_f32(v151, vabdq_f32(v150, v147)));
  v71.i32[3] = v71.i32[2];
  if ((vminvq_u32(v71) & 0x80000000) == 0)
  {
    v111 = ci_logger_filter();
    v8 = os_log_type_enabled(v111, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.9();
      goto LABEL_88;
    }
    return v8;
  }
  if (v144 == v42 && v143 == v44)
  {
    v72 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v151, vabdq_f32(v139, v135)), (int8x16_t)vcgeq_f32(v151, vabdq_f32(v140, v136))), vandq_s8((int8x16_t)vcgeq_f32(v151, vabdq_f32(v141, v137)), (int8x16_t)vcgeq_f32(v151, vabdq_f32(v142, v138))));
    v72.i32[3] = v72.i32[2];
    if ((vminvq_u32(v72) & 0x80000000) == 0)
    {
      v113 = ci_logger_filter();
      v8 = os_log_type_enabled(v113, OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.7();
      goto LABEL_88;
    }
    if (vabds_f32(v54, v56) > 0.0001)
    {
      v114 = ci_logger_filter();
      v8 = os_log_type_enabled(v114, OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.3();
      goto LABEL_88;
    }
    if ((objc_msgSend(v58, "isEqualToData:", v60) & 1) == 0)
    {
      v115 = ci_logger_filter();
      v8 = os_log_type_enabled(v115, OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.6();
      goto LABEL_88;
    }
    if ((objc_msgSend(v62, "isEqualToData:", v64) & 1) == 0)
    {
      v116 = ci_logger_filter();
      v8 = os_log_type_enabled(v116, OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.5();
      goto LABEL_88;
    }
    if (v65 != v68 || v67 != v70)
    {
      v117 = ci_logger_filter();
      v8 = os_log_type_enabled(v117, OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.4();
      goto LABEL_88;
    }
LABEL_26:
    if ((objc_msgSend(v32, "isEqualToDictionary:", v33) & 1) == 0)
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.2();
    goto LABEL_27;
  }
  v112 = ci_logger_filter();
  v8 = os_log_type_enabled(v112, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.8();
    goto LABEL_88;
  }
  return v8;
}

uint64_t __61__CIFilter_SDOFOnlyPrewarmingPrivate__verifyPrewarmedFilter___block_invoke(uint64_t a1, CFStringRef path)
{
  CGImageMetadataTag *v4;
  CGImageMetadataTagRef v5;
  CGImageMetadataTag *v6;
  BOOL v7;
  void *v8;
  void *v9;
  CGImageMetadataType Type;
  CGImageMetadataType v11;
  CGImageMetadataType v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  __int128 v17;
  unint64_t v18;
  CGImageMetadataTag *v19;
  uint64_t v20;
  CGImageMetadataTag *v21;
  CFTypeRef v22;
  CFTypeRef v23;
  CGImageMetadataTag *v24;
  const void *v25;
  const void *v26;
  NSObject *v27;
  const void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  __int128 v34;
  CGImageMetadataTag *v35;
  CGImageMetadataTag *v36;
  CFStringRef v37;
  CFStringRef cf;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  CFStringRef v42;
  __int16 v43;
  CGImageMetadataTag *v44;
  __int16 v45;
  CGImageMetadataTag *v46;
  __int16 v47;
  CGImageMetadataTag *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = CGImageMetadataCopyTagWithPath(*(CGImageMetadataRef *)(a1 + 32), 0, path);
  v5 = CGImageMetadataCopyTagWithPath(*(CGImageMetadataRef *)(a1 + 56), 0, path);
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = (void *)CGImageMetadataTagCopyValue(v4);
    v9 = (void *)CGImageMetadataTagCopyValue(v6);
    Type = CGImageMetadataTagGetType(v4);
    v11 = CGImageMetadataTagGetType(v4);
    v12 = v11;
    if (v8)
      v13 = v9 == 0;
    else
      v13 = 1;
    v14 = !v13 && Type == v11;
    if (v14 && CFEqual(v8, v9))
    {
LABEL_56:
      CFRelease(v8);
LABEL_57:
      if (v9)
        CFRelease(v9);
      goto LABEL_59;
    }
    v15 = Type == kCGImageMetadataTypeArrayOrdered && v12 == kCGImageMetadataTypeArrayOrdered;
    if (v15
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v16 = objc_msgSend(v8, "count");
      if (v16 == objc_msgSend(v9, "count"))
      {
        if (objc_msgSend(v8, "count"))
        {
          v18 = 0;
          *(_QWORD *)&v17 = 138544386;
          v34 = v17;
          do
          {
            v19 = (CGImageMetadataTag *)objc_msgSend(v8, "objectAtIndexedSubscript:", v18, v34);
            v20 = objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
            if (v19)
            {
              v21 = (CGImageMetadataTag *)v20;
              if (v20)
              {
                v22 = CGImageMetadataTagCopyValue(v19);
                v23 = CGImageMetadataTagCopyValue(v21);
                v24 = v19;
                v25 = v23;
                v35 = v24;
                cf = CGImageMetadataTagCopyName(v24);
                v36 = v21;
                v37 = CGImageMetadataTagCopyName(v21);
                if (v22 && v25 && !CFEqual(v22, v25))
                {
                  v26 = v25;
                  v27 = ci_logger_filter();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  {
                    v30 = objc_msgSend((id)objc_opt_class(), "description");
                    *(_DWORD *)buf = v34;
                    v40 = v30;
                    v41 = 2114;
                    v42 = path;
                    v43 = 2048;
                    v44 = (CGImageMetadataTag *)v18;
                    v45 = 2114;
                    v46 = v35;
                    v47 = 2114;
                    v48 = v36;
                    _os_log_error_impl(&dword_1921E4000, v27, OS_LOG_TYPE_ERROR, "%{public}@: XMP Image metadata may differ for array tag %{public}@ at index %lu (%{public}@ != %{public}@)", buf, 0x34u);
                  }
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
                  v25 = v26;
                }
                v28 = v25;
                if (cf && v37 && !CFEqual(cf, v37))
                {
                  v29 = ci_logger_filter();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    v31 = objc_msgSend((id)objc_opt_class(), "description");
                    *(_DWORD *)buf = v34;
                    v40 = v31;
                    v41 = 2114;
                    v42 = path;
                    v43 = 2048;
                    v44 = (CGImageMetadataTag *)v18;
                    v45 = 2114;
                    v46 = v35;
                    v47 = 2114;
                    v48 = v36;
                    _os_log_error_impl(&dword_1921E4000, v29, OS_LOG_TYPE_ERROR, "%{public}@: XMP Image metadata may differ for array tag %{public}@ at index %lu (%{public}@ != %{public}@)", buf, 0x34u);
                  }
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
                }
                if (v22)
                  CFRelease(v22);
                if (v28)
                  CFRelease(v28);
                if (cf)
                  CFRelease(cf);
                if (v37)
                  CFRelease(v37);
                if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
                  break;
              }
            }
            ++v18;
          }
          while (v18 < objc_msgSend(v8, "count"));
        }
LABEL_55:
        if (!v8)
          goto LABEL_57;
        goto LABEL_56;
      }
    }
    else
    {
      v32 = ci_logger_filter();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v40 = objc_msgSend((id)objc_opt_class(), "description");
        v41 = 2114;
        v42 = path;
        v43 = 2114;
        v44 = v4;
        v45 = 2114;
        v46 = (CGImageMetadataTag *)v9;
        _os_log_error_impl(&dword_1921E4000, v32, OS_LOG_TYPE_ERROR, "%{public}@: XMP Image metadata may differ for tag %{public}@ (%{public}@ != %{public}@)", buf, 0x2Au);
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_55;
  }
  if (!((unint64_t)v4 | (unint64_t)v5))
    return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_59:
  if (v4)
    CFRelease(v4);
  if (v6)
    CFRelease(v6);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

- (unint64_t)hash
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[CIFilter inputKeys](self, "inputKeys");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v3);
      v6 = objc_msgSend((id)-[CIFilter valueForKey:](self, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)), "hash")+ 33 * v6;
    }
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v5);
  return v6;
}

- (NSArray)outputKeys
{
  return (NSArray *)objc_msgSend(+[CIFilterClassInfo classInfoForClass:](CIFilterClassInfo, "classInfoForClass:", objc_opt_class()), "outputKeys");
}

- (CIImage)outputImage
{
  return 0;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)+[CIFilterClassAttributes classAttributesForClass:](CIFilterClassAttributes, "classAttributesForClass:", objc_opt_class());
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("outputImage")))
    return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(+[CIFilterClassInfo classInfoForClass:](CIFilterClassInfo, "classInfoForClass:", objc_opt_class()), "inputKeys"));
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CIFilter;
  return objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingValueForKey_, a3);
}

void __28__CIFilter_encodeWithCoder___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = ci_logger_api();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136446210;
    v2 = "-[CIFilter encodeWithCoder:]_block_invoke";
    _os_log_impl(&dword_1921E4000, v0, OS_LOG_TYPE_INFO, "%{public}s option CIUserInfo is no longer encoded for security.", (uint8_t *)&v1, 0xCu);
  }
}

void __26__CIFilter_initWithCoder___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = ci_logger_api();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136446210;
    v2 = "-[CIFilter initWithCoder:]_block_invoke";
    _os_log_impl(&dword_1921E4000, v0, OS_LOG_TYPE_INFO, "%{public}s option CIUserInfo is no longer encoded for security.", (uint8_t *)&v1, 0xCu);
  }
}

- (id)_copyFilterWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = -[CIFilter _copyFilterWithZone:](self, "_copyFilterWithZone:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = -[CIFilter inputKeys](self, "inputKeys", 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = -[CIFilter valueForKey:](self, "valueForKey:", v10);
        if (v11)
          objc_msgSend(v4, "setValue:forKey:", v11, v10);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  v12 = -[CIFilter valueForKey:](self, "valueForKey:", CFSTR("__inputVersion"));
  if (v12)
    objc_msgSend(v4, "setValue:forKey:", v12, CFSTR("__inputVersion"));
  v13 = self->_priv[4];
  if (v13)
  {
    CFRetain(v13);
    v4[5] = self->_priv[4];
  }
  return v4;
}

- (id)description
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __23__CIFilter_description__block_invoke;
  v3[3] = &unk_1E2EC2F58;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

size_t __23__CIFilter_description__block_invoke(uint64_t a1, FILE *a2)
{
  const char *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  const char *v12;

  v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  fprintf(a2, "<%s: %p", v4, *(const void **)(a1 + 32));
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("__inputVersion"));
  if (v5)
    fprintf(a2, " %s", (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String"));
  v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "inputKeys"), "count");
  if (v6 >= 1)
  {
    v7 = 0;
    v8 = v6;
    do
    {
      v9 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "inputKeys"), "objectAtIndex:", v7);
      v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v9);
      v11 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
      if (v10)
        v12 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
      else
        v12 = "nil";
      fprintf(a2, " %s=%s", v11, v12);
      ++v7;
    }
    while (v8 != v7);
  }
  return fwrite(">\n", 2uLL, 1uLL, a2);
}

- (id)debugDescription
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__CIFilter_debugDescription__block_invoke;
  v3[3] = &unk_1E2EC2F58;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

uint64_t __28__CIFilter_debugDescription__block_invoke(uint64_t a1, FILE *a2)
{
  const char *v4;
  void *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_object *v10;
  CGAffineTransform v11;

  v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  fprintf(a2, "<%s: %p>\n", v4, *(const void **)(a1 + 32));
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("__inputVersion"));
  if (v5)
    fprintf(a2, "    version=%s\n", (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String"));
  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "inputKeys"), "count");
  if ((int)result >= 1)
  {
    v7 = 0;
    v8 = result;
    do
    {
      v9 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "inputKeys"), "objectAtIndex:", v7);
      v10 = (objc_object *)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v9);
      fprintf(a2, "    %s=", (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String"));
      objc_opt_class();
      if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        && CGAffineTransformFromObject(v10, &v11))
      {
        result = fprintf(a2, "(a:%g b:%g c:%g d:%g tx:%g ty:%g)\n");
      }
      else if (v10)
      {
        objc_msgSend((id)-[objc_object description](v10, "description"), "UTF8String");
        result = fprintf(a2, "%s\n");
      }
      else
      {
        result = fwrite("nil\n", 4uLL, 1uLL, a2);
      }
      ++v7;
    }
    while (v8 != v7);
  }
  return result;
}

- (id)debugQuickLookObject
{
  NSDictionary *v3;
  id v4;
  NSMutableAttributedString *v5;
  void *v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  NSString *v18;
  id v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = -[CIFilter attributes](self, "attributes");
  v4 = -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("CIAttributeFilterCategories"));
  v5 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3778]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithMarkdownString:options:baseURL:error:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**%@**"), objc_msgSend((id)objc_opt_class(), "description")), 0, 0, 0);
  -[NSMutableAttributedString appendAttributedString:](v5, "appendAttributedString:", v6);

  appendAttrStr(v5, CFSTR("\n"));
  v7 = +[CIFilter localizedDescriptionForFilterName:](CIFilter, "localizedDescriptionForFilterName:", -[CIFilter name](self, "name"));
  if (v7)
    appendAttrStr(v5, v7);
  appendAttrStr(v5, CFSTR("\n\n"));
  if (v4)
  {
    appendAttrStr(v5, CFSTR("Categories:"));
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v4);
          v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v12, "hasPrefix:", CFSTR("CICategory")))
          {
            appendAttrStr(v5, CFSTR(" "));
            appendAttrStr(v5, (NSString *)objc_msgSend(v12, "substringFromIndex:", 10));
          }
        }
        v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v9);
    }
    appendAttrStr(v5, CFSTR("\n"));
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = -[CIFilter inputKeys](self, "inputKeys");
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v13);
        v18 = *(NSString **)(*((_QWORD *)&v33 + 1) + 8 * j);
        v19 = -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v18);
        appendAttrStr(v5, CFSTR("\n"));
        appendAttrStrCode(v5, v18);
        v20 = objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CIAttributeClass"));
        if (v20)
        {
          v21 = (NSString *)v20;
          appendAttrStr(v5, CFSTR(" ("));
          appendAttrStrCode(v5, v21);
          appendAttrStr(v5, CFSTR(")"));
        }
        appendAttrStr(v5, CFSTR("\n"));
        if (objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CIAttributeDescription")))
        {
          appendAttrStr(v5, (NSString *)objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CIAttributeDescription")));
          appendAttrStr(v5, CFSTR("\n"));
        }
        v22 = objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CIAttributeDefault"));
        if (v22)
        {
          v23 = (void *)v22;
          appendAttrStr(v5, CFSTR("Default: "));
          appendAttrStr(v5, (NSString *)objc_msgSend(v23, "description"));
          appendAttrStr(v5, CFSTR("\n"));
        }
        v24 = objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CIAttributeMin"));
        if (v24)
        {
          v25 = (void *)v24;
          appendAttrStr(v5, CFSTR("Min: "));
          appendAttrStr(v5, (NSString *)objc_msgSend(v25, "description"));
          appendAttrStr(v5, CFSTR("\n"));
        }
        v26 = objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CIAttributeMax"));
        if (v26)
        {
          v27 = (void *)v26;
          appendAttrStr(v5, CFSTR("Max: "));
          appendAttrStr(v5, (NSString *)objc_msgSend(v27, "description"));
          appendAttrStr(v5, CFSTR("\n"));
        }
        v28 = objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CIAttributeSliderMin"));
        if (v28)
        {
          v29 = (void *)v28;
          appendAttrStr(v5, CFSTR("Slider Min: "));
          appendAttrStr(v5, (NSString *)objc_msgSend(v29, "description"));
          appendAttrStr(v5, CFSTR("\n"));
        }
        v30 = objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CIAttributeSliderMax"));
        if (v30)
        {
          v31 = (void *)v30;
          appendAttrStr(v5, CFSTR("Slider Max: "));
          appendAttrStr(v5, (NSString *)objc_msgSend(v31, "description"));
          appendAttrStr(v5, CFSTR("\n"));
        }
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v15);
  }
  return v5;
}

+ (NSData)serializedXMPFromFilters:(NSArray *)filters inputImageExtent:(CGRect)extent
{
  double height;
  double width;
  double y;
  double x;
  NSData *SerializedData;
  NSData *v11;

  height = extent.size.height;
  width = extent.size.width;
  y = extent.origin.y;
  x = extent.origin.x;
  if (!-[NSArray count](filters, "count")
    || !objc_msgSend((id)objc_msgSend(a1, "_propertyArrayFromFilters:inputImageExtent:", filters, x, y, width, height), "count"))
  {
    return 0;
  }
  SerializedData = (NSData *)CGImageMetadataCreateSerializedData();
  v11 = SerializedData;
  if (SerializedData)
    CFAutorelease(SerializedData);
  return v11;
}

+ (NSArray)filterArrayFromSerializedXMP:(NSData *)xmpData inputImageExtent:(CGRect)extent error:(NSError *)outError
{
  double height;
  double width;
  double y;
  double x;
  const __CFArray *v10;
  const __CFArray *v11;
  NSArray *v12;

  height = extent.size.height;
  width = extent.size.width;
  y = extent.origin.y;
  x = extent.origin.x;
  if (outError)
    *outError = 0;
  if (!xmpData)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  v10 = (const __CFArray *)CGImageMetadataCreateFromData();
  if (!v10)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  v11 = v10;
  if (CFArrayGetCount(v10))
    v12 = (NSArray *)objc_msgSend(a1, "_filterArrayFromProperties:inputImageExtent:", v11, x, y, width, height);
  else
    v12 = (NSArray *)MEMORY[0x1E0C9AA60];
  CFRelease(v11);
  return v12;
}

- (CIImage)apply:(CIKernel *)k arguments:(NSArray *)args options:(NSDictionary *)dict
{
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CIImage *v28;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  const char *v48;
  SEL v49;
  SEL v50;
  uint64_t v51;
  char isKindOfClass;
  int v53;
  CIImage *v54;
  id v55;
  id v56;
  _QWORD v57[8];
  int v58;
  uint8_t buf[4];
  const char *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!k || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v20 = ci_logger_api();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CIFilter apply:arguments:options:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    return 0;
  }
  v9 = *MEMORY[0x1E0C9D5E0];
  v10 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v13 = -[NSDictionary objectForKey:](dict, "objectForKey:", CFSTR("extent"));
  v14 = -[NSDictionary objectForKey:](dict, "objectForKey:", CFSTR("definition"));
  if (v14)
  {
    v15 = v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "count") == 4)
    {
      objc_msgSend((id)objc_msgSend(v15, "objectAtIndex:", 0), "doubleValue");
      v9 = v16;
      objc_msgSend((id)objc_msgSend(v15, "objectAtIndex:", 1), "doubleValue");
      v10 = v17;
      objc_msgSend((id)objc_msgSend(v15, "objectAtIndex:", 2), "doubleValue");
      v11 = v18;
      v19 = v15;
LABEL_17:
      objc_msgSend((id)objc_msgSend(v19, "objectAtIndex:", 3), "doubleValue");
      v12 = v37;
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "extent");
      v9 = v30;
      v10 = v31;
      v11 = v32;
      v12 = v33;
      goto LABEL_22;
    }
    v38 = ci_logger_api();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[CIFilter apply:arguments:options:].cold.2(v38, v39, v40, v41, v42, v43, v44, v45);
    return 0;
  }
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "count") == 4)
    {
      objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 0), "doubleValue");
      v9 = v34;
      objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 1), "doubleValue");
      v10 = v35;
      objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 2), "doubleValue");
      v11 = v36;
      v19 = v13;
      goto LABEL_17;
    }
    v46 = ci_logger_api();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      v60 = "-[CIFilter apply:arguments:options:]";
      _os_log_impl(&dword_1921E4000, v46, OS_LOG_TYPE_INFO, "%{public}s kCIApplyOptionExtent is not an NSArray with four elements. Ignoring.", buf, 0xCu);
    }
  }
LABEL_22:
  v47 = -[NSDictionary objectForKey:](dict, "objectForKey:", CFSTR("user_info"));
  v48 = -[CIKernel ROISelector](k, "ROISelector");
  v49 = NSSelectorFromString(CFSTR("regionOf:destRect:userInfo:"));
  v50 = NSSelectorFromString(CFSTR("regionOf:destRect:"));
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (v48 = v49, (objc_opt_respondsToSelector() & 1) != 0)
    || (v48 = v50, (objc_opt_respondsToSelector() & 1) != 0))
  {
    v51 = -[CIFilter methodForSelector:](self, "methodForSelector:", v48);
  }
  else
  {
    v51 = 0;
  }
  NSClassFromString(CFSTR("DGCurvesFilter"));
  isKindOfClass = objc_opt_isKindOfClass();
  NSClassFromString(CFSTR("PXSoftProofingFilter"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[CIFilter apply:arguments:options:]::onceToken != -1)
      dispatch_once(&-[CIFilter apply:arguments:options:]::onceToken, &__block_literal_global_94);
    v53 = 2;
  }
  else
  {
    v53 = isKindOfClass & 1;
  }
  NSClassFromString(CFSTR("PX_CIF_Noise"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[CIFilter apply:arguments:options:]::onceToken != -1)
      dispatch_once(&-[CIFilter apply:arguments:options:]::onceToken, &__block_literal_global_98);
    v53 = 3;
  }
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __36__CIFilter_apply_arguments_options___block_invoke_99;
  v57[3] = &unk_1E2EC39F8;
  v58 = v53;
  v57[6] = v51;
  v57[7] = v50;
  v57[4] = self;
  v57[5] = v47;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = (CIImage *)-[CIKernel applyWithExtent:arguments:](k, "applyWithExtent:arguments:", args, v9, v10, v11, v12);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = (CIImage *)-[CIKernel applyWithExtent:roiCallback:inputImage:arguments:](k, "applyWithExtent:roiCallback:inputImage:arguments:", v57, -[NSArray objectAtIndex:](args, "objectAtIndex:", 0), -[NSArray subarrayWithRange:](args, "subarrayWithRange:", 1, -[NSArray count](args, "count") - 1), v9, v10, v11, v12);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v28 = 0;
        goto LABEL_42;
      }
      v54 = -[CIKernel applyWithExtent:roiCallback:arguments:](k, "applyWithExtent:roiCallback:arguments:", v57, args, v9, v10, v11, v12);
    }
  }
  v28 = v54;
LABEL_42:
  v55 = -[NSDictionary objectForKey:](dict, "objectForKey:", CFSTR("color_space"));
  if (v55)
  {
    v56 = v55;
    if (v55 != (id)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
      return -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:](v28, "imageByColorMatchingColorSpaceToWorkingSpace:", v56);
  }
  return v28;
}

void __36__CIFilter_apply_arguments_options___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = ci_logger_api();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136446210;
    v2 = "-[CIFilter apply:arguments:options:]_block_invoke";
    _os_log_impl(&dword_1921E4000, v0, OS_LOG_TYPE_INFO, "%{public}s The filter PXSoftProofingFilter has an incorrect ROI method for sampler index 1.  This may fail in the future.", (uint8_t *)&v1, 0xCu);
  }
}

void __36__CIFilter_apply_arguments_options___block_invoke_97()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = ci_logger_api();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136446210;
    v2 = "-[CIFilter apply:arguments:options:]_block_invoke";
    _os_log_impl(&dword_1921E4000, v0, OS_LOG_TYPE_INFO, "%{public}s The filter PX_CIF_Noise has an incorrect ROI method for sampler index 1.  This may fail in the future.", (uint8_t *)&v1, 0xCu);
  }
}

void __36__CIFilter_apply_arguments_options___block_invoke_99(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  int v6;
  void (*v7)(_QWORD, _QWORD, uint64_t, _QWORD);

  v6 = *(_DWORD *)(a1 + 64);
  if (((_DWORD)a2 || v6 != 1) && ((_DWORD)a2 != 1 || v6 != 2))
  {
    if ((_DWORD)a2 == 1 && v6 == 3)
    {
      CGRectInset(*(CGRect *)&a3, -1.0, -1.0);
    }
    else
    {
      v7 = *(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 48);
      if (v7)
        v7(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 40));
    }
  }
}

- (CIImage)apply:(CIKernel *)k
{
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v17;
  __int128 v18;
  va_list v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  va_list va;

  va_start(va, k);
  v27 = va_arg(va, _QWORD);
  v26 = *MEMORY[0x1E0C80C00];
  if (k && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    va_copy(v19, va);
    v8 = v27;
    if (v27)
    {
      v9 = 0;
      v10 = 0;
      *(_QWORD *)&v7 = 138543874;
      v18 = v7;
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if ((v10 & 1) != 0)
          goto LABEL_17;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v17 = ci_logger_api();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                    -[CIFilter apply:].cold.2((uint64_t)self, v9, v17);
                  return 0;
                }
              }
            }
          }
        }
        objc_msgSend(v5, "addObject:", v8, v18);
        v10 = 0;
LABEL_18:
        v13 = va_arg(v19, _QWORD);
        v8 = v13;
        ++v9;
        if (!v13)
          return -[CIFilter apply:arguments:options:](self, "apply:arguments:options:", k, v5, v6, v18);
      }
      v11 = va_arg(v19, _QWORD);
      if (v11)
      {
        objc_msgSend(v6, "setValue:forKey:", v11, v8);
      }
      else
      {
        v12 = ci_logger_api();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v14 = objc_msgSend((id)objc_opt_class(), "description");
          *(_DWORD *)buf = v18;
          v21 = v14;
          v22 = 2114;
          v23 = v8;
          v24 = 1024;
          v25 = v9;
          _os_log_error_impl(&dword_1921E4000, v12, OS_LOG_TYPE_ERROR, "[%{public}@ apply:...] The last key \"%{public}@\" at index %d is followed by nil. It will be ignored.", buf, 0x1Cu);
        }
      }
LABEL_17:
      v10 = 1;
      goto LABEL_18;
    }
    return -[CIFilter apply:arguments:options:](self, "apply:arguments:options:", k, v5, v6, v18);
  }
  else
  {
    v15 = ci_logger_api();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CIFilter apply:].cold.1((uint64_t)self, v15);
    return 0;
  }
}

- (void)setName:(NSString *)aString
{
  id v5;

  v5 = self->_priv[4];
  self->_priv[4] = (void *)-[NSString copy](aString, "copy");
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)enabled
{
  self->_enabled = enabled;
}

+ (void)clearCache
{
  +[CIFilterClassDefaults clearCache](CIFilterClassDefaults, "clearCache");
  +[CIFilterClassCategories clearCache](CIFilterClassCategories, "clearCache");
  +[CIFilterClassAttributes clearCache](CIFilterClassAttributes, "clearCache");
  +[CIFilterClassInfo clearCache](CIFilterClassInfo, "clearCache");
}

+ (id)customAttributes
{
  return 0;
}

- (id)customAttributes
{
  return 0;
}

- (BOOL)_filterClassInCategory:(id)a3
{
  return objc_msgSend(+[CIFilterClassCategories classCategoriesForClass:](CIFilterClassCategories, "classCategoriesForClass:", objc_opt_class()), "containsObject:", a3);
}

- (BOOL)_isIdentity
{
  return 0;
}

- (void)setIdentity
{
  NSDictionary *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[CIFilter attributes](self, "attributes");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[CIFilter inputKeys](self, "inputKeys", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = -[NSDictionary objectForKey:](v3, "objectForKey:", v9);
        v11 = objc_msgSend(v10, "valueForKey:", CFSTR("CIAttributeIdentity"));
        if (!v11)
        {
          v11 = objc_msgSend(v10, "valueForKey:", CFSTR("CIAttributeDefault"));
          if (!v11)
            continue;
        }
        -[CIFilter setValue:forKey:](self, "setValue:forKey:", v11, v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
}

- (void)setUserInfo:(id)a3
{
  id v4;
  id v6;

  v4 = self->_priv[3];
  if (v4 != a3)
  {
    v6 = v4;
    self->_priv[3] = a3;
  }
}

+ (CIFilter)filterWithString:(id)a3
{
  void *v3;
  CIFilter *v4;
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CIVector *v13;
  CIVector *v14;
  const __CFString *v15;
  unint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
  if (!objc_msgSend(v3, "count"))
    return 0;
  v4 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", objc_msgSend(v3, "objectAtIndex:", 0));
  if (v4 && (unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v5 = 1;
    v6 = 0x1E0CB3000uLL;
    v7 = CFSTR("input%@");
    v8 = CFSTR("nil");
    v9 = CFSTR("[");
    while (1)
    {
      v10 = (void *)objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v5), "componentsSeparatedByString:", CFSTR("="));
      if (objc_msgSend(v10, "count") != 2)
        goto LABEL_19;
      v11 = objc_msgSend(*(id *)(v6 + 2368), "stringWithFormat:", v7, objc_msgSend(v10, "objectAtIndex:", 0));
      if (!-[NSArray containsObject:](-[CIFilter inputKeys](v4, "inputKeys"), "containsObject:", v11))
        goto LABEL_19;
      v12 = (void *)objc_msgSend(v10, "objectAtIndex:", 1);
      if ((objc_msgSend(v12, "isEqual:", v8) & 1) != 0)
        break;
      if (objc_msgSend(v12, "hasPrefix:", v9) && (unint64_t)objc_msgSend(v12, "length") >= 3)
      {
        v14 = +[CIVector vectorWithString:](CIVector, "vectorWithString:", v12);
        goto LABEL_17;
      }
      if (objc_msgSend(v12, "hasPrefix:", CFSTR("\"))
        && (unint64_t)objc_msgSend(v12, "length") >= 3)
      {
        v14 = (CIVector *)objc_msgSend(v12, "substringWithRange:", 1, objc_msgSend(v12, "length") - 2);
        goto LABEL_17;
      }
      if (objc_msgSend(v12, "length"))
      {
        v15 = v7;
        v16 = v6;
        v17 = v8;
        v18 = v9;
        v19 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "doubleValue");
        v20 = v19;
        v9 = v18;
        v8 = v17;
        v6 = v16;
        v7 = v15;
        v14 = (CIVector *)objc_msgSend(v20, "numberWithDouble:");
LABEL_17:
        v13 = v14;
LABEL_18:
        -[CIFilter setValue:forKey:](v4, "setValue:forKey:", v13, v11);
      }
LABEL_19:
      if (objc_msgSend(v3, "count") <= (unint64_t)++v5)
        return v4;
    }
    v13 = 0;
    goto LABEL_18;
  }
  return v4;
}

- (id)_serializedXMPString
{
  NSString *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char isKindOfClass;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSString *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  NSString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!-[CIFilter _filterClassInCategory:](self, "_filterClassInCategory:", CFSTR("CICategoryXMPSerializable")))
    return 0;
  v3 = -[CIFilter name](self, "name");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = -[CIFilter inputKeys](self, "inputKeys");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
      v10 = (void *)-[CIFilter valueForKey:](self, "valueForKey:", v9);
      if ((objc_msgSend(v9, "isEqual:", CFSTR("inputImage")) & 1) != 0)
        goto LABEL_19;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = objc_msgSend(v9, "substringFromIndex:", 5);
        v13 = objc_msgSend(v10, "stringValue");
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v11 = (void *)MEMORY[0x1E0CB3940];
        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && objc_msgSend(v10, "length")
            && (objc_msgSend(v10, "rangeOfString:", CFSTR(",")), !v16))
          {
            v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,%@=\"%s\"), v3, objc_msgSend(v9, "substringFromIndex:", 5), objc_msgSend(v10, "UTF8String"));
          }
          else
          {
            if (v10)
            {
              v18 = ci_logger_api();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                v20 = -[CIFilter name](self, "name");
                v21 = objc_msgSend((id)objc_opt_class(), "description");
                *(_DWORD *)buf = 138543874;
                v28 = v20;
                v29 = 2114;
                v30 = v9;
                v31 = 2114;
                v32 = v21;
                _os_log_error_impl(&dword_1921E4000, v18, OS_LOG_TYPE_ERROR, "CIFilter %{public}@ cannot be serialized because %{public}@ value is a %{public}@. Only NSString, NSNumber and CIVector is supported at this time.", buf, 0x20u);
              }
              return 0;
            }
            v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,%@=nil"), v3, objc_msgSend(v9, "substringFromIndex:", 5), v22);
          }
          goto LABEL_18;
        }
        v12 = objc_msgSend(v9, "substringFromIndex:", 5);
        v13 = objc_msgSend(v10, "stringRepresentation");
      }
      v15 = objc_msgSend(v11, "stringWithFormat:", CFSTR("%@,%@=%@"), v3, v12, v13);
LABEL_18:
      v3 = (NSString *)v15;
LABEL_19:
      if (v6 == ++v8)
      {
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        v6 = v17;
        if (v17)
          goto LABEL_4;
        return v3;
      }
    }
  }
  return v3;
}

+ (id)_propertyArrayFromFilters:(id)a3 inputImageExtent:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  __int128 v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double c;
  double d;
  double b;
  double a;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  BOOL v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  uint64_t v59;
  double v61;
  double v62;
  void *v63;
  id obj;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _QWORD v78[7];
  _BYTE v79[128];
  uint64_t v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v80 = *MEMORY[0x1E0C80C00];
  v63 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  obj = a3;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v74 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        v18 = (void *)objc_opt_class();
        if (objc_msgSend(v18, "isSubclassOfClass:", objc_opt_class())
          && objc_msgSend(v17, "conformsToProtocol:", &unk_1EE289D80))
        {
          v19 = objc_msgSend((id)objc_msgSend(v17, "name"), "isEqual:", CFSTR("CIAffineTransform"));
          if (v19)
            v12 = (unint64_t)v17;
          v14 += v19;
          v20 = objc_msgSend((id)objc_msgSend(v17, "name"), "isEqual:", CFSTR("CICrop"));
          if (v20)
            v11 = (unint64_t)v17;
          v13 += v20;
          v21 = objc_msgSend(v17, "_outputProperties");
          if (v21)
            objc_msgSend(v63, "addObjectsFromArray:", v21);
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }
  if (v14 <= 1 && v13 <= 1 && v14 + v13 >= 1)
  {
    if (!(v12 | v11))
      +[CIFilter(Private) _propertyArrayFromFilters:inputImageExtent:].cold.1();
    v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v72.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v72.c = v22;
    *(_OWORD *)&v72.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    if (v12)
      CGAffineTransformFromObject((objc_object *)objc_msgSend((id)v12, "valueForKey:", CFSTR("inputTransform")), &v72);
    if (v11)
    {
      objc_msgSend((id)objc_msgSend((id)v11, "valueForKey:", CFSTR("inputRectangle")), "CGRectValue");
      v84.origin.x = v23;
      v84.origin.y = v24;
      v84.size.width = v25;
      v84.size.height = v26;
      v81.origin.x = x;
      v81.origin.y = y;
      v81.size.width = width;
      v81.size.height = height;
      v82 = CGRectIntersection(v81, v84);
      v27 = v82.size.width;
      v28 = v82.size.height;
      c = v72.c;
      d = v72.d;
      a = v72.a;
      b = v72.b;
    }
    else
    {
      b = v72.b;
      if (fabs(v72.b) >= 0.0001 || (c = v72.c, fabs(v72.c) >= 0.0001))
      {
        a = v72.a;
        if (fabs(v72.a) >= 0.0001)
          goto LABEL_54;
        d = v72.d;
        if (fabs(v72.d) >= 0.0001)
          goto LABEL_54;
        c = v72.c;
      }
      else
      {
        a = v72.a;
        d = v72.d;
      }
      if (fabs(fabs(a * d - c * v72.b) + -1.0) >= 0.01)
        goto LABEL_54;
      v71 = v72;
      v83.origin.x = x;
      v83.origin.y = y;
      v83.size.width = width;
      v83.size.height = height;
      v82 = CGRectApplyAffineTransform(v83, &v71);
      v27 = v61;
      v28 = v62;
    }
    v72.tx = v72.tx - v82.origin.x;
    v72.ty = v72.ty - v82.origin.y;
    v69 = v72;
    memset(&v70, 0, sizeof(v70));
    CGAffineTransformInvert(&v70, &v69);
    v33 = atan2(d - c, b - a) + -2.35619449;
    if (v33 >= -3.14159265)
      v34 = -v33;
    else
      v34 = -6.28318531 - v33;
    v35 = v34 * 57.2957795;
    if (fabs(v35) >= 0.01)
      v36 = v35;
    else
      v36 = 0.0;
    v37 = v70.tx + v28 * v70.c + v70.a * 0.0;
    v38 = v70.ty + v28 * v70.d + v70.b * 0.0;
    v39 = v70.tx + v70.c * 0.0 + v70.a * v27;
    v40 = height - v38;
    v41 = height - (v70.ty + v70.d * 0.0 + v70.b * v27);
    v42 = v37 >= 0.0 && v37 <= width;
    if (!v42
      || (v39 >= 0.0 ? (v43 = v39 <= width) : (v43 = 0),
          !v43
       || (v41 >= 0.0 ? (v44 = v41 <= height) : (v44 = 0), !v44
                                                        || (v40 >= 0.0 ? (v45 = v40 <= height) : (v45 = 0), !v45))))
    {
      v46 = ci_logger_api();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        +[CIFilter(Private) _propertyArrayFromFilters:inputImageExtent:].cold.2(v46, v47, v48, v49, v50, v51, v52, v53);
    }
    v78[0] = metadataPropertyWithDouble(v36);
    v78[1] = metadataPropertyWithDouble(fmax(fmin(v40 / height, 1.0), 0.0));
    v78[2] = metadataPropertyWithDouble(fmax(fmin(v41 / height, 1.0), 0.0));
    v78[3] = metadataPropertyWithDouble(fmax(fmin(v37 / width, 1.0), 0.0));
    v78[4] = metadataPropertyWithDouble(fmax(fmin(v39 / width, 1.0), 0.0));
    v78[5] = metadataPropertyWithBool();
    v78[6] = metadataPropertyWithBool();
    objc_msgSend(v63, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 7));
  }
LABEL_54:
  v54 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v56; ++j)
      {
        if (*(_QWORD *)v66 != v57)
          objc_enumerationMutation(obj);
        v59 = objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "_serializedXMPString");
        if (v59)
          objc_msgSend(v54, "addObject:", v59);
      }
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    }
    while (v56);
  }
  if (objc_msgSend(v54, "count"))
    objc_msgSend(v63, "addObject:", metadataPropertyWithArray((uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("aas"), (uint64_t)CFSTR("Filters"), v54));
  return v63;
}

+ (id)_filterArrayFromProperties:(id)a3 inputImageExtent:(CGRect)a4
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSString *v13;
  Class v14;
  objc_class *v15;
  id v16;
  unint64_t v17;
  CIFilter *v18;
  CIFilter *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  void *ArrayOfStrings;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  CIFilter *v39;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  __int16 v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _QWORD v62[2];
  _BYTE v63[128];
  uint64_t v64;

  height = a4.size.height;
  width = a4.size.width;
  v64 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", a4.origin.x, a4.origin.y);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v7 = objc_msgSend(&unk_1E2F1DC60, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v58 != v11)
          objc_enumerationMutation(&unk_1E2F1DC60);
        v13 = *(NSString **)(*((_QWORD *)&v57 + 1) + 8 * i);
        v14 = NSClassFromString(v13);
        if (v14)
        {
          v15 = v14;
          if (-[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", objc_opt_class()))
          {
            if (-[objc_class conformsToProtocol:](v15, "conformsToProtocol:", &unk_1EE289D80))
            {
              v16 = (id)objc_msgSend([v15 alloc], "_initFromProperties:", a3);
              if (v16)
              {
                v17 = (unint64_t)v16;
                objc_msgSend(v6, "addObject:", v16);
                if (-[NSString isEqual:](v13, "isEqual:", CFSTR("CIAffineTransform")))
                  v10 = v17;
                if (-[NSString isEqual:](v13, "isEqual:", CFSTR("CICrop")))
                  v9 = v17;
              }
            }
          }
        }
      }
      v8 = objc_msgSend(&unk_1E2F1DC60, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v55 = 0.0;
  v56 = 0.0;
  v53 = 0.0;
  v54 = 0.0;
  v52 = 0.0;
  v51 = 0;
  if (!(v10 | v9))
  {
    v18 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAffineTransform"));
    v19 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICrop"));
    if (metadataPropertyArrayGetBool((uint64_t)a3, (uint64_t)CFSTR("http://ns.adobe.com/camera-raw-settings/1.0/"), (uint64_t)CFSTR("HasCrop"), (BOOL *)&v51 + 1))
    {
      if (metadataPropertyArrayGetBool((uint64_t)a3, (uint64_t)CFSTR("http://ns.adobe.com/camera-raw-settings/1.0/"), (uint64_t)CFSTR("AlreadyApplied"), (BOOL *)&v51)&& HIBYTE(v51)&& !(_BYTE)v51)
      {
        v62[0] = v18;
        v62[1] = v19;
        objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2));
        if ((metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.adobe.com/camera-raw-settings/1.0/"), (uint64_t)CFSTR("CropTop"), &v54) & 1) == 0)v54 = 0.0;
        if ((metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.adobe.com/camera-raw-settings/1.0/"), (uint64_t)CFSTR("CropBottom"), &v53) & 1) == 0)v53 = 1.0;
        if ((metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.adobe.com/camera-raw-settings/1.0/"), (uint64_t)CFSTR("CropLeft"), &v56) & 1) == 0)v56 = 0.0;
        if ((metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.adobe.com/camera-raw-settings/1.0/"), (uint64_t)CFSTR("CropRight"), &v55) & 1) == 0)v55 = 1.0;
        if (metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.adobe.com/camera-raw-settings/1.0/"), (uint64_t)CFSTR("CropAngle"), &v52))
        {
          v20 = v52 * -0.0174532925;
        }
        else
        {
          v52 = 0.0;
          v20 = -0.0;
        }
        v21 = width * v56;
        v22 = width * v55;
        v23 = height - height * v54;
        v24 = height - height * v53;
        memset(&v50, 0, sizeof(v50));
        CGAffineTransformMakeRotation(&v50, -v20);
        v25 = tan(v20 + -1.57079633);
        v26 = v25;
        if (v20 <= 0.0)
        {
          v27 = v21 + -1.0;
          v28 = tan(v20 + 3.14159265);
          v29 = 1.0;
        }
        else
        {
          v26 = -v25;
          v27 = v21 + 1.0;
          v28 = -tan(v20 + 3.14159265);
          v29 = -1.0;
        }
        v30 = v23 - v26 - v23;
        v31 = ((v23 - v24) * (v22 + v29 - v22) - (v21 - v22) * (v24 + v28 - v24))
            / ((v27 - v21) * (v24 + v28 - v24) - v30 * (v22 + v29 - v22));
        v32 = v21 + v31 * (v27 - v21);
        v33 = v23 + v31 * v30;
        v48 = v50;
        memset(&v49, 0, sizeof(v49));
        CGAffineTransformInvert(&v49, &v48);
        v49.tx = v32;
        v49.ty = v33;
        v46 = v49;
        memset(&v47, 0, sizeof(v47));
        CGAffineTransformInvert(&v47, &v46);
        -[CIFilter setValue:forKey:](v18, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v47, "{CGAffineTransform=dddddd}"), CFSTR("inputTransform"));
        -[CIFilter setValue:forKey:](v19, "setValue:forKey:", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, vabdd_f64(v49.tx + v24 * v49.c + v49.a * v22, v49.tx + v23 * v49.c + v49.a * v21), vabdd_f64(v49.ty + v23 * v49.d + v49.b * v21, v49.ty + v24 * v49.d + v49.b * v22)), CFSTR("inputRectangle"));
      }
    }
  }
  ArrayOfStrings = (void *)metadataPropertyArrayGetArrayOfStrings();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v35 = objc_msgSend(ArrayOfStrings, "countByEnumeratingWithState:objects:count:", &v42, v61, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v43 != v37)
          objc_enumerationMutation(ArrayOfStrings);
        v39 = +[CIFilter filterWithString:](CIFilter, "filterWithString:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
        if (v39)
          objc_msgSend(v6, "addObject:", v39);
      }
      v36 = objc_msgSend(ArrayOfStrings, "countByEnumeratingWithState:objects:count:", &v42, v61, 16);
    }
    while (v36);
  }
  return v6;
}

+ (CGImageMetadata)_imageMetadataFromFilters:(id)a3 inputImageExtent:(CGRect)a4
{
  CGImageMetadata *result;

  result = +[CIFilter _propertyArrayFromFilters:inputImageExtent:](CIFilter, "_propertyArrayFromFilters:inputImageExtent:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (result)
    return (CGImageMetadata *)CGImageMetadataCreateFromMetadataProperties();
  return result;
}

+ (id)_filterArrayFromImageMetadata:(CGImageMetadata *)a3 inputImageExtent:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id result;
  id v9;
  id v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  result = (id)CGImageMetadataCreateMetadataProperties();
  if (result)
  {
    v9 = result;
    v10 = +[CIFilter _filterArrayFromProperties:inputImageExtent:](CIFilter, "_filterArrayFromProperties:inputImageExtent:", result, x, y, width, height);
    CFRelease(v9);
    return v10;
  }
  return result;
}

+ (id)_filterArrayFromProperties:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = ci_logger_api();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    +[CIFilter(Private) _filterArrayFromProperties:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  return 0;
}

+ (CIFilter)gaussianGradientFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIGaussianGradient"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__gaussianGradientFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (gaussianGradientFilter_onceToken != -1)
    dispatch_once(&gaussianGradientFilter_onceToken, block);
  return v2;
}

objc_class *__44__CIFilter_Builtins__gaussianGradientFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  _BOOL4 v4;
  char v5;
  void (*v6)(void);
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  char v10;
  void (*v11)(void);
  objc_class *result;
  objc_class *v13;

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v2 = objc_opt_class();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = -[NSString isEqualToString:](NSStringFromSelector(sel_color0), "isEqualToString:", CFSTR("inputImage"));
    v5 = objc_msgSend(v3, "instancesRespondToSelector:", sel_color0);
    if (v4)
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color0, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
      {
        v6 = (void (*)(void))iiSetter;
LABEL_13:
        class_addMethod((Class)v3, sel_setColor0_, v6, "v@:@");
      }
    }
    else
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color0, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
      {
        v6 = (void (*)(void))objSetter;
        goto LABEL_13;
      }
    }
  }
  v7 = objc_opt_class();
  if (!v7)
    goto LABEL_25;
  v8 = (void *)v7;
  v9 = -[NSString isEqualToString:](NSStringFromSelector(sel_color1), "isEqualToString:", CFSTR("inputImage"));
  v10 = objc_msgSend(v8, "instancesRespondToSelector:", sel_color1);
  if (v9)
  {
    if ((v10 & 1) == 0)
      class_addMethod((Class)v8, sel_color1, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v8, "instancesRespondToSelector:", sel_setColor1_) & 1) == 0)
    {
      v11 = (void (*)(void))iiSetter;
LABEL_24:
      class_addMethod((Class)v8, sel_setColor1_, v11, "v@:@");
    }
  }
  else
  {
    if ((v10 & 1) == 0)
      class_addMethod((Class)v8, sel_color1, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v8, "instancesRespondToSelector:", sel_setColor1_) & 1) == 0)
    {
      v11 = (void (*)(void))objSetter;
      goto LABEL_24;
    }
  }
LABEL_25:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v13 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)hueSaturationValueGradientFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIHueSaturationValueGradient"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CIFilter_Builtins__hueSaturationValueGradientFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (hueSaturationValueGradientFilter_onceToken != -1)
    dispatch_once(&hueSaturationValueGradientFilter_onceToken, block);
  return v2;
}

uint64_t __54__CIFilter_Builtins__hueSaturationValueGradientFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  uint64_t result;
  void *v9;
  _BOOL4 v10;
  char v11;
  void (*v12)(void);

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_value, (IMP)floatGetter, "f@:");
    class_addMethod(v1, sel_setValue_, (IMP)floatSetter, "v@:f");
  }
  v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    v3 = v2;
    class_addMethod(v2, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v3, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  v4 = (objc_class *)objc_opt_class();
  if (v4)
  {
    v5 = v4;
    class_addMethod(v4, sel_softness, (IMP)floatGetter, "f@:");
    class_addMethod(v5, sel_setSoftness_, (IMP)floatSetter, "v@:f");
  }
  v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    v7 = v6;
    class_addMethod(v6, sel_dither, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setDither_, (IMP)floatSetter, "v@:f");
  }
  result = objc_opt_class();
  if (result)
  {
    v9 = (void *)result;
    v10 = -[NSString isEqualToString:](NSStringFromSelector(sel_colorSpace), "isEqualToString:", CFSTR("inputImage"));
    v11 = objc_msgSend(v9, "instancesRespondToSelector:", sel_colorSpace);
    if (v10)
    {
      if ((v11 & 1) == 0)
        class_addMethod((Class)v9, sel_colorSpace, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v9, "instancesRespondToSelector:", sel_setColorSpace_);
      if ((result & 1) == 0)
      {
        v12 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v9, sel_setColorSpace_, v12, "v@:@");
      }
    }
    else
    {
      if ((v11 & 1) == 0)
        class_addMethod((Class)v9, sel_colorSpace, (IMP)objGetter, "@@:");
      result = objc_msgSend(v9, "instancesRespondToSelector:", sel_setColorSpace_);
      if ((result & 1) == 0)
      {
        v12 = (void (*)(void))objSetter;
        return class_addMethod((Class)v9, sel_setColorSpace_, v12, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)linearGradientFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CILinearGradient"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__linearGradientFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (linearGradientFilter_onceToken != -1)
    dispatch_once(&linearGradientFilter_onceToken, block);
  return v2;
}

uint64_t __42__CIFilter_Builtins__linearGradientFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  char v7;
  void (*v8)(void);
  uint64_t result;
  void *v10;
  _BOOL4 v11;
  char v12;
  void (*v13)(void);

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_point0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setPoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    v3 = v2;
    class_addMethod(v2, sel_point1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v3, sel_setPoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v4 = objc_opt_class();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[NSString isEqualToString:](NSStringFromSelector(sel_color0), "isEqualToString:", CFSTR("inputImage"));
    v7 = objc_msgSend(v5, "instancesRespondToSelector:", sel_color0);
    if (v6)
    {
      if ((v7 & 1) == 0)
        class_addMethod((Class)v5, sel_color0, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v5, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
      {
        v8 = (void (*)(void))iiSetter;
LABEL_15:
        class_addMethod((Class)v5, sel_setColor0_, v8, "v@:@");
      }
    }
    else
    {
      if ((v7 & 1) == 0)
        class_addMethod((Class)v5, sel_color0, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v5, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
      {
        v8 = (void (*)(void))objSetter;
        goto LABEL_15;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v10 = (void *)result;
    v11 = -[NSString isEqualToString:](NSStringFromSelector(sel_color1), "isEqualToString:", CFSTR("inputImage"));
    v12 = objc_msgSend(v10, "instancesRespondToSelector:", sel_color1);
    if (v11)
    {
      if ((v12 & 1) == 0)
        class_addMethod((Class)v10, sel_color1, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v10, "instancesRespondToSelector:", sel_setColor1_);
      if ((result & 1) == 0)
      {
        v13 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v10, sel_setColor1_, v13, "v@:@");
      }
    }
    else
    {
      if ((v12 & 1) == 0)
        class_addMethod((Class)v10, sel_color1, (IMP)objGetter, "@@:");
      result = objc_msgSend(v10, "instancesRespondToSelector:", sel_setColor1_);
      if ((result & 1) == 0)
      {
        v13 = (void (*)(void))objSetter;
        return class_addMethod((Class)v10, sel_setColor1_, v13, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)radialGradientFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIRadialGradient"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__radialGradientFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (radialGradientFilter_onceToken != -1)
    dispatch_once(&radialGradientFilter_onceToken, block);
  return v2;
}

uint64_t __42__CIFilter_Builtins__radialGradientFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  char v9;
  void (*v10)(void);
  uint64_t result;
  void *v12;
  _BOOL4 v13;
  char v14;
  void (*v15)(void);

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    v3 = v2;
    class_addMethod(v2, sel_radius0, (IMP)floatGetter, "f@:");
    class_addMethod(v3, sel_setRadius0_, (IMP)floatSetter, "v@:f");
  }
  v4 = (objc_class *)objc_opt_class();
  if (v4)
  {
    v5 = v4;
    class_addMethod(v4, sel_radius1, (IMP)floatGetter, "f@:");
    class_addMethod(v5, sel_setRadius1_, (IMP)floatSetter, "v@:f");
  }
  v6 = objc_opt_class();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[NSString isEqualToString:](NSStringFromSelector(sel_color0), "isEqualToString:", CFSTR("inputImage"));
    v9 = objc_msgSend(v7, "instancesRespondToSelector:", sel_color0);
    if (v8)
    {
      if ((v9 & 1) == 0)
        class_addMethod((Class)v7, sel_color0, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v7, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
      {
        v10 = (void (*)(void))iiSetter;
LABEL_17:
        class_addMethod((Class)v7, sel_setColor0_, v10, "v@:@");
      }
    }
    else
    {
      if ((v9 & 1) == 0)
        class_addMethod((Class)v7, sel_color0, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v7, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
      {
        v10 = (void (*)(void))objSetter;
        goto LABEL_17;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v12 = (void *)result;
    v13 = -[NSString isEqualToString:](NSStringFromSelector(sel_color1), "isEqualToString:", CFSTR("inputImage"));
    v14 = objc_msgSend(v12, "instancesRespondToSelector:", sel_color1);
    if (v13)
    {
      if ((v14 & 1) == 0)
        class_addMethod((Class)v12, sel_color1, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v12, "instancesRespondToSelector:", sel_setColor1_);
      if ((result & 1) == 0)
      {
        v15 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v12, sel_setColor1_, v15, "v@:@");
      }
    }
    else
    {
      if ((v14 & 1) == 0)
        class_addMethod((Class)v12, sel_color1, (IMP)objGetter, "@@:");
      result = objc_msgSend(v12, "instancesRespondToSelector:", sel_setColor1_);
      if ((result & 1) == 0)
      {
        v15 = (void (*)(void))objSetter;
        return class_addMethod((Class)v12, sel_setColor1_, v15, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)smoothLinearGradientFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISmoothLinearGradient"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__smoothLinearGradientFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (smoothLinearGradientFilter_onceToken != -1)
    dispatch_once(&smoothLinearGradientFilter_onceToken, block);
  return v2;
}

uint64_t __48__CIFilter_Builtins__smoothLinearGradientFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  char v7;
  void (*v8)(void);
  uint64_t result;
  void *v10;
  _BOOL4 v11;
  char v12;
  void (*v13)(void);

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_point0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setPoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    v3 = v2;
    class_addMethod(v2, sel_point1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v3, sel_setPoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v4 = objc_opt_class();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[NSString isEqualToString:](NSStringFromSelector(sel_color0), "isEqualToString:", CFSTR("inputImage"));
    v7 = objc_msgSend(v5, "instancesRespondToSelector:", sel_color0);
    if (v6)
    {
      if ((v7 & 1) == 0)
        class_addMethod((Class)v5, sel_color0, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v5, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
      {
        v8 = (void (*)(void))iiSetter;
LABEL_15:
        class_addMethod((Class)v5, sel_setColor0_, v8, "v@:@");
      }
    }
    else
    {
      if ((v7 & 1) == 0)
        class_addMethod((Class)v5, sel_color0, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v5, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
      {
        v8 = (void (*)(void))objSetter;
        goto LABEL_15;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v10 = (void *)result;
    v11 = -[NSString isEqualToString:](NSStringFromSelector(sel_color1), "isEqualToString:", CFSTR("inputImage"));
    v12 = objc_msgSend(v10, "instancesRespondToSelector:", sel_color1);
    if (v11)
    {
      if ((v12 & 1) == 0)
        class_addMethod((Class)v10, sel_color1, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v10, "instancesRespondToSelector:", sel_setColor1_);
      if ((result & 1) == 0)
      {
        v13 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v10, sel_setColor1_, v13, "v@:@");
      }
    }
    else
    {
      if ((v12 & 1) == 0)
        class_addMethod((Class)v10, sel_color1, (IMP)objGetter, "@@:");
      result = objc_msgSend(v10, "instancesRespondToSelector:", sel_setColor1_);
      if ((result & 1) == 0)
      {
        v13 = (void (*)(void))objSetter;
        return class_addMethod((Class)v10, sel_setColor1_, v13, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)sharpenLuminanceFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISharpenLuminance"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__sharpenLuminanceFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (sharpenLuminanceFilter_onceToken != -1)
    dispatch_once(&sharpenLuminanceFilter_onceToken, block);
  return v2;
}

objc_class *__44__CIFilter_Builtins__sharpenLuminanceFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_sharpness, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)unsharpMaskFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIUnsharpMask"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__unsharpMaskFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (unsharpMaskFilter_onceToken != -1)
    dispatch_once(&unsharpMaskFilter_onceToken, block);
  return v2;
}

objc_class *__39__CIFilter_Builtins__unsharpMaskFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)circularScreenFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICircularScreen"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__circularScreenFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (circularScreenFilter_onceToken != -1)
    dispatch_once(&circularScreenFilter_onceToken, block);
  return v2;
}

objc_class *__42__CIFilter_Builtins__circularScreenFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)CMYKHalftone
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICMYKHalftone"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CIFilter_Builtins__CMYKHalftone__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (CMYKHalftone_onceToken != -1)
    dispatch_once(&CMYKHalftone_onceToken, block);
  return v2;
}

objc_class *__34__CIFilter_Builtins__CMYKHalftone__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *result;
  objc_class *v16;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_sharpness, (IMP)floatGetter, "f@:");
    class_addMethod(v12, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  v13 = (objc_class *)objc_opt_class();
  if (v13)
  {
    v14 = v13;
    class_addMethod(v13, sel_grayComponentReplacement, (IMP)floatGetter, "f@:");
    class_addMethod(v14, sel_setGrayComponentReplacement_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v16 = result;
    class_addMethod(result, sel_underColorRemoval, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v16, sel_setUnderColorRemoval_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)dotScreenFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDotScreen"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__dotScreenFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (dotScreenFilter_onceToken != -1)
    dispatch_once(&dotScreenFilter_onceToken, block);
  return v2;
}

objc_class *__37__CIFilter_Builtins__dotScreenFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)hatchedScreenFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIHatchedScreen"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__hatchedScreenFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (hatchedScreenFilter_onceToken != -1)
    dispatch_once(&hatchedScreenFilter_onceToken, block);
  return v2;
}

objc_class *__41__CIFilter_Builtins__hatchedScreenFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)lineScreenFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CILineScreen"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__lineScreenFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (lineScreenFilter_onceToken != -1)
    dispatch_once(&lineScreenFilter_onceToken, block);
  return v2;
}

objc_class *__38__CIFilter_Builtins__lineScreenFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)bicubicScaleTransformFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBicubicScaleTransform"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__bicubicScaleTransformFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (bicubicScaleTransformFilter_onceToken != -1)
    dispatch_once(&bicubicScaleTransformFilter_onceToken, block);
  return v2;
}

objc_class *__49__CIFilter_Builtins__bicubicScaleTransformFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_aspectRatio, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAspectRatio_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_parameterB, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setParameterB_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_parameterC, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setParameterC_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)edgePreserveUpsampleFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIEdgePreserveUpsampleFilter"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__edgePreserveUpsampleFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (edgePreserveUpsampleFilter_onceToken != -1)
    dispatch_once(&edgePreserveUpsampleFilter_onceToken, block);
  return v2;
}

objc_class *__48__CIFilter_Builtins__edgePreserveUpsampleFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *v10;
  objc_class *v11;
  objc_class *result;
  objc_class *v13;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_smallImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_smallImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_smallImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setSmallImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setSmallImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_smallImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setSmallImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    v11 = v10;
    class_addMethod(v10, sel_spatialSigma, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setSpatialSigma_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v13 = result;
    class_addMethod(result, sel_lumaSigma, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setLumaSigma_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)keystoneCorrectionCombinedFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIKeystoneCorrectionCombined"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CIFilter_Builtins__keystoneCorrectionCombinedFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (keystoneCorrectionCombinedFilter_onceToken != -1)
    dispatch_once(&keystoneCorrectionCombinedFilter_onceToken, block);
  return v2;
}

objc_class *__54__CIFilter_Builtins__keystoneCorrectionCombinedFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *result;
  objc_class *v14;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_focalLength, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setFocalLength_, (IMP)floatSetter, "v@:f");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v10, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v12, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v14 = result;
    class_addMethod(result, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v14, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)keystoneCorrectionHorizontalFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIKeystoneCorrectionHorizontal"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CIFilter_Builtins__keystoneCorrectionHorizontalFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (keystoneCorrectionHorizontalFilter_onceToken != -1)
    dispatch_once(&keystoneCorrectionHorizontalFilter_onceToken, block);
  return v2;
}

objc_class *__56__CIFilter_Builtins__keystoneCorrectionHorizontalFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *result;
  objc_class *v14;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_focalLength, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setFocalLength_, (IMP)floatSetter, "v@:f");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v10, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v12, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v14 = result;
    class_addMethod(result, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v14, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)keystoneCorrectionVerticalFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIKeystoneCorrectionVertical"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CIFilter_Builtins__keystoneCorrectionVerticalFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (keystoneCorrectionVerticalFilter_onceToken != -1)
    dispatch_once(&keystoneCorrectionVerticalFilter_onceToken, block);
  return v2;
}

objc_class *__54__CIFilter_Builtins__keystoneCorrectionVerticalFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *result;
  objc_class *v14;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_focalLength, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setFocalLength_, (IMP)floatSetter, "v@:f");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v10, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v12, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v14 = result;
    class_addMethod(result, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v14, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)lanczosScaleTransformFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CILanczosScaleTransform"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__lanczosScaleTransformFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (lanczosScaleTransformFilter_onceToken != -1)
    dispatch_once(&lanczosScaleTransformFilter_onceToken, block);
  return v2;
}

objc_class *__49__CIFilter_Builtins__lanczosScaleTransformFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_aspectRatio, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setAspectRatio_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (id)maximumScaleTransformFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMaximumScaleTransform"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__maximumScaleTransformFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (maximumScaleTransformFilter_onceToken != -1)
    dispatch_once(&maximumScaleTransformFilter_onceToken, block);
  return v2;
}

objc_class *__49__CIFilter_Builtins__maximumScaleTransformFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_aspectRatio, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setAspectRatio_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)perspectiveCorrectionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPerspectiveCorrection"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__perspectiveCorrectionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (perspectiveCorrectionFilter_onceToken != -1)
    dispatch_once(&perspectiveCorrectionFilter_onceToken, block);
  return v2;
}

objc_class *__49__CIFilter_Builtins__perspectiveCorrectionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *result;
  objc_class *v14;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v10, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v12, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v14 = result;
    class_addMethod(result, sel_crop, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v14, sel_setCrop_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)perspectiveRotateFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPerspectiveRotate"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__perspectiveRotateFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (perspectiveRotateFilter_onceToken != -1)
    dispatch_once(&perspectiveRotateFilter_onceToken, block);
  return v2;
}

objc_class *__45__CIFilter_Builtins__perspectiveRotateFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_focalLength, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setFocalLength_, (IMP)floatSetter, "v@:f");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_pitch, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setPitch_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, "yaw", (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setYaw_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_roll, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setRoll_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)perspectiveTransformFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPerspectiveTransform"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__perspectiveTransformFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (perspectiveTransformFilter_onceToken != -1)
    dispatch_once(&perspectiveTransformFilter_onceToken, block);
  return v2;
}

objc_class *__48__CIFilter_Builtins__perspectiveTransformFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v10, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v12, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)perspectiveTransformWithExtentFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPerspectiveTransformWithExtent"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CIFilter_Builtins__perspectiveTransformWithExtentFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (perspectiveTransformWithExtentFilter_onceToken != -1)
    dispatch_once(&perspectiveTransformWithExtentFilter_onceToken, block);
  return v2;
}

objc_class *__58__CIFilter_Builtins__perspectiveTransformWithExtentFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *result;
  objc_class *v14;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v10, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v12, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v14 = result;
    class_addMethod(result, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v14, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)straightenFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIStraightenFilter"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__straightenFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (straightenFilter_onceToken != -1)
    dispatch_once(&straightenFilter_onceToken, block);
  return v2;
}

objc_class *__38__CIFilter_Builtins__straightenFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)accordionFoldTransitionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAccordionFoldTransition"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__accordionFoldTransitionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (accordionFoldTransitionFilter_onceToken != -1)
    dispatch_once(&accordionFoldTransitionFilter_onceToken, block);
  return v2;
}

objc_class *__51__CIFilter_Builtins__accordionFoldTransitionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *result;
  objc_class *v17;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_targetImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_targetImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setTargetImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    v11 = v10;
    class_addMethod(v10, sel_bottomHeight, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setBottomHeight_, (IMP)floatSetter, "v@:f");
  }
  v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    v13 = v12;
    class_addMethod(v12, sel_numberOfFolds, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setNumberOfFolds_, (IMP)floatSetter, "v@:f");
  }
  v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    v15 = v14;
    class_addMethod(v14, sel_foldShadowAmount, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setFoldShadowAmount_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v17 = result;
    class_addMethod(result, sel_time, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v17, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)barsSwipeTransitionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBarsSwipeTransition"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__barsSwipeTransitionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (barsSwipeTransitionFilter_onceToken != -1)
    dispatch_once(&barsSwipeTransitionFilter_onceToken, block);
  return v2;
}

objc_class *__47__CIFilter_Builtins__barsSwipeTransitionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *result;
  objc_class *v17;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_targetImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_targetImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setTargetImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    v11 = v10;
    class_addMethod(v10, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    v13 = v12;
    class_addMethod(v12, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    v15 = v14;
    class_addMethod(v14, sel_barOffset, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setBarOffset_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v17 = result;
    class_addMethod(result, sel_time, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v17, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)copyMachineTransitionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICopyMachineTransition"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__copyMachineTransitionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (copyMachineTransitionFilter_onceToken != -1)
    dispatch_once(&copyMachineTransitionFilter_onceToken, block);
  return v2;
}

objc_class *__49__CIFilter_Builtins__copyMachineTransitionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *v10;
  objc_class *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  char v15;
  void (*v16)(void);
  objc_class *v17;
  objc_class *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *result;
  objc_class *v24;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_targetImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_targetImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setTargetImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    v11 = v10;
    class_addMethod(v10, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v11, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v12 = objc_opt_class();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = -[NSString isEqualToString:](NSStringFromSelector(sel_color), "isEqualToString:", CFSTR("inputImage"));
    v15 = objc_msgSend(v13, "instancesRespondToSelector:", sel_color);
    if (v14)
    {
      if ((v15 & 1) == 0)
        class_addMethod((Class)v13, sel_color, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v13, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v16 = (void (*)(void))iiSetter;
LABEL_35:
        class_addMethod((Class)v13, sel_setColor_, v16, "v@:@");
      }
    }
    else
    {
      if ((v15 & 1) == 0)
        class_addMethod((Class)v13, sel_color, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v13, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v16 = (void (*)(void))objSetter;
        goto LABEL_35;
      }
    }
  }
  v17 = (objc_class *)objc_opt_class();
  if (v17)
  {
    v18 = v17;
    class_addMethod(v17, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v18, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  v19 = (objc_class *)objc_opt_class();
  if (v19)
  {
    v20 = v19;
    class_addMethod(v19, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v20, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  v21 = (objc_class *)objc_opt_class();
  if (v21)
  {
    v22 = v21;
    class_addMethod(v21, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v22, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v24 = result;
    class_addMethod(result, sel_opacity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v24, sel_setOpacity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)disintegrateWithMaskTransitionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDisintegrateWithMaskTransition"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CIFilter_Builtins__disintegrateWithMaskTransitionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (disintegrateWithMaskTransitionFilter_onceToken != -1)
    dispatch_once(&disintegrateWithMaskTransitionFilter_onceToken, block);
  return v2;
}

objc_class *__58__CIFilter_Builtins__disintegrateWithMaskTransitionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *result;
  objc_class *v22;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_targetImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_targetImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setTargetImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = objc_opt_class();
  if (!v10)
    goto LABEL_34;
  v11 = (void *)v10;
  v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_maskImage), "isEqualToString:", CFSTR("inputImage"));
  v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_maskImage);
  if (v12)
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_maskImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setMaskImage_) & 1) == 0)
    {
      v14 = (void (*)(void))iiSetter;
LABEL_33:
      class_addMethod((Class)v11, sel_setMaskImage_, v14, "v@:@");
    }
  }
  else
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_maskImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setMaskImage_) & 1) == 0)
    {
      v14 = (void (*)(void))objSetter;
      goto LABEL_33;
    }
  }
LABEL_34:
  v15 = (objc_class *)objc_opt_class();
  if (v15)
  {
    v16 = v15;
    class_addMethod(v15, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v16, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  v17 = (objc_class *)objc_opt_class();
  if (v17)
  {
    v18 = v17;
    class_addMethod(v17, sel_shadowRadius, (IMP)floatGetter, "f@:");
    class_addMethod(v18, sel_setShadowRadius_, (IMP)floatSetter, "v@:f");
  }
  v19 = (objc_class *)objc_opt_class();
  if (v19)
  {
    v20 = v19;
    class_addMethod(v19, sel_shadowDensity, (IMP)floatGetter, "f@:");
    class_addMethod(v20, sel_setShadowDensity_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v22 = result;
    class_addMethod(result, sel_shadowOffset, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v22, sel_setShadowOffset_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)dissolveTransitionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDissolveTransition"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__dissolveTransitionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (dissolveTransitionFilter_onceToken != -1)
    dispatch_once(&dissolveTransitionFilter_onceToken, block);
  return v2;
}

objc_class *__46__CIFilter_Builtins__dissolveTransitionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_targetImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_targetImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setTargetImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_time, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)flashTransitionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIFlashTransition"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__flashTransitionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (flashTransitionFilter_onceToken != -1)
    dispatch_once(&flashTransitionFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__flashTransitionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  char v17;
  void (*v18)(void);
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *v23;
  objc_class *v24;
  objc_class *v25;
  objc_class *v26;
  objc_class *result;
  objc_class *v28;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_targetImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_targetImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setTargetImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    v11 = v10;
    class_addMethod(v10, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v11, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    v13 = v12;
    class_addMethod(v12, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v13, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v14 = objc_opt_class();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = -[NSString isEqualToString:](NSStringFromSelector(sel_color), "isEqualToString:", CFSTR("inputImage"));
    v17 = objc_msgSend(v15, "instancesRespondToSelector:", sel_color);
    if (v16)
    {
      if ((v17 & 1) == 0)
        class_addMethod((Class)v15, sel_color, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v15, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v18 = (void (*)(void))iiSetter;
LABEL_37:
        class_addMethod((Class)v15, sel_setColor_, v18, "v@:@");
      }
    }
    else
    {
      if ((v17 & 1) == 0)
        class_addMethod((Class)v15, sel_color, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v15, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v18 = (void (*)(void))objSetter;
        goto LABEL_37;
      }
    }
  }
  v19 = (objc_class *)objc_opt_class();
  if (v19)
  {
    v20 = v19;
    class_addMethod(v19, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v20, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  v21 = (objc_class *)objc_opt_class();
  if (v21)
  {
    v22 = v21;
    class_addMethod(v21, sel_maxStriationRadius, (IMP)floatGetter, "f@:");
    class_addMethod(v22, sel_setMaxStriationRadius_, (IMP)floatSetter, "v@:f");
  }
  v23 = (objc_class *)objc_opt_class();
  if (v23)
  {
    v24 = v23;
    class_addMethod(v23, sel_striationStrength, (IMP)floatGetter, "f@:");
    class_addMethod(v24, sel_setStriationStrength_, (IMP)floatSetter, "v@:f");
  }
  v25 = (objc_class *)objc_opt_class();
  if (v25)
  {
    v26 = v25;
    class_addMethod(v25, sel_striationContrast, (IMP)floatGetter, "f@:");
    class_addMethod(v26, sel_setStriationContrast_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v28 = result;
    class_addMethod(result, sel_fadeThreshold, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v28, sel_setFadeThreshold_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)modTransitionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIModTransition"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__modTransitionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (modTransitionFilter_onceToken != -1)
    dispatch_once(&modTransitionFilter_onceToken, block);
  return v2;
}

objc_class *__41__CIFilter_Builtins__modTransitionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *result;
  objc_class *v19;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_targetImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_targetImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setTargetImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    v11 = v10;
    class_addMethod(v10, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v11, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    v13 = v12;
    class_addMethod(v12, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    v15 = v14;
    class_addMethod(v14, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  v16 = (objc_class *)objc_opt_class();
  if (v16)
  {
    v17 = v16;
    class_addMethod(v16, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v17, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v19 = result;
    class_addMethod(result, sel_compression, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v19, sel_setCompression_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)pageCurlTransitionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPageCurlTransition"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__pageCurlTransitionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (pageCurlTransitionFilter_onceToken != -1)
    dispatch_once(&pageCurlTransitionFilter_onceToken, block);
  return v2;
}

objc_class *__46__CIFilter_Builtins__pageCurlTransitionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  char v18;
  void (*v19)(void);
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *v23;
  objc_class *v24;
  objc_class *v25;
  objc_class *result;
  objc_class *v27;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_targetImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_targetImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setTargetImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = objc_opt_class();
  if (!v10)
    goto LABEL_34;
  v11 = (void *)v10;
  v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_backsideImage), "isEqualToString:", CFSTR("inputImage"));
  v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_backsideImage);
  if (v12)
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_backsideImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setBacksideImage_) & 1) == 0)
    {
      v14 = (void (*)(void))iiSetter;
LABEL_33:
      class_addMethod((Class)v11, sel_setBacksideImage_, v14, "v@:@");
    }
  }
  else
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_backsideImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setBacksideImage_) & 1) == 0)
    {
      v14 = (void (*)(void))objSetter;
      goto LABEL_33;
    }
  }
LABEL_34:
  v15 = objc_opt_class();
  if (!v15)
    goto LABEL_45;
  v16 = (void *)v15;
  v17 = -[NSString isEqualToString:](NSStringFromSelector(sel_shadingImage), "isEqualToString:", CFSTR("inputImage"));
  v18 = objc_msgSend(v16, "instancesRespondToSelector:", sel_shadingImage);
  if (v17)
  {
    if ((v18 & 1) == 0)
      class_addMethod((Class)v16, sel_shadingImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v16, "instancesRespondToSelector:", sel_setShadingImage_) & 1) == 0)
    {
      v19 = (void (*)(void))iiSetter;
LABEL_44:
      class_addMethod((Class)v16, sel_setShadingImage_, v19, "v@:@");
    }
  }
  else
  {
    if ((v18 & 1) == 0)
      class_addMethod((Class)v16, sel_shadingImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v16, "instancesRespondToSelector:", sel_setShadingImage_) & 1) == 0)
    {
      v19 = (void (*)(void))objSetter;
      goto LABEL_44;
    }
  }
LABEL_45:
  v20 = (objc_class *)objc_opt_class();
  if (v20)
  {
    v21 = v20;
    class_addMethod(v20, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v21, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v22 = (objc_class *)objc_opt_class();
  if (v22)
  {
    v23 = v22;
    class_addMethod(v22, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v23, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  v24 = (objc_class *)objc_opt_class();
  if (v24)
  {
    v25 = v24;
    class_addMethod(v24, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v25, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v27 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v27, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)pageCurlWithShadowTransitionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPageCurlWithShadowTransition"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CIFilter_Builtins__pageCurlWithShadowTransitionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (pageCurlWithShadowTransitionFilter_onceToken != -1)
    dispatch_once(&pageCurlWithShadowTransitionFilter_onceToken, block);
  return v2;
}

uint64_t __56__CIFilter_Builtins__pageCurlWithShadowTransitionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *v23;
  objc_class *v24;
  objc_class *v25;
  objc_class *v26;
  uint64_t result;
  void *v28;
  _BOOL4 v29;
  char v30;
  void (*v31)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_targetImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_targetImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setTargetImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = objc_opt_class();
  if (!v10)
    goto LABEL_34;
  v11 = (void *)v10;
  v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_backsideImage), "isEqualToString:", CFSTR("inputImage"));
  v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_backsideImage);
  if (v12)
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_backsideImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setBacksideImage_) & 1) == 0)
    {
      v14 = (void (*)(void))iiSetter;
LABEL_33:
      class_addMethod((Class)v11, sel_setBacksideImage_, v14, "v@:@");
    }
  }
  else
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_backsideImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setBacksideImage_) & 1) == 0)
    {
      v14 = (void (*)(void))objSetter;
      goto LABEL_33;
    }
  }
LABEL_34:
  v15 = (objc_class *)objc_opt_class();
  if (v15)
  {
    v16 = v15;
    class_addMethod(v15, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v16, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v17 = (objc_class *)objc_opt_class();
  if (v17)
  {
    v18 = v17;
    class_addMethod(v17, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v18, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  v19 = (objc_class *)objc_opt_class();
  if (v19)
  {
    v20 = v19;
    class_addMethod(v19, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v20, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  v21 = (objc_class *)objc_opt_class();
  if (v21)
  {
    v22 = v21;
    class_addMethod(v21, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v22, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  v23 = (objc_class *)objc_opt_class();
  if (v23)
  {
    v24 = v23;
    class_addMethod(v23, sel_shadowSize, (IMP)floatGetter, "f@:");
    class_addMethod(v24, sel_setShadowSize_, (IMP)floatSetter, "v@:f");
  }
  v25 = (objc_class *)objc_opt_class();
  if (v25)
  {
    v26 = v25;
    class_addMethod(v25, sel_shadowAmount, (IMP)floatGetter, "f@:");
    class_addMethod(v26, sel_setShadowAmount_, (IMP)floatSetter, "v@:f");
  }
  result = objc_opt_class();
  if (result)
  {
    v28 = (void *)result;
    v29 = -[NSString isEqualToString:](NSStringFromSelector(sel_shadowExtent), "isEqualToString:", CFSTR("inputImage"));
    v30 = objc_msgSend(v28, "instancesRespondToSelector:", sel_shadowExtent);
    if (v29)
    {
      if ((v30 & 1) == 0)
        class_addMethod((Class)v28, sel_shadowExtent, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v28, "instancesRespondToSelector:", sel_setShadowExtent_);
      if ((result & 1) == 0)
      {
        v31 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v28, sel_setShadowExtent_, v31, "v@:@");
      }
    }
    else
    {
      if ((v30 & 1) == 0)
        class_addMethod((Class)v28, sel_shadowExtent, (IMP)objGetter, "@@:");
      result = objc_msgSend(v28, "instancesRespondToSelector:", sel_setShadowExtent_);
      if ((result & 1) == 0)
      {
        v31 = (void (*)(void))objSetter;
        return class_addMethod((Class)v28, sel_setShadowExtent_, v31, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)rippleTransitionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIRippleTransition"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__rippleTransitionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (rippleTransitionFilter_onceToken != -1)
    dispatch_once(&rippleTransitionFilter_onceToken, block);
  return v2;
}

objc_class *__44__CIFilter_Builtins__rippleTransitionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *result;
  objc_class *v24;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_targetImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_targetImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setTargetImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = objc_opt_class();
  if (!v10)
    goto LABEL_34;
  v11 = (void *)v10;
  v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_shadingImage), "isEqualToString:", CFSTR("inputImage"));
  v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_shadingImage);
  if (v12)
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_shadingImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setShadingImage_) & 1) == 0)
    {
      v14 = (void (*)(void))iiSetter;
LABEL_33:
      class_addMethod((Class)v11, sel_setShadingImage_, v14, "v@:@");
    }
  }
  else
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_shadingImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setShadingImage_) & 1) == 0)
    {
      v14 = (void (*)(void))objSetter;
      goto LABEL_33;
    }
  }
LABEL_34:
  v15 = (objc_class *)objc_opt_class();
  if (v15)
  {
    v16 = v15;
    class_addMethod(v15, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v16, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v17 = (objc_class *)objc_opt_class();
  if (v17)
  {
    v18 = v17;
    class_addMethod(v17, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v18, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v19 = (objc_class *)objc_opt_class();
  if (v19)
  {
    v20 = v19;
    class_addMethod(v19, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v20, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  v21 = (objc_class *)objc_opt_class();
  if (v21)
  {
    v22 = v21;
    class_addMethod(v21, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v22, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v24 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v24, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)swipeTransitionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISwipeTransition"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__swipeTransitionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (swipeTransitionFilter_onceToken != -1)
    dispatch_once(&swipeTransitionFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__swipeTransitionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *v10;
  objc_class *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  char v15;
  void (*v16)(void);
  objc_class *v17;
  objc_class *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *result;
  objc_class *v24;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_targetImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_targetImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setTargetImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_targetImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTargetImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    v11 = v10;
    class_addMethod(v10, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v11, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v12 = objc_opt_class();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = -[NSString isEqualToString:](NSStringFromSelector(sel_color), "isEqualToString:", CFSTR("inputImage"));
    v15 = objc_msgSend(v13, "instancesRespondToSelector:", sel_color);
    if (v14)
    {
      if ((v15 & 1) == 0)
        class_addMethod((Class)v13, sel_color, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v13, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v16 = (void (*)(void))iiSetter;
LABEL_35:
        class_addMethod((Class)v13, sel_setColor_, v16, "v@:@");
      }
    }
    else
    {
      if ((v15 & 1) == 0)
        class_addMethod((Class)v13, sel_color, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v13, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v16 = (void (*)(void))objSetter;
        goto LABEL_35;
      }
    }
  }
  v17 = (objc_class *)objc_opt_class();
  if (v17)
  {
    v18 = v17;
    class_addMethod(v17, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v18, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  v19 = (objc_class *)objc_opt_class();
  if (v19)
  {
    v20 = v19;
    class_addMethod(v19, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v20, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  v21 = (objc_class *)objc_opt_class();
  if (v21)
  {
    v22 = v21;
    class_addMethod(v21, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v22, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v24 = result;
    class_addMethod(result, sel_opacity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v24, sel_setOpacity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)additionCompositingFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAdditionCompositing"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__additionCompositingFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (additionCompositingFilter_onceToken != -1)
    dispatch_once(&additionCompositingFilter_onceToken, block);
  return v2;
}

uint64_t __47__CIFilter_Builtins__additionCompositingFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)colorBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__colorBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorBlendModeFilter_onceToken != -1)
    dispatch_once(&colorBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __42__CIFilter_Builtins__colorBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)colorBurnBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorBurnBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__colorBurnBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorBurnBlendModeFilter_onceToken != -1)
    dispatch_once(&colorBurnBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __46__CIFilter_Builtins__colorBurnBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)colorDodgeBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorDodgeBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__colorDodgeBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorDodgeBlendModeFilter_onceToken != -1)
    dispatch_once(&colorDodgeBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __47__CIFilter_Builtins__colorDodgeBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)darkenBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDarkenBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__darkenBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (darkenBlendModeFilter_onceToken != -1)
    dispatch_once(&darkenBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __43__CIFilter_Builtins__darkenBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)differenceBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDifferenceBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__differenceBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (differenceBlendModeFilter_onceToken != -1)
    dispatch_once(&differenceBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __47__CIFilter_Builtins__differenceBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)divideBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDivideBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__divideBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (divideBlendModeFilter_onceToken != -1)
    dispatch_once(&divideBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __43__CIFilter_Builtins__divideBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)exclusionBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIExclusionBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__exclusionBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (exclusionBlendModeFilter_onceToken != -1)
    dispatch_once(&exclusionBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __46__CIFilter_Builtins__exclusionBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)hardLightBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIHardLightBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__hardLightBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (hardLightBlendModeFilter_onceToken != -1)
    dispatch_once(&hardLightBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __46__CIFilter_Builtins__hardLightBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)hueBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIHueBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__hueBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (hueBlendModeFilter_onceToken != -1)
    dispatch_once(&hueBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __40__CIFilter_Builtins__hueBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)lightenBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CILightenBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__lightenBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (lightenBlendModeFilter_onceToken != -1)
    dispatch_once(&lightenBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __44__CIFilter_Builtins__lightenBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)linearBurnBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CILinearBurnBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__linearBurnBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (linearBurnBlendModeFilter_onceToken != -1)
    dispatch_once(&linearBurnBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __47__CIFilter_Builtins__linearBurnBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)linearDodgeBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CILinearDodgeBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__linearDodgeBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (linearDodgeBlendModeFilter_onceToken != -1)
    dispatch_once(&linearDodgeBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __48__CIFilter_Builtins__linearDodgeBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)linearLightBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CILinearLightBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__linearLightBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (linearLightBlendModeFilter_onceToken != -1)
    dispatch_once(&linearLightBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __48__CIFilter_Builtins__linearLightBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)luminosityBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CILuminosityBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__luminosityBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (luminosityBlendModeFilter_onceToken != -1)
    dispatch_once(&luminosityBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __47__CIFilter_Builtins__luminosityBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)maximumCompositingFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMaximumCompositing"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__maximumCompositingFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (maximumCompositingFilter_onceToken != -1)
    dispatch_once(&maximumCompositingFilter_onceToken, block);
  return v2;
}

uint64_t __46__CIFilter_Builtins__maximumCompositingFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)minimumCompositingFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMinimumCompositing"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__minimumCompositingFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (minimumCompositingFilter_onceToken != -1)
    dispatch_once(&minimumCompositingFilter_onceToken, block);
  return v2;
}

uint64_t __46__CIFilter_Builtins__minimumCompositingFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)multiplyBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMultiplyBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__multiplyBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (multiplyBlendModeFilter_onceToken != -1)
    dispatch_once(&multiplyBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __45__CIFilter_Builtins__multiplyBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)multiplyCompositingFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMultiplyCompositing"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__multiplyCompositingFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (multiplyCompositingFilter_onceToken != -1)
    dispatch_once(&multiplyCompositingFilter_onceToken, block);
  return v2;
}

uint64_t __47__CIFilter_Builtins__multiplyCompositingFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)overlayBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIOverlayBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__overlayBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (overlayBlendModeFilter_onceToken != -1)
    dispatch_once(&overlayBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __44__CIFilter_Builtins__overlayBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)pinLightBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPinLightBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__pinLightBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (pinLightBlendModeFilter_onceToken != -1)
    dispatch_once(&pinLightBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __45__CIFilter_Builtins__pinLightBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)saturationBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISaturationBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__saturationBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (saturationBlendModeFilter_onceToken != -1)
    dispatch_once(&saturationBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __47__CIFilter_Builtins__saturationBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)screenBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIScreenBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__screenBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (screenBlendModeFilter_onceToken != -1)
    dispatch_once(&screenBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __43__CIFilter_Builtins__screenBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)softLightBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISoftLightBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__softLightBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (softLightBlendModeFilter_onceToken != -1)
    dispatch_once(&softLightBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __46__CIFilter_Builtins__softLightBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)sourceAtopCompositingFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISourceAtopCompositing"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__sourceAtopCompositingFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (sourceAtopCompositingFilter_onceToken != -1)
    dispatch_once(&sourceAtopCompositingFilter_onceToken, block);
  return v2;
}

uint64_t __49__CIFilter_Builtins__sourceAtopCompositingFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)sourceInCompositingFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISourceInCompositing"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__sourceInCompositingFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (sourceInCompositingFilter_onceToken != -1)
    dispatch_once(&sourceInCompositingFilter_onceToken, block);
  return v2;
}

uint64_t __47__CIFilter_Builtins__sourceInCompositingFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)sourceOutCompositingFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISourceOutCompositing"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__sourceOutCompositingFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (sourceOutCompositingFilter_onceToken != -1)
    dispatch_once(&sourceOutCompositingFilter_onceToken, block);
  return v2;
}

uint64_t __48__CIFilter_Builtins__sourceOutCompositingFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)sourceOverCompositingFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISourceOverCompositing"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__sourceOverCompositingFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (sourceOverCompositingFilter_onceToken != -1)
    dispatch_once(&sourceOverCompositingFilter_onceToken, block);
  return v2;
}

uint64_t __49__CIFilter_Builtins__sourceOverCompositingFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)subtractBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISubtractBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__subtractBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (subtractBlendModeFilter_onceToken != -1)
    dispatch_once(&subtractBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __45__CIFilter_Builtins__subtractBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)vividLightBlendModeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIVividLightBlendMode"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__vividLightBlendModeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (vividLightBlendModeFilter_onceToken != -1)
    dispatch_once(&vividLightBlendModeFilter_onceToken, block);
  return v2;
}

uint64_t __47__CIFilter_Builtins__vividLightBlendModeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)colorAbsoluteDifferenceFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorAbsoluteDifference"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__colorAbsoluteDifferenceFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorAbsoluteDifferenceFilter_onceToken != -1)
    dispatch_once(&colorAbsoluteDifferenceFilter_onceToken, block);
  return v2;
}

uint64_t __51__CIFilter_Builtins__colorAbsoluteDifferenceFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage2), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_inputImage2);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_inputImage2, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setImage2_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setImage2_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_inputImage2, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setImage2_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setImage2_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)colorClampFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorClamp"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__colorClampFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorClampFilter_onceToken != -1)
    dispatch_once(&colorClampFilter_onceToken, block);
  return v2;
}

uint64_t __38__CIFilter_Builtins__colorClampFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t result;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_minComponents), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_minComponents);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_minComponents, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setMinComponents_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setMinComponents_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_minComponents, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setMinComponents_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = objc_opt_class();
  if (result)
  {
    v11 = (void *)result;
    v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_maxComponents), "isEqualToString:", CFSTR("inputImage"));
    v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_maxComponents);
    if (v12)
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_maxComponents, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setMaxComponents_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v11, sel_setMaxComponents_, v14, "v@:@");
      }
    }
    else
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_maxComponents, (IMP)objGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setMaxComponents_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))objSetter;
        return class_addMethod((Class)v11, sel_setMaxComponents_, v14, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)colorControlsFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorControls"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__colorControlsFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorControlsFilter_onceToken != -1)
    dispatch_once(&colorControlsFilter_onceToken, block);
  return v2;
}

objc_class *__41__CIFilter_Builtins__colorControlsFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_saturation, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setSaturation_, (IMP)floatSetter, "v@:f");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_brightness, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setBrightness_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_contrast, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setContrast_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)colorMatrixFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorMatrix"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__colorMatrixFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorMatrixFilter_onceToken != -1)
    dispatch_once(&colorMatrixFilter_onceToken, block);
  return v2;
}

uint64_t __39__CIFilter_Builtins__colorMatrixFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  char v18;
  void (*v19)(void);
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  char v23;
  void (*v24)(void);
  uint64_t result;
  void *v26;
  _BOOL4 v27;
  char v28;
  void (*v29)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_RVector), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_RVector);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_RVector, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setRVector_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setRVector_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_RVector, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setRVector_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = objc_opt_class();
  if (!v10)
    goto LABEL_34;
  v11 = (void *)v10;
  v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_GVector), "isEqualToString:", CFSTR("inputImage"));
  v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_GVector);
  if (v12)
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_GVector, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setGVector_) & 1) == 0)
    {
      v14 = (void (*)(void))iiSetter;
LABEL_33:
      class_addMethod((Class)v11, sel_setGVector_, v14, "v@:@");
    }
  }
  else
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_GVector, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setGVector_) & 1) == 0)
    {
      v14 = (void (*)(void))objSetter;
      goto LABEL_33;
    }
  }
LABEL_34:
  v15 = objc_opt_class();
  if (!v15)
    goto LABEL_45;
  v16 = (void *)v15;
  v17 = -[NSString isEqualToString:](NSStringFromSelector(sel_BVector), "isEqualToString:", CFSTR("inputImage"));
  v18 = objc_msgSend(v16, "instancesRespondToSelector:", sel_BVector);
  if (v17)
  {
    if ((v18 & 1) == 0)
      class_addMethod((Class)v16, sel_BVector, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v16, "instancesRespondToSelector:", sel_setBVector_) & 1) == 0)
    {
      v19 = (void (*)(void))iiSetter;
LABEL_44:
      class_addMethod((Class)v16, sel_setBVector_, v19, "v@:@");
    }
  }
  else
  {
    if ((v18 & 1) == 0)
      class_addMethod((Class)v16, sel_BVector, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v16, "instancesRespondToSelector:", sel_setBVector_) & 1) == 0)
    {
      v19 = (void (*)(void))objSetter;
      goto LABEL_44;
    }
  }
LABEL_45:
  v20 = objc_opt_class();
  if (!v20)
    goto LABEL_56;
  v21 = (void *)v20;
  v22 = -[NSString isEqualToString:](NSStringFromSelector(sel_AVector), "isEqualToString:", CFSTR("inputImage"));
  v23 = objc_msgSend(v21, "instancesRespondToSelector:", sel_AVector);
  if (v22)
  {
    if ((v23 & 1) == 0)
      class_addMethod((Class)v21, sel_AVector, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v21, "instancesRespondToSelector:", sel_setAVector_) & 1) == 0)
    {
      v24 = (void (*)(void))iiSetter;
LABEL_55:
      class_addMethod((Class)v21, sel_setAVector_, v24, "v@:@");
    }
  }
  else
  {
    if ((v23 & 1) == 0)
      class_addMethod((Class)v21, sel_AVector, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v21, "instancesRespondToSelector:", sel_setAVector_) & 1) == 0)
    {
      v24 = (void (*)(void))objSetter;
      goto LABEL_55;
    }
  }
LABEL_56:
  result = objc_opt_class();
  if (result)
  {
    v26 = (void *)result;
    v27 = -[NSString isEqualToString:](NSStringFromSelector(sel_biasVector), "isEqualToString:", CFSTR("inputImage"));
    v28 = objc_msgSend(v26, "instancesRespondToSelector:", sel_biasVector);
    if (v27)
    {
      if ((v28 & 1) == 0)
        class_addMethod((Class)v26, sel_biasVector, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v26, "instancesRespondToSelector:", sel_setBiasVector_);
      if ((result & 1) == 0)
      {
        v29 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v26, sel_setBiasVector_, v29, "v@:@");
      }
    }
    else
    {
      if ((v28 & 1) == 0)
        class_addMethod((Class)v26, sel_biasVector, (IMP)objGetter, "@@:");
      result = objc_msgSend(v26, "instancesRespondToSelector:", sel_setBiasVector_);
      if ((result & 1) == 0)
      {
        v29 = (void (*)(void))objSetter;
        return class_addMethod((Class)v26, sel_setBiasVector_, v29, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)colorPolynomialFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorPolynomial"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__colorPolynomialFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorPolynomialFilter_onceToken != -1)
    dispatch_once(&colorPolynomialFilter_onceToken, block);
  return v2;
}

uint64_t __43__CIFilter_Builtins__colorPolynomialFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  char v18;
  void (*v19)(void);
  uint64_t result;
  void *v21;
  _BOOL4 v22;
  char v23;
  void (*v24)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_redCoefficients), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_redCoefficients);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_redCoefficients, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setRedCoefficients_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setRedCoefficients_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_redCoefficients, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setRedCoefficients_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = objc_opt_class();
  if (!v10)
    goto LABEL_34;
  v11 = (void *)v10;
  v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_greenCoefficients), "isEqualToString:", CFSTR("inputImage"));
  v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_greenCoefficients);
  if (v12)
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_greenCoefficients, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setGreenCoefficients_) & 1) == 0)
    {
      v14 = (void (*)(void))iiSetter;
LABEL_33:
      class_addMethod((Class)v11, sel_setGreenCoefficients_, v14, "v@:@");
    }
  }
  else
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_greenCoefficients, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setGreenCoefficients_) & 1) == 0)
    {
      v14 = (void (*)(void))objSetter;
      goto LABEL_33;
    }
  }
LABEL_34:
  v15 = objc_opt_class();
  if (!v15)
    goto LABEL_45;
  v16 = (void *)v15;
  v17 = -[NSString isEqualToString:](NSStringFromSelector(sel_blueCoefficients), "isEqualToString:", CFSTR("inputImage"));
  v18 = objc_msgSend(v16, "instancesRespondToSelector:", sel_blueCoefficients);
  if (v17)
  {
    if ((v18 & 1) == 0)
      class_addMethod((Class)v16, sel_blueCoefficients, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v16, "instancesRespondToSelector:", sel_setBlueCoefficients_) & 1) == 0)
    {
      v19 = (void (*)(void))iiSetter;
LABEL_44:
      class_addMethod((Class)v16, sel_setBlueCoefficients_, v19, "v@:@");
    }
  }
  else
  {
    if ((v18 & 1) == 0)
      class_addMethod((Class)v16, sel_blueCoefficients, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v16, "instancesRespondToSelector:", sel_setBlueCoefficients_) & 1) == 0)
    {
      v19 = (void (*)(void))objSetter;
      goto LABEL_44;
    }
  }
LABEL_45:
  result = objc_opt_class();
  if (result)
  {
    v21 = (void *)result;
    v22 = -[NSString isEqualToString:](NSStringFromSelector(sel_alphaCoefficients), "isEqualToString:", CFSTR("inputImage"));
    v23 = objc_msgSend(v21, "instancesRespondToSelector:", sel_alphaCoefficients);
    if (v22)
    {
      if ((v23 & 1) == 0)
        class_addMethod((Class)v21, sel_alphaCoefficients, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v21, "instancesRespondToSelector:", sel_setAlphaCoefficients_);
      if ((result & 1) == 0)
      {
        v24 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v21, sel_setAlphaCoefficients_, v24, "v@:@");
      }
    }
    else
    {
      if ((v23 & 1) == 0)
        class_addMethod((Class)v21, sel_alphaCoefficients, (IMP)objGetter, "@@:");
      result = objc_msgSend(v21, "instancesRespondToSelector:", sel_setAlphaCoefficients_);
      if ((result & 1) == 0)
      {
        v24 = (void (*)(void))objSetter;
        return class_addMethod((Class)v21, sel_setAlphaCoefficients_, v24, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)colorThresholdFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorThreshold"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__colorThresholdFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorThresholdFilter_onceToken != -1)
    dispatch_once(&colorThresholdFilter_onceToken, block);
  return v2;
}

objc_class *__42__CIFilter_Builtins__colorThresholdFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_threshold, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setThreshold_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)colorThresholdOtsuFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorThresholdOtsu"));
}

+ (CIFilter)depthToDisparityFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDepthToDisparity"));
}

+ (CIFilter)disparityToDepthFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDisparityToDepth"));
}

+ (CIFilter)exposureAdjustFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIExposureAdjust"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__exposureAdjustFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (exposureAdjustFilter_onceToken != -1)
    dispatch_once(&exposureAdjustFilter_onceToken, block);
  return v2;
}

objc_class *__42__CIFilter_Builtins__exposureAdjustFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_EV, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setEV_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)gammaAdjustFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIGammaAdjust"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__gammaAdjustFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (gammaAdjustFilter_onceToken != -1)
    dispatch_once(&gammaAdjustFilter_onceToken, block);
  return v2;
}

objc_class *__39__CIFilter_Builtins__gammaAdjustFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_power, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setPower_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)hueAdjustFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIHueAdjust"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__hueAdjustFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (hueAdjustFilter_onceToken != -1)
    dispatch_once(&hueAdjustFilter_onceToken, block);
  return v2;
}

objc_class *__37__CIFilter_Builtins__hueAdjustFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)linearToSRGBToneCurveFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CILinearToSRGBToneCurve"));
}

+ (CIFilter)sRGBToneCurveToLinearFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISRGBToneCurveToLinear"));
}

+ (CIFilter)temperatureAndTintFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CITemperatureAndTint"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__temperatureAndTintFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (temperatureAndTintFilter_onceToken != -1)
    dispatch_once(&temperatureAndTintFilter_onceToken, block);
  return v2;
}

uint64_t __46__CIFilter_Builtins__temperatureAndTintFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t result;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_neutral), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_neutral);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_neutral, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setNeutral_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setNeutral_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_neutral, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setNeutral_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = objc_opt_class();
  if (result)
  {
    v11 = (void *)result;
    v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_targetNeutral), "isEqualToString:", CFSTR("inputImage"));
    v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_targetNeutral);
    if (v12)
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_targetNeutral, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setTargetNeutral_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v11, sel_setTargetNeutral_, v14, "v@:@");
      }
    }
    else
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_targetNeutral, (IMP)objGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setTargetNeutral_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))objSetter;
        return class_addMethod((Class)v11, sel_setTargetNeutral_, v14, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)toneCurveFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIToneCurve"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__toneCurveFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (toneCurveFilter_onceToken != -1)
    dispatch_once(&toneCurveFilter_onceToken, block);
  return v2;
}

objc_class *__37__CIFilter_Builtins__toneCurveFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *result;
  objc_class *v14;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_point0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setPoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_point1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setPoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_point2, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v10, sel_setPoint2_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_point3, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v12, sel_setPoint3_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v14 = result;
    class_addMethod(result, sel_point4, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v14, sel_setPoint4_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (id)toneMapHeadroomFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIToneMapHeadroom"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__toneMapHeadroomFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (toneMapHeadroomFilter_onceToken != -1)
    dispatch_once(&toneMapHeadroomFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__toneMapHeadroomFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_sourceHeadroom, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setSourceHeadroom_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_targetHeadroom, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setTargetHeadroom_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)vibranceFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIVibrance"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CIFilter_Builtins__vibranceFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (vibranceFilter_onceToken != -1)
    dispatch_once(&vibranceFilter_onceToken, block);
  return v2;
}

objc_class *__36__CIFilter_Builtins__vibranceFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_amount, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setAmount_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)whitePointAdjustFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIWhitePointAdjust"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__whitePointAdjustFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (whitePointAdjustFilter_onceToken != -1)
    dispatch_once(&whitePointAdjustFilter_onceToken, block);
  return v2;
}

uint64_t __44__CIFilter_Builtins__whitePointAdjustFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_color), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_color);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_color, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setColor_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setColor_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_color, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setColor_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setColor_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)colorCrossPolynomialFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorCrossPolynomial"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__colorCrossPolynomialFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorCrossPolynomialFilter_onceToken != -1)
    dispatch_once(&colorCrossPolynomialFilter_onceToken, block);
  return v2;
}

uint64_t __48__CIFilter_Builtins__colorCrossPolynomialFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);
  uint64_t result;
  void *v16;
  _BOOL4 v17;
  char v18;
  void (*v19)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_redCoefficients), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_redCoefficients);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_redCoefficients, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setRedCoefficients_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setRedCoefficients_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_redCoefficients, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setRedCoefficients_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = objc_opt_class();
  if (!v10)
    goto LABEL_34;
  v11 = (void *)v10;
  v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_greenCoefficients), "isEqualToString:", CFSTR("inputImage"));
  v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_greenCoefficients);
  if (v12)
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_greenCoefficients, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setGreenCoefficients_) & 1) == 0)
    {
      v14 = (void (*)(void))iiSetter;
LABEL_33:
      class_addMethod((Class)v11, sel_setGreenCoefficients_, v14, "v@:@");
    }
  }
  else
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_greenCoefficients, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setGreenCoefficients_) & 1) == 0)
    {
      v14 = (void (*)(void))objSetter;
      goto LABEL_33;
    }
  }
LABEL_34:
  result = objc_opt_class();
  if (result)
  {
    v16 = (void *)result;
    v17 = -[NSString isEqualToString:](NSStringFromSelector(sel_blueCoefficients), "isEqualToString:", CFSTR("inputImage"));
    v18 = objc_msgSend(v16, "instancesRespondToSelector:", sel_blueCoefficients);
    if (v17)
    {
      if ((v18 & 1) == 0)
        class_addMethod((Class)v16, sel_blueCoefficients, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v16, "instancesRespondToSelector:", sel_setBlueCoefficients_);
      if ((result & 1) == 0)
      {
        v19 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v16, sel_setBlueCoefficients_, v19, "v@:@");
      }
    }
    else
    {
      if ((v18 & 1) == 0)
        class_addMethod((Class)v16, sel_blueCoefficients, (IMP)objGetter, "@@:");
      result = objc_msgSend(v16, "instancesRespondToSelector:", sel_setBlueCoefficients_);
      if ((result & 1) == 0)
      {
        v19 = (void (*)(void))objSetter;
        return class_addMethod((Class)v16, sel_setBlueCoefficients_, v19, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)colorCubeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorCube"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__colorCubeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorCubeFilter_onceToken != -1)
    dispatch_once(&colorCubeFilter_onceToken, block);
  return v2;
}

objc_class *__37__CIFilter_Builtins__colorCubeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  char v10;
  void (*v11)(void);
  objc_class *result;
  objc_class *v13;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_cubeDimension, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setCubeDimension_, (IMP)floatSetter, "v@:f");
  }
  v7 = objc_opt_class();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[NSString isEqualToString:](NSStringFromSelector(sel_cubeData), "isEqualToString:", CFSTR("inputImage"));
    v10 = objc_msgSend(v8, "instancesRespondToSelector:", sel_cubeData);
    if (v9)
    {
      if ((v10 & 1) == 0)
        class_addMethod((Class)v8, sel_cubeData, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v8, "instancesRespondToSelector:", sel_setCubeData_) & 1) == 0)
      {
        v11 = (void (*)(void))iiSetter;
LABEL_24:
        class_addMethod((Class)v8, sel_setCubeData_, v11, "v@:@");
      }
    }
    else
    {
      if ((v10 & 1) == 0)
        class_addMethod((Class)v8, sel_cubeData, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v8, "instancesRespondToSelector:", sel_setCubeData_) & 1) == 0)
      {
        v11 = (void (*)(void))objSetter;
        goto LABEL_24;
      }
    }
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v13 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v13, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)colorCubesMixedWithMaskFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorCubesMixedWithMask"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__colorCubesMixedWithMaskFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorCubesMixedWithMaskFilter_onceToken != -1)
    dispatch_once(&colorCubesMixedWithMaskFilter_onceToken, block);
  return v2;
}

objc_class *__51__CIFilter_Builtins__colorCubesMixedWithMaskFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *v10;
  objc_class *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  char v15;
  void (*v16)(void);
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  char v20;
  void (*v21)(void);
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  char v25;
  void (*v26)(void);
  objc_class *result;
  objc_class *v28;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_maskImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_maskImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_maskImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setMaskImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setMaskImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_maskImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setMaskImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    v11 = v10;
    class_addMethod(v10, sel_cubeDimension, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setCubeDimension_, (IMP)floatSetter, "v@:f");
  }
  v12 = objc_opt_class();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = -[NSString isEqualToString:](NSStringFromSelector(sel_cube0Data), "isEqualToString:", CFSTR("inputImage"));
    v15 = objc_msgSend(v13, "instancesRespondToSelector:", sel_cube0Data);
    if (v14)
    {
      if ((v15 & 1) == 0)
        class_addMethod((Class)v13, sel_cube0Data, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v13, "instancesRespondToSelector:", sel_setCube0Data_) & 1) == 0)
      {
        v16 = (void (*)(void))iiSetter;
LABEL_35:
        class_addMethod((Class)v13, sel_setCube0Data_, v16, "v@:@");
      }
    }
    else
    {
      if ((v15 & 1) == 0)
        class_addMethod((Class)v13, sel_cube0Data, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v13, "instancesRespondToSelector:", sel_setCube0Data_) & 1) == 0)
      {
        v16 = (void (*)(void))objSetter;
        goto LABEL_35;
      }
    }
  }
  v17 = objc_opt_class();
  if (!v17)
    goto LABEL_47;
  v18 = (void *)v17;
  v19 = -[NSString isEqualToString:](NSStringFromSelector(sel_cube1Data), "isEqualToString:", CFSTR("inputImage"));
  v20 = objc_msgSend(v18, "instancesRespondToSelector:", sel_cube1Data);
  if (v19)
  {
    if ((v20 & 1) == 0)
      class_addMethod((Class)v18, sel_cube1Data, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v18, "instancesRespondToSelector:", sel_setCube1Data_) & 1) == 0)
    {
      v21 = (void (*)(void))iiSetter;
LABEL_46:
      class_addMethod((Class)v18, sel_setCube1Data_, v21, "v@:@");
    }
  }
  else
  {
    if ((v20 & 1) == 0)
      class_addMethod((Class)v18, sel_cube1Data, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v18, "instancesRespondToSelector:", sel_setCube1Data_) & 1) == 0)
    {
      v21 = (void (*)(void))objSetter;
      goto LABEL_46;
    }
  }
LABEL_47:
  v22 = objc_opt_class();
  if (!v22)
    goto LABEL_58;
  v23 = (void *)v22;
  v24 = -[NSString isEqualToString:](NSStringFromSelector(sel_colorSpace), "isEqualToString:", CFSTR("inputImage"));
  v25 = objc_msgSend(v23, "instancesRespondToSelector:", sel_colorSpace);
  if (v24)
  {
    if ((v25 & 1) == 0)
      class_addMethod((Class)v23, sel_colorSpace, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v23, "instancesRespondToSelector:", sel_setColorSpace_) & 1) == 0)
    {
      v26 = (void (*)(void))iiSetter;
LABEL_57:
      class_addMethod((Class)v23, sel_setColorSpace_, v26, "v@:@");
    }
  }
  else
  {
    if ((v25 & 1) == 0)
      class_addMethod((Class)v23, sel_colorSpace, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v23, "instancesRespondToSelector:", sel_setColorSpace_) & 1) == 0)
    {
      v26 = (void (*)(void))objSetter;
      goto LABEL_57;
    }
  }
LABEL_58:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v28 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v28, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)colorCubeWithColorSpaceFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorCubeWithColorSpace"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__colorCubeWithColorSpaceFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorCubeWithColorSpaceFilter_onceToken != -1)
    dispatch_once(&colorCubeWithColorSpaceFilter_onceToken, block);
  return v2;
}

objc_class *__51__CIFilter_Builtins__colorCubeWithColorSpaceFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  char v10;
  void (*v11)(void);
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  char v15;
  void (*v16)(void);
  objc_class *result;
  objc_class *v18;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_cubeDimension, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setCubeDimension_, (IMP)floatSetter, "v@:f");
  }
  v7 = objc_opt_class();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[NSString isEqualToString:](NSStringFromSelector(sel_cubeData), "isEqualToString:", CFSTR("inputImage"));
    v10 = objc_msgSend(v8, "instancesRespondToSelector:", sel_cubeData);
    if (v9)
    {
      if ((v10 & 1) == 0)
        class_addMethod((Class)v8, sel_cubeData, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v8, "instancesRespondToSelector:", sel_setCubeData_) & 1) == 0)
      {
        v11 = (void (*)(void))iiSetter;
LABEL_24:
        class_addMethod((Class)v8, sel_setCubeData_, v11, "v@:@");
      }
    }
    else
    {
      if ((v10 & 1) == 0)
        class_addMethod((Class)v8, sel_cubeData, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v8, "instancesRespondToSelector:", sel_setCubeData_) & 1) == 0)
      {
        v11 = (void (*)(void))objSetter;
        goto LABEL_24;
      }
    }
  }
  v12 = objc_opt_class();
  if (!v12)
    goto LABEL_36;
  v13 = (void *)v12;
  v14 = -[NSString isEqualToString:](NSStringFromSelector(sel_colorSpace), "isEqualToString:", CFSTR("inputImage"));
  v15 = objc_msgSend(v13, "instancesRespondToSelector:", sel_colorSpace);
  if (v14)
  {
    if ((v15 & 1) == 0)
      class_addMethod((Class)v13, sel_colorSpace, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v13, "instancesRespondToSelector:", sel_setColorSpace_) & 1) == 0)
    {
      v16 = (void (*)(void))iiSetter;
LABEL_35:
      class_addMethod((Class)v13, sel_setColorSpace_, v16, "v@:@");
    }
  }
  else
  {
    if ((v15 & 1) == 0)
      class_addMethod((Class)v13, sel_colorSpace, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v13, "instancesRespondToSelector:", sel_setColorSpace_) & 1) == 0)
    {
      v16 = (void (*)(void))objSetter;
      goto LABEL_35;
    }
  }
LABEL_36:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v18 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v18, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)colorCurvesFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorCurves"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__colorCurvesFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorCurvesFilter_onceToken != -1)
    dispatch_once(&colorCurvesFilter_onceToken, block);
  return v2;
}

uint64_t __39__CIFilter_Builtins__colorCurvesFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);
  uint64_t result;
  void *v16;
  _BOOL4 v17;
  char v18;
  void (*v19)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_curvesData), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_curvesData);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_curvesData, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setCurvesData_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setCurvesData_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_curvesData, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setCurvesData_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = objc_opt_class();
  if (!v10)
    goto LABEL_34;
  v11 = (void *)v10;
  v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_curvesDomain), "isEqualToString:", CFSTR("inputImage"));
  v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_curvesDomain);
  if (v12)
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_curvesDomain, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setCurvesDomain_) & 1) == 0)
    {
      v14 = (void (*)(void))iiSetter;
LABEL_33:
      class_addMethod((Class)v11, sel_setCurvesDomain_, v14, "v@:@");
    }
  }
  else
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_curvesDomain, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setCurvesDomain_) & 1) == 0)
    {
      v14 = (void (*)(void))objSetter;
      goto LABEL_33;
    }
  }
LABEL_34:
  result = objc_opt_class();
  if (result)
  {
    v16 = (void *)result;
    v17 = -[NSString isEqualToString:](NSStringFromSelector(sel_colorSpace), "isEqualToString:", CFSTR("inputImage"));
    v18 = objc_msgSend(v16, "instancesRespondToSelector:", sel_colorSpace);
    if (v17)
    {
      if ((v18 & 1) == 0)
        class_addMethod((Class)v16, sel_colorSpace, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v16, "instancesRespondToSelector:", sel_setColorSpace_);
      if ((result & 1) == 0)
      {
        v19 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v16, sel_setColorSpace_, v19, "v@:@");
      }
    }
    else
    {
      if ((v18 & 1) == 0)
        class_addMethod((Class)v16, sel_colorSpace, (IMP)objGetter, "@@:");
      result = objc_msgSend(v16, "instancesRespondToSelector:", sel_setColorSpace_);
      if ((result & 1) == 0)
      {
        v19 = (void (*)(void))objSetter;
        return class_addMethod((Class)v16, sel_setColorSpace_, v19, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)colorInvertFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorInvert"));
}

+ (CIFilter)colorMapFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorMap"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CIFilter_Builtins__colorMapFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorMapFilter_onceToken != -1)
    dispatch_once(&colorMapFilter_onceToken, block);
  return v2;
}

uint64_t __36__CIFilter_Builtins__colorMapFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_gradientImage), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_gradientImage);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_gradientImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setGradientImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setGradientImage_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_gradientImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setGradientImage_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setGradientImage_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)colorMonochromeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorMonochrome"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__colorMonochromeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorMonochromeFilter_onceToken != -1)
    dispatch_once(&colorMonochromeFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__colorMonochromeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_color), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_color);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_color, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setColor_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_color, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)colorPosterizeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorPosterize"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__colorPosterizeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (colorPosterizeFilter_onceToken != -1)
    dispatch_once(&colorPosterizeFilter_onceToken, block);
  return v2;
}

objc_class *__42__CIFilter_Builtins__colorPosterizeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_levels, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setLevels_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convertLabToRGBFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConvertLabToRGB"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__convertLabToRGBFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (convertLabToRGBFilter_onceToken != -1)
    dispatch_once(&convertLabToRGBFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__convertLabToRGBFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_normalize, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v6, sel_setNormalize_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)convertRGBtoLabFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConvertRGBtoLab"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__convertRGBtoLabFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (convertRGBtoLabFilter_onceToken != -1)
    dispatch_once(&convertRGBtoLabFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__convertRGBtoLabFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_normalize, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v6, sel_setNormalize_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)ditherFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDither"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CIFilter_Builtins__ditherFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (ditherFilter_onceToken != -1)
    dispatch_once(&ditherFilter_onceToken, block);
  return v2;
}

objc_class *__34__CIFilter_Builtins__ditherFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)documentEnhancerFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDocumentEnhancer"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__documentEnhancerFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (documentEnhancerFilter_onceToken != -1)
    dispatch_once(&documentEnhancerFilter_onceToken, block);
  return v2;
}

objc_class *__44__CIFilter_Builtins__documentEnhancerFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_amount, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setAmount_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)falseColorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIFalseColor"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__falseColorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (falseColorFilter_onceToken != -1)
    dispatch_once(&falseColorFilter_onceToken, block);
  return v2;
}

uint64_t __38__CIFilter_Builtins__falseColorFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t result;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_color0), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_color0);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_color0, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setColor0_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_color0, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = objc_opt_class();
  if (result)
  {
    v11 = (void *)result;
    v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_color1), "isEqualToString:", CFSTR("inputImage"));
    v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_color1);
    if (v12)
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_color1, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setColor1_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v11, sel_setColor1_, v14, "v@:@");
      }
    }
    else
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_color1, (IMP)objGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setColor1_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))objSetter;
        return class_addMethod((Class)v11, sel_setColor1_, v14, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)LabDeltaE
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CILabDeltaE"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CIFilter_Builtins__LabDeltaE__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (LabDeltaE_onceToken != -1)
    dispatch_once(&LabDeltaE_onceToken, block);
  return v2;
}

uint64_t __31__CIFilter_Builtins__LabDeltaE__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_image2), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_image2);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_image2, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setImage2_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setImage2_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_image2, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setImage2_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setImage2_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)maskToAlphaFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMaskToAlpha"));
}

+ (CIFilter)maximumComponentFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMaximumComponent"));
}

+ (CIFilter)minimumComponentFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMinimumComponent"));
}

+ (CIFilter)paletteCentroidFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPaletteCentroid"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__paletteCentroidFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (paletteCentroidFilter_onceToken != -1)
    dispatch_once(&paletteCentroidFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__paletteCentroidFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_paletteImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_paletteImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_paletteImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setPaletteImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setPaletteImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_paletteImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setPaletteImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_perceptual, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v11, sel_setPerceptual_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)palettizeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPalettize"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__palettizeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (palettizeFilter_onceToken != -1)
    dispatch_once(&palettizeFilter_onceToken, block);
  return v2;
}

objc_class *__37__CIFilter_Builtins__palettizeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_paletteImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_paletteImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_paletteImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setPaletteImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setPaletteImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_paletteImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setPaletteImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_perceptual, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v11, sel_setPerceptual_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectChromeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPhotoEffectChrome"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__photoEffectChromeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (photoEffectChromeFilter_onceToken != -1)
    dispatch_once(&photoEffectChromeFilter_onceToken, block);
  return v2;
}

objc_class *__45__CIFilter_Builtins__photoEffectChromeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v6, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectFadeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPhotoEffectFade"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__photoEffectFadeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (photoEffectFadeFilter_onceToken != -1)
    dispatch_once(&photoEffectFadeFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__photoEffectFadeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v6, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectInstantFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPhotoEffectInstant"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__photoEffectInstantFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (photoEffectInstantFilter_onceToken != -1)
    dispatch_once(&photoEffectInstantFilter_onceToken, block);
  return v2;
}

objc_class *__46__CIFilter_Builtins__photoEffectInstantFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v6, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectMonoFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPhotoEffectMono"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__photoEffectMonoFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (photoEffectMonoFilter_onceToken != -1)
    dispatch_once(&photoEffectMonoFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__photoEffectMonoFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v6, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectNoirFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPhotoEffectNoir"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__photoEffectNoirFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (photoEffectNoirFilter_onceToken != -1)
    dispatch_once(&photoEffectNoirFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__photoEffectNoirFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v6, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectProcessFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPhotoEffectProcess"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__photoEffectProcessFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (photoEffectProcessFilter_onceToken != -1)
    dispatch_once(&photoEffectProcessFilter_onceToken, block);
  return v2;
}

objc_class *__46__CIFilter_Builtins__photoEffectProcessFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v6, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectTonalFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPhotoEffectTonal"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__photoEffectTonalFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (photoEffectTonalFilter_onceToken != -1)
    dispatch_once(&photoEffectTonalFilter_onceToken, block);
  return v2;
}

objc_class *__44__CIFilter_Builtins__photoEffectTonalFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v6, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectTransferFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPhotoEffectTransfer"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__photoEffectTransferFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (photoEffectTransferFilter_onceToken != -1)
    dispatch_once(&photoEffectTransferFilter_onceToken, block);
  return v2;
}

objc_class *__47__CIFilter_Builtins__photoEffectTransferFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v6, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)sepiaToneFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISepiaTone"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__sepiaToneFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (sepiaToneFilter_onceToken != -1)
    dispatch_once(&sepiaToneFilter_onceToken, block);
  return v2;
}

objc_class *__37__CIFilter_Builtins__sepiaToneFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)thermalFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIThermal"));
}

+ (CIFilter)vignetteFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIVignette"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CIFilter_Builtins__vignetteFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (vignetteFilter_onceToken != -1)
    dispatch_once(&vignetteFilter_onceToken, block);
  return v2;
}

objc_class *__36__CIFilter_Builtins__vignetteFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_intensity, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)vignetteEffectFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIVignetteEffect"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__vignetteEffectFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (vignetteEffectFilter_onceToken != -1)
    dispatch_once(&vignetteEffectFilter_onceToken, block);
  return v2;
}

objc_class *__42__CIFilter_Builtins__vignetteEffectFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_intensity, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_falloff, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setFalloff_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)xRayFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIXRay"));
}

+ (CIFilter)bumpDistortionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBumpDistortion"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__bumpDistortionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (bumpDistortionFilter_onceToken != -1)
    dispatch_once(&bumpDistortionFilter_onceToken, block);
  return v2;
}

objc_class *__42__CIFilter_Builtins__bumpDistortionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)bumpDistortionLinearFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBumpDistortionLinear"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__bumpDistortionLinearFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (bumpDistortionLinearFilter_onceToken != -1)
    dispatch_once(&bumpDistortionLinearFilter_onceToken, block);
  return v2;
}

objc_class *__48__CIFilter_Builtins__bumpDistortionLinearFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)circleSplashDistortionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICircleSplashDistortion"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CIFilter_Builtins__circleSplashDistortionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (circleSplashDistortionFilter_onceToken != -1)
    dispatch_once(&circleSplashDistortionFilter_onceToken, block);
  return v2;
}

objc_class *__50__CIFilter_Builtins__circleSplashDistortionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)circularWrapFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICircularWrap"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__circularWrapFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (circularWrapFilter_onceToken != -1)
    dispatch_once(&circularWrapFilter_onceToken, block);
  return v2;
}

objc_class *__40__CIFilter_Builtins__circularWrapFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)displacementDistortionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDisplacementDistortion"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CIFilter_Builtins__displacementDistortionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (displacementDistortionFilter_onceToken != -1)
    dispatch_once(&displacementDistortionFilter_onceToken, block);
  return v2;
}

objc_class *__50__CIFilter_Builtins__displacementDistortionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_displacementImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_displacementImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_displacementImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setDisplacementImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setDisplacementImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_displacementImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setDisplacementImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)drosteFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDroste"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CIFilter_Builtins__drosteFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (drosteFilter_onceToken != -1)
    dispatch_once(&drosteFilter_onceToken, block);
  return v2;
}

objc_class *__34__CIFilter_Builtins__drosteFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *result;
  objc_class *v16;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_insetPoint0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setInsetPoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_insetPoint1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setInsetPoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_strands, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setStrands_, (IMP)floatSetter, "v@:f");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_periodicity, (IMP)floatGetter, "f@:");
    class_addMethod(v12, sel_setPeriodicity_, (IMP)floatSetter, "v@:f");
  }
  v13 = (objc_class *)objc_opt_class();
  if (v13)
  {
    v14 = v13;
    class_addMethod(v13, sel_rotation, (IMP)floatGetter, "f@:");
    class_addMethod(v14, sel_setRotation_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v16 = result;
    class_addMethod(result, sel_zoom, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v16, sel_setZoom_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)glassDistortionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIGlassDistortion"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__glassDistortionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (glassDistortionFilter_onceToken != -1)
    dispatch_once(&glassDistortionFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__glassDistortionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *v10;
  objc_class *v11;
  objc_class *result;
  objc_class *v13;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_textureImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_textureImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_textureImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTextureImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setTextureImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_textureImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setTextureImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    v11 = v10;
    class_addMethod(v10, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v11, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v13 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)glassLozengeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIGlassLozenge"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__glassLozengeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (glassLozengeFilter_onceToken != -1)
    dispatch_once(&glassLozengeFilter_onceToken, block);
  return v2;
}

objc_class *__40__CIFilter_Builtins__glassLozengeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_point0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setPoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_point1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setPoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_refraction, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setRefraction_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)holeDistortionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIHoleDistortion"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__holeDistortionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (holeDistortionFilter_onceToken != -1)
    dispatch_once(&holeDistortionFilter_onceToken, block);
  return v2;
}

objc_class *__42__CIFilter_Builtins__holeDistortionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)lightTunnelFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CILightTunnel"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__lightTunnelFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (lightTunnelFilter_onceToken != -1)
    dispatch_once(&lightTunnelFilter_onceToken, block);
  return v2;
}

objc_class *__39__CIFilter_Builtins__lightTunnelFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_rotation, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setRotation_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)ninePartStretchedFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CINinePartStretched"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__ninePartStretchedFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (ninePartStretchedFilter_onceToken != -1)
    dispatch_once(&ninePartStretchedFilter_onceToken, block);
  return v2;
}

objc_class *__45__CIFilter_Builtins__ninePartStretchedFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_breakpoint0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setBreakpoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_breakpoint1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setBreakpoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_growAmount, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v10, sel_setGrowAmount_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)ninePartTiledFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CINinePartTiled"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__ninePartTiledFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (ninePartTiledFilter_onceToken != -1)
    dispatch_once(&ninePartTiledFilter_onceToken, block);
  return v2;
}

objc_class *__41__CIFilter_Builtins__ninePartTiledFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_breakpoint0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setBreakpoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_breakpoint1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setBreakpoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_growAmount, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v10, sel_setGrowAmount_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_flipYTiles, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v12, sel_setFlipYTiles_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)pinchDistortionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPinchDistortion"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__pinchDistortionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (pinchDistortionFilter_onceToken != -1)
    dispatch_once(&pinchDistortionFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__pinchDistortionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)stretchCropFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIStretchCrop"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__stretchCropFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (stretchCropFilter_onceToken != -1)
    dispatch_once(&stretchCropFilter_onceToken, block);
  return v2;
}

objc_class *__39__CIFilter_Builtins__stretchCropFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_size, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setSize_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_cropAmount, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setCropAmount_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_centerStretchAmount, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setCenterStretchAmount_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)torusLensDistortionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CITorusLensDistortion"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__torusLensDistortionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (torusLensDistortionFilter_onceToken != -1)
    dispatch_once(&torusLensDistortionFilter_onceToken, block);
  return v2;
}

objc_class *__47__CIFilter_Builtins__torusLensDistortionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_refraction, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setRefraction_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)twirlDistortionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CITwirlDistortion"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__twirlDistortionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (twirlDistortionFilter_onceToken != -1)
    dispatch_once(&twirlDistortionFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__twirlDistortionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)vortexDistortionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIVortexDistortion"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__vortexDistortionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (vortexDistortionFilter_onceToken != -1)
    dispatch_once(&vortexDistortionFilter_onceToken, block);
  return v2;
}

objc_class *__44__CIFilter_Builtins__vortexDistortionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)affineClampFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAffineClamp"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__affineClampFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (affineClampFilter_onceToken != -1)
    dispatch_once(&affineClampFilter_onceToken, block);
  return v2;
}

objc_class *__39__CIFilter_Builtins__affineClampFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_transform, (IMP)transformGetter, "{CGAffineTransform=dddddd}@:");
    return (objc_class *)class_addMethod(v6, sel_setTransform_, (IMP)transformSetter, "v@:{CGAffineTransform=dddddd}");
  }
  return result;
}

+ (CIFilter)affineTileFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAffineTile"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__affineTileFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (affineTileFilter_onceToken != -1)
    dispatch_once(&affineTileFilter_onceToken, block);
  return v2;
}

objc_class *__38__CIFilter_Builtins__affineTileFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_transform, (IMP)transformGetter, "{CGAffineTransform=dddddd}@:");
    return (objc_class *)class_addMethod(v6, sel_setTransform_, (IMP)transformSetter, "v@:{CGAffineTransform=dddddd}");
  }
  return result;
}

+ (CIFilter)eightfoldReflectedTileFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIEightfoldReflectedTile"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CIFilter_Builtins__eightfoldReflectedTileFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (eightfoldReflectedTileFilter_onceToken != -1)
    dispatch_once(&eightfoldReflectedTileFilter_onceToken, block);
  return v2;
}

objc_class *__50__CIFilter_Builtins__eightfoldReflectedTileFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)fourfoldReflectedTileFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIFourfoldReflectedTile"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__fourfoldReflectedTileFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (fourfoldReflectedTileFilter_onceToken != -1)
    dispatch_once(&fourfoldReflectedTileFilter_onceToken, block);
  return v2;
}

objc_class *__49__CIFilter_Builtins__fourfoldReflectedTileFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_acuteAngle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setAcuteAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)fourfoldRotatedTileFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIFourfoldRotatedTile"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__fourfoldRotatedTileFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (fourfoldRotatedTileFilter_onceToken != -1)
    dispatch_once(&fourfoldRotatedTileFilter_onceToken, block);
  return v2;
}

objc_class *__47__CIFilter_Builtins__fourfoldRotatedTileFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)fourfoldTranslatedTileFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIFourfoldTranslatedTile"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CIFilter_Builtins__fourfoldTranslatedTileFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (fourfoldTranslatedTileFilter_onceToken != -1)
    dispatch_once(&fourfoldTranslatedTileFilter_onceToken, block);
  return v2;
}

objc_class *__50__CIFilter_Builtins__fourfoldTranslatedTileFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_acuteAngle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setAcuteAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)glideReflectedTileFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIGlideReflectedTile"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__glideReflectedTileFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (glideReflectedTileFilter_onceToken != -1)
    dispatch_once(&glideReflectedTileFilter_onceToken, block);
  return v2;
}

objc_class *__46__CIFilter_Builtins__glideReflectedTileFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)kaleidoscopeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIKaleidoscope"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__kaleidoscopeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (kaleidoscopeFilter_onceToken != -1)
    dispatch_once(&kaleidoscopeFilter_onceToken, block);
  return v2;
}

objc_class *__40__CIFilter_Builtins__kaleidoscopeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_count, (IMP)intGetter, "q@:");
    class_addMethod(v6, sel_setCount_, (IMP)intSetter, "v@:q}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)opTileFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIOpTile"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CIFilter_Builtins__opTileFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (opTileFilter_onceToken != -1)
    dispatch_once(&opTileFilter_onceToken, block);
  return v2;
}

objc_class *__34__CIFilter_Builtins__opTileFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)parallelogramTileFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIParallelogramTile"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__parallelogramTileFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (parallelogramTileFilter_onceToken != -1)
    dispatch_once(&parallelogramTileFilter_onceToken, block);
  return v2;
}

objc_class *__45__CIFilter_Builtins__parallelogramTileFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_acuteAngle, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setAcuteAngle_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)perspectiveTileFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPerspectiveTile"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__perspectiveTileFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (perspectiveTileFilter_onceToken != -1)
    dispatch_once(&perspectiveTileFilter_onceToken, block);
  return v2;
}

objc_class *__43__CIFilter_Builtins__perspectiveTileFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v10, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v12, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)sixfoldReflectedTileFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISixfoldReflectedTile"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__sixfoldReflectedTileFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (sixfoldReflectedTileFilter_onceToken != -1)
    dispatch_once(&sixfoldReflectedTileFilter_onceToken, block);
  return v2;
}

objc_class *__48__CIFilter_Builtins__sixfoldReflectedTileFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)sixfoldRotatedTileFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISixfoldRotatedTile"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__sixfoldRotatedTileFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (sixfoldRotatedTileFilter_onceToken != -1)
    dispatch_once(&sixfoldRotatedTileFilter_onceToken, block);
  return v2;
}

objc_class *__46__CIFilter_Builtins__sixfoldRotatedTileFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)triangleKaleidoscopeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CITriangleKaleidoscope"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__triangleKaleidoscopeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (triangleKaleidoscopeFilter_onceToken != -1)
    dispatch_once(&triangleKaleidoscopeFilter_onceToken, block);
  return v2;
}

objc_class *__48__CIFilter_Builtins__triangleKaleidoscopeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_point, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setPoint_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_size, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setSize_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_rotation, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setRotation_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_decay, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setDecay_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)triangleTileFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CITriangleTile"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__triangleTileFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (triangleTileFilter_onceToken != -1)
    dispatch_once(&triangleTileFilter_onceToken, block);
  return v2;
}

objc_class *__40__CIFilter_Builtins__triangleTileFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)twelvefoldReflectedTileFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CITwelvefoldReflectedTile"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__twelvefoldReflectedTileFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (twelvefoldReflectedTileFilter_onceToken != -1)
    dispatch_once(&twelvefoldReflectedTileFilter_onceToken, block);
  return v2;
}

objc_class *__51__CIFilter_Builtins__twelvefoldReflectedTileFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)attributedTextImageGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAttributedTextImageGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CIFilter_Builtins__attributedTextImageGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (attributedTextImageGeneratorFilter_onceToken != -1)
    dispatch_once(&attributedTextImageGeneratorFilter_onceToken, block);
  return v2;
}

objc_class *__56__CIFilter_Builtins__attributedTextImageGeneratorFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_text), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_text);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_text, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setText_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setText_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_text, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setText_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_scaleFactor, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setScaleFactor_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_padding, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setPadding_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)aztecCodeGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAztecCodeGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__aztecCodeGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (aztecCodeGeneratorFilter_onceToken != -1)
    dispatch_once(&aztecCodeGeneratorFilter_onceToken, block);
  return v2;
}

objc_class *__46__CIFilter_Builtins__aztecCodeGeneratorFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_message), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_message);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_message, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setMessage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setMessage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_message, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setMessage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_correctionLevel, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setCorrectionLevel_, (IMP)floatSetter, "v@:f");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_layers, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setLayers_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_compactStyle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setCompactStyle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)barcodeGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBarcodeGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__barcodeGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (barcodeGeneratorFilter_onceToken != -1)
    dispatch_once(&barcodeGeneratorFilter_onceToken, block);
  return v2;
}

uint64_t __44__CIFilter_Builtins__barcodeGeneratorFilter__block_invoke()
{
  uint64_t result;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);

  result = objc_opt_class();
  if (result)
  {
    v1 = (void *)result;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_barcodeDescriptor), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_barcodeDescriptor);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_barcodeDescriptor, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v1, "instancesRespondToSelector:", sel_setBarcodeDescriptor_);
      if ((result & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v1, sel_setBarcodeDescriptor_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_barcodeDescriptor, (IMP)objGetter, "@@:");
      result = objc_msgSend(v1, "instancesRespondToSelector:", sel_setBarcodeDescriptor_);
      if ((result & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        return class_addMethod((Class)v1, sel_setBarcodeDescriptor_, v4, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)blurredRectangleGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBlurredRectangleGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CIFilter_Builtins__blurredRectangleGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (blurredRectangleGeneratorFilter_onceToken != -1)
    dispatch_once(&blurredRectangleGeneratorFilter_onceToken, block);
  return v2;
}

uint64_t __53__CIFilter_Builtins__blurredRectangleGeneratorFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  uint64_t result;
  void *v5;
  _BOOL4 v6;
  char v7;
  void (*v8)(void);

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v1, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    v3 = v2;
    class_addMethod(v2, sel_sigma, (IMP)floatGetter, "f@:");
    class_addMethod(v3, sel_setSigma_, (IMP)floatSetter, "v@:f");
  }
  result = objc_opt_class();
  if (result)
  {
    v5 = (void *)result;
    v6 = -[NSString isEqualToString:](NSStringFromSelector(sel_color), "isEqualToString:", CFSTR("inputImage"));
    v7 = objc_msgSend(v5, "instancesRespondToSelector:", sel_color);
    if (v6)
    {
      if ((v7 & 1) == 0)
        class_addMethod((Class)v5, sel_color, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v5, "instancesRespondToSelector:", sel_setColor_);
      if ((result & 1) == 0)
      {
        v8 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v5, sel_setColor_, v8, "v@:@");
      }
    }
    else
    {
      if ((v7 & 1) == 0)
        class_addMethod((Class)v5, sel_color, (IMP)objGetter, "@@:");
      result = objc_msgSend(v5, "instancesRespondToSelector:", sel_setColor_);
      if ((result & 1) == 0)
      {
        v8 = (void (*)(void))objSetter;
        return class_addMethod((Class)v5, sel_setColor_, v8, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)checkerboardGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICheckerboardGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__checkerboardGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (checkerboardGeneratorFilter_onceToken != -1)
    dispatch_once(&checkerboardGeneratorFilter_onceToken, block);
  return v2;
}

objc_class *__49__CIFilter_Builtins__checkerboardGeneratorFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  _BOOL4 v4;
  char v5;
  void (*v6)(void);
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  char v10;
  void (*v11)(void);
  objc_class *v12;
  objc_class *v13;
  objc_class *result;
  objc_class *v15;

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v2 = objc_opt_class();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = -[NSString isEqualToString:](NSStringFromSelector(sel_color0), "isEqualToString:", CFSTR("inputImage"));
    v5 = objc_msgSend(v3, "instancesRespondToSelector:", sel_color0);
    if (v4)
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color0, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
      {
        v6 = (void (*)(void))iiSetter;
LABEL_13:
        class_addMethod((Class)v3, sel_setColor0_, v6, "v@:@");
      }
    }
    else
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color0, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
      {
        v6 = (void (*)(void))objSetter;
        goto LABEL_13;
      }
    }
  }
  v7 = objc_opt_class();
  if (!v7)
    goto LABEL_25;
  v8 = (void *)v7;
  v9 = -[NSString isEqualToString:](NSStringFromSelector(sel_color1), "isEqualToString:", CFSTR("inputImage"));
  v10 = objc_msgSend(v8, "instancesRespondToSelector:", sel_color1);
  if (v9)
  {
    if ((v10 & 1) == 0)
      class_addMethod((Class)v8, sel_color1, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v8, "instancesRespondToSelector:", sel_setColor1_) & 1) == 0)
    {
      v11 = (void (*)(void))iiSetter;
LABEL_24:
      class_addMethod((Class)v8, sel_setColor1_, v11, "v@:@");
    }
  }
  else
  {
    if ((v10 & 1) == 0)
      class_addMethod((Class)v8, sel_color1, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v8, "instancesRespondToSelector:", sel_setColor1_) & 1) == 0)
    {
      v11 = (void (*)(void))objSetter;
      goto LABEL_24;
    }
  }
LABEL_25:
  v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    v13 = v12;
    class_addMethod(v12, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v15 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v15, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)code128BarcodeGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICode128BarcodeGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__code128BarcodeGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (code128BarcodeGeneratorFilter_onceToken != -1)
    dispatch_once(&code128BarcodeGeneratorFilter_onceToken, block);
  return v2;
}

objc_class *__51__CIFilter_Builtins__code128BarcodeGeneratorFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_message), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_message);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_message, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setMessage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setMessage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_message, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setMessage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_quietSpace, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setQuietSpace_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_barcodeHeight, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setBarcodeHeight_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)lenticularHaloGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CILenticularHaloGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__lenticularHaloGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (lenticularHaloGeneratorFilter_onceToken != -1)
    dispatch_once(&lenticularHaloGeneratorFilter_onceToken, block);
  return v2;
}

objc_class *__51__CIFilter_Builtins__lenticularHaloGeneratorFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  _BOOL4 v4;
  char v5;
  void (*v6)(void);
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *result;
  objc_class *v18;

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v2 = objc_opt_class();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = -[NSString isEqualToString:](NSStringFromSelector(sel_color), "isEqualToString:", CFSTR("inputImage"));
    v5 = objc_msgSend(v3, "instancesRespondToSelector:", sel_color);
    if (v4)
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v6 = (void (*)(void))iiSetter;
LABEL_13:
        class_addMethod((Class)v3, sel_setColor_, v6, "v@:@");
      }
    }
    else
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v6 = (void (*)(void))objSetter;
        goto LABEL_13;
      }
    }
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_haloRadius, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setHaloRadius_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_haloWidth, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setHaloWidth_, (IMP)floatSetter, "v@:f");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_haloOverlap, (IMP)floatGetter, "f@:");
    class_addMethod(v12, sel_setHaloOverlap_, (IMP)floatSetter, "v@:f");
  }
  v13 = (objc_class *)objc_opt_class();
  if (v13)
  {
    v14 = v13;
    class_addMethod(v13, sel_striationStrength, (IMP)floatGetter, "f@:");
    class_addMethod(v14, sel_setStriationStrength_, (IMP)floatSetter, "v@:f");
  }
  v15 = (objc_class *)objc_opt_class();
  if (v15)
  {
    v16 = v15;
    class_addMethod(v15, sel_striationContrast, (IMP)floatGetter, "f@:");
    class_addMethod(v16, sel_setStriationContrast_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v18 = result;
    class_addMethod(result, sel_time, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v18, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)meshGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMeshGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__meshGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (meshGeneratorFilter_onceToken != -1)
    dispatch_once(&meshGeneratorFilter_onceToken, block);
  return v2;
}

uint64_t __41__CIFilter_Builtins__meshGeneratorFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  _BOOL4 v4;
  char v5;
  void (*v6)(void);
  uint64_t result;
  void *v8;
  _BOOL4 v9;
  char v10;
  void (*v11)(void);

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v1, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  v2 = objc_opt_class();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = -[NSString isEqualToString:](NSStringFromSelector(sel_color), "isEqualToString:", CFSTR("inputImage"));
    v5 = objc_msgSend(v3, "instancesRespondToSelector:", sel_color);
    if (v4)
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v6 = (void (*)(void))iiSetter;
LABEL_13:
        class_addMethod((Class)v3, sel_setColor_, v6, "v@:@");
      }
    }
    else
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v6 = (void (*)(void))objSetter;
        goto LABEL_13;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v8 = (void *)result;
    v9 = -[NSString isEqualToString:](NSStringFromSelector(sel_mesh), "isEqualToString:", CFSTR("inputImage"));
    v10 = objc_msgSend(v8, "instancesRespondToSelector:", sel_mesh);
    if (v9)
    {
      if ((v10 & 1) == 0)
        class_addMethod((Class)v8, sel_mesh, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v8, "instancesRespondToSelector:", sel_setMesh_);
      if ((result & 1) == 0)
      {
        v11 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v8, sel_setMesh_, v11, "v@:@");
      }
    }
    else
    {
      if ((v10 & 1) == 0)
        class_addMethod((Class)v8, sel_mesh, (IMP)objGetter, "@@:");
      result = objc_msgSend(v8, "instancesRespondToSelector:", sel_setMesh_);
      if ((result & 1) == 0)
      {
        v11 = (void (*)(void))objSetter;
        return class_addMethod((Class)v8, sel_setMesh_, v11, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)PDF417BarcodeGenerator
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPDF417BarcodeGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__PDF417BarcodeGenerator__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (PDF417BarcodeGenerator_onceToken != -1)
    dispatch_once(&PDF417BarcodeGenerator_onceToken, block);
  return v2;
}

objc_class *__44__CIFilter_Builtins__PDF417BarcodeGenerator__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *v23;
  objc_class *v24;
  objc_class *result;
  objc_class *v26;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_message), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_message);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_message, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setMessage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setMessage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_message, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setMessage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_minWidth, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setMinWidth_, (IMP)floatSetter, "v@:f");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_maxWidth, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setMaxWidth_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_minHeight, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setMinHeight_, (IMP)floatSetter, "v@:f");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_maxHeight, (IMP)floatGetter, "f@:");
    class_addMethod(v12, sel_setMaxHeight_, (IMP)floatSetter, "v@:f");
  }
  v13 = (objc_class *)objc_opt_class();
  if (v13)
  {
    v14 = v13;
    class_addMethod(v13, sel_dataColumns, (IMP)floatGetter, "f@:");
    class_addMethod(v14, sel_setDataColumns_, (IMP)floatSetter, "v@:f");
  }
  v15 = (objc_class *)objc_opt_class();
  if (v15)
  {
    v16 = v15;
    class_addMethod(v15, sel_rows, (IMP)floatGetter, "f@:");
    class_addMethod(v16, sel_setRows_, (IMP)floatSetter, "v@:f");
  }
  v17 = (objc_class *)objc_opt_class();
  if (v17)
  {
    v18 = v17;
    class_addMethod(v17, sel_preferredAspectRatio, (IMP)floatGetter, "f@:");
    class_addMethod(v18, sel_setPreferredAspectRatio_, (IMP)floatSetter, "v@:f");
  }
  v19 = (objc_class *)objc_opt_class();
  if (v19)
  {
    v20 = v19;
    class_addMethod(v19, sel_compactionMode, (IMP)floatGetter, "f@:");
    class_addMethod(v20, sel_setCompactionMode_, (IMP)floatSetter, "v@:f");
  }
  v21 = (objc_class *)objc_opt_class();
  if (v21)
  {
    v22 = v21;
    class_addMethod(v21, sel_compactStyle, (IMP)floatGetter, "f@:");
    class_addMethod(v22, sel_setCompactStyle_, (IMP)floatSetter, "v@:f");
  }
  v23 = (objc_class *)objc_opt_class();
  if (v23)
  {
    v24 = v23;
    class_addMethod(v23, sel_correctionLevel, (IMP)floatGetter, "f@:");
    class_addMethod(v24, sel_setCorrectionLevel_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v26 = result;
    class_addMethod(result, sel_alwaysSpecifyCompaction, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v26, sel_setAlwaysSpecifyCompaction_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)QRCodeGenerator
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIQRCodeGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__QRCodeGenerator__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (QRCodeGenerator_onceToken != -1)
    dispatch_once(&QRCodeGenerator_onceToken, block);
  return v2;
}

uint64_t __37__CIFilter_Builtins__QRCodeGenerator__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t result;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_message), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_message);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_message, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setMessage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setMessage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_message, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setMessage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  result = objc_opt_class();
  if (result)
  {
    v6 = (void *)result;
    v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_correctionLevel), "isEqualToString:", CFSTR("inputImage"));
    v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_correctionLevel);
    if (v7)
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_correctionLevel, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setCorrectionLevel_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v6, sel_setCorrectionLevel_, v9, "v@:@");
      }
    }
    else
    {
      if ((v8 & 1) == 0)
        class_addMethod((Class)v6, sel_correctionLevel, (IMP)objGetter, "@@:");
      result = objc_msgSend(v6, "instancesRespondToSelector:", sel_setCorrectionLevel_);
      if ((result & 1) == 0)
      {
        v9 = (void (*)(void))objSetter;
        return class_addMethod((Class)v6, sel_setCorrectionLevel_, v9, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)randomGeneratorFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIRandomGenerator"));
}

+ (CIFilter)roundedRectangleGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIRoundedRectangleGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CIFilter_Builtins__roundedRectangleGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (roundedRectangleGeneratorFilter_onceToken != -1)
    dispatch_once(&roundedRectangleGeneratorFilter_onceToken, block);
  return v2;
}

uint64_t __53__CIFilter_Builtins__roundedRectangleGeneratorFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  uint64_t result;
  void *v5;
  _BOOL4 v6;
  char v7;
  void (*v8)(void);

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v1, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    v3 = v2;
    class_addMethod(v2, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v3, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = objc_opt_class();
  if (result)
  {
    v5 = (void *)result;
    v6 = -[NSString isEqualToString:](NSStringFromSelector(sel_color), "isEqualToString:", CFSTR("inputImage"));
    v7 = objc_msgSend(v5, "instancesRespondToSelector:", sel_color);
    if (v6)
    {
      if ((v7 & 1) == 0)
        class_addMethod((Class)v5, sel_color, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v5, "instancesRespondToSelector:", sel_setColor_);
      if ((result & 1) == 0)
      {
        v8 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v5, sel_setColor_, v8, "v@:@");
      }
    }
    else
    {
      if ((v7 & 1) == 0)
        class_addMethod((Class)v5, sel_color, (IMP)objGetter, "@@:");
      result = objc_msgSend(v5, "instancesRespondToSelector:", sel_setColor_);
      if ((result & 1) == 0)
      {
        v8 = (void (*)(void))objSetter;
        return class_addMethod((Class)v5, sel_setColor_, v8, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)roundedRectangleStrokeGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIRoundedRectangleStrokeGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CIFilter_Builtins__roundedRectangleStrokeGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (roundedRectangleStrokeGeneratorFilter_onceToken != -1)
    dispatch_once(&roundedRectangleStrokeGeneratorFilter_onceToken, block);
  return v2;
}

uint64_t __59__CIFilter_Builtins__roundedRectangleStrokeGeneratorFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  uint64_t result;
  void *v7;
  _BOOL4 v8;
  char v9;
  void (*v10)(void);

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v1, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    v3 = v2;
    class_addMethod(v2, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v3, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  v4 = (objc_class *)objc_opt_class();
  if (v4)
  {
    v5 = v4;
    class_addMethod(v4, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v5, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = objc_opt_class();
  if (result)
  {
    v7 = (void *)result;
    v8 = -[NSString isEqualToString:](NSStringFromSelector(sel_color), "isEqualToString:", CFSTR("inputImage"));
    v9 = objc_msgSend(v7, "instancesRespondToSelector:", sel_color);
    if (v8)
    {
      if ((v9 & 1) == 0)
        class_addMethod((Class)v7, sel_color, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v7, "instancesRespondToSelector:", sel_setColor_);
      if ((result & 1) == 0)
      {
        v10 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v7, sel_setColor_, v10, "v@:@");
      }
    }
    else
    {
      if ((v9 & 1) == 0)
        class_addMethod((Class)v7, sel_color, (IMP)objGetter, "@@:");
      result = objc_msgSend(v7, "instancesRespondToSelector:", sel_setColor_);
      if ((result & 1) == 0)
      {
        v10 = (void (*)(void))objSetter;
        return class_addMethod((Class)v7, sel_setColor_, v10, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)starShineGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIStarShineGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__starShineGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (starShineGeneratorFilter_onceToken != -1)
    dispatch_once(&starShineGeneratorFilter_onceToken, block);
  return v2;
}

objc_class *__46__CIFilter_Builtins__starShineGeneratorFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  _BOOL4 v4;
  char v5;
  void (*v6)(void);
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *result;
  objc_class *v18;

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v2 = objc_opt_class();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = -[NSString isEqualToString:](NSStringFromSelector(sel_color), "isEqualToString:", CFSTR("inputImage"));
    v5 = objc_msgSend(v3, "instancesRespondToSelector:", sel_color);
    if (v4)
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v6 = (void (*)(void))iiSetter;
LABEL_13:
        class_addMethod((Class)v3, sel_setColor_, v6, "v@:@");
      }
    }
    else
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v6 = (void (*)(void))objSetter;
        goto LABEL_13;
      }
    }
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_crossScale, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setCrossScale_, (IMP)floatSetter, "v@:f");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_crossAngle, (IMP)floatGetter, "f@:");
    class_addMethod(v12, sel_setCrossAngle_, (IMP)floatSetter, "v@:f");
  }
  v13 = (objc_class *)objc_opt_class();
  if (v13)
  {
    v14 = v13;
    class_addMethod(v13, sel_crossOpacity, (IMP)floatGetter, "f@:");
    class_addMethod(v14, sel_setCrossOpacity_, (IMP)floatSetter, "v@:f");
  }
  v15 = (objc_class *)objc_opt_class();
  if (v15)
  {
    v16 = v15;
    class_addMethod(v15, sel_crossWidth, (IMP)floatGetter, "f@:");
    class_addMethod(v16, sel_setCrossWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v18 = result;
    class_addMethod(result, sel_epsilon, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v18, sel_setEpsilon_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)stripesGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIStripesGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__stripesGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (stripesGeneratorFilter_onceToken != -1)
    dispatch_once(&stripesGeneratorFilter_onceToken, block);
  return v2;
}

objc_class *__44__CIFilter_Builtins__stripesGeneratorFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  _BOOL4 v4;
  char v5;
  void (*v6)(void);
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  char v10;
  void (*v11)(void);
  objc_class *v12;
  objc_class *v13;
  objc_class *result;
  objc_class *v15;

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v2 = objc_opt_class();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = -[NSString isEqualToString:](NSStringFromSelector(sel_color0), "isEqualToString:", CFSTR("inputImage"));
    v5 = objc_msgSend(v3, "instancesRespondToSelector:", sel_color0);
    if (v4)
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color0, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
      {
        v6 = (void (*)(void))iiSetter;
LABEL_13:
        class_addMethod((Class)v3, sel_setColor0_, v6, "v@:@");
      }
    }
    else
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color0, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor0_) & 1) == 0)
      {
        v6 = (void (*)(void))objSetter;
        goto LABEL_13;
      }
    }
  }
  v7 = objc_opt_class();
  if (!v7)
    goto LABEL_25;
  v8 = (void *)v7;
  v9 = -[NSString isEqualToString:](NSStringFromSelector(sel_color1), "isEqualToString:", CFSTR("inputImage"));
  v10 = objc_msgSend(v8, "instancesRespondToSelector:", sel_color1);
  if (v9)
  {
    if ((v10 & 1) == 0)
      class_addMethod((Class)v8, sel_color1, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v8, "instancesRespondToSelector:", sel_setColor1_) & 1) == 0)
    {
      v11 = (void (*)(void))iiSetter;
LABEL_24:
      class_addMethod((Class)v8, sel_setColor1_, v11, "v@:@");
    }
  }
  else
  {
    if ((v10 & 1) == 0)
      class_addMethod((Class)v8, sel_color1, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v8, "instancesRespondToSelector:", sel_setColor1_) & 1) == 0)
    {
      v11 = (void (*)(void))objSetter;
      goto LABEL_24;
    }
  }
LABEL_25:
  v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    v13 = v12;
    class_addMethod(v12, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v15 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v15, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)sunbeamsGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISunbeamsGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__sunbeamsGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (sunbeamsGeneratorFilter_onceToken != -1)
    dispatch_once(&sunbeamsGeneratorFilter_onceToken, block);
  return v2;
}

objc_class *__45__CIFilter_Builtins__sunbeamsGeneratorFilter__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  _BOOL4 v4;
  char v5;
  void (*v6)(void);
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *result;
  objc_class *v16;

  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v2 = objc_opt_class();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = -[NSString isEqualToString:](NSStringFromSelector(sel_color), "isEqualToString:", CFSTR("inputImage"));
    v5 = objc_msgSend(v3, "instancesRespondToSelector:", sel_color);
    if (v4)
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v6 = (void (*)(void))iiSetter;
LABEL_13:
        class_addMethod((Class)v3, sel_setColor_, v6, "v@:@");
      }
    }
    else
    {
      if ((v5 & 1) == 0)
        class_addMethod((Class)v3, sel_color, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v3, "instancesRespondToSelector:", sel_setColor_) & 1) == 0)
      {
        v6 = (void (*)(void))objSetter;
        goto LABEL_13;
      }
    }
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_sunRadius, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setSunRadius_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_maxStriationRadius, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setMaxStriationRadius_, (IMP)floatSetter, "v@:f");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_striationStrength, (IMP)floatGetter, "f@:");
    class_addMethod(v12, sel_setStriationStrength_, (IMP)floatSetter, "v@:f");
  }
  v13 = (objc_class *)objc_opt_class();
  if (v13)
  {
    v14 = v13;
    class_addMethod(v13, sel_striationContrast, (IMP)floatGetter, "f@:");
    class_addMethod(v14, sel_setStriationContrast_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v16 = result;
    class_addMethod(result, sel_time, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v16, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)textImageGeneratorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CITextImageGenerator"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__textImageGeneratorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (textImageGeneratorFilter_onceToken != -1)
    dispatch_once(&textImageGeneratorFilter_onceToken, block);
  return v2;
}

objc_class *__46__CIFilter_Builtins__textImageGeneratorFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *result;
  objc_class *v15;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_text), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_text);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_text, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setText_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setText_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_text, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setText_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_fontName), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_fontName);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_fontName, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setFontName_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setFontName_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_fontName, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setFontName_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    v11 = v10;
    class_addMethod(v10, sel_fontSize, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setFontSize_, (IMP)floatSetter, "v@:f");
  }
  v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    v13 = v12;
    class_addMethod(v12, sel_scaleFactor, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setScaleFactor_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v15 = result;
    class_addMethod(result, sel_padding, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v15, sel_setPadding_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)blendWithAlphaMaskFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBlendWithAlphaMask"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__blendWithAlphaMaskFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (blendWithAlphaMaskFilter_onceToken != -1)
    dispatch_once(&blendWithAlphaMaskFilter_onceToken, block);
  return v2;
}

uint64_t __46__CIFilter_Builtins__blendWithAlphaMaskFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t result;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = objc_opt_class();
  if (result)
  {
    v11 = (void *)result;
    v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_maskImage), "isEqualToString:", CFSTR("inputImage"));
    v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_maskImage);
    if (v12)
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_maskImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setMaskImage_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v11, sel_setMaskImage_, v14, "v@:@");
      }
    }
    else
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_maskImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setMaskImage_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))objSetter;
        return class_addMethod((Class)v11, sel_setMaskImage_, v14, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)blendWithBlueMaskFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBlendWithBlueMask"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__blendWithBlueMaskFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (blendWithBlueMaskFilter_onceToken != -1)
    dispatch_once(&blendWithBlueMaskFilter_onceToken, block);
  return v2;
}

uint64_t __45__CIFilter_Builtins__blendWithBlueMaskFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t result;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = objc_opt_class();
  if (result)
  {
    v11 = (void *)result;
    v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_maskImage), "isEqualToString:", CFSTR("inputImage"));
    v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_maskImage);
    if (v12)
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_maskImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setMaskImage_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v11, sel_setMaskImage_, v14, "v@:@");
      }
    }
    else
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_maskImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setMaskImage_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))objSetter;
        return class_addMethod((Class)v11, sel_setMaskImage_, v14, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)blendWithMaskFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBlendWithMask"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__blendWithMaskFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (blendWithMaskFilter_onceToken != -1)
    dispatch_once(&blendWithMaskFilter_onceToken, block);
  return v2;
}

uint64_t __41__CIFilter_Builtins__blendWithMaskFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t result;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = objc_opt_class();
  if (result)
  {
    v11 = (void *)result;
    v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_maskImage), "isEqualToString:", CFSTR("inputImage"));
    v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_maskImage);
    if (v12)
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_maskImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setMaskImage_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v11, sel_setMaskImage_, v14, "v@:@");
      }
    }
    else
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_maskImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setMaskImage_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))objSetter;
        return class_addMethod((Class)v11, sel_setMaskImage_, v14, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)blendWithRedMaskFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBlendWithRedMask"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__blendWithRedMaskFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (blendWithRedMaskFilter_onceToken != -1)
    dispatch_once(&blendWithRedMaskFilter_onceToken, block);
  return v2;
}

uint64_t __44__CIFilter_Builtins__blendWithRedMaskFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t result;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = objc_opt_class();
  if (result)
  {
    v11 = (void *)result;
    v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_maskImage), "isEqualToString:", CFSTR("inputImage"));
    v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_maskImage);
    if (v12)
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_maskImage, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setMaskImage_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v11, sel_setMaskImage_, v14, "v@:@");
      }
    }
    else
    {
      if ((v13 & 1) == 0)
        class_addMethod((Class)v11, sel_maskImage, (IMP)objGetter, "@@:");
      result = objc_msgSend(v11, "instancesRespondToSelector:", sel_setMaskImage_);
      if ((result & 1) == 0)
      {
        v14 = (void (*)(void))objSetter;
        return class_addMethod((Class)v11, sel_setMaskImage_, v14, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)bloomFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBloom"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CIFilter_Builtins__bloomFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (bloomFilter_onceToken != -1)
    dispatch_once(&bloomFilter_onceToken, block);
  return v2;
}

objc_class *__33__CIFilter_Builtins__bloomFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)cannyEdgeDetectorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICannyEdgeDetector"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__cannyEdgeDetectorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (cannyEdgeDetectorFilter_onceToken != -1)
    dispatch_once(&cannyEdgeDetectorFilter_onceToken, block);
  return v2;
}

objc_class *__45__CIFilter_Builtins__cannyEdgeDetectorFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *result;
  objc_class *v14;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_gaussianSigma, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setGaussianSigma_, (IMP)floatSetter, "v@:f");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_perceptual, (IMP)BOOLGetter, "B@:");
    class_addMethod(v8, sel_setPerceptual_, (IMP)BOOLSetter, "v@:B}");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_thresholdHigh, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setThresholdHigh_, (IMP)floatSetter, "v@:f");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_thresholdLow, (IMP)floatGetter, "f@:");
    class_addMethod(v12, sel_setThresholdLow_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v14 = result;
    class_addMethod(result, sel_hysteresisPasses, (IMP)intGetter, "q@:");
    return (objc_class *)class_addMethod(v14, sel_setHysteresisPasses_, (IMP)intSetter, "v@:q}");
  }
  return result;
}

+ (CIFilter)comicEffectFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIComicEffect"));
}

+ (CIFilter)convolution3X3Filter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConvolution3X3"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__convolution3X3Filter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (convolution3X3Filter_onceToken != -1)
    dispatch_once(&convolution3X3Filter_onceToken, block);
  return v2;
}

objc_class *__42__CIFilter_Builtins__convolution3X3Filter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_weights), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_weights);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setWeights_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolution5X5Filter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConvolution5X5"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__convolution5X5Filter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (convolution5X5Filter_onceToken != -1)
    dispatch_once(&convolution5X5Filter_onceToken, block);
  return v2;
}

objc_class *__42__CIFilter_Builtins__convolution5X5Filter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_weights), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_weights);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setWeights_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolution7X7Filter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConvolution7X7"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__convolution7X7Filter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (convolution7X7Filter_onceToken != -1)
    dispatch_once(&convolution7X7Filter_onceToken, block);
  return v2;
}

objc_class *__42__CIFilter_Builtins__convolution7X7Filter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_weights), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_weights);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setWeights_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolution9HorizontalFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConvolution9Horizontal"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CIFilter_Builtins__convolution9HorizontalFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (convolution9HorizontalFilter_onceToken != -1)
    dispatch_once(&convolution9HorizontalFilter_onceToken, block);
  return v2;
}

objc_class *__50__CIFilter_Builtins__convolution9HorizontalFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_weights), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_weights);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setWeights_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolution9VerticalFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConvolution9Vertical"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__convolution9VerticalFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (convolution9VerticalFilter_onceToken != -1)
    dispatch_once(&convolution9VerticalFilter_onceToken, block);
  return v2;
}

objc_class *__48__CIFilter_Builtins__convolution9VerticalFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_weights), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_weights);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setWeights_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolutionRGB3X3Filter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConvolutionRGB3X3"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__convolutionRGB3X3Filter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (convolutionRGB3X3Filter_onceToken != -1)
    dispatch_once(&convolutionRGB3X3Filter_onceToken, block);
  return v2;
}

objc_class *__45__CIFilter_Builtins__convolutionRGB3X3Filter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_weights), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_weights);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setWeights_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolutionRGB5X5Filter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConvolutionRGB5X5"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__convolutionRGB5X5Filter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (convolutionRGB5X5Filter_onceToken != -1)
    dispatch_once(&convolutionRGB5X5Filter_onceToken, block);
  return v2;
}

objc_class *__45__CIFilter_Builtins__convolutionRGB5X5Filter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_weights), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_weights);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setWeights_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolutionRGB7X7Filter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConvolutionRGB7X7"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__convolutionRGB7X7Filter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (convolutionRGB7X7Filter_onceToken != -1)
    dispatch_once(&convolutionRGB7X7Filter_onceToken, block);
  return v2;
}

objc_class *__45__CIFilter_Builtins__convolutionRGB7X7Filter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_weights), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_weights);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setWeights_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolutionRGB9HorizontalFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConvolutionRGB9Horizontal"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CIFilter_Builtins__convolutionRGB9HorizontalFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (convolutionRGB9HorizontalFilter_onceToken != -1)
    dispatch_once(&convolutionRGB9HorizontalFilter_onceToken, block);
  return v2;
}

objc_class *__53__CIFilter_Builtins__convolutionRGB9HorizontalFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_weights), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_weights);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setWeights_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolutionRGB9VerticalFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConvolutionRGB9Vertical"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__convolutionRGB9VerticalFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (convolutionRGB9VerticalFilter_onceToken != -1)
    dispatch_once(&convolutionRGB9VerticalFilter_onceToken, block);
  return v2;
}

objc_class *__51__CIFilter_Builtins__convolutionRGB9VerticalFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_weights), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_weights);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setWeights_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_weights, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setWeights_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)coreMLModelFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICoreMLModelFilter"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__coreMLModelFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (coreMLModelFilter_onceToken != -1)
    dispatch_once(&coreMLModelFilter_onceToken, block);
  return v2;
}

objc_class *__39__CIFilter_Builtins__coreMLModelFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *v10;
  objc_class *v11;
  objc_class *result;
  objc_class *v13;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_model), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_model);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_model, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setModel_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setModel_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_model, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setModel_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    v11 = v10;
    class_addMethod(v10, sel_headIndex, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setHeadIndex_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v13 = result;
    class_addMethod(result, sel_softmaxNormalization, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v13, sel_setSoftmaxNormalization_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)crystallizeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICrystallize"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__crystallizeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (crystallizeFilter_onceToken != -1)
    dispatch_once(&crystallizeFilter_onceToken, block);
  return v2;
}

objc_class *__39__CIFilter_Builtins__crystallizeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v8, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)depthOfFieldFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDepthOfField"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__depthOfFieldFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (depthOfFieldFilter_onceToken != -1)
    dispatch_once(&depthOfFieldFilter_onceToken, block);
  return v2;
}

objc_class *__40__CIFilter_Builtins__depthOfFieldFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *result;
  objc_class *v16;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_point0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setPoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_point1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v8, sel_setPoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_saturation, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setSaturation_, (IMP)floatSetter, "v@:f");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_unsharpMaskRadius, (IMP)floatGetter, "f@:");
    class_addMethod(v12, sel_setUnsharpMaskRadius_, (IMP)floatSetter, "v@:f");
  }
  v13 = (objc_class *)objc_opt_class();
  if (v13)
  {
    v14 = v13;
    class_addMethod(v13, sel_unsharpMaskIntensity, (IMP)floatGetter, "f@:");
    class_addMethod(v14, sel_setUnsharpMaskIntensity_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v16 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v16, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)edgesFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIEdges"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CIFilter_Builtins__edgesFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (edgesFilter_onceToken != -1)
    dispatch_once(&edgesFilter_onceToken, block);
  return v2;
}

objc_class *__33__CIFilter_Builtins__edgesFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)edgeWorkFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIEdgeWork"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CIFilter_Builtins__edgeWorkFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (edgeWorkFilter_onceToken != -1)
    dispatch_once(&edgeWorkFilter_onceToken, block);
  return v2;
}

objc_class *__36__CIFilter_Builtins__edgeWorkFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)gaborGradientsFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIGaborGradients"));
}

+ (CIFilter)gloomFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIGloom"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CIFilter_Builtins__gloomFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (gloomFilter_onceToken != -1)
    dispatch_once(&gloomFilter_onceToken, block);
  return v2;
}

objc_class *__33__CIFilter_Builtins__gloomFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)heightFieldFromMaskFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIHeightFieldFromMask"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__heightFieldFromMaskFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (heightFieldFromMaskFilter_onceToken != -1)
    dispatch_once(&heightFieldFromMaskFilter_onceToken, block);
  return v2;
}

objc_class *__47__CIFilter_Builtins__heightFieldFromMaskFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)hexagonalPixellateFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIHexagonalPixellate"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__hexagonalPixellateFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (hexagonalPixellateFilter_onceToken != -1)
    dispatch_once(&hexagonalPixellateFilter_onceToken, block);
  return v2;
}

objc_class *__46__CIFilter_Builtins__hexagonalPixellateFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)highlightShadowAdjustFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIHighlightShadowAdjust"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__highlightShadowAdjustFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (highlightShadowAdjustFilter_onceToken != -1)
    dispatch_once(&highlightShadowAdjustFilter_onceToken, block);
  return v2;
}

objc_class *__49__CIFilter_Builtins__highlightShadowAdjustFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_shadowAmount, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setShadowAmount_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_highlightAmount, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setHighlightAmount_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)lineOverlayFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CILineOverlay"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__lineOverlayFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (lineOverlayFilter_onceToken != -1)
    dispatch_once(&lineOverlayFilter_onceToken, block);
  return v2;
}

objc_class *__39__CIFilter_Builtins__lineOverlayFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *result;
  objc_class *v14;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_NRNoiseLevel, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setNRNoiseLevel_, (IMP)floatSetter, "v@:f");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_NRSharpness, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setNRSharpness_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_edgeIntensity, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setEdgeIntensity_, (IMP)floatSetter, "v@:f");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_threshold, (IMP)floatGetter, "f@:");
    class_addMethod(v12, sel_setThreshold_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v14 = result;
    class_addMethod(result, sel_contrast, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v14, sel_setContrast_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)mixFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMix"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CIFilter_Builtins__mixFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (mixFilter_onceToken != -1)
    dispatch_once(&mixFilter_onceToken, block);
  return v2;
}

objc_class *__31__CIFilter_Builtins__mixFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_backgroundImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_backgroundImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_backgroundImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setBackgroundImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_backgroundImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setBackgroundImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_amount, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setAmount_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)personSegmentationFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPersonSegmentation"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__personSegmentationFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (personSegmentationFilter_onceToken != -1)
    dispatch_once(&personSegmentationFilter_onceToken, block);
  return v2;
}

objc_class *__46__CIFilter_Builtins__personSegmentationFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_qualityLevel, (IMP)uintGetter, "Q@:");
    return (objc_class *)class_addMethod(v6, sel_setQualityLevel_, (IMP)uintSetter, "v@:Q}");
  }
  return result;
}

+ (CIFilter)pixellateFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPixellate"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__pixellateFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (pixellateFilter_onceToken != -1)
    dispatch_once(&pixellateFilter_onceToken, block);
  return v2;
}

objc_class *__37__CIFilter_Builtins__pixellateFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)pointillizeFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPointillize"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__pointillizeFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (pointillizeFilter_onceToken != -1)
    dispatch_once(&pointillizeFilter_onceToken, block);
  return v2;
}

objc_class *__39__CIFilter_Builtins__pointillizeFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v8, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)saliencyMapFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISaliencyMapFilter"));
}

+ (CIFilter)shadedMaterialFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIShadedMaterial"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__shadedMaterialFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (shadedMaterialFilter_onceToken != -1)
    dispatch_once(&shadedMaterialFilter_onceToken, block);
  return v2;
}

objc_class *__42__CIFilter_Builtins__shadedMaterialFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_shadingImage), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_shadingImage);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_shadingImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setShadingImage_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setShadingImage_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_shadingImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setShadingImage_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)sobelGradientsFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISobelGradients"));
}

+ (CIFilter)spotColorFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISpotColor"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__spotColorFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (spotColorFilter_onceToken != -1)
    dispatch_once(&spotColorFilter_onceToken, block);
  return v2;
}

objc_class *__37__CIFilter_Builtins__spotColorFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  char v22;
  void (*v23)(void);
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  char v27;
  void (*v28)(void);
  objc_class *v29;
  objc_class *v30;
  objc_class *v31;
  objc_class *v32;
  uint64_t v33;
  void *v34;
  _BOOL4 v35;
  char v36;
  void (*v37)(void);
  uint64_t v38;
  void *v39;
  _BOOL4 v40;
  char v41;
  void (*v42)(void);
  objc_class *v43;
  objc_class *v44;
  objc_class *result;
  objc_class *v46;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_centerColor1), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_centerColor1);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_centerColor1, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setCenterColor1_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setCenterColor1_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_centerColor1, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setCenterColor1_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = objc_opt_class();
  if (!v10)
    goto LABEL_34;
  v11 = (void *)v10;
  v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_replacementColor1), "isEqualToString:", CFSTR("inputImage"));
  v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_replacementColor1);
  if (v12)
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_replacementColor1, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setReplacementColor1_) & 1) == 0)
    {
      v14 = (void (*)(void))iiSetter;
LABEL_33:
      class_addMethod((Class)v11, sel_setReplacementColor1_, v14, "v@:@");
    }
  }
  else
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_replacementColor1, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setReplacementColor1_) & 1) == 0)
    {
      v14 = (void (*)(void))objSetter;
      goto LABEL_33;
    }
  }
LABEL_34:
  v15 = (objc_class *)objc_opt_class();
  if (v15)
  {
    v16 = v15;
    class_addMethod(v15, sel_closeness1, (IMP)floatGetter, "f@:");
    class_addMethod(v16, sel_setCloseness1_, (IMP)floatSetter, "v@:f");
  }
  v17 = (objc_class *)objc_opt_class();
  if (v17)
  {
    v18 = v17;
    class_addMethod(v17, sel_contrast1, (IMP)floatGetter, "f@:");
    class_addMethod(v18, sel_setContrast1_, (IMP)floatSetter, "v@:f");
  }
  v19 = objc_opt_class();
  if (v19)
  {
    v20 = (void *)v19;
    v21 = -[NSString isEqualToString:](NSStringFromSelector(sel_centerColor2), "isEqualToString:", CFSTR("inputImage"));
    v22 = objc_msgSend(v20, "instancesRespondToSelector:", sel_centerColor2);
    if (v21)
    {
      if ((v22 & 1) == 0)
        class_addMethod((Class)v20, sel_centerColor2, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v20, "instancesRespondToSelector:", sel_setCenterColor2_) & 1) == 0)
      {
        v23 = (void (*)(void))iiSetter;
LABEL_48:
        class_addMethod((Class)v20, sel_setCenterColor2_, v23, "v@:@");
      }
    }
    else
    {
      if ((v22 & 1) == 0)
        class_addMethod((Class)v20, sel_centerColor2, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v20, "instancesRespondToSelector:", sel_setCenterColor2_) & 1) == 0)
      {
        v23 = (void (*)(void))objSetter;
        goto LABEL_48;
      }
    }
  }
  v24 = objc_opt_class();
  if (!v24)
    goto LABEL_60;
  v25 = (void *)v24;
  v26 = -[NSString isEqualToString:](NSStringFromSelector(sel_replacementColor2), "isEqualToString:", CFSTR("inputImage"));
  v27 = objc_msgSend(v25, "instancesRespondToSelector:", sel_replacementColor2);
  if (v26)
  {
    if ((v27 & 1) == 0)
      class_addMethod((Class)v25, sel_replacementColor2, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v25, "instancesRespondToSelector:", sel_setReplacementColor2_) & 1) == 0)
    {
      v28 = (void (*)(void))iiSetter;
LABEL_59:
      class_addMethod((Class)v25, sel_setReplacementColor2_, v28, "v@:@");
    }
  }
  else
  {
    if ((v27 & 1) == 0)
      class_addMethod((Class)v25, sel_replacementColor2, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v25, "instancesRespondToSelector:", sel_setReplacementColor2_) & 1) == 0)
    {
      v28 = (void (*)(void))objSetter;
      goto LABEL_59;
    }
  }
LABEL_60:
  v29 = (objc_class *)objc_opt_class();
  if (v29)
  {
    v30 = v29;
    class_addMethod(v29, sel_closeness2, (IMP)floatGetter, "f@:");
    class_addMethod(v30, sel_setCloseness2_, (IMP)floatSetter, "v@:f");
  }
  v31 = (objc_class *)objc_opt_class();
  if (v31)
  {
    v32 = v31;
    class_addMethod(v31, sel_contrast2, (IMP)floatGetter, "f@:");
    class_addMethod(v32, sel_setContrast2_, (IMP)floatSetter, "v@:f");
  }
  v33 = objc_opt_class();
  if (v33)
  {
    v34 = (void *)v33;
    v35 = -[NSString isEqualToString:](NSStringFromSelector(sel_centerColor3), "isEqualToString:", CFSTR("inputImage"));
    v36 = objc_msgSend(v34, "instancesRespondToSelector:", sel_centerColor3);
    if (v35)
    {
      if ((v36 & 1) == 0)
        class_addMethod((Class)v34, sel_centerColor3, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v34, "instancesRespondToSelector:", sel_setCenterColor3_) & 1) == 0)
      {
        v37 = (void (*)(void))iiSetter;
LABEL_74:
        class_addMethod((Class)v34, sel_setCenterColor3_, v37, "v@:@");
      }
    }
    else
    {
      if ((v36 & 1) == 0)
        class_addMethod((Class)v34, sel_centerColor3, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v34, "instancesRespondToSelector:", sel_setCenterColor3_) & 1) == 0)
      {
        v37 = (void (*)(void))objSetter;
        goto LABEL_74;
      }
    }
  }
  v38 = objc_opt_class();
  if (!v38)
    goto LABEL_86;
  v39 = (void *)v38;
  v40 = -[NSString isEqualToString:](NSStringFromSelector(sel_replacementColor3), "isEqualToString:", CFSTR("inputImage"));
  v41 = objc_msgSend(v39, "instancesRespondToSelector:", sel_replacementColor3);
  if (v40)
  {
    if ((v41 & 1) == 0)
      class_addMethod((Class)v39, sel_replacementColor3, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v39, "instancesRespondToSelector:", sel_setReplacementColor3_) & 1) == 0)
    {
      v42 = (void (*)(void))iiSetter;
LABEL_85:
      class_addMethod((Class)v39, sel_setReplacementColor3_, v42, "v@:@");
    }
  }
  else
  {
    if ((v41 & 1) == 0)
      class_addMethod((Class)v39, sel_replacementColor3, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v39, "instancesRespondToSelector:", sel_setReplacementColor3_) & 1) == 0)
    {
      v42 = (void (*)(void))objSetter;
      goto LABEL_85;
    }
  }
LABEL_86:
  v43 = (objc_class *)objc_opt_class();
  if (v43)
  {
    v44 = v43;
    class_addMethod(v43, sel_closeness3, (IMP)floatGetter, "f@:");
    class_addMethod(v44, sel_setCloseness3_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v46 = result;
    class_addMethod(result, sel_contrast3, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v46, sel_setContrast3_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)spotLightFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CISpotLight"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__spotLightFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (spotLightFilter_onceToken != -1)
    dispatch_once(&spotLightFilter_onceToken, block);
  return v2;
}

uint64_t __37__CIFilter_Builtins__spotLightFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  char v13;
  void (*v14)(void);
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  uint64_t result;
  void *v20;
  _BOOL4 v21;
  char v22;
  void (*v23)(void);

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_lightPosition), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_lightPosition);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_lightPosition, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setLightPosition_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setLightPosition_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_lightPosition, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setLightPosition_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  v10 = objc_opt_class();
  if (!v10)
    goto LABEL_34;
  v11 = (void *)v10;
  v12 = -[NSString isEqualToString:](NSStringFromSelector(sel_lightPointsAt), "isEqualToString:", CFSTR("inputImage"));
  v13 = objc_msgSend(v11, "instancesRespondToSelector:", sel_lightPointsAt);
  if (v12)
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_lightPointsAt, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setLightPointsAt_) & 1) == 0)
    {
      v14 = (void (*)(void))iiSetter;
LABEL_33:
      class_addMethod((Class)v11, sel_setLightPointsAt_, v14, "v@:@");
    }
  }
  else
  {
    if ((v13 & 1) == 0)
      class_addMethod((Class)v11, sel_lightPointsAt, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v11, "instancesRespondToSelector:", sel_setLightPointsAt_) & 1) == 0)
    {
      v14 = (void (*)(void))objSetter;
      goto LABEL_33;
    }
  }
LABEL_34:
  v15 = (objc_class *)objc_opt_class();
  if (v15)
  {
    v16 = v15;
    class_addMethod(v15, sel_brightness, (IMP)floatGetter, "f@:");
    class_addMethod(v16, sel_setBrightness_, (IMP)floatSetter, "v@:f");
  }
  v17 = (objc_class *)objc_opt_class();
  if (v17)
  {
    v18 = v17;
    class_addMethod(v17, sel_concentration, (IMP)floatGetter, "f@:");
    class_addMethod(v18, sel_setConcentration_, (IMP)floatSetter, "v@:f");
  }
  result = objc_opt_class();
  if (result)
  {
    v20 = (void *)result;
    v21 = -[NSString isEqualToString:](NSStringFromSelector(sel_color), "isEqualToString:", CFSTR("inputImage"));
    v22 = objc_msgSend(v20, "instancesRespondToSelector:", sel_color);
    if (v21)
    {
      if ((v22 & 1) == 0)
        class_addMethod((Class)v20, sel_color, (IMP)iiGetter, "@@:");
      result = objc_msgSend(v20, "instancesRespondToSelector:", sel_setColor_);
      if ((result & 1) == 0)
      {
        v23 = (void (*)(void))iiSetter;
        return class_addMethod((Class)v20, sel_setColor_, v23, "v@:@");
      }
    }
    else
    {
      if ((v22 & 1) == 0)
        class_addMethod((Class)v20, sel_color, (IMP)objGetter, "@@:");
      result = objc_msgSend(v20, "instancesRespondToSelector:", sel_setColor_);
      if ((result & 1) == 0)
      {
        v23 = (void (*)(void))objSetter;
        return class_addMethod((Class)v20, sel_setColor_, v23, "v@:@");
      }
    }
  }
  return result;
}

+ (CIFilter)bokehBlurFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBokehBlur"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__bokehBlurFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (bokehBlurFilter_onceToken != -1)
    dispatch_once(&bokehBlurFilter_onceToken, block);
  return v2;
}

objc_class *__37__CIFilter_Builtins__bokehBlurFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *result;
  objc_class *v12;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_ringAmount, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setRingAmount_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_ringSize, (IMP)floatGetter, "f@:");
    class_addMethod(v10, sel_setRingSize_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v12 = result;
    class_addMethod(result, sel_softness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v12, sel_setSoftness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)boxBlurFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBoxBlur"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CIFilter_Builtins__boxBlurFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (boxBlurFilter_onceToken != -1)
    dispatch_once(&boxBlurFilter_onceToken, block);
  return v2;
}

objc_class *__35__CIFilter_Builtins__boxBlurFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)discBlurFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDiscBlur"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CIFilter_Builtins__discBlurFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (discBlurFilter_onceToken != -1)
    dispatch_once(&discBlurFilter_onceToken, block);
  return v2;
}

objc_class *__36__CIFilter_Builtins__discBlurFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)gaussianBlurFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIGaussianBlur"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__gaussianBlurFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (gaussianBlurFilter_onceToken != -1)
    dispatch_once(&gaussianBlurFilter_onceToken, block);
  return v2;
}

objc_class *__40__CIFilter_Builtins__gaussianBlurFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)maskedVariableBlurFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMaskedVariableBlur"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__maskedVariableBlurFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (maskedVariableBlurFilter_onceToken != -1)
    dispatch_once(&maskedVariableBlurFilter_onceToken, block);
  return v2;
}

objc_class *__46__CIFilter_Builtins__maskedVariableBlurFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  void (*v9)(void);
  objc_class *result;
  objc_class *v11;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = objc_opt_class();
  if (!v5)
    goto LABEL_23;
  v6 = (void *)v5;
  v7 = -[NSString isEqualToString:](NSStringFromSelector(sel_mask), "isEqualToString:", CFSTR("inputImage"));
  v8 = objc_msgSend(v6, "instancesRespondToSelector:", sel_mask);
  if (v7)
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_mask, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setMask_) & 1) == 0)
    {
      v9 = (void (*)(void))iiSetter;
LABEL_22:
      class_addMethod((Class)v6, sel_setMask_, v9, "v@:@");
    }
  }
  else
  {
    if ((v8 & 1) == 0)
      class_addMethod((Class)v6, sel_mask, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v6, "instancesRespondToSelector:", sel_setMask_) & 1) == 0)
    {
      v9 = (void (*)(void))objSetter;
      goto LABEL_22;
    }
  }
LABEL_23:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v11 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)medianFilter
{
  return +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMedianFilter"));
}

+ (CIFilter)morphologyGradientFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMorphologyGradient"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__morphologyGradientFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (morphologyGradientFilter_onceToken != -1)
    dispatch_once(&morphologyGradientFilter_onceToken, block);
  return v2;
}

objc_class *__46__CIFilter_Builtins__morphologyGradientFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)morphologyMaximumFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMorphologyMaximum"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__morphologyMaximumFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (morphologyMaximumFilter_onceToken != -1)
    dispatch_once(&morphologyMaximumFilter_onceToken, block);
  return v2;
}

objc_class *__45__CIFilter_Builtins__morphologyMaximumFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)morphologyMinimumFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMorphologyMinimum"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__morphologyMinimumFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (morphologyMinimumFilter_onceToken != -1)
    dispatch_once(&morphologyMinimumFilter_onceToken, block);
  return v2;
}

objc_class *__45__CIFilter_Builtins__morphologyMinimumFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)morphologyRectangleMaximumFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMorphologyRectangleMaximum"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CIFilter_Builtins__morphologyRectangleMaximumFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (morphologyRectangleMaximumFilter_onceToken != -1)
    dispatch_once(&morphologyRectangleMaximumFilter_onceToken, block);
  return v2;
}

objc_class *__54__CIFilter_Builtins__morphologyRectangleMaximumFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_height, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setHeight_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)morphologyRectangleMinimumFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMorphologyRectangleMinimum"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CIFilter_Builtins__morphologyRectangleMinimumFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (morphologyRectangleMinimumFilter_onceToken != -1)
    dispatch_once(&morphologyRectangleMinimumFilter_onceToken, block);
  return v2;
}

objc_class *__54__CIFilter_Builtins__morphologyRectangleMinimumFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_height, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setHeight_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)motionBlurFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMotionBlur"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__motionBlurFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (motionBlurFilter_onceToken != -1)
    dispatch_once(&motionBlurFilter_onceToken, block);
  return v2;
}

objc_class *__38__CIFilter_Builtins__motionBlurFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)noiseReductionFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CINoiseReduction"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__noiseReductionFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (noiseReductionFilter_onceToken != -1)
    dispatch_once(&noiseReductionFilter_onceToken, block);
  return v2;
}

objc_class *__42__CIFilter_Builtins__noiseReductionFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_noiseLevel, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setNoiseLevel_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)zoomBlurFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIZoomBlur"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CIFilter_Builtins__zoomBlurFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (zoomBlurFilter_onceToken != -1)
    dispatch_once(&zoomBlurFilter_onceToken, block);
  return v2;
}

objc_class *__36__CIFilter_Builtins__zoomBlurFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *result;
  objc_class *v8;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v6, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v8 = result;
    class_addMethod(result, sel_amount, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v8, sel_setAmount_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)areaAverageFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAreaAverage"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__areaAverageFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (areaAverageFilter_onceToken != -1)
    dispatch_once(&areaAverageFilter_onceToken, block);
  return v2;
}

objc_class *__39__CIFilter_Builtins__areaAverageFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)areaHistogramFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAreaHistogram"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__areaHistogramFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (areaHistogramFilter_onceToken != -1)
    dispatch_once(&areaHistogramFilter_onceToken, block);
  return v2;
}

objc_class *__41__CIFilter_Builtins__areaHistogramFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_count, (IMP)intGetter, "q@:");
    return (objc_class *)class_addMethod(v10, sel_setCount_, (IMP)intSetter, "v@:q}");
  }
  return result;
}

+ (id)areaAlphaWeightedHistogramFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAreaAlphaWeightedHistogram"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CIFilter_Builtins__areaAlphaWeightedHistogramFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (areaAlphaWeightedHistogramFilter_onceToken != -1)
    dispatch_once(&areaAlphaWeightedHistogramFilter_onceToken, block);
  return v2;
}

objc_class *__54__CIFilter_Builtins__areaAlphaWeightedHistogramFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_count, (IMP)intGetter, "q@:");
    return (objc_class *)class_addMethod(v10, sel_setCount_, (IMP)intSetter, "v@:q}");
  }
  return result;
}

+ (CIFilter)areaLogarithmicHistogramFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAreaLogarithmicHistogram"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CIFilter_Builtins__areaLogarithmicHistogramFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (areaLogarithmicHistogramFilter_onceToken != -1)
    dispatch_once(&areaLogarithmicHistogramFilter_onceToken, block);
  return v2;
}

objc_class *__52__CIFilter_Builtins__areaLogarithmicHistogramFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *result;
  objc_class *v14;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  v9 = (objc_class *)objc_opt_class();
  if (v9)
  {
    v10 = v9;
    class_addMethod(v9, sel_count, (IMP)intGetter, "q@:");
    class_addMethod(v10, sel_setCount_, (IMP)intSetter, "v@:q}");
  }
  v11 = (objc_class *)objc_opt_class();
  if (v11)
  {
    v12 = v11;
    class_addMethod(v11, sel_minimumStop, (IMP)floatGetter, "f@:");
    class_addMethod(v12, sel_setMinimumStop_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v14 = result;
    class_addMethod(result, sel_maximumStop, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v14, sel_setMaximumStop_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)areaMaximumFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAreaMaximum"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__areaMaximumFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (areaMaximumFilter_onceToken != -1)
    dispatch_once(&areaMaximumFilter_onceToken, block);
  return v2;
}

objc_class *__39__CIFilter_Builtins__areaMaximumFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)areaMaximumAlphaFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAreaMaximumAlpha"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__areaMaximumAlphaFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (areaMaximumAlphaFilter_onceToken != -1)
    dispatch_once(&areaMaximumAlphaFilter_onceToken, block);
  return v2;
}

objc_class *__44__CIFilter_Builtins__areaMaximumAlphaFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)areaMinimumFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAreaMinimum"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__areaMinimumFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (areaMinimumFilter_onceToken != -1)
    dispatch_once(&areaMinimumFilter_onceToken, block);
  return v2;
}

objc_class *__39__CIFilter_Builtins__areaMinimumFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)areaMinimumAlphaFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAreaMinimumAlpha"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__areaMinimumAlphaFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (areaMinimumAlphaFilter_onceToken != -1)
    dispatch_once(&areaMinimumAlphaFilter_onceToken, block);
  return v2;
}

objc_class *__44__CIFilter_Builtins__areaMinimumAlphaFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)areaMinMaxFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAreaMinMax"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__areaMinMaxFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (areaMinMaxFilter_onceToken != -1)
    dispatch_once(&areaMinMaxFilter_onceToken, block);
  return v2;
}

objc_class *__38__CIFilter_Builtins__areaMinMaxFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)areaMinMaxRedFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAreaMinMaxRed"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__areaMinMaxRedFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (areaMinMaxRedFilter_onceToken != -1)
    dispatch_once(&areaMinMaxRedFilter_onceToken, block);
  return v2;
}

objc_class *__41__CIFilter_Builtins__areaMinMaxRedFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (id)areaBoundsRedFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAreaBoundsRed"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__areaBoundsRedFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (areaBoundsRedFilter_onceToken != -1)
    dispatch_once(&areaBoundsRedFilter_onceToken, block);
  return v2;
}

objc_class *__41__CIFilter_Builtins__areaBoundsRedFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)columnAverageFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColumnAverage"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__columnAverageFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (columnAverageFilter_onceToken != -1)
    dispatch_once(&columnAverageFilter_onceToken, block);
  return v2;
}

objc_class *__41__CIFilter_Builtins__columnAverageFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)histogramDisplayFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIHistogramDisplayFilter"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__histogramDisplayFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (histogramDisplayFilter_onceToken != -1)
    dispatch_once(&histogramDisplayFilter_onceToken, block);
  return v2;
}

objc_class *__44__CIFilter_Builtins__histogramDisplayFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *result;
  objc_class *v10;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_height, (IMP)floatGetter, "f@:");
    class_addMethod(v6, sel_setHeight_, (IMP)floatSetter, "v@:f");
  }
  v7 = (objc_class *)objc_opt_class();
  if (v7)
  {
    v8 = v7;
    class_addMethod(v7, sel_highLimit, (IMP)floatGetter, "f@:");
    class_addMethod(v8, sel_setHighLimit_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v10 = result;
    class_addMethod(result, sel_lowLimit, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v10, sel_setLowLimit_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)KMeansFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIKMeans"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CIFilter_Builtins__KMeansFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (KMeansFilter_onceToken != -1)
    dispatch_once(&KMeansFilter_onceToken, block);
  return v2;
}

objc_class *__34__CIFilter_Builtins__KMeansFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  char v10;
  void (*v11)(void);
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *result;
  objc_class *v17;

  v0 = objc_opt_class();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
    v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
    if (v2)
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))iiSetter;
LABEL_11:
        class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
      }
    }
    else
    {
      if ((v3 & 1) == 0)
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
      {
        v4 = (void (*)(void))objSetter;
        goto LABEL_11;
      }
    }
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    v6 = v5;
    class_addMethod(v5, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  v7 = objc_opt_class();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputMeans), "isEqualToString:", CFSTR("inputImage"));
    v10 = objc_msgSend(v8, "instancesRespondToSelector:", sel_inputMeans);
    if (v9)
    {
      if ((v10 & 1) == 0)
        class_addMethod((Class)v8, sel_inputMeans, (IMP)iiGetter, "@@:");
      if ((objc_msgSend(v8, "instancesRespondToSelector:", sel_setInputMeans_) & 1) == 0)
      {
        v11 = (void (*)(void))iiSetter;
LABEL_24:
        class_addMethod((Class)v8, sel_setInputMeans_, v11, "v@:@");
      }
    }
    else
    {
      if ((v10 & 1) == 0)
        class_addMethod((Class)v8, sel_inputMeans, (IMP)objGetter, "@@:");
      if ((objc_msgSend(v8, "instancesRespondToSelector:", sel_setInputMeans_) & 1) == 0)
      {
        v11 = (void (*)(void))objSetter;
        goto LABEL_24;
      }
    }
  }
  v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    v13 = v12;
    class_addMethod(v12, sel_count, (IMP)intGetter, "q@:");
    class_addMethod(v13, sel_setCount_, (IMP)intSetter, "v@:q}");
  }
  v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    v15 = v14;
    class_addMethod(v14, sel_passes, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setPasses_, (IMP)floatSetter, "v@:f");
  }
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v17 = result;
    class_addMethod(result, sel_perceptual, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v17, sel_setPerceptual_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)rowAverageFilter
{
  CIFilter *v2;
  _QWORD block[5];

  v2 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIRowAverage"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__rowAverageFilter__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = v2;
  if (rowAverageFilter_onceToken != -1)
    dispatch_once(&rowAverageFilter_onceToken, block);
  return v2;
}

objc_class *__38__CIFilter_Builtins__rowAverageFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BOOL4 v2;
  char v3;
  void (*v4)(void);
  objc_class *result;
  objc_class *v6;

  v0 = objc_opt_class();
  if (!v0)
    goto LABEL_12;
  v1 = (void *)v0;
  v2 = -[NSString isEqualToString:](NSStringFromSelector(sel_inputImage), "isEqualToString:", CFSTR("inputImage"));
  v3 = objc_msgSend(v1, "instancesRespondToSelector:", sel_inputImage);
  if (v2)
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))iiSetter;
LABEL_11:
      class_addMethod((Class)v1, sel_setInputImage_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0)
      class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
    if ((objc_msgSend(v1, "instancesRespondToSelector:", sel_setInputImage_) & 1) == 0)
    {
      v4 = (void (*)(void))objSetter;
      goto LABEL_11;
    }
  }
LABEL_12:
  result = (objc_class *)objc_opt_class();
  if (result)
  {
    v6 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v6, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (unsigned)indexForWrapperNumber:(unsigned int)a3
{
  return a3 + 10;
}

+ (BOOL)exchangeImplementationsForClass
{
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSString *v6;
  const char *v8;
  objc_method *InstanceMethod;
  objc_method *v10;
  void (*Implementation)(void);
  const char *TypeEncoding;
  void (*v13)(void);
  const char *v14;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_msgSend((id)wrappedClasses, "count");
  if (v3 == 89)
  {
    NSLog(CFSTR("Can't wrap anymore classes without some additional macro magic."));
    v6 = NSStringFromClass(v2);
    NSLog(CFSTR("%@ will *not* be wrapped."), v6);
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v2), "hash"));
    v5 = (void *)wrappedClasses;
    objc_sync_enter((id)wrappedClasses);
    if ((objc_msgSend((id)wrappedClasses, "containsObject:", v4) & 1) != 0)
    {
      objc_sync_exit(v5);
    }
    else
    {
      objc_msgSend((id)wrappedClasses, "addObject:", v4);
      objc_sync_exit(v5);
      ++exchangeImplementationsForClass_count;
      v8 = NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wrappedOutputImage%d"), -[objc_class indexForWrapperNumber:](v2, "indexForWrapperNumber:")));
      InstanceMethod = class_getInstanceMethod(v2, sel_outputImage);
      v10 = class_getInstanceMethod(v2, v8);
      Implementation = method_getImplementation(v10);
      TypeEncoding = method_getTypeEncoding(v10);
      if (class_addMethod(v2, sel_outputImage, Implementation, TypeEncoding))
      {
        v13 = method_getImplementation(InstanceMethod);
        v14 = method_getTypeEncoding(InstanceMethod);
        class_replaceMethod(v2, v8, v13, v14);
      }
      else
      {
        method_exchangeImplementations(InstanceMethod, v10);
      }
    }
  }
  return v3 != 89;
}

+ (BOOL)wrapClassIfNeeded:(Class)a3
{
  uint64_t v4;
  void *v5;

  if (enableFilterInterposing_onceToken != -1)
    dispatch_once(&enableFilterInterposing_onceToken, &__block_literal_global_131);
  if (!enableFilterInterposing_enableFilterposing)
    return 0;
  if (wrapClassIfNeeded__onceToken != -1)
    dispatch_once(&wrapClassIfNeeded__onceToken, &__block_literal_global_29);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3), "hash"));
  v5 = (void *)wrappedClasses;
  objc_sync_enter((id)wrappedClasses);
  LOBYTE(v4) = objc_msgSend((id)wrappedClasses, "containsObject:", v4);
  objc_sync_exit(v5);
  if ((v4 & 1) != 0)
    return 1;
  else
    return -[objc_class exchangeImplementationsForClass](a3, "exchangeImplementationsForClass");
}

id __42__CIFilter_Interposer__wrapClassIfNeeded___block_invoke()
{
  id result;

  wrappedClasses = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  filtersToSkip = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  appendFilters = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  result = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  prependFilters = (uint64_t)result;
  if (!replacementFilters)
  {
    result = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    replacementFilters = (uint64_t)result;
  }
  return result;
}

- (void)_prependSingleFilter:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CIFilter *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 && objc_msgSend(a3, "count") == 3)
  {
    v5 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    v6 = objc_msgSend(a3, "objectAtIndexedSubscript:", 1);
    v7 = objc_msgSend(a3, "objectAtIndexedSubscript:", 2);
    if (-[NSArray containsObject:](-[CIFilter inputKeys](self, "inputKeys"), "containsObject:", v6))
    {
      if (v5 && v7)
      {
        v8 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", v5);
        -[CIFilter setDefaults](v8, "setDefaults");
        -[CIFilter setValuesForKeysWithDictionary:](v8, "setValuesForKeysWithDictionary:", v7);
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", -[CIFilter inputKeys](v8, "inputKeys"));
        objc_msgSend(v9, "intersectSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[CIFilter inputKeys](self, "inputKeys")));
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              v15 = -[CIFilter valueForKey:](self, "valueForKey:", v14);
              if (v15)
                -[CIFilter setValue:forKey:](v8, "setValue:forKey:", v15, v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v11);
        }
        if ((objc_msgSend(v9, "containsObject:", CFSTR("inputImage")) & 1) == 0)
        {
          v16 = -[CIFilter valueForKey:](self, "valueForKey:", v6);
          if (-[NSArray containsObject:](-[CIFilter inputKeys](v8, "inputKeys"), "containsObject:", CFSTR("inputImage")))
          {
            -[CIFilter setValue:forKey:](v8, "setValue:forKey:", v16, CFSTR("inputImage"));
          }
        }
        -[CIFilter setValue:forKey:](self, "setValue:forKey:", -[CIFilter outputImage](v8, "outputImage"), v6);
      }
    }
    else
    {
      v17 = objc_msgSend((id)objc_opt_class(), "description");
      NSLog(CFSTR("No input on filter %@ named %@"), v17, v6);
    }
  }
}

- (void)_prepend:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void *)prependFilters;
  objc_sync_enter((id)prependFilters);
  v6 = (void *)objc_msgSend((id)prependFilters, "objectForKey:", a3);
  objc_sync_exit(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[CIFilter _prependSingleFilter:](self, "_prependSingleFilter:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (id)_appendSingleFilterTo:(id)a3 filterAndSettings:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CIFilter *v10;

  if (!a4)
    return a3;
  if (objc_msgSend(a4, "count") != 2)
    return a3;
  v7 = objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v8 = objc_msgSend(a4, "objectAtIndexedSubscript:", 1);
  if (!v7)
    return a3;
  v9 = v8;
  if (!v8)
    return a3;
  v10 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", v7);
  -[CIFilter setDefaults](v10, "setDefaults");
  -[CIFilter setValuesForKeysWithDictionary:](v10, "setValuesForKeysWithDictionary:", v9);
  if (-[NSArray containsObject:](-[CIFilter inputKeys](v10, "inputKeys"), "containsObject:", CFSTR("inputImage")))
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", a3, CFSTR("inputImage"));
  if (-[NSArray containsObject:](-[CIFilter inputKeys](v10, "inputKeys"), "containsObject:", CFSTR("inputOriginalFilter")))
  {
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", self, CFSTR("inputOriginalFilter"));
  }
  return -[CIFilter outputImage](v10, "outputImage");
}

- (id)_append:(id)a3 image:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = (void *)appendFilters;
  objc_sync_enter((id)appendFilters);
  v8 = (void *)objc_msgSend((id)appendFilters, "objectForKey:", a3);
  objc_sync_exit(v7);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        a4 = -[CIFilter _appendSingleFilterTo:filterAndSettings:](self, "_appendSingleFilterTo:filterAndSettings:", a4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  return a4;
}

- (id)outputImageCatchAll:(unsigned int)a3
{
  uint64_t v3;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;
  void *v8;
  id result;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_object *v13;
  objc_object *v14;

  v3 = *(_QWORD *)&a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", objc_opt_class()), "hash"));
  v8 = (void *)filtersToSkip;
  objc_sync_enter((id)filtersToSkip);
  LODWORD(v7) = objc_msgSend((id)filtersToSkip, "containsObject:", v7);
  objc_sync_exit(v8);
  if ((_DWORD)v7)
  {
    result = (id)-[CIFilter valueForKey:](self, "valueForKey:", CFSTR("inputImage"));
    if (!result)
      return +[CIImage emptyImage](CIImage, "emptyImage");
  }
  else
  {
    -[CIFilter _prepend:](self, "_prepend:", v6);
    v10 = -[CIFilter performSelector:](self, "performSelector:", NSSelectorFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wrappedOutputImage%d"), v3)));
    v11 = (void *)replacementFilters;
    objc_sync_enter((id)replacementFilters);
    v12 = (void *)objc_msgSend((id)replacementFilters, "objectForKeyedSubscript:", v6);
    objc_sync_exit(v11);
    if (v12)
    {
      if (objc_msgSend(v12, "count") == 2)
      {
        v13 = metaFilterForFilter(objc_msgSend(v12, "objectAtIndexedSubscript:", 0), (objc_object *)self);
        if (v13)
        {
          v14 = v13;
          -[objc_object setValuesForKeysWithDictionary:](v13, "setValuesForKeysWithDictionary:", objc_msgSend(v12, "objectAtIndexedSubscript:", 1));
          -[objc_object setValue:forKey:](v14, "setValue:forKey:", v10, CFSTR("inputOutputImage"));
          v10 = -[objc_object outputImage](v14, "outputImage");
        }
      }
    }
    return -[CIFilter _append:image:](self, "_append:image:", v6, v10);
  }
  return result;
}

+ (id)filterName:(id)a3 append:(id)a4 arguments:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (!objc_msgSend(a1, "wrapClassIfNeeded:", NSClassFromString((NSString *)a3)))
    return 0;
  if (a5)
    v8 = a5;
  else
    v8 = (id)MEMORY[0x1E0C9AA70];
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
  v10 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", a4, v9, 0);
  v11 = (void *)appendFilters;
  objc_sync_enter((id)appendFilters);
  v12 = (void *)objc_msgSend((id)appendFilters, "valueForKey:", a3);
  if (!v12)
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v12, "addObject:", v10);
  objc_msgSend((id)appendFilters, "setValue:forKey:", v12, a3);
  objc_sync_exit(v11);
  return v9;
}

+ (id)filterName:(id)a3 prepend:(id)a4 imageName:(id)a5 arguments:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  if (!objc_msgSend(a1, "wrapClassIfNeeded:", NSClassFromString((NSString *)a3)))
    return 0;
  if (a6)
    v10 = a6;
  else
    v10 = (id)MEMORY[0x1E0C9AA70];
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
  v12 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", a4, a5, v11, 0);
  v13 = (void *)prependFilters;
  objc_sync_enter((id)prependFilters);
  v14 = (void *)objc_msgSend((id)prependFilters, "valueForKey:", a3);
  if (!v14)
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v14, "addObject:", v12);
  objc_msgSend((id)prependFilters, "setValue:forKey:", v14, a3);
  objc_sync_exit(v13);
  return v11;
}

- (id)wrappedOutputImage10
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 10);
}

- (id)wrappedOutputImage11
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 11);
}

- (id)wrappedOutputImage12
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 12);
}

- (id)wrappedOutputImage13
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 13);
}

- (id)wrappedOutputImage14
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 14);
}

- (id)wrappedOutputImage15
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 15);
}

- (id)wrappedOutputImage16
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 16);
}

- (id)wrappedOutputImage17
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 17);
}

- (id)wrappedOutputImage18
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 18);
}

- (id)wrappedOutputImage19
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 19);
}

- (id)wrappedOutputImage20
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 20);
}

- (id)wrappedOutputImage21
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 21);
}

- (id)wrappedOutputImage22
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 22);
}

- (id)wrappedOutputImage23
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 23);
}

- (id)wrappedOutputImage24
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 24);
}

- (id)wrappedOutputImage25
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 25);
}

- (id)wrappedOutputImage26
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 26);
}

- (id)wrappedOutputImage27
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 27);
}

- (id)wrappedOutputImage28
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 28);
}

- (id)wrappedOutputImage29
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 29);
}

- (id)wrappedOutputImage30
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 30);
}

- (id)wrappedOutputImage31
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 31);
}

- (id)wrappedOutputImage32
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 32);
}

- (id)wrappedOutputImage33
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 33);
}

- (id)wrappedOutputImage34
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 34);
}

- (id)wrappedOutputImage35
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 35);
}

- (id)wrappedOutputImage36
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 36);
}

- (id)wrappedOutputImage37
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 37);
}

- (id)wrappedOutputImage38
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 38);
}

- (id)wrappedOutputImage39
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 39);
}

- (id)wrappedOutputImage40
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 40);
}

- (id)wrappedOutputImage41
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 41);
}

- (id)wrappedOutputImage42
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 42);
}

- (id)wrappedOutputImage43
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 43);
}

- (id)wrappedOutputImage44
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 44);
}

- (id)wrappedOutputImage45
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 45);
}

- (id)wrappedOutputImage46
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 46);
}

- (id)wrappedOutputImage47
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 47);
}

- (id)wrappedOutputImage48
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 48);
}

- (id)wrappedOutputImage49
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 49);
}

- (id)wrappedOutputImage50
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 50);
}

- (id)wrappedOutputImage51
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 51);
}

- (id)wrappedOutputImage52
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 52);
}

- (id)wrappedOutputImage53
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 53);
}

- (id)wrappedOutputImage54
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 54);
}

- (id)wrappedOutputImage55
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 55);
}

- (id)wrappedOutputImage56
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 56);
}

- (id)wrappedOutputImage57
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 57);
}

- (id)wrappedOutputImage58
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 58);
}

- (id)wrappedOutputImage59
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 59);
}

- (id)wrappedOutputImage60
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 60);
}

- (id)wrappedOutputImage61
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 61);
}

- (id)wrappedOutputImage62
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 62);
}

- (id)wrappedOutputImage63
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 63);
}

- (id)wrappedOutputImage64
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 64);
}

- (id)wrappedOutputImage65
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 65);
}

- (id)wrappedOutputImage66
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 66);
}

- (id)wrappedOutputImage67
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 67);
}

- (id)wrappedOutputImage68
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 68);
}

- (id)wrappedOutputImage69
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 69);
}

- (id)wrappedOutputImage70
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 70);
}

- (id)wrappedOutputImage71
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 71);
}

- (id)wrappedOutputImage72
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 72);
}

- (id)wrappedOutputImage73
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 73);
}

- (id)wrappedOutputImage74
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 74);
}

- (id)wrappedOutputImage75
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 75);
}

- (id)wrappedOutputImage76
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 76);
}

- (id)wrappedOutputImage77
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 77);
}

- (id)wrappedOutputImage78
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 78);
}

- (id)wrappedOutputImage79
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 79);
}

- (id)wrappedOutputImage80
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 80);
}

- (id)wrappedOutputImage81
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 81);
}

- (id)wrappedOutputImage82
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 82);
}

- (id)wrappedOutputImage83
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 83);
}

- (id)wrappedOutputImage84
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 84);
}

- (id)wrappedOutputImage85
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 85);
}

- (id)wrappedOutputImage86
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 86);
}

- (id)wrappedOutputImage87
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 87);
}

- (id)wrappedOutputImage88
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 88);
}

- (id)wrappedOutputImage89
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 89);
}

- (id)wrappedOutputImage90
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 90);
}

- (id)wrappedOutputImage91
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 91);
}

- (id)wrappedOutputImage92
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 92);
}

- (id)wrappedOutputImage93
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 93);
}

- (id)wrappedOutputImage94
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 94);
}

- (id)wrappedOutputImage95
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 95);
}

- (id)wrappedOutputImage96
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 96);
}

- (id)wrappedOutputImage97
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 97);
}

- (id)wrappedOutputImage98
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 98);
}

- (id)wrappedOutputImage99
{
  return -[CIFilter outputImageCatchAll:](self, "outputImageCatchAll:", 99);
}

+ (void)addFilterToSkip:(id)a3
{
  Class v4;
  Class v5;
  void *v6;

  v4 = NSClassFromString((NSString *)a3);
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(a1, "wrapClassIfNeeded:", v4))
    {
      v6 = (void *)filtersToSkip;
      objc_sync_enter((id)filtersToSkip);
      objc_msgSend((id)filtersToSkip, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v5), "hash")));
      objc_sync_exit(v6);
    }
  }
}

+ (id)filterName:(id)a3 replacement:(id)a4 arguments:(id)a5
{
  CIFilter *v8;
  CIFilter *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (!objc_msgSend(a1, "wrapClassIfNeeded:", NSClassFromString((NSString *)a3)))
    return 0;
  v8 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", a4, a5);
  if (!v8)
    return 0;
  v9 = v8;
  if (!replacementFilters)
    replacementFilters = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a5);
  v11 = (void *)replacementFilters;
  objc_sync_enter((id)replacementFilters);
  v12 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v9, v10, 0);
  objc_msgSend((id)replacementFilters, "setObject:forKeyedSubscript:", v12, a3);
  objc_sync_exit(v11);
  return v10;
}

+ (id)filterName:(id)a3 replacement:(id)a4
{
  return (id)objc_msgSend(a1, "filterName:replacement:arguments:", a3, a4, MEMORY[0x1E0C9AA70]);
}

+ (CIFilter)filterWithName:(NSString *)name keysAndValues:(id)key0
{
  void *v6;
  CIFilter *v7;
  CIFilter *v8;
  id *v9;
  CIFilter *v10;
  va_list v12;
  va_list va;

  va_start(va, key0);
  v6 = (void *)MEMORY[0x194026220](a1, a2);
  v7 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", name);
  if (v7)
  {
    v8 = v7;
    va_copy(v12, va);
    if (key0)
    {
      do
      {
        -[CIFilter setValue:forKey:](v8, "setValue:forKey:", *(_QWORD *)v12, key0);
        v9 = (id *)(v12 + 8);
        v12 += 16;
        key0 = *v9;
      }
      while (*v9);
    }
    v10 = v8;
    objc_autoreleasePoolPop(v6);
    return v8;
  }
  else
  {
    objc_autoreleasePoolPop(v6);
    return 0;
  }
}

+ (NSArray)filterNamesInCategory:(NSString *)category
{
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (category)
  {
    v5[0] = category;
    category = (NSString *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  }
  return (NSArray *)objc_msgSend(a1, "filterNamesInCategories:", category);
}

+ (NSArray)filterNamesInCategories:(NSArray *)categories
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSString *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD block[6];
  _QWORD v16[6];
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", categories);
  v4 = objc_msgSend(v3, "containsObject:");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(&unk_1E2F1DC78, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(&unk_1E2F1DC78);
        v10 = *(NSString **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", +[CIFilterClassCategories classCategoriesForClass:](CIFilterClassCategories, "classCategoriesForClass:", NSClassFromString(v10)));
        if (objc_msgSend(v3, "isSubsetOfSet:", v11)
          && ((v4 & 1) != 0 || (objc_msgSend(v11, "containsObject:", CFSTR("CICategoryApplePrivate")) & 1) == 0))
        {
          objc_msgSend(v5, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(&unk_1E2F1DC78, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  v12 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__CIFilter_CIFilterRegistry__filterNamesInCategories___block_invoke;
  v16[3] = &unk_1E2EC3D10;
  v17 = v4;
  v16[4] = v3;
  v16[5] = v5;
  register_more_builtins((uint64_t)v16);
  v13 = filterRegistryIsolationQueue();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __54__CIFilter_CIFilterRegistry__filterNamesInCategories___block_invoke_2;
  block[3] = &unk_1E2EC2EE0;
  block[4] = v3;
  block[5] = v5;
  dispatch_sync(v13, block);
  return (NSArray *)objc_msgSend(v5, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
}

uint64_t __54__CIFilter_CIFilterRegistry__filterNamesInCategories___block_invoke(uint64_t a1, NSString *aClassName)
{
  void *v4;
  uint64_t result;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", +[CIFilterClassCategories classCategoriesForClass:](CIFilterClassCategories, "classCategoriesForClass:", NSClassFromString(aClassName)));
  result = objc_msgSend(*(id *)(a1 + 32), "isSubsetOfSet:", v4);
  if ((_DWORD)result)
  {
    if (*(_BYTE *)(a1 + 48))
      return objc_msgSend(*(id *)(a1 + 40), "addObject:", aClassName);
    result = objc_msgSend(v4, "containsObject:", CFSTR("CICategoryApplePrivate"));
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 40), "addObject:", aClassName);
  }
  return result;
}

uint64_t __54__CIFilter_CIFilterRegistry__filterNamesInCategories___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)registeredFilterConstructors;
  result = objc_msgSend((id)registeredFilterConstructors, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        v8 = objc_msgSend((id)objc_msgSend((id)registeredFilterConstructors, "valueForKey:", v7), "objectForKey:", CFSTR("CIAttributeFilterCategories"));
        if (objc_msgSend(*(id *)(a1 + 32), "isSubsetOfSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8)))objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

+ (void)registerFilterName:(NSString *)name constructor:(id)anObject classAttributes:(NSDictionary *)attributes
{
  uint64_t v8;
  uint64_t v9;
  SEL v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD block[6];

  if (name)
  {
    if (!anObject)
      NSLog(CFSTR("[CIFilter registerFilterName:constructor:classAttributes:] registration of '%@' should provide a contructor object or class."), a2, name);
    v8 = objc_opt_class();
    if (v8 == objc_opt_class())
    {
      NSLog(CFSTR("[CIFilter registerFilterName:constructor:classAttributes:] registration of '%@' should not provide a contructor class that is just [CIFilter class]."), v9, name);
    }
    else
    {
      v10 = NSSelectorFromString(CFSTR("filterWithName:"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((id)objc_opt_class() == anObject)
        {
          if (objc_msgSend(anObject, "isSubclassOfClass:", objc_opt_class()))
          {
            v12 = objc_msgSend(anObject, "methodForSelector:", v10);
            if (v12 == +[CIFilter methodForSelector:](CIFilter, "methodForSelector:", v10))
              NSLog(CFSTR("[CIFilter registerFilterName:constructor:classAttributes:] registration of '%@' needs a constructor object or class that overrides filterWithName:"), name);
          }
        }
        v13 = (id)-[NSDictionary mutableCopy](attributes, "mutableCopy");
        if (!v13)
          v13 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        if (anObject)
          objc_msgSend(v13, "setObject:forKey:", anObject, kCIConstructorKey);
        v14 = filterRegistryIsolationQueue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __77__CIFilter_CIFilterRegistry__registerFilterName_constructor_classAttributes___block_invoke;
        block[3] = &unk_1E2EC2EE0;
        block[4] = v13;
        block[5] = name;
        dispatch_sync(v14, block);
        v15 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", kCIFilterAddedNotification, name);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D8], "defaultQueue"), "enqueueNotification:postingStyle:coalesceMask:forModes:", v15, 1, 0, 0);
      }
      else
      {
        NSLog(CFSTR("[CIFilter registerFilterName:constructor:classAttributes:] registration of '%@' needs a constructor object or class that implements filterWithName:"), v11, name);
      }
    }
  }
  else
  {
    NSLog(CFSTR("[CIFilter registerFilterName:constructor:classAttributes:] needs a name parameter."), a2);
  }
}

uint64_t __77__CIFilter_CIFilterRegistry__registerFilterName_constructor_classAttributes___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)registeredFilterConstructors;
  if (!registeredFilterConstructors)
  {
    v2 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    registeredFilterConstructors = (uint64_t)v2;
  }
  return objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (NSString)localizedNameForFilterName:(NSString *)filterName
{
  return (NSString *)objc_msgSend(+[CIFilterClassAttributes classAttributesForName:](CIFilterClassAttributes, "classAttributesForName:", filterName), "valueForKey:", CFSTR("CIAttributeFilterDisplayName"));
}

+ (NSString)localizedNameForCategory:(NSString *)category
{
  return (NSString *)objc_msgSend((id)bundleForCIFilter(), "localizedStringForKey:value:table:", category, 0, CFSTR("Categories"));
}

+ (NSString)localizedDescriptionForFilterName:(NSString *)filterName
{
  NSString *v4;
  Class v5;
  objc_class *v7;
  uint64_t v8;
  NSString *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = (NSString *)objc_msgSend(+[CIFilterClassAttributes classAttributesForName:](CIFilterClassAttributes, "classAttributesForName:"), "valueForKey:", CFSTR("CIAttributeDescription"));
  v5 = NSClassFromString(filterName);
  if (v4)
    return v4;
  v7 = v5;
  if (classNameIsSystemFilter(filterName))
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v7);
    v9 = -[NSString stringByAppendingString:](filterName, "stringByAppendingString:", CFSTR(".description"));
    v10 = CFSTR("Filters");
    v11 = (void *)v8;
    v12 = 0;
  }
  else
  {
    if (!classIsBuiltinFilter(v7))
      return filterName;
    v13 = (void *)bundleForCIFilter();
    v12 = objc_msgSend(v13, "localizedStringForKey:value:table:", filterName, 0, CFSTR("Filters"));
    v10 = CFSTR("Descriptions");
    v11 = v13;
    v9 = filterName;
  }
  return (NSString *)objc_msgSend(v11, "localizedStringForKey:value:table:", v9, v12, v10);
}

+ (NSURL)localizedReferenceDocumentationForFilterName:(NSString *)filterName
{
  return (NSURL *)objc_msgSend(+[CIFilterClassAttributes classAttributesForName:](CIFilterClassAttributes, "classAttributesForName:", filterName), "valueForKey:", CFSTR("CIAttributeReferenceDocumentation"));
}

- (int)compatibilityVersion
{
  return objc_msgSend((id)-[CIFilter valueForKey:](self, "valueForKey:", CFSTR("__inputVersion")), "intValue");
}

+ (CIFilter)filterWithName:(id)a3 compatibilityVersion:(int)a4
{
  uint64_t v4;
  CIFilter *v5;

  v4 = *(_QWORD *)&a4;
  v5 = (CIFilter *)objc_msgSend(a1, "filterWithName:", a3);
  if ((_DWORD)v4 != -1)
    -[CIFilter setValue:forKey:](v5, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4), CFSTR("__inputVersion"));
  return v5;
}

+ (CIFilter)filterWithName:(id)a3 compatibilityVersion:(int)a4 keysAndValues:(id)a5
{
  uint64_t v6;
  CIFilter *v7;
  id *v8;
  uint64_t *v10;
  uint64_t v11;

  v6 = *(_QWORD *)&a4;
  v7 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", a3);
  if ((_DWORD)v6 != -1)
    -[CIFilter setValue:forKey:](v7, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6), CFSTR("__inputVersion"));
  if (v7)
  {
    v10 = &v11;
    if (a5)
    {
      do
      {
        -[CIFilter setValue:forKey:](v7, "setValue:forKey:", *v10, a5);
        v8 = (id *)(v10 + 1);
        v10 += 2;
        a5 = *v8;
      }
      while (*v8);
    }
  }
  return v7;
}

+ (id)allCategories:(BOOL)a3
{
  void *v3;
  const __CFString **v4;
  uint64_t v5;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v21 = CFSTR("CICategoryGeometryAdjustment");
    v22 = CFSTR("CICategoryDistortionEffect");
    v23 = CFSTR("CICategoryBlur");
    v24 = CFSTR("CICategorySharpen");
    v25 = CFSTR("CICategoryColorAdjustment");
    v26 = CFSTR("CICategoryColorEffect");
    v27 = CFSTR("CICategoryStylize");
    v28 = CFSTR("CICategoryHalftoneEffect");
    v29 = CFSTR("CICategoryTileEffect");
    v30 = CFSTR("CICategoryGenerator");
    v31 = CFSTR("CICategoryReduction");
    v32 = CFSTR("CICategoryGradient");
    v33 = CFSTR("CICategoryTransition");
    v34 = CFSTR("CICategoryCompositeOperation");
    v35 = CFSTR("CICategoryApplePrivate");
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = &v21;
    v5 = 15;
  }
  else
  {
    v7 = CFSTR("CICategoryGeometryAdjustment");
    v8 = CFSTR("CICategoryDistortionEffect");
    v9 = CFSTR("CICategoryBlur");
    v10 = CFSTR("CICategorySharpen");
    v11 = CFSTR("CICategoryColorAdjustment");
    v12 = CFSTR("CICategoryColorEffect");
    v13 = CFSTR("CICategoryStylize");
    v14 = CFSTR("CICategoryHalftoneEffect");
    v15 = CFSTR("CICategoryTileEffect");
    v16 = CFSTR("CICategoryGenerator");
    v17 = CFSTR("CICategoryReduction");
    v18 = CFSTR("CICategoryGradient");
    v19 = CFSTR("CICategoryTransition");
    v20 = CFSTR("CICategoryCompositeOperation");
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = &v7;
    v5 = 14;
  }
  return (id)objc_msgSend(v3, "arrayWithObjects:count:", v4, v5, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21,
               v22,
               v23,
               v24,
               v25,
               v26,
               v27,
               v28,
               v29,
               v30,
               v31,
               v32,
               v33,
               v34,
               v35,
               v36);
}

+ (void)unregisterFilterName:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (a3)
  {
    v4 = filterRegistryIsolationQueue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__CIFilter_CIFilterRegistryPrivate__unregisterFilterName___block_invoke;
    block[3] = &unk_1E2EC3CC8;
    block[4] = a3;
    dispatch_sync(v4, block);
  }
  else
  {
    NSLog(CFSTR("[CIFilter unregisterFilterName:] needs a name parameter."), a2);
  }
}

uint64_t __58__CIFilter_CIFilterRegistryPrivate__unregisterFilterName___block_invoke(uint64_t result)
{
  if (registeredFilterConstructors)
    return objc_msgSend((id)registeredFilterConstructors, "removeObjectForKey:", *(_QWORD *)(result + 32));
  return result;
}

+ (CIFilter)filterWithImageURL:(NSURL *)url options:(NSDictionary *)options
{
  NSObject *v7;

  if (!-[NSURL isFileURL](url, "isFileURL")
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isReadableFileAtPath:", -[NSURL path](url, "path")) & 1) != 0)
  {
    return (CIFilter *)+[CIRAWFilterImpl filterWithImageURL:options:](CIRAWFilterImpl, "filterWithImageURL:options:", url, options);
  }
  v7 = ci_logger_api();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    +[CIFilter(CIRAWFilter) filterWithImageURL:options:].cold.1((uint64_t)url, v7);
  return 0;
}

+ (CIFilter)filterWithImageData:(NSData *)data options:(NSDictionary *)options
{
  return (CIFilter *)+[CIRAWFilterImpl filterWithImageData:options:](CIRAWFilterImpl, "filterWithImageData:options:", data, options);
}

+ (CIFilter)filterWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer properties:(NSDictionary *)properties options:(NSDictionary *)options
{
  return (CIFilter *)+[CIRAWFilterImpl filterWithCVPixelBuffer:properties:options:](CIRAWFilterImpl, "filterWithCVPixelBuffer:properties:options:", pixelBuffer, properties, options);
}

+ (NSArray)supportedRawCameraModels
{
  return (NSArray *)+[CIRAWFilterImpl supportedRawCameraModels](CIRAWFilterImpl, "supportedRawCameraModels");
}

- (id)apply:(id)a3 image:(id)a4 arguments:(id)a5 inoutSpace:(CGColorSpace *)a6
{
  id v8;
  uint64_t v10;
  id result;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSLog(CFSTR("Kernel %@ should be of class CIColorKernel"), objc_msgSend(a3, "name"));
    return 0;
  }
  if (a6)
    v8 = (id)objc_msgSend(v8, "imageByColorMatchingWorkingSpaceToColorSpace:", a6);
  v12[0] = v8;
  v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1), "arrayByAddingObjectsFromArray:", a5);
  objc_msgSend(v8, "extent");
  result = (id)objc_msgSend(a3, "applyWithExtent:arguments:", v10);
  if (a6)
    return (id)objc_msgSend(result, "imageByColorMatchingColorSpaceToWorkingSpace:", a6);
  return result;
}

- (id)apply:(id)a3 image:(id)a4 arguments:(id)a5 inSpace:(CGColorSpace *)a6
{
  id v8;
  uint64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSLog(CFSTR("Kernel %@ should be of class CIColorKernel"), objc_msgSend(a3, "name"));
    return 0;
  }
  if (a6)
    v8 = (id)objc_msgSend(v8, "imageByColorMatchingWorkingSpaceToColorSpace:", a6);
  v12[0] = v8;
  v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1), "arrayByAddingObjectsFromArray:", a5);
  objc_msgSend(v8, "extent");
  return (id)objc_msgSend(a3, "applyWithExtent:arguments:", v10);
}

+ (id)metalFilterWithName:(id)a3 withInputParameters:(id)a4
{
  id v5;
  void *v6;

  if (a4)
    v5 = a4;
  else
    v5 = (id)MEMORY[0x1E0C9AA70];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", a3, CFSTR("inputFilterName"));
  return +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CIMetalWrapper"), v6);
}

+ (id)metalFilterWithName:(id)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("inputFilterName");
  v5[0] = a3;
  return +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CIMetalWrapper"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
}

+ (int)minSDOFRenderingVersionSupported
{
  return 4;
}

+ (int)maxSDOFRenderingVersionSupported
{
  SEL v2;
  SEL v3;
  uint64_t v4;
  uint64_t (*v6)(uint64_t, SEL);

  v2 = NSSelectorFromString(CFSTR("getUnifiedRenderingMaxVersionSupported"));
  if (!v2)
    return 4;
  v3 = v2;
  envCCSDOFMetadataClass();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 4;
  v6 = (uint64_t (*)(uint64_t, SEL))objc_msgSend((id)envCCSDOFMetadataClass(), "methodForSelector:", v3);
  v4 = envCCSDOFMetadataClass();
  return v6(v4, v3);
}

+ (int)getMinMaxSimulatedApertureFrom:(__CFData *)a3 minValue:(float *)a4 maxValue:(float *)a5 version:(int *)a6
{
  int v6;
  int v11;
  int v12;
  NSObject *v13;
  SEL v14;
  SEL v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, SEL, __CFData *);
  uint64_t v18;
  uint64_t v19;
  void *v20;
  SEL v21;
  SEL v22;
  uint64_t v23;
  float (*v24)(uint64_t, SEL, void *);
  uint64_t v25;
  SEL v26;
  SEL v27;
  uint64_t v28;
  float (*v29)(uint64_t, SEL, void *);
  uint64_t v30;
  BOOL v32;
  _BYTE v33[4];
  int v34;
  _OWORD v35[6];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v6 = -1;
  if (!a4)
    return v6;
  if (!a5)
    return v6;
  if (!a6)
    return v6;
  *a4 = 0.0;
  *a5 = 0.0;
  *a6 = 0;
  if (!a3)
    return v6;
  v59 = 0;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v38 = 0u;
  v36 = 0u;
  v37 = 0u;
  memset(v35, 0, sizeof(v35));
  if ((unint64_t)-[__CFData length](a3, "length") < 0xC)
    return 1;
  -[__CFData getBytes:length:](a3, "getBytes:length:", v33, 12);
  v11 = v34;
  *a6 = v34;
  switch(v11)
  {
    case 3:
      v12 = FigDepthBlurEffectRenderingParametersV3FromCFData(a3, v35);
      break;
    case 2:
      v12 = FigDepthBlurEffectRenderingParametersV2FromCFData(a3, (char *)v35, &v32);
      break;
    case 1:
      v12 = FigDepthBlurEffectRenderingParametersV1FromCFData(a3, v35);
      break;
    default:
      goto LABEL_17;
  }
  v6 = v12;
  v11 = *a6;
  if (v12)
    goto LABEL_18;
  if (v11 == 3 || v11 == 2)
  {
    v6 = 0;
    *a4 = *((float *)&v36 + 1);
    *a5 = *((float *)&v46 + 3);
    return v6;
  }
LABEL_17:
  v6 = 1;
LABEL_18:
  if (v11 >= 4)
  {
    if (v11 <= +[CIFilter maxSDOFRenderingVersionSupported](CIFilter, "maxSDOFRenderingVersionSupported"))
    {
      v14 = NSSelectorFromString(CFSTR("getRenderingParametersFromMetaData:"));
      if (v14)
      {
        v15 = v14;
        v16 = objc_msgSend((id)envCCSDOFMetadataClass(), "methodForSelector:", v14);
        if (v16)
        {
          v17 = (uint64_t (*)(uint64_t, SEL, __CFData *))v16;
          envCCSDOFMetadataClass();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v18 = envCCSDOFMetadataClass();
            v19 = v17(v18, v15, a3);
            if (v19)
            {
              v20 = (void *)v19;
              v21 = NSSelectorFromString(CFSTR("minSimulatedAperture:"));
              if (v21)
              {
                v22 = v21;
                v23 = objc_msgSend((id)envCCSDOFMetadataClass(), "methodForSelector:", v21);
                if (v23)
                {
                  v24 = (float (*)(uint64_t, SEL, void *))v23;
                  envCCSDOFMetadataClass();
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
                    v25 = envCCSDOFMetadataClass();
                    *a4 = v24(v25, v22, v20);
                  }
                }
              }
              v26 = NSSelectorFromString(CFSTR("maxSimulatedAperture:"));
              if (v26)
              {
                v27 = v26;
                v28 = objc_msgSend((id)envCCSDOFMetadataClass(), "methodForSelector:", v26);
                if (v28)
                {
                  v29 = (float (*)(uint64_t, SEL, void *))v28;
                  envCCSDOFMetadataClass();
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
                    v30 = envCCSDOFMetadataClass();
                    *a5 = v29(v30, v27, v20);
                  }
                }
              }
              v6 = *a4 <= 0.0 || *a5 <= 0.0;
              free(v20);
            }
          }
        }
      }
    }
    else
    {
      v13 = ci_logger_render();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        +[CIFilter(PrivateDepthUtilities) getMinMaxSimulatedApertureFrom:minValue:maxValue:version:].cold.1(a6, v13);
      return 3;
    }
  }
  return v6;
}

- (void)apply:(uint64_t)a3 arguments:(uint64_t)a4 options:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s first parameter should be CIKernel.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)apply:(uint64_t)a3 arguments:(uint64_t)a4 options:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s kCIApplyOptionDefinition is not a CIFilterShape or an NSArray with four elements.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)apply:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = objc_msgSend((id)objc_opt_class(), "description");
  _os_log_error_impl(&dword_1921E4000, a2, OS_LOG_TYPE_ERROR, "[%{public}@ apply:...] First argument should be CIKernel.", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)apply:(NSObject *)a3 .cold.2(uint64_t a1, int a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138543618;
  v6 = objc_msgSend((id)objc_opt_class(), "description");
  v7 = 1024;
  v8 = a2;
  _os_log_error_impl(&dword_1921E4000, a3, OS_LOG_TYPE_ERROR, "[%{public}@ apply:...] Argument at index %d should be a CIImage, CISampler, CIVector, or NSNumber.", (uint8_t *)&v5, 0x12u);
  OUTLINED_FUNCTION_2();
}

@end
