@implementation AXMAddressFormatter

+ (void)replaceDirectionalAbbreviations:(id *)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  int v23;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  int v27;
  id v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  id v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  id v45;
  int v46;
  id v47;
  uint64_t v48;
  const __CFString *v49;
  int v50;
  id v51;
  int v52;
  void *v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const __CFString *v61;
  const __CFString *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  const __CFString *v66;
  const __CFString *v67;
  int v68;

  v4 = objc_msgSend(*a3, "rangeOfString:", CFSTR(" N "));
  v5 = *a3;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = CFSTR(" N ");
LABEL_21:
    v22 = CFSTR(" North ");
    goto LABEL_37;
  }
  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR(" N. "));
  v5 = *a3;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = CFSTR(" N. ");
    goto LABEL_21;
  }
  v7 = objc_msgSend(v5, "rangeOfString:", CFSTR(" S "));
  v5 = *a3;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = CFSTR(" S ");
LABEL_24:
    v22 = CFSTR(" South ");
    goto LABEL_37;
  }
  v8 = objc_msgSend(v5, "rangeOfString:", CFSTR(" S. "));
  v5 = *a3;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = CFSTR(" S. ");
    goto LABEL_24;
  }
  v9 = objc_msgSend(v5, "rangeOfString:", CFSTR(" E "));
  v5 = *a3;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = CFSTR(" E ");
LABEL_27:
    v22 = CFSTR(" East ");
    goto LABEL_37;
  }
  v10 = objc_msgSend(v5, "rangeOfString:", CFSTR(" E. "));
  v5 = *a3;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = CFSTR(" E. ");
    goto LABEL_27;
  }
  v11 = objc_msgSend(v5, "rangeOfString:", CFSTR(" W "));
  v5 = *a3;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = CFSTR(" W ");
LABEL_30:
    v22 = CFSTR(" West ");
    goto LABEL_37;
  }
  v12 = objc_msgSend(v5, "rangeOfString:", CFSTR(" W. "));
  v5 = *a3;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = CFSTR(" W. ");
    goto LABEL_30;
  }
  v13 = objc_msgSend(v5, "rangeOfString:", CFSTR(" NE "));
  v5 = *a3;
  v14 = CFSTR(" NE ");
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_32:
    v22 = CFSTR(" North East ");
    goto LABEL_37;
  }
  v15 = objc_msgSend(v5, "rangeOfString:", CFSTR(" NE "));
  v5 = *a3;
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = CFSTR(" NE. ");
    goto LABEL_32;
  }
  v16 = objc_msgSend(v5, "rangeOfString:", CFSTR(" NW "));
  v5 = *a3;
  v14 = CFSTR(" NW ");
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_34:
    v22 = CFSTR(" North West ");
    goto LABEL_37;
  }
  v17 = objc_msgSend(v5, "rangeOfString:", CFSTR(" NW "));
  v5 = *a3;
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = CFSTR(" NW. ");
    goto LABEL_34;
  }
  v18 = objc_msgSend(v5, "rangeOfString:", CFSTR(" SE "));
  v5 = *a3;
  v14 = CFSTR(" SE ");
  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_36:
    v22 = CFSTR(" South East ");
    goto LABEL_37;
  }
  v19 = objc_msgSend(v5, "rangeOfString:", CFSTR(" SE "));
  v5 = *a3;
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = CFSTR(" SE. ");
    goto LABEL_36;
  }
  v20 = objc_msgSend(v5, "rangeOfString:", CFSTR(" SW "));
  v5 = *a3;
  v14 = CFSTR(" SW ");
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = objc_msgSend(v5, "rangeOfString:", CFSTR(" SW "));
    v5 = *a3;
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_38;
    v14 = CFSTR(" SW. ");
  }
  v22 = CFSTR(" South West ");
LABEL_37:
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", v14, v22);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *a3 = v5;
LABEL_38:
  v23 = objc_msgSend(v5, "hasSuffix:", CFSTR(" N"));
  v24 = *a3;
  if (v23)
  {
    v25 = objc_msgSend(*a3, "length") - 1;
    v26 = CFSTR("North");
LABEL_52:
    v34 = v24;
    v35 = 1;
LABEL_70:
    objc_msgSend(v34, "stringByReplacingCharactersInRange:withString:", v25, v35, v26);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    *a3 = v45;
    goto LABEL_71;
  }
  v27 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" N."));
  v28 = *a3;
  if (v27)
  {
    v25 = objc_msgSend(*a3, "length") - 2;
    v26 = CFSTR("North");
LABEL_69:
    v34 = v28;
    v35 = 2;
    goto LABEL_70;
  }
  v29 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" S"));
  v24 = *a3;
  if (v29)
  {
    v25 = objc_msgSend(*a3, "length") - 1;
    v26 = CFSTR("South");
    goto LABEL_52;
  }
  v30 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" S."));
  v28 = *a3;
  if (v30)
  {
    v25 = objc_msgSend(*a3, "length") - 2;
    v26 = CFSTR("South");
    goto LABEL_69;
  }
  v31 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" E"));
  v24 = *a3;
  if (v31)
  {
    v25 = objc_msgSend(*a3, "length") - 1;
    v26 = CFSTR("East");
    goto LABEL_52;
  }
  v32 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" E."));
  v28 = *a3;
  if (v32)
  {
    v25 = objc_msgSend(*a3, "length") - 2;
    v26 = CFSTR("East");
    goto LABEL_69;
  }
  v33 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" W"));
  v24 = *a3;
  if (v33)
  {
    v25 = objc_msgSend(*a3, "length") - 1;
    v26 = CFSTR("West");
    goto LABEL_52;
  }
  v36 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" W."));
  v28 = *a3;
  if (v36)
  {
    v25 = objc_msgSend(*a3, "length") - 2;
    v26 = CFSTR("West");
    goto LABEL_69;
  }
  v37 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" NE"));
  v28 = *a3;
  if (v37)
  {
    v25 = objc_msgSend(*a3, "length") - 2;
    v26 = CFSTR("North East");
    goto LABEL_69;
  }
  v38 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" NE."));
  v39 = *a3;
  if (v38)
  {
    v25 = objc_msgSend(*a3, "length") - 3;
    v26 = CFSTR("North East");
LABEL_101:
    v34 = v39;
    v35 = 3;
    goto LABEL_70;
  }
  v40 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" NW"));
  v28 = *a3;
  if (v40)
  {
    v25 = objc_msgSend(*a3, "length") - 2;
    v26 = CFSTR("North West");
    goto LABEL_69;
  }
  v41 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" NW."));
  v39 = *a3;
  if (v41)
  {
    v25 = objc_msgSend(*a3, "length") - 3;
    v26 = CFSTR("North West");
    goto LABEL_101;
  }
  v42 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" SE"));
  v28 = *a3;
  if (v42)
  {
    v25 = objc_msgSend(*a3, "length") - 2;
    v26 = CFSTR("South East");
    goto LABEL_69;
  }
  v43 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" SE."));
  v39 = *a3;
  if (v43)
  {
    v25 = objc_msgSend(*a3, "length") - 3;
    v26 = CFSTR("South East");
    goto LABEL_101;
  }
  v44 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" SW"));
  v28 = *a3;
  if (v44)
  {
    v25 = objc_msgSend(*a3, "length") - 2;
    v26 = CFSTR("South West");
    goto LABEL_69;
  }
  v68 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" SW."));
  v39 = *a3;
  if (v68)
  {
    v25 = objc_msgSend(*a3, "length") - 3;
    v26 = CFSTR("South West");
    goto LABEL_101;
  }
  v45 = *a3;
LABEL_71:
  v46 = objc_msgSend(v45, "hasSuffix:", CFSTR(" ST"));
  v47 = *a3;
  if (!v46)
  {
    v50 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" AVE"));
    v51 = *a3;
    if (v50)
    {
      v48 = objc_msgSend(*a3, "length") - 2;
      v49 = CFSTR("Avenue");
    }
    else
    {
      v52 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" RD"));
      v47 = *a3;
      if (v52)
      {
        v48 = objc_msgSend(*a3, "length") - 1;
        v49 = CFSTR("Road");
        goto LABEL_77;
      }
      v55 = objc_msgSend(*a3, "hasSuffix:", CFSTR(" LN"));
      v51 = *a3;
      if (!v55)
        goto LABEL_82;
      v48 = objc_msgSend(*a3, "length") - 2;
      v49 = CFSTR("Lane");
    }
    v53 = v51;
    v54 = 2;
    goto LABEL_81;
  }
  v48 = objc_msgSend(*a3, "length") - 1;
  v49 = CFSTR("Street");
LABEL_77:
  v53 = v47;
  v54 = 1;
LABEL_81:
  objc_msgSend(v53, "stringByReplacingCharactersInRange:withString:", v48, v54, v49);
  v51 = (id)objc_claimAutoreleasedReturnValue();
  *a3 = v51;
LABEL_82:
  v56 = objc_msgSend(v51, "rangeOfString:", CFSTR(" ST "));
  v57 = *a3;
  if (v56 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v58 = objc_msgSend(v57, "rangeOfString:", CFSTR(" AVE "));
    v57 = *a3;
    if (v58 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v59 = objc_msgSend(v57, "rangeOfString:", CFSTR(" RD "));
      v57 = *a3;
      if (v59 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v60 = objc_msgSend(v57, "rangeOfString:", CFSTR(" LN "));
        v57 = *a3;
        if (v60 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_91;
        v61 = CFSTR(" LN ");
        v62 = CFSTR(" Lane ");
      }
      else
      {
        v61 = CFSTR(" RD ");
        v62 = CFSTR(" Road ");
      }
    }
    else
    {
      v61 = CFSTR(" AVE ");
      v62 = CFSTR(" Avenue ");
    }
  }
  else
  {
    v61 = CFSTR(" ST ");
    v62 = CFSTR(" Street ");
  }
  objc_msgSend(v57, "stringByReplacingOccurrencesOfString:withString:", v61, v62);
  v57 = (id)objc_claimAutoreleasedReturnValue();
  *a3 = v57;
LABEL_91:
  v63 = objc_msgSend(v57, "rangeOfString:", CFSTR(" STE "));
  v64 = *a3;
  if (v63 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v65 = objc_msgSend(v64, "rangeOfString:", CFSTR(" APT "));
    v64 = *a3;
    if (v65 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v64, "rangeOfString:", CFSTR(" UNT ")) == 0x7FFFFFFFFFFFFFFFLL)
        return;
      v64 = *a3;
      v66 = CFSTR(" UNT ");
      v67 = CFSTR(" Unit ");
    }
    else
    {
      v66 = CFSTR(" APT ");
      v67 = CFSTR(" Apartment ");
    }
  }
  else
  {
    v66 = CFSTR(" STE ");
    v67 = CFSTR(" Suite ");
  }
  objc_msgSend(v64, "stringByReplacingOccurrencesOfString:withString:", v66, v67);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
}

@end
