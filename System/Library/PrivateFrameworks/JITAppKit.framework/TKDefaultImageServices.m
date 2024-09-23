@implementation TKDefaultImageServices

+ (void)setup
{
  id location;
  dispatch_once_t *v3;

  v3 = (dispatch_once_t *)&setup_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_2);
  if (*v3 != -1)
    dispatch_once(v3, location);
  objc_storeStrong(&location, 0);
}

uint64_t __31__TKDefaultImageServices_setup__block_invoke()
{
  +[TKAdaptiveImageAPI registerService:handler:](TKAdaptiveImageAPI, "registerService:handler:", CFSTR("original"), &__block_literal_global_3);
  +[TKAdaptiveImageAPI registerService:handler:](TKAdaptiveImageAPI, "registerService:handler:", CFSTR("scene7"), &__block_literal_global_6_0);
  +[TKAdaptiveImageAPI registerService:handler:](TKAdaptiveImageAPI, "registerService:handler:", CFSTR("akamai"), &__block_literal_global_41);
  return +[TKAdaptiveImageAPI registerService:handler:](TKAdaptiveImageAPI, "registerService:handler:", CFSTR("cloudinary"), &__block_literal_global_72);
}

id __31__TKDefaultImageServices_setup__block_invoke_2(void *a1, void *a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  id v11;
  id v12;
  id location[8];

  location[6] = *(id *)&a4;
  location[7] = *(id *)&a5;
  location[2] = *(id *)&a6;
  location[3] = *(id *)&a7;
  location[4] = *(id *)&a8;
  location[5] = *(id *)&a9;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12 = 0;
  objc_storeStrong(&v12, a3);
  v11 = location[0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v11;
}

id __31__TKDefaultImageServices_setup__block_invoke_3(void *a1, void *a2, void *a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v23;
  uint64_t v24;
  id v25[2];
  double v26;
  id v27;
  id location[2];
  CGRect v29;
  double v30;
  double v31;
  CGRect v32;

  v30 = a4;
  v31 = a5;
  v29.origin.x = a6;
  v29.origin.y = a7;
  v29.size.width = a8;
  v29.size.height = a9;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v27 = 0;
  objc_storeStrong(&v27, a3);
  v26 = a10;
  v25[1] = a1;
  v25[0] = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.width = 1.0;
  v32.size.height = 1.0;
  if (!CGRectEqualToRect(v29, v32))
  {
    v19 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f,%f,%f,%f"), *(_QWORD *)&v29.origin.x, *(_QWORD *)&v29.origin.y, *(_QWORD *)&v29.size.width, *(_QWORD *)&v29.size.height);
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:");

  }
  v24 = (uint64_t)v30;
  if ((uint64_t)v30 > 0)
  {
    v18 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li"), v24);
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:");

  }
  v23 = (uint64_t)v31;
  if ((uint64_t)v31 > 0)
  {
    v17 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li"), v23);
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:");

  }
  if (v24 <= 0 && v23 <= 0)
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("scl"));
  else
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:", CFSTR("constrain,0"), CFSTR("fit"));
  if (v27)
  {
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:", CFSTR("jpeg"), CFSTR("fmt"));
    v16 = +[TKUtils hexForColor:withAlpha:](TKUtils, "hexForColor:withAlpha:", v27, 0);
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:");

  }
  else
  {
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:", CFSTR("png-alpha"), CFSTR("fmt"));
  }
  v11 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li"), (uint64_t)(v26 * 100.0));
  objc_msgSend(v25[0], "setObject:forKeyedSubscript:");

  v12 = location[0];
  v13 = v25[0];
  v14 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("wid"), CFSTR("hei"), CFSTR("scl"), 0);
  v15 = +[TKUtils URL:withQueryParameters:addKeys:removeKeys:escape:](TKUtils, "URL:withQueryParameters:addKeys:removeKeys:escape:", v12, v13, &unk_24E0A4C78);

  objc_storeStrong(v25, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v15;
}

id __31__TKDefaultImageServices_setup__block_invoke_4(void *a1, void *a2, void *a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v24;
  uint64_t v25;
  id v26[2];
  double v27;
  id v28;
  id location[2];
  CGRect v30;
  double v31;
  double v32;
  CGRect v33;

  v31 = a4;
  v32 = a5;
  v30.origin.x = a6;
  v30.origin.y = a7;
  v30.size.width = a8;
  v30.size.height = a9;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v28 = 0;
  objc_storeStrong(&v28, a3);
  v27 = a10;
  v26[1] = a1;
  v26[0] = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.width = 1.0;
  v33.size.height = 1.0;
  if (!CGRectEqualToRect(v30, v33))
  {
    v20 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%fxw:%fxh;%fxw,%fxh"),
                                                   *(_QWORD *)&v30.size.width,
                                                   *(_QWORD *)&v30.size.height,
                                                   *(_QWORD *)&v30.origin.x,
                                                   *(_QWORD *)&v30.origin.y));
    objc_msgSend(v26[0], "setObject:forKeyedSubscript:");

  }
  v25 = (uint64_t)v31;
  v24 = (uint64_t)v32;
  if ((uint64_t)v31 <= 0 && v24 <= 0)
  {
    if (v25 <= 0)
    {
      if (v24 > 0)
      {
        v17 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("*:%li"), v24);
        objc_msgSend(v26[0], "setObject:forKeyedSubscript:");

      }
    }
    else
    {
      v18 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li:*"), v25);
      objc_msgSend(v26[0], "setObject:forKeyedSubscript:");

    }
  }
  else
  {
    v19 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("inside%%7C%li:%li"), v25, v24);
    objc_msgSend(v26[0], "setObject:forKeyedSubscript:");

  }
  if (v28)
  {
    objc_msgSend(v26[0], "setObject:forKeyedSubscript:", CFSTR("jpg"), CFSTR("output-format"));
    v16 = +[TKUtils hexForColor:withAlpha:](TKUtils, "hexForColor:withAlpha:", v28, 0);
    objc_msgSend(v26[0], "setObject:forKeyedSubscript:");

  }
  else
  {
    objc_msgSend(v26[0], "setObject:forKeyedSubscript:", CFSTR("png"), CFSTR("output-format"));
  }
  v11 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li"), (uint64_t)(v27 * 100.0));
  objc_msgSend(v26[0], "setObject:forKeyedSubscript:");

  objc_msgSend(v26[0], "setObject:forKeyedSubscript:", CFSTR("progressive-bicubic"), CFSTR("interpolation"));
  v12 = location[0];
  v13 = v26[0];
  v14 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("fit"), CFSTR("resize"), 0);
  v15 = +[TKUtils URL:withQueryParameters:addKeys:removeKeys:escape:](TKUtils, "URL:withQueryParameters:addKeys:removeKeys:escape:", v12, v13, &unk_24E0A4C90);

  objc_storeStrong(v26, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  return v15;
}

id __31__TKDefaultImageServices_setup__block_invoke_5(void *a1, void *a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28[2];
  double v29;
  id v30;
  id location[6];
  double v32;
  double v33;

  v32 = a4;
  v33 = a5;
  location[2] = *(id *)&a6;
  location[3] = *(id *)&a7;
  location[4] = *(id *)&a8;
  location[5] = *(id *)&a9;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v30 = 0;
  objc_storeStrong(&v30, a3);
  v29 = a10;
  v28[1] = a1;
  v28[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = (uint64_t)v32;
  if ((uint64_t)v32 > 0)
  {
    v21 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("w_%li"), v27);
    objc_msgSend(v28[0], "addObject:");

  }
  v26 = (uint64_t)v33;
  if ((uint64_t)v33 > 0)
  {
    v20 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("h_%li"), v26);
    objc_msgSend(v28[0], "addObject:");

  }
  if (v27 > 0 && v26 > 0)
    objc_msgSend(v28[0], "addObject:", CFSTR("c_limit"));
  if (v30)
  {
    objc_msgSend(v28[0], "addObject:", CFSTR("f_jpg"));
    v17 = (void *)MEMORY[0x24BDD17C8];
    v19 = +[TKUtils hexForColor:withAlpha:](TKUtils, "hexForColor:withAlpha:", v30, 0);
    v18 = (id)objc_msgSend(v17, "stringWithFormat:", CFSTR("b_rgb:%@"), v19);
    objc_msgSend(v28[0], "addObject:");

  }
  else
  {
    objc_msgSend(v28[0], "addObject:", CFSTR("f_png"));
  }
  v11 = v28[0];
  v12 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("q_%li"), (uint64_t)(v29 * 100.0));
  objc_msgSend(v11, "addObject:");

  v25 = (id)objc_msgSend(v28[0], "componentsJoinedByString:", CFSTR(","));
  v15 = (id)objc_msgSend(location[0], "URLByDeletingLastPathComponent");
  v14 = (id)objc_msgSend(v15, "URLByAppendingPathComponent:", v25);
  v13 = (id)objc_msgSend(location[0], "lastPathComponent");
  v16 = (id)objc_msgSend(v14, "URLByAppendingPathComponent:");

  objc_storeStrong(&v25, 0);
  objc_storeStrong(v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v16;
}

@end
