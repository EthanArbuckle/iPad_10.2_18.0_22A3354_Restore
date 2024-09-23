@implementation CHSWidgetMargins

- (CHSEdgeInsets)safeAreaInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  CHSEdgeInsets result;

  top = self->_safeAreaInsets.top;
  leading = self->_safeAreaInsets.leading;
  bottom = self->_safeAreaInsets.bottom;
  trailing = self->_safeAreaInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (CHSEdgeInsets)layoutInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  CHSEdgeInsets result;

  top = self->_layoutInsets.top;
  leading = self->_layoutInsets.leading;
  bottom = self->_layoutInsets.bottom;
  trailing = self->_layoutInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (CHSWidgetMargins)initWithXPCDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CHSWidgetMargins *v31;
  double v33;
  double v34;
  double v35;
  double v36;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(CFSTR("safeAreaInsets"), "UTF8String");
    v5 = BSDeserializeCGRectFromXPCDictionaryWithKey();
    v6 = CHSEdgeInsetsFromRect(v5);
    v35 = v7;
    v36 = v6;
    v33 = v9;
    v34 = v8;
    objc_msgSend(CFSTR("layoutInsets"), "UTF8String");
    v10 = BSDeserializeCGRectFromXPCDictionaryWithKey();
    v11 = CHSEdgeInsetsFromRect(v10);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(CFSTR("contentMargins"), "UTF8String");
    v18 = BSDeserializeCGRectFromXPCDictionaryWithKey();
    v19 = CHSEdgeInsetsFromRect(v18);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(CFSTR("backgroundRemovedContentMargins"), "UTF8String");
    v26 = BSDeserializeCGRectFromXPCDictionaryWithKey();
    v27 = CHSEdgeInsetsFromRect(v26);
    self = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:](self, "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", v36, v35, v34, v33, v11, v13, v15, v17, *(_QWORD *)&v19, v21, v23, v25, *(_QWORD *)&v27, v28, v29, v30);
    v31 = self;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (double)initWithSafeAreaInsets:(double)a3 layoutInsets:(double)a4 contentMargins:(double)a5 backgroundRemovedContentMargins:(double)a6
{
  double *result;
  objc_super v33;

  v33.receiver = a1;
  v33.super_class = (Class)CHSWidgetMargins;
  result = (double *)objc_msgSendSuper2(&v33, sel_init);
  if (result)
  {
    result[1] = a2;
    result[2] = a3;
    result[3] = a4;
    result[4] = a5;
    result[5] = a6;
    result[6] = a7;
    result[7] = a8;
    result[8] = a9;
    *((_QWORD *)result + 9) = a17;
    *((_QWORD *)result + 10) = a18;
    *((_QWORD *)result + 11) = a19;
    *((_QWORD *)result + 12) = a20;
    *((_QWORD *)result + 13) = a21;
    *((_QWORD *)result + 14) = a22;
    *((_QWORD *)result + 15) = a23;
    *((_QWORD *)result + 16) = a24;
  }
  return result;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    CHSRectFromEdgeInsets(-[CHSWidgetMargins safeAreaInsets](self, "safeAreaInsets"));
    objc_msgSend(CFSTR("safeAreaInsets"), "UTF8String");
    BSSerializeCGRectToXPCDictionaryWithKey();
    CHSRectFromEdgeInsets(-[CHSWidgetMargins layoutInsets](self, "layoutInsets"));
    objc_msgSend(CFSTR("layoutInsets"), "UTF8String");
    BSSerializeCGRectToXPCDictionaryWithKey();
    CHSRectFromEdgeInsets(-[CHSWidgetMargins contentMargins](self, "contentMargins"));
    objc_msgSend(CFSTR("contentMargins"), "UTF8String");
    BSSerializeCGRectToXPCDictionaryWithKey();
    CHSRectFromEdgeInsets(-[CHSWidgetMargins backgroundRemovedContentMargins](self, "backgroundRemovedContentMargins"));
    objc_msgSend(CFSTR("backgroundRemovedContentMargins"), "UTF8String");
    BSSerializeCGRectToXPCDictionaryWithKey();
  }

}

- (CHSEdgeInsets)contentMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  CHSEdgeInsets result;

  top = self->_contentMargins.top;
  leading = self->_contentMargins.leading;
  bottom = self->_contentMargins.bottom;
  trailing = self->_contentMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (CHSEdgeInsets)backgroundRemovedContentMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  CHSEdgeInsets result;

  top = self->_backgroundRemovedContentMargins.top;
  leading = self->_backgroundRemovedContentMargins.leading;
  bottom = self->_backgroundRemovedContentMargins.bottom;
  trailing = self->_backgroundRemovedContentMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;
  id v46;
  uint64_t v48;
  uint64_t v49;
  double (*v50)(uint64_t);
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = CHSRectFromEdgeInsets(-[CHSWidgetMargins safeAreaInsets](self, "safeAreaInsets"));
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __28__CHSWidgetMargins_isEqual___block_invoke;
  v57[3] = &unk_1E2A5AA98;
  v18 = v9;
  v58 = v18;
  v19 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v57, v10, v12, v14, v16);
  v20 = CHSRectFromEdgeInsets(-[CHSWidgetMargins layoutInsets](self, "layoutInsets"));
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v55[0] = v17;
  v55[1] = 3221225472;
  v55[2] = __28__CHSWidgetMargins_isEqual___block_invoke_2;
  v55[3] = &unk_1E2A5AA98;
  v27 = v18;
  v56 = v27;
  v28 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v55, v20, v22, v24, v26);
  v29 = CHSRectFromEdgeInsets(-[CHSWidgetMargins contentMargins](self, "contentMargins"));
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v53[0] = v17;
  v53[1] = 3221225472;
  v53[2] = __28__CHSWidgetMargins_isEqual___block_invoke_3;
  v53[3] = &unk_1E2A5AA98;
  v36 = v27;
  v54 = v36;
  v37 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v53, v29, v31, v33, v35);
  v38 = CHSRectFromEdgeInsets(-[CHSWidgetMargins backgroundRemovedContentMargins](self, "backgroundRemovedContentMargins"));
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v48 = v17;
  v49 = 3221225472;
  v50 = __28__CHSWidgetMargins_isEqual___block_invoke_4;
  v51 = &unk_1E2A5AA98;
  v45 = v36;
  v52 = v45;
  v46 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", &v48, v38, v40, v42, v44);
  LOBYTE(v36) = objc_msgSend(v5, "isEqual", v48, v49, v50, v51);

  return (char)v36;
}

double __28__CHSWidgetMargins_isEqual___block_invoke(uint64_t a1)
{
  return CHSRectFromEdgeInsets(objc_msgSend(*(id *)(a1 + 32), "safeAreaInsets"));
}

double __28__CHSWidgetMargins_isEqual___block_invoke_2(uint64_t a1)
{
  return CHSRectFromEdgeInsets(objc_msgSend(*(id *)(a1 + 32), "layoutInsets"));
}

double __28__CHSWidgetMargins_isEqual___block_invoke_3(uint64_t a1)
{
  return CHSRectFromEdgeInsets(objc_msgSend(*(id *)(a1 + 32), "contentMargins"));
}

double __28__CHSWidgetMargins_isEqual___block_invoke_4(uint64_t a1)
{
  return CHSRectFromEdgeInsets(objc_msgSend(*(id *)(a1 + 32), "backgroundRemovedContentMargins"));
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendCGRect:", CHSRectFromEdgeInsets(-[CHSWidgetMargins safeAreaInsets](self, "safeAreaInsets")));
  v5 = (id)objc_msgSend(v3, "appendCGRect:", CHSRectFromEdgeInsets(-[CHSWidgetMargins layoutInsets](self, "layoutInsets")));
  v6 = (id)objc_msgSend(v3, "appendCGRect:", CHSRectFromEdgeInsets(-[CHSWidgetMargins contentMargins](self, "contentMargins")));
  v7 = (id)objc_msgSend(v3, "appendCGRect:", CHSRectFromEdgeInsets(-[CHSWidgetMargins backgroundRemovedContentMargins](self, "backgroundRemovedContentMargins")));
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSWidgetMargins succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidgetMargins safeAreaInsets](self, "safeAreaInsets");
  CHSEdgeInsetsDescription(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("safeAreaInsets"));

  -[CHSWidgetMargins layoutInsets](self, "layoutInsets");
  CHSEdgeInsetsDescription(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v13, CFSTR("layoutInsets"));

  -[CHSWidgetMargins contentMargins](self, "contentMargins");
  CHSEdgeInsetsDescription(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v18, CFSTR("contentMargins"));

  -[CHSWidgetMargins backgroundRemovedContentMargins](self, "backgroundRemovedContentMargins");
  CHSEdgeInsetsDescription(v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v23, CFSTR("backgroundRemovedContentMargins"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSWidgetMargins descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  _QWORD v9[4];
  id v10;
  CHSWidgetMargins *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__CHSWidgetMargins_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2A5A290;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

void __58__CHSWidgetMargins_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "safeAreaInsets");
  CHSEdgeInsetsDescription(v3, v4, v5, v6);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:");

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "layoutInsets");
  CHSEdgeInsetsDescription(v8, v9, v10, v11);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:");

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentMargins");
  CHSEdgeInsetsDescription(v13, v14, v15, v16);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:withName:");

  v17 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "backgroundRemovedContentMargins");
  CHSEdgeInsetsDescription(v18, v19, v20, v21);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendString:withName:");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeRect:forKey:", CFSTR("safeAreaInsets"), CHSRectFromEdgeInsets(-[CHSWidgetMargins safeAreaInsets](self, "safeAreaInsets")));
  objc_msgSend(v4, "encodeRect:forKey:", CFSTR("layoutInsets"), CHSRectFromEdgeInsets(-[CHSWidgetMargins layoutInsets](self, "layoutInsets")));
  objc_msgSend(v4, "encodeRect:forKey:", CFSTR("contentMargins"), CHSRectFromEdgeInsets(-[CHSWidgetMargins contentMargins](self, "contentMargins")));
  objc_msgSend(v4, "encodeRect:forKey:", CFSTR("backgroundRemovedContentMargins"), CHSRectFromEdgeInsets(-[CHSWidgetMargins backgroundRemovedContentMargins](self, "backgroundRemovedContentMargins")));

}

- (CHSWidgetMargins)initWithCoder:(id)a3
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
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CHSWidgetMargins *v27;
  double v29;
  double v30;
  double v31;
  double v32;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("safeAreaInsets")))
  {
    v5 = CHSEdgeInsetsFromRect(objc_msgSend(v4, "decodeRectForKey:", CFSTR("safeAreaInsets")));
    v31 = v6;
    v32 = v5;
    v29 = v8;
    v30 = v7;
  }
  else
  {
    v31 = 0.0;
    v32 = 0.0;
    v29 = 0.0;
    v30 = 0.0;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("layoutInsets")))
  {
    v9 = CHSEdgeInsetsFromRect(objc_msgSend(v4, "decodeRectForKey:", CFSTR("layoutInsets")));
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v9 = 0.0;
    v11 = 0.0;
    v13 = 0.0;
    v15 = 0.0;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("contentMargins")))
  {
    v16 = CHSEdgeInsetsFromRect(objc_msgSend(v4, "decodeRectForKey:", CFSTR("contentMargins")));
    v18 = v17;
    v20 = v19;
    v22 = v21;
  }
  else
  {
    v16 = 0.0;
    v18 = 0;
    v20 = 0;
    v22 = 0;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("backgroundRemovedContentMargins")))
  {
    v23 = CHSEdgeInsetsFromRect(objc_msgSend(v4, "decodeRectForKey:", CFSTR("backgroundRemovedContentMargins")));
  }
  else
  {
    v23 = 0.0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
  }
  v27 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:](self, "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", v32, v31, v30, v29, v9, v11, v13, v15, *(_QWORD *)&v16, v18, v20, v22, *(_QWORD *)&v23, v24, v25, v26);

  return v27;
}

- (int64_t)compare:(id)a3
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
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;
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
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
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
  double v50;
  double v51;
  double v52;
  double v53;

  v4 = a3;
  -[CHSWidgetMargins safeAreaInsets](self, "safeAreaInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "safeAreaInsets");
  v17 = CHSEdgeInsetsCompare(v6, v8, v10, v12, v13, v14, v15, v16);
  if (!v17)
  {
    -[CHSWidgetMargins layoutInsets](self, "layoutInsets");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(v4, "layoutInsets");
    v17 = CHSEdgeInsetsCompare(v19, v21, v23, v25, v26, v27, v28, v29);
    if (!v17)
    {
      -[CHSWidgetMargins contentMargins](self, "contentMargins");
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v37 = v36;
      objc_msgSend(v4, "contentMargins");
      v17 = CHSEdgeInsetsCompare(v31, v33, v35, v37, v38, v39, v40, v41);
      if (!v17)
      {
        -[CHSWidgetMargins backgroundRemovedContentMargins](self, "backgroundRemovedContentMargins");
        v43 = v42;
        v45 = v44;
        v47 = v46;
        v49 = v48;
        objc_msgSend(v4, "backgroundRemovedContentMargins");
        v17 = CHSEdgeInsetsCompare(v43, v45, v47, v49, v50, v51, v52, v53);
      }
    }
  }

  return v17;
}

@end
