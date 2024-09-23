@implementation GCHIDDeviceAttributesPredicateFromMatchingDictionary

void __GCHIDDeviceAttributesPredicateFromMatchingDictionary_block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD), void *a3, _BYTE *a4)
{
  void (**v7)(id, uint64_t, id *);
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v7 = a3;
  v8 = a2;
  v9 = objc_opt_class();
  v33 = 0;
  ((void (**)(_QWORD, uint64_t, id *))a2)[2](v8, v9, &v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v33;
  v12 = v11;
  if (!v10)
  {
    objc_msgSend(v11, "localizedFailureReason");
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("Transport")))
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("VendorID")))
    {
      v17 = objc_opt_class();
      v31 = v12;
      v7[2](v7, v17, &v31);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v31;

      if (v14)
      {
        v16 = CFSTR("vendorID");
        goto LABEL_14;
      }
LABEL_20:
      objc_msgSend(v15, "localizedFailureReason");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = v26;

      *a4 = 1;
      goto LABEL_15;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("ProductID")))
    {
      v18 = objc_opt_class();
      v30 = v12;
      v7[2](v7, v18, &v30);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v30;

      if (v14)
      {
        v16 = CFSTR("productID");
        goto LABEL_14;
      }
      goto LABEL_20;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("VersionNumber")))
    {
      v19 = objc_opt_class();
      v29 = v12;
      v7[2](v7, v19, &v29);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v29;

      if (v14)
      {
        v16 = CFSTR("versionNumber");
        goto LABEL_14;
      }
      goto LABEL_20;
    }
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Unexpected key '%@'."), v10);
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

    *a4 = 1;
    v15 = v12;
    goto LABEL_16;
  }
  v13 = objc_opt_class();
  v32 = v12;
  v7[2](v7, v13, &v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v32;

  if (!v14)
    goto LABEL_20;
  v16 = CFSTR("transport");
LABEL_14:
  +[NSExpression expressionForKeyPath:](&off_1F03AB230, "expressionForKeyPath:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSExpression expressionForConstantValue:](&off_1F03AB230, "expressionForConstantValue:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSComparisonPredicate predicateWithLeftExpression:rightExpression:modifier:type:options:](&off_1F03AB4F8, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v20, v21, 0, 4, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v22);

LABEL_15:
LABEL_16:

}

@end
