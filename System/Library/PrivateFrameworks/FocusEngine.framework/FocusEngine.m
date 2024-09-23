_FEFocusRegionContainerProxy *_FEFocusRegionContainerFromEnvironmentAndContainer(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  void *v4;
  _FEFocusRegionContainerProxy *v5;
  _FEFocusRegionContainerProxy *v6;

  +[_FEFocusEnvironmentContainerTuple tupleWithOwningEnvironment:itemContainer:](_FEFocusEnvironmentContainerTuple, "tupleWithOwningEnvironment:itemContainer:", a1, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "owningEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4 && objc_msgSend(v3, "conformsToProtocol:", &unk_256BB09B8))
    v5 = v3;
  else
    v5 = -[_FEFocusRegionContainerProxy initWithEnvironmentContainer:]([_FEFocusRegionContainerProxy alloc], "initWithEnvironmentContainer:", v2);
  v6 = v5;

  return v6;
}

id _prefixForItem(int a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull _prefixForItem(BOOL, BOOL, _FEDebugLogNodeTreeStyle * _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("_FEDebugLogTree.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treeStyle != nil"));

  }
  if (a1)
  {
    if (a2)
      objc_msgSend(v5, "node");
    else
      objc_msgSend(v5, "lastNode");
  }
  else if (a2)
  {
    objc_msgSend(v5, "intermediate");
  }
  else
  {
    objc_msgSend(v5, "trailing");
  }
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;

  return v7;
}

void sub_23C490700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23C49167C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _FEPerformDelayed(void *a1)
{
  id v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (!qword_256BAFC90)
  {
    v2 = xmmword_250D3A038;
    v3 = 0;
    qword_256BAFC90 = _sl_dlopen();
  }
  if (qword_256BAFC90)
  {
    if (qword_256BAFC88 != -1)
      dispatch_once(&qword_256BAFC88, &__block_literal_global_434);
    objc_msgSend((id)qword_256BAFC80, "_performBlockAfterCATransactionCommits:", v1, v2, v3, v4);
  }
  else
  {
    dispatch_async(MEMORY[0x24BDAC9B8], v1);
  }

}

void sub_23C492248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _FERectSmartIntersectsRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  _BOOL4 v26;
  CGFloat v27;
  CGFloat v28;
  _BOOL4 v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  if (CGRectIsNull(*(CGRect *)&a1))
    return 0;
  v33.origin.x = a5;
  v33.origin.y = a6;
  v33.size.width = a7;
  v33.size.height = a8;
  if (CGRectIsNull(v33))
    return 0;
  v34.origin.x = a1;
  v34.origin.y = a2;
  v34.size.width = a3;
  v34.size.height = a4;
  v35 = CGRectStandardize(v34);
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  v35.origin.x = a5;
  v35.origin.y = a6;
  v35.size.width = a7;
  v35.size.height = a8;
  v36 = CGRectStandardize(v35);
  v21 = v36.origin.x;
  v22 = v36.origin.y;
  v23 = v36.size.width;
  v24 = v36.size.height;
  v31 = y;
  v32 = x;
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  v25 = CGRectGetMinX(v36) + 0.0001;
  v37.origin.x = v21;
  v37.origin.y = v22;
  v37.size.width = v23;
  v37.size.height = v24;
  if (v25 <= CGRectGetMaxX(v37))
  {
    v38.origin.y = v31;
    v38.origin.x = x;
    v38.size.width = width;
    v38.size.height = height;
    v27 = CGRectGetMaxX(v38) + -0.0001;
    v39.origin.x = v21;
    v39.origin.y = v22;
    v39.size.width = v23;
    v39.size.height = v24;
    v26 = v27 >= CGRectGetMinX(v39);
  }
  else
  {
    v26 = 0;
  }
  v40.origin.x = x;
  v40.origin.y = v31;
  v40.size.width = width;
  v40.size.height = height;
  v28 = CGRectGetMinY(v40) + 0.0001;
  v41.origin.x = v21;
  v41.origin.y = v22;
  v41.size.width = v23;
  v41.size.height = v24;
  if (v28 <= CGRectGetMaxY(v41))
  {
    v42.origin.x = v32;
    v42.origin.y = v31;
    v42.size.width = width;
    v42.size.height = height;
    v30 = CGRectGetMaxY(v42) + -0.0001;
    v43.origin.x = v21;
    v43.origin.y = v22;
    v43.size.width = v23;
    v43.size.height = v24;
    v29 = v30 >= CGRectGetMinY(v43);
  }
  else
  {
    v29 = 0;
  }
  return v26 & v29;
}

void sub_23C4947E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23C4952D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23C4957C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIApplicationClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!qword_256BAFC90)
    qword_256BAFC90 = _sl_dlopen();
  result = objc_getClass("UIApplication");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_256BAFC98 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _FEFocusGroupCompare(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  _BOOL4 v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  CGFloat v85;
  CGFloat v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    if (v4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSComparisonResult _FEFocusGroupCompare(_FEFocusGroup * _Nonnull __strong, _FEFocusGroup * _Nonnull __strong)");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInFunction:file:lineNumber:description:", v78, CFSTR("_FEFocusGroupHelperFuncs.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("group1"));

    if (v5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSComparisonResult _FEFocusGroupCompare(_FEFocusGroup * _Nonnull __strong, _FEFocusGroup * _Nonnull __strong)");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "handleFailureInFunction:file:lineNumber:description:", v80, CFSTR("_FEFocusGroupHelperFuncs.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("group2"));

LABEL_3:
  objc_msgSend(v3, "parentGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSComparisonResult _FEFocusGroupCompare(_FEFocusGroup * _Nonnull __strong, _FEFocusGroup * _Nonnull __strong)");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "handleFailureInFunction:file:lineNumber:description:", v82, CFSTR("_FEFocusGroupHelperFuncs.m"), 30, CFSTR("Comparing groups with different parents is invalid."));

  }
  objc_msgSend(v3, "coordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = v9;
  if (v10 == v11)
  {
    v14 = v10;
    v15 = v10;
    v16 = v10;
  }
  else
  {
    v12 = v11;
    if (v10 && v11)
    {
      v13 = objc_msgSend(v10, "isEqual:", v11);

      if ((v13 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSComparisonResult _FEFocusGroupCompare(_FEFocusGroup * _Nonnull __strong, _FEFocusGroup * _Nonnull __strong)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "coordinateSpace");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinateSpace");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("_FEFocusGroupHelperFuncs.m"), 32, CFSTR("Trying to compare groups with different coordinate spaces. Group %@ uses %@ while group %@ uses %@."), v14, v10, v83, v84);

  }
LABEL_12:
  objc_msgSend(v3, "owningEnvironment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "owningEnvironment");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (!v17)
  {
    v21 = 0;
    if (!v18)
      goto LABEL_19;
LABEL_17:
    +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21 == v22)
      goto LABEL_19;
    goto LABEL_18;
  }
  +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v17);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v19)
    goto LABEL_17;
  if (v20)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSComparisonResult _FEFocusGroupCompare(_FEFocusGroup * _Nonnull __strong, _FEFocusGroup * _Nonnull __strong)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("_FEFocusGroupHelperFuncs.m"), 38, CFSTR("Unable to compare focus groups from different focus systems."));

  }
LABEL_19:
  objc_msgSend(v3, "parentGroup");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "owningEnvironment");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v21, "_shouldReverseLayoutDirectionForEnvironment:", v26);
  v28 = objc_msgSend(v21, "_shouldReverseLinearWrappingForEnvironment:", v26);
  objc_msgSend(v3, "boundingBox");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  objc_msgSend(v5, "boundingBox");
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v87.origin.x = v30;
  v87.origin.y = v32;
  v87.size.width = v34;
  v87.size.height = v36;
  if (CGRectIsNull(v87))
    goto LABEL_30;
  v88.origin.x = v38;
  v88.origin.y = v40;
  v88.size.width = v42;
  v88.size.height = v44;
  if (CGRectIsNull(v88))
    goto LABEL_30;
  v89.origin.x = v30;
  v89.origin.y = v32;
  v89.size.width = v34;
  v89.size.height = v36;
  v90 = CGRectStandardize(v89);
  x = v90.origin.x;
  y = v90.origin.y;
  width = v90.size.width;
  height = v90.size.height;
  v90.origin.x = v38;
  v90.origin.y = v40;
  v90.size.width = v42;
  v90.size.height = v44;
  v91 = CGRectStandardize(v90);
  v49 = v91.origin.x;
  v50 = v91.origin.y;
  v51 = v91.size.width;
  v52 = v91.size.height;
  v85 = y;
  v86 = x;
  v91.origin.x = x;
  v91.origin.y = y;
  v91.size.width = width;
  v91.size.height = height;
  v53 = CGRectGetMinX(v91) + 0.0001;
  v92.origin.x = v49;
  v92.origin.y = v50;
  v92.size.width = v51;
  v92.size.height = v52;
  if (v53 <= CGRectGetMaxX(v92))
  {
    v93.origin.y = v85;
    v93.origin.x = x;
    v93.size.width = width;
    v93.size.height = height;
    v55 = CGRectGetMaxX(v93) + -0.0001;
    v94.origin.x = v49;
    v94.origin.y = v50;
    v94.size.width = v51;
    v94.size.height = v52;
    v54 = v55 >= CGRectGetMinX(v94);
  }
  else
  {
    v54 = 0;
  }
  v95.origin.x = x;
  v95.origin.y = v85;
  v95.size.width = width;
  v95.size.height = height;
  v56 = CGRectGetMinY(v95) + 0.0001;
  v96.origin.x = v49;
  v96.origin.y = v50;
  v96.size.width = v51;
  v96.size.height = v52;
  if (v56 > CGRectGetMaxY(v96))
    goto LABEL_30;
  v97.origin.x = v86;
  v97.origin.y = v85;
  v97.size.width = width;
  v97.size.height = height;
  v57 = CGRectGetMaxY(v97) + -0.0001;
  v98.origin.x = v49;
  v98.origin.y = v50;
  v98.size.width = v51;
  v98.size.height = v52;
  if (v57 < CGRectGetMinY(v98) || !v54)
  {
LABEL_30:
    objc_msgSend(v3, "boundingBox");
    v60 = v71;
    v62 = v72;
    v64 = v73;
    v66 = v74;
    objc_msgSend(v5, "boundingBox");
  }
  else
  {
    objc_msgSend(v3, "primaryRect");
    v60 = v59;
    v62 = v61;
    v64 = v63;
    v66 = v65;
    objc_msgSend(v5, "primaryRect");
  }
  v75 = _FEFocusRectCompare(v27, v28, v60, v62, v64, v66, v67, v68, v69, v70);

  return v75;
}

id _FEFocusGroupIdentifierForInstance(void *a1)
{
  id v1;
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull _FEFocusGroupIdentifierForInstance(id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_FEFocusGroupHelperFuncs.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

  }
  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p>"), v4, v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id _FEFocusGroupUnresolvedIdentifierForEnvironment(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;
  int v22;
  void *v23;
  int v24;

  v1 = a1;
  if (!_FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v1))
  {
    v3 = v1;
    +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "behavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "focusGroupContainmentBehavior");

    objc_msgSend(v3, "_focusItemContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v6 & 8) == 0)
    {
      v2 = 0;
      if (!_FEFocusItemContainerIsScrollableContainer(v7) || (v6 & 6) == 0)
        goto LABEL_25;
      v9 = v3;
      v10 = _FEFocusItemScrollableContainerPrimaryAxis(v8);
      _FEFocusNearestAncestorEnvironmentScrollableContainer(v9, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "scrollableContainer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = _FEFocusItemScrollableContainerPrimaryAxis(v13);

        if ((v6 & 4) == 0)
        {
LABEL_8:
          v2 = 0;
          if ((v6 & 2) == 0 || v12)
            goto LABEL_23;
          goto LABEL_22;
        }
      }
      else
      {
        v14 = 0;
        if ((v6 & 4) == 0)
          goto LABEL_8;
      }
      if (v12 && v10 == v14)
      {
        v2 = 0;
LABEL_23:

        goto LABEL_24;
      }
LABEL_22:
      _FEFocusGroupIdentifierForInstance(v9);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    v15 = v3;
    v16 = _FEFocusEnvironmentRotaryFocusMovementAxis(v15);
    if (v16 == -1)
    {
      v2 = 0;
      goto LABEL_24;
    }
    v17 = v16;
    if (_FEInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_FEInternalPreferencesRevisionOnce, &__block_literal_global_4);
    v18 = _FEInternalPreferencesRevisionVar;
    if (_FEInternalPreferencesRevisionVar < 1)
      goto LABEL_15;
    v22 = _FEInternalPreference_FocusGroupSeparateNestedEqualRotaryMovementAxis;
    if (_FEInternalPreferencesRevisionVar == _FEInternalPreference_FocusGroupSeparateNestedEqualRotaryMovementAxis)
      goto LABEL_15;
    while (v18 >= v22)
    {
      objc_msgSend((id)_revisionDefaults, "objectForKey:", CFSTR("FocusGroupSeparateNestedEqualRotaryMovementAxis"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v18;
      if (v23)
        v24 = v18
            + _FEInternalPreferenceUpdateBool((uint64_t)&_FEInternalPreference_FocusGroupSeparateNestedEqualRotaryMovementAxis, v23);
      _FEInternalPreference_FocusGroupSeparateNestedEqualRotaryMovementAxis = v24;

      v22 = _FEInternalPreference_FocusGroupSeparateNestedEqualRotaryMovementAxis;
      if (v18 == _FEInternalPreference_FocusGroupSeparateNestedEqualRotaryMovementAxis)
        goto LABEL_15;
    }
    if (!byte_256BAFC44)
    {
LABEL_15:
      objc_msgSend(v15, "_parentFocusEnvironment");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = _FEFocusEnvironmentResolvedRotaryFocusMovementAxis(v19, 0);

      v2 = 0;
      if (v17 == v20)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
    }
    _FEFocusGroupIdentifierForInstance(v15);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  objc_msgSend(v1, "_focusGroupIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v2;
}

uint64_t _FEFocusGroupPriorityForItem(void *a1, id a2, id a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a1;
  v6 = v5;
  v7 = 1000;
  if (v5 != a3)
    v7 = 0;
  if (v5 == a2)
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(v6, "_systemDefaultFocusGroupPriority");
    if (v9 > v8)
      v8 = v9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_msgSend(v6, "_focusGroupPriority");
    if (v10 > v8)
      v8 = v10;
  }

  return v8;
}

uint64_t _FEFocusItemContainerIsViewOrRespondsToSelector(void *a1)
{
  id v1;
  char v2;
  char v3;

  v1 = a1;
  if (!UIKitCoreLibraryCore_frameworkLibrary)
    UIKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!UIKitCoreLibraryCore_frameworkLibrary)
  {

    goto LABEL_7;
  }
  v2 = objc_msgSend(v1, "__isKindOfUIView");

  if ((v2 & 1) == 0)
  {
LABEL_7:
    v3 = objc_opt_respondsToSelector();
    goto LABEL_8;
  }
  v3 = 1;
LABEL_8:

  return v3 & 1;
}

id _FEFocusNearestAncestorEnvironmentScrollableContainer(void *a1, int a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v3 = a1;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_FEFocusEnvironmentScrollableContainerTuple * _Nullable _FEFocusNearestAncestorEnvironmentScrollableContainer(__strong id<_FEFocusEnvironment> _Nonnull, BOOL)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("_FEFocusItemContainer.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  v4 = objc_msgSend(v3, "_parentFocusEnvironment");
  if (!v4)
  {
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  v5 = (void *)v4;
  v6 = v3;
  while (!_FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v5))
  {
LABEL_19:
    v6 = v5;
    v5 = (void *)objc_msgSend(v5, "_parentFocusEnvironment");
    if (!v5)
      goto LABEL_22;
  }
  objc_msgSend(v5, "_focusItemContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && _FEFocusItemContainerIsScrollableContainer(v7))
  {
    v9 = v8;
    if (_FEFocusEnvironmentPrefersFocusContainment(v5))
    {
      +[_FEFocusEnvironmentScrollableContainerTuple tupleWithOwningEnvironment:scrollableContainer:](_FEFocusEnvironmentScrollableContainerTuple, "tupleWithOwningEnvironment:scrollableContainer:", v5, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }

  }
  if (!a2
    || !_FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v6)
    || (v10 = (id)objc_msgSend(v6, "_focusFallbackScroller")) == 0)
  {
    v11 = v5;
    goto LABEL_18;
  }
  v11 = v10;
  if (!_FEFocusEnvironmentPrefersFocusContainment(v10))
  {
LABEL_18:

    v5 = v11;
    goto LABEL_19;
  }
  objc_msgSend(v11, "_focusItemContainer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v8 = 0;
    goto LABEL_18;
  }
  if (!_FEFocusItemContainerIsScrollableContainer(v9))
  {
    v8 = v9;
    goto LABEL_18;
  }
  +[_FEFocusEnvironmentScrollableContainerTuple tupleWithOwningEnvironment:scrollableContainer:](_FEFocusEnvironmentScrollableContainerTuple, "tupleWithOwningEnvironment:scrollableContainer:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_23:
  return v12;
}

uint64_t _FEFocusItemContainerIsScrollableContainer(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "conformsToProtocol:", &unk_256BB9BB8);
  else
    v2 = 0;

  return v2;
}

id _FEFocusAncestorEnvironmentScrollableContainers(void *a1, int a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  if (v3)
  {
    v5 = v3;
    do
    {
      _FEFocusNearestAncestorEnvironmentScrollableContainer(v5, a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(v4, "addObject:", v6);
      v5 = (id)objc_msgSend(v6, "owningEnvironment");

    }
    while (v5);
  }
  objc_msgSend(v4, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void _FEFocusItemContainerAddChildItemsInContextWithOptions(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  id v22;
  int v23;
  _FEFocusPromiseRegion *v24;
  id v25;
  void *v26;
  objc_class *v27;
  void *v28;
  __CFString *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  _FEFocusItemRegion *v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  int v54;
  _FEFocusItemRegion *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  __CFString *v65;
  void *v66;
  id v67;
  objc_class *v68;
  void *v69;
  uint64_t v70;
  __CFString *v71;
  void *v72;
  objc_class *v73;
  void *v74;
  id v75;
  __CFString *v76;
  void *v77;
  objc_class *v78;
  void *v79;
  __CFString *v80;
  id v81;
  __CFString *v82;
  void *v83;
  objc_class *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  id v89;
  uint64_t v90;
  _FEFocusGuideRegion *v91;
  _FEFocusContainerGuideRegion *v92;
  _FEFocusPromiseRegion *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  int v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  __CFString *v104;
  void *v105;
  __CFString *v106;
  void *v107;
  id obj;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[4];
  _FEFocusGuideRegion *v114;
  uint8_t buf[4];
  __CFString *v116;
  __int16 v117;
  __CFString *v118;
  __int16 v119;
  __CFString *v120;
  __int16 v121;
  __CFString *v122;
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  objc_msgSend(v5, "owningEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_focusCoordinateSpace");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchArea");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v7;
  v11 = _FEFocusEnvironmentContainerFrameInCoordinateSpace(v7, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v10, "bounds");
  v94 = v11;
  v95 = v13;
  v96 = v15;
  v97 = v17;
  if ((_FERectSmartIntersectsRect(v18, v19, v20, v21, v11, v13, v15, v17) & 1) == 0 && (a3 & 0x100) != 0)
  {
    v22 = v8;
    if ((_FEFocusItemContainerIsViewOrRespondsToSelector(v22) & 1) != 0)
    {
      v23 = objc_msgSend(v22, "_isLazyFocusItemContainer");

      if (v23)
      {
        v24 = [_FEFocusPromiseRegion alloc];
        v25 = v22;
        if (v25)
        {
          v26 = (void *)MEMORY[0x24BDD17C8];
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@: %p>"), v28, v25);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v29 = CFSTR("(nil)");
        }

        v93 = -[_FEFocusPromiseRegion initWithFrame:coordinateSpace:identifier:](v24, "initWithFrame:coordinateSpace:identifier:", v10, v29, v11, v13, v15, v17);
        v113[0] = MEMORY[0x24BDAC760];
        v113[1] = 3221225472;
        v113[2] = ___FEFocusItemContainerAddChildItemsInContextWithOptions_block_invoke;
        v113[3] = &unk_250D3A080;
        v114 = (_FEFocusGuideRegion *)v5;
        -[_FEFocusPromiseRegion setContentFulfillmentHandler:](v93, "setContentFulfillmentHandler:", v113);
        obj = v93;
        objc_msgSend(v6, "addRegion:", v93);
        v91 = v114;
        goto LABEL_45;
      }
    }
    else
    {

    }
  }
  v98 = a3;
  v100 = v9;
  v101 = v5;
  objc_msgSend(v9, "frame");
  v99 = v10;
  objc_msgSend(v107, "convertRect:fromCoordinateSpace:", v10);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  objc_msgSend(v8, "_focusItemsInRect:");
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v110;
    v102 = v8;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v110 != v40)
          objc_enumerationMutation(obj);
        v42 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v41);
        logger();
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG);

        if (v44)
        {
          objc_msgSend(v42, "_parentFocusEnvironment");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "_focusItemContainer");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46 != v8)
          {
            logger();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v65 = CFSTR("(nil)");
              if (v42)
              {
                v66 = (void *)MEMORY[0x24BDD17C8];
                v67 = v42;
                v68 = (objc_class *)objc_opt_class();
                NSStringFromClass(v68);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "stringWithFormat:", CFSTR("<%@: %p>"), v69, v67);
                v65 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              v106 = v65;
              objc_msgSend(v42, "_parentFocusEnvironment");
              v70 = objc_claimAutoreleasedReturnValue();
              v71 = CFSTR("(nil)");
              if (v70)
              {
                v72 = (void *)MEMORY[0x24BDD17C8];
                v73 = (objc_class *)objc_opt_class();
                NSStringFromClass(v73);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "stringWithFormat:", CFSTR("<%@: %p>"), v74, v70);
                v71 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              v105 = (void *)v70;
              v104 = v71;
              v75 = v8;
              v76 = CFSTR("(nil)");
              if (v8)
              {
                v77 = (void *)MEMORY[0x24BDD17C8];
                v78 = (objc_class *)objc_opt_class();
                NSStringFromClass(v78);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "stringWithFormat:", CFSTR("<%@: %p>"), v79, v75);
                v76 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              v80 = v76;
              v81 = v103;
              v82 = CFSTR("(nil)");
              if (v103)
              {
                v83 = (void *)MEMORY[0x24BDD17C8];
                v84 = (objc_class *)objc_opt_class();
                NSStringFromClass(v84);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "stringWithFormat:", CFSTR("<%@: %p>"), v85, v81);
                v82 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              *(_DWORD *)buf = 138413058;
              v116 = v106;
              v117 = 2112;
              v118 = v104;
              v119 = 2112;
              v120 = v80;
              v121 = 2112;
              v122 = v82;
              _os_log_error_impl(&dword_23C48C000, v47, OS_LOG_TYPE_ERROR, "_FEFocusItem: %@ has mismatched parentFocusEnvironment: %@  from focusItemContainer: %@ with owningEnvironment: %@", buf, 0x2Au);

              v8 = v102;
            }

          }
        }
        objc_msgSend(v42, "_focusItemContainer");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48)
        {
          _FEFocusRegionContainerFromEnvironmentAndContainer((uint64_t)v42, (uint64_t)v48);
          v49 = (_FEFocusItemRegion *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addRegionsInContainer:", v49);
        }
        else
        {
          objc_msgSend(v6, "searchInfo");
          v49 = (_FEFocusItemRegion *)objc_claimAutoreleasedReturnValue();
          if (-[_FEFocusItemRegion shouldIncludeFocusItem:](v49, "shouldIncludeFocusItem:", v42))
          {
            objc_msgSend(v42, "_focusFrame");
            v54 = _FERectSmartIntersectsRect(v50, v51, v52, v53, v31, v33, v35, v37);

            if (!v54)
              goto LABEL_23;
            v55 = [_FEFocusItemRegion alloc];
            objc_msgSend(v42, "_focusFrame");
            v57 = v56;
            v59 = v58;
            v61 = v60;
            v63 = v62;
            objc_msgSend(v6, "focusSystem");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = -[_FEFocusItemRegion initWithFrame:coordinateSpace:item:focusSystem:](v55, "initWithFrame:coordinateSpace:item:focusSystem:", v107, v42, v64, v57, v59, v61, v63);

            objc_msgSend(v6, "addRegion:", v49);
          }
        }

LABEL_23:
        ++v41;
      }
      while (v39 != v41);
      v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
      v39 = v86;
    }
    while (v86);
  }
  objc_msgSend(v6, "movementInfo");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v8;
  v89 = v87;
  if (_FEFocusItemContainerIsViewOrRespondsToSelector(v88))
    v90 = objc_msgSend(v88, "_focusGuideBehaviorForMovement:", v89);
  else
    v90 = 0;
  v9 = v100;

  v5 = v101;
  v10 = v99;
  if ((v98 & 0x10000) != 0)
  {
    if (v90 == 2)
    {
      v91 = -[_FEFocusGuideRegion initWithFrame:coordinateSpace:]([_FEFocusGuideRegion alloc], "initWithFrame:coordinateSpace:", v99, v94, v95, v96, v97);
      -[_FEFocusGuideRegion setOwningEnvironment:](v91, "setOwningEnvironment:", v103);
      objc_msgSend(v6, "addRegion:", v91);
      goto LABEL_45;
    }
    if (v90 == 1)
    {
      v91 = -[_FEFocusRegionContainerProxy initWithEnvironmentContainer:]([_FEFocusRegionContainerProxy alloc], "initWithEnvironmentContainer:", v101);
      -[_FEFocusGuideRegion setShouldCreateRegionForOwningItem:](v91, "setShouldCreateRegionForOwningItem:", 0);
      -[_FEFocusGuideRegion setShouldCreateRegionForGuideBehavior:](v91, "setShouldCreateRegionForGuideBehavior:", 0);
      -[_FEFocusGuideRegion setAllowsLazyLoading:](v91, "setAllowsLazyLoading:", 0);
      v92 = -[_FEFocusGuideRegion initWithFrame:coordinateSpace:]([_FEFocusContainerGuideRegion alloc], "initWithFrame:coordinateSpace:", v99, v94, v95, v96, v97);
      -[_FEFocusContainerGuideRegion setContentFocusRegionContainer:](v92, "setContentFocusRegionContainer:", v91);
      objc_msgSend(v6, "addRegion:", v92);

LABEL_45:
    }
  }

}

uint64_t _FEFocusItemContainerSupportsInvalidatingFocusCache(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend((id)objc_opt_class(), "_supportsInvalidatingFocusCache");
  else
    v2 = 1;

  return v2;
}

uint64_t _FEFocusItemScrollableContainerCanScrollX(void *a1)
{
  id v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;

  v1 = a1;
  if (_FEFocusItemScrollableContainerIsScrollViewOrRespondsToSelector(v1))
  {
    v2 = objc_msgSend(v1, "_focusCanScrollX");
  }
  else
  {
    objc_msgSend(v1, "_focusContentSize");
    v4 = v3;
    objc_msgSend(v1, "_focusVisibleSize");
    v2 = v4 > v5;
  }

  return v2;
}

uint64_t _FEFocusItemScrollableContainerIsScrollViewOrRespondsToSelector(void *a1)
{
  id v1;
  char v2;
  char v3;

  v1 = a1;
  if (!UIKitCoreLibraryCore_frameworkLibrary)
    UIKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!UIKitCoreLibraryCore_frameworkLibrary)
  {

    goto LABEL_7;
  }
  v2 = objc_msgSend(v1, "__isKindOfUIScrollView");

  if ((v2 & 1) == 0)
  {
LABEL_7:
    v3 = objc_opt_respondsToSelector();
    goto LABEL_8;
  }
  v3 = 1;
LABEL_8:

  return v3 & 1;
}

uint64_t _FEFocusItemScrollableContainerCanScrollY(void *a1)
{
  id v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;

  v1 = a1;
  if (_FEFocusItemScrollableContainerIsScrollViewOrRespondsToSelector(v1))
  {
    v2 = objc_msgSend(v1, "_focusCanScrollY");
  }
  else
  {
    objc_msgSend(v1, "_focusContentSize");
    v4 = v3;
    objc_msgSend(v1, "_focusVisibleSize");
    v2 = v4 > v5;
  }

  return v2;
}

double _FEFocusItemScrollableContainerContentBounds(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  if (_FEFocusItemScrollableContainerIsScrollViewOrRespondsToSelector(v1))
  {
    objc_msgSend(v1, "_focusScrollableContentBounds");
    v3 = v2;
  }
  else
  {
    v3 = *MEMORY[0x24BDBEFB0];
    objc_msgSend(v1, "_focusContentSize");
  }

  return v3;
}

uint64_t _FEFocusItemScrollableContainerPrimaryAxis(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int CanScrollX;
  int CanScrollY;
  uint64_t v10;

  v1 = a1;
  if (_FEFocusItemScrollableContainerIsScrollViewOrRespondsToSelector(v1))
  {
    v2 = objc_msgSend(v1, "_focusPrimaryScrollableAxis");
  }
  else
  {
    v3 = v1;
    objc_msgSend(v3, "_focusContentSize");
    v5 = v4;
    v7 = v6;
    objc_msgSend(v3, "_focusVisibleSize");
    CanScrollX = _FEFocusItemScrollableContainerCanScrollX(v3);
    CanScrollY = _FEFocusItemScrollableContainerCanScrollY(v3);

    if (CanScrollX && CanScrollY)
    {
      if (v5 <= v7)
      {
        if (v7 <= v5)
          v2 = 0;
        else
          v2 = 2;
      }
      else
      {
        v2 = 1;
      }
    }
    else
    {
      v10 = 2;
      if (!CanScrollY)
        v10 = 0;
      if (CanScrollX)
        v2 = 1;
      else
        v2 = v10;
    }
  }

  return v2;
}

id _FEFocusEngineCommonEnvironmentScrollableContainerForItems(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "item");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "item"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    objc_msgSend(v3, "ancestorEnvironmentScrollableContainers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ancestorEnvironmentScrollableContainers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = ___FEFocusEngineCommonEnvironmentScrollableContainerForItems_block_invoke;
    v14[3] = &unk_250D3A0A8;
    v10 = v8;
    v15 = v10;
    v11 = objc_msgSend(v9, "indexOfObjectPassingTest:", v14);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v9, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t _FEFocusEngineScrollableContainerCanScroll(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((_FEFocusItemScrollableContainerCanScrollX(v1) & 1) != 0
    || _FEFocusItemScrollableContainerCanScrollY(v1))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = objc_msgSend(v1, "_focusIsScrollableContainer");
    else
      v2 = 1;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id _FEFocusEngineFirstScrollableContainerTupleThatScrollsForItem(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  void *v6;
  char CanScroll;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ancestorEnvironmentScrollableContainers");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v5, "scrollableContainer", (_QWORD)v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        CanScroll = _FEFocusEngineScrollableContainerCanScroll(v6);

        if ((CanScroll & 1) != 0)
        {
          v2 = v5;
          goto LABEL_11;
        }
      }
      v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

void sub_23C498EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _FEGetFocusCastingVisualization()
{
  int v0;
  _BOOL4 v1;
  int v3;

  if (_FEInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_FEInternalPreferencesRevisionOnce, &__block_literal_global_4);
  v0 = _FEInternalPreferencesRevisionVar;
  if (_FEInternalPreferencesRevisionVar < 1
    || (v3 = _FEInternalPreference_FocusCastingVisualization,
        _FEInternalPreferencesRevisionVar == _FEInternalPreference_FocusCastingVisualization))
  {
    v1 = 0;
  }
  else
  {
    do
    {
      v1 = v0 < v3;
      if (v0 < v3)
        break;
      _FEInternalPreferenceSync(v0, &_FEInternalPreference_FocusCastingVisualization, (uint64_t)CFSTR("FocusCastingVisualization"), (uint64_t (*)(_DWORD *))_FEInternalPreferenceUpdateBool);
      v3 = _FEInternalPreference_FocusCastingVisualization;
    }
    while (v0 != _FEInternalPreference_FocusCastingVisualization);
  }
  return byte_256BAFC4C && v1;
}

uint64_t _FEFocusItemIsViewOrRespondsToSelector(void *a1)
{
  id v1;
  char v2;
  char v3;

  v1 = a1;
  if (!UIKitCoreLibraryCore_frameworkLibrary_0)
    UIKitCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!UIKitCoreLibraryCore_frameworkLibrary_0)
  {

    goto LABEL_7;
  }
  v2 = objc_msgSend(v1, "__isKindOfUIView");

  if ((v2 & 1) == 0)
  {
LABEL_7:
    v3 = objc_opt_respondsToSelector();
    goto LABEL_8;
  }
  v3 = 1;
LABEL_8:

  return v3 & 1;
}

uint64_t _FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(void *a1)
{
  id v1;
  char v2;
  id v3;
  char v4;
  char v5;

  v1 = a1;
  if (!UIKitCoreLibraryCore_frameworkLibrary_0)
    UIKitCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (UIKitCoreLibraryCore_frameworkLibrary_0)
  {
    v2 = objc_msgSend(v1, "__isKindOfUIView");

    if ((v2 & 1) != 0)
      goto LABEL_11;
  }
  else
  {

  }
  v3 = v1;
  if (!UIKitCoreLibraryCore_frameworkLibrary_0)
    UIKitCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!UIKitCoreLibraryCore_frameworkLibrary_0)
  {

    goto LABEL_13;
  }
  v4 = objc_msgSend(v3, "__isKindOfUIViewController");

  if ((v4 & 1) == 0)
  {
LABEL_13:
    v5 = objc_opt_respondsToSelector();
    goto LABEL_14;
  }
LABEL_11:
  v5 = 1;
LABEL_14:

  return v5 & 1;
}

id _FEFocusEnvironmentRootAncestorEnvironment(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v8;
  void *v9;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<_FEFocusEnvironment>  _Nonnull _FEFocusEnvironmentRootAncestorEnvironment(__strong id<_FEFocusEnvironment> _Nonnull)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("_FEFocusEnvironment.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  v2 = v1;
  v3 = (id)objc_msgSend(v2, "_parentFocusEnvironment");
  v4 = v2;
  if (v3)
  {
    v5 = v3;
    v6 = v2;
    do
    {
      v4 = v5;

      v5 = (id)objc_msgSend(v4, "_parentFocusEnvironment");
      v6 = v4;
    }
    while (v5);
  }

  return v4;
}

BOOL _FEFocusEnvironmentIsAncestorOfEnvironment(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___FEFocusEnvironmentIsAncestorOfEnvironment_block_invoke;
    v8[3] = &unk_250D3A0E8;
    v9 = v3;
    v10 = &v11;
    _FEFocusEnvironmentEnumerateAncestorEnvironments(v5, v8);
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

void sub_23C49B518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _FEFocusEnvironmentEnumerateAncestorEnvironments(void *a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  unsigned int v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  char v11;

  v3 = a1;
  v4 = a2;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (v3 && v4)
  {
    v11 = 0;
    v6 = objc_msgSend(v3, sel_allowsWeakReference);
    v7 = v6 ? v3 : 0;
    v8 = v7;
    if (v6)
    {
      v9 = v3;
      while (1)
      {
        ((void (**)(_QWORD, void *, char *))v5)[2](v5, v9, &v11);
        if (!objc_msgSend((id)objc_msgSend(v9, "_parentFocusEnvironment"), sel_allowsWeakReference))
          break;
        v10 = (id)objc_msgSend(v9, "_parentFocusEnvironment");

        if (v10)
        {
          v9 = v10;
          if (!v11)
            continue;
        }
        goto LABEL_13;
      }
      v10 = v9;
LABEL_13:

    }
  }

}

id _FEFocusEnvironmentFirstCommonAncestor(void *a1, void *a2)
{
  return _UITreeFirstCommonAncestor(a1, a2, sel__parentFocusEnvironment);
}

BOOL _FEFocusEnvironmentsHaveCommonHierarchy(void *a1, void *a2)
{
  _BOOL8 v2;
  id v4;
  id v5;
  id v6;

  v2 = 0;
  if (a1 && a2)
  {
    v4 = a2;
    v5 = a1;
    _UITreeFirstCommonAncestor(v5, v4, sel__parentFocusEnvironment);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v2 = v6 == v5 || v6 == v4;
  }
  return v2;
}

uint64_t _FEFocusEnvironmentShouldUpdateFocus(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _FEFocusEnvironmentShouldUpdateFocus(__strong id<_FEFocusEnvironment> _Nonnull, _FEFocusUpdateContext *__strong _Nonnull)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_FEFocusEnvironment.m"), 169, CFSTR("Attempted to validate a focus update with a nil context."));

  }
  if (_FEFocusItemIsViewOrRespondsToSelector(v3))
    v5 = objc_msgSend(v3, "_shouldUpdateFocusInContext:", v4);
  else
    v5 = 1;

  return v5;
}

uint64_t _FEFocusEnvironmentInheritedFocusMovementStyle(void *a1)
{
  id v1;
  uint64_t v2;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_FEFocusMovementStyle _FEFocusEnvironmentInheritedFocusMovementStyle(__strong id<_FEFocusEnvironment> _Nonnull)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("_FEFocusEnvironment.m"), 181, CFSTR("Cannot determine preferred focus movement style for nil focus environment."), 0);

  }
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = ___FEFocusEnvironmentInheritedFocusMovementStyle_block_invoke;
  v6[3] = &unk_250D3A1E0;
  v6[4] = &v7;
  _FEFocusEnvironmentEnumerateAncestorEnvironments(v1, v6);
  v2 = v8[3];
  if (!v2)
  {
    v2 = 1;
    v8[3] = 1;
  }
  _Block_object_dispose(&v7, 8);

  return v2;
}

void sub_23C49B894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _FEFocusEnvironmentIsEligibleForFocusInteraction(void *a1)
{
  id v1;
  uint64_t v2;
  void *v4;
  void *v5;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _FEFocusEnvironmentIsEligibleForFocusInteraction(__strong id<_FEFocusEnvironment> _Nonnull)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("_FEFocusEnvironment.m"), 206, CFSTR("Cannot determine the focus interaction eligibility for a nil focus environment."));

  }
  if (_FEFocusItemIsViewOrRespondsToSelector(v1))
    v2 = objc_msgSend(v1, "_isEligibleForFocusInteraction");
  else
    v2 = 1;

  return v2;
}

uint64_t _FEFocusEnvironmentIsEligibleForFocusOcclusion(void *a1, _BYTE *a2)
{
  id v3;
  char IsEligibleForFocusInteraction;
  uint64_t v5;
  void *v7;
  void *v8;

  v3 = a1;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _FEFocusEnvironmentIsEligibleForFocusOcclusion(__strong id<_FEFocusEnvironment> _Nonnull, BOOL * _Nullable)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_FEFocusEnvironment.m"), 218, CFSTR("Cannot determine the focus occlusion eligibility for a nil focus environment."));

  }
  IsEligibleForFocusInteraction = _FEFocusEnvironmentIsEligibleForFocusInteraction(v3);
  if (a2)
    *a2 = IsEligibleForFocusInteraction;
  if ((IsEligibleForFocusInteraction & 1) != 0)
  {
    v5 = 1;
  }
  else if (_FEFocusItemIsViewOrRespondsToSelector(v3))
  {
    v5 = objc_msgSend(v3, "_isEligibleForFocusOcclusion");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id _FEFocusEnvironmentPreferredFocusMapContainer(void *a1)
{
  id v1;
  id v2;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<_FEFocusRegionContainer>  _Nullable _FEFocusEnvironmentPreferredFocusMapContainer(__strong id<_FEFocusEnvironment> _Nonnull)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("_FEFocusEnvironment.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = ___FEFocusEnvironmentPreferredFocusMapContainer_block_invoke;
  v6[3] = &unk_250D3A1E0;
  v6[4] = &v7;
  _FEFocusEnvironmentEnumerateAncestorEnvironments(v1, v6);
  v2 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v2;
}

void sub_23C49BBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double _FEFocusEnvironmentContainerFrameInCoordinateSpace(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  double x;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGRect v12;

  v3 = a1;
  v4 = a2;
  _FEFocusItemSafeCast(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12.origin.x = _FEFocusItemFrameInCoordinateSpace(v5, v4);
  x = v12.origin.x;
  if (CGRectIsNull(v12))
  {
    objc_msgSend(v3, "_focusItemContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_focusCoordinateSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 && v8)
    {
      objc_msgSend(v8, "bounds");
      objc_msgSend(v4, "convertRect:fromCoordinateSpace:", v9);
      x = v10;
    }

  }
  return x;
}

uint64_t _FEFocusEnvironmentRotaryFocusMovementAxis(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (_FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v1))
    {
      v3 = objc_msgSend(v2, "_focusRotaryMovementAxis");
    }
    else
    {
      v4 = v2;
      objc_msgSend(v4, "_focusItemContainer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (_FEFocusItemContainerIsScrollableContainer(v5)
        && _FEFocusEnvironmentPrefersFocusContainment(v4))
      {
        v6 = _FEFocusItemScrollableContainerPrimaryAxis(v5);
        if (v6 == 2)
          v7 = 2;
        else
          v7 = -1;
        if (v6 == 1)
          v3 = 1;
        else
          v3 = v7;
      }
      else
      {
        v3 = -1;
      }

    }
  }
  else
  {
    v3 = -1;
  }

  return v3;
}

uint64_t _FEFocusEnvironmentPrefersFocusContainment(void *a1)
{
  id v1;
  uint64_t IsScrollableContainer;
  void *v3;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    IsScrollableContainer = objc_msgSend(v1, "_prefersFocusContainment");
  }
  else
  {
    objc_msgSend(v1, "_focusItemContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    IsScrollableContainer = _FEFocusItemContainerIsScrollableContainer(v3);
    v1 = v3;
  }

  return IsScrollableContainer;
}

uint64_t _FEFocusEnvironmentResolvedRotaryFocusMovementAxis(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v3 = a1;
  v4 = v3;
  v5 = -1;
  if (!v3)
    goto LABEL_11;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -1;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = ___FEFocusEnvironmentResolvedRotaryFocusMovementAxis_block_invoke;
  v18[3] = &unk_250D3A1A0;
  v18[4] = &v19;
  v18[5] = &v23;
  _FEFocusEnvironmentEnumerateAncestorEnvironments(v3, v18);
  if (v20[3] == -1)
  {
    if (_FEInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_FEInternalPreferencesRevisionOnce, &__block_literal_global_4);
    v6 = _FEInternalPreferencesRevisionVar;
    if (_FEInternalPreferencesRevisionVar >= 1)
    {
      v8 = _FEInternalPreference_FocusEnvironmentUseAncestorScrollableSizeForFallbackRotaryAxis;
      if (_FEInternalPreferencesRevisionVar != _FEInternalPreference_FocusEnvironmentUseAncestorScrollableSizeForFallbackRotaryAxis)
      {
        while (v6 >= v8)
        {
          _FEInternalPreferenceSync(v6, &_FEInternalPreference_FocusEnvironmentUseAncestorScrollableSizeForFallbackRotaryAxis, (uint64_t)CFSTR("FocusEnvironmentUseAncestorScrollableSizeForFallbackRotaryAxis"), (uint64_t (*)(_DWORD *))_FEInternalPreferenceUpdateBool);
          v8 = _FEInternalPreference_FocusEnvironmentUseAncestorScrollableSizeForFallbackRotaryAxis;
          if (v6 == _FEInternalPreference_FocusEnvironmentUseAncestorScrollableSizeForFallbackRotaryAxis)
            goto LABEL_6;
        }
        if (byte_256BAFC54)
        {
          _FEFocusNearestAncestorEnvironmentScrollableContainer(v4, 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            objc_msgSend(v9, "scrollableContainer");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "_focusVisibleSize");
            v13 = v12;
            v15 = v14;

            if (v13 > v15)
            {
              v20[3] = 1;
              objc_msgSend(v10, "owningEnvironment");
              v16 = objc_claimAutoreleasedReturnValue();
LABEL_22:
              v17 = (void *)v24[5];
              v24[5] = v16;

              goto LABEL_23;
            }
            if (v15 > v13)
            {
              v20[3] = 2;
              objc_msgSend(v10, "owningEnvironment");
              v16 = objc_claimAutoreleasedReturnValue();
              goto LABEL_22;
            }
          }
LABEL_23:

        }
      }
    }
  }
LABEL_6:
  v5 = v20[3];
  if (v5 == -1)
  {
    v5 = 0;
    v20[3] = 0;
  }
  if (a2)
  {
    *a2 = objc_retainAutorelease((id)v24[5]);
    v5 = v20[3];
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

LABEL_11:
  return v5;
}

void sub_23C49C164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id _FEFocusEnvironmentPreferredFocusEnvironments(void *a1)
{
  id v1;
  int IsViewOrViewControllerOrRespondsToSelector;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v1 = a1;
  IsViewOrViewControllerOrRespondsToSelector = _FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v1);
  v3 = (id)MEMORY[0x24BDBD1A8];
  if (IsViewOrViewControllerOrRespondsToSelector)
  {
    objc_msgSend(v1, "_preferredFocusEnvironments");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (void *)v4;
    else
      v6 = v3;
    v3 = v6;

  }
  return v3;
}

id _FEFocusEnvironmentEffectivePreferredFocusEnvironments(void *a1, _BYTE *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSArray<id<_FEFocusEnvironment>> * _Nonnull _FEFocusEnvironmentEffectivePreferredFocusEnvironments(__strong id<_FEFocusEnvironment> _Nonnull, BOOL * _Nullable)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("_FEFocusEnvironment.m"), 463, CFSTR("Cannot determine effective preferred focus environments for a nil environment."));

  }
  _FEFocusEnvironmentPreferredFocusEnvironments(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "indexOfObjectIdenticalTo:", v3) != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_8;
    objc_msgSend(v4, "arrayByAddingObject:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  v4 = v6;
LABEL_8:
  if (a2)
    *a2 = 0;

  return v4;
}

uint64_t _FEFocusEnvironmentAllowsFocusToLeaveViaHeading(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  if (_FEFocusItemIsViewOrRespondsToSelector(v3))
    v4 = objc_msgSend(v3, "_focusAllowsLeavingWithHeading:", a2);
  else
    v4 = 1;

  return v4;
}

double _UIRectThatJustBarelyIntersectsRect(double a1, CGFloat y, CGFloat width, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double x;
  double MaxX;
  CGFloat v16;
  CGFloat height;
  CGFloat v18;
  CGFloat MinX;
  CGFloat MinY;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double MaxY;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v34;
  CGFloat v35;
  CGFloat rect;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  x = a1;
  MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v34 = a5;
  v37.origin.x = a5;
  v37.origin.y = a6;
  rect = a7;
  v37.size.width = a7;
  v37.size.height = a8;
  v16 = a8;
  v35 = a8;
  if (MaxX <= CGRectGetMinX(v37))
  {
    v18 = a6;
    v38.origin.x = a5;
    v38.origin.y = a6;
    v38.size.width = rect;
    v38.size.height = v16;
    MinX = CGRectGetMinX(v38);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = a4;
    MinY = CGRectGetMinY(v39);
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = a4;
    v41.size.height = CGRectGetHeight(v40);
    v41.size.width = 90.0;
    v41.origin.x = MinX;
    v41.origin.y = MinY;
    v16 = v35;
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = a4;
    v42 = CGRectUnion(v41, v63);
    x = v42.origin.x;
    y = v42.origin.y;
    width = v42.size.width;
    height = v42.size.height;
  }
  else
  {
    height = a4;
    v18 = a6;
  }
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  v21 = CGRectGetMinX(v43);
  v22 = v34;
  v44.origin.x = v34;
  v44.origin.y = v18;
  v44.size.width = rect;
  v44.size.height = v16;
  if (v21 >= CGRectGetMaxX(v44))
  {
    v45.origin.x = v34;
    v45.origin.y = v18;
    v45.size.width = rect;
    v45.size.height = v16;
    v23 = CGRectGetMaxX(v45) + -90.0;
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    v24 = CGRectGetMinY(v46);
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    v48.size.height = CGRectGetHeight(v47);
    v48.size.width = 90.0;
    v48.origin.x = v23;
    v48.origin.y = v24;
    v22 = v34;
    v16 = v35;
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v49 = CGRectUnion(v48, v64);
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    height = v49.size.height;
  }
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  MaxY = CGRectGetMaxY(v50);
  v51.origin.x = v22;
  v51.origin.y = v18;
  v51.size.width = rect;
  v51.size.height = v16;
  if (MaxY <= CGRectGetMinY(v51))
  {
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    v26 = CGRectGetMinX(v52);
    v53.origin.x = v22;
    v53.origin.y = v18;
    v53.size.width = rect;
    v53.size.height = v16;
    v27 = v22;
    v28 = CGRectGetMinY(v53);
    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    v54.size.height = height;
    v55.size.width = CGRectGetWidth(v54);
    v55.size.height = 90.0;
    v55.origin.x = v26;
    v55.origin.y = v28;
    v22 = v27;
    v16 = v35;
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    v56 = CGRectUnion(v55, v65);
    x = v56.origin.x;
    y = v56.origin.y;
    width = v56.size.width;
    height = v56.size.height;
  }
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  v29 = CGRectGetMinY(v57);
  v58.origin.x = v22;
  v58.origin.y = v18;
  v58.size.width = rect;
  v58.size.height = v16;
  if (v29 >= CGRectGetMaxY(v58))
  {
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    v30 = CGRectGetMinX(v59);
    v60.origin.x = v22;
    v60.origin.y = v18;
    v60.size.width = rect;
    v60.size.height = v16;
    v31 = CGRectGetMaxY(v60) + -90.0;
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = height;
    v62.size.width = CGRectGetWidth(v61);
    v62.size.height = 90.0;
    v62.origin.x = v30;
    v62.origin.y = v31;
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    *(_QWORD *)&x = (unint64_t)CGRectUnion(v62, v66);
  }
  return x;
}

void sub_23C49D100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void _enumeratePreferredFocusEnvironments(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void (**v9)(id, id, _QWORD *);
  char v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
LABEL_35:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _enumeratePreferredFocusEnvironments(_FEFocusEnvironmentPreferenceEnumerator *__strong, _FEFocusEnvironmentPreferenceEnumerationContext *__strong, void (^__strong)(__strong id<_FEFocusEnvironmentPreferenceEnumerationContext>, _FEFocusEnvironmentPreferenceEnumerationResult *), _FEFocusEnvironmentPreferenceEnumerationResult *)");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("_FEFocusEnvironmentPreferenceEnumerator.m"), 477, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    if (a4)
      goto LABEL_4;
LABEL_36:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _enumeratePreferredFocusEnvironments(_FEFocusEnvironmentPreferenceEnumerator *__strong, _FEFocusEnvironmentPreferenceEnumerationContext *__strong, void (^__strong)(__strong id<_FEFocusEnvironmentPreferenceEnumerationContext>, _FEFocusEnvironmentPreferenceEnumerationResult *), _FEFocusEnvironmentPreferenceEnumerationResult *)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("_FEFocusEnvironmentPreferenceEnumerator.m"), 478, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _enumeratePreferredFocusEnvironments(_FEFocusEnvironmentPreferenceEnumerator *__strong, _FEFocusEnvironmentPreferenceEnumerationContext *__strong, void (^__strong)(__strong id<_FEFocusEnvironmentPreferenceEnumerationContext>, _FEFocusEnvironmentPreferenceEnumerationResult *), _FEFocusEnvironmentPreferenceEnumerationResult *)");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("_FEFocusEnvironmentPreferenceEnumerator.m"), 476, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator"));

  if (!v8)
    goto LABEL_35;
LABEL_3:
  if (!a4)
    goto LABEL_36;
LABEL_4:
  v34 = 0;
  v10 = objc_msgSend(v8, "isInPreferredSubtree");
  if (v9 && (v10 & 1) != 0)
  {
    v9[2](v9, v8, &v34);
    if (v34 == 3)
      goto LABEL_14;
  }
  else
  {
    objc_msgSend(v8, "debugStack");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v9 && v11)
    {
      v13 = objc_msgSend(v8, "isPreferredByItself");

      if ((v13 & 1) != 0)
        goto LABEL_13;
      objc_msgSend(v8, "debugStack");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_FEDebugLogMessage messageWithString:](_FEDebugLogMessage, "messageWithString:", CFSTR("Not visiting node. Outside of preferred subtree."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addMessage:", v14);

    }
  }
LABEL_13:
  if (objc_msgSend(v8, "prefersNothingFocused"))
  {
LABEL_14:
    *a4 = 3;
    goto LABEL_15;
  }
  if (v34 != 1)
  {
    if (v34 == 2)
      *a4 = 2;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v8, "preferredEnvironments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          v29 = 0;
          objc_msgSend(v8, "pushEnvironment:", v20);
          _enumeratePreferredFocusEnvironments(v7, v8, v9, &v29);
          objc_msgSend(v8, "popEnvironment");
          if ((v29 & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            *a4 = v29;
            goto LABEL_29;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v17)
          continue;
        break;
      }
    }
LABEL_29:

    if (objc_msgSend(v8, "isInPreferredSubtree") && *a4 != 3)
    {
      objc_msgSend(v7, "didVisitAllPreferencesForEnvironmentHandler");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
        (*(void (**)(uint64_t, id, _QWORD *))(v21 + 16))(v21, v8, a4);

    }
  }
LABEL_15:

}

void sub_23C49EAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_23C49F1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_23C49F4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_23C49F804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _FEUserDefaults()
{
  if (qword_256BAFCB0 != -1)
    dispatch_once(&qword_256BAFCB0, &__block_literal_global_2);
  return (id)_MergedGlobals_5;
}

id _FEPreferencesOnce()
{
  if (qword_256BAFCC0 != -1)
    dispatch_once(&qword_256BAFCC0, &__block_literal_global_3);
  return (id)qword_256BAFCB8;
}

void notificationHandler()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (_FEInternalPreferencesRevisionVar <= 2147483645)
    _FEInternalPreferencesRevisionVar += 2;
  _FEUserDefaults();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_revisionDefaults;
  _revisionDefaults = v0;

}

uint64_t _FEInternalPreferenceUpdateBool(uint64_t a1, void *a2)
{
  *(_BYTE *)(a1 + 4) = objc_msgSend(a2, "BOOLValue");
  return 1;
}

void _FEInternalPreferenceSync(int a1, _DWORD *a2, uint64_t a3, uint64_t (*a4)(_DWORD *))
{
  void *v7;
  int v8;
  void *v9;

  objc_msgSend((id)_revisionDefaults, "objectForKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = v7;
    v8 = a4(a2);
    v7 = v9;
    a1 += v8;
  }
  *a2 = a1;

}

void sub_23C4A08F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIApplicationClass_block_invoke_0(uint64_t a1)
{
  Class result;

  if (!qword_256BAFCD8)
    qword_256BAFCD8 = _sl_dlopen();
  result = objc_getClass("UIApplication");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_256BAFCE0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_23C4A2D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

CFTypeRef _OpaqueRetain(int a1, CFTypeRef cf)
{
  return CFRetain(cf);
}

void _OpaqueRelease(int a1, CFTypeRef cf)
{
  CFRelease(cf);
}

uint64_t _OpaqueIsEqual(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a1 == a2)
    return 1;
  else
    return objc_msgSend(a1, "isEqual:", a2, v2, v3);
}

void _CGRectValueFree(int a1, void *a2)
{
  free(a2);
}

BOOL _CGRectValueIsEqual(CGRect *a1, CGRect *a2)
{
  return CGRectEqualToRect(*a1, *a2);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void _FEFocusRegionSearchContextAddChildItemsInEnvironmentContainer(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v29 = v7;
  v10 = v8;
  objc_msgSend(v10, "_focusItemContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v29, "searchArea");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinateSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _FEFocusEnvironmentContainerFrameInCoordinateSpace(v10, v13);
    v16 = v15;
    v18 = v17;
    v20 = v19;

    objc_msgSend(v29, "searchArea");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v21, "intersectsRect:", v14, v16, v18, v20);

    if ((_DWORD)v13)
    {
      _FEFocusItemSafeCast(v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "searchInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "treatFocusableItemAsLeaf");

      if (v24)
      {
        if (_UITVFocusItemAllowsFocusInChildrenWhenFocused(v22))
        {
          v25 = 1;
          if (_FEFocusItemIsFocused(v22) || !v22)
            goto LABEL_12;
          goto LABEL_10;
        }
        if (v22)
        {
LABEL_10:
          objc_msgSend(v29, "focusSystem");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "searchInfo");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = _FEFocusItemIsFocusableInFocusSystemWithSearchInfo(v22, v26, v27) ^ 1;

LABEL_12:
          goto LABEL_13;
        }
      }
      v25 = 1;
      goto LABEL_12;
    }
  }
  v25 = 0;
LABEL_13:

  if (v9 && v25)
  {
    +[_FEFocusEnvironmentContainerTuple tupleWithOwningEnvironment:itemContainer:](_FEFocusEnvironmentContainerTuple, "tupleWithOwningEnvironment:itemContainer:", v10, v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _FEFocusItemContainerAddChildItemsInContextWithOptions(v28, v29, a4 & 0xFFFFFF);

  }
}

void _FEFocusRegionSearchContextSearchForFocusRegionsInEnvironment(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _FEFocusItemRegion *v21;
  void *v22;
  _FEFocusItemRegion *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _FEFocusSpeedBumpRegion *v31;
  void *v32;
  id v33;
  CGRect v34;
  CGRect v35;

  v5 = a1;
  v6 = a2;
  _FEFocusItemSafeCast(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_focusItemContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_focusCoordinateSpace");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _UITVFocusItemAddsChildFocusItemsBeforeSelf(v7);
  objc_msgSend(v5, "searchArea");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    _FEFocusRegionSearchContextAddChildItemsInEnvironmentContainer(v5, v6, v8, a3 & 0xFFFFFF);
  if (v7 && (a3 & 1) != 0)
  {
    if ((_UITVFocusItemAddsChildFocusItemsButNotSelf(v7) & 1) == 0)
    {
      objc_msgSend(v5, "searchInfo", v32);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "shouldIncludeFocusItem:", v7);

      if (v13)
      {
        v14 = _FEFocusItemFrameInCoordinateSpace(v7, v11);
        v16 = v15;
        v18 = v17;
        v20 = v19;
        if (objc_msgSend(v10, "intersectsRect:"))
        {
          if ((_FEFocusItemIsLegacyTransparentFocusRegionInSearchContext(v7, v5) & 1) == 0)
          {
            v21 = [_FEFocusItemRegion alloc];
            objc_msgSend(v5, "focusSystem");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[_FEFocusItemRegion initWithFrame:coordinateSpace:item:focusSystem:](v21, "initWithFrame:coordinateSpace:item:focusSystem:", v11, v7, v22, v14, v16, v18, v20);

            objc_msgSend(v5, "addRegion:", v23);
          }
        }
      }
    }
    v24 = v5;
    v25 = v7;
  }
  else
  {
    v26 = v5;
    v27 = v7;
    if (!v7)
      goto LABEL_14;
  }
  v28 = _FEFocusItemFocusSpeedBumpEdges(v7);
  if (v28)
  {
    v29 = v28;
    objc_msgSend(v5, "coordinateSpace");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34.origin.x = _FEFocusItemFrameInCoordinateSpace(v7, v30);
    v35 = CGRectInset(v34, -1.0, -1.0);
    v31 = -[_FEFocusSpeedBumpRegion initWithFrame:coordinateSpace:speedBumpEdges:]([_FEFocusSpeedBumpRegion alloc], "initWithFrame:coordinateSpace:speedBumpEdges:", v30, v29, v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
    objc_msgSend(v5, "addRegion:", v31);

  }
LABEL_14:

  if ((v9 & 1) == 0)
    _FEFocusRegionSearchContextAddChildItemsInEnvironmentContainer(v5, v6, v8, a3 & 0xFFFFFF);
  v33 = v5;
  if ((_FEFocusItemContainerSupportsInvalidatingFocusCache(v8) & 1) == 0)
    objc_msgSend(v33, "markContainerAsProvidingDynamicContent");

}

uint64_t _UIEffectiveFocusRegionBoundariesForHeading(uint64_t result, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    if (result == 15)
    {
      return 111;
    }
    else
    {
      v2 = result & 0x10;
      if ((result & 0x24) != 0)
        v3 = result & 0x10 | 0x24;
      else
        v3 = result & 0x10;
      if ((result & 0x41) != 0)
        v3 |= 0x41uLL;
      if ((a2 & 1) != 0)
        v2 = v3;
      if ((result & 0x21) != 0)
        v4 = v2 | 0x21;
      else
        v4 = v2;
      if ((result & 0x44) != 0)
        v4 |= 0x44uLL;
      if ((a2 & 2) != 0)
        v2 = v4;
      if ((result & 0x28) != 0)
        v5 = v2 | 0x28;
      else
        v5 = v2;
      if ((result & 0x42) != 0)
        v5 |= 0x42uLL;
      if ((a2 & 0x24) != 0)
        v2 = v5;
      if ((result & 0x22) != 0)
        v6 = v2 | 0x22;
      else
        v6 = v2;
      if ((result & 0x48) != 0)
        v6 |= 0x48uLL;
      if ((a2 & 0x18) != 0)
        return v6;
      else
        return v2;
    }
  }
  return result;
}

CFStringRef _FEStringFromCGRect(double a1, double a2, double a3, double a4)
{
  return (id)CFStringCreateWithFormat(0, 0, CFSTR("{{%.*g, %.*g}, {%.*g, %.*g}}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2, 17, *(_QWORD *)&a3, 17, *(_QWORD *)&a4);
}

uint64_t SplitBracesAndComma(void *a1, CFStringRef *a2, CFStringRef *a3)
{
  __CFString *v3;
  __CFCharacterSet *MutableCopy;
  CFIndex Length;
  char CharacterAtIndex;
  int v7;
  CFIndex v8;
  uint64_t v9;
  int v10;
  CFIndex location;
  CFIndex v12;
  CFIndex v13;
  int v15;
  uint64_t v16;
  CFIndex v17;
  void *v19;
  void *v20;
  CFIndex *v21;
  CFIndex v24;
  CFRange result;
  CFRange v26;
  CFRange v27;
  CFRange v28;

  v3 = a1;
  if (CFStringGetLength(CFSTR(",")) != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void ParseBracesWithDelimiter(CFStringRef, CFStringRef, CFIndex *, CFIndex *, CFIndex *, NSInteger *)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("_FEGeometry.m"), 25, CFSTR("Parsing allows delimiter of length 1 only"));

  }
  if (qword_256BAFCF0 != -1)
    dispatch_once(&qword_256BAFCF0, &__block_literal_global_5);
  v24 = 0;
  MutableCopy = CFCharacterSetCreateMutableCopy(0, (CFCharacterSetRef)_MergedGlobals_7);
  CFCharacterSetAddCharactersInString(MutableCopy, CFSTR(","));
  Length = CFStringGetLength(v3);
  result.location = 0;
  result.length = 0;
  CharacterAtIndex = CFStringGetCharacterAtIndex(CFSTR(","), 0);
  if (Length < 1)
  {
    v9 = 0;
    location = -1;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = CharacterAtIndex;
    v21 = &v24;
    location = -1;
    v12 = Length;
    v13 = -1;
    while (1)
    {
      v26.location = v8;
      v26.length = v12;
      if (!CFStringFindCharacterFromSet(v3, MutableCopy, v26, 0, &result))
        break;
      if (result.location >= Length || result.length != 1)
        break;
      v15 = CFStringGetCharacterAtIndex(v3, result.location);
      if ((v15 & 0xFFFFFFDF) == 0x5B)
      {
        if (!v7)
          location = result.location;
        ++v7;
      }
      else if (v10 == v15)
      {
        if (v7 == 1)
        {
          if (v9 <= 0)
            *v21++ = result.location;
          v9 = 1;
          v7 = 1;
        }
      }
      else if ((v15 & 0xFFFFFFDF) == 0x5D && !--v7)
      {
        v13 = result.location;
        goto LABEL_30;
      }
      if (result.location + 1 < Length)
      {
        v12 += v8 + ~result.location;
        v8 = result.location + 1;
        if (v12 > 0)
          continue;
      }
      goto LABEL_30;
    }
  }
  v13 = -1;
LABEL_30:
  CFRelease(MutableCopy);
  v16 = 0;
  if (location != -1 && v13 != -1 && v9 == 1 && location < v13)
  {
    v16 = 0;
    v17 = v24;
    if (v24 > location + 1 && v24 < v13 - 1)
    {
      v27.length = v24 + ~location;
      v27.location = location + 1;
      *a2 = CFStringCreateWithSubstring(0, v3, v27);
      v28.location = v17 + 1;
      v28.length = v13 + ~v17;
      *a3 = CFStringCreateWithSubstring(0, v3, v28);
      v16 = 1;
    }
  }

  return v16;
}

double _FEDistanceBetweenRects(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double result;
  BOOL v17;
  double MaxY;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double MaxX;
  double MinY;
  double MinX;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  if (CGRectIsNull(*(CGRect *)&a1))
    return 1.79769313e308;
  v29.origin.x = a5;
  v29.origin.y = a6;
  v29.size.width = a7;
  v29.size.height = a8;
  if (CGRectIsNull(v29))
    return 1.79769313e308;
  v30.origin.x = a1;
  v30.origin.y = a2;
  v30.size.width = a3;
  v30.size.height = a4;
  v39.origin.x = a5;
  v39.origin.y = a6;
  v39.size.width = a7;
  v39.size.height = a8;
  v17 = CGRectIntersectsRect(v30, v39);
  result = 0.0;
  if (!v17)
  {
    v31.origin.x = a1;
    v31.origin.y = a2;
    v31.size.width = a3;
    v31.size.height = a4;
    MinX = CGRectGetMinX(v31);
    v32.origin.x = a1;
    v32.origin.y = a2;
    v32.size.width = a3;
    v32.size.height = a4;
    MinY = CGRectGetMinY(v32);
    v33.origin.x = a1;
    v33.origin.y = a2;
    v33.size.width = a3;
    v33.size.height = a4;
    MaxX = CGRectGetMaxX(v33);
    v34.origin.x = a1;
    v34.origin.y = a2;
    v34.size.width = a3;
    v34.size.height = a4;
    MaxY = CGRectGetMaxY(v34);
    v35.origin.x = a5;
    v35.origin.y = a6;
    v35.size.width = a7;
    v35.size.height = a8;
    v19 = CGRectGetMinX(v35);
    v36.origin.x = a5;
    v36.origin.y = a6;
    v36.size.width = a7;
    v36.size.height = a8;
    v20 = CGRectGetMinY(v36);
    v37.origin.x = a5;
    v37.origin.y = a6;
    v37.size.width = a7;
    v37.size.height = a8;
    v21 = CGRectGetMaxX(v37);
    v38.origin.x = a5;
    v38.origin.y = a6;
    v38.size.width = a7;
    v38.size.height = a8;
    v22 = CGRectGetMaxY(v38);
    if (v21 <= MinX && v22 <= MinY)
    {
      v23 = MinX - v21;
LABEL_9:
      v24 = MinY - v22;
      v25 = v23;
      return hypot(v25, v24);
    }
    if (v21 > MinX || MaxY > v20)
    {
      if (MaxX <= v19 && v22 <= MinY)
      {
        v23 = v19 - MaxX;
        goto LABEL_9;
      }
      if (MaxX > v19 || MaxY > v20)
      {
        if (v21 <= MinX)
          return MinX - v21;
        if (MaxX <= v19)
          return v19 - MaxX;
        if (v22 <= MinY)
          return MinY - v22;
        if (MaxY <= v20)
          return v20 - MaxY;
        return 1.79769313e308;
      }
      v25 = v19 - MaxX;
    }
    else
    {
      v25 = MinX - v21;
    }
    v24 = v20 - MaxY;
    return hypot(v25, v24);
  }
  return result;
}

void sub_23C4A7570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_23C4A99EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23C4A9DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _UITreeFirstCommonAncestor(void *a1, void *a2, const char *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  v8 = 0;
  if (!v5 || !v6)
    goto LABEL_18;
  if (v5 == v6)
  {
    v8 = v5;
    goto LABEL_18;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 514, 20);
  v10 = 1;
  v11 = 1;
  v12 = (unint64_t)v7;
  v13 = (unint64_t)v5;
  while (!v11)
  {
    v13 = 0;
    if (v10)
      goto LABEL_10;
LABEL_8:
    v12 = 0;
LABEL_12:
    v11 = v13 != 0;
    v10 = v12 != 0;
    if (!(v13 | v12))
    {
      v8 = 0;
      goto LABEL_17;
    }
  }
  if ((objc_msgSend(v9, "containsObject:", v13) & 1) != 0)
    goto LABEL_16;
  objc_msgSend(v9, "addObject:", v13);
  v13 = (unint64_t)objc_msgSend((id)v13, a3);
  if (!v10)
    goto LABEL_8;
LABEL_10:
  if ((objc_msgSend(v9, "containsObject:", v12) & 1) == 0)
  {
    objc_msgSend(v9, "addObject:", v12);
    v12 = (unint64_t)objc_msgSend((id)v12, a3);
    goto LABEL_12;
  }
  v13 = v12;
LABEL_16:
  v8 = (id)v13;
LABEL_17:

LABEL_18:
  return v8;
}

BOOL __recursePreOrderDepthFirstTraversal(void *a1, const char *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  uint64_t (**v10)(id, _QWORD, uint64_t, unsigned __int8 *);
  void (**v11)(id, void *, uint64_t, uint64_t, unsigned __int8 *);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  _BOOL8 v20;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  unsigned __int8 Traversal;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    Traversal = 0;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v22 = v9;
    obj = v9;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v15);
        if (v10)
          v17 = v10[2](v10, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15), a3, &Traversal);
        else
          v17 = 1;
        v18 = Traversal;
        if ((_DWORD)v17 && !Traversal)
        {
          objc_msgSend(v16, a2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          Traversal = __recursePreOrderDepthFirstTraversal(v19, a2, a3 + 1, v10, v11);

          v18 = Traversal;
        }
        if (v11 && !v18)
        {
          v11[2](v11, v16, a3, v17, &Traversal);
          v18 = Traversal;
        }
        if (v18)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v13)
            goto LABEL_4;
          break;
        }
      }
    }

    v20 = Traversal != 0;
    v9 = v22;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void sub_23C4AB5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

double _FEFocusMapDistanceToRegionBoundary(uint64_t a1, unsigned int a2, void *a3, uint64_t a4, uint64_t a5, void *a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  unint64_t v29;
  double MidY;
  char v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _BOOL4 v40;
  _BOOL4 v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  long double v52;
  long double v53;
  _BOOL4 v55;
  unint64_t v56;
  BOOL v57;
  _BOOL4 v58;
  BOOL v59;
  BOOL v60;
  double MidX;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v19 = a3;
  objc_msgSend(a6, "snapshotFrameForRegion:", a1);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = objc_msgSend(v19, "heading");
  v29 = v28;
  if (a4)
  {
    if (a4 != 1)
    {
      v36 = 1.79769313e308;
      goto LABEL_27;
    }
    v62.origin.x = v21;
    v62.origin.y = v23;
    v62.size.width = v25;
    v62.size.height = v27;
    MidX = CGRectGetMidX(v62);
    v63.origin.x = v21;
    v63.origin.y = v23;
    v63.size.width = v25;
    v63.size.height = v27;
    MidY = CGRectGetMidY(v63);
    if ((a2 & 0x10) != 0)
      goto LABEL_10;
    if ((a2 & 0x20) != 0 && (v29 & 1) != 0 || (a2 & 0x40) != 0 && (v29 & 2) != 0)
    {
      v31 = 2;
    }
    else
    {
      v55 = (a2 & 0x20) == 0;
      if ((v29 & 2) == 0)
        v55 = 1;
      v31 = 1;
      if ((((a2 & 0x40) != 0) & v29) == 0 && v55)
      {
        v56 = v29 & 0x218;
        v57 = (a2 & 0x40) == 0 || v56 == 0;
        v58 = v57;
        v31 = 8;
        if ((((v29 & 0x124) != 0) & (a2 >> 5)) == 0 && v58)
        {
          v59 = (a2 & 0x20) == 0 || v56 == 0;
          v60 = v59;
          v31 = 4;
          if ((((v29 & 0x124) != 0) & (a2 >> 6)) == 0 && v60)
            goto LABEL_10;
        }
      }
    }
    MidX = _UIRectDeparturePointAlongFocusHeading(v31, v21, v23, v25, v27);
    MidY = v32;
LABEL_10:
    v33 = MidY;
    v64.origin.x = a7;
    v64.origin.y = a8;
    v64.size.width = a9;
    v64.size.height = a10;
    v34 = CGRectGetMidX(v64);
    v65.origin.x = a7;
    v65.origin.y = a8;
    v65.size.width = a9;
    v65.size.height = a10;
    v35 = CGRectGetMidY(v65);
    v36 = hypot(MidX - v34, v33 - v35);
    goto LABEL_27;
  }
  v37 = _UIRectDeparturePointAlongFocusHeading(v28, a7, a8, a9, a10);
  v39 = v38;
  v40 = (v29 & 3) != 0;
  if ((v29 & 0xC) == 0)
    v40 = 0;
  v41 = a5 == 2 && v40;
  if ((a2 & 0x10) != 0 || v41)
  {
    v66.origin.x = v21;
    v66.origin.y = v23;
    v66.size.width = v25;
    v66.size.height = v27;
    v47 = CGRectGetMidX(v66);
    v67.origin.x = v21;
    v67.origin.y = v23;
    v67.size.width = v25;
    v67.size.height = v27;
    v23 = CGRectGetMidY(v67);
    v21 = v47;
  }
  else
  {
    if ((a2 & 0x20) != 0)
    {
      v46 = (v29 >> 1) & 0x114 | (2 * (int)v29) & 0x228 | (__rbit32(v29) >> 30);
      v42 = v21;
      v43 = v23;
      v44 = v25;
      v45 = v27;
    }
    else
    {
      if ((a2 & 0x40) == 0)
        goto LABEL_25;
      v42 = v21;
      v43 = v23;
      v44 = v25;
      v45 = v27;
      LOBYTE(v46) = v29;
    }
    v21 = _UIRectDeparturePointAlongFocusHeading(v46, v42, v43, v44, v45);
    v23 = v48;
  }
LABEL_25:
  _UIPointAxisAlignedDistanceAlongFocusHeading(v29, v37, v39, v21, v23);
  v36 = v49;
  if (v41)
  {
    v50 = atan2(v23 - v39, v21 - v37);
    objc_msgSend(v19, "_velocity");
    v52 = v51;
    objc_msgSend(v19, "_velocity");
    v36 = v36 * (vabdd_f64(atan2(v52, v53), v50) / 0.785398163 + 1.0);
  }
LABEL_27:

  return round(v36);
}

void __addChildFocusGroupsRecursively(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "addObject:", v3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v3, "childGroups", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        __addChildFocusGroupsRecursively(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void sub_23C4B05F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

BOOL _FEFocusItemIsFocused(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _BOOL8 v4;
  void *v6;
  void *v7;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _FEFocusItemIsFocused(__strong id<_FEFocusItem> _Nonnull)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("_FEFocusItem.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusedItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3 == v1;

  return v4;
}

uint64_t _FEFocusItemIsFocusedOrFocusable(void *a1)
{
  id v1;
  void *v2;
  uint64_t IsFocusedOrFocusableInFocusSystem;
  void *v5;
  void *v6;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _FEFocusItemIsFocusedOrFocusable(__strong id<_FEFocusItem> _Nonnull)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_FEFocusItem.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    IsFocusedOrFocusableInFocusSystem = __UIFocusItemIsFocusedOrFocusableInFocusSystem(v1, v2, 0, 1);
  else
    IsFocusedOrFocusableInFocusSystem = 0;

  return IsFocusedOrFocusableInFocusSystem;
}

uint64_t __UIFocusItemIsFocusedOrFocusableInFocusSystem(void *a1, void *a2, int a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  int IsEligibleForFocusInteraction;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a1;
  v8 = a2;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL __UIFocusItemIsFocusedOrFocusableInFocusSystem(__strong id<_FEFocusItem>, _FEFocusSystem *__strong, BOOL, BOOL)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("_FEFocusItem.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL __UIFocusItemIsFocusedOrFocusableInFocusSystem(__strong id<_FEFocusItem>, _FEFocusSystem *__strong, BOOL, BOOL)");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_FEFocusItem.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

LABEL_3:
  if (_FEFocusItemCanBecomeFocused(v7, v9))
    IsEligibleForFocusInteraction = _FEFocusEnvironmentIsEligibleForFocusInteraction(v7);
  else
    IsEligibleForFocusInteraction = 0;
  v11 = 0;
  if ((IsEligibleForFocusInteraction & 1) == 0 && a4)
  {
    objc_msgSend(v9, "focusedItem");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v12 == v7;

  }
  v13 = IsEligibleForFocusInteraction | v11;
  if ((_DWORD)v13 == 1 && a3)
  {
    +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14 == v9;

  }
  return v13;
}

uint64_t _FEFocusItemIsFocusedOrFocusableInFocusSystem(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t IsFocusedOrFocusableInFocusSystem;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _FEFocusItemIsFocusedOrFocusableInFocusSystem(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("_FEFocusItem.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

    if (v5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _FEFocusItemIsFocusedOrFocusableInFocusSystem(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("_FEFocusItem.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

    goto LABEL_3;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  IsFocusedOrFocusableInFocusSystem = __UIFocusItemIsFocusedOrFocusableInFocusSystem(v3, v5, 1, 1);

  return IsFocusedOrFocusableInFocusSystem;
}

uint64_t _FEFocusItemIsFocusableInFocusSystem(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t IsFocusedOrFocusableInFocusSystem;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _FEFocusItemIsFocusableInFocusSystem(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("_FEFocusItem.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

    if (v5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _FEFocusItemIsFocusableInFocusSystem(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("_FEFocusItem.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

    goto LABEL_3;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  IsFocusedOrFocusableInFocusSystem = __UIFocusItemIsFocusedOrFocusableInFocusSystem(v3, v5, 1, 0);

  return IsFocusedOrFocusableInFocusSystem;
}

uint64_t _FEFocusItemCanBecomeFocused(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v9;
  void *v10;

  v3 = a1;
  v4 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _FEFocusItemCanBecomeFocused(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("_FEFocusItem.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  if (objc_msgSend(v3, "_canBecomeFocused"))
  {
    objc_msgSend(v4, "behavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "disablesFocusabilityForItemsContainingFocus");

    if (v6)
      v7 = objc_msgSend(v4, "_focusedItemIsContainedInEnvironment:includeSelf:", v3, 0) ^ 1;
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t _FEFocusItemIsFocusableInFocusSystemWithSearchInfo(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v5)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _FEFocusItemIsFocusableInFocusSystemWithSearchInfo(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull, _FEFocusSearchInfo *__strong _Nonnull)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("_FEFocusItem.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

    if (v6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _FEFocusItemIsFocusableInFocusSystemWithSearchInfo(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull, _FEFocusSearchInfo *__strong _Nonnull)");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("_FEFocusItem.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

LABEL_3:
  v8 = 0;
  if (__UIFocusItemIsFocusedOrFocusableInFocusSystem(v5, v6, 1, 0))
    v8 = objc_msgSend(v7, "shouldIncludeFocusItem:", v5);

  return v8;
}

uint64_t _FEFocusItemIsLegacyTransparentFocusRegionInSearchContext(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int IsViewOrRespondsToSelector;
  uint64_t v8;
  void *v10;
  void *v11;
  char IsFocusableInFocusSystemWithSearchInfo;
  void *v13;
  id v14;
  char v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v3 = a1;
  v4 = a2;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "legacyIsTransparentFocusRegionSupported"))
  {

LABEL_6:
    goto LABEL_7;
  }
  IsViewOrRespondsToSelector = _FEFocusItemIsViewOrRespondsToSelector(v3);

  if (IsViewOrRespondsToSelector)
  {
    if (objc_msgSend(v3, "_isTransparentFocusRegion"))
    {
      *((_BYTE *)v18 + 24) = 1;
      goto LABEL_7;
    }
    objc_msgSend(v4, "focusSystem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    IsFocusableInFocusSystemWithSearchInfo = _FEFocusItemIsFocusableInFocusSystemWithSearchInfo(v3, v10, v11);

    +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "focusedItem");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v15 = v14 == v3 ? 1 : IsFocusableInFocusSystemWithSearchInfo;
    if ((v15 & 1) == 0)
    {
      objc_msgSend(v3, "_parentFocusEnvironment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = ___FEFocusItemIsLegacyTransparentFocusRegionInSearchContext_block_invoke;
      v16[3] = &unk_250D3A1E0;
      v16[4] = &v17;
      _FEFocusEnvironmentEnumerateAncestorEnvironments(v5, v16);
      goto LABEL_6;
    }
  }
LABEL_7:
  v8 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return v8;
}

void sub_23C4B2398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _FEFocusItemIsTransparentFocusItem(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (_FEFocusItemIsViewOrRespondsToSelector(v1))
    v2 = objc_msgSend(v1, "_isTransparentFocusItem");
  else
    v2 = 0;

  return v2;
}

uint64_t _UITVFocusItemAllowsFocusInChildrenWhenFocused(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1 && _FEFocusItemIsViewOrRespondsToSelector(v1))
    v3 = objc_msgSend(v2, "_tvAllowsFocusInChildrenWhenFocused");
  else
    v3 = 0;

  return v3;
}

uint64_t _UITVFocusItemAddsChildFocusItemsBeforeSelf(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1 && _FEFocusItemIsViewOrRespondsToSelector(v1))
    v3 = objc_msgSend(v2, "_tvAddsChildFocusItemsBeforeSelf");
  else
    v3 = 0;

  return v3;
}

uint64_t _UITVFocusItemAddsChildFocusItemsButNotSelf(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1 && _FEFocusItemIsViewOrRespondsToSelector(v1))
    v3 = objc_msgSend(v2, "_tvAddsChildFocusItemsButNotSelf");
  else
    v3 = 0;

  return v3;
}

id _UIParentCoordinateSpaceForFocusItem(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "_parentFocusEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_focusItemContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_focusCoordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    logger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v1, "debugDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_parentFocusEnvironment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_parentFocusEnvironment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_focusItemContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v7;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v12;
      _os_log_fault_impl(&dword_23C48C000, v5, OS_LOG_TYPE_FAULT, "_FEFocusItem: %@ with parentFocusEnvironment: %@  focusItemContainer: %@ has no coordinate space.", (uint8_t *)&v13, 0x20u);

    }
  }

  return v4;
}

double _FEFocusItemFrameInCoordinateSpace(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4 && (_FEFocusItemIsViewOrRespondsToSelector(v3) & 1) != 0)
  {
    _UIParentCoordinateSpaceForFocusItem(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "_focusFrame");
      objc_msgSend(v6, "convertRect:toCoordinateSpace:", v5);
      v8 = v7;
    }
    else
    {
      v8 = *MEMORY[0x24BDBF070];
    }

  }
  else
  {
    v8 = *MEMORY[0x24BDBF070];
  }

  return v8;
}

uint64_t _FEFocusDeferralModeForItem(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (_FEFocusItemIsViewOrRespondsToSelector(v1))
    v2 = objc_msgSend(v1, "_focusDeferralMode");
  else
    v2 = 0;

  return v2;
}

uint64_t _FEFocusItemFocusSpeedBumpEdges(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (_FEFocusItemIsViewOrRespondsToSelector(v1))
    v2 = objc_msgSend(v1, "_focusSpeedBumpEdges");
  else
    v2 = 0;

  return v2;
}

uint64_t _FEProcessIsBeingDebugged()
{
  size_t v1;
  _OWORD v2[2];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
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
  int v33[2];
  int v34;
  pid_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
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
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v3 = 0u;
  v4 = 0u;
  memset(v2, 0, sizeof(v2));
  LODWORD(v3) = 0;
  *(_QWORD *)v33 = 0xE00000001;
  v34 = 1;
  v35 = getpid();
  v1 = 648;
  sysctl(v33, 4u, v2, &v1, 0, 0);
  return (v3 >> 11) & 1;
}

id _FEFocusItemSafeCast(void *a1)
{
  id v1;
  char v2;
  id v3;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (!UIKitCoreLibraryCore_frameworkLibrary_1)
  {
    v5 = __const__block__paths_0;
    v6 = 0;
    UIKitCoreLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (UIKitCoreLibraryCore_frameworkLibrary_1)
  {
    v2 = objc_msgSend(v1, "__isKindOfUIView");

    if ((v2 & 1) != 0)
      goto LABEL_8;
  }
  else
  {

  }
  if (!objc_msgSend(v1, "conformsToProtocol:", &unk_256BB4B20, v5, v6, v7))
  {
    v3 = 0;
    goto LABEL_10;
  }
LABEL_8:
  v3 = v1;
LABEL_10:

  return v3;
}

uint64_t _FEFocusGetSensitivitySetting()
{
  uint64_t result;
  void *v1;
  void *v2;
  uint64_t v3;

  if (_MergedGlobals_8 != -1)
    dispatch_once(&_MergedGlobals_8, &__block_literal_global_7);
  result = _FEFocusSensitivityCachedSetting;
  if (_FEFocusSensitivityCachedSetting == -1)
  {
    if (qword_256BAFD08 != -1)
      dispatch_once(&qword_256BAFD08, &__block_literal_global_12);
    objc_msgSend((id)qword_256BAFD00, "objectForKey:", CFSTR("_FEFocusSensitivitySetting"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    if (v1)
      v3 = objc_msgSend(v1, "integerValue");
    else
      v3 = 1;
    _FEFocusSensitivityCachedSetting = v3;

    return _FEFocusSensitivityCachedSetting;
  }
  return result;
}

void _FEFocusClearCachedSensitivitySettingObserver()
{
  _FEFocusSensitivityCachedSetting = -1;
}

void _FEFocusSetSensitivitySetting(uint64_t a1)
{
  void *v2;
  id v3;
  int v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v6;

  if (qword_256BAFD08 != -1)
    dispatch_once(&qword_256BAFD08, &__block_literal_global_12);
  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = (id)qword_256BAFD00;
  objc_msgSend(v2, "numberWithInteger:", a1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:");
  v4 = objc_msgSend(v3, "synchronize");

  if (v4)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("_FEFocusSensitivityUpdateNotification"), 0, 0, 1u);
    _FEFocusSensitivityCachedSetting = -1;
  }

}

void sub_23C4B488C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

double _FEFocusShiftAndExpandRectAlongFocusMovement(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9;
  int v10;
  char v11;
  double x;
  double y;
  double width;
  double height;
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
  CGFloat v28;
  CGFloat v29;
  NSObject *v31;
  double v32;
  CGRect rect;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v9 = a1;
  v10 = objc_msgSend(v9, "_isLinearMovement");
  v11 = objc_msgSend(v9, "heading");

  v34.origin.x = a2;
  v34.origin.y = a3;
  v34.size.width = a4;
  v34.size.height = a5;
  v35 = CGRectIntegral(v34);
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  v16 = CGRectGetWidth(v35);
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  v17 = -CGRectGetHeight(v36);
  v18 = 0.0;
  if ((v11 & 1) != 0)
    v19 = v17;
  else
    v19 = 0.0;
  if ((v11 & 8) != 0)
    v20 = -v16;
  else
    v20 = 0.0;
  if ((v11 & 2) == 0)
    v17 = 0.0;
  if ((v11 & 4) != 0)
    v18 = -v16;
  v21 = x + v18;
  v22 = width - (v20 + v18);
  v23 = y + v19;
  v24 = height - (v19 + v17);
  if (!v10)
  {
    v25 = _UIVectorForFocusHeading(v11);
    v32 = v26;
    rect.origin.x = v21;
    v27 = v25;
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v28 = v27 * CGRectGetWidth(v37);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v29 = v32 * CGRectGetHeight(v38);
    v39.origin.x = rect.origin.x;
    v39.origin.y = v23;
    v39.size.width = v22;
    v39.size.height = v24;
    v40 = CGRectOffset(v39, v28, v29);
    v21 = v40.origin.x;
    if (_FERectSmartIntersectsRect(v40.origin.x, v40.origin.y, v40.size.width, v40.size.height, x, y, width, height))
    {
      logger();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        LOWORD(rect.origin.y) = 0;
        _os_log_fault_impl(&dword_23C48C000, v31, OS_LOG_TYPE_FAULT, "Shifting focus search rect in search direction returned an overlapping rect -- this is a UIKit bug.", (uint8_t *)&rect.origin.y, 2u);
      }

    }
  }
  return v21;
}

void sub_23C4B7794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_23C4B8C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _FEAXAssignFocusToItem(void *a1)
{

  return 0;
}

uint64_t _FEAXAssignFocusToItemWithOptions(void *a1)
{

  return 0;
}

double _UIVectorForFocusHeading(char a1)
{
  double result;
  double v2;

  result = -1.0;
  v2 = 0.0;
  if ((a1 & 4) != 0)
    v2 = -1.0;
  if ((a1 & 8) != 0)
    v2 = 1.0;
  if ((a1 & 0x20) == 0)
    result = v2;
  if ((a1 & 0x10) != 0)
    return 1.0;
  return result;
}

double _UIRectDeparturePointAlongFocusHeading(char a1, double a2, double a3, double a4, double a5)
{
  double MinX;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  if ((a1 & 0xC) != 0)
  {
    if ((a1 & 4) != 0)
      MinX = CGRectGetMinX(*(CGRect *)&a2);
    else
      MinX = CGRectGetMaxX(*(CGRect *)&a2);
  }
  else
  {
    MinX = CGRectGetMidX(*(CGRect *)&a2);
  }
  v11 = MinX;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if ((a1 & 3) != 0)
  {
    if ((a1 & 1) != 0)
      CGRectGetMinY(*(CGRect *)&v12);
    else
      CGRectGetMaxY(*(CGRect *)&v12);
  }
  else
  {
    CGRectGetMidY(*(CGRect *)&v12);
  }
  return v11;
}

void _UIPointAxisAlignedDistanceAlongFocusHeading(char a1, double a2, double a3, double a4, double a5)
{
  if ((a1 & 3) != 0 && (a1 & 0xC) != 0)
  {
    hypot(a4 - a2, a5 - a3);
    _UIVectorForFocusHeading(a1);
  }
}

BOOL _UIRectIntersectsRectAlongFocusHeading(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double MinX;
  double MaxX;
  double v18;
  double MinY;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  if ((a1 & 3) != 0)
  {
    MinX = CGRectGetMinX(*(CGRect *)&a2);
    v30.origin.x = a6;
    v30.origin.y = a7;
    v30.size.width = a8;
    v30.size.height = a9;
    if (MinX < CGRectGetMaxX(v30))
    {
      v31.origin.x = a2;
      v31.origin.y = a3;
      v31.size.width = a4;
      v31.size.height = a5;
      MaxX = CGRectGetMaxX(v31);
      v32.origin.x = a6;
      v32.origin.y = a7;
      v32.size.width = a8;
      v32.size.height = a9;
      v18 = CGRectGetMinX(v32);
      return MaxX > v18;
    }
  }
  else if ((a1 & 0xC) != 0)
  {
    MinY = CGRectGetMinY(*(CGRect *)&a2);
    v33.origin.x = a6;
    v33.origin.y = a7;
    v33.size.width = a8;
    v33.size.height = a9;
    if (MinY < CGRectGetMaxY(v33))
    {
      v34.origin.x = a2;
      v34.origin.y = a3;
      v34.size.width = a4;
      v34.size.height = a5;
      MaxX = CGRectGetMaxY(v34);
      v35.origin.x = a6;
      v35.origin.y = a7;
      v35.size.width = a8;
      v35.size.height = a9;
      v18 = CGRectGetMinY(v35);
      return MaxX > v18;
    }
  }
  return 0;
}

uint64_t _FEFocusRectCompare(int a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v23;
  double v24;
  _BOOL4 v25;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v18 = a4 + a6 * 0.5;
  v28.origin.x = a7;
  v28.origin.y = a8;
  v28.size.width = a9;
  v28.size.height = a10;
  if (CGRectGetMinY(v28) < v18)
  {
    v29.origin.x = a7;
    v29.origin.y = a8;
    v29.size.width = a9;
    v29.size.height = a10;
    if (v18 < CGRectGetMaxY(v29))
    {
      v30.origin.x = a7;
      v30.origin.y = a8;
      v30.size.width = a9;
      v34.size.width = a5;
      v30.size.height = a10;
      v34.origin.x = a3;
      v34.origin.y = a4;
      v34.size.height = a6;
      if (!CGRectContainsRect(v30, v34))
        goto LABEL_15;
    }
  }
  v19 = a8 + a10 * 0.5;
  v31.origin.x = a3;
  v31.origin.y = a4;
  v31.size.width = a5;
  v31.size.height = a6;
  if (CGRectGetMinY(v31) >= v19)
    goto LABEL_7;
  v32.origin.x = a3;
  v32.origin.y = a4;
  v32.size.width = a5;
  v32.size.height = a6;
  if (v19 >= CGRectGetMaxY(v32))
    goto LABEL_7;
  v33.origin.x = a3;
  v33.origin.y = a4;
  v35.size.width = a9;
  v33.size.width = a5;
  v33.size.height = a6;
  v35.origin.x = a7;
  v35.origin.y = a8;
  v35.size.height = a10;
  if (CGRectContainsRect(v33, v35))
  {
LABEL_7:
    v20 = -1;
    if (v18 > v19)
      v21 = 1;
    else
      v21 = -1;
    if (v18 <= v19)
      v20 = 1;
    if (a2)
      return v20;
    else
      return v21;
  }
  else
  {
LABEL_15:
    v23 = a3 + a5 * 0.5;
    v24 = a7 + a9 * 0.5;
    v25 = v23 >= v24;
    if (!a1)
      v25 = v23 <= v24;
    if (v25)
      return -1;
    else
      return 1;
  }
}

uint64_t _FEFocusItemCompare(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double x;
  double v39;
  double v40;
  double y;
  double v42;
  double width;
  double height;
  BOOL IsNull;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  BOOL v51;
  double v52;
  void *v53;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CGRect v60;
  CGRect v61;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "_parentFocusEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_parentFocusEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _FEFocusEnvironmentFirstCommonAncestor(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "behavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldUseAccessibilityCompareForItemGeometry");

  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend(v3, "accessibilityCompareGeometry:", v4);
  }
  else
  {
    v12 = v7;
    v13 = v3;
    v14 = v4;
    v15 = v12;
    if (!v12)
    {
      objc_msgSend(v13, "_parentFocusEnvironment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_parentFocusEnvironment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _FEFocusEnvironmentFirstCommonAncestor(v16, v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_focusItemContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_focusCoordinateSpace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "_focusFrame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v14, "_focusFrame");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    if (v20)
    {
      v60.origin.x = _FEFocusItemFrameInCoordinateSpace(v13, v20);
      v55 = v34;
      v56 = v36;
      v37 = v22;
      x = v60.origin.x;
      v39 = v30;
      v40 = v24;
      y = v60.origin.y;
      v57 = v32;
      v58 = v28;
      v42 = v26;
      width = v60.size.width;
      height = v60.size.height;
      IsNull = CGRectIsNull(v60);
      if (!IsNull)
      {
        v37 = x;
        v40 = y;
        v42 = width;
      }
      v46 = v58;
      if (!IsNull)
        v46 = height;
      v59 = v46;
      v61.origin.x = _FEFocusItemFrameInCoordinateSpace(v14, v20);
      v47 = v61.origin.x;
      v48 = v61.origin.y;
      v49 = v61.size.width;
      v50 = v61.size.height;
      v51 = CGRectIsNull(v61);
      if (!v51)
        v39 = v47;
      v22 = v37;
      v36 = v56;
      v52 = v57;
      if (!v51)
        v52 = v48;
      v24 = v40;
      v30 = v39;
      v34 = v55;
      if (!v51)
        v34 = v49;
      v26 = v42;
      if (!v51)
        v36 = v50;
      v32 = v52;
      v28 = v59;
    }

    +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v12);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = _FEFocusRectCompare(objc_msgSend(v53, "_shouldReverseLayoutDirectionForEnvironment:", v12), objc_msgSend(v53, "_shouldReverseLinearWrappingForEnvironment:", v12), v22, v24, v26, v28, v30, v32, v34, v36);

  }
  return v11;
}

id _FEFocusGetNextItemFromList(void *a1, void *a2, __int16 a3, int a4)
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a1;
  v8 = a2;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<_FEFocusItem>  _Nonnull _FEFocusGetNextItemFromList(id<_FEFocusItem>  _Nullable __strong, NSArray<id<_FEFocusItem>> *__strong _Nonnull, _FEFocusHeading, BOOL)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("_FEFocusGeometry.m"), 364, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("list != nil"));

  }
  if (!objc_msgSend(v8, "count"))
    goto LABEL_11;
  if ((a3 & 0x300) != 0)
  {
    if ((a3 & 0x100) == 0)
    {
LABEL_6:
      v9 = objc_msgSend(v8, "count") - 1;
      goto LABEL_7;
    }
    goto LABEL_22;
  }
  if (!v7)
    goto LABEL_22;
  v10 = objc_msgSend(v8, "indexOfObject:", v7);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_11;
  v9 = v10;
  if ((a3 & 0x10) == 0)
  {
    if ((a3 & 0x20) == 0)
    {
LABEL_23:
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    if (v10)
    {
      v9 = v10 - 1;
      goto LABEL_7;
    }
    if (a4)
      goto LABEL_6;
LABEL_22:
    v9 = 0;
    goto LABEL_23;
  }
  if (v10 >= objc_msgSend(v8, "count") - 1)
  {
    if (a4)
      v9 = 0;
    goto LABEL_23;
  }
  ++v9;
LABEL_7:
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_23;
LABEL_11:
  v11 = 0;
LABEL_24:

  return v11;
}

void _FEFocusRectWithMinimumSize(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v8;

  if (!CGRectIsNull(*(CGRect *)&a1))
  {
    v8.origin.x = a1;
    v8.origin.y = a2;
    v8.size.width = a3;
    v8.size.height = a4;
    CGRectStandardize(v8);
  }
}

__CFString *_FEStringFromFocusHeading(uint64_t a1)
{
  __int16 v1;
  void *v2;
  id v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[3];
  char v12;

  if (!a1)
    return CFSTR("None");
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___FEStringFromFocusHeading_block_invoke;
  v8[3] = &unk_250D3A840;
  v3 = v2;
  v9 = v3;
  v10 = v11;
  v4 = MEMORY[0x2426205A4](v8);
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if ((v1 & 1) != 0)
    (*(void (**)(uint64_t, const __CFString *))(v4 + 16))(v4, CFSTR("Up"));
  if ((v1 & 2) != 0)
    ((void (**)(_QWORD, const __CFString *))v5)[2](v5, CFSTR("Down"));
  if ((v1 & 4) != 0)
    ((void (**)(_QWORD, const __CFString *))v5)[2](v5, CFSTR("Left"));
  if ((v1 & 8) != 0)
    ((void (**)(_QWORD, const __CFString *))v5)[2](v5, CFSTR("Right"));
  if ((v1 & 0x20) != 0)
    ((void (**)(_QWORD, const __CFString *))v5)[2](v5, CFSTR("Previous"));
  if ((v1 & 0x10) != 0)
    ((void (**)(_QWORD, const __CFString *))v5)[2](v5, CFSTR("Next"));
  if ((v1 & 0x100) != 0)
    ((void (**)(_QWORD, const __CFString *))v5)[2](v5, CFSTR("First"));
  if ((v1 & 0x200) != 0)
    ((void (**)(_QWORD, const __CFString *))v5)[2](v5, CFSTR("Last"));
  v6 = v3;

  _Block_object_dispose(v11, 8);
  return (__CFString *)v6;
}

void sub_23C4B9F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *_FEStringFromGroupFilter(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("None");
  if (a1 == 1)
    v1 = CFSTR("CurrentGroup");
  if (a1 == 2)
    return CFSTR("PrimaryItems");
  else
    return v1;
}

void sub_23C4BA148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23C4BA2FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t _FEGetFocusTreeLockVerboseLogging()
{
  int v0;
  _BOOL4 v1;
  int v3;

  if (_FEInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_FEInternalPreferencesRevisionOnce, &__block_literal_global_4);
  v0 = _FEInternalPreferencesRevisionVar;
  if (_FEInternalPreferencesRevisionVar < 1
    || (v3 = _FEInternalPreference_FocusTreeLockVerboseLogging,
        _FEInternalPreferencesRevisionVar == _FEInternalPreference_FocusTreeLockVerboseLogging))
  {
    v1 = 1;
  }
  else
  {
    do
    {
      v1 = v0 >= v3;
      if (v0 < v3)
        break;
      _FEInternalPreferenceSync(v0, &_FEInternalPreference_FocusTreeLockVerboseLogging, (uint64_t)CFSTR("FocusTreeLockVerboseLogging"), (uint64_t (*)(_DWORD *))_FEInternalPreferenceUpdateBool);
      v3 = _FEInternalPreference_FocusTreeLockVerboseLogging;
    }
    while (v0 != _FEInternalPreference_FocusTreeLockVerboseLogging);
  }
  return byte_256BAFC5C || v1;
}

id logger()
{
  if (logger_onceToken != -1)
    dispatch_once(&logger_onceToken, &__block_literal_global_8);
  return (id)logger_logger;
}

void __logger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "UIFocus");
  v1 = (void *)logger_logger;
  logger_logger = (uint64_t)v0;

}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BB00]();
}

uint64_t BSSerializeCGRectToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BCF0]();
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55E8](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE5600](retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
  MEMORY[0x24BDBBBE8](theSet, theString);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x24BDBBC08](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBC18](alloc, theString);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E0](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  double result;

  MEMORY[0x24BDBC630](str);
  return result;
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF080]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE838](__x, __y);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int pthread_main_np(void)
{
  return MEMORY[0x24BDAF8B0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x24BDB0930](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

