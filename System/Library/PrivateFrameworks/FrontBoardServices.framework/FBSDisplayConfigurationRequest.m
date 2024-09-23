@implementation FBSDisplayConfigurationRequest

- (FBSDisplayConfigurationRequest)init
{
  FBSDisplayConfigurationRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBSDisplayConfigurationRequest;
  result = -[FBSDisplayConfigurationRequest init](&v3, sel_init);
  if (result)
  {
    result->_overscanCompensation = -1;
    result->_hdrMode = -1;
  }
  return result;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;

  objc_msgSend(off_1E38E9E08, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_overscanCompensation);
  v5 = (id)objc_msgSend(v3, "appendCGSize:", self->_nativePixelSize.width, self->_nativePixelSize.height);
  v6 = (id)objc_msgSend(v3, "appendCGFloat:", self->_pointScale);
  v7 = (id)objc_msgSend(v3, "appendDouble:", self->_refreshRate);
  v8 = (id)objc_msgSend(v3, "appendInteger:", self->_hdrMode);
  v9 = (id)objc_msgSend(v3, "appendCGSize:", self->_logicalScale.width, self->_logicalScale.height);
  v10 = objc_msgSend(v3, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t overscanCompensation;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  double pointScale;
  id v13;
  id v14;
  double refreshRate;
  id v16;
  id v17;
  int64_t hdrMode;
  id v19;
  id v20;
  double width;
  double height;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  double (*v28)(uint64_t);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v4 = a3;
  objc_msgSend(off_1E38E9E00, "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  overscanCompensation = self->_overscanCompensation;
  v7 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __42__FBSDisplayConfigurationRequest_isEqual___block_invoke;
  v39[3] = &unk_1E38EB9E8;
  v8 = v4;
  v40 = v8;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", overscanCompensation, v39);
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_2;
  v37[3] = &unk_1E38EC260;
  v10 = v8;
  v38 = v10;
  v11 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v37, self->_nativePixelSize.width, self->_nativePixelSize.height);
  pointScale = self->_pointScale;
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_3;
  v35[3] = &unk_1E38EC288;
  v13 = v10;
  v36 = v13;
  v14 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v35, pointScale);
  refreshRate = self->_refreshRate;
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_4;
  v33[3] = &unk_1E38EC288;
  v16 = v13;
  v34 = v16;
  v17 = (id)objc_msgSend(v5, "appendDouble:counterpart:", v33, refreshRate);
  hdrMode = self->_hdrMode;
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_5;
  v31[3] = &unk_1E38EB9E8;
  v19 = v16;
  v32 = v19;
  v20 = (id)objc_msgSend(v5, "appendInteger:counterpart:", hdrMode, v31);
  v26 = v7;
  v27 = 3221225472;
  v28 = __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_6;
  v29 = &unk_1E38EC260;
  v30 = v19;
  width = self->_logicalScale.width;
  height = self->_logicalScale.height;
  v23 = v19;
  v24 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", &v26, width, height);
  LOBYTE(v19) = objc_msgSend(v5, "isEqual", v26, v27, v28, v29);

  return (char)v19;
}

uint64_t __42__FBSDisplayConfigurationRequest_isEqual___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
}

double __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 16);
}

double __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 32);
}

double __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 40);
}

uint64_t __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_5(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
}

double __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_6(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 56);
}

- (NSString)description
{
  return (NSString *)-[FBSDisplayConfigurationRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id result;

  result = -[FBSDisplayConfigurationRequest init](+[FBSMutableDisplayConfigurationRequest allocWithZone:](FBSMutableDisplayConfigurationRequest, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_overscanCompensation;
  *((_OWORD *)result + 1) = self->_nativePixelSize;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_pointScale;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_refreshRate;
  *((_QWORD *)result + 6) = self->_hdrMode;
  *(CGSize *)((char *)result + 56) = self->_logicalScale;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FBSDisplayConfigurationRequest)initWithCoder:(id)a3
{
  id v4;
  FBSDisplayConfigurationRequest *v5;
  uint64_t v6;
  void *v7;
  CGFloat v8;
  float v9;
  double v10;
  uint64_t v11;
  void *v12;
  CGFloat v13;

  v4 = a3;
  v5 = -[FBSDisplayConfigurationRequest init](self, "init");
  if (v5)
  {
    v5->_overscanCompensation = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("overscanCompensation"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nativePixelSize"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v5->_nativePixelSize.width = MEMORY[0x19AEC9CC4](v6);
      v5->_nativePixelSize.height = v8;
    }
    else
    {
      v5->_nativePixelSize = (CGSize)*MEMORY[0x1E0C9D820];
    }
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("pointScale"));
    v5->_pointScale = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("refreshRate"));
    v5->_refreshRate = v10;
    v5->_hdrMode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("hdrMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logicalScale"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      v5->_logicalScale.width = MEMORY[0x19AEC9CC4](v11);
      v5->_logicalScale.height = v13;
    }
    else
    {
      v5->_logicalScale = (CGSize)*MEMORY[0x1E0C9D820];
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double pointScale;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInt64:forKey:", self->_overscanCompensation, CFSTR("overscanCompensation"));
  if (!BSFloatIsZero() || (BSFloatIsZero() & 1) == 0)
  {
    BSValueWithSize();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("nativePixelSize"));

  }
  if ((BSFloatIsZero() & 1) == 0)
  {
    pointScale = self->_pointScale;
    *(float *)&pointScale = pointScale;
    objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("pointScale"), pointScale);
  }
  if ((BSFloatIsZero() & 1) == 0)
    objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("refreshRate"), self->_refreshRate);
  objc_msgSend(v7, "encodeInt64:forKey:", self->_hdrMode, CFSTR("hdrMode"));
  if (!BSFloatIsZero() || (BSFloatIsZero() & 1) == 0)
  {
    BSValueWithSize();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("logicalScale"));

  }
}

- (FBSDisplayConfigurationRequest)initWithXPCDictionary:(id)a3
{
  id v4;
  FBSDisplayConfigurationRequest *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;

  v4 = a3;
  v5 = -[FBSDisplayConfigurationRequest init](self, "init");
  if (v5)
  {
    xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("overscanCompensation"), "UTF8String"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = (objc_class *)MEMORY[0x1E0C81328];
    if (v6 && object_getClass(v6) == v8)
      v5->_overscanCompensation = xpc_int64_get_value(v7);
    objc_msgSend(CFSTR("nativePixelSize"), "UTF8String");
    BSDeserializeCGSizeFromXPCDictionaryWithKey();
    v5->_nativePixelSize.width = v9;
    v5->_nativePixelSize.height = v10;
    xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("pointScale"), "UTF8String"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = (objc_class *)MEMORY[0x1E0C81300];
    if (v11 && object_getClass(v11) == v13)
      v5->_pointScale = xpc_double_get_value(v12);
    xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("refreshRate"), "UTF8String"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && object_getClass(v14) == v13)
      v5->_refreshRate = xpc_double_get_value(v15);
    xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("hdrMode"), "UTF8String"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16 && object_getClass(v16) == v8)
      v5->_hdrMode = xpc_int64_get_value(v17);
    objc_msgSend(CFSTR("logicalScale"), "UTF8String");
    BSDeserializeCGSizeFromXPCDictionaryWithKey();
    v5->_logicalScale.width = v18;
    v5->_logicalScale.height = v19;

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  if (xdict)
  {
    if (self->_overscanCompensation != -1)
      xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("overscanCompensation"), "UTF8String"), self->_overscanCompensation);
    if (!BSFloatIsZero() || (BSFloatIsZero() & 1) == 0)
    {
      objc_msgSend(CFSTR("nativePixelSize"), "UTF8String");
      BSSerializeCGSizeToXPCDictionaryWithKey();
    }
    if ((BSFloatIsZero() & 1) == 0)
      xpc_dictionary_set_double(xdict, (const char *)objc_msgSend(CFSTR("pointScale"), "UTF8String"), self->_pointScale);
    if ((BSFloatIsZero() & 1) == 0)
      xpc_dictionary_set_double(xdict, (const char *)objc_msgSend(CFSTR("refreshRate"), "UTF8String"), self->_refreshRate);
    if (self->_hdrMode != -1)
      xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("hdrMode"), "UTF8String"), self->_hdrMode);
    if (!BSFloatIsZero() || (BSFloatIsZero() & 1) == 0)
    {
      objc_msgSend(CFSTR("logicalScale"), "UTF8String");
      BSSerializeCGSizeToXPCDictionaryWithKey();
    }
  }

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSDisplayConfigurationRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSDisplayConfigurationRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[FBSDisplayConfigurationRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__FBSDisplayConfigurationRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E38EAE08;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

uint64_t __72__FBSDisplayConfigurationRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v2 != -1)
  {
    v3 = *(void **)(a1 + 40);
    FBSDisplayOverscanCompensationDescription(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v4, CFSTR("overscanCompensation"));

  }
  if (!BSFloatIsZero() || (BSFloatIsZero() & 1) == 0)
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "appendSize:withName:", CFSTR("nativePixelSize"), *(double *)(*(_QWORD *)(a1 + 32) + 16), *(double *)(*(_QWORD *)(a1 + 32) + 24));
  if ((BSFloatIsZero() & 1) == 0)
    v6 = (id)objc_msgSend(*(id *)(a1 + 40), "appendDouble:withName:decimalPrecision:", CFSTR("pointScale"), 2, *(double *)(*(_QWORD *)(a1 + 32) + 32));
  if ((BSFloatIsZero() & 1) == 0)
    v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendDouble:withName:decimalPrecision:", CFSTR("refreshRate"), 2, *(double *)(*(_QWORD *)(a1 + 32) + 40));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v8 != -1)
  {
    v9 = *(void **)(a1 + 40);
    FBSDisplayHDRModeDescription(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:withName:", v10, CFSTR("hdrMode"));

  }
  if (!BSFloatIsZero())
    return (uint64_t)(id)objc_msgSend(*(id *)(a1 + 40), "appendSize:withName:", CFSTR("logicalScale"), *(double *)(*(_QWORD *)(a1 + 32) + 56), *(double *)(*(_QWORD *)(a1 + 32) + 64));
  result = BSFloatIsZero();
  if ((result & 1) == 0)
    return (uint64_t)(id)objc_msgSend(*(id *)(a1 + 40), "appendSize:withName:", CFSTR("logicalScale"), *(double *)(*(_QWORD *)(a1 + 32) + 56), *(double *)(*(_QWORD *)(a1 + 32) + 64));
  return result;
}

- (int64_t)overscanCompensation
{
  return self->_overscanCompensation;
}

- (CGSize)nativePixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_nativePixelSize.width;
  height = self->_nativePixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)pointScale
{
  return self->_pointScale;
}

- (double)refreshRate
{
  return self->_refreshRate;
}

- (int64_t)hdrMode
{
  return self->_hdrMode;
}

- (CGSize)logicalScale
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalScale.width;
  height = self->_logicalScale.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
