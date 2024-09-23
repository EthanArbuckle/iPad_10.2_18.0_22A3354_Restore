@implementation RAWFilter

+ (id)filterWithName:(id)a3
{
  NSString *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (NSString *)a3;
  if (objc_msgSend_hasPrefix_(v3, v4, (uint64_t)CFSTR("RAW"), v5, v6))
  {
    NSClassFromString(v3);
    v7 = (void *)objc_opt_new();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)takeAttributesFromDictionary:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_msgSend_inputKeys(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_takeAttributesFromDictionary_forKeys_(self, v9, (uint64_t)v11, (uint64_t)v8, v10);

}

- (void)takeAttributesFromDictionary:(id)a3 forKeys:(id)a4
{
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend_isEqualToString_(v13, v7, (uint64_t)CFSTR("inputImage"), v8, v9) & 1) == 0)
        {
          objc_msgSend_objectForKeyedSubscript_(v23, v7, (uint64_t)CFSTR("valueBlock"), v8, v9);
          v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend_stringByReplacingCharactersInRange_withString_(v13, v14, 0, 5, (uint64_t)&stru_1E99A7480);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (objc_class *)objc_opt_class();
            NSStringFromClass(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, void *))v17)[2](v17, v20, v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
              goto LABEL_10;
          }
          objc_msgSend_objectForKeyedSubscript_(v23, v14, (uint64_t)v13, v15, v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
LABEL_10:
            objc_msgSend_setValue_forKey_(self, v14, (uint64_t)v21, (uint64_t)v13, v16);

        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v10);
  }

}

+ (id)filterWithDefaultsForName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_filterWithName_(MEMORY[0x1E0C9DDB8], a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDefaults(v5, v6, v7, v8, v9);
  return v5;
}

+ (id)filterWithDefaultsForClass:(Class)a3
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x1E0C9DDB8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filterWithName_(v3, v6, (uint64_t)v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setDefaults(v9, v10, v11, v12, v13);
  return v9;
}

- (void)setPrimitiveNumberValue:(id)a3 inVariable:(id *)a4 forKey:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id obj;

  obj = a3;
  v8 = a5;
  if (*a4 != obj)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_doubleValue(obj, v9, v10, v11, v12);
      objc_msgSend_numberWithDouble_(v13, v14, v15, v16, v17);
      v18 = objc_claimAutoreleasedReturnValue();

      obj = (id)v18;
    }
    if (!*a4 || (objc_msgSend_isEqualToNumber_(obj, v9, (uint64_t)*a4, v11, v12) & 1) == 0)
    {
      objc_msgSend_willChangeValueForKey_(self, v9, (uint64_t)v8, v11, v12);
      objc_storeStrong(a4, obj);
      objc_msgSend_didChangeValueForKey_(self, v19, (uint64_t)v8, v20, v21);
    }
  }

}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  CFTypeID TypeID;
  const char *v33;
  uint64_t v34;
  CFTypeRef v35;
  int v36;
  CFDataRef v37;
  const __CFData *v38;
  const char *v39;
  uint64_t v40;
  id v41;

  v41 = a3;
  if ((objc_msgSend_allowsKeyedCoding(v41, v4, v5, v6, v7) & 1) != 0)
  {
    objc_msgSend_inputKeys(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_count(v12, v13, v14, v15, v16);
    if (v20)
    {
      v21 = 0;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v12, v17, v21, v18, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_valueForKey_(self, v23, (uint64_t)v22, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = objc_alloc(MEMORY[0x1E0CB3940]);
          v31 = (void *)objc_msgSend_initWithFormat_(v27, v28, (uint64_t)CFSTR("CI_%@"), v29, v30, v22);
          TypeID = CGColorSpaceGetTypeID();
          if (TypeID == CFGetTypeID(v26)
            && ((v35 = sub_1D543E884(), v36 = CFEqual(v26, v35), v37 = (CFDataRef)CFSTR("Adobe RGB Linear"), v36)
             || (v37 = CGColorSpaceCopyICCData((CGColorSpaceRef)v26)) != 0))
          {
            v38 = v37;

            v26 = v38;
            objc_msgSend_encodeObject_forKey_(v41, v39, (uint64_t)v38, (uint64_t)v31, v40);
          }
          else
          {
            v38 = 0;
            objc_msgSend_encodeObject_forKey_(v41, v33, (uint64_t)v26, (uint64_t)v31, v34);
          }

        }
        ++v21;
      }
      while (v20 != v21);
    }

  }
  else
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v8, (uint64_t)CFSTR("CIRequiresKeyedArchiver"), (uint64_t)CFSTR("CoreImage doesn't support old-style archiving"), v11);
  }

}

- (RAWFilter)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  RAWFilter *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  RAWFilter *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  CFTypeID TypeID;
  CFTypeRef v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  id v50;
  CFTypeID v51;
  const UInt8 *BytePtr;
  CGDataProvider *v53;
  CGColorSpaceRef ICCBased;
  RAWFilter *v56;

  v4 = a3;
  if ((objc_msgSend_allowsKeyedCoding(v4, v5, v6, v7, v8) & 1) == 0)
  {
    v18 = 0;
    goto LABEL_27;
  }
  v13 = (RAWFilter *)objc_msgSend_init(self, v9, v10, v11, v12);
  v18 = v13;
  if (!v13)
  {
    self = 0;
    goto LABEL_27;
  }
  objc_msgSend_inputKeys(v13, v14, v15, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_count(v19, v20, v21, v22, v23);
  if (!v27)
    goto LABEL_24;
  v56 = v18;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  do
  {
    v32 = v31;
    v33 = v30;
    objc_msgSend_objectAtIndexedSubscript_(v19, v24, v28, v25, v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_alloc(MEMORY[0x1E0CB3940]);
    v30 = (void *)objc_msgSend_initWithFormat_(v34, v35, (uint64_t)CFSTR("CI_%@"), v36, v37, v31);

    if (!objc_msgSend_containsValueForKey_(v4, v38, (uint64_t)v30, v39, v40))
    {

      v29 = 0;
      goto LABEL_22;
    }
    objc_msgSend_decodeObjectForKey_(v4, v41, (uint64_t)v30, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v44;
    if (!v29)
      goto LABEL_22;
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v29) && CFEqual(v29, CFSTR("Adobe RGB Linear")))
    {
      v46 = sub_1D543E884();
    }
    else
    {
      v51 = CFDataGetTypeID();
      v50 = v29;
      if (v51 != CFGetTypeID(v29))
        goto LABEL_20;
      v50 = v29;
      if ((unint64_t)CFDataGetLength((CFDataRef)v29) < 0xFB)
        goto LABEL_20;
      BytePtr = CFDataGetBytePtr((CFDataRef)v29);
      v50 = v29;
      if (!BytePtr)
        goto LABEL_20;
      v50 = v29;
      if (*((_DWORD *)BytePtr + 9) != 1886610273)
        goto LABEL_20;
      v50 = v29;
      if (*((_DWORD *)BytePtr + 4) != 541214546)
        goto LABEL_20;
      v53 = (CGDataProvider *)CGDataProviderCreateWithCopyOfData();
      v50 = v29;
      if (!v53)
        goto LABEL_20;
      ICCBased = CGColorSpaceCreateICCBased(3uLL, 0, v53, 0);
      CGDataProviderRelease(v53);
      v46 = CFAutorelease(ICCBased);
    }
    v47 = (void *)v46;

    if (v47)
    {
      v50 = v47;
LABEL_20:

      v29 = v50;
    }
    objc_msgSend_setValue_forKey_(v56, v48, (uint64_t)v29, (uint64_t)v31, v49);
LABEL_22:
    ++v28;
  }
  while (v27 != v28);

  v18 = v56;
LABEL_24:
  self = v18;

  v18 = self;
LABEL_27:

  return v18;
}

- (id)apply:(id)a3 image:(id)a4 extent:(CGRect)a5 roiCallback:(id)a6 arguments:(id)a7 inoutSpace:(CGColorSpace *)a8
{
  objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a6, a7, a8, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)apply:(id)a3 image:(id)a4 extent:(CGRect)a5 roiCallback:(id)a6 arguments:(id)a7 inoutSpace:(CGColorSpace *)a8 isAlphaOne:(BOOL)a9
{
  _BOOL4 v9;
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  void *v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v9 = a9;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v69 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v18 = a4;
  v60 = a6;
  v19 = a7;
  v58 = v18;
  v24 = objc_msgSend_count(v19, v20, v21, v22, v23);
  sub_1D52B261C(v24 + 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v67 = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v26, (uint64_t)&v67, 1, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v28;
  if (v19)
    objc_msgSend_arrayByAddingObjectsFromArray_(v28, v29, (uint64_t)v19, v30, v31);
  else
    objc_msgSend_arrayByAddingObjectsFromArray_(v28, v29, MEMORY[0x1E0C9AA60], v30, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v61, (uint64_t)v68, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v62;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v62 != v39)
          objc_enumerationMutation(v33);
        v41 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v40);
        if (a8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v41, v35, (uint64_t)a8, v36, v37);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v25, v43, (uint64_t)v42, v44, v45);

        }
        else
        {
          objc_msgSend_addObject_(v25, v35, (uint64_t)v41, v36, v37);
        }
        v40 = (char *)v40 + 1;
      }
      while (v38 != v40);
      v38 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v35, (uint64_t)&v61, (uint64_t)v68, 16);
    }
    while (v38);
  }

  if (v9)
  {
    v65 = *MEMORY[0x1E0C9E0A8];
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v46, 1, v47, v48);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v38;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v49, (uint64_t)&v66, (uint64_t)&v65, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_roiCallback_arguments_options_(v59, v51, (uint64_t)v60, (uint64_t)v25, (uint64_t)v50, x, y, width, height);
  }
  else
  {
    v50 = 0;
    objc_msgSend_applyWithExtent_roiCallback_arguments_options_(v59, v46, (uint64_t)v60, (uint64_t)v25, 0, x, y, width, height);
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  if (a8)
  {
    objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v55, v52, (uint64_t)a8, v53, v54);
    v56 = objc_claimAutoreleasedReturnValue();

    v55 = (void *)v56;
  }

  return v55;
}

- (id)apply:(id)a3 image:(id)a4 arguments:(id)a5 inoutSpace:(CGColorSpace *)a6 isPremultiplied:(BOOL)a7
{
  objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_isAlphaOne_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)apply:(id)a3 image:(id)a4 arguments:(id)a5 inoutSpace:(CGColorSpace *)a6 isPremultiplied:(BOOL)a7 isAlphaOne:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  id v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  _BOOL4 v81;
  _BOOL4 v82;
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  void *v90;
  id v91;
  _BYTE v92[128];
  uint64_t v93;

  v8 = a8;
  v9 = a7;
  v93 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v84 = a4;
  v14 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v81 = v8;
    v82 = v9;
    v83 = v13;
    v23 = objc_msgSend_count(v14, v19, v20, v21, v22);
    sub_1D52B261C(v23 + 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v91 = v84;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v25, (uint64_t)&v91, 1, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v27;
    if (v14)
      objc_msgSend_arrayByAddingObjectsFromArray_(v27, v28, (uint64_t)v14, v29, v30);
    else
      objc_msgSend_arrayByAddingObjectsFromArray_(v27, v28, MEMORY[0x1E0C9AA60], v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v85, (uint64_t)v92, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v86 != v38)
            objc_enumerationMutation(v32);
          v40 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
          if (a6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v40, v34, (uint64_t)a6, v35, v36);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v24, v42, (uint64_t)v41, v43, v44);

          }
          else
          {
            objc_msgSend_addObject_(v24, v34, (uint64_t)v40, v35, v36);
          }
        }
        v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v85, (uint64_t)v92, 16);
      }
      while (v37);
    }

    if (v82)
    {
      objc_msgSend_objectAtIndexedSubscript_(v24, v45, 0, v47, v48);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByUnpremultiplyingAlpha(v32, v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setObject_atIndexedSubscript_(v24, v54, (uint64_t)v53, 0, v55);
    }
    objc_msgSend_extent(v84, v45, v46, v47, v48);
    v63 = v59;
    v64 = v60;
    v65 = v61;
    v66 = v62;
    if (v81)
    {
      v89 = *MEMORY[0x1E0C9E0A8];
      objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v56, 1, v57, v58);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v32;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v67, (uint64_t)&v90, (uint64_t)&v89, 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_arguments_options_(v83, v69, (uint64_t)v24, (uint64_t)v68, v70, v63, v64, v65, v66);
    }
    else
    {
      v68 = 0;
      objc_msgSend_applyWithExtent_arguments_options_(v83, v56, (uint64_t)v24, 0, v58, v59, v60, v61, v62);
    }
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v81)
    {

    }
    if (v82)
    {
      objc_msgSend_imageByPremultiplyingAlpha(v77, v73, v74, v75, v76);
      v78 = objc_claimAutoreleasedReturnValue();

      v77 = (void *)v78;
    }
    if (a6)
    {
      objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v77, v73, (uint64_t)a6, v75, v76);
      v79 = objc_claimAutoreleasedReturnValue();

      v77 = (void *)v79;
    }
    v72 = v77;

  }
  else
  {
    objc_msgSend_name(v13, v15, v16, v17, v18);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Kernel %@ should be of class CIColorKernel"), v71);

    v72 = 0;
  }

  return v72;
}

- (id)applyMatrixToImage:(id)a3 vectorR:(id)a4 vectorG:(id)a5 vectorB:(id)a6 vectorBias:(id)a7 inSpace:(CGColorSpace *)a8 outSpace:(CGColorSpace *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  id v43;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  objc_msgSend_W(v15, v19, v20, v21, v22);
  if (v27 == 0.0
    && (objc_msgSend_W(v16, v23, v24, v25, v26), v32 == 0.0)
    && (objc_msgSend_W(v17, v28, v29, v30, v31), v37 == 0.0)
    && (objc_msgSend_W(v18, v33, v34, v35, v36), v42 == 0.0))
  {
    if (a8)
    {
      objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v14, v38, (uint64_t)a8, v40, v41);
      v45 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v45;
    }
    objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v38, v39, v40, v41, 0.0, 0.0, 0.0, 1.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v18;
    if (!v18)
    {
      objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E0C9DDF8], v46, v47, v48, v49, 0.0, 0.0, 0.0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_filteredImage_keysAndValues_(v14, v46, (uint64_t)CFSTR("CIColorMatrix"), (uint64_t)CFSTR("inputRVector"), v49, v15, CFSTR("inputGVector"), v16, CFSTR("inputBVector"), v17, CFSTR("inputAVector"), v50, CFSTR("inputBiasVector"), v51, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    if (a9)
    {
      objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v52, v53, (uint64_t)a9, v54, v55);
      v56 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v56;
    }
    else
    {
      v14 = v52;
    }
  }
  else
  {
    NSLog(CFSTR("Vectors of R/G/B/Bias matrix must not have 4 components."));
  }
  v43 = v14;

  return v43;
}

@end
