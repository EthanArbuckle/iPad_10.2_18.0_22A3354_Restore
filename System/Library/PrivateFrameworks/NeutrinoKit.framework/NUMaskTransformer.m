@implementation NUMaskTransformer

+ (CGImage)createImageIsolatedToMask:(id)a3 source:(id)a4 geometry:(id)a5 composition:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  CGImage *v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v12 = a5;
  objc_msgSend(a3, "imageByApplyingFilter:", CFSTR("CIColorInvert"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageByApplyingFilter:", CFSTR("CIMaskToAlpha"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(a1, "applyRenderedOutputGeometryFromSpace:toInputImage:geometry:composition:error:", CFSTR("/masterSpace"), v14, v12, v11, &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v22;
  if (v15)
  {
    objc_msgSend(a1, "maskedImageBackgroundImage:source:", v15, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBF648], "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "extent");
    v19 = (CGImage *)objc_msgSend(v18, "createCGImage:fromRect:", v17);

  }
  else
  {
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_172);
    v20 = *MEMORY[0x24BE6C480];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C480], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_log_error_impl(&dword_20D1BC000, v20, OS_LOG_TYPE_ERROR, "Error applying rendered geometry: %@", buf, 0xCu);
    }
    v19 = 0;
  }

  return v19;
}

+ (CGImage)createImageIsolatedToMask:(id)a3 mediaView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CGImage *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "_geometry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshotImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (CGImage *)objc_msgSend(a1, "createImageIsolatedToMask:source:geometry:composition:", v7, v9, v8, v10);
  return v11;
}

+ (id)applyRenderedOutputGeometryFromSpace:(id)a3 toInputImage:(id)a4 geometry:(id)a5 composition:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
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
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v82;
  void *v83;
  const void **v84;
  void *specific;
  NSObject *v86;
  _BOOL4 v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[5];
  _QWORD v104[5];
  void *v105;
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  void *v109;
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!a7)
  {
    NUAssertLogger_153();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v107 = v83;
      _os_log_error_impl(&dword_20D1BC000, v82, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v84 = (const void **)MEMORY[0x24BE6C280];
    specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
    NUAssertLogger_153();
    v86 = objc_claimAutoreleasedReturnValue();
    v87 = os_log_type_enabled(v86, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v87)
      {
        v90 = dispatch_get_specific(*v84);
        v91 = (void *)MEMORY[0x24BDD17F0];
        v92 = v90;
        objc_msgSend(v91, "callStackSymbols");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "componentsJoinedByString:", CFSTR("\n"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v107 = v90;
        v108 = 2114;
        v109 = v94;
        _os_log_error_impl(&dword_20D1BC000, v86, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v87)
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "componentsJoinedByString:", CFSTR("\n"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v107 = v89;
      _os_log_error_impl(&dword_20D1BC000, v86, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v15 = v14;
  if (v13)
  {
    objc_msgSend(v13, "transformWithSourceSpace:destinationSpace:error:", v11, CFSTR("/Image"), a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C398]), "initWithComposition:", v15);
      objc_msgSend(MEMORY[0x24BE6C3F8], "stopAtTagFilter:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v105, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPipelineFilters:", v19);

      v20 = objc_alloc(MEMORY[0x24BE6C3D8]);
      objc_msgSend(v12, "extent");
      v22 = v21;
      objc_msgSend(v12, "extent");
      v24 = (void *)objc_msgSend(v20, "initWithTargetPixelCount:", (uint64_t)(v22 * v23));
      objc_msgSend(v17, "setScalePolicy:", v24);

      objc_msgSend(v17, "submitSynchronous:", a7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v100 = v25;
        objc_msgSend(v25, "geometry");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "renderScale");
        NUScaleToDouble();
        v27 = v26;
        objc_msgSend(v12, "extent");
        v95 = 1.0 / v27;
        NUScaleRect();
        v29 = v28;
        v31 = v30;
        objc_msgSend(v16, "transformPoint:", 0.0, v30);
        v33 = v32;
        v35 = v34;
        objc_msgSend(v16, "transformPoint:", v29, v31);
        v37 = v36;
        v39 = v38;
        objc_msgSend(v16, "transformPoint:", 0.0, 0.0);
        v41 = v40;
        v43 = v42;
        objc_msgSend(v16, "transformPoint:", v29, 0.0);
        v44 = v27 * v33;
        v45 = v27 * v35;
        v46 = v27 * v37;
        v47 = v27 * v39;
        v48 = v27 * v41;
        v49 = v27 * v43;
        v50 = (void *)MEMORY[0x24BDBF658];
        v52 = v27 * v51;
        v103[0] = CFSTR("inputTopLeft");
        v99 = v15;
        v54 = v27 * v53;
        objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:", v44, v45);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v104[0] = v55;
        v103[1] = CFSTR("inputTopRight");
        objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:", v46, v47);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v104[1] = v56;
        v103[2] = CFSTR("inputBottomRight");
        objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:", v52, v54);
        v98 = v17;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v104[2] = v57;
        v103[3] = CFSTR("inputBottomLeft");
        objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:", v48, v49);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v103[4] = *MEMORY[0x24BDBF960];
        v104[3] = v58;
        v104[4] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v104, v103, 5);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "filterWithName:withInputParameters:", CFSTR("CIPerspectiveTransform"), v59);
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v96, "outputImage");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "renderScale");
        NUScaleToDouble();
        v62 = v95 * v61;
        objc_msgSend(v97, "scaledExtent");
        v64 = v63;
        objc_msgSend(v97, "scaledExtent");
        v66 = v64 / v65;
        objc_msgSend(v12, "extent");
        v69 = v67 / v68 / v66;
        v70 = objc_msgSend(v97, "scaledSize");
        objc_msgSend(v97, "scaledSize");
        LODWORD(v57) = v70 <= v71;
        v72 = objc_msgSend(v13, "scaledSize");
        objc_msgSend(v13, "scaledSize");
        if (v57 == v72 > v73)
          v69 = 1.0 / v69;
        v101[0] = CFSTR("inputScale");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v62);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v101[1] = CFSTR("inputAspectRatio");
        v102[0] = v74;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v69);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v102[1] = v75;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "imageByApplyingFilter:withInputParameters:", CFSTR("CILanczosScaleTransform"), v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "scaledExtent");
        objc_msgSend(v77, "imageByCroppingToRect:");
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBF658], "colorClampFilter");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setInputImage:", v78);
        objc_msgSend(v79, "outputImage");
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v99;
        v17 = v98;

        v25 = v100;
      }
      else
      {
        v80 = 0;
      }

    }
    else
    {
      v80 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6C380], "invalidError:object:", CFSTR("Nil geometry passed to NUMaskTransformer"), 0);
    v80 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v80;
}

+ (id)maskedImageBackgroundImage:(id)a3 source:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  CGAffineTransform v18;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "extent");
  v8 = v7;
  objc_msgSend(v6, "extent");
  v10 = v8 / v9;
  objc_msgSend(v5, "extent");
  v12 = v11;
  objc_msgSend(v6, "extent");
  CGAffineTransformMakeScale(&v18, v10, v12 / v13);
  objc_msgSend(v6, "imageByApplyingTransform:", &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBF658], "blendWithAlphaMaskFilter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundImage:", v14);
  objc_msgSend(v15, "setMaskImage:", v14);
  objc_msgSend(v15, "setInputImage:", v5);

  objc_msgSend(v15, "outputImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)isMaskValid:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(a3, "extent");
  if (v3 < 0.0 && v4 < 0.0)
    return 0;
  if (v6 > 0.0)
    return 1;
  return v5 > 0.0;
}

+ (id)imageForComposition:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  NSObject *v25;
  _QWORD *v26;
  uint64_t *v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  height = a4.height;
  width = a4.width;
  v39[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3B0]), "initWithComposition:", v6);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = (id)objc_opt_new();
  if ((uint64_t)(width * height) <= 0)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0FC8];
    v39[0] = CFSTR("Size is negative or zero");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("NUMaskTransformerErrorDomain"), 2, v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v31[5], "setError:", v8);
    v13 = (id)v31[5];
    goto LABEL_7;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3D8]), "initWithTargetPixelCount:", (uint64_t)(width * height));
  objc_msgSend(v7, "setScalePolicy:", v8);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  v28[4] = __Block_byref_object_dispose_;
  v29 = 0;
  v9 = dispatch_semaphore_create(0);
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __46__NUMaskTransformer_imageForComposition_size___block_invoke;
  v24 = &unk_24C625660;
  v26 = v28;
  v27 = &v30;
  v10 = v9;
  v25 = v10;
  objc_msgSend(v7, "submit:", &v21);
  v11 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v10, v11);
  objc_msgSend((id)v31[5], "error", v21, v22, v23, v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend((id)v31[5], "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend((id)v31[5], "geometry");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 == 0;

      if (!v18)
        goto LABEL_5;
      v19 = (void *)MEMORY[0x24BDD1540];
      v36 = *MEMORY[0x24BDD0FC8];
      v37 = CFSTR("Timeout reached");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("NUMaskTransformerErrorDomain"), 1, v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)v31[5], "setError:", v12);
    }
  }

LABEL_5:
  v13 = (id)v31[5];

  _Block_object_dispose(v28, 8);
LABEL_7:

  _Block_object_dispose(&v30, 8);
  return v13;
}

+ (void)imageForComposition:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(id, _QWORD);
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  height = a4.height;
  width = a4.width;
  v29[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3B0]), "initWithComposition:", v8);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = (id)objc_opt_new();
  if ((uint64_t)(width * height) <= 0)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0FC8];
    v29[0] = CFSTR("Size is negative or zero");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("NUMaskTransformerErrorDomain"), 2, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v23[5], "setError:", v13);
    v9[2](v9, v23[5]);

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3D8]), "initWithTargetPixelCount:", (uint64_t)(width * height));
  objc_msgSend(v10, "setScalePolicy:", v14);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  v21 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __57__NUMaskTransformer_imageForComposition_size_completion___block_invoke;
  v16[3] = &unk_24C625688;
  v18 = v20;
  v19 = &v22;
  v15 = v9;
  v17 = v15;
  objc_msgSend(v10, "submit:", v16);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

}

void __57__NUMaskTransformer_imageForComposition_size_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = 0;
  objc_msgSend(a2, "result:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v5 = (void *)MEMORY[0x24BDBF660];
  objc_msgSend(v3, "buffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithCVPixelBuffer:", objc_msgSend(v6, "CVPixelBuffer"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(v3, "geometry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setError:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setImage:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setGeometry:", v10);
  (*(void (**)(void))(a1[4] + 16))();

}

void __46__NUMaskTransformer_imageForComposition_size___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = 0;
  objc_msgSend(a2, "result:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v5 = (void *)MEMORY[0x24BDBF660];
  objc_msgSend(v3, "buffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithCVPixelBuffer:", objc_msgSend(v6, "CVPixelBuffer"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(v3, "geometry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setError:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setImage:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setGeometry:", v10);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
