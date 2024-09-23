@implementation WFContentProperty

- (NSArray)possibleLabels
{
  void *v3;

  if (-[WFContentProperty isLabeledValue](self, "isLabeledValue"))
  {
    objc_msgSend((id)objc_opt_class(), "possibleLabelsForClass:localized:", -[WFContentProperty propertyClass](self, "propertyClass"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  return (NSArray *)v3;
}

+ (id)possibleLabelsForClass:(Class)a3 localized:(BOOL)a4
{
  void *v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  id v23;
  id *v24;
  void *v25;
  id v26;
  id *v27;
  void *v28;
  id v29;
  id *v30;
  void *v31;
  id v32;
  id *v33;
  void *v34;
  id v35;
  id *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD *v41;
  void *v42;
  _QWORD *v43;
  void *v44;
  id v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _BOOL4 v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[6];
  id v78;
  _QWORD v79[2];
  id v80;
  uint64_t v81;

  v72 = a4;
  v81 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDBCEB8];
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v6 = (id *)getCNLabelHomeSymbolLoc_ptr;
  v76 = getCNLabelHomeSymbolLoc_ptr;
  if (!getCNLabelHomeSymbolLoc_ptr)
  {
    v7 = ContactsLibrary();
    v6 = (id *)dlsym(v7, "CNLabelHome");
    v74[3] = (uint64_t)v6;
    getCNLabelHomeSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v73, 8);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCNLabelHome(void)");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("WFContentProperty+CNLabeledValue.m"), 15, CFSTR("%s"), dlerror());

    goto LABEL_57;
  }
  v8 = *v6;
  v79[0] = v8;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v9 = (id *)getCNLabelWorkSymbolLoc_ptr;
  v76 = getCNLabelWorkSymbolLoc_ptr;
  if (!getCNLabelWorkSymbolLoc_ptr)
  {
    v10 = ContactsLibrary();
    v9 = (id *)dlsym(v10, "CNLabelWork");
    v74[3] = (uint64_t)v9;
    getCNLabelWorkSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v73, 8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCNLabelWork(void)");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("WFContentProperty+CNLabeledValue.m"), 16, CFSTR("%s"), dlerror());

    goto LABEL_57;
  }
  v11 = *v9;
  v79[1] = v11;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v12 = (id *)getCNLabelSchoolSymbolLoc_ptr;
  v76 = getCNLabelSchoolSymbolLoc_ptr;
  if (!getCNLabelSchoolSymbolLoc_ptr)
  {
    v13 = ContactsLibrary();
    v12 = (id *)dlsym(v13, "CNLabelSchool");
    v74[3] = (uint64_t)v12;
    getCNLabelSchoolSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v73, 8);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCNLabelSchool(void)");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("WFContentProperty+CNLabeledValue.m"), 17, CFSTR("%s"), dlerror());

    goto LABEL_57;
  }
  v80 = *v12;
  v14 = (void *)MEMORY[0x24BDBCE30];
  v15 = v80;
  objc_msgSend(v14, "arrayWithObjects:count:", v79, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "arrayWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()))
  {
    v73 = 0;
    v74 = &v73;
    v75 = 0x2020000000;
    v18 = (id *)getCNLabelPhoneNumberiPhoneSymbolLoc_ptr;
    v76 = getCNLabelPhoneNumberiPhoneSymbolLoc_ptr;
    if (!getCNLabelPhoneNumberiPhoneSymbolLoc_ptr)
    {
      v19 = ContactsLibrary();
      v18 = (id *)dlsym(v19, "CNLabelPhoneNumberiPhone");
      v74[3] = (uint64_t)v18;
      getCNLabelPhoneNumberiPhoneSymbolLoc_ptr = (uint64_t)v18;
    }
    _Block_object_dispose(&v73, 8);
    if (v18)
    {
      v20 = *v18;
      v77[0] = v20;
      v73 = 0;
      v74 = &v73;
      v75 = 0x2020000000;
      v21 = (id *)getCNLabelPhoneNumberMobileSymbolLoc_ptr;
      v76 = getCNLabelPhoneNumberMobileSymbolLoc_ptr;
      if (!getCNLabelPhoneNumberMobileSymbolLoc_ptr)
      {
        v22 = ContactsLibrary();
        v21 = (id *)dlsym(v22, "CNLabelPhoneNumberMobile");
        v74[3] = (uint64_t)v21;
        getCNLabelPhoneNumberMobileSymbolLoc_ptr = (uint64_t)v21;
      }
      _Block_object_dispose(&v73, 8);
      if (v21)
      {
        v23 = *v21;
        v77[1] = v23;
        v73 = 0;
        v74 = &v73;
        v75 = 0x2020000000;
        v24 = (id *)getCNLabelPhoneNumberMainSymbolLoc_ptr;
        v76 = getCNLabelPhoneNumberMainSymbolLoc_ptr;
        if (!getCNLabelPhoneNumberMainSymbolLoc_ptr)
        {
          v25 = ContactsLibrary();
          v24 = (id *)dlsym(v25, "CNLabelPhoneNumberMain");
          v74[3] = (uint64_t)v24;
          getCNLabelPhoneNumberMainSymbolLoc_ptr = (uint64_t)v24;
        }
        _Block_object_dispose(&v73, 8);
        if (v24)
        {
          v26 = *v24;
          v77[2] = v26;
          v73 = 0;
          v74 = &v73;
          v75 = 0x2020000000;
          v27 = (id *)getCNLabelPhoneNumberHomeFaxSymbolLoc_ptr;
          v76 = getCNLabelPhoneNumberHomeFaxSymbolLoc_ptr;
          if (!getCNLabelPhoneNumberHomeFaxSymbolLoc_ptr)
          {
            v28 = ContactsLibrary();
            v27 = (id *)dlsym(v28, "CNLabelPhoneNumberHomeFax");
            v74[3] = (uint64_t)v27;
            getCNLabelPhoneNumberHomeFaxSymbolLoc_ptr = (uint64_t)v27;
          }
          _Block_object_dispose(&v73, 8);
          if (v27)
          {
            v29 = *v27;
            v77[3] = v29;
            v73 = 0;
            v74 = &v73;
            v75 = 0x2020000000;
            v30 = (id *)getCNLabelPhoneNumberWorkFaxSymbolLoc_ptr;
            v76 = getCNLabelPhoneNumberWorkFaxSymbolLoc_ptr;
            if (!getCNLabelPhoneNumberWorkFaxSymbolLoc_ptr)
            {
              v31 = ContactsLibrary();
              v30 = (id *)dlsym(v31, "CNLabelPhoneNumberWorkFax");
              v74[3] = (uint64_t)v30;
              getCNLabelPhoneNumberWorkFaxSymbolLoc_ptr = (uint64_t)v30;
            }
            _Block_object_dispose(&v73, 8);
            if (v30)
            {
              v32 = *v30;
              v77[4] = v32;
              v73 = 0;
              v74 = &v73;
              v75 = 0x2020000000;
              v33 = (id *)getCNLabelPhoneNumberOtherFaxSymbolLoc_ptr;
              v76 = getCNLabelPhoneNumberOtherFaxSymbolLoc_ptr;
              if (!getCNLabelPhoneNumberOtherFaxSymbolLoc_ptr)
              {
                v34 = ContactsLibrary();
                v33 = (id *)dlsym(v34, "CNLabelPhoneNumberOtherFax");
                v74[3] = (uint64_t)v33;
                getCNLabelPhoneNumberOtherFaxSymbolLoc_ptr = (uint64_t)v33;
              }
              _Block_object_dispose(&v73, 8);
              if (v33)
              {
                v35 = *v33;
                v77[5] = v35;
                v73 = 0;
                v74 = &v73;
                v75 = 0x2020000000;
                v36 = (id *)getCNLabelPhoneNumberPagerSymbolLoc_ptr;
                v76 = getCNLabelPhoneNumberPagerSymbolLoc_ptr;
                if (!getCNLabelPhoneNumberPagerSymbolLoc_ptr)
                {
                  v37 = ContactsLibrary();
                  v36 = (id *)dlsym(v37, "CNLabelPhoneNumberPager");
                  v74[3] = (uint64_t)v36;
                  getCNLabelPhoneNumberPagerSymbolLoc_ptr = (uint64_t)v36;
                }
                _Block_object_dispose(&v73, 8);
                if (v36)
                {
                  v78 = *v36;
                  v38 = (void *)MEMORY[0x24BDBCE30];
                  v39 = v78;
                  objc_msgSend(v38, "arrayWithObjects:count:", v77, 7);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v17, "addObjectsFromArray:", v40);
                  goto LABEL_38;
                }
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCNLabelPhoneNumberPager(void)");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "handleFailureInFunction:file:lineNumber:description:", v69, CFSTR("WFContentProperty+CNLabeledValue.m"), 25, CFSTR("%s"), dlerror());

              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCNLabelPhoneNumberOtherFax(void)");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "handleFailureInFunction:file:lineNumber:description:", v67, CFSTR("WFContentProperty+CNLabeledValue.m"), 19, CFSTR("%s"), dlerror());

              }
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCNLabelPhoneNumberWorkFax(void)");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "handleFailureInFunction:file:lineNumber:description:", v65, CFSTR("WFContentProperty+CNLabeledValue.m"), 24, CFSTR("%s"), dlerror());

            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCNLabelPhoneNumberHomeFax(void)");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "handleFailureInFunction:file:lineNumber:description:", v63, CFSTR("WFContentProperty+CNLabeledValue.m"), 23, CFSTR("%s"), dlerror());

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCNLabelPhoneNumberMain(void)");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, CFSTR("WFContentProperty+CNLabeledValue.m"), 22, CFSTR("%s"), dlerror());

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCNLabelPhoneNumberMobile(void)");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, CFSTR("WFContentProperty+CNLabeledValue.m"), 21, CFSTR("%s"), dlerror());

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCNLabelPhoneNumberiPhone(void)");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("WFContentProperty+CNLabeledValue.m"), 20, CFSTR("%s"), dlerror());

    }
LABEL_57:
    __break(1u);
  }
  if (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()))
  {
    v73 = 0;
    v74 = &v73;
    v75 = 0x2020000000;
    v41 = (_QWORD *)getCNLabelEmailiCloudSymbolLoc_ptr;
    v76 = getCNLabelEmailiCloudSymbolLoc_ptr;
    if (!getCNLabelEmailiCloudSymbolLoc_ptr)
    {
      v42 = ContactsLibrary();
      v41 = dlsym(v42, "CNLabelEmailiCloud");
      v74[3] = (uint64_t)v41;
      getCNLabelEmailiCloudSymbolLoc_ptr = (uint64_t)v41;
    }
    _Block_object_dispose(&v73, 8);
    if (!v41)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCNLabelEmailiCloud(void)");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "handleFailureInFunction:file:lineNumber:description:", v71, CFSTR("WFContentProperty+CNLabeledValue.m"), 26, CFSTR("%s"), dlerror());

      goto LABEL_57;
    }
    objc_msgSend(v17, "addObject:", *v41);
  }
LABEL_38:
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v43 = (_QWORD *)getCNLabelOtherSymbolLoc_ptr;
  v76 = getCNLabelOtherSymbolLoc_ptr;
  if (!getCNLabelOtherSymbolLoc_ptr)
  {
    v44 = ContactsLibrary();
    v43 = dlsym(v44, "CNLabelOther");
    v74[3] = (uint64_t)v43;
    getCNLabelOtherSymbolLoc_ptr = (uint64_t)v43;
  }
  _Block_object_dispose(&v73, 8);
  if (!v43)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCNLabelOther(void)");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("WFContentProperty+CNLabeledValue.m"), 18, CFSTR("%s"), dlerror());

    goto LABEL_57;
  }
  objc_msgSend(v17, "addObject:", *v43);
  if (v72)
  {
    objc_msgSend(v17, "if_map:", &__block_literal_global_3972);
    v45 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = v17;
  }
  v46 = v45;

  return v46;
}

id __70__WFContentProperty_CNLabeledValue__possibleLabelsForClass_localized___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFContactLabeledValue localizedStringForLabel:](WFContactLabeledValue, "localizedStringForLabel:", a2);
}

- (NSSet)allowedTransactionModes
{
  void *v3;

  if (-[WFContentProperty isSettable](self, "isSettable"))
  {
    v3 = (void *)objc_opt_new();
    if (!-[WFContentProperty isLabeledValue](self, "isLabeledValue"))
      objc_msgSend(v3, "addObject:", CFSTR("Set"));
    if (-[WFContentProperty isAppendable](self, "isAppendable"))
      objc_msgSend(v3, "addObject:", CFSTR("Append"));
    if (-[WFContentProperty isRemovable](self, "isRemovable"))
      objc_msgSend(v3, "addObject:", CFSTR("Remove"));
    if (-[WFContentProperty multipleValues](self, "multipleValues"))
      objc_msgSend(v3, "addObject:", CFSTR("RemoveAll"));
  }
  else
  {
    v3 = (void *)objc_opt_new();
  }
  return (NSSet *)v3;
}

- (id)preferredTransactionModeWithCurrentMode:(id)a3
{
  __CFString *v4;
  void *v5;
  char v6;
  __CFString *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  __CFString *v14;

  v4 = (__CFString *)a3;
  -[WFContentProperty allowedTransactionModes](self, "allowedTransactionModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  v7 = v4;
  if ((v6 & 1) != 0)
    goto LABEL_7;
  if (!-[WFContentProperty multipleValues](self, "multipleValues"))
  {
    if (-[__CFString isEqual:](v4, "isEqual:", CFSTR("RemoveAll")))
    {
      -[WFContentProperty allowedTransactionModes](self, "allowedTransactionModes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CFSTR("Remove");
      v9 = objc_msgSend(v8, "containsObject:", CFSTR("Remove"));

      if ((v9 & 1) != 0)
        goto LABEL_7;
    }
  }
  -[WFContentProperty allowedTransactionModes](self, "allowedTransactionModes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("Set");
  v11 = objc_msgSend(v10, "containsObject:", CFSTR("Set"));

  if ((v11 & 1) != 0
    || (-[WFContentProperty allowedTransactionModes](self, "allowedTransactionModes"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = CFSTR("Append"),
        v13 = objc_msgSend(v12, "containsObject:", CFSTR("Append")),
        v12,
        v13))
  {
LABEL_7:
    v14 = v7;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (WFContentProperty)initWithKeyPath:(id)a3 block:(id)a4 setterBlock:(id)a5 name:(id)a6 propertyClass:(Class)a7 multipleValues:(BOOL)a8 filterable:(BOOL)a9 sortable:(BOOL)a10 gettable:(BOOL)a11 settable:(BOOL)a12 appendable:(BOOL)a13 removable:(BOOL)a14 primary:(BOOL)a15 allowedOperators:(id)a16 userInfo:(id)a17 possibleValues:(id)a18 caseInsensitive:(BOOL)a19 negativeName:(id)a20 singularItemName:(id)a21 irrational:(BOOL)a22 tense:(unint64_t)a23 timeUnits:(unint64_t)a24 comparableUnits:(unint64_t)a25 measurementUnitType:(id)a26 displayName:(id)a27 canLowercaseName:(BOOL)a28
{
  unint64_t v32;
  unint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  NSString *v42;
  NSString *keyPath;
  void *v44;
  id block;
  void *v46;
  id setterBlock;
  NSString *v48;
  NSString *name;
  NSArray *v50;
  NSArray *allowedOperators;
  NSString *v52;
  NSString *negativeName;
  NSString *v54;
  NSString *singularItemName;
  NSString *v56;
  NSString *displayName;
  WFContentProperty *v58;
  void *v60;
  void *v61;
  void *v62;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;

  v32 = (unint64_t)a3;
  v33 = (unint64_t)a4;
  v34 = a5;
  v35 = a6;
  v36 = a16;
  v70 = a17;
  v69 = a18;
  v37 = a20;
  v38 = a21;
  v39 = a26;
  v40 = a27;
  v41 = (void *)v32;
  if (v32 | v33)
  {
    if (v35)
      goto LABEL_3;
  }
  else
  {
    v66 = v40;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentProperty.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block || keyPath"));

    v40 = v66;
    if (v35)
      goto LABEL_3;
  }
  v67 = v40;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentProperty.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  v40 = v67;
LABEL_3:
  if (!a7)
  {
    v68 = v40;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentProperty.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("propertyClass"));

    v40 = v68;
    if (!self)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (self)
  {
LABEL_5:
    v65 = v40;
    v42 = (NSString *)objc_msgSend(v41, "copy");
    keyPath = self->_keyPath;
    self->_keyPath = v42;

    v44 = (void *)objc_msgSend((id)v33, "copy");
    block = self->_block;
    self->_block = v44;

    v46 = (void *)objc_msgSend(v34, "copy");
    setterBlock = self->_setterBlock;
    self->_setterBlock = v46;

    v48 = (NSString *)objc_msgSend(v35, "copy");
    name = self->_name;
    self->_name = v48;

    objc_storeStrong((id *)&self->_propertyClass, a7);
    self->_multipleValues = a8;
    self->_filterable = a9;
    self->_sortable = a10;
    self->_gettable = a11;
    self->_settable = a12;
    self->_appendable = a13;
    self->_removable = a14;
    self->_primary = a15;
    v50 = (NSArray *)objc_msgSend(v36, "copy");
    allowedOperators = self->_allowedOperators;
    self->_allowedOperators = v50;

    objc_storeStrong((id *)&self->_userInfo, a17);
    objc_storeStrong((id *)&self->_possibleValues, a18);
    self->_caseInsensitive = a19;
    v52 = (NSString *)objc_msgSend(v37, "copy");
    negativeName = self->_negativeName;
    self->_negativeName = v52;

    v54 = (NSString *)objc_msgSend(v38, "copy");
    singularItemName = self->_singularItemName;
    self->_singularItemName = v54;

    self->_irrational = a22;
    self->_tense = a23;
    self->_timeUnits = a24;
    self->_comparableUnits = a25;
    objc_storeStrong((id *)&self->_measurementUnitType, a26);
    v56 = (NSString *)objc_msgSend(v65, "copy");
    displayName = self->_displayName;
    self->_displayName = v56;

    self->_canLowercaseName = a28;
    v58 = self;
    v40 = v65;
  }
LABEL_6:

  return self;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  void *v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;

  -[WFContentProperty keyPath](self, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[WFContentProperty keyPath](self, "keyPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR(", keyPath: %@"), v5);
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = &stru_24C4E3948;
  }

  -[WFContentProperty keyPath](self, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[WFContentProperty block](self, "block");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _Block_copy(v8);
    objc_msgSend(v7, "stringWithFormat:", CFSTR(", block: %@"), v9);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = &stru_24C4E3948;
  }

  -[WFContentProperty userInfo](self, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[WFContentProperty userInfo](self, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR(", userInfo: %@"), v12);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = &stru_24C4E3948;
  }

  -[WFContentProperty possibleValues](self, "possibleValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    -[WFContentProperty possibleValues](self, "possibleValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR(", possibleValues: %@"), v15);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = &stru_24C4E3948;
  }

  -[WFContentProperty negativeName](self, "negativeName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    -[WFContentProperty negativeName](self, "negativeName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR(", negativeName: %@"), v18);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = &stru_24C4E3948;
  }

  v29 = (void *)MEMORY[0x24BDD17C8];
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentProperty name](self, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(-[WFContentProperty propertyClass](self, "propertyClass"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFContentProperty multipleValues](self, "multipleValues"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  if (-[WFContentProperty isFilterable](self, "isFilterable"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  if (-[WFContentProperty isSortable](self, "isSortable"))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  objc_msgSend(v29, "stringWithFormat:", CFSTR("<%@: %p%@%@, name: %@, class: %@, multipleValues: %@, filterable: %@, sortable: %@%@%@%@>"), v28, self, v33, v32, v21, v22, v23, v24, v25, v31, v30, v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (NSString)localizedName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[WFContentProperty displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFContentProperty name](self, "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  WFLocalizedContentPropertyName(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)hasNegative
{
  void *v2;
  char isKindOfClass;

  -[WFContentProperty propertyClass](self, "propertyClass");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)localizedNegativeName
{
  void *v3;
  void *v4;
  void *v5;

  -[WFContentProperty negativeName](self, "negativeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFContentProperty negativeName](self, "negativeName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedContentPropertyName(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)localizedSingularItemName
{
  void *v2;
  void *v3;

  -[WFContentProperty singularItemName](self, "singularItemName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyName(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)hasPossibleValues
{
  return self->_possibleValues != 0;
}

- (WFContentPropertyPossibleValuesGetter)possibleValues
{
  WFContentPropertyPossibleValuesGetter *possibleValues;

  possibleValues = self->_possibleValues;
  if (possibleValues)
    return possibleValues;
  else
    return (WFContentPropertyPossibleValuesGetter *)-[WFContentPropertyPossibleValuesSynchronousGetter initWithSynchronousGetter:]([WFContentPropertyPossibleValuesSynchronousGetter alloc], "initWithSynchronousGetter:", &__block_literal_global_14145);
}

- (void)setPossibleValues:(id)a3
{
  id v4;
  WFContentPropertyPossibleValuesSynchronousGetter *v5;
  id v6;
  WFContentPropertyPossibleValuesGetter *v7;
  WFContentPropertyPossibleValuesGetter *possibleValues;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = [WFContentPropertyPossibleValuesSynchronousGetter alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__WFContentProperty_setPossibleValues___block_invoke;
  v9[3] = &unk_24C4E0480;
  v10 = v4;
  v6 = v4;
  v7 = -[WFContentPropertyPossibleValuesSynchronousGetter initWithSynchronousGetter:](v5, "initWithSynchronousGetter:", v9);
  possibleValues = self->_possibleValues;
  self->_possibleValues = v7;

}

- (BOOL)isLabeledValue
{
  if ((-[objc_class isEqual:](-[WFContentProperty propertyClass](self, "propertyClass"), "isEqual:", objc_opt_class()) & 1) != 0
    || (-[objc_class isEqual:](-[WFContentProperty propertyClass](self, "propertyClass"), "isEqual:", objc_opt_class()) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[objc_class isEqual:](-[WFContentProperty propertyClass](self, "propertyClass"), "isEqual:", objc_opt_class());
  }
}

- (Class)valueItemClass
{
  objc_class *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = -[WFContentProperty propertyClass](self, "propertyClass");
  if (-[objc_class isSubclassOfClass:](v2, "isSubclassOfClass:", objc_opt_class()))
  {
    v3 = v2;
  }
  else
  {
    if (!-[objc_class isSubclassOfClass:](v2, "isSubclassOfClass:", objc_opt_class()))
    {
      +[WFContentItemRegistry sharedRegistry](WFContentItemRegistry, "sharedRegistry");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentItemClassForType:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return (Class)v4;
    }
    objc_opt_class();
    v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  return (Class)v4;
}

- (void)getValueForObject:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    -[WFContentProperty block](self, "block");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WFContentProperty block](self, "block");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[WFContentProperty userInfo](self, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *, void (**)(id, void *)))v8)[2](v8, v13, v9, v6);

    }
    else
    {
      -[WFContentProperty keyPath](self, "keyPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[WFContentProperty keyPath](self, "keyPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "valueForKeyPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v12);

      }
      else
      {
        v6[2](v6, 0);
      }
    }
  }

}

- (void)getValuesForObject:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __58__WFContentProperty_getValuesForObject_completionHandler___block_invoke;
    v8[3] = &unk_24C4E04A8;
    v8[4] = self;
    v9 = v6;
    -[WFContentProperty getValueForObject:completionHandler:](self, "getValueForObject:completionHandler:", a3, v8);

  }
}

- (void)updateWithValue:(id)a3 withTransaction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  -[WFContentProperty setterBlock](self, "setterBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v8;
    if (-[WFContentProperty multipleValues](self, "multipleValues")
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (v12)
      {
        v18[0] = v12;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      v12 = (id)MEMORY[0x24BDBD1A8];
    }
    else if (!-[WFContentProperty multipleValues](self, "multipleValues"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "firstObject");
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v14 = (void *)v13;

        v12 = v14;
      }
    }
    objc_msgSend(v9, "mode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqual:", CFSTR("Remove")))
    {
      v16 = -[WFContentProperty multipleValues](self, "multipleValues");

      if (v16)
      {
LABEL_16:
        -[WFContentProperty setterBlock](self, "setterBlock");
        v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, id))v17)[2](v17, v9, v12);

        v10[2](v10, 1);
        goto LABEL_17;
      }
      v15 = v12;
      v12 = 0;
    }

    goto LABEL_16;
  }
  v10[2](v10, 0);
LABEL_17:

}

- (BOOL)isEquivalentToProperty:(id)a3
{
  WFContentProperty *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  _BOOL4 v8;
  _BOOL4 v9;

  v4 = (WFContentProperty *)a3;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    -[WFContentProperty name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentProperty name](v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6)
      && (v7 = -[WFContentProperty propertyClass](self, "propertyClass"),
          v7 == -[WFContentProperty propertyClass](v4, "propertyClass")))
    {
      v9 = -[WFContentProperty multipleValues](self, "multipleValues");
      v8 = v9 ^ -[WFContentProperty multipleValues](v4, "multipleValues") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  return v8;
}

- (unint64_t)equivalentHash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  unint64_t v8;

  -[WFContentProperty name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = objc_msgSend((id)objc_opt_class(), "hash") ^ v4;
  v6 = -[WFContentProperty multipleValues](self, "multipleValues");
  v7 = 3199029539;
  if (v6)
    v7 = 974800389;
  v8 = v5 ^ v7;

  return v8;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)block
{
  return self->_block;
}

- (id)setterBlock
{
  return self->_setterBlock;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)singularItemName
{
  return self->_singularItemName;
}

- (BOOL)canLowercaseName
{
  return self->_canLowercaseName;
}

- (Class)propertyClass
{
  return self->_propertyClass;
}

- (BOOL)multipleValues
{
  return self->_multipleValues;
}

- (BOOL)isFilterable
{
  return self->_filterable;
}

- (BOOL)isSortable
{
  return self->_sortable;
}

- (BOOL)isGettable
{
  return self->_gettable;
}

- (BOOL)isSettable
{
  return self->_settable;
}

- (BOOL)isAppendable
{
  return self->_appendable;
}

- (BOOL)isRemovable
{
  return self->_removable;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (NSArray)allowedOperators
{
  return self->_allowedOperators;
}

- (WFPropertyListObject)userInfo
{
  return self->_userInfo;
}

- (BOOL)caseInsensitive
{
  return self->_caseInsensitive;
}

- (NSString)negativeName
{
  return self->_negativeName;
}

- (BOOL)isIrrational
{
  return self->_irrational;
}

- (unint64_t)tense
{
  return self->_tense;
}

- (unint64_t)timeUnits
{
  return self->_timeUnits;
}

- (unint64_t)comparableUnits
{
  return self->_comparableUnits;
}

- (NSString)measurementUnitType
{
  return self->_measurementUnitType;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_measurementUnitType, 0);
  objc_storeStrong((id *)&self->_negativeName, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_allowedOperators, 0);
  objc_storeStrong((id *)&self->_propertyClass, 0);
  objc_storeStrong((id *)&self->_singularItemName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_setterBlock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_possibleValues, 0);
}

void __58__WFContentProperty_getValuesForObject_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v3 && !objc_msgSend(*(id *)(a1 + 32), "multipleValues"))
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }

}

id __39__WFContentProperty_setPossibleValues___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "copy");
}

id __35__WFContentProperty_possibleValues__block_invoke()
{
  return (id)objc_opt_new();
}

@end
