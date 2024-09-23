@implementation FBSDisplayConfiguration

- (BOOL)isCarDisplay
{
  return -[FBSDisplayIdentity isCarDisplay](self->_identity, "isCarDisplay");
}

- (BOOL)isExternal
{
  return -[FBSDisplayIdentity isExternal](self->_identity, "isExternal");
}

- (CGSize)pixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pixelSize.width;
  height = self->_pixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isMainRootDisplay
{
  void *v2;
  char v3;

  -[FBSDisplayConfiguration identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMainRootDisplay");

  return v3;
}

- (FBSDisplayIdentity)identity
{
  return self->_identity;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  FBSDisplayIdentity *identity;
  uint64_t v7;
  id v8;
  id v9;
  NSString *hardwareIdentifier;
  id v11;
  id v12;
  NSString *name;
  id v14;
  id v15;
  NSString *deviceName;
  id v17;
  id v18;
  int64_t tags;
  id v20;
  id v21;
  FBSDisplayMode *currentMode;
  id v23;
  id v24;
  FBSDisplayMode *preferredMode;
  id v26;
  id v27;
  NSSet *otherModes;
  id v29;
  id v30;
  _BOOL8 cloningSupported;
  id v32;
  id v33;
  _BOOL8 overscanned;
  id v35;
  id v36;
  int64_t overscanCompensation;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  double latency;
  id v49;
  id v50;
  uint64_t v52;
  uint64_t v53;
  double (*v54)(uint64_t);
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  id v86;

  v4 = a3;
  objc_msgSend(off_1E38E9E00, "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  identity = self->_identity;
  v7 = MEMORY[0x1E0C809B0];
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke;
  v85[3] = &unk_1E38EC238;
  v8 = v4;
  v86 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", identity, v85);
  hardwareIdentifier = self->_hardwareIdentifier;
  v83[0] = v7;
  v83[1] = 3221225472;
  v83[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_2;
  v83[3] = &unk_1E38EB9C0;
  v11 = v8;
  v84 = v11;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", hardwareIdentifier, v83);
  name = self->_name;
  v81[0] = v7;
  v81[1] = 3221225472;
  v81[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_3;
  v81[3] = &unk_1E38EB9C0;
  v14 = v11;
  v82 = v14;
  v15 = (id)objc_msgSend(v5, "appendString:counterpart:", name, v81);
  deviceName = self->_deviceName;
  v79[0] = v7;
  v79[1] = 3221225472;
  v79[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_4;
  v79[3] = &unk_1E38EB9C0;
  v17 = v14;
  v80 = v17;
  v18 = (id)objc_msgSend(v5, "appendString:counterpart:", deviceName, v79);
  tags = self->_tags;
  v77[0] = v7;
  v77[1] = 3221225472;
  v77[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_5;
  v77[3] = &unk_1E38EB9E8;
  v20 = v17;
  v78 = v20;
  v21 = (id)objc_msgSend(v5, "appendInteger:counterpart:", tags, v77);
  currentMode = self->_currentMode;
  v75[0] = v7;
  v75[1] = 3221225472;
  v75[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_6;
  v75[3] = &unk_1E38EC238;
  v23 = v20;
  v76 = v23;
  v24 = (id)objc_msgSend(v5, "appendObject:counterpart:", currentMode, v75);
  preferredMode = self->_preferredMode;
  v73[0] = v7;
  v73[1] = 3221225472;
  v73[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_7;
  v73[3] = &unk_1E38EC238;
  v26 = v23;
  v74 = v26;
  v27 = (id)objc_msgSend(v5, "appendObject:counterpart:", preferredMode, v73);
  otherModes = self->_otherModes;
  v71[0] = v7;
  v71[1] = 3221225472;
  v71[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_8;
  v71[3] = &unk_1E38EC238;
  v29 = v26;
  v72 = v29;
  v30 = (id)objc_msgSend(v5, "appendObject:counterpart:", otherModes, v71);
  cloningSupported = self->_cloningSupported;
  v69[0] = v7;
  v69[1] = 3221225472;
  v69[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_9;
  v69[3] = &unk_1E38EB998;
  v32 = v29;
  v70 = v32;
  v33 = (id)objc_msgSend(v5, "appendBool:counterpart:", cloningSupported, v69);
  overscanned = self->_overscanned;
  v67[0] = v7;
  v67[1] = 3221225472;
  v67[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_10;
  v67[3] = &unk_1E38EB998;
  v35 = v32;
  v68 = v35;
  v36 = (id)objc_msgSend(v5, "appendBool:counterpart:", overscanned, v67);
  overscanCompensation = self->_overscanCompensation;
  v65[0] = v7;
  v65[1] = 3221225472;
  v65[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_11;
  v65[3] = &unk_1E38EB9E8;
  v38 = v35;
  v66 = v38;
  v39 = (id)objc_msgSend(v5, "appendInteger:counterpart:", overscanCompensation, v65);
  v63[0] = v7;
  v63[1] = 3221225472;
  v63[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_12;
  v63[3] = &unk_1E38EC260;
  v40 = v38;
  v64 = v40;
  v41 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v63, self->_safeOverscanRatio.width, self->_safeOverscanRatio.height);
  v61[0] = v7;
  v61[1] = 3221225472;
  v61[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_13;
  v61[3] = &unk_1E38EC260;
  v42 = v40;
  v62 = v42;
  v43 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v61, self->_pixelSize.width, self->_pixelSize.height);
  v59[0] = v7;
  v59[1] = 3221225472;
  v59[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_14;
  v59[3] = &unk_1E38EBA10;
  v44 = v42;
  v60 = v44;
  v45 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v59, self->_nativeBounds.origin.x, self->_nativeBounds.origin.y, self->_nativeBounds.size.width, self->_nativeBounds.size.height);
  v57[0] = v7;
  v57[1] = 3221225472;
  v57[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_15;
  v57[3] = &unk_1E38EBA10;
  v46 = v44;
  v58 = v46;
  v47 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v57, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  latency = self->_latency;
  v52 = v7;
  v53 = 3221225472;
  v54 = __35__FBSDisplayConfiguration_isEqual___block_invoke_16;
  v55 = &unk_1E38EC288;
  v56 = v46;
  v49 = v46;
  v50 = (id)objc_msgSend(v5, "appendDouble:counterpart:", &v52, latency);
  LOBYTE(v46) = objc_msgSend(v5, "isEqual", v52, v53, v54, v55);

  return (char)v46;
}

- (double)pointScale
{
  double result;

  -[FBSDisplayMode pointScale](self->_currentMode, "pointScale");
  return result;
}

- (BOOL)isOverscanned
{
  return self->_overscanned;
}

- (NSString)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 144);
}

uint64_t __35__FBSDisplayConfiguration_isEqual___block_invoke_5(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 136);
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 128);
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 120);
}

uint64_t __35__FBSDisplayConfiguration_isEqual___block_invoke_9(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 216);
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke_8(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 160);
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 152);
}

double __35__FBSDisplayConfiguration_isEqual___block_invoke_16(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 104);
}

double __35__FBSDisplayConfiguration_isEqual___block_invoke_13(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 88);
}

double __35__FBSDisplayConfiguration_isEqual___block_invoke_12(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 72);
}

uint64_t __35__FBSDisplayConfiguration_isEqual___block_invoke_10(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 217);
}

uint64_t __35__FBSDisplayConfiguration_isEqual___block_invoke_11(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 112);
}

double __35__FBSDisplayConfiguration_isEqual___block_invoke_14(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 8);
}

double __35__FBSDisplayConfiguration_isEqual___block_invoke_15(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 40);
}

- (int64_t)overscanCompensation
{
  return self->_overscanCompensation;
}

- (int64_t)colorGamut
{
  return -[FBSDisplayMode colorGamut](self->_currentMode, "colorGamut");
}

- (id)CADisplay
{
  FBSDisplayConfiguration *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_caDisplay)
  {
    v3 = -[FBSDisplayIdentity displayID](v2->_identity, "displayID");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(getCADisplayClass(), "displays", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v8, "displayId") == v3)
          {
            objc_storeStrong((id *)&v2->_caDisplay, v8);
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

    if (!v2->_caDisplay)
    {
      FBLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[FBSDisplayConfiguration CADisplay].cold.1(v3, v9);

    }
  }
  objc_sync_exit(v2);

  return v2->_caDisplay;
}

- (id)_nameForDisplayType
{
  return FBSDisplayTypeName(-[FBSDisplayIdentity type](self->_identity, "type"));
}

- (void)encodeWithXPCDictionary:(id)a3
{
  FBSDisplayMode *currentMode;
  FBSDisplayMode *v5;
  xpc_object_t xdict;

  xdict = a3;
  if (xdict)
  {
    objc_msgSend(CFSTR("identity"), "UTF8String");
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    if (self->_hardwareIdentifier)
    {
      objc_msgSend(CFSTR("hardwareIdentifier"), "UTF8String");
      BSSerializeStringToXPCDictionaryWithKey();
    }
    if (self->_name)
    {
      objc_msgSend(CFSTR("name"), "UTF8String");
      BSSerializeStringToXPCDictionaryWithKey();
    }
    if (self->_deviceName)
    {
      objc_msgSend(CFSTR("deviceName"), "UTF8String");
      BSSerializeStringToXPCDictionaryWithKey();
    }
    xpc_dictionary_set_uint64(xdict, (const char *)objc_msgSend(CFSTR("seed"), "UTF8String"), self->_noEqual_seed);
    if (!self->_noEqual_comparable)
      xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("notComparable"), "UTF8String"), 1);
    if (self->_tags)
      xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("tags"), "UTF8String"), self->_tags);
    currentMode = self->_currentMode;
    +[FBSDisplayMode _emptyMode](FBSDisplayMode, "_emptyMode");
    v5 = (FBSDisplayMode *)objc_claimAutoreleasedReturnValue();

    if (currentMode != v5)
    {
      objc_msgSend(CFSTR("currentMode"), "UTF8String");
      BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    }
    if (self->_preferredMode)
    {
      objc_msgSend(CFSTR("preferredMode"), "UTF8String");
      BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    }
    if (-[NSSet count](self->_otherModes, "count"))
    {
      objc_msgSend(CFSTR("otherModes"), "UTF8String");
      BSSerializeSetOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
    }
    if (self->_cloningSupported)
      xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("cloningSupported"), "UTF8String"), 1);
    if (self->_overscanned)
      xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("overscanned"), "UTF8String"), 1);
    if (self->_overscanCompensation)
      xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("overscanCompensation"), "UTF8String"), self->_overscanCompensation);
    if ((BSSizeEqualToSize() & 1) == 0)
    {
      objc_msgSend(CFSTR("safeOverscanRatio"), "UTF8String");
      BSSerializeCGSizeToXPCDictionaryWithKey();
    }
    -[FBSDisplayMode pixelSize](self->_currentMode, "pixelSize");
    if ((BSSizeEqualToSize() & 1) == 0)
    {
      objc_msgSend(CFSTR("pixelSize"), "UTF8String");
      BSSerializeCGSizeToXPCDictionaryWithKey();
    }
    -[FBSDisplayMode nativePixelSize](self->_currentMode, "nativePixelSize");
    BSRectWithSize();
    if ((BSRectEqualToRect() & 1) == 0)
    {
      objc_msgSend(CFSTR("nativeBounds"), "UTF8String");
      BSSerializeCGRectToXPCDictionaryWithKey();
    }
    -[FBSDisplayMode size](self->_currentMode, "size");
    BSRectWithSize();
    if ((BSRectEqualToRect() & 1) == 0)
    {
      objc_msgSend(CFSTR("bounds"), "UTF8String");
      BSSerializeCGRectToXPCDictionaryWithKey();
    }
    if (self->_latency != 0.0)
      xpc_dictionary_set_double(xdict, (const char *)objc_msgSend(CFSTR("latency"), "UTF8String"), self->_latency);
  }

}

- (id)_initWithImmutableDisplay:(id)a3 originalDisplay:(id)a4 assertIfInvalid:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  FBSDisplayIdentity *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  float v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  id v43;
  int v44;
  int v45;
  int v46;
  id v47;
  void *v48;
  id v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  char v72;
  void *v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  uint64_t v79;
  uint64_t v80;
  id *v81;
  id *v82;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  id v91;
  unsigned int v92;
  double v93;
  double v94;
  id v95;
  double v96;
  double v97;
  uint64_t v98;
  _BOOL4 v99;
  void *v100;
  void *v101;
  FBSDisplayConfiguration *v102;
  id v103;
  void *v104;
  id obj;
  void *v106;
  void *v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  uint64_t v114;

  v5 = a5;
  v114 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v9, "tag");
  v12 = objc_msgSend(v9, "displayId");
  v100 = v10;
  v90 = a3;
  v91 = a4;
  v99 = v5;
  v98 = v11;
  if ((_DWORD)v12 == 1)
  {
    v13 = 0;
  }
  else
  {
    v14 = 8;
    v15 = 3;
    v16 = 6;
    v17 = 4;
    v18 = 5;
    v19 = 7;
    if ((v11 & 0x10000) == 0)
      v19 = -1;
    if ((v11 & 0x10) == 0)
      v18 = v19;
    if ((v11 & 8) == 0)
      v17 = v18;
    if ((v11 & 0x40) == 0)
      v16 = v17;
    if ((v11 & 0x20) == 0)
      v15 = v16;
    if ((v11 & 0x80) == 0)
      v14 = v15;
    if ((v11 & 4) != 0)
      v13 = 1;
    else
      v13 = v14;
  }
  v20 = objc_msgSend(v9, "displayType");
  if (v20 >= 3)
    v21 = 3;
  else
    v21 = v20;
  v22 = [FBSDisplayIdentity alloc];
  v23 = objc_msgSend(v9, "connectionSeed");
  v24 = objc_msgSend(v9, "processId");
  LOBYTE(v88) = 0;
  LOBYTE(v87) = objc_msgSend(v9, "isExternal");
  v25 = -[FBSDisplayIdentity _initWithType:UIKitMainLike:displayID:connectionType:connectionSeed:pid:external:uniqueIdentifier:secure:root:](v22, "_initWithType:UIKitMainLike:displayID:connectionType:connectionSeed:pid:external:uniqueIdentifier:secure:root:", v13, (_DWORD)v12 == 1, v12, v21, v23, v24, v87, 0, v88, 0);
  objc_msgSend(v9, "nativeOrientation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = FBSDisplayRotationFromCADisplayRotation(v26);

  if ((_DWORD)v12 != 1)
  {
    objc_msgSend(v9, "currentOrientation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v27 - FBSDisplayRotationFromCADisplayRotation(v28) + 4;
    v30 = v29 & 3;
    v32 = -v29;
    v31 = v32 < 0;
    v33 = v32 & 3;
    if (v31)
      v27 = v30;
    else
      v27 = -v33;

  }
  v34 = 0.0;
  if ((objc_msgSend(v25, "isMainDisplay") & 1) == 0)
  {
    BKSDisplayServicesGetExternalDisplayScale();
    v34 = v35;
  }
  objc_msgSend(v9, "currentMode");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredMode");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "availableModes");
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v109, v113, 16);
  v101 = v25;
  v102 = self;
  obj = v36;
  if (!v37)
  {

    v48 = 0;
LABEL_50:
    v106 = v48;
    if (!objc_msgSend(v48, "count"))
    {
      if (objc_msgSend(v25, "isMainDisplay"))
      {
        +[FBSDisplayMode _emptyMode](FBSDisplayMode, "_emptyMode");
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v47 = 0;
      }
      else
      {
        v47 = 0;
        v39 = 0;
      }
      goto LABEL_54;
    }
    v49 = 0;
    v48 = v106;
LABEL_79:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("if there is no currentMode then there can't be any modes at all : preferred=%@ other=%@ : currentCA=%@ preferredCA=%@ availableCA=%@"), v49, v48, v108, v107, v36);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfiguration _initWithImmutableDisplay:originalDisplay:assertIfInvalid:].cold.1();
    objc_msgSend(objc_retainAutorelease(v86), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E2688);
  }
  v38 = v37;
  v95 = v9;
  v106 = 0;
  v103 = 0;
  v39 = 0;
  v40 = *(_QWORD *)v110;
  do
  {
    for (i = 0; i != v38; ++i)
    {
      if (*(_QWORD *)v110 != v40)
        objc_enumerationMutation(obj);
      v42 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
      v43 = -[FBSDisplayMode _initWithCADisplayMode:scale:rotation:]([FBSDisplayMode alloc], "_initWithCADisplayMode:scale:rotation:", v42, v27, v34);
      v44 = objc_msgSend(v42, "isEqual:", v108);
      v45 = objc_msgSend(v42, "isEqual:", v107);
      v46 = v45;
      if ((v44 & 1) != 0 || v45)
      {
        if (v44)
        {
          if (v39)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("somehow I have multiple availableModes that match currentMode : current=%@ new=%@ available=%@"), v108, v42, obj);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[FBSDisplayConfiguration _initWithImmutableDisplay:originalDisplay:assertIfInvalid:].cold.3();
            objc_msgSend(objc_retainAutorelease(v84), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A6E25ACLL);
          }
          v39 = v43;
        }
        if (v46)
        {
          if (v103)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("somehow I have multiple availableModes that match preferredMode : preferred=%@ new=%@ available=%@"), v107, v42, obj);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[FBSDisplayConfiguration _initWithImmutableDisplay:originalDisplay:assertIfInvalid:].cold.2();
            objc_msgSend(objc_retainAutorelease(v85), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A6E2614);
          }
          v103 = v43;
        }
      }
      else if (v106)
      {
        objc_msgSend(v106, "addObject:", v43);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v43);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v113, 16);
  }
  while (v38);
  v36 = obj;

  if (!v39)
  {
    v25 = v101;
    v9 = v95;
    v48 = v106;
    v49 = v103;
    if (v103)
      goto LABEL_79;
    goto LABEL_50;
  }
  v9 = v95;
  v47 = v103;
LABEL_54:
  objc_msgSend(v9, "frame");
  if ((v27 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    v52 = v51;
  else
    v52 = v50;
  if ((v27 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    v53 = v50;
  else
    v53 = v51;
  objc_msgSend(v39, "pointScale");
  v55 = v54;
  objc_msgSend(v9, "bounds");
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v96 = v53;
  v97 = v52;
  v93 = v58;
  v94 = v56;
  if (BSFloatIsZero())
  {
    v64 = *MEMORY[0x1E0C9D5E0];
    v65 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v66 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v67 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  else
  {
    v64 = v57 / v55;
    v65 = v59 / v55;
    if ((v27 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v66 = v63 / v55;
      v67 = v61 / v55;
    }
    else
    {
      v66 = v61 / v55;
      v67 = v63 / v55;
    }
  }
  objc_msgSend(v9, "uniqueId");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceName");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v9, "seed");
  v104 = v47;
  if (v47 == v39)
    v47 = 0;
  v71 = objc_msgSend(v9, "isCloningSupported");
  v72 = objc_msgSend(v9, "isOverscanned");
  objc_msgSend(v9, "overscanAdjustment");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = FBSDisplayOverscanCompensationFromCADisplayOverscanAdjustment(v73);
  objc_msgSend(v9, "overscanAmounts");
  v76 = v75;
  v78 = v77;
  objc_msgSend(v9, "latency");
  v80 = 1;
  if (!v99)
    v80 = 2;
  BYTE1(v89) = v72;
  LOBYTE(v89) = v71;
  v81 = -[FBSDisplayConfiguration _initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:](v102, "_initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:", v101, v68, v69, v70, v92, 1, v76, v78, v97, v96, v94, v93, v61, v63, v98,
          v39,
          v47,
          v106,
          v89,
          v74,
          *(_QWORD *)&v64,
          *(_QWORD *)&v65,
          *(_QWORD *)&v66,
          *(_QWORD *)&v67,
          v79,
          0,
          v80);

  if (v81)
  {
    objc_storeStrong(v81 + 22, v90);
    objc_storeStrong(v81 + 23, v91);
  }
  v82 = v81;

  return v82;
}

- (FBSDisplayConfiguration)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FBSDisplayConfiguration *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  BOOL v12;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  BOOL v36;
  int64_t int64;
  void *v38;
  uint64_t uint64;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(CFSTR("identity"), "UTF8String");
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("currentMode"), "UTF8String");
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      if (objc_msgSend(v5, "isMainDisplay"))
      {
        +[FBSDisplayMode _emptyMode](FBSDisplayMode, "_emptyMode");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
    }
    v44 = v5;
    xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("safeOverscanRatio"), "UTF8String"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("pixelSize"), "UTF8String"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("nativeBounds"), "UTF8String"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("bounds"), "UTF8String"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = xpc_dictionary_get_double(v4, (const char *)objc_msgSend(CFSTR("latency"), "UTF8String"));
    objc_msgSend(CFSTR("hardwareIdentifier"), "UTF8String", v40, 0.0);
    BSDeserializeStringFromXPCDictionaryWithKey();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("name"), "UTF8String");
    BSDeserializeStringFromXPCDictionaryWithKey();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("deviceName"), "UTF8String");
    BSDeserializeStringFromXPCDictionaryWithKey();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    uint64 = xpc_dictionary_get_uint64(v4, (const char *)objc_msgSend(CFSTR("seed"), "UTF8String"));
    v10 = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("notComparable"), "UTF8String"));
    int64 = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("tags"), "UTF8String"));
    objc_msgSend(CFSTR("preferredMode"), "UTF8String");
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("otherModes"), "UTF8String");
    BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("cloningSupported"), "UTF8String"));
    v12 = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("overscanned"), "UTF8String"));
    v13 = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("overscanCompensation"), "UTF8String"));
    if (v8)
    {
      BSDeserializeCGSizeFromXPCObject();
      v15 = v14;
      v17 = v16;
    }
    else
    {
      v15 = 1.0;
      v17 = 1.0;
    }
    if (v46)
      BSDeserializeCGSizeFromXPCObject();
    else
      objc_msgSend(v6, "pixelSize");
    v20 = v18;
    v21 = v19;
    if (v45)
    {
      BSDeserializeCGRectFromXPCObject();
    }
    else
    {
      objc_msgSend(v6, "nativePixelSize");
      BSRectWithSize();
    }
    v26 = v22;
    v27 = v23;
    v28 = v24;
    v29 = v25;
    if (v9)
    {
      BSDeserializeCGRectFromXPCObject();
    }
    else
    {
      objc_msgSend(v6, "size");
      BSRectWithSize();
    }
    BYTE1(v35) = v12;
    LOBYTE(v35) = v36;
    self = (FBSDisplayConfiguration *)objc_retain(-[FBSDisplayConfiguration _initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:](self, "_initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:", v44, v43, v42, v41, uint64, !v10, v15, v17, v20, v21, v26, v27, v28,
                                          v29,
                                          int64,
                                          v6,
                                          v38,
                                          v11,
                                          v35,
                                          v13,
                                          v30,
                                          v31,
                                          v32,
                                          v33,
                                          *(_QWORD *)&v40,
                                          0,
                                          2));

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)_initWithIdentity:(void *)a3 hardwareIdentifier:(void *)a4 name:(void *)a5 deviceName:(void *)a6 seed:(int)a7 comparable:(char)a8 tags:(double)a9 currentMode:(double)a10 preferredMode:(CGFloat)a11 otherModes:(CGFloat)a12 cloningSupported:(CGFloat)a13 overscanned:(CGFloat)a14 overscanCompensation:(CGFloat)a15 safeOverscanRatio:(CGFloat)a16 pixelSize:(void *)a17 nativeBounds:(void *)a18 bounds:(void *)a19 latency:(void *)a20 originatingConfiguration:(char)a21 validityCheck:(char)a22
{
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id *v48;
  id *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  int v67;
  CGFloat v68;
  CGFloat v69;
  void *v70;
  NSObject *v71;
  uint64_t result;
  void *v73;
  id v77;
  id v78;
  id v79;
  id v80;
  objc_super v81;
  uint8_t buf[4];
  id *v83;
  uint64_t v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v84 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v43 = a4;
  v80 = a5;
  v79 = a6;
  v44 = a18;
  v78 = a19;
  v45 = v43;
  v46 = a20;
  v47 = a29;
  v81.receiver = a1;
  v81.super_class = (Class)FBSDisplayConfiguration;
  v48 = (id *)objc_msgSendSuper2(&v81, sel_init);
  v49 = v48;
  if (v48)
  {
    objc_storeStrong(v48 + 14, a3);
    v50 = objc_msgSend(v45, "copy");
    v51 = v49[15];
    v49[15] = (id)v50;

    v52 = objc_msgSend(v80, "copy");
    v53 = v49[16];
    v49[16] = (id)v52;

    v54 = objc_msgSend(v79, "copy");
    v55 = v49[17];
    v49[17] = (id)v54;

    *((_DWORD *)v49 + 52) = a7;
    *((_BYTE *)v49 + 218) = a8;
    v49[24] = a17;
    objc_storeStrong(v49 + 18, a18);
    if (v49[18])
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:");
    else
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v78)
    {
      objc_storeStrong(v49 + 19, a19);
      objc_msgSend(v56, "addObject:", v49[19]);
    }
    if (objc_msgSend(v46, "count"))
    {
      v57 = objc_msgSend(v46, "copy");
      v58 = v49[20];
      v49[20] = (id)v57;

      objc_msgSend(v56, "unionSet:", v46);
    }
    v59 = objc_msgSend(v56, "copy");
    v60 = v49[21];
    v49[21] = (id)v59;

    *((_BYTE *)v49 + 216) = a21;
    *((_BYTE *)v49 + 217) = a22;
    v49[25] = (id)a23;
    *((double *)v49 + 9) = a9;
    *((double *)v49 + 10) = a10;
    *((CGFloat *)v49 + 11) = a11;
    *((CGFloat *)v49 + 12) = a12;
    *((CGFloat *)v49 + 1) = a13;
    *((CGFloat *)v49 + 2) = a14;
    *((CGFloat *)v49 + 3) = a15;
    *((CGFloat *)v49 + 4) = a16;
    *((CGFloat *)v49 + 5) = a24;
    *((CGFloat *)v49 + 6) = a25;
    *((CGFloat *)v49 + 7) = a26;
    *((CGFloat *)v49 + 8) = a27;
    v49[13] = a28;
    v61 = objc_msgSend(v47, "copy");
    v62 = v49[28];
    v49[28] = (id)v61;

  }
  if (a30 == 3)
  {
    v63 = v77;
LABEL_41:

    return (uint64_t)v49;
  }
  v63 = v77;
  if (v77)
  {
    v64 = objc_msgSend(v77, "type");
    v65 = objc_msgSend(v77, "connectionType");
  }
  else
  {
    v64 = -1;
    v65 = -1;
  }
  v66 = objc_opt_class();
  if (v66 == objc_opt_class() && FBSDisplayTypeIsValid(v64) && FBSDisplayConnectionTypeIsValid(v65))
  {
    if (v64)
    {
      if (!v44)
        goto LABEL_34;
    }
    else
    {
      v67 = objc_msgSend(v77, "displayID");
      if (!v44 || v67 != 1)
        goto LABEL_34;
    }
    if (FBSDisplayOverscanCompensationIsValid(a23) && a9 >= 0.0 && a9 <= 1.0 && a10 >= 0.0 && a10 <= 1.0)
    {
      v68 = *MEMORY[0x1E0C9D538];
      v69 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v85.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
      v85.origin.y = v69;
      v85.size.width = a11;
      v85.size.height = a12;
      if (!CGRectIsNull(v85))
      {
        v86.origin.x = v68;
        v86.origin.y = v69;
        v86.size.width = a11;
        v86.size.height = a12;
        if (!CGRectIsInfinite(v86))
        {
          v87.origin.x = a13;
          v87.origin.y = a14;
          v87.size.width = a15;
          v87.size.height = a16;
          if (!CGRectIsNull(v87))
          {
            v88.origin.x = a13;
            v88.origin.y = a14;
            v88.size.width = a15;
            v88.size.height = a16;
            if (!CGRectIsInfinite(v88))
            {
              v89.origin.x = a24;
              v89.origin.y = a25;
              v89.size.width = a26;
              v89.size.height = a27;
              if (!CGRectIsNull(v89))
              {
                v90.origin.x = a24;
                v90.origin.y = a25;
                v90.size.width = a26;
                v90.size.height = a27;
                if (!CGRectIsInfinite(v90))
                  goto LABEL_41;
              }
            }
          }
        }
      }
    }
  }
LABEL_34:
  if (a30 == 2)
  {
    FBLogCommon();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v83 = v49;
      _os_log_impl(&dword_19A6D4000, v71, OS_LOG_TYPE_INFO, "FBSDisplayConfiguration cannot be initialized as requested : %{public}@", buf, 0xCu);
    }

    v70 = v49;
    v49 = 0;
    goto LABEL_40;
  }
  if (a30 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, v49, CFSTR("FBSDisplay.m"), 634, CFSTR("FBSDisplayConfiguration cannot be initialized as requested : %@"), v49);
LABEL_40:

    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBSDisplayConfiguration cannot be initialized as requested : %@"), v49);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSDisplayConfiguration _initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:].cold.1();
  objc_msgSend(objc_retainAutorelease(v73), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)copyWithOverrideMode:(id)a3 pixelSize:(CGSize)a4 nativeBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  FBSDisplayConfigurationBuilder *v22;
  void *v23;
  void *v24;
  void *v26;
  double v27;
  double v28;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.height;
  v10 = a4.width;
  v12 = a3;
  NSClassFromString(CFSTR("FBSDisplayMode"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfiguration copyWithOverrideMode:pixelSize:nativeBounds:].cold.1();
LABEL_14:
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E3C2CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSDisplayModeClass]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfiguration copyWithOverrideMode:pixelSize:nativeBounds:].cold.1();
    goto LABEL_14;
  }
  v27 = v10;
  v28 = v9;

  v13 = objc_msgSend(v12, "_rotation");
  objc_msgSend(v12, "pointScale");
  v15 = v14;
  if (BSFloatIsZero())
  {
    v16 = x;
    v17 = y;
    v19 = *MEMORY[0x1E0C9D5E0];
    v18 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v20 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  else
  {
    v16 = x;
    v19 = x / v15;
    v17 = y;
    v18 = y / v15;
    if ((v13 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v20 = height / v15;
      v21 = width / v15;
    }
    else
    {
      v20 = width / v15;
      v21 = height / v15;
    }
  }
  v22 = -[FBSDisplayConfigurationBuilder initWithConfiguration:]([FBSDisplayConfigurationBuilder alloc], "initWithConfiguration:", self);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:](v22, "setCurrentMode:preferredMode:otherModes:", v12, v12, v23);

  -[FBSDisplayConfigurationBuilder setPixelSize:nativeBounds:bounds:](v22, "setPixelSize:nativeBounds:bounds:", v27, v28, v16, v17, width, height, *(_QWORD *)&v19, *(_QWORD *)&v18, *(_QWORD *)&v20, *(_QWORD *)&v21);
  -[FBSDisplayConfigurationBuilder buildConfigurationWithError:](v22, "buildConfigurationWithError:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (NSSet)availableModes
{
  return self->_availableModes;
}

- (int64_t)_nativeRotation
{
  return -[FBSDisplayMode _rotation](self->_currentMode, "_rotation");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noEqual_originatingConfiguration, 0);
  objc_storeStrong((id *)&self->_caDisplay, 0);
  objc_storeStrong((id *)&self->_immutableCADisplay, 0);
  objc_storeStrong((id *)&self->_availableModes, 0);
  objc_storeStrong((id *)&self->_otherModes, 0);
  objc_storeStrong((id *)&self->_preferredMode, 0);
  objc_storeStrong((id *)&self->_currentMode, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (FBSDisplayMode)currentMode
{
  return self->_currentMode;
}

- (NSString)name
{
  return self->_name;
}

- (double)refreshRate
{
  double result;

  -[FBSDisplayMode refreshRate](self->_currentMode, "refreshRate");
  return result;
}

- (int64_t)type
{
  return -[FBSDisplayIdentity type](self->_identity, "type");
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (BOOL)isCarInstrumentsDisplay
{
  return -[FBSDisplayIdentity isCarInstrumentsDisplay](self->_identity, "isCarInstrumentsDisplay");
}

- (BOOL)isMainDisplay
{
  return -[FBSDisplayIdentity isMainDisplay](self->_identity, "isMainDisplay");
}

- (FBSDisplayConfiguration)initWithCADisplay:(id)a3
{
  id v4;
  void *v5;
  FBSDisplayConfiguration *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "immutableCopy");
  v6 = -[FBSDisplayConfiguration _initWithImmutableDisplay:originalDisplay:assertIfInvalid:](self, "_initWithImmutableDisplay:originalDisplay:assertIfInvalid:", v5, v4, 0);

  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSDisplayConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSDisplayConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  FBSDisplayConfiguration *v13;
  id v14;

  v4 = a3;
  -[FBSDisplayConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__FBSDisplayConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E38EC2B0;
  v6 = v5;
  v12 = v6;
  v13 = self;
  v14 = v4;
  v7 = v4;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v7, v11);
  v8 = v14;
  v9 = v6;

  return v9;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t overscanCompensation;
  const __CFString *v13;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identity, 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[FBSDisplayMode _referenceSizeDescription](self->_currentMode, "_referenceSizeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSDisplayMode refreshRate](self->_currentMode, "refreshRate");
  v8 = v7;
  FBSDisplayGamutDescription(-[FBSDisplayMode colorGamut](self->_currentMode, "colorGamut"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  FBSDisplayHDRModeDescription(-[FBSDisplayMode hdrMode](self->_currentMode, "hdrMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %gHz %@ %@"), v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v11, CFSTR("mode"));

  if (self->_overscanned)
  {
    overscanCompensation = self->_overscanCompensation;
    if (overscanCompensation == 1)
    {
      v13 = CFSTR("scaled");
      goto LABEL_6;
    }
    if (overscanCompensation == 2)
    {
      v13 = CFSTR("inset");
LABEL_6:
      objc_msgSend(v3, "appendString:withName:", v13, CFSTR("overscan"));
    }
  }
  return v3;
}

void __65__FBSDisplayConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120), CFSTR("CADisplay.uniqueID"), 1);
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), CFSTR("CADisplay.name"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136), CFSTR("CADisplay.deviceName"));
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInt:withName:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 208), CFSTR("CADisplay.seed"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 192), CFSTR("tags"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144), CFSTR("currentMode"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152), CFSTR("preferredMode"), 1);
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 216), CFSTR("cloningSupported"), 1);
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v7 + 217))
  {
    FBSDisplayOverscanCompensationDescription(*(_QWORD *)(v7 + 200));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:withName:", v9, CFSTR("overscanCompensation"));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", CFSTR("n/a"), CFSTR("overscanCompensation"));
  }
  if (!BSFloatIsOne() || (BSFloatIsOne() & 1) == 0)
    v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", CFSTR("safeOverscanRatio"), *(double *)(*(_QWORD *)(a1 + 40) + 72), *(double *)(*(_QWORD *)(a1 + 40) + 80));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", CFSTR("pixelSize"), *(double *)(*(_QWORD *)(a1 + 40) + 88), *(double *)(*(_QWORD *)(a1 + 40) + 96));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", CFSTR("bounds"), *(double *)(*(_QWORD *)(a1 + 40) + 40), *(double *)(*(_QWORD *)(a1 + 40) + 48), *(double *)(*(_QWORD *)(a1 + 40) + 56), *(double *)(*(_QWORD *)(a1 + 40) + 64));
  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "renderingCenter");
  v14 = (id)objc_msgSend(v13, "appendPoint:withName:", CFSTR("renderingCenter"));
  v15 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v16, CFSTR("otherModes"), *(_QWORD *)(a1 + 48), 1);

  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(v17 + 176);
  if (v18)
  {
    v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPointer:withName:", v18, CFSTR("immutableCADisplay"));
    v17 = *(_QWORD *)(a1 + 40);
  }
  v20 = *(_QWORD *)(v17 + 184);
  if (v20)
    v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPointer:withName:", v20, CFSTR("CADisplay"));
}

- (CGPoint)renderingCenter
{
  double v2;
  double v3;
  CGPoint result;

  BSRectGetCenter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)isCloningSupported
{
  return self->_cloningSupported;
}

- (id)copyWithOverrideMode:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v15;

  v4 = a3;
  NSClassFromString(CFSTR("FBSDisplayMode"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfiguration copyWithOverrideMode:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6F78E8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSDisplayModeClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfiguration copyWithOverrideMode:].cold.1();
    goto LABEL_9;
  }

  objc_msgSend(v4, "pixelSize");
  v6 = v5;
  v8 = v7;
  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v4, "nativePixelSize");
  v13 = -[FBSDisplayConfiguration copyWithOverrideMode:pixelSize:nativeBounds:](self, "copyWithOverrideMode:pixelSize:nativeBounds:", v4, v6, v8, v9, v10, v11, v12);

  return v13;
}

- (FBSDisplayConfiguration)init
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  FBSDisplayConfiguration *result;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  FBSDisplayConfiguration *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("init is unavailable on %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = CFSTR("FBSDisplay.m");
    v20 = 1024;
    v21 = 391;
    v22 = 2114;
    v23 = v7;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  result = (FBSDisplayConfiguration *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBSDisplayConfiguration)initWithCADisplay:(id)a3 isMainDisplay:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  FBSDisplayConfiguration *v7;
  FBSDisplayConfiguration *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = -[FBSDisplayConfiguration initWithCADisplay:](self, "initWithCADisplay:", v6);
  v8 = v7;
  if (v4)
  {
    if (!-[FBSDisplayConfiguration isMainDisplay](v7, "isMainDisplay"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create a main FBSDisplayConfiguration from CADisplay=%@ -> created=%@"), v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSDisplayConfiguration initWithCADisplay:isMainDisplay:].cold.1();
      goto LABEL_11;
    }
  }
  else if (v7 && -[FBSDisplayConfiguration isMainDisplay](v7, "isMainDisplay"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create a non-main FBSDisplayConfiguration from CADisplay=%@ -> created=%@"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfiguration initWithCADisplay:isMainDisplay:].cold.2();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A717CB0);
  }

  return v8;
}

- (FBSDisplayMode)preferredMode
{
  FBSDisplayMode *preferredMode;

  preferredMode = self->_preferredMode;
  if (!preferredMode)
    preferredMode = self->_currentMode;
  return preferredMode;
}

- (double)nativeOrientation
{
  return FBSDisplayRotationRadians(-[FBSDisplayMode _rotation](self->_currentMode, "_rotation"));
}

- (id)uniqueIdentifier
{
  return -[FBSDisplayIdentity uniqueIdentifier](self->_identity, "uniqueIdentifier");
}

- (BOOL)expectsSecureRendering
{
  return -[FBSDisplayIdentity expectsSecureRendering](self->_identity, "expectsSecureRendering");
}

- (id)copyWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  FBSDisplayConfiguration *v7;
  FBSDisplayConfigurationBuilder *v8;
  void *v10;

  v4 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfiguration copyWithUniqueIdentifier:].cold.1();
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A717EACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfiguration copyWithUniqueIdentifier:].cold.1();
    goto LABEL_12;
  }

  -[FBSDisplayIdentity uniqueIdentifier](self->_identity, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BSEqualObjects();

  if (v6)
  {
    v7 = self;
  }
  else
  {
    v8 = -[FBSDisplayConfigurationBuilder initWithConfiguration:]([FBSDisplayConfigurationBuilder alloc], "initWithConfiguration:", self);
    -[FBSDisplayConfigurationBuilder setUniqueIdentifier:](v8, "setUniqueIdentifier:", v4);
    -[FBSDisplayConfigurationBuilder buildConfigurationWithError:](v8, "buildConfigurationWithError:", 0);
    v7 = (FBSDisplayConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)copyWithOverrideBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  FBSDisplayConfigurationBuilder *v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[FBSDisplayConfigurationBuilder initWithConfiguration:]([FBSDisplayConfigurationBuilder alloc], "initWithConfiguration:", self);
  -[FBSDisplayConfigurationBuilder setPixelSize:nativeBounds:bounds:](v8, "setPixelSize:nativeBounds:bounds:", self->_pixelSize.width, self->_pixelSize.height, self->_nativeBounds.origin.x, self->_nativeBounds.origin.y, self->_nativeBounds.size.width, self->_nativeBounds.size.height, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
  -[FBSDisplayConfigurationBuilder buildConfigurationWithError:](v8, "buildConfigurationWithError:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGRect)_nativeBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_nativeBounds.origin.x;
  y = self->_nativeBounds.origin.y;
  width = self->_nativeBounds.size.width;
  height = self->_nativeBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)immutableCADisplay
{
  return self->_immutableCADisplay;
}

- (id)laterConfiguration:(id)a3
{
  FBSDisplayConfiguration *v4;
  void *v5;
  int v6;
  FBSDisplayConfiguration *v7;
  FBSDisplayConfiguration *v8;

  v4 = (FBSDisplayConfiguration *)a3;
  -[FBSDisplayConfiguration identity](v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BSEqualObjects();

  if (v6 && self->_noEqual_comparable && v4->_noEqual_comparable)
  {
    if (self->_noEqual_seed >= v4->_noEqual_seed)
      v7 = self;
    else
      v7 = v4;
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyForSecureRendering
{
  FBSDisplayConfigurationBuilder *v3;
  void *v4;

  if (-[FBSDisplayIdentity expectsSecureRendering](self->_identity, "expectsSecureRendering"))
    return self;
  v3 = -[FBSDisplayConfigurationBuilder initWithConfiguration:]([FBSDisplayConfigurationBuilder alloc], "initWithConfiguration:", self);
  -[FBSDisplayConfigurationBuilder setExpectsSecureRendering](v3, "setExpectsSecureRendering");
  -[FBSDisplayConfigurationBuilder buildConfigurationWithError:](v3, "buildConfigurationWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isUIKitMainLike
{
  return -[FBSDisplayIdentity isUIKitMainLike](self->_identity, "isUIKitMainLike");
}

- (BOOL)isHiddenDisplay
{
  return self->_tags & 1;
}

- (BOOL)wantsConnectionDebouncing
{
  return (LOBYTE(self->_tags) >> 1) & 1;
}

- (unint64_t)hash
{
  return -[FBSDisplayIdentity hash](self->_identity, "hash");
}

- (NSString)description
{
  return (NSString *)-[FBSDisplayConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FBSDisplayConfiguration)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  FBSDisplayConfiguration *v35;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  char v42;
  void *v43;
  uint64_t v44;
  void *v45;
  unsigned int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (objc_msgSend(v4, "isMainDisplay"))
    {
      +[FBSDisplayMode _emptyMode](FBSDisplayMode, "_emptyMode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("safeOverscanRatio"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pixelSize"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nativeBounds"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bounds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hardwareIdentifier"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("seed"));
  v8 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("notComparable"));
  v44 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("tags"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredMode"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("cloningSupported"));
  v12 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("overscanned"));
  v13 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("overscanCompensation"));
  if (v6)
  {
    v14 = MEMORY[0x19AEC9CC4](v6);
    v40 = v15;
    v41 = v14;
  }
  else
  {
    v40 = 1.0;
    v41 = 1.0;
  }
  if (v52)
    MEMORY[0x19AEC9CC4]();
  else
    objc_msgSend(v5, "pixelSize");
  v38 = v17;
  v39 = v16;
  if (v51)
  {
    MEMORY[0x19AEC9B98]();
  }
  else
  {
    objc_msgSend(v5, "nativePixelSize");
    BSRectWithSize();
  }
  v22 = v18;
  v23 = v19;
  v24 = v20;
  v25 = v21;
  if (v7)
  {
    MEMORY[0x19AEC9B98](v7);
  }
  else
  {
    objc_msgSend(v5, "size");
    BSRectWithSize();
  }
  v30 = v26;
  v31 = v27;
  v32 = v28;
  v33 = v29;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("latency"));
  BYTE1(v37) = v12;
  LOBYTE(v37) = v42;
  v35 = -[FBSDisplayConfiguration _initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:](self, "_initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:", v4, v49, v48, v47, v46, v8 ^ 1u, v41, v40, v39, v38, v22, v23, v24, v25, v44,
          v5,
          v45,
          v11,
          v37,
          v13,
          v30,
          v31,
          v32,
          v33,
          v34,
          0,
          2);

  return v35;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *hardwareIdentifier;
  NSString *name;
  NSString *deviceName;
  void *v7;
  int64_t tags;
  FBSDisplayMode *currentMode;
  FBSDisplayMode *v10;
  FBSDisplayMode *preferredMode;
  int64_t overscanCompensation;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "encodeObject:forKey:", self->_identity, CFSTR("identity"));
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier)
    objc_msgSend(v18, "encodeObject:forKey:", hardwareIdentifier, CFSTR("hardwareIdentifier"));
  name = self->_name;
  if (name)
    objc_msgSend(v18, "encodeObject:forKey:", name, CFSTR("name"));
  deviceName = self->_deviceName;
  v7 = v18;
  if (deviceName)
  {
    objc_msgSend(v18, "encodeObject:forKey:", deviceName, CFSTR("deviceName"));
    v7 = v18;
  }
  objc_msgSend(v7, "encodeInt32:forKey:", self->_noEqual_seed, CFSTR("seed"));
  if (!self->_noEqual_comparable)
    objc_msgSend(v18, "encodeBool:forKey:", 1, CFSTR("notComparable"));
  tags = self->_tags;
  if (tags)
    objc_msgSend(v18, "encodeInteger:forKey:", tags, CFSTR("tags"));
  currentMode = self->_currentMode;
  +[FBSDisplayMode _emptyMode](FBSDisplayMode, "_emptyMode");
  v10 = (FBSDisplayMode *)objc_claimAutoreleasedReturnValue();

  if (currentMode != v10)
    objc_msgSend(v18, "encodeObject:forKey:", self->_currentMode, CFSTR("currentMode"));
  preferredMode = self->_preferredMode;
  if (preferredMode)
    objc_msgSend(v18, "encodeObject:forKey:", preferredMode, CFSTR("preferredMode"));
  if (-[NSSet count](self->_otherModes, "count"))
    objc_msgSend(v18, "encodeObject:forKey:", self->_otherModes, CFSTR("otherModes"));
  if (self->_cloningSupported)
    objc_msgSend(v18, "encodeBool:forKey:", 1, CFSTR("cloningSupported"));
  if (self->_overscanned)
    objc_msgSend(v18, "encodeBool:forKey:", 1, CFSTR("overscanned"));
  overscanCompensation = self->_overscanCompensation;
  if (overscanCompensation)
    objc_msgSend(v18, "encodeInteger:forKey:", overscanCompensation, CFSTR("overscanCompensation"));
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    BSValueWithSize();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("safeOverscanRatio"));

  }
  -[FBSDisplayMode pixelSize](self->_currentMode, "pixelSize");
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    BSValueWithSize();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v14, CFSTR("pixelSize"));

  }
  -[FBSDisplayMode nativePixelSize](self->_currentMode, "nativePixelSize");
  BSRectWithSize();
  if ((BSRectEqualToRect() & 1) == 0)
  {
    BSValueWithRect();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("nativeBounds"));

  }
  -[FBSDisplayMode size](self->_currentMode, "size");
  BSRectWithSize();
  if ((BSRectEqualToRect() & 1) == 0)
  {
    BSValueWithRect();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v16, CFSTR("bounds"));

  }
  v17 = v18;
  if (self->_latency != 0.0)
  {
    objc_msgSend(v18, "encodeDouble:forKey:", CFSTR("latency"));
    v17 = v18;
  }

}

- (id)uniqueID
{
  return self->_hardwareIdentifier;
}

- (CGPoint)nativeCenter
{
  FBSDisplayMode *currentMode;
  CGSize *p_pixelSize;
  CGSize *p_height;
  double v6;
  double v7;
  CGPoint result;

  currentMode = self->_currentMode;
  if (currentMode && (-[FBSDisplayMode _rotation](currentMode, "_rotation") & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    p_pixelSize = &self->_pixelSize;
    p_height = (CGSize *)&self->_pixelSize.height;
  }
  else
  {
    p_height = &self->_pixelSize;
    p_pixelSize = (CGSize *)&self->_pixelSize.height;
  }
  v6 = p_pixelSize->width * 0.5;
  v7 = p_height->width * 0.5;
  result.y = v6;
  result.x = v7;
  return result;
}

- (BOOL)isConnected
{
  return 1;
}

- (BOOL)supportsExtendedColor
{
  return -[FBSDisplayMode colorGamut](self->_currentMode, "colorGamut") != 0;
}

- (unsigned)displayID
{
  return -[FBSDisplayIdentity displayID](self->_identity, "displayID");
}

- (CGSize)safeOverscanRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_safeOverscanRatio.width;
  height = self->_safeOverscanRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)latency
{
  return self->_latency;
}

- (FBSDisplayConfiguration)originatingConfiguration
{
  return self->_noEqual_originatingConfiguration;
}

- (unsigned)seed
{
  return self->_noEqual_seed;
}

- (int64_t)tags
{
  return self->_tags;
}

- (void)initWithCADisplay:isMainDisplay:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithCADisplay:isMainDisplay:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithImmutableDisplay:originalDisplay:assertIfInvalid:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithImmutableDisplay:originalDisplay:assertIfInvalid:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithImmutableDisplay:originalDisplay:assertIfInvalid:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)copyWithUniqueIdentifier:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)copyWithOverrideMode:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)copyWithOverrideMode:pixelSize:nativeBounds:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)CADisplay
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_19A6D4000, a2, OS_LOG_TYPE_ERROR, "Unable to find a CADisplay for decoded displayID %u. The render server process may have crashed.", (uint8_t *)v2, 8u);
}

@end
