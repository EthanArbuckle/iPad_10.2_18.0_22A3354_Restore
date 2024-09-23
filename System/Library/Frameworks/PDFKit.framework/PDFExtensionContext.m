@implementation PDFExtensionContext

+ (void)initialize
{
  _CFPrefsSetDirectModeEnabled();
  _CFPrefsSetReadOnly();
}

- (void)setExtensionViewController:(id)a3
{
  objc_storeWeak((id *)&self->_extensionViewController, a3);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[XPCExtensionInterface extensionInterface](XPCExtensionInterface, "extensionInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[XPCExtensionInterface hostInterface](XPCExtensionInterface, "hostInterface");
}

- (void)hostToExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("function"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__PDFExtensionContext_hostToExtension___block_invoke;
    block[3] = &unk_24C25D110;
    block[4] = self;
    v8 = v6;
    v9 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __39__PDFExtensionContext_hostToExtension___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  float v23;
  double v24;
  __n128 v25;
  __n128 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  float v32;
  double v33;
  void *v34;
  float v35;
  double v36;
  void *v37;
  float v38;
  double v39;
  void *v40;
  float v41;
  double v42;
  __n128 v43;
  __n128 v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  float v52;
  double v53;
  void *v54;
  float v55;
  double v56;
  void *v57;
  float v58;
  double v59;
  void *v60;
  float v61;
  double v62;
  void *v63;
  float v64;
  double v65;
  void *v66;
  float v67;
  double v68;
  void *v69;
  float v70;
  double v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  float v82;
  double v83;
  void *v84;
  float v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  float v90;
  double v91;
  void *v92;
  float v93;
  double v94;
  double v95;
  void *v96;
  uint64_t v97;
  void *v98;
  float v99;
  double v100;
  void *v101;
  float v102;
  double v103;
  void *v104;
  float v105;
  double v106;
  void *v107;
  float v108;
  double v109;
  void *v110;
  float v111;
  void *v112;
  float v113;
  double v114;
  void *v115;
  float v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  id v125;

  objc_msgSend(a1[4], "extensionViewController");
  v125 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("setDocumentData")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("data"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "setDocumentData:", v2);
LABEL_3:

    goto LABEL_52;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("findString")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("string"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "objectForKey:", CFSTR("options"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "findString:withOptions:", v3, objc_msgSend(v4, "unsignedIntegerValue"));

LABEL_6:
    goto LABEL_52;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("cancelFindString")))
  {
    objc_msgSend(v125, "cancelFindString");
    goto LABEL_52;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("cancelFindStringWithHighlightsCleared")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("clearHighlights"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    objc_msgSend(v125, "cancelFindStringWithHighlightsCleared:", v6);
    goto LABEL_52;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("focusOnSearchResultAtIndex")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("searchIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v125, "focusOnSearchResultAtIndex:", v8);
    goto LABEL_52;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("clearSearchHighlights")))
  {
    objc_msgSend(v125, "clearSearchHighlights");
    goto LABEL_52;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("goToPageIndex")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("pageIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    objc_msgSend(v125, "goToPageIndex:", v10);
    goto LABEL_52;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("updatePDFViewLayout")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("boundsInDocument"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "objectForKey:", CFSTR("scrollViewFrame"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "objectForKey:", CFSTR("safeAreaInsets"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count") == 4 && objc_msgSend(v11, "count") == 4 && objc_msgSend(v12, "count") == 4)
    {
      objc_msgSend(v3, "objectAtIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;

      objc_msgSend(v3, "objectAtIndex:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v18 = v17;

      objc_msgSend(v3, "objectAtIndex:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v21 = v20;

      objc_msgSend(v3, "objectAtIndex:", 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "floatValue");
      v24 = v23;

      v25.n128_f64[0] = v15;
      v26.n128_f64[0] = v18;
      v27 = PDFRectMake(v25, v26, v21, v24);
      v123 = v28;
      v124 = v27;
      v121 = v30;
      v122 = v29;
      objc_msgSend(v11, "objectAtIndex:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "floatValue");
      v33 = v32;

      objc_msgSend(v11, "objectAtIndex:", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "floatValue");
      v36 = v35;

      objc_msgSend(v11, "objectAtIndex:", 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "floatValue");
      v39 = v38;

      objc_msgSend(v11, "objectAtIndex:", 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "floatValue");
      v42 = v41;

      v43.n128_f64[0] = v33;
      v44.n128_f64[0] = v36;
      v120 = PDFRectMake(v43, v44, v39, v42);
      v46 = v45;
      v48 = v47;
      v50 = v49;
      objc_msgSend(v12, "objectAtIndex:", 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "floatValue");
      v53 = v52;

      objc_msgSend(v12, "objectAtIndex:", 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "floatValue");
      v56 = v55;

      objc_msgSend(v12, "objectAtIndex:", 2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "floatValue");
      v59 = v58;

      objc_msgSend(v12, "objectAtIndex:", 3);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "floatValue");
      v62 = v61;

      objc_msgSend(a1[6], "objectForKey:", CFSTR("zoomScale"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "floatValue");
      v65 = v64;

      objc_msgSend(v125, "updatePDFViewLayout:scrollViewFrame:safeAreaInsets:zoomScale:", v124, v123, v122, v121, v120, v46, v48, v50, *(_QWORD *)&v53, *(_QWORD *)&v56, *(_QWORD *)&v59, *(_QWORD *)&v62, *(_QWORD *)&v65);
    }

LABEL_23:
    goto LABEL_6;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("setMinimumZoomScale")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("minimumZoomScale"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "floatValue");
    v68 = v67;

    objc_msgSend(v125, "setMinimumZoomScale:", v68);
    goto LABEL_52;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("setMaximumZoomScale")))
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("maximumZoomScale"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "floatValue");
    v71 = v70;

    objc_msgSend(v125, "setMaximumZoomScale:", v71);
    goto LABEL_52;
  }
  if (!objc_msgSend(a1[5], "isEqualToString:", CFSTR("handleGesture")))
  {
    if (!objc_msgSend(a1[5], "isEqualToString:", CFSTR("snapshotViewRect")))
    {
      if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("copy")))
      {
        objc_msgSend(v125, "copy");
        goto LABEL_52;
      }
      if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("selectAll")))
      {
        objc_msgSend(v125, "selectAll");
        goto LABEL_52;
      }
      if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("unlockWithPassword")))
      {
        objc_msgSend(a1[6], "objectForKey:", CFSTR("password"));
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "unlockWithPassword:", v2);
      }
      else
      {
        if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("teardown")))
        {
          objc_msgSend(a1[4], "completeRequestReturningItems:completionHandler:", 0, 0);
          goto LABEL_52;
        }
        if (objc_msgSend(a1[5], "isEqualToString:", CFSTR("pointerRegionForLocation")))
        {
          objc_msgSend(a1[6], "objectForKey:", CFSTR("location"));
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v2, "count") == 2)
          {
            objc_msgSend(v2, "objectAtIndex:", 0);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "floatValue");
            v114 = v113;

            objc_msgSend(v2, "objectAtIndex:", 1);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "floatValue");
            v117 = v116;

            v118 = PDFPointMake(v114, v117);
          }
          else
          {
            v118 = *MEMORY[0x24BDBEFB0];
            v119 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
          }
          objc_msgSend(v125, "pointerRegionForLocation:", v118, v119);
        }
        else
        {
          if (!objc_msgSend(a1[5], "isEqualToString:", CFSTR("setUseIOSurfaceForTiles")))
          {
            NSLog(CFSTR("Unsuported \"hostToExtension:\" function recieved: \"%@\"), a1[5]);
            goto LABEL_52;
          }
          objc_msgSend(a1[6], "objectForKey:", CFSTR("value"));
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          +[PDFView setUseIOSurfaceForTiles:](PDFView, "setUseIOSurfaceForTiles:", objc_msgSend(v2, "BOOLValue"));
        }
      }
      goto LABEL_3;
    }
    objc_msgSend(a1[6], "objectForKey:", CFSTR("rect"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "floatValue");
    v100 = v99;
    objc_msgSend(v3, "objectAtIndex:", 1);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "floatValue");
    v103 = v102;
    objc_msgSend(v3, "objectAtIndex:", 2);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "floatValue");
    v106 = v105;
    objc_msgSend(v3, "objectAtIndex:", 3);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "floatValue");
    v109 = v108;

    objc_msgSend(a1[6], "objectForKey:", CFSTR("width"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "objectForKey:", CFSTR("afterScreenUpdates"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    objc_msgSend(v125, "snapshotViewRect:forWidth:afterScreenUpdates:", objc_msgSend(v110, "BOOLValue"), v100, v103, v106, v109, v111);

    goto LABEL_23;
  }
  objc_msgSend(a1[6], "objectForKey:", CFSTR("gestureType"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "integerValue");

  objc_msgSend(a1[6], "objectForKey:", CFSTR("state"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "integerValue");

  v76 = *MEMORY[0x24BDBEFB0];
  v77 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(a1[6], "objectForKey:", CFSTR("location"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v77;
  v80 = v76;
  if (objc_msgSend(v78, "count") == 2)
  {
    objc_msgSend(v78, "objectAtIndex:", 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "floatValue");
    v83 = v82;

    objc_msgSend(v78, "objectAtIndex:", 1);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "floatValue");
    v86 = v85;

    v80 = PDFPointMake(v83, v86);
    v79 = v87;
  }
  objc_msgSend(a1[6], "objectForKey:", CFSTR("locationOfFirstTouch"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v88, "count") == 2)
  {
    objc_msgSend(v88, "objectAtIndex:", 0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "floatValue");
    v91 = v90;

    objc_msgSend(v88, "objectAtIndex:", 1);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "floatValue");
    v94 = v93;

    v76 = PDFPointMake(v91, v94);
    v77 = v95;
  }
  objc_msgSend(a1[6], "objectForKey:", CFSTR("isIndirectTouch"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "BOOLValue");

  objc_msgSend(v125, "handleGesture:state:location:locationOfFirstTouch:isIndirectTouch:", v73, v75, v97, v80, v79, v76, v77);
LABEL_52:

}

- (PDFExtensionViewController)extensionViewController
{
  return (PDFExtensionViewController *)objc_loadWeakRetained((id *)&self->_extensionViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionViewController);
}

@end
